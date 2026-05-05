const fs = require('fs');

const cases = [
  {
    title: "The Itchy Infant",
    scenario: "A 6-month-old infant is brought to the clinic for a severe rash. The mother reports the infant is constantly scratching and rubbing his face against the crib sheets. The rash spares the diaper area.\n\nVitals: Normal.\nPhysical Examination: Erythematous, ill-defined, scaly, and oozing plaques prominently over the cheeks, scalp, and extensor surfaces of the arms and legs. The diaper area is completely clear.\nLaboratory Results: Elevated total IgE.",
    disease: "Atopic Dermatitis (Infantile Phase)",
    questions: [
      {
        q: "What is the classic distribution of atopic dermatitis in infants?",
        options: ["Flexural creases (antecubital and popliteal fossae)", "Face (cheeks), scalp, and extensor surfaces of the extremities", "Trunk and diaper area", "Palms and soles"],
        ans: 1,
        exp: "In infants (0-2 years), the rash classically affects the face and extensors, while sparing the diaper area due to the moisture barrier of the diaper."
      },
      {
        q: "What genetic mutation is heavily implicated in the pathogenesis of severe atopic dermatitis?",
        options: ["BRCA1", "Filaggrin (FLG)", "TP53", "CFTR"],
        ans: 1,
        exp: "Loss-of-function mutations in the filaggrin gene compromise the epidermal barrier, leading to transepidermal water loss and allergen penetration."
      },
      {
        q: "What is the most critical first-line daily maintenance therapy for this infant?",
        options: ["Oral corticosteroids", "Frequent application of thick emollients (ointments/creams) immediately after bathing", "Topical antibiotics", "Phototherapy"],
        ans: 1,
        exp: "Barrier repair with liberal emollient use is the cornerstone of atopic dermatitis management."
      }
    ]
  },
  {
    title: "The Flexural Rash",
    scenario: "A 15-year-old girl with a history of asthma and allergic rhinitis presents with a chronic, severely pruritic rash. She states she 'just can't stop scratching.'\n\nVitals: Normal.\nPhysical Examination: Erythematous, excoriated, and lichenified (thickened, with accentuated skin markings) plaques located in the antecubital and popliteal fossae, as well as the posterior neck.\nLaboratory Results: Eosinophilia.",
    disease: "Atopic Dermatitis (Childhood/Adult Phase)",
    questions: [
      {
        q: "How does the distribution of atopic dermatitis shift as a child grows older?",
        options: ["It moves from the flexures to the extensors", "It moves from the face/extensors to the flexural creases (antecubital and popliteal fossae)", "It localizes only to the groin", "It only affects the face"],
        ans: 1,
        exp: "After age 2, the distribution classically shifts to the flexural folds."
      },
      {
        q: "What defines the 'Atopic Triad'?",
        options: ["Acne, Rosacea, Psoriasis", "Atopic dermatitis, Allergic rhinitis, and Asthma", "Eczema, Urticaria, Anaphylaxis", "Psoriasis, Arthritis, Uveitis"],
        ans: 1,
        exp: "Patients with one atopic disease are genetically predisposed to develop the others."
      },
      {
        q: "What is the primary cause of the lichenification seen in this patient?",
        options: ["Bacterial infection", "Chronic scratching and rubbing (the 'itch that rashes')", "Use of topical steroids", "Sun exposure"],
        ans: 1,
        exp: "Lichenification is a reactive thickening of the epidermis secondary to chronic mechanical trauma."
      }
    ]
  },
  {
    title: "The Punched-Out Lesions",
    scenario: "A 4-year-old boy with known severe atopic dermatitis presents with a rapid worsening of his skin over the past 3 days. He has a low-grade fever and is irritable.\n\nVitals: T 38.2 C, HR 110.\nPhysical Examination: Widespread clusters of monomorphic, punched-out, hemorrhagic erosions and crusted vesicles on the face and neck, overlying areas of active eczema.\nLaboratory Results: Tzanck smear from a fresh vesicle shows multinucleated giant cells.",
    disease: "Eczema Herpeticum",
    questions: [
      {
        q: "What is the diagnosis?",
        options: ["Impetigo", "Eczema Herpeticum (Kaposi varicelliform eruption)", "Varicella (Chickenpox)", "Psoriasis"],
        ans: 1,
        exp: "Eczema herpeticum is a disseminated Herpes Simplex Virus (HSV) infection occurring in patients with a compromised skin barrier, most commonly atopic dermatitis."
      },
      {
        q: "What classic morphological feature distinguishes Eczema Herpeticum from typical bacterial impetigo?",
        options: ["Honey-colored crusts", "Monomorphic 'punched-out' erosions and umbilicated vesicles", "Large tense bullae", "Silvery scales"],
        ans: 1,
        exp: "The lesions are uniformly sized, discrete, punched-out erosions that often become hemorrhagic or crusted."
      },
      {
        q: "What is the most appropriate immediate medical treatment?",
        options: ["Topical hydrocortisone", "Systemic antiviral therapy (e.g., oral or IV Acyclovir)", "Oral antibiotics (cephalexin)", "Emollients only"],
        ans: 1,
        exp: "This is a dermatologic emergency that requires prompt systemic antiviral therapy to prevent progression to keratoconjunctivitis, encephalitis, or death."
      }
    ]
  },
  {
    title: "The Coin-Shaped Plaques",
    scenario: "A 65-year-old man presents with an extremely itchy rash on his lower legs that has been present for 2 months, worsening in the dry winter air. He has tried over-the-counter moisturizers without relief.\n\nVitals: Normal.\nPhysical Examination: Multiple 2-5 cm, sharply demarcated, coin-shaped (discoid) erythematous plaques with overlying crust and scale on the bilateral anterior lower legs. No central clearing.\nLaboratory Results: KOH preparation is negative for fungal hyphae.",
    disease: "Nummular Eczema",
    questions: [
      {
        q: "What is the most likely diagnosis?",
        options: ["Tinea Corporis", "Nummular Eczema (Discoid eczema)", "Plaque Psoriasis", "Lichen Planus"],
        ans: 1,
        exp: "Nummular (coin-shaped) eczema presents as intensely pruritic, round plaques, classically on the extremities of older adults."
      },
      {
        q: "Why was a KOH preparation performed, and what does the negative result help rule out?",
        options: ["To rule out bacterial infection", "To definitively rule out Tinea Corporis (ringworm), which can also present as round scaly plaques", "To rule out scabies", "To rule out psoriasis"],
        ans: 1,
        exp: "Tinea corporis classically has central clearing and a leading scaly edge, but nummular eczema can look very similar."
      },
      {
        q: "What is the first-line pharmacologic treatment for Nummular Eczema?",
        options: ["Topical antifungals", "Mid-to-high potency topical corticosteroids", "Oral antibiotics", "Oral antihistamines only"],
        ans: 1,
        exp: "Nummular eczema is highly inflammatory and resistant; it requires strong topical steroids and aggressive moisturization."
      }
    ]
  },
  {
    title: "The Tapioca Blisters",
    scenario: "A 28-year-old nurse presents with recurrent, intensely itchy blisters on her hands. She washes her hands frequently at work.\n\nVitals: Normal.\nPhysical Examination: Deep-seated, firm, clear vesicles resembling 'tapioca pudding' clustered along the lateral aspects of the fingers and on the palms. The surrounding skin is red and peeling.\nLaboratory Results: None.",
    disease: "Dyshidrotic Eczema (Pompholyx)",
    questions: [
      {
        q: "What is the diagnosis?",
        options: ["Scabies", "Dyshidrotic Eczema (Pompholyx)", "Psoriasis", "Tinea Manuum"],
        ans: 1,
        exp: "Dyshidrotic eczema classically presents with deep-seated, intensely pruritic 'tapioca-like' vesicles on the palms, soles, and lateral fingers."
      },
      {
        q: "Despite the historical name 'dyshidrotic', what is true regarding the pathogenesis of this condition?",
        options: ["It is caused by blocked sweat glands", "It is NOT related to sweat gland dysfunction; it is a form of vesicular eczema often triggered by stress, wet work, or metal allergies (nickel/cobalt)", "It is a bacterial infection", "It only occurs in summer"],
        ans: 1,
        exp: "The sweat glands are normal. It is an endogenous eczema."
      },
      {
        q: "What is the first-line treatment for acute flares of Dyshidrotic Eczema?",
        options: ["Topical antifungals", "Ultra-high potency topical corticosteroids (e.g., Clobetasol) due to the thick stratum corneum of the palms", "Oral acyclovir", "Salicylic acid"],
        ans: 1,
        exp: "The thick skin of the palms and soles requires Class 1 (super-potent) steroids to penetrate."
      }
    ]
  },
  {
    title: "The Linear Blisters",
    scenario: "A 35-year-old male presents with severe itching on his forearms and legs. He was clearing brush in the woods two days ago. He reports no prior history of skin disease.\n\nVitals: Normal.\nPhysical Examination: Extremely pruritic, erythematous streaks and sharp linear arrays of papules and tense vesicles on the exposed areas of the forearms and lower legs.\nLaboratory Results: None.",
    disease: "Allergic Contact Dermatitis (Rhus Dermatitis)",
    questions: [
      {
        q: "What is the most likely diagnosis?",
        options: ["Impetigo", "Allergic Contact Dermatitis due to Poison Ivy/Oak (Rhus dermatitis)", "Shingles", "Scabies"],
        ans: 1,
        exp: "Linear configurations of vesicles are the hallmark of an exogenous contact dermatitis, specifically from brushing against a plant."
      },
      {
        q: "What type of hypersensitivity reaction is Allergic Contact Dermatitis?",
        options: ["Type I (IgE-mediated)", "Type II (Cytotoxic)", "Type III (Immune complex)", "Type IV (Delayed, T-cell mediated)"],
        ans: 3,
        exp: "It requires prior sensitization and takes 48-72 hours for the memory T-cells to mount the inflammatory response upon re-exposure."
      },
      {
        q: "What is the specific allergenic resin found in Poison Ivy, Oak, and Sumac?",
        options: ["Nickel", "Urushiol", "Neomycin", "Balsam of Peru"],
        ans: 1,
        exp: "Urushiol binds to skin proteins and acts as a hapten, triggering the severe Type IV reaction."
      }
    ]
  },
  {
    title: "The Belt Buckle Rash",
    scenario: "A 22-year-old female presents with an itchy rash on her lower abdomen that comes and goes. She notes it seems worse when she wears her favorite jeans.\n\nVitals: Normal.\nPhysical Examination: A well-demarcated, 4x4 cm erythematous, scaly, and slightly lichenified plaque located exactly at the umbilicus/infraumbilical region.\nLaboratory Results: None.",
    disease: "Allergic Contact Dermatitis (Nickel)",
    questions: [
      {
        q: "What is the most common cause of Allergic Contact Dermatitis worldwide, and the likely cause in this patient?",
        options: ["Latex", "Nickel (from the metal button/belt buckle of her jeans)", "Gold", "Fragrance"],
        ans: 1,
        exp: "Nickel is ubiquitous in jewelry, belt buckles, and clothing snaps. The infraumbilical location is a classic 'giveaway' for a nickel button allergy."
      },
      {
        q: "If the diagnosis is uncertain, what is the gold standard test to confirm the specific allergen causing a contact dermatitis?",
        options: ["Skin prick testing (allergy shots)", "Patch testing", "Serum IgE levels", "Skin biopsy"],
        ans: 1,
        exp: "Patch testing applies allergens to the back for 48 hours to deliberately induce and read a localized Type IV hypersensitivity reaction."
      },
      {
        q: "Why is skin prick testing NOT useful for diagnosing Allergic Contact Dermatitis?",
        options: ["It hurts too much", "Skin prick tests evaluate Type I (IgE-mediated, immediate) hypersensitivity, not Type IV (delayed, T-cell mediated) hypersensitivity", "It is too expensive", "It only works on the face"],
        ans: 1,
        exp: "Prick testing is for hives and anaphylaxis (Type I), not contact eczema (Type IV)."
      }
    ]
  },
  {
    title: "The Sparing Rash",
    scenario: "A 9-month-old infant presents with a bright red rash in the diaper area. The parents note the infant recently had a mild diarrheal illness.\n\nVitals: Normal.\nPhysical Examination: Bright erythematous, glazed patches over the convex surfaces of the buttocks, thighs, and lower abdomen. Crucially, the deep skin folds (inguinal creases) are completely SPARED.\nLaboratory Results: None.",
    disease: "Irritant Contact Dermatitis (Diaper Dermatitis)",
    questions: [
      {
        q: "What is the diagnosis?",
        options: ["Candidal diaper dermatitis", "Irritant contact diaper dermatitis", "Seborrheic dermatitis", "Inverse psoriasis"],
        ans: 1,
        exp: "Irritant diaper dermatitis affects the convexities (where the diaper rubs and traps urine/feces) and classically spares the deep folds."
      },
      {
        q: "How does the physical exam specifically rule out Candidal diaper dermatitis?",
        options: ["The color is red", "Candidal dermatitis classically INVOLVES the skin folds and has satellite papules/pustules beyond the main border", "Candida only happens in adults", "It doesn't rule it out"],
        ans: 1,
        exp: "Yeast loves warm, moist environments, so it thrives deep inside the inguinal folds. Irritant dermatitis spares the folds."
      },
      {
        q: "What is the primary treatment for irritant diaper dermatitis?",
        options: ["Topical antifungals", "Frequent diaper changes, airing out the area, and thick barrier creams (e.g., zinc oxide or petrolatum)", "Oral antibiotics", "High-potency steroids"],
        ans: 1,
        exp: "Prevention involves protecting the skin from prolonged contact with urine and feces."
      }
    ]
  },
  {
    title: "The Greasy Scalp",
    scenario: "A 6-week-old infant is brought in for a rash on his head. The parents have been trying to wash it off, but it persists. The infant does not seem bothered by it and is feeding well.\n\nVitals: Normal.\nPhysical Examination: Thick, greasy, yellow crusts and scales tightly adherent to the vertex of the scalp. No significant erythema. The rest of the skin is clear.\nLaboratory Results: None.",
    disease: "Seborrheic Dermatitis (Cradle Cap)",
    questions: [
      {
        q: "What is the common term for this infantile presentation of Seborrheic Dermatitis?",
        options: ["Dandruff", "Cradle Cap", "Ringworm", "Impetigo"],
        ans: 1,
        exp: "Cradle cap is extremely common, benign, and self-limiting in young infants, driven by maternal androgens."
      },
      {
        q: "What yeast species is strongly implicated in the pathogenesis of Seborrheic Dermatitis?",
        options: ["Candida albicans", "Malassezia species (formerly Pityrosporum ovale)", "Trichophyton rubrum", "Cryptococcus neoformans"],
        ans: 1,
        exp: "Malassezia is a lipophilic yeast that lives in sebum-rich areas and triggers an inflammatory response in susceptible individuals."
      },
      {
        q: "What is the recommended treatment for this infant?",
        options: ["Oral antifungals", "Gentle washing with baby shampoo, applying mineral oil to soften crusts, and gentle brushing; it is benign and self-resolving", "High-potency topical steroids", "UV light therapy"],
        ans: 1,
        exp: "Aggressive treatment is unnecessary and potentially harmful for simple cradle cap."
      }
    ]
  },
  {
    title: "The Nasolabial Redness",
    scenario: "A 35-year-old male presents with a persistent, slightly itchy rash on his face and chest. He notes 'dandruff' that falls onto his shoulders.\n\nVitals: Normal.\nPhysical Examination: Ill-defined erythematous patches with fine, greasy, yellowish scales located on the nasolabial folds, eyebrows, glabella, and the central chest (pre-sternal area).\nLaboratory Results: None.",
    disease: "Seborrheic Dermatitis (Adult)",
    questions: [
      {
        q: "What is the classic distribution of Adult Seborrheic Dermatitis?",
        options: ["Extensor surfaces of elbows and knees", "Sebum-rich areas: scalp, eyebrows, glabella, nasolabial folds, central chest, and external auditory canals", "Palms and soles", "Only the back"],
        ans: 1,
        exp: "The rash follows the density of sebaceous glands."
      },
      {
        q: "If a young adult presents with sudden, extremely severe, widespread, and intractable Seborrheic Dermatitis, what underlying systemic condition MUST be screened for?",
        options: ["Diabetes", "HIV infection", "Hypothyroidism", "Celiac disease"],
        ans: 1,
        exp: "Severe, explosive seborrheic dermatitis is a classic early cutaneous manifestation of HIV/AIDS or Parkinson's disease."
      },
      {
        q: "What is the first-line pharmacologic treatment for facial Seborrheic Dermatitis?",
        options: ["Oral steroids", "Topical antifungals (e.g., Ketoconazole cream) and low-potency topical corticosteroids (e.g., Hydrocortisone 1% or 2.5%)", "Oral isotretinoin", "Topical 5-fluorouracil"],
        ans: 1,
        exp: "Antifungals target the Malassezia yeast, while low-potency steroids reduce the inflammation."
      }
    ]
  },
  {
    title: "The Heavy Legs",
    scenario: "A 65-year-old woman with a history of obesity, multiple pregnancies, and deep vein thrombosis presents with bilateral itchy rashes on her lower legs.\n\nVitals: Normal. BMI 35.\nPhysical Examination: Bilateral lower legs show pitting edema, prominent varicose veins, and areas of reddish-brown hyperpigmentation. The medial malleoli have weeping, erythematous, scaly plaques.\nLaboratory Results: Ultrasound of the lower extremities shows venous valvular incompetence.",
    disease: "Stasis Dermatitis",
    questions: [
      {
        q: "What is the primary underlying pathophysiology causing Stasis Dermatitis?",
        options: ["Arterial insufficiency", "Chronic venous insufficiency leading to venous hypertension, capillary permeability, and extravasation of fluid and red blood cells into the dermis", "Lymphatic obstruction", "Autoimmune attack"],
        ans: 1,
        exp: "The valves in the veins fail, blood pools in the legs, and the increased hydrostatic pressure pushes fluid and cells into the skin, causing inflammation."
      },
      {
        q: "What is the cause of the characteristic reddish-brown 'cayenne pepper' discoloration (hyperpigmentation) in stasis dermatitis?",
        options: ["Melanin deposition", "Hemosiderin deposition from the breakdown of extravasated red blood cells", "Dirt", "Fungal infection"],
        ans: 1,
        exp: "RBCs leak out of the high-pressure capillaries, die, and the iron (hemosiderin) permanently stains the skin."
      },
      {
        q: "What is the most critical, foundational treatment for Stasis Dermatitis?",
        options: ["Topical antibiotics", "Compression therapy (e.g., compression stockings or Unna boots) and leg elevation", "Surgical amputation", "Oral steroids"],
        ans: 1,
        exp: "Topical steroids help the eczema, but if you do not reverse the venous hypertension with compression, it will never heal."
      }
    ]
  },
  {
    title: "The Dried Riverbed",
    scenario: "An 80-year-old man living in a nursing home in winter presents with extremely itchy lower legs. He takes hot baths every day.\n\nVitals: Normal.\nPhysical Examination: The skin of the bilateral anterior shins is extremely dry, erythematous, and covered in a network of fine fissures resembling 'cracked porcelain' or a dried riverbed.\nLaboratory Results: None.",
    disease: "Asteatotic Eczema (Eczema Craquele)",
    questions: [
      {
        q: "What is the diagnosis?",
        options: ["Cellulitis", "Asteatotic Eczema (Eczema craquelé)", "Psoriasis", "Ichthyosis vulgaris"],
        ans: 1,
        exp: "Asteatotic eczema is caused by severe loss of skin surface lipids, presenting as intensely dry, fissured skin, most commonly on the shins of the elderly in winter."
      },
      {
        q: "What behavioral factor in this patient's history heavily contributed to this condition?",
        options: ["Eating too much salt", "Taking daily hot baths, which strips the natural lipid barrier from the aging skin", "Walking too much", "Wearing wool socks"],
        ans: 1,
        exp: "Hot water and aggressive soap use exacerbate the epidermal barrier dysfunction."
      },
      {
        q: "What is the primary treatment?",
        options: ["Oral antibiotics", "Decreasing bathing frequency, using lukewarm water, and applying thick, greasy emollients (ointments) immediately after bathing to trap moisture", "Topical antifungals", "Phototherapy"],
        ans: 1,
        exp: "Restoring the lipid barrier is curative."
      }
    ]
  },
  {
    title: "The Scratch that Thickened",
    scenario: "A 45-year-old woman presents with a thick, itchy patch of skin on the back of her neck. She admits she rubs and scratches it constantly when she is stressed.\n\nVitals: Normal.\nPhysical Examination: A single, well-demarcated, hyperpigmented, fiercely lichenified (leathery) plaque on the posterior neck. The skin lines are deeply accentuated.\nLaboratory Results: Biopsy shows hyperkeratosis, acanthosis, and a thickened granular layer.",
    disease: "Lichen Simplex Chronicus",
    questions: [
      {
        q: "What is Lichen Simplex Chronicus?",
        options: ["A primary autoimmune disease", "A localized, end-stage hyperproliferation of the epidermis resulting purely from repetitive, chronic rubbing or scratching", "A bacterial infection", "A type of skin cancer"],
        ans: 1,
        exp: "It is essentially a callus that forms because the patient cannot stop scratching a specific spot."
      },
      {
        q: "What must the patient completely stop doing for the plaque to resolve?",
        options: ["Eating gluten", "Scratching and rubbing the area", "Going in the sun", "Using soap"],
        ans: 1,
        exp: "If the mechanical trauma stops, the skin will eventually remodel back to normal."
      },
      {
        q: "What is the most effective topical therapy to break the itch-scratch cycle in this condition?",
        options: ["Hydrocortisone 1%", "High or Ultra-high potency topical corticosteroids (under occlusion if necessary) to penetrate the thick, leathery skin", "Aloe vera", "Salicylic acid only"],
        ans: 1,
        exp: "Weak steroids will not penetrate the massive hyperkeratosis."
      }
    ]
  },
  {
    title: "The Silvery Scales",
    scenario: "A 30-year-old male presents with a chronic rash on his elbows and knees. It is mildly itchy but cosmetically bothersome.\n\nVitals: Normal.\nPhysical Examination: Well-demarcated, thick, erythematous plaques covered by a dense, micaceous (silvery-white) scale located symmetrically on the extensor surfaces of the elbows and knees, and the gluteal cleft.\nLaboratory Results: None.",
    disease: "Plaque Psoriasis",
    questions: [
      {
        q: "What is the classic distribution of Plaque Psoriasis?",
        options: ["Flexural creases", "Extensor surfaces (elbows, knees), scalp, lumbosacral region, and gluteal cleft", "Only the face", "Palms and soles only"],
        ans: 1,
        exp: "Psoriasis favors extensors, while atopic dermatitis favors flexures."
      },
      {
        q: "If you physically scrape off the silvery scale and pinpoint bleeding occurs, what is this clinical sign called?",
        options: ["Nikolsky sign", "Auspitz sign", "Koebner phenomenon", "Darier sign"],
        ans: 1,
        exp: "Auspitz sign occurs because the dermal papillae (and their blood vessels) are elongated and sit very close to the surface due to the thinning of the overlying suprapapillary epidermis."
      },
      {
        q: "What defines the Koebner phenomenon, which is highly characteristic of psoriasis?",
        options: ["Skin clears in the sun", "The development of new psoriatic lesions at sites of skin trauma (e.g., a scratch or surgical scar)", "Bleeding when scales are removed", "Blistering with friction"],
        ans: 1,
        exp: "Trauma induces the inflammatory cascade that creates a new plaque."
      }
    ]
  },
  {
    title: "The Droplet Rash",
    scenario: "A 16-year-old girl presents with a sudden eruption of hundreds of small, scaly spots all over her trunk and limbs. Two weeks ago, she had a severe sore throat and fever.\n\nVitals: Normal.\nPhysical Examination: Widespread, 2-10 mm, 'drop-like' (guttate) erythematous, scaly papules and small plaques primarily on the trunk and proximal extremities.\nLaboratory Results: Anti-streptolysin O (ASO) titer is elevated.",
    disease: "Guttate Psoriasis",
    questions: [
      {
        q: "What is the diagnosis?",
        options: ["Pityriasis rosea", "Guttate Psoriasis", "Tinea versicolor", "Secondary syphilis"],
        ans: 1,
        exp: "Guttate ('drop-like') psoriasis typically presents as an acute, explosive eruption of small plaques."
      },
      {
        q: "What is the classic trigger for Guttate Psoriasis?",
        options: ["Viral URI", "A recent Group A Beta-Hemolytic Streptococcal (GABHS) infection, usually pharyngitis", "Sunburn", "Starting a beta-blocker"],
        ans: 1,
        exp: "Strep acts as a superantigen, triggering the massive T-cell response in genetically susceptible individuals."
      },
      {
        q: "What is the natural history of this specific form of psoriasis?",
        options: ["It is always fatal", "It often spontaneously resolves over weeks to months, though a subset of patients will eventually develop chronic plaque psoriasis", "It leaves deep scars", "It requires lifelong biologics"],
        ans: 1,
        exp: "Many patients have one episode and never get it again, while others transition to classic plaque disease."
      }
    ]
  },
  {
    title: "The Hidden Redness",
    scenario: "A 40-year-old obese female complains of a painful, raw rash under her breasts and in her armpits. She has tried antifungal powders without success.\n\nVitals: BMI 34.\nPhysical Examination: Bright red, sharply demarcated, completely smooth (non-scaly), macerated plaques in the bilateral axillae and inframammary folds. A small, classic scaly plaque is noted in the gluteal cleft.\nLaboratory Results: KOH is negative.",
    disease: "Inverse Psoriasis",
    questions: [
      {
        q: "What is Inverse Psoriasis?",
        options: ["Psoriasis that only affects the nails", "Psoriasis that localizes to the skin folds (intertriginous areas like axillae, inframammary, groin) rather than the extensor surfaces", "Psoriasis caused by medications", "Psoriasis that heals quickly"],
        ans: 1,
        exp: "It is the 'inverse' of the normal extensor distribution."
      },
      {
        q: "Why do the lesions of Inverse Psoriasis typically LACK the classic silvery scale?",
        options: ["It is a different disease", "The warm, moist environment of the skin folds macerates and rubs off the scale, leaving smooth, glazed, red plaques", "The yeast eats the scale", "It hasn't grown long enough"],
        ans: 1,
        exp: "Friction and moisture alter the morphology, making it easily misdiagnosed as fungal intertrigo."
      },
      {
        q: "Why should ultra-high potency topical steroids (like Clobetasol) be AVOIDED or used with extreme caution in Inverse Psoriasis?",
        options: ["They don't work", "Skin folds naturally occlude the medication, drastically increasing systemic absorption and the risk of local side effects (skin atrophy, striae)", "They cause the rash to spread", "They are too expensive"],
        ans: 1,
        exp: "Low to mid-potency steroids, or steroid-sparing agents (calcineurin inhibitors), are preferred in intertriginous areas."
      }
    ]
  },
  {
    title: "The Burning Red Man",
    scenario: "A 55-year-old man with a long history of plaque psoriasis ran out of his systemic steroid medication abruptly. He presents to the ER with chills, malaise, and a burning sensation all over his body.\n\nVitals: T 38.5 C, HR 120, BP 100/60.\nPhysical Examination: Bright red erythema covering >90% of his total body surface area, with diffuse fine scaling. He is shivering despite the room being warm.\nLaboratory Results: WBC 18,000, ESR 80.",
    disease: "Erythrodermic Psoriasis",
    questions: [
      {
        q: "What is the diagnosis?",
        options: ["Guttate Psoriasis", "Erythrodermic Psoriasis", "Toxic Epidermal Necrolysis", "Stevens-Johnson Syndrome"],
        ans: 1,
        exp: "Erythroderma is defined as generalized erythema and scaling affecting >90% of the body surface area."
      },
      {
        q: "What is a major life-threatening complication of erythroderma?",
        options: ["Hair loss", "High-output cardiac failure, severe hypothermia, and massive fluid/protein loss due to total failure of the skin barrier function", "Blindness", "Deafness"],
        ans: 1,
        exp: "The vasodilation of the entire skin surface shunts blood away from the core, causing hypothermia and forcing the heart to pump at high output."
      },
      {
        q: "What was the likely trigger for this acute severe flare?",
        options: ["A new soap", "The abrupt withdrawal of systemic corticosteroids", "Sun exposure", "Drinking alcohol"],
        ans: 1,
        exp: "Systemic steroids are generally contraindicated in psoriasis because abruptly stopping them causes massive, life-threatening rebound flares (erythrodermic or pustular psoriasis)."
      }
    ]
  },
  {
    title: "The Sea of Pus",
    scenario: "A 40-year-old pregnant woman in her 3rd trimester presents with fever, malaise, and a sudden eruption of painful skin lesions.\n\nVitals: T 39.0 C, HR 115.\nPhysical Examination: Widespread sheets of erythema studded with hundreds of 2-3 mm, sterile, yellow pustules that coalesce into 'lakes of pus'.\nLaboratory Results: WBC 25,000 with neutrophilia. Pustule culture is negative for bacteria.",
    disease: "Generalized Pustular Psoriasis (von Zumbusch)",
    questions: [
      {
        q: "What is the diagnosis?",
        options: ["Chickenpox", "Generalized Pustular Psoriasis (von Zumbusch type)", "Impetigo", "Acne fulminans"],
        ans: 1,
        exp: "This is a rare, severe, systemic variant of psoriasis characterized by sterile pustules."
      },
      {
        q: "What is the nature of the pustules in Pustular Psoriasis?",
        options: ["Filled with Staph aureus", "They are entirely STERILE, representing massive neutrophilic infiltration of the epidermis (Kogoj spongiform pustules), not an infection", "Filled with yeast", "Filled with viral particles"],
        ans: 1,
        exp: "Despite looking like a massive infection, antibiotics will do nothing. It is purely inflammatory."
      },
      {
        q: "What specific pregnancy-associated dermatosis is considered a variant of generalized pustular psoriasis?",
        options: ["PUPPP", "Impetigo Herpetiformis", "Pemphigoid gestationis", "Prurigo of pregnancy"],
        ans: 1,
        exp: "Impetigo herpetiformis is a life-threatening form of pustular psoriasis triggered by pregnancy, carrying significant risk for placental insufficiency and fetal death."
      }
    ]
  },
  {
    title: "The Sausage Digits",
    scenario: "A 45-year-old male with a history of psoriasis presents to the rheumatologist. His right index finger and left second toe are uniformly swollen, red, and painful.\n\nVitals: Normal.\nPhysical Examination: Psoriatic plaques on the elbows. The affected digits are diffusely swollen resembling 'sausages'. He has pitting of his fingernails.\nLaboratory Results: Rheumatoid factor is negative.",
    disease: "Psoriatic Arthritis",
    questions: [
      {
        q: "What is the term for the diffuse swelling of an entire digit seen in this patient?",
        options: ["Bouchard node", "Dactylitis ('sausage digit')", "Heberden node", "Swan neck deformity"],
        ans: 1,
        exp: "Dactylitis is caused by profound inflammation of both the joint and the surrounding tenosynovium, highly characteristic of Psoriatic Arthritis."
      },
      {
        q: "Psoriatic arthritis is classified in what family of rheumatologic diseases?",
        options: ["Crystal arthropathies", "Seronegative Spondyloarthropathies (associated with HLA-B27, negative Rheumatoid Factor)", "Connective tissue diseases", "Vasculitis"],
        ans: 1,
        exp: "Like Ankylosing Spondylitis and Reactive Arthritis, it is RF negative and often involves the axial spine."
      },
      {
        q: "What classic radiographic finding is seen in the distal interphalangeal (DIP) joints in advanced Psoriatic Arthritis?",
        options: ["Bamboo spine", "'Pencil-in-cup' deformity (osteolysis of the proximal phalanx with bony proliferation of the distal phalanx)", "Rat bite erosions", "Punched out lesions"],
        ans: 1,
        exp: "The aggressive, destructive bone remodeling creates a sharpened bone resting in a cupped bone."
      }
    ]
  },
  {
    title: "The Pitted Nails",
    scenario: "A 35-year-old female presents to the dermatologist. Her only complaint is that her fingernails look 'ugly.'\n\nVitals: Normal.\nPhysical Examination: The nails show multiple small, ice-pick-like depressions on the surface. Several nails have yellowish-brown spots under the nail plate. Her scalp shows mild silvery scaling.\nLaboratory Results: KOH of the nail clippings is negative.",
    disease: "Psoriatic Nail Disease",
    questions: [
      {
        q: "What is the cause of the small, ice-pick-like depressions (Nail Pitting)?",
        options: ["Fungal infection", "Focal parakeratosis and inflammation in the proximal nail matrix, causing defective, crumbling nail plate formation", "Trauma", "Vitamin deficiency"],
        ans: 1,
        exp: "As the nail grows out, the defective spots slough off, leaving pits."
      },
      {
        q: "What are the yellowish-brown spots under the nail plate called?",
        options: ["Melanoma", "'Oil drop' sign or 'Salmon patches'", "Splinter hemorrhages", "Beau lines"],
        ans: 1,
        exp: "These represent psoriatic plaques located in the nail bed (underneath the plate)."
      },
      {
        q: "The presence of severe psoriatic nail disease is highly correlated with the development of what complication?",
        options: ["Erythroderma", "Psoriatic Arthritis (especially involving the DIP joints)", "Melanoma", "Guttate psoriasis"],
        ans: 1,
        exp: "Patients with nail disease should be heavily screened for joint pain, as the nail matrix is anatomically continuous with the DIP joint entheses."
      }
    ]
  },
  {
    title: "The Blackheads and Whiteheads",
    scenario: "A 14-year-old boy presents for an acne evaluation. He is primarily bothered by the bumps on his forehead and nose. He washes his face daily.\n\nVitals: Normal.\nPhysical Examination: Forehead, nose, and chin demonstrate numerous open comedones (black dots) and closed comedones (small, flesh-colored bumps). There is NO erythema, NO pustules, and NO cysts.\nLaboratory Results: None.",
    disease: "Comedonal Acne Vulgaris",
    questions: [
      {
        q: "What is the fundamental, primary lesion of all acne vulgaris?",
        options: ["The pustule", "The comedone (a plugged pilosebaceous unit)", "The cyst", "The nodule"],
        ans: 1,
        exp: "Every inflammatory acne lesion starts as a microscopic, non-inflammatory comedone."
      },
      {
        q: "Why are open comedones (blackheads) black?",
        options: ["Because they are filled with dirt", "Because the melanin in the oxidized sebum and keratinous plug turns dark when exposed to air", "Because of dried blood", "Because of bacterial pigments"],
        ans: 1,
        exp: "Blackheads are open to the air; oxidation causes the color, not poor hygiene."
      },
      {
        q: "What is the absolute first-line, most essential topical medication for pure comedonal acne?",
        options: ["Topical antibiotics (clindamycin)", "Topical Retinoids (e.g., Tretinoin, Adapalene), which are keratolytic and normalize follicular desquamation", "Oral antibiotics", "Benzoyl peroxide only"],
        ans: 1,
        exp: "Retinoids unclog the pores and prevent new comedones from forming, attacking the root cause."
      }
    ]
  },
  {
    title: "The Red Bumps",
    scenario: "A 16-year-old girl presents with worsening acne. She has been using salicylic acid washes without improvement.\n\nVitals: Normal.\nPhysical Examination: Face, upper chest, and back show numerous erythematous papules and pustules. Scattered comedones are also present. No deep nodules are noted.\nLaboratory Results: None.",
    disease: "Inflammatory (Papulopustular) Acne",
    questions: [
      {
        q: "What specific anaerobic bacterium proliferates in the plugged follicle and drives the inflammation in acne?",
        options: ["Staphylococcus aureus", "Cutibacterium acnes (formerly Propionibacterium acnes)", "Streptococcus pyogenes", "Pseudomonas aeruginosa"],
        ans: 1,
        exp: "C. acnes thrives in the anaerobic, lipid-rich environment of the plugged comedone, releasing lipases that break down sebum into pro-inflammatory free fatty acids."
      },
      {
        q: "What is the rationale for combining Topical Benzoyl Peroxide with a Topical Antibiotic (like Clindamycin)?",
        options: ["To bleach the skin", "Benzoyl peroxide is highly bactericidal and strictly prevents the development of bacterial resistance to the topical antibiotic", "It smells better", "It absorbs oil faster"],
        ans: 1,
        exp: "You should NEVER prescribe topical antibiotics for acne without benzoyl peroxide due to rapid resistance."
      },
      {
        q: "What is the standard, first-line combination therapy for mild-to-moderate inflammatory acne?",
        options: ["Oral isotretinoin", "A topical retinoid (to unplug pores) PLUS a topical antimicrobial (Benzoyl Peroxide +/- Clindamycin to kill C. acnes and reduce inflammation)", "Oral steroids", "Washing the face more"],
        ans: 1,
        exp: "This attacks three pathogenic factors: abnormal desquamation, C. acnes proliferation, and inflammation."
      }
    ]
  },
  {
    title: "The Scarring Cysts",
    scenario: "A 19-year-old male presents with severe, painful acne that has been present for 3 years. He has failed oral doxycycline and topical retinoids.\n\nVitals: Normal.\nPhysical Examination: The face, back, and shoulders are covered in large (>5mm), deep, tender, fluctuant nodules and cysts. There is significant 'ice-pick' and 'boxcar' scarring present.\nLaboratory Results: None.",
    disease: "Severe Nodulocystic Acne",
    questions: [
      {
        q: "Given the failure of standard oral therapy and the presence of severe scarring, what is the clear drug of choice for this patient?",
        options: ["A different oral antibiotic", "Oral Isotretinoin (Accutane)", "Oral corticosteroids", "Chemical peels"],
        ans: 1,
        exp: "Isotretinoin is the only drug that alters the natural course of the disease and induces long-term remission in severe, scarring nodulocystic acne."
      },
      {
        q: "How does Oral Isotretinoin work?",
        options: ["It kills bacteria directly", "It is a potent Vitamin A derivative that massively reduces sebaceous gland size and sebum production, while also normalizing desquamation", "It suppresses the immune system", "It increases sweat production"],
        ans: 1,
        exp: "By eliminating the sebum, it starves C. acnes and stops the entire pathogenic cascade."
      },
      {
        q: "What is the most common, universally expected side effect of Oral Isotretinoin?",
        options: ["Liver failure", "Severe dryness of the lips (cheilitis), skin, and mucous membranes", "Depression", "Hair growth"],
        ans: 1,
        exp: "If a patient on isotretinoin does not have chapped lips, they are likely not absorbing the medication."
      }
    ]
  },
  {
    title: "The Accutane Contract",
    scenario: "A 22-year-old female with severe nodulocystic acne and significant scarring is discussing starting Oral Isotretinoin with her dermatologist.\n\nVitals: Normal.\nPhysical Examination: Nodulocystic acne.\nLaboratory Results: Urine pregnancy test is negative. Liver function tests and lipid panels are normal.",
    disease: "Isotretinoin Teratogenicity and iPLEDGE",
    questions: [
      {
        q: "What is the absolute, most severe risk of Oral Isotretinoin in a female of childbearing potential?",
        options: ["Weight gain", "Severe teratogenicity (massive craniofacial, cardiac, and CNS birth defects)", "Infertility", "Early menopause"],
        ans: 1,
        exp: "Isotretinoin is an extreme teratogen. A single pill can cause catastrophic fetal malformations."
      },
      {
        q: "In the United States, what strict regulatory program must the patient, prescriber, and pharmacist enroll in before starting this medication?",
        options: ["REMS", "iPLEDGE", "VAERS", "MedWatch"],
        ans: 1,
        exp: "iPLEDGE is designed specifically to prevent fetal exposure to isotretinoin."
      },
      {
        q: "What are the specific contraceptive requirements for a female of childbearing potential under iPLEDGE?",
        options: ["Must not have sex", "Must commit to using TWO simultaneous forms of effective contraception for 1 month before, during, and 1 month after therapy, and have monthly negative pregnancy tests", "One form of birth control", "Pull-out method"],
        ans: 1,
        exp: "Absolute adherence to double contraception and monthly testing is mandatory to receive the prescription."
      }
    ]
  },
  {
    title: "The Burrowing Acne",
    scenario: "A 25-year-old male with a history of severe acne presents with massive worsening. He has very deep, painful lesions that seem to connect under the skin.\n\nVitals: Normal.\nPhysical Examination: The chest and back show huge, inflammatory, fluctuant nodules that form communicating sinus tracts. There is foul-smelling purulent discharge and massive disfiguring keloidal scarring. No fever or joint pain.\nLaboratory Results: None.",
    disease: "Acne Conglobata",
    questions: [
      {
        q: "What is the diagnosis?",
        options: ["Acne vulgaris", "Acne Conglobata", "Acne fulminans", "Rosacea"],
        ans: 1,
        exp: "Acne conglobata is a severe, highly inflammatory, eruptive form of nodulocystic acne characterized by burrowing interconnecting abscesses and sinus tracts."
      },
      {
        q: "Acne conglobata is part of the 'Follicular Occlusion Tetrad.' What are the other three diseases?",
        options: ["Psoriasis, Eczema, Rosacea", "Hidradenitis suppurativa, Pilonidal cysts, and Dissecting cellulitis of the scalp", "Lupus, Scleroderma, Dermatomyositis", "None"],
        ans: 1,
        exp: "These four conditions share a common pathogenesis of follicular hyperkeratosis, occlusion, and subsequent rupture/inflammation."
      },
      {
        q: "What is the drug of choice for Acne Conglobata?",
        options: ["Topical benzoyl peroxide", "Oral Isotretinoin (often requiring a brief initial course of systemic steroids to calm the massive inflammation)", "Oral doxycycline", "Topical retinoids"],
        ans: 1,
        exp: "Only isotretinoin can shut down the massive sebaceous activity driving this destructive disease."
      }
    ]
  },
  {
    title: "The Systemic Breakout",
    scenario: "A 15-year-old boy presents to the emergency room. Over the last week, his chest and back erupted in massive, ulcerating, necrotic acne lesions. He also complains of severe bone pain in his clavicles and sternum, fever, and extreme fatigue.\n\nVitals: T 39.5 C, HR 115.\nPhysical Examination: Extremely painful, ulcerated, and crusted necrotic plaques over the trunk. Exquisite tenderness over the sternoclavicular joints.\nLaboratory Results: WBC 22,000. ESR 90. X-ray of the clavicle shows osteolytic lesions.",
    disease: "Acne Fulminans",
    questions: [
      {
        q: "What distinguishes Acne Fulminans from Acne Conglobata?",
        options: ["There is no difference", "Acne fulminans is an acute, immunologically mediated event characterized by abrupt ulcerating acne AND severe systemic symptoms (fever, leukocytosis, polyarthralgia, osteolytic bone lesions)", "Acne fulminans only happens in adults", "Acne fulminans has no scars"],
        ans: 1,
        exp: "Acne fulminans is a systemic inflammatory storm triggered by C. acnes antigens."
      },
      {
        q: "What is the immediate, life-saving treatment for Acne Fulminans?",
        options: ["High-dose oral isotretinoin", "High-dose Systemic Corticosteroids (e.g., Prednisone) to shut down the systemic inflammatory storm", "IV antibiotics", "Surgery"],
        ans: 1,
        exp: "You CANNOT start isotretinoin immediately, as it will paradoxically worsen the massive inflammation. You must quiet the storm with steroids first."
      },
      {
        q: "What bony lesions are classic in Acne Fulminans?",
        options: ["Fractures of the femur", "Sterile osteolytic lesions, most commonly in the sternum, clavicles, and sacroiliac joints (SAPHO syndrome spectrum)", "Bone spurs", "None"],
        ans: 1,
        exp: "The severe bone pain is sterile inflammation, not an infection."
      }
    ]
  },
  {
    title: "The Picked Face",
    scenario: "A 20-year-old female presents complaining of 'terrible acne.' She admits to spending 2 hours a day in front of a magnifying mirror picking at every pore.\n\nVitals: Normal.\nPhysical Examination: The face shows minimal to no actual comedones or pustules. However, there are dozens of crusted, excoriated erosions, linear scratch marks, and hyperpigmented scars distributed symmetrically over the face where she can easily reach.\nLaboratory Results: None.",
    disease: "Acne Excoriee des Jeunes Filles",
    questions: [
      {
        q: "What is the diagnosis?",
        options: ["Severe nodulocystic acne", "Acne Excoriée (des jeunes filles)", "Impetigo", "Rosacea"],
        ans: 1,
        exp: "This is a psychodermatologic condition where the patient obsessively picks at trivial or non-existent acne lesions, creating the primary pathology."
      },
      {
        q: "What underlying psychiatric conditions are frequently associated with this presentation?",
        options: ["Schizophrenia", "Obsessive-compulsive disorder (OCD), anxiety, and body dysmorphic disorder", "Bipolar disorder", "None"],
        ans: 1,
        exp: "The picking is a compulsive behavior to relieve anxiety or perceived imperfections."
      },
      {
        q: "What is an appropriate treatment approach?",
        options: ["Oral isotretinoin", "Psychiatric intervention (CBT) and SSRIs, alongside gentle local wound care", "High-dose antibiotics", "Surgery"],
        ans: 1,
        exp: "Treating the skin with harsh acne meds will often worsen the picking; you must treat the underlying compulsion."
      }
    ]
  },
  {
    title: "The Monomorphic Crop",
    scenario: "A 30-year-old male with severe asthma recently completed a 3-week course of high-dose oral prednisone. He presents with a sudden eruption of 'acne' all over his chest and back. He had clear skin previously.\n\nVitals: Normal.\nPhysical Examination: Widespread eruption on the trunk consisting of hundreds of small, uniform, erythematous papules and pustules all in the exact same stage of development. There are NO comedones.\nLaboratory Results: None.",
    disease: "Drug-Induced (Steroid) Acne",
    questions: [
      {
        q: "What physical exam finding heavily differentiates Steroid-Induced Acne from classic Acne Vulgaris?",
        options: ["It only affects the face", "Steroid acne is monomorphic (all lesions look exactly the same size/stage) and notably lacks true comedones", "It has blackheads", "It has deep cysts"],
        ans: 1,
        exp: "Classic acne is pleomorphic (you see a mix of blackheads, red bumps, and healing scars simultaneously). Steroid acne all erupts at once."
      },
      {
        q: "What is the primary treatment for Steroid-Induced Acne?",
        options: ["Lifelong antibiotics", "Discontinuation of the offending systemic corticosteroid (if medically possible); the rash will spontaneously resolve", "Oral isotretinoin", "Surgery"],
        ans: 1,
        exp: "It is a direct adverse effect of the drug, not a true dysfunction of the pilosebaceous unit."
      },
      {
        q: "Besides systemic corticosteroids, what other common medications can trigger an acneiform eruption?",
        options: ["Aspirin", "Lithium, Isoniazid, Phenytoin, and EGF-receptor inhibitors (e.g., Cetuximab)", "Penicillin", "Beta-blockers"],
        ans: 1,
        exp: "EGFR inhibitors cause a very characteristic, severe acneiform rash that actually correlates with the drug's anti-cancer efficacy."
      }
    ]
  },
  {
    title: "The Newborn Bumps",
    scenario: "A 3-week-old male infant is brought in by anxious parents. The baby has developed a rash on his cheeks and nose. He is otherwise healthy.\n\nVitals: Normal.\nPhysical Examination: Numerous pinpoint erythematous papules and pustules over the cheeks, chin, and forehead. No comedones are visible.\nLaboratory Results: None.",
    disease: "Neonatal Acne (Neonatal Cephalic Pustulosis)",
    questions: [
      {
        q: "What is the most likely diagnosis?",
        options: ["Infantile acne", "Neonatal Acne (Neonatal Cephalic Pustulosis)", "Herpes simplex", "Milia"],
        ans: 1,
        exp: "Occurring in the first month of life, this is an extremely common, benign, self-limited condition."
      },
      {
        q: "Despite the name 'Neonatal Acne', what organism is thought to be the actual trigger for this inflammatory response, distinguishing it from true acne?",
        options: ["Cutibacterium acnes", "Malassezia yeast species colonization", "Staphylococcus aureus", "Candida"],
        ans: 1,
        exp: "It is not a true acne driven by sebum and C. acnes, but rather an inflammatory reaction to yeast on the skin."
      },
      {
        q: "If an infant presents at 6 MONTHS of age with true comedones, deep inflammatory papules, and scarring, what is the diagnosis and significance?",
        options: ["It is still neonatal acne", "Infantile Acne; this is true acne driven by endogenous androgens and carries a high risk for severe acne later in adolescence", "Rosacea", "Allergy"],
        ans: 1,
        exp: "Infantile acne (3-12 months) is much more severe, requires treatment, and is a strong predictor of severe teen acne."
      }
    ]
  },
  {
    title: "The Hormonal Jawline",
    scenario: "A 28-year-old female presents with persistent acne that flares fiercely the week before her period. She also notes recent weight gain, irregular menses, and increased facial hair on her chin.\n\nVitals: BMI 30.\nPhysical Examination: Deep, tender, inflammatory nodules localized strictly to the lower third of the face (jawline, chin, and upper neck). Hirsutism is noted.\nLaboratory Results: Elevated free testosterone and LH:FSH ratio > 2:1.",
    disease: "PCOS-related (Hormonal) Acne",
    questions: [
      {
        q: "What is the classic distribution of hormonal acne in adult women?",
        options: ["Forehead and nose (T-zone)", "The 'U-zone': along the jawline, chin, and upper neck", "The back only", "The chest only"],
        ans: 1,
        exp: "Adult female acne is highly sensitive to androgen fluctuations and heavily targets the lower face."
      },
      {
        q: "What underlying systemic endocrine disorder does this patient likely have?",
        options: ["Hypothyroidism", "Polycystic Ovary Syndrome (PCOS)", "Cushing's syndrome", "Addison's disease"],
        ans: 1,
        exp: "The triad of adult acne, hirsutism, and irregular menses/obesity is the hallmark of PCOS."
      },
      {
        q: "What specific oral medication is highly effective for adult female hormonal acne by blocking androgen receptors?",
        options: ["Isotretinoin", "Spironolactone (an aldosterone antagonist with anti-androgenic properties)", "Doxycycline", "Lithium"],
        ans: 1,
        exp: "Spironolactone directly blocks testosterone from binding to the sebaceous glands, drastically reducing sebum production in females."
      }
    ]
  },
  {
    title: "The Flushing Face",
    scenario: "A 45-year-old fair-skinned female of Celtic descent complains that her face is constantly red. She notes that drinking hot coffee, eating spicy foods, or going out in the sun causes intense, embarrassing facial flushing.\n\nVitals: Normal.\nPhysical Examination: Persistent erythema and numerous prominent telangiectasias (spider veins) over the central face (cheeks, nose, glabella). There are NO papules, pustules, or comedones.\nLaboratory Results: None.",
    disease: "Erythematotelangiectatic Rosacea",
    questions: [
      {
        q: "What is the diagnosis?",
        options: ["Acne vulgaris", "Erythematotelangiectatic Rosacea", "Systemic Lupus Erythematosus (Malar rash)", "Seborrheic dermatitis"],
        ans: 1,
        exp: "This is the classic vascular subtype of rosacea, characterized by vasomotor instability and permanent capillary dilation."
      },
      {
        q: "How does the physical exam of Rosacea classically differentiate it from Acne Vulgaris?",
        options: ["Rosacea is purple", "Rosacea strictly lacks comedones (blackheads/whiteheads) and is dominated by background erythema/flushing", "Rosacea has deep cysts", "Rosacea affects the back"],
        ans: 1,
        exp: "If you see blackheads, it is acne. Rosacea is an inflammatory/vascular disease, not a follicular plugging disease."
      },
      {
        q: "What topical alpha-2 adrenergic agonist can be prescribed to temporarily vasoconstrict the blood vessels and reduce the redness in this patient?",
        options: ["Topical steroids", "Topical Brimonidine or Oxymetazoline", "Topical retinoids", "Topical benzoyl peroxide"],
        ans: 1,
        exp: "These agents clamp down the capillaries, 'blanching' the redness for 8-12 hours."
      }
    ]
  },
  {
    title: "The Red Bumps without Blackheads",
    scenario: "A 50-year-old woman presents complaining of 'adult acne'. She has a red face and multiple small pimples.\n\nVitals: Normal.\nPhysical Examination: Erythema of the central face with dozens of small, dome-shaped erythematous papules and tiny pustules. Crucially, there are zero comedones.\nLaboratory Results: None.",
    disease: "Papulopustular Rosacea",
    questions: [
      {
        q: "What is the diagnosis?",
        options: ["Inflammatory acne", "Papulopustular Rosacea", "Impetigo", "Eczema"],
        ans: 1,
        exp: "This subtype of rosacea features inflammatory bumps that look exactly like acne, but occur on a background of erythema and lack comedones."
      },
      {
        q: "What oral antibiotic, used at sub-antimicrobial anti-inflammatory doses, is highly effective for this condition?",
        options: ["Penicillin", "Doxycycline (often given at a low dose of 40mg daily to strictly utilize its anti-inflammatory effects without altering gut flora)", "Ciprofloxacin", "Amoxicillin"],
        ans: 1,
        exp: "Tetracyclines inhibit matrix metalloproteinases and calm the inflammation driving the papules."
      },
      {
        q: "What topical anti-parasitic cream is highly effective for papulopustular rosacea?",
        options: ["Permethrin", "Ivermectin 1% cream", "Clotrimazole", "Lindane"],
        ans: 1,
        exp: "Ivermectin targets the Demodex mites that are heavily implicated in triggering the inflammatory response in rosacea."
      }
    ]
  },
  {
    title: "The Bulbous Nose",
    scenario: "A 65-year-old male presents for a routine checkup. He has a long history of facial redness. He is profoundly embarrassed by the size and shape of his nose, which has been slowly growing for years.\n\nVitals: Normal.\nPhysical Examination: The nose is massively enlarged, bulbous, lobulated, and purple-red, with grossly thickened skin and gaping, prominent pores.\nLaboratory Results: None.",
    disease: "Phymatous Rosacea (Rhinophyma)",
    questions: [
      {
        q: "What is the medical term for this specific end-stage complication of rosacea?",
        options: ["Gargoylism", "Rhinophyma (Phymatous rosacea)", "Nasal polyp", "Squamous cell carcinoma"],
        ans: 1,
        exp: "Rhinophyma is a severe sebaceous gland hyperplasia and fibrous thickening of the skin of the nose."
      },
      {
        q: "Who predominantly develops Rhinophyma?",
        options: ["Young women", "Older men (despite rosacea being more common overall in women)", "Children", "Pregnant women"],
        ans: 1,
        exp: "For unknown reasons, the massive fibrotic/sebaceous overgrowth is almost exclusively seen in males."
      },
      {
        q: "What is the definitive treatment for advanced Rhinophyma?",
        options: ["Topical antibiotics", "Surgical debulking (via CO2 laser, scalpel, or electrosurgery) to sculpt the nose back to a normal contour", "Oral steroids", "Sunscreen"],
        ans: 1,
        exp: "Once the fibrous tissue is formed, medications will not shrink it. It must be physically removed."
      }
    ]
  },
  {
    title: "The Gritty Eyes",
    scenario: "A 55-year-old female with known facial rosacea presents to the eye clinic. She complains that her eyes constantly feel dry, burn, and feel like 'there is sand in them.' She frequently has red, swollen eyelids.\n\nVitals: Normal.\nPhysical Examination: Bilateral conjunctival injection, crusting at the eyelid margins (blepharitis), and telangiectasias on the eyelid margins. A chalazion is present on the right lower lid.\nLaboratory Results: None.",
    disease: "Ocular Rosacea",
    questions: [
      {
        q: "What is the diagnosis?",
        options: ["Allergic conjunctivitis", "Ocular Rosacea", "Viral pink eye", "Glaucoma"],
        ans: 1,
        exp: "Over 50% of rosacea patients have ocular involvement, which can sometimes precede the skin findings."
      },
      {
        q: "What is the primary pathophysiologic issue causing the 'gritty' feeling in Ocular Rosacea?",
        options: ["Loss of tears", "Meibomian gland dysfunction (the oil glands in the eyelids get clogged and inflamed), leading to rapid evaporation of the tear film and severe dry eye", "Corneal scratching", "Bacterial infection"],
        ans: 1,
        exp: "The meibomian glands are modified sebaceous glands, so they suffer the same inflammation as the facial glands."
      },
      {
        q: "What is a severe, vision-threatening complication of untreated Ocular Rosacea?",
        options: ["Cataracts", "Corneal ulceration and perforation due to severe dryness and chronic inflammation", "Retinal detachment", "Macular degeneration"],
        ans: 1,
        exp: "Severe cases require prompt evaluation by an ophthalmologist."
      }
    ]
  },
  {
    title: "The Rebound Redness",
    scenario: "A 30-year-old female presents with a bright red, burning rash around her mouth. She states she had a small patch of dry skin a month ago and started using her husband's prescription Clobetasol ointment. It helped initially, but now when she stops using it, the rash explodes.\n\nVitals: Normal.\nPhysical Examination: Confluent erythema, papules, and pinpoint pustules clustered heavily around the mouth, sparing a narrow clear zone immediately adjacent to the vermilion border (lips).\nLaboratory Results: None.",
    disease: "Perioral Dermatitis (Steroid Rosacea)",
    questions: [
      {
        q: "What is the classic clinical diagnosis for this specific eruption?",
        options: ["Cold sores", "Perioral Dermatitis", "Impetigo", "Acne"],
        ans: 1,
        exp: "Perioral dermatitis classically presents as a papulopustular eruption around the mouth with a characteristic 'vermilion sparing' zone."
      },
      {
        q: "What is the most common iatrogenic trigger for Perioral Dermatitis?",
        options: ["Antibiotics", "The inappropriate use of mid-to-high potency topical corticosteroids on the face", "Moisturizers", "Sunscreen"],
        ans: 1,
        exp: "Steroids suppress the local immune system allowing Demodex/bacteria to flourish, and cause a severe rebound vasodilation/inflammation when stopped."
      },
      {
        q: "What must be explained to the patient regarding the treatment course?",
        options: ["It will clear in 1 day", "She must immediately stop all topical steroids, and the rash will inevitably GET WORSE (rebound flare) before it gets better with the correct treatment (e.g., oral doxycycline, topical metronidazole)", "She needs stronger steroids", "Surgery is required"],
        ans: 1,
        exp: "Patient counseling is critical, as the 'steroid withdrawal' flare will make them want to use the steroid again."
      }
    ]
  },
  {
    title: "The Potency Ladder",
    scenario: "A medical student is asked to prescribe a topical corticosteroid for a patient's mild facial eczema, and a different steroid for thick psoriasis on the palms.\n\nVitals: Normal.\nPhysical Examination: Mild eczema on the thin skin of the eyelids. Thick hyperkeratotic psoriasis on the thick skin of the palms.\nLaboratory Results: None.",
    disease: "Topical Corticosteroid Pharmacology",
    questions: [
      {
        q: "In the United States, how are topical corticosteroids classified by potency?",
        options: ["Class A to Z", "Class 1 (Ultra-High potency, e.g., Clobetasol 0.05%) to Class 7 (Lowest potency, e.g., Hydrocortisone 1%)", "Class 1 is weakest", "By color"],
        ans: 1,
        exp: "It is crucial to know that Class 1 is the STRONGEST."
      },
      {
        q: "Which class of steroid is appropriate for the thin, highly permeable skin of the face, eyelids, and intertriginous folds to prevent atrophy?",
        options: ["Class 1", "Class 6 or 7 (Low potency, e.g., Desonide or Hydrocortisone)", "Class 2", "Class 3"],
        ans: 1,
        exp: "Using strong steroids on the face rapidly causes skin thinning, telangiectasias, and steroid-induced rosacea."
      },
      {
        q: "Which class of steroid is required to penetrate the thick stratum corneum of the palms and soles?",
        options: ["Class 7", "Class 1 (Ultra-High potency, e.g., Clobetasol, Halobetasol)", "Class 4", "Class 5"],
        ans: 1,
        exp: "Weak steroids will not penetrate the palms and soles at all."
      }
    ]
  },
  {
    title: "The Steroid Sparing Alternative",
    scenario: "A 10-year-old boy has severe, chronic atopic dermatitis affecting his eyelids and face. His dermatologist is worried about the risk of skin atrophy and glaucoma from long-term topical steroid use on the eyelids.\n\nVitals: Normal.\nPhysical Examination: Eczematous plaques on the eyelids and cheeks.\nLaboratory Results: None.",
    disease: "Calcineurin Inhibitors in Atopic Dermatitis",
    questions: [
      {
        q: "What class of topical, steroid-sparing anti-inflammatory medication is highly indicated for sensitive areas like the face and eyelids?",
        options: ["Topical retinoids", "Topical Calcineurin Inhibitors (e.g., Tacrolimus ointment, Pimecrolimus cream)", "Topical antibiotics", "Topical antifungals"],
        ans: 1,
        exp: "These drugs inhibit T-cell activation but have absolutely ZERO risk of causing skin atrophy, striae, or glaucoma."
      },
      {
        q: "What is the most common local side effect patients experience when first applying topical Tacrolimus to inflamed skin?",
        options: ["Bleeding", "A transient, intense burning or stinging sensation at the application site", "Numbness", "Hair loss"],
        ans: 1,
        exp: "Patients must be warned about the burning, which usually subsides after a few days of use as the skin heals."
      },
      {
        q: "What black box warning is associated with topical calcineurin inhibitors, though highly controversial in dermatology?",
        options: ["Heart attack", "A theoretical increased risk of malignancy (lymphoma/skin cancer) based on animal studies and systemic immunosuppression data", "Liver failure", "Kidney failure"],
        ans: 1,
        exp: "Extensive long-term human data has generally failed to show a clinically significant risk with appropriate topical use."
      }
    ]
  },
  {
    title: "The Biologic Target",
    scenario: "A 40-year-old male with severe, widespread plaque psoriasis and psoriatic arthritis has failed topical therapies and oral methotrexate. He is started on Adalimumab (Humira).\n\nVitals: Normal.\nPhysical Examination: Widespread psoriasis. Swollen joints.\nLaboratory Results: Quantiferon-TB Gold is negative.",
    disease: "Biologics in Psoriasis (TNF-alpha)",
    questions: [
      {
        q: "What is the specific immunologic target of Adalimumab, Etanercept, and Infliximab?",
        options: ["IL-17", "Tumor Necrosis Factor alpha (TNF-alpha)", "CD20", "IL-4"],
        ans: 1,
        exp: "TNF-alpha is a master pro-inflammatory cytokine driving both the skin proliferation and joint destruction in psoriasis."
      },
      {
        q: "Why was a Quantiferon-TB Gold (or PPD) test mandatory before starting this medication?",
        options: ["To check for anemia", "TNF-alpha is critical for the maintenance of granulomas; blocking it can cause fatal reactivation of latent Tuberculosis", "To check liver function", "To check for HIV"],
        ans: 1,
        exp: "All patients must be screened for latent TB, Hepatitis B/C, and HIV before starting immunosuppressive biologics."
      },
      {
        q: "TNF-alpha inhibitors are generally contraindicated in patients with what preexisting neurologic condition?",
        options: ["Migraines", "Multiple Sclerosis (or other demyelinating diseases), as TNF blockers can trigger or worsen demyelination", "Parkinson's", "Alzheimer's"],
        ans: 1,
        exp: "They can also exacerbate or induce severe congestive heart failure."
      }
    ]
  },
  {
    title: "The Downstream Blockade",
    scenario: "A 35-year-old female with severe plaque psoriasis is prescribed Secukinumab (Cosentyx). She has no joint pain, but her skin is covered >30% BSA.\n\nVitals: Normal.\nPhysical Examination: Widespread plaques.\nLaboratory Results: None.",
    disease: "Biologics in Psoriasis (IL-17)",
    questions: [
      {
        q: "What specific cytokine does Secukinumab and Ixekizumab target?",
        options: ["TNF-alpha", "Interleukin-17A (IL-17A)", "IL-12", "IL-23"],
        ans: 1,
        exp: "IL-17 is a downstream effector cytokine heavily produced by Th17 cells, playing a massive, highly specific role in psoriatic plaque formation."
      },
      {
        q: "Because IL-17 is vital for mucosal defense against a specific organism, what is a notable risk of taking IL-17 inhibitors?",
        options: ["Strep throat", "Increased risk of mucocutaneous Candidiasis (thrush, yeast infections)", "Tuberculosis", "Herpes"],
        ans: 1,
        exp: "Patients often develop mild, treatable yeast infections while on the drug."
      },
      {
        q: "IL-17 inhibitors should be avoided or used with extreme caution in patients with a personal history of what disease?",
        options: ["Asthma", "Inflammatory Bowel Disease (specifically Crohn's disease), as IL-17 blockade can trigger severe exacerbations of IBD", "Diabetes", "Hypertension"],
        ans: 1,
        exp: "For psoriasis patients with concomitant Crohn's, TNF-alpha inhibitors or IL-12/23 inhibitors (Ustekinumab) are preferred."
      }
    ]
  },
  {
    title: "The Eczema Miracle",
    scenario: "A 25-year-old male with severe, lifelong, refractory atopic dermatitis (covering 60% of his body) is started on a newly approved biologic injection, Dupilumab (Dupixent). Within weeks, his skin is nearly completely clear, and he stops scratching for the first time in his life.\n\nVitals: Normal.\nPhysical Examination: Resolving excoriations.\nLaboratory Results: None.",
    disease: "Biologics in Atopic Dermatitis (Dupilumab)",
    questions: [
      {
        q: "What is the specific immunologic target of Dupilumab?",
        options: ["TNF-alpha", "The Interleukin-4 (IL-4) receptor alpha subunit, which simultaneously blocks both IL-4 and IL-13 signaling", "IL-17", "CD20"],
        ans: 1,
        exp: "IL-4 and IL-13 are the core Th2 cytokines that drive the intense allergic inflammation, itch, and barrier dysfunction in atopic dermatitis."
      },
      {
        q: "Because it targets the Th2 pathway, what other diseases is Dupilumab FDA-approved to treat?",
        options: ["Psoriasis and Rheumatoid Arthritis", "Moderate-to-severe Asthma, Chronic Rhinosinusitis with Nasal Polyps, and Eosinophilic Esophagitis", "Crohn's disease", "Acne"],
        ans: 1,
        exp: "It essentially turns off the 'atopic' side of the immune system."
      },
      {
        q: "What is the most common, unique side effect associated with Dupilumab use?",
        options: ["Tuberculosis", "Conjunctivitis (often requiring ophthalmic steroid drops) and dry eyes", "Liver failure", "Kidney failure"],
        ans: 1,
        exp: "The exact mechanism of Dupilumab-induced conjunctivitis is unknown, but it is very common and manageable."
      }
    ]
  },
  {
    title: "The Light Therapy",
    scenario: "A 28-year-old female with widespread guttate psoriasis wishes to avoid systemic immunosuppressives because she is trying to become pregnant. Her dermatologist recommends coming to the clinic three times a week to stand in a light booth.\n\nVitals: Normal.\nPhysical Examination: Guttate psoriasis.\nLaboratory Results: None.",
    disease: "Phototherapy (NB-UVB)",
    questions: [
      {
        q: "What specific wavelength of ultraviolet light is currently the gold standard for dermatologic phototherapy due to its high efficacy and safety profile?",
        options: ["UVA", "Narrowband UVB (NB-UVB, precisely 311-313 nm)", "UVC", "Infrared"],
        ans: 1,
        exp: "Narrowband UVB provides the therapeutic anti-inflammatory/anti-proliferative benefits of UV light without the deep penetrating, highly carcinogenic risks of UVA."
      },
      {
        q: "How does UV light primarily treat psoriasis?",
        options: ["It burns the skin off", "It induces apoptosis (programmed cell death) of the pathogenic T-cells residing in the skin and slows epidermal hyperproliferation", "It kills bacteria", "It increases Vitamin D"],
        ans: 1,
        exp: "It is essentially targeted, local immunosuppression of the skin."
      },
      {
        q: "Why is NB-UVB an excellent choice for this specific patient?",
        options: ["It is fast", "It is completely safe during pregnancy and breastfeeding, unlike oral retinoids or methotrexate", "It prevents stretch marks", "It treats morning sickness"],
        ans: 1,
        exp: "It is the treatment of choice for pregnant patients with severe psoriasis."
      }
    ]
  },
  {
    title: "The Blue-Gray Scars",
    scenario: "A 19-year-old male has been taking an oral antibiotic for his acne for the past 2 years. His acne has improved, but he presents to the clinic concerned about a strange, dirty-looking discoloration on his shins, face, and the sclera of his eyes.\n\nVitals: Normal.\nPhysical Examination: Muddy, blue-gray hyperpigmentation located on the anterior shins, the hard palate, and the sclerae.\nLaboratory Results: None.",
    disease: "Minocycline Induced Hyperpigmentation",
    questions: [
      {
        q: "What oral antibiotic, commonly used for acne, is the classic culprit for this specific adverse effect?",
        options: ["Doxycycline", "Minocycline", "Amoxicillin", "Erythromycin"],
        ans: 1,
        exp: "Minocycline can deposit iron-containing drug complexes in the skin, bone, teeth, and sclera, especially with long-term use."
      },
      {
        q: "What rare, severe autoimmune condition can also be triggered by long-term Minocycline use?",
        options: ["Multiple Sclerosis", "Drug-induced Lupus Erythematosus (DILE) and Autoimmune Hepatitis", "Rheumatoid arthritis", "Type 1 Diabetes"],
        ans: 1,
        exp: "Patients may present with a positive ANA, joint pain, and elevated liver enzymes."
      },
      {
        q: "Unlike its sister drug doxycycline, minocycline is uniquely known to cause what neurologic side effect?",
        options: ["Seizures", "Vestibular toxicity (dizziness, vertigo, ataxia, tinnitus)", "Blindness", "Paralysis"],
        ans: 1,
        exp: "Minocycline is highly lipophilic and crosses the blood-brain barrier easily."
      }
    ]
  },
  {
    title: "The Peeling Face",
    scenario: "A 15-year-old girl was prescribed topical Tretinoin cream for her comedonal acne. She returns one week later furious. Her face is bright red, burning, peeling, and her acne looks worse.\n\nVitals: Normal.\nPhysical Examination: Diffuse erythema, dryness, and fine desquamation over the entire face.\nLaboratory Results: None.",
    disease: "Retinoid Dermatitis",
    questions: [
      {
        q: "What is the diagnosis?",
        options: ["Allergic reaction", "Retinoid Dermatitis (a highly expected irritant contact dermatitis from initiating topical retinoids)", "Bacterial infection", "Rosacea"],
        ans: 1,
        exp: "This is the most common reason patients quit using their acne medication."
      },
      {
        q: "What is the correct counseling regarding the application of topical retinoids to prevent this?",
        options: ["Apply it thickly twice a day", "Apply a pea-sized amount to the entire face ONLY at night, strictly avoiding the eyes/corners of the mouth, and use a moisturizer alongside it", "Wash it off after 5 minutes", "Apply it only to active pimples"],
        ans: 1,
        exp: "Retinoids are photosensitive and highly irritating. They must be titrated up slowly (e.g., every other night initially)."
      },
      {
        q: "Why do patients often think their acne is 'getting worse' in the first few weeks of retinoid use?",
        options: ["It causes infections", "The keratolytic action accelerates the maturation of existing microcomedones, bringing all the invisible, underlying acne to the surface at once ('purging')", "It causes cysts", "It doesn't work"],
        ans: 1,
        exp: "Patients must be counseled to push through the first 4-6 weeks to see the clearing effect."
      }
    ]
  },
  {
    title: "The Demodex Mite",
    scenario: "A 40-year-old male with a suppressed immune system (kidney transplant) presents with a fierce, unilateral papulopustular eruption on his right cheek. It resembles severe rosacea but is very itchy, and traditional rosacea therapies have failed.\n\nVitals: Normal.\nPhysical Examination: Unilateral grouping of follicular papules and pustules on an erythematous base on the right cheek. A skin scraping is performed.\nLaboratory Results: KOH prep shows massive numbers of microscopic, cigar-shaped mites with 8 stubby legs living inside the hair follicles.",
    disease: "Demodex Folliculitis",
    questions: [
      {
        q: "What organism is identified on the scraping?",
        options: ["Sarcoptes scabiei", "Demodex folliculorum (or brevis)", "Pediculus humanus", "Candida"],
        ans: 1,
        exp: "Demodex mites are normal commensal flora of human facial hair follicles, but they can overproliferate massively in immunosuppression or local steroid use, causing severe inflammation."
      },
      {
        q: "How does Demodex folliculitis clinically differ from typical papulopustular rosacea?",
        options: ["It doesn't", "It is often intensely itchy, frequently unilateral or asymmetric, and features a fine, spiky, 'frosty' scale sticking out of the hair follicles", "It has blackheads", "It only affects the nose"],
        ans: 1,
        exp: "The sheer volume of mites protruding from the follicles gives a rough, sandpaper texture."
      },
      {
        q: "What is the definitive topical treatment?",
        options: ["Hydrocortisone", "Topical anti-parasitics like Ivermectin 1% cream or Permethrin 5% cream", "Benzoyl peroxide", "Salicylic acid"],
        ans: 1,
        exp: "You must kill the mites to stop the inflammatory reaction."
      }
    ]
  },
  {
    title: "The Tar Bath",
    scenario: "A 55-year-old man with chronic plaque psoriasis refuses biologic injections and phototherapy. He asks for an 'old school' topical treatment his grandfather used.\n\nVitals: Normal.\nPhysical Examination: Thick plaques on elbows.\nLaboratory Results: None.",
    disease: "Coal Tar Therapy for Psoriasis",
    questions: [
      {
        q: "What classic, traditional topical agent is known to slow epidermal proliferation and reduce inflammation in psoriasis, despite its strong odor and staining properties?",
        options: ["Vaseline", "Coal Tar (often compounded in ointments or shampoos)", "Olive oil", "Apple cider vinegar"],
        ans: 1,
        exp: "Before steroids and biologics, Goeckerman therapy (Coal tar + UV light) was the gold standard inpatient treatment for psoriasis."
      },
      {
        q: "How does Coal Tar work?",
        options: ["It kills bacteria", "It contains thousands of hydrocarbon compounds that suppress DNA synthesis (anti-mitotic) and reduce scaling", "It bleaches the skin", "It increases blood flow"],
        ans: 1,
        exp: "It physically slows down the hyperproliferating keratinocytes."
      },
      {
        q: "What is a known, significant side effect of applying Coal Tar to the skin?",
        options: ["Skin thinning", "Folliculitis (tar acne) and severe photosensitivity", "Hair loss", "Bleeding"],
        ans: 1,
        exp: "It irritates the hair follicles and makes the skin highly susceptible to sunburn."
      }
    ]
  }
];

let sql = `-- ENT (Otolaryngology) / Dermatology: Common Dermatoses
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: derm-common-dermatoses
-- Sourced/Inspired by: Fitzpatrick's, Andrews, Bolognia, Habif

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'derm-common-dermatoses' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'derm-common-dermatoses';
    END IF;

    -- CLEAN SLATE: Clear existing data for this topic to ensure a fresh, consistent upload
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

`;
const p2Cases = require('./generate_derm_p2.js');
cases.push(...p2Cases);

// Ensure EXACTLY 50 cases, no redundancy
let finalCases = cases.slice(0, 50);

finalCases.forEach((c, idx) => {
  let caseNum = (idx + 1).toString().padStart(2, '0');
  
  let scenarioEscaped = c.scenario.replace(/'/g, "''");
  let diseaseEscaped = c.disease.replace(/'/g, "''");
  let titleEscaped = c.title.replace(/'/g, "''");

  sql += `    ---------------------------------------------------------------------------
    -- CASE ${caseNum}: ${diseaseEscaped}
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = '${titleEscaped}' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, '${titleEscaped}', '${scenarioEscaped}', ${idx + 1}) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = '${scenarioEscaped}', "order" = ${idx + 1} WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
`;

  c.questions.forEach((q, qIdx) => {
    let questionEscaped = q.q.replace(/'/g, "''");
    let optionsJson = JSON.stringify(q.options);
    let optionsEscaped = optionsJson.replace(/'/g, "''");
    let expEscaped = q.exp.replace(/'/g, "''");
    
    let line = `    (v_case_id, '${questionEscaped}', '${optionsEscaped}', ${q.ans}, '${expEscaped}')`;
    if (qIdx === c.questions.length - 1) {
      line += `;`;
    } else {
      line += `,`;
    }
    sql += line + '\n';
  });
  sql += '\n';
});

sql += `END $$;
COMMIT;
`;

fs.writeFileSync('c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\derm_common_dermatoses_FIXED_50.sql', sql);
console.log("Successfully wrote derm_common_dermatoses_caseblocks_50.sql!");
