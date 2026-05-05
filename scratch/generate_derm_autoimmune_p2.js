module.exports = [
  {
    title: "The Floppy Ear",
    scenario: "A 50-year-old male presents with sudden redness and painful swelling of his right ear. He mentions that the earlobe is not affected.\n\nVitals: Normal.\nPhysical Examination: Erythema, edema, and tenderness of the auricular cartilage. The earlobe (which lacks cartilage) is spared. He also has a 'saddle-nose' deformity from a similar previous episode.\nLaboratory Results: Elevated ESR and CRP.",
    disease: "Relapsing Polychondritis",
    questions: [
      {
        q: "What is the key clinical clue that distinguishes Relapsing Polychondritis from auricular cellulitis?",
        options: ["The ear is blue", "Relapsing polychondritis spares the earlobe (non-cartilaginous), whereas cellulitis involves it", "It is not painful", "It is a fungus"],
        ans: 1,
        exp: "The disease specifically targets cartilage."
      },
      {
        q: "What is a 'Saddle-nose' deformity?",
        options: ["A nose like a horse", "Collapse of the nasal bridge due to destruction of the nasal cartilage", "A long nose", "A red nose"],
        ans: 1,
        exp: "Recurrent inflammation can destroy the structural integrity of the nose."
      },
      {
        q: "Which serious systemic involvement can be life-threatening in this condition?",
        options: ["Skin rash", "Laryngotracheal involvement (leading to airway collapse)", "Itchy eyes", "Yellow nails"],
        ans: 1,
        exp: "Destruction of the tracheal rings is the most dangerous complication."
      }
    ]
  },
  {
    title: "The Dry Eyes and Red Spots",
    scenario: "A 55-year-old female complains of 'grittiness' in her eyes and a very dry mouth. She also has multiple small purple spots on her lower legs.\n\nVitals: Normal.\nPhysical Examination: Xerostomia (dry mouth) and xerophthalmia (dry eyes). Palpable purpura on the lower extremities.\nLaboratory Results: Positive Anti-Ro (SS-A) and Anti-La (SS-B). Schirmer test shows decreased tear production.",
    disease: "Sjogren''s Syndrome",
    questions: [
      {
        q: "What is the term for the dry eyes and dry mouth seen in Sjogren's?",
        options: ["Sicca Syndrome", "Sweet's Syndrome", "Sjögren's triad", "Dryness"],
        ans: 0,
        exp: "Sicca comes from the Latin word for 'dry'."
      },
      {
        q: "Sjogren's syndrome carries a 44-fold increased risk of which malignancy?",
        options: ["Breast cancer", "Non-Hodgkin B-cell Lymphoma (especially MALT lymphoma)", "Skin cancer", "Lung cancer"],
        ans: 1,
        exp: "The chronic stimulation of B-cells can lead to transformation."
      },
      {
        q: "What is the significance of palpable purpura in a Sjogren's patient?",
        options: ["It is a bruise", "It indicates an underlying small-vessel vasculitis (leukocytoclastic vasculitis)", "It is a wart", "It is normal"],
        ans: 1,
        exp: "Vasculitis is a common extra-glandular manifestation."
      }
    ]
  },
  {
    title: "The Neonatal Rash",
    scenario: "A 2-week-old baby develops ring-shaped red spots on his face, especially around the eyes ('raccoon eyes'). His mother has a history of 'joint pains'.\n\nVitals: Normal.\nPhysical Examination: Annular erythematous plaques with a fine scale in a periorbital and facial distribution.\nLaboratory Results: Baby and mother both positive for Anti-Ro (SS-A) antibodies. EKG shows third-degree heart block.",
    disease: "Neonatal Lupus Erythematosus (NLE)",
    questions: [
      {
        q: "NLE is caused by the transplacental transfer of which maternal antibodies?",
        options: ["Anti-dsDNA", "Anti-Ro (SS-A) or Anti-La (SS-B)", "Anti-Scl70", "IgM"],
        ans: 1,
        exp: "Passive transfer of IgG antibodies causes the clinical features."
      },
      {
        q: "Which manifestation of NLE is PERMANENT and does not resolve when the maternal antibodies clear the baby's system?",
        options: ["The skin rash", "Congenital heart block (AV block)", "Liver inflammation", "Low platelets"],
        ans: 1,
        exp: "The rash and hematologic issues are transient; heart block is irreversible and often requires a pacemaker."
      },
      {
        q: "Does the mother always have a diagnosis of Lupus at the time of the baby's birth?",
        options: ["Yes", "No, many mothers are asymptomatic or undiagnosed but are found to have the antibodies upon testing", "Only if she is old", "Only in the winter"],
        ans: 1,
        exp: "NLE in a child is often the first clue to a mother's underlying autoimmune status."
      }
    ]
  },
  {
    title: "The Cold Hands and Purple Toes",
    scenario: "A patient presents with painful, purple bumps on his fingers every winter. He also has a 'butterfly rash' that persists throughout the year.\n\nVitals: Normal.\nPhysical Examination: Dusky, violaceous plaques on the fingertips and toes (chilblains). Malar erythema on the face.\nLaboratory Results: ANA positive 1:1280.",
    disease: "Chilblain Lupus Erythematosus",
    questions: [
      {
        q: "What is 'Chilblain Lupus'?",
        options: ["Lupus caused by a virus", "A form of cutaneous lupus that presents as cold-induced, painful, purple-red nodules on the acral areas (fingers, toes, ears)", "Lupus of the lungs", "A type of frostbite"],
        ans: 1,
        exp: "It mimics common chilblains (pernio) but is associated with SLE or DLE."
      },
      {
        q: "How can you distinguish chilblain lupus from regular chilblains (pernio)?",
        options: ["Regular chilblains resolve in weeks; chilblain lupus is chronic, persists through warmer months, and shows lupus-specific histology", "Regular chilblains are blue", "They are the same", "Lupus is painless"],
        ans: 0,
        exp: "The persistence and histology are the keys."
      },
      {
        q: "What is 'Aicardi-Goutieres Syndrome'?",
        options: ["A type of pasta", "A genetic interferonopathy that can present with severe chilblain lupus-like lesions in childhood", "A heart valve problem", "Eye disease"],
        ans: 1,
        exp: "This is a rare mimic that highlights the role of interferon in lupus."
      }
    ]
  },
  {
    title: "The Mechanic''s Hands",
    scenario: "A patient with Dermatomyositis presents with thick, cracked skin on the sides of his fingers and a chronic cough.\n\nVitals: Normal.\nPhysical Examination: Hyperkeratotic, fissured (cracked) skin on the lateral and palmar aspects of the fingers. Bibasilar crackles on lung auscultation.\nLaboratory Results: Positive Anti-Jo-1 antibody. CT chest shows interstitial lung disease.",
    disease: "Antisynthetase Syndrome",
    questions: [
      {
        q: "What is 'Mechanic's Hands'?",
        options: ["Greasy hands", "Thick, fissured, hyperkeratotic skin on the radial sides of the digits, resembling the hands of a manual laborer", "Hand tremors", "Long fingers"],
        ans: 1,
        exp: "It is a characteristic skin finding in the antisynthetase variant of dermatomyositis."
      },
      {
        q: "Which antibody is most famously associated with this syndrome?",
        options: ["Anti-Ro", "Anti-Jo-1 (Histidyl-tRNA synthetase)", "Anti-Centromere", "Anti-Mi-2"],
        ans: 1,
        exp: "Jo-1 is the most common antisynthetase antibody."
      },
      {
        q: "What is the primary cause of mortality in patients with Antisynthetase Syndrome?",
        options: ["Skin rash", "Interstitial Lung Disease (ILD)", "Muscle weakness", "Heart attack"],
        ans: 1,
        exp: "The lung involvement is often progressive and severe."
      }
    ]
  },
  {
    title: "The Clinically Amyopathic Dermatomyositis",
    scenario: "A 40-year-old female has a heliotrope rash and Gottron papules for 1 year. She has full strength on testing and normal muscle enzymes.\n\nVitals: Normal.\nPhysical Examination: Classic skin findings of dermatomyositis. Normal strength in the deltoids and iliopsoas.\nLaboratory Results: Normal CK and Aldolase. Positive Anti-MDA5 antibody.",
    disease: "Amyopathic Dermatomyositis (ADM)",
    questions: [
      {
        q: "What defines 'Amyopathic' Dermatomyositis?",
        options: ["No skin rash", "Presence of classic skin findings without clinical or laboratory evidence of muscle disease for at least 6 months", "Only muscle disease", "It's a mistake"],
        ans: 1,
        exp: "The patient has the 'derma' but not the 'myositis'."
      },
      {
        q: "The Anti-MDA5 (CADM-140) antibody is associated with what dangerous complication?",
        options: ["Better skin", "Rapidly progressive Interstitial Lung Disease (RP-ILD)", "Hair growth", "Diabetes"],
        ans: 1,
        exp: "MDA5+ patients often have relatively mild skin disease but aggressive, lethal lung disease."
      },
      {
        q: "What skin finding is more common in MDA5+ patients?",
        options: ["Heliotrope rash", "Painful palmar papules and skin ulcerations (vasculopathy)", "Scalp itching", "None"],
        ans: 1,
        exp: "The antibody is associated with a distinct 'vasculopathic' skin phenotype."
      }
    ]
  },
  {
    title: "The Hard Patch (Morphea)",
    scenario: "A woman notices a firm, shiny patch on her abdomen that started as a purple ring.\n\nVitals: Normal.\nPhysical Examination: An oval, indurated plaque with a porcelain-white center and a violaceous (lilac) border. The hair is absent in the patch.\nLaboratory Results: Biopsy shows 'squared-off' biopsy edges due to dense, thickened collagen replacing the fat.",
    disease: "Morphea (Localized Scleroderma)",
    questions: [
      {
        q: "What does the 'lilac border' of a morphea plaque indicate?",
        options: ["Healing", "Active inflammation and expansion of the lesion", "Permanent damage", "Infection"],
        ans: 1,
        exp: "When the border turns brown/white, the lesion is becoming stable (quiescent)."
      },
      {
        q: "How does the hair loss in morphea occur?",
        options: ["The patient pulls it out", "The dense collagen destroys the hair follicles (scarring alopecia within the plaque)", "Fungus", "It's a coincidence"],
        ans: 1,
        exp: "The sclerosis 'chokes' the follicles."
      },
      {
        q: "What is the primary histological feature of morphea?",
        options: ["Pus", "Thickened, 'homogenized' collagen bundles in the dermis and loss of the eccrine glands", "Bacteria", "Cancer cells"],
        ans: 1,
        exp: "The glands are 'pushed up' by the dense collagen."
      }
    ]
  },
  {
    title: "The 'Figure-Eight' Sclerosis",
    scenario: "A post-menopausal woman presents with intense itching and 'tightness' in her genital area.\n\nVitals: Normal.\nPhysical Examination: An ivory-white, hourglass-shaped patch around the vulva and anus. There is evidence of scarring and resorption of the labia minora.\nLaboratory Results: Biopsy confirms Lichen Sclerosus.",
    disease: "Lichen Sclerosus et Atrophicus",
    questions: [
      {
        q: "Which demographic is most commonly affected by Lichen Sclerosus?",
        options: ["Teenage boys", "Pre-pubertal girls and post-menopausal women", "Middle-aged men", "Infants"],
        ans: 1,
        exp: "There is a 'bimodal' age distribution."
      },
      {
        q: "What is a significant long-term risk of untreated genital Lichen Sclerosus?",
        options: ["Better skin", "Squamous Cell Carcinoma (SCC)", "Diabetes", "Weight loss"],
        ans: 1,
        exp: "About 3-5% of patients may develop SCC in the affected area."
      },
      {
        q: "What is the 'parchment paper' sign?",
        options: ["Writing on the skin", "The thin, crinkled, atrophic appearance of the skin in Lichen Sclerosus", "Eating paper", "None of the above"],
        ans: 1,
        exp: "The epidermis becomes extremely thin."
      }
    ]
  },
  {
    title: "The Mouth Mesh",
    scenario: "A patient complains of 'white lines' in her mouth that sting when she eats spicy food.\n\nVitals: Normal.\nPhysical Examination: A reticulated, lacy pattern of white lines (Wickham striae) on the bilateral buccal mucosa. No ulcerations are present.\nLaboratory Results: Biopsy shows lichenoid interface dermatitis.",
    disease: "Oral Lichen Planus (Reticular)",
    questions: [
      {
        q: "What is the most common form of Oral Lichen Planus?",
        options: ["Erosive", "Reticular (white lacy lines)", "Bullous", "Pigmented"],
        ans: 1,
        exp: "Reticular LP is often asymptomatic and found incidentally."
      },
      {
        q: "How does the 'Erosive' form of Oral LP differ?",
        options: ["It is blue", "It is extremely painful and presents with bright red erosions and ulcers, often surrounded by Wickham striae", "It is painless", "It is not in the mouth"],
        ans: 1,
        exp: "Erosive LP has a higher risk of malignant transformation to SCC."
      },
      {
        q: "Can Lichen Planus affect the nails?",
        options: ["No", "Yes, it can cause 'pterygium' (cuticle growing over the nail) and even complete nail loss (anonychia)", "Only with fungus", "It makes them grow faster"],
        ans: 1,
        exp: "Nail LP is often aggressive and requires systemic treatment to prevent permanent loss."
      }
    ]
  },
  {
    title: "The V-Sign Rash",
    scenario: "A woman presents with a red rash on her chest and neck that appears after she spends time in the garden.\n\nVitals: Normal.\nPhysical Examination: Confluent, violaceous erythema on the lower neck and upper chest ('V-sign').\nLaboratory Results: Elevated CK and Aldolase.",
    disease: "Dermatomyositis (V-Sign)",
    questions: [
      {
        q: "What is the 'V-sign' in dermatomyositis?",
        options: ["A hand gesture", "Photosensitive erythema in the 'V' area of the neck and chest", "A type of vaccine", "None of the above"],
        ans: 1,
        exp: "It is one of the characteristic 'telangiectatic' rashes of DM."
      },
      {
        q: "What is the 'Holster Sign'?",
        options: ["Wearing a gun", "Erythema on the lateral thighs, resembling where a holster would rest", "Weakness in the legs", "A type of boot"],
        ans: 1,
        exp: "This is another classic (though less frequent) sign of DM."
      },
      {
        q: "Dermatomyositis is associated with which abnormality of the nail folds?",
        options: ["Fungus", "Periungual telangiectasia and 'ragged' cuticles (Samitz sign)", "Yellow nails", "Nail biting"],
        ans: 1,
        exp: "The capillaries at the nail fold become dilated and looped."
      }
    ]
  },
  {
    title: "The 'Salt and Pepper' Skin",
    scenario: "A patient with systemic sclerosis notices that her skin is becoming dark in some areas and white in others, especially on her chest.\n\nVitals: Normal.\nPhysical Examination: Diffuse hyperpigmentation with perifollicular sparing (small spots of normal color or hypopigmentation around hair follicles), giving a 'salt and pepper' appearance.\nLaboratory Results: Positive Anti-Scl-70.",
    disease: "Systemic Sclerosis (Pigmentary Change)",
    questions: [
      {
        q: "What is the 'salt and pepper' sign in systemic sclerosis?",
        options: ["Seasoning the skin", "A pattern of vitiligo-like depigmentation with sparing of the pigment around the hair follicles", "A type of rash", "Lice"],
        ans: 1,
        exp: "The melanocytes around the follicles are often preserved."
      },
      {
        q: "Where is this sign most commonly seen?",
        options: ["The palms", "The upper trunk and forehead", "The toes", "The tongue"],
        ans: 1,
        exp: "It is a common early sign of diffuse disease."
      },
      {
        q: "Does this represent true vitiligo?",
        options: ["Yes", "No, it is a leukoderma related to the scleroderma process, not a primary autoimmune destruction of melanocytes as in vitiligo", "It is a fungus", "It is a burn"],
        ans: 1,
        exp: "The mechanism of pigment loss is different."
      }
    ]
  },
  {
    title: "The Scarring Pemphigoid",
    scenario: "An elderly man presents with recurring blisters on his scalp that always leave a scar.\n\nVitals: Normal.\nPhysical Examination: Several tense bullae and multiple areas of scarring alopecia on the vertex of the scalp. No mucosal involvement.\nLaboratory Results: DIF shows linear IgG at the BMZ.",
    disease: "Brunsting-Perry Cicatricial Pemphigoid",
    questions: [
      {
        q: "What is the unique feature of the Brunsting-Perry variant of MMP?",
        options: ["It only affects the feet", "It is limited to the skin (usually head and neck) and does NOT involve the mucous membranes", "It is caused by a virus", "It is not painful"],
        ans: 1,
        exp: "It is a rare, skin-limited form of scarring pemphigoid."
      },
      {
        q: "What is the end result of these lesions on the scalp?",
        options: ["Curly hair", "Permanent scarring alopecia", "Better hair growth", "Itching"],
        ans: 1,
        exp: "The subepidermal split and inflammation destroy the hair bulbs."
      },
      {
        q: "How is it treated differently from classic Bullous Pemphigoid?",
        options: ["It isn't", "It often requires more aggressive treatment (like Dapsone or immunosuppressants) because of the risk of permanent scarring", "Only with moisturizers", "Surgery is first-line"],
        ans: 1,
        exp: "Preventing scarring is the primary goal."
      }
    ]
  },
  {
    title: "The Gluten-Free Diet Failure",
    scenario: "A patient with Dermatitis Herpetiformis (DH) continues to have outbreaks despite being on a 'strict' gluten-free diet for 1 month.\n\nVitals: Normal.\nPhysical Examination: New clusters of vesicles on the elbows.\nLaboratory Results: Granular IgA in the dermal papillae.",
    disease: "Dermatitis Herpetiformis (Management)",
    questions: [
      {
        q: "How long does it typically take for a gluten-free diet to clear the skin in DH?",
        options: ["1 week", "Months to years (the skin response is much slower than the intestinal response)", "1 day", "Never"],
        ans: 1,
        exp: "This is why Dapsone is used to bridge the gap."
      },
      {
        q: "What is the 'gold standard' for the diagnosis of DH?",
        options: ["Blood test for gluten", "Direct Immunofluorescence (DIF) of perilesional (normal-looking) skin", "Skin scraping", "X-ray"],
        ans: 1,
        exp: "DIF showing granular IgA is the definitive diagnostic test."
      },
      {
        q: "Why should you biopsy perilesional skin rather than the blister itself for DIF?",
        options: ["Blisters are scary", "The inflammatory process in the blister destroys the IgA deposits, leading to a false-negative result", "It is less painful", "It is a rule"],
        ans: 1,
        exp: "Always biopsy the normal skin adjacent to a lesion for immunofluorescence."
      }
    ]
  },
  {
    title: "The Drug-Induced Pemphigus",
    scenario: "A patient being treated for Rheumatoid Arthritis with D-Penicillamine develops flaccid blisters on his trunk.\n\nVitals: Normal.\nPhysical Examination: Multiple flaccid bullae and erosions. Positive Nikolsky sign.\nLaboratory Results: Biopsy shows acantholysis. DIF shows fishnet pattern.",
    disease: "Drug-Induced Pemphigus",
    questions: [
      {
        q: "Which drug is the most classic cause of drug-induced pemphigus?",
        options: ["Aspirin", "D-Penicillamine (a thiol-containing drug)", "Vitamin D", "Penicillin"],
        ans: 1,
        exp: "Thiol groups can interfere with desmosomal bonds."
      },
      {
        q: "Does drug-induced pemphigus always resolve when the drug is stopped?",
        options: ["Yes, always", "No, in many cases (especially with thiol drugs), the disease becomes self-perpetuating and requires full treatment", "Only in children", "Only if caught early"],
        ans: 1,
        exp: "It can trigger a permanent autoimmune state."
      },
      {
        q: "How does it differ from drug-induced Bullous Pemphigoid?",
        options: ["One is blue", "Pemphigus is intraepidermal (acantholytic); Pemphigoid is subepidermal", "They are the same", "One is a virus"],
        ans: 1,
        exp: "The level of the split is the key histological difference."
      }
    ]
  },
  {
    title: "The 'Lichenoid' Drug Rash",
    scenario: "A patient starts taking HCTZ for blood pressure and develops a purple, scaly rash on his arms that looks like Lichen Planus.\n\nVitals: Normal.\nPhysical Examination: Violaceous plaques, but with more scale and less Wickham striae than classic LP. It is in sun-exposed areas.\nLaboratory Results: Biopsy shows interface dermatitis with eosinophils.",
    disease: "Lichenoid Drug Eruption",
    questions: [
      {
        q: "What histological clue suggests a 'drug-induced' lichenoid eruption rather than idiopathic LP?",
        options: ["Pus", "Presence of eosinophils and parakeratosis on biopsy", "Bacteria", "Hair loss"],
        ans: 1,
        exp: "Idiopathic LP characteristically lacks eosinophils."
      },
      {
        q: "Which common medication class is linked to this eruption?",
        options: ["Antibiotics", "Antihypertensives (e.g., ACE inhibitors, Beta-blockers, Thiazides)", "Vitamins", "Insulin"],
        ans: 1,
        exp: "Many cardiovascular drugs are triggers."
      },
      {
        q: "Does Lichenoid Drug Eruption typically involve the mouth?",
        options: ["Yes, always", "No, mucosal involvement is much less common than in idiopathic Lichen Planus", "Only in the summer", "Only if the drug is a liquid"],
        ans: 1,
        exp: "Sparing of the mucosa is a helpful clinical clue."
      }
    ]
  },
  {
    title: "The Chronic Bullous Disease of Childhood",
    scenario: "A 4-year-old child develops large, itchy blisters on his groin and legs. They are arranged in a ring.\n\nVitals: Normal.\nPhysical Examination: Tense bullae in a 'cluster of jewels' or 'string of pearls' configuration on the lower trunk and thighs.\nLaboratory Results: DIF shows linear IgA at the BMZ.",
    disease: "Chronic Bullous Disease of Childhood (CBDC)",
    questions: [
      {
        q: "CBDC is the pediatric variant of which adult disease?",
        options: ["Bullous Pemphigoid", "Linear IgA Bullous Dermatosis (LABD)", "Pemphigus", "Eczema"],
        ans: 1,
        exp: "They share the same immunopathology (linear IgA)."
      },
      {
        q: "What is the typical clinical course for most children with CBDC?",
        options: ["Lethal", "Self-limited, usually resolving by puberty", "Progresses to cancer", "Permanent"],
        ans: 1,
        exp: "The prognosis is generally excellent."
      },
      {
        q: "What is the preferred first-line treatment for CBDC?",
        options: ["Topical steroids", "Oral Dapsone", "Antibiotics", "Surgery"],
        ans: 1,
        exp: "Dapsone is very effective, but G6PD levels must be checked first."
      }
    ]
  },
  {
    title: "The 'Target' Pemphigoid",
    scenario: "A 70-year-old patient presents with blisters that look like target lesions, similar to erythema multiforme.\n\nVitals: Normal.\nPhysical Examination: Blisters developing on target-like erythematous plaques.\nLaboratory Results: DIF shows linear IgG and C3. IIF shows antibodies against BP180.",
    disease: "Bullous Pemphigoid (Polymorphous Variant)",
    questions: [
      {
        q: "Can Bullous Pemphigoid look like Erythema Multiforme (targetoid)?",
        options: ["No", "Yes, BP can be very polymorphous and mimic EM, hives, or eczema before classic blisters appear", "Only in children", "Only in the winter"],
        ans: 1,
        exp: "This is why BP should be in the differential for any itchy, bullous eruption in the elderly."
      },
      {
        q: "What is the 'localised' form of BP?",
        options: ["BP affecting only the mouth", "BP occurring in a single area, often a site of prior trauma, surgery, or radiation", "BP on the toes", "None of the above"],
        ans: 1,
        exp: "Localized BP is often mistaken for infection or contact dermatitis."
      },
      {
        q: "Why is the mortality rate for BP high in the first year (approx 20%) despite it being 'just' a skin disease?",
        options: ["The skin is toxic", "Complications of treatment (high-dose steroids) in an elderly, frail population", "Skin cancer", "Heart failure"],
        ans: 1,
        exp: "Infection and steroid side effects are major risks; this has led to the use of 'steroid-sparing' agents or topical-only regimens."
      }
    ]
  },
  {
    title: "The 'Nail' Lupus",
    scenario: "A patient with systemic lupus notices his cuticles are red and he has small 'splinter-like' red lines in his nails.\n\nVitals: Normal.\nPhysical Examination: Periungual telangiectasia (dilated blood vessels at the nail fold) and splinter hemorrhages.\nLaboratory Results: High-titer ANA.",
    disease: "Systemic Lupus (Nail Manifestations)",
    questions: [
      {
        q: "What are periungual telangiectasias a sign of?",
        options: ["Fungus", "Underlying connective tissue disease (Lupus, Dermatomyositis, or Scleroderma)", "Nail biting", "Old age"],
        ans: 1,
        exp: "They reflect systemic microvascular damage."
      },
      {
        q: "How can you distinguish the nail fold changes of Lupus from Dermatomyositis?",
        options: ["You can't", "Lupus telangiectasias are often more 'disorganized' or 'meandering', while DM shows more 'dilated loops' and 'ragged cuticles', though they overlap significantly", "Lupus is blue", "DM is painless"],
        ans: 1,
        exp: "The Sammitz sign (ragged cuticles) is more characteristic of DM."
      },
      {
        q: "What is the significance of splinter hemorrhages in a lupus patient?",
        options: ["Trauma", "Can be a sign of vasculitis or even Libman-Sacks endocarditis", "Normal", "Fungus"],
        ans: 1,
        exp: "In a patient with systemic disease, they are a 'red flag' for internal involvement."
      }
    ]
  },
  {
    title: "The Sclero-edema of Buschke",
    scenario: "A diabetic male presents with thick, 'woody' skin on his upper back and neck. He cannot 'pinch' the skin.\n\nVitals: Normal.\nPhysical Examination: Non-pitting, indurated thickening of the skin on the posterior neck and upper back. The skin has a 'peau d'orange' (orange peel) texture.\nLaboratory Results: Elevated HbA1c.",
    disease: "Scleredema (Buschke)",
    questions: [
      {
        q: "Scleredema is most commonly associated with which chronic condition?",
        options: ["Hypertension", "Diabetes Mellitus (Type 2, often long-standing and poorly controlled)", "Asthma", "Acne"],
        ans: 1,
        exp: "The 'Scleredema adultorum of Buschke' is a classic diabetic dermatosis."
      },
      {
        q: "How does Scleredema differ from Scleroderma (Systemic Sclerosis)?",
        options: ["One is blue", "Scleredema spares the hands and feet and lacks Raynaud's phenomenon, both of which are central to Scleroderma", "They are the same", "Scleredema is a virus"],
        ans: 1,
        exp: "The lack of acral involvement is a key clinical differentiator."
      },
      {
        q: "What is the histologic finding in Scleredema?",
        options: ["Pus", "A markedly thickened dermis with large 'spaces' between collagen bundles filled with mucin (glycosaminoglycans)", "Bacteria", "Cancer"],
        ans: 1,
        exp: "The 'swelling' of the collagen with mucin causes the thickness."
      }
    ]
  },
  {
    title: "The Parry-Romberg Atrophy",
    scenario: "An 8-year-old girl has one side of her face 'sinking in'. The skin is thin and the underlying muscle seems to be disappearing.\n\nVitals: Normal.\nPhysical Examination: Severe atrophy of the skin, subcutaneous fat, and muscle on the left side of the face. A faint 'en coup de sabre' line is visible on the forehead.\nLaboratory Results: MRI shows brain atrophy on the same side.",
    disease: "Parry-Romberg Syndrome",
    questions: [
      {
        q: "What is Parry-Romberg Syndrome?",
        options: ["A type of fracture", "Progressive hemifacial atrophy, often considered a severe, deep-tissue variant of linear morphea", "A heart problem", "Eye disease"],
        ans: 1,
        exp: "It goes much deeper than the skin."
      },
      {
        q: "Which tissues are affected in this syndrome?",
        options: ["Skin only", "Skin, fat, muscle, and sometimes even the underlying bone", "Only the hair", "Only the eyes"],
        ans: 1,
        exp: "It is a devastating pan-atrophic process."
      },
      {
        q: "What is a common associated neurological finding?",
        options: ["Better memory", "Ipsilateral epilepsy (seizures) or brain calcifications", "Deafness", "Blindness"],
        ans: 1,
        exp: "The process can involve the underlying central nervous system."
      }
    ]
  },
  {
    title: "The Scleromyxedema (Multiple Myeloma)",
    scenario: "A 60-year-old male has hundreds of tiny, firm, waxy bumps in a row on his arms and a very stiff face (Leonine facies).\n\nVitals: Normal.\nPhysical Examination: 2-3 mm dome-shaped, waxy papules in linear arrays ('string of beads'). The skin is generally thickened and the face appears 'lion-like'.\nLaboratory Results: Serum Protein Electrophoresis (SPEP) shows an IgG-lambda monoclonal gammopathy.",
    disease: "Scleromyxedema",
    questions: [
      {
        q: "Scleromyxedema is almost always associated with which plasma cell disorder?",
        options: ["None", "Monoclonal Gammopathy of Undetermined Significance (MGUS), usually IgG-lambda", "Leukemia", "Anemia"],
        ans: 1,
        exp: "The association with a paraprotein is a diagnostic requirement."
      },
      {
        q: "What is 'Leonine Facies'?",
        options: ["A happy face", "A 'lion-like' appearance of the face due to deep furrows and massive thickening of the skin", "A face with whiskers", "None of the above"],
        ans: 1,
        exp: "It is also seen in Lepromatous Leprosy and some lymphomas."
      },
      {
        q: "What is the primary histological finding?",
        options: ["Pus", "Triad of: diffuse mucin deposition, fibroblast proliferation, and fibrosis", "Bacteria", "Cancer"],
        ans: 1,
        exp: "The fibroblasts are stimulated by the paraprotein (though the exact mechanism is debated)."
      }
    ]
  },
  {
    title: "The Rowell Syndrome",
    scenario: "A patient with systemic lupus develops targetoid lesions that look like Erythema Multiforme (EM), but her labs show specific lupus markers.\n\nVitals: Normal.\nPhysical Examination: Classic malar rash plus targetoid, EM-like plaques on the limbs.\nLaboratory Results: Positive ANA, Anti-Ro (SS-A), and a speckled pattern of IIF.",
    disease: "Rowell Syndrome",
    questions: [
      {
        q: "What is Rowell Syndrome?",
        options: ["A type of flu", "The occurrence of Erythema Multiforme-like lesions in the setting of Lupus Erythematosus (usually with positive Anti-Ro)", "A bone disease", "A heart problem"],
        ans: 1,
        exp: "It represents a specific immunologic overlap."
      },
      {
        q: "How does it differ from regular Erythema Multiforme?",
        options: ["It doesn't", "It is chronic, associated with lupus antibodies (Ro/La), and lacks the usual EM triggers like Herpes or Mycoplasma", "It is blue", "It is painless"],
        ans: 1,
        exp: "The clinical context and labs define the syndrome."
      },
      {
        q: "Is it common?",
        options: ["Yes", "No, it is a rare and somewhat controversial entity", "Only in the winter", "Only in children"],
        ans: 1,
        exp: "Many dermatologists debate whether it is a distinct syndrome or just SCLE mimicking EM."
      }
    ]
  },
  {
    title: "The Lupus Panniculitis",
    scenario: "A woman with Lupus develops deep, painful 'dents' on her upper arms and thighs after the skin was initially red and lumpy.\n\nVitals: Normal.\nPhysical Examination: Indurated, erythematous plaques that progress to deep, cup-shaped areas of fat loss (atrophy).\nLaboratory Results: Biopsy shows a lobular panniculitis with 'lymphoid follicles'.",
    disease: "Lupus Erythematosus Profundus",
    questions: [
      {
        q: "What is Lupus Profundus?",
        options: ["Lupus of the lungs", "A form of lupus that affects the subcutaneous fat (panniculitis), leading to deep scarring and atrophy", "Lupus of the brain", "Superficial lupus"],
        ans: 1,
        exp: "It is a deep-seated inflammatory process."
      },
      {
        q: "Where are the most common sites for this condition?",
        options: ["The palms", "Proximal extremities (upper arms, thighs) and buttocks", "The toes", "The tongue"],
        ans: 1,
        exp: "Fat-rich areas are the primary targets."
      },
      {
        q: "Does it always occur in patients with systemic lupus?",
        options: ["Yes", "No, it can be a manifestation of either DLE or SLE, or occur in isolation", "Only in the elderly", "Only in smokers"],
        ans: 1,
        exp: "It is a cutaneous variant that may or may not have systemic links."
      }
    ]
  },
  {
    title: "The Anti-Synthetase Lung",
    scenario: "A patient with a mild rash on her hands presents with severe shortness of breath and 'velcro crackles' on lung exam.\n\nVitals: T 37.2 C, RR 24, O2 Sat 90% on room air.\nPhysical Examination: Mechanic's hands (scaly, cracked skin). Minimal proximal muscle weakness.\nLaboratory Results: Positive Anti-Jo-1. PFTs show a restrictive pattern.",
    disease: "Antisynthetase Syndrome (Lung focus)",
    questions: [
      {
        q: "Why is this patient's prognosis concerning?",
        options: ["The hand rash is itchy", "Anti-Jo-1 is associated with severe Interstitial Lung Disease (ILD) which may not respond well to steroids alone", "She might get a cold", "The rash will scar"],
        ans: 1,
        exp: "Lung disease is the primary driver of mortality in this group."
      },
      {
        q: "Besides Jo-1 and Mechanic's Hands, what is the third 'classic' feature of this syndrome?",
        options: ["Weight gain", "Raynaud's phenomenon and Inflammatory Arthritis", "Blindness", "Hearing loss"],
        ans: 1,
        exp: "The syndrome involves a constellation of autoimmune features."
      },
      {
        q: "What is the best initial imaging for suspected ILD in this patient?",
        options: ["Standard Chest X-ray", "High-Resolution CT (HRCT) of the chest", "Ultrasound", "PET scan"],
        ans: 1,
        exp: "HRCT is much more sensitive than X-ray for early ILD."
      }
    ]
  },
  {
    title: "The Lichen Planopilaris",
    scenario: "A woman presents with patches of hair loss that feel 'rough' and 'itchy'.\n\nVitals: Normal.\nPhysical Examination: Small, red, scaly papules at the base of hair follicles (perifollicular erythema and scale) at the edge of expanding bald spots. The center is smooth and lacks follicles.\nLaboratory Results: Biopsy shows lichenoid inflammation around the hair bulge.",
    disease: "Lichen Planopilaris (LPP)",
    questions: [
      {
        q: "What is Lichen Planopilaris?",
        options: ["A fungal infection", "Follicular variant of Lichen Planus that leads to permanent scarring alopecia", "A type of wart", "Patterns of baldness"],
        ans: 1,
        exp: "The inflammation destroys the stem cells in the hair bulge."
      },
      {
        q: "What is Graham-Little-Piccardi-Lassueur Syndrome?",
        options: ["A type of cheese", "A triad of: scalp LPP, non-scarring alopecia of the axillae/pubis, and lichenoid papules on the body", "A heart problem", "None of the above"],
        ans: 1,
        exp: "This is a rare variant of Lichen Planus."
      },
      {
        q: "How does LPP differ from Alopecia Areata?",
        options: ["Areata is blue", "LPP is a scarring alopecia (the follicles are gone); Areata is non-scarring (the follicles are asleep and can regrow)", "They are the same", "LPP is only in men"],
        ans: 1,
        exp: "Checking for follicular orifices is the key clinical step."
      }
    ]
  }
];
