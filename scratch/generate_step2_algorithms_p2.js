module.exports = [
  {
    title: "The Rapidly Growing 'Nodule' on the Leg",
    scenario: "A 60-year-old male presents with a painful, firm red nodule on his shin that has grown to 2 cm in just 6 weeks.\n\nVitals: Normal.\nPhysical Examination: A dome-shaped, firm, erythematous nodule with a central 'keratinous plug' (crater-like center).\nLaboratory Results: Biopsy shows well-differentiated squamous epithelium.",
    disease: "Keratoacanthoma (KA)",
    questions: [
      {
        q: "What is the characteristic clinical behavior of a Keratoacanthoma?",
        options: ["Slowly progressive growth over years", "Rapid initial growth over weeks followed by potential spontaneous regression", "Never regresses", "Metastasizes early"],
        ans: 1,
        exp: "KAs are known for their 'volcano-like' rapid growth and potential to disappear, but they are often treated as SCCs."
      },
      {
        q: "How should a Keratoacanthoma be managed in clinical practice?",
        options: ["Observation to see if it regresses", "Complete surgical excision (similar to Squamous Cell Carcinoma)", "Cryotherapy only", "Topical antibiotics"],
        ans: 1,
        exp: "Since it is histologically difficult to distinguish KA from a well-differentiated SCC, the standard management is excision."
      },
      {
        q: "Which of the following is the most likely risk factor for KA?",
        options: ["Smoking", "UV radiation and chemical carcinogens", "Viruses", "Low fiber diet"],
        ans: 1,
        exp: "Sun exposure is the primary driver."
      }
    ]
  },
  {
    title: "The Itchy Patient with Weight Loss",
    scenario: "A 70-year-old male presents with generalized itching (pruritus) that has kept him awake at night for 3 months. He has no visible rash. He has also lost 10 lbs.\n\nVitals: Normal.\nPhysical Examination: Normal, except for multiple scratch marks (excoriations) on the back and limbs.\nLaboratory Results: Hemoglobin 10.0 (Low), Ferritin 8 (Low). Chest X-ray is normal.",
    disease: "Pruritus of Internal Malignancy/Systemic Disease",
    questions: [
      {
        q: "When a patient presents with generalized pruritus WITHOUT a primary skin rash, what is the best initial approach?",
        options: ["Start topical steroids", "Perform a thorough systemic workup (CBC, BMP, LFTs, TSH, Chest X-ray, and Iron studies)", "Assume it's dry skin and give moisturizers", "Biopsy the normal skin"],
        ans: 1,
        exp: "Generalized pruritus without rash is a 'systemic itch' and requires evaluation for renal, hepatic, endocrine, or hematologic disease."
      },
      {
        q: "The patient's low iron (iron deficiency anemia) is most commonly associated with which malignancy in an older male?",
        options: ["Lung cancer", "Colorectal cancer (Gastrointestinal blood loss)", "Leukemia", "Skin cancer"],
        ans: 1,
        exp: "Iron deficiency in an older adult is 'colon cancer until proven otherwise'."
      },
      {
        q: "Which systemic condition is notoriously associated with 'aquagenic pruritus' (itching after a hot shower)?",
        options: ["Diabetes", "Polycythemia Vera", "Hypothyroidism", "Lupus"],
        ans: 1,
        exp: "This is a classic USMLE Step 2 'buzzword' association."
      }
    ]
  },
  {
    title: "The Purpuric Patient",
    scenario: "A 40-year-old woman presents with many small 'purple dots' on her lower legs. She was recently treated for a sore throat.\n\nVitals: Normal.\nPhysical Examination: Multiple 2-4 mm palpable purpura on the bilateral shins and ankles. Abdominal exam is normal.\nLaboratory Results: UA shows 2+ blood and 1+ protein. Platelet count is normal.",
    disease: "Leukocytoclastic Vasculitis (LCV)",
    questions: [
      {
        q: "What is the 'Best Initial Test' to confirm the diagnosis of small-vessel vasculitis?",
        options: ["Blood cultures", "Skin biopsy (Punch biopsy)", "ANA", "Chest X-ray"],
        ans: 1,
        exp: "A skin biopsy is required to see the characteristic neutrophilic inflammation of the vessel walls (LCV)."
      },
      {
        q: "Given the urine findings (hematuria/proteinuria), what is the most important next step?",
        options: ["More skin biopsies", "Evaluation for systemic involvement (Renal workup with Cr and potentially a renal biopsy)", "Check for vitamin deficiency", "Stop all salt intake"],
        ans: 1,
        exp: "Purpura + Hematuria suggests a systemic vasculitis affecting both skin and kidneys."
      },
      {
        q: "Which type of vasculitis is most associated with Hepatitis C infection?",
        options: ["GPA", "Mixed Cryoglobulinemia", "HSP", "Kawasaki"],
        ans: 1,
        exp: "Cryoglobulinemic vasculitis often presents with purpura and is strongly linked to chronic Hep C."
      }
    ]
  },
  {
    title: "The Sudden Facial Pain and Blisters",
    scenario: "A 70-year-old male with a history of lymphoma presents with a very painful rash on his forehead that involves the tip of his nose.\n\nVitals: Normal.\nPhysical Examination: Clusters of vesicles and crusts in the V1 distribution. A prominent vesicle is seen on the tip of the nose (Hutchinson sign).\nLaboratory Results: None.",
    disease: "Herpes Zoster Ophthalmicus (HZO)",
    questions: [
      {
        q: "What is the significance of the Hutchinson sign (vesicle on the nose tip)?",
        options: ["It means the rash is healing", "It indicates involvement of the nasociliary nerve, which also supplies the eye", "It is caused by a different virus", "None"],
        ans: 1,
        exp: "The nasociliary nerve is a branch of V1; its involvement highly correlates with ocular zoster."
      },
      {
        q: "What is the most important immediate step in management?",
        options: ["Start oral Valacyclovir", "Urgent slit-lamp examination by an ophthalmologist", "Topical steroids to the eye", "Wait for the rash to crust over"],
        ans: 1,
        exp: "Identifying early keratitis or uveitis is critical to prevent permanent vision loss."
      },
      {
        q: "Which medication should be AVOIDED for the eye unless directed by an ophthalmologist?",
        options: ["Artificial tears", "Topical corticosteroids (can worsen HSV/VZV keratitis if not monitored)", "Topical antibiotics", "None"],
        ans: 1,
        exp: "Indiscriminate use of topical steroids in the eye can be dangerous."
      }
    ]
  },
  {
    title: "The Red Eyes and the Skin Pain",
    scenario: "A patient presents with a severe rash and 'skin pain' 2 weeks after starting Carbamazepine. She also has a fever and mouth sores.\n\nVitals: T 38.8 C, BP 90/60 mmHg.\nPhysical Examination: Dusky, erythematous macules that are beginning to slough. The lips are severely eroded with bleeding. Nikolsky sign is positive. Approximately 15% of the body surface area (BSA) is involved.\nLaboratory Results: None.",
    disease: "SJS/TEN Management Algorithm",
    questions: [
      {
        q: "What is the most critical first step in management?",
        options: ["Give high-dose steroids", "Identify and immediately discontinue the suspected offending drug (Carbamazepine)", "Wait for a biopsy result", "Give IVIG"],
        ans: 1,
        exp: "Prompt withdrawal of the culprit drug is the single most important factor in survival."
      },
      {
        q: "Where should this patient be ideally managed?",
        options: ["General medical floor", "Intensive Care Unit or Burn Unit", "Home with follow-up", "Outpatient dermatology clinic"],
        ans: 1,
        exp: "SJS/TEN requires specialized care for fluid balance, wound management, and infection control, similar to large burns."
      },
      {
        q: "What is the major long-term complication of SJS/TEN if the eyes are involved?",
        options: ["Glaucoma", "Ocular scarring, symblepharon, and blindness", "Cataracts", "None"],
        ans: 1,
        exp: "Aggressive ophthalmologic care is required to prevent permanent ocular sequelae."
      }
    ]
  },
  {
    title: "The Symmetric Leg Redness (A Trap)",
    scenario: "A 60-year-old male with chronic heart failure presents with redness, warmth, and swelling of both lower legs. He has been told he has 'recurrent cellulitis' that never goes away with antibiotics.\n\nVitals: Normal.\nPhysical Examination: Bilateral, symmetric erythema and 'woody' induration of the lower legs. Pitting edema is present. No fever or elevated WBC.\nLaboratory Results: None.",
    disease: "Stasis Dermatitis (Pseudocellulitis)",
    questions: [
      {
        q: "What is the most likely reason this patient's 'cellulitis' is not responding to antibiotics?",
        options: ["Resistance to antibiotics", "The diagnosis is actually Stasis Dermatitis (due to venous insufficiency), not cellulitis", "It is a fungal infection", "None"],
        ans: 1,
        exp: "Cellulitis is almost always unilateral. Bilateral, symmetric redness is a classic 'Step' trap for stasis dermatitis."
      },
      {
        q: "What is the 'Best Next Step' in management for this patient?",
        options: ["Switch to IV antibiotics", "Leg elevation and compression stockings", "Surgical debridement", "Topical antifungals"],
        ans: 1,
        exp: "Management of the underlying venous hypertension is the primary treatment."
      },
      {
        q: "What is the term for the chronic skin changes (thickened, 'inverted champagne bottle' leg) seen in advanced venous insufficiency?",
        options: ["Lipodermatosclerosis", "Cellulitis", "Erysipelas", "Necrotizing fasciitis"],
        ans: 0,
        exp: "This represents chronic fibrotic changes in the skin and subcutaneous fat."
      }
    ]
  },
  {
    title: "The Itchy Child and the Dog",
    scenario: "A 10-year-old boy presents with an itchy, scaly rash on his arm. His family recently got a new puppy.\n\nVitals: Normal.\nPhysical Examination: An annular erythematous plaque with a scaly, active border on the forearm.\nLaboratory Results: KOH prep shows hyphae.",
    disease: "Tinea Corporis",
    questions: [
      {
        q: "What is the most common source of infection in this case?",
        options: ["Human-to-human contact", "Zoonotic transmission from the new puppy (e.g., Microsporum canis)", "Soil", "Dirty clothes"],
        ans: 1,
        exp: "New pets are a frequent source of tinea corporis in children."
      },
      {
        q: "What is the best initial treatment?",
        options: ["Oral Griseofulvin", "Topical Clotrimazole or Terbinafine cream", "Topical Nystatin", "Topical Betamethasone"],
        ans: 1,
        exp: "Topical antifungals are first-line for limited tinea corporis."
      },
      {
        q: "Should the puppy be evaluated?",
        options: ["No, animals don't get fungus", "Yes, the pet should be seen by a veterinarian to prevent reinfection of the family", "Only if the dog is scratching", "None"],
        ans: 1,
        exp: "Treating the reservoir is essential for eradication."
      }
    ]
  },
  {
    title: "The Painful Mouth and the Tense Blister (Management)",
    scenario: "An 80-year-old female presents with widespread tense blisters and severe itching. She has multiple comorbidities and is at high risk for infection.\n\nVitals: Normal.\nPhysical Examination: Multiple large, tense bullae. Nikolsky negative.\nLaboratory Results: Biopsy and DIF confirm Bullous Pemphigoid.",
    disease: "Bullous Pemphigoid Management",
    questions: [
      {
        q: "Given her high risk for systemic side effects, what is a preferred first-line treatment for widespread Bullous Pemphigoid?",
        options: ["High-dose oral Prednisone", "Whole-body application of high-potency topical corticosteroids (e.g., Clobetasol)", "Methotrexate", "Observation"],
        ans: 1,
        exp: "Large-scale trials have shown that topical Clobetasol is as effective as oral Prednisone for BP but with significantly lower mortality and fewer side effects."
      },
      {
        q: "What is the primary goal of treatment in this elderly patient?",
        options: ["Complete cure with no maintenance", "Disease control with the minimum effective dose of immunosuppression", "Immediate surgical removal of all blisters", "None"],
        ans: 1,
        exp: "BP is often chronic and requires balanced management to avoid iatrogenic complications."
      },
      {
        q: "Which medication can be used as a 'steroid-sparing' agent in chronic Bullous Pemphigoid?",
        options: ["Azathioprine or Mycophenolate mofetil", "Penicillin", "Acyclovir", "None"],
        ans: 0,
        exp: "Steroid-sparing agents help reduce the long-term burden of corticosteroids."
      }
    ]
  },
  {
    title: "The Rapidly Progressing Painful Leg",
    scenario: "A 45-year-old diabetic male presents with severe pain in his right leg that is 'out of proportion' to the physical exam. He has a high fever and is feeling dizzy.\n\nVitals: T 39.5 C, BP 85/50, HR 125.\nPhysical Examination: The skin is dusky-red and warm, but there is noticeable 'crepitus' (crunching feeling) on palpation. The area is rapidly becoming necrotic.\nLaboratory Results: WBC 30,000. CT shows gas in the deep tissue planes.",
    disease: "Necrotizing Fasciitis",
    questions: [
      {
        q: "What is the 'Best Next Step' in the management of suspected necrotizing fasciitis?",
        options: ["Start IV antibiotics and wait for response", "Immediate surgical consultation for emergent debridement and exploration", "MRI of the leg", "Biopsy of the skin"],
        ans: 1,
        exp: "Necrotizing fasciitis is a surgical emergency. Delaying surgery for imaging or antibiotic response increases mortality."
      },
      {
        q: "What does 'pain out of proportion to exam' classically signify in this context?",
        options: ["Malingering", "Deep tissue involvement and nerve irritation/necrosis beneath the surface", "Anxiety", "None"],
        ans: 1,
        exp: "This is a key early clinical warning sign for necrotizing infections."
      },
      {
        q: "The presence of crepitus indicates what?",
        options: ["Broken bone", "Gas-producing organisms (e.g., Clostridium or polymicrobial infection)", "Normal finding", "None"],
        ans: 1,
        exp: "Crepitus reflects gas formation in the soft tissues."
      }
    ]
  },
  {
    title: "The Scaly Patch and the HIV Link",
    scenario: "A 30-year-old male presents with severe 'dandruff' and a red, scaly rash on his face. He also mentions having recurrent pneumonia.\n\nVitals: Normal.\nPhysical Examination: Greasy, yellow scale on the scalp, eyebrows, and nasolabial folds. The rash is unusually widespread, involving the chest and groin.\nLaboratory Results: None.",
    disease: "Severe Seborrheic Dermatitis (HIV sign)",
    questions: [
      {
        q: "What is the most appropriate diagnostic step for this patient?",
        options: ["Fungal culture of the skin", "HIV testing", "Skin biopsy", "Liver function tests"],
        ans: 1,
        exp: "Severe, sudden, or refractory seborrheic dermatitis is a classic 'Step 2' indicator for HIV screening."
      },
      {
        q: "What is the first-line treatment for the skin rash?",
        options: ["Oral Prednisone", "Topical Ketoconazole and low-potency topical steroids", "Oral Griseofulvin", "None"],
        ans: 1,
        exp: "Standard treatment for seborrheic dermatitis is still effective, but the underlying immune status must be addressed."
      },
      {
        q: "Which other skin condition is commonly seen alongside seborrheic dermatitis in HIV patients?",
        options: ["Psoriasis", "Oral Hairy Leukoplakia (EBV-related)", "Acne", "Rosacea"],
        ans: 1,
        exp: "HIV is associated with a wide range of dermatologic clues."
      }
    ]
  },
  {
    title: "The Suspect Patch on the Leg",
    scenario: "A 60-year-old male presents with a flat, red, scaly patch on his lower leg that has been present for a year and does not respond to moisturizers.\n\nVitals: Normal.\nPhysical Examination: A well-demarcated, erythematous scaly plaque. No nodules are felt.\nLaboratory Results: Biopsy shows full-thickness keratinocyte atypia without invasion into the dermis.",
    disease: "Squamous Cell Carcinoma In Situ (Bowen''s Disease)",
    questions: [
      {
        q: "What is the diagnosis for SCC that is confined to the epidermis?",
        options: ["Actinic Keratosis", "Bowen's Disease (SCC in situ)", "Invasive SCC", "Basal Cell Carcinoma"],
        ans: 1,
        exp: "Bowen's disease is the 'pre-invasive' form of SCC."
      },
      {
        q: "What is the best initial treatment for a single lesion of Bowen's disease?",
        options: ["Topical antibiotics", "Surgical excision, Cryotherapy, or Topical 5-Fluorouracil", "Chemotherapy", "Wait and watch"],
        ans: 1,
        exp: "There are multiple effective options depending on the site and size."
      },
      {
        q: "If the biopsy had shown 'invasion into the dermis', how would the management change?",
        options: ["It wouldn't", "It would require wider margins and evaluation for high-risk features/metastasis", "Only topical therapy would be needed", "None"],
        ans: 1,
        exp: "Invasive SCC requires more aggressive management."
      }
    ]
  },
  {
    title: "The Red-Faced Alcoholic",
    scenario: "A 50-year-old male with a history of alcohol use disorder presents with a red, 'swollen' nose that has become lumpy over time.\n\nVitals: Normal.\nPhysical Examination: Marked hypertrophy and irregular thickening of the skin of the nose with prominent pores (Rhinophyma). Central facial erythema and telangiectasias.\nLaboratory Results: None.",
    disease: "Rhinophyma (Advanced Rosacea)",
    questions: [
      {
        q: "Rhinophyma is a subtype of which condition?",
        options: ["Acne", "Rosacea (Phymatous subtype)", "Skin cancer", "Infection"],
        ans: 1,
        exp: "It represents advanced sebaceous gland hyperplasia and fibrosis in rosacea."
      },
      {
        q: "Does medical therapy (e.g., Metronidazole) typically reverse rhinophyma?",
        options: ["Yes", "No, surgical intervention (e.g., CO2 laser or surgical paring) is usually required for cosmetic correction", "Only if combined with alcohol", "None"],
        ans: 1,
        exp: "Fibrotic changes do not respond well to medications."
      },
      {
        q: "Is rhinophyma caused by alcohol consumption?",
        options: ["Yes, exclusively", "No, but alcohol can exacerbate the underlying rosacea and flushing", "Alcohol prevents it", "None"],
        ans: 1,
        exp: "The 'drinker's nose' is a common misconception; alcohol is a trigger, not the cause."
      }
    ]
  },
  {
    title: "The Itchy Groin",
    scenario: "A 20-year-old male presents with an itchy rash in his groin. He has been using over-the-counter Clotrimazole for a week with no improvement.\n\nVitals: Normal.\nPhysical Examination: Well-demarcated, reddish-brown patches in the inguinal folds. Under a Wood's lamp, the area shows a 'coral-red' fluorescence.\nLaboratory Results: KOH prep is negative for hyphae.",
    disease: "Erythrasma",
    questions: [
      {
        q: "What is the causative organism of Erythrasma?",
        options: ["Trichophyton rubrum (Fungus)", "Corynebacterium minutissimum (Bacterium)", "Candida albicans", "Staphylococcus aureus"],
        ans: 1,
        exp: "Erythrasma is a superficial bacterial infection, which explains why it doesn't respond to antifungals."
      },
      {
        q: "The 'coral-red' fluorescence is due to the production of what by the bacteria?",
        options: ["Pus", "Porphyrins", "Chlorophyll", "None"],
        ans: 1,
        exp: "The bacteria produce porphyrins that fluoresce under UVA light."
      },
      {
        q: "What is the best initial treatment for Erythrasma?",
        options: ["Topical Clotrimazole", "Topical Erythromycin or Clindamycin", "Oral Fluconazole", "Topical Steroids"],
        ans: 1,
        exp: "Topical antibiotics are highly effective."
      }
    ]
  },
  {
    title: "The Scaly Hand and the Foot",
    scenario: "A 40-year-old male presents with scaly skin on his left palm and both of his feet. He has had this for years.\n\nVitals: Normal.\nPhysical Examination: Diffuse scaling and thickening (hyperkeratosis) of the left palm and the soles of both feet (Two-foot, one-hand syndrome).\nLaboratory Results: KOH prep of the scale shows hyphae.",
    disease: "Tinea Manuum and Pedis",
    questions: [
      {
        q: "What is the 'Two-foot, one-hand syndrome'?",
        options: ["A genetic disorder", "A classic clinical pattern of dermatophyte infection (Tinea)", "A type of eczema", "None"],
        ans: 1,
        exp: "This asymmetric pattern is a high-yield diagnostic clue for fungus."
      },
      {
        q: "What is the most common causative organism?",
        options: ["Trichophyton rubrum", "Candida", "Staph aureus", "None"],
        ans: 0,
        exp: "T. rubrum is the leading cause of chronic dermatophytosis."
      },
      {
        q: "Which associated condition should be treated to prevent recurrence?",
        options: ["Diabetes", "Onychomycosis (nail fungus), which often acts as a reservoir", "Heart failure", "None"],
        ans: 1,
        exp: "Reservoirs must be cleared to avoid 're-seeding' the skin."
      }
    ]
  },
  {
    title: "The Sudden Loss of All Hair",
    scenario: "A 25-year-old male with a history of Hashimoto thyroiditis presents with complete loss of all hair on his scalp, eyebrows, and eyelashes over 3 months.\n\nVitals: Normal.\nPhysical Examination: Total absence of hair on the scalp and face. The skin is smooth and non-inflammatory.\nLaboratory Results: TSH is slightly elevated.",
    disease: "Alopecia Universalis",
    questions: [
      {
        q: "How is this condition classified?",
        options: ["Alopecia Areata", "Alopecia Totalis (Scalp only)", "Alopecia Universalis (Total body hair loss)", "Telogen Effluvium"],
        ans: 2,
        exp: "This is the most severe end of the alopecia areata spectrum."
      },
      {
        q: "What is the first-line treatment for such extensive hair loss?",
        options: ["Topical Minoxidil", "Systemic therapy (e.g., JAK inhibitors, high-dose steroids, or contact immunotherapy) as topicals/injections are usually impractical", "Antibiotics", "None"],
        ans: 1,
        exp: "Widespread disease requires systemic approaches. JAK inhibitors have recently shown significant efficacy."
      },
      {
        q: "Is there a chance for hair regrowth?",
        options: ["Yes, but the prognosis is generally poor for alopecia universalis compared to patchy disease", "No, it is permanent", "Only if the thyroid is treated", "None"],
        ans: 0,
        exp: "While regrowth can occur, universalis has high recurrence rates and is difficult to treat."
      }
    ]
  },
  {
    title: "The Itchy Shins and the 'Dry Riverbed'",
    scenario: "An 80-year-old male presents with intense itching on his shins during the winter. He showers twice a day with hot water and soap.\n\nVitals: Normal.\nPhysical Examination: The skin on his shins looks dry, cracked, and resembles a 'dried-up riverbed' or 'cracked porcelain'.\nLaboratory Results: None.",
    disease: "Asteatotic Eczema (Eczema Craquelé)",
    questions: [
      {
        q: "What is the primary cause of Asteatotic Eczema?",
        options: ["Allergy", "Loss of water/lipids from the stratum corneum (dry skin), often exacerbated by low humidity and over-washing", "Fungal infection", "None"],
        ans: 1,
        exp: "It is essentially 'extreme dry skin' that becomes inflamed."
      },
      {
        q: "What is the best initial management step?",
        options: ["Topical antibiotics", "Reduce bathing frequency, use lukewarm water, and apply thick emollients immediately after drying", "Oral steroids", "Scrubbing the dry skin off"],
        ans: 1,
        exp: "Lifestyle changes and aggressive moisturization are the pillars of therapy."
      },
      {
        q: "Which medication should be used sparingly if the skin is inflamed?",
        options: ["Emollients", "Low-to-medium potency topical corticosteroids", "Sunscreen", "None"],
        ans: 1,
        exp: "Steroids help with the itch but should be tapered once the barrier is restored."
      }
    ]
  },
  {
    title: "The Painful Tongue and the Weight Loss",
    scenario: "A 50-year-old chronic alcoholic presents with a smooth, red, 'sore' tongue and cracks at the corners of his mouth.\n\nVitals: Normal.\nPhysical Examination: Glossitis (smooth red tongue) and angular cheilitis (cracks at corners of mouth). He also has a scaly, red rash in his groin.\nLaboratory Results: Hemoglobin 11.0 (Macrocytic).",
    disease: "B-Vitamin Deficiency (B2/B6/B12)",
    questions: [
      {
        q: "The combination of glossitis and angular cheilitis is a classic sign of which deficiencies?",
        options: ["Vitamin C", "B-vitamins (especially B2 Riboflavin, B6 Pyridoxine, or B12)", "Vitamin D", "None"],
        ans: 1,
        exp: "Oral and perioral findings are hallmark signs of B-complex deficiencies."
      },
      {
        q: "Macrocytic anemia in an alcoholic is most likely due to a deficiency in:",
        options: ["Iron", "Folate or Vitamin B12", "Zinc", "None"],
        ans: 1,
        exp: "Alcohol impairs the absorption and metabolism of these vitamins."
      },
      {
        q: "What is the first step in management?",
        options: ["Oral steroids", "Replacement of the deficient vitamins and dietary improvement", "Antibiotics for the mouth", "None"],
        ans: 1,
        exp: "Direct replacement resolves the symptoms."
      }
    ]
  },
  {
    title: "The Itchy Hands and the Career",
    scenario: "A 30-year-old nurse presents with a red, scaly, and itchy rash on the backs of her hands. It improves over the weekend and worsens at work.\n\nVitals: Normal.\nPhysical Examination: Erythema, scaling, and small fissures on the dorsal hands and finger webs.\nLaboratory Results: Patch testing shows a positive reaction to nickel and fragrance.",
    disease: "Allergic Contact Dermatitis",
    questions: [
      {
        q: "What is the 'Gold Standard' test for diagnosing allergic contact dermatitis?",
        options: ["Skin prick test", "Patch testing (delayed hypersensitivity)", "RAST (blood test)", "Biopsy only"],
        ans: 1,
        exp: "Patch testing evaluates Type IV hypersensitivity reactions."
      },
      {
        q: "How does Allergic Contact Dermatitis differ from Irritant Contact Dermatitis?",
        options: ["Allergic is more common", "Allergic is an immune-mediated (Type IV) reaction; Irritant is a direct chemical/physical injury and does not require prior sensitization", "There is no difference", "Irritant is only on the face"],
        ans: 1,
        exp: "Irritant dermatitis (like from frequent handwashing) is much more common than true allergy."
      },
      {
        q: "What is the most important long-term management step?",
        options: ["Daily topical steroids", "Strict avoidance of the identified allergen", "Changing careers", "None"],
        ans: 1,
        exp: "Avoidance is the only way to prevent recurrence."
      }
    ]
  },
  {
    title: "The Sudden Wide Rash (Infection?)",
    scenario: "A 5-year-old girl presents with a widespread, fine, red rash that feels like 'sandpaper'. She has a high fever and a sore throat.\n\nVitals: T 39.2 C.\nPhysical Examination: Diffuse erythematous rash that blanches. Prominent redness in the skin folds (Pastia lines). Strawberry tongue and bright red tonsils with exudate.\nLaboratory Results: Rapid Strep test is positive.",
    disease: "Scarlet Fever",
    questions: [
      {
        q: "What is the cause of the rash in Scarlet Fever?",
        options: ["Direct bacterial infection of the skin", "Erythrogenic toxin produced by Group A Streptococcus", "Allergic reaction to cold", "None"],
        ans: 1,
        exp: "The toxin spreads systemically from the site of pharyngeal infection."
      },
      {
        q: "What is the 'sandpaper' texture characteristic of?",
        options: ["Psoriasis", "Scarlet Fever", "Eczema", "Measles"],
        ans: 1,
        exp: "This is a classic 'Step 2' descriptor for the scarlatiniform rash."
      },
      {
        q: "What is the treatment of choice?",
        options: ["Topical steroids", "Oral Penicillin or Amoxicillin", "Acyclovir", "None"],
        ans: 1,
        exp: "Antibiotics treat the infection and prevent complications like Rheumatic Fever."
      }
    ]
  },
  {
    title: "The Painful Bumps and the 'Target'",
    scenario: "A 25-year-old male develops a sudden eruption of 'target-like' lesions on his palms 1 week after having a cold sore on his lip.\n\nVitals: Normal.\nPhysical Examination: Multiple erythematous papules with a dusky center and a pale ring (target lesions) on the palms and soles.\nLaboratory Results: Tzanck smear from the lip sore showed giant cells.",
    disease: "Erythema Multiforme (EM) Minor",
    questions: [
      {
        q: "What is the most common trigger for Erythema Multiforme Minor?",
        options: ["Drugs", "Herpes Simplex Virus (HSV) infection", "Food allergy", "None"],
        ans: 1,
        exp: "HSV is the most frequent trigger for EM Minor."
      },
      {
        q: "How does EM Minor differ from SJS?",
        options: ["EM Minor has target lesions and minimal/no mucosal involvement or skin sloughing; SJS is a severe drug reaction with extensive mucosal erosions and skin detachment", "They are the same", "EM is more dangerous", "None"],
        ans: 0,
        exp: "EM is typically a self-limited, immune-mediated reaction to infection."
      },
      {
        q: "What is the management for recurrent EM linked to HSV?",
        options: ["Topical steroids only", "Suppressive oral antiviral therapy (e.g., Acyclovir)", "Chemotherapy", "None"],
        ans: 1,
        exp: "Preventing the HSV flares prevents the EM flares."
      }
    ]
  },
  {
    title: "The Scaly Patch in the Swimmer",
    scenario: "A 12-year-old boy has a white, scaly patch on his cheek that becomes more noticeable in the summer when he tans.\n\nVitals: Normal.\nPhysical Examination: A poorly demarcated, hypopigmented, slightly scaly patch on the face. It does not itch or hurt.\nLaboratory Results: KOH is negative.",
    disease: "Pityriasis Alba",
    questions: [
      {
        q: "Pityriasis alba is considered a minor manifestation of which condition?",
        options: ["Psoriasis", "Atopic Dermatitis (Eczema)", "Vitiligo", "Tinea"],
        ans: 1,
        exp: "It is common in children with a history of eczema."
      },
      {
        q: "Why does it become 'more noticeable' in the summer?",
        options: ["The rash spreads in the sun", "The affected skin fails to tan normally compared to the surrounding healthy skin", "It's an allergy to the sun", "None"],
        ans: 1,
        exp: "Post-inflammatory hypopigmentation becomes apparent when the rest of the skin darkens."
      },
      {
        q: "What is the best initial management?",
        options: ["Topical antifungals", "Sun protection and emollients; sometimes a mild topical steroid if inflamed", "Laser therapy", "None"],
        ans: 1,
        exp: "Reassurance and moisturization are usually sufficient as it resolves with time."
      }
    ]
  },
  {
    title: "The Itchy Groin (The Mirror)",
    scenario: "A 35-year-old obese male presents with a very red, 'burning' rash in his groin. He has a history of poorly controlled diabetes.\n\nVitals: Normal.\nPhysical Examination: Bright red 'beefy' plaques in the skin folds with 'satellite' pustules at the edges (Mirror lesions).\nLaboratory Results: KOH shows pseudohyphae.",
    disease: "Candidal Intertrigo",
    questions: [
      {
        q: "What is the hallmark clinical finding of Candidal Intertrigo?",
        options: ["Target lesions", "Beefy red plaques with satellite papules/pustules", "Silvery scale", "None"],
        ans: 1,
        exp: "The 'satellite' lesions are a key differentiator from other types of intertrigo."
      },
      {
        q: "What is the best initial treatment?",
        options: ["Topical Nystatin or Clotrimazole", "Topical Mupirocin", "Topical Terbinafine", "Topical Steroids only"],
        ans: 0,
        exp: "Candida is highly sensitive to Nystatin and azole antifungals."
      },
      {
        q: "Why is it important to check the blood sugar in this patient?",
        options: ["It isn't", "Hyperglycemia promotes the overgrowth of Candida in skin folds", "Candida causes diabetes", "None"],
        ans: 1,
        exp: "Controlling the underlying diabetes is key to preventing recurrence."
      }
    ]
  },
  {
    title: "The Waxy Bumps on the Eyelid",
    scenario: "An 80-year-old male presents with several skin-colored, waxy 'craters' on his lower eyelid. He is worried about cancer.\n\nVitals: Normal.\nPhysical Examination: Small, flesh-colored, dome-shaped papules with central umbilication. No bleeding or crusting.\nLaboratory Results: None.",
    disease: "Molluscum Contagiosum (Eyelid)",
    questions: [
      {
        q: "What is a potential ocular complication of molluscum on the eyelid margin?",
        options: ["Glaucoma", "Chronic follicular conjunctivitis due to viral shedding into the eye", "Cataracts", "None"],
        ans: 1,
        exp: "The virus can irritate the conjunctiva if the lesions are on the lid margin."
      },
      {
        q: "How does the management differ from trunk molluscum in children?",
        options: ["It doesn't", "Eyelid lesions may require referral for removal to prevent the conjunctivitis mentioned above", "Wait and watch always", "None"],
        ans: 1,
        exp: "Clinical symptoms may drive the need for active treatment."
      },
      {
        q: "Molluscum on the eyelid in a young adult is another red flag for which condition?",
        options: ["Diabetes", "HIV", "Leukemia", "None"],
        ans: 1,
        exp: "Like giant molluscum, atypical locations can signify immunosuppression."
      }
    ]
  },
  {
    title: "The Rapidly spreading 'Infection' on the Face",
    scenario: "A 40-year-old woman presents with a bright red, swollen, and painful area on her right cheek that began 12 hours ago. It has a very sharp, raised border.\n\nVitals: T 38.8 C.\nPhysical Examination: Well-demarcated, edematous, erythematous plaque on the face. It feels 'indurated' (hard). Lymphadenopathy is present.\nLaboratory Results: WBC 15,000.",
    disease: "Erysipelas",
    questions: [
      {
        q: "What is the primary difference between Erysipelas and Cellulitis?",
        options: ["Erysipelas is deeper", "Erysipelas involves the superficial dermis and lymphatic system and has a sharp, well-demarcated border; Cellulitis is deeper and has ill-defined borders", "Erysipelas is painless", "None"],
        ans: 1,
        exp: "The 'sharp border' and 'butterfly' face distribution are classic for erysipelas."
      },
      {
        q: "What is the most common causative organism for Erysipelas?",
        options: ["Staph aureus", "Streptococcus pyogenes (Group A Strep)", "Pseudomonas", "E. coli"],
        ans: 1,
        exp: "GAS is the overwhelming cause of this superficial infection."
      },
      {
        q: "What is the best initial treatment?",
        options: ["Topical Mupirocin", "Oral or IV Penicillin (or Cephalosporin)", "Incision and drainage", "None"],
        ans: 1,
        exp: "Erysipelas requires systemic antibiotics targeting Strep."
      }
    ]
  },
  {
    title: "The Sudden Loss of All Hair (Management Follow-up)",
    scenario: "A patient with Alopecia Universalis fails to respond to topical therapy and steroid injections. He is otherwise healthy.\n\nVitals: Normal.\nPhysical Examination: Total body hair loss.\nLaboratory Results: None.",
    disease: "Advanced Alopecia Management (JAK Inhibitors)",
    questions: [
      {
        q: "Which new class of medication is now FDA-approved for severe alopecia areata/universalis?",
        options: ["JAK inhibitors (e.g., Baricitinib)", "TNF inhibitors", "IL-17 inhibitors", "Antibiotics"],
        ans: 0,
        exp: "JAK inhibitors represent a breakthrough in the treatment of severe, extensive alopecia."
      },
      {
        q: "How do JAK inhibitors work in this condition?",
        options: ["They kill fungus", "They block the signaling pathways used by the T-cells that attack the hair follicle", "They increase blood flow", "None"],
        ans: 1,
        exp: "They are targeted immunomodulators."
      },
      {
        q: "What is a major counseling point for patients starting JAK inhibitors?",
        options: ["They work overnight", "They require monitoring for infections (TB, shingles) and laboratory monitoring (CBC/lipids)", "They are only for children", "None"],
        ans: 1,
        exp: "Like all systemic immunomodulators, they have specific safety monitoring requirements."
      }
    ]
  }
];
