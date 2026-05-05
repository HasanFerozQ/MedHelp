-- US MD/MBBS (4th Year) Clinical Case Blocks
-- Section: Clinical Case Integration (Step 2 CK)
-- Topic: Diagnostic reasoning & management algorithms
-- Topic Slug: case-algorithms
-- Sourced: UWorld, Step-Up to Medicine, MTB Step 2, First Aid Step 2 CK

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'case-algorithms' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'case-algorithms';
    END IF;

    -- CLEAN SLATE: Clear existing data for this topic to ensure a fresh, 50-case upload
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    ---------------------------------------------------------------------------
    -- CASE 01: The Acne Escalation
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Acne Escalation', 'A 16-year-old male presents with worsening acne. He has been using over-the-counter benzoyl peroxide for 6 months with minimal improvement.

Vitals: Normal.
Physical Examination: Multiple open and closed comedones, along with numerous erythematous papules and pustules on the cheeks and forehead. No nodules or scarring are noted.
Laboratory Results: None.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best next step in management for this patient?', '["Switch to salicylic acid","Add topical retinoids (e.g., Tretinoin) and consider topical antibiotics (e.g., Clindamycin)","Start oral Isotretinoin immediately","Perform a chemical peel"]', 1, 'For moderate inflammatory acne failing OTC therapy, the next step is combining a topical retinoid with a topical antibiotic or benzoyl peroxide.'),
        (v_case_id, 'If the patient subsequently develops deep, painful nodules and scarring, what is the ''Most Effective'' treatment?', '["Oral Tetracycline","Oral Isotretinoin","Increase strength of topical steroids","Blue light therapy"]', 1, 'Oral Isotretinoin is the gold standard for severe, recalcitrant nodulocystic acne or acne with scarring.'),
        (v_case_id, 'Which of the following must be checked BEFORE starting the treatment mentioned in the previous question in a female of childbearing age?', '["Liver function tests and lipids only","Two negative pregnancy tests and enrollment in iPLEDGE","Complete blood count","Chest X-ray"]', 1, 'Isotretinoin is highly teratogenic; strict pregnancy prevention is mandatory.');

    ---------------------------------------------------------------------------
    -- CASE 02: The Suspect Mole
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Suspect Mole', 'A 45-year-old female presents with a mole on her back that has changed color and developed ''jagged'' edges over the last 3 months.

Vitals: Normal.
Physical Examination: A 7-mm asymmetric macule with irregular borders and multiple shades of brown and black on the left scapula.
Laboratory Results: None.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Initial Step'' in the management of this lesion?', '["Shave biopsy","Excisional biopsy with 1-3 mm margins","Wide local excision with 2 cm margins","Laser ablation"]', 1, 'Suspected melanoma should undergo an excisional biopsy (elliptical or punch) to determine the Breslow depth. Shave biopsies are avoided as they may ''transect'' the base and lose depth data.'),
        (v_case_id, 'The biopsy shows melanoma with a Breslow depth of 1.5 mm. What is the next step in management?', '["Chemotherapy","Wide local excision (WLE) and Sentinel Lymph Node Biopsy (SLNB)","Radiation therapy","No further treatment needed"]', 1, 'Melanomas > 0.8 mm (or < 0.8 mm with ulceration/high mitosis) require SLNB in addition to WLE.'),
        (v_case_id, 'What is the most important prognostic factor for localized melanoma?', '["Diameter of the lesion","Breslow thickness (depth of invasion)","Age of the patient","Number of colors in the mole"]', 1, 'Breslow thickness is the single most important predictor of survival and metastatic potential.');

    ---------------------------------------------------------------------------
    -- CASE 03: The Scaly Patch and the Hair Loss
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scaly Patch and the Hair Loss', 'An 8-year-old girl presents with a round patch of hair loss that is ''itchy'' and scaly.

Vitals: Normal.
Physical Examination: A 3-cm circular area of alopecia on the vertex with prominent scaling and ''black dots'' (broken hairs). Cervical lymphadenopathy is present.
Laboratory Results: KOH prep shows fungal hyphae within the hair shaft.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most appropriate next step in treatment for this patient?', '["Topical Ketoconazole cream","Oral Griseofulvin or Terbinafine","Topical steroids","Selenium sulfide shampoo only"]', 1, 'Tinea capitis requires ORAL therapy to penetrate the hair follicle; topicals are ineffective as monotherapy.'),
        (v_case_id, 'If the lesion becomes a boggy, purulent, painful mass with hair loss, what is it called?', '["Abscess","Kerion","Seborrheic dermatitis","Impetigo"]', 1, 'A kerion is a severe inflammatory response to tinea capitis and may lead to permanent scarring alopecia if not treated.'),
        (v_case_id, 'Should the patient''s family members be screened?', '["No, it''s not contagious","Yes, as asymptomatic carriage among household contacts is common","Only if they have pets","Only if they are bald"]', 1, 'Asymptomatic household contacts can act as reservoirs and cause reinfection.');

    ---------------------------------------------------------------------------
    -- CASE 04: The Recurrent Facial Redness
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Recurrent Facial Redness', 'A 40-year-old male presents with redness on his nose and cheeks that worsens after drinking hot coffee or being in the sun.

Vitals: Normal.
Physical Examination: Persistent erythema and telangiectasias over the central face. Multiple inflammatory papules and pustules are present. No comedones are noted.
Laboratory Results: None.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best initial topical treatment for this patient''s inflammatory lesions?', '["Benzoyl peroxide","Topical Metronidazole or Azelaic acid","Topical Tretinoin","Topical Nystatin"]', 1, 'Topical Metronidazole is a first-line treatment for the papules and pustules of rosacea.'),
        (v_case_id, 'What is the most important ''Non-pharmacologic'' management step?', '["Daily face scrubbing","Avoidance of triggers (e.g., sun, alcohol, spicy foods, hot beverages)","Steam facials","Increasing caffeine intake"]', 1, 'Trigger avoidance is essential to manage the underlying vasomotor instability.'),
        (v_case_id, 'The patient complains of a ''gritty'' sensation in his eyes. What should you evaluate for?', '["Glaucoma","Ocular Rosacea (Blepharitis/Conjunctivitis)","Cataracts","Uveitis"]', 1, 'Ocular involvement occurs in up to 50% of rosacea patients and can lead to corneal scarring.');

    ---------------------------------------------------------------------------
    -- CASE 05: The Itchy Fingers at Night
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Fingers at Night', 'A 25-year-old male presents with intense itching that is much worse at night. His roommate has similar symptoms.

Vitals: Normal.
Physical Examination: Small, erythematous papules and thin, linear tracks (burrows) in the finger webs, wrists, and periumbilical area.
Laboratory Results: Skin scraping under mineral oil shows mites and eggs.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the first-line treatment for this patient and his roommate?', '["Topical Permethrin 5% cream (applied head-to-toe and washed off after 8-14 hours)","Oral Fluconazole","Topical Hydrocortisone","Topical Clotrimazole"]', 0, 'Permethrin is the standard first-line scabicide. Oral Ivermectin is an alternative.'),
        (v_case_id, 'Which of the following management steps is ''Mandatory'' for success?', '["Treating only the symptomatic roommate","Treating all household contacts regardless of symptoms","Shaving all body hair","Taking a bleach bath"]', 1, 'Asymptomatic contacts must be treated simultaneously to prevent a ''ping-pong'' cycle of reinfection.'),
        (v_case_id, 'What should be done with the patient''s bedding and clothing?', '["Discard them","Wash in hot water and dry in a hot dryer (or seal in a plastic bag for 72 hours)","Spray with perfume","Nothing"]', 1, 'High heat kills the mites; they cannot survive away from human skin for more than 2-3 days.');

    ---------------------------------------------------------------------------
    -- CASE 06: The Thickened Toenails
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Thickened Toenails', 'A 60-year-old male presents with yellow, thickened, and crumbly toenails. He is bothered by the appearance and difficulty trimming them.

Vitals: Normal.
Physical Examination: Subungual hyperkeratosis and onycholysis of 8 toenails.
Laboratory Results: KOH and fungal culture are positive for Trichophyton rubrum.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most effective treatment for this patient?', '["Topical Ciclopirox nail lacquer","Oral Terbinafine (usually for 12 weeks for toenails)","Oral Nystatin","Surgical removal of all nails"]', 1, 'Oral Terbinafine has significantly higher cure rates than topical treatments for onychomycosis.'),
        (v_case_id, 'Which laboratory test should be monitored during treatment with oral Terbinafine?', '["Renal function (BUN/Cr)","Liver Function Tests (ALT/AST)","Complete Blood Count","Lipid panel"]', 1, 'Oral Terbinafine can cause hepatotoxicity; baseline and periodic LFTs are recommended.'),
        (v_case_id, 'If the patient had underlying liver cirrhosis, what would be the best management?', '["Still use oral Terbinafine","Topical efinaconazole or avoid systemic treatment","Oral Ketoconazole","None of the above"]', 1, 'Systemic antifungals should be avoided in patients with active or chronic liver disease.');

    ---------------------------------------------------------------------------
    -- CASE 07: The Rapidly Spreading Leg Redness
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rapidly Spreading Leg Redness', 'A 55-year-old male with Type 2 Diabetes presents with a warm, red, and painful area on his left lower leg that has spread over 24 hours.

Vitals: T 38.3 C, BP 130/80.
Physical Examination: Ill-defined erythema, warmth, and tenderness on the left pretibial area. There is a small crack (fissure) between his 4th and 5th toes.
Laboratory Results: WBC 13,000.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most likely causative organism for this non-purulent presentation?', '["Staphylococcus aureus","Streptococcus pyogenes (Group A Strep)","Pseudomonas aeruginosa","E. coli"]', 1, 'Group A Strep is the most common cause of non-purulent cellulitis. S. aureus is more common in purulent cases (abscesses).'),
        (v_case_id, 'What is the best initial management for this patient?', '["Wait for blood cultures before starting antibiotics","Empiric oral antibiotics (e.g., Cephalexin or Dicloxacillin)","Topical Mupirocin","Incision and drainage"]', 1, 'Non-purulent cellulitis is treated with empiric antibiotics targeting Gram-positive cocci.'),
        (v_case_id, 'What is the most important step to prevent recurrence in this patient?', '["Daily bleach baths","Treatment of the tinea pedis (cracks between toes) as it serves as a portal of entry","Compression stockings during the acute phase","None"]', 1, 'Identifying and treating the ''portal of entry'' is a key Step 2 management point.');

    ---------------------------------------------------------------------------
    -- CASE 08: The Flaccid Blisters
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Flaccid Blisters', 'A 50-year-old male presents with painful sores in his mouth followed by fragile blisters on his chest and back that ''pop'' easily.

Vitals: Normal.
Physical Examination: Eroded plaques on the oral mucosa. Flaccid bullae on the trunk; when the skin near a blister is rubbed, the top layer slides off (positive Nikolsky sign).
Laboratory Results: Skin biopsy shows intraepidermal acantholysis. Direct Immunofluorescence (DIF) shows a ''fishnet'' pattern of IgG.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary target of autoantibodies in Pemphigus Vulgaris?', '["Hemidesmosomes","Desmoglein 1 and 3 (Desmosomes)","Type IV Collagen","Basement membrane"]', 1, 'Loss of desmosome-mediated adhesion leads to intraepidermal cleavage (acantholysis).'),
        (v_case_id, 'What is the first-line treatment for this condition?', '["Topical steroids only","Systemic high-dose corticosteroids (e.g., Prednisone) and immunosuppressants","IV Antibiotics","Plasmapheresis as first-line"]', 1, 'Pemphigus is potentially fatal and requires systemic immunosuppression.'),
        (v_case_id, 'How does Bullous Pemphigoid differ clinically and pathologically from Pemphigus Vulgaris?', '["BP has flaccid blisters and is Nikolsky positive","BP has tense blisters, is Nikolsky negative, and shows subepidermal cleavage","BP always involves the mouth","BP is more dangerous"]', 1, 'Bullous Pemphigoid involves hemidesmosomes, creating deeper, more stable (tense) blisters.');

    ---------------------------------------------------------------------------
    -- CASE 09: The Silver Scales on the Elbows
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Silver Scales on the Elbows', 'A 30-year-old male presents with thick, red, scaly patches on his elbows and knees that sometimes bleed when the scale is removed.

Vitals: Normal.
Physical Examination: Well-demarcated erythematous plaques with silvery-white scale (micaceous scale). Punctate bleeding is seen when a scale is lifted (Auspitz sign). Nail pitting is also present.
Laboratory Results: None.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Initial'' treatment for localized plaque psoriasis?', '["Oral Methotrexate","High-potency topical corticosteroids (e.g., Clobetasol)","UVB phototherapy","Oral Prednisone"]', 1, 'Topical steroids are first-line for limited disease (<10% BSA).'),
        (v_case_id, 'Why should systemic (oral) corticosteroids be avoided in the treatment of psoriasis?', '["They don''t work","Risk of triggering life-threatening Erythrodermic or Pustular Psoriasis upon withdrawal","They cause weight gain","None of the above"]', 1, 'This is a major ''Don''t Do'' in the management of psoriasis.'),
        (v_case_id, 'The patient complains of morning stiffness in his fingers that lasts for an hour. What is the most likely association?', '["Osteoarthritis","Psoriatic Arthritis","Gout","Lupus"]', 1, 'Psoriatic arthritis occurs in up to 30% of patients with skin psoriasis.');

    ---------------------------------------------------------------------------
    -- CASE 10: The Sudden Hair Patch
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden Hair Patch', 'A 22-year-old female presents with a sudden ''bald spot'' on her head that appeared over the last week. She has no pain or itching.

Vitals: Normal.
Physical Examination: A well-circumscribed, 2-cm smooth patch of complete hair loss on the scalp. Short, ''exclamation point'' hairs are seen at the periphery. The scalp looks normal (no scale or inflammation).
Laboratory Results: None.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most likely underlying mechanism for this condition?', '["Fungal infection","Autoimmune destruction of the hair follicle","Stress-induced shedding","Genetic balding"]', 1, 'Alopecia areata is a T-cell mediated autoimmune disease.'),
        (v_case_id, 'What is the first-line treatment for localized alopecia areata?', '["Minoxidil","Intralesional corticosteroid injections (e.g., Triamcinolone)","Oral Griseofulvin","Wig fitting"]', 1, 'Injections are highly effective for small patches, bypassing the skin barrier.'),
        (v_case_id, 'What is the name for complete loss of all scalp hair?', '["Alopecia totalis","Alopecia universalis","Telogen effluvium","Traction alopecia"]', 0, 'Alopecia totalis = whole scalp; Alopecia universalis = whole body hair.');

    ---------------------------------------------------------------------------
    -- CASE 11: The Weeping Face in the Toddler
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Weeping Face in the Toddler', 'An 18-month-old child presents with an intensely itchy rash on his cheeks and the folds of his elbows. He has a history of asthma.

Vitals: Normal.
Physical Examination: Erythematous, poorly demarcated, weeping plaques with crusting on the face. Lichenification (thickening) is seen in the antecubital and popliteal fossae.
Laboratory Results: None.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Foundation'' of long-term management for atopic dermatitis?', '["Topical steroids","Frequent use of thick emollients (moisturizers) to restore the skin barrier","Daily swimming","Antibiotics"]', 1, 'Maintaining skin hydration and barrier function is critical to reduce flares.'),
        (v_case_id, 'For acute flares of dermatitis, what is the best initial treatment?', '["Oral Prednisone","Topical corticosteroids (matching potency to the body site)","Topical antifungal","Oral Antihistamines as primary treatment"]', 1, 'Low-potency steroids are used for the face/skin folds; higher potency for the body.'),
        (v_case_id, 'If the child develops a sudden eruption of painful, ''punched-out'' erosions on top of the eczema, what should you suspect?', '["Bacterial superinfection","Eczema Herpeticum (HSV infection)","SJS","Molluscum"]', 1, 'Eczema herpeticum is a dermatologic emergency requiring prompt acyclovir.');

    ---------------------------------------------------------------------------
    -- CASE 12: The Golden Crust
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Golden Crust', 'A 5-year-old boy presents with ''sores'' around his nose and mouth that began as small blisters and have now turned into ''honey-colored'' crusts.

Vitals: Normal.
Physical Examination: Multiple erythematous erosions with adherent golden-yellow crusts on the perioral area. No fever.
Laboratory Results: Gram stain shows Gram-positive cocci in clusters.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best initial treatment for localized impetigo (a few lesions)?', '["Topical Mupirocin ointment","Oral Cephalexin","Topical steroids","Soap and water only"]', 0, 'Topical mupirocin is sufficient for limited, non-bullous impetigo.'),
        (v_case_id, 'Which organism is the most common cause of both bullous and non-bullous impetigo?', '["Streptococcus pyogenes","Staphylococcus aureus","Pseudomonas","MRSA only"]', 1, 'S. aureus is now the most frequent isolate.'),
        (v_case_id, 'What is a potential ''Nonsuppurative'' complication of impetigo caused by Group A Strep?', '["Acute Rheumatic Fever","Post-streptococcal Glomerulonephritis (PSGN)","Sepsis","Meningitis"]', 1, 'PSGN can follow strep skin infections, but Rheumatic Fever generally only follows strep pharyngitis.');

    ---------------------------------------------------------------------------
    -- CASE 13: The Painful Rash and the ''Crops'' of Blisters
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Rash and the ''Crops'' of Blisters', 'A 65-year-old male presents with burning pain followed by a rash on one side of his chest.

Vitals: Normal.
Physical Examination: Clusters of vesicles on an erythematous base in a dermatomal distribution (T4) on the right side. The rash does not cross the midline.
Laboratory Results: Tzanck smear shows multinucleated giant cells.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best initial treatment to reduce the duration of symptoms and the risk of Post-herpetic Neuralgia (PHN)?', '["Topical Acyclovir","Oral Valacyclovir or Famciclovir within 72 hours of onset","Oral Prednisone alone","Pain medication only"]', 1, 'Early antiviral therapy is the standard of care.'),
        (v_case_id, 'If the patient develops a vesicle on the tip of his nose (Hutchinson sign), what is the next step?', '["Topical Bacitracin","Urgent Ophthalmology consultation (risk of Zoster Ophthalmicus)","Add oral steroids","Ignore it"]', 1, 'V1 involvement can lead to keratitis and permanent vision loss.'),
        (v_case_id, 'Which vaccine is recommended for adults >= 50 years to prevent this condition?', '["MMR","Recombinant Zoster Vaccine (Shingrix)","Pneumococcal vaccine","None"]', 1, 'Shingrix is a highly effective 2-dose series for older adults.');

    ---------------------------------------------------------------------------
    -- CASE 14: The Itchy Welts
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Welts', 'A 30-year-old woman presents with itchy ''hives'' that appear and disappear within a few hours. This has been happening daily for 2 months.

Vitals: Normal.
Physical Examination: Multiple edematous, erythematous plaques (wheals) on the trunk and limbs. No individual lesion lasts more than 24 hours.
Laboratory Results: None.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the first-line treatment for chronic urticaria?', '["Oral Prednisone","Second-generation H1 antihistamines (e.g., Cetirizine, Loratadine) at standard or high doses","Skin biopsy","Strict diet"]', 1, 'Non-sedating antihistamines are the foundation of therapy. Prednisone is avoided for chronic management.'),
        (v_case_id, 'If a single lesion lasts more than 24 hours and leaves a bruise (purpura) when it resolves, what should you suspect?', '["Simple allergy","Urticarial Vasculitis (requires biopsy)","SJS","Spider bite"]', 1, 'This ''red flag'' distinguishes vasculitis from simple urticaria.'),
        (v_case_id, 'Is extensive allergy testing (RAST/Skin tests) usually helpful for CHRONIC (>6 weeks) urticaria?', '["Yes, always","No, an external trigger is rarely found in chronic spontaneous urticaria","Only in children","None"]', 1, 'Extensive workups are generally low-yield and not recommended unless specific triggers are suggested by history.');

    ---------------------------------------------------------------------------
    -- CASE 15: The Shiny Pink Patch and the Sun
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Shiny Pink Patch and the Sun', 'A 70-year-old male presents with a ''pimple'' on his nose that has been bleeding occasionally and hasn''t healed for 4 months.

Vitals: Normal.
Physical Examination: A pearly, pink papule with a ''rolled'' border and visible small blood vessels (telangiectasias). Central ulceration is present.
Laboratory Results: Biopsy shows nests of basaloid cells with peripheral palisading.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the treatment of choice for a high-risk BCC located on the ''H-zone'' of the face (nose, eyes, lips)?', '["Cryotherapy (freezing)","Mohs Micrographic Surgery","Topical 5-FU","Simple excision with 1 cm margins"]', 1, 'Mohs surgery allows for the highest cure rate and maximum tissue sparing in cosmetically sensitive/high-risk areas.'),
        (v_case_id, 'Does BCC have a high risk of distant metastasis?', '["Yes","No, it is locally invasive but almost never metastasizes","Only if it is red","None"]', 1, 'BCC''s danger lies in its local destruction of skin, muscle, and bone.'),
        (v_case_id, 'What is the primary risk factor for developing BCC?', '["Smoking","Chronic UV radiation (sun exposure)","Arsenic","Viruses"]', 1, 'Sun protection is the most important preventive measure.');

    ---------------------------------------------------------------------------
    -- CASE 16: The Scaly Patch that Won''t Go Away
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scaly Patch that Won''t Go Away', 'A 65-year-old fair-skinned male has a 1-cm, red, scaly, and crusty patch on his lower lip that sometimes feels ''gritty'' like sandpaper.

Vitals: Normal.
Physical Examination: A firm, erythematous, scaly plaque on the vermilion border of the lower lip. No palpable lymphadenopathy.
Laboratory Results: Biopsy shows full-thickness atypia of keratinocytes and invasion into the dermis.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the precursor lesion to SCC called?', '["Seborrheic keratosis","Actinic keratosis","Molluscum","Dermatofibroma"]', 1, 'Actinic keratoses (AKs) are ''pre-cancers'' that can progress to SCC.'),
        (v_case_id, 'SCCs on the lip or ear have a higher risk of which complication compared to those on the trunk?', '["Metastasis","Bleeding","Infection","Healing faster"]', 0, 'Lip and ear lesions are considered high-risk sites for SCC metastasis.'),
        (v_case_id, 'If a patient has many scattered actinic keratoses (''field cancerization''), what is a good treatment option?', '["Individual cryotherapy for each","Field therapy (e.g., Topical 5-Fluorouracil or Imiquimod)","Oral chemotherapy","None"]', 1, 'Field therapy treats both visible and subclinical AKs.');

    ---------------------------------------------------------------------------
    -- CASE 17: The Itchy Ring
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Ring', 'A 20-year-old wrestler presents with a red, ''ring-shaped'' rash on his arm that has been expanding.

Vitals: Normal.
Physical Examination: An annular erythematous plaque with a scaly, active border and central clearing.
Laboratory Results: KOH prep from the scaly edge shows branching, septate hyphae.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the first-line treatment for localized tinea corporis?', '["Oral Griseofulvin","Topical antifungals (e.g., Clotrimazole, Terbinafine cream)","Topical Nystatin","Topical Steroids"]', 1, 'Unlike tinea capitis, tinea corporis usually responds well to topical therapy.'),
        (v_case_id, 'Why should Nystatin be avoided in the treatment of Tinea (dermatophytes)?', '["It''s too expensive","Nystatin only works for Candida, not dermatophytes (Tinea)","It''s too strong","None"]', 1, 'This is a frequent ''distractor'' on Step exams.'),
        (v_case_id, 'What is the term for a tinea infection that has been worsened/altered by the use of topical steroids?', '["Tinea incognito","Tinea capitis","Majocchi granuloma","None"]', 0, 'Steroids suppress the inflammation but allow the fungus to thrive and spread deeper.');

    ---------------------------------------------------------------------------
    -- CASE 18: The Painful Armpit Bumps
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Armpit Bumps', 'A 24-year-old obese female presents with recurrent, painful ''boils'' in her armpits that leave scars.

Vitals: Normal.
Physical Examination: Multiple inflammatory nodules, abscesses, and ''double-headed'' comedones in the axillae. Sinus tracts and ''bridge'' scars are present.
Laboratory Results: None.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary management strategy for HS?', '["Repeat incision and drainage of every lesion","Weight loss, smoking cessation, and step-wise therapy (Topical clindamycin -> Oral tetracyclines -> Biologics/Surgery)","Continuous high-dose oral steroids","Long-term IV antibiotics"]', 1, 'HS is a chronic inflammatory condition, not a simple recurrent infection.'),
        (v_case_id, 'What is the Hurley Staging system used for?', '["Acne severity","Categorizing the severity of HS (Stage I: no tracts; II: limited tracts; III: diffuse involvement/interconnected tracts)","Melanoma depth","None"]', 1, 'Management depends heavily on the Hurley stage.'),
        (v_case_id, 'Which biologic agent is FDA-approved for moderate-to-severe HS?', '["Rituximab","Adalimumab (Anti-TNF)","Infliximab","None"]', 1, 'TNF-alpha inhibitors have shown efficacy in severe HS cases.');

    ---------------------------------------------------------------------------
    -- CASE 19: The Mouth Patches in the Newborn
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Mouth Patches in the Newborn', 'A 2-week-old infant presents with white patches in his mouth. He is breastfeeding well but his mother has ''nipple pain''.

Vitals: Normal.
Physical Examination: Adherent white plaques on the buccal mucosa and tongue that bleed slightly when scraped off with a tongue depressor.
Laboratory Results: KOH shows budding yeast and pseudohyphae.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best initial treatment for an infant with oral thrush?', '["Oral Nystatin suspension","Oral Griseofulvin","Topical Mupirocin","IV Fluconazole"]', 0, 'Nystatin ''swish and swallow'' is the standard first-line for infantile thrush.'),
        (v_case_id, 'Should the mother also be evaluated and treated?', '["No, it''s not related","Yes, the mother''s nipples should be treated with topical antifungal to prevent a cycle of reinfection","Only if she has a fever","None"]', 1, 'Candida can be passed back and forth between the infant''s mouth and the mother''s nipple.'),
        (v_case_id, 'In an adult, what condition should recurrent or refractory oral thrush prompt evaluation for?', '["Diabetes","HIV infection","Immunosuppressive medication use","All of the above"]', 3, 'Thrush in a healthy-appearing adult is a major red flag for immune dysfunction.');

    ---------------------------------------------------------------------------
    -- CASE 20: The Sudden Wide Rash (Drug?)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden Wide Rash (Drug?)', 'A patient develops a red, symmetric rash on his trunk 5 days after starting a new medication for a sinus infection.

Vitals: Normal (no fever).
Physical Examination: Bright red macules and papules that are beginning to coalesce. No mucosal involvement. No skin tenderness or blisters.
Laboratory Results: Normal.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most likely ''latency'' for this type of common drug rash?', '["30 minutes","7-14 days after starting the drug (can be shorter on re-exposure)","1 year","None"]', 1, 'This is a delayed Type IV hypersensitivity reaction.'),
        (v_case_id, 'What is the first step in management?', '["Biopsy","Discontinue the suspected drug","Start Prednisone","Give IVIG"]', 1, 'The most important management step for any suspected drug eruption is stopping the culprit.'),
        (v_case_id, 'Which symptom would be a ''Red Flag'' suggesting a more severe reaction like SJS or DRESS?', '["Itching","Fever, facial edema, or skin tenderness","Slight redness","None"]', 1, 'Systemic symptoms and skin pain distinguish simple rashes from life-threatening ones.');

    ---------------------------------------------------------------------------
    -- CASE 21: The Christmas Tree Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Christmas Tree Rash', 'A 20-year-old female presents with a single, large, scaly red patch on her back, followed 1 week later by many smaller patches on her trunk.

Vitals: Normal.
Physical Examination: One 4-cm oval plaque with a ''collarette'' of scale (Herald Patch). Dozens of smaller oval plaques follow the skin tension lines in a ''Christmas tree'' distribution on the back.
Laboratory Results: RPR is negative.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the standard management for Pityriasis Rosea?', '["Oral Antifungals","Reassurance and supportive care for itching (it usually resolves spontaneously in 6-8 weeks)","Oral Steroids","Topical Antibiotics"]', 1, 'PR is a self-limited condition of suspected viral origin.'),
        (v_case_id, 'Why is an RPR often performed in cases that look like Pityriasis Rosea?', '["PR is caused by syphilis","Secondary syphilis can perfectly mimic the rash of PR (including the distribution on the trunk)","To check for pregnancy","None"]', 1, 'This is a classic ''must-rule-out'' on Step exams.'),
        (v_case_id, 'The Herald Patch is often misdiagnosed as which condition?', '["Eczema","Tinea Corporis (Ringworm)","Psoriasis","Acne"]', 1, 'Because of its annular, scaly appearance, it is frequently mistaken for fungus.');

    ---------------------------------------------------------------------------
    -- CASE 22: The Flushed Face and the Alcohol
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Flushed Face and the Alcohol', 'A 45-year-old female presents with ''flushing'' episodes. She notices her face gets very red and hot after she drinks a glass of red wine or eats spicy food.

Vitals: Normal.
Physical Examination: Central facial erythema and telangiectasias. No papules or pustules. A few small, red ''bumps'' are noted on the conjunctiva.
Laboratory Results: None.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the first-line management for the erythema (redness) of rosacea?', '["Topical steroids","Trigger avoidance and sun protection; consider topical brimonidine or laser therapy for persistent redness","Oral antibiotics","Oral Isotretinoin"]', 1, 'Steroids are avoided as they can cause ''steroid-induced rosacea''.'),
        (v_case_id, 'Which of the following is a common trigger for rosacea flushing?', '["Cold water","Sunlight, heat, alcohol, and spicy foods","Green vegetables","Reading"]', 1, 'These are the classic ''Step'' triggers.'),
        (v_case_id, 'Chronic rosacea can lead to irreversible skin thickening on the nose, called:', '["Rhinophyma","Rosacea totalis","Nasal warts","None"]', 0, 'Rhinophyma is more common in men and may require surgical intervention.');

    ---------------------------------------------------------------------------
    -- CASE 23: The Warty Bumps and the Pool
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Warty Bumps and the Pool', 'A 7-year-old boy presents with dozens of small, ''shiny'' bumps on his trunk and arms. He is on a local swim team.

Vitals: Normal.
Physical Examination: 2-5 mm skin-colored, firm, dome-shaped papules with a central dimple (umbilication).
Laboratory Results: None.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the cause of Molluscum Contagiosum?', '["HPV","Poxvirus","Herpes virus","Bacteria"]', 1, 'It is a highly contagious poxvirus infection.'),
        (v_case_id, 'In an immunocompetent child, what is the best initial management approach?', '["Aggressive cryotherapy","Observation (it typically resolves spontaneously over months to years)","Oral Acyclovir","Topical Steroids"]', 1, 'While treatment (curettage, cryo) is an option, watchful waiting is often preferred in children to avoid pain/scarring.'),
        (v_case_id, 'Extensive, giant, or refractory molluscum in an adult should prompt testing for:', '["Diabetes","HIV","Liver failure","Vitamin deficiency"]', 1, 'Widespread molluscum in an adult is a strong indicator of cellular immunodeficiency.');

    ---------------------------------------------------------------------------
    -- CASE 24: The Painful Mouth and the Tense Blister
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Mouth and the Tense Blister', 'An 80-year-old male presents with widespread, very itchy, large blisters on his thighs and abdomen.

Vitals: Normal.
Physical Examination: Multiple large, tense bullae on an erythematous base. Nikolsky sign is negative. The mouth is unaffected.
Laboratory Results: DIF shows a linear band of IgG and C3 along the basement membrane.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the target of autoantibodies in Bullous Pemphigoid?', '["Desmosomes","Hemidesmosomes (BP180 and BP230)","Type IV Collagen","Basal cells"]', 1, 'BP involves the ''anchor'' of the basal layer to the basement membrane.'),
        (v_case_id, 'How is localized or mild Bullous Pemphigoid typically treated?', '["Systemic chemotherapy","High-potency topical corticosteroids (can be as effective as oral with fewer side effects)","IV Antibiotics","Observation only"]', 1, 'Recent studies favor high-potency topicals over systemic steroids for BP, especially in the elderly.'),
        (v_case_id, 'What is a common PRODROMAL symptom of Bullous Pemphigoid that can precede blisters by months?', '["Fever","Intense generalized itching (pruritus) or urticarial-like plaques","Mouth sores","None"]', 1, 'Elderly patients with ''refractory itch'' should be monitored for BP.');

    ---------------------------------------------------------------------------
    -- CASE 25: The Scaly Scalp and the Red Face
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scaly Scalp and the Red Face', 'A 35-year-old male presents with ''dandruff'' and red, itchy skin in his eyebrows and around his nose.

Vitals: Normal.
Physical Examination: Erythema and ''greasy'' yellow scale on the scalp, eyebrows, nasolabial folds, and chest.
Laboratory Results: None.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which organism is thought to play a role in the pathogenesis of seborrheic dermatitis?', '["Staphylococcus","Malassezia (yeast)","Candida","Dermatophytes"]', 1, 'The yeast triggers an inflammatory response in areas with high sebum production.'),
        (v_case_id, 'What is the best initial treatment for the face and scalp?', '["Topical Metronidazole","Topical antifungals (e.g., Ketoconazole shampoo/cream) and mild topical steroids","Oral Terbinafine","Daily face scrubbing with alcohol"]', 1, 'A combination of antifungal (to reduce Malassezia) and anti-inflammatory (steroid) is most effective.'),
        (v_case_id, 'Severe or ''explosive'' onset of seborrheic dermatitis can be an early sign of which systemic infection?', '["Hepatitis B","HIV","Syphilis","Tuberculosis"]', 1, 'Seborrheic dermatitis is famously more severe and widespread in HIV-positive patients.');

    ---------------------------------------------------------------------------
    -- CASE 26: The Rapidly Growing ''Nodule'' on the Leg
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rapidly Growing ''Nodule'' on the Leg', 'A 60-year-old male presents with a painful, firm red nodule on his shin that has grown to 2 cm in just 6 weeks.

Vitals: Normal.
Physical Examination: A dome-shaped, firm, erythematous nodule with a central ''keratinous plug'' (crater-like center).
Laboratory Results: Biopsy shows well-differentiated squamous epithelium.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the characteristic clinical behavior of a Keratoacanthoma?', '["Slowly progressive growth over years","Rapid initial growth over weeks followed by potential spontaneous regression","Never regresses","Metastasizes early"]', 1, 'KAs are known for their ''volcano-like'' rapid growth and potential to disappear, but they are often treated as SCCs.'),
        (v_case_id, 'How should a Keratoacanthoma be managed in clinical practice?', '["Observation to see if it regresses","Complete surgical excision (similar to Squamous Cell Carcinoma)","Cryotherapy only","Topical antibiotics"]', 1, 'Since it is histologically difficult to distinguish KA from a well-differentiated SCC, the standard management is excision.'),
        (v_case_id, 'Which of the following is the most likely risk factor for KA?', '["Smoking","UV radiation and chemical carcinogens","Viruses","Low fiber diet"]', 1, 'Sun exposure is the primary driver.');

    ---------------------------------------------------------------------------
    -- CASE 27: The Itchy Patient with Weight Loss
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Patient with Weight Loss', 'A 70-year-old male presents with generalized itching (pruritus) that has kept him awake at night for 3 months. He has no visible rash. He has also lost 10 lbs.

Vitals: Normal.
Physical Examination: Normal, except for multiple scratch marks (excoriations) on the back and limbs.
Laboratory Results: Hemoglobin 10.0 (Low), Ferritin 8 (Low). Chest X-ray is normal.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'When a patient presents with generalized pruritus WITHOUT a primary skin rash, what is the best initial approach?', '["Start topical steroids","Perform a thorough systemic workup (CBC, BMP, LFTs, TSH, Chest X-ray, and Iron studies)","Assume it''s dry skin and give moisturizers","Biopsy the normal skin"]', 1, 'Generalized pruritus without rash is a ''systemic itch'' and requires evaluation for renal, hepatic, endocrine, or hematologic disease.'),
        (v_case_id, 'The patient''s low iron (iron deficiency anemia) is most commonly associated with which malignancy in an older male?', '["Lung cancer","Colorectal cancer (Gastrointestinal blood loss)","Leukemia","Skin cancer"]', 1, 'Iron deficiency in an older adult is ''colon cancer until proven otherwise''.'),
        (v_case_id, 'Which systemic condition is notoriously associated with ''aquagenic pruritus'' (itching after a hot shower)?', '["Diabetes","Polycythemia Vera","Hypothyroidism","Lupus"]', 1, 'This is a classic USMLE Step 2 ''buzzword'' association.');

    ---------------------------------------------------------------------------
    -- CASE 28: The Purpuric Patient
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Purpuric Patient', 'A 40-year-old woman presents with many small ''purple dots'' on her lower legs. She was recently treated for a sore throat.

Vitals: Normal.
Physical Examination: Multiple 2-4 mm palpable purpura on the bilateral shins and ankles. Abdominal exam is normal.
Laboratory Results: UA shows 2+ blood and 1+ protein. Platelet count is normal.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Initial Test'' to confirm the diagnosis of small-vessel vasculitis?', '["Blood cultures","Skin biopsy (Punch biopsy)","ANA","Chest X-ray"]', 1, 'A skin biopsy is required to see the characteristic neutrophilic inflammation of the vessel walls (LCV).'),
        (v_case_id, 'Given the urine findings (hematuria/proteinuria), what is the most important next step?', '["More skin biopsies","Evaluation for systemic involvement (Renal workup with Cr and potentially a renal biopsy)","Check for vitamin deficiency","Stop all salt intake"]', 1, 'Purpura + Hematuria suggests a systemic vasculitis affecting both skin and kidneys.'),
        (v_case_id, 'Which type of vasculitis is most associated with Hepatitis C infection?', '["GPA","Mixed Cryoglobulinemia","HSP","Kawasaki"]', 1, 'Cryoglobulinemic vasculitis often presents with purpura and is strongly linked to chronic Hep C.');

    ---------------------------------------------------------------------------
    -- CASE 29: The Sudden Facial Pain and Blisters
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden Facial Pain and Blisters', 'A 70-year-old male with a history of lymphoma presents with a very painful rash on his forehead that involves the tip of his nose.

Vitals: Normal.
Physical Examination: Clusters of vesicles and crusts in the V1 distribution. A prominent vesicle is seen on the tip of the nose (Hutchinson sign).
Laboratory Results: None.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the significance of the Hutchinson sign (vesicle on the nose tip)?', '["It means the rash is healing","It indicates involvement of the nasociliary nerve, which also supplies the eye","It is caused by a different virus","None"]', 1, 'The nasociliary nerve is a branch of V1; its involvement highly correlates with ocular zoster.'),
        (v_case_id, 'What is the most important immediate step in management?', '["Start oral Valacyclovir","Urgent slit-lamp examination by an ophthalmologist","Topical steroids to the eye","Wait for the rash to crust over"]', 1, 'Identifying early keratitis or uveitis is critical to prevent permanent vision loss.'),
        (v_case_id, 'Which medication should be AVOIDED for the eye unless directed by an ophthalmologist?', '["Artificial tears","Topical corticosteroids (can worsen HSV/VZV keratitis if not monitored)","Topical antibiotics","None"]', 1, 'Indiscriminate use of topical steroids in the eye can be dangerous.');

    ---------------------------------------------------------------------------
    -- CASE 30: The Red Eyes and the Skin Pain
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Red Eyes and the Skin Pain', 'A patient presents with a severe rash and ''skin pain'' 2 weeks after starting Carbamazepine. She also has a fever and mouth sores.

Vitals: T 38.8 C, BP 90/60 mmHg.
Physical Examination: Dusky, erythematous macules that are beginning to slough. The lips are severely eroded with bleeding. Nikolsky sign is positive. Approximately 15% of the body surface area (BSA) is involved.
Laboratory Results: None.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most critical first step in management?', '["Give high-dose steroids","Identify and immediately discontinue the suspected offending drug (Carbamazepine)","Wait for a biopsy result","Give IVIG"]', 1, 'Prompt withdrawal of the culprit drug is the single most important factor in survival.'),
        (v_case_id, 'Where should this patient be ideally managed?', '["General medical floor","Intensive Care Unit or Burn Unit","Home with follow-up","Outpatient dermatology clinic"]', 1, 'SJS/TEN requires specialized care for fluid balance, wound management, and infection control, similar to large burns.'),
        (v_case_id, 'What is the major long-term complication of SJS/TEN if the eyes are involved?', '["Glaucoma","Ocular scarring, symblepharon, and blindness","Cataracts","None"]', 1, 'Aggressive ophthalmologic care is required to prevent permanent ocular sequelae.');

    ---------------------------------------------------------------------------
    -- CASE 31: The Symmetric Leg Redness (A Trap)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Symmetric Leg Redness (A Trap)', 'A 60-year-old male with chronic heart failure presents with redness, warmth, and swelling of both lower legs. He has been told he has ''recurrent cellulitis'' that never goes away with antibiotics.

Vitals: Normal.
Physical Examination: Bilateral, symmetric erythema and ''woody'' induration of the lower legs. Pitting edema is present. No fever or elevated WBC.
Laboratory Results: None.', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most likely reason this patient''s ''cellulitis'' is not responding to antibiotics?', '["Resistance to antibiotics","The diagnosis is actually Stasis Dermatitis (due to venous insufficiency), not cellulitis","It is a fungal infection","None"]', 1, 'Cellulitis is almost always unilateral. Bilateral, symmetric redness is a classic ''Step'' trap for stasis dermatitis.'),
        (v_case_id, 'What is the ''Best Next Step'' in management for this patient?', '["Switch to IV antibiotics","Leg elevation and compression stockings","Surgical debridement","Topical antifungals"]', 1, 'Management of the underlying venous hypertension is the primary treatment.'),
        (v_case_id, 'What is the term for the chronic skin changes (thickened, ''inverted champagne bottle'' leg) seen in advanced venous insufficiency?', '["Lipodermatosclerosis","Cellulitis","Erysipelas","Necrotizing fasciitis"]', 0, 'This represents chronic fibrotic changes in the skin and subcutaneous fat.');

    ---------------------------------------------------------------------------
    -- CASE 32: The Itchy Child and the Dog
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Child and the Dog', 'A 10-year-old boy presents with an itchy, scaly rash on his arm. His family recently got a new puppy.

Vitals: Normal.
Physical Examination: An annular erythematous plaque with a scaly, active border on the forearm.
Laboratory Results: KOH prep shows hyphae.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common source of infection in this case?', '["Human-to-human contact","Zoonotic transmission from the new puppy (e.g., Microsporum canis)","Soil","Dirty clothes"]', 1, 'New pets are a frequent source of tinea corporis in children.'),
        (v_case_id, 'What is the best initial treatment?', '["Oral Griseofulvin","Topical Clotrimazole or Terbinafine cream","Topical Nystatin","Topical Betamethasone"]', 1, 'Topical antifungals are first-line for limited tinea corporis.'),
        (v_case_id, 'Should the puppy be evaluated?', '["No, animals don''t get fungus","Yes, the pet should be seen by a veterinarian to prevent reinfection of the family","Only if the dog is scratching","None"]', 1, 'Treating the reservoir is essential for eradication.');

    ---------------------------------------------------------------------------
    -- CASE 33: The Painful Mouth and the Tense Blister (Management)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Mouth and the Tense Blister (Management)', 'An 80-year-old female presents with widespread tense blisters and severe itching. She has multiple comorbidities and is at high risk for infection.

Vitals: Normal.
Physical Examination: Multiple large, tense bullae. Nikolsky negative.
Laboratory Results: Biopsy and DIF confirm Bullous Pemphigoid.', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Given her high risk for systemic side effects, what is a preferred first-line treatment for widespread Bullous Pemphigoid?', '["High-dose oral Prednisone","Whole-body application of high-potency topical corticosteroids (e.g., Clobetasol)","Methotrexate","Observation"]', 1, 'Large-scale trials have shown that topical Clobetasol is as effective as oral Prednisone for BP but with significantly lower mortality and fewer side effects.'),
        (v_case_id, 'What is the primary goal of treatment in this elderly patient?', '["Complete cure with no maintenance","Disease control with the minimum effective dose of immunosuppression","Immediate surgical removal of all blisters","None"]', 1, 'BP is often chronic and requires balanced management to avoid iatrogenic complications.'),
        (v_case_id, 'Which medication can be used as a ''steroid-sparing'' agent in chronic Bullous Pemphigoid?', '["Azathioprine or Mycophenolate mofetil","Penicillin","Acyclovir","None"]', 0, 'Steroid-sparing agents help reduce the long-term burden of corticosteroids.');

    ---------------------------------------------------------------------------
    -- CASE 34: The Rapidly Progressing Painful Leg
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rapidly Progressing Painful Leg', 'A 45-year-old diabetic male presents with severe pain in his right leg that is ''out of proportion'' to the physical exam. He has a high fever and is feeling dizzy.

Vitals: T 39.5 C, BP 85/50, HR 125.
Physical Examination: The skin is dusky-red and warm, but there is noticeable ''crepitus'' (crunching feeling) on palpation. The area is rapidly becoming necrotic.
Laboratory Results: WBC 30,000. CT shows gas in the deep tissue planes.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Next Step'' in the management of suspected necrotizing fasciitis?', '["Start IV antibiotics and wait for response","Immediate surgical consultation for emergent debridement and exploration","MRI of the leg","Biopsy of the skin"]', 1, 'Necrotizing fasciitis is a surgical emergency. Delaying surgery for imaging or antibiotic response increases mortality.'),
        (v_case_id, 'What does ''pain out of proportion to exam'' classically signify in this context?', '["Malingering","Deep tissue involvement and nerve irritation/necrosis beneath the surface","Anxiety","None"]', 1, 'This is a key early clinical warning sign for necrotizing infections.'),
        (v_case_id, 'The presence of crepitus indicates what?', '["Broken bone","Gas-producing organisms (e.g., Clostridium or polymicrobial infection)","Normal finding","None"]', 1, 'Crepitus reflects gas formation in the soft tissues.');

    ---------------------------------------------------------------------------
    -- CASE 35: The Scaly Patch and the HIV Link
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scaly Patch and the HIV Link', 'A 30-year-old male presents with severe ''dandruff'' and a red, scaly rash on his face. He also mentions having recurrent pneumonia.

Vitals: Normal.
Physical Examination: Greasy, yellow scale on the scalp, eyebrows, and nasolabial folds. The rash is unusually widespread, involving the chest and groin.
Laboratory Results: None.', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most appropriate diagnostic step for this patient?', '["Fungal culture of the skin","HIV testing","Skin biopsy","Liver function tests"]', 1, 'Severe, sudden, or refractory seborrheic dermatitis is a classic ''Step 2'' indicator for HIV screening.'),
        (v_case_id, 'What is the first-line treatment for the skin rash?', '["Oral Prednisone","Topical Ketoconazole and low-potency topical steroids","Oral Griseofulvin","None"]', 1, 'Standard treatment for seborrheic dermatitis is still effective, but the underlying immune status must be addressed.'),
        (v_case_id, 'Which other skin condition is commonly seen alongside seborrheic dermatitis in HIV patients?', '["Psoriasis","Oral Hairy Leukoplakia (EBV-related)","Acne","Rosacea"]', 1, 'HIV is associated with a wide range of dermatologic clues.');

    ---------------------------------------------------------------------------
    -- CASE 36: The Suspect Patch on the Leg
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Suspect Patch on the Leg', 'A 60-year-old male presents with a flat, red, scaly patch on his lower leg that has been present for a year and does not respond to moisturizers.

Vitals: Normal.
Physical Examination: A well-demarcated, erythematous scaly plaque. No nodules are felt.
Laboratory Results: Biopsy shows full-thickness keratinocyte atypia without invasion into the dermis.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the diagnosis for SCC that is confined to the epidermis?', '["Actinic Keratosis","Bowen''s Disease (SCC in situ)","Invasive SCC","Basal Cell Carcinoma"]', 1, 'Bowen''s disease is the ''pre-invasive'' form of SCC.'),
        (v_case_id, 'What is the best initial treatment for a single lesion of Bowen''s disease?', '["Topical antibiotics","Surgical excision, Cryotherapy, or Topical 5-Fluorouracil","Chemotherapy","Wait and watch"]', 1, 'There are multiple effective options depending on the site and size.'),
        (v_case_id, 'If the biopsy had shown ''invasion into the dermis'', how would the management change?', '["It wouldn''t","It would require wider margins and evaluation for high-risk features/metastasis","Only topical therapy would be needed","None"]', 1, 'Invasive SCC requires more aggressive management.');

    ---------------------------------------------------------------------------
    -- CASE 37: The Red-Faced Alcoholic
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Red-Faced Alcoholic', 'A 50-year-old male with a history of alcohol use disorder presents with a red, ''swollen'' nose that has become lumpy over time.

Vitals: Normal.
Physical Examination: Marked hypertrophy and irregular thickening of the skin of the nose with prominent pores (Rhinophyma). Central facial erythema and telangiectasias.
Laboratory Results: None.', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Rhinophyma is a subtype of which condition?', '["Acne","Rosacea (Phymatous subtype)","Skin cancer","Infection"]', 1, 'It represents advanced sebaceous gland hyperplasia and fibrosis in rosacea.'),
        (v_case_id, 'Does medical therapy (e.g., Metronidazole) typically reverse rhinophyma?', '["Yes","No, surgical intervention (e.g., CO2 laser or surgical paring) is usually required for cosmetic correction","Only if combined with alcohol","None"]', 1, 'Fibrotic changes do not respond well to medications.'),
        (v_case_id, 'Is rhinophyma caused by alcohol consumption?', '["Yes, exclusively","No, but alcohol can exacerbate the underlying rosacea and flushing","Alcohol prevents it","None"]', 1, 'The ''drinker''s nose'' is a common misconception; alcohol is a trigger, not the cause.');

    ---------------------------------------------------------------------------
    -- CASE 38: The Itchy Groin
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Groin', 'A 20-year-old male presents with an itchy rash in his groin. He has been using over-the-counter Clotrimazole for a week with no improvement.

Vitals: Normal.
Physical Examination: Well-demarcated, reddish-brown patches in the inguinal folds. Under a Wood''s lamp, the area shows a ''coral-red'' fluorescence.
Laboratory Results: KOH prep is negative for hyphae.', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the causative organism of Erythrasma?', '["Trichophyton rubrum (Fungus)","Corynebacterium minutissimum (Bacterium)","Candida albicans","Staphylococcus aureus"]', 1, 'Erythrasma is a superficial bacterial infection, which explains why it doesn''t respond to antifungals.'),
        (v_case_id, 'The ''coral-red'' fluorescence is due to the production of what by the bacteria?', '["Pus","Porphyrins","Chlorophyll","None"]', 1, 'The bacteria produce porphyrins that fluoresce under UVA light.'),
        (v_case_id, 'What is the best initial treatment for Erythrasma?', '["Topical Clotrimazole","Topical Erythromycin or Clindamycin","Oral Fluconazole","Topical Steroids"]', 1, 'Topical antibiotics are highly effective.');

    ---------------------------------------------------------------------------
    -- CASE 39: The Scaly Hand and the Foot
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scaly Hand and the Foot', 'A 40-year-old male presents with scaly skin on his left palm and both of his feet. He has had this for years.

Vitals: Normal.
Physical Examination: Diffuse scaling and thickening (hyperkeratosis) of the left palm and the soles of both feet (Two-foot, one-hand syndrome).
Laboratory Results: KOH prep of the scale shows hyphae.', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Two-foot, one-hand syndrome''?', '["A genetic disorder","A classic clinical pattern of dermatophyte infection (Tinea)","A type of eczema","None"]', 1, 'This asymmetric pattern is a high-yield diagnostic clue for fungus.'),
        (v_case_id, 'What is the most common causative organism?', '["Trichophyton rubrum","Candida","Staph aureus","None"]', 0, 'T. rubrum is the leading cause of chronic dermatophytosis.'),
        (v_case_id, 'Which associated condition should be treated to prevent recurrence?', '["Diabetes","Onychomycosis (nail fungus), which often acts as a reservoir","Heart failure","None"]', 1, 'Reservoirs must be cleared to avoid ''re-seeding'' the skin.');

    ---------------------------------------------------------------------------
    -- CASE 40: The Sudden Loss of All Hair
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden Loss of All Hair', 'A 25-year-old male with a history of Hashimoto thyroiditis presents with complete loss of all hair on his scalp, eyebrows, and eyelashes over 3 months.

Vitals: Normal.
Physical Examination: Total absence of hair on the scalp and face. The skin is smooth and non-inflammatory.
Laboratory Results: TSH is slightly elevated.', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How is this condition classified?', '["Alopecia Areata","Alopecia Totalis (Scalp only)","Alopecia Universalis (Total body hair loss)","Telogen Effluvium"]', 2, 'This is the most severe end of the alopecia areata spectrum.'),
        (v_case_id, 'What is the first-line treatment for such extensive hair loss?', '["Topical Minoxidil","Systemic therapy (e.g., JAK inhibitors, high-dose steroids, or contact immunotherapy) as topicals/injections are usually impractical","Antibiotics","None"]', 1, 'Widespread disease requires systemic approaches. JAK inhibitors have recently shown significant efficacy.'),
        (v_case_id, 'Is there a chance for hair regrowth?', '["Yes, but the prognosis is generally poor for alopecia universalis compared to patchy disease","No, it is permanent","Only if the thyroid is treated","None"]', 0, 'While regrowth can occur, universalis has high recurrence rates and is difficult to treat.');

    ---------------------------------------------------------------------------
    -- CASE 41: The Itchy Shins and the ''Dry Riverbed''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Shins and the ''Dry Riverbed''', 'An 80-year-old male presents with intense itching on his shins during the winter. He showers twice a day with hot water and soap.

Vitals: Normal.
Physical Examination: The skin on his shins looks dry, cracked, and resembles a ''dried-up riverbed'' or ''cracked porcelain''.
Laboratory Results: None.', 41)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary cause of Asteatotic Eczema?', '["Allergy","Loss of water/lipids from the stratum corneum (dry skin), often exacerbated by low humidity and over-washing","Fungal infection","None"]', 1, 'It is essentially ''extreme dry skin'' that becomes inflamed.'),
        (v_case_id, 'What is the best initial management step?', '["Topical antibiotics","Reduce bathing frequency, use lukewarm water, and apply thick emollients immediately after drying","Oral steroids","Scrubbing the dry skin off"]', 1, 'Lifestyle changes and aggressive moisturization are the pillars of therapy.'),
        (v_case_id, 'Which medication should be used sparingly if the skin is inflamed?', '["Emollients","Low-to-medium potency topical corticosteroids","Sunscreen","None"]', 1, 'Steroids help with the itch but should be tapered once the barrier is restored.');

    ---------------------------------------------------------------------------
    -- CASE 42: The Painful Tongue and the Weight Loss
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Tongue and the Weight Loss', 'A 50-year-old chronic alcoholic presents with a smooth, red, ''sore'' tongue and cracks at the corners of his mouth.

Vitals: Normal.
Physical Examination: Glossitis (smooth red tongue) and angular cheilitis (cracks at corners of mouth). He also has a scaly, red rash in his groin.
Laboratory Results: Hemoglobin 11.0 (Macrocytic).', 42)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The combination of glossitis and angular cheilitis is a classic sign of which deficiencies?', '["Vitamin C","B-vitamins (especially B2 Riboflavin, B6 Pyridoxine, or B12)","Vitamin D","None"]', 1, 'Oral and perioral findings are hallmark signs of B-complex deficiencies.'),
        (v_case_id, 'Macrocytic anemia in an alcoholic is most likely due to a deficiency in:', '["Iron","Folate or Vitamin B12","Zinc","None"]', 1, 'Alcohol impairs the absorption and metabolism of these vitamins.'),
        (v_case_id, 'What is the first step in management?', '["Oral steroids","Replacement of the deficient vitamins and dietary improvement","Antibiotics for the mouth","None"]', 1, 'Direct replacement resolves the symptoms.');

    ---------------------------------------------------------------------------
    -- CASE 43: The Itchy Hands and the Career
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Hands and the Career', 'A 30-year-old nurse presents with a red, scaly, and itchy rash on the backs of her hands. It improves over the weekend and worsens at work.

Vitals: Normal.
Physical Examination: Erythema, scaling, and small fissures on the dorsal hands and finger webs.
Laboratory Results: Patch testing shows a positive reaction to nickel and fragrance.', 43)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Gold Standard'' test for diagnosing allergic contact dermatitis?', '["Skin prick test","Patch testing (delayed hypersensitivity)","RAST (blood test)","Biopsy only"]', 1, 'Patch testing evaluates Type IV hypersensitivity reactions.'),
        (v_case_id, 'How does Allergic Contact Dermatitis differ from Irritant Contact Dermatitis?', '["Allergic is more common","Allergic is an immune-mediated (Type IV) reaction; Irritant is a direct chemical/physical injury and does not require prior sensitization","There is no difference","Irritant is only on the face"]', 1, 'Irritant dermatitis (like from frequent handwashing) is much more common than true allergy.'),
        (v_case_id, 'What is the most important long-term management step?', '["Daily topical steroids","Strict avoidance of the identified allergen","Changing careers","None"]', 1, 'Avoidance is the only way to prevent recurrence.');

    ---------------------------------------------------------------------------
    -- CASE 44: The Sudden Wide Rash (Infection?)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden Wide Rash (Infection?)', 'A 5-year-old girl presents with a widespread, fine, red rash that feels like ''sandpaper''. She has a high fever and a sore throat.

Vitals: T 39.2 C.
Physical Examination: Diffuse erythematous rash that blanches. Prominent redness in the skin folds (Pastia lines). Strawberry tongue and bright red tonsils with exudate.
Laboratory Results: Rapid Strep test is positive.', 44)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the cause of the rash in Scarlet Fever?', '["Direct bacterial infection of the skin","Erythrogenic toxin produced by Group A Streptococcus","Allergic reaction to cold","None"]', 1, 'The toxin spreads systemically from the site of pharyngeal infection.'),
        (v_case_id, 'What is the ''sandpaper'' texture characteristic of?', '["Psoriasis","Scarlet Fever","Eczema","Measles"]', 1, 'This is a classic ''Step 2'' descriptor for the scarlatiniform rash.'),
        (v_case_id, 'What is the treatment of choice?', '["Topical steroids","Oral Penicillin or Amoxicillin","Acyclovir","None"]', 1, 'Antibiotics treat the infection and prevent complications like Rheumatic Fever.');

    ---------------------------------------------------------------------------
    -- CASE 45: The Painful Bumps and the ''Target''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Bumps and the ''Target''', 'A 25-year-old male develops a sudden eruption of ''target-like'' lesions on his palms 1 week after having a cold sore on his lip.

Vitals: Normal.
Physical Examination: Multiple erythematous papules with a dusky center and a pale ring (target lesions) on the palms and soles.
Laboratory Results: Tzanck smear from the lip sore showed giant cells.', 45)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common trigger for Erythema Multiforme Minor?', '["Drugs","Herpes Simplex Virus (HSV) infection","Food allergy","None"]', 1, 'HSV is the most frequent trigger for EM Minor.'),
        (v_case_id, 'How does EM Minor differ from SJS?', '["EM Minor has target lesions and minimal/no mucosal involvement or skin sloughing; SJS is a severe drug reaction with extensive mucosal erosions and skin detachment","They are the same","EM is more dangerous","None"]', 0, 'EM is typically a self-limited, immune-mediated reaction to infection.'),
        (v_case_id, 'What is the management for recurrent EM linked to HSV?', '["Topical steroids only","Suppressive oral antiviral therapy (e.g., Acyclovir)","Chemotherapy","None"]', 1, 'Preventing the HSV flares prevents the EM flares.');

    ---------------------------------------------------------------------------
    -- CASE 46: The Scaly Patch in the Swimmer
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scaly Patch in the Swimmer', 'A 12-year-old boy has a white, scaly patch on his cheek that becomes more noticeable in the summer when he tans.

Vitals: Normal.
Physical Examination: A poorly demarcated, hypopigmented, slightly scaly patch on the face. It does not itch or hurt.
Laboratory Results: KOH is negative.', 46)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Pityriasis alba is considered a minor manifestation of which condition?', '["Psoriasis","Atopic Dermatitis (Eczema)","Vitiligo","Tinea"]', 1, 'It is common in children with a history of eczema.'),
        (v_case_id, 'Why does it become ''more noticeable'' in the summer?', '["The rash spreads in the sun","The affected skin fails to tan normally compared to the surrounding healthy skin","It''s an allergy to the sun","None"]', 1, 'Post-inflammatory hypopigmentation becomes apparent when the rest of the skin darkens.'),
        (v_case_id, 'What is the best initial management?', '["Topical antifungals","Sun protection and emollients; sometimes a mild topical steroid if inflamed","Laser therapy","None"]', 1, 'Reassurance and moisturization are usually sufficient as it resolves with time.');

    ---------------------------------------------------------------------------
    -- CASE 47: The Itchy Groin (The Mirror)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Groin (The Mirror)', 'A 35-year-old obese male presents with a very red, ''burning'' rash in his groin. He has a history of poorly controlled diabetes.

Vitals: Normal.
Physical Examination: Bright red ''beefy'' plaques in the skin folds with ''satellite'' pustules at the edges (Mirror lesions).
Laboratory Results: KOH shows pseudohyphae.', 47)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the hallmark clinical finding of Candidal Intertrigo?', '["Target lesions","Beefy red plaques with satellite papules/pustules","Silvery scale","None"]', 1, 'The ''satellite'' lesions are a key differentiator from other types of intertrigo.'),
        (v_case_id, 'What is the best initial treatment?', '["Topical Nystatin or Clotrimazole","Topical Mupirocin","Topical Terbinafine","Topical Steroids only"]', 0, 'Candida is highly sensitive to Nystatin and azole antifungals.'),
        (v_case_id, 'Why is it important to check the blood sugar in this patient?', '["It isn''t","Hyperglycemia promotes the overgrowth of Candida in skin folds","Candida causes diabetes","None"]', 1, 'Controlling the underlying diabetes is key to preventing recurrence.');

    ---------------------------------------------------------------------------
    -- CASE 48: The Waxy Bumps on the Eyelid
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Waxy Bumps on the Eyelid', 'An 80-year-old male presents with several skin-colored, waxy ''craters'' on his lower eyelid. He is worried about cancer.

Vitals: Normal.
Physical Examination: Small, flesh-colored, dome-shaped papules with central umbilication. No bleeding or crusting.
Laboratory Results: None.', 48)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a potential ocular complication of molluscum on the eyelid margin?', '["Glaucoma","Chronic follicular conjunctivitis due to viral shedding into the eye","Cataracts","None"]', 1, 'The virus can irritate the conjunctiva if the lesions are on the lid margin.'),
        (v_case_id, 'How does the management differ from trunk molluscum in children?', '["It doesn''t","Eyelid lesions may require referral for removal to prevent the conjunctivitis mentioned above","Wait and watch always","None"]', 1, 'Clinical symptoms may drive the need for active treatment.'),
        (v_case_id, 'Molluscum on the eyelid in a young adult is another red flag for which condition?', '["Diabetes","HIV","Leukemia","None"]', 1, 'Like giant molluscum, atypical locations can signify immunosuppression.');

    ---------------------------------------------------------------------------
    -- CASE 49: The Rapidly spreading ''Infection'' on the Face
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rapidly spreading ''Infection'' on the Face', 'A 40-year-old woman presents with a bright red, swollen, and painful area on her right cheek that began 12 hours ago. It has a very sharp, raised border.

Vitals: T 38.8 C.
Physical Examination: Well-demarcated, edematous, erythematous plaque on the face. It feels ''indurated'' (hard). Lymphadenopathy is present.
Laboratory Results: WBC 15,000.', 49)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary difference between Erysipelas and Cellulitis?', '["Erysipelas is deeper","Erysipelas involves the superficial dermis and lymphatic system and has a sharp, well-demarcated border; Cellulitis is deeper and has ill-defined borders","Erysipelas is painless","None"]', 1, 'The ''sharp border'' and ''butterfly'' face distribution are classic for erysipelas.'),
        (v_case_id, 'What is the most common causative organism for Erysipelas?', '["Staph aureus","Streptococcus pyogenes (Group A Strep)","Pseudomonas","E. coli"]', 1, 'GAS is the overwhelming cause of this superficial infection.'),
        (v_case_id, 'What is the best initial treatment?', '["Topical Mupirocin","Oral or IV Penicillin (or Cephalosporin)","Incision and drainage","None"]', 1, 'Erysipelas requires systemic antibiotics targeting Strep.');

    ---------------------------------------------------------------------------
    -- CASE 50: The Sudden Loss of All Hair (Management Follow-up)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden Loss of All Hair (Management Follow-up)', 'A patient with Alopecia Universalis fails to respond to topical therapy and steroid injections. He is otherwise healthy.

Vitals: Normal.
Physical Examination: Total body hair loss.
Laboratory Results: None.', 50)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which new class of medication is now FDA-approved for severe alopecia areata/universalis?', '["JAK inhibitors (e.g., Baricitinib)","TNF inhibitors","IL-17 inhibitors","Antibiotics"]', 0, 'JAK inhibitors represent a breakthrough in the treatment of severe, extensive alopecia.'),
        (v_case_id, 'How do JAK inhibitors work in this condition?', '["They kill fungus","They block the signaling pathways used by the T-cells that attack the hair follicle","They increase blood flow","None"]', 1, 'They are targeted immunomodulators.'),
        (v_case_id, 'What is a major counseling point for patients starting JAK inhibitors?', '["They work overnight","They require monitoring for infections (TB, shingles) and laboratory monitoring (CBC/lipids)","They are only for children","None"]', 1, 'Like all systemic immunomodulators, they have specific safety monitoring requirements.');

    ---------------------------------------------------------------------------
    -- CASE 51: The Crusted Patient in the Nursing Home
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Crusted Patient in the Nursing Home', 'An 85-year-old female with advanced dementia in a long-term care facility presents with thick, ''gray-white'' crusts on her hands, feet, and trunk. She does not seem to be itching much.

Vitals: Normal.
Physical Examination: Heavy, hyperkeratotic scaling and crusting, especially in the web spaces and under the nails. Fissuring is present. Thousands of mites are seen on a single skin scraping.
Laboratory Results: None.', 51)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does crusted scabies differ from classic scabies in terms of infectivity?', '["It is less contagious","It is extremely contagious due to the massive burden of mites (millions vs. 10-15 in classic)","It is only spread by pets","None"]', 1, 'A single contact can transmit thousands of mites. Strict isolation is required.'),
        (v_case_id, 'What is the best initial treatment for crusted scabies?', '["Topical Permethrin only","Combined therapy with oral Ivermectin and topical Permethrin (or Sulfur ointment)","Oral Antibiotics","Topical Steroids"]', 1, 'Combination therapy is mandatory for the high mite load in crusted cases.'),
        (v_case_id, 'Why might the patient not be itching despite millions of mites?', '["The mites are dead","Immunosuppression or neurologic impairment prevents the normal hypersensitivity (itch) response","It''s a different species","None"]', 1, 'The lack of itch (anergy) contributes to the delayed diagnosis and massive infestation.');

    ---------------------------------------------------------------------------
    -- CASE 52: The Rose Gardener''''s Bumps
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rose Gardener''''s Bumps', 'A 40-year-old male presents with several red bumps on his right hand and forearm that have been appearing over the last 2 weeks. He is an avid gardener.

Vitals: Normal.
Physical Examination: A series of painless, firm, erythematous nodules following a ''linear'' pattern up the arm (lymphangitic spread). The initial lesion on the finger is slightly ulcerated.
Laboratory Results: Fungal culture shows Sporothrix schenckii.', 52)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic ''buzzword'' clinical pattern seen in this patient?', '["Christmas tree","Nodular lymphangitis (sporotrichoid spread)","Target lesions","None"]', 1, 'Linear spread along lymphatic channels is classic for Sporothrix, but can also be seen in Nocardia or atypical Mycobacteria.'),
        (v_case_id, 'What is the first-line treatment for lymphocutaneous sporotrichosis?', '["Oral Itraconazole for 3-6 months","Oral Penicillin","Topical antifungals","Amphotericin B"]', 0, 'Oral Itraconazole is the standard of care. Potassium iodide (SSKI) is an older alternative.'),
        (v_case_id, 'What was the most likely ''portal of entry'' for this fungus?', '["Inhalation","Traumatic inoculation (e.g., from a rose thorn or contaminated soil)","Ingestion","None"]', 1, 'This is a classic ''Step 2'' occupational history association.');

    ---------------------------------------------------------------------------
    -- CASE 53: The ''Tanned'' Spots that Won''''t Tan
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Tanned'' Spots that Won''''t Tan', 'A 19-year-old male presents with multiple ''white spots'' on his chest and back that appeared after a beach vacation.

Vitals: Normal.
Physical Examination: Multiple small, finely scaly, hypopigmented macules that have coalesced into larger patches. The spots do not tan.
Laboratory Results: KOH prep shows a ''spaghetti and meatballs'' pattern of hyphae and spores.', 53)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the causative organism of Tinea Versicolor?', '["Trichophyton","Malassezia species (yeast)","Candida","None"]', 1, 'Malassezia is a commensal yeast that becomes pathogenic under certain conditions (heat/humidity).'),
        (v_case_id, 'What is the best initial treatment for widespread Tinea Versicolor?', '["Topical Permethrin","Topical Selenium Sulfide or Ketoconazole shampoo (applied as a wash)","Oral Griseofulvin","Oral Terbinafine"]', 1, 'Topical antifungal washes are highly effective and safer than systemic options for this benign condition.'),
        (v_case_id, 'Does the pigment return immediately after the fungus is killed?', '["Yes","No, the hypopigmentation (due to melanocyte inhibition) can take weeks to months to resolve even after successful treatment","Only in the sun","None"]', 1, 'Managing expectations about the ''lingering'' white spots is key to patient satisfaction.');

    ---------------------------------------------------------------------------
    -- CASE 54: The Splotchy Face and the Pregnancy
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Splotchy Face and the Pregnancy', 'A 30-year-old pregnant female (3rd trimester) presents with symmetric brown patches on her cheeks and forehead.

Vitals: Normal.
Physical Examination: Irregular, hyperpigmented, brown macules in a ''mask-like'' distribution on the face (malar and frontal areas).
Laboratory Results: None.', 54)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What are the three most common ''triggers'' for melasma?', '["Cold, diet, exercise","Sunlight (UV), Hormones (Pregnancy/OCPs), and Genetics","Smoking, alcohol, stress","None"]', 1, 'Melasma is often called ''the mask of pregnancy''.'),
        (v_case_id, 'What is the MOST IMPORTANT management step to prevent worsening of melasma?', '["Chemical peels","Strict sun protection (broad-spectrum sunscreen and hats)","Stopping all vitamins","None"]', 1, 'UV radiation is the primary driver of pigment production in melasma.'),
        (v_case_id, 'Will the pigmentation always disappear after delivery?', '["Yes, 100%","It often fades significantly but may persist and require topical therapy (e.g., Hydroquinone)","It gets darker","None"]', 1, 'While it often improves postpartum, it is frequently a chronic, relapsing condition.');

    ---------------------------------------------------------------------------
    -- CASE 55: The ''Dimple'' in the Skin
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Dimple'' in the Skin', 'A 35-year-old female presents with a firm, brown bump on her leg that she noticed after a bug bite a year ago.

Vitals: Normal.
Physical Examination: A firm, 5-mm hyperpigmented nodule on the lower leg. When the skin on either side is pinched, the lesion ''dimples'' inward (positive Fitzpatricks/dimple sign).
Laboratory Results: None.', 55)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does a ''Positive Dimple Sign'' indicate?', '["Malignant Melanoma","Dermatofibroma (benign fibrous nodule)","Skin abscess","Basal Cell Carcinoma"]', 1, 'The dimple sign is highly characteristic of dermatofibroma due to its tethering to the underlying dermis.'),
        (v_case_id, 'What is the best management for an asymptomatic dermatofibroma?', '["Excisional biopsy","Observation and reassurance","Cryotherapy","Topical steroids"]', 1, 'As these are benign and leave larger scars if removed, observation is the preferred approach.'),
        (v_case_id, 'Dermatofibromas are often thought to be reactive to what?', '["Infection","Minor trauma or insect bites","Poor diet","None"]', 1, 'A history of a preceding minor injury is common.');

    ---------------------------------------------------------------------------
    -- CASE 56: The Rapidly Bleeding ''Pimple''
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rapidly Bleeding ''Pimple''', 'A 22-year-old pregnant female presents with a bright red, ''shiny'' bump on her finger that bleeds profusely with even minor contact.

Vitals: Normal.
Physical Examination: A pedunculated, friable, erythematous papule with a ''collarette'' of scale at the base. It is rapidly growing.
Laboratory Results: None.', 56)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the best initial treatment for a pyogenic granuloma?', '["Antibiotics","Surgical excision or shave removal with cautery of the base","Topical steroids","Observation"]', 1, 'Because they bleed easily and don''t resolve on their own, definitive removal is required.'),
        (v_case_id, 'Why is it common in pregnant women?', '["Hormonal influences on vascular proliferation","Low vitamins","Infection","None"]', 0, 'PGs are frequently seen on the gingiva (pregnancy tumors) or skin during pregnancy.'),
        (v_case_id, 'Is a pyogenic granuloma a ''true'' granuloma containing pus?', '["Yes","No, it is a benign vascular proliferation; the name is a misnomer","Only if it is red","None"]', 1, 'It contains neither ''pyo'' (pus) nor ''granuloma'' (the histologic structure).');

    ---------------------------------------------------------------------------
    -- CASE 57: The Itchy Patient and the Purple Bumps (Revisited)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Patient and the Purple Bumps (Revisited)', 'A 45-year-old male with a history of Hepatitis C presents with very itchy, flat-topped purple bumps on his wrists and shins.

Vitals: Normal.
Physical Examination: Polygonal, purple, planar papules (6 P''s). White, lacy lines on the oral mucosa (Wickham striae). He also has ''ridges'' on his nails.
Laboratory Results: None.', 57)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Initial'' treatment for cutaneous lichen planus?', '["Oral Prednisone","High-potency topical corticosteroids","Oral Acyclovir","UVB light"]', 1, 'Topical steroids are first-line for localized LP.'),
        (v_case_id, 'What is the ''Koebner phenomenon'' in the context of Lichen Planus?', '["Fever","Development of new lesions at sites of skin trauma (like scratches)","Itchiness","None"]', 1, 'This is seen in Psoriasis, Lichen Planus, and Vitiligo.'),
        (v_case_id, 'Oral Lichen Planus carries a small increased risk of which malignancy?', '["BCC","Squamous Cell Carcinoma (SCC)","Melanoma","Lymphoma"]', 1, 'Chronic erosive oral LP requires monitoring for SCC.');

    ---------------------------------------------------------------------------
    -- CASE 58: The Fragile Skin in the Elderly
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Fragile Skin in the Elderly', 'An 85-year-old female presents with multiple ''purple bruises'' and thin, transparent skin on her forearms.

Vitals: Normal.
Physical Examination: Ecchymoses (purpura) on the dorsal hands and forearms. The skin is extremely thin and tears easily (skin tears). No low platelets.
Laboratory Results: CBC normal.', 58)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the cause of actinic purpura?', '["Abuse","Atrophy of the dermal connective tissue due to aging and sun damage, leaving blood vessels poorly supported","Vitamin K deficiency","None"]', 1, 'It is a benign condition of elderly skin fragility.'),
        (v_case_id, 'How should this condition be managed?', '["Vitamin K supplements","Reassurance and trauma prevention (e.g., long sleeves)","Platelet transfusion","None"]', 1, 'There is no ''cure'' for the underlying atrophy.'),
        (v_case_id, 'Do these bruises turn yellow and green like normal bruises as they heal?', '["Yes","No, they often resolve without the typical color progression of heme degradation","Only in children","None"]', 1, 'This is a unique clinical observation in senile purpura.');

    ---------------------------------------------------------------------------
    -- CASE 59: The Scar that Keeps Growing
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scar that Keeps Growing', 'An 18-year-old male with dark skin presents with a large, itchy, firm mass on his earlobe after he got it pierced 6 months ago.

Vitals: Normal.
Physical Examination: A 2-cm, firm, smooth, erythematous nodule that extends well beyond the original boundaries of the piercing.
Laboratory Results: None.', 59)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does a Keloid differ from a Hypertrophic scar?', '["Hypertrophic scars stay within the original wound boundaries; Keloids extend beyond them","Keloids go away; hypertrophic stay","They are the same","None"]', 0, 'This is a critical distinction for prognosis and treatment.'),
        (v_case_id, 'What is the best initial treatment for a symptomatic keloid?', '["Simple surgical excision","Intralesional corticosteroid injections (e.g., Triamcinolone)","Topical antibiotics","None"]', 1, 'Simple excision of a keloid has a very high recurrence rate (often returning larger). Injections are the first step.'),
        (v_case_id, 'If surgery is performed, what should be done to prevent recurrence?', '["Nothing","Adjuvant therapy (e.g., steroid injections, pressure therapy, or radiation)","Sun protection","None"]', 1, 'Surgery alone is almost never recommended for keloids.');

    ---------------------------------------------------------------------------
    -- CASE 60: The Scaly Patch in the ''Rose'' Distribution
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scaly Patch in the ''Rose'' Distribution', 'A 25-year-old female develops a single, large, oval red patch on her abdomen. One week later, she develops dozens of smaller oval patches on her back that follow her ribs.

Vitals: Normal.
Physical Examination: Herald patch followed by Christmas tree distribution of smaller scaly lesions. A negative RPR is noted.
Laboratory Results: None.', 60)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the standard management for an asymptomatic case of Pityriasis Rosea?', '["Oral Antifungals","Observation and reassurance (resolves in 6-8 weeks)","Oral Steroids","Topical Antibiotics"]', 1, 'No treatment is necessary for asymptomatic cases.'),
        (v_case_id, 'If the patient is extremely itchy, what can be used?', '["Topical steroids and oral antihistamines","Acyclovir","Chemotherapy","None"]', 0, 'Supportive care is only for symptom relief.'),
        (v_case_id, 'Is the condition contagious?', '["Yes, very","No, it is not considered contagious despite a suspected viral trigger","Only through water","None"]', 1, 'Isolation is not required.');

    ---------------------------------------------------------------------------
    -- CASE 61: The ''White'' Face in the Dark-Skinned Child
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''White'' Face in the Dark-Skinned Child', 'An 8-year-old boy with dark skin presents with several round, pale patches on his cheeks. He has a history of asthma.

Vitals: Normal.
Physical Examination: Poorly demarcated, hypopigmented macules with a fine scale. No complete loss of pigment.
Laboratory Results: KOH negative.', 61)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How can you clinically distinguish Pityriasis Alba from Vitiligo?', '["Vitiligo is scaly; PA is not","Vitiligo shows complete depigmentation (chalk-white) with sharp borders; PA is hypopigmented (off-white) with blurry borders and fine scale","Vitiligo is only on the hands","None"]', 1, 'The ''depth'' of the pigment loss and the border quality are key.'),
        (v_case_id, 'What is the best initial management for Pityriasis Alba?', '["Oral antifungals","Sun protection and emollients; sometimes a mild topical steroid/calcineurin inhibitor","Chemotherapy","None"]', 1, 'PA is a self-limited form of mild eczema.'),
        (v_case_id, 'What would you expect to see under a Wood''s lamp for Vitiligo?', '["Bright coral-red fluorescence","Bright, fluorescent blue-white depigmentation","Yellow glow","Nothing"]', 1, 'Wood''s lamp accentuates the lack of melanin in vitiligo.');

    ---------------------------------------------------------------------------
    -- CASE 62: The Sudden White Spots on the Hands
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden White Spots on the Hands', 'A 30-year-old woman presents with ''chalk-white'' spots on her fingers and around her mouth. She has a history of autoimmune thyroiditis.

Vitals: Normal.
Physical Examination: Completely depigmented macules and patches with sharp borders (acrofacial vitiligo).
Laboratory Results: Positive Anti-TPO antibodies.', 62)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the first-line treatment for limited vitiligo (especially on the face)?', '["Oral steroids","High-potency topical steroids or topical Calcineurin inhibitors (e.g., Tacrolimus)","Permanent bleaching of the rest of the skin","None"]', 1, 'Topical immunosuppression aims to stop the autoimmune destruction of melanocytes.'),
        (v_case_id, 'What is a major risk factor for patients with vitiligo?', '["Sunburn (due to lack of protective melanin)","Infection","Skin cancer only","None"]', 0, 'Strict sun protection is vital in depigmented areas.'),
        (v_case_id, 'If the disease is widespread (>20% BSA), what is the next step?', '["Surgery","Narrowband UVB phototherapy","IV Antibiotics","None"]', 1, 'Phototherapy is highly effective for stimulating repigmentation.');

    ---------------------------------------------------------------------------
    -- CASE 63: The ''Stuck-On'' Brown Bump
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Stuck-On'' Brown Bump', 'A 70-year-old male presents with a ''worrying'' black bump on his chest.

Vitals: Normal.
Physical Examination: A 1-cm, well-demarcated, hyperpigmented plaque with a ''stuck-on'' appearance and ''waxy'' texture. Small keratin-filled pits are visible with a magnifying lens.
Laboratory Results: None.', 63)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the clinical hallmark of Seborrheic Keratosis?', '["Bleeding and ulceration","A ''stuck-on'' appearance that looks like it could be scraped off with a fingernail","Rapid growth","None"]', 1, 'This is the most common benign tumor in the elderly.'),
        (v_case_id, 'Is treatment necessary for Seborrheic Keratoses?', '["Yes, they turn into cancer","No, they are benign; treatment is only for irritation or cosmetics (e.g., cryotherapy)","Only in children","None"]', 1, 'SKs have zero malignant potential.'),
        (v_case_id, 'The sudden appearance of hundreds of SKs (Leser-Trélat sign) should prompt evaluation for what?', '["Diabetes","Internal malignancy (especially GI)","Heart failure","None"]', 1, 'This is a rare but classic paraneoplastic syndrome.');

    ---------------------------------------------------------------------------
    -- CASE 64: The Blue Node on the Lip
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Blue Node on the Lip', 'A 65-year-old male has a soft, blue-to-purple nodule on his lower lip that disappears when he presses on it with his finger.

Vitals: Normal.
Physical Examination: A 5-mm soft, compressible, dark-blue papule on the lip.
Laboratory Results: None.', 64)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a ''Venous Lake''?', '["A type of cancer","A benign dilated vein (common in the elderly on sun-exposed areas like lips/ears)","A fungal infection","None"]', 1, 'It is a common vascular finding in older patients.'),
        (v_case_id, 'How can you distinguish it from a nodular melanoma?', '["Melanoma is soft","A venous lake is soft and blanchable/compressible (blood is squeezed out); melanoma is firm and does not blanch","They are the same","None"]', 1, 'Blanchability is a key clinical test for vascular vs. pigmented lesions.'),
        (v_case_id, 'Is treatment required for a venous lake?', '["Yes, immediate excision","No, unless for cosmetic reasons (e.g., laser or excision)","Wait and watch always","None"]', 1, 'They are completely benign.');

    ---------------------------------------------------------------------------
    -- CASE 65: The Painful Blue Spot Under the Nail
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Blue Spot Under the Nail', 'A 30-year-old female presents with a small, extremely painful blue-red spot under her fingernail. The pain is triggered by cold or minor pressure.

Vitals: Normal.
Physical Examination: A 2-mm bluish subungual nodule. Severe tenderness to pinpoint pressure (Love''s sign).
Laboratory Results: None.', 65)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a Glomus tumor?', '["A type of cancer","A benign, painful hamartoma of the glomus body (involved in thermoregulation)","A fungal infection","None"]', 1, 'These are classically found in the subungual area.'),
        (v_case_id, 'What is the hallmark symptom?', '["Itch","Severe paroxysmal pain, especially triggered by cold or pressure","Numbness","None"]', 1, 'The ''cold sensitivity'' is a classic Step 2 CK clue.'),
        (v_case_id, 'What is the treatment?', '["Painkillers only","Surgical excision","Topical steroids","None"]', 1, 'Excision is curative and provides immediate relief.');

    ---------------------------------------------------------------------------
    -- CASE 66: The Itchy Groin in the Toddler
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Groin in the Toddler', 'A 3-year-old girl presents with an itchy, scaly rash in her diaper area that has not responded to diaper rash creams.

Vitals: Normal.
Physical Examination: Erythematous patches with a ''beefy'' red color and ''satellite'' pustules. The rash involves the deep skin folds.
Laboratory Results: KOH prep shows yeast.', 66)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does Candidal Diaper Dermatitis differ from Irritant (contact) Diaper Dermatitis?', '["Candida involves the deep folds; Irritant dermatitis typically spares the deep folds (where the diaper doesn''t touch)","Irritant involves the folds; Candida doesn''t","There is no difference","Candida is blue"]', 0, 'Involvement of the inguinal creases is a major diagnostic clue for Candida.'),
        (v_case_id, 'What is the first-line treatment for this infant?', '["Topical Permethrin","Topical Nystatin or Clotrimazole cream","Topical Bacitracin","Topical Steroids only"]', 1, 'Antifungals are required. High-potency steroids should be avoided in the diaper area.'),
        (v_case_id, 'Why are ''satellite lesions'' so important for diagnosis?', '["They aren''t","They are highly characteristic of Candidal infection","They indicate a bacterial allergy","None"]', 1, 'Seeing small red spots away from the main plaque is the ''gold standard'' clinical sign.');

    ---------------------------------------------------------------------------
    -- CASE 67: The Sudden Loss of Skin and the New Drug (Management)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Sudden Loss of Skin and the New Drug (Management)', 'A patient develops skin pain and Nikolsky-positive sloughing involving 40% of the body surface area.

Vitals: T 39.0 C, BP 85/50.
Physical Examination: Extensive epidermal detachment (TEN).
Laboratory Results: None.', 67)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Besides drug withdrawal, what is the ''Most Important'' factor for improving survival in TEN?', '["Starting steroids early","Aggressive fluid and electrolyte resuscitation (similar to burn protocols)","Skin grafting","None"]', 1, 'The loss of the skin barrier leads to massive fluid loss and risk of sepsis.'),
        (v_case_id, 'What is the most common cause of death in TEN patients?', '["Heart attack","Sepsis (usually from S. aureus or Pseudomonas)","Liver failure","None"]', 1, 'Infection of the denuded skin and subsequent septicemia is the primary killer.'),
        (v_case_id, 'Which ''Target'' should be managed by a specialist from day 1 to prevent permanent disability?', '["Liver","Eyes (conjunctival erosions/scarring)","Hair","None"]', 1, 'Ophthalmology must be involved to prevent symblepharon and blindness.');

    ---------------------------------------------------------------------------
    -- CASE 68: The Itchy Shin and the ''Step'' Association
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Shin and the ''Step'' Association', 'A 40-year-old female presents with painful, red nodules on her shins. She also has a cough and sore throat.

Vitals: Normal.
Physical Examination: Multiple 2-4 cm tender, erythematous nodules on the pretibial shins. No ulceration.
Laboratory Results: Chest X-ray shows bilateral hilar lymphadenopathy. ASO titer is high.', 68)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Erythema Nodosum (EN) is a ''delayed hypersensitivity'' reaction. What is the most common ''Infectious'' trigger in children?', '["HIV","Group A Streptococcus (ASO positive)","Fungus","None"]', 1, 'Strep infection is the leading cause of EN in the pediatric population.'),
        (v_case_id, 'Which systemic inflammatory condition is famously associated with the EN + Hilar adenopathy pattern?', '["Lupus","Sarcoidosis (Lofgren Syndrome)","Tuberculosis","None"]', 1, 'The triad of EN, hilar nodes, and polyarthritis defines Lofgren syndrome.'),
        (v_case_id, 'Which common medication class is a frequent trigger for EN in women?', '["Antibiotics","Oral Contraceptive Pills (OCPs)","Statins","Aspirin"]', 1, 'Hormonal changes are a significant trigger.');

    ---------------------------------------------------------------------------
    -- CASE 69: The Painful Vulva and the White Skin
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Vulva and the White Skin', 'A 65-year-old postmenopausal female presents with severe itching and pain in her genital area. She says it ''burns'' when she uriniates.

Vitals: Normal.
Physical Examination: Thin, ivory-white, ''parchment-like'' plaques on the vulva and perianal area in a ''figure-of-eight'' distribution. Some scarring and loss of the labia minora are seen.
Laboratory Results: None.', 69)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the ''Best Initial'' treatment for Lichen Sclerosus?', '["Topical Estrogen","Ultra-potent topical corticosteroids (e.g., Clobetasol) on a tapering schedule","Antifungal cream","Surgical excision"]', 1, 'Aggressive topical steroids are required to stop the scarring and inflammation.'),
        (v_case_id, 'Lichen sclerosus in women carries an increased risk of which malignancy?', '["BCC","Vulvar Squamous Cell Carcinoma (SCC)","Melanoma","None"]', 1, 'Up to 5% of patients with chronic LS can develop SCC, necessitating long-term monitoring.'),
        (v_case_id, 'How does it differ from Lichen Planus in the genital area?', '["LP usually involves the vagina (mucosal surfaces); LS characteristically spares the vagina","LS involves the vagina","They are the same","None"]', 0, 'Vaginal involvement is a key differentiator between the two.');

    ---------------------------------------------------------------------------
    -- CASE 70: The Red-Faced Toddler (Infection)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Red-Faced Toddler (Infection)', 'A 2-year-old child presents with a bright red face that looks like he was ''slapped''. He had a mild fever a few days ago.

Vitals: Normal now.
Physical Examination: Bright red erythema on the cheeks (''Slapped-cheek''). A lacy, reticular rash on the trunk and limbs.
Laboratory Results: None.', 70)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the causative agent of Fifth Disease?', '["Parvovirus B19","Measles","Herpes 6","None"]', 0, 'Parvovirus B19 is the culprit.'),
        (v_case_id, 'What is the major systemic concern for a PREGNANT woman exposed to this child?', '["Nothing","Hydrops fetalis (due to viral destruction of fetal RBC precursors)","SJS","None"]', 1, 'Parvovirus B19 can cause fetal anemia and hydrops if contracted during pregnancy.'),
        (v_case_id, 'In a patient with Sickle Cell Disease, Parvovirus B19 can trigger which emergency?', '["Pain crisis","Aplastic Crisis (sudden drop in hemoglobin)","Stroke","None"]', 1, 'The virus temporarily halts erythropoiesis.');

    ---------------------------------------------------------------------------
    -- CASE 71: The Itchy Elbows (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Elbows (Reasoning)', 'A 25-year-old male with a history of hay fever presents with an itchy rash on his elbows. He says it ''waxes and wanes''.

Vitals: Normal.
Physical Examination: Poorly defined erythematous plaques with some lichenification on the flexural surfaces (antecubital fossae).
Laboratory Results: None.', 71)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'The term ''Lichenification'' on physical exam indicates what?', '["Fungal infection","Chronic rubbing and scratching (thickening of the skin)","Acute allergy","None"]', 1, 'Lichenification is a marker of chronic itch-scratch behavior.'),
        (v_case_id, 'What is the ''Atopic Triad''?', '["Eczema, Asthma, and Allergic Rhinitis","Fever, rash, cough","None of the above","Obesity, Diabetes, Hypertension"]', 0, 'These three conditions frequently occur together in predisposed individuals.'),
        (v_case_id, 'Which type of ''Test'' is usually UNNECESSARY for the diagnosis of typical atopic dermatitis?', '["Physical exam","Skin biopsy","Patient history","None"]', 1, 'Atopic dermatitis is a clinical diagnosis; biopsy is rarely specific or necessary.');

    ---------------------------------------------------------------------------
    -- CASE 72: The ''Pearly'' Papule and the Management
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The ''Pearly'' Papule and the Management', 'A 70-year-old male with a pearly papule on his ear. Biopsy confirms Basal Cell Carcinoma.

Vitals: Normal.
Physical Examination: 1-cm pearly lesion on the helix of the ear.
Laboratory Results: None.', 72)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Why is the EAR considered a ''high-risk'' location for skin cancer?', '["It isn''t","Thin skin over cartilage leads to early deep invasion and higher recurrence rates","It gets more sun","None"]', 1, 'Locations like the ear, nose, and lips have specific surgical management requirements.'),
        (v_case_id, 'What is the preferred surgical method for this high-risk site?', '["Simple excision with narrow margins","Mohs Micrographic Surgery","Cryosurgery","Topical 5-FU"]', 1, 'Mohs ensures negative margins while preserving the delicate ear architecture.'),
        (v_case_id, 'If the patient were 95 years old and not a surgical candidate, what is an alternative?', '["Radiation therapy","Oral antibiotics","Chemotherapy","None"]', 0, 'Radiation is an excellent second-line for non-surgical candidates.');

    ---------------------------------------------------------------------------
    -- CASE 73: The Scaly Patch and the ''Double'' Border
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scaly Patch and the ''Double'' Border', 'A 20-year-old male athlete has an itchy, scaly rash in his groin. He has been using a combination ''steroid and antifungal'' cream (e.g., Lotrisone) for 2 weeks. The rash is now larger and more red.

Vitals: Normal.
Physical Examination: A diffuse, erythematous area in the groin with pustules and a poorly defined border. It no longer looks like a ''ring''.
Laboratory Results: KOH prep shows hyphae.', 73)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What has happened to this patient''s fungal infection?', '["He has an allergy to the cream","The topical steroid in the combination cream suppressed the inflammation but allowed the fungus to grow unchecked (Tinea Incognito)","The fungus is dead","None"]', 1, 'Steroids ''mask'' the infection while making it worse.'),
        (v_case_id, 'What is the best management step?', '["Add more steroids","Stop the combination cream and start a PURE topical antifungal (e.g., Terbinafine)","Start oral Prednisone","IV Antibiotics"]', 1, 'Removing the steroid is critical to allow the immune system to fight the fungus with the help of the antifungal.'),
        (v_case_id, 'Why should combination ''Steroid-Antifungal'' creams generally be avoided?', '["They are too expensive","Risk of Tinea Incognito, skin atrophy in folds, and reduced efficacy","None","They don''t work at all"]', 1, 'Most dermatologists recommend against their use due to these common pitfalls.');

    ---------------------------------------------------------------------------
    -- CASE 74: The Flushed Face and the ''Pimple'' Trap
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Flushed Face and the ''Pimple'' Trap', 'A 30-year-old woman presents with persistent facial redness and ''pimples'' on her cheeks. She says she has ''adult acne''.

Vitals: Normal.
Physical Examination: Central facial erythema and papulopustules. No open or closed comedones. She flushes easily with spicy food.
Laboratory Results: None.', 74)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the key clinical finding that distinguishes Rosacea from Acne?', '["Rosacea has comedones; Acne does not","Acne has comedones (blackheads/whiteheads); Rosacea characteristically lacks comedones","Rosacea is only in teenagers","None"]', 1, 'Comedones are the hallmark of acne; their absence in a patient with inflammatory facial lesions should prompt consideration of rosacea.'),
        (v_case_id, 'If this patient were treated with standard acne medications like Tretinoin, what would happen?', '["It would clear up","The irritation from the retinoid would likely worsen the underlying rosacea and flushing","It wouldn''t matter","None"]', 1, 'Rosacea skin is extremely sensitive; harsh acne treatments are often poorly tolerated.'),
        (v_case_id, 'What is the first-line medical treatment for the inflammatory papules of rosacea?', '["Oral Isotretinoin","Topical Metronidazole, Azelaic Acid, or Ivermectin","Topical Steroids","None"]', 1, 'These agents target the inflammation and potentially the Demodex mites involved in rosacea.');

    ---------------------------------------------------------------------------
    -- CASE 75: The Itchy Eyelids and the Nail Polish
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Eyelids and the Nail Polish', 'A 25-year-old woman presents with a red, scaly, and itchy rash on her eyelids. She does not use any eye makeup.

Vitals: Normal.
Physical Examination: Erythema and fine scale on both upper and lower eyelids. She also has a similar rash on her neck.
Laboratory Results: Patch testing is positive for tosylamide formaldehyde resin (found in nail polish).', 75)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is ''Ectopic'' Contact Dermatitis?', '["A rash in the wrong place","A reaction caused by transferring an allergen (e.g., nail polish) via the hands to a distant site (e.g., the thin skin of the eyelids)","An allergy to the sun","None"]', 1, 'The eyelids are a frequent site of ''transfer'' dermatitis because the skin is so thin and easily sensitized.'),
        (v_case_id, 'Why did she get the rash on her eyelids but not her fingers?', '["She only touches her eyes","The thick skin of the fingers is more resistant to penetration; the thin eyelid skin is highly susceptible to allergens","None","Fingernails don''t have an immune system"]', 1, 'This is a classic diagnostic puzzle in dermatology.'),
        (v_case_id, 'What is the first step in management?', '["Topical steroids to the eyes","Stop using the offending nail polish and avoid touching the face until the nails are dry","Oral steroids","Eye drops"]', 1, 'Removal of the trigger is the priority.');

    ---------------------------------------------------------------------------
    -- CASE 76: The Painful Shins and the Cough (Reasoning)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Shins and the Cough (Reasoning)', 'A patient with painful red nodules on her shins. A chest X-ray shows enlarged hilar lymph nodes.

Vitals: Normal.
Physical Examination: Tender, pretibial nodules.
Laboratory Results: CXR shows bilateral hilar adenopathy.', 76)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'If the ASO titer, TB test, and IBD workup are all negative, what is the most likely diagnosis for the hilar nodes?', '["Lymphoma","Sarcoidosis","Lung cancer","None"]', 1, 'Sarcoidosis is a very common cause of this constellation (Lofgren syndrome).'),
        (v_case_id, 'What is the most appropriate next step to support the sarcoidosis diagnosis?', '["Biopsy of the shin nodule","Serum ACE level or biopsy of a different site (e.g., a skin plaque or lymph node)","Wait for the nodules to go away","None"]', 1, 'Biopsy of an EN lesion is often non-specific (septal panniculitis); biopsying a different sarcoid lesion (like a skin plaque) is more likely to show granulomas.'),
        (v_case_id, 'What is the prognosis for EN associated with sarcoidosis?', '["Poor","Excellent (it usually indicates a self-limited, acute form of sarcoidosis that resolves within months)","It causes permanent lung damage","None"]', 1, 'Lofgren syndrome has a high rate of spontaneous remission.');

    ---------------------------------------------------------------------------
    -- CASE 77: The Ring that Doesn''''t Scale
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Ring that Doesn''''t Scale', 'A 40-year-old female presents with a ring-shaped rash on the back of her hand. It doesn''t itch or hurt.

Vitals: Normal.
Physical Examination: An annular plaque with a ''bumpy'' (papular) border and central clearing. There is NO scale present.
Laboratory Results: KOH prep is negative.', 77)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the key clinical feature that distinguishes Granuloma Annulare from Tinea Corporis?', '["GA is itchy; Tinea is not","GA has no scale; Tinea characteristically has scale at the active border","GA is red; Tinea is blue","None"]', 1, 'The absence of scale is a major clinical differentiator for GA.'),
        (v_case_id, 'What is the management for a single, asymptomatic lesion of GA?', '["Oral antifungals","Reassurance (most resolve spontaneously within 2 years)","Immediate surgical excision","None"]', 1, 'Localized GA is benign and often self-limited.'),
        (v_case_id, 'Generalized GA (hundreds of lesions) has been occasionally associated with which condition?', '["Diabetes Mellitus","Heart failure","Asthma","None"]', 0, 'While controversial, an association with DM is often tested on medical exams.');

    ---------------------------------------------------------------------------
    -- CASE 78: The Yellow Shin Plate
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Yellow Shin Plate', 'A 35-year-old woman with Type 1 Diabetes presents with a ''yellowish'' patch on her shin that has been slowly growing.

Vitals: Normal.
Physical Examination: A well-demarcated, atrophic, yellowish-brown plaque on the pretibial area with prominent telangiectasias (visible vessels) in the center.
Laboratory Results: HbA1c is 8.5%.', 78)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Does tight glucose control typically improve the skin lesions of Necrobiosis Lipoidica?', '["Yes, they disappear","No, NL does not necessarily mirror glycemic control","Only in Type 2 Diabetes","None"]', 1, 'Unlike other complications, NL is notoriously independent of A1c levels.'),
        (v_case_id, 'What is the primary treatment for active, inflammatory NL?', '["Oral antibiotics","Potent topical or intralesional corticosteroids","Insulin only","None"]', 1, 'Steroids help reduce the inflammation at the active borders.'),
        (v_case_id, 'What is a significant risk for the atrophic skin in NL?', '["Infection","Ulceration (which is often difficult to heal)","Turning into a mole","None"]', 1, 'Minor trauma to the thinned skin can lead to painful, chronic ulcers.');

    ---------------------------------------------------------------------------
    -- CASE 79: The Prickly Heat
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Prickly Heat', 'A 5-year-old child is brought in during a heatwave with a ''prickly'' red rash on his back and neck.

Vitals: Normal.
Physical Examination: Multiple tiny (1-2 mm) erythematous papules and vesicles in areas of occlusion (back, neck folds).
Laboratory Results: None.', 79)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the underlying cause of Miliaria?', '["Allergy to sweat","Obstruction of the eccrine sweat ducts","Bacterial infection","None"]', 1, 'Sweat is trapped in the skin, causing inflammation.'),
        (v_case_id, 'What is the best management step?', '["Topical antibiotics","Cooling the environment, wearing loose clothing, and avoiding heavy creams/ointments","Oral steroids","Scrubbing the skin"]', 1, 'Reducing sweating and allowing the ducts to clear is the primary treatment.'),
        (v_case_id, 'Which type of Miliaria presents with ''crystal-like'' tiny clear vesicles that pop easily?', '["Miliaria rubra","Miliaria crystallina","Miliaria profunda","None"]', 1, 'This is the most superficial form of sweat duct obstruction.');

    ---------------------------------------------------------------------------
    -- CASE 80: The Smelly, Pitted Feet
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Smelly, Pitted Feet', 'A 20-year-old athlete presents with extremely smelly feet and ''little holes'' in his soles.

Vitals: Normal.
Physical Examination: Multiple 1-3 mm ''punched-out'' pits in the thickened stratum corneum of the weight-bearing areas of the soles. The area is slimy and has a strong odor.
Laboratory Results: None.', 80)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the cause of Pitted Keratolysis?', '["Fungus","Superficial bacterial infection (e.g., Kytococcus sedentarius) in a moist environment","Acid reflux","None"]', 1, 'Bacteria produce enzymes that digest the keratin of the sole.'),
        (v_case_id, 'What is the best initial treatment?', '["Topical antifungals","Topical antibiotics (e.g., Erythromycin or Clindamycin) and keeping the feet dry","Oral steroids","None"]', 1, 'Topical antibiotics are curative.'),
        (v_case_id, 'What contributes to the characteristic odor?', '["Pus","Sulfur-containing compounds produced by the bacteria","Dirt","None"]', 1, 'The ''rotten egg'' smell is a classic clinical clue.');

    RAISE NOTICE 'Finished populating 80 cases for case-algorithms.';
END $$;

COMMIT;
