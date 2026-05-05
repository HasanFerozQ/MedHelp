module.exports = [
  {
    title: "The Crusted Patient in the Nursing Home",
    scenario: "An 85-year-old female with advanced dementia in a long-term care facility presents with thick, 'gray-white' crusts on her hands, feet, and trunk. She does not seem to be itching much.\n\nVitals: Normal.\nPhysical Examination: Heavy, hyperkeratotic scaling and crusting, especially in the web spaces and under the nails. Fissuring is present. Thousands of mites are seen on a single skin scraping.\nLaboratory Results: None.",
    disease: "Crusted (Norwegian) Scabies",
    questions: [
      {
        q: "How does crusted scabies differ from classic scabies in terms of infectivity?",
        options: ["It is less contagious", "It is extremely contagious due to the massive burden of mites (millions vs. 10-15 in classic)", "It is only spread by pets", "None"],
        ans: 1,
        exp: "A single contact can transmit thousands of mites. Strict isolation is required."
      },
      {
        q: "What is the best initial treatment for crusted scabies?",
        options: ["Topical Permethrin only", "Combined therapy with oral Ivermectin and topical Permethrin (or Sulfur ointment)", "Oral Antibiotics", "Topical Steroids"],
        ans: 1,
        exp: "Combination therapy is mandatory for the high mite load in crusted cases."
      },
      {
        q: "Why might the patient not be itching despite millions of mites?",
        options: ["The mites are dead", "Immunosuppression or neurologic impairment prevents the normal hypersensitivity (itch) response", "It's a different species", "None"],
        ans: 1,
        exp: "The lack of itch (anergy) contributes to the delayed diagnosis and massive infestation."
      }
    ]
  },
  {
    title: "The Rose Gardener''s Bumps",
    scenario: "A 40-year-old male presents with several red bumps on his right hand and forearm that have been appearing over the last 2 weeks. He is an avid gardener.\n\nVitals: Normal.\nPhysical Examination: A series of painless, firm, erythematous nodules following a 'linear' pattern up the arm (lymphangitic spread). The initial lesion on the finger is slightly ulcerated.\nLaboratory Results: Fungal culture shows Sporothrix schenckii.",
    disease: "Sporotrichosis",
    questions: [
      {
        q: "What is the classic 'buzzword' clinical pattern seen in this patient?",
        options: ["Christmas tree", "Nodular lymphangitis (sporotrichoid spread)", "Target lesions", "None"],
        ans: 1,
        exp: "Linear spread along lymphatic channels is classic for Sporothrix, but can also be seen in Nocardia or atypical Mycobacteria."
      },
      {
        q: "What is the first-line treatment for lymphocutaneous sporotrichosis?",
        options: ["Oral Itraconazole for 3-6 months", "Oral Penicillin", "Topical antifungals", "Amphotericin B"],
        ans: 0,
        exp: "Oral Itraconazole is the standard of care. Potassium iodide (SSKI) is an older alternative."
      },
      {
        q: "What was the most likely 'portal of entry' for this fungus?",
        options: ["Inhalation", "Traumatic inoculation (e.g., from a rose thorn or contaminated soil)", "Ingestion", "None"],
        ans: 1,
        exp: "This is a classic 'Step 2' occupational history association."
      }
    ]
  },
  {
    title: "The 'Tanned' Spots that Won''t Tan",
    scenario: "A 19-year-old male presents with multiple 'white spots' on his chest and back that appeared after a beach vacation.\n\nVitals: Normal.\nPhysical Examination: Multiple small, finely scaly, hypopigmented macules that have coalesced into larger patches. The spots do not tan.\nLaboratory Results: KOH prep shows a 'spaghetti and meatballs' pattern of hyphae and spores.",
    disease: "Tinea Versicolor (Pityriasis Versicolor)",
    questions: [
      {
        q: "What is the causative organism of Tinea Versicolor?",
        options: ["Trichophyton", "Malassezia species (yeast)", "Candida", "None"],
        ans: 1,
        exp: "Malassezia is a commensal yeast that becomes pathogenic under certain conditions (heat/humidity)."
      },
      {
        q: "What is the best initial treatment for widespread Tinea Versicolor?",
        options: ["Topical Permethrin", "Topical Selenium Sulfide or Ketoconazole shampoo (applied as a wash)", "Oral Griseofulvin", "Oral Terbinafine"],
        ans: 1,
        exp: "Topical antifungal washes are highly effective and safer than systemic options for this benign condition."
      },
      {
        q: "Does the pigment return immediately after the fungus is killed?",
        options: ["Yes", "No, the hypopigmentation (due to melanocyte inhibition) can take weeks to months to resolve even after successful treatment", "Only in the sun", "None"],
        ans: 1,
        exp: "Managing expectations about the 'lingering' white spots is key to patient satisfaction."
      }
    ]
  },
  {
    title: "The Splotchy Face and the Pregnancy",
    scenario: "A 30-year-old pregnant female (3rd trimester) presents with symmetric brown patches on her cheeks and forehead.\n\nVitals: Normal.\nPhysical Examination: Irregular, hyperpigmented, brown macules in a 'mask-like' distribution on the face (malar and frontal areas).\nLaboratory Results: None.",
    disease: "Melasma (Chloasma)",
    questions: [
      {
        q: "What are the three most common 'triggers' for melasma?",
        options: ["Cold, diet, exercise", "Sunlight (UV), Hormones (Pregnancy/OCPs), and Genetics", "Smoking, alcohol, stress", "None"],
        ans: 1,
        exp: "Melasma is often called 'the mask of pregnancy'."
      },
      {
        q: "What is the MOST IMPORTANT management step to prevent worsening of melasma?",
        options: ["Chemical peels", "Strict sun protection (broad-spectrum sunscreen and hats)", "Stopping all vitamins", "None"],
        ans: 1,
        exp: "UV radiation is the primary driver of pigment production in melasma."
      },
      {
        q: "Will the pigmentation always disappear after delivery?",
        options: ["Yes, 100%", "It often fades significantly but may persist and require topical therapy (e.g., Hydroquinone)", "It gets darker", "None"],
        ans: 1,
        exp: "While it often improves postpartum, it is frequently a chronic, relapsing condition."
      }
    ]
  },
  {
    title: "The 'Dimple' in the Skin",
    scenario: "A 35-year-old female presents with a firm, brown bump on her leg that she noticed after a bug bite a year ago.\n\nVitals: Normal.\nPhysical Examination: A firm, 5-mm hyperpigmented nodule on the lower leg. When the skin on either side is pinched, the lesion 'dimples' inward (positive Fitzpatricks/dimple sign).\nLaboratory Results: None.",
    disease: "Dermatofibroma",
    questions: [
      {
        q: "What does a 'Positive Dimple Sign' indicate?",
        options: ["Malignant Melanoma", "Dermatofibroma (benign fibrous nodule)", "Skin abscess", "Basal Cell Carcinoma"],
        ans: 1,
        exp: "The dimple sign is highly characteristic of dermatofibroma due to its tethering to the underlying dermis."
      },
      {
        q: "What is the best management for an asymptomatic dermatofibroma?",
        options: ["Excisional biopsy", "Observation and reassurance", "Cryotherapy", "Topical steroids"],
        ans: 1,
        exp: "As these are benign and leave larger scars if removed, observation is the preferred approach."
      },
      {
        q: "Dermatofibromas are often thought to be reactive to what?",
        options: ["Infection", "Minor trauma or insect bites", "Poor diet", "None"],
        ans: 1,
        exp: "A history of a preceding minor injury is common."
      }
    ]
  },
  {
    title: "The Rapidly Bleeding 'Pimple'",
    scenario: "A 22-year-old pregnant female presents with a bright red, 'shiny' bump on her finger that bleeds profusely with even minor contact.\n\nVitals: Normal.\nPhysical Examination: A pedunculated, friable, erythematous papule with a 'collarette' of scale at the base. It is rapidly growing.\nLaboratory Results: None.",
    disease: "Pyogenic Granuloma (Lobular Capillary Hemangioma)",
    questions: [
      {
        q: "What is the best initial treatment for a pyogenic granuloma?",
        options: ["Antibiotics", "Surgical excision or shave removal with cautery of the base", "Topical steroids", "Observation"],
        ans: 1,
        exp: "Because they bleed easily and don't resolve on their own, definitive removal is required."
      },
      {
        q: "Why is it common in pregnant women?",
        options: ["Hormonal influences on vascular proliferation", "Low vitamins", "Infection", "None"],
        ans: 0,
        exp: "PGs are frequently seen on the gingiva (pregnancy tumors) or skin during pregnancy."
      },
      {
        q: "Is a pyogenic granuloma a 'true' granuloma containing pus?",
        options: ["Yes", "No, it is a benign vascular proliferation; the name is a misnomer", "Only if it is red", "None"],
        ans: 1,
        exp: "It contains neither 'pyo' (pus) nor 'granuloma' (the histologic structure)."
      }
    ]
  },
  {
    title: "The Itchy Patient and the Purple Bumps (Revisited)",
    scenario: "A 45-year-old male with a history of Hepatitis C presents with very itchy, flat-topped purple bumps on his wrists and shins.\n\nVitals: Normal.\nPhysical Examination: Polygonal, purple, planar papules (6 P's). White, lacy lines on the oral mucosa (Wickham striae). He also has 'ridges' on his nails.\nLaboratory Results: None.",
    disease: "Lichen Planus (LP)",
    questions: [
      {
        q: "What is the 'Best Initial' treatment for cutaneous lichen planus?",
        options: ["Oral Prednisone", "High-potency topical corticosteroids", "Oral Acyclovir", "UVB light"],
        ans: 1,
        exp: "Topical steroids are first-line for localized LP."
      },
      {
        q: "What is the 'Koebner phenomenon' in the context of Lichen Planus?",
        options: ["Fever", "Development of new lesions at sites of skin trauma (like scratches)", "Itchiness", "None"],
        ans: 1,
        exp: "This is seen in Psoriasis, Lichen Planus, and Vitiligo."
      },
      {
        q: "Oral Lichen Planus carries a small increased risk of which malignancy?",
        options: ["BCC", "Squamous Cell Carcinoma (SCC)", "Melanoma", "Lymphoma"],
        ans: 1,
        exp: "Chronic erosive oral LP requires monitoring for SCC."
      }
    ]
  },
  {
    title: "The Fragile Skin in the Elderly",
    scenario: "An 85-year-old female presents with multiple 'purple bruises' and thin, transparent skin on her forearms.\n\nVitals: Normal.\nPhysical Examination: Ecchymoses (purpura) on the dorsal hands and forearms. The skin is extremely thin and tears easily (skin tears). No low platelets.\nLaboratory Results: CBC normal.",
    disease: "Actinic (Senile) Purpura",
    questions: [
      {
        q: "What is the cause of actinic purpura?",
        options: ["Abuse", "Atrophy of the dermal connective tissue due to aging and sun damage, leaving blood vessels poorly supported", "Vitamin K deficiency", "None"],
        ans: 1,
        exp: "It is a benign condition of elderly skin fragility."
      },
      {
        q: "How should this condition be managed?",
        options: ["Vitamin K supplements", "Reassurance and trauma prevention (e.g., long sleeves)", "Platelet transfusion", "None"],
        ans: 1,
        exp: "There is no 'cure' for the underlying atrophy."
      },
      {
        q: "Do these bruises turn yellow and green like normal bruises as they heal?",
        options: ["Yes", "No, they often resolve without the typical color progression of heme degradation", "Only in children", "None"],
        ans: 1,
        exp: "This is a unique clinical observation in senile purpura."
      }
    ]
  },
  {
    title: "The Scar that Keeps Growing",
    scenario: "An 18-year-old male with dark skin presents with a large, itchy, firm mass on his earlobe after he got it pierced 6 months ago.\n\nVitals: Normal.\nPhysical Examination: A 2-cm, firm, smooth, erythematous nodule that extends well beyond the original boundaries of the piercing.\nLaboratory Results: None.",
    disease: "Keloid",
    questions: [
      {
        q: "How does a Keloid differ from a Hypertrophic scar?",
        options: ["Hypertrophic scars stay within the original wound boundaries; Keloids extend beyond them", "Keloids go away; hypertrophic stay", "They are the same", "None"],
        ans: 0,
        exp: "This is a critical distinction for prognosis and treatment."
      },
      {
        q: "What is the best initial treatment for a symptomatic keloid?",
        options: ["Simple surgical excision", "Intralesional corticosteroid injections (e.g., Triamcinolone)", "Topical antibiotics", "None"],
        ans: 1,
        exp: "Simple excision of a keloid has a very high recurrence rate (often returning larger). Injections are the first step."
      },
      {
        q: "If surgery is performed, what should be done to prevent recurrence?",
        options: ["Nothing", "Adjuvant therapy (e.g., steroid injections, pressure therapy, or radiation)", "Sun protection", "None"],
        ans: 1,
        exp: "Surgery alone is almost never recommended for keloids."
      }
    ]
  },
  {
    title: "The Scaly Patch in the 'Rose' Distribution",
    scenario: "A 25-year-old female develops a single, large, oval red patch on her abdomen. One week later, she develops dozens of smaller oval patches on her back that follow her ribs.\n\nVitals: Normal.\nPhysical Examination: Herald patch followed by Christmas tree distribution of smaller scaly lesions. A negative RPR is noted.\nLaboratory Results: None.",
    disease: "Pityriasis Rosea (Management)",
    questions: [
      {
        q: "What is the standard management for an asymptomatic case of Pityriasis Rosea?",
        options: ["Oral Antifungals", "Observation and reassurance (resolves in 6-8 weeks)", "Oral Steroids", "Topical Antibiotics"],
        ans: 1,
        exp: "No treatment is necessary for asymptomatic cases."
      },
      {
        q: "If the patient is extremely itchy, what can be used?",
        options: ["Topical steroids and oral antihistamines", "Acyclovir", "Chemotherapy", "None"],
        ans: 0,
        exp: "Supportive care is only for symptom relief."
      },
      {
        q: "Is the condition contagious?",
        options: ["Yes, very", "No, it is not considered contagious despite a suspected viral trigger", "Only through water", "None"],
        ans: 1,
        exp: "Isolation is not required."
      }
    ]
  },
  {
    title: "The 'White' Face in the Dark-Skinned Child",
    scenario: "An 8-year-old boy with dark skin presents with several round, pale patches on his cheeks. He has a history of asthma.\n\nVitals: Normal.\nPhysical Examination: Poorly demarcated, hypopigmented macules with a fine scale. No complete loss of pigment.\nLaboratory Results: KOH negative.",
    disease: "Pityriasis Alba vs. Vitiligo",
    questions: [
      {
        q: "How can you clinically distinguish Pityriasis Alba from Vitiligo?",
        options: ["Vitiligo is scaly; PA is not", "Vitiligo shows complete depigmentation (chalk-white) with sharp borders; PA is hypopigmented (off-white) with blurry borders and fine scale", "Vitiligo is only on the hands", "None"],
        ans: 1,
        exp: "The 'depth' of the pigment loss and the border quality are key."
      },
      {
        q: "What is the best initial management for Pityriasis Alba?",
        options: ["Oral antifungals", "Sun protection and emollients; sometimes a mild topical steroid/calcineurin inhibitor", "Chemotherapy", "None"],
        ans: 1,
        exp: "PA is a self-limited form of mild eczema."
      },
      {
        q: "What would you expect to see under a Wood's lamp for Vitiligo?",
        options: ["Bright coral-red fluorescence", "Bright, fluorescent blue-white depigmentation", "Yellow glow", "Nothing"],
        ans: 1,
        exp: "Wood's lamp accentuates the lack of melanin in vitiligo."
      }
    ]
  },
  {
    title: "The Sudden White Spots on the Hands",
    scenario: "A 30-year-old woman presents with 'chalk-white' spots on her fingers and around her mouth. She has a history of autoimmune thyroiditis.\n\nVitals: Normal.\nPhysical Examination: Completely depigmented macules and patches with sharp borders (acrofacial vitiligo).\nLaboratory Results: Positive Anti-TPO antibodies.",
    disease: "Vitiligo (Management)",
    questions: [
      {
        q: "What is the first-line treatment for limited vitiligo (especially on the face)?",
        options: ["Oral steroids", "High-potency topical steroids or topical Calcineurin inhibitors (e.g., Tacrolimus)", "Permanent bleaching of the rest of the skin", "None"],
        ans: 1,
        exp: "Topical immunosuppression aims to stop the autoimmune destruction of melanocytes."
      },
      {
        q: "What is a major risk factor for patients with vitiligo?",
        options: ["Sunburn (due to lack of protective melanin)", "Infection", "Skin cancer only", "None"],
        ans: 0,
        exp: "Strict sun protection is vital in depigmented areas."
      },
      {
        q: "If the disease is widespread (>20% BSA), what is the next step?",
        options: ["Surgery", "Narrowband UVB phototherapy", "IV Antibiotics", "None"],
        ans: 1,
        exp: "Phototherapy is highly effective for stimulating repigmentation."
      }
    ]
  },
  {
    title: "The 'Stuck-On' Brown Bump",
    scenario: "A 70-year-old male presents with a 'worrying' black bump on his chest.\n\nVitals: Normal.\nPhysical Examination: A 1-cm, well-demarcated, hyperpigmented plaque with a 'stuck-on' appearance and 'waxy' texture. Small keratin-filled pits are visible with a magnifying lens.\nLaboratory Results: None.",
    disease: "Seborrheic Keratosis",
    questions: [
      {
        q: "What is the clinical hallmark of Seborrheic Keratosis?",
        options: ["Bleeding and ulceration", "A 'stuck-on' appearance that looks like it could be scraped off with a fingernail", "Rapid growth", "None"],
        ans: 1,
        exp: "This is the most common benign tumor in the elderly."
      },
      {
        q: "Is treatment necessary for Seborrheic Keratoses?",
        options: ["Yes, they turn into cancer", "No, they are benign; treatment is only for irritation or cosmetics (e.g., cryotherapy)", "Only in children", "None"],
        ans: 1,
        exp: "SKs have zero malignant potential."
      },
      {
        q: "The sudden appearance of hundreds of SKs (Leser-Trélat sign) should prompt evaluation for what?",
        options: ["Diabetes", "Internal malignancy (especially GI)", "Heart failure", "None"],
        ans: 1,
        exp: "This is a rare but classic paraneoplastic syndrome."
      }
    ]
  },
  {
    title: "The Blue Node on the Lip",
    scenario: "A 65-year-old male has a soft, blue-to-purple nodule on his lower lip that disappears when he presses on it with his finger.\n\nVitals: Normal.\nPhysical Examination: A 5-mm soft, compressible, dark-blue papule on the lip.\nLaboratory Results: None.",
    disease: "Venous Lake",
    questions: [
      {
        q: "What is a 'Venous Lake'?",
        options: ["A type of cancer", "A benign dilated vein (common in the elderly on sun-exposed areas like lips/ears)", "A fungal infection", "None"],
        ans: 1,
        exp: "It is a common vascular finding in older patients."
      },
      {
        q: "How can you distinguish it from a nodular melanoma?",
        options: ["Melanoma is soft", "A venous lake is soft and blanchable/compressible (blood is squeezed out); melanoma is firm and does not blanch", "They are the same", "None"],
        ans: 1,
        exp: "Blanchability is a key clinical test for vascular vs. pigmented lesions."
      },
      {
        q: "Is treatment required for a venous lake?",
        options: ["Yes, immediate excision", "No, unless for cosmetic reasons (e.g., laser or excision)", "Wait and watch always", "None"],
        ans: 1,
        exp: "They are completely benign."
      }
    ]
  },
  {
    title: "The Painful Blue Spot Under the Nail",
    scenario: "A 30-year-old female presents with a small, extremely painful blue-red spot under her fingernail. The pain is triggered by cold or minor pressure.\n\nVitals: Normal.\nPhysical Examination: A 2-mm bluish subungual nodule. Severe tenderness to pinpoint pressure (Love's sign).\nLaboratory Results: None.",
    disease: "Glomus Tumor",
    questions: [
      {
        q: "What is a Glomus tumor?",
        options: ["A type of cancer", "A benign, painful hamartoma of the glomus body (involved in thermoregulation)", "A fungal infection", "None"],
        ans: 1,
        exp: "These are classically found in the subungual area."
      },
      {
        q: "What is the hallmark symptom?",
        options: ["Itch", "Severe paroxysmal pain, especially triggered by cold or pressure", "Numbness", "None"],
        ans: 1,
        exp: "The 'cold sensitivity' is a classic Step 2 CK clue."
      },
      {
        q: "What is the treatment?",
        options: ["Painkillers only", "Surgical excision", "Topical steroids", "None"],
        ans: 1,
        exp: "Excision is curative and provides immediate relief."
      }
    ]
  },
  {
    title: "The Itchy Groin in the Toddler",
    scenario: "A 3-year-old girl presents with an itchy, scaly rash in her diaper area that has not responded to diaper rash creams.\n\nVitals: Normal.\nPhysical Examination: Erythematous patches with a 'beefy' red color and 'satellite' pustules. The rash involves the deep skin folds.\nLaboratory Results: KOH prep shows yeast.",
    disease: "Candidal Diaper Dermatitis",
    questions: [
      {
        q: "How does Candidal Diaper Dermatitis differ from Irritant (contact) Diaper Dermatitis?",
        options: ["Candida involves the deep folds; Irritant dermatitis typically spares the deep folds (where the diaper doesn't touch)", "Irritant involves the folds; Candida doesn't", "There is no difference", "Candida is blue"],
        ans: 0,
        exp: "Involvement of the inguinal creases is a major diagnostic clue for Candida."
      },
      {
        q: "What is the first-line treatment for this infant?",
        options: ["Topical Permethrin", "Topical Nystatin or Clotrimazole cream", "Topical Bacitracin", "Topical Steroids only"],
        ans: 1,
        exp: "Antifungals are required. High-potency steroids should be avoided in the diaper area."
      },
      {
        q: "Why are 'satellite lesions' so important for diagnosis?",
        options: ["They aren't", "They are highly characteristic of Candidal infection", "They indicate a bacterial allergy", "None"],
        ans: 1,
        exp: "Seeing small red spots away from the main plaque is the 'gold standard' clinical sign."
      }
    ]
  },
  {
    title: "The Sudden Loss of Skin and the New Drug (Management)",
    scenario: "A patient develops skin pain and Nikolsky-positive sloughing involving 40% of the body surface area.\n\nVitals: T 39.0 C, BP 85/50.\nPhysical Examination: Extensive epidermal detachment (TEN).\nLaboratory Results: None.",
    disease: "Toxic Epidermal Necrolysis (Management)",
    questions: [
      {
        q: "Besides drug withdrawal, what is the 'Most Important' factor for improving survival in TEN?",
        options: ["Starting steroids early", "Aggressive fluid and electrolyte resuscitation (similar to burn protocols)", "Skin grafting", "None"],
        ans: 1,
        exp: "The loss of the skin barrier leads to massive fluid loss and risk of sepsis."
      },
      {
        q: "What is the most common cause of death in TEN patients?",
        options: ["Heart attack", "Sepsis (usually from S. aureus or Pseudomonas)", "Liver failure", "None"],
        ans: 1,
        exp: "Infection of the denuded skin and subsequent septicemia is the primary killer."
      },
      {
        q: "Which 'Target' should be managed by a specialist from day 1 to prevent permanent disability?",
        options: ["Liver", "Eyes (conjunctival erosions/scarring)", "Hair", "None"],
        ans: 1,
        exp: "Ophthalmology must be involved to prevent symblepharon and blindness."
      }
    ]
  },
  {
    title: "The Itchy Shin and the 'Step' Association",
    scenario: "A 40-year-old female presents with painful, red nodules on her shins. She also has a cough and sore throat.\n\nVitals: Normal.\nPhysical Examination: Multiple 2-4 cm tender, erythematous nodules on the pretibial shins. No ulceration.\nLaboratory Results: Chest X-ray shows bilateral hilar lymphadenopathy. ASO titer is high.",
    disease: "Erythema Nodosum Workup",
    questions: [
      {
        q: "Erythema Nodosum (EN) is a 'delayed hypersensitivity' reaction. What is the most common 'Infectious' trigger in children?",
        options: ["HIV", "Group A Streptococcus (ASO positive)", "Fungus", "None"],
        ans: 1,
        exp: "Strep infection is the leading cause of EN in the pediatric population."
      },
      {
        q: "Which systemic inflammatory condition is famously associated with the EN + Hilar adenopathy pattern?",
        options: ["Lupus", "Sarcoidosis (Lofgren Syndrome)", "Tuberculosis", "None"],
        ans: 1,
        exp: "The triad of EN, hilar nodes, and polyarthritis defines Lofgren syndrome."
      },
      {
        q: "Which common medication class is a frequent trigger for EN in women?",
        options: ["Antibiotics", "Oral Contraceptive Pills (OCPs)", "Statins", "Aspirin"],
        ans: 1,
        exp: "Hormonal changes are a significant trigger."
      }
    ]
  },
  {
    title: "The Painful Vulva and the White Skin",
    scenario: "A 65-year-old postmenopausal female presents with severe itching and pain in her genital area. She says it 'burns' when she uriniates.\n\nVitals: Normal.\nPhysical Examination: Thin, ivory-white, 'parchment-like' plaques on the vulva and perianal area in a 'figure-of-eight' distribution. Some scarring and loss of the labia minora are seen.\nLaboratory Results: None.",
    disease: "Lichen Sclerosus",
    questions: [
      {
        q: "What is the 'Best Initial' treatment for Lichen Sclerosus?",
        options: ["Topical Estrogen", "Ultra-potent topical corticosteroids (e.g., Clobetasol) on a tapering schedule", "Antifungal cream", "Surgical excision"],
        ans: 1,
        exp: "Aggressive topical steroids are required to stop the scarring and inflammation."
      },
      {
        q: "Lichen sclerosus in women carries an increased risk of which malignancy?",
        options: ["BCC", "Vulvar Squamous Cell Carcinoma (SCC)", "Melanoma", "None"],
        ans: 1,
        exp: "Up to 5% of patients with chronic LS can develop SCC, necessitating long-term monitoring."
      },
      {
        q: "How does it differ from Lichen Planus in the genital area?",
        options: ["LP usually involves the vagina (mucosal surfaces); LS characteristically spares the vagina", "LS involves the vagina", "They are the same", "None"],
        ans: 0,
        exp: "Vaginal involvement is a key differentiator between the two."
      }
    ]
  },
  {
    title: "The Red-Faced Toddler (Infection)",
    scenario: "A 2-year-old child presents with a bright red face that looks like he was 'slapped'. He had a mild fever a few days ago.\n\nVitals: Normal now.\nPhysical Examination: Bright red erythema on the cheeks ('Slapped-cheek'). A lacy, reticular rash on the trunk and limbs.\nLaboratory Results: None.",
    disease: "Erythema Infectiosum (Fifth Disease)",
    questions: [
      {
        q: "What is the causative agent of Fifth Disease?",
        options: ["Parvovirus B19", "Measles", "Herpes 6", "None"],
        ans: 0,
        exp: "Parvovirus B19 is the culprit."
      },
      {
        q: "What is the major systemic concern for a PREGNANT woman exposed to this child?",
        options: ["Nothing", "Hydrops fetalis (due to viral destruction of fetal RBC precursors)", "SJS", "None"],
        ans: 1,
        exp: "Parvovirus B19 can cause fetal anemia and hydrops if contracted during pregnancy."
      },
      {
        q: "In a patient with Sickle Cell Disease, Parvovirus B19 can trigger which emergency?",
        options: ["Pain crisis", "Aplastic Crisis (sudden drop in hemoglobin)", "Stroke", "None"],
        ans: 1,
        exp: "The virus temporarily halts erythropoiesis."
      }
    ]
  },
  {
    title: "The Itchy Elbows (Reasoning)",
    scenario: "A 25-year-old male with a history of hay fever presents with an itchy rash on his elbows. He says it 'waxes and wanes'.\n\nVitals: Normal.\nPhysical Examination: Poorly defined erythematous plaques with some lichenification on the flexural surfaces (antecubital fossae).\nLaboratory Results: None.",
    disease: "Atopic Dermatitis (Reasoning)",
    questions: [
      {
        q: "The term 'Lichenification' on physical exam indicates what?",
        options: ["Fungal infection", "Chronic rubbing and scratching (thickening of the skin)", "Acute allergy", "None"],
        ans: 1,
        exp: "Lichenification is a marker of chronic itch-scratch behavior."
      },
      {
        q: "What is the 'Atopic Triad'?",
        options: ["Eczema, Asthma, and Allergic Rhinitis", "Fever, rash, cough", "None of the above", "Obesity, Diabetes, Hypertension"],
        ans: 0,
        exp: "These three conditions frequently occur together in predisposed individuals."
      },
      {
        q: "Which type of 'Test' is usually UNNECESSARY for the diagnosis of typical atopic dermatitis?",
        options: ["Physical exam", "Skin biopsy", "Patient history", "None"],
        ans: 1,
        exp: "Atopic dermatitis is a clinical diagnosis; biopsy is rarely specific or necessary."
      }
    ]
  },
  {
    title: "The 'Pearly' Papule and the Management",
    scenario: "A 70-year-old male with a pearly papule on his ear. Biopsy confirms Basal Cell Carcinoma.\n\nVitals: Normal.\nPhysical Examination: 1-cm pearly lesion on the helix of the ear.\nLaboratory Results: None.",
    disease: "BCC Management (Ear)",
    questions: [
      {
        q: "Why is the EAR considered a 'high-risk' location for skin cancer?",
        options: ["It isn't", "Thin skin over cartilage leads to early deep invasion and higher recurrence rates", "It gets more sun", "None"],
        ans: 1,
        exp: "Locations like the ear, nose, and lips have specific surgical management requirements."
      },
      {
        q: "What is the preferred surgical method for this high-risk site?",
        options: ["Simple excision with narrow margins", "Mohs Micrographic Surgery", "Cryosurgery", "Topical 5-FU"],
        ans: 1,
        exp: "Mohs ensures negative margins while preserving the delicate ear architecture."
      },
      {
        q: "If the patient were 95 years old and not a surgical candidate, what is an alternative?",
        options: ["Radiation therapy", "Oral antibiotics", "Chemotherapy", "None"],
        ans: 0,
        exp: "Radiation is an excellent second-line for non-surgical candidates."
      }
    ]
  },
  {
    title: "The Scaly Patch and the 'Double' Border",
    scenario: "A 20-year-old male athlete has an itchy, scaly rash in his groin. He has been using a combination 'steroid and antifungal' cream (e.g., Lotrisone) for 2 weeks. The rash is now larger and more red.\n\nVitals: Normal.\nPhysical Examination: A diffuse, erythematous area in the groin with pustules and a poorly defined border. It no longer looks like a 'ring'.\nLaboratory Results: KOH prep shows hyphae.",
    disease: "Tinea Incognito",
    questions: [
      {
        q: "What has happened to this patient's fungal infection?",
        options: ["He has an allergy to the cream", "The topical steroid in the combination cream suppressed the inflammation but allowed the fungus to grow unchecked (Tinea Incognito)", "The fungus is dead", "None"],
        ans: 1,
        exp: "Steroids 'mask' the infection while making it worse."
      },
      {
        q: "What is the best management step?",
        options: ["Add more steroids", "Stop the combination cream and start a PURE topical antifungal (e.g., Terbinafine)", "Start oral Prednisone", "IV Antibiotics"],
        ans: 1,
        exp: "Removing the steroid is critical to allow the immune system to fight the fungus with the help of the antifungal."
      },
      {
        q: "Why should combination 'Steroid-Antifungal' creams generally be avoided?",
        options: ["They are too expensive", "Risk of Tinea Incognito, skin atrophy in folds, and reduced efficacy", "None", "They don't work at all"],
        ans: 1,
        exp: "Most dermatologists recommend against their use due to these common pitfalls."
      }
    ]
  },
  {
    title: "The Flushed Face and the 'Pimple' Trap",
    scenario: "A 30-year-old woman presents with persistent facial redness and 'pimples' on her cheeks. She says she has 'adult acne'.\n\nVitals: Normal.\nPhysical Examination: Central facial erythema and papulopustules. No open or closed comedones. She flushes easily with spicy food.\nLaboratory Results: None.",
    disease: "Rosacea vs. Acne",
    questions: [
      {
        q: "What is the key clinical finding that distinguishes Rosacea from Acne?",
        options: ["Rosacea has comedones; Acne does not", "Acne has comedones (blackheads/whiteheads); Rosacea characteristically lacks comedones", "Rosacea is only in teenagers", "None"],
        ans: 1,
        exp: "Comedones are the hallmark of acne; their absence in a patient with inflammatory facial lesions should prompt consideration of rosacea."
      },
      {
        q: "If this patient were treated with standard acne medications like Tretinoin, what would happen?",
        options: ["It would clear up", "The irritation from the retinoid would likely worsen the underlying rosacea and flushing", "It wouldn't matter", "None"],
        ans: 1,
        exp: "Rosacea skin is extremely sensitive; harsh acne treatments are often poorly tolerated."
      },
      {
        q: "What is the first-line medical treatment for the inflammatory papules of rosacea?",
        options: ["Oral Isotretinoin", "Topical Metronidazole, Azelaic Acid, or Ivermectin", "Topical Steroids", "None"],
        ans: 1,
        exp: "These agents target the inflammation and potentially the Demodex mites involved in rosacea."
      }
    ]
  },
  {
    title: "The Itchy Eyelids and the Nail Polish",
    scenario: "A 25-year-old woman presents with a red, scaly, and itchy rash on her eyelids. She does not use any eye makeup.\n\nVitals: Normal.\nPhysical Examination: Erythema and fine scale on both upper and lower eyelids. She also has a similar rash on her neck.\nLaboratory Results: Patch testing is positive for tosylamide formaldehyde resin (found in nail polish).",
    disease: "Ectopic Contact Dermatitis",
    questions: [
      {
        q: "What is 'Ectopic' Contact Dermatitis?",
        options: ["A rash in the wrong place", "A reaction caused by transferring an allergen (e.g., nail polish) via the hands to a distant site (e.g., the thin skin of the eyelids)", "An allergy to the sun", "None"],
        ans: 1,
        exp: "The eyelids are a frequent site of 'transfer' dermatitis because the skin is so thin and easily sensitized."
      },
      {
        q: "Why did she get the rash on her eyelids but not her fingers?",
        options: ["She only touches her eyes", "The thick skin of the fingers is more resistant to penetration; the thin eyelid skin is highly susceptible to allergens", "None", "Fingernails don't have an immune system"],
        ans: 1,
        exp: "This is a classic diagnostic puzzle in dermatology."
      },
      {
        q: "What is the first step in management?",
        options: ["Topical steroids to the eyes", "Stop using the offending nail polish and avoid touching the face until the nails are dry", "Oral steroids", "Eye drops"],
        ans: 1,
        exp: "Removal of the trigger is the priority."
      }
    ]
  },
  {
    title: "The Painful Shins and the Cough (Reasoning)",
    scenario: "A patient with painful red nodules on her shins. A chest X-ray shows enlarged hilar lymph nodes.\n\nVitals: Normal.\nPhysical Examination: Tender, pretibial nodules.\nLaboratory Results: CXR shows bilateral hilar adenopathy.",
    disease: "Erythema Nodosum Reasoning",
    questions: [
      {
        q: "If the ASO titer, TB test, and IBD workup are all negative, what is the most likely diagnosis for the hilar nodes?",
        options: ["Lymphoma", "Sarcoidosis", "Lung cancer", "None"],
        ans: 1,
        exp: "Sarcoidosis is a very common cause of this constellation (Lofgren syndrome)."
      },
      {
        q: "What is the most appropriate next step to support the sarcoidosis diagnosis?",
        options: ["Biopsy of the shin nodule", "Serum ACE level or biopsy of a different site (e.g., a skin plaque or lymph node)", "Wait for the nodules to go away", "None"],
        ans: 1,
        exp: "Biopsy of an EN lesion is often non-specific (septal panniculitis); biopsying a different sarcoid lesion (like a skin plaque) is more likely to show granulomas."
      },
      {
        q: "What is the prognosis for EN associated with sarcoidosis?",
        options: ["Poor", "Excellent (it usually indicates a self-limited, acute form of sarcoidosis that resolves within months)", "It causes permanent lung damage", "None"],
        ans: 1,
        exp: "Lofgren syndrome has a high rate of spontaneous remission."
      }
    ]
  },
  {
    title: "The Ring that Doesn''t Scale",
    scenario: "A 40-year-old female presents with a ring-shaped rash on the back of her hand. It doesn't itch or hurt.\n\nVitals: Normal.\nPhysical Examination: An annular plaque with a 'bumpy' (papular) border and central clearing. There is NO scale present.\nLaboratory Results: KOH prep is negative.",
    disease: "Granuloma Annulare (GA)",
    questions: [
      {
        q: "What is the key clinical feature that distinguishes Granuloma Annulare from Tinea Corporis?",
        options: ["GA is itchy; Tinea is not", "GA has no scale; Tinea characteristically has scale at the active border", "GA is red; Tinea is blue", "None"],
        ans: 1,
        exp: "The absence of scale is a major clinical differentiator for GA."
      },
      {
        q: "What is the management for a single, asymptomatic lesion of GA?",
        options: ["Oral antifungals", "Reassurance (most resolve spontaneously within 2 years)", "Immediate surgical excision", "None"],
        ans: 1,
        exp: "Localized GA is benign and often self-limited."
      },
      {
        q: "Generalized GA (hundreds of lesions) has been occasionally associated with which condition?",
        options: ["Diabetes Mellitus", "Heart failure", "Asthma", "None"],
        ans: 0,
        exp: "While controversial, an association with DM is often tested on medical exams."
      }
    ]
  },
  {
    title: "The Yellow Shin Plate",
    scenario: "A 35-year-old woman with Type 1 Diabetes presents with a 'yellowish' patch on her shin that has been slowly growing.\n\nVitals: Normal.\nPhysical Examination: A well-demarcated, atrophic, yellowish-brown plaque on the pretibial area with prominent telangiectasias (visible vessels) in the center.\nLaboratory Results: HbA1c is 8.5%.",
    disease: "Necrobiosis Lipoidica (NL)",
    questions: [
      {
        q: "Does tight glucose control typically improve the skin lesions of Necrobiosis Lipoidica?",
        options: ["Yes, they disappear", "No, NL does not necessarily mirror glycemic control", "Only in Type 2 Diabetes", "None"],
        ans: 1,
        exp: "Unlike other complications, NL is notoriously independent of A1c levels."
      },
      {
        q: "What is the primary treatment for active, inflammatory NL?",
        options: ["Oral antibiotics", "Potent topical or intralesional corticosteroids", "Insulin only", "None"],
        ans: 1,
        exp: "Steroids help reduce the inflammation at the active borders."
      },
      {
        q: "What is a significant risk for the atrophic skin in NL?",
        options: ["Infection", "Ulceration (which is often difficult to heal)", "Turning into a mole", "None"],
        ans: 1,
        exp: "Minor trauma to the thinned skin can lead to painful, chronic ulcers."
      }
    ]
  },
  {
    title: "The Prickly Heat",
    scenario: "A 5-year-old child is brought in during a heatwave with a 'prickly' red rash on his back and neck.\n\nVitals: Normal.\nPhysical Examination: Multiple tiny (1-2 mm) erythematous papules and vesicles in areas of occlusion (back, neck folds).\nLaboratory Results: None.",
    disease: "Miliaria (Heat Rash)",
    questions: [
      {
        q: "What is the underlying cause of Miliaria?",
        options: ["Allergy to sweat", "Obstruction of the eccrine sweat ducts", "Bacterial infection", "None"],
        ans: 1,
        exp: "Sweat is trapped in the skin, causing inflammation."
      },
      {
        q: "What is the best management step?",
        options: ["Topical antibiotics", "Cooling the environment, wearing loose clothing, and avoiding heavy creams/ointments", "Oral steroids", "Scrubbing the skin"],
        ans: 1,
        exp: "Reducing sweating and allowing the ducts to clear is the primary treatment."
      },
      {
        q: "Which type of Miliaria presents with 'crystal-like' tiny clear vesicles that pop easily?",
        options: ["Miliaria rubra", "Miliaria crystallina", "Miliaria profunda", "None"],
        ans: 1,
        exp: "This is the most superficial form of sweat duct obstruction."
      }
    ]
  },
  {
    title: "The Smelly, Pitted Feet",
    scenario: "A 20-year-old athlete presents with extremely smelly feet and 'little holes' in his soles.\n\nVitals: Normal.\nPhysical Examination: Multiple 1-3 mm 'punched-out' pits in the thickened stratum corneum of the weight-bearing areas of the soles. The area is slimy and has a strong odor.\nLaboratory Results: None.",
    disease: "Pitted Keratolysis",
    questions: [
      {
        q: "What is the cause of Pitted Keratolysis?",
        options: ["Fungus", "Superficial bacterial infection (e.g., Kytococcus sedentarius) in a moist environment", "Acid reflux", "None"],
        ans: 1,
        exp: "Bacteria produce enzymes that digest the keratin of the sole."
      },
      {
        q: "What is the best initial treatment?",
        options: ["Topical antifungals", "Topical antibiotics (e.g., Erythromycin or Clindamycin) and keeping the feet dry", "Oral steroids", "None"],
        ans: 1,
        exp: "Topical antibiotics are curative."
      },
      {
        q: "What contributes to the characteristic odor?",
        options: ["Pus", "Sulfur-containing compounds produced by the bacteria", "Dirt", "None"],
        ans: 1,
        exp: "The 'rotten egg' smell is a classic clinical clue."
      }
    ]
  }
];
