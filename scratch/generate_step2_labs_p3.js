module.exports = [
  {
    title: "The 'Flame' Figure",
    scenario: "A pathology report for an itchy, blistering rash describes 'dermal edema and flame figures (major basic protein surrounding collagen bundles)'.\n\nVitals: Normal.\nPhysical Examination: Erythematous plaques with peripheral 'pseudopodia'.\nLaboratory Results: Peripheral eosinophilia is noted in the CBC.",
    disease: "Wells Syndrome (Histology)",
    questions: [
      {
        q: "What is a 'Flame Figure' characteristic of?",
        options: ["Infection", "Eosinophilic Dermatitis (e.g., Wells Syndrome)", "Psoriasis", "None"],
        ans: 1,
        exp: "Flame figures are formed by degranulated eosinophils."
      },
      {
        q: "Which other common condition can occasionally show flame figures?",
        options: ["Acne", "Arthropod (insect) bites", "Warts", "None"],
        ans: 1,
        exp: "Any process with intense eosinophilic infiltrate can produce them."
      },
      {
        q: "What is the primary treatment for Wells Syndrome?",
        options: ["Antibiotics", "Systemic corticosteroids", "Antifungals", "None"],
        ans: 1,
        exp: "It is an inflammatory, non-infectious condition."
      }
    ]
  },
  {
    title: "The 'Caterpillar' Body",
    scenario: "A pathology report for a subepidermal blister on the hand mentions 'festooning of the dermal papillae' and 'caterpillar bodies'.\n\nVitals: Normal.\nPhysical Examination: Fragile skin and blisters on sun-exposed hands.\nLaboratory Results: Biopsy results received.",
    disease: "Porphyria Cutanea Tarda (Histology)",
    questions: [
      {
        q: "What are 'Caterpillar Bodies'?",
        options: ["Small worms", "Linear basement membrane and collagen fragments within the epidermis of a PCT blister", "A sign of infection", "None"],
        ans: 1,
        exp: "They are a classic histologic finding in PCT."
      },
      {
        q: "What does 'Festooning' describe in a subepidermal blister?",
        options: ["It looks like a party", "The preservation of the dermal papillae architecture at the base of the blister", "Skin thinning", "None"],
        ans: 1,
        exp: "In PCT, the dermal papillae protrude upward into the blister cavity like 'festoons'."
      },
      {
        q: "Why are there no 'neutrophils' in a PCT blister?",
        options: ["They are shy", "PCT is a metabolic/phototoxic process, not primarily an inflammatory one", "Fungus kills them", "None"],
        ans: 1,
        exp: "The 'cell-poor' nature of the blister helps distinguish it from Bullous Pemphigoid."
      }
    ]
  },
  {
    title: "The 'Target' and the 'ENA' Panel",
    scenario: "A 30-year-old woman with a malar rash and joint pain has a positive ANA (1:1280, speckled). An 'ENA' (Extractable Nuclear Antigen) panel is ordered.\n\nVitals: Normal.\nPhysical Examination: Butterfly rash.\nLaboratory Results: ENA is positive for 'Anti-dsDNA' and 'Anti-Smith'.",
    disease: "Systemic Lupus Erythematosus (Serology)",
    questions: [
      {
        q: "Which of these antibodies is 'Most Specific' for the diagnosis of SLE?",
        options: ["Anti-Ro", "Anti-Smith and Anti-dsDNA", "Anti-La", "None"],
        ans: 1,
        exp: "While ANA is sensitive, Anti-Smith and Anti-dsDNA are highly specific."
      },
      {
        q: "Which antibody correlates with the presence of 'Lupus Nephritis' and disease activity?",
        options: ["Anti-Smith", "Anti-dsDNA", "Anti-Ro", "None"],
        ans: 1,
        exp: "Anti-dsDNA levels often rise during a lupus flare involving the kidneys."
      },
      {
        q: "Anti-Ro (SS-A) and Anti-La (SS-B) are most strongly associated with which other condition?",
        options: ["Gout", "Sjögren Syndrome", "Acne", "None"],
        ans: 1,
        exp: "These are classic markers for Sjögren's."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Jo-1'",
    scenario: "A patient with a purple rash on the eyelids (heliotrope rash) and 'mechanic''s hands' (rough, cracked skin on the fingers) has a blood test.\n\nVitals: Normal.\nPhysical Examination: Gottron papules on the knuckles.\nLaboratory Results: Elevated Creatine Kinase (CK) and positive 'Anti-Jo-1' antibody.",
    disease: "Dermatomyositis (Serology)",
    questions: [
      {
        q: "The Anti-Jo-1 antibody is associated with which systemic complication in dermatomyositis?",
        options: ["Liver failure", "Interstitial Lung Disease (Antisynthetase Syndrome)", "Brain tumor", "None"],
        ans: 1,
        exp: "Anti-Jo-1 is a marker for lung involvement and a more severe course."
      },
      {
        q: "Which other antibody is highly specific for Dermatomyositis specifically (as opposed to polymyositis)?",
        options: ["Anti-dsDNA", "Anti-Mi-2", "Anti-Smith", "None"],
        ans: 1,
        exp: "Anti-Mi-2 is strongly associated with the classic skin findings of DM."
      },
      {
        q: "What is the 'Screening' priority in a newly diagnosed adult with dermatomyositis?",
        options: ["Eye exam", "Age-appropriate malignancy screening (due to high paraneoplastic risk)", "Bone density", "None"],
        ans: 1,
        exp: "Adult-onset DM is frequently associated with an internal malignancy."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Centromere'",
    scenario: "A 50-year-old woman with Raynaud phenomenon and tight skin on her fingers has a blood test.\n\nVitals: Normal.\nPhysical Examination: Telangiectasias on the face and Sclerodactyly.\nLaboratory Results: Positive 'Anti-Centromere' antibody.",
    disease: "CREST Syndrome (Serology)",
    questions: [
      {
        q: "Anti-Centromere antibody is the hallmark of which variant of Systemic Sclerosis?",
        options: ["Diffuse Scleroderma", "Limited Scleroderma (CREST Syndrome)", "Lupus", "None"],
        ans: 1,
        exp: "CREST stands for Calcinosis, Raynaud, Esophageal dysmotility, Sclerodactyly, and Telangiectasias."
      },
      {
        q: "Which antibody is characteristic of 'Diffuse' Systemic Sclerosis?",
        options: ["Anti-Centromere", "Anti-Scl-70 (Anti-topoisomerase I)", "Anti-Jo-1", "None"],
        ans: 1,
        exp: "Anti-Scl-70 is associated with the more aggressive, diffuse form of the disease."
      },
      {
        q: "What is the major 'Renal' complication of Scleroderma?",
        options: ["Kidney stones", "Scleroderma Renal Crisis (abrupt onset of malignant hypertension and renal failure)", "Glomerulonephritis", "None"],
        ans: 1,
        exp: "This is a life-threatening emergency treated with ACE inhibitors."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Histone'",
    scenario: "A patient on Hydralazine for high blood pressure develops a malar rash and joint pain. A blood test is performed.\n\nVitals: Normal.\nPhysical Examination: Rash.\nLaboratory Results: Positive ANA and positive 'Anti-Histone' antibody. Negative anti-dsDNA.",
    disease: "Drug-induced Lupus (Serology)",
    questions: [
      {
        q: "The presence of Anti-Histone antibodies (in the absence of Anti-dsDNA) is highly suggestive of:",
        options: ["Systemic Lupus (SLE)", "Drug-induced Lupus Erythematosus (DILE)", "Scleroderma", "None"],
        ans: 1,
        exp: "This is the classic board differentiator for drug-induced lupus."
      },
      {
        q: "Which of the following drugs is NOT a classic cause of DILE?",
        options: ["Hydralazine", "Procainamide", "Isoniazid", "Penicillin"],
        ans: 3,
        exp: "Penicillin is not a recognized cause; Minocycline and Anti-TNF agents are newer causes."
      },
      {
        q: "What is the best treatment for DILE?",
        options: ["More Hydralazine", "Discontinue the offending drug", "Lifelong steroids", "None"],
        ans: 1,
        exp: "Symptoms and lab abnormalities usually resolve after the drug is stopped."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Cryptococcus'",
    scenario: "An HIV patient with a low CD4 count presents with 'umbilicated' papules on his face that look like Molluscum, but he is also febrile and confused.\n\nVitals: T 38.8 C.\nPhysical Examination: Widespread pearly, umbilicated papules.\nLaboratory Results: A skin biopsy is performed and stained with 'India Ink' and 'Mucicarmine'.",
    disease: "Cryptococcosis (Stains)",
    questions: [
      {
        q: "What does the 'Mucicarmine' stain highlight in Cryptococcus?",
        options: ["DNA", "The thick polysaccharide capsule (turns it red/pink)", "The nucleus", "None"],
        ans: 1,
        exp: "The capsule is the hallmark of Cryptococcus neoformans."
      },
      {
        q: "The 'India Ink' preparation of CSF (or tissue) highlights what?",
        options: ["The organism itself", "The 'halo' created by the thick capsule that excludes the ink particles", "Nothing", "None"],
        ans: 1,
        exp: "The clear halo is diagnostic."
      },
      {
        q: "In an immunosuppressed patient, umbilicated facial papules should ALWAYS prompt an evaluation for what?",
        options: ["Acne", "Disseminated deep fungal infection (e.g., Cryptococcosis, Histoplasmosis)", "Normal Molluscum", "None"],
        ans: 1,
        exp: "Molluscum-like lesions can be a 'skin sign' of a life-threatening systemic infection."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Prion'",
    scenario: "This is a theoretical question on high-yield infection control.\n\nVitals: Normal.\nPhysical Examination: None.\nLaboratory Results: None.",
    disease: "Creutzfeldt-Jakob Disease (Sterilization)",
    questions: [
      {
        q: "Which 'Surgical' decontamination method is REQUIRED for instruments used on a patient with suspected Prion disease (e.g., CJD)?",
        options: ["Standard autoclaving", "Extended autoclaving and/or concentrated Sodium Hydroxide (Bleach) exposure", "Hand washing", "None"],
        ans: 1,
        exp: "Prions are highly resistant to standard sterilization methods."
      },
      {
        q: "Is the skin considered a 'high-risk' tissue for prion transmission?",
        options: ["Yes", "No, CNS and lymphoid tissues are high-risk; skin is considered low-risk, but precautions are still taken during biopsies", "Only in the elderly", "None"],
        ans: 1,
        exp: "The brain and spinal cord are the most infectious tissues."
      },
      {
        q: "What is the pathognomonic feature of Prion disease in a brain biopsy?",
        options: ["Inflammation", "Spongiform change (vacuolation of the neuropil)", "Bacteria", "None"],
        ans: 1,
        exp: "This 'sponge-like' appearance is diagnostic."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Grenz' Zone",
    scenario: "A pathology report mentions a 'Grenz zone' in a biopsy of a reddish-brown plaque on the nose.\n\nVitals: Normal.\nPhysical Examination: Firm, red plaque on the nasal bridge (Granuloma Faciale).\nLaboratory Results: Biopsy shows a dense dermal infiltrate.",
    disease: "Grenz Zone (Histology)",
    questions: [
      {
        q: "What is a 'Grenz Zone'?",
        options: ["A type of cancer", "A narrow band of UNINVOLVED (normal) dermis separating the epidermis from an underlying dermal infiltrate", "A scar", "None"],
        ans: 1,
        exp: "The 'clear' space is characteristic of conditions like Granuloma Faciale or Leprosy."
      },
      {
        q: "Besides Granuloma Faciale, which classic 'Step' infection shows a prominent Grenz zone?",
        options: ["Staphylococcal infection", "Lepromatous Leprosy", "Acne", "None"],
        ans: 1,
        exp: "In lepromatous leprosy, the Grenz zone separates the 'foamy' macrophage infiltrate from the epidermis."
      },
      {
        q: "Granuloma Faciale is primarily composed of which cell type?",
        options: ["Lymphocytes only", "A 'mixed' infiltrate including many eosinophils and neutrophils", "Fungus", "None"],
        ans: 1,
        exp: "The mixed nature of the infiltrate is a key histologic clue."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Wood' (Erythrasma Review)",
    scenario: "A quick review of Wood''s lamp basics.\n\nVitals: Normal.\nPhysical Examination: None.\nLaboratory Results: None.",
    disease: "Wood''s Lamp Colors (Summary)",
    questions: [
      {
        q: "Which Wood's lamp color matches Pseudomonas infection in a wound?",
        options: ["Coral-red", "Bright green (due to Pyoverdin)", "Yellow", "None"],
        ans: 1,
        exp: "Pseudomonas produces fluorescent pigments."
      },
      {
        q: "Which Wood's lamp color matches Porphyria Cutanea Tarda (Urine)?",
        options: ["Pink/Coral-red", "Green", "Blue", "None"],
        ans: 0,
        exp: "Porphyrins glow red/pink."
      },
      {
        q: "Which Wood's lamp color matches Vitiligo?",
        options: ["Green", "Bright blue-white (enhancement, not true fluorescence)", "Orange", "None"],
        ans: 1,
        exp: "Total loss of melanin allows UV light to penetrate to the collagen."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Biopsy' (Vesicle)",
    scenario: "A patient has a suspected dermatitis herpetiformis (DH).\n\nVitals: Normal.\nPhysical Examination: Small, extremely itchy vesicles on the elbows.\nLaboratory Results: A biopsy is taken for DIF.",
    disease: "Dermatitis Herpetiformis (DIF)",
    questions: [
      {
        q: "What is the characteristic DIF pattern for Dermatitis Herpetiformis?",
        options: ["Linear IgG", "Granular IgA deposits at the tips of the dermal papillae", "Net-like IgG", "None"],
        ans: 1,
        exp: "IgA deposition is the diagnostic gold standard for DH."
      },
      {
        q: "Dermatitis Herpetiformis is the cutaneous manifestation of which systemic disease?",
        options: ["Diabetes", "Celiac Disease (Gluten-sensitive enteropathy)", "Asthma", "None"],
        ans: 1,
        exp: "Almost all DH patients have some degree of gluten sensitivity."
      },
      {
        q: "Where is the 'Best' place to biopsy for DH?",
        options: ["Directly from a vesicle", "Perilesional (normal-appearing) skin", "The center of a scar", "None"],
        ans: 1,
        exp: "Inflammation within the vesicle destroys the IgA; perilesional skin preserves it."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Imaging' (CT in SJS)",
    scenario: "A patient with Stevens-Johnson Syndrome (SJS) is being evaluated in the ER.\n\nVitals: T 39.0 C, BP 100/60.\nPhysical Examination: Skin sloughing and oral erosions.\nLaboratory Results: None.",
    disease: "SJS/TEN (Systemic Evaluation)",
    questions: [
      {
        q: "Why is a Chest X-ray or CT often performed in SJS/TEN patients?",
        options: ["To see the skin", "To screen for 'Inhalation' injury (sloughing of the bronchial epithelium) or pneumonia", "To check for broken bones", "None"],
        ans: 1,
        exp: "The 'skin' sloughing in TEN can involve the entire respiratory tract."
      },
      {
        q: "What is the most common cause of death in SJS/TEN?",
        options: ["Heart attack", "Sepsis (due to loss of the skin barrier)", "The drug reaction itself", "None"],
        ans: 1,
        exp: "Infection is the leading killer."
      },
      {
        q: "Is 'Nikolsky sign' positive in SJS?",
        options: ["No", "Yes, the epidermis is necrolytic and slides easily away from the dermis", "Only in the eyes", "None"],
        ans: 1,
        exp: "Nikolsky is a hallmark of epidermal detachment."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Scabies' (Norwegian)",
    scenario: "An elderly patient with dementia in a nursing home has 'thick, crusty' scale on his hands and feet. He doesn''t itch much.\n\nVitals: Normal.\nPhysical Examination: Massive, gray-yellow hyperkeratotic crusting.\nLaboratory Results: A single skin scraping shows 'hundreds' of mites.",
    disease: "Crusted (Norwegian) Scabies",
    questions: [
      {
        q: "Why does the patient NOT itch much despite the massive mite load?",
        options: ["He is old", "Immunocompromised or debilitated patients may lack the vigorous hypersensitivity response that causes itching", "The mites are dead", "None"],
        ans: 1,
        exp: "The lack of itch is common in crusted scabies."
      },
      {
        q: "How many mites are typically present in a 'normal' case of scabies?",
        options: ["Thousands", "10-15 total", "1 million", "None"],
        ans: 1,
        exp: "Normal scabies has very few mites; crusted scabies has millions."
      },
      {
        q: "What is the management of choice for crusted scabies?",
        options: ["Topical Permethrin only", "Combination of oral Ivermectin AND topical Permethrin/Sulfur", "Antibiotics", "None"],
        ans: 1,
        exp: "Systemic therapy is mandatory for the high burden of mites."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Biopsy' (Depth)",
    scenario: "A patient with a suspected deep fungal infection is having a biopsy.\n\nVitals: Normal.\nPhysical Examination: Nodule on the leg.\nLaboratory Results: None.",
    disease: "Deep Fungal Biopsy (Processing)",
    questions: [
      {
        q: "Which specific histologic 'fixative' is used for standard H&E processing?",
        options: ["Michel's medium", "10% Buffered Formalin", "Water", "None"],
        ans: 1,
        exp: "Formalin preserves architecture but kills organisms/proteins."
      },
      {
        q: "Why is 'splitting' the biopsy into Formalin and Saline essential for a suspected infection?",
        options: ["To be safe", "Formalin allows for architecture and specialized stains (PAS/GMS); Saline allows for live tissue culture", "No reason", "None"],
        ans: 1,
        exp: "This is a key procedural point for medical exams."
      },
      {
        q: "If the PAS/GMS stains are negative, but the culture is positive, which is correct?",
        options: ["Pathology", "Culture (it is more sensitive for low numbers of organisms)", "Both are wrong", "None"],
        ans: 1,
        exp: "Culture can detect a single viable organism; stains require many."
      }
    ]
  },
  {
    title: "The 'Target' and the 'ANA' (Pattern)",
    scenario: "A patient has a positive ANA with a 'Nucleolar' pattern.\n\nVitals: Normal.\nPhysical Examination: Thick skin on the hands.\nLaboratory Results: ANA 1:640, Nucleolar.",
    disease: "Scleroderma (ANA Patterns)",
    questions: [
      {
        q: "The 'Nucleolar' ANA pattern is most characteristic of which disease?",
        options: ["Lupus", "Systemic Sclerosis (Scleroderma)", "RA", "None"],
        ans: 1,
        exp: "Specific patterns (homogeneous, speckled, nucleolar, centromere) point toward specific diseases."
      },
      {
        q: "Which pattern is classic for Drug-induced Lupus?",
        options: ["Nucleolar", "Homogeneous (associated with anti-histone antibodies)", "Centromere", "None"],
        ans: 1,
        exp: "Homogeneous patterns are common in DILE and SLE."
      },
      {
        q: "What does the 'Speckled' pattern indicate?",
        options: ["Lupus", "Non-specific (seen in SLE, Sjögren's, MCTD)", "Normal", "None"],
        ans: 1,
        exp: "Speckled is the most common and least specific pattern."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Porphyrin' (Screen)",
    scenario: "A quick review of Porphyria screening.\n\nVitals: Normal.\nPhysical Examination: None.\nLaboratory Results: None.",
    disease: "Porphyria Screening (Lab Selection)",
    questions: [
      {
        q: "What is the 'Best Initial Test' to screen for Porphyria Cutanea Tarda (PCT)?",
        options: ["Total plasma porphyrins or 24-hour urine porphyrins", "Liver biopsy", "Blood sugar", "None"],
        ans: 0,
        exp: "Plasma/Urine porphyrins will be markedly elevated."
      },
      {
        q: "What is the best initial screening test for 'Acute Intermittent Porphyria' (AIP)?",
        options: ["Skin biopsy", "Urine Porphobilinogen (PBG) during an attack", "Blood pressure", "None"],
        ans: 1,
        exp: "AIP is a neurovisceral porphyria; PBG is the marker."
      },
      {
        q: "Which 'Metal' can worsen porphyria and should be avoided?",
        options: ["Zinc", "Iron (Overload is common in PCT)", "Magnesium", "None"],
        ans: 1,
        exp: "Phlebotomy works by depleting iron stores."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Dermoscopy' (Lice)",
    scenario: "A school nurse uses a dermatoscope to look at a child''s scalp.\n\nVitals: Normal.\nPhysical Examination: Itching scalp.\nLaboratory Results: Dermoscopy shows 'oval structures glued to the hair shaft'.",
    disease: "Pediculosis Capitis (Dermoscopy)",
    questions: [
      {
        q: "What is the best way to distinguish between a 'Nit' and 'Dandruff' under a dermatoscope?",
        options: ["Color", "Nits are firmly attached to the hair shaft; dandruff (scale) is loose and can be easily moved", "Nits are larger", "None"],
        ans: 1,
        exp: "Attachment is the key differentiator."
      },
      {
        q: "What does a 'live' nit look like compared to an empty one?",
        options: ["Live nits are dark and contain a developing nymph; empty ones are white/translucent", "No difference", "Empty ones are bigger", "None"],
        ans: 0,
        exp: "The presence of a nymph indicates an active infection."
      },
      {
        q: "Where should you look for 'Lice' eggs on the head?",
        options: ["On the face", "Close to the scalp (within 1cm), especially behind the ears and at the nape of the neck", "The top of the head", "None"],
        ans: 1,
        exp: "Heat from the scalp is needed for incubation."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Biopsy' (Melanoma Depth)",
    scenario: "A final question on melanoma staging.\n\nVitals: Normal.\nPhysical Examination: None.\nLaboratory Results: None.",
    disease: "Breslow Depth vs. Clark Level",
    questions: [
      {
        q: "Which staging system is currently used to determine T-stage in melanoma?",
        options: ["Clark Level (Anatomical level of invasion)", "Breslow Thickness (Absolute depth in millimeters)", "The mole's weight", "None"],
        ans: 1,
        exp: "Breslow thickness is the standard for the AJCC staging system."
      },
      {
        q: "Breslow thickness is measured from which layer to the deepest tumor cell?",
        options: ["Stratum corneum", "Granular layer (or ulcer base)", "Dermis", "None"],
        ans: 1,
        exp: "The granular layer is the starting point for measurement."
      },
      {
        q: "Is 'Ulceration' considered in the T-staging?",
        options: ["No", "Yes, the presence of ulceration automatically increases the 'b' category (e.g., T1a vs T1b)", "Only in the elderly", "None"],
        ans: 1,
        exp: "Ulceration is an independent high-risk prognostic feature."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Imaging' (Dermal Ultrasound)",
    scenario: "A patient with a suspected BCC is having 'High-frequency Ultrasound' (HFUS) in the clinic.\n\nVitals: Normal.\nPhysical Examination: BCC.\nLaboratory Results: HFUS shows a 'hypoechoic area' with specific dimensions.",
    disease: "High-Frequency Ultrasound (BCC)",
    questions: [
      {
        q: "What is the primary clinical use of HFUS in skin cancer management?",
        options: ["To cure the cancer", "To estimate the 'depth' and 'lateral margins' of the tumor before surgery", "To see the bone", "None"],
        ans: 1,
        exp: "It is a helpful 'pre-surgical' mapping tool."
      },
      {
        q: "Is HFUS a replacement for a biopsy?",
        options: ["Yes", "No, it cannot provide the histologic diagnosis needed for treatment", "Only for children", "None"],
        ans: 1,
        exp: "Pathology remains the only definitive way to diagnose BCC."
      },
      {
        q: "Which specific 'layer' of the skin does HFUS visualize best?",
        options: ["The bone", "The dermis and dermo-epidermal junction", "The brain", "None"],
        ans: 1,
        exp: "High frequency (20-50 MHz) allows for high-resolution imaging of superficial structures."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Scraping' (Final Tips)",
    scenario: "A final review of lab procedures.\n\nVitals: Normal.\nPhysical Examination: Patient is ready.\nLaboratory Results: None.",
    disease: "Diagnostic Procedures (Summary)",
    questions: [
      {
        q: "Which 'Prep' is used to identify the 'Yeast' form of Candida?",
        options: ["Wood's lamp", "KOH prep (showing pseudohyphae and budding yeast)", "Gram stain", "None"],
        ans: 1,
        exp: "KOH is the rapid test for all fungi."
      },
      {
        q: "Which procedure is used to identify the 'Mite' in Scabies?",
        options: ["Wood's lamp", "Skin scraping with mineral oil", "Tzanck smear", "None"],
        ans: 1,
        exp: "Mineral oil prevents the mites from crawling away."
      },
      {
        q: "Which procedure is used to identify the 'Cells' in a suspected bullous disease?",
        options: ["Tzanck smear", "Biopsy for Histology (H&E)", "None", "Both 1 and 2"],
        ans: 3,
        exp: "H&E provides architecture; Tzanck is for rapid bedside cell assessment (especially for virus)."
      }
    ]
  },
  {
    title: "The Tzanck Smear (Pemphigus)",
    scenario: "A Tzanck smear is performed on a patient with flaccid blisters.\n\nVitals: Normal.\nPhysical Examination: Mouth ulcers and skin erosions.\nLaboratory Results: Tzanck smear shows 'acantholytic cells' (rounded keratinocytes with large nuclei) but NO multinucleated giant cells.",
    disease: "Pemphigus Vulgaris (Tzanck)",
    questions: [
      {
        q: "In the context of a flaccid blister, acantholytic cells WITHOUT multinucleated giant cells suggest:",
        options: ["HSV", "Pemphigus Vulgaris", "VZV", "None"],
        ans: 1,
        exp: "Acantholysis is the primary process in Pemphigus; viral infections show both acantholysis AND characteristic multinucleation."
      },
      {
        q: "What is the 'Tzanck cell' specifically?",
        options: ["A white blood cell", "An acantholytic keratinocyte", "A fungal spore", "None"],
        ans: 1,
        exp: "These cells lose their connections and become spherical."
      },
      {
        q: "Is the Tzanck smear sufficient for a definitive diagnosis of Pemphigus?",
        options: ["Yes", "No, DIF and Histology are required for confirmation", "Only in the mouth", "None"],
        ans: 1,
        exp: "It is a rapid bedside screen, not a definitive test."
      }
    ]
  },
  {
    title: "The 'Dark' Lacunae",
    scenario: "A dermoscopic exam of a dark purple, slightly scaly papule on the scrotum.\n\nVitals: Normal.\nPhysical Examination: Multiple 2-4 mm dark purple papules on the scrotum.\nLaboratory Results: Dermoscopy shows 'large, well-demarcated dark red to blue-black lacunae'.",
    disease: "Angiokeratoma (Dermoscopy)",
    questions: [
      {
        q: "The presence of dark lacunae in this location is classic for:",
        options: ["Melanoma", "Angiokeratoma (of Fordyce)", "BCC", "Wart"],
        ans: 1,
        exp: "Angiokeratomas are benign vascular ectasias."
      },
      {
        q: "A large number of angiokeratomas in a young patient should prompt screening for which metabolic disorder?",
        options: ["Diabetes", "Fabry Disease (alpha-galactosidase A deficiency)", "Gout", "None"],
        ans: 1,
        exp: "Angiokeratoma corporis diffusum is a hallmark of Fabry disease."
      },
      {
        q: "How does the 'scale' on an angiokeratoma affect the dermoscopic view?",
        options: ["It makes it clearer", "It can hide the lacunae, requiring the use of ultrasound gel or alcohol to increase transparency", "No effect", "None"],
        ans: 1,
        exp: "Interface fluid improves the dermoscopic visualization of vascular structures."
      }
    ]
  },
  {
    title: "The 'Palisaded' Mucin",
    scenario: "A pathology report for an annular rash describes 'palisaded granulomas surrounding central mucin and degenerated collagen'.\n\nVitals: Normal.\nPhysical Examination: Non-scaly annular plaque on the hand.\nLaboratory Results: Biopsy results received.",
    disease: "Granuloma Annulare (Histology)",
    questions: [
      {
        q: "The presence of 'mucin' in the center of a palisaded granuloma is a key feature of:",
        options: ["Sarcoidosis", "Granuloma Annulare (GA)", "Rheumatoid nodules", "None"],
        ans: 1,
        exp: "GA is characterized by interstitial mucin deposition."
      },
      {
        q: "How do 'Rheumatoid Nodules' differ histologically from GA?",
        options: ["They have no granulomas", "They have a more 'fibrinoid' center and LACK significant mucin", "They are identical", "None"],
        ans: 1,
        exp: "Fibrin vs. Mucin is the classic histologic differentiator."
      },
      {
        q: "What is 'Mucin' on a standard H&E stain?",
        options: ["Bright red", "Stringy, pale blue or grey material between collagen bundles", "Black", "None"],
        ans: 1,
        exp: "Special stains like Alcian Blue can make mucin much easier to see."
      }
    ]
  },
  {
    title: "The 'Tiered' Granuloma",
    scenario: "A pathology report for a yellow shin plaque describes 'tiered, horizontal (sandwich-like) granulomatous inflammation throughout the dermis'.\n\nVitals: Normal.\nPhysical Examination: Yellowish-brown plaque on the shin.\nLaboratory Results: None.",
    disease: "Necrobiosis Lipoidica (Histology)",
    questions: [
      {
        q: "What does 'Tiered' or 'Horizontal' granuloma refer to?",
        options: ["Granulomas in a circle", "Alternating layers of inflammation and degenerated collagen throughout the thickness of the dermis", "A scar", "None"],
        ans: 1,
        exp: "This 'layer-cake' appearance is classic for NL."
      },
      {
        q: "Which specific histologic finding is often seen in the vessels of NL?",
        options: ["Vasculitis", "Granulomatous vasculitis or wall thickening", "Normal vessels", "None"],
        ans: 1,
        exp: "Vascular changes contribute to the tissue degeneration."
      },
      {
        q: "Is there mucin in Necrobiosis Lipoidica?",
        options: ["Yes, lots", "Usually very little or none (unlike GA)", "Only in the center", "None"],
        ans: 1,
        exp: "The lack of mucin helps distinguish NL from GA."
      }
    ]
  },
  {
    title: "The 'Dotted' Vessels",
    scenario: "A dermoscopic exam of a scaly scalp patch.\n\nVitals: Normal.\nPhysical Examination: Red, scaly patch on the scalp.\nLaboratory Results: Dermoscopy shows 'regularly distributed dotted vessels' and 'silver-white scale'.",
    disease: "Psoriasis (Dermoscopy)",
    questions: [
      {
        q: "Regularly distributed 'dotted' vessels are highly characteristic of:",
        options: ["Seborrheic dermatitis", "Psoriasis", "Tinea capitis", "None"],
        ans: 1,
        exp: "The vessels represent the elongated dermal papillae seen in psoriasis."
      },
      {
        q: "How would 'Seborrheic Dermatitis' differ on dermoscopy?",
        options: ["It would be the same", "It shows more 'yellowish' (greasy) scale and less regular, thinner vessels", "It has no vessels", "None"],
        ans: 1,
        exp: "Seb derm has 'greasy' scale; psoriasis has 'micaceous' (silver-white) scale."
      },
      {
        q: "What is the 'Auspitz sign' correlating with these vessels?",
        options: ["A rash", "Pinpoint bleeding after scraping the silver scale, due to the proximity of the dilated vessels to the surface", "A fever", "None"],
        ans: 1,
        exp: "Dermoscopy provides the structural explanation for this clinical sign."
      }
    ]
  },
  {
    title: "The 'Punched-Out' Erosion",
    scenario: "An X-ray of the big toe of a patient with a painful, swollen joint.\n\nVitals: Normal.\nPhysical Examination: Swollen, red first MTP joint (Podagra).\nLaboratory Results: X-ray shows 'punched-out' bone erosions with 'overhanging edges'.",
    disease: "Gout (Imaging)",
    questions: [
      {
        q: "The 'overhanging edge' (Martel's sign) on X-ray is classic for:",
        options: ["Rheumatoid arthritis", "Gout", "Osteoarthritis", "None"],
        ans: 1,
        exp: "This is a late finding in chronic tophaceous gout."
      },
      {
        q: "How do 'Rheumatoid Arthritis' erosions differ?",
        options: ["They are larger", "They are 'marginal' (at the edges of the joint) and associated with periarticular osteopenia", "They don't exist", "None"],
        ans: 1,
        exp: "The location and quality of the bone help distinguish the two."
      },
      {
        q: "What is the 'Gold Standard' for diagnosing an acute gout flare?",
        options: ["X-ray", "Joint aspiration showing negatively birefringent needle-shaped crystals", "Serum uric acid level", "None"],
        ans: 1,
        exp: "Note: Serum uric acid can be NORMAL during an acute flare."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Ovarian' CT",
    scenario: "A 55-year-old woman is diagnosed with Dermatomyositis.\n\nVitals: Normal.\nPhysical Examination: Heliotrope rash and proximal muscle weakness.\nLaboratory Results: CK is 2000. CT of the abdomen/pelvis is ordered.",
    disease: "Dermatomyositis (Paraneoplastic Imaging)",
    questions: [
      {
        q: "In an older woman with Dermatomyositis, which cancer has the strongest association?",
        options: ["Lung", "Ovarian Cancer", "Breast Cancer", "Colon Cancer"],
        ans: 1,
        exp: "Ovarian cancer is highly over-represented in female DM patients."
      },
      {
        q: "Is malignancy screening recommended for 'Juvenile' (childhood) Dermatomyositis?",
        options: ["Yes, same as adults", "No, juvenile DM is generally NOT associated with malignancy", "Only if they have a cough", "None"],
        ans: 1,
        exp: "The paraneoplastic risk is primarily in adults."
      },
      {
        q: "Besides CT, what is a common 'screening' test for ovarian cancer in these patients?",
        options: ["Blood sugar", "Pelvic Ultrasound and CA-125 level", "UA", "None"],
        ans: 1,
        exp: "Multi-modal screening is often used."
      }
    ]
  },
  {
    title: "The 'Target' and the 'ASO' Titer",
    scenario: "An 8-year-old child presents with dozens of small, scaly 'teardrop' spots all over his body, two weeks after a sore throat.\n\nVitals: Normal.\nPhysical Examination: Guttate (teardrop) psoriasis.\nLaboratory Results: An 'ASO' (Antistreptolysin O) titer is elevated.",
    disease: "Guttate Psoriasis (ASO Titer)",
    questions: [
      {
        q: "What does an elevated ASO titer indicate?",
        options: ["Active psoriasis", "A recent Group A Streptococcal infection", "A fungal infection", "None"],
        ans: 1,
        exp: "Guttate psoriasis is frequently triggered by a preceding Strep throat or skin infection."
      },
      {
        q: "What is the most common management for post-streptococcal guttate psoriasis?",
        options: ["Chemotherapy", "Antibiotics (to treat any remaining Strep) and Phototherapy or topical steroids", "Surgery", "None"],
        ans: 1,
        exp: "Clearing the infection often helps the psoriasis resolve."
      },
      {
        q: "Will this patient eventually develop 'Chronic Plaque Psoriasis'?",
        options: ["No, it always resolves", "About 30-40% of guttate cases eventually progress to classic plaque psoriasis", "Yes, 100%", "None"],
        ans: 1,
        exp: "The prognosis is variable."
      }
    ]
  },
  {
    title: "The 'Target' and the 'False' RPR",
    scenario: "A pregnant woman with a history of Lupus has a positive RPR screen for Syphilis. Her confirmatory FTA-ABS is NEGATIVE.\n\nVitals: Normal.\nPhysical Examination: No lesions.\nLaboratory Results: RPR (+), FTA-ABS (-).",
    disease: "False Positive RPR (Reasoning)",
    questions: [
      {
        q: "What is the most likely reason for this patient's positive RPR?",
        options: ["She has syphilis", "A 'Biological False Positive' (BFP) due to her underlying Lupus or Pregnancy", "The lab made a mistake", "None"],
        ans: 1,
        exp: "Non-treponemal tests (RPR/VDRL) are not specific and can be triggered by other conditions."
      },
      {
        q: "Which antibody in Lupus is most commonly associated with a false-positive RPR?",
        options: ["Anti-Smith", "Antiphospholipid antibodies (e.g., Lupus Anticoagulant, Anti-cardiolipin)", "Anti-Ro", "None"],
        ans: 1,
        exp: "The RPR test uses cardiolipin as an antigen."
      },
      {
        q: "Besides Lupus and Pregnancy, what is another common cause of a BFP RPR?",
        options: ["Viral infections (e.g., Mono, HIV, Hepatitis)", "Eating too much meat", "Drinking coffee", "None"],
        ans: 0,
        exp: "Acute viral infections are a frequent cause of transient BFP."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Hives' (Histology)",
    scenario: "A biopsy of a classic 'hive' (urticaria) that has been present for 4 hours.\n\nVitals: Normal.\nPhysical Examination: Transient erythematous wheal.\nLaboratory Results: Histology shows 'mild dermal edema and a sparse perivascular infiltrate of lymphocytes, eosinophils, and neutrophils'.",
    disease: "Urticaria (Histology)",
    questions: [
      {
        q: "Is there any damage to the 'blood vessel wall' in classic urticaria?",
        options: ["Yes, always", "No, the vessels are dilated (edema) but the walls are intact; this distinguishes it from vasculitis", "Only if it is red", "None"],
        ans: 1,
        exp: "Vasculitis (LCV) shows fibrinoid necrosis; urticaria does not."
      },
      {
        q: "If the 'hive' stays in the same spot for > 24 hours, what should you suspect?",
        options: ["Simple urticaria", "Urticarial Vasculitis (which requires a biopsy for confirmation)", "A food allergy", "None"],
        ans: 1,
        exp: "Duration > 24 hours and bruising (purpura) are 'Red Flags' for vasculitis."
      },
      {
        q: "What is 'Angioedema' compared to Urticaria?",
        options: ["A different disease", "The same process but occurring deeper in the dermis and subcutaneous tissue", "Only in the eyes", "None"],
        ans: 1,
        exp: "They often occur together."
      }
    ]
  }
];
