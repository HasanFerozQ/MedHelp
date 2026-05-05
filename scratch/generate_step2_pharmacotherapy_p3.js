module.exports = [
  {
    title: "The Itchy Patient and the Permethrin",
    scenario: "A family of four is treated for scabies with Permethrin 5% cream. One week later, the mother is still itching intensely.\n\nVitals: Normal.\nPhysical Examination: No new burrows, but the skin is dry and erythematous.\nLaboratory Results: None.",
    disease: "Post-Scabietic Itch",
    questions: [
      {
        q: "Itching that persists for up to 2-4 weeks AFTER successful scabies treatment is most likely due to:",
        options: ["Re-infection", "A hypersensitivity reaction to dead mites and their debris (post-scabietic dermatitis)", "Treatment failure", "None"],
        ans: 1,
        exp: "The immune system continues to react to the persistent antigens."
      },
      {
        q: "What is the best management for post-scabietic itch?",
        options: ["Immediate re-treatment with Permethrin", "Topical steroids and oral antihistamines", "Oral antibiotics", "None"],
        ans: 1,
        exp: "Re-treatment should be avoided unless new burrows or lesions are seen, as Permethrin itself can be irritating."
      },
      {
        q: "When is a patient considered 'non-infectious' after Permethrin application?",
        options: ["Immediately after washing off the first treatment", "After 1 week", "After 1 month", "None"],
        ans: 0,
        exp: "One thorough application usually kills all active mites."
      }
    ]
  },
  {
    title: "The 'Psoriasis' and the 'Calcipotriene'",
    scenario: "A patient with stable plaque psoriasis is prescribed Calcipotriene cream.\n\nVitals: Normal.\nPhysical Examination: Plaques.\nLaboratory Results: None.",
    disease: "Calcipotriene (Vitamin D Analog)",
    questions: [
      {
        q: "What is the mechanism of action of Calcipotriene?",
        options: ["Inhibits keratinocyte proliferation and promotes differentiation", "Blocks histamine", "Kills bacteria", "None"],
        ans: 0,
        exp: "It binds to the Vitamin D receptor to normalize skin cell growth."
      },
      {
        q: "Calcipotriene is most effective when used in combination with which other therapy?",
        options: ["Antifungals", "Topical corticosteroids (often used as a fixed-combination product)", "Antibiotics", "None"],
        ans: 1,
        exp: "The combination (e.g., Taclonex) is more effective and less irritating than either alone."
      },
      {
        q: "What is a potential, though rare, systemic side effect of using excessive amounts of Calcipotriene (>100g/week)?",
        options: ["Anemia", "Hypercalcemia (due to systemic absorption of the Vit D analog)", "Liver failure", "None"],
        ans: 1,
        exp: "Strict quantity limits are recommended to avoid metabolic effects."
      }
    ]
  },
  {
    title: "The 'Acne' and the 'Benzoyl Peroxide'",
    scenario: "A 16-year-old is using a benzoyl peroxide wash. He notices his 'towels and shirts' are developing white spots.\n\nVitals: Normal.\nPhysical Examination: Acne.\nLaboratory Results: None.",
    disease: "Benzoyl Peroxide (Counseling)",
    questions: [
      {
        q: "What is the primary antibacterial mechanism of Benzoyl Peroxide?",
        options: ["Blocks tRNA", "Releases oxygen (free radicals) that kills anaerobic C. acnes", "Inhibits cell wall", "None"],
        ans: 1,
        exp: "It is a potent bactericidal agent with no known resistance."
      },
      {
        q: "What should you counsel the patient regarding his clothing and towels?",
        options: ["It will cause a rash on the clothes", "It can bleach colored fabrics", "It makes clothes catch fire", "None"],
        ans: 1,
        exp: "Bleaching of fabric is a classic and very common 'real-world' counseling point."
      },
      {
        q: "How does Benzoyl Peroxide help prevent antibiotic resistance in acne?",
        options: ["It doesn't", "When used in combination, it prevents the development of resistant C. acnes strains", "It makes the antibiotic stronger", "None"],
        ans: 1,
        exp: "Combination therapy (BP + Antibiotic) is the standard of care for this reason."
      }
    ]
  },
  {
    title: "The 'Lupus' and the 'Puffy' Face (Management)",
    scenario: "A patient on Prednisone has been diagnosed with steroid-induced diabetes.\n\nVitals: Normal.\nPhysical Examination: Moon facies.\nLaboratory Results: Post-prandial blood sugar 250.",
    disease: "Steroid-induced Diabetes Management",
    questions: [
      {
        q: "Steroid-induced hyperglycemia typically peaks at what time of day?",
        options: ["Fasting (early morning)", "Afternoon and evening (due to the morning dosing of steroids)", "Middle of the night", "None"],
        ans: 1,
        exp: "Glucocorticoid effects on blood sugar usually follow the dosing schedule."
      },
      {
        q: "What is the best initial approach to management in a non-diabetic patient who develops steroid-induced hyperglycemia?",
        options: ["Diet only", "Oral hypoglycemics or insulin (often NPH is used to match the steroid peak)", "Stop steroids immediately", "None"],
        ans: 1,
        exp: "Management must be active if the hyperglycemia is significant."
      },
      {
        q: "Will the diabetes resolve after the steroids are stopped?",
        options: ["Always", "Usually, but it may unmask permanent Type 2 Diabetes in predisposed individuals", "Never", "None"],
        ans: 1,
        exp: "The 'steroid stress test' can reveal underlying metabolic weakness."
      }
    ]
  },
  {
    title: "The 'Wart' and the 'Podophyllin'",
    scenario: "A patient with genital warts is treated with Podophyllin resin in the office.\n\nVitals: Normal.\nPhysical Examination: Condyloma acuminata.\nLaboratory Results: None.",
    disease: "Podophyllin/Podofilox (Management)",
    questions: [
      {
        q: "What is the mechanism of action of Podophyllin?",
        options: ["Immune stimulant", "Antimitotic agent (blocks spindle formation in mitosis)", "Acid", "None"],
        ans: 1,
        exp: "It is derived from the Mayapple plant."
      },
      {
        q: "What is the most important instruction for the patient after an 'in-office' application of Podophyllin resin?",
        options: ["Leave it on for 24 hours", "Wash the area thoroughly after 4-6 hours to prevent severe chemical irritation/burn", "Apply more at home", "None"],
        ans: 1,
        exp: "Resin application requires strict timing and washing."
      },
      {
        q: "Is Podophyllin safe for use in pregnancy?",
        options: ["Yes", "No (Category X - teratogenic and potential fetal risk)", "Only in the 3rd trimester", "None"],
        ans: 1,
        exp: "It is strictly contraindicated in pregnancy."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Urea'",
    scenario: "A patient with very dry, scaly feet is prescribed 40% Urea cream.\n\nVitals: Normal.\nPhysical Examination: Thick, hyperkeratotic soles.\nLaboratory Results: None.",
    disease: "Urea (Keratolytic)",
    questions: [
      {
        q: "How does Urea help dry, thickened skin?",
        options: ["It adds oil", "It is a keratolytic (breaks down keratin) and a humectant (draws water into the skin)", "It kills fungus", "None"],
        ans: 1,
        exp: "At high concentrations (>20%), it is an effective keratolytic."
      },
      {
        q: "Which other condition is high-concentration Urea used for?",
        options: ["Acne", "Nonsurgical avulsion of a thickened or fungal nail (softens the nail plate)", "Itch", "None"],
        ans: 1,
        exp: "It can be used to 'melt' away a diseased nail."
      },
      {
        q: "What is a common side effect of applying high-concentration Urea to cracked or eroded skin?",
        options: ["Hair growth", "Intense stinging and irritation", "Numbness", "None"],
        ans: 1,
        exp: "It should only be applied to intact, thickened skin."
      }
    ]
  },
  {
    title: "The 'Pemphigus' and the 'Mycophenolate'",
    scenario: "A patient is starting Mycophenolate Mofetil (CellCept) for a blistering disease.\n\nVitals: Normal.\nPhysical Examination: Blisters.\nLaboratory Results: None.",
    disease: "Mycophenolate Mofetil (Pharmacology)",
    questions: [
      {
        q: "What is the mechanism of action of Mycophenolate Mofetil?",
        options: ["Blocks TNF", "Inhibits inosine monophosphate dehydrogenase (IMPDH), blocking de novo purine synthesis in lymphocytes", "Blocks folate", "None"],
        ans: 1,
        exp: "Lymphocytes are particularly dependent on the de novo pathway, making the drug relatively selective."
      },
      {
        q: "What is the most common dose-limiting side effect of Mycophenolate?",
        options: ["Kidney failure", "Gastrointestinal upset (diarrhea, bloating, cramping)", "Hair loss", "None"],
        ans: 1,
        exp: "GI symptoms are frequent and often require dose titration or switching to the enteric-coated form."
      },
      {
        q: "Is Mycophenolate safe in pregnancy?",
        options: ["Yes", "No (highly teratogenic; associated with characteristic 'Mycophenolate embryopathy')", "Only for small doses", "None"],
        ans: 1,
        exp: "Strict birth control is required for women of childbearing age."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Doxepin' Trap",
    scenario: "A patient with chronic eczema is given topical Doxepin cream for severe itching. She develops profound sleepiness.\n\nVitals: Normal.\nPhysical Examination: Drowsy.",
    disease: "Topical Doxepin (Absorption)",
    questions: [
      {
        q: "What class of medication is Doxepin?",
        options: ["Antihistamine", "Tricyclic Antidepressant (TCA) with potent H1 and H2 blocking activity", "Steroid", "None"],
        ans: 1,
        exp: "It is a TCA used topically for its extremely strong anti-itch properties."
      },
      {
        q: "Why can topical Doxepin cause systemic sedation?",
        options: ["It smells like sleep medicine", "Significant systemic absorption can occur, especially when applied to large areas or broken skin", "It's an allergy", "None"],
        ans: 1,
        exp: "Topicals can have systemic effects."
      },
      {
        q: "Which patient population should be especially cautious with topical Doxepin?",
        options: ["Children", "The elderly (due to anticholinergic side effects and fall risk)", "Wrestlers", "None"],
        ans: 1,
        exp: "Like oral TCAs, the side effect profile is problematic in the elderly."
      }
    ]
  },
  {
    title: "The 'Wart' and the 'Imiquimod'",
    scenario: "A patient is using Imiquimod 5% cream for a basal cell carcinoma on his arm. The area has become bright red, swollen, and crusty.\n\nVitals: Normal.\nPhysical Examination: Intense inflammatory reaction at the site of application.\nLaboratory Results: None.",
    disease: "Imiquimod (Mechanism/Side Effects)",
    questions: [
      {
        q: "What is the mechanism of action of Imiquimod?",
        options: ["Toxic to cells", "Toll-like receptor 7 (TLR7) agonist that stimulates the innate immune response (IFN-alpha production)", "Acid", "None"],
        ans: 1,
        exp: "It is an immune response modifier."
      },
      {
        q: "Does the intense inflammatory reaction mean the drug should be stopped immediately?",
        options: ["Yes, it's an allergy", "No, the inflammatory response is part of the therapeutic mechanism (the immune system attacking the tumor/virus)", "Only if it bleeds", "None"],
        ans: 1,
        exp: "A 'brisk' reaction often correlates with better clinical outcomes."
      },
      {
        q: "What 'Flu-like' symptoms can occur with widespread Imiquimod use?",
        options: ["Fever, malaise, and myalgias (due to systemic cytokine release)", "Cough", "Diarrhea", "None"],
        ans: 0,
        exp: "Systemic absorption can lead to a systemic cytokine response."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Camphor/Menthol'",
    scenario: "A patient with 'winter itch' uses a lotion containing camphor and menthol.\n\nVitals: Normal.\nPhysical Examination: Dry skin.\nLaboratory Results: None.",
    disease: "Counter-Irritants (Anti-pruritics)",
    questions: [
      {
        q: "How do camphor and menthol provide relief from itching?",
        options: ["They numb the skin", "They stimulate 'cool' receptors (TRPM8), providing a distracting sensation that suppresses the 'itch' signal", "They kill bacteria", "None"],
        ans: 1,
        exp: "The 'cool' sensation travels via faster nerve fibers, overriding the slower 'itch' fibers."
      },
      {
        q: "Why should Camphor-containing products be used with extreme caution in young children?",
        options: ["They cause rashes", "Risk of severe systemic toxicity (seizures, CNS depression) if ingested or absorbed in large amounts", "They smell bad", "None"],
        ans: 1,
        exp: "Camphor toxicity is a pediatric emergency."
      },
      {
        q: "What is the 'anti-pruritic' effect of topical Pramoxine?",
        options: ["Steroid-like", "Local anesthetic (blocks sodium channels)", "Antifungal", "None"],
        ans: 1,
        exp: "Pramoxine is a common ingredient in anti-itch lotions like Sarna."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Biopsy' (Reasoning)",
    scenario: "A patient with a suspected drug rash is getting a skin biopsy.\n\nVitals: Normal.\nPhysical Examination: Rash.\nLaboratory Results: None.",
    disease: "Skin Biopsy (Context)",
    questions: [
      {
        q: "A 'Shave' biopsy is generally inappropriate for which suspected condition?",
        options: ["Acne", "Pigmented lesions suspected of being Melanoma (where depth is key)", "Warts", "Seborrheic keratosis"],
        ans: 1,
        exp: "Full-depth information is required for melanoma staging."
      },
      {
        q: "What is the 'Best' location to biopsy an active, expanding skin infection or inflammatory plaque?",
        options: ["The center (which may be necrotic or clear)", "The active, advancing edge", "The normal skin nearby", "None"],
        ans: 1,
        exp: "The edge contains the most active pathologic process."
      },
      {
        q: "For Direct Immunofluorescence (DIF) in blistering diseases, where should the biopsy be taken?",
        options: ["Directly from a blister", "From perilesional (normal-appearing) skin adjacent to a blister", "The bottom of the foot", "None"],
        ans: 1,
        exp: "Blistering involves destruction of the proteins being tested; perilesional skin preserves the immunoreactants."
      }
    ]
  },
  {
    title: "The 'Psoriasis' and the 'Coal Tar'",
    scenario: "A patient is using an 'old-fashioned' coal tar preparation for his scalp psoriasis.\n\nVitals: Normal.\nPhysical Examination: Scaly scalp.\nLaboratory Results: None.",
    disease: "Coal Tar (Pharmacotherapy)",
    questions: [
      {
        q: "What is the primary drawback of coal tar therapy for most patients?",
        options: ["It is dangerous", "It is messy, has a strong odor, and can stain clothing/hair", "It is a pill", "None"],
        ans: 1,
        exp: "Patient compliance is often low due to cosmetic factors."
      },
      {
        q: "What is a recognized side effect of tar application on sun-exposed skin?",
        options: ["Photosensitivity (and potential tar-UV carcinogenesis in the 'Goeckerman regimen')", "Numbness", "Fungus", "None"],
        ans: 0,
        exp: "Tar is a photosensitizer."
      },
      {
        q: "What is the 'Goeckerman Regimen'?",
        options: ["A diet", "The combination of topical crude coal tar and UV light for severe psoriasis", "A type of surgery", "None"],
        ans: 1,
        exp: "It is one of the most effective historical treatments for severe psoriasis."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Selenium'",
    scenario: "A patient with tinea versicolor is using 2.5% Selenium Sulfide lotion.\n\nVitals: Normal.\nPhysical Examination: White spots.\nLaboratory Results: None.",
    disease: "Selenium Sulfide (Mechanism)",
    questions: [
      {
        q: "What is the primary action of Selenium Sulfide?",
        options: ["Antibiotic", "Cytostatic (decreases epidermal turnover) and antifungal (against Malassezia)", "Steroid", "None"],
        ans: 1,
        exp: "It is used for both seborrheic dermatitis and tinea versicolor."
      },
      {
        q: "What should you warn the patient about regarding jewelry when using Selenium Sulfide?",
        options: ["It will break the jewelry", "It can tarnish silver jewelry", "It turns gold to lead", "None"],
        ans: 1,
        exp: "A common 'real-world' counseling point."
      },
      {
        q: "Can it be used on the scalp for dandruff?",
        options: ["No", "Yes, it is a common ingredient in OTC and prescription dandruff shampoos", "Only if the patient is bald", "None"],
        ans: 1,
        exp: "It is highly effective for seborrheic dermatitis of the scalp."
      }
    ]
  },
  {
    title: "The 'Acne' and the 'Clindamycin'",
    scenario: "A patient is using a topical clindamycin/benzoyl peroxide gel.\n\nVitals: Normal.\nPhysical Examination: Acne.\nLaboratory Results: None.",
    disease: "Topical Antibiotics (Resistance Management)",
    questions: [
      {
        q: "Why should topical antibiotics for acne NOT be used as monotherapy?",
        options: ["They don't work", "High risk of developing bacterial resistance (especially C. acnes)", "They are too strong", "None"],
        ans: 1,
        exp: "Monotherapy is a major driver of antibiotic resistance in the community."
      },
      {
        q: "What is the most common agent added to topical antibiotics to prevent resistance?",
        options: ["Retinoids", "Benzoyl Peroxide", "Steroids", "None"],
        ans: 1,
        exp: "BP is bactericidal and kills resistant organisms."
      },
      {
        q: "Which systemic 'GI' side effect is extremely rare but theoretically possible with topical Clindamycin absorption?",
        options: ["Constipation", "Pseudomembranous colitis (C. difficile infection)", "Acid reflux", "None"],
        ans: 1,
        exp: "While very rare with topicals, the warning remains due to its systemic profile."
      }
    ]
  },
  {
    title: "The 'Psoriasis' and the 'Anthralin'",
    scenario: "A patient is using Anthralin for a thick plaque of psoriasis.\n\nVitals: Normal.\nPhysical Examination: Plaque.\nLaboratory Results: None.",
    disease: "Anthralin (Pharmacotherapy)",
    questions: [
      {
        q: "What is a major counseling point for Anthralin application?",
        options: ["Apply and leave on all day", "Short-contact therapy (apply for 10-30 minutes and wash off) to avoid severe irritation of surrounding normal skin", "It smells like flowers", "None"],
        ans: 1,
        exp: "Anthralin is very irritating to non-lesional skin."
      },
      {
        q: "What is the 'staining' profile of Anthralin?",
        options: ["Doesn't stain", "Can cause purple-brown staining of skin, nails, and clothing", "Turns skin blue", "None"],
        ans: 1,
        exp: "The staining is a major deterrent for many patients."
      },
      {
        q: "Anthralin is a synthetic derivative of what natural substance?",
        options: ["Coal", "Chrysarobin (from the Araroba tree)", "Honey", "None"],
        ans: 1,
        exp: "It has been used for over a century for psoriasis."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Lindane' Trap",
    scenario: "A student asks about using Lindane for head lice.\n\nVitals: Normal.\nPhysical Examination: Nits in the hair.\nLaboratory Results: None.",
    disease: "Lindane (Safety Warnings)",
    questions: [
      {
        q: "Why is Lindane now considered a 'Last-Resort' treatment for lice and scabies?",
        options: ["It is too expensive", "Significant risk of neurotoxicity (seizures) especially in children, the elderly, and those < 50kg", "It doesn't work", "None"],
        ans: 1,
        exp: "It has been banned in many regions (e.g., California) due to environmental and safety concerns."
      },
      {
        q: "Lindane is contraindicated in patients with which underlying condition?",
        options: ["Diabetes", "Seizure disorders", "Asthma", "None"],
        ans: 1,
        exp: "It directly lowers the seizure threshold."
      },
      {
        q: "What is the preferred first-line treatment for head lice?",
        options: ["Lindane", "Permethrin 1% or Pyrethrins", "Vinegar only", "None"],
        ans: 1,
        exp: "Less toxic alternatives are always preferred first."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Steroid' Taper (Reasoning)",
    scenario: "A patient on 60mg of Prednisone for 4 weeks for a severe drug rash is being tapered off.\n\nVitals: Normal.\nPhysical Examination: Rash is gone.\nLaboratory Results: None.",
    disease: "Adrenal Suppression (Algorithm)",
    questions: [
      {
        q: "At what point in steroid therapy is the HPA axis considered 'suppressed', requiring a taper?",
        options: ["After 1 dose", "Usually after 2-3 weeks of continuous systemic therapy", "After 1 year", "None"],
        ans: 1,
        exp: "Brief courses ( < 10-14 days) can often be stopped without a taper."
      },
      {
        q: "What is the primary risk of stopping long-term steroids 'Cold Turkey'?",
        options: ["The rash comes back", "Acute Adrenal Crisis (hypotension, shock, death)", "Weight gain", "None"],
        ans: 1,
        exp: "The body cannot immediately resume endogenous cortisol production."
      },
      {
        q: "What is a 'Stress Dose' of steroids?",
        options: ["A very small dose", "An increased dose given to patients with HPA suppression during times of physical stress (e.g., surgery, severe infection)", "A dose given for anxiety", "None"],
        ans: 1,
        exp: "The suppressed axis cannot respond to the increased demand of stress."
      }
    ]
  },
  {
    title: "The 'Acne' and the 'Spironolactone'",
    scenario: "A 25-year-old woman with 'hormonal' acne (worsening before her period, located on the jawline) is starting Spironolactone.\n\nVitals: Normal.\nPhysical Examination: Inflammatory papules on the chin and jawline.\nLaboratory Results: None.",
    disease: "Spironolactone (Acne)",
    questions: [
      {
        q: "What is the mechanism of Spironolactone in acne?",
        options: ["Antibiotic", "Anti-androgen (blocks the androgen receptor and inhibits 5-alpha reductase)", "Steroid", "None"],
        ans: 1,
        exp: "It reduces the androgenic stimulation of sebaceous glands."
      },
      {
        q: "Which electrolyte must be monitored in older patients or those on other similar medications?",
        options: ["Sodium", "Potassium (risk of Hyperkalemia)", "Calcium", "None"],
        ans: 1,
        exp: "Spironolactone is a potassium-sparing diuretic."
      },
      {
        q: "What is a common side effect of Spironolactone in women?",
        options: ["Hair loss", "Menstrual irregularities and breast tenderness", "Weight gain", "None"],
        ans: 1,
        exp: "These are related to its hormonal effects."
      }
    ]
  },
  {
    title: "The 'Psoriasis' and the 'Cyclosporine' (Reasoning)",
    scenario: "A patient on Cyclosporine for severe psoriasis is asking about getting a flu vaccine.\n\nVitals: Normal.\nPhysical Examination: Plaques.\nLaboratory Results: None.",
    disease: "Vaccination and Immunosuppression",
    questions: [
      {
        q: "Which type of vaccine is generally CONTRAINDICATED in patients on potent immunosuppression (e.g., Cyclosporine, Methotrexate, Biologics)?",
        options: ["Inactivated vaccines (e.g., standard flu shot)", "Live-attenuated vaccines (e.g., MMR, Varicella, Yellow Fever)", "mRNA vaccines", "None"],
        ans: 1,
        exp: "The immune system may not be able to contain the live virus, leading to disseminated infection."
      },
      {
        q: "Is the 'Inactivated' (injected) flu shot safe for these patients?",
        options: ["No", "Yes, but it may be less effective (lower antibody response)", "Only if they are young", "None"],
        ans: 1,
        exp: "Inactivated vaccines are safe but efficacy may be reduced."
      },
      {
        q: "How long should a patient wait after stopping a biologic before receiving a live vaccine?",
        options: ["1 day", "Usually 4-12 weeks depending on the drug half-life", "1 year", "None"],
        ans: 1,
        exp: "Waiting allows for 'washout' and immune recovery."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Emollient' (Reasoning)",
    scenario: "A parent asks about the best type of moisturizer for their child with severe eczema.\n\nVitals: Normal.\nPhysical Examination: Eczema.\nLaboratory Results: None.",
    disease: "Emollients (Rational Selection)",
    questions: [
      {
        q: "In terms of 'water-trapping' efficacy, which is superior for severe dry skin?",
        options: ["Lotion", "Ointment (e.g., Petroleum jelly/Vaseline)", "Cream", "None"],
        ans: 1,
        exp: "Ointments are occlusive and prevent the most transepidermal water loss."
      },
      {
        q: "Why do many children 'hate' ointments despite their efficacy?",
        options: ["They smell bad", "They are greasy and sticky", "They sting", "None"],
        ans: 1,
        exp: "Greasiness is the major barrier to compliance with ointment therapy."
      },
      {
        q: "What is the best time to apply a moisturizer for maximal effect?",
        options: ["Right before bed", "Immediately after bathing (within 3 minutes) to 'lock in' the moisture", "Whenever it feels dry", "None"],
        ans: 1,
        exp: "This is a key 'Step' counseling point for atopic dermatitis management."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Imiquimod' (Follow-up)",
    scenario: "A patient using Imiquimod for actinic keratoses on his scalp develops a fever and muscle aches.\n\nVitals: T 38.2 C.\nPhysical Examination: Inflammation at the application site.\nLaboratory Results: None.",
    disease: "Imiquimod (Flu-like Syndrome)",
    questions: [
      {
        q: "What is the cause of the fever in this patient?",
        options: ["Infection of the scalp", "Systemic absorption and cytokine release (IFN-alpha)", "Allergy", "None"],
        ans: 1,
        exp: "Flu-like symptoms are a recognized systemic side effect of topical imiquimod."
      },
      {
        q: "What is the best management?",
        options: ["IV Antibiotics", "Reduce the frequency of application or take a 'drug holiday' for 1-2 weeks", "Give a flu shot", "None"],
        ans: 1,
        exp: "Dosing adjustments usually resolve the systemic symptoms."
      },
      {
        q: "Is this reaction more common with large-area application?",
        options: ["Yes", "No", "Only in women", "None"],
        ans: 0,
        exp: "Increased surface area leads to increased absorption."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Capsaicin'",
    scenario: "A patient with post-herpetic neuralgia uses a cream containing capsaicin.\n\nVitals: Normal.\nPhysical Examination: Healed zoster scars.\nLaboratory Results: None.",
    disease: "Capsaicin (Pharmacology)",
    questions: [
      {
        q: "Capsaicin is the 'active' component of which plant?",
        options: ["Poppy", "Chili peppers", "Garlic", "None"],
        ans: 1,
        exp: "It is the substance that makes peppers 'hot'."
      },
      {
        q: "What is the mechanism of action for pain relief?",
        options: ["It numbs the skin", "Depletion of Substance P from local sensory nerve endings after initial stimulation", "Blocks sodium channels", "None"],
        ans: 1,
        exp: "After the initial 'burn', the nerves are temporarily unable to transmit pain."
      },
      {
        q: "What is the major side effect?",
        options: ["Drowsiness", "Intense burning and stinging at the site of application", "Numbness", "None"],
        ans: 1,
        exp: "Patients must be warned that it 'gets worse before it gets better'."
      }
    ]
  },
  {
    title: "The 'Acne' and the 'Laser'",
    scenario: "A patient wants to know if they can get a laser treatment for their acne scars while taking Isotretinoin.\n\nVitals: Normal.\nPhysical Examination: Scars.\nLaboratory Results: None.",
    disease: "Isotretinoin and Procedures",
    questions: [
      {
        q: "Historically, how long was it recommended to wait AFTER finishing Isotretinoin before undergoing elective procedures like dermabrasion or laser resurfacing?",
        options: ["1 day", "6-12 months (due to concern for impaired wound healing and keloid formation)", "1 week", "None"],
        ans: 1,
        exp: "While newer evidence suggests some procedures are safe, 6-12 months remains the traditional 'safe' window in many guidelines."
      },
      {
        q: "Why is wound healing a concern with Isotretinoin?",
        options: ["It causes infection", "It affects the skin's ability to produce collagen and repair itself correctly", "It makes the blood thin", "None"],
        ans: 1,
        exp: "Retinoids significantly alter keratinocyte and fibroblast function."
      },
      {
        q: "Is hair removal (waxing) safe on Isotretinoin?",
        options: ["Yes", "No, it can lead to 'skin lifting' or tearing because the skin is so fragile", "Only if the hair is long", "None"],
        ans: 1,
        exp: "Waxing is strictly avoided during isotretinoin therapy."
      }
    ]
  },
  {
    title: "The 'Pemphigus' and the 'Azathioprine' (Follow-up)",
    scenario: "A patient on Azathioprine develops a viral upper respiratory infection.\n\nVitals: Normal.\nPhysical Examination: Congestion.\nLaboratory Results: WBC 2.5 (Low).",
    disease: "Azathioprine Leukopenia",
    questions: [
      {
        q: "What is the next step in management for a patient on Azathioprine with a WBC count < 3.0?",
        options: ["Keep the dose the same", "Hold the medication and monitor blood counts until they recover", "Give more Azathioprine", "None"],
        ans: 1,
        exp: "Significant leukopenia is a reason to hold therapy to prevent opportunistic infection."
      },
      {
        q: "Should the dose be adjusted if it is restarted?",
        options: ["No", "Yes, usually restarted at a lower dose after blood count recovery", "Only in children", "None"],
        ans: 1,
        exp: "Dose reduction helps prevent recurrence of toxicity."
      },
      {
        q: "What is a long-term risk of chronic immunosuppression with Azathioprine?",
        options: ["Skin cancer and Lymphoma", "Diabetes", "Heart disease", "None"],
        ans: 0,
        exp: "Chronic B-cell and T-cell suppression carries a slight increase in malignancy risk."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Pimecrolimus'",
    scenario: "A 2-year-old child with mild facial eczema is starting Pimecrolimus (Elidel) cream.\n\nVitals: Normal.\nPhysical Examination: Eczema.\nLaboratory Results: None.",
    disease: "Pimecrolimus vs. Tacrolimus",
    questions: [
      {
        q: "Which topical calcineurin inhibitor is generally considered 'less potent' and preferred for mild disease?",
        options: ["Tacrolimus (Protopic)", "Pimecrolimus (Elidel)", "They are the same", "None"],
        ans: 1,
        exp: "Pimecrolimus is the 'milder' of the two TCIs."
      },
      {
        q: "What is the 'Black Box Warning' for both topical calcineurin inhibitors?",
        options: ["Kidney failure", "Potential (though controversial) risk of malignancy based on high-dose animal studies", "Heart attack", "None"],
        ans: 1,
        exp: "The long-term safety regarding skin cancer and lymphoma remains a point of counseling."
      },
      {
        q: "Are TCIs effective for 'Acute, weeping' flares of eczema?",
        options: ["Yes", "No, they are better for maintenance and 'subacute' disease; acute flares often require steroids", "Only in the sun", "None"],
        ans: 1,
        exp: "Steroids are still faster for acute 'hot' inflammation."
      }
    ]
  },
  {
    title: "The 'Psoriasis' and the 'Taper' (Reasoning)",
    scenario: "A patient with psoriasis and a severe ear infection is given a 'Medrol Dosepak' (6-day steroid taper).\n\nVitals: Normal.\nPhysical Examination: Ear swelling.\nLaboratory Results: None.",
    disease: "Steroid Taper in Psoriasis (The Trap)",
    questions: [
      {
        q: "Is a short 6-day steroid taper (like a Dosepak) 'safe' for a patient with extensive plaque psoriasis?",
        options: ["Yes, it's too short to cause problems", "No, even short courses can trigger severe rebound psoriasis flares", "Only if they take it with milk", "None"],
        ans: 1,
        exp: "Any dose of systemic steroid carries a risk in psoriasis patients."
      },
      {
        q: "What is the 'Best' way to treat an ear infection in a psoriasis patient to avoid this risk?",
        options: ["Systemic steroids", "Topical antibiotic/steroid drops (which have minimal systemic absorption)", "Observation only", "None"],
        ans: 1,
        exp: "Localized therapy is always preferred."
      },
      {
        q: "If the patient MUST have systemic steroids for a life-threatening reason (e.g., severe asthma), what should the dermatologist do?",
        options: ["Nothing", "Monitor closely and prepare to start rapid-acting psoriasis meds (like Cyclosporine) if a flare occurs during the taper", "Stop the steroid mid-way", "None"],
        ans: 1,
        exp: "Management of the whole patient requires risk-benefit balancing."
      }
    ]
  },
  {
    title: "The 'Acne' and the 'Water' (Reasoning)",
    scenario: "A patient is taking Doxycycline for acne. He is confused about why he was told to 'stay upright' after taking the pill.\n\nVitals: Normal.\nPhysical Examination: Acne.\nLaboratory Results: None.",
    disease: "Pill Esophagitis Prevention",
    questions: [
      {
        q: "Which specific drug property of Tetracyclines causes esophagitis?",
        options: ["They are too large", "They are highly acidic when they dissolve, causing direct mucosal injury if they 'get stuck' in the esophagus", "They are bitter", "None"],
        ans: 1,
        exp: "The chemical acidity is the problem."
      },
      {
        q: "What is the '30-minute' rule for taking these medications?",
        options: ["Wait 30 minutes to eat", "Do not lie down for at least 30 minutes after taking the pill", "Take the pill for 30 minutes", "None"],
        ans: 1,
        exp: "This ensures the pill passes safely into the stomach."
      },
      {
        q: "What is the characteristic symptom of pill-induced esophagitis?",
        options: ["Cough", "Sudden-onset retrosternal chest pain and painful swallowing (odynophagia)", "Nausea", "None"],
        ans: 1,
        exp: "This is a classic Step 2 CK clinical presentation."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Pramoxine'",
    scenario: "A patient uses a lotion containing 1% Pramoxine for itching.\n\nVitals: Normal.\nPhysical Examination: Itchy skin.\nLaboratory Results: None.",
    disease: "Pramoxine (Pharmacology)",
    questions: [
      {
        q: "How does Pramoxine differ from Lidocaine or Benzocaine?",
        options: ["It's a steroid", "It is a different class of local anesthetic (ether) that has a lower risk of cross-reactivity and sensitization", "It's an antifungal", "None"],
        ans: 1,
        exp: "Pramoxine is very well-tolerated and commonly used in OTC anti-itch products."
      },
      {
        q: "Is Pramoxine effective for 'Deep' nerve pain (like sciatica)?",
        options: ["Yes", "No, it is only effective for superficial skin itching and minor pain", "Only in large doses", "None"],
        ans: 1,
        exp: "It is a surface-acting anesthetic."
      },
      {
        q: "What is the common brand name for a lotion containing Pramoxine?",
        options: ["Sarna (Sensitive formulation)", "Benadryl", "Vaseline", "None"],
        ans: 0,
        exp: "It is a common high-yield ingredient in anti-pruritic lotions."
      }
    ]
  },
  {
    title: "The 'Pemphigus' and the 'Steroid' Side Effects (Review)",
    scenario: "A patient on Prednisone for 1 year.\n\nVitals: Normal.\nPhysical Examination: Weight gain, facial hair, and easy bruising.\nLaboratory Results: None.",
    disease: "Chronic Steroid Complications (Summary)",
    questions: [
      {
        q: "Which of the following is NOT a classic side effect of long-term systemic corticosteroids?",
        options: ["Cataracts", "Hypotension", "Hyperglycemia", "Myopathy (muscle weakness)"],
        ans: 1,
        exp: "Steroids actually cause hypertension; hypotension is a sign of adrenal insufficiency (withdrawal)."
      },
      {
        q: "Which type of 'Eye' problem is uniquely associated with even low-dose steroids (including topical/inhaled)?",
        options: ["Glaucoma and Posterior Subcapsular Cataracts", "Retinal detachment", "Dry eye", "None"],
        ans: 0,
        exp: "Periodic ophthalmologic monitoring is needed for long-term users."
      },
      {
        q: "What happens to 'Wound Healing' in a patient on steroids?",
        options: ["It speeds up", "It is significantly delayed and the risk of infection is increased", "No change", "None"],
        ans: 1,
        exp: "Steroids inhibit the inflammatory and proliferative phases of healing."
      }
    ]
  },
  {
    title: "The 'Acne' and the 'Azelaic Acid'",
    scenario: "A pregnant woman with acne is asking for a safe treatment option.\n\nVitals: Normal.\nPhysical Examination: Acne.\nLaboratory Results: None.",
    disease: "Azelaic Acid (Pregnancy)",
    questions: [
      {
        q: "What is the pregnancy category of Azelaic Acid?",
        options: ["Category A", "Category B (Considered very safe for both acne and rosacea during pregnancy)", "Category X", "None"],
        ans: 1,
        exp: "It is a first-line choice for pregnant patients."
      },
      {
        q: "Besides acne, Azelaic acid is also effective for which pigmentary condition?",
        options: ["Vitiligo", "Post-inflammatory hyperpigmentation (PIH) and Melasma", "Albinism", "None"],
        ans: 1,
        exp: "It has mild skin-lightening properties."
      },
      {
        q: "What is its mechanism of action?",
        options: ["Kills bacteria", "Antimicrobial, comedolytic, and inhibits tyrosinase", "Acid only", "None"],
        ans: 1,
        exp: "It is a multi-functional agent."
      }
    ]
  }
];
