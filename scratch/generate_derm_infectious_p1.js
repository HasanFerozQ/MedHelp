module.exports = [
  {
    title: "The Golden Crust",
    scenario: "A 5-year-old child presents with several itchy, honey-colored crusted sores around his nose and mouth.\n\nVitals: Normal.\nPhysical Examination: Multiple erythematous macules and papules that have progressed to thin-walled vesicles and characteristic honey-colored (golden) crusts.\nLaboratory Results: Swab culture grows Staphylococcus aureus.",
    disease: "Non-Bullous Impetigo",
    questions: [
      {
        q: "What is the most common causative organism of non-bullous impetigo?",
        options: ["Streptococcus pneumoniae", "Staphylococcus aureus (most common) or Streptococcus pyogenes", "Pseudomonas aeruginosa", "Escherichia coli"],
        ans: 1,
        exp: "S. aureus is now the most common isolate, though Group A Strep was historically dominant."
      },
      {
        q: "What is the recommended first-line treatment for localized impetigo?",
        options: ["Oral Vancomycin", "Topical Mupirocin or Retapamulin", "Systemic Steroids", "Topical Ketoconazole"],
        ans: 1,
        exp: "Topical antibiotics are effective for localized disease; systemic agents are reserved for widespread cases."
      },
      {
        q: "What serious renal complication can follow impetigo caused by nephritogenic strains of Strep?",
        options: ["Renal Cell Carcinoma", "Post-streptococcal Glomerulonephritis (PSGN)", "Minimal Change Disease", "Kidney Stones"],
        ans: 1,
        exp: "PSGN can follow skin infections (unlike Rheumatic Fever, which only follows pharyngitis)."
      }
    ]
  },
  {
    title: "The Large Blisters",
    scenario: "A 2-year-old toddler presents with large, clear-to-cloudy blisters on his trunk that rupture easily, leaving a shiny, red base.\n\nVitals: Normal.\nPhysical Examination: Tense and flaccid bullae (1-3 cm) with minimal surrounding erythema. Nikolsky sign is negative.\nLaboratory Results: Toxin-producing S. aureus is isolated.",
    disease: "Bullous Impetigo",
    questions: [
      {
        q: "What bacterial toxin is responsible for the formation of blisters in bullous impetigo?",
        options: ["Exfoliative toxin A (targeting Desmoglein 1)", "Toxic Shock Syndrome Toxin (TSST-1)", "Endotoxin", "Streptolysin O"],
        ans: 0,
        exp: "The exfoliative toxin cleaves Desmoglein 1, causing intraepidermal splitting."
      },
      {
        q: "Bullous impetigo is a localized form of which systemic condition?",
        options: ["Toxic Shock Syndrome", "Staphylococcal Scalded Skin Syndrome (SSSS)", "Erysipelas", "Necrotizing Fasciitis"],
        ans: 1,
        exp: "SSSS is the generalized version of this toxin-mediated cleavage."
      },
      {
        q: "Which layer of the skin is the site of the cleavage in bullous impetigo?",
        options: ["Subcutaneous fat", "Granular layer (High epidermis)", "Dermal-epidermal junction", "Deep dermis"],
        ans: 1,
        exp: "Desmoglein 1 is located in the upper epidermis, specifically the granular layer."
      }
    ]
  },
  {
    title: "The Punched-Out Ulcer",
    scenario: "A homeless patient presents with a painful, deep ulcer on his lower leg covered by a thick, greenish-yellow crust. He says it started as a small 'pustule'.\n\nVitals: Normal.\nPhysical Examination: A deep, 'punched-out' ulcer with a violaceous rim and an overlying thick adherent crust on the pretibial area.\nLaboratory Results: Culture grows Group A Streptococcus.",
    disease: "Ecthyma",
    questions: [
      {
        q: "How does Ecthyma differ from Impetigo?",
        options: ["It is only on the face", "It is a deeper (dermal) extension of the infection, whereas impetigo is superficial", "It is caused by a virus", "It is not contagious"],
        ans: 1,
        exp: "Ecthyma is often described as 'deep impetigo' because it penetrates into the dermis."
      },
      {
        q: "Does Ecthyma typically heal with scarring?",
        options: ["No, never", "Yes, because the infection involves the dermis", "Only in children", "Only if treated with antibiotics"],
        ans: 1,
        exp: "Superficial infections like impetigo don't scar, but dermal infections like ecthyma do."
      },
      {
        q: "Which patient population is most predisposed to Ecthyma?",
        options: ["Elite athletes", "Patients with poor hygiene, malnutrition, or immunosuppression", "Newborns", "University students"],
        ans: 1,
        exp: "Neglect and crowded conditions are major risk factors."
      }
    ]
  },
  {
    title: "The Spreading Redness",
    scenario: "A 60-year-old diabetic male presents with a warm, red, swollen right lower leg. He has tinea pedis between his toes.\n\nVitals: T 38.2 C.\nPhysical Examination: Diffuse, ill-defined erythema, warmth, and tenderness of the right calf. No crepitus or fluctuance.\nLaboratory Results: Leukocytosis (WBC 14,000).",
    disease: "Cellulitis",
    questions: [
      {
        q: "What is the most common entry point for lower extremity cellulitis?",
        options: ["Inhaling bacteria", "Interdigital tinea pedis (cracks between the toes)", "A clean surgical wound", "Eating contaminated food"],
        ans: 1,
        exp: "Fungal infections provide a portal of entry for skin bacteria."
      },
      {
        q: "Which organisms are the most frequent causes of non-purulent cellulitis?",
        options: ["Staph aureus and Strep pyogenes", "Pseudomonas and Proteus", "E. coli and Klebsiella", "Mycobacteria"],
        ans: 0,
        exp: "Gram-positive cocci are the overwhelming majority."
      },
      {
        q: "How do you distinguish cellulitis from erysipelas clinicaly?",
        options: ["Cellulitis is blue", "Cellulitis has ill-defined borders and involves the deep dermis/subcutis; Erysipelas has sharply demarcated borders and is more superficial", "Erysipelas is painless", "There is no difference"],
        ans: 1,
        exp: "Erysipelas is a more superficial 'bright red' variant of cellulitis."
      }
    ]
  },
  {
    title: "The Bright Red Face",
    scenario: "A 45-year-old female presents with a sudden onset of a bright red, painful rash on her left cheek that is rapidly expanding. It has a raised, sharp border.\n\nVitals: T 38.9 C.\nPhysical Examination: Well-demarcated, 'fiery' red, indurated plaque on the malar area. The border is palpable and distinct from normal skin.\nLaboratory Results: Elevated ESR.",
    disease: "Erysipelas (St. Anthony''s Fire)",
    questions: [
      {
        q: "What is the classic causative organism of erysipelas?",
        options: ["Group A Beta-hemolytic Streptococcus", "Staph aureus", "Pseudomonas", "Bartonella"],
        ans: 0,
        exp: "Streptococcus pyogenes is the primary pathogen."
      },
      {
        q: "Why are the borders of erysipelas more distinct than cellulitis?",
        options: ["Because it's a virus", "Because it involves the superficial dermis and prominent lymphatic involvement", "Because the patient is younger", "It's a mystery"],
        ans: 1,
        exp: "The superficial location results in a more dramatic clinical edge."
      },
      {
        q: "What is a common site for erysipelas besides the lower legs?",
        options: ["The palms", "The face (malar area)", "The scalp", "The fingernails"],
        ans: 1,
        exp: "The face is a classic location for erysipelas."
      }
    ]
  },
  {
    title: "The Surgical Emergency",
    scenario: "A patient presents with extreme pain in his left thigh that is 'out of proportion' to the mild redness seen on the skin. Within hours, the skin turns dusky and purple with some bullae.\n\nVitals: T 40.0 C, HR 130, BP 85/50 (Septic Shock).\nPhysical Examination: Woody induration of the skin, crepitus (gas in tissues), and rapid progression of dusky necrosis.\nLaboratory Results: Elevated Creatine Kinase (CK) and low Sodium (Hyponatremia).",
    disease: "Necrotizing Fasciitis",
    questions: [
      {
        q: "What is the most critical first step in management for suspected necrotizing fasciitis?",
        options: ["Start topical antibiotics", "Immediate surgical consultation for emergent debridement", "Wait for culture results", "Apply ice"],
        ans: 1,
        exp: "Necrotizing fasciitis is a surgical emergency; 'time is tissue'."
      },
      {
        q: "Which clinical sign is highly suggestive of Type I (polymicrobial) necrotizing fasciitis?",
        options: ["Itching", "Crepitus (palpable gas bubbles in the tissue)", "Hair loss", "A freckle"],
        ans: 1,
        exp: "Gas-producing anaerobes cause the characteristic crackling feel."
      },
      {
        q: "What is Type II necrotizing fasciitis caused by?",
        options: ["Group A Streptococcus (''flesh-eating bacteria'')", "Staph epidermidis", "Fungi", "Viruses"],
        ans: 0,
        exp: "Type II is monomicrobial, usually due to virulent Strep pyogenes."
      }
    ]
  },
  {
    title: "The Coral-Red Glow",
    scenario: "A 40-year-old obese male complains of a dark, non-itchy rash in his armpits and groin that has been there for months.\n\nVitals: Normal.\nPhysical Examination: Well-demarcated, reddish-brown, slightly scaly patches in the intertriginous areas (axillae, groin).\nLaboratory Results: Wood''s lamp examination shows a brilliant 'coral-red' fluorescence.",
    disease: "Erythrasma",
    questions: [
      {
        q: "What is the causative organism of Erythrasma?",
        options: ["Corynebacterium minutissimum", "Staph aureus", "Candida albicans", "Trichophyton rubrum"],
        ans: 0,
        exp: "It is a bacterial infection, not fungal, despite its appearance."
      },
      {
        q: "What substance produced by the bacteria causes the coral-red fluorescence?",
        options: ["Melanin", "Coproporphyrin III", "Chlorophyll", "Hemoglobin"],
        ans: 1,
        exp: "Porphyrin production is the hallmark of this organism."
      },
      {
        q: "What is the first-line treatment for Erythrasma?",
        options: ["Antifungal cream", "Topical or oral Erythromycin/Clindamycin", "Moisturizers", "Steroids"],
        ans: 1,
        exp: "Since it is a Corynebacterium, it responds well to macrolides."
      }
    ]
  },
  {
    title: "The Smelly Feet",
    scenario: "A 20-year-old athlete complains of extremely foul-smelling feet. His socks are always sweaty.\n\nVitals: Normal.\nPhysical Examination: Multiple 1-3 mm shallow 'pits' or craters in the thickened skin of the weight-bearing areas of the soles.\nLaboratory Results: Wood''s lamp is negative.",
    disease: "Pitted Keratolysis",
    questions: [
      {
        q: "What causes the 'pits' in Pitted Keratolysis?",
        options: ["Bacteria (Kytococcus sedentarius) producing proteases that digest the stratum corneum", "Walking on gravel", "Fungal infection", "Excessive scrubbing"],
        ans: 0,
        exp: "Bacterial proteases literally eat the skin."
      },
      {
        q: "What is the most common symptom besides the appearance?",
        options: ["Pain", "Bromhidrosis (foul odor)", "Numbness", "Itching"],
        ans: 1,
        exp: "The odor is caused by sulfur compounds produced by the bacteria."
      },
      {
        q: "How is it managed?",
        options: ["Buying new shoes", "Topical antibiotics (clindamycin/erythromycin) and keeping feet dry", "Surgery", "Antifungals"],
        ans: 1,
        exp: "Reducing moisture and killing the bacteria is effective."
      }
    ]
  },
  {
    title: "The Hot Tub Rash",
    scenario: "A 25-year-old male develops an itchy, bumpy rash on his trunk and buttocks 2 days after using a hotel hot tub.\n\nVitals: Normal.\nPhysical Examination: Numerous erythematous follicular papules and pustules concentrated under the areas covered by his swim trunks.\nLaboratory Results: Culture grows Pseudomonas aeruginosa.",
    disease: "Hot Tub Folliculitis",
    questions: [
      {
        q: "What is the classic organism associated with Hot Tub Folliculitis?",
        options: ["Staph aureus", "Pseudomonas aeruginosa", "E. coli", "Candida"],
        ans: 1,
        exp: "Pseudomonas thrives in warm, poorly chlorinated water."
      },
      {
        q: "Why is the rash often worse under the swimwear?",
        options: ["Swimwear is toxic", "The fabric traps the contaminated water against the skin for a longer period", "Sun exposure protects the rest of the skin", "It is a coincidence"],
        ans: 1,
        exp: "Occlusion promotes bacterial penetration into the follicles."
      },
      {
        q: "What is the typical management?",
        options: ["Oral Ciprofloxacin for everyone", "Observation (most cases are self-limited and resolve in 7-10 days)", "Burning the hot tub", "Daily bleach baths"],
        ans: 1,
        exp: "Healthy individuals usually clear the infection without specific treatment."
      }
    ]
  },
  {
    title: "The Black Eschar",
    scenario: "A rancher presents with a painless, black, sunken sore on his forearm. He mentions several of his cows recently died unexpectedly.\n\nVitals: T 37.9 C.\nPhysical Examination: A central black necrotic eschar surrounded by a ring of non-pitting edema and small vesicles.\nLaboratory Results: Large, Gram-positive 'box-car' shaped bacilli in chains.",
    disease: "Cutaneous Anthrax",
    questions: [
      {
        q: "What is the causative agent of Anthrax?",
        options: ["Bacillus anthracis", "Bartonella henselae", "Francisella tularensis", "Yersinia pestis"],
        ans: 0,
        exp: "B. anthracis is a spore-forming bacterium."
      },
      {
        q: "Is the cutaneous lesion of anthrax usually painful?",
        options: ["Yes, extremely", "No, it is characteristically painless (though it may be itchy)", "Only in children", "Only if it bleeds"],
        ans: 1,
        exp: "The lack of pain despite the dramatic appearance is a key clinical clue."
      },
      {
        q: "What is the drug of choice for treatment?",
        options: ["Penicillin", "Ciprofloxacin or Doxycycline", "Ketoconazole", "Acyclovir"],
        ans: 1,
        exp: "Fluoroquinolones are the mainstay of treatment."
      }
    ]
  },
  {
    title: "The Scaly Scalp (Child)",
    scenario: "An 8-year-old boy has an expanding patch of hair loss on the back of his head. The remaining hair looks like 'black dots'. His kitten also has some hair loss.\n\nVitals: Normal.\nPhysical Examination: Well-demarcated, scaly plaque with 'black dot' alopecia (hairs broken at the surface). Occipital lymphadenopathy is present.\nLaboratory Results: KOH prep shows spores within the hair shaft (endothrix).",
    disease: "Tinea Capitis",
    questions: [
      {
        q: "What is the most common cause of Tinea Capitis in the USA?",
        options: ["Microsporum canis", "Trichophyton tonsurans", "Trichophyton rubrum", "Candida albicans"],
        ans: 1,
        exp: "T. tonsurans is the leading cause, often showing endothrix (internal) spores."
      },
      {
        q: "What is the first-line treatment for Tinea Capitis?",
        options: ["Topical Ketoconazole cream", "Oral Griseofulvin or Terbinafine", "Antibiotic syrup", "Steroid injections"],
        ans: 1,
        exp: "Topical treatment fails because the fungus is deep inside the hair follicle; systemic therapy is mandatory."
      },
      {
        q: "What does 'Black Dot' alopecia represent?",
        options: ["Moles on the scalp", "Hair shafts that have broken off at the scalp surface due to fungal fragility", "Dirty hair", "New hair growth"],
        ans: 1,
        exp: "This is a classic sign of T. tonsurans infection."
      }
    ]
  },
  {
    title: "The Boggy Swelling",
    scenario: "A 6-year-old girl with Tinea Capitis develops a large, painful, boggy, pus-filled mass on her scalp with associated fever.\n\nVitals: T 38.2 C.\nPhysical Examination: A thick, fluctuant, inflammatory plaque (Kerion) with pustules and crusting. Hair pulls out easily without pain.\nLaboratory Results: Culture grows Microsporum canis.",
    disease: "Kerion (Inflammatory Tinea Capitis)",
    questions: [
      {
        q: "What is a Kerion?",
        options: ["A bacterial abscess", "A severe, cell-mediated hypersensitivity reaction to a dermatophyte infection", "A type of tumor", "A birthmark"],
        ans: 1,
        exp: "It represents a robust immune response, not a secondary bacterial infection."
      },
      {
        q: "Does a Kerion require incision and drainage (I&D)?",
        options: ["Yes, always", "No, it should be treated with oral antifungals and potentially oral steroids to reduce inflammation and scarring", "Only if it is red", "Only if it hurts"],
        ans: 1,
        exp: "I&D is contraindicated and can worsen scarring."
      },
      {
        q: "What is a common long-term complication of an untreated or severe Kerion?",
        options: ["Brain damage", "Permanent scarring alopecia (hair loss)", "Better hair growth", "Itching forever"],
        ans: 1,
        exp: "The intense inflammation can destroy the hair follicles permanently."
      }
    ]
  },
  {
    title: "The Itchy Rings",
    scenario: "A wrestler presents with several itchy, ring-shaped rashes on his arms and trunk.\n\nVitals: Normal.\nPhysical Examination: Annular erythematous plaques with a scaly, advancing border and central clearing.\nLaboratory Results: KOH prep shows branching, septate hyphae.",
    disease: "Tinea Corporis",
    questions: [
      {
        q: "What is the classic appearance of tinea corporis (ringworm)?",
        options: ["Solid red bumps", "Annular (ring-shaped) lesions with central clearing and a scaly border", "Blisters in a line", "White spots"],
        ans: 1,
        exp: "The 'ring' shape is due to the fungus moving outward as the center heals."
      },
      {
        q: "Which organism is the most common cause of tinea corporis worldwide?",
        options: ["Trichophyton rubrum", "Candida albicans", "Staph aureus", "Malassezia furfur"],
        ans: 0,
        exp: "T. rubrum is the most common dermatophyte globally."
      },
      {
        q: "How is localized tinea corporis typically treated?",
        options: ["Oral antibiotics", "Topical antifungals (e.g., Terbinafine, Clotrimazole)", "Topical steroids", "Moisturizers"],
        ans: 1,
        exp: "Topical azoles or allylamines are usually sufficient."
      }
    ]
  },
  {
    title: "The Jock Itch",
    scenario: "A 25-year-old male presents with an itchy, red rash in his groin. He also has scaly feet.\n\nVitals: Normal.\nPhysical Examination: Erythematous, scaly plaques in the bilateral inguinal folds. The scrotum is characteristically spared.\nLaboratory Results: KOH positive for hyphae.",
    disease: "Tinea Cruris",
    questions: [
      {
        q: "What is a key clinical feature that distinguishes Tinea Cruris from Candidiasis?",
        options: ["It is not red", "Tinea cruris usually spares the scrotum, whereas Candidiasis often involves it", "Tinea cruris is painless", "There is no difference"],
        ans: 1,
        exp: "Candidiasis loves moist surfaces like the scrotum; dermatophytes prefer the keratinized skin of the folds."
      },
      {
        q: "Why should you check the feet of a patient with Tinea Cruris?",
        options: ["To see their shoes", "Autoinoculation often occurs from Tinea Pedis (fungus spreads from feet to groin while dressing)", "To check for height", "It is just good practice"],
        ans: 1,
        exp: "The 'two feet, one hand' (or one groin) pattern is common."
      },
      {
        q: "What is the primary risk factor?",
        options: ["Cold weather", "Heat, humidity, and occlusive clothing", "Eating sugar", "Old age"],
        ans: 1,
        exp: "Sweat and friction create the perfect environment for fungus."
      }
    ]
  },
  {
    title: "The Moccasin Foot",
    scenario: "A 50-year-old male has chronic, dry, scaly skin on the soles and sides of both feet. He thinks it is just 'dry skin'.\n\nVitals: Normal.\nPhysical Examination: Fine, silvery-white scale in a 'moccasin' distribution over the plantar and lateral surfaces of the feet.\nLaboratory Results: KOH positive.",
    disease: "Tinea Pedis (Moccasin Type)",
    questions: [
      {
        q: "Which organism is most commonly responsible for the moccasin type of tinea pedis?",
        options: ["Microsporum canis", "Trichophyton rubrum", "Candida", "Epidermophyton floccosum"],
        ans: 1,
        exp: "T. rubrum is the classic cause of chronic, scaly tinea pedis."
      },
      {
        q: "What is the 'Two Feet, One Hand' syndrome?",
        options: ["A circus act", "Tinea pedis involving both feet and tinea manuum involving the dominant (or one) hand", "A type of coordination", "None of the above"],
        ans: 1,
        exp: "This is a very common clinical presentation of T. rubrum infection."
      },
      {
        q: "Is moccasin-type tinea pedis easy to treat with topicals alone?",
        options: ["Yes, always", "No, it is often recalcitrant and may require oral terbinafine for full clearance", "It requires surgery", "It clears with soap"],
        ans: 1,
        exp: "The thickened skin (hyperkeratosis) makes it difficult for topicals to penetrate."
      }
    ]
  },
  {
    title: "The Scaly Palm",
    scenario: "A patient has chronic scaling on the palm of his right hand. His left hand and both feet are normal.\n\nVitals: Normal.\nPhysical Examination: Diffuse hyperkeratosis and fine white scale in the creases of the right palm.\nLaboratory Results: KOH positive.",
    disease: "Tinea Manuum",
    questions: [
      {
        q: "Tinea manuum is most frequently associated with which other infection?",
        options: ["Tinea capitis", "Tinea pedis", "Acne", "Warts"],
        ans: 1,
        exp: "Fungus is often 'picked up' from the feet."
      },
      {
        q: "What does it often mimic?",
        options: ["A burn", "Chronic irritant contact dermatitis or psoriasis", "A freckle", "Nothing"],
        ans: 1,
        exp: "The unilateral distribution is a major clue that it's fungal rather than eczematous."
      },
      {
        q: "Is it usually unilateral or bilateral?",
        options: ["Bilateral", "Unilateral (usually involving only one hand)", "Only on fingers", "Always involves nails"],
        ans: 1,
        exp: "The 'one hand' part of 'two feet, one hand' is characteristic."
      }
    ]
  },
  {
    title: "The Deep Fungal Bumps",
    scenario: "A woman who has been using a high-potency steroid cream for 'eczema' on her leg for 3 weeks notices the rash is getting worse and now has deep, painful bumps.\n\nVitals: Normal.\nPhysical Examination: Erythematous, follicular papules and nodules within a scaly plaque. The border is less distinct than before.\nLaboratory Results: Biopsy shows fungal hyphae within the hair follicle and dermis.",
    disease: "Majocchi''s Granuloma",
    questions: [
      {
        q: "What is Majocchi''s Granuloma?",
        options: ["A type of cancer", "A deep, follicular dermatophyte infection, often triggered by topical steroid use on a tinea lesion", "A bacterial infection", "A viral wart"],
        ans: 1,
        exp: "Steroids suppress the local immune response, allowing the fungus to invade deeper into the follicle."
      },
      {
        q: "Can this be treated with topical antifungals alone?",
        options: ["Yes", "No, because the fungus is deep in the dermis/follicle, oral antifungals are required", "Yes, with more steroids", "It requires surgery"],
        ans: 1,
        exp: "Systemic therapy is necessary to reach the deep infection."
      },
      {
        q: "Which patient population is most at risk?",
        options: ["Athletes", "Women who shave their legs (introducing fungus) and use topical steroids on the area", "Children", "Elderly"],
        ans: 1,
        exp: "Trauma from shaving and steroid use are classic risk factors."
      }
    ]
  },
  {
    title: "The Thickened Nails",
    scenario: "A 60-year-old male presents with yellow, thickened, crumbling toenails.\n\nVitals: Normal.\nPhysical Examination: Subungual hyperkeratosis (debris under the nail), onycholysis (separation of nail), and yellow-brown discoloration.\nLaboratory Results: Fungal culture or PAS stain of nail clippings confirms dermatophytes.",
    disease: "Onychomycosis (Tinea Unguium)",
    questions: [
      {
        q: "What is the most common clinical type of onychomycosis?",
        options: ["White superficial", "Distal lateral subungual (DLSO)", "Proximal subungual (PSO)", "Total dystrophic"],
        ans: 1,
        exp: "DLSO is the most frequent form seen in clinical practice."
      },
      {
        q: "Which type of onychomycosis is a strong marker for immunosuppression (e.g., HIV)?",
        options: ["Distal lateral", "Proximal subungual onychomycosis (PSO)", "White superficial", "None"],
        ans: 1,
        exp: "PSO is rare in healthy individuals and should prompt an HIV screen."
      },
      {
        q: "What is the most effective treatment for toenail onychomycosis?",
        options: ["Antifungal nail polish for 1 week", "Oral Terbinafine (for 12 weeks)", "Oral Terbinafine (for 1 week)", "Pulling the nail out"],
        ans: 1,
        exp: "Oral therapy is superior to topicals, and toenails require a longer course (12 weeks) than fingernails (6 weeks)."
      }
    ]
  },
  {
    title: "The Multi-Colored Back",
    scenario: "A young woman notices white patches on her tanned back after a summer vacation. She says they are 'slightly itchy' when she gets hot.\n\nVitals: Normal.\nPhysical Examination: Multiple small, round-to-oval, hypopigmented (or pink/brown) macules with a fine 'furfuraceous' scale that becomes evident upon scratching.\nLaboratory Results: KOH shows a 'spaghetti and meatballs' pattern.",
    disease: "Tinea Versicolor (Pityriasis Versicolor)",
    questions: [
      {
        q: "What is the causative organism of Tinea Versicolor?",
        options: ["Trichophyton rubrum", "Malassezia species (e.g., M. furfur)", "Candida albicans", "Staph aureus"],
        ans: 1,
        exp: "It is a yeast, not a dermatophyte."
      },
      {
        q: "Why does it cause hypopigmentation (white spots)?",
        options: ["The fungus eats the pigment", "Azelaic acid produced by the yeast inhibits tyrosinase (an enzyme needed for melanin production)", "It is a scar", "Sunlight bleaches the spots"],
        ans: 1,
        exp: "The chemical inhibition of melanin is the mechanism."
      },
      {
        q: "What is the characteristic 'spaghetti and meatballs' appearance on KOH?",
        options: ["Long hyphae and round spores", "Bacteria and pus", "Fungal shells", "Nothing"],
        ans: 0,
        exp: "Short, thick hyphae (spaghetti) and clusters of spores (meatballs) are pathognomonic."
      }
    ]
  },
  {
    title: "The Satellite Lesions",
    scenario: "An infant presents with a bright red rash in the diaper area that is not getting better with 'barrier cream'.\n\nVitals: Normal.\nPhysical Examination: Beefy red, confluent plaques involving the inguinal folds, with small 'satellite' pustules at the edges.\nLaboratory Results: KOH shows pseudohyphae and budding yeast.",
    disease: "Candidal Intertrigo/Diaper Dermatitis",
    questions: [
      {
        q: "What is a hallmark clinical sign of Candidal infection in the skin folds?",
        options: ["Islands of sparing", "Satellite papules and pustules", "Honey-colored crusts", "Target lesions"],
        ans: 1,
        exp: "Satellite lesions (small spots just outside the main rash) are highly suggestive of Candida."
      },
      {
        q: "Does Candidal diaper dermatitis typically involve or spare the inguinal folds?",
        options: ["Spares", "Involves (unlike irritant diaper dermatitis which spares the folds)", "Only involves the legs", "Only involves the waist"],
        ans: 1,
        exp: "Irritant dermatitis affects the surfaces in contact with the diaper; Candida loves the moist, hidden folds."
      },
      {
        q: "Which medication can predispose a patient to Candidiasis?",
        options: ["Oral antibiotics (which kill competing flora)", "Aspirin", "Vitamin D", "Moisturizers"],
        ans: 0,
        exp: "Antibiotics disrupt the balance of microbes on the skin."
      }
    ]
  },
  {
    title: "The Painful Nail Fold",
    scenario: "A dishwasher presents with a swollen, red, painful area around the base of her fingernail. It has been there for 2 weeks.\n\nVitals: Normal.\nPhysical Examination: Erythema and edema of the proximal nail fold, with loss of the cuticle. Some 'cheesy' white material is expressed.\nLaboratory Results: Culture grows Candida albicans.",
    disease: "Chronic Candidal Paronychia",
    questions: [
      {
        q: "What is the primary risk factor for chronic paronychia?",
        options: ["Biting nails", "Frequent immersion in water (wet work)", "Dry skin", "Cold weather"],
        ans: 1,
        exp: "Moisture allows Candida to colonize the space under the nail fold."
      },
      {
        q: "How does chronic paronychia differ from acute paronychia?",
        options: ["Chronic is blue", "Acute is usually bacterial (Staph) and very sudden; Chronic is often fungal (Candida) and persists for weeks", "Chronic is painless", "There is no difference"],
        ans: 1,
        exp: "The timeline and common organisms differ significantly."
      },
      {
        q: "What is the most important part of management for chronic paronychia?",
        options: ["Surgery", "Keeping the hands dry and using topical antifungals", "Antibiotic injections", "Biting the nail"],
        ans: 1,
        exp: "Water avoidance is key to recovery."
      }
    ]
  },
  {
    title: "The Rose Gardener''s Sore",
    scenario: "A florist presents with a non-healing bump on his finger and several new bumps appearing in a line up his forearm.\n\nVitals: Normal.\nPhysical Examination: A small, painless nodule on the index finger. Multiple subcutaneous nodules are felt along the lymphatic drainage path of the arm.\nLaboratory Results: Biopsy shows 'cigar-shaped' yeast on culture.",
    disease: "Sporotrichosis",
    questions: [
      {
        q: "How is Sporotrichosis typically acquired?",
        options: ["Inhaling spores", "Traumatic inoculation (e.g., a thorn prick or splinter contaminated with soil/moss)", "Eating mushrooms", "Bite from a dog"],
        ans: 1,
        exp: "It is the classic 'Rose Gardener's Disease'."
      },
      {
        q: "What is the term for the 'line' of nodules moving up the arm?",
        options: ["Metastasis", "Sporotrichoid spread (lymphocutaneous spread)", "Linear eczema", "Koebner phenomenon"],
        ans: 1,
        exp: "This linear lymphatic pattern is the hallmark of the lymphocutaneous form."
      },
      {
        q: "What was the traditional treatment for Sporotrichosis before modern antifungals?",
        options: ["Aspirin", "Saturated Solution of Potassium Iodide (SSKI)", "Bleach", "Honey"],
        ans: 1,
        exp: "SSKI was the classic treatment; now, Itraconazole is first-line."
      }
    ]
  },
  {
    title: "The Desert Fever",
    scenario: "A patient recently moved to Arizona and developed fever, cough, and painful red bumps on his shins. He also has a red 'target' rash on his arms.\n\nVitals: T 38.5 C.\nPhysical Examination: Erythema nodosum on the shins and Erythema multiforme on the trunk.\nLaboratory Results: Spherules containing endospores are seen in the sputum.",
    disease: "Coccidioidomycosis (Valley Fever)",
    questions: [
      {
        q: "Coccidioidomycosis is endemic to which region?",
        options: ["Mississippi River Valley", "Southwestern US (Arizona, California desert)", "Pacific Northwest", "New England"],
        ans: 1,
        exp: "It is a soil fungus found in the arid Southwest."
      },
      {
        q: "What do Erythema Nodosum and Erythema Multiforme represent in this disease?",
        options: ["Direct infection of the skin", "Reactive (immunologic) skin manifestations of the systemic fungal infection", "A drug allergy", "It's just a coincidence"],
        ans: 1,
        exp: "These reactive rashes are common 'signals' of the underlying fungal illness."
      },
      {
        q: "What is the characteristic histological finding in Coccidioidomycosis?",
        options: ["Cigar-shaped yeast", "Large spherules containing endospores", "Broad-based budding yeast", "Fungal hyphae"],
        ans: 1,
        exp: "The spherule is the diagnostic tissue form."
      }
    ]
  },
  {
    title: "The Mississippi Skin Lesion",
    scenario: "A man from Ohio presents with a large, warty plaque on his face. He has been having a chronic cough and night sweats.\n\nVitals: T 37.8 C.\nPhysical Examination: A large, verrucous (warty) plaque with a sharp border and micro-abscesses at the edge.\nLaboratory Results: Biopsy shows large, broad-based budding yeast.",
    disease: "Blastomycosis",
    questions: [
      {
        q: "Where is Blastomycosis endemic?",
        options: ["Southwest US", "Ohio and Mississippi River Valleys, Great Lakes region", "Florida", "Hawaii"],
        ans: 1,
        exp: "The 'Eastern' part of the US (excluding the coastal South) is the primary zone."
      },
      {
        q: "What is the hallmark histologic finding for Blastomyces dermatitidis?",
        options: ["Small intracellular yeast", "Broad-based budding yeast with a thick wall", "Hyphae", "Spherules"],
        ans: 1,
        exp: "The 'B's go together: Blastomycosis, Big, Broad-Based Budding."
      },
      {
        q: "Which organ system is the primary site of infection for most deep fungi before they spread to the skin?",
        options: ["Lungs", "Heart", "Brain", "Liver"],
        ans: 0,
        exp: "Inhalation of spores into the lungs is the typical starting point."
      }
    ]
  },
  {
    title: "The Small Intracellular Yeast",
    scenario: "An HIV patient with a low CD4 count presents with fever, weight loss, and multiple small, red bumps on his face and chest.\n\nVitals: T 38.3 C.\nPhysical Examination: Widespread, small erythematous papules. Some look like Molluscum Contagiosum.\nLaboratory Results: Biopsy shows small (2-4 micron) intracellular yeast within macrophages.",
    disease: "Histoplasmosis",
    questions: [
      {
        q: "What is the classic habitat for Histoplasma capsulatum?",
        options: ["Dry desert sand", "Soil contaminated with bird or bat droppings (e.g., caves, chicken coops)", "Ocean water", "Clean carpets"],
        ans: 1,
        exp: "Nitrogen-rich soil from droppings promotes growth."
      },
      {
        q: "Where is Histoplasmosis most commonly found in the US?",
        options: ["Arizona", "Ohio and Mississippi River Valleys", "California", "Washington state"],
        ans: 1,
        exp: "It overlaps significantly with the endemic area for Blastomycosis."
      },
      {
        q: "How does Histoplasma appear under the microscope?",
        options: ["Large broad-based yeast", "Small, oval intracellular yeast within histiocytes/macrophages", "Long branches", "Round circles with endospores"],
        ans: 1,
        exp: "The yeast are tiny and 'hide' inside immune cells."
      }
    ]
  }
];
