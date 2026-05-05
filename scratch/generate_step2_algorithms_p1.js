module.exports = [
  {
    title: "The Acne Escalation",
    scenario: "A 16-year-old male presents with worsening acne. He has been using over-the-counter benzoyl peroxide for 6 months with minimal improvement.\n\nVitals: Normal.\nPhysical Examination: Multiple open and closed comedones, along with numerous erythematous papules and pustules on the cheeks and forehead. No nodules or scarring are noted.\nLaboratory Results: None.",
    disease: "Moderate Inflammatory Acne",
    questions: [
      {
        q: "What is the best next step in management for this patient?",
        options: ["Switch to salicylic acid", "Add topical retinoids (e.g., Tretinoin) and consider topical antibiotics (e.g., Clindamycin)", "Start oral Isotretinoin immediately", "Perform a chemical peel"],
        ans: 1,
        exp: "For moderate inflammatory acne failing OTC therapy, the next step is combining a topical retinoid with a topical antibiotic or benzoyl peroxide."
      },
      {
        q: "If the patient subsequently develops deep, painful nodules and scarring, what is the 'Most Effective' treatment?",
        options: ["Oral Tetracycline", "Oral Isotretinoin", "Increase strength of topical steroids", "Blue light therapy"],
        ans: 1,
        exp: "Oral Isotretinoin is the gold standard for severe, recalcitrant nodulocystic acne or acne with scarring."
      },
      {
        q: "Which of the following must be checked BEFORE starting the treatment mentioned in the previous question in a female of childbearing age?",
        options: ["Liver function tests and lipids only", "Two negative pregnancy tests and enrollment in iPLEDGE", "Complete blood count", "Chest X-ray"],
        ans: 1,
        exp: "Isotretinoin is highly teratogenic; strict pregnancy prevention is mandatory."
      }
    ]
  },
  {
    title: "The Suspect Mole",
    scenario: "A 45-year-old female presents with a mole on her back that has changed color and developed 'jagged' edges over the last 3 months.\n\nVitals: Normal.\nPhysical Examination: A 7-mm asymmetric macule with irregular borders and multiple shades of brown and black on the left scapula.\nLaboratory Results: None.",
    disease: "Malignant Melanoma (Diagnostic Algorithm)",
    questions: [
      {
        q: "What is the 'Best Initial Step' in the management of this lesion?",
        options: ["Shave biopsy", "Excisional biopsy with 1-3 mm margins", "Wide local excision with 2 cm margins", "Laser ablation"],
        ans: 1,
        exp: "Suspected melanoma should undergo an excisional biopsy (elliptical or punch) to determine the Breslow depth. Shave biopsies are avoided as they may 'transect' the base and lose depth data."
      },
      {
        q: "The biopsy shows melanoma with a Breslow depth of 1.5 mm. What is the next step in management?",
        options: ["Chemotherapy", "Wide local excision (WLE) and Sentinel Lymph Node Biopsy (SLNB)", "Radiation therapy", "No further treatment needed"],
        ans: 1,
        exp: "Melanomas > 0.8 mm (or < 0.8 mm with ulceration/high mitosis) require SLNB in addition to WLE."
      },
      {
        q: "What is the most important prognostic factor for localized melanoma?",
        options: ["Diameter of the lesion", "Breslow thickness (depth of invasion)", "Age of the patient", "Number of colors in the mole"],
        ans: 1,
        exp: "Breslow thickness is the single most important predictor of survival and metastatic potential."
      }
    ]
  },
  {
    title: "The Scaly Patch and the Hair Loss",
    scenario: "An 8-year-old girl presents with a round patch of hair loss that is 'itchy' and scaly.\n\nVitals: Normal.\nPhysical Examination: A 3-cm circular area of alopecia on the vertex with prominent scaling and 'black dots' (broken hairs). Cervical lymphadenopathy is present.\nLaboratory Results: KOH prep shows fungal hyphae within the hair shaft.",
    disease: "Tinea Capitis",
    questions: [
      {
        q: "What is the most appropriate next step in treatment for this patient?",
        options: ["Topical Ketoconazole cream", "Oral Griseofulvin or Terbinafine", "Topical steroids", "Selenium sulfide shampoo only"],
        ans: 1,
        exp: "Tinea capitis requires ORAL therapy to penetrate the hair follicle; topicals are ineffective as monotherapy."
      },
      {
        q: "If the lesion becomes a boggy, purulent, painful mass with hair loss, what is it called?",
        options: ["Abscess", "Kerion", "Seborrheic dermatitis", "Impetigo"],
        ans: 1,
        exp: "A kerion is a severe inflammatory response to tinea capitis and may lead to permanent scarring alopecia if not treated."
      },
      {
        q: "Should the patient's family members be screened?",
        options: ["No, it's not contagious", "Yes, as asymptomatic carriage among household contacts is common", "Only if they have pets", "Only if they are bald"],
        ans: 1,
        exp: "Asymptomatic household contacts can act as reservoirs and cause reinfection."
      }
    ]
  },
  {
    title: "The Recurrent Facial Redness",
    scenario: "A 40-year-old male presents with redness on his nose and cheeks that worsens after drinking hot coffee or being in the sun.\n\nVitals: Normal.\nPhysical Examination: Persistent erythema and telangiectasias over the central face. Multiple inflammatory papules and pustules are present. No comedones are noted.\nLaboratory Results: None.",
    disease: "Papulopustular Rosacea",
    questions: [
      {
        q: "What is the best initial topical treatment for this patient's inflammatory lesions?",
        options: ["Benzoyl peroxide", "Topical Metronidazole or Azelaic acid", "Topical Tretinoin", "Topical Nystatin"],
        ans: 1,
        exp: "Topical Metronidazole is a first-line treatment for the papules and pustules of rosacea."
      },
      {
        q: "What is the most important 'Non-pharmacologic' management step?",
        options: ["Daily face scrubbing", "Avoidance of triggers (e.g., sun, alcohol, spicy foods, hot beverages)", "Steam facials", "Increasing caffeine intake"],
        ans: 1,
        exp: "Trigger avoidance is essential to manage the underlying vasomotor instability."
      },
      {
        q: "The patient complains of a 'gritty' sensation in his eyes. What should you evaluate for?",
        options: ["Glaucoma", "Ocular Rosacea (Blepharitis/Conjunctivitis)", "Cataracts", "Uveitis"],
        ans: 1,
        exp: "Ocular involvement occurs in up to 50% of rosacea patients and can lead to corneal scarring."
      }
    ]
  },
  {
    title: "The Itchy Fingers at Night",
    scenario: "A 25-year-old male presents with intense itching that is much worse at night. His roommate has similar symptoms.\n\nVitals: Normal.\nPhysical Examination: Small, erythematous papules and thin, linear tracks (burrows) in the finger webs, wrists, and periumbilical area.\nLaboratory Results: Skin scraping under mineral oil shows mites and eggs.",
    disease: "Scabies",
    questions: [
      {
        q: "What is the first-line treatment for this patient and his roommate?",
        options: ["Topical Permethrin 5% cream (applied head-to-toe and washed off after 8-14 hours)", "Oral Fluconazole", "Topical Hydrocortisone", "Topical Clotrimazole"],
        ans: 0,
        exp: "Permethrin is the standard first-line scabicide. Oral Ivermectin is an alternative."
      },
      {
        q: "Which of the following management steps is 'Mandatory' for success?",
        options: ["Treating only the symptomatic roommate", "Treating all household contacts regardless of symptoms", "Shaving all body hair", "Taking a bleach bath"],
        ans: 1,
        exp: "Asymptomatic contacts must be treated simultaneously to prevent a 'ping-pong' cycle of reinfection."
      },
      {
        q: "What should be done with the patient's bedding and clothing?",
        options: ["Discard them", "Wash in hot water and dry in a hot dryer (or seal in a plastic bag for 72 hours)", "Spray with perfume", "Nothing"],
        ans: 1,
        exp: "High heat kills the mites; they cannot survive away from human skin for more than 2-3 days."
      }
    ]
  },
  {
    title: "The Thickened Toenails",
    scenario: "A 60-year-old male presents with yellow, thickened, and crumbly toenails. He is bothered by the appearance and difficulty trimming them.\n\nVitals: Normal.\nPhysical Examination: Subungual hyperkeratosis and onycholysis of 8 toenails.\nLaboratory Results: KOH and fungal culture are positive for Trichophyton rubrum.",
    disease: "Onychomycosis",
    questions: [
      {
        q: "What is the most effective treatment for this patient?",
        options: ["Topical Ciclopirox nail lacquer", "Oral Terbinafine (usually for 12 weeks for toenails)", "Oral Nystatin", "Surgical removal of all nails"],
        ans: 1,
        exp: "Oral Terbinafine has significantly higher cure rates than topical treatments for onychomycosis."
      },
      {
        q: "Which laboratory test should be monitored during treatment with oral Terbinafine?",
        options: ["Renal function (BUN/Cr)", "Liver Function Tests (ALT/AST)", "Complete Blood Count", "Lipid panel"],
        ans: 1,
        exp: "Oral Terbinafine can cause hepatotoxicity; baseline and periodic LFTs are recommended."
      },
      {
        q: "If the patient had underlying liver cirrhosis, what would be the best management?",
        options: ["Still use oral Terbinafine", "Topical efinaconazole or avoid systemic treatment", "Oral Ketoconazole", "None of the above"],
        ans: 1,
        exp: "Systemic antifungals should be avoided in patients with active or chronic liver disease."
      }
    ]
  },
  {
    title: "The Rapidly Spreading Leg Redness",
    scenario: "A 55-year-old male with Type 2 Diabetes presents with a warm, red, and painful area on his left lower leg that has spread over 24 hours.\n\nVitals: T 38.3 C, BP 130/80.\nPhysical Examination: Ill-defined erythema, warmth, and tenderness on the left pretibial area. There is a small crack (fissure) between his 4th and 5th toes.\nLaboratory Results: WBC 13,000.",
    disease: "Cellulitis",
    questions: [
      {
        q: "What is the most likely causative organism for this non-purulent presentation?",
        options: ["Staphylococcus aureus", "Streptococcus pyogenes (Group A Strep)", "Pseudomonas aeruginosa", "E. coli"],
        ans: 1,
        exp: "Group A Strep is the most common cause of non-purulent cellulitis. S. aureus is more common in purulent cases (abscesses)."
      },
      {
        q: "What is the best initial management for this patient?",
        options: ["Wait for blood cultures before starting antibiotics", "Empiric oral antibiotics (e.g., Cephalexin or Dicloxacillin)", "Topical Mupirocin", "Incision and drainage"],
        ans: 1,
        exp: "Non-purulent cellulitis is treated with empiric antibiotics targeting Gram-positive cocci."
      },
      {
        q: "What is the most important step to prevent recurrence in this patient?",
        options: ["Daily bleach baths", "Treatment of the tinea pedis (cracks between toes) as it serves as a portal of entry", "Compression stockings during the acute phase", "None"],
        ans: 1,
        exp: "Identifying and treating the 'portal of entry' is a key Step 2 management point."
      }
    ]
  },
  {
    title: "The Flaccid Blisters",
    scenario: "A 50-year-old male presents with painful sores in his mouth followed by fragile blisters on his chest and back that 'pop' easily.\n\nVitals: Normal.\nPhysical Examination: Eroded plaques on the oral mucosa. Flaccid bullae on the trunk; when the skin near a blister is rubbed, the top layer slides off (positive Nikolsky sign).\nLaboratory Results: Skin biopsy shows intraepidermal acantholysis. Direct Immunofluorescence (DIF) shows a 'fishnet' pattern of IgG.",
    disease: "Pemphigus Vulgaris",
    questions: [
      {
        q: "What is the primary target of autoantibodies in Pemphigus Vulgaris?",
        options: ["Hemidesmosomes", "Desmoglein 1 and 3 (Desmosomes)", "Type IV Collagen", "Basement membrane"],
        ans: 1,
        exp: "Loss of desmosome-mediated adhesion leads to intraepidermal cleavage (acantholysis)."
      },
      {
        q: "What is the first-line treatment for this condition?",
        options: ["Topical steroids only", "Systemic high-dose corticosteroids (e.g., Prednisone) and immunosuppressants", "IV Antibiotics", "Plasmapheresis as first-line"],
        ans: 1,
        exp: "Pemphigus is potentially fatal and requires systemic immunosuppression."
      },
      {
        q: "How does Bullous Pemphigoid differ clinically and pathologically from Pemphigus Vulgaris?",
        options: ["BP has flaccid blisters and is Nikolsky positive", "BP has tense blisters, is Nikolsky negative, and shows subepidermal cleavage", "BP always involves the mouth", "BP is more dangerous"],
        ans: 1,
        exp: "Bullous Pemphigoid involves hemidesmosomes, creating deeper, more stable (tense) blisters."
      }
    ]
  },
  {
    title: "The Silver Scales on the Elbows",
    scenario: "A 30-year-old male presents with thick, red, scaly patches on his elbows and knees that sometimes bleed when the scale is removed.\n\nVitals: Normal.\nPhysical Examination: Well-demarcated erythematous plaques with silvery-white scale (micaceous scale). Punctate bleeding is seen when a scale is lifted (Auspitz sign). Nail pitting is also present.\nLaboratory Results: None.",
    disease: "Plaque Psoriasis",
    questions: [
      {
        q: "What is the 'Best Initial' treatment for localized plaque psoriasis?",
        options: ["Oral Methotrexate", "High-potency topical corticosteroids (e.g., Clobetasol)", "UVB phototherapy", "Oral Prednisone"],
        ans: 1,
        exp: "Topical steroids are first-line for limited disease (<10% BSA)."
      },
      {
        q: "Why should systemic (oral) corticosteroids be avoided in the treatment of psoriasis?",
        options: ["They don't work", "Risk of triggering life-threatening Erythrodermic or Pustular Psoriasis upon withdrawal", "They cause weight gain", "None of the above"],
        ans: 1,
        exp: "This is a major 'Don't Do' in the management of psoriasis."
      },
      {
        q: "The patient complains of morning stiffness in his fingers that lasts for an hour. What is the most likely association?",
        options: ["Osteoarthritis", "Psoriatic Arthritis", "Gout", "Lupus"],
        ans: 1,
        exp: "Psoriatic arthritis occurs in up to 30% of patients with skin psoriasis."
      }
    ]
  },
  {
    title: "The Sudden Hair Patch",
    scenario: "A 22-year-old female presents with a sudden 'bald spot' on her head that appeared over the last week. She has no pain or itching.\n\nVitals: Normal.\nPhysical Examination: A well-circumscribed, 2-cm smooth patch of complete hair loss on the scalp. Short, 'exclamation point' hairs are seen at the periphery. The scalp looks normal (no scale or inflammation).\nLaboratory Results: None.",
    disease: "Alopecia Areata",
    questions: [
      {
        q: "What is the most likely underlying mechanism for this condition?",
        options: ["Fungal infection", "Autoimmune destruction of the hair follicle", "Stress-induced shedding", "Genetic balding"],
        ans: 1,
        exp: "Alopecia areata is a T-cell mediated autoimmune disease."
      },
      {
        q: "What is the first-line treatment for localized alopecia areata?",
        options: ["Minoxidil", "Intralesional corticosteroid injections (e.g., Triamcinolone)", "Oral Griseofulvin", "Wig fitting"],
        ans: 1,
        exp: "Injections are highly effective for small patches, bypassing the skin barrier."
      },
      {
        q: "What is the name for complete loss of all scalp hair?",
        options: ["Alopecia totalis", "Alopecia universalis", "Telogen effluvium", "Traction alopecia"],
        ans: 0,
        exp: "Alopecia totalis = whole scalp; Alopecia universalis = whole body hair."
      }
    ]
  },
  {
    title: "The Weeping Face in the Toddler",
    scenario: "An 18-month-old child presents with an intensely itchy rash on his cheeks and the folds of his elbows. He has a history of asthma.\n\nVitals: Normal.\nPhysical Examination: Erythematous, poorly demarcated, weeping plaques with crusting on the face. Lichenification (thickening) is seen in the antecubital and popliteal fossae.\nLaboratory Results: None.",
    disease: "Atopic Dermatitis (Eczema)",
    questions: [
      {
        q: "What is the 'Foundation' of long-term management for atopic dermatitis?",
        options: ["Topical steroids", "Frequent use of thick emollients (moisturizers) to restore the skin barrier", "Daily swimming", "Antibiotics"],
        ans: 1,
        exp: "Maintaining skin hydration and barrier function is critical to reduce flares."
      },
      {
        q: "For acute flares of dermatitis, what is the best initial treatment?",
        options: ["Oral Prednisone", "Topical corticosteroids (matching potency to the body site)", "Topical antifungal", "Oral Antihistamines as primary treatment"],
        ans: 1,
        exp: "Low-potency steroids are used for the face/skin folds; higher potency for the body."
      },
      {
        q: "If the child develops a sudden eruption of painful, 'punched-out' erosions on top of the eczema, what should you suspect?",
        options: ["Bacterial superinfection", "Eczema Herpeticum (HSV infection)", "SJS", "Molluscum"],
        ans: 1,
        exp: "Eczema herpeticum is a dermatologic emergency requiring prompt acyclovir."
      }
    ]
  },
  {
    title: "The Golden Crust",
    scenario: "A 5-year-old boy presents with 'sores' around his nose and mouth that began as small blisters and have now turned into 'honey-colored' crusts.\n\nVitals: Normal.\nPhysical Examination: Multiple erythematous erosions with adherent golden-yellow crusts on the perioral area. No fever.\nLaboratory Results: Gram stain shows Gram-positive cocci in clusters.",
    disease: "Impetigo (Non-bullous)",
    questions: [
      {
        q: "What is the best initial treatment for localized impetigo (a few lesions)?",
        options: ["Topical Mupirocin ointment", "Oral Cephalexin", "Topical steroids", "Soap and water only"],
        ans: 0,
        exp: "Topical mupirocin is sufficient for limited, non-bullous impetigo."
      },
      {
        q: "Which organism is the most common cause of both bullous and non-bullous impetigo?",
        options: ["Streptococcus pyogenes", "Staphylococcus aureus", "Pseudomonas", "MRSA only"],
        ans: 1,
        exp: "S. aureus is now the most frequent isolate."
      },
      {
        q: "What is a potential 'Nonsuppurative' complication of impetigo caused by Group A Strep?",
        options: ["Acute Rheumatic Fever", "Post-streptococcal Glomerulonephritis (PSGN)", "Sepsis", "Meningitis"],
        ans: 1,
        exp: "PSGN can follow strep skin infections, but Rheumatic Fever generally only follows strep pharyngitis."
      }
    ]
  },
  {
    title: "The Painful Rash and the 'Crops' of Blisters",
    scenario: "A 65-year-old male presents with burning pain followed by a rash on one side of his chest.\n\nVitals: Normal.\nPhysical Examination: Clusters of vesicles on an erythematous base in a dermatomal distribution (T4) on the right side. The rash does not cross the midline.\nLaboratory Results: Tzanck smear shows multinucleated giant cells.",
    disease: "Herpes Zoster (Shingles)",
    questions: [
      {
        q: "What is the best initial treatment to reduce the duration of symptoms and the risk of Post-herpetic Neuralgia (PHN)?",
        options: ["Topical Acyclovir", "Oral Valacyclovir or Famciclovir within 72 hours of onset", "Oral Prednisone alone", "Pain medication only"],
        ans: 1,
        exp: "Early antiviral therapy is the standard of care."
      },
      {
        q: "If the patient develops a vesicle on the tip of his nose (Hutchinson sign), what is the next step?",
        options: ["Topical Bacitracin", "Urgent Ophthalmology consultation (risk of Zoster Ophthalmicus)", "Add oral steroids", "Ignore it"],
        ans: 1,
        exp: "V1 involvement can lead to keratitis and permanent vision loss."
      },
      {
        q: "Which vaccine is recommended for adults >= 50 years to prevent this condition?",
        options: ["MMR", "Recombinant Zoster Vaccine (Shingrix)", "Pneumococcal vaccine", "None"],
        ans: 1,
        exp: "Shingrix is a highly effective 2-dose series for older adults."
      }
    ]
  },
  {
    title: "The Itchy Welts",
    scenario: "A 30-year-old woman presents with itchy 'hives' that appear and disappear within a few hours. This has been happening daily for 2 months.\n\nVitals: Normal.\nPhysical Examination: Multiple edematous, erythematous plaques (wheals) on the trunk and limbs. No individual lesion lasts more than 24 hours.\nLaboratory Results: None.",
    disease: "Chronic Spontaneous Urticaria",
    questions: [
      {
        q: "What is the first-line treatment for chronic urticaria?",
        options: ["Oral Prednisone", "Second-generation H1 antihistamines (e.g., Cetirizine, Loratadine) at standard or high doses", "Skin biopsy", "Strict diet"],
        ans: 1,
        exp: "Non-sedating antihistamines are the foundation of therapy. Prednisone is avoided for chronic management."
      },
      {
        q: "If a single lesion lasts more than 24 hours and leaves a bruise (purpura) when it resolves, what should you suspect?",
        options: ["Simple allergy", "Urticarial Vasculitis (requires biopsy)", "SJS", "Spider bite"],
        ans: 1,
        exp: "This 'red flag' distinguishes vasculitis from simple urticaria."
      },
      {
        q: "Is extensive allergy testing (RAST/Skin tests) usually helpful for CHRONIC (>6 weeks) urticaria?",
        options: ["Yes, always", "No, an external trigger is rarely found in chronic spontaneous urticaria", "Only in children", "None"],
        ans: 1,
        exp: "Extensive workups are generally low-yield and not recommended unless specific triggers are suggested by history."
      }
    ]
  },
  {
    title: "The Shiny Pink Patch and the Sun",
    scenario: "A 70-year-old male presents with a 'pimple' on his nose that has been bleeding occasionally and hasn't healed for 4 months.\n\nVitals: Normal.\nPhysical Examination: A pearly, pink papule with a 'rolled' border and visible small blood vessels (telangiectasias). Central ulceration is present.\nLaboratory Results: Biopsy shows nests of basaloid cells with peripheral palisading.",
    disease: "Basal Cell Carcinoma (BCC)",
    questions: [
      {
        q: "What is the treatment of choice for a high-risk BCC located on the 'H-zone' of the face (nose, eyes, lips)?",
        options: ["Cryotherapy (freezing)", "Mohs Micrographic Surgery", "Topical 5-FU", "Simple excision with 1 cm margins"],
        ans: 1,
        exp: "Mohs surgery allows for the highest cure rate and maximum tissue sparing in cosmetically sensitive/high-risk areas."
      },
      {
        q: "Does BCC have a high risk of distant metastasis?",
        options: ["Yes", "No, it is locally invasive but almost never metastasizes", "Only if it is red", "None"],
        ans: 1,
        exp: "BCC's danger lies in its local destruction of skin, muscle, and bone."
      },
      {
        q: "What is the primary risk factor for developing BCC?",
        options: ["Smoking", "Chronic UV radiation (sun exposure)", "Arsenic", "Viruses"],
        ans: 1,
        exp: "Sun protection is the most important preventive measure."
      }
    ]
  },
  {
    title: "The Scaly Patch that Won't Go Away",
    scenario: "A 65-year-old fair-skinned male has a 1-cm, red, scaly, and crusty patch on his lower lip that sometimes feels 'gritty' like sandpaper.\n\nVitals: Normal.\nPhysical Examination: A firm, erythematous, scaly plaque on the vermilion border of the lower lip. No palpable lymphadenopathy.\nLaboratory Results: Biopsy shows full-thickness atypia of keratinocytes and invasion into the dermis.",
    disease: "Squamous Cell Carcinoma (SCC)",
    questions: [
      {
        q: "What is the precursor lesion to SCC called?",
        options: ["Seborrheic keratosis", "Actinic keratosis", "Molluscum", "Dermatofibroma"],
        ans: 1,
        exp: "Actinic keratoses (AKs) are 'pre-cancers' that can progress to SCC."
      },
      {
        q: "SCCs on the lip or ear have a higher risk of which complication compared to those on the trunk?",
        options: ["Metastasis", "Bleeding", "Infection", "Healing faster"],
        ans: 0,
        exp: "Lip and ear lesions are considered high-risk sites for SCC metastasis."
      },
      {
        q: "If a patient has many scattered actinic keratoses ('field cancerization'), what is a good treatment option?",
        options: ["Individual cryotherapy for each", "Field therapy (e.g., Topical 5-Fluorouracil or Imiquimod)", "Oral chemotherapy", "None"],
        ans: 1,
        exp: "Field therapy treats both visible and subclinical AKs."
      }
    ]
  },
  {
    title: "The Itchy Ring",
    scenario: "A 20-year-old wrestler presents with a red, 'ring-shaped' rash on his arm that has been expanding.\n\nVitals: Normal.\nPhysical Examination: An annular erythematous plaque with a scaly, active border and central clearing.\nLaboratory Results: KOH prep from the scaly edge shows branching, septate hyphae.",
    disease: "Tinea Corporis (Ringworm)",
    questions: [
      {
        q: "What is the first-line treatment for localized tinea corporis?",
        options: ["Oral Griseofulvin", "Topical antifungals (e.g., Clotrimazole, Terbinafine cream)", "Topical Nystatin", "Topical Steroids"],
        ans: 1,
        exp: "Unlike tinea capitis, tinea corporis usually responds well to topical therapy."
      },
      {
        q: "Why should Nystatin be avoided in the treatment of Tinea (dermatophytes)?",
        options: ["It's too expensive", "Nystatin only works for Candida, not dermatophytes (Tinea)", "It's too strong", "None"],
        ans: 1,
        exp: "This is a frequent 'distractor' on Step exams."
      },
      {
        q: "What is the term for a tinea infection that has been worsened/altered by the use of topical steroids?",
        options: ["Tinea incognito", "Tinea capitis", "Majocchi granuloma", "None"],
        ans: 0,
        exp: "Steroids suppress the inflammation but allow the fungus to thrive and spread deeper."
      }
    ]
  },
  {
    title: "The Painful Armpit Bumps",
    scenario: "A 24-year-old obese female presents with recurrent, painful 'boils' in her armpits that leave scars.\n\nVitals: Normal.\nPhysical Examination: Multiple inflammatory nodules, abscesses, and 'double-headed' comedones in the axillae. Sinus tracts and 'bridge' scars are present.\nLaboratory Results: None.",
    disease: "Hidradenitis Suppurativa (HS)",
    questions: [
      {
        q: "What is the primary management strategy for HS?",
        options: ["Repeat incision and drainage of every lesion", "Weight loss, smoking cessation, and step-wise therapy (Topical clindamycin -> Oral tetracyclines -> Biologics/Surgery)", "Continuous high-dose oral steroids", "Long-term IV antibiotics"],
        ans: 1,
        exp: "HS is a chronic inflammatory condition, not a simple recurrent infection."
      },
      {
        q: "What is the Hurley Staging system used for?",
        options: ["Acne severity", "Categorizing the severity of HS (Stage I: no tracts; II: limited tracts; III: diffuse involvement/interconnected tracts)", "Melanoma depth", "None"],
        ans: 1,
        exp: "Management depends heavily on the Hurley stage."
      },
      {
        q: "Which biologic agent is FDA-approved for moderate-to-severe HS?",
        options: ["Rituximab", "Adalimumab (Anti-TNF)", "Infliximab", "None"],
        ans: 1,
        exp: "TNF-alpha inhibitors have shown efficacy in severe HS cases."
      }
    ]
  },
  {
    title: "The Mouth Patches in the Newborn",
    scenario: "A 2-week-old infant presents with white patches in his mouth. He is breastfeeding well but his mother has 'nipple pain'.\n\nVitals: Normal.\nPhysical Examination: Adherent white plaques on the buccal mucosa and tongue that bleed slightly when scraped off with a tongue depressor.\nLaboratory Results: KOH shows budding yeast and pseudohyphae.",
    disease: "Oral Candidiasis (Thrush)",
    questions: [
      {
        q: "What is the best initial treatment for an infant with oral thrush?",
        options: ["Oral Nystatin suspension", "Oral Griseofulvin", "Topical Mupirocin", "IV Fluconazole"],
        ans: 0,
        exp: "Nystatin 'swish and swallow' is the standard first-line for infantile thrush."
      },
      {
        q: "Should the mother also be evaluated and treated?",
        options: ["No, it's not related", "Yes, the mother's nipples should be treated with topical antifungal to prevent a cycle of reinfection", "Only if she has a fever", "None"],
        ans: 1,
        exp: "Candida can be passed back and forth between the infant's mouth and the mother's nipple."
      },
      {
        q: "In an adult, what condition should recurrent or refractory oral thrush prompt evaluation for?",
        options: ["Diabetes", "HIV infection", "Immunosuppressive medication use", "All of the above"],
        ans: 3,
        exp: "Thrush in a healthy-appearing adult is a major red flag for immune dysfunction."
      }
    ]
  },
  {
    title: "The Sudden Wide Rash (Drug?)",
    scenario: "A patient develops a red, symmetric rash on his trunk 5 days after starting a new medication for a sinus infection.\n\nVitals: Normal (no fever).\nPhysical Examination: Bright red macules and papules that are beginning to coalesce. No mucosal involvement. No skin tenderness or blisters.\nLaboratory Results: Normal.",
    disease: "Morbilliform Drug Eruption",
    questions: [
      {
        q: "What is the most likely 'latency' for this type of common drug rash?",
        options: ["30 minutes", "7-14 days after starting the drug (can be shorter on re-exposure)", "1 year", "None"],
        ans: 1,
        exp: "This is a delayed Type IV hypersensitivity reaction."
      },
      {
        q: "What is the first step in management?",
        options: ["Biopsy", "Discontinue the suspected drug", "Start Prednisone", "Give IVIG"],
        ans: 1,
        exp: "The most important management step for any suspected drug eruption is stopping the culprit."
      },
      {
        q: "Which symptom would be a 'Red Flag' suggesting a more severe reaction like SJS or DRESS?",
        options: ["Itching", "Fever, facial edema, or skin tenderness", "Slight redness", "None"],
        ans: 1,
        exp: "Systemic symptoms and skin pain distinguish simple rashes from life-threatening ones."
      }
    ]
  },
  {
    title: "The Christmas Tree Rash",
    scenario: "A 20-year-old female presents with a single, large, scaly red patch on her back, followed 1 week later by many smaller patches on her trunk.\n\nVitals: Normal.\nPhysical Examination: One 4-cm oval plaque with a 'collarette' of scale (Herald Patch). Dozens of smaller oval plaques follow the skin tension lines in a 'Christmas tree' distribution on the back.\nLaboratory Results: RPR is negative.",
    disease: "Pityriasis Rosea",
    questions: [
      {
        q: "What is the standard management for Pityriasis Rosea?",
        options: ["Oral Antifungals", "Reassurance and supportive care for itching (it usually resolves spontaneously in 6-8 weeks)", "Oral Steroids", "Topical Antibiotics"],
        ans: 1,
        exp: "PR is a self-limited condition of suspected viral origin."
      },
      {
        q: "Why is an RPR often performed in cases that look like Pityriasis Rosea?",
        options: ["PR is caused by syphilis", "Secondary syphilis can perfectly mimic the rash of PR (including the distribution on the trunk)", "To check for pregnancy", "None"],
        ans: 1,
        exp: "This is a classic 'must-rule-out' on Step exams."
      },
      {
        q: "The Herald Patch is often misdiagnosed as which condition?",
        options: ["Eczema", "Tinea Corporis (Ringworm)", "Psoriasis", "Acne"],
        ans: 1,
        exp: "Because of its annular, scaly appearance, it is frequently mistaken for fungus."
      }
    ]
  },
  {
    title: "The Flushed Face and the Alcohol",
    scenario: "A 45-year-old female presents with 'flushing' episodes. She notices her face gets very red and hot after she drinks a glass of red wine or eats spicy food.\n\nVitals: Normal.\nPhysical Examination: Central facial erythema and telangiectasias. No papules or pustules. A few small, red 'bumps' are noted on the conjunctiva.\nLaboratory Results: None.",
    disease: "Erythematotelangiectatic Rosacea",
    questions: [
      {
        q: "What is the first-line management for the erythema (redness) of rosacea?",
        options: ["Topical steroids", "Trigger avoidance and sun protection; consider topical brimonidine or laser therapy for persistent redness", "Oral antibiotics", "Oral Isotretinoin"],
        ans: 1,
        exp: "Steroids are avoided as they can cause 'steroid-induced rosacea'."
      },
      {
        q: "Which of the following is a common trigger for rosacea flushing?",
        options: ["Cold water", "Sunlight, heat, alcohol, and spicy foods", "Green vegetables", "Reading"],
        ans: 1,
        exp: "These are the classic 'Step' triggers."
      },
      {
        q: "Chronic rosacea can lead to irreversible skin thickening on the nose, called:",
        options: ["Rhinophyma", "Rosacea totalis", "Nasal warts", "None"],
        ans: 0,
        exp: "Rhinophyma is more common in men and may require surgical intervention."
      }
    ]
  },
  {
    title: "The Warty Bumps and the Pool",
    scenario: "A 7-year-old boy presents with dozens of small, 'shiny' bumps on his trunk and arms. He is on a local swim team.\n\nVitals: Normal.\nPhysical Examination: 2-5 mm skin-colored, firm, dome-shaped papules with a central dimple (umbilication).\nLaboratory Results: None.",
    disease: "Molluscum Contagiosum",
    questions: [
      {
        q: "What is the cause of Molluscum Contagiosum?",
        options: ["HPV", "Poxvirus", "Herpes virus", "Bacteria"],
        ans: 1,
        exp: "It is a highly contagious poxvirus infection."
      },
      {
        q: "In an immunocompetent child, what is the best initial management approach?",
        options: ["Aggressive cryotherapy", "Observation (it typically resolves spontaneously over months to years)", "Oral Acyclovir", "Topical Steroids"],
        ans: 1,
        exp: "While treatment (curettage, cryo) is an option, watchful waiting is often preferred in children to avoid pain/scarring."
      },
      {
        q: "Extensive, giant, or refractory molluscum in an adult should prompt testing for:",
        options: ["Diabetes", "HIV", "Liver failure", "Vitamin deficiency"],
        ans: 1,
        exp: "Widespread molluscum in an adult is a strong indicator of cellular immunodeficiency."
      }
    ]
  },
  {
    title: "The Painful Mouth and the Tense Blister",
    scenario: "An 80-year-old male presents with widespread, very itchy, large blisters on his thighs and abdomen.\n\nVitals: Normal.\nPhysical Examination: Multiple large, tense bullae on an erythematous base. Nikolsky sign is negative. The mouth is unaffected.\nLaboratory Results: DIF shows a linear band of IgG and C3 along the basement membrane.",
    disease: "Bullous Pemphigoid",
    questions: [
      {
        q: "What is the target of autoantibodies in Bullous Pemphigoid?",
        options: ["Desmosomes", "Hemidesmosomes (BP180 and BP230)", "Type IV Collagen", "Basal cells"],
        ans: 1,
        exp: "BP involves the 'anchor' of the basal layer to the basement membrane."
      },
      {
        q: "How is localized or mild Bullous Pemphigoid typically treated?",
        options: ["Systemic chemotherapy", "High-potency topical corticosteroids (can be as effective as oral with fewer side effects)", "IV Antibiotics", "Observation only"],
        ans: 1,
        exp: "Recent studies favor high-potency topicals over systemic steroids for BP, especially in the elderly."
      },
      {
        q: "What is a common PRODROMAL symptom of Bullous Pemphigoid that can precede blisters by months?",
        options: ["Fever", "Intense generalized itching (pruritus) or urticarial-like plaques", "Mouth sores", "None"],
        ans: 1,
        exp: "Elderly patients with 'refractory itch' should be monitored for BP."
      }
    ]
  },
  {
    title: "The Scaly Scalp and the Red Face",
    scenario: "A 35-year-old male presents with 'dandruff' and red, itchy skin in his eyebrows and around his nose.\n\nVitals: Normal.\nPhysical Examination: Erythema and 'greasy' yellow scale on the scalp, eyebrows, nasolabial folds, and chest.\nLaboratory Results: None.",
    disease: "Seborrheic Dermatitis",
    questions: [
      {
        q: "Which organism is thought to play a role in the pathogenesis of seborrheic dermatitis?",
        options: ["Staphylococcus", "Malassezia (yeast)", "Candida", "Dermatophytes"],
        ans: 1,
        exp: "The yeast triggers an inflammatory response in areas with high sebum production."
      },
      {
        q: "What is the best initial treatment for the face and scalp?",
        options: ["Topical Metronidazole", "Topical antifungals (e.g., Ketoconazole shampoo/cream) and mild topical steroids", "Oral Terbinafine", "Daily face scrubbing with alcohol"],
        ans: 1,
        exp: "A combination of antifungal (to reduce Malassezia) and anti-inflammatory (steroid) is most effective."
      },
      {
        q: "Severe or 'explosive' onset of seborrheic dermatitis can be an early sign of which systemic infection?",
        options: ["Hepatitis B", "HIV", "Syphilis", "Tuberculosis"],
        ans: 1,
        exp: "Seborrheic dermatitis is famously more severe and widespread in HIV-positive patients."
      }
    ]
  }
];
