module.exports = [
  {
    title: "The Glow of the Inner Thigh",
    scenario: "A 40-year-old obese male presents with a macerated, red rash in his groin that doesn't itch much but is slightly painful.\n\nVitals: Normal.\nPhysical Examination: Well-demarcated, reddish-brown patches in the bilateral inguinal folds. No satellite lesions are seen.\nLaboratory Results: Wood''s lamp examination shows 'coral-red' fluorescence.",
    disease: "Erythrasma (Wood''s Lamp)",
    questions: [
      {
        q: "What is the causative organism for this patient's condition?",
        options: ["Trichophyton rubrum", "Corynebacterium minutissimum", "Candida albicans", "None"],
        ans: 1,
        exp: "Erythrasma is caused by Corynebacterium minutissimum, which produces porphyrins that fluoresce coral-red."
      },
      {
        q: "How would the Wood's lamp fluorescence differ if this were Tinea Cruris (Jock Itch)?",
        options: ["It would be bright green", "It would show no fluorescence (usually)", "It would be blue", "None"],
        ans: 1,
        exp: "Most common dermatophytes causing jock itch do not fluoresce."
      },
      {
        q: "What is the best initial treatment for localized erythrasma?",
        options: ["Topical antifungal", "Topical antibiotics (e.g., Clindamycin or Erythromycin) or antibacterial washes", "Oral steroids", "None"],
        ans: 1,
        exp: "Since it is bacterial, antibiotics are the treatment of choice."
      }
    ]
  },
  {
    title: "The Multinucleated Giant Cell",
    scenario: "A 25-year-old female presents with a cluster of painful vesicles on her lip. The physician performs a 'Tzanck smear' in the clinic.\n\nVitals: Normal.\nPhysical Examination: Grouped vesicles on an erythematous base.\nLaboratory Results: Tzanck smear shows 'multinucleated giant cells' and 'acantholytic' keratinocytes.",
    disease: "Herpes Simplex Virus (Tzanck Smear)",
    questions: [
      {
        q: "A positive Tzanck smear (multinucleated giant cells) is seen in which of the following infections?",
        options: ["HSV-1 and HSV-2 only", "VZV (Chickenpox/Shingles) only", "Both HSV and VZV", "Human Papillomavirus (HPV)"],
        ans: 2,
        exp: "The Tzanck smear identifies viral cytopathic effects common to the Herpesviridae family."
      },
      {
        q: "Can the Tzanck smear distinguish between HSV and VZV?",
        options: ["Yes", "No, it only indicates a herpesvirus infection; Viral culture, PCR, or DFA is needed for typing", "Only in children", "None"],
        ans: 1,
        exp: "Typing requires more specific molecular or culture methods."
      },
      {
        q: "What is the most sensitive and specific modern test for confirming HSV?",
        options: ["Tzanck smear", "Viral culture", "PCR (Polymerase Chain Reaction)", "Wood's lamp"],
        ans: 2,
        exp: "PCR is now the preferred test due to its high sensitivity."
      }
    ]
  },
  {
    title: "The 'Spaghetti and Meatballs'",
    scenario: "A patient presents with white, non-tanning spots on his back after a vacation in Hawaii.\n\nVitals: Normal.\nPhysical Examination: Multiple hypo- and hyper-pigmented finely scaly macules.\nLaboratory Results: KOH prep shows 'short hyphae and round spores'.",
    disease: "Tinea Versicolor (KOH Prep)",
    questions: [
      {
        q: "The 'spaghetti and meatballs' appearance on KOH prep is pathognomonic for which condition?",
        options: ["Tinea Corporis", "Tinea Versicolor (Pityriasis versicolor)", "Candidiasis", "None"],
        ans: 1,
        exp: "This refers to the short hyphae (spaghetti) and spores (meatballs) of Malassezia furfur."
      },
      {
        q: "What is the characteristic Wood's lamp fluorescence for Tinea Versicolor?",
        options: ["Bright green", "Yellow-orange or copper-orange", "Pink", "None"],
        ans: 1,
        exp: "Malassezia produces metabolites that glow yellow-orange under Wood's lamp."
      },
      {
        q: "What is the best initial topical treatment for this patient?",
        options: ["Topical steroids", "Selenium sulfide or Ketoconazole shampoo/cream", "Topical antibiotics", "None"],
        ans: 1,
        exp: "Anti-seborrheic/anti-fungal agents are effective against Malassezia."
      }
    ]
  },
  {
    title: "The Mite and the Burrow",
    scenario: "A 20-year-old student has intense itching between his fingers that is worse at night.\n\nVitals: Normal.\nPhysical Examination: Small linear ridges (burrows) and excoriated papules in the finger webs.\nLaboratory Results: Skin scraping with mineral oil shows an adult mite and several oval eggs.",
    disease: "Scabies (Microscopy)",
    questions: [
      {
        q: "Where is the 'Best' place to scrape for a scabies diagnosis?",
        options: ["A red papule", "A non-excoriated burrow", "Normal skin", "The center of the chest"],
        ans: 1,
        exp: "Mites, eggs, and feces (scybala) are most concentrated within the burrows."
      },
      {
        q: "What is the name of the mite that causes scabies?",
        options: ["Demodex folliculorum", "Sarcoptes scabiei", "Pediculus humanus", "None"],
        ans: 1,
        exp: "Sarcoptes scabiei var. hominis is the human itch mite."
      },
      {
        q: "If the scraping is negative, but the clinical suspicion is high, should you still treat?",
        options: ["No, wait for a positive test", "Yes, scabies scrapings have low sensitivity; a clinical diagnosis is often sufficient for treatment", "Only if the patient has a fever", "None"],
        ans: 1,
        exp: "Failure to find the mite is common and does not rule out the diagnosis."
      }
    ]
  },
  {
    title: "The 'Stuck-On' Network",
    scenario: "A physician is examining a dark brown, warty lesion on a patient's back using a dermatoscope.\n\nVitals: Normal.\nPhysical Examination: 1-cm brown, 'stuck-on' plaque.\nLaboratory Results: Dermoscopy shows 'milky-white cysts' (pseudo-horn cysts) and 'comedo-like openings'.",
    disease: "Seborrheic Keratosis (Dermoscopy)",
    questions: [
      {
        q: "These dermoscopic features (horn cysts, comedo-like openings) are highly suggestive of:",
        options: ["Melanoma", "Seborrheic Keratosis", "BCC", "None"],
        ans: 1,
        exp: "Pseudo-horn cysts are a hallmark of benign seborrheic keratoses."
      },
      {
        q: "Dermoscopy is primarily used to distinguish between:",
        options: ["Infection and allergy", "Melanocytic vs. non-melanocytic lesions and benign vs. malignant tumors", "Dry vs. oily skin", "None"],
        ans: 1,
        exp: "It allows for visualization of subsurface structures not visible to the naked eye."
      },
      {
        q: "A 'pigment network' seen on dermoscopy is a feature of:",
        options: ["BCC", "Melanocytic lesions (moles/melanomas)", "Warts", "None"],
        ans: 1,
        exp: "The network represents the rete ridges of the epidermis containing melanin."
      }
    ]
  },
  {
    title: "The 'Leaf-Like' Border",
    scenario: "A 60-year-old male has a suspicious translucent bump on his cheek. The physician uses dermoscopy.\n\nVitals: Normal.\nPhysical Examination: Pearly papule with telangiectasias.\nLaboratory Results: Dermoscopy shows 'arborizing telangiectasias' and 'leaf-like areas' at the periphery.",
    disease: "Basal Cell Carcinoma (Dermoscopy)",
    questions: [
      {
        q: "The presence of 'arborizing (tree-like) telangiectasias' is a classic dermoscopic clue for:",
        options: ["SCC", "BCC", "Melanoma", "Psoriasis"],
        ans: 1,
        exp: "These large, distinct, branching vessels are very common in nodular BCC."
      },
      {
        q: "What do 'leaf-like areas' represent on dermoscopy?",
        options: ["Hairs", "Basaloid tumor nests at the periphery", "Fungus", "None"],
        ans: 1,
        exp: "They are another high-yield dermoscopic feature of BCC."
      },
      {
        q: "Is a 'pigment network' typically seen in BCC?",
        options: ["Yes", "No, BCC is a non-melanocytic tumor (though pigmented variants exist, they show globule-like structures rather than a network)", "Only in children", "None"],
        ans: 1,
        exp: "The absence of a network helps distinguish BCC from a melanocytic nevus."
      }
    ]
  },
  {
    title: "The ABCD and the E",
    scenario: "A patient is concerned about a changing mole on her arm.\n\nVitals: Normal.\nPhysical Examination: A 7-mm mole with irregular borders and two shades of brown.\nLaboratory Results: None.",
    disease: "Melanoma Screening (ABCDs)",
    questions: [
      {
        q: "What does the 'D' stand for in the melanoma ABCD criteria?",
        options: ["Depth", "Diameter (> 6 mm)", "Dermal involvement", "None"],
        ans: 1,
        exp: "Asymmetry, Border, Color, Diameter (>6mm), and Evolving are the classic keys."
      },
      {
        q: "Which of the ABCD criteria is often considered the MOST important for early detection?",
        options: ["Asymmetry", "Border", "Evolving (changing over time)", "Diameter"],
        ans: 2,
        exp: "Change is the most sensitive indicator of malignancy."
      },
      {
        q: "What is the 'Ugly Duckling' sign?",
        options: ["A very pretty mole", "A mole that looks significantly different from all the other moles on that specific patient", "A mole on the neck", "None"],
        ans: 1,
        exp: "Most people have a 'signature' mole pattern; the one that doesn't fit is suspicious."
      }
    ]
  },
  {
    title: "The Scalp Glow",
    scenario: "A 6-year-old child has a patch of hair loss with 'black dots' and scale.\n\nVitals: Normal.\nPhysical Examination: Alopecia with broken hairs.\nLaboratory Results: Wood''s lamp examination shows 'bright yellow-green' fluorescence along the hair shafts.",
    disease: "Tinea Capitis (Wood''s Lamp)",
    questions: [
      {
        q: "Which organism is the most likely cause of yellow-green fluorescence in Tinea Capitis?",
        options: ["Trichophyton tonsurans", "Microsporum canis or Microsporum audouinii", "Candida", "None"],
        ans: 1,
        exp: "Microsporum species classically fluoresce; the most common US cause (T. tonsurans) does NOT fluoresce."
      },
      {
        q: "If the Wood's lamp is negative, can you rule out Tinea Capitis?",
        options: ["Yes", "No, because the most common cause (T. tonsurans) is 'non-fluorescent'", "Only in adults", "None"],
        ans: 1,
        exp: "A negative Wood's lamp does not rule out fungal infection."
      },
      {
        q: "What is the 'Gold Standard' test for confirming Tinea Capitis?",
        options: ["Wood's lamp", "Fungal culture of the hair and scale", "Tzanck smear", "None"],
        ans: 1,
        exp: "Culture remains the definitive diagnostic test."
      }
    ]
  },
  {
    title: "The 'Linear' Deposit",
    scenario: "A 50-year-old presents with tense blisters on his shins. A biopsy is taken for Direct Immunofluorescence (DIF).\n\nVitals: Normal.\nPhysical Examination: Tense bullae.\nLaboratory Results: DIF shows 'Linear IgG and C3' along the basement membrane zone.",
    disease: "Bullous Pemphigoid (DIF)",
    questions: [
      {
        q: "Linear IgG/C3 along the BMZ is the hallmark of which condition?",
        options: ["Pemphigus Vulgaris", "Bullous Pemphigoid", "Lupus", "None"],
        ans: 1,
        exp: "Autoantibodies target the hemidesmosomes (BP180/BP230) in the basement membrane."
      },
      {
        q: "How would the DIF pattern differ in Pemphigus Vulgaris?",
        options: ["It would be the same", "It would show 'Net-like' or 'Chicken-wire' (intercellular) IgG deposition in the epidermis", "It would be negative", "None"],
        ans: 1,
        exp: "Pemphigus targets the desmosomes between keratinocytes."
      },
      {
        q: "Salt-split skin testing is used to distinguish BP from which other condition?",
        options: ["Pemphigus", "Epidermolysis Bullosa Acquisita (EBA)", "Acne", "None"],
        ans: 1,
        exp: "In BP, the antibodies stay on the 'roof' (epidermal side); in EBA, they stay on the 'floor' (dermal side)."
      }
    ]
  },
  {
    title: "The 'Psoriasiform' Pattern",
    scenario: "A pathology report for a red, scaly plaque mentions 'regular acanthosis, parakeratosis, and neutrophilic microabscesses'.\n\nVitals: Normal.\nPhysical Examination: Silver scaly plaques on the elbows.\nLaboratory Results: Biopsy report received.",
    disease: "Psoriasis (Histology)",
    questions: [
      {
        q: "What are the 'Munro microabscesses' mentioned in the report?",
        options: ["Pockets of bacteria", "Collections of neutrophils within the stratum corneum", "Fungal colonies", "None"],
        ans: 1,
        exp: "Neutrophilic migration into the epidermis is a key feature of psoriasis."
      },
      {
        q: "What does 'Acanthosis' mean in a pathology report?",
        options: ["Skin thinning", "Thickening of the epidermis (specifically the stratum spinosum)", "Skin cancer", "None"],
        ans: 1,
        exp: "Regular, 'test-tube' like acanthosis is classic for psoriasis."
      },
      {
        q: "What happens to the 'Granular Layer' in psoriasis?",
        options: ["It gets thicker", "It is absent or significantly thinned (hypogranulosis)", "It turns blue", "None"],
        ans: 1,
        exp: "The rapid turnover in psoriasis prevents the formation of a normal granular layer."
      }
    ]
  },
  {
    title: "The 'Interface' Dermatitis",
    scenario: "A patient with a purple, flat-topped rash on his wrist has a biopsy. The report mentions 'interface dermatitis' and 'Civatte bodies'.\n\nVitals: Normal.\nPhysical Examination: Purple, polygonal, planar, pruritic papules (Lichen Planus).\nLaboratory Results: Biopsy shows a 'saw-tooth' rete ridge pattern.",
    disease: "Lichen Planus (Histology)",
    questions: [
      {
        q: "What does 'Interface Dermatitis' describe?",
        options: ["Infection", "Inflammation/damage localized to the dermal-epidermal junction", "A rash on the hands", "None"],
        ans: 1,
        exp: "The 'interface' is where the epidermis and dermis meet."
      },
      {
        q: "What are 'Civatte bodies' (also called cytoid or colloid bodies)?",
        options: ["Bacteria", "Apoptotic (dead) keratinocytes", "Fungal spores", "None"],
        ans: 1,
        exp: "They are the remnants of keratinocytes damaged by the inflammation."
      },
      {
        q: "Which other 'Step' condition classically shows an interface dermatitis pattern?",
        options: ["Lupus Erythematosus", "Psoriasis", "Acne", "None"],
        ans: 0,
        exp: "Lupus, Lichen Planus, and Erythema Multiforme are the 'big three' for interface patterns."
      }
    ]
  },
  {
    title: "The 'Wood' and the 'Ash Leaf'",
    scenario: "A child with several 'white spots' on his trunk and a history of seizures is examined with a Wood''s lamp.\n\nVitals: Normal.\nPhysical Examination: Hypopigmented, leaf-shaped macules.\nLaboratory Results: Wood''s lamp makes the spots appear 'bright blue-white'.",
    disease: "Tuberous Sclerosis (Wood''s Lamp)",
    questions: [
      {
        q: "Why is the Wood's lamp helpful in diagnosing 'Ash-leaf spots' in fair-skinned children?",
        options: ["It turns them red", "It enhances the contrast between the hypopigmented spots and normal skin, making them easier to see", "It cures the spots", "None"],
        ans: 1,
        exp: "Hypopigmented lesions are often invisible in bright light on fair skin."
      },
      {
        q: "What is the 'bright blue-white' fluorescence in Vitiligo due to?",
        options: ["A fungus", "The total absence of melanin, which allows for increased reflection and autofluorescence of dermal collagen", "A pigment", "None"],
        ans: 1,
        exp: "Wood's lamp helps distinguish between hypopigmentation (low melanin) and depigmentation (no melanin)."
      },
      {
        q: "Which other cutaneous sign of Tuberous Sclerosis is typically found on the face?",
        options: ["Acne", "Angiofibromas (historically called adenoma sebaceum)", "Warts", "None"],
        ans: 1,
        exp: "These small, red-to-pink papules are a hallmark of TS."
      }
    ]
  },
  {
    title: "The 'Pearly' Bump and the 'Palisading'",
    scenario: "A pathology report for a pearly bump on the face describes 'islands of basaloid cells with peripheral palisading and clefting'.\n\nVitals: Normal.\nPhysical Examination: Classic BCC.\nLaboratory Results: Histology confirms the diagnosis.",
    disease: "Basal Cell Carcinoma (Histology)",
    questions: [
      {
        q: "What does 'Peripheral Palisading' describe?",
        options: ["Tumor cells arranged in a circle", "The outermost layer of tumor cells arranged vertically, like a 'picket fence'", "Cells in a line", "None"],
        ans: 1,
        exp: "This is a characteristic architectural feature of BCC."
      },
      {
        q: "What is the 'Clefting' (retraction artifact) seen in BCC histology?",
        options: ["A tear in the skin", "A space between the tumor nests and the surrounding stroma, often due to tissue processing", "A hole in the cell", "None"],
        ans: 1,
        exp: "The 'shrinkage' away from the stroma is very common in BCC specimens."
      },
      {
        q: "Which type of BCC is the most aggressive and likely to recur?",
        options: ["Nodular", "Superficial", "Morpheaform (Sclerosing) or Infiltrative", "None"],
        ans: 2,
        exp: "Infiltrative patterns have 'roots' that are hard to see clinically."
      }
    ]
  },
  {
    title: "The 'Blue-White' Veil",
    scenario: "A dermatologist is examining a dark, irregular mole on a patient''s leg using dermoscopy.\n\nVitals: Normal.\nPhysical Examination: Atypical mole.\nLaboratory Results: Dermoscopy shows a 'blue-white veil' and 'atypical network'.",
    disease: "Melanoma (Dermoscopy)",
    questions: [
      {
        q: "What does the 'Blue-White Veil' represent on dermoscopy?",
        options: ["Fungus", "A sign of deep (dermal) melanin and orthokeratosis, often seen in invasive melanoma", "Skin oil", "None"],
        ans: 1,
        exp: "This is a high-risk feature for melanoma."
      },
      {
        q: "What are 'Chrysalis structures' (also called shiny white streaks)?",
        options: ["Worms", "Shiny white lines seen only with polarized dermoscopy, representing altered dermal collagen (common in BCC and Melanoma)", "Soap residue", "None"],
        ans: 1,
        exp: "These are a marker of invasive growth and collagen remodeling."
      },
      {
        q: "An 'asymmetric' distribution of structures is characteristic of:",
        options: ["Benign moles", "Malignant melanoma", "Normal skin", "None"],
        ans: 1,
        exp: "Malignancy is characterized by architectural chaos."
      }
    ]
  },
  {
    title: "The 'Target' and the 'PAS' Stain",
    scenario: "A pathology report for a suspected fungal infection on the foot says 'PAS stain is positive for fungal hyphae in the stratum corneum'.\n\nVitals: Normal.\nPhysical Examination: Scaly foot.\nLaboratory Results: PAS stain performed.",
    disease: "Fungal Stains (PAS/GMS)",
    questions: [
      {
        q: "What does the 'PAS' (Periodic Acid-Schiff) stain highlight?",
        options: ["Bacteria", "Carbohydrates (specifically the glycogen in fungal cell walls), turning them bright magenta/red", "Iron", "None"],
        ans: 1,
        exp: "PAS is the standard stain for detecting dermatophytes in skin and nails."
      },
      {
        q: "Which other stain is commonly used to find fungi, turning them black?",
        options: ["Gram stain", "GMS (Gomori Methenamine Silver)", "H&E", "None"],
        ans: 1,
        exp: "GMS provides excellent contrast for identifying fungal morphology."
      },
      {
        q: "Is PAS helpful for identifying 'Pityriasis Versicolor'?",
        options: ["No", "Yes, it highlights the Malassezia organisms very clearly", "Only in the sun", "None"],
        ans: 1,
        exp: "While KOH is faster, PAS is very sensitive for Malassezia."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Patch' Test",
    scenario: "A patient with chronic hand dermatitis undergoes 'Patch testing'.\n\nVitals: Normal.\nPhysical Examination: Red, scaly, cracked hands.\nLaboratory Results: Patch test is read at 48 and 96 hours. A positive result is seen for Nickel.",
    disease: "Allergic Contact Dermatitis (Patch Testing)",
    questions: [
      {
        q: "What type of hypersensitivity reaction is being tested in 'Patch Testing'?",
        options: ["Type I (IgE-mediated)", "Type IV (Delayed-type, T-cell mediated)", "Type II", "None"],
        ans: 1,
        exp: "Contact allergy is a T-cell mediated process, which is why the test is read days later."
      },
      {
        q: "How does this differ from 'Skin Prick' testing?",
        options: ["Prick testing is for Type IV", "Prick testing is for Type I (e.g., pollen, food, hives) and is read within 15-20 minutes", "They are the same", "None"],
        ans: 1,
        exp: "The timing and mechanism are completely different."
      },
      {
        q: "Can you perform a patch test while a patient is on high-dose oral Prednisone?",
        options: ["Yes", "No, systemic steroids can suppress the T-cell response and lead to false-negative results", "Only in adults", "None"],
        ans: 1,
        exp: "Patients must be off or on very low-dose steroids for accurate testing."
      }
    ]
  },
  {
    title: "The 'Pearly' Bump and the 'Granuloma'",
    scenario: "A biopsy of a red bump on the arm shows 'naked, non-caseating granulomas'.\n\nVitals: Normal.\nPhysical Examination: Red/brown papules on the skin and a history of a dry cough.\nLaboratory Results: ACE (Angiotensin-Converting Enzyme) level is elevated.",
    disease: "Sarcoidosis (Histology)",
    questions: [
      {
        q: "What does 'Naked' granuloma mean in the context of Sarcoidosis?",
        options: ["It's visible to the eye", "Granulomas with a minimal surrounding 'rim' of lymphocytes", "It has no skin over it", "None"],
        ans: 1,
        exp: "The lack of a significant inflammatory cuff is characteristic of sarcoid granulomas."
      },
      {
        q: "What is a 'Caseating' granuloma characteristic of?",
        options: ["Sarcoidosis", "Tuberculosis (TB)", "Fungus", "All of the above"],
        ans: 1,
        exp: "Caseation (cheese-like necrosis) is the hallmark of TB."
      },
      {
        q: "Where is the most common 'non-skin' location involved in sarcoidosis?",
        options: ["Liver", "Lungs and Intrathoracic lymph nodes", "Brain", "None"],
        ans: 1,
        exp: "Hilar lymphadenopathy is a classic finding on Chest X-ray."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Prick' Test",
    scenario: "A patient with chronic hives (urticaria) is having 'Skin Prick' testing for food allergies.\n\nVitals: Normal.\nPhysical Examination: Hives appearing and disappearing.\nLaboratory Results: A 'wheal and flare' reaction is seen within 15 minutes to shrimp.",
    disease: "Type I Hypersensitivity (Prick Testing)",
    questions: [
      {
        q: "The 'wheal and flare' reaction is a hallmark of which antibody-mediated response?",
        options: ["IgG", "IgE", "IgM", "None"],
        ans: 1,
        exp: "IgE cross-linking on mast cells leads to immediate histamine release."
      },
      {
        q: "What is a mandatory 'Positive Control' used during skin prick testing?",
        options: ["Water", "Histamine", "Salt", "None"],
        ans: 1,
        exp: "Histamine must cause a wheal to ensure the patient's skin is responsive (and they aren't on antihistamines)."
      },
      {
        q: "Which medication must be stopped at least 3-7 days BEFORE skin prick testing?",
        options: ["Antibiotics", "Antihistamines", "Vitamins", "None"],
        ans: 1,
        exp: "Antihistamines will block the reaction and cause false-negatives."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Direct' (Pemphigus)",
    scenario: "A patient with mouth ulcers has a biopsy taken for DIF. The report describes 'Intercellular IgG and C3 in a fish-net pattern'.\n\nVitals: Normal.\nPhysical Examination: Painful oral erosions and a positive Nikolsky sign.\nLaboratory Results: Histology shows 'acantholysis' and a 'tombstoning' pattern.",
    disease: "Pemphigus Vulgaris (DIF/Histology)",
    questions: [
      {
        q: "What does 'Tombstoning' describe on histology?",
        options: ["Dead skin", "A single layer of basal keratinocytes remaining attached to the basement membrane, while the layers above have separated (acantholysis)", "Pus", "None"],
        ans: 1,
        exp: "This is a classic histologic description for Pemphigus Vulgaris."
      },
      {
        q: "Which specific protein is the target of autoantibodies in Pemphigus Vulgaris?",
        options: ["BP180", "Desmoglein 3 (and sometimes 1)", "Keratin 5", "None"],
        ans: 1,
        exp: "Anti-desmoglein 3 is responsible for the mucosal-dominant form."
      },
      {
        q: "What is the Nikolsky sign?",
        options: ["A rash", "The sliding away of the top layer of skin when lateral pressure is applied, indicating weak intercellular adhesion", "A fever", "None"],
        ans: 1,
        exp: "Nikolsky is positive in Pemphigus but negative in Bullous Pemphigoid."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Acantholysis'",
    scenario: "A pathology report mentions 'acantholytic keratinocytes' in a patient with a blistering disease.\n\nVitals: Normal.\nPhysical Examination: Blisters.\nLaboratory Results: None.",
    disease: "Acantholysis (Pathology Context)",
    questions: [
      {
        q: "What is the definition of 'Acantholysis'?",
        options: ["Skin thickening", "Loss of intercellular adhesion between keratinocytes, leading to 'rounded-up' individual cells", "Infection", "None"],
        ans: 1,
        exp: "It is the fundamental process in Pemphigus."
      },
      {
        q: "Besides Pemphigus, which 'viral' infection classically shows acantholysis on Tzanck smear/biopsy?",
        options: ["HPV", "HSV/VZV", "Flu", "None"],
        ans: 1,
        exp: "Viral damage can also cause cells to lose adhesion and round up."
      },
      {
        q: "How does acantholysis differ from 'Spongiosis'?",
        options: ["They are the same", "Spongiosis is intercellular EDEMA (fluid between cells), seen in eczema; acantholysis is loss of the cellular CONNECTIONS themselves", "None", "Spongiosis is faster"],
        ans: 1,
        exp: "Spongiosis looks like 'stretching' of the desmosomes (the 'sponge' look), while acantholysis is the complete breakage of those connections."
      }
    ]
  },
  {
    title: "The ' Wood' and the 'Porphyria'",
    scenario: "A patient with blisters on the back of his hands and tea-colored urine has his urine examined with a Wood''s lamp.\n\nVitals: Normal.\nPhysical Examination: Erosions, milia, and scarring on sun-exposed hands.\nLaboratory Results: Urine fluoresces 'coral-pink/orange' under Wood''s lamp.",
    disease: "Porphyria Cutanea Tarda (Wood''s Lamp)",
    questions: [
      {
        q: "The coral-pink fluorescence in the urine is due to the presence of high levels of what?",
        options: ["Sugar", "Uroporphyrins", "Blood", "None"],
        ans: 1,
        exp: "Porphyrins are naturally fluorescent under UV light."
      },
      {
        q: "What is the most common underlying liver association with Porphyria Cutanea Tarda (PCT)?",
        options: ["Hepatitis B", "Hepatitis C (and Chronic Alcohol use)", "Fatty liver only", "None"],
        ans: 1,
        exp: "Screening for Hep C is mandatory in new cases of PCT."
      },
      {
        q: "What is the best initial treatment for PCT?",
        options: ["Steroids", "Phlebotomy or low-dose Hydroxychloroquine", "Antibiotics", "None"],
        ans: 1,
        exp: "Removing iron (phlebotomy) or increasing porphyrin excretion (hydroxychloroquine) is effective."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Imaging' (Ultrasound)",
    scenario: "A patient has a soft, mobile lump on his forehead. The doctor performs a bedside ultrasound.\n\nVitals: Normal.\nPhysical Examination: Soft subcutaneous nodule.\nLaboratory Results: Ultrasound shows a 'well-circumscribed, hypoechoic mass with no internal blood flow'.",
    disease: "Lipoma vs. Cyst (Ultrasound)",
    questions: [
      {
        q: "How can ultrasound help distinguish a Lipoma from a Cyst?",
        options: ["It can't", "Lipomas are typically hyperechoic/isoechoic and soft; cysts are often hypoechoic with 'posterior acoustic enhancement' (due to fluid)", "None", "Cysts are red"],
        ans: 1,
        exp: "Ultrasound is excellent for characterizing the nature of subcutaneous lumps."
      },
      {
        q: "What does 'Posterior Acoustic Enhancement' indicate?",
        options: ["A tumor", "The presence of fluid (the ultrasound waves pass through fluid easily and look brighter behind it)", "Bone", "None"],
        ans: 1,
        exp: "This is a classic ultrasound finding for cysts."
      },
      {
        q: "Why is checking for 'internal blood flow' (Doppler) important in a skin tumor?",
        options: ["No reason", "Increased vascularity can be a sign of malignancy or an inflammatory process", "It's just for fun", "None"],
        ans: 1,
        exp: "High-flow lesions require more cautious management."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Congo Red'",
    scenario: "A pathology report for a waxy, translucent papule on the eyelid mentions 'apple-green birefringence under polarized light after Congo Red staining'.\n\nVitals: Normal.\nPhysical Examination: Waxy papules around the eyes (Pinch purpura is also noted).\nLaboratory Results: Biopsy results received.",
    disease: "Amyloidosis (Congo Red Stain)",
    questions: [
      {
        q: "Apple-green birefringence with Congo Red stain is pathognomonic for:",
        options: ["Collagen", "Amyloid", "Fungus", "None"],
        ans: 1,
        exp: "This is a classic 'Step' board association for amyloid proteins."
      },
      {
        q: "What is 'Pinch Purpura' in the context of Systemic Amyloidosis?",
        options: ["A bug bite", "Easy bruising (ecchymosis) of the skin after minor trauma/pinching, especially around the eyes", "A rash", "None"],
        ans: 1,
        exp: "Amyloid infiltration of blood vessel walls makes them extremely fragile."
      },
      {
        q: "Which organ system must be screened for in a patient with biopsy-proven systemic amyloidosis?",
        options: ["Lungs", "Heart (restrictive cardiomyopathy) and Kidneys (nephrotic syndrome)", "Limb length", "None"],
        ans: 1,
        exp: "Amyloid can infiltrate vital organs, leading to significant morbidity."
      }
    ]
  },
  {
    title: "The 'Pearly' Bump and the 'SCC' (Histology)",
    scenario: "A pathology report for a rough, scaly lesion describes 'full-thickness atypia of the epidermis without invasion into the dermis'.\n\nVitals: Normal.\nPhysical Examination: Scaly red patch on sun-damaged skin.\nLaboratory Results: Histology report received.",
    disease: "SCC in situ (Bowen''s Disease)",
    questions: [
      {
        q: "What is the diagnosis for Squamous Cell Carcinoma that is 'in situ' (limited to the epidermis)?",
        options: ["Actinic Keratosis", "Bowen's Disease (SCC in situ)", "Invasive SCC", "BCC"],
        ans: 1,
        exp: "In situ means the basement membrane is intact."
      },
      {
        q: "How does Actinic Keratosis differ histologically from SCC in situ?",
        options: ["AK is deeper", "AK shows 'partial-thickness' atypia (usually the lower 1/3 of the epidermis), while SCC in situ is 'full-thickness'", "No difference", "None"],
        ans: 1,
        exp: "AK is a precursor; SCC in situ is cancer that hasn't started invading yet."
      },
      {
        q: "What are 'Keratin Pearls' a sign of?",
        options: ["BCC", "Well-differentiated invasive Squamous Cell Carcinoma", "A skin infection", "None"],
        ans: 1,
        exp: "They represent focal areas of keratinization within tumor nests."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Imaging' (MRI)",
    scenario: "A patient with a rapidly spreading leg infection and high fever is being rushed for an MRI.\n\nVitals: T 39.5, BP 90/60.\nPhysical Examination: Dusky skin, crepitus.\nLaboratory Results: None.",
    disease: "Necrotizing Fasciitis (MRI)",
    questions: [
      {
        q: "What is the most characteristic MRI finding for necrotizing fasciitis?",
        options: ["Bone fracture", "Thickening and enhancement of the deep fascia with fluid/gas along the fascial planes", "A tumor", "None"],
        ans: 1,
        exp: "MRI is very sensitive for identifying deep fascial involvement."
      },
      {
        q: "Should surgery be DELAYED to wait for an MRI if the clinical suspicion is very high?",
        options: ["Yes, always confirm first", "No, necrotizing fasciitis is a clinical diagnosis; surgery should proceed immediately to prevent death", "Only in the elderly", "None"],
        ans: 1,
        exp: "Time is tissue; surgical exploration is the gold standard and the ultimate 'test'."
      },
      {
        q: "What is the 'LRINEC' score used for?",
        options: ["Melanoma staging", "A laboratory-based scoring system (using WBC, CRP, Sodium, Glucose, etc.) to help identify necrotizing fasciitis", "Acne grading", "None"],
        ans: 1,
        exp: "Laboratory Risk Indicator for Necrotizing Fasciitis (LRINEC) is a triage tool."
      }
    ]
  }
];
