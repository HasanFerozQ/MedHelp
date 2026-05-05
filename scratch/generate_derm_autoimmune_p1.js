module.exports = [
  {
    title: "The Fragile Mouth",
    scenario: "A 45-year-old male presents with painful mouth sores that make eating difficult. Two weeks later, he develops flaccid blisters on his chest and back that rupture easily, leaving painful erosions.\n\nVitals: Normal.\nPhysical Examination: Extensive oral erosions. Multiple flaccid bullae and large denuded areas on the trunk. Positive Nikolsky sign (lateral pressure on normal-appearing skin causes shedding).\nLaboratory Results: Biopsy shows suprabasal acantholysis (row of tombstones). Direct Immunofluorescence (DIF) shows IgG and C3 in a 'chicken-wire' or 'fishnet' pattern.",
    disease: "Pemphigus Vulgaris",
    questions: [
      {
        q: "What is the primary autoantibody target in Pemphigus Vulgaris?",
        options: ["Desmoglein 1 and 3", "Desmoglein 1 only", "BP180", "Type VII Collagen"],
        ans: 0,
        exp: "Pemphigus vulgaris involves antibodies against Desmoglein 3 (mucosal-dominant) and often Desmoglein 1 (mucocutaneous)."
      },
      {
        q: "Where is the site of blister formation in Pemphigus Vulgaris?",
        options: ["Subepidermal", "Suprabasal (within the epidermis)", "Subcutaneous", "Stratum corneum"],
        ans: 1,
        exp: "Acantholysis occurs just above the basal layer, leading to flaccid blisters."
      },
      {
        q: "What is the first-line treatment for Pemphigus Vulgaris?",
        options: ["Topical steroids only", "Systemic corticosteroids (Prednisone) often combined with Rituximab", "Acyclovir", "Topical Ketoconazole"],
        ans: 1,
        exp: "Aggressive immunosuppression is required to control this potentially fatal disease."
      }
    ]
  },
  {
    title: "The Scaly Blister",
    scenario: "A 50-year-old female presents with scaly, crusted plaques on her face and upper trunk. She does not have any mouth sores.\n\nVitals: Normal.\nPhysical Examination: Erythematous, scaly, and crusted patches in a seborrheic distribution. No mucosal involvement. Nikolsky sign is positive in the affected areas.\nLaboratory Results: Biopsy shows acantholysis in the superficial epidermis (granular layer). DIF shows 'fishnet' IgG/C3 in the superficial epidermis.",
    disease: "Pemphigus Foliaceus",
    questions: [
      {
        q: "What is the autoantibody target in Pemphigus Foliaceus?",
        options: ["Desmoglein 3", "Desmoglein 1", "BP230", "Laminin 332"],
        ans: 1,
        exp: "Pemphigus foliaceus specifically targets Desmoglein 1, which is found in the upper epidermis."
      },
      {
        q: "Why is there no mucosal involvement in Pemphigus Foliaceus?",
        options: ["Desmoglein 3 compensates for the loss of Desmoglein 1 in the mucosa", "The mouth is too dry", "Antibodies cannot reach the mouth", "It is a viral infection"],
        ans: 0,
        exp: "Desmoglein 3 is highly expressed throughout the mucosa, maintaining adhesion even when Dsg1 is inhibited."
      },
      {
        q: "What is 'Fogo Selvagem'?",
        options: ["A type of spicy food", "An endemic form of Pemphigus Foliaceus found in rural Brazil, linked to black fly bites", "A viral wart", "A type of skin cancer"],
        ans: 1,
        exp: "This is a geographically clustered variant of the disease."
      }
    ]
  },
  {
    title: "The Tense Blisters",
    scenario: "An 80-year-old male presents with large, itchy blisters on his limbs and abdomen. He says it started as 'hives' weeks ago.\n\nVitals: Normal.\nPhysical Examination: Multiple large, tense bullae on an erythematous base. Nikolsky sign is negative. Some urticarial (hive-like) plaques are present.\nLaboratory Results: Biopsy shows subepidermal split with numerous eosinophils. DIF shows linear IgG and C3 along the basement membrane zone (BMZ).",
    disease: "Bullous Pemphigoid",
    questions: [
      {
        q: "What are the primary targets in Bullous Pemphigoid?",
        options: ["Desmogleins", "BP180 (Type XVII Collagen) and BP230", "Desmoplakin", "Gliadin"],
        ans: 1,
        exp: "These are components of the hemidesmosome, which anchors the epidermis to the dermis."
      },
      {
        q: "Why are the blisters in Bullous Pemphigoid 'tense' while Pemphigus blisters are 'flaccid'?",
        options: ["The patient is older", "BP involves a deep, subepidermal split with an intact epidermal roof, while Pemphigus involves a superficial intraepidermal split", "It's a mystery", "BP has more fluid"],
        ans: 1,
        exp: "The full thickness of the epidermis forms the roof of the BP blister, making it much stronger."
      },
      {
        q: "What is the most common symptom preceding the appearance of blisters in BP?",
        options: ["Pain", "Intense pruritus (itching)", "Numbness", "Fever"],
        ans: 1,
        exp: "Patients often have a 'non-bullous' phase of intense itching and urticarial plaques."
      }
    ]
  },
  {
    title: "The Scarring Mouth Sights",
    scenario: "A 70-year-old female complains of chronic painful mouth erosions and persistent 'red eyes'.\n\nVitals: Normal.\nPhysical Examination: Desquamative gingivitis and erosions on the buccal mucosa. Ophthalmology exam shows symblepharon (adhesion between the eyelid and the eyeball).\nLaboratory Results: DIF shows linear IgG, C3, and sometimes IgA at the BMZ.",
    disease: "Mucous Membrane Pemphigoid (Cicatricial Pemphigoid)",
    questions: [
      {
        q: "What is the hallmark complication of Mucous Membrane Pemphigoid?",
        options: ["Weight gain", "Scarring of mucosal surfaces (which can lead to blindness or airway stenosis)", "Better vision", "Hair growth"],
        ans: 1,
        exp: "Scarring (cicatrization) is the defining feature and the cause of major morbidity."
      },
      {
        q: "Which target antigen is associated with a higher risk of solid organ malignancy in this condition?",
        options: ["BP180", "Laminin 332 (Laminin 5)", "BP230", "Integrin"],
        ans: 1,
        exp: "Anti-Laminin 332 MMP is considered a paraneoplastic marker in some studies."
      },
      {
        q: "What is the Brunsting-Perry variant?",
        options: ["A type of tea", "A localized form of MMP affecting the head and neck, usually without mucosal involvement, leading to scarring alopecia", "A viral infection", "A drug reaction"],
        ans: 1,
        exp: "This variant focuses on the skin rather than the mucous membranes."
      }
    ]
  },
  {
    title: "The Pregnancy Rash",
    scenario: "A 28-year-old woman in her third trimester develops extremely itchy blisters starting around her belly button.\n\nVitals: Normal.\nPhysical Examination: Urticarial plaques and vesicles/bullae beginning in the periumbilical region and spreading to the limbs. The face and mucosa are spared.\nLaboratory Results: DIF of perilesional skin shows linear C3 along the BMZ.",
    disease: "Pemphigoid Gestationis",
    questions: [
      {
        q: "What was the historical name for Pemphigoid Gestationis?",
        options: ["Prurigo", "Herpes Gestationis (misleading name as it is not viral)", "Diaper rash", "Eczema"],
        ans: 1,
        exp: "It is an autoimmune bullous disease, not related to the herpes virus."
      },
      {
        q: "When does this condition typically resolve?",
        options: ["Never", "Usually shortly after delivery, although 'flares' can occur at the time of birth", "Only with surgery", "In the first trimester"],
        ans: 1,
        exp: "Resolution post-partum is typical, but it often recurs in subsequent pregnancies."
      },
      {
        q: "Is there a risk to the fetus?",
        options: ["No", "Yes, there is a risk of premature birth and a small percentage of neonates may have transient blisters due to passive transfer of antibodies", "Always fatal", "Only to the mother"],
        ans: 1,
        exp: "The fetal risk is generally manageable but requires monitoring."
      }
    ]
  },
  {
    title: "The Celiac Itch",
    scenario: "A 30-year-old male presents with intensely itchy, small blisters on his elbows, knees, and buttocks. He also has frequent bloating and diarrhea.\n\nVitals: Normal.\nPhysical Examination: Grouped (herpetiform) vesicles and excoriations in a symmetric distribution over extensor surfaces.\nLaboratory Results: Biopsy shows subepidermal split with neutrophils in dermal papillae (microabscesses). DIF shows granular IgA deposits in the dermal papillae.",
    disease: "Dermatitis Herpetiformis",
    questions: [
      {
        q: "Dermatitis Herpetiformis is strongly associated with which systemic condition?",
        options: ["Diabetes", "Celiac Disease (Gluten-sensitive enteropathy)", "Hypertension", "Lung cancer"],
        ans: 1,
        exp: "Nearly 100% of these patients have underlying celiac disease, though it may be asymptomatic."
      },
      {
        q: "What is the autoantigen in Dermatitis Herpetiformis?",
        options: ["Desmoglein", "Epidermal Transglutaminase (TG3)", "Collagen VII", "Insulin"],
        ans: 1,
        exp: "IgA antibodies against transglutaminase-3 deposit in the skin."
      },
      {
        q: "What is the first-line pharmacologic treatment for the skin lesions?",
        options: ["Steroids", "Dapsone", "Penicillin", "Insulin"],
        ans: 1,
        exp: "Dapsone provides rapid relief of the itch, but a gluten-free diet is the long-term solution."
      }
    ]
  },
  {
    title: "The Trauma Blisters",
    scenario: "A 40-year-old male notices that minor bumps or friction on his hands and feet cause blisters that heal with scarring and small white bumps.\n\nVitals: Normal.\nPhysical Examination: Mechanobullous disease (blisters at sites of trauma), atrophic scars, and milia (small cysts) on the extensor surfaces.\nLaboratory Results: DIF shows linear IgG and C3 at the BMZ. Salt-split skin study shows localization to the dermal side (floor) of the split.",
    disease: "Epidermolysis Bullosa Acquisita (EBA)",
    questions: [
      {
        q: "What is the target antigen in EBA?",
        options: ["BP180", "Type VII Collagen (the main component of anchoring fibrils)", "Laminin 332", "Desmoglein"],
        ans: 1,
        exp: "Type VII collagen anchors the basement membrane to the dermis."
      },
      {
        q: "How does the salt-split skin technique help diagnose EBA?",
        options: ["It identifies bacteria", "In EBA, the antibodies bind to the 'floor' (dermal side) of the artificial split; in Bullous Pemphigoid, they bind to the 'roof' (epidermal side)", "It makes the skin taste salty", "It is used for eczema"],
        ans: 1,
        exp: "This distinguishes EBA from Bullous Pemphigoid when standard DIF is identical."
      },
      {
        q: "EBA can be associated with which inflammatory bowel disease?",
        options: ["Crohn's Disease", "IBS", "Celiac", "Appendicitis"],
        ans: 0,
        exp: "A significant minority of EBA patients have Crohn's."
      }
    ]
  },
  {
    title: "The Ring of Blisters",
    scenario: "A 5-year-old child presents with 'strings of pearls' blisters on her lower abdomen and groin.\n\nVitals: Normal.\nPhysical Examination: Annular (ring-shaped) erythematous plaques with a border of small vesicles ('string of pearls').\nLaboratory Results: DIF shows linear IgA along the BMZ.",
    disease: "Linear IgA Bullous Dermatosis (LABD)",
    questions: [
      {
        q: "What is the most common drug trigger for Linear IgA Bullous Dermatosis in adults?",
        options: ["Penicillin", "Vancomycin", "Aspirin", "Vitamin C"],
        ans: 1,
        exp: "Vancomycin is the classic culprit for drug-induced LABD."
      },
      {
        q: "What is the name for this condition when it occurs in children?",
        options: ["Roseola", "Chronic Bullous Disease of Childhood", "Chickenpox", "Impetigo"],
        ans: 1,
        exp: "This is the pediatric equivalent of the same immunopathologic process."
      },
      {
        q: "What is the primary target in most cases of LABD?",
        options: ["Desmoglein", "A 120-kDa fragment of BP180 (LAD-1)", "Gliadin", "Keratin"],
        ans: 1,
        exp: "The antibodies target the shed ectodomain of BP180."
      }
    ]
  },
  {
    title: "The Cancer-Linked Blisters",
    scenario: "A 60-year-old patient with Non-Hodgkin Lymphoma develops severe, intractable oral ulcerations and a polymorphous rash on the body.\n\nVitals: Normal.\nPhysical Examination: Painful, extensive mucosal erosions. Skin shows targetoid lesions, blisters, and lichenoid plaques.\nLaboratory Results: Indirect Immunofluorescence (IIF) shows binding to rat bladder epithelium.",
    disease: "Paraneoplastic Pemphigus (PNP)",
    questions: [
      {
        q: "What is the most common underlying malignancy associated with PNP?",
        options: ["Breast cancer", "Hematologic malignancies (e.g., Non-Hodgkin Lymphoma, CLL, Castleman Disease)", "Skin cancer", "Colon cancer"],
        ans: 1,
        exp: "PNP is almost always associated with a B-cell lymphoproliferative disorder."
      },
      {
        q: "What is the sensitivity of 'rat bladder' IIF for PNP?",
        options: ["Low", "Highly specific, as rat bladder epithelium contains desmoplakins but no desmogleins, distinguishing it from classic pemphigus", "Zero", "Only for children"],
        ans: 1,
        exp: "Plakin antibodies are the hallmark of PNP."
      },
      {
        q: "What is a frequent and often fatal respiratory complication of PNP?",
        options: ["Asthma", "Bronchiolitis Obliterans", "Pneumonia", "Lung cancer"],
        ans: 1,
        exp: "The same antibodies can attack the respiratory epithelium, leading to obstructive lung disease."
      }
    ]
  },
  {
    title: "The Butterfly Rash",
    scenario: "A 24-year-old female presents with a red rash on her cheeks and bridge of her nose that gets worse after sun exposure. She also has joint pain.\n\nVitals: Normal.\nPhysical Examination: Erythematous, confluent macules on the malar area (cheeks and nose), sparing the nasolabial folds.\nLaboratory Results: Positive ANA (1:640, speckled pattern) and high Anti-dsDNA.",
    disease: "Acute Cutaneous Lupus Erythematosus (ACLE)",
    questions: [
      {
        q: "What is the classic distribution of the ACLE 'butterfly' rash?",
        options: [" Nasolabial folds are involved", "Malar distribution, characteristically sparing the nasolabial folds", "Only on the forehead", "Only on the chin"],
        ans: 1,
        exp: "Sparing of the folds helps distinguish it from Seborrheic Dermatitis."
      },
      {
        q: "What is the correlation between ACLE and systemic lupus (SLE)?",
        options: ["No correlation", "ACLE is almost always associated with active systemic disease", "It only happens in old men", "It is a fungus"],
        ans: 1,
        exp: "Unlike discoid lupus, ACLE is a strong indicator of systemic involvement."
      },
      {
        q: "Does ACLE typically cause scarring?",
        options: ["Yes, always", "No, it is usually non-scarring, though it may leave post-inflammatory pigment changes", "Only on the ears", "Only in smokers"],
        ans: 1,
        exp: "Inflammation is relatively superficial compared to discoid lupus."
      }
    ]
  },
  {
    title: "The Ring-Shaped Sun Rash",
    scenario: "A patient presents with several ring-shaped, red, scaly patches on her upper back and chest after a beach vacation.\n\nVitals: Normal.\nPhysical Examination: Annular, polycyclic erythematous plaques with a fine scale on the 'V' of the neck and upper back.\nLaboratory Results: Positive Anti-Ro (SS-A) and Anti-La (SS-B).",
    disease: "Subacute Cutaneous Lupus Erythematosus (SCLE)",
    questions: [
      {
        q: "Which autoantibody is most characteristically associated with SCLE?",
        options: ["Anti-dsDNA", "Anti-Ro (SS-A)", "Anti-Scl70", "Anti-Centromere"],
        ans: 1,
        exp: "Anti-Ro is positive in about 75-90% of SCLE patients."
      },
      {
        q: "Which medication is a common trigger for 'Drug-Induced' SCLE?",
        options: ["Hydrochlorothiazide (HCTZ)", "Aspirin", "Vitamin C", "Penicillin"],
        ans: 0,
        exp: "HCTZ, calcium channel blockers, and terbinafine are common culprits."
      },
      {
        q: "Does SCLE usually cause scarring or atrophy?",
        options: ["Yes", "No, it is non-scarring and non-atrophic (distinguishing it from DLE)", "Only if scratched", "Always"],
        ans: 1,
        exp: "The lack of scarring is a key clinical differentiator."
      }
    ]
  },
  {
    title: "The Scarring Ear Spots",
    scenario: "A 40-year-old male has chronic, thick, red patches on his ears and scalp that leave bald spots.\n\nVitals: Normal.\nPhysical Examination: Well-demarcated, erythematous, indurated plaques with adherent scale, follicular plugging, and central atrophy/scarring on the conchal bowls and scalp.\nLaboratory Results: Biopsy shows interface dermatitis and thick basement membrane.",
    disease: "Discoid Lupus Erythematosus (DLE)",
    questions: [
      {
        q: "What is 'follicular plugging' in the context of DLE?",
        options: ["Hair growth", "Accumulation of keratin in the hair follicles, seen as 'carpet-tack' scale when the scale is removed", "A type of wart", "Pus"],
        ans: 1,
        exp: "This is a classic clinical finding in DLE."
      },
      {
        q: "What percentage of patients with localized DLE will go on to develop systemic lupus (SLE)?",
        options: ["100%", "Approximately 5-10%", "50%", "0%"],
        ans: 1,
        exp: "Most DLE is skin-limited, though screening is still necessary."
      },
      {
        q: "What is the long-term consequence of DLE on the scalp?",
        options: ["Curly hair", "Permanent scarring alopecia (cicatricial alopecia)", "Better hair growth", "Itching"],
        ans: 1,
        exp: "The destruction of the hair follicles leads to irreversible hair loss."
      }
    ]
  },
  {
    title: "The Heliotrope Eyes",
    scenario: "A 50-year-old female presents with weakness climbing stairs and a purple rash on her eyelids.\n\nVitals: Normal.\nPhysical Examination: Violaceous (heliotrope) erythema and edema of the eyelids. Red-purple flat-topped papules on the knuckles (Gottron papules).\nLaboratory Results: Elevated Creatine Kinase (CK) and Aldolase. Positive Anti-Jo-1.",
    disease: "Dermatomyositis",
    questions: [
      {
        q: "What are 'Gottron Papules'?",
        options: ["Warts", "Violaceous, flat-topped papules over the dorsal interphalangeal and metacarpophalangeal joints", "Freckles", "Blisters"],
        ans: 1,
        exp: "These are pathognomonic for dermatomyositis."
      },
      {
        q: "What is the 'Shawl Sign'?",
        options: ["Wearing a scarf", "Erythema over the upper back and shoulders", "A type of bandage", "Weakness"],
        ans: 1,
        exp: "It refers to the distribution of the rash on the shoulders."
      },
      {
        q: "Adults with dermatomyositis have an increased risk of which systemic condition?",
        options: ["Internal malignancy (cancer screening is mandatory)", "Diabetes", "Glaucoma", "Stroke"],
        ans: 0,
        exp: "Dermatomyositis can be a paraneoplastic syndrome in adults."
      }
    ]
  },
  {
    title: "The Hardened Skin",
    scenario: "A 45-year-old female complains that her fingers turn blue in the cold and the skin on her hands feels tight and 'shiny'.\n\nVitals: Normal.\nPhysical Examination: Sclerodactyly (tightening of the skin on the fingers), telangiectasias on the face, and Raynaud's phenomenon.\nLaboratory Results: Positive Anti-Centromere antibody.",
    disease: "Limited Systemic Sclerosis (CREST Syndrome)",
    questions: [
      {
        q: "What does the 'C' in CREST stand for?",
        options: ["Cancer", "Calcinosis (calcium deposits in the skin)", "Cough", "Cold"],
        ans: 1,
        exp: "Calcinosis cutis is a frequent finding."
      },
      {
        q: "What is 'Sclerodactyly'?",
        options: ["Long fingers", "Tightening and thickening of the skin of the fingers, leading to a 'claw-like' appearance", "Extra fingers", "Swollen fingers"],
        ans: 1,
        exp: "The skin loses its elasticity and becomes bound down."
      },
      {
        q: "Which antibody is most specific for the DIFFUSE form of systemic sclerosis?",
        options: ["Anti-Centromere", "Anti-Scl-70 (Topoisomerase I)", "Anti-Ro", "Anti-Sm"],
        ans: 1,
        exp: "Anti-Centromere is for limited; Scl-70 is for diffuse disease."
      }
    ]
  },
  {
    title: "The En Coup de Sabre",
    scenario: "A 10-year-old girl has a vertical, indented line on her forehead that looks like a 'sword strike'.\n\nVitals: Normal.\nPhysical Examination: A linear, atrophic, hyperpigmented band extending from the forehead into the scalp, causing a line of hair loss.\nLaboratory Results: Biopsy shows thick, homogenized collagen bundles.",
    disease: "Linear Morphea",
    questions: [
      {
        q: "What is the name for this specific forehead presentation of linear morphea?",
        options: ["Scar", "En coup de sabre (''strike of the sword'')", "Butterfly rash", "Heliotrope"],
        ans: 1,
        exp: "The French name describes the indented, linear appearance."
      },
      {
        q: "Does Morphea (localized scleroderma) usually involve internal organs?",
        options: ["Yes, always", "No, it is typically limited to the skin and underlying tissues", "Only the heart", "Only the lungs"],
        ans: 1,
        exp: "Morphea is distinct from systemic sclerosis."
      },
      {
        q: "What is Parry-Romberg syndrome?",
        options: ["A type of fracture", "Progressive hemifacial atrophy, sometimes associated with linear morphea of the face", "A heart valve problem", "Eye disease"],
        ans: 1,
        exp: "It involves deep atrophy of the fat and muscle on one side of the face."
      }
    ]
  },
  {
    title: "The Purple Wrist Bumps",
    scenario: "A middle-aged male presents with very itchy, flat-topped, purple bumps on his wrists and shins.\n\nVitals: Normal.\nPhysical Examination: Planar, purple, polygonal, pruritic, papules/plaques (the 6 P's). Fine white lines (Wickham striae) are visible on the surface.\nLaboratory Results: Biopsy shows a 'saw-tooth' pattern of epidermal hyperplasia.",
    disease: "Lichen Planus",
    questions: [
      {
        q: "What are the '6 P's' of Lichen Planus?",
        options: ["Painful, Purple, Pale, Pustular, Poorly-defined, Pruritic", "Planar, Purple, Polygonal, Pruritic, Papules, Plaques", "Pink, Pearly, Polished, Painless, Pits, Patches", "None of the above"],
        ans: 1,
        exp: "This is the classic mnemonic for LP."
      },
      {
        q: "What are 'Wickham Striae'?",
        options: ["Wrinkles", "Fine, white, lacy lines on the surface of LP lesions or oral mucosa", "Scars", "Hairs"],
        ans: 1,
        exp: "They are caused by focal thickening of the granular layer."
      },
      {
        q: "Lichen Planus is famously associated with which chronic viral infection?",
        options: ["HIV", "Hepatitis C", "Herpes", "HPV"],
        ans: 1,
        exp: "Patients with widespread LP should be screened for Hep C."
      }
    ]
  },
  {
    title: "The Painful Leg Ulcer",
    scenario: "A 40-year-old female with Ulcerative Colitis develops a small 'pimple' on her leg that rapidly turns into a large, painful ulcer with a purple, undermined edge.\n\nVitals: Normal.\nPhysical Examination: A deep ulcer with a necrotic base and a characteristic 'overhanging' or undermined violaceous border.\nLaboratory Results: Biopsy shows a massive neutrophilic infiltrate but no infection.",
    disease: "Pyoderma Gangrenosum",
    questions: [
      {
        q: "Is Pyoderma Gangrenosum caused by an infection?",
        options: ["Yes, bacteria", "No, it is a sterile, neutrophilic dermatosis", "Yes, a fungus", "Yes, a virus"],
        ans: 1,
        exp: "Despite the name 'pyoderma', it is an autoinflammatory process, not an infection."
      },
      {
        q: "What is 'Pathergy'?",
        options: ["Fear of paths", "Development of new lesions or worsening of existing ones at the site of minor trauma (e.g., a needle stick or surgery)", "A type of allergy", "Healing with scars"],
        ans: 1,
        exp: "This is why debriding PG ulcers can be very dangerous."
      },
      {
        q: "What systemic diseases are commonly associated with Pyoderma Gangrenosum?",
        options: ["Inflammatory Bowel Disease (IBD), Rheumatoid Arthritis, and Hematologic malignancies", "Diabetes and Hypertension", "Asthma", "Acne"],
        ans: 0,
        exp: "About 50% of cases are associated with an underlying condition."
      }
    ]
  },
  {
    title: "The Fever and Tender Bumps",
    scenario: "A patient presents with high fever, a high white blood cell count, and sudden onset of painful, red plaques on her face and neck.\n\nVitals: T 39.4 C.\nPhysical Examination: Juicy, erythematous, edematous plaques and nodules that look like blisters but are firm (pseudovesiculation).\nLaboratory Results: WBC 18,000 (Neutrophilia). Biopsy shows massive edema in the papillary dermis and dense neutrophils.",
    disease: "Sweet''s Syndrome (Acute Febrile Neutrophilic Dermatosis)",
    questions: [
      {
        q: "What is the classic clinical triad of Sweet's Syndrome?",
        options: ["Fever, neutrophilia, and tender red plaques", "Itch, rash, scaling", "Pain, blue skin, hair loss", "Cough, rash, diarrhea"],
        ans: 0,
        exp: "The symptoms are often dramatic and resemble an infection."
      },
      {
        q: "Sweet's syndrome can be a sign of which underlying malignancy?",
        options: ["Breast cancer", "Acute Myeloid Leukemia (AML)", "Colon cancer", "Brain tumor"],
        ans: 1,
        exp: "The 'Malignancy-associated' form is often linked to AML."
      },
      {
        q: "How do these lesions typically respond to treatment?",
        options: ["Slowly to antibiotics", "Rapidly to systemic corticosteroids", "They don't respond", "Surgery is needed"],
        ans: 1,
        exp: "The response to steroids is often 'miraculous', with fever and skin clearing in days."
      }
    ]
  },
  {
    title: "The Recurrent Mouth and Genital Sores",
    scenario: "A 25-year-old male of Turkish descent has had recurrent, painful mouth ulcers for years. He now has a painful sore on his scrotum and red, blurry vision.\n\nVitals: Normal.\nPhysical Examination: Aphthous-like ulcers in the mouth and a deep ulcer on the scrotum. Ophthalmology exam shows uveitis.\nLaboratory Results: Positive Pathergy test (pustule forms at the site of a sterile needle prick).",
    disease: "Behcet''s Disease",
    questions: [
      {
        q: "What is the classic triad of Behcet's Disease?",
        options: ["Oral ulcers, genital ulcers, and uveitis (eye inflammation)", "Fever, rash, joint pain", "Diarrhea, rash, weight loss", "None of the above"],
        ans: 0,
        exp: "This multisystem inflammatory disease is more common along the 'Silk Road'."
      },
      {
        q: "What is the Pathergy test?",
        options: ["A blood test", "A skin test where a small pustule forms within 24-48 hours after a sterile needle prick", "A breathing test", "An X-ray"],
        ans: 1,
        exp: "This reflects the exaggerated neutrophilic response to trauma."
      },
      {
        q: "What is the most common cause of morbidity/mortality in Behcet's?",
        options: ["Oral ulcers", "Vascular involvement (aneurysms, thrombosis) or CNS involvement", "Itching", "Scarring"],
        ans: 1,
        exp: "Vascular 'Behcet' is a serious complication."
      }
    ]
  },
  {
    title: "The Skin-Colored Rings",
    scenario: "A 10-year-old girl has several non-itchy, skin-colored-to-pink rings on the back of her hands.\n\nVitals: Normal.\nPhysical Examination: Annular plaques composed of small, firm, skin-colored papules. The center of the ring is normal skin.\nLaboratory Results: Biopsy shows necrobiotic granulomas (palisading granulomas).",
    disease: "Granuloma Annulare",
    questions: [
      {
        q: "How is the ring of Granuloma Annulare (GA) different from Tinea Corporis (fungus)?",
        options: ["GA is blue", "GA has no scale (the surface is smooth), whereas Tinea has a scaly border", "There is no difference", "GA is only on the face"],
        ans: 1,
        exp: "The lack of scale is a critical clinical differentiator."
      },
      {
        q: "What is the most common association for WIDESPREAD (generalized) Granuloma Annulare in adults?",
        options: ["Diabetes mellitus", "Hypertension", "Asthma", "Acne"],
        ans: 0,
        exp: "Localized GA is usually idiopathic, but generalized GA warrants a check for diabetes."
      },
      {
        q: "What is the typical management for localized GA in a child?",
        options: ["Surgery", "Reassurance (most resolve spontaneously within 2 years)", "Chemotherapy", "Antibiotics"],
        ans: 1,
        exp: "Wait-and-see is often the best approach for asymptomatic lesions."
      }
    ]
  },
  {
    title: "The Diabetic Shin Rash",
    scenario: "A 50-year-old diabetic female has a large, yellow-brown patch on her shin that has been getting thinner over time.\n\nVitals: Normal.\nPhysical Examination: A well-demarcated plaque with a waxy, yellowish center, telangiectasias, and a violaceous border. The skin in the center is atrophic.\nLaboratory Results: Biopsy shows 'tiered' granulomatous inflammation.",
    disease: "Necrobiosis Lipoidica (NL)",
    questions: [
      {
        q: "Necrobiosis Lipoidica is most famously associated with which disease?",
        options: ["Diabetes Mellitus", "Lung cancer", "Thyroid disease", "Heart failure"],
        ans: 0,
        exp: "Though most diabetics do not have NL, most patients with NL have diabetes."
      },
      {
        q: "What is a major risk factor if the atrophic skin in the center of NL is injured?",
        options: ["It heals fast", "Chronic ulceration (which is difficult to treat due to poor blood flow)", "It turns into a wart", "Nothing"],
        ans: 1,
        exp: "The thin, scarred skin is very fragile."
      },
      {
        q: "What does 'necrobiosis' refer to histologically?",
        options: ["Living skin", "Degeneration of collagen", "Bacteria", "Hair loss"],
        ans: 1,
        exp: "It describes the altered, 'dead-looking' appearance of the dermal collagen."
      }
    ]
  },
  {
    title: "The Purple Nose (Sarcoid)",
    scenario: "An African American female presents with a persistent cough and several purple, firm patches on her nose and cheeks.\n\nVitals: Normal.\nPhysical Examination: Large, violaceous, indurated plaques on the nose, cheeks, and ears (Lupus Pernio). She also has red bumps on her shins.\nLaboratory Results: Chest X-ray shows bilateral hilar lymphadenopathy. Biopsy shows 'naked' non-caseating granulomas.",
    disease: "Sarcoidosis (Lupus Pernio)",
    questions: [
      {
        q: "What is 'Lupus Pernio' in the context of sarcoidosis?",
        options: ["A type of lupus", "Violaceous, plaque-like skin lesions on the nose/face, which is a marker for chronic, systemic sarcoidosis (especially of the respiratory tract)", "A fungal infection", "Frostbite"],
        ans: 1,
        exp: "The name is confusing but it is a classic sign of sarcoid."
      },
      {
        q: "What are 'naked' granulomas?",
        options: ["Granulomas without clothes", "Granulomas with a very thin or absent rim of surrounding lymphocytes", "Granulomas that are bleeding", "Pus"],
        ans: 1,
        exp: "This is a characteristic histological finding in sarcoidosis."
      },
      {
        q: "What is the name for the combination of Erythema Nodosum, bilateral hilar lymphadenopathy, and fever?",
        options: ["Behcet's", "Lofgren Syndrome (a benign, acute presentation of sarcoidosis)", "Sweet's", "Lupus"],
        ans: 1,
        exp: "Lofgren syndrome has a very good prognosis."
      }
    ]
  },
  {
    title: "The White Patches",
    scenario: "A 20-year-old male notices white spots on his hands and around his eyes that are slowly getting larger.\n\nVitals: Normal.\nPhysical Examination: Well-demarcated, depigmented (chalk-white) macules and patches. No scale.\nLaboratory Results: Wood's lamp shows bright blue-white fluorescence.",
    disease: "Vitiligo",
    questions: [
      {
        q: "What is the cause of depigmentation in Vitiligo?",
        options: ["The fungus eats the pigment", "Autoimmune destruction of melanocytes", "Sunburn", "Vitamin deficiency"],
        ans: 1,
        exp: "The skin has a complete absence of melanocytes in the affected areas."
      },
      {
        q: "Vitiligo is often associated with which other autoimmune condition?",
        options: ["Autoimmune thyroid disease (Hashimoto's or Grave's)", "Lung cancer", "Acne", "Asthma"],
        ans: 0,
        exp: "Checking TSH is often part of the workup."
      },
      {
        q: "What is 'Poliosis'?",
        options: ["A type of poll", "A localized patch of white hair (due to vitiligo affecting the hair follicle)", "Losing teeth", "Yellow nails"],
        ans: 1,
        exp: "Vitiligo can involve the melanocytes in the hair bulb."
      }
    ]
  },
  {
    title: "The Patchy Hair Loss",
    scenario: "A child suddenly develops a round, smooth bald spot on the back of his head.\n\nVitals: Normal.\nPhysical Examination: A well-demarcated, smooth, non-scaly area of hair loss. Short, broken hairs ('exclamation point' hairs) are seen at the edges.\nLaboratory Results: None.",
    disease: "Alopecia Areata",
    questions: [
      {
        q: "What are 'exclamation point' hairs?",
        options: ["Hairs that look surprised", "Hairs that are narrower at the base than at the tip, seen at the active border of alopecia areata", "Thick hairs", "Curly hairs"],
        ans: 1,
        exp: "These are a diagnostic clue for this condition."
      },
      {
        q: "What is the term for complete loss of scalp hair?",
        options: ["Alopecia Areata", "Alopecia Totalis", "Alopecia Universalis", "Pattern baldness"],
        ans: 1,
        exp: "Totalis = Total scalp; Universalis = Universal (all body hair)."
      },
      {
        q: "What is the 'swarm of bees' on histology?",
        options: ["Literal bees", "A peribulbar lymphocytic infiltrate around the hair follicle", "Bacteria", "A type of hive"],
        ans: 1,
        exp: "The lymphocytes attack the hair bulb like a swarm of bees."
      }
    ]
  },
  {
    title: "The White Genital Patch",
    scenario: "An 8-year-old girl (or a postmenopausal woman) presents with intense itching in the genital area.\n\nVitals: Normal.\nPhysical Examination: Ivory-white, atrophic patches in a 'figure-eight' distribution around the vulva and anus. The skin looks like 'crinkled cigarette paper'.\nLaboratory Results: Biopsy shows epidermal atrophy and a dense band of homogenized collagen in the upper dermis.",
    disease: "Lichen Sclerosus",
    questions: [
      {
        q: "What is the 'figure-eight' or 'hourglass' sign?",
        options: ["A type of watch", "Involvement of both the vulvar and perianal skin in Lichen Sclerosus", "A heart problem", "A type of rash on the face"],
        ans: 1,
        exp: "This distribution is highly characteristic."
      },
      {
        q: "Lichen Sclerosus carries a small but significant risk of which cancer in the affected area?",
        options: ["Basal Cell Carcinoma", "Squamous Cell Carcinoma (SCC)", "Melanoma", "Lymphoma"],
        ans: 1,
        exp: "Chronic inflammation and scarring can lead to SCC."
      },
      {
        q: "What is the first-line treatment?",
        options: ["Antibiotics", "Ultrapotent topical corticosteroids (e.g., Clobetasol)", "Moisturizers", "Surgery"],
        ans: 1,
        exp: "Aggressive steroid treatment can prevent scarring and reduce cancer risk."
      }
    ]
  }
];
