const fs = require('fs');

const cases = [
  {
    title: "The Pearly Papule",
    scenario: "A 65-year-old fair-skinned male presents with a non-healing bump on his nose that has been present for 6 months. He notes it bleeds occasionally when he towels his face.\n\nVitals: Normal.\nPhysical Examination: A 6mm shiny, pearly, flesh-colored papule on the right nasal ala. Central ulceration ('rodent ulcer') and prominent arborizing telangiectasias are visible under magnification.\nLaboratory Results: Biopsy shows islands of basaloid cells with peripheral palisading and retraction artifact.",
    disease: "Nodular Basal Cell Carcinoma (BCC)",
    questions: [
      {
        q: "What is the most common clinical subtype of Basal Cell Carcinoma?",
        options: ["Superficial", "Nodular", "Morpheaform", "Pigmented"],
        ans: 1,
        exp: "Nodular BCC is the most common subtype, classically presenting as a pearly papule with telangiectasias on sun-exposed areas."
      },
      {
        q: "Which histological feature is characteristic of BCC?",
        options: ["Keratin pearls", "Peripheral palisading of nuclei", "Decentering of melanocytes", "S-100 positivity"],
        ans: 1,
        exp: "Basaloid islands with peripheral palisading and a specialized stroma with retraction artifact are hallmark pathologic findings."
      },
      {
        q: "What is the primary risk factor for developing BCC?",
        options: ["Chronic arsenic exposure", "Intermittent intense UV radiation and fair skin type", "Human Papillomavirus (HPV)", "Ionizing radiation only"],
        ans: 1,
        exp: "UV radiation (especially UVB) is the primary driver. Fair-skinned individuals (Fitzpatrick I-II) are at highest risk."
      }
    ]
  },
  {
    title: "The Eczema that Didn't Quit",
    scenario: "A 55-year-old woman presents with a red, scaly patch on her upper back. She has been treating it with over-the-counter hydrocortisone for 3 months without improvement.\n\nVitals: Normal.\nPhysical Examination: A 1.5 cm well-demarcated, thin, erythematous scaly plaque. It lacks the pearly border of a typical nodule.\nLaboratory Results: Shave biopsy reveals budding of basaloid cells from the epidermis into the superficial dermis.",
    disease: "Superficial Basal Cell Carcinoma",
    questions: [
      {
        q: "Which subtype of BCC is most likely to be confused with eczema or psoriasis?",
        options: ["Nodular", "Superficial", "Infiltrative", "Morpheaform"],
        ans: 1,
        exp: "Superficial BCC presents as a scaly, red plaque and is frequently misdiagnosed as an inflammatory dermatosis."
      },
      {
        q: "On which body site is Superficial BCC most commonly found?",
        options: ["Nose", "Trunk and extremities", "Palms", "Scalp"],
        ans: 1,
        exp: "Unlike nodular BCC which favors the face, superficial BCC is very common on the trunk."
      },
      {
        q: "What is a viable non-surgical treatment option for this specific superficial lesion?",
        options: ["Systemic chemotherapy", "Topical 5-fluorouracil or Imiquimod", "Oral isotretinoin", "Topical antifungal"],
        ans: 1,
        exp: "Topical field therapies like Imiquimod or 5-FU are FDA-approved and effective for superficial BCC."
      }
    ]
  },
  {
    title: "The Dark Non-Melanoma",
    scenario: "A 70-year-old male presents with a dark spot on his cheek. He is concerned about melanoma.\n\nVitals: Normal.\nPhysical Examination: A 5mm brown-to-black pigmented papule. On dermoscopy, large blue-gray ovoid nests and leaf-like structures are seen. No pigment network is present.\nLaboratory Results: Biopsy confirms BCC with heavy melanin deposition.",
    disease: "Pigmented Basal Cell Carcinoma",
    questions: [
      {
        q: "Pigmented BCC is most common in which population?",
        options: ["Fitzpatrick Type I", "Individuals with darker skin phototypes (Fitzpatrick IV-VI)", "Children", "Albino patients"],
        ans: 1,
        exp: "While rare in Caucasians, pigmented BCC is a common presentation of BCC in darker-skinned individuals."
      },
      {
        q: "Which dermoscopic finding is highly suggestive of pigmented BCC rather than melanoma?",
        options: ["Atypical pigment network", "Leaf-like areas and large blue-gray ovoid nests", "Pseudopods", "Regression structures"],
        ans: 1,
        exp: "Leaf-like areas, spoke-wheel structures, and blue-gray ovoid nests are specific for BCC."
      },
      {
        q: "Does pigmentation change the prognosis of BCC?",
        options: ["Yes, it is more aggressive", "No, the biological behavior is similar to the nodular subtype", "Yes, it frequently metastasizes", "It is always benign"],
        ans: 1,
        exp: "The presence of pigment does not inherently change the biological behavior of the underlying BCC subtype."
      }
    ]
  },
  {
    title: "The Subtle Scar",
    scenario: "A 45-year-old female presents with what she describes as a 'white scar' on her temple, though she recalls no injury there.\n\nVitals: Normal.\nPhysical Examination: An ill-defined, indurated, ivory-white plaque that looks like a small area of localized scleroderma. The borders are difficult to palpate.\nLaboratory Results: Biopsy shows narrow strands and cords of basaloid cells embedded in a dense, fibrotic stroma.",
    disease: "Morpheaform (Sclerosing) Basal Cell Carcinoma",
    questions: [
      {
        q: "Why is the Morpheaform subtype of BCC considered particularly dangerous?",
        options: ["It grows very fast", "It has high metastatic potential", "It is clinically subtle with extensive subclinical spread, making surgical margins difficult to determine", "It is painful"],
        ans: 2,
        exp: "The 'iceberg' nature of morpheaform BCC often leads to large surgical defects because the tumor extends far beyond its visible clinical borders."
      },
      {
        q: "What is the preferred surgical management for this subtype of BCC on the face?",
        options: ["Wide local excision (2cm margins)", "Mohs Micrographic Surgery", "Cryosurgery", "Curettage and electrodesiccation"],
        ans: 1,
        exp: "Mohs surgery is indicated for aggressive subtypes (morpheaform, infiltrative) and high-risk locations (face) to ensure clear margins while sparing tissue."
      },
      {
        q: "What is the classic histological description of Morpheaform BCC?",
        options: ["Large nests with palisading", "Single-file 'Indian-filing' cells", "Narrow 'finger-like' strands of basaloid cells in a dense 'desmoplastic' stroma", "Squamous eddies"],
        ans: 2,
        exp: "The dense fibrous stroma gives it the scar-like (morpheaform) clinical appearance."
      }
    ]
  },
  {
    title: "The Multiple BCC Syndrome",
    scenario: "A 20-year-old male presents with dozens of BCCs on his face and trunk. He also has odontogenic keratocysts of the jaw and palmar pits.\n\nVitals: Normal.\nPhysical Examination: Multiple BCCs of varying sizes. Tiny 'pits' on the palms and soles. Frontal bossing and hypertelorism.\nLaboratory Results: X-ray shows bifid ribs and calcification of the falx cerebri.",
    disease: "Gorlin Syndrome (Nevoid Basal Cell Carcinoma Syndrome)",
    questions: [
      {
        q: "Which gene mutation is responsible for Gorlin Syndrome?",
        options: ["PTCH1 (Patched)", "BRAF", "p53", "CDKN2A"],
        ans: 0,
        exp: "Mutations in PTCH1 lead to constitutive activation of the Hedgehog signaling pathway."
      },
      {
        q: "What is a classic skeletal finding in Gorlin Syndrome?",
        options: ["Osteosarcoma", "Bifid ribs", "Vertebral fusion", "Short stature"],
        ans: 1,
        exp: "Skeletal anomalies like bifid ribs and kyphoscoliosis are major/minor criteria for the syndrome."
      },
      {
        q: "Which treatment modality should be AVOIDED in Gorlin Syndrome patients if possible?",
        options: ["Surgical excision", "Radiation therapy", "Photodynamic therapy", "Topical retinoids"],
        ans: 1,
        exp: "Radiation therapy can induce an explosive eruption of hundreds of new BCCs within the radiation field in these genetically susceptible individuals."
      }
    ]
  },
  {
    title: "Advanced BCC Management",
    scenario: "A 75-year-old patient has a massive, locally invasive BCC of the scalp that has eroded into the calvarium. It is deemed non-resectable by the surgical team.\n\nVitals: Normal.\nPhysical Examination: Large, ulcerated, fungating mass on the scalp with bone exposure.\nLaboratory Results: Biopsy confirms BCC.",
    disease: "Locally Advanced BCC (Hedgehog Inhibitors)",
    questions: [
      {
        q: "What is the target of the medication Vismodegib?",
        options: ["VEGF", "SMO (Smoothened) in the Hedgehog pathway", "PD-1", "CTLA-4"],
        ans: 1,
        exp: "Vismodegib is a small molecule inhibitor of SMO, blocking the overactive Hedgehog pathway in BCC."
      },
      {
        q: "What is a common, treatment-limiting side effect of Vismodegib?",
        options: ["Hypertension", "Muscle cramps, dysgeusia (loss of taste), and alopecia", "Diarrhea", "Kidney stones"],
        ans: 1,
        exp: "Muscle cramps and taste disturbances are very common and often lead to patients discontinuing the drug."
      },
      {
        q: "When is Vismodegib indicated?",
        options: ["For all nodular BCCs", "For metastatic or locally advanced BCC that is not amenable to surgery or radiation", "As first-line for superficial BCC", "For melanoma"],
        ans: 1,
        exp: "It is reserved for advanced disease where local therapies have failed or are impossible."
      }
    ]
  },
  {
    title: "The Rough Spot",
    scenario: "A 70-year-old fair-skinned male presents with multiple rough, sandpaper-like spots on his bald scalp.\n\nVitals: Normal.\nPhysical Examination: Multiple 3-5 mm erythematous, gritty, scaly papules on the scalp and ears. They are better felt than seen.\nLaboratory Results: Biopsy shows partial-thickness epidermal dysplasia with 'flag sign' (alternating orthokeratosis and parakeratosis).",
    disease: "Actinic Keratosis (AK)",
    questions: [
      {
        q: "Actinic Keratosis is a precursor to which malignancy?",
        options: ["BCC", "Squamous Cell Carcinoma (SCC)", "Melanoma", "Merkel Cell Carcinoma"],
        ans: 1,
        exp: "AK is considered an intraepithelial (pre-cancerous) stage of SCC."
      },
      {
        q: "What is the 'flag sign' in AK pathology?",
        options: ["Red, white, and blue staining", "Alternating areas of parakeratosis (over dysplastic cells) and orthokeratosis (over normal cells)", "Peripheral palisading", "Melanin incontinence"],
        ans: 1,
        exp: "The 'flag sign' reflects the skip-like nature of the dysplasia."
      },
      {
        q: "What is the concept of 'field cancerization' in AK management?",
        options: ["The cancer spreads like a field", "The entire sun-damaged area contains subclinical genetic damage and is at risk for multiple future cancers, justifying treatments like topical 5-FU for the whole area", "It only affects farmers", "It requires soil analysis"],
        ans: 1,
        exp: "Field therapy treats both visible AKs and the surrounding 'field' of sun-damaged skin."
      }
    ]
  },
  {
    title: "SCC In-Situ",
    scenario: "A 60-year-old woman presents with a slow-growing, 2 cm, well-demarcated, scaly red plaque on her left lower leg. It looks like a patch of fixed psoriasis.\n\nVitals: Normal.\nPhysical Examination: Sharply demarcated, erythematous, scaly plaque on the pretibial area.\nLaboratory Results: Biopsy shows full-thickness epidermal dysplasia without invasion into the dermis. Windblown (disorganized) appearance of keratinocytes.",
    disease: "Bowen's Disease (SCC In-Situ)",
    questions: [
      {
        q: "What is the definition of SCC in-situ?",
        options: ["Cancer that has spread to lymph nodes", "Full-thickness dysplasia confined to the epidermis", "A deep invasive tumor", "A benign growth"],
        ans: 1,
        exp: "In-situ means 'in its original place,' meaning the basement membrane is still intact."
      },
      {
        q: "What is the term for Bowen's disease occurring on the glans penis?",
        options: ["Queyrat's erythroplasia", "Balanitis xerotica obliterans", "Pearly penile papules", "Fordyce spots"],
        ans: 0,
        exp: "Erythroplasia of Queyrat is the specific term for mucosal SCC in-situ of the glans."
      },
      {
        q: "What is the risk of progression to invasive SCC in untreated Bowen's disease?",
        options: ["0%", "Approximately 3-5%", "90%", "100%"],
        ans: 1,
        exp: "The risk is relatively low but real, necessitating treatment."
      }
    ]
  },
  {
    title: "The Invasive Growth",
    scenario: "A 75-year-old male smoker presents with a rapidly growing, painful, ulcerated nodule on his lower lip.\n\nVitals: Normal.\nPhysical Examination: A 1.2 cm firm, erythematous, hyperkeratotic nodule with a central ulcer on the vermilion border of the lower lip.\nLaboratory Results: Biopsy shows nests of atypical keratinocytes invading the dermis, with keratin pearls.",
    disease: "Invasive Squamous Cell Carcinoma",
    questions: [
      {
        q: "Which site for SCC has a higher risk of metastasis?",
        options: ["Sun-exposed cheek", "Lower lip or ear", "Trunk", "Forearm"],
        ans: 1,
        exp: "SCCs on the lip and ear have a higher metastatic rate (approx 10%) compared to SCCs arising in AKs on the face (approx 1%)."
      },
      {
        q: "What is a keratin pearl?",
        options: ["A piece of jewelry", "Concentric layers of squamous cells with central keratinization within the dermis", "A fungal spore", "A calcified follicle"],
        ans: 1,
        exp: "Keratin pearls indicate that the malignant cells are still attempting to differentiate into mature squamous cells."
      },
      {
        q: "Which patient population has a 65-100 fold increased risk of developing SCC?",
        options: ["Diabetics", "Organ transplant recipients on chronic immunosuppression", "Patients with hypertension", "Pregnant women"],
        ans: 1,
        exp: "Immunosuppression drastically increases the risk of SCC, and these tumors are often more aggressive."
      }
    ]
  },
  {
    title: "The Rapid Crater",
    scenario: "A 60-year-old male presents with a large, unsightly bump on his hand that appeared and grew to 2 cm in just 4 weeks.\n\nVitals: Normal.\nPhysical Examination: A symmetric, dome-shaped nodule with a central, prominent keratinous plug ('volcano-like').\nLaboratory Results: Biopsy shows a well-differentiated squamous proliferation with a central crater.",
    disease: "Keratoacanthoma (KA)",
    questions: [
      {
        q: "What is the characteristic clinical course of a Keratoacanthoma?",
        options: ["Slow growth over years", "Rapid growth (weeks) followed by a period of stability and potential spontaneous involution", "It never stops growing", "It only occurs in children"],
        ans: 1,
        exp: "KAs are known for their explosive growth followed by slow regression, leaving a scar."
      },
      {
        q: "How are KAs currently classified by most dermatopathologists?",
        options: ["As benign cysts", "As a well-differentiated variant of Squamous Cell Carcinoma", "As viral warts", "As melanocytic lesions"],
        ans: 1,
        exp: "Because they can be histologically indistinguishable from invasive SCC, they are usually treated as SCCs."
      },
      {
        q: "Multiple Keratoacanthomas are associated with which syndrome?",
        options: ["Gorlin syndrome", "Muir-Torre syndrome", "Ferguson-Smith or Grzybowski types", "Cowden syndrome"],
        ans: 2,
        exp: "Ferguson-Smith features multiple KAs that resolve, while Grzybowski involves thousands of eruptive KAs."
      }
    ]
  },
  {
    title: "The Cancer in the Scar",
    scenario: "A 50-year-old male presents with a non-healing, enlarging ulcer within a large burn scar on his leg that he sustained 20 years ago.\n\nVitals: Normal.\nPhysical Examination: A chronic ulcer with rolled, everted edges arising within an area of extensive scarring and skin graft.\nLaboratory Results: Biopsy shows invasive SCC.",
    disease: "Marjolin's Ulcer",
    questions: [
      {
        q: "What is a Marjolin's ulcer?",
        options: ["A stomach ulcer", "An SCC arising in an area of chronic inflammation, trauma, or scarring (e.g., burn scar, osteomyelitis sinus tract)", "A viral ulcer", "A pressure sore"],
        ans: 1,
        exp: "The term specifically refers to malignancy arising in chronically damaged skin."
      },
      {
        q: "What is true about the metastatic potential of Marjolin's ulcers compared to typical cutaneous SCC?",
        options: ["It is lower", "It is significantly higher (often 20-30%)", "It never metastasizes", "It is the same"],
        ans: 1,
        exp: "SCCs arising in scars or chronic ulcers are much more aggressive and prone to early metastasis."
      },
      {
        q: "What is the best management?",
        options: ["Topical antibiotics", "Wide surgical excision with lymph node assessment", "Wait and see", "Daily bandages"],
        ans: 1,
        exp: "Aggressive surgical intervention is required due to the high risk of spread."
      }
    ]
  },
  {
    title: "The Child with Early Cancers",
    scenario: "An 8-year-old child presents with multiple BCCs and SCCs on his face. His parents report he is extremely sensitive to the sun and develops severe burns easily.\n\nVitals: Normal.\nPhysical Examination: Marked poikiloderma (mottled pigmentation, atrophy, telangiectasias) on sun-exposed areas. Multiple skin cancers.\nLaboratory Results: DNA analysis shows a defect in nucleotide excision repair.",
    disease: "Xeroderma Pigmentosum (XP)",
    questions: [
      {
        q: "What is the underlying defect in Xeroderma Pigmentosum?",
        options: ["Vitamin D deficiency", "Defective nucleotide excision repair (NER) of UV-induced DNA damage (thymine dimers)", "Too much melanin", "Melanocyte absence"],
        ans: 1,
        exp: "XP patients cannot repair the DNA damage caused by UV light, leading to a 10,000-fold increase in skin cancer risk."
      },
      {
        q: "What is the most common cause of death in XP patients?",
        options: ["Infection", "Metastatic skin cancer (Melanoma or SCC)", "Heart failure", "Renal failure"],
        ans: 1,
        exp: "Despite rigorous sun protection, many succumb to multiple, aggressive skin malignancies."
      },
      {
        q: "What other organ system is frequently involved in XP?",
        options: ["Endocrine", "Neurological (progressive neurodegeneration in some types)", "Gastrointestinal", "Hematological"],
        ans: 1,
        exp: "Neurological abnormalities occur in about 20-30% of patients."
      }
    ]
  },
  {
    title: "The Changing Mole",
    scenario: "A 40-year-old female presents with a mole on her calf that has become darker and larger over the past 6 months. It occasionally itches.\n\nVitals: Normal.\nPhysical Examination: A 7mm asymmetric, irregularly bordered plaque with multiple shades of brown and black. No ulceration.\nLaboratory Results: Excisional biopsy is performed.",
    disease: "Superficial Spreading Melanoma (SSM)",
    questions: [
      {
        q: "What is the most common subtype of melanoma in Caucasians?",
        options: ["Lentigo maligna", "Nodular", "Superficial Spreading", "Acral lentiginous"],
        ans: 2,
        exp: "SSM accounts for approximately 70% of all melanomas."
      },
      {
        q: "What are the ABCDEs of melanoma?",
        options: ["Ache, Bleed, Color, Depth, Edge", "Asymmetry, Border irregularity, Color variegation, Diameter >6mm, Evolving", "Appearance, Benign, Cancer, Dark, Even", "Always, Be, Careful, During, Exams"],
        ans: 1,
        exp: "These are the classic clinical warning signs for a melanocytic lesion."
      },
      {
        q: "What is the recommended initial biopsy technique for a suspicious melanocytic lesion?",
        options: ["Superficial shave biopsy", "Narrow-margin excisional biopsy (to the fat)", "Punch biopsy of the darkest part", "Fine needle aspiration"],
        ans: 1,
        exp: "Excisional biopsy is preferred to allow the pathologist to determine the full Breslow depth, which is critical for staging."
      }
    ]
  },
  {
    title: "The Growing Bump",
    scenario: "A 50-year-old male presents with a rapidly growing, dark blue-black bump on his arm. He says it appeared out of nowhere 2 months ago.\n\nVitals: Normal.\nPhysical Examination: A 1 cm firm, symmetric, blue-black dome-shaped nodule. No preceding flat patch.\nLaboratory Results: Biopsy shows a thick tumor with a Breslow depth of 4.5 mm. High mitotic rate.",
    disease: "Nodular Melanoma",
    questions: [
      {
        q: "What defines Nodular Melanoma compared to other subtypes?",
        options: ["It is always blue", "It lacks a significant radial growth phase, beginning almost immediately in the vertical growth phase", "It only affects children", "It is the least dangerous type"],
        ans: 1,
        exp: "Nodular melanoma is aggressive because it grows downward (vertically) from the start, often reaching deep levels quickly."
      },
      {
        q: "Which ABCDE criteria does Nodular Melanoma frequently fail to meet?",
        options: ["A", "D", "E", "A, B, C, and D (it can be symmetric, small, and uniform)"],
        ans: 3,
        exp: "Nodular melanomas can be deceptively symmetric and uniform, but the 'E' (Evolving) is usually very prominent."
      },
      {
        q: "What is the most common color for nodular melanoma?",
        options: ["Tan", "Blue-black (though it can be amelanotic/red)", "Yellow", "White"],
        ans: 1,
        exp: "The deep pigment often gives it a dark, coal-like appearance."
      }
    ]
  },
  {
    title: "The Sun-Damaged Face",
    scenario: "An 80-year-old female presents with a large, brown, 'smudge-like' patch on her cheek that has been slowly expanding for 10 years.\n\nVitals: Normal.\nPhysical Examination: A 3 cm ill-defined, tan-to-dark brown macule with irregular pigmentation on a background of severe solar elastosis.\nLaboratory Results: Biopsy shows a proliferation of atypical melanocytes along the dermo-epidermal junction in a background of atrophic epidermis.",
    disease: "Lentigo Maligna (LM)",
    questions: [
      {
        q: "Lentigo Maligna is the in-situ stage of which melanoma subtype?",
        options: ["Superficial spreading", "Lentigo Maligna Melanoma", "Acral lentiginous", "Nodular"],
        ans: 1,
        exp: "Once an LM invades the dermis, it becomes Lentigo Maligna Melanoma."
      },
      {
        q: "In which population and site is LM most common?",
        options: ["Young adults, trunk", "Elderly individuals, chronically sun-damaged face/neck", "Children, legs", "African Americans, palms"],
        ans: 1,
        exp: "LM is a 'cumulative sun damage' melanoma, contrasting with the 'intermittent sun' SSM."
      },
      {
        q: "What is a common management challenge for LM?",
        options: ["It metastasizes early", "Ill-defined borders and large size make surgical clearance difficult on the face", "It is resistant to all therapy", "It is usually painful"],
        ans: 1,
        exp: "Because the borders are hard to see, recurrences are common unless wide margins or Mohs/map-guided surgery is used."
      }
    ]
  },
  {
    title: "The Dark Sole",
    scenario: "A 60-year-old African American male presents with a dark patch on the sole of his foot. He thought it was a bruise from walking.\n\nVitals: Normal.\nPhysical Examination: A 2 cm irregular, variegated black and gray macule on the right heel.\nLaboratory Results: Biopsy shows a lentiginous proliferation of melanocytes with prominent dendritic processes.",
    disease: "Acral Lentiginous Melanoma (ALM)",
    questions: [
      {
        q: "What is unique about the epidemiology of ALM?",
        options: ["It is the most common melanoma overall", "It is the most common subtype of melanoma in non-Caucasian populations (Black, Asian, Hispanic)", "It is caused by tanning beds", "It only affects the scalp"],
        ans: 1,
        exp: "While rare in whites, ALM is the dominant subtype in dark-skinned individuals."
      },
      {
        q: "Is ALM related to UV exposure?",
        options: ["Yes, very much", "No, it occurs on non-hair-bearing, non-sun-exposed surfaces (palms, soles, subungual)", "Only in fair-skinned people", "Only in the summer"],
        ans: 1,
        exp: "ALM is NOT driven by UV radiation, which is why it occurs in dark-skinned people on the soles."
      },
      {
        q: "What is the prognosis of ALM compared to other subtypes?",
        options: ["Inherently better", "Often poorer, but primarily due to frequent delay in diagnosis resulting in thicker tumors at presentation", "It is always benign", "It never metastasizes"],
        ans: 1,
        exp: "Because it's on the foot and patients/doctors often don't check there, it is usually advanced when found."
      }
    ]
  },
  {
    title: "The Streak in the Nail",
    scenario: "A 45-year-old female presents with a dark line in her thumbnail. She noticed it a year ago and says it is widening.\n\nVitals: Normal.\nPhysical Examination: A 4mm wide, dark brown longitudinal band in the right thumb nail plate. Pigment is also visible on the proximal nail fold (Hutchinson's sign).\nLaboratory Results: Nail matrix biopsy is performed.",
    disease: "Subungual Melanoma",
    questions: [
      {
        q: "What is Hutchinson's sign in the context of the nail?",
        options: ["A split in the nail", "Extension of pigment from the nail matrix onto the proximal or lateral nail fold", "A fungal infection", "Pitting of the nail"],
        ans: 1,
        exp: "Hutchinson's sign is a major clinical clue for subungual melanoma."
      },
      {
        q: "Subungual melanoma is a variant of which subtype?",
        options: ["Superficial spreading", "Acral lentiginous", "Nodular", "Lentigo maligna"],
        ans: 1,
        exp: "ALM covers both the skin of the palms/soles and the nail apparatus."
      },
      {
        q: "What common benign condition is in the differential diagnosis for a longitudinal dark streak (melanonychia)?",
        options: ["Fungal infection", "Subungual hematoma (blood under the nail)", "Nail pitting", "Clubbing"],
        ans: 1,
        exp: "Trauma/hematoma is very common. If it doesn't 'grow out' with the nail, it needs a biopsy."
      }
    ]
  },
  {
    title: "The Pink Melanoma",
    scenario: "A 35-year-old male presents with a pink, friable nodule on his shoulder. It was diagnosed as a 'pyogenic granuloma' but grew back after being scraped off.\n\nVitals: Normal.\nPhysical Examination: A 5mm symmetric, red-pink glistening papule. No visible pigment.\nLaboratory Results: Biopsy shows a malignant melanocytic proliferation with nearly zero melanin production.",
    disease: "Amelanotic Melanoma",
    questions: [
      {
        q: "Why is Amelanotic Melanoma a 'diagnostic trap'?",
        options: ["It is not dangerous", "It lacks the classic 'C' (Color) of the ABCDEs, often mimicking benign lesions like pyogenic granuloma, hemangioma, or a dermal nevus", "It only affects animals", "It is always flat"],
        ans: 1,
        exp: "Without pigment, it doesn't look like a typical melanoma, leading to dangerous delays."
      },
      {
        q: "How can a pathologist confirm the diagnosis if no pigment is seen?",
        options: ["Looking for hair", "Immunohistochemistry for markers like S100, SOX10, or Melan-A", "By its color", "By its smell"],
        ans: 1,
        exp: "Melanocytic markers confirm the cell lineage even if the cells have lost the ability to make melanin."
      },
      {
        q: "What is the prognosis of amelanotic melanoma?",
        options: ["Better than pigmented", "Similar to pigmented melanoma of the same Breslow depth, but often found later", "Always stage IV", "Benign"],
        ans: 1,
        exp: "Biological behavior is stage-for-stage identical to pigmented melanoma."
      }
    ]
  },
  {
    title: "The Prognostic Ruler",
    scenario: "A pathology report for a melanoma excision returns. The clinician is looking for the most important number to determine the patient's next steps.\n\nVitals: Normal.\nPhysical Examination: Post-op scar.\nLaboratory Results: 'Melanoma, superficial spreading type. Breslow depth 1.2 mm. Ulceration absent. Mitoses 2/mm2.'",
    disease: "Breslow Depth and Staging",
    questions: [
      {
        q: "What is Breslow depth?",
        options: ["The width of the tumor", "The vertical measurement of the tumor from the granular layer of the epidermis to the deepest malignant cell in the dermis (in millimeters)", "The anatomic layer reached", "The number of lymph nodes"],
        ans: 1,
        exp: "Breslow depth is the single most important prognostic factor in primary cutaneous melanoma."
      },
      {
        q: "What is Clark's Level?",
        options: ["The measurement in mm", "An older staging system based on the anatomic layer of skin involved (e.g., Level IV involves the reticular dermis)", "The patient's name", "The color of the tumor"],
        ans: 1,
        exp: "Clark's level is less reproducible and has been largely replaced by Breslow depth in current AJCC staging."
      },
      {
        q: "At what Breslow depth threshold is a Sentinel Lymph Node Biopsy (SLNB) typically considered?",
        options: ["0.1 mm", ">0.8 mm (or <0.8 mm with ulceration/high mitosis)", "5.0 mm", "Only if nodes are felt"],
        ans: 1,
        exp: "SLNB is used to stage the regional lymph nodes in intermediate-depth melanomas."
      }
    ]
  },
  {
    title: "Targeted Therapy in Melanoma",
    scenario: "A 45-year-old patient with metastatic melanoma is tested for genetic mutations to guide therapy.\n\nVitals: Normal.\nPhysical Examination: Multiple subcutaneous nodules.\nLaboratory Results: Molecular testing shows a V600E mutation.",
    disease: "BRAF Mutations and Targeted Therapy",
    questions: [
      {
        q: "What percentage of cutaneous melanomas harbor a BRAF mutation?",
        options: ["5%", "Approximately 40-50%", "90%", "0%"],
        ans: 1,
        exp: "BRAF mutations are common, particularly in tumors on non-chronically sun-damaged skin."
      },
      {
        q: "Which medication combination is used for BRAF V600E positive metastatic melanoma?",
        options: ["Penicillin + Aspirin", "A BRAF inhibitor (e.g., Vemurafenib) and a MEK inhibitor (e.g., Cobimetinib)", "Insulin + Metformin", "Isotretinoin"],
        ans: 1,
        exp: "Combined BRAF/MEK inhibition has better response rates and fewer side effects than BRAF inhibition alone."
      },
      {
        q: "What is a unique cutaneous side effect of BRAF inhibitor monotherapy?",
        options: ["Hives", "Development of Squamous Cell Carcinomas and Keratoacanthomas", "Acne", "Hair loss"],
        ans: 1,
        exp: "Paradoxical activation of the MAP kinase pathway in cells without the BRAF mutation can lead to SCCs."
      }
    ]
  },
  {
    title: "Immunotherapy Breakthrough",
    scenario: "A patient with stage IV melanoma is started on Nivolumab.\n\nVitals: Normal.\nPhysical Examination: Metastatic disease.\nLaboratory Results: High tumor mutational burden.",
    disease: "Checkpoint Inhibitors (Immunotherapy)",
    questions: [
      {
        q: "What is the mechanism of action of Nivolumab and Pembrolizumab?",
        options: ["Directly killing tumor cells", "Blocking the PD-1 (Programmed Death-1) receptor on T-cells, 'releasing the brakes' on the immune system to attack cancer", "Inhibiting BRAF", "Antibiotics"],
        ans: 1,
        exp: "These are 'checkpoint inhibitors' that reactivate the patient's own immune response."
      },
      {
        q: "Ipilimumab targets which checkpoint molecule?",
        options: ["PD-L1", "CTLA-4", "VEGF", "BRAF"],
        ans: 1,
        exp: "Ipilimumab was the first checkpoint inhibitor, targeting CTLA-4."
      },
      {
        q: "What is a major category of side effects for these drugs?",
        options: ["Infections", "Immune-related Adverse Events (irAEs) like colitis, hepatitis, and thyroiditis", "Cardiac arrest", "Hair loss"],
        ans: 1,
        exp: "Because you are over-activating the immune system, the body can attack its own healthy tissues."
      }
    ]
  },
  {
    title: "The Dysplastic Nevus Syndrome",
    scenario: "A 25-year-old male presents with over 100 moles. He has a strong family history of melanoma in his father and grandfather.\n\nVitals: Normal.\nPhysical Examination: Countless clinically atypical nevi (large, irregular borders, multiple colors). Several 'ugly duckling' lesions.\nLaboratory Results: Genetic testing reveals a CDKN2A mutation.",
    disease: "FAMMM Syndrome",
    questions: [
      {
        q: "What does FAMMM stand for?",
        options: ["Family Always Makes Me Mad", "Familial Atypical Multiple Mole-Melanoma syndrome", "Fast Acting Malignant Melanoma", "Focal Atypical Melanocytic Marker"],
        ans: 1,
        exp: "FAMMM is a hereditary syndrome with a very high lifetime risk of melanoma."
      },
      {
        q: "Which gene is most commonly mutated in FAMMM?",
        options: ["CDKN2A (encoding p16)", "PTEN", "BRCA1", "TP53"],
        ans: 0,
        exp: "p16 is a tumor suppressor gene that regulates the cell cycle."
      },
      {
        q: "What other internal malignancy are FAMMM patients at increased risk for?",
        options: ["Colon cancer", "Pancreatic cancer", "Leukemia", "Brain tumors"],
        ans: 1,
        exp: "There is a strong association between CDKN2A mutations and pancreatic adenocarcinoma."
      }
    ]
  },
  {
    title: "The Receding Color",
    scenario: "A 50-year-old patient has a melanoma on his back. Parts of the lesion appear to be turning white or even disappearing.\n\nVitals: Normal.\nPhysical Examination: A variegated plaque with an area of gray-white scarring and loss of pigment in the center.\nLaboratory Results: Biopsy shows a brisk lymphocytic infiltrate and fibrosis where tumor cells have been destroyed.",
    disease: "Melanoma Regression",
    questions: [
      {
        q: "What is regression in melanoma?",
        options: ["The tumor is getting worse", "The body's immune system (T-cells) attacking and destroying part of the tumor, leaving behind a scarred or depigmented area", "The tumor is changing color to black", "The tumor is spreading"],
        ans: 1,
        exp: "Regression is a sign of an active host immune response."
      },
      {
        q: "Why is extensive regression (>75%) potentially problematic for the pathologist?",
        options: ["It looks ugly", "It can make the true maximum Breslow depth difficult to determine, as the deepest part may have been destroyed", "It means the tumor is gone", "It is infectious"],
        ans: 1,
        exp: "If the thickest part regressed, the Breslow depth may be 'under-measured'."
      },
      {
        q: "What is the clinical term for a mole that develops a white ring of depigmentation around it?",
        options: ["Vitiligo", "Halo Nevus", "Blue Nevus", "Spitz Nevus"],
        ans: 1,
        exp: "Halo nevi represent immune-mediated regression of a benign nevus, common in adolescents."
      }
    ]
  },
  {
    title: "The Purple Lump in HIV",
    scenario: "A 30-year-old HIV-positive male with a low CD4 count presents with multiple purple macules and nodules on his legs and trunk.\n\nVitals: Normal.\nPhysical Examination: Multiple violaceous, non-blanching papules and plaques. One lesion is on the hard palate.\nLaboratory Results: Biopsy shows a proliferation of spindle cells forming slit-like spaces containing red blood cells.",
    disease: "Kaposi Sarcoma (KS)",
    questions: [
      {
        q: "What is the causative agent of Kaposi Sarcoma?",
        options: ["HIV itself", "Human Herpesvirus 8 (HHV-8) / KSHV", "HPV 16", "EBV"],
        ans: 1,
        exp: "HHV-8 is the necessary viral driver for all forms of KS."
      },
      {
        q: "What is the cell of origin in KS?",
        options: ["Melanocytes", "Vascular or lymphatic endothelial cells", "Keratinocytes", "Fibroblasts"],
        ans: 1,
        exp: "KS is a low-grade vascular tumor."
      },
      {
        q: "What is the first-line management for AIDS-related KS?",
        options: ["Surgical excision of all spots", "Highly Active Antiretroviral Therapy (HAART) to restore immune function", "Systemic chemotherapy", "Radiation"],
        ans: 1,
        exp: "Restoring the CD4 count with HAART often leads to regression of the KS lesions."
      }
    ]
  },
  {
    title: "The Aggressive Pink Nodule",
    scenario: "An 80-year-old male presents with a rapidly growing, painless, firm, red nodule on his sun-damaged forehead. It appeared only 3 weeks ago.\n\nVitals: Normal.\nPhysical Examination: A 1.5 cm glistening, reddish-purple, dome-shaped nodule. No ulceration.\nLaboratory Results: Biopsy shows a 'small blue cell tumor' in the dermis. Immunohistochemistry is positive for CK20 in a 'perinuclear dot' pattern.",
    disease: "Merkel Cell Carcinoma",
    questions: [
      {
        q: "What is the typical clinical behavior of Merkel Cell Carcinoma?",
        options: ["Indolent", "Extremely aggressive with high rates of local recurrence and early lymph node metastasis", "Benign", "Only locally invasive"],
        ans: 1,
        exp: "Merkel cell is much more lethal than melanoma on a stage-for-stage basis."
      },
      {
        q: "What virus is associated with the majority (approx 80%) of Merkel Cell Carcinomas?",
        options: ["HPV", "Merkel Cell Polyomavirus (MCPyV)", "HHV-8", "HSV-2"],
        ans: 1,
        exp: "MCPyV integration into the host genome drives the malignancy."
      },
      {
        q: "The 'perinuclear dot' pattern of CK20 is characteristic of which tumor?",
        options: ["Small cell lung cancer", "Merkel Cell Carcinoma", "Basal Cell Carcinoma", "Lymphoma"],
        ans: 1,
        exp: "CK20 is a sensitive and specific marker for Merkel cell when seen in this specific pattern."
      }
    ]
  }
];

// Helper to write file
const generateSQL = () => {
  let sql = `-- US MD/MBBS (4th Year) Clinical Case Blocks
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

`;

  cases.forEach((c, idx) => {
    const title = c.title.replace(/'/g, "''");
    const scenario = c.scenario.replace(/'/g, "''");
    
    sql += `    -- Case ${idx + 1}: ${title}\n`;
    sql += `    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = '${title}' LIMIT 1;\n`;
    sql += `    IF v_case_id IS NULL THEN\n`;
    sql += `        INSERT INTO case_studies (topic_id, title, scenario, "order")\n`;
    sql += `        VALUES (v_topic_id, '${title}', '${scenario}', ${idx + 1}) RETURNING id INTO v_case_id;\n`;
    sql += `    ELSE\n`;
    sql += `        UPDATE case_studies SET scenario = '${scenario}', "order" = ${idx + 1} WHERE id = v_case_id;\n`;
    sql += `    END IF;\n\n`;

    sql += `    DELETE FROM case_questions WHERE case_id = v_case_id;\n`;
    sql += `    INSERT INTO case_questions (case_id, question, options, correct_index, explanation)\n`;
    sql += `    VALUES\n`;

    c.questions.forEach((q, qIdx) => {
      const question = q.q.replace(/'/g, "''");
      const options = JSON.stringify(q.options).replace(/'/g, "''");
      const explanation = q.exp.replace(/'/g, "''");
      sql += `        (v_case_id, '${question}', '${options}', ${q.ans}, '${explanation}')${qIdx === c.questions.length - 1 ? ';' : ','}\n`;
    });
    sql += `\n`;
  });

  sql += `END $$;
COMMIT;`;

  return sql;
};

// We need 50 cases total. I'll export the cases and write a part 2 file.
module.exports = cases;
