module.exports = [
  {
    title: "The Potency Ladder",
    scenario: "A 40-year-old male with thick, scaly psoriasis plaques on his elbows and knees is prescribed a topical corticosteroid.\n\nVitals: Normal.\nPhysical Examination: Large, well-demarcated plaques with silver scale on the extensor surfaces.\nLaboratory Results: None.",
    disease: "Psoriasis (Steroid Potency)",
    questions: [
      {
        q: "Which class of topical corticosteroid is most appropriate for thick plaques on the elbows?",
        options: ["Class 7 (Low potency, e.g., Hydrocortisone 1%)", "Class 4 (Medium potency)", "Class 1 (Ultra-high potency, e.g., Clobetasol propionate)", "No steroids should be used"],
        ans: 2,
        exp: "Thick, hyperkeratotic plaques require ultra-high potency steroids for effective penetration."
      },
      {
        q: "If the patient develops psoriasis in his armpits (inverse psoriasis), what should you change?",
        options: ["Use Class 1 steroids", "Switch to a low-potency steroid (Class 6 or 7) or a calcineurin inhibitor", "Use only systemic therapy", "None"],
        ans: 1,
        exp: "Thin-skinned intertriginous areas are highly susceptible to steroid side effects like atrophy and striae; low potency is required."
      },
      {
        q: "What is a common local side effect of chronic, high-potency steroid use on the skin?",
        options: ["Skin thickening", "Skin atrophy, telangiectasias, and striae", "Fungal infection only", "None"],
        ans: 1,
        exp: "Steroids inhibit collagen synthesis, leading to thinning of the dermis."
      }
    ]
  },
  {
    title: "The Retinoid Protocol",
    scenario: "A 20-year-old female with severe, scarring nodulocystic acne is starting oral Isotretinoin.\n\nVitals: Normal.\nPhysical Examination: Multiple deep, painful nodules and cysts on the face and back. Significant scarring is noted.\nLaboratory Results: Negative pregnancy test.",
    disease: "Isotretinoin (Pharmacotherapy)",
    questions: [
      {
        q: "What is the primary mechanism of action of Isotretinoin?",
        options: ["Kills bacteria", "Reduces sebum production, normalizes keratinization, and has anti-inflammatory effects", "Blocks testosterone", "None"],
        ans: 1,
        exp: "Isotretinoin is the only acne medication that targets all four pathogenic factors."
      },
      {
        q: "Which laboratory parameter is most commonly elevated during Isotretinoin therapy?",
        options: ["Serum Creatinine", "Triglycerides", "White blood cell count", "Potassium"],
        ans: 1,
        exp: "Hypertriglyceridemia is a frequent side effect requiring monitoring."
      },
      {
        q: "What is the most common MUCOCUTANEOUS side effect of Isotretinoin?",
        options: ["Hair loss", "Cheilitis (dry, cracked lips)", "Night blindness", "None"],
        ans: 1,
        exp: "Nearly 100% of patients experience dry lips; its absence often suggests non-compliance."
      }
    ]
  },
  {
    title: "The Biologic Revolution",
    scenario: "A 45-year-old male with severe plaque psoriasis (>20% BSA) has failed treatment with Methotrexate. He is being considered for a TNF-alpha inhibitor (e.g., Adalimumab).\n\nVitals: Normal.\nPhysical Examination: Extensive erythematous scaly plaques.\nLaboratory Results: None.",
    disease: "TNF-alpha Inhibitors (Screening)",
    questions: [
      {
        q: "Which screening test is 'Mandatory' before initiating any TNF-alpha inhibitor?",
        options: ["Chest X-ray and Latent TB screening (e.g., PPD or Interferon-gamma release assay)", "Liver biopsy", "Renal ultrasound", "None"],
        ans: 0,
        exp: "TNF-alpha is critical for granuloma maintenance; blocking it can cause reactivation of latent Tuberculosis."
      },
      {
        q: "TNF-alpha inhibitors are contraindicated in patients with which of the following conditions?",
        options: ["Diabetes", "Congestive Heart Failure (NYHA Class III/IV) or Multiple Sclerosis", "Hypertension", "Asthma"],
        ans: 1,
        exp: "TNF inhibitors can worsen CHF and are associated with demyelinating events."
      },
      {
        q: "What is a potential 'Paradoxical' side effect of TNF inhibitors?",
        options: ["Weight loss", "Development of new-onset psoriasis or palmoplantar pustulosis", "Hair growth", "None"],
        ans: 1,
        exp: "Paradoxical psoriasis is a well-recognized adverse event of this drug class."
      }
    ]
  },
  {
    title: "The Antifungal Choice",
    scenario: "A 40-year-old male with Type 2 Diabetes presents with a fungal infection of all 10 toenails.\n\nVitals: Normal.\nPhysical Examination: Thick, yellow, crumbly nails.\nLaboratory Results: Culture confirms Trichophyton rubrum.",
    disease: "Oral Terbinafine",
    questions: [
      {
        q: "What is the mechanism of action of Terbinafine?",
        options: ["Inhibits ergosterol synthesis by blocking lanosterol demethylase", "Inhibits ergosterol synthesis by blocking squalene epoxidase", "Binds to ergosterol directly", "Inhibits DNA synthesis"],
        ans: 1,
        exp: "Terbinafine is a squalene epoxidase inhibitor. (Azoles block lanosterol demethylase)."
      },
      {
        q: "What is the recommended duration of Terbinafine for toenail onychomycosis?",
        options: ["1 week", "2 weeks", "12 weeks", "1 year"],
        ans: 2,
        exp: "12 weeks is standard for toenails; 6 weeks for fingernails."
      },
      {
        q: "Which uncommon but serious side effect can occur with Terbinafine?",
        options: ["Kidney stones", "Hepatotoxicity or taste disturbance (dysgeusia)", "Hearing loss", "None"],
        ans: 1,
        exp: "LFT monitoring is recommended due to the rare risk of liver injury."
      }
    ]
  },
  {
    title: "The Steroid-Sparing Agent",
    scenario: "A patient with severe atopic dermatitis is starting Methotrexate to reduce her reliance on oral Prednisone.\n\nVitals: Normal.\nPhysical Examination: Extensive lichenified eczema.\nLaboratory Results: Normal baseline labs.",
    disease: "Methotrexate (Pharmacology)",
    questions: [
      {
        q: "Methotrexate is an antagonist of which vitamin?",
        options: ["Vitamin C", "Folic Acid (Folate)", "Vitamin B12", "Vitamin D"],
        ans: 1,
        exp: "It inhibits dihydrofolate reductase."
      },
      {
        q: "What is commonly co-administered with Methotrexate to reduce GI and hematologic toxicity?",
        options: ["Vitamin A", "Folic acid (1mg daily or 5mg weekly)", "Iron", "None"],
        ans: 1,
        exp: "Folic acid supplementation significantly reduces common side effects."
      },
      {
        q: "Which 'Red Flag' symptom should a patient on Methotrexate report immediately?",
        options: ["Dry skin", "Dry cough and shortness of breath (suggesting Methotrexate-induced pneumonitis)", "Hunger", "None"],
        ans: 1,
        exp: "Pneumonitis is a rare but life-threatening idiosyncratic reaction."
      }
    ]
  },
  {
    title: "The 'Red Man' and the Vancomycin",
    scenario: "A patient being treated for a MRSA skin infection develops intense flushing and itching of the face and neck shortly after the start of an IV Vancomycin infusion.\n\nVitals: BP 110/70, HR 95.\nPhysical Examination: Erythema of the face, neck, and upper torso. No wheezing or angioedema.\nLaboratory Results: None.",
    disease: "Vancomycin Flushing Syndrome",
    questions: [
      {
        q: "What is the mechanism of 'Red Man Syndrome' (now called Vancomycin Flushing Syndrome)?",
        options: ["IgE-mediated allergy", "Direct, non-immune mast cell degranulation and histamine release", "T-cell reaction", "Fungal overgrowth"],
        ans: 1,
        exp: "It is a pseudoallergic reaction related to the rate of infusion."
      },
      {
        q: "How should this reaction be managed?",
        options: ["Stop infusion and never give Vancomycin again", "Slow the infusion rate and pre-treat with antihistamines", "Give Epinephrine", "None"],
        ans: 1,
        exp: "Slowing the rate usually prevents the reaction."
      },
      {
        q: "Is this a contraindication to future Vancomycin use?",
        options: ["Yes", "No, it is not a true allergy", "Only in children", "None"],
        ans: 1,
        exp: "Unlike anaphylaxis, it does not preclude future use."
      }
    ]
  },
  {
    title: "The Psoriasis Flare and the Steroid",
    scenario: "A patient with stable plaque psoriasis is given a dose of oral Prednisone for a severe poison ivy reaction. Two weeks after stopping the Prednisone, his psoriasis erupts into hundreds of tiny pustules.\n\nVitals: T 38.5 C.\nPhysical Examination: Widespread erythema with thousands of small, sterile pustules (von Zumbusch psoriasis).\nLaboratory Results: WBC 20,000.",
    disease: "Pustular Psoriasis (Steroid Withdrawal)",
    questions: [
      {
        q: "What is the major danger of using systemic corticosteroids in plaque psoriasis?",
        options: ["They don't work", "Risk of life-threatening pustular or erythrodermic flare upon withdrawal", "They cause hair loss", "None"],
        ans: 1,
        exp: "This is a classic USMLE 'don't do' for psoriasis management."
      },
      {
        q: "What is the first-line systemic treatment for acute generalized pustular psoriasis?",
        options: ["More Prednisone", "Oral Acitretin, Cyclosporine, or Infliximab", "Topical antifungals", "None"],
        ans: 1,
        exp: "Rapid-acting systemics are required to stabilize the patient."
      },
      {
        q: "What is a major laboratory finding in these patients?",
        options: ["Anemia", "Hypocalcemia (which can lead to tetany)", "High Vitamin D", "None"],
        ans: 1,
        exp: "Hypocalcemia is a recognized metabolic complication of pustular psoriasis."
      }
    ]
  },
  {
    title: "The Antiviral for the Eyes",
    scenario: "A patient with suspected Zoster Ophthalmicus is started on oral Valacyclovir.\n\nVitals: Normal.\nPhysical Examination: Vesicles in V1 distribution.\nLaboratory Results: Elevated Creatinine (Baseline 1.0, now 1.8).",
    disease: "Acyclovir/Valacyclovir Nephrotoxicity",
    questions: [
      {
        q: "How do Acyclovir and its derivatives (Valacyclovir) cause kidney injury?",
        options: ["Direct tubular necrosis", "Crystal-induced nephropathy (precipitation in renal tubules)", "Allergic interstitial nephritis", "None"],
        ans: 1,
        exp: "High doses or dehydration can lead to obstructive crystal formation."
      },
      {
        q: "What is the best way to prevent this kidney injury?",
        options: ["Give the drug with milk", "Adequate hydration (IV or oral) during therapy", "Combine with a diuretic", "None"],
        ans: 1,
        exp: "Hydration keeps the crystals in solution."
      },
      {
        q: "Valacyclovir is a 'prodrug' of which medication?",
        options: ["Ganciclovir", "Acyclovir", "Foscarnet", "None"],
        ans: 1,
        exp: "It has better oral bioavailability than acyclovir itself."
      }
    ]
  },
  {
    title: "The Eczema and the 'Non-Steroid'",
    scenario: "A 5-year-old child with eczema on the eyelids is prescribed Tacrolimus ointment.\n\nVitals: Normal.\nPhysical Examination: Red, scaly eyelids.\nLaboratory Results: None.",
    disease: "Topical Calcineurin Inhibitors (TCI)",
    questions: [
      {
        q: "What is the primary advantage of TCIs (Tacrolimus, Pimecrolimus) over topical steroids?",
        options: ["They are cheaper", "They do not cause skin atrophy, making them safe for thin-skinned areas like eyelids", "They work faster", "None"],
        ans: 1,
        exp: "TCIs do not inhibit collagen synthesis."
      },
      {
        q: "What is the most common side effect of TCI application?",
        options: ["Skin thinning", "Burning or stinging sensation upon application", "Hair growth", "None"],
        ans: 1,
        exp: "This is a common but transient side effect."
      },
      {
        q: "What is the mechanism of action of Tacrolimus?",
        options: ["Blocks histamine", "Inhibits calcineurin, preventing the activation of T-cells", "Kills bacteria", "None"],
        ans: 1,
        exp: "It is a targeted immunomodulator."
      }
    ]
  },
  {
    title: "The 'Sun-Sensitive' Antibiotic",
    scenario: "A 16-year-old male taking Doxycycline for acne develops a severe sunburn after only 20 minutes outside.\n\nVitals: Normal.\nPhysical Examination: Bright red erythema and edema on sun-exposed areas (face, arms).\nLaboratory Results: None.",
    disease: "Tetracycline Photosensitivity",
    questions: [
      {
        q: "Which type of reaction did this patient experience?",
        options: ["Photoallergic", "Phototoxic (a direct chemical-induced sensitivity to UV light)", "Allergy to the sun", "None"],
        ans: 1,
        exp: "Tetracyclines (especially Doxycycline and Demeclocycline) are classic phototoxic agents."
      },
      {
        q: "Besides photosensitivity, what is a major contraindication for Tetracyclines in children < 8 years old?",
        options: ["Kidney failure", "Permanent tooth discoloration and inhibition of bone growth", "Liver failure", "None"],
        ans: 1,
        exp: "The drug binds to calcium in developing teeth and bones."
      },
      {
        q: "What is the 'pill-induced' complication associated with Tetracyclines if taken right before bed with little water?",
        options: ["Stomach ulcer", "Pill-induced esophagitis", "Kidney stones", "None"],
        ans: 1,
        exp: "Patients should be advised to stay upright and drink plenty of water after taking the pill."
      }
    ]
  },
  {
    title: "The Psoriasis and the 'A' Vitamin",
    scenario: "A woman with plaque psoriasis is prescribed Acitretin.\n\nVitals: Normal.\nPhysical Examination: Scaly plaques.\nLaboratory Results: None.",
    disease: "Acitretin (Oral Retinoid)",
    questions: [
      {
        q: "How long must a woman avoid pregnancy AFTER stopping Acitretin?",
        options: ["1 month", "6 months", "3 years (due to long half-life and re-esterification to etretinate)", "Never"],
        ans: 2,
        exp: "This is a much longer period than Isotretinoin (which is 1 month)."
      },
      {
        q: "What common beverage must be strictly avoided during Acitretin therapy to prevent the formation of etretinate?",
        options: ["Milk", "Alcohol", "Grapefruit juice", "Coffee"],
        ans: 1,
        exp: "Alcohol triggers the conversion of acitretin to etretinate, which is stored in fat for years."
      },
      {
        q: "Acitretin is most effective when used in combination with which other therapy?",
        options: ["Steroids", "UVB Phototherapy (Re-UVB)", "Antibiotics", "None"],
        ans: 1,
        exp: "Retinoids thin the stratum corneum, allowing better UV penetration."
      }
    ]
  },
  {
    title: "The Itch and the 'Old' Antihistamine",
    scenario: "An elderly man takes Diphenhydramine (Benadryl) for itching. His family finds him confused and unable to urinate the next morning.\n\nVitals: Normal.\nPhysical Examination: Disoriented, suprapubic fullness (distended bladder).\nLaboratory Results: None.",
    disease: "First-Generation Antihistamines (Side Effects)",
    questions: [
      {
        q: "Why are first-generation antihistamines (e.g., Diphenhydramine, Hydroxyzine) generally avoided in the elderly?",
        options: ["They don't work", "Potent anticholinergic and sedative effects (confusion, dry mouth, urinary retention)", "They cause weight loss", "None"],
        ans: 1,
        exp: "These are part of the 'Beers Criteria' for potentially inappropriate medications in older adults."
      },
      {
        q: "Which receptor besides H1 do these drugs block to cause these side effects?",
        options: ["Beta receptors", "Muscarinic (Acetylcholine) receptors", "Alpha receptors", "None"],
        ans: 1,
        exp: "The lack of selectivity leads to the anticholinergic profile."
      },
      {
        q: "Which class of antihistamines is preferred for daytime itching in any patient?",
        options: ["First-generation", "Second-generation (e.g., Cetirizine, Loratadine, Fexofenadine)", "None", "Steroids"],
        ans: 1,
        exp: "Second-generation agents are non-sedating and have fewer side effects."
      }
    ]
  },
  {
    title: "The Target and the IL-17",
    scenario: "A patient with severe psoriasis is starting Secukinumab.\n\nVitals: Normal.\nPhysical Examination: Plaques.\nLaboratory Results: None.",
    disease: "IL-17 Inhibitors (Pharmacology)",
    questions: [
      {
        q: "Which specific inflammatory cytokine is targeted by Secukinumab and Ixekizumab?",
        options: ["TNF-alpha", "IL-17A", "IL-23", "IL-4"],
        ans: 1,
        exp: "These are highly effective modern biologics for psoriasis."
      },
      {
        q: "Patients with which underlying condition should avoid IL-17 inhibitors due to the risk of exacerbation?",
        options: ["Diabetes", "Inflammatory Bowel Disease (Crohn's/UC)", "Asthma", "None"],
        ans: 1,
        exp: "IL-17 inhibition has been linked to the worsening of IBD."
      },
      {
        q: "What type of infection is more common in patients taking IL-17 inhibitors?",
        options: ["Bacterial", "Mucocutaneous Candidiasis", "Viral", "None"],
        ans: 1,
        exp: "IL-17 is crucial for host defense against Candida."
      }
    ]
  },
  {
    title: "The Gout Drug and the Rash",
    scenario: "A patient with chronic gout starts Allopurinol. Two weeks later, he develops a high fever, a widespread rash, and swollen lymph nodes.\n\nVitals: T 39.0 C.\nPhysical Examination: Widespread morbilliform rash, facial edema, and lymphadenopathy.\nLaboratory Results: Eosinophilia (WBC 15,000, 15% eosinophils), elevated ALT/AST.",
    disease: "DRESS Syndrome (Allopurinol)",
    questions: [
      {
        q: "What does the acronym DRESS stand for?",
        options: ["Daily Rash and Every Skin Sore", "Drug Reaction with Eosinophilia and Systemic Symptoms", "Dermal Redness and Severe Sepsis", "None"],
        ans: 1,
        exp: "It is a severe, life-threatening drug reaction with internal organ involvement."
      },
      {
        q: "What is the typical 'Latency' (time from drug start to rash) for DRESS?",
        options: ["1 day", "2-8 weeks (longer than simple drug rashes)", "1 year", "None"],
        ans: 1,
        exp: "The long latency is a key diagnostic clue."
      },
      {
        q: "Which organ is most commonly involved in DRESS?",
        options: ["Lungs", "Liver (hepatitis)", "Kidneys", "Brain"],
        ans: 1,
        exp: "Transaminitis is seen in most cases."
      }
    ]
  },
  {
    title: "The Acne and the 'Blue' Pigment",
    scenario: "A 25-year-old male who has been taking Minocycline for acne for 2 years notices his acne scars and shins are turning 'blue-gray'.\n\nVitals: Normal.\nPhysical Examination: Blue-gray pigmentation on the shins and within acne scars on the face.\nLaboratory Results: None.",
    disease: "Minocycline Hyperpigmentation",
    questions: [
      {
        q: "Which medication is most commonly associated with blue-gray skin and mucosal pigmentation?",
        options: ["Doxycycline", "Minocycline", "Amoxicillin", "None"],
        ans: 1,
        exp: "Minocycline can deposit in various tissues including skin, nails, and bones."
      },
      {
        q: "Besides the skin, where else can this pigmentation be seen?",
        options: ["Teeth (in adults)", "Sclera, ears, and oral mucosa", "Hair", "None"],
        ans: 1,
        exp: "It is a widespread deposition phenomenon."
      },
      {
        q: "What is the management for minocycline-induced pigmentation?",
        options: ["More Minocycline", "Discontinue the drug (though pigmentation may persist for a long time)", "Topical Steroids", "None"],
        ans: 1,
        exp: "Immediate cessation is required once noticed."
      }
    ]
  },
  {
    title: "The 'Silver' and the Pregnancy",
    scenario: "A pregnant woman with a small area of impetigo is asking if she can use topical Mupirocin.\n\nVitals: Normal.\nPhysical Examination: Honey-crusted sores.\nLaboratory Results: None.",
    disease: "Topical Antibiotics (Mupirocin)",
    questions: [
      {
        q: "What is the mechanism of action of Mupirocin?",
        options: ["Inhibits cell wall synthesis", "Inhibits bacterial protein synthesis by binding to isoleucyl-tRNA synthetase", "Inhibits DNA", "None"],
        ans: 1,
        exp: "This is a unique mechanism of action for this topical agent."
      },
      {
        q: "Is topical Mupirocin considered safe in pregnancy?",
        options: ["Yes (Category B)", "No", "Only in the 1st trimester", "None"],
        ans: 0,
        exp: "It is widely used and generally considered safe for limited areas."
      },
      {
        q: "Mupirocin is highly effective against which organisms?",
        options: ["Gram-negatives only", "Gram-positive cocci (including MRSA)", "Fungi", "Viruses"],
        ans: 1,
        exp: "It is the drug of choice for decolonizing MRSA from the nares."
      }
    ]
  },
  {
    title: "The 'Old' Antifungal and the Side Effects",
    scenario: "A child with tinea capitis is started on oral Griseofulvin.\n\nVitals: Normal.\nPhysical Examination: Scaly scalp.\nLaboratory Results: None.",
    disease: "Griseofulvin (Pharmacology)",
    questions: [
      {
        q: "How should Griseofulvin be taken to maximize absorption?",
        options: ["On an empty stomach", "With a fatty meal (e.g., ice cream or whole milk)", "With water only", "None"],
        ans: 1,
        exp: "It is highly lipophilic; fat significantly increases bioavailability."
      },
      {
        q: "What is a common but annoying side effect of Griseofulvin?",
        options: ["Hair loss", "Headache and GI upset", "Blue skin", "None"],
        ans: 1,
        exp: "Headaches are very common during the first few days of therapy."
      },
      {
        q: "Griseofulvin can induce which system in the liver?",
        options: ["None", "Cytochrome P450 (decreasing the level of drugs like Warfarin or OCPs)", "Lactate", "None"],
        ans: 1,
        exp: "It is a known CYP450 inducer."
      }
    ]
  },
  {
    title: "The Itch and the 'New' Eczema Drug",
    scenario: "An adult with severe atopic dermatitis is starting Dupilumab (Dupixent).\n\nVitals: Normal.\nPhysical Examination: Extensive eczema.\nLaboratory Results: None.",
    disease: "Dupilumab (Pharmacology)",
    questions: [
      {
        q: "Dupilumab is a monoclonal antibody that targets which receptor?",
        options: ["TNF-alpha", "IL-4 Receptor alpha (blocking both IL-4 and IL-13 signaling)", "IL-17", "None"],
        ans: 1,
        exp: "IL-4 and IL-13 are the 'master cytokines' of Type 2 (Th2) inflammation."
      },
      {
        q: "What is the most common specific side effect of Dupilumab?",
        options: ["Liver failure", "Conjunctivitis (red, itchy eyes)", "Pneumonia", "None"],
        ans: 1,
        exp: "Ocular side effects are uniquely common with this biologic."
      },
      {
        q: "Is baseline TB screening required for Dupilumab?",
        options: ["Yes, for all biologics", "No, it is not significantly immunosuppressive in a way that reactivates TB", "Only in the elderly", "None"],
        ans: 1,
        exp: "Unlike TNF inhibitors, it does not carry a black box warning for TB."
      }
    ]
  },
  {
    title: "The 'Sulfa' and the SJS",
    scenario: "A patient develops a blistering rash 10 days after starting TMP-SMX (Bactrim) for a UTI.\n\nVitals: T 38.0 C.\nPhysical Examination: Erythematous macules with central dusky areas; some sloughing on the back.\nLaboratory Results: None.",
    disease: "Sulfonamide-induced SJS",
    questions: [
      {
        q: "Sulfonamides are a 'classic' trigger for which severe skin reaction?",
        options: ["Acne", "SJS/TEN", "Psoriasis", "None"],
        ans: 1,
        exp: "Along with Allopurinol and Anticonvulsants, Sulfa drugs are top culprits."
      },
      {
        q: "What other systemic 'Sulfa' association is important in patients with G6PD deficiency?",
        options: ["Liver failure", "Hemolytic anemia", "Kidney stones", "None"],
        ans: 1,
        exp: "Oxidative stress from Sulfa drugs triggers hemolysis in G6PD deficient patients."
      },
      {
        q: "Can a patient with a 'Sulfa' allergy safely take Sulfonylureas (for diabetes)?",
        options: ["Yes, usually", "No, never", "Only if they are young", "None"],
        ans: 0,
        exp: "Cross-reactivity between antimicrobial sulfonamides and non-antimicrobial sulfonamides (like diuretics or sulfonylureas) is extremely low and often overrated."
      }
    ]
  },
  {
    title: "The 'Psoriasis' and the IL-23",
    scenario: "A patient is starting Guselkumab (Tremfya).\n\nVitals: Normal.\nPhysical Examination: Plaques.\nLaboratory Results: None.",
    disease: "IL-23 Inhibitors",
    questions: [
      {
        q: "Which subunit is shared between IL-12 and IL-23, and was the target of the first 'interleukin' biologic (Ustekinumab)?",
        options: ["p19", "p40", "p35", "None"],
        ans: 1,
        exp: "Ustekinumab targets the p40 subunit."
      },
      {
        q: "Newer agents like Guselkumab target which specific subunit of IL-23?",
        options: ["p40", "p19", "p35", "None"],
        ans: 1,
        exp: "Targeting p19 is more specific for IL-23 and doesn't affect IL-12."
      },
      {
        q: "What is the primary advantage of these newer IL-23 inhibitors?",
        options: ["They are pills", "Long dosing intervals (e.g., every 8-12 weeks) and high efficacy", "No side effects", "None"],
        ans: 1,
        exp: "The convenience and efficacy make them popular for long-term psoriasis management."
      }
    ]
  },
  {
    title: "The 'Heart' and the Antifungal",
    scenario: "An elderly patient with onychomycosis and a history of Congestive Heart Failure is asking for oral Itraconazole.\n\nVitals: Normal.\nPhysical Examination: Thickened nails.\nLaboratory Results: None.",
    disease: "Itraconazole (Black Box Warning)",
    questions: [
      {
        q: "What is the FDA Black Box Warning for Itraconazole?",
        options: ["Liver failure only", "It can cause or exacerbate Congestive Heart Failure (negative inotropic effect)", "Kidney failure", "None"],
        ans: 1,
        exp: "This makes it a poor choice for patients with pre-existing heart disease."
      },
      {
        q: "Which type of 'Environment' is required in the stomach for optimal Itraconazole absorption?",
        options: ["Alkaline", "Acidic (do not take with PPIs or Antacids)", "Neutral", "None"],
        ans: 1,
        exp: "Itraconazole requires acid for dissolution."
      },
      {
        q: "Itraconazole is a potent inhibitor of which enzyme system?",
        options: ["None", "CYP3A4 (leading to many drug-drug interactions)", "Amylase", "None"],
        ans: 1,
        exp: "It can dangerously increase levels of drugs like Statins or Midazolam."
      }
    ]
  },
  {
    title: "The 'Lupus' and the Anti-Malarial",
    scenario: "A 30-year-old woman with Systemic Lupus Erythematosus (SLE) and a malar rash is started on Hydroxychloroquine (Plaquenil).\n\nVitals: Normal.\nPhysical Examination: Red 'butterfly' rash on the face.\nLaboratory Results: Positive ANA.",
    disease: "Hydroxychloroquine (Management)",
    questions: [
      {
        q: "What is the most important 'Long-term' screening requirement for patients on Hydroxychloroquine?",
        options: ["Liver biopsy", "Annual Ophthalmologic exam (to screen for retinal toxicity/bull's eye maculopathy)", "Hearing test", "None"],
        ans: 1,
        exp: "Retinal toxicity is dose-dependent and can lead to irreversible vision loss."
      },
      {
        q: "Besides the skin, what major benefit does Hydroxychloroquine provide in SLE patients?",
        options: ["Weight loss", "Decreases the frequency and severity of disease flares and improves overall survival", "Cures the disease", "None"],
        ans: 1,
        exp: "It is considered a 'cornerstone' therapy for SLE."
      },
      {
        q: "Is Hydroxychloroquine safe to continue during pregnancy in an SLE patient?",
        options: ["No", "Yes, and it is usually recommended to continue it to prevent maternal flares", "Only in the 3rd trimester", "None"],
        ans: 1,
        exp: "The benefits to the mother usually outweigh the risks."
      }
    ]
  },
  {
    title: "The 'Psoriasis' and the PDE4",
    scenario: "A patient who does not want injections or 'strong' immunosuppressants is prescribed Apremilast (Otezla) for his psoriasis.\n\nVitals: Normal.\nPhysical Examination: Plaques.\nLaboratory Results: None.",
    disease: "Apremilast (Pharmacology)",
    questions: [
      {
        q: "What is the mechanism of action of Apremilast?",
        options: ["TNF inhibitor", "Phosphodiesterase-4 (PDE4) inhibitor", "Steroid", "None"],
        ans: 1,
        exp: "It increases intracellular cAMP, which downregulates inflammatory cytokines."
      },
      {
        q: "What is a common GI side effect that often requires a 'Starter Pack' to slowly titrate the dose?",
        options: ["Constipation", "Nausea and Diarrhea", "Bloating", "None"],
        ans: 1,
        exp: "Titration helps the body adjust to the GI effects."
      },
      {
        q: "Which neuropsychiatric side effect is mentioned in the labeling for Apremilast?",
        options: ["Mania", "Depression and Suicidal ideation", "Anxiety", "None"],
        ans: 1,
        exp: "While rare, patients should be monitored for mood changes."
      }
    ]
  },
  {
    title: "The 'Psoriasis' and the IL-12/23",
    scenario: "A patient is starting Ustekinumab (Stelara).\n\nVitals: Normal.\nPhysical Examination: Plaques.\nLaboratory Results: None.",
    disease: "Ustekinumab (Pharmacology)",
    questions: [
      {
        q: "Ustekinumab targets the common p40 subunit of which two interleukins?",
        options: ["IL-1 and IL-6", "IL-12 and IL-23", "IL-17 and IL-23", "None"],
        ans: 1,
        exp: "This was the first 'targeted' cytokine biologic for psoriasis after the TNF era."
      },
      {
        q: "What is the standard maintenance dosing interval for Ustekinumab?",
        options: ["Daily", "Every week", "Every 12 weeks", "Once a year"],
        ans: 2,
        exp: "The long interval is a major advantage for patient compliance."
      },
      {
        q: "Like TNF inhibitors, does Ustekinumab require baseline TB screening?",
        options: ["No", "Yes", "Only in the elderly", "None"],
        ans: 1,
        exp: "Screening for latent TB is standard for most systemic biologics used in dermatology."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Numb'",
    scenario: "A patient with shingles is asking for a 'patch' to help with the pain.\n\nVitals: Normal.\nPhysical Examination: Healing vesicles.\nLaboratory Results: None.",
    disease: "Lidocaine 5% Patch (Post-herpetic Neuralgia)",
    questions: [
      {
        q: "How does Lidocaine provide pain relief?",
        options: ["Blocks histamine", "Blocks voltage-gated sodium channels, preventing nerve conduction", "Kills the virus", "None"],
        ans: 1,
        exp: "It provides a local anesthetic effect."
      },
      {
        q: "What is the '12 hours on, 12 hours off' rule for lidocaine patches meant to prevent?",
        options: ["Skin irritation", "Systemic lidocaine toxicity", "Tolerance", "None"],
        ans: 1,
        exp: "This ensures that systemic levels remain within the safe range."
      },
      {
        q: "Can the patch be applied to open, weeping shingles blisters?",
        options: ["Yes", "No, it should only be applied to intact, healed skin", "Only if covered with plastic", "None"],
        ans: 1,
        exp: "Applying to broken skin significantly increases systemic absorption."
      }
    ]
  }
];
