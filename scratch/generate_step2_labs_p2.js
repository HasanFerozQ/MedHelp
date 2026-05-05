module.exports = [
  {
    title: "The 'Starry' Night",
    scenario: "A dermatologist is examining a dark spot on the face of an 80-year-old woman with extensive sun damage. The lesion is flat and has uneven pigment.\n\nVitals: Normal.\nPhysical Examination: 1.5 cm irregular brown macule on the cheek.\nLaboratory Results: Dermoscopy shows 'pseudo-network', 'asymmetric follicular opening pigmentation', and 'rhomboidal structures'.",
    disease: "Lentigo Maligna (Dermoscopy)",
    questions: [
      {
        q: "The dermoscopic features described (pigmentation around follicular openings) are highly suggestive of what melanoma variant?",
        options: ["Nodular melanoma", "Lentigo Maligna (Melanoma in situ on sun-damaged skin)", "Acral lentiginous melanoma", "None"],
        ans: 1,
        exp: "Melanocytes in Lentigo Maligna classically migrate down the hair follicles."
      },
      {
        q: "Why is a 'Punch' biopsy sometimes preferred over a 'Shave' for a large facial lesion like this?",
        options: ["It's faster", "To get a representative sample of the most suspicious area without causing extensive scarring from a large excision", "No reason", "None"],
        ans: 1,
        exp: "While WLE is definitive, a targeted punch helps confirm the diagnosis first in cosmetically sensitive areas."
      },
      {
        q: "What is the 'Rhomboidal structure' in this context?",
        options: ["A square", "Pigment forming diamond-like shapes around hair follicles, a late sign of LM", "A fungus", "None"],
        ans: 1,
        exp: "It is a highly specific dermoscopic indicator for Lentigo Maligna."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Vasculitis'",
    scenario: "A pathology report for a palpable purpura on the legs describes 'leukocytoclastic vasculitis (LCV) with fibrinoid necrosis and RBC extravasation'.\n\nVitals: Normal.\nPhysical Examination: Non-blanching purple spots on the shins.\nLaboratory Results: Biopsy results received.",
    disease: "Leukocytoclastic Vasculitis (Histology)",
    questions: [
      {
        q: "What does 'Leukocytoclasis' refer to histologically?",
        options: ["Bacteria", "Nuclear dust (fragments of neutrophils) in the vessel wall", "Dead skin", "None"],
        ans: 1,
        exp: "LCV is characterized by neutrophil destruction and the resulting 'dust'."
      },
      {
        q: "What is 'Fibrinoid Necrosis'?",
        options: ["A type of scar", "Damage to the blood vessel wall characterized by the deposition of fibrin and protein, making the wall look thick and pink", "A clot", "None"],
        ans: 1,
        exp: "This indicates severe inflammatory damage to the vasculature."
      },
      {
        q: "What is the 'Most Important' next step when LCV is found on skin biopsy?",
        options: ["Start steroids immediately", "Screen for systemic involvement (e.g., UA for hematuria/proteinuria to check for glomerulonephritis)", "Apply ice", "None"],
        ans: 1,
        exp: "Skin-limited vasculitis must be distinguished from systemic vasculitis (e.g., GPA or IgA vasculitis)."
      }
    ]
  },
  {
    title: "The 'Indirect' Evidence",
    scenario: "A patient with suspected Pemphigus Vulgaris has blood drawn for 'Indirect Immunofluorescence (IIF)'.\n\nVitals: Normal.\nPhysical Examination: Blisters.\nLaboratory Results: IIF is positive on 'monkey esophagus' substrate.",
    disease: "Indirect Immunofluorescence (IIF)",
    questions: [
      {
        q: "How does 'Indirect' Immunofluorescence differ from 'Direct' (DIF)?",
        options: ["IIF is on the skin", "IIF is a blood test (serum) used to detect circulating autoantibodies; DIF is on the patient's actual skin tissue", "There is no difference", "None"],
        ans: 1,
        exp: "IIF measures the systemic burden of the disease."
      },
      {
        q: "What is the 'Substrate' in IIF?",
        options: ["The patient's skin", "Laboratory tissue (e.g., monkey esophagus or human salt-split skin) used as a 'target' for the patient's serum antibodies", "The microscope", "None"],
        ans: 1,
        exp: "Serum antibodies bind to the substrate and are then visualized."
      },
      {
        q: "Which IIF 'Titer' would correlate with disease activity in Pemphigus?",
        options: ["The higher the titer (e.g., 1:160), the more active the disease", "Titer doesn't matter", "Lower titers are worse", "None"],
        ans: 0,
        exp: "IIF titers often mirror the clinical severity and treatment response in Pemphigus."
      }
    ]
  },
  {
    title: "The 'Target' and the 'ELISA'",
    scenario: "A patient with suspected Bullous Pemphigoid is tested for anti-BP180 and anti-BP230 antibodies using ELISA.\n\nVitals: Normal.\nPhysical Examination: Tense bullae.\nLaboratory Results: ELISA shows high levels of anti-BP180.",
    disease: "ELISA (Dermatology)",
    questions: [
      {
        q: "What does 'ELISA' stand for?",
        options: ["Every Lung Is So Airy", "Enzyme-Linked Immunosorbent Assay", "Easy Laboratory Internal Safety Audit", "None"],
        ans: 1,
        exp: "It is a highly sensitive and quantitative tool for measuring specific antibodies."
      },
      {
        q: "Anti-BP180 antibodies specifically target which part of the skin?",
        options: ["Desmosomes", "Hemidesmosomes (the transmembrane protein NC16A domain)", "Melanocytes", "None"],
        ans: 1,
        exp: "BP180 (Type XVII Collagen) is the primary target in Bullous Pemphigoid."
      },
      {
        q: "Is ELISA more specific than DIF for diagnosing Bullous Pemphigoid?",
        options: ["No, DIF is the gold standard for the 'pattern', but ELISA confirms the 'specific' antigen target", "Yes, ELISA is the only test needed", "No, ELISA is only for HIV", "None"],
        ans: 0,
        exp: "The tests are complementary; DIF shows where the damage is, ELISA shows what is being attacked."
      }
    ]
  },
  {
    title: "The 'Red' Face and the 'Demodex'",
    scenario: "A 45-year-old with papulopustular rosacea has a 'skin surface biopsy' with cyanoacrylate (Super Glue) to check for mites.\n\nVitals: Normal.\nPhysical Examination: Erythema and papules on the cheeks and nose.\nLaboratory Results: Microscopy shows >5 Demodex mites per square centimeter.",
    disease: "Demodex Mites (Rosacea)",
    questions: [
      {
        q: "Where do Demodex mites normally live in the skin?",
        options: ["Sweat glands", "Pilosebaceous units (hair follicles and oil glands)", "The stratum corneum", "None"],
        ans: 1,
        exp: "They are part of the normal skin flora but are increased in Rosacea."
      },
      {
        q: "Which specific type of Rosacea is most associated with Demodex overgrowth?",
        options: ["Erythematotelangiectatic", "Papulopustular", "Phymatous", "None"],
        ans: 1,
        exp: "Inflammation from the mites (and their bacteria) contributes to the papules and pustules."
      },
      {
        q: "What is a highly effective 'Topical' treatment for Demodex in rosacea?",
        options: ["Steroids", "Ivermectin 1% cream (Soolantra)", "Antifungals", "None"],
        ans: 1,
        exp: "Ivermectin is an anti-parasitic agent that reduces mite counts."
      }
    ]
  },
  {
    title: "The 'Target' and the 'PCR' (Nails)",
    scenario: "A patient with thick, yellow toenails has a piece of nail sent for PCR testing for onychomycosis.\n\nVitals: Normal.\nPhysical Examination: Onycholysis and subungual hyperkeratosis.\nLaboratory Results: PCR is positive for Trichophyton rubrum.",
    disease: "Nail PCR (Onychomycosis)",
    questions: [
      {
        q: "What is the primary advantage of PCR over fungal culture for nails?",
        options: ["It's cheaper", "Much faster (days vs. weeks) and higher sensitivity (detects DNA even if the fungus won't grow)", "It's a Wood's lamp test", "None"],
        ans: 1,
        exp: "Cultures often fail to grow in 30-50% of true nail infections."
      },
      {
        q: "Which fungus is the 'Most Common' cause of toenail onychomycosis worldwide?",
        options: ["Candida", "Trichophyton rubrum", "Aspergillus", "None"],
        ans: 1,
        exp: "T. rubrum is the leading dermatophyte for nail disease."
      },
      {
        q: "Is PCR able to distinguish between 'Live' and 'Dead' fungus?",
        options: ["Yes", "No, it only detects the presence of DNA, which can persist after the fungus is killed", "Only in the sun", "None"],
        ans: 1,
        exp: "This is a limitation of molecular testing compared to culture."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Birefringence'",
    scenario: "A pathology report for a nodule in a surgical scar describes 'foreign body granulomas with refractile material'.\n\nVitals: Normal.\nPhysical Examination: Firm nodule in a 10-year-old scar.\nLaboratory Results: Polarized light microscopy shows 'brightly birefringent' crystals.",
    disease: "Foreign Body Granuloma (Suture/Silica)",
    questions: [
      {
        q: "What does 'Refractile' or 'Birefringent' material usually indicate in a biopsy of a scar?",
        options: ["Cancer", "Foreign material (e.g., suture remnants, silica, talc, or wood) that bends polarized light", "Bacteria", "None"],
        ans: 1,
        exp: "Polarized light is the best way to find 'hidden' foreign bodies in tissue."
      },
      {
        q: "Which specific granulomatous disease is NOT birefringent?",
        options: ["Sarcoidosis", "Suture granuloma", "Silica granuloma", "Talc granuloma"],
        ans: 0,
        exp: "Sarcoid is a 'non-caseating' granuloma of unknown origin, not a reaction to a visible foreign crystal."
      },
      {
        q: "What is the term for the giant cells seen in these reactions?",
        options: ["Munro microabscesses", "Foreign body giant cells (with randomly arranged nuclei)", "Langerhans giant cells (with horseshoe-shaped nuclei)", "None"],
        ans: 1,
        exp: "Nuclear arrangement helps distinguish between foreign body and immune (e.g., TB/Sarcoid) reactions."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Silver' Stain (Treponemes)",
    scenario: "A patient with a 'copper-colored' rash on the palms and soles is being tested for Syphilis.\n\nVitals: Normal.\nPhysical Examination: Widespread maculopapular rash involving the palms.\nLaboratory Results: A biopsy of a papule is stained with 'Warthin-Starry' silver stain.",
    disease: "Secondary Syphilis (Histology)",
    questions: [
      {
        q: "What does the 'Warthin-Starry' or 'Steiner' stain highlight in Syphilis?",
        options: ["Bacteria", "Spirochetes (Treponema pallidum), which look like 'corkscrews'", "Fungus", "None"],
        ans: 1,
        exp: "Silver stains are the traditional way to visualize spirochetes in tissue."
      },
      {
        q: "What is the more modern and 'Specific' immunohistochemical (IHC) stain used for Syphilis?",
        options: ["PAS", "Anti-Treponema pallidum IHC", "Gram stain", "None"],
        ans: 1,
        exp: "IHC is much easier to read and has fewer 'false-positive' silver deposits."
      },
      {
        q: "Which non-treponemal blood test is used for initial 'screening' of syphilis?",
        options: ["FTA-ABS", "RPR or VDRL", "PCR", "None"],
        ans: 1,
        exp: "RPR/VDRL are cheap and sensitive for screening."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Immunohistochemistry' (Melanoma)",
    scenario: "A pathology report for a suspicious lesion on the back mentions 'Positive staining for S100, HMB-45, and Melan-A'.\n\nVitals: Normal.\nPhysical Examination: Atypical mole.\nLaboratory Results: IHC results received.",
    disease: "Melanoma (IHC Markers)",
    questions: [
      {
        q: "Which of these markers is the 'Most Sensitive' for melanocytic lesions (but less specific)?",
        options: ["HMB-45", "S100", "Melan-A", "None"],
        ans: 1,
        exp: "S100 is almost always positive in melanoma but can also be positive in nerve and fat cells."
      },
      {
        q: "Which marker is the 'Most Specific' for melanocytic differentiation?",
        options: ["S100", "Melan-A (MART-1) or HMB-45", "PAS", "None"],
        ans: 1,
        exp: "These markers are much more selective for melanin-producing cells."
      },
      {
        q: "What is 'SOX10'?",
        options: ["A shoe brand", "A highly sensitive and specific nuclear marker for melanocytes and nerve sheath tumors", "A type of UV light", "None"],
        ans: 1,
        exp: "SOX10 is a modern, 'clean' marker often used to identify melanoma."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Cytology' (BCC)",
    scenario: "A physician performs a 'fine-needle aspiration' or 'touch prep' of a pearly nodule.\n\nVitals: Normal.\nPhysical Examination: BCC suspected.\nLaboratory Results: Cytology shows 'clusters of basaloid cells with little cytoplasm'.",
    disease: "BCC (Cytology)",
    questions: [
      {
        q: "Is cytology (needle aspiration) the 'Standard' way to diagnose BCC?",
        options: ["Yes", "No, a punch or shave biopsy (histology) is the standard, but cytology can be used in specialized settings", "Only in the elderly", "None"],
        ans: 1,
        exp: "Histology provides architectural context (palisading, clefting) that cytology lacks."
      },
      {
        q: "What is 'Touch Imprint' cytology?",
        options: ["Pressing a slide against a freshly cut biopsy", "A type of massage", "A blood test", "None"],
        ans: 0,
        exp: "It allows for rapid assessment of cells, sometimes used during Mohs surgery."
      },
      {
        q: "Can cytology distinguish between the 'Subtypes' of BCC (e.g., nodular vs. morpheaform)?",
        options: ["Yes", "No, architecture is needed for subtyping", "Only with special stains", "None"],
        ans: 1,
        exp: "The 'growth pattern' is a histologic feature."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Cultures' (Mycobacteria)",
    scenario: "A patient with a non-healing nodule on his hand after cleaning a fish tank.\n\nVitals: Normal.\nPhysical Examination: Linear nodules (sporotrichoid spread) on the arm.\nLaboratory Results: A tissue culture is requested at '30 degrees Celsius'.",
    disease: "Mycobacterium marinum (Culture)",
    questions: [
      {
        q: "Why is the culture temperature (30 C) important for M. marinum?",
        options: ["It's the standard temperature", "M. marinum is a 'cold-loving' organism that grows best in the extremities (lower than body temp)", "It grows faster at 30 C", "None"],
        ans: 1,
        exp: "Standard 37 C (body temp) cultures may be negative for this organism."
      },
      {
        q: "What is the common name for this infection?",
        options: ["Fish tank granuloma", "Cat scratch disease", "Shingles", "None"],
        ans: 0,
        exp: "Exposure to non-chlorinated water (tanks, pools) is a key history point."
      },
      {
        q: "Which specific stain is used to find Mycobacteria in tissue?",
        options: ["Gram stain", "Acid-Fast Bacillus (AFB) stain, such as Ziehl-Neelsen or Fite", "PAS", "None"],
        ans: 1,
        exp: "AFB stains highlight the waxy cell walls of mycobacteria."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Dermoscopy' (Vascular)",
    scenario: "A physician is looking at a small, bright red papule on a patient''s abdomen.\n\nVitals: Normal.\nPhysical Examination: 2-mm bright red papule.\nLaboratory Results: Dermoscopy shows 'red lacunae' (well-demarcated red lakes).",
    disease: "Cherry Angioma (Dermoscopy)",
    questions: [
      {
        q: "The presence of 'red lacunae' is diagnostic for which benign vascular lesion?",
        options: ["BCC", "Cherry Angioma", "Pyogenic Granuloma", "Melanoma"],
        ans: 1,
        exp: "These lakes represent dilated vascular spaces."
      },
      {
        q: "How does the dermoscopy of a 'Pyogenic Granuloma' differ?",
        options: ["It's the same", "It shows a 'white collarette' and 'reddish-pink homogeneous areas' but lacks the well-defined lacunae of a cherry angioma", "It's blue", "None"],
        ans: 1,
        exp: "The white collarette is a classic clinical and dermoscopic clue for PG."
      },
      {
        q: "Are cherry angiomas dangerous?",
        options: ["Yes", "No, they are benign proliferations of capillaries that increase with age", "Only if they bleed", "None"],
        ans: 1,
        exp: "They are extremely common and require no treatment."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Imaging' (CT Scan)",
    scenario: "A patient with a large, indurated mass on the neck is having a CT scan with contrast.\n\nVitals: Normal.\nPhysical Examination: Fixed, firm 4-cm mass.\nLaboratory Results: None.",
    disease: "Head and Neck Malignancy (CT)",
    questions: [
      {
        q: "What is the primary goal of CT imaging in a suspected head and neck cancer?",
        options: ["To see the skin", "To assess the 'depth' of invasion, involvement of underlying bone/nerves, and to look for lymphadenopathy", "To check the lungs only", "None"],
        ans: 1,
        exp: "Imaging is essential for TNM staging."
      },
      {
        q: "What is 'Contrast' used for in this setting?",
        options: ["To make the patient feel warm", "To highlight vascularity and differentiate between a cystic mass and a solid, necrotic tumor", "To clean the blood", "None"],
        ans: 1,
        exp: "Iodinated contrast improves the visualization of tumor margins."
      },
      {
        q: "Which specific 'lymph node' feature on CT is highly suggestive of malignancy?",
        options: ["Small size", "Central necrosis (a dark hole in the middle of the node)", "Round shape", "None"],
        ans: 1,
        exp: "Necrotic nodes are almost always malignant."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Biopsy' (Scalp)",
    scenario: "A patient with scarring hair loss (alopecia) needs a biopsy.\n\nVitals: Normal.\nPhysical Examination: Areas of the scalp with no hair follicles and smooth, shiny skin.\nLaboratory Results: A '4-mm punch biopsy' is taken.",
    disease: "Scarring Alopecia (Biopsy)",
    questions: [
      {
        q: "What is the 'Best' location to biopsy for scarring alopecia?",
        options: ["The center of the bald patch", "The active, expanding border where hair is still present but looks abnormal", "The back of the neck", "None"],
        ans: 1,
        exp: "The center of a scar is just 'fibrosis' and lacks diagnostic features."
      },
      {
        q: "Which specialized histologic processing is often required for scalp biopsies?",
        options: ["Vertical sectioning only", "Horizontal (transverse) sectioning to allow for the counting of follicles and assessment of hair cycle", "None", "Freezing only"],
        ans: 1,
        exp: "Horizontal sections allow for the best assessment of hair density and anatomy."
      },
      {
        q: "A biopsy showing 'perifollicular fibrosis' and 'loss of sebaceous glands' is characteristic of:",
        options: ["Alopecia Areata", "Scarring (Cicatricial) Alopecia", "Male pattern baldness", "None"],
        ans: 1,
        exp: "Loss of the 'oil gland' is a very early sign of permanent scarring alopecia."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Stain' (Melanin)",
    scenario: "A pathologist is trying to find 'melanin' in a poorly differentiated tumor.\n\nVitals: Normal.\nPhysical Examination: Large black/grey tumor.\nLaboratory Results: A 'Fontana-Masson' stain is performed.",
    disease: "Fontana-Masson Stain",
    questions: [
      {
        q: "What does the Fontana-Masson stain highlight?",
        options: ["Fungus", "Melanin (it turns it black)", "Iron", "Fat"],
        ans: 1,
        exp: "This is a specialized silver stain for melanin."
      },
      {
        q: "How can you distinguish Melanin from 'Iron' (hemosiderin) on histology?",
        options: ["They look the same", "Use a 'Perls Prussian Blue' stain; iron turns blue, while melanin does not", "Melanin is always blue", "None"],
        ans: 1,
        exp: "Iron stains help distinguish bruising/stasis from true pigment."
      },
      {
        q: "What is 'Solar Elastosis'?",
        options: ["A type of cancer", "The accumulation of fragmented, bluish-gray elastic fibers in the dermis due to chronic sun damage", "Skin thinning", "None"],
        ans: 1,
        exp: "This is an ubiquitous finding in biopsies from older, sun-exposed skin."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Molecular' (B-RAF)",
    scenario: "A patient with metastatic melanoma is having his tumor tested for 'B-RAF mutations'.\n\nVitals: Normal.\nPhysical Examination: Multiple cutaneous and visceral metastases.\nLaboratory Results: Tumor is positive for the V600E mutation.",
    disease: "Melanoma (B-RAF Testing)",
    questions: [
      {
        q: "What is the significance of finding a B-RAF V600E mutation?",
        options: ["It's a bad sign only", "It allows for the use of targeted therapy with B-RAF inhibitors (e.g., Vemurafenib) and MEK inhibitors", "It means the patient is cured", "None"],
        ans: 1,
        exp: "Targeted therapy is only effective in patients with the specific mutation."
      },
      {
        q: "What percentage of cutaneous melanomas carry a B-RAF mutation?",
        options: ["1%", "40-50%", "90%", "None"],
        ans: 1,
        exp: "It is a very common driver mutation in melanoma."
      },
      {
        q: "Does finding a B-RAF mutation change the initial 'Surgical' margin for the primary tumor?",
        options: ["Yes", "No, surgical margins are based on Breslow depth and stage, not molecular status", "Only in children", "None"],
        ans: 1,
        exp: "Molecular status guides systemic therapy, not local excision."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Dermoscopy' (Acral)",
    scenario: "A physician is looking at a pigmented spot on a patient''s 'sole' (foot).\n\nVitals: Normal.\nPhysical Examination: 8-mm brown macule on the arch of the foot.\nLaboratory Results: Dermoscopy shows a 'parallel ridge pattern'.",
    disease: "Acral Melanoma (Dermoscopy)",
    questions: [
      {
        q: "The 'Parallel Ridge' pattern (pigment on the ridges of the skin) is highly suggestive of:",
        options: ["Benign acral nevus", "Acral Lentiginous Melanoma", "A wart", "None"],
        ans: 1,
        exp: "Ridges are for 'Bad' (Melanoma); Furrows are for 'Fine' (Benign)."
      },
      {
        q: "What is the 'Parallel Furrow' pattern?",
        options: ["Melanoma", "A common benign pattern in acral nevi (moles) where pigment is concentrated in the grooves of the skin", "A scar", "None"],
        ans: 1,
        exp: "This is a classic 'Step' differentiator for foot lesions."
      },
      {
        q: "Is 'Hutchinson Sign' relevant here?",
        options: ["No", "Yes, pigment on the proximal nail fold is a key clue for subungual melanoma", "Only in the eyes", "None"],
        ans: 1,
        exp: "Nail and acral lesions are often grouped in clinical reasoning."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Stain' (Mast Cells)",
    scenario: "A child with 'Urticaria Pigmentosa' has a biopsy. The doctor rubs the skin before the biopsy (Darier sign) and it hives.\n\nVitals: Normal.\nPhysical Examination: Widespread brown macules.\nLaboratory Results: A 'Tryptase' stain or 'Leder' stain is performed.",
    disease: "Mastocytosis (Histology)",
    questions: [
      {
        q: "Which stain is commonly used to highlight mast cells in tissue?",
        options: ["PAS", "Tryptase, Giemsa, or Toluidine Blue", "Gram stain", "None"],
        ans: 1,
        exp: "Tryptase is a highly specific marker for mast cell granules."
      },
      {
        q: "What is the 'Darier Sign'?",
        options: ["A fever", "Urtication (hiving) and redness after stroking a lesion, due to mast cell degranulation", "Hair loss", "None"],
        ans: 1,
        exp: "This is the classic clinical test for cutaneous mastocytosis."
      },
      {
        q: "What systemic lab test should be ordered if systemic mastocytosis is suspected?",
        options: ["Blood sugar", "Serum Tryptase level", "Potassium", "None"],
        ans: 1,
        exp: "Elevated baseline tryptase (>20 ng/mL) is a diagnostic criterion for systemic disease."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Imaging' (PET Scan)",
    scenario: "A patient with Stage III melanoma is being monitored for recurrence with periodic PET-CT scans.\n\nVitals: Normal.\nPhysical Examination: No clinical recurrence.\nLaboratory Results: Scan shows a 'hypermetabolic node' in the groin.",
    disease: "Melanoma Staging (PET-CT)",
    questions: [
      {
        q: "What does a PET (Positron Emission Tomography) scan detect?",
        options: ["Blood flow", "Increased glucose metabolism (using FDG) in rapidly dividing cells (like cancer)", "Bone density", "None"],
        ans: 1,
        exp: "Cancer cells 'eat' more sugar than normal cells."
      },
      {
        q: "Is PET-CT recommended for the 'Initial Staging' of thin (Stage I) melanomas?",
        options: ["Yes, to be safe", "No, the risk of metastasis is too low and the rate of false positives is too high", "Only in the elderly", "None"],
        ans: 1,
        exp: "Imaging is generally reserved for Stage III and higher."
      },
      {
        q: "What can cause a 'False-Positive' PET scan (besides cancer)?",
        options: ["Drinking too much water", "Inflammation, recent surgery, or infection (which are also metabolically active)", "None", "Being too cold"],
        ans: 1,
        exp: "Clinical correlation is always required with imaging."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Biopsy' (Mouth)",
    scenario: "A patient has a white, lacy patch on his inner cheek (buccal mucosa).\n\nVitals: Normal.\nPhysical Examination: Lacy white lines (Wickham striae) on the mucosa.\nLaboratory Results: A 'punch' biopsy is taken.",
    disease: "Oral Lichen Planus (Biopsy)",
    questions: [
      {
        q: "What is the 'Most Likely' diagnosis for lacy white oral lesions?",
        options: ["Oral thrush", "Oral Lichen Planus", "Leukoplakia", "Cancer"],
        ans: 1,
        exp: "The lacy pattern (Wickham striae) is classic for LP."
      },
      {
        q: "If the patch were 'thick, white, and could NOT be scraped off', what would be the concern?",
        options: ["Thrush", "Leukoplakia (a premalignant lesion requiring biopsy to rule out dysplasia)", "None", "Food residue"],
        ans: 1,
        exp: "Leukoplakia is a clinical term for a white patch that doesn't fit other diagnoses."
      },
      {
        q: "How do you distinguish Oral Thrush from Lichen Planus clinically?",
        options: ["Thrush can be scraped off, leaving a red/bleeding base; LP cannot be scraped off", "LP is redder", "Thrush is on the teeth", "None"],
        ans: 0,
        exp: "The 'scraping' test is a high-yield clinical differentiator."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Stain' (Lipids)",
    scenario: "A pathology report for a yellowish eyelid growth mentions 'Foamy macrophages positive for oil red O stain'.\n\nVitals: Normal.\nPhysical Examination: Yellowish plaques on the eyelids (Xanthelasma).\nLaboratory Results: Biopsy results received.",
    disease: "Xanthoma (Oil Red O)",
    questions: [
      {
        q: "What does the 'Oil Red O' stain highlight?",
        options: ["Bacteria", "Lipids (fats)", "Iron", "Melanin"],
        ans: 1,
        exp: "Xanthomas are composed of lipid-laden macrophages."
      },
      {
        q: "What is the 'Most Important' lab test to order for a patient with xanthelasma?",
        options: ["Blood sugar", "Fast Lipid Panel (to check for dyslipidemia)", "Renal panel", "None"],
        ans: 1,
        exp: "Xanthomas are often external markers of internal lipid disorders."
      },
      {
        q: "What are 'Foamy Macrophages'?",
        options: ["Infected cells", "Cells that have eaten so much lipid that their cytoplasm looks bubbly or 'foamy' on H&E", "Dying cells", "None"],
        ans: 1,
        exp: "This is a classic histologic description."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Culture' (Deep Tissue)",
    scenario: "A patient with a chronic, non-healing ulcer on the foot. The physician takes a 'Deep Tissue Culture'.\n\nVitals: Normal.\nPhysical Examination: Ulcer.\nLaboratory Results: Culture grows 10^5 colony-forming units (CFU) of mixed organisms.",
    disease: "Wound Infection (Quantitative Culture)",
    questions: [
      {
        q: "What is the significance of the '10^5' threshold in wound cultures?",
        options: ["No significance", "It is the standard threshold for 'Infection' (as opposed to colonization) that impairs healing", "It means the patient is healthy", "None"],
        ans: 1,
        exp: "High bacterial loads prevent the wound from moving into the proliferative phase."
      },
      {
        q: "Why is 'Curettage' or 'Biopsy' culture better than a 'Swab'?",
        options: ["It's faster", "It bypasses surface contaminants and finds the organisms actually present in the deep tissue", "It's less painful", "None"],
        ans: 1,
        exp: "Surface swabs are notoriously unreliable for chronic wounds."
      },
      {
        q: "Does every 'Positive' culture require systemic antibiotics?",
        options: ["Yes", "No, if the wound is healing well and there are no clinical signs of infection, it may just be 'colonized'", "Only in the elderly", "None"],
        ans: 1,
        exp: "Treat the patient, not the lab report."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Dermoscopy' (Scabies)",
    scenario: "A dermatologist uses a dermatoscope to look at a burrow on a patient's hand.\n\nVitals: Normal.\nPhysical Examination: Itchy burrows.\nLaboratory Results: Dermoscopy shows a 'Jet with a contrail' or 'Delta-wing' sign.",
    disease: "Scabies (Dermoscopy)",
    questions: [
      {
        q: "What does the 'Delta-wing' or 'Jet' sign represent on dermoscopy?",
        options: ["A piece of lint", "The triangular head and front legs of the scabies mite at the end of a burrow", "A hair", "None"],
        ans: 1,
        exp: "This is a highly specific sign that allows for bedside diagnosis without scraping."
      },
      {
        q: "Is dermoscopy more sensitive than a skin scraping for scabies?",
        options: ["No", "Yes, it allows for the screening of many sites quickly to find the best place to scrape or to make a direct diagnosis", "Only in children", "None"],
        ans: 1,
        exp: "It is a powerful triage tool."
      },
      {
        q: "What is the 'Contrail'?",
        options: ["A cloud", "The burrow itself, filled with eggs and feces (scybala)", "The mite's tail", "None"],
        ans: 1,
        exp: "The burrow follows the mite, much like a jet's trail."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Biopsy' (Nail)",
    scenario: "A surgeon is performing a 'Nail Matrix' biopsy for a dark band.\n\nVitals: Normal.\nPhysical Examination: Longitudinal melanonychia.\nLaboratory Results: A 3-mm punch is taken from the proximal matrix.",
    disease: "Nail Biopsy Technique",
    questions: [
      {
        q: "Where must the biopsy be taken to determine the cause of a longitudinal nail band?",
        options: ["The distal nail tip", "The nail matrix (where the nail plate is produced)", "The skin of the finger", "None"],
        ans: 1,
        exp: "The pigment is produced in the matrix and grows into the plate."
      },
      {
        q: "What is the risk of a matrix biopsy?",
        options: ["Infection only", "Permanent nail dystrophy (scarring or splitting of the nail)", "Loss of the finger", "None"],
        ans: 1,
        exp: "The patient must be counseled about permanent nail changes."
      },
      {
        q: "Which part of the matrix produces the 'top' of the nail plate?",
        options: ["Distal matrix", "Proximal matrix", "Nail bed", "None"],
        ans: 1,
        exp: "Biopsying the proximal matrix is more likely to cause a visible defect."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Imaging' (Chest X-ray)",
    scenario: "A 40-year-old with EN (Erythema Nodosum) is having a Chest X-ray.\n\nVitals: Normal.\nPhysical Examination: Painful red nodules on the shins.\nLaboratory Results: CXR shows 'bilateral hilar lymphadenopathy'.",
    disease: "Erythema Nodosum (Sarcoidosis)",
    questions: [
      {
        q: "Why is a Chest X-ray part of the standard workup for Erythema Nodosum?",
        options: ["To check for heart disease", "To screen for Sarcoidosis (Lofgren syndrome) or Tuberculosis as a cause of the EN", "To see the skin", "None"],
        ans: 1,
        exp: "EN is a reactive process; finding the trigger is the goal."
      },
      {
        q: "What is 'Lofgren Syndrome'?",
        options: ["A type of cancer", "The triad of Erythema Nodosum, Bilateral Hilar Lymphadenopathy, and Migratory Polyarthralgia", "A skin infection", "None"],
        ans: 1,
        exp: "It is a highly specific, acute presentation of sarcoidosis with a good prognosis."
      },
      {
        q: "Does EN itself need a biopsy if it is clinically classic?",
        options: ["Yes, always", "No, it is a clinical diagnosis; the workup should focus on the underlying trigger (CXR, ASO titer, etc.)", "Only in the elderly", "None"],
        ans: 1,
        exp: "The cause is more important than the skin histology in classic EN."
      }
    ]
  }
];
