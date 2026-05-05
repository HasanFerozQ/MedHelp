-- US MD/MBBS (4th Year) Clinical Case Blocks
-- Section: Dermatology
-- Topic: Infectious dermatology — cellulitis, impetigo, fungal
-- Topic Slug: derm-infectious
-- Sourced: Fitzpatrick, Andrews, Bolognia, Habif

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'derm-infectious' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'derm-infectious';
    END IF;

    -- CLEAN SLATE: Clear existing data for this topic to ensure a fresh, 50-case upload
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    ---------------------------------------------------------------------------
    -- CASE 01: The Golden Crust
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Golden Crust', 'A 5-year-old child presents with several itchy, honey-colored crusted sores around his nose and mouth.

Vitals: Normal.
Physical Examination: Multiple erythematous macules and papules that have progressed to thin-walled vesicles and characteristic honey-colored (golden) crusts.
Laboratory Results: Swab culture grows Staphylococcus aureus.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common causative organism of non-bullous impetigo?', '["Streptococcus pneumoniae","Staphylococcus aureus (most common) or Streptococcus pyogenes","Pseudomonas aeruginosa","Escherichia coli"]', 1, 'S. aureus is now the most common isolate, though Group A Strep was historically dominant.'),
        (v_case_id, 'What is the recommended first-line treatment for localized impetigo?', '["Oral Vancomycin","Topical Mupirocin or Retapamulin","Systemic Steroids","Topical Ketoconazole"]', 1, 'Topical antibiotics are effective for localized disease; systemic agents are reserved for widespread cases.'),
        (v_case_id, 'What serious renal complication can follow impetigo caused by nephritogenic strains of Strep?', '["Renal Cell Carcinoma","Post-streptococcal Glomerulonephritis (PSGN)","Minimal Change Disease","Kidney Stones"]', 1, 'PSGN can follow skin infections (unlike Rheumatic Fever, which only follows pharyngitis).');

    ---------------------------------------------------------------------------
    -- CASE 02: The Large Blisters
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Large Blisters', 'A 2-year-old toddler presents with large, clear-to-cloudy blisters on his trunk that rupture easily, leaving a shiny, red base.

Vitals: Normal.
Physical Examination: Tense and flaccid bullae (1-3 cm) with minimal surrounding erythema. Nikolsky sign is negative.
Laboratory Results: Toxin-producing S. aureus is isolated.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What bacterial toxin is responsible for the formation of blisters in bullous impetigo?', '["Exfoliative toxin A (targeting Desmoglein 1)","Toxic Shock Syndrome Toxin (TSST-1)","Endotoxin","Streptolysin O"]', 0, 'The exfoliative toxin cleaves Desmoglein 1, causing intraepidermal splitting.'),
        (v_case_id, 'Bullous impetigo is a localized form of which systemic condition?', '["Toxic Shock Syndrome","Staphylococcal Scalded Skin Syndrome (SSSS)","Erysipelas","Necrotizing Fasciitis"]', 1, 'SSSS is the generalized version of this toxin-mediated cleavage.'),
        (v_case_id, 'Which layer of the skin is the site of the cleavage in bullous impetigo?', '["Subcutaneous fat","Granular layer (High epidermis)","Dermal-epidermal junction","Deep dermis"]', 1, 'Desmoglein 1 is located in the upper epidermis, specifically the granular layer.');

    ---------------------------------------------------------------------------
    -- CASE 03: The Punched-Out Ulcer
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Punched-Out Ulcer', 'A homeless patient presents with a painful, deep ulcer on his lower leg covered by a thick, greenish-yellow crust. He says it started as a small ''pustule''.

Vitals: Normal.
Physical Examination: A deep, ''punched-out'' ulcer with a violaceous rim and an overlying thick adherent crust on the pretibial area.
Laboratory Results: Culture grows Group A Streptococcus.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How does Ecthyma differ from Impetigo?', '["It is only on the face","It is a deeper (dermal) extension of the infection, whereas impetigo is superficial","It is caused by a virus","It is not contagious"]', 1, 'Ecthyma is often described as ''deep impetigo'' because it penetrates into the dermis.'),
        (v_case_id, 'Does Ecthyma typically heal with scarring?', '["No, never","Yes, because the infection involves the dermis","Only in children","Only if treated with antibiotics"]', 1, 'Superficial infections like impetigo don''t scar, but dermal infections like ecthyma do.'),
        (v_case_id, 'Which patient population is most predisposed to Ecthyma?', '["Elite athletes","Patients with poor hygiene, malnutrition, or immunosuppression","Newborns","University students"]', 1, 'Neglect and crowded conditions are major risk factors.');

    ---------------------------------------------------------------------------
    -- CASE 04: The Spreading Redness
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Spreading Redness', 'A 60-year-old diabetic male presents with a warm, red, swollen right lower leg. He has tinea pedis between his toes.

Vitals: T 38.2 C.
Physical Examination: Diffuse, ill-defined erythema, warmth, and tenderness of the right calf. No crepitus or fluctuance.
Laboratory Results: Leukocytosis (WBC 14,000).', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common entry point for lower extremity cellulitis?', '["Inhaling bacteria","Interdigital tinea pedis (cracks between the toes)","A clean surgical wound","Eating contaminated food"]', 1, 'Fungal infections provide a portal of entry for skin bacteria.'),
        (v_case_id, 'Which organisms are the most frequent causes of non-purulent cellulitis?', '["Staph aureus and Strep pyogenes","Pseudomonas and Proteus","E. coli and Klebsiella","Mycobacteria"]', 0, 'Gram-positive cocci are the overwhelming majority.'),
        (v_case_id, 'How do you distinguish cellulitis from erysipelas clinicaly?', '["Cellulitis is blue","Cellulitis has ill-defined borders and involves the deep dermis/subcutis; Erysipelas has sharply demarcated borders and is more superficial","Erysipelas is painless","There is no difference"]', 1, 'Erysipelas is a more superficial ''bright red'' variant of cellulitis.');

    ---------------------------------------------------------------------------
    -- CASE 05: The Bright Red Face
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Bright Red Face', 'A 45-year-old female presents with a sudden onset of a bright red, painful rash on her left cheek that is rapidly expanding. It has a raised, sharp border.

Vitals: T 38.9 C.
Physical Examination: Well-demarcated, ''fiery'' red, indurated plaque on the malar area. The border is palpable and distinct from normal skin.
Laboratory Results: Elevated ESR.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic causative organism of erysipelas?', '["Group A Beta-hemolytic Streptococcus","Staph aureus","Pseudomonas","Bartonella"]', 0, 'Streptococcus pyogenes is the primary pathogen.'),
        (v_case_id, 'Why are the borders of erysipelas more distinct than cellulitis?', '["Because it''s a virus","Because it involves the superficial dermis and prominent lymphatic involvement","Because the patient is younger","It''s a mystery"]', 1, 'The superficial location results in a more dramatic clinical edge.'),
        (v_case_id, 'What is a common site for erysipelas besides the lower legs?', '["The palms","The face (malar area)","The scalp","The fingernails"]', 1, 'The face is a classic location for erysipelas.');

    ---------------------------------------------------------------------------
    -- CASE 06: The Surgical Emergency
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Surgical Emergency', 'A patient presents with extreme pain in his left thigh that is ''out of proportion'' to the mild redness seen on the skin. Within hours, the skin turns dusky and purple with some bullae.

Vitals: T 40.0 C, HR 130, BP 85/50 (Septic Shock).
Physical Examination: Woody induration of the skin, crepitus (gas in tissues), and rapid progression of dusky necrosis.
Laboratory Results: Elevated Creatine Kinase (CK) and low Sodium (Hyponatremia).', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most critical first step in management for suspected necrotizing fasciitis?', '["Start topical antibiotics","Immediate surgical consultation for emergent debridement","Wait for culture results","Apply ice"]', 1, 'Necrotizing fasciitis is a surgical emergency; ''time is tissue''.'),
        (v_case_id, 'Which clinical sign is highly suggestive of Type I (polymicrobial) necrotizing fasciitis?', '["Itching","Crepitus (palpable gas bubbles in the tissue)","Hair loss","A freckle"]', 1, 'Gas-producing anaerobes cause the characteristic crackling feel.'),
        (v_case_id, 'What is Type II necrotizing fasciitis caused by?', '["Group A Streptococcus (''''flesh-eating bacteria'''')","Staph epidermidis","Fungi","Viruses"]', 0, 'Type II is monomicrobial, usually due to virulent Strep pyogenes.');

    ---------------------------------------------------------------------------
    -- CASE 07: The Coral-Red Glow
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Coral-Red Glow', 'A 40-year-old obese male complains of a dark, non-itchy rash in his armpits and groin that has been there for months.

Vitals: Normal.
Physical Examination: Well-demarcated, reddish-brown, slightly scaly patches in the intertriginous areas (axillae, groin).
Laboratory Results: Wood''''s lamp examination shows a brilliant ''coral-red'' fluorescence.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the causative organism of Erythrasma?', '["Corynebacterium minutissimum","Staph aureus","Candida albicans","Trichophyton rubrum"]', 0, 'It is a bacterial infection, not fungal, despite its appearance.'),
        (v_case_id, 'What substance produced by the bacteria causes the coral-red fluorescence?', '["Melanin","Coproporphyrin III","Chlorophyll","Hemoglobin"]', 1, 'Porphyrin production is the hallmark of this organism.'),
        (v_case_id, 'What is the first-line treatment for Erythrasma?', '["Antifungal cream","Topical or oral Erythromycin/Clindamycin","Moisturizers","Steroids"]', 1, 'Since it is a Corynebacterium, it responds well to macrolides.');

    ---------------------------------------------------------------------------
    -- CASE 08: The Smelly Feet
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Smelly Feet', 'A 20-year-old athlete complains of extremely foul-smelling feet. His socks are always sweaty.

Vitals: Normal.
Physical Examination: Multiple 1-3 mm shallow ''pits'' or craters in the thickened skin of the weight-bearing areas of the soles.
Laboratory Results: Wood''''s lamp is negative.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What causes the ''pits'' in Pitted Keratolysis?', '["Bacteria (Kytococcus sedentarius) producing proteases that digest the stratum corneum","Walking on gravel","Fungal infection","Excessive scrubbing"]', 0, 'Bacterial proteases literally eat the skin.'),
        (v_case_id, 'What is the most common symptom besides the appearance?', '["Pain","Bromhidrosis (foul odor)","Numbness","Itching"]', 1, 'The odor is caused by sulfur compounds produced by the bacteria.'),
        (v_case_id, 'How is it managed?', '["Buying new shoes","Topical antibiotics (clindamycin/erythromycin) and keeping feet dry","Surgery","Antifungals"]', 1, 'Reducing moisture and killing the bacteria is effective.');

    ---------------------------------------------------------------------------
    -- CASE 09: The Hot Tub Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Hot Tub Rash', 'A 25-year-old male develops an itchy, bumpy rash on his trunk and buttocks 2 days after using a hotel hot tub.

Vitals: Normal.
Physical Examination: Numerous erythematous follicular papules and pustules concentrated under the areas covered by his swim trunks.
Laboratory Results: Culture grows Pseudomonas aeruginosa.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic organism associated with Hot Tub Folliculitis?', '["Staph aureus","Pseudomonas aeruginosa","E. coli","Candida"]', 1, 'Pseudomonas thrives in warm, poorly chlorinated water.'),
        (v_case_id, 'Why is the rash often worse under the swimwear?', '["Swimwear is toxic","The fabric traps the contaminated water against the skin for a longer period","Sun exposure protects the rest of the skin","It is a coincidence"]', 1, 'Occlusion promotes bacterial penetration into the follicles.'),
        (v_case_id, 'What is the typical management?', '["Oral Ciprofloxacin for everyone","Observation (most cases are self-limited and resolve in 7-10 days)","Burning the hot tub","Daily bleach baths"]', 1, 'Healthy individuals usually clear the infection without specific treatment.');

    ---------------------------------------------------------------------------
    -- CASE 10: The Black Eschar
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Black Eschar', 'A rancher presents with a painless, black, sunken sore on his forearm. He mentions several of his cows recently died unexpectedly.

Vitals: T 37.9 C.
Physical Examination: A central black necrotic eschar surrounded by a ring of non-pitting edema and small vesicles.
Laboratory Results: Large, Gram-positive ''box-car'' shaped bacilli in chains.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the causative agent of Anthrax?', '["Bacillus anthracis","Bartonella henselae","Francisella tularensis","Yersinia pestis"]', 0, 'B. anthracis is a spore-forming bacterium.'),
        (v_case_id, 'Is the cutaneous lesion of anthrax usually painful?', '["Yes, extremely","No, it is characteristically painless (though it may be itchy)","Only in children","Only if it bleeds"]', 1, 'The lack of pain despite the dramatic appearance is a key clinical clue.'),
        (v_case_id, 'What is the drug of choice for treatment?', '["Penicillin","Ciprofloxacin or Doxycycline","Ketoconazole","Acyclovir"]', 1, 'Fluoroquinolones are the mainstay of treatment.');

    ---------------------------------------------------------------------------
    -- CASE 11: The Scaly Scalp (Child)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scaly Scalp (Child)', 'An 8-year-old boy has an expanding patch of hair loss on the back of his head. The remaining hair looks like ''black dots''. His kitten also has some hair loss.

Vitals: Normal.
Physical Examination: Well-demarcated, scaly plaque with ''black dot'' alopecia (hairs broken at the surface). Occipital lymphadenopathy is present.
Laboratory Results: KOH prep shows spores within the hair shaft (endothrix).', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common cause of Tinea Capitis in the USA?', '["Microsporum canis","Trichophyton tonsurans","Trichophyton rubrum","Candida albicans"]', 1, 'T. tonsurans is the leading cause, often showing endothrix (internal) spores.'),
        (v_case_id, 'What is the first-line treatment for Tinea Capitis?', '["Topical Ketoconazole cream","Oral Griseofulvin or Terbinafine","Antibiotic syrup","Steroid injections"]', 1, 'Topical treatment fails because the fungus is deep inside the hair follicle; systemic therapy is mandatory.'),
        (v_case_id, 'What does ''Black Dot'' alopecia represent?', '["Moles on the scalp","Hair shafts that have broken off at the scalp surface due to fungal fragility","Dirty hair","New hair growth"]', 1, 'This is a classic sign of T. tonsurans infection.');

    ---------------------------------------------------------------------------
    -- CASE 12: The Boggy Swelling
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Boggy Swelling', 'A 6-year-old girl with Tinea Capitis develops a large, painful, boggy, pus-filled mass on her scalp with associated fever.

Vitals: T 38.2 C.
Physical Examination: A thick, fluctuant, inflammatory plaque (Kerion) with pustules and crusting. Hair pulls out easily without pain.
Laboratory Results: Culture grows Microsporum canis.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a Kerion?', '["A bacterial abscess","A severe, cell-mediated hypersensitivity reaction to a dermatophyte infection","A type of tumor","A birthmark"]', 1, 'It represents a robust immune response, not a secondary bacterial infection.'),
        (v_case_id, 'Does a Kerion require incision and drainage (I&D)?', '["Yes, always","No, it should be treated with oral antifungals and potentially oral steroids to reduce inflammation and scarring","Only if it is red","Only if it hurts"]', 1, 'I&D is contraindicated and can worsen scarring.'),
        (v_case_id, 'What is a common long-term complication of an untreated or severe Kerion?', '["Brain damage","Permanent scarring alopecia (hair loss)","Better hair growth","Itching forever"]', 1, 'The intense inflammation can destroy the hair follicles permanently.');

    ---------------------------------------------------------------------------
    -- CASE 13: The Itchy Rings
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Rings', 'A wrestler presents with several itchy, ring-shaped rashes on his arms and trunk.

Vitals: Normal.
Physical Examination: Annular erythematous plaques with a scaly, advancing border and central clearing.
Laboratory Results: KOH prep shows branching, septate hyphae.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic appearance of tinea corporis (ringworm)?', '["Solid red bumps","Annular (ring-shaped) lesions with central clearing and a scaly border","Blisters in a line","White spots"]', 1, 'The ''ring'' shape is due to the fungus moving outward as the center heals.'),
        (v_case_id, 'Which organism is the most common cause of tinea corporis worldwide?', '["Trichophyton rubrum","Candida albicans","Staph aureus","Malassezia furfur"]', 0, 'T. rubrum is the most common dermatophyte globally.'),
        (v_case_id, 'How is localized tinea corporis typically treated?', '["Oral antibiotics","Topical antifungals (e.g., Terbinafine, Clotrimazole)","Topical steroids","Moisturizers"]', 1, 'Topical azoles or allylamines are usually sufficient.');

    ---------------------------------------------------------------------------
    -- CASE 14: The Jock Itch
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Jock Itch', 'A 25-year-old male presents with an itchy, red rash in his groin. He also has scaly feet.

Vitals: Normal.
Physical Examination: Erythematous, scaly plaques in the bilateral inguinal folds. The scrotum is characteristically spared.
Laboratory Results: KOH positive for hyphae.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a key clinical feature that distinguishes Tinea Cruris from Candidiasis?', '["It is not red","Tinea cruris usually spares the scrotum, whereas Candidiasis often involves it","Tinea cruris is painless","There is no difference"]', 1, 'Candidiasis loves moist surfaces like the scrotum; dermatophytes prefer the keratinized skin of the folds.'),
        (v_case_id, 'Why should you check the feet of a patient with Tinea Cruris?', '["To see their shoes","Autoinoculation often occurs from Tinea Pedis (fungus spreads from feet to groin while dressing)","To check for height","It is just good practice"]', 1, 'The ''two feet, one hand'' (or one groin) pattern is common.'),
        (v_case_id, 'What is the primary risk factor?', '["Cold weather","Heat, humidity, and occlusive clothing","Eating sugar","Old age"]', 1, 'Sweat and friction create the perfect environment for fungus.');

    ---------------------------------------------------------------------------
    -- CASE 15: The Moccasin Foot
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Moccasin Foot', 'A 50-year-old male has chronic, dry, scaly skin on the soles and sides of both feet. He thinks it is just ''dry skin''.

Vitals: Normal.
Physical Examination: Fine, silvery-white scale in a ''moccasin'' distribution over the plantar and lateral surfaces of the feet.
Laboratory Results: KOH positive.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which organism is most commonly responsible for the moccasin type of tinea pedis?', '["Microsporum canis","Trichophyton rubrum","Candida","Epidermophyton floccosum"]', 1, 'T. rubrum is the classic cause of chronic, scaly tinea pedis.'),
        (v_case_id, 'What is the ''Two Feet, One Hand'' syndrome?', '["A circus act","Tinea pedis involving both feet and tinea manuum involving the dominant (or one) hand","A type of coordination","None of the above"]', 1, 'This is a very common clinical presentation of T. rubrum infection.'),
        (v_case_id, 'Is moccasin-type tinea pedis easy to treat with topicals alone?', '["Yes, always","No, it is often recalcitrant and may require oral terbinafine for full clearance","It requires surgery","It clears with soap"]', 1, 'The thickened skin (hyperkeratosis) makes it difficult for topicals to penetrate.');

    ---------------------------------------------------------------------------
    -- CASE 16: The Scaly Palm
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Scaly Palm', 'A patient has chronic scaling on the palm of his right hand. His left hand and both feet are normal.

Vitals: Normal.
Physical Examination: Diffuse hyperkeratosis and fine white scale in the creases of the right palm.
Laboratory Results: KOH positive.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Tinea manuum is most frequently associated with which other infection?', '["Tinea capitis","Tinea pedis","Acne","Warts"]', 1, 'Fungus is often ''picked up'' from the feet.'),
        (v_case_id, 'What does it often mimic?', '["A burn","Chronic irritant contact dermatitis or psoriasis","A freckle","Nothing"]', 1, 'The unilateral distribution is a major clue that it''s fungal rather than eczematous.'),
        (v_case_id, 'Is it usually unilateral or bilateral?', '["Bilateral","Unilateral (usually involving only one hand)","Only on fingers","Always involves nails"]', 1, 'The ''one hand'' part of ''two feet, one hand'' is characteristic.');

    ---------------------------------------------------------------------------
    -- CASE 17: The Deep Fungal Bumps
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Deep Fungal Bumps', 'A woman who has been using a high-potency steroid cream for ''eczema'' on her leg for 3 weeks notices the rash is getting worse and now has deep, painful bumps.

Vitals: Normal.
Physical Examination: Erythematous, follicular papules and nodules within a scaly plaque. The border is less distinct than before.
Laboratory Results: Biopsy shows fungal hyphae within the hair follicle and dermis.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is Majocchi''''s Granuloma?', '["A type of cancer","A deep, follicular dermatophyte infection, often triggered by topical steroid use on a tinea lesion","A bacterial infection","A viral wart"]', 1, 'Steroids suppress the local immune response, allowing the fungus to invade deeper into the follicle.'),
        (v_case_id, 'Can this be treated with topical antifungals alone?', '["Yes","No, because the fungus is deep in the dermis/follicle, oral antifungals are required","Yes, with more steroids","It requires surgery"]', 1, 'Systemic therapy is necessary to reach the deep infection.'),
        (v_case_id, 'Which patient population is most at risk?', '["Athletes","Women who shave their legs (introducing fungus) and use topical steroids on the area","Children","Elderly"]', 1, 'Trauma from shaving and steroid use are classic risk factors.');

    ---------------------------------------------------------------------------
    -- CASE 18: The Thickened Nails
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Thickened Nails', 'A 60-year-old male presents with yellow, thickened, crumbling toenails.

Vitals: Normal.
Physical Examination: Subungual hyperkeratosis (debris under the nail), onycholysis (separation of nail), and yellow-brown discoloration.
Laboratory Results: Fungal culture or PAS stain of nail clippings confirms dermatophytes.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common clinical type of onychomycosis?', '["White superficial","Distal lateral subungual (DLSO)","Proximal subungual (PSO)","Total dystrophic"]', 1, 'DLSO is the most frequent form seen in clinical practice.'),
        (v_case_id, 'Which type of onychomycosis is a strong marker for immunosuppression (e.g., HIV)?', '["Distal lateral","Proximal subungual onychomycosis (PSO)","White superficial","None"]', 1, 'PSO is rare in healthy individuals and should prompt an HIV screen.'),
        (v_case_id, 'What is the most effective treatment for toenail onychomycosis?', '["Antifungal nail polish for 1 week","Oral Terbinafine (for 12 weeks)","Oral Terbinafine (for 1 week)","Pulling the nail out"]', 1, 'Oral therapy is superior to topicals, and toenails require a longer course (12 weeks) than fingernails (6 weeks).');

    ---------------------------------------------------------------------------
    -- CASE 19: The Multi-Colored Back
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Multi-Colored Back', 'A young woman notices white patches on her tanned back after a summer vacation. She says they are ''slightly itchy'' when she gets hot.

Vitals: Normal.
Physical Examination: Multiple small, round-to-oval, hypopigmented (or pink/brown) macules with a fine ''furfuraceous'' scale that becomes evident upon scratching.
Laboratory Results: KOH shows a ''spaghetti and meatballs'' pattern.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the causative organism of Tinea Versicolor?', '["Trichophyton rubrum","Malassezia species (e.g., M. furfur)","Candida albicans","Staph aureus"]', 1, 'It is a yeast, not a dermatophyte.'),
        (v_case_id, 'Why does it cause hypopigmentation (white spots)?', '["The fungus eats the pigment","Azelaic acid produced by the yeast inhibits tyrosinase (an enzyme needed for melanin production)","It is a scar","Sunlight bleaches the spots"]', 1, 'The chemical inhibition of melanin is the mechanism.'),
        (v_case_id, 'What is the characteristic ''spaghetti and meatballs'' appearance on KOH?', '["Long hyphae and round spores","Bacteria and pus","Fungal shells","Nothing"]', 0, 'Short, thick hyphae (spaghetti) and clusters of spores (meatballs) are pathognomonic.');

    ---------------------------------------------------------------------------
    -- CASE 20: The Satellite Lesions
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Satellite Lesions', 'An infant presents with a bright red rash in the diaper area that is not getting better with ''barrier cream''.

Vitals: Normal.
Physical Examination: Beefy red, confluent plaques involving the inguinal folds, with small ''satellite'' pustules at the edges.
Laboratory Results: KOH shows pseudohyphae and budding yeast.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is a hallmark clinical sign of Candidal infection in the skin folds?', '["Islands of sparing","Satellite papules and pustules","Honey-colored crusts","Target lesions"]', 1, 'Satellite lesions (small spots just outside the main rash) are highly suggestive of Candida.'),
        (v_case_id, 'Does Candidal diaper dermatitis typically involve or spare the inguinal folds?', '["Spares","Involves (unlike irritant diaper dermatitis which spares the folds)","Only involves the legs","Only involves the waist"]', 1, 'Irritant dermatitis affects the surfaces in contact with the diaper; Candida loves the moist, hidden folds.'),
        (v_case_id, 'Which medication can predispose a patient to Candidiasis?', '["Oral antibiotics (which kill competing flora)","Aspirin","Vitamin D","Moisturizers"]', 0, 'Antibiotics disrupt the balance of microbes on the skin.');

    ---------------------------------------------------------------------------
    -- CASE 21: The Painful Nail Fold
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Painful Nail Fold', 'A dishwasher presents with a swollen, red, painful area around the base of her fingernail. It has been there for 2 weeks.

Vitals: Normal.
Physical Examination: Erythema and edema of the proximal nail fold, with loss of the cuticle. Some ''cheesy'' white material is expressed.
Laboratory Results: Culture grows Candida albicans.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the primary risk factor for chronic paronychia?', '["Biting nails","Frequent immersion in water (wet work)","Dry skin","Cold weather"]', 1, 'Moisture allows Candida to colonize the space under the nail fold.'),
        (v_case_id, 'How does chronic paronychia differ from acute paronychia?', '["Chronic is blue","Acute is usually bacterial (Staph) and very sudden; Chronic is often fungal (Candida) and persists for weeks","Chronic is painless","There is no difference"]', 1, 'The timeline and common organisms differ significantly.'),
        (v_case_id, 'What is the most important part of management for chronic paronychia?', '["Surgery","Keeping the hands dry and using topical antifungals","Antibiotic injections","Biting the nail"]', 1, 'Water avoidance is key to recovery.');

    ---------------------------------------------------------------------------
    -- CASE 22: The Rose Gardener''''s Sore
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Rose Gardener''''s Sore', 'A florist presents with a non-healing bump on his finger and several new bumps appearing in a line up his forearm.

Vitals: Normal.
Physical Examination: A small, painless nodule on the index finger. Multiple subcutaneous nodules are felt along the lymphatic drainage path of the arm.
Laboratory Results: Biopsy shows ''cigar-shaped'' yeast on culture.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How is Sporotrichosis typically acquired?', '["Inhaling spores","Traumatic inoculation (e.g., a thorn prick or splinter contaminated with soil/moss)","Eating mushrooms","Bite from a dog"]', 1, 'It is the classic ''Rose Gardener''s Disease''.'),
        (v_case_id, 'What is the term for the ''line'' of nodules moving up the arm?', '["Metastasis","Sporotrichoid spread (lymphocutaneous spread)","Linear eczema","Koebner phenomenon"]', 1, 'This linear lymphatic pattern is the hallmark of the lymphocutaneous form.'),
        (v_case_id, 'What was the traditional treatment for Sporotrichosis before modern antifungals?', '["Aspirin","Saturated Solution of Potassium Iodide (SSKI)","Bleach","Honey"]', 1, 'SSKI was the classic treatment; now, Itraconazole is first-line.');

    ---------------------------------------------------------------------------
    -- CASE 23: The Desert Fever
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Desert Fever', 'A patient recently moved to Arizona and developed fever, cough, and painful red bumps on his shins. He also has a red ''target'' rash on his arms.

Vitals: T 38.5 C.
Physical Examination: Erythema nodosum on the shins and Erythema multiforme on the trunk.
Laboratory Results: Spherules containing endospores are seen in the sputum.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Coccidioidomycosis is endemic to which region?', '["Mississippi River Valley","Southwestern US (Arizona, California desert)","Pacific Northwest","New England"]', 1, 'It is a soil fungus found in the arid Southwest.'),
        (v_case_id, 'What do Erythema Nodosum and Erythema Multiforme represent in this disease?', '["Direct infection of the skin","Reactive (immunologic) skin manifestations of the systemic fungal infection","A drug allergy","It''s just a coincidence"]', 1, 'These reactive rashes are common ''signals'' of the underlying fungal illness.'),
        (v_case_id, 'What is the characteristic histological finding in Coccidioidomycosis?', '["Cigar-shaped yeast","Large spherules containing endospores","Broad-based budding yeast","Fungal hyphae"]', 1, 'The spherule is the diagnostic tissue form.');

    ---------------------------------------------------------------------------
    -- CASE 24: The Mississippi Skin Lesion
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Mississippi Skin Lesion', 'A man from Ohio presents with a large, warty plaque on his face. He has been having a chronic cough and night sweats.

Vitals: T 37.8 C.
Physical Examination: A large, verrucous (warty) plaque with a sharp border and micro-abscesses at the edge.
Laboratory Results: Biopsy shows large, broad-based budding yeast.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Where is Blastomycosis endemic?', '["Southwest US","Ohio and Mississippi River Valleys, Great Lakes region","Florida","Hawaii"]', 1, 'The ''Eastern'' part of the US (excluding the coastal South) is the primary zone.'),
        (v_case_id, 'What is the hallmark histologic finding for Blastomyces dermatitidis?', '["Small intracellular yeast","Broad-based budding yeast with a thick wall","Hyphae","Spherules"]', 1, 'The ''B''s go together: Blastomycosis, Big, Broad-Based Budding.'),
        (v_case_id, 'Which organ system is the primary site of infection for most deep fungi before they spread to the skin?', '["Lungs","Heart","Brain","Liver"]', 0, 'Inhalation of spores into the lungs is the typical starting point.');

    ---------------------------------------------------------------------------
    -- CASE 25: The Small Intracellular Yeast
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Small Intracellular Yeast', 'An HIV patient with a low CD4 count presents with fever, weight loss, and multiple small, red bumps on his face and chest.

Vitals: T 38.3 C.
Physical Examination: Widespread, small erythematous papules. Some look like Molluscum Contagiosum.
Laboratory Results: Biopsy shows small (2-4 micron) intracellular yeast within macrophages.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic habitat for Histoplasma capsulatum?', '["Dry desert sand","Soil contaminated with bird or bat droppings (e.g., caves, chicken coops)","Ocean water","Clean carpets"]', 1, 'Nitrogen-rich soil from droppings promotes growth.'),
        (v_case_id, 'Where is Histoplasmosis most commonly found in the US?', '["Arizona","Ohio and Mississippi River Valleys","California","Washington state"]', 1, 'It overlaps significantly with the endemic area for Blastomycosis.'),
        (v_case_id, 'How does Histoplasma appear under the microscope?', '["Large broad-based yeast","Small, oval intracellular yeast within histiocytes/macrophages","Long branches","Round circles with endospores"]', 1, 'The yeast are tiny and ''hide'' inside immune cells.');

    ---------------------------------------------------------------------------
    -- CASE 26: The Tingling Blister
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Tingling Blister', 'A 22-year-old female presents with a group of small, painful blisters on a red base on her upper lip. She had a ''tingling'' sensation in the area the day before.

Vitals: Normal.
Physical Examination: Grouped, 1-2 mm vesicles on an erythematous base at the vermilion border of the lip.
Laboratory Results: Tzanck smear shows multinucleated giant cells.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic Tzanck smear finding in herpesvirus infections?', '["Pus cells","Multinucleated giant cells and acantholysis","Spaghetti and meatballs","Gram-negative rods"]', 1, 'Tzanck smear can identify herpesviruses (HSV/VZV) but cannot distinguish between them.'),
        (v_case_id, 'Where does the HSV-1 virus stay latent between outbreaks?', '["In the skin","Trigeminal ganglion (Sensory nerve ganglia)","Liver","Spleen"]', 1, 'The virus travels back to the nerve root and remains dormant.'),
        (v_case_id, 'Which medication is first-line for treating an acute outbreak?', '["Antibiotics","Acyclovir/Valacyclovir","Steroids","Antifungals"]', 1, 'Antiviral nucleoside analogs are the standard of care.');

    ---------------------------------------------------------------------------
    -- CASE 27: The Dew Drop on a Rose Petal
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Dew Drop on a Rose Petal', 'An 8-year-old child who has not been vaccinated presents with a ''rash that started on the face and spread to the body''. New spots are appearing daily.

Vitals: T 38.1 C.
Physical Examination: Lesions in various stages: red macules, ''dew drop'' vesicles on an erythematous base, and crusted papules. It is extremely itchy.
Laboratory Results: None.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the characteristic clinical hallmark of chickenpox?', '["All spots look identical","Lesions in all stages of development (polymorphism) present at once","Only on the palms","No itching"]', 1, 'Successive crops of lesions create the ''starry sky'' or polymorphic appearance.'),
        (v_case_id, 'Is a patient with chickenpox contagious after the lesions have crusted?', '["Yes","No, they are contagious until all lesions have crusted over","Only if they have a fever","Always"]', 1, 'Crusting marks the end of the infectious period.'),
        (v_case_id, 'What is a potential severe complication of varicella in an adult?', '["Varicella pneumonia","Better immunity","Weight gain","Hearing loss"]', 0, 'Primary varicella is often much more severe in adults than in children.');

    ---------------------------------------------------------------------------
    -- CASE 28: The Belt of Blisters
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Belt of Blisters', 'A 65-year-old male presents with severe, burning pain on the right side of his chest. Two days later, a rash of grouped blisters appears in the same area.

Vitals: Normal.
Physical Examination: Grouped vesicles on an erythematous base, following a single dermatome (T4) on the right side. The rash does not cross the midline.
Laboratory Results: None.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the cause of Shingles?', '["A new infection with HSV","Reactivation of the latent Varicella-Zoster Virus (VZV) in the dorsal root ganglion","Stress alone","Bacteria"]', 1, 'Shingles is the ''encore'' performance of chickenpox.'),
        (v_case_id, 'What is the term for persistent pain lasting >90 days after the shingles rash has healed?', '["Chronic itch","Post-Herpetic Neuralgia (PHN)","Sciatica","Eczema"]', 1, 'PHN is a common and debilitating complication in older adults.'),
        (v_case_id, 'What does the ''Hutchinson sign'' refer to in the context of Zoster?', '["A spot on the toe","Vesicles on the tip of the nose, indicating involvement of the nasociliary branch of CN V1 and high risk of ocular (eye) involvement","Hair loss","Joint pain"]', 1, 'This is a dermatologic emergency requiring an urgent ophthalmology consult.');

    ---------------------------------------------------------------------------
    -- CASE 29: The Ear Blisters
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Ear Blisters', 'A patient presents with shingles on his right face and neck. He also complains of ear pain, dizziness, and he cannot close his right eye correctly.

Vitals: Normal.
Physical Examination: Vesicles in the external auditory canal. Right-sided facial droop (Bell''''s-like palsy).
Laboratory Results: None.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Ramsay Hunt Syndrome involves which cranial nerve?', '["CN II","CN VII (Facial Nerve)","CN X","CN XII"]', 1, 'The virus affects the geniculate ganglion of the facial nerve.'),
        (v_case_id, 'What is the classic triad of Ramsay Hunt Syndrome?', '["Ipsilateral facial paralysis, ear pain, and vesicles in the ear/auditory canal","Fever, rash, joint pain","Blindness, deafness, dumbness","None of the above"]', 0, 'This combination is highly characteristic.'),
        (v_case_id, 'What is the prognosis for facial nerve recovery compared to standard Bell''s palsy?', '["Better","Generally worse, with less complete recovery","The same","Excellent"]', 1, 'Ramsay Hunt is more aggressive than idiopathic Bell''s palsy.');

    ---------------------------------------------------------------------------
    -- CASE 30: The Umbilicated Bumps
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Umbilicated Bumps', 'A 5-year-old has dozens of small, skin-colored, shiny bumps on his torso and arms. His mother says they have been there for months.

Vitals: Normal.
Physical Examination: Small (2-5 mm), firm, dome-shaped papules with a central dimple (umbilication). A ''cheesy'' plug can be expressed from the center.
Laboratory Results: Biopsy shows ''Henderson-Paterson bodies'' (intracytoplasmic viral inclusion bodies).', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What type of virus causes Molluscum Contagiosum?', '["Herpesvirus","Poxvirus","Retrovirus","HPV"]', 1, 'It is a member of the Mollusciplex genus of poxviruses.'),
        (v_case_id, 'How is it typically transmitted in children?', '["Inhaling air","Direct skin-to-skin contact or shared towels/fomites","Eating dirt","Mosquitoes"]', 1, 'Contact is the primary route of spread.'),
        (v_case_id, 'What does the appearance of widespread Molluscum in an adult (especially on the face) suggest?', '["Better health","Immunosuppression, specifically HIV/AIDS","Old age","Stress"]', 1, 'In healthy adults, it is usually a localized STI; widespread facial involvement is a ''red flag''.');

    ---------------------------------------------------------------------------
    -- CASE 31: The Common Wart
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Common Wart', 'A 10-year-old has several rough, ''cauliflower-like'' bumps on his fingers.

Vitals: Normal.
Physical Examination: Hyperkeratotic, exophytic papules with small black dots (thrombosed capillaries) on the surface.
Laboratory Results: None.', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the causative agent of warts?', '["Bacteria","Human Papillomavirus (HPV)","Fungus","Parasites"]', 1, 'HPV infects the basal layer of the epidermis.'),
        (v_case_id, 'What do the ''black dots'' seen in warts represent?', '["Wart seeds","Thrombosed (clotted) capillaries","Dirt","Fungal spores"]', 1, 'Paring down a wart reveals these pinpoint bleeding/clotting spots.'),
        (v_case_id, 'Which HPV types are most commonly associated with common warts (Verruca vulgaris)?', '["HPV 1, 2, and 4","HPV 16 and 18","HPV 6 and 11","HPV 3"]', 0, '16/18 are high-risk mucosal types; 6/11 are low-risk mucosal (genital) types.');

    ---------------------------------------------------------------------------
    -- CASE 32: The Flat Wart
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Flat Wart', 'A teenager has dozens of tiny, flat-topped, skin-colored bumps on her forehead and where she shaves her legs.

Vitals: Normal.
Physical Examination: Small (1-3 mm), smooth, flat-topped papules. Some are arranged in a linear pattern where she scratched.
Laboratory Results: None.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the term for the spread of warts along a line of trauma (like a scratch or shaving)?', '["Metastasis","Koebner phenomenon (Pseudo-Koebnerization)","Linearity","Scaling"]', 1, 'Trauma inoculates the virus into new areas.'),
        (v_case_id, 'Which HPV types are associated with flat warts?', '["HPV 3 and 10","HPV 1","HPV 16","HPV 6"]', 0, 'These are the classic ''flat'' types.'),
        (v_case_id, 'Are flat warts easy to treat?', '["Yes, very","No, they are often numerous and difficult to clear, and aggressive treatment may cause scarring","They never go away","Only with surgery"]', 1, 'The large number makes them a therapeutic challenge.');

    ---------------------------------------------------------------------------
    -- CASE 33: The Deep Foot Bump
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Deep Foot Bump', 'A patient has a painful bump on the ball of her foot that makes it feel like she is ''walking on a pebble''.

Vitals: Normal.
Physical Examination: A thick, endophytic (growing inward) hyperkeratotic plaque on the sole. Paring it down reveals pinpoint bleeding.
Laboratory Results: None.', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How can you distinguish a plantar wart from a callus?', '["Calluses are blue","Paring a wart reveals pinpoint bleeding; paring a callus reveals only more skin. Warts also hurt more with lateral pressure (squeezing) than direct pressure","There is no difference","Warts are only on the toes"]', 1, 'The ''squeeze test'' is a classic clinical maneuver.'),
        (v_case_id, 'Why do plantar warts grow inward rather than outward?', '["Because they are shy","The pressure of walking forces the wart to grow into the dermis","They are a different virus","None of the above"]', 1, 'Mechanical pressure reshapes the lesion.'),
        (v_case_id, 'What is a ''Mosaic Wart''?', '["A colorful wart","A large plaque formed by multiple small, confluent plantar warts","A fungal infection","A type of tattoo"]', 1, 'Mosaic warts are notoriously difficult to treat.');

    ---------------------------------------------------------------------------
    -- CASE 34: The Farm Hand''s Blister
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Farm Hand''s Blister', 'A 25-year-old veterinary student presents with a single, large, painless, purple-red nodule on his right thumb after working with sheep.

Vitals: Normal.
Physical Examination: A 1.5 cm firm, targetoid nodule with a gray/white necrotic center and a red inflammatory halo.
Laboratory Results: None.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the reservoir for the Orf virus?', '["Dogs","Sheep and goats","Cats","Birds"]', 1, 'It is a parapoxvirus infection transmitted from infected livestock.'),
        (v_case_id, 'What is the typical clinical course of Orf?', '["Requires surgery","Self-limited, usually resolving in 6-8 weeks without specific treatment","Lethal","Chronic"]', 1, 'Reassurance is the primary management.'),
        (v_case_id, 'What is the similar lesion acquired from dairy cows?', '["Orf","Milker''s Nodule (Pseudocowpox)","Anthrax","Cowpox"]', 1, 'Both are parapoxviruses with similar clinical appearances.');

    ---------------------------------------------------------------------------
    -- CASE 35: The Mouth and Hand Spots
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Mouth and Hand Spots', 'A 3-year-old child presents with a low-grade fever and small blisters in his mouth and on his palms and soles.

Vitals: T 37.8 C.
Physical Examination: Multiple 2-3 mm vesicles and erosions in the oral cavity. Elliptical ''football-shaped'' vesicles on the hands and feet.
Laboratory Results: Coxsackievirus A16 is suspected.', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the most common viral cause of HFMD?', '["Herpesvirus","Coxsackievirus A16","HPV","Rhinovirus"]', 1, 'Coxsackievirus A16 and Enterovirus 71 are the most common.'),
        (v_case_id, 'Which complication is more commonly associated with Enterovirus 71 (EV71) than with Coxsackie?', '["Diarrhea","Neurological involvement (e.g., encephalitis, meningitis)","Better appetite","Hair loss"]', 1, 'EV71 outbreaks in Asia have been linked to more severe systemic disease.'),
        (v_case_id, 'What is ''Onychomadesis''?', '["A type of fungus","Painless shedding/nail loss that can occur weeks after HFMD","Yellow nails","Thick nails"]', 1, 'Nail shedding is a benign, late complication of HFMD.');

    ---------------------------------------------------------------------------
    -- CASE 36: The Slapped Cheek
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Slapped Cheek', 'A 6-year-old child presents with bright red cheeks. He had a mild fever and runny nose last week.

Vitals: Normal.
Physical Examination: Bright erythematous ''slapped cheek'' appearance on the face, followed by a ''lacy'' or reticulated red rash on the trunk and limbs.
Laboratory Results: None.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the causative agent of Fifth Disease?', '["Measles virus","Parvovirus B19","HHV-6","Rubella"]', 1, 'Parvovirus B19 is the classic cause.'),
        (v_case_id, 'Is the child contagious when the ''slapped cheek'' rash appears?', '["Yes, very","No, the rash is an immunologic phenomenon and the patient is usually no longer infectious","Always","Only if they have a cough"]', 1, 'The infectious period is BEFORE the rash starts.'),
        (v_case_id, 'What is a serious risk of Parvovirus B19 infection in a pregnant woman?', '["Diabetes","Hydrops fetalis (due to fetal anemia)","Better skin","Nausea"]', 1, 'The virus infects erythrocyte precursors, potentially causing severe fetal anemia.');

    ---------------------------------------------------------------------------
    -- CASE 37: The High Fever and Then Rash
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The High Fever and Then Rash', 'An 18-month-old child has a very high fever (40 C) for 3 days but otherwise seems fine. Once the fever drops, he suddenly develops a pink rash on his trunk.

Vitals: T 37.0 C (now). 
Physical Examination: Multiple 2-5 mm pink macules and papules on the trunk and neck. No blisters.
Laboratory Results: None.', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the causative agent of Roseola?', '["HHV-6 (Human Herpesvirus 6)","HHV-1","Varicella","HPV"]', 0, 'HHV-7 is a less common cause.'),
        (v_case_id, 'What is the classic clinical sequence of Roseola?', '["Rash then fever","High fever for several days, followed by sudden fever cessation and the appearance of the rash","Fever and rash together","No fever"]', 1, 'The ''fever first, rash later'' pattern is pathognomonic.'),
        (v_case_id, 'What is a common complication of the high fever in Roseola?', '["Scarring","Febrile seizures","Kidney failure","Blindness"]', 1, 'Due to the rapid rise and high degree of fever, seizures are common.');

    ---------------------------------------------------------------------------
    -- CASE 38: The Itchy Fingers (Nighttime)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Itchy Fingers (Nighttime)', 'A 25-year-old student presents with intense itching that is worse at night. His roommates are also starting to itch.

Vitals: Normal.
Physical Examination: Small, red papules and excoriations in the finger webs, wrists, and around the belly button. A few thin, linear ''burrows'' are visible.
Laboratory Results: Skin scraping under mineral oil shows mites, eggs, and scybala (feces).', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the name of the mite that causes scabies?', '["Sarcoptes scabiei","Pediculus humanus","Cimex lectularius","Demodex"]', 0, 'The mite burrows into the stratum corneum.'),
        (v_case_id, 'Why is the itching worse at night?', '["Mites are nocturnal","It is likely a hypersensitivity reaction to the mite and its products, which is felt more when quiet/warm in bed","Colder air","It''s a psychological effect"]', 1, 'The ''itch'' is an allergic reaction, not just the mite moving.'),
        (v_case_id, 'What is the first-line topical treatment for scabies?', '["Topical Steroids","Permethrin 5% cream (applied head to toe and washed off after 8-14 hours)","Mupirocin","Ketoconazole"]', 1, 'Permethrin is highly effective and safe.');

    ---------------------------------------------------------------------------
    -- CASE 39: The Heavy Crust (Scabies)
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Heavy Crust (Scabies)', 'An elderly patient with dementia in a nursing home presents with thick, yellow-gray, ''rock-hard'' scales on her hands and feet. She does NOT complain of itching.

Vitals: Normal.
Physical Examination: Massive hyperkeratotic crusts on the palms, soles, and scalp. Beneath the crusts, millions of mites are present.
Laboratory Results: Scraping shows overwhelming numbers of mites.', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Who is at risk for Crusted Scabies?', '["Healthy teenagers","Immunosuppressed or neurologically impaired patients who cannot mount an itch response or scratch","Athletes","Newborns"]', 1, 'The lack of scratching allows the mite population to explode into the millions.'),
        (v_case_id, 'How contagious is Crusted Scabies compared to classic scabies?', '["Less contagious","Highly contagious, even through brief contact or bedding/furniture (fomites)","Not contagious","Only contagious at night"]', 1, 'The sheer number of mites makes it extremely easy to spread.'),
        (v_case_id, 'What is the recommended treatment for Crusted Scabies?', '["Topical permethrin only","Combination therapy: Oral Ivermectin plus topical Permethrin","Surgery","Antibiotics"]', 1, 'Severe cases require systemic and topical intervention.');

    ---------------------------------------------------------------------------
    -- CASE 40: The Moving Line
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Moving Line', 'A patient returns from a Caribbean vacation where he walked barefoot on the beach. He has an extremely itchy, red, ''snake-like'' line on his foot that seems to move 1 cm a day.

Vitals: Normal.
Physical Examination: An erythematous, serpiginous (wavy) thin track on the dorsum of the foot.
Laboratory Results: None.', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What causes Cutaneous Larva Migrans?', '["Fungus","Hookworm larvae (usually Ancylostoma braziliense) from cats and dogs","Viral infection","Bacteria"]', 1, 'The larvae penetrate the skin but cannot complete their life cycle in humans, so they just wander.'),
        (v_case_id, 'Why does the line ''move''?', '["It is a blood vessel","It represents the literal path of the migrating larva as it tunnels through the skin","It is an allergic reaction","It doesn''t actually move"]', 1, 'The larva travels a few millimeters to centimeters each day.'),
        (v_case_id, 'How is it treated?', '["Surgery","Oral Ivermectin or Albendazole","Topical Steroids","Walking more"]', 1, 'Anthelmintics are very effective.');

    ---------------------------------------------------------------------------
    -- CASE 41: The Head Itch
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Head Itch', 'An elementary school child is sent home because of ''white spots'' in her hair that won''t brush out.

Vitals: Normal.
Physical Examination: Small, white, oval cases (nits) firmly attached to the hair shafts, especially behind the ears and at the nape of the neck.
Laboratory Results: A live, 2 mm insect is seen with a fine-tooth comb.', 41)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How can you distinguish a nit from dandruff?', '["Nits are blue","Dandruff flakes off easily; nits are firmly ''glued'' to the hair shaft and cannot be flicked away","Nits are larger","There is no difference"]', 1, 'Lice use a cement-like substance to attach their eggs.'),
        (v_case_id, 'How are head lice primarily transmitted?', '["Flying from person to person","Direct head-to-head contact","Eating contaminated food","From pets"]', 1, 'Lice cannot fly or jump; they crawl.'),
        (v_case_id, 'Is it necessary to exclude children from school if they have nits but no live lice?', '["Yes, immediately","Most major health organizations now recommend AGAINST ''no-nit'' policies, as nits alone do not necessarily mean an active infection","Always","Only in the winter"]', 1, 'Management has become more evidence-based and less exclusionary.');

    ---------------------------------------------------------------------------
    -- CASE 42: The Body Louse
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Body Louse', 'A homeless patient presents with intense itching on his back and waist. He has not changed his clothes in 3 weeks.

Vitals: Normal.
Physical Examination: Linear excoriations on the trunk. No lice are found on his skin, but many insects are found in the seams of his undershirt.
Laboratory Results: None.', 42)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Where does the body louse live and lay its eggs?', '["On the skin","In the seams of clothing","On the head","In the shoes"]', 1, 'The louse only visits the skin to feed.'),
        (v_case_id, 'What is the primary treatment for body lice?', '["Shaving the body","Laundering all clothing and bedding in hot water (50+ C) and improving hygiene","Topical permethrin for the whole body","Antibiotics"]', 1, 'Treating the clothes is more important than treating the skin.'),
        (v_case_id, 'What dangerous diseases can body lice transmit?', '["HIV","Epidemic Typhus, Trench Fever, and Relapsing Fever","Malaria","Cancer"]', 1, 'Body lice are significant vectors for Rickettsial and Borrelia infections.');

    ---------------------------------------------------------------------------
    -- CASE 43: The Crabs
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Crabs', 'A patient presents with ''blue spots'' on his lower abdomen and intense itching in his pubic hair.

Vitals: Normal.
Physical Examination: Broad, flat-bodied lice attached to the base of pubic hairs. Multiple 0.5 cm blue macules (maculae ceruleae) on the thighs and belly.
Laboratory Results: None.', 43)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the name of the pubic louse?', '["Pthirus pubis","Pediculus humanus","Sarcoptes","Cimex"]', 0, 'It is morphologically distinct from head/body lice (looks like a crab).'),
        (v_case_id, 'What causes the ''blue spots'' (maculae ceruleae)?', '["Bruising from scratching","Anticoagulant saliva from the feeding louse converting hemoglobin to biliverdin","The color of the louse","Ink from a pen"]', 1, 'This is a classic clinical sign of pubic lice.'),
        (v_case_id, 'Besides the pubic area, where else can ''crabs'' occasionally be found, especially in children?', '["The scalp","The eyelashes (pediculosis ciliaris)","The palms","The tongue"]', 1, 'Lice on the eyelashes in a child should raise concern for potential sexual abuse.');

    ---------------------------------------------------------------------------
    -- CASE 44: The Non-Healing Volcano
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Non-Healing Volcano', 'A soldier returning from a tour in the Middle East presents with a painless, crusty ulcer on his cheek that won''t heal after 2 months.

Vitals: Normal.
Physical Examination: A firm, erythematous plaque that has ulcerated in the center, resembling a ''small volcano''.
Laboratory Results: Biopsy (Amastigotes) or PCR confirms Leishmania species.', 44)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'How is Leishmaniasis transmitted?', '["Mosquitoes","Sandflies","Ticks","Flies"]', 1, 'Phlebotomine sandflies carry the protozoan parasite.'),
        (v_case_id, 'What is the diagnostic form of the parasite seen inside macrophages on skin biopsy?', '["Promastigotes","Amastigotes (Leishman-Donovan bodies)","Larvae","Eggs"]', 1, 'Amastigotes are the non-motile form found in human tissues.'),
        (v_case_id, 'What is the typical clinical course for the most common forms of cutaneous leishmaniasis?', '["Lethal in 1 week","Chronic, but often self-healing over 6-18 months, leaving a scar","Spreads to the brain","Turns into cancer"]', 1, 'While self-healing is common, treatment is often used to prevent scarring or mucosal spread.');

    ---------------------------------------------------------------------------
    -- CASE 45: The Breakfast, Lunch, and Dinner
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Breakfast, Lunch, and Dinner', 'A traveler stays in a budget hostel and wakes up with clusters of extremely itchy red bumps in a row on her arms.

Vitals: Normal.
Physical Examination: Linear clusters of 3-5 erythematous papules (''breakfast, lunch, and dinner'' sign).
Laboratory Results: None.', 45)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic bite pattern of bedbugs?', '["Single bite","A line or cluster of three bites (''''breakfast, lunch, and dinner'''')","A circle","Widespread redness"]', 1, 'Bedbugs tend to feed sequentially along a line.'),
        (v_case_id, 'Do bedbugs transmit major human diseases?', '["Yes, Typhus","No, they are primarily a nuisance causing local irritation and anxiety, though they can carry pathogens, transmission is not proven","Yes, HIV","Yes, Malaria"]', 1, 'Unlike lice or ticks, bedbugs are not known vectors of disease.'),
        (v_case_id, 'How are bedbugs best eradicated?', '["Topical steroids","Professional pest control using heat treatment or insecticides","Washing the skin","Buying a new bed only"]', 1, 'They are notoriously difficult to kill and hide in cracks/crevices.');

    ---------------------------------------------------------------------------
    -- CASE 46: The Swimming Pool Wart
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Swimming Pool Wart', 'A patient presents with a single, rough, scaly plaque on his knee that has been there for 6 months. He swims in a public pool daily.

Vitals: Normal.
Physical Examination: A violaceous-to-red, warty (verrucous) plaque on the knee.
Laboratory Results: Biopsy shows granulomatous inflammation and culture grows Mycobacterium marinum.', 46)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the causative organism?', '["Mycobacterium tuberculosis","Mycobacterium marinum","Staph aureus","HPV"]', 1, 'M. marinum is an atypical mycobacterium found in water.'),
        (v_case_id, 'How is it acquired?', '["Inhaling pool water","Inoculation of the bacteria into a pre-existing scrape or cut while in a pool or cleaning a fish tank","Eating raw fish","Drinking pool water"]', 1, 'Traumatic entry is required.'),
        (v_case_id, 'Can this infection show ''sporotrichoid'' spread?', '["No","Yes, it can spread along the lymphatics similar to Sporotrichosis","Only in the water","It stays localized to the eye"]', 1, 'M. marinum is one of the classic causes of a sporotrichoid pattern.');

    ---------------------------------------------------------------------------
    -- CASE 47: The Cat Scratch Sore
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Cat Scratch Sore', 'A 10-year-old child presents with a swollen, painful lymph node in his armpit. He was scratched by a new kitten 2 weeks ago.

Vitals: T 37.5 C.
Physical Examination: A small, red, healing papule on the hand. A very large, tender, fluctuant lymph node in the axilla (bubo).
Laboratory Results: Serology is positive for Bartonella henselae.', 47)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the causative organism of Cat Scratch Disease?', '["Bartonella henselae","Pasteurella multocida","Toxoplasma","Rabies virus"]', 0, 'B. henselae is a Gram-negative bacterium.'),
        (v_case_id, 'What is the hallmark clinical finding in Cat Scratch Disease?', '["Rash everywhere","Regional lymphadenopathy (swelling of the nodes draining the scratch site)","Blindness","Cough"]', 1, 'The lymphadenopathy is often much larger than expected from the tiny scratch.'),
        (v_case_id, 'What is the typical management for a healthy child?', '["Surgery to remove the node","Supportive care (usually self-limited), though Azithromycin may speed up node resolution","Lifelong antibiotics","Avoiding all animals"]', 1, 'Most cases resolve on their own within 2-4 months.');

    ---------------------------------------------------------------------------
    -- CASE 48: The Dog Bite Infection
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Dog Bite Infection', 'A patient is bitten by a dog on the hand. Within 12 hours, the hand is extremely red, swollen, and leaking foul-smelling pus.

Vitals: T 38.0 C.
Physical Examination: Intense cellulitis and purulent discharge from the puncture wounds.
Laboratory Results: Culture grows Pasteurella multocida.', 48)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'Which organism is famously associated with rapid-onset cellulitis after dog or cat bites?', '["Staph aureus","Pasteurella multocida","Bartonella","E. coli"]', 1, 'Pasteurella is part of the normal oral flora of many pets.'),
        (v_case_id, 'How fast does Pasteurella cellulitis typically develop?', '["1 week","Very rapidly (often <24 hours after the bite)","1 month","Instantly"]', 1, 'The speed of onset is a key diagnostic clue.'),
        (v_case_id, 'What is the first-line antibiotic for animal bites?', '["Cephalexin","Amoxicillin-Clavulanate (Augmentin)","Vancomycin","Metronidazole"]', 1, 'Augmentin provides excellent coverage for both Pasteurella and anaerobic mouth flora.');

    ---------------------------------------------------------------------------
    -- CASE 49: The Red Streak
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Red Streak', 'A patient with a small infected cut on his finger notices a thin, red line ''climbing'' up his arm toward his armpit.

Vitals: T 37.9 C.
Physical Examination: A 1 cm red, tender streak extending from the finger to the axilla. The axillary lymph nodes are tender.
Laboratory Results: None.', 49)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What does the ''red streak'' represent?', '["A vein","Inflammation of a lymphatic vessel (lymphangitis) draining an infection site","A scratch","A nerve"]', 1, 'It is a sign that the infection is spreading along the lymphatic channels.'),
        (v_case_id, 'What is the most common organism causing acute lymphangitis?', '["Staph aureus","Streptococcus pyogenes","Pseudomonas","Fungus"]', 1, 'Group A Strep is the classic ''streak'' producer.'),
        (v_case_id, 'Is this condition an emergency?', '["No","Yes, it indicates spreading infection and requires prompt systemic antibiotics to prevent bacteremia/sepsis","Only in the elderly","Only if it turns blue"]', 1, 'Prompt treatment is necessary to stop the spread.');

    ---------------------------------------------------------------------------
    -- CASE 50: The Fisherman''''s Hand
    ---------------------------------------------------------------------------
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Fisherman''''s Hand', 'A fisherman pricks his finger on a fish bone. Two days later, he has a painful, dusky-red, well-demarcated plaque on his hand.

Vitals: Normal.
Physical Examination: A violaceous, non-pitting, indurated plaque that is slowly expanding at the edges while clearing in the center.
Laboratory Results: Culture grows Erysipelothrix rhusiopathiae.', 50)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)
    VALUES
        (v_case_id, 'What is the classic association for Erysipeloid?', '["Farmers","Fishermen, butchers, and poultry workers (occupational exposure to fish/meat)","Software engineers","Hikers"]', 1, 'It is an occupational disease of meat/fish handlers.'),
        (v_case_id, 'How does Erysipeloid differ from Erysipelas?', '["Erysipelas has fever and is usually on the face; Erysipeloid is usually on the hands and lacks systemic symptoms (fever is rare)","They are the same","Erysipeloid is blue","Erysipelas is a fungus"]', 0, 'The name is similar but the diseases are distinct.'),
        (v_case_id, 'What is the causative agent of Erysipeloid?', '["Strep pyogenes","Erysipelothrix rhusiopathiae","Pasteurella","Salmonella"]', 1, 'It is a Gram-positive rod.');

    RAISE NOTICE 'Finished populating 50 cases for derm-infectious.';
END $$;

COMMIT;
