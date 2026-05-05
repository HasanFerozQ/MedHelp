-- US MD/MBBS (4th Year) Clinical Case Blocks
-- Section: Clinical Case Integration (Step 2 CK)
-- Topic: Surgical vs medical decision making
-- Topic Slug: case-surgical-medical
-- Sourced: UWorld, Step-Up to Medicine, MTB Step 2, First Aid Step 2 CK

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'case-surgical-medical' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'case-surgical-medical';
    END IF;

    -- CLEAN SLATE: Clear existing data for this topic to ensure a fresh, 80-case upload
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    ---------------------------------------------------------------------------
    -- CASE 01: The Abscess Dilemma
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Abscess Dilemma', 'A 30-year-old male presents with a painful, red lump on his buttock for 3 days.

Vitals: Normal.
Physical Examination: A 3-cm erythematous, warm, fluctuant nodule. There is no surrounding cellulitis.
Laboratory Results: None.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Initial Management'' for a simple, fluctuant cutaneous abscess?', '["Oral Antibiotics only","Incision and Drainage (I&D) only","Topical Steroids","Needle aspiration"]', 1, 'For a simple abscess, I&D is the definitive treatment and often does not require antibiotics.'),
        (v_case_id, 'In which of the following scenarios should systemic antibiotics be ADDED to I&D?', '["Severe or extensive disease","Systemic signs of infection (fever, tachycardia)","Associated cellulitis","All of the above"]', 3, 'Antibiotics are reserved for complicated cases or those with systemic involvement.'),
        (v_case_id, 'Is a ''culture'' of the pus usually required for a simple abscess in a healthy patient?', '["Yes, always","No, it is usually unnecessary for simple abscesses as the results rarely change management","Only in the elderly","None"]', 1, 'Empiric management after drainage is standard for low-risk patients.');

    ---------------------------------------------------------------------------
    -- CASE 02: The Face ''Pimple'' and the Mohs
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Face ''Pimple'' and the Mohs', 'A 65-year-old male has a biopsy-proven Basal Cell Carcinoma on the tip of his nose.

Vitals: Normal.
Physical Examination: 8-mm pearly papule on the nasal tip.
Laboratory Results: Biopsy shows nodular BCC.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is Mohs Micrographic Surgery preferred over standard Wide Local Excision (WLE) for this patient?', '["It is cheaper","It provides the highest cure rate while maximizing tissue sparing in a cosmetically sensitive area (H-zone)","It doesn''t require anesthesia","None"]', 1, 'Mohs is the gold standard for ''high-risk'' locations like the nose, ears, and eyes.'),
        (v_case_id, 'What is the primary difference in how ''margins'' are checked in Mohs vs. standard excision?', '["In Mohs, 100% of the surgical margin is examined intraoperatively; standard excision uses ''bread-loafing'' which only checks ~1%","There is no difference","Standard excision is more accurate","None"]', 0, 'The horizontal sectioning in Mohs ensures no tumor ''roots'' are missed.'),
        (v_case_id, 'If the tumor were on the back and was < 1cm, what would be an appropriate alternative?', '["Mohs","Standard excision with 4mm margins or Electrodesiccation and Curettage (ED&C)","Chemotherapy","None"]', 1, 'Low-risk sites can be managed with simpler surgical techniques.');

    ---------------------------------------------------------------------------
    -- CASE 03: The Melanoma Depth
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Melanoma Depth', 'A biopsy of a dark mole on the leg shows Malignant Melanoma with a Breslow depth of 0.5 mm. There is no ulceration and no lymphadenopathy.

Vitals: Normal.
Physical Examination: No palpable nodes.
Laboratory Results: Biopsy: 0.5 mm depth, Stage IA.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the required margin for Wide Local Excision (WLE) of a melanoma < 1 mm thick (T1)?', '["0.5 cm","1 cm","2 cm","5 cm"]', 1, 'Standard WLE margin for T1 melanoma is 1 cm.'),
        (v_case_id, 'Is Sentinel Lymph Node Biopsy (SLNB) indicated for this patient (0.5 mm, no ulceration)?', '["Yes","No, it is generally not indicated for depth < 0.8 mm without other high-risk features","Only if the patient is young","None"]', 1, 'SLNB is usually reserved for T1b (ulceration or >0.8mm) or higher.'),
        (v_case_id, 'What is the most important prognostic factor for this patient?', '["Width of the lesion","Breslow thickness","The number of colors","None"]', 1, 'Depth of invasion remains the primary survival predictor.');

    ---------------------------------------------------------------------------
    -- CASE 04: The ''Boils'' that Won''''t Quit
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Boils'' that Won''''t Quit', 'A 28-year-old female with Hurley Stage II Hidradenitis Suppurativa (recurrent abscesses and a few sinus tracts in the axilla) has failed oral antibiotics.

Vitals: Normal.
Physical Examination: Chronic inflammatory nodules and one interconnected sinus tract in the left axilla.
Laboratory Results: None.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'For an acutely painful, fluctuant HS abscess, what is the ''surgical'' procedure of choice for IMMEDIATE relief?', '["Wide radical excision","Incision and Drainage (I&D)","Deroofing of the sinus tract","None"]', 1, 'I&D provides fast symptomatic relief but has a high recurrence rate in HS.'),
        (v_case_id, 'Which surgical technique is preferred for chronic, recurrent HS sinus tracts to minimize recurrence?', '["Simple I&D","Deroofing (unroofing) of the tract or local excision","Liposuction","None"]', 1, 'Deroofing preserves more tissue while removing the epithelialized tract.'),
        (v_case_id, 'When should ''Radical Wide Excision'' be considered?', '["For a single pimple","For severe, diffuse Hurley Stage III disease where medical and limited surgical therapies have failed","Never","Only in children"]', 1, 'Radical excision is a ''last-resort'' surgery for extensive disease.');

    ---------------------------------------------------------------------------
    -- CASE 05: The Leg Ulcer Choice
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Leg Ulcer Choice', 'A 70-year-old male with chronic venous insufficiency presents with a large, shallow ulcer on his medial malleolus.

Vitals: Normal.
Physical Examination: Pitting edema, stasis dermatitis, and a shallow ulcer with irregular borders and ''brawny'' pigmentation.
Laboratory Results: ABI (Ankle-Brachial Index) is 1.0 (Normal).', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Gold Standard'' for the medical management of venous ulcers?', '["Bed rest only","Compression therapy (e.g., bandages, stockings)","Topical antibiotics","Surgical debridement alone"]', 1, 'Compression reverses the underlying venous hypertension.'),
        (v_case_id, 'When should ''Surgical'' intervention (e.g., endovenous ablation of the saphenous vein) be considered?', '["Immediately for all patients","For ulcers that fail to heal with 3-6 months of adequate compression therapy, or to prevent recurrence","Never","Only if the ulcer is infected"]', 1, 'Surgical correction of the underlying reflux is a key ''Step 2'' management point for refractory cases.'),
        (v_case_id, 'What must be ruled out (via ABI) BEFORE applying strong compression?', '["Venous reflux","Peripheral Arterial Disease (PAD)","Diabetes","None"]', 1, 'Compressing a limb with poor arterial supply can lead to necrosis.');

    ---------------------------------------------------------------------------
    -- CASE 06: The Rapid Growth Volcano
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rapid Growth Volcano', 'A 60-year-old male has a 2-cm dome-shaped red nodule on his hand that grew over 4 weeks.

Vitals: Normal.
Physical Examination: A firm nodule with a central ''keratin plug''.
Laboratory Results: None.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the standard surgical approach for a suspected Keratoacanthoma?', '["Observation (it might go away)","Excisional biopsy with margins similar to Squamous Cell Carcinoma (SCC)","Shave biopsy only","None"]', 1, 'Since KAs are difficult to distinguish from invasive SCC, they are treated as SCCs.'),
        (v_case_id, 'Why is ''Watchful Waiting'' generally avoided despite the potential for spontaneous regression?', '["It takes too long","The risk of misdiagnosing an invasive SCC and allowing it to metastasize","Insurance reasons","None"]', 1, 'Clinical and histologic overlap with SCC makes observation dangerous.'),
        (v_case_id, 'What is the ''Most Likely'' diagnosis for this rapid-growth nodule?', '["BCC","Keratoacanthoma (often considered a variant of SCC)","Molluscum","Wart"]', 1, 'The ''volcano'' appearance is classic for KA.');

    ---------------------------------------------------------------------------
    -- CASE 07: The Neck Lump and the ''Pore''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Neck Lump and the ''Pore''', 'A 30-year-old male presents with a firm lump on his neck that sometimes expresses ''cheesy, smelly'' material.

Vitals: Normal.
Physical Examination: A 2-cm subcutaneous nodule with a central ''punctum'' (opening).
Laboratory Results: None.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'If the cyst is acutely inflamed, red, and painful, what is the best initial step?', '["Immediate surgical excision of the whole cyst","Incision and Drainage (I&D) or intralesional steroid injection","Oral antibiotics only","None"]', 1, 'Inflamed cysts are difficult to excise cleanly; calming the inflammation first is preferred.'),
        (v_case_id, 'What is REQUIRED for definitive, permanent removal of the cyst?', '["I&D alone","Complete excision of the cyst wall (capsule)","Oral antibiotics","None"]', 1, 'If the wall remains, the cyst will likely recur.'),
        (v_case_id, 'The ''cheesy'' material inside the cyst is composed of what?', '["Pus (bacteria)","Macerated Keratin","Sebum","None"]', 1, 'Epidermoid cysts are lined with stratified squamous epithelium and fill with keratin.');

    ---------------------------------------------------------------------------
    -- CASE 08: The ''Red Flag'' Leg Pain
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Red Flag'' Leg Pain', 'A patient with a ''skin infection'' on the leg has pain that is ''out of proportion'' to the redness. He is now febrile and tachycardic.

Vitals: T 39.8 C, BP 90/60.
Physical Examination: Dusky erythema, crepitus, and extreme tenderness extending beyond the visible redness.
Laboratory Results: WBC 35,000.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the single most important intervention for this patient?', '["IV Antibiotics","Emergent surgical debridement and exploration","Hyperbaric oxygen","Wait for MRI"]', 1, 'Surgery is the only way to stop the spread of necrotizing fasciitis; antibiotics alone are insufficient.'),
        (v_case_id, 'How does the surgeon determine the extent of debridement?', '["Based on the surface redness","By exploring the fascia until healthy, bleeding tissue is reached (''Finger sweep'' test)","Based on the CT scan only","None"]', 1, 'Intraoperative exploration is the gold standard for assessing depth and spread.'),
        (v_case_id, 'What is a characteristic intraoperative finding?', '["Pus-filled pockets","''Dishwater'' fluid and lack of bleeding/resistance of the fascia","Normal tissue","None"]', 1, 'The ''dishwater'' discharge is a hallmark of tissue liquefaction.');

    ---------------------------------------------------------------------------
    -- CASE 09: The Bleeding Bump
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Bleeding Bump', 'A 20-year-old male has a red bump on his lip that bleeds every time he eats.

Vitals: Normal.
Physical Examination: A 5-mm friable, red papule with a collarette of scale.
Laboratory Results: None.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most effective surgical treatment for a pyogenic granuloma?', '["Observation","Shave excision followed by curettage and electrocautery of the base","Topical antibiotics","Cryotherapy"]', 1, 'Deep cautery of the base is needed to prevent high rates of recurrence.'),
        (v_case_id, 'Why is ''Shave'' preferred over ''Punch'' or ''Excision'' for this specific lesion?', '["It''s faster and provides a specimen for pathology to rule out amelanotic melanoma","It doesn''t require numbing","It''s cheaper","None"]', 0, 'Shave allows for quick removal and essential histologic confirmation.'),
        (v_case_id, 'Is this lesion likely to resolve on its own?', '["Yes, after 1 week","No, they usually persist and continue to bleed until treated","Only in children","None"]', 1, 'The chronic bleeding makes active management necessary.');

    ---------------------------------------------------------------------------
    -- CASE 10: The Ear Earlobe Piercing Keloid
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Ear Earlobe Piercing Keloid', 'A 16-year-old female presents with a large keloid on her earlobe 1 year after a piercing.

Vitals: Normal.
Physical Examination: A 2.5-cm firm, rubbery mass extending from the earlobe.
Laboratory Results: None.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the risk of performing ''Simple Surgical Excision'' for a keloid?', '["None","High rate of recurrence (often returning larger than the original)","It heals perfectly","None"]', 1, 'Keloids are notorious for recurring after trauma (including surgery).'),
        (v_case_id, 'What is the preferred management algorithm for this patient?', '["Surgery only","Intralesional steroid injections (first-line) or Surgery combined with adjuvant therapy (steroids, pressure, or radiation)","Topical antibiotics","None"]', 1, 'Combined therapy is required to minimize the risk of a larger recurrence.'),
        (v_case_id, 'Which specific adjuvant therapy is often used on the earlobe specifically?', '["Radiation","Pressure earrings","Chemotherapy","None"]', 1, 'Compression is a recognized tool to prevent keloid regrowth.');

    ---------------------------------------------------------------------------
    -- CASE 11: The Scalp Tumor and the Mohs
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scalp Tumor and the Mohs', 'An 80-year-old male with a 2-cm Squamous Cell Carcinoma (SCC) on his scalp. The skin is tight.

Vitals: Normal.
Physical Examination: Indurated plaque on the vertex scalp.
Laboratory Results: Biopsy shows SCC.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is Mohs surgery indicated for a 2-cm SCC on the scalp?', '["Large size (>2cm) and high-risk location","It''s the only option","It prevents hair loss","None"]', 0, 'Size > 2cm on the scalp is an NCCN criterion for high-risk SCC, making Mohs appropriate.'),
        (v_case_id, 'If the SCC is found to be invading the bone, what is the next step?', '["Continue Mohs","Refer to Surgical Oncology/ENT for multidisciplinary management (e.g., partial calvariectomy)","Topical 5-FU","None"]', 1, 'Bone invasion exceeds the limits of standard outpatient Mohs.'),
        (v_case_id, 'What is the primary benefit of Mohs in ''tight'' skin areas like the scalp?', '["It makes the skin loose","Maximum tissue conservation to allow for easier closure or grafting","No stitches are needed","None"]', 1, 'Sparing every millimeter is critical when there is little redundant skin for repair.');

    ---------------------------------------------------------------------------
    -- CASE 12: The Infantile Hemangioma
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Infantile Hemangioma', 'A 2-month-old infant has a rapidly growing ''strawberry'' mark on the eyelid that is starting to obstruct vision.

Vitals: Normal.
Physical Examination: A bright red, raised plaque on the upper eyelid.
Laboratory Results: None.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''First-Line'' treatment for a vision-threatening infantile hemangioma?', '["Surgical excision","Oral Propranolol","Laser therapy","Wait for spontaneous regression"]', 1, 'Beta-blockers (Propranolol) are the gold standard for shrinking high-risk hemangiomas.'),
        (v_case_id, 'When should surgery be considered for a hemangioma?', '["Day 1 for all lesions","Residual skin changes (fibrofatty tissue) after the involution phase (usually age 4-10) or if medical therapy fails","Never","Only if it is blue"]', 1, 'Early surgery is rarely needed now that medical therapy is so effective.'),
        (v_case_id, 'What is the natural history of most infantile hemangiomas?', '["They grow forever","Rapid proliferation (first 6-9 months) followed by slow spontaneous involution (years)","They disappear overnight","None"]', 1, 'Most will eventually regress without treatment, but high-risk sites (eyes, airway) require intervention.');

    ---------------------------------------------------------------------------
    -- CASE 13: The Burn and the Graft
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Burn and the Graft', 'A patient with a deep partial-thickness burn on the back of the hand. The wound has not healed after 3 weeks.

Vitals: Normal.
Physical Examination: Pale, non-blanching burn wound on the dorsal hand.
Laboratory Results: None.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the indication for skin grafting in a burn patient?', '["All first-degree burns","Full-thickness burns or deep partial-thickness burns that fail to heal within 2-3 weeks","Only for cosmetic reasons","None"]', 1, 'Failure to re-epithelialize within 3 weeks significantly increases the risk of hypertrophic scarring.'),
        (v_case_id, 'What is the primary benefit of ''Early Excision and Grafting''?', '["Less pain","Reduced infection risk, shorter hospital stay, and better functional outcomes","Cheaper","None"]', 1, 'Removing necrotic tissue (eschar) and providing a permanent cover is the pillar of modern burn care.'),
        (v_case_id, 'What is the ''Donor Site''?', '["The area being grafted","The healthy skin area from which the graft is harvested","The hospital","None"]', 1, 'Donor site management is also a critical part of the surgical plan.');

    ---------------------------------------------------------------------------
    -- CASE 14: The Venous Ulcer and the Ablation
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Venous Ulcer and the Ablation', 'A patient with a chronic venous ulcer that has recurred 3 times despite compression.

Vitals: Normal.
Physical Examination: Varicose veins, stasis changes, and a recurrent ulcer.
Laboratory Results: Duplex ultrasound shows severe reflux in the Great Saphenous Vein (GSV).', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best ''Surgical'' next step to prevent further ulcer recurrence?', '["Skin grafting the ulcer only","Endovenous Thermal Ablation (EVTA) of the refluxing saphenous vein","Amputation","None"]', 1, 'Fixing the ''source'' (the venous reflux) is more important than just treating the ''symptom'' (the ulcer).'),
        (v_case_id, 'How does ablation work?', '["It removes the vein","It uses heat (laser or radiofrequency) to seal the incompetent vein, diverting blood to healthy deep veins","It stretches the vein","None"]', 1, 'Modern minimally invasive techniques have largely replaced traditional vein stripping.'),
        (v_case_id, 'Should compression be continued after surgery?', '["No","Yes, it is often still necessary for long-term management of chronic venous insufficiency","Only for 1 day","None"]', 1, 'Surgery treats the reflux, but the overall venous health remains a priority.');

    ---------------------------------------------------------------------------
    -- CASE 15: The Suspicious Subungual Line
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Suspicious Subungual Line', 'A 50-year-old female has a 4-mm dark, longitudinal brown band on her thumbnail that has widened over the last year.

Vitals: Normal.
Physical Examination: Pigmentation involves the proximal nail fold (Hutchinson sign).
Laboratory Results: None.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Next Step'' for a suspicious pigmented nail band?', '["Observation","Nail matrix biopsy (typically a punch or longitudinal excision)","Wait for the nail to grow out","Antifungal cream"]', 1, 'Biopsy of the nail matrix is required to rule out melanoma.'),
        (v_case_id, 'The Hutchinson sign in this context refers to what?', '["Nerve pain","Pigment extending onto the nail fold, highly suggestive of subungual melanoma","Nail pitting","None"]', 1, 'This is a classic ''Step'' clinical sign.'),
        (v_case_id, 'If the biopsy confirms invasive melanoma, what is the standard surgical treatment?', '["Nail removal only","Amputation (at the IP joint for a digit)","WLE of the skin only","None"]', 1, 'Wide margins often necessitate amputation of the distal phalanx.');

    ---------------------------------------------------------------------------
    -- CASE 16: The Pressure Ulcer (Debridement)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Pressure Ulcer (Debridement)', 'A bedbound patient has a Stage 4 pressure ulcer on the sacrum with thick, black, leathery tissue in the base.

Vitals: Normal.
Physical Examination: A deep ulcer with visible bone and a ''cap'' of black eschar.
Laboratory Results: None.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the first step in managing the ''Eschar'' (black tissue) in a pressure ulcer (assuming it is NOT on the heel)?', '["Keep it dry","Surgical (sharp) debridement of all necrotic tissue","Topical antibiotics","None"]', 1, 'Necrotic tissue must be removed to allow for granulation and to prevent infection.'),
        (v_case_id, 'Why is ''Stable Eschar'' on the heel sometimes left alone (NOT debrided)?', '["It heals faster","The heel has poor blood supply; the intact eschar acts as a natural biological cover as long as there is no infection","Heels don''t get infected","None"]', 1, 'This is a key exception in wound management protocols.'),
        (v_case_id, 'Is ''Wound Vac'' (Negative Pressure Wound Therapy) used before or after debridement?', '["Before","After (only once the wound bed is clean and free of necrotic tissue)","Instead of debridement","None"]', 1, 'The wound must be ''prepped'' surgically before advanced therapies can work.');

    ---------------------------------------------------------------------------
    -- CASE 17: The Lipoma and the Pain
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Lipoma and the Pain', 'A 40-year-old male has several soft, rubbery lumps under the skin of his arms. One is becoming painful when touched.

Vitals: Normal.
Physical Examination: Multiple 2-4 cm soft, mobile subcutaneous nodules. One nodule on the forearm is tender.
Laboratory Results: None.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the management for an asymptomatic, classic lipoma?', '["Surgical excision","Observation and reassurance","Liposuction only","None"]', 1, 'Benign lipomas do not require removal unless symptomatic or for cosmetic reasons.'),
        (v_case_id, 'A PAINFUL lipoma is often histologically classified as what?', '["Malignant Liposarcoma","Angiolipoma","Fibroma","None"]', 1, 'Angiolipomas contain prominent small vessels and are characteristically tender.'),
        (v_case_id, 'When should a subcutaneous ''fatty'' mass prompt an urgent biopsy/excision?', '["If it is soft","If it is >10 cm, deep (subfascial), rapidly growing, or firm/fixed (risk of Liposarcoma)","If there are many of them","None"]', 1, 'Size and depth are key ''Red Flags'' for malignancy.');

    ---------------------------------------------------------------------------
    -- CASE 18: The Seborrheic Keratosis and the Shave
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Seborrheic Keratosis and the Shave', 'An 80-year-old male has an itchy, ''stuck-on'' brown growth on his back.

Vitals: Normal.
Physical Examination: Classic seborrheic keratosis.
Laboratory Results: None.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best initial management for a bothersome but benign SK?', '["Wait for it to fall off","Cryotherapy (freezing) or Shave removal","Chemotherapy","None"]', 1, 'Simple destructive or surgical methods are curative.'),
        (v_case_id, 'Why might you choose ''Shave Removal'' over ''Cryotherapy''?', '["It''s faster","It provides a tissue specimen for pathology to confirm the diagnosis (especially if melanoma is in the differential)","It doesn''t hurt","None"]', 1, 'Confirmation is critical if the lesion has atypical features.'),
        (v_case_id, 'Does an SK need margins?', '["Yes, 5mm","No, it is a benign epidermal proliferation; removal of the visible lesion is sufficient","Only in the elderly","None"]', 1, 'SKs are purely superficial.');

    ---------------------------------------------------------------------------
    -- CASE 19: The ''Pearly'' Bump and the Curettage
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the Curettage', 'A 75-year-old male has a small (4mm) pearly papule on his shoulder. Biopsy shows superficial BCC.

Vitals: Normal.
Physical Examination: Small pearly papule on the back.
Laboratory Results: Superficial BCC.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is ''Electrodesiccation and Curettage'' (ED&C)?', '["A type of laser","A technique of scraping away soft tumor tissue and cauterizing the base","A freezing technique","None"]', 1, 'ED&C is effective for low-risk, superficial tumors in non-critical areas.'),
        (v_case_id, 'Why is ED&C NOT recommended for the face?', '["It doesn''t work there","It leaves a ''cigarette-burn'' scar and has higher recurrence rates on the face compared to Mohs/Excision","It causes nerve damage","None"]', 1, 'The cosmetic outcome is generally poor.'),
        (v_case_id, 'How does the surgeon know they have scraped deep enough during ED&C?', '["Based on time","The ''feel'' of the tissue (tumor is soft/mushy; healthy dermis is firm/gritty)","Based on the patient''s scream","None"]', 1, 'This is a ''blind'' procedure that relies on the tactile feedback of the curette.');

    ---------------------------------------------------------------------------
    -- CASE 20: The Warty Foot and the Surgery
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Warty Foot and the Surgery', 'A patient has a large, painful plantar wart on the heel.

Vitals: Normal.
Physical Examination: A thick, hyperkeratotic plaque with black dots.
Laboratory Results: None.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is ''Deep Surgical Excision'' generally AVOIDED for plantar warts?', '["Warts have roots","High risk of painful, permanent scarring on the weight-bearing sole, which can be more bothersome than the wart","The wart will always return","None"]', 1, 'Preserving the architectural integrity of the sole is the priority.'),
        (v_case_id, 'What is the preferred ''Destructive'' management for plantar warts?', '["Topical Salicylic acid or Cryotherapy","Oral antibiotics","IV steroids","None"]', 0, 'Non-scarring methods are first-line.'),
        (v_case_id, 'What are the ''Black Dots'' seen in a wart?', '["Dirt","Thrombosed capillaries","Mites","None"]', 1, 'Paring down the wart to see these dots helps confirm the diagnosis.');

    ---------------------------------------------------------------------------
    -- CASE 21: The Dog Bite and the Sutures
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Dog Bite and the Sutures', 'A child is brought in with a jagged laceration on the cheek from a dog bite that happened 2 hours ago.

Vitals: Normal.
Physical Examination: A 3-cm clean laceration on the face.
Laboratory Results: None.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Can a ''Face'' bite be primarily sutured (closed immediately)?', '["No, never","Yes, the excellent blood supply of the face allows for primary closure of clean, early bites with good cosmetic results","Only in adults","None"]', 1, 'The face is an exception to the ''don''t close bites'' rule.'),
        (v_case_id, 'How does this differ from a dog bite to the ''Hand''?', '["Hands are cleaner","Hand bites are generally left open (secondary intention) or loosely closed due to the high risk of infection in the small spaces","There is no difference","None"]', 1, 'Hand infections can be devastating for function.'),
        (v_case_id, 'Which antibiotic is first-line for prophylaxis in an animal bite?', '["Cephalexin","Amoxicillin-Clavulanate (Augmentin)","Doxycycline","None"]', 1, 'It covers Pasteurella and anaerobic organisms.');

    ---------------------------------------------------------------------------
    -- CASE 22: The ''Red'' Leg and the Doppler
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Red'' Leg and the Doppler', 'A patient with unilateral leg swelling and redness. Is it cellulitis or DVT?

Vitals: HR 110.
Physical Examination: Warm, red, swollen right calf. Tender along the deep vein.
Laboratory Results: None.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'When a patient presents with unilateral leg redness and swelling, which ''Surgical'' emergency must be ruled out first?', '["Cellulitis","Deep Vein Thrombosis (DVT)","Fungal infection","None"]', 1, 'A missed DVT can lead to a fatal pulmonary embolism.'),
        (v_case_id, 'What is the ''Best Initial Test'' to rule out DVT in this patient?', '["Blood cultures","Venous Duplex Ultrasound","CT scan","ABI"]', 1, 'Ultrasound is the highly sensitive/specific first step.'),
        (v_case_id, 'If the Ultrasound is negative and the patient has a high fever/WBC, what is the most likely diagnosis?', '["DVT","Cellulitis","Stasis dermatitis","None"]', 1, 'Once a clot is ruled out, the focus shifts to infection.');

    ---------------------------------------------------------------------------
    -- CASE 23: The ''Target'' and the ''Wound'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Wound'' (Reasoning)', 'A patient with a non-healing ulcer is having a ''biopsy'' taken.

Vitals: Normal.
Physical Examination: Ulcer.
Laboratory Results: None.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Marjolin Ulcer''?', '["A type of bedsore","A Squamous Cell Carcinoma arising within a chronic wound or burn scar","A fungal ulcer","None"]', 1, 'Any chronic wound that changes or fails to heal must be biopsied to rule out malignancy.'),
        (v_case_id, 'How many years does it typically take for a Marjolin ulcer to develop?', '["1 week","Decades (typically 20-30 years of chronic inflammation)","1 month","None"]', 1, 'It is a late complication of chronic tissue injury.'),
        (v_case_id, 'Is a Marjolin ulcer more aggressive than a sun-induced SCC?', '["No","Yes, they have a much higher rate of metastasis","Only in the elderly","None"]', 1, 'These are high-risk tumors requiring aggressive surgical management.');

    ---------------------------------------------------------------------------
    -- CASE 24: The ''Pearly'' Papule and the ''Cryo''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Papule and the ''Cryo''', 'A 90-year-old frail female with a small BCC on her forehead. The family wants to avoid surgery.

Vitals: Normal.
Physical Examination: 5-mm BCC.
Laboratory Results: None.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a reasonable ''Non-surgical'' destructive option for a small, low-risk BCC in a very elderly patient?', '["Oral antibiotics","Cryosurgery or Radiation therapy","Topical steroids","None"]', 1, 'Minimizing surgical burden is a valid consideration in the frail elderly.'),
        (v_case_id, 'What is the primary disadvantage of ''Cryosurgery'' for BCC?', '["It hurts","Lack of a tissue specimen to confirm margins","It''s too fast","None"]', 1, 'The surgeon is essentially treating ''blindly''.'),
        (v_case_id, 'Is Topical Imiquimod or 5-FU FDA-approved for INVASIVE BCC?', '["Yes","No, they are only approved for SUPERFICIAL BCC","Only for nodular BCC","None"]', 1, 'Topicals do not penetrate deeply enough for nodular or invasive tumors.');

    ---------------------------------------------------------------------------
    -- CASE 25: The ''Itch'' and the ''Punctum'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Punctum'' (Reasoning)', 'A patient with a ''cyst'' on his back. It is not bothering him, but his wife wants it gone.

Vitals: Normal.
Physical Examination: 2-cm epidermoid cyst.
Laboratory Results: None.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'In the absence of symptoms (pain, inflammation, rapid growth), what is the most appropriate management for an epidermoid cyst?', '["Immediate surgery","Observation and reassurance","Oral antibiotics","None"]', 1, 'Elective removal is only for cosmetic preference or recurrent inflammation.'),
        (v_case_id, 'If the cyst ''ruptures'' internally, what does it look like clinically?', '["It disappears","It looks like an abscess (red, painful, hot) but is often a ''sterile'' inflammatory response to the keratin","It causes cancer","None"]', 1, 'This ''pseudo-abscess'' often requires I&D even if not infected.'),
        (v_case_id, 'Can you ''squeeze'' a cyst out through the punctum safely?', '["Yes","No, this often ruptures the wall internally, leading to severe inflammation","Only with a needle","None"]', 1, 'Squeezing is discouraged due to the risk of internal rupture.');

    ---------------------------------------------------------------------------
    -- CASE 26: The ''Target'' and the ''Burn'' (Size)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Burn'' (Size)', 'A 25-year-old male was in a house fire. He has burns on his entire right arm and the anterior trunk (chest and abdomen).

Vitals: Tachycardic, BP 100/60.
Physical Examination: Blistered, painful burns on the right arm and chest.
Laboratory Results: None.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Using the ''Rule of Nines'', what is the estimated Body Surface Area (BSA) of this patient''s burns?', '["18%","27% (Right arm = 9%, Anterior Trunk = 18%)","36%","45%"]', 1, 'Accurate BSA calculation is critical for fluid resuscitation protocols (Parkland formula).'),
        (v_case_id, 'What is the ''Best Initial Management'' for a patient with >20% BSA burns?', '["Topical antibiotics only","Aggressive IV fluid resuscitation and transfer to a specialized Burn Center","Surgical grafting immediately","None"]', 1, 'Large burns are systemic injuries requiring specialized multi-disciplinary care.'),
        (v_case_id, 'Which ''Surgical'' emergency can occur in a circumferential full-thickness burn of a limb or the chest?', '["Infection","Compartment Syndrome (limb) or Respiratory failure (chest) due to the constricting eschar, requiring Escharotomy","Heart attack","None"]', 1, 'Escharotomy is a life-saving ''surgical'' bedside procedure to relieve pressure.');

    ---------------------------------------------------------------------------
    -- CASE 27: The ''Pearly'' Bump and the ''Radiation''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Radiation''', 'An 85-year-old male with a 1-cm BCC on the eyelid. He is on multiple anticoagulants and is not a candidate for surgery.

Vitals: Normal.
Physical Examination: Pearly papule on the lower eyelid margin.
Laboratory Results: None.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'When is Radiation Therapy considered an appropriate ''Primary'' treatment for BCC?', '["For all young patients","For older patients who are non-surgical candidates or those who refuse surgery","Never","Only for tumors on the back"]', 1, 'Radiation is a valid alternative to surgery in the elderly, with good local control rates.'),
        (v_case_id, 'What is a disadvantage of radiation for skin cancer in a YOUNG patient?', '["It''s too fast","Risk of long-term cosmetic deterioration (atrophy, telangiectasias) and potential for secondary radiation-induced malignancies later in life","It doesn''t work","None"]', 1, 'Surgery is generally preferred in younger patients to avoid these late effects.'),
        (v_case_id, 'How does radiation affect future surgical options in the same area?', '["It makes them easier","It makes future surgery more difficult due to poor wound healing in irradiated tissue","No effect","None"]', 1, 'Prior radiation is a ''high-risk'' feature for any subsequent surgical repair.');

    ---------------------------------------------------------------------------
    -- CASE 28: The ''Target'' and the ''SLNB'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''SLNB'' (Reasoning)', 'A 40-year-old with a 2.5 mm thick melanoma on the back. No nodes are palpable on exam.

Vitals: Normal.
Physical Examination: No clinical lymphadenopathy.
Laboratory Results: None.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary purpose of a Sentinel Lymph Node Biopsy in melanoma?', '["To cure the patient","To provide accurate staging information by checking the ''first'' draining node for microscopic metastasis","To remove all the lymph nodes","None"]', 1, 'SLNB is a staging procedure, not a therapeutic one.'),
        (v_case_id, 'Based on the depth (2.5 mm), is SLNB indicated?', '["Yes, for all melanomas > 1 mm (and some T1b lesions)","No, it is too deep","Only if it is red","None"]', 0, 'Intermediate thickness (1-4 mm) melanomas are the ''sweet spot'' for SLNB indications.'),
        (v_case_id, 'What is the ''Best Next Step'' if the SLNB is POSITIVE (shows microscopic tumor cells)?', '["Immediate amputation","Systemic adjuvant therapy (e.g., immunotherapy or targeted therapy) and close nodal basin monitoring","Radiation only","None"]', 1, 'Modern management has shifted from completion lymph node dissection (CLND) to systemic therapy for positive nodes.');

    ---------------------------------------------------------------------------
    -- CASE 29: The ''Psoriasis'' and the ''Surgical'' Flare
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Surgical'' Flare', 'A patient with psoriasis is undergoing an elective hip replacement. He is worried about his skin reacting to the surgery.

Vitals: Normal.
Physical Examination: Stable plaques.
Laboratory Results: None.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the term for the development of psoriasis at the site of surgical incisions?', '["Infection","Koebner Phenomenon (Isomorphic response)","Allergy to sutures","None"]', 1, 'Trauma to the skin can trigger new psoriatic lesions.'),
        (v_case_id, 'Should this patient''s psoriasis be aggressively controlled BEFORE surgery?', '["No","Yes, to minimize the inflammatory state and reduce the risk of Koebnerization or post-operative infection","Only if it is itchy","None"]', 1, 'Pre-operative optimization is beneficial.'),
        (v_case_id, 'If he developed ''pustules'' after surgery, what would be the concern?', '["Normal healing","Triggering of generalized pustular psoriasis due to surgical stress or medication changes","Allergy to soap","None"]', 1, 'Acute flares must be monitored in the post-operative period.');

    ---------------------------------------------------------------------------
    -- CASE 30: The ''Itch'' and the ''Stitch'' (Allergy)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Stitch'' (Allergy)', 'A patient develops a red, itchy rash exactly where the surgical ''tape'' was applied after an excision.

Vitals: Normal.
Physical Examination: Erythematous, vesicular plaque in a rectangular shape corresponding to the adhesive tape.
Laboratory Results: None.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most likely diagnosis?', '["Wound infection","Allergic Contact Dermatitis to the adhesive or rubber component of the tape","BCC recurrence","None"]', 1, 'The sharp, geometric shape matching the tape is pathognomonic.'),
        (v_case_id, 'How can you distinguish this from a ''surgical site infection'' (SSI)?', '["SSI has a fever and pus; dermatitis has intense itching and a geometric pattern","They are the same","Dermatitis is more painful","None"]', 0, 'Itch vs. Pain and Pattern vs. Diffuse spreading are key differentiators.'),
        (v_case_id, 'What is the management?', '["IV Antibiotics","Discontinue the specific tape and use a low-potency topical steroid if needed","Give more tape","None"]', 1, 'Avoidance of the allergen is the priority.');

    ---------------------------------------------------------------------------
    -- CASE 31: The ''Bite'' and the ''Delayed'' Closure
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Bite'' and the ''Delayed'' Closure', 'A patient presents with a 12-hour-old human bite wound on the forearm.

Vitals: Normal.
Physical Examination: A deep jagged wound with visible bruising.
Laboratory Results: None.', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is primary (immediate) closure of a human bite on the arm generally AVOIDED?', '["It hurts","Extremely high risk of polymicrobial infection due to human oral flora (including Eikenella)","It leaves a bad scar","None"]', 1, 'Closing ''dirty'' wounds traps bacteria and leads to abscess/cellulitis.'),
        (v_case_id, 'What is the ''Best'' management strategy for this wound?', '["Immediate sutures","Irrigation, debridement, antibiotics, and ''Healing by Secondary Intention'' or ''Delayed Primary Closure''","Topical steroids","None"]', 1, 'Letting the wound ''breathe'' and drain while treating the infection is safer.'),
        (v_case_id, 'What is the prophylactic antibiotic of choice?', '["Penicillin only","Amoxicillin-Clavulanate (Augmentin) to cover Eikenella and anaerobes","Ciprofloxacin","None"]', 1, 'Augmentin is the gold standard for bites.');

    ---------------------------------------------------------------------------
    -- CASE 32: The ''Pearly'' Bump and the ''Shave'' (Trap)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Shave'' (Trap)', 'A surgeon performs a ''deep shave'' biopsy of a suspicious mole. The pathology returns ''Malignant Melanoma, at least 0.4 mm, transected at the base''.

Vitals: Normal.
Physical Examination: Shave site on the trunk.
Laboratory Results: Transected melanoma.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why was the ''Shave'' biopsy a suboptimal choice in this case?', '["It''s too fast","It transected the base, making it impossible to determine the true Breslow depth (and thus the stage/prognosis)","It causes too much bleeding","None"]', 1, 'Depth is the most critical staging variable; shave biopsies often cut through the tumor.'),
        (v_case_id, 'What is the ''Best'' next step now that the base is transected?', '["Wait and see","Perform a wider/deeper re-excision (residual depth may still be uncertain) and manage based on the visible features","Give chemotherapy","None"]', 1, 'A ''re-excision'' is mandatory, but the initial staging data is permanently compromised.'),
        (v_case_id, 'What would have been the ''Ideal'' initial biopsy technique?', '["Shave","Excisional biopsy (full-thickness) with narrow (1-3 mm) margins","Needle aspiration","None"]', 1, 'Full-thickness specimens are required for melanoma.');

    ---------------------------------------------------------------------------
    -- CASE 33: The ''Target'' and the ''Graft'' (Success)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Graft'' (Success)', 'A patient has a large skin graft on his leg. Three days later, the graft looks ''purple and boggy''.

Vitals: Normal.
Physical Examination: Fluid collection under the graft.
Laboratory Results: None.', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common cause of skin graft ''failure'' in the first 48-72 hours?', '["Infection","Hematoma or Seroma (fluid collection) preventing the graft from adhering to the bed","The patient''s diet","None"]', 1, 'Fluid acts as a physical barrier to revascularization (plasmatic imbibition).'),
        (v_case_id, 'What is the term for the initial stage of graft survival where it ''drinks'' nutrients from the bed?', '["Inosculation","Plasmatic imbibition","Neovascularization","None"]', 1, 'This occurs in the first 24-48 hours.'),
        (v_case_id, 'How do surgeons often prevent fluid collection under a graft?', '["By using lots of tape","Applying a ''bolster'' (Tie-over) dressing or ''pie-crusting'' (making small slits in the graft)","Giving aspirin","None"]', 1, 'Pressure and drainage are essential for graft ''take''.');

    ---------------------------------------------------------------------------
    -- CASE 34: The ''Pearly'' Bump and the ''Lidocaine'' (Toxicity)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Lidocaine'' (Toxicity)', 'During a long Mohs procedure, a patient is given multiple injections of Lidocaine with Epinephrine. She begins to feel ''anxious'' and complains of a ''metallic taste'' and ''numbness around her mouth''.

Vitals: BP 150/90, HR 110.
Physical Examination: Circumoral paresthesias and tremors.
Laboratory Results: None.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic early symptom of lidocaine toxicity?', '["Heart attack","CNS symptoms: metallic taste, tinnitus, circumoral numbness, and lightheadedness","Itch","None"]', 1, 'CNS signs usually precede cardiac toxicity.'),
        (v_case_id, 'What is the maximum recommended dose of Lidocaine WITH Epinephrine for local infiltration?', '["4.5 mg/kg","7 mg/kg","10 mg/kg","None"]', 1, 'Epinephrine allows for a higher dose by slowing absorption; the limit without Epi is 4.5 mg/kg.'),
        (v_case_id, 'What is the ''Antidote'' for severe, life-threatening LAST (seizures/arrhythmia)?', '["Oxygen","Intravenous Lipid Emulsion (20% Intralipid)","Epinephrine","None"]', 1, 'Lipid emulsion acts as a ''sink'' to pull the local anesthetic out of the heart/brain.');

    ---------------------------------------------------------------------------
    -- CASE 35: The ''Bite'' and the ''Rabies'' (Decision)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Bite'' and the ''Rabies'' (Decision)', 'A patient was bitten by a ''stray dog'' that ran away. The wound is on the hand.

Vitals: Normal.
Physical Examination: Small puncture wounds.
Laboratory Results: None.', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the management if the biting animal is a healthy domestic dog that can be observed for 10 days?', '["Start PEP immediately","Observe the animal; start PEP only if the animal develops signs of rabies","Give antibiotics only","None"]', 1, 'Healthy domestic animals can be monitored safely.'),
        (v_case_id, 'What if the animal is a ''stray'' that cannot be found or a ''high-risk'' wild animal (e.g., bat, raccoon, skunk)?', '["Wait for symptoms","Immediate Post-Exposure Prophylaxis (PEP) with Rabies Vaccine and RIG","Give Tetanus only","None"]', 1, 'Rabies is 100% fatal once symptoms appear; empiric PEP is mandatory for high-risk exposures.'),
        (v_case_id, 'Where should the Rabies Immune Globulin (RIG) be administered?', '["Intramuscularly in the gluteus","Infiltrated directly into and around the wound site (if possible)","Only in the arm","None"]', 1, 'RIG provides immediate local neutralizing antibodies.');

    ---------------------------------------------------------------------------
    -- CASE 36: The ''Psoriasis'' and the ''Wound'' (Infection)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Wound'' (Infection)', 'A psoriasis patient has an elective excision. Three days later, the wound is red and there is ''pustular'' drainage.

Vitals: T 38.2 C.
Physical Examination: Erythema, warmth, and purulent discharge from the incision.
Laboratory Results: None.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most likely causative organism for a surgical site infection occurring < 1 week post-op?', '["Pseudomonas","Staphylococcus aureus or Streptococcus pyogenes","Fungus","None"]', 1, 'Skin flora are the primary pathogens.'),
        (v_case_id, 'What is the ''Surgical'' management for a purulent wound infection?', '["More antibiotics only","Opening the wound, drainage of the pus, and potentially packing (healing by secondary intention)","Tighten the stitches","None"]', 1, 'Source control (drainage) is fundamental to managing an infected space.'),
        (v_case_id, 'How does the ''Psoriasis'' history complicate the diagnosis?', '["It doesn''t","Koebnerization or localized pustular flare can mimic infection, but fever and purulence strongly favor infection","It makes it heal faster","None"]', 1, 'The surgeon must distinguish between a ''sterile'' flare and a true infection.');

    ---------------------------------------------------------------------------
    -- CASE 37: The ''Target'' and the ''Flap'' (Decision)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Flap'' (Decision)', 'A surgeon is repairing a defect on the nose. A ''Primary Closure'' would cause the nostril to pull upward.

Vitals: Normal.
Physical Examination: 1-cm defect on the nasal alar rim.
Laboratory Results: None.', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Reconstructive Ladder''?', '["A list of tools","A hierarchy of closure techniques from simplest (secondary intention) to most complex (free flap)","A type of surgery","None"]', 1, 'Surgeons should use the simplest technique that provides an optimal outcome.'),
        (v_case_id, 'If primary closure causes ''distal distortion'' (e.g., pulling the eyelid or nostril), what is the next step up the ladder?', '["Skin graft","Local Skin Flap (which recruits adjacent tissue without tension)","Leave it open","None"]', 1, 'Flaps are preferred on the face for better color and texture match compared to grafts.'),
        (v_case_id, 'What is the primary difference between a ''Flap'' and a ''Graft''?', '["Flaps are smaller","A flap maintains its own blood supply (pedicle); a graft is completely severed from its blood supply and must ''take'' from the bed","Grafts are more complex","None"]', 1, 'This is a fundamental principle of plastic and reconstructive surgery.');

    ---------------------------------------------------------------------------
    -- CASE 38: The ''Itch'' and the ''Latex'' (Surgical)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Latex'' (Surgical)', 'During a procedure, a patient suddenly develops hives, wheezing, and hypotension.

Vitals: BP 80/40, HR 130.
Physical Examination: Generalized urticaria, angioedema, and stridor.
Laboratory Results: None.', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Initial Treatment'' for intraoperative anaphylaxis?', '["IV Antihistamines","Intramuscular or IV Epinephrine, aggressive fluids, and removing the trigger","Steroids","Oxygen only"]', 1, 'Epinephrine is the life-saving treatment of choice.'),
        (v_case_id, 'Which common surgical item is a frequent cause of intraoperative Type I hypersensitivity?', '["Scalpels","Latex gloves/catheters","Sutures","None"]', 1, 'Latex allergy is a major safety concern in the OR.'),
        (v_case_id, 'Which ''Fruit'' allergies are associated with a higher risk of Latex allergy?', '["Apples and oranges","Avocado, Banana, Kiwi, and Chestnut (Latex-fruit syndrome)","Grapes","None"]', 1, 'Cross-reactivity between plant proteins and latex is a common ''Step'' association.');

    ---------------------------------------------------------------------------
    -- CASE 39: The ''Pearly'' Bump and the ''Cautery'' (Danger)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Cautery'' (Danger)', 'A surgeon is using electrocautery near a patient''''s pacemaker.

Vitals: Normal.
Physical Examination: BCC on the upper chest.
Laboratory Results: None.', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary risk of using MONOPOLAR electrocautery in a patient with a pacemaker or ICD?', '["None","Electromagnetic interference (EMI) that can cause the device to malfunction, inhibit pacing, or trigger a shock","It drains the battery","None"]', 1, 'The current path in monopolar cautery travels through the body.'),
        (v_case_id, 'What is a ''Safer'' electrosurgical alternative for these patients?', '["Lasers","Bipolar electrocautery (where the current only stays between the two tips of the forceps)","None","Burning a candle"]', 1, 'Bipolar cautery minimizes the risk of EMI.'),
        (v_case_id, 'Where should the ''Grounding Pad'' be placed in monopolar surgery to minimize risk?', '["Near the pacemaker","As far as possible from the device, with the operative site located between the pad and the device","It doesn''t matter","None"]', 1, 'Proper pad placement directs the current away from the electronics.');

    ---------------------------------------------------------------------------
    -- CASE 40: The ''Target'' and the ''Adhesive'' (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Adhesive'' (Reasoning)', 'A patient with a ''wound'' is using a transparent film dressing (e.g., Tegaderm).

Vitals: Normal.
Physical Examination: Clean surgical wound.
Laboratory Results: None.', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which type of dressing is best for a ''heavily exudative'' (weeping) wound?', '["Transparent film","Alginates or Foams (which have high absorbent capacity)","Dry gauze only","None"]', 1, 'Matching the dressing to the amount of drainage is key to preventing maceration.'),
        (v_case_id, 'What is the primary function of a ''Hydrocolloid'' dressing?', '["To dry the wound","To maintain a moist environment and provide autolytic debridement","To kill bacteria","None"]', 1, 'Hydrocolloids are excellent for superficial wounds with minimal drainage.'),
        (v_case_id, 'Which dressing should be avoided on ''Infected'' wounds because it creates an occlusive environment?', '["Transparent films and Hydrocolloids","Gauze","Antibiotic ointment","None"]', 0, 'Occlusion can promote bacterial overgrowth in an already infected wound.');

    ---------------------------------------------------------------------------
    -- CASE 41: The ''Bite'' and the ''Tetanus'' (Status)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Bite'' and the ''Tetanus'' (Status)', 'A 40-year-old male has a dirty laceration. His last tetanus shot was 12 years ago.

Vitals: Normal.
Physical Examination: 2-cm dirty wound.
Laboratory Results: None.', 41)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'For a ''dirty'' or ''contaminated'' wound, what is the threshold for a tetanus booster if the primary series was completed?', '["Every year","Every 5 years","Every 10 years","None"]', 1, 'For clean wounds, it''s 10 years; for dirty wounds, it''s 5 years.'),
        (v_case_id, 'In which scenario would Tetanus Immune Globulin (TIG) be required?', '["For all dirty wounds","For a dirty wound in a patient with an uncertain or incomplete primary series ( < 3 doses)","Only if they have a fever","None"]', 1, 'Passive immunization is only for those without a foundational primary series.'),
        (v_case_id, 'Is the Tetanus vaccine (Tdap/Td) given in the same syringe as RIG?', '["Yes","No, they should be given in separate syringes and at separate anatomical sites","Only in children","None"]', 1, 'Standard protocol for all vaccine/IG combinations.');

    ---------------------------------------------------------------------------
    -- CASE 42: The ''Pearly'' Bump and the ''Lidocaine'' (Epi)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Lidocaine'' (Epi)', 'A surgeon is injecting lidocaine with epinephrine into a patient''''s ''finger'' to remove a growth.

Vitals: Normal.
Physical Examination: Growth on the distal phalanx.
Laboratory Results: None.', 42)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What was the traditional ''Surgical Teaching'' regarding epinephrine in fingers, toes, and the nose?', '["Always use it","Avoid it due to the risk of distal necrosis/ischemia","It makes the heart stop","None"]', 1, 'Historically, students were taught ''no epi'' in end organs.'),
        (v_case_id, 'Is there strong evidence for necrosis when using modern, low-concentration (1:100k) epinephrine in these areas?', '["Yes","No, recent evidence and large studies show it is safe and highly effective at reducing bleeding and prolonging anesthesia","Only in smokers","None"]', 1, 'Many dermatologists and hand surgeons now use epinephrine in digits safely.'),
        (v_case_id, 'Which medication can be used as an ''Antidote'' to reverse local epinephrine-induced vasoconstriction if ischemia is suspected?', '["Lidocaine","Phentolamine (an alpha-blocker)","Aspirin","None"]', 1, 'Phentolamine rescue is the standard reversal agent.');

    ---------------------------------------------------------------------------
    -- CASE 43: The ''Psoriasis'' and the ''Steroid'' (Joint)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Psoriasis'' and the ''Steroid'' (Joint)', 'A patient with psoriasis has a very painful, swollen knee. The surgeon is considering an intra-articular steroid injection.

Vitals: Normal.
Physical Examination: Swollen, warm knee.
Laboratory Results: Joint aspiration shows 50,000 WBCs (mostly neutrophils).', 43)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Most Important'' step before injecting a steroid into a swollen joint?', '["Give oral antibiotics","Perform joint aspiration and gram stain/culture to rule out septic arthritis","Apply ice","None"]', 1, 'Injecting a steroid into an infected joint can be catastrophic.'),
        (v_case_id, 'If the joint shows ''crystals'' but the culture is negative, what is the diagnosis?', '["Septic arthritis","Gout (monosodium urate) or Pseudogout (CPPD)","Psoriatic arthritis","None"]', 1, 'Crystals point to a metabolic inflammatory arthritis.'),
        (v_case_id, 'Psoriatic arthritis can also involve which ''axial'' skeleton location?', '["Cervical spine","Sacroiliac (SI) joints (Sacroiliitis)","Skull","None"]', 1, 'PsA is part of the seronegative spondyloarthropathy family.');

    ---------------------------------------------------------------------------
    -- CASE 44: The ''Itch'' and the ''Biopsy'' (Infection)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Biopsy'' (Infection)', 'A patient with a suspected deep fungal infection (e.g., Sporotrichosis) needs a tissue diagnosis.

Vitals: Normal.
Physical Examination: Linear nodules on the arm.
Laboratory Results: None.', 44)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'When biopsying for a suspected deep infection, what should be done with the tissue specimen?', '["Put it all in Formalin","Split the specimen: one part in Formalin (for Histology) and one part in Sterile Saline (for Tissue Culture)","Discard it","None"]', 1, 'Formalin kills organisms; culture requires fresh, sterile tissue.'),
        (v_case_id, 'Why is ''Tissue Culture'' superior to a standard ''Surface Swab'' for deep infections?', '["It''s cheaper","Surface swabs often show colonizing bacteria; tissue culture identifies the actual invading pathogen","It takes less time","None"]', 1, 'Deep tissue is the ''gold standard'' for mycobacterial and fungal infections.'),
        (v_case_id, 'What is the term for the inflammatory pattern seen on pathology in these cases?', '["Granulomatous inflammation","Acne","Hives","None"]', 0, 'Granulomas are a common response to chronic infection or foreign bodies.');

    ---------------------------------------------------------------------------
    -- CASE 45: The ''Bite'' and the ''Cat'' (Danger)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Bite'' and the ''Cat'' (Danger)', 'A 10-year-old girl is bitten on the hand by her pet cat.

Vitals: Normal.
Physical Examination: Small, deep ''puncture'' wounds on the dorsum of the hand.
Laboratory Results: None.', 45)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why are ''Cat'' bites considered higher risk for deep infection than ''Dog'' bites?', '["Cats are dirtier","Long, thin fangs create deep puncture wounds that ''inject'' bacteria into joints, tendons, and bone","Cats have more rabies","None"]', 1, 'The ''puncture'' mechanism is more likely to cause tenosynovitis or septic arthritis.'),
        (v_case_id, 'Which specific organism is the ''classic'' culprit in cat bite infections?', '["Staphylococcus","Pasteurella multocida","E. coli","None"]', 1, 'Pasteurella is a fast-growing Gram-negative rod found in feline oral flora.'),
        (v_case_id, 'What is the management for a cat bite on the hand that shows early signs of infection?', '["Oral antibiotics and outpatient follow-up","Hospitalization, IV antibiotics, and potentially surgical exploration/irrigation","Ice only","None"]', 1, 'Hand infections in children can lead to rapid functional loss.');

    ---------------------------------------------------------------------------
    -- CASE 46: The ''Pearly'' Bump and the ''Flap'' (Necrosis)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Flap'' (Necrosis)', 'A patient has a transposition flap on the nose. Three days later, the ''tip'' of the flap looks black.

Vitals: Normal.
Physical Examination: Distal necrosis of the skin flap.
Laboratory Results: None.', 46)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most likely cause of distal flap necrosis?', '["Infection","Excessive tension or inadequate venous/arterial supply to the tip","The patient''s age","None"]', 1, 'Flaps have limited blood supply; tension further compromises perfusion.'),
        (v_case_id, 'Should the ''black'' tissue be surgically debrided immediately?', '["Yes","No, it is often best to allow the ''biological dressing'' (eschar) to declare itself while the underlying tissue heals","Only if it smells","None"]', 1, 'Early debridement can damage potentially viable tissue underneath.'),
        (v_case_id, 'What is the primary factor that determines the maximum length of a skin flap?', '["The surgeon''s skill","The width of the flap base (the pedicle) and the blood supply","The patient''s height","None"]', 1, 'The ''Length-to-Width'' ratio is a fundamental rule in flap design.');

    ---------------------------------------------------------------------------
    -- CASE 47: The ''Itch'' and the ''Silicone''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Silicone''', 'A patient is using silicone sheets to treat a hypertrophic scar.

Vitals: Normal.
Physical Examination: A thick, red, raised scar on the chest.
Laboratory Results: None.', 47)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does silicone sheeting help improve the appearance of scars?', '["It bleaches them","By increasing hydration and slightly increasing the temperature of the scar, which modifies collagen remodeling","It kills the scar","None"]', 1, 'Hydration is the primary mechanism.'),
        (v_case_id, 'How many hours a day should the sheets be worn?', '["1 hour","At least 12-24 hours a day for several months","Only at night","None"]', 1, 'Consistency and long duration are required for efficacy.'),
        (v_case_id, 'Is it more effective for ''Old'' or ''New'' scars?', '["Newer scars (usually starting after the wound has fully closed)","Old scars from 20 years ago","Both are equal","None"]', 0, 'Active, remodeling scars respond best.');

    ---------------------------------------------------------------------------
    -- CASE 48: The ''Pearly'' Bump and the ''Complication'' (Hematoma)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Complication'' (Hematoma)', 'Four hours after an excision on the scalp, the patient calls because the dressing is ''soaked with blood'' and the area is ''tight and painful''.

Vitals: Normal.
Physical Examination: A firm, tense, and bulging mass under the incision line.
Laboratory Results: None.', 48)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the immediate management for an expanding, tense hematoma?', '["Apply ice and wait","Open the incision, evacuate the blood, identify and cauterize any bleeding vessels, and re-suture","Give antibiotics","None"]', 1, 'Relieving pressure and stopping the bleed is the priority.'),
        (v_case_id, 'What is the ''Surgical'' risk of an untreated hematoma?', '["None","Pressure necrosis of the skin edges, wound dehiscence, and increased risk of infection","It turns into a cyst","None"]', 1, 'The blood acts as a culture medium and a physical barrier to healing.'),
        (v_case_id, 'Which medication should the patient be asked about as a potential risk factor?', '["Aspirin, Anticoagulants, or certain herbal supplements (Ginkgo, Fish oil)","Acetaminophen","Vitamins","None"]', 0, 'Anti-platelet and anticoagulant agents increase surgical bleeding risk.');

    ---------------------------------------------------------------------------
    -- CASE 49: The ''Target'' and the ''Mesh'' (Grafting)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Mesh'' (Grafting)', 'A surgeon ''meshes'' a skin graft before applying it to a large leg wound.

Vitals: Normal.
Physical Examination: A graft with multiple small slits.
Laboratory Results: None.', 49)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary purpose of ''Meshing'' a skin graft?', '["To make it look better","To allow the graft to expand to cover a larger area and to allow for drainage of fluid (preventing seroma)","To make it thicker","None"]', 1, 'Expansion and drainage are the two main reasons for meshing.'),
        (v_case_id, 'What is the ''Cosmetic'' drawback of a meshed graft?', '["It''s too smooth","The ''chicken-wire'' or ''fish-net'' appearance of the healed graft","It''s too red","None"]', 1, 'Meshed grafts are usually avoided on the face for this reason.'),
        (v_case_id, 'A graft that is NOT meshed is called what?', '["A full graft","A Sheet Graft","A plate graft","None"]', 1, 'Sheet grafts are used in cosmetically sensitive areas like the face and hands.');

    ---------------------------------------------------------------------------
    -- CASE 50: The ''Itch'' and the ''Suture'' (Removal)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Suture'' (Removal)', 'A patient is asking when the stitches on his ''back'' can be removed.

Vitals: Normal.
Physical Examination: 4-cm incision on the upper back.
Laboratory Results: None.', 50)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the standard time for suture removal on the ''Face''?', '["3-5 days","7-10 days","14 days","1 month"]', 0, 'Early removal on the face prevents ''railroad track'' scarring.'),
        (v_case_id, 'How does the ''Back'' or ''Joint'' surfaces differ in timing?', '["It''s the same","Longer duration (usually 10-14 days) due to higher tension and slower healing","Shorter duration","None"]', 1, 'Premature removal in high-tension areas leads to wound dehiscence.'),
        (v_case_id, 'If the sutures are left in too long (e.g., 3 weeks on the face), what occurs?', '["Stronger wound","Suture tracks and ''epithelialized tunnels'' (permanent scarring)","Infection only","None"]', 1, 'The skin grows around the suture, leaving permanent marks.');

    ---------------------------------------------------------------------------
    -- CASE 51: The Scalp Knot
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scalp Knot', 'A 45-year-old female presents with a firm, mobile lump on her scalp that has been present for 5 years.

Vitals: Normal.
Physical Examination: A 3-cm smooth, firm, subcutaneous nodule on the vertex scalp. No punctum is visible.
Laboratory Results: None.', 51)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common location for a Pilar Cyst (Trichilemmal Cyst)?', '["Back","Scalp (90% of cases)","Face","Legs"]', 1, 'Pilar cysts are derived from the hair follicle root sheath.'),
        (v_case_id, 'How does the ''Surgical'' removal of a pilar cyst differ from an epidermoid cyst?', '["Pilar cysts are more fragile","Pilar cysts have a thicker, tougher wall that allows them to be ''popped out'' (enucleated) whole through a small incision","They cannot be removed","None"]', 1, 'The firm wall makes them easier to excise without rupture.'),
        (v_case_id, 'Are these cysts usually associated with hair loss?', '["Yes, permanently","No, but they can cause temporary thinning of the hair overlying the lump","Only in men","None"]', 1, 'Pressure from the cyst can displace follicles.');

    ---------------------------------------------------------------------------
    -- CASE 52: The Ingrown Toenail
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Ingrown Toenail', 'A 15-year-old male has chronic pain and drainage from the side of his big toenail.

Vitals: Normal.
Physical Examination: Erythema, edema, and granulation tissue at the lateral nail fold of the right hallux.
Laboratory Results: None.', 52)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best'' management for an ingrown nail with significant granulation tissue and recurrent infection?', '["Antibiotics only","Partial nail avulsion with chemical matricectomy (e.g., using Phenol or Sodium Hydroxide)","Complete nail removal only","Wait for it to grow out"]', 1, 'Chemical matricectomy destroys the specific part of the nail root that is causing the problem, preventing recurrence.'),
        (v_case_id, 'What should be done for an acute infection (Paronychia) WITHOUT a permanent ingrown component?', '["Surgery","Soaks in warm water/antiseptics and potentially a small incision if an abscess is present","Steroids","None"]', 1, 'Conservative management is sufficient for simple infections.'),
        (v_case_id, 'Why is ''Complete'' nail removal often a poor choice for a chronic ingrown nail?', '["It hurts too much","High recurrence rate once the nail grows back (~70%) and poor cosmetic result","It takes too long","None"]', 1, 'Targeted destruction of the matrix is superior.');

    ---------------------------------------------------------------------------
    -- CASE 53: The ''Red'' Leg and the ''Crepitus''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Red'' Leg and the ''Crepitus''', 'A diabetic patient with a small foot ulcer develops rapid swelling of the scrotum and perineum. He is extremely ill.

Vitals: BP 85/50, T 40.1 C.
Physical Examination: Blackened skin (eschar) on the scrotum with ''crunchy'' air under the skin (crepitus) and a foul odor.
Laboratory Results: WBC 45,000, Glucose 400.', 53)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the diagnosis for necrotizing fasciitis of the perineum and genitalia?', '["Cellulitis","Fournier''s Gangrene","Simple abscess","Fungal infection"]', 1, 'Fournier''s is a urologic/surgical emergency with high mortality.'),
        (v_case_id, 'What is the absolute priority in management?', '["Insulin for the diabetes","Immediate surgical debridement and broad-spectrum IV antibiotics","Urine culture","None"]', 1, 'Delaying surgery for even a few hours significantly increases the risk of death.'),
        (v_case_id, 'The ''Crepitus'' (gas in the tissue) is typically caused by which type of bacteria?', '["Staphylococcus","Anaerobes (e.g., Clostridium, Bacteroides) and Gram-negative gas-producers","Viruses","None"]', 1, 'Gas production is a hallmark of anaerobic metabolism in deep infections.');

    ---------------------------------------------------------------------------
    -- CASE 54: The ''Pearly'' Bump and the ''Liquid Nitrogen''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Liquid Nitrogen''', 'A patient has multiple actinic keratoses on the scalp. The surgeon uses a ''Spray'' of liquid nitrogen.

Vitals: Normal.
Physical Examination: Multiple rough, scaly patches on sun-damaged skin.
Laboratory Results: None.', 54)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the temperature of Liquid Nitrogen?', '["0 C","-196 C","-50 C","None"]', 1, 'It is extremely cold, allowing for rapid freezing and cell death.'),
        (v_case_id, 'What is the ''expected'' clinical course after cryosurgery for an AK?', '["Nothing happens","Redness, followed by a blister (sometimes blood-filled), crusting, and eventual healing in 1-2 weeks","The skin turns black permanently","None"]', 1, 'The blister formation is a sign that the freeze reached the dermal-epidermal junction.'),
        (v_case_id, 'What is the primary risk of ''Over-freezing'' on the lower legs or in dark-skinned patients?', '["Infection","Hypopigmentation (white spots) or chronic non-healing ulcers","Hair growth","None"]', 1, 'Melanocytes are very sensitive to cold; cautious freezing is required in these groups.');

    ---------------------------------------------------------------------------
    -- CASE 55: The ''Target'' and the ''Biopsy'' (Incisional)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Biopsy'' (Incisional)', 'A patient has a 10-cm soft tissue mass on the thigh. The surgeon needs a diagnosis.

Vitals: Normal.
Physical Examination: Large, deep-seated mass.
Laboratory Results: None.', 55)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'For a very large tumor (>5 cm) where malignancy is suspected, what is the best initial ''Surgical'' diagnostic step?', '["Wide radical excision immediately","Incisional biopsy (taking a small piece of the tumor) to confirm the diagnosis and plan the definitive surgery","Wait and see","None"]', 1, 'Definitive surgery (like amputation or wide limb-sparing excision) requires a tissue-proven diagnosis first.'),
        (v_case_id, 'Where should the biopsy incision be placed?', '["Anywhere","Directly over the mass in a location that can be easily removed during the final definitive surgery","On the other leg","None"]', 1, 'The biopsy tract itself is considered ''contaminated'' and must be excised with the tumor.'),
        (v_case_id, 'Is ''Core Needle Biopsy'' acceptable for soft tissue sarcomas?', '["No","Yes, it is often the preferred initial method as it is minimally invasive","Only for children","None"]', 1, 'Core needle (but NOT fine needle) can provide enough architecture for a diagnosis.');

    ---------------------------------------------------------------------------
    -- CASE 56: The ''Itch'' and the ''Skin'' Graft (Donor)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Skin'' Graft (Donor)', 'A patient had a ''Split-Thickness Skin Graft'' (STSG) harvested from her thigh to cover a burn.

Vitals: Normal.
Physical Examination: A raw, weeping area on the thigh.
Laboratory Results: None.', 56)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does an STSG donor site heal?', '["By primary intention (stitches)","By re-epithelialization from the remaining hair follicles and sweat glands (secondary intention)","It never heals","None"]', 1, 'Since only part of the dermis is taken, the skin can regenerate from deep structures.'),
        (v_case_id, 'Which heals FASTER, an STSG donor site or a Full-Thickness (FTSG) donor site?', '["STSG","FTSG (because it is sutured closed)","They are the same","None"]', 1, 'FTSG sites are small and closed primarily; STSG sites are larger and must granulate/re-epithelialize.'),
        (v_case_id, 'What is the major long-term drawback of STSG donor sites?', '["Infection","Potential for permanent pigmentary changes or scarring","Pain only","None"]', 1, 'While they heal, the skin may never look perfectly normal again.');

    ---------------------------------------------------------------------------
    -- CASE 57: The ''Pearly'' Bump and the ''Recurrence''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Recurrence''', 'A patient has a recurrence of a BCC in the same spot where a standard excision was performed 2 years ago.

Vitals: Normal.
Physical Examination: Scar on the cheek with a new pearly edge.
Laboratory Results: Recurrent BCC.', 57)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Gold Standard'' for managing a RECURRENT skin cancer?', '["Another standard excision","Mohs Micrographic Surgery","Radiation","Wait and see"]', 1, 'Recurrent tumors often have ''subclinical'' spread along the scar tissue, making Mohs essential for clear margins.'),
        (v_case_id, 'Why is the cure rate lower for recurrent tumors treated with standard excision?', '["The tumor is stronger","Scar tissue ''masks'' the tumor roots and makes it harder for the pathologist to find them with standard sectioning","Insurance won''t pay","None"]', 1, 'Scarring alters the normal tissue planes.'),
        (v_case_id, 'Does a ''positive margin'' on a previous pathology report increase the risk of recurrence?', '["Yes, significantly","No","Only if the patient is young","None"]', 0, 'Incomplete excision is the primary driver of recurrence.');

    ---------------------------------------------------------------------------
    -- CASE 58: The ''Target'' and the ''Debridement'' (Wound)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Debridement'' (Wound)', 'A patient with a chronic diabetic foot ulcer has thick, dry ''callus'' around the edges.

Vitals: Normal.
Physical Examination: A deep ulcer on the first metatarsal head with a thick ring of hyperkeratosis.
Laboratory Results: None.', 58)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is ''Paring the Callus'' (debridement of the edges) essential for diabetic ulcer healing?', '["It looks better","Callus hides the true extent of the ulcer and prevents the migration of new skin cells across the wound","It stops the smell","None"]', 1, 'Debridement converts a ''stagnant'' chronic wound into an ''active'' acute-like wound.'),
        (v_case_id, 'What must be checked in every diabetic foot ulcer to ensure healing is possible?', '["Blood sugar only","Vascular status (pulses, ABI) and Neuropathy (monofilament test)","Shoe size","None"]', 1, 'Without adequate blood supply, even the best surgical debridement will fail.'),
        (v_case_id, 'Is ''Probe-to-Bone'' a useful clinical test in this setting?', '["No","Yes, it is highly suggestive of underlying Osteomyelitis if a metal probe can touch bone","Only for children","None"]', 1, 'This is a high-yield clinical maneuver for Step 2 CK.');

    ---------------------------------------------------------------------------
    -- CASE 59: The ''Pearly'' Bump and the ''Flap'' (Closure)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Flap'' (Closure)', 'A surgeon is using a ''Rotation Flap'' to close a large defect on the cheek.

Vitals: Normal.
Physical Examination: Large circular defect.
Laboratory Results: None.', 59)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the characteristic shape of a rotation flap?', '["A square","An arc of a circle","A triangle","None"]', 1, 'The flap ''rotates'' around a pivot point.'),
        (v_case_id, 'What is the ''Back-cut'' in a rotation flap used for?', '["To make it bleed","To allow for more rotation and reduce tension at the closure site","To finish the surgery","None"]', 1, 'This increases the mobility of the flap.'),
        (v_case_id, 'What is the ''Dog-ear'' deformity?', '["An infection","A redundant fold of skin that occurs at the pivot point or end of a closure, which may require separate excision","A type of ear surgery","None"]', 1, 'Dog-ears are a common and expected surgical result that often needs ''leveling'' during or after closure.');

    ---------------------------------------------------------------------------
    -- CASE 60: The ''Itch'' and the ''Steroid'' (Surgical)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Steroid'' (Surgical)', 'A patient has a thick, itchy hypertrophic scar. The surgeon is injecting Triamcinolone (Kenalog).

Vitals: Normal.
Physical Examination: Thick, red, raised scar on the chest.
Laboratory Results: None.', 60)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How do intralesional steroids help flatten a scar?', '["By killing the skin","By inhibiting fibroblast activity and reducing collagen production","By adding water","None"]', 1, 'Steroids modify the local wound-healing response.'),
        (v_case_id, 'What is a potential ''Surgical'' complication of injecting too much steroid into the scar?', '["Cancer","Skin atrophy, hypopigmentation, and fat necrosis (indentation)","Hair growth","None"]', 1, 'Precise injection into the scar tissue is required to avoid surrounding atrophy.'),
        (v_case_id, 'How many weeks should be between injections?', '["1 day","4-6 weeks (to allow the steroid effect to be fully realized)","1 year","None"]', 1, 'Serial injections are safer than one massive dose.');

    ---------------------------------------------------------------------------
    -- CASE 61: The ''Target'' and the ''Burn'' (Triage)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Burn'' (Triage)', 'A triage nurse is assessing multiple burn victims. One patient has burns on the face and singed nasal hairs.

Vitals: HR 120, RR 24.
Physical Examination: Singed nasal hairs, soot in the mouth, and a raspy voice.
Laboratory Results: None.', 61)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the MOST URGENT priority for this patient?', '["Calculating BSA","Securing the airway (Early Intubation) before progressive edema makes it impossible","Starting IV fluids","Cleaning the face"]', 1, 'Airway edema can develop rapidly in inhalation injury.'),
        (v_case_id, 'Which gas poisoning must be suspected in victims of house fires?', '["Oxygen","Carbon Monoxide (CO) and Cyanide","Nitrogen","None"]', 1, 'CO poisoning is a leading cause of early death in fire victims.'),
        (v_case_id, 'Does a ''Normal'' Pulse Oximetry reading rule out CO poisoning?', '["Yes","No, pulse ox cannot distinguish between oxyhemoglobin and carboxyhemoglobin; ABG with CO-oximetry is needed","Only in smokers","None"]', 1, 'This is a classic ''Step'' trap.');

    ---------------------------------------------------------------------------
    -- CASE 62: The ''Pearly'' Bump and the ''Laser'' (Vascular)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Laser'' (Vascular)', 'A patient has a large ''Port Wine Stain'' on the face and wants it removed.

Vitals: Normal.
Physical Examination: Large, flat purple patch on the cheek.
Laboratory Results: None.', 62)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Gold Standard'' surgical treatment for a Port Wine Stain?', '["Surgical excision and grafting","Pulsed Dye Laser (PDL)","Cryosurgery","Wait for it to fade"]', 1, 'PDL selectively targets hemoglobin in the blood vessels without damaging the surrounding skin.'),
        (v_case_id, 'Why is ''Early'' treatment (in infancy) preferred for Port Wine Stains?', '["It''s cheaper","Better response due to smaller vessel size and thinner skin, and it prevents the development of nodules/thickening later in life","No reason","None"]', 1, 'Early intervention provides the best long-term results.'),
        (v_case_id, 'What is the characteristic immediate clinical sign of a successful PDL treatment?', '["Bleeding","Purpura (purple bruising) of the treated area","The skin turns white","None"]', 1, 'The laser bursts the vessels, leading to temporary purpura.');

    ---------------------------------------------------------------------------
    -- CASE 63: The ''Itch'' and the ''Punctum'' (Rupture)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Punctum'' (Rupture)', 'A patient has a ruptured epidermoid cyst. It is red, hot, and painful.

Vitals: Normal.
Physical Examination: Erythema, fluctuation, and extreme tenderness over a known cyst site.
Laboratory Results: None.', 63)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best initial step for a ruptured, acutely inflamed cyst?', '["Definitive excision of the wall","Incision and Drainage (I&D) to relieve pressure","Wait for it to cool down","None"]', 1, 'Acute inflammation makes the wall ''friable'' and impossible to remove cleanly.'),
        (v_case_id, 'Is ''Antibiotic'' therapy mandatory for every ruptured cyst?', '["Yes, for 10 days","No, much of the inflammation is a sterile foreign body reaction to keratin, but antibiotics are used if true infection is suspected","Never","None"]', 1, 'Clinical judgement is needed to distinguish sterile inflammation from sepsis.'),
        (v_case_id, 'When can ''Definitive Excision'' be performed safely after an I&D?', '["The next day","Usually after 4-8 weeks when the inflammation has completely resolved","After 1 year","None"]', 1, 'Resolution of inflammation allows the wall to reform and become exciseable.');

    ---------------------------------------------------------------------------
    -- CASE 64: The ''Pearly'' Bump and the ''Margin'' (SCC)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Margin'' (SCC)', 'A surgeon is performing an excision of a 1.5 cm Squamous Cell Carcinoma on the arm.

Vitals: Normal.
Physical Examination: SCC on the arm.
Laboratory Results: None.', 64)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the standard ''Narrow'' margin for a low-risk SCC (< 2cm)?', '["1 mm","4-6 mm","1 cm","2 cm"]', 1, '4-6 mm is the standard for low-risk SCC; high-risk lesions need 6-10 mm.'),
        (v_case_id, 'If the SCC was ''High-Risk'' (e.g., >2cm or on the ear/lip), what is the preferred method?', '["WLE with 4mm margins","Mohs Micrographic Surgery","Topical 5-FU","None"]', 1, 'Mohs is preferred for all high-risk SCCs.'),
        (v_case_id, 'Does SCC carry a higher risk of ''Metastasis'' than BCC?', '["No","Yes, SCC has a small but real risk of nodal metastasis (especially on the ear/lip), while BCC almost never metastasizes","Only in the elderly","None"]', 1, 'This is a key biological difference between the two most common skin cancers.');

    ---------------------------------------------------------------------------
    -- CASE 65: The ''Target'' and the ''Wound'' (Vacuum)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Wound'' (Vacuum)', 'A patient has a large, deep pressure ulcer that has been debrided. The surgeon starts Negative Pressure Wound Therapy (NPWT/Wound Vac).

Vitals: Normal.
Physical Examination: Deep, clean wound bed.
Laboratory Results: None.', 65)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary mechanism by which NPWT promotes healing?', '["It dries the wound","By removing fluid/exudate, increasing blood flow, and providing ''macro-strain'' which stimulates granulation tissue","It adds bacteria","None"]', 1, 'The mechanical force of the vacuum promotes cell proliferation.'),
        (v_case_id, 'Is NPWT contraindicated in a wound with untreated ''Osteomyelitis''?', '["No","Yes, it should not be used until the underlying infection is addressed","Only in the elderly","None"]', 1, 'Sealing an infection under negative pressure can lead to worsening sepsis.'),
        (v_case_id, 'What is another major contraindication for Wound Vac?', '["Necrotic tissue (eschar), malignancy in the wound, or exposed vital structures (vessels/nerves)","Clean tissue","Age < 20","None"]', 0, 'Debridement must precede NPWT; exposed vessels can rupture under the pressure.');

    ---------------------------------------------------------------------------
    -- CASE 66: The ''Itch'' and the ''Suture'' (Infection)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Suture'' (Infection)', 'One week after an excision, the patient has red ''streaks'' coming from the wound.

Vitals: T 38.5 C.
Physical Examination: Erythema and lymphangitic streaking (red lines) extending proximally from the surgical site.
Laboratory Results: None.', 66)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does ''Lymphangitic streaking'' indicate?', '["Normal healing","Spread of infection (usually Group A Streptococcus) along the lymphatic channels","Allergy to sutures","None"]', 1, 'This is a sign of a spreading infection that requires systemic antibiotics.'),
        (v_case_id, 'Which organism is most commonly associated with rapid, streaking lymphangitis?', '["S. aureus","Group A Streptococcus (S. pyogenes)","Pseudomonas","None"]', 1, 'Streptococcus is famous for its rapid, spreading nature.'),
        (v_case_id, 'What is the management?', '["Topical steroids","Immediate systemic antibiotics and monitoring for sepsis","Ice only","None"]', 1, 'Prompt treatment prevents systemic dissemination.');

    ---------------------------------------------------------------------------
    -- CASE 67: The ''Pearly'' Bump and the ''Mohs'' (Wait)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Mohs'' (Wait)', 'A patient is undergoing Mohs for a BCC on the ear. The first ''layer'' is positive for tumor.

Vitals: Normal.
Physical Examination: Defect on the ear.
Laboratory Results: Positive margin on first layer.', 67)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the Mohs surgeon do next after a ''Positive'' layer?', '["Give up and use radiation","Take another targeted ''layer'' only in the specific area where the tumor remains","Excise 1cm more everywhere","None"]', 1, 'This targeted approach is what makes Mohs so tissue-sparing.'),
        (v_case_id, 'How is the tumor ''mapped''?', '["By memory","By creating a precise map of the specimen and the surgical site, using ink and landmarks to match the two","Using a GPS","None"]', 1, 'The ''Mohs map'' is the key to accuracy.'),
        (v_case_id, 'What is the typical ''turnaround'' time for a single Mohs layer?', '["1 minute","20-60 minutes (while the tissue is frozen, cut, stained, and read)","1 day","None"]', 1, 'Patients spend most of the day waiting for results.');

    ---------------------------------------------------------------------------
    -- CASE 68: The ''Target'' and the ''Burn'' (Nutrition)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Burn'' (Nutrition)', 'A patient with 40% BSA burns is being managed in the ICU.

Vitals: Tachycardic.
Physical Examination: Extensive burns.
Laboratory Results: High urea.', 68)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What happens to the ''Metabolic Rate'' in a patient with large burns?', '["It decreases","It increases dramatically (Hypermetabolic state) to support healing and maintain body temperature","No change","None"]', 1, 'Large burns lead to one of the highest metabolic demands in medicine.'),
        (v_case_id, 'What is the preferred route of nutritional support if the GI tract is functioning?', '["Parenteral (IV)","Enteral (tube feeding) started as early as possible","Wait for the patient to eat","None"]', 1, 'Enteral nutrition helps maintain the GI barrier and is safer than TPN.'),
        (v_case_id, 'Why do burn patients lose so much ''Heat''?', '["They are thin","Loss of the skin''s barrier function leads to massive evaporative heat loss","The hospital is cold","None"]', 1, 'The ICU room is often kept very warm to compensate.');

    ---------------------------------------------------------------------------
    -- CASE 69: The ''Bite'' and the ''Snake'' (Decision)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Bite'' and the ''Snake'' (Decision)', 'A patient was bitten by a ''rattlesnake'' 1 hour ago.

Vitals: HR 120, BP 100/60.
Physical Examination: Two fang marks with rapid swelling, ecchymosis, and pain.
Laboratory Results: Low platelets.', 69)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Initial Management'' for a venomous snake bite?', '["Sucking out the venom","Applying a tourniquet","Immobilizing the limb at the level of the heart and rapid transport for potential Antivenin (CroFab)","Cutting the wound"]', 2, 'Tourniquets and suction are harmful; stabilization and antivenin are key.'),
        (v_case_id, 'What is a major clinical indication for giving CroFab?', '["If the snake was big","Rapidly progressive local swelling, systemic symptoms, or hematologic abnormalities (e.g., low platelets/fibrinogen)","Any bite, even if dry","None"]', 1, 'Not all bites require antivenin (some are ''dry'' bites).'),
        (v_case_id, 'What is the most common lab abnormality in pit viper (Crotalid) envenomation?', '["High glucose","Coagulopathy and Thrombocytopenia","High potassium","None"]', 1, 'Venom often contains toxins that consume clotting factors.');

    ---------------------------------------------------------------------------
    -- CASE 70: The ''Itch'' and the ''Biopsy'' (Immunofluorescence)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Biopsy'' (Immunofluorescence)', 'A patient has a suspected Bullous Pemphigoid.

Vitals: Normal.
Physical Examination: Large, tense blisters.
Laboratory Results: None.', 70)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'In which ''Medium'' should a biopsy specimen for DIF be transported?', '["Formalin","Michel''s Medium (or Zeus medium) to preserve the immune complexes","Sterile saline","None"]', 1, 'Formalin destroys the proteins needed for fluorescence.'),
        (v_case_id, 'What does DIF detect in Bullous Pemphigoid?', '["Bacteria","Linear IgG and C3 deposition along the basement membrane zone","Fungus","None"]', 1, 'This is the diagnostic gold standard.'),
        (v_case_id, 'Where should the biopsy for DIF be taken from in a patient with blisters?', '["Directly through a blister","Normal-appearing, perilesional skin","The palm of the hand","None"]', 1, 'Blistered skin has lost the architecture needed to see the patterns clearly.');

    ---------------------------------------------------------------------------
    -- CASE 71: The ''Pearly'' Bump and the ''Excision'' (Heel)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Excision'' (Heel)', 'A patient needs an excision on the ''heel''.

Vitals: Normal.
Physical Examination: BCC on the heel.
Laboratory Results: None.', 71)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary surgical challenge on the heel and sole?', '["Too much hair","Lack of skin laxity and high tension, making primary closure difficult and increasing the risk of wound dehiscence","It''s too dark","None"]', 1, 'The skin on the sole is thick and tightly bound to the fascia.'),
        (v_case_id, 'What is a common closure alternative if primary closure is not possible on the heel?', '["Leave it open (Secondary Intention) or use a Full-Thickness Skin Graft","Stretching the skin with a machine","None","Amputation"]', 0, 'Secondary intention is often preferred on the sole as it results in a tough, functional scar.'),
        (v_case_id, 'Should the patient be ''Non-weight bearing'' after a heel surgery?', '["No","Yes, usually for 1-2 weeks to prevent tension-induced wound opening","Only for 1 day","None"]', 1, 'Physical rest is a critical part of the surgical plan.');

    ---------------------------------------------------------------------------
    -- CASE 72: The ''Target'' and the ''Burn'' (Depth)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Burn'' (Depth)', 'A patient has a burn that is ''dry, white, and leathery''. He feels ''nothing'' when the area is poked with a needle.

Vitals: Normal.
Physical Examination: White, charred-looking skin; insensate to pain.
Laboratory Results: None.', 72)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classification of an insensate, leathery burn?', '["First-degree","Second-degree (Partial-thickness)","Third-degree (Full-thickness)","None"]', 2, 'Full-thickness burns destroy the nerves, making them painless.'),
        (v_case_id, 'Will this burn heal on its own without surgery?', '["Yes, after 1 week","No, it will only heal from the edges (very slowly) and requires skin grafting for closure","Only in children","None"]', 1, 'Spontaneous healing is impossible because all epidermal structures are destroyed.'),
        (v_case_id, 'What is the ''Fourth-Degree'' burn?', '["A very bad sunburn","A burn that extends into deeper structures like muscle or bone","A chemical burn","None"]', 1, 'These often require flap reconstruction or amputation.');

    ---------------------------------------------------------------------------
    -- CASE 73: The ''Itch'' and the ''Biopsy'' (Melanoma)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Biopsy'' (Melanoma)', 'A patient has a 2-cm suspicious mole on the back. The surgeon is deciding between a 4-mm punch and a full excision.

Vitals: Normal.
Physical Examination: Large atypical nevus.
Laboratory Results: None.', 73)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is a ''Punch'' biopsy often suboptimal for a large suspicious mole?', '["It hurts more","Sampling error: it may miss the thickest part of the melanoma, leading to under-staging","It takes too long","None"]', 1, 'A small punch only samples a tiny fraction of the lesion''s area.'),
        (v_case_id, 'When is a ''Punch'' biopsy acceptable for a pigmented lesion?', '["Never","Only if the lesion is very large (e.g., a large facial freckle) where a full excision would be disfiguring, to get a ''representative'' sample","For all moles","None"]', 1, 'Incisionals are a last resort for large facial lesions.'),
        (v_case_id, 'If an incisional (punch) biopsy shows melanoma, what is the ''Definitive'' treatment?', '["None","Wide Local Excision of the entire site with appropriate margins","Radiation","None"]', 1, 'Complete removal is the only definitive treatment.');

    ---------------------------------------------------------------------------
    -- CASE 74: The ''Bite'' and the ''Tick'' (Surgery)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Bite'' and the ''Tick'' (Surgery)', 'A patient has a ''tick'' embedded in their skin for 2 days.

Vitals: Normal.
Physical Examination: Tick attached to the scalp.
Laboratory Results: None.', 74)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best ''Surgical'' way to remove a tick?', '["Burning it with a match","Covering it with nail polish","Grasping it close to the skin with tweezers and pulling upward with steady, even pressure","Cutting it out"]', 2, 'Simple mechanical removal is best; avoid ''irritating'' the tick as it may regurgitate pathogens.'),
        (v_case_id, 'What should you do if the ''Head'' (mouthparts) breaks off in the skin?', '["Emergency surgery","Leave it alone and let the skin heal; the head itself does not transmit disease once the body is gone","Dig it out with a needle","None"]', 1, 'Trying to dig it out often causes more trauma than leaving it.'),
        (v_case_id, 'Prophylaxis for Lyme disease (single dose Doxycycline) is indicated if the tick was attached for how long?', '["Any time","At least 36 hours","1 week","None"]', 1, 'It takes significant time for the bacteria to travel from the tick''s gut to the human.');

    ---------------------------------------------------------------------------
    -- CASE 75: The ''Pearly'' Bump and the ''Mohs'' (Nail)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Mohs'' (Nail)', 'A patient has an SCC of the nail bed.

Vitals: Normal.
Physical Examination: Destruction of the nail plate with a subungual growth.
Laboratory Results: SCC.', 75)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Can Mohs surgery be used for nail cancers to avoid amputation?', '["No","Yes, Mohs can sometimes salvage the digit by providing margin control while sparing bone","Only for BCC","None"]', 1, 'Digit-sparing surgery is a major benefit of the Mohs technique.'),
        (v_case_id, 'What is the primary indicator that ''Amputation'' is necessary?', '["The patient is old","Invasion of the tumor into the bone (phalanx)","The nail is ugly","None"]', 1, 'Bone involvement usually precludes a Mohs approach.'),
        (v_case_id, 'SCC of the nail is often associated with which virus?', '["HIV","Human Papillomavirus (HPV) - especially high-risk types","Flu","None"]', 1, 'Subungual SCC is a classic location for HPV-induced malignancy.');

    ---------------------------------------------------------------------------
    -- CASE 76: The ''Target'' and the ''Debridement'' (Biofilm)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Debridement'' (Biofilm)', 'A chronic wound is ''slimy'' and fails to heal despite proper care.

Vitals: Normal.
Physical Examination: A thin, shiny film over the wound bed.
Laboratory Results: None.', 76)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a ''Biofilm'' in a chronic wound?', '["A piece of plastic","A complex community of bacteria protected by a self-produced matrix, which is highly resistant to antibiotics","Normal skin","None"]', 1, 'Biofilms are a major cause of wound chronicity.'),
        (v_case_id, 'What is the most effective way to disrupt a biofilm?', '["Oral antibiotics only","Regular surgical (sharp) debridement to physically break up the matrix","Wait and see","None"]', 1, 'Physical disruption is the only way to expose the bacteria to the immune system and topicals.'),
        (v_case_id, 'Does ''Honey'' have a role in biofilm management?', '["No","Yes, medical-grade honey (e.g., Manuka) has antimicrobial properties that can help prevent and treat biofilms","Only for eating","None"]', 1, 'Medical honey is an approved wound-care adjunct.');

    ---------------------------------------------------------------------------
    -- CASE 77: The ''Itch'' and the ''Suture'' (Reaction)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Suture'' (Reaction)', 'Two weeks after an excision with dissolvable stitches, the patient has several ''red bumps'' along the scar.

Vitals: Normal.
Physical Examination: Small, firm papules directly over the suture line. No fever or pus.
Laboratory Results: None.', 77)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a ''Suture Granuloma''?', '["A cancer","A foreign body reaction to the suture material (often ''spitting'' out through the skin)","An infection","None"]', 1, 'The body attempts to extrude the ''foreign'' suture.'),
        (v_case_id, 'What is the management?', '["IV Antibiotics","Removal of the offending suture material and reassurance","More stitches","None"]', 1, 'Once the material is gone, the reaction resolves.'),
        (v_case_id, 'Is this more common with ''Monofilament'' or ''Braided'' sutures?', '["Monofilament","Braided (like silk or Vicryl) which has more surface area for the body to react to","They are the same","None"]', 1, 'Braided materials generally provoke more tissue reaction.');

    ---------------------------------------------------------------------------
    -- CASE 78: The ''Pearly'' Bump and the ''Flap'' (Safety)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Bump and the ''Flap'' (Safety)', 'A surgeon is performing a flap on the forehead of an 80-year-old smoker with heart disease.

Vitals: BP 160/90.
Physical Examination: Poor skin quality.
Laboratory Results: None.', 78)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does smoking affect surgical wound healing?', '["No effect","It causes vasoconstriction and high carbon monoxide levels, leading to tissue hypoxia and high rates of flap necrosis/wound breakdown","It makes it faster","None"]', 1, 'Nicotine is a potent vasoconstrictor.'),
        (v_case_id, 'How many weeks of ''Smoking Cessation'' are generally recommended before a major elective flap surgery?', '["1 day","At least 4 weeks","1 year","None"]', 1, 'This allows for significant recovery of tissue oxygenation.'),
        (v_case_id, 'What is the most likely complication in this specific patient?', '["Infection","Distal flap necrosis (the ''tip'' dies)","Cancer recurrence","None"]', 1, 'The combination of old age, heart disease, and smoking is a ''perfect storm'' for poor perfusion.');

    ---------------------------------------------------------------------------
    -- CASE 79: The ''Target'' and the ''Burn'' (Chemical)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Target'' and the ''Burn'' (Chemical)', 'A worker is splashed with ''Hydrofluoric Acid'' at a factory.

Vitals: Normal.
Physical Examination: Redness on the hand that is ''incredibly painful'' out of proportion to appearance.
Laboratory Results: None.', 79)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the specific ''Antidote'' for HF acid burns?', '["Water only","Calcium Gluconate (gel or injection) to neutralize the fluoride ions","Vinegar","None"]', 1, 'Fluoride ions leach calcium from bones and nerves, causing deep, excruciating pain.'),
        (v_case_id, 'Why is irrigation alone insufficient for HF acid?', '["It is","The fluoride ion continues to penetrate deep into the tissues even after the surface acid is washed off","Water makes it explode","None"]', 1, 'Chemical neutralization is mandatory.'),
        (v_case_id, 'Which life-threatening electrolyte abnormality can occur with large HF burns?', '["Hypercalcemia","Hypocalcemia and Hyperkalemia (which can cause fatal arrhythmias)","No effect","None"]', 1, 'The fluoride ''eats'' the body''s calcium, leading to systemic depletion.');

    ---------------------------------------------------------------------------
    -- CASE 80: The ''Itch'' and the ''Biopsy'' (Final Review)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Itch'' and the ''Biopsy'' (Final Review)', 'A final question on surgical-medical integration.

Vitals: Normal.
Physical Examination: Patient is ready.
Laboratory Results: None.', 80)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'If a lesion is clinically diagnostic of a benign condition (e.g., a classic skin tag), is a biopsy mandatory?', '["Yes, for everyone","No, clinical diagnosis is sufficient unless the lesion is atypical, bothersome, or the patient requests removal","Only if it is red","None"]', 1, 'Cost-effective care avoids unnecessary procedures.'),
        (v_case_id, 'What is the most important rule of ''Surgical Safety''?', '["Work fast","Verify the patient, the procedure, and the EXACT surgical site (Time-out) before starting","Use the sharpest blade","None"]', 1, 'Wrong-site surgery is a ''never event'' that is prevented by strict protocols.'),
        (v_case_id, 'Which ''Surgical'' technique is both diagnostic and potentially therapeutic?', '["Punch biopsy","Excisional biopsy","Needle aspiration","None"]', 1, 'Excisional biopsy removes the whole lesion while providing a specimen for diagnosis.');

    RAISE NOTICE 'Finished populating 80 cases for case-surgical-medical.';
END $$;

COMMIT;
