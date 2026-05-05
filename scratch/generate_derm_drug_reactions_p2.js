module.exports = [
  {
    title: "The Antimalarial Shins",
    scenario: "A 40-year-old female with Lupus who has been taking Hydroxychloroquine for 5 years presents with slate-gray patches on her shins.\n\nVitals: Normal.\nPhysical Examination: Well-demarcated, blue-gray patches on the pretibial areas. The nails also show some muddy-brown transverse bands.\nLaboratory Results: None.",
    disease: "Antimalarial-Induced Pigmentation",
    questions: [
      {
        q: "In what percentage of patients on long-term antimalarials (Chloroquine/Hydroxychloroquine) does skin pigmentation occur?",
        options: ["1%", "Approximately 25%", "90%", "0%"],
        ans: 1,
        exp: "Skin and mucosal pigmentation is a relatively common side effect of long-term antimalarial therapy."
      },
      {
        q: "What is the most characteristic site for antimalarial-induced pigmentation?",
        options: ["Face", "Shins (pretibial area)", "Palms", "Scalp"],
        ans: 1,
        exp: "The shins are the classic 'board exam' location for this side effect."
      },
      {
        q: "What other anatomic site should be examined for pigmentation in these patients?",
        options: ["The eyes", "The hard palate", "The ears", "The toes"],
        ans: 1,
        exp: "Bluish-gray pigmentation of the hard palate is another common finding."
      }
    ]
  },
  {
    title: "The Red Bumps on the Shins",
    scenario: "A 25-year-old woman began taking oral contraceptives (OCPs) 2 months ago. She now presents with painful, red, warm nodules on both shins.\n\nVitals: T 37.5 C.\nPhysical Examination: Multiple 2-4 cm deep-seated, tender, erythematous nodules on the pretibial areas. They look like bruises in some areas.\nLaboratory Results: ESR is mildly elevated. Biopsy shows septal panniculitis.",
    disease: "Drug-Induced Erythema Nodosum (EN)",
    questions: [
      {
        q: "What is the most common medication trigger for Erythema Nodosum?",
        options: ["Aspirin", "Oral Contraceptives (OCPs)", "Penicillin", "Insulin"],
        ans: 1,
        exp: "OCPs and Sulfonamides are the most frequent drug-related causes of EN."
      },
      {
        q: "What is the characteristic histological finding in EN?",
        options: ["Lobular panniculitis", "Septal panniculitis without vasculitis", "Granulomas", "Pustules"],
        ans: 1,
        exp: "EN is the prototype of septal panniculitis."
      },
      {
        q: "Do EN nodules typically ulcerate or scar?",
        options: ["Yes, always", "No, they typically resolve over 3-6 weeks like a bruise, without scarring", "They leave white patches", "They only scar in children"],
        ans: 1,
        exp: "Unlike other forms of panniculitis, EN resolves without permanent tissue loss."
      }
    ]
  },
  {
    title: "The SJS-like Infection",
    scenario: "A 10-year-old boy presents with severe mouth sores, red eyes, and a few target-like spots on his arms. He was treated for a 'walking pneumonia' (Mycoplasma) 1 week ago.\n\nVitals: T 38.8 C.\nPhysical Examination: Severe hemorrhagic crusting of the lips and conjunctival injection. Minimal skin involvement (<1% BSA).\nLaboratory Results: Mycoplasma pneumoniae PCR is positive.",
    disease: "MIRAS (Mycoplasma-Induced Rash and Mucositis)",
    questions: [
      {
        q: "What is MIRAS?",
        options: ["A drug reaction", "A condition triggered by Mycoplasma pneumoniae that mimics SJS but usually has severe mucosal involvement with very little skin involvement", "A type of flu", "A fungal rash"],
        ans: 1,
        exp: "MIRAS is now recognized as a distinct entity from drug-induced SJS."
      },
      {
        q: "What is the prognosis of MIRAS compared to drug-induced SJS?",
        options: ["Worse", "Generally much better, with lower mortality and fewer long-term sequelae", "The same", "Always lethal"],
        ans: 1,
        exp: "Despite the severe-looking mouth sores, these children usually recover well."
      },
      {
        q: "What is the hallmark of MIRAS?",
        options: ["Skin peeling", "Mucositis out of proportion to skin findings", "Hair loss", "Joint pain"],
        ans: 1,
        exp: "Significant involvement of at least two mucosal sites with minimal skin detachment is the key clue."
      }
    ]
  },
  {
    title: "The Purple Cocaine Ear",
    scenario: "A 35-year-old patient presents with painful, dark purple, necrotic patches on his ears and cheeks.\n\nVitals: Normal.\nPhysical Examination: Retiform (star-shaped) purpura with central necrosis on the earlobes and face.\nLaboratory Results: WBC count is very low (agranulocytosis). Urine drug screen is positive for Cocaine.",
    disease: "Levamisole-Induced Vasculitis",
    questions: [
      {
        q: "What is Levamisole?",
        options: ["A type of cocaine", "A veterinary dewormer often used as a cutting agent in illicit cocaine", "A blood pressure med", "A vitamin"],
        ans: 1,
        exp: "Levamisole is found in a large percentage of cocaine in the US."
      },
      {
        q: "What is the classic cutaneous 'high-yield' location for levamisole-induced vasculitis?",
        options: ["The palms", "The ears (earlobes)", "The belly button", "The toes"],
        ans: 1,
        exp: "The ears are a highly characteristic site for this retiform purpura."
      },
      {
        q: "Which laboratory abnormality is a hallmark of levamisole toxicity?",
        options: ["High platelets", "Neutropenia/Agranulocytosis", "Low glucose", "High calcium"],
        ans: 1,
        exp: "Levamisole is a potent bone marrow suppressant."
      }
    ]
  },
  {
    title: "The ANCA Vasculitis",
    scenario: "A patient who has been on Hydralazine for 10 years for hypertension develops fever, weight loss, and a purple rash on his legs.\n\nVitals: T 37.9 C, BP 150/90.\nPhysical Examination: Palpable purpura on the lower legs.\nLaboratory Results: Positive ANA and very high p-ANCA (MPO) titers. Urinalysis shows proteinuria and hematuria.",
    disease: "Hydralazine-Induced ANCA Vasculitis",
    questions: [
      {
        q: "Which antibody is most characteristically positive in drug-induced ANCA vasculitis?",
        options: ["c-ANCA (PR3)", "p-ANCA (MPO)", "Anti-centromere", "Anti-Jo1"],
        ans: 1,
        exp: "p-ANCA is found in the vast majority of cases, often with dual MPO/PR3 positivity in some instances."
      },
      {
        q: "How does this differ from simple drug-induced lupus (DILE)?",
        options: ["It doesn't", "It involves a true systemic necrotizing vasculitis, often with glomerulonephritis (renal involvement), which is rare in classic DILE", "It is caused by the same drug", "It is only on the skin"],
        ans: 1,
        exp: "ANCA-associated vasculitis is a much more serious condition than simple DILE."
      },
      {
        q: "What is the first step in treatment?",
        options: ["Double the hydralazine", "Stop the drug and often start systemic immunosuppression (steroids/cyclophosphamide) if organs are involved", "Antibiotics", "Aspirin"],
        ans: 1,
        exp: "Organ-threatening vasculitis requires aggressive treatment beyond just stopping the trigger."
      }
    ]
  },
  {
    title: "The Pityriasis Rosea Mimic",
    scenario: "A patient on Captopril develops a widespread scaly rash on his trunk. He remembers a 'large patch' appearing first, followed by smaller ones in a 'Christmas tree' pattern.\n\nVitals: Normal.\nPhysical Examination: Multiple oval, scaly, erythematous plaques following the skin tension lines of the back.\nLaboratory Results: None.",
    disease: "Drug-Induced Pityriasis Rosea",
    questions: [
      {
        q: "Which drug class is famously associated with a Pityriasis Rosea-like eruption?",
        options: ["ACE inhibitors (e.g., Captopril)", "Aspirin", "Statins", "Penicillin"],
        ans: 0,
        exp: "ACE inhibitors, Gold, and Beta-blockers can mimic PR."
      },
      {
        q: "What is a 'Herald Patch'?",
        options: ["A patch used to quit smoking", "The large, initial plaque seen in PR that precedes the generalized eruption", "A type of blister", "A scar"],
        ans: 1,
        exp: "The herald patch is the classic clinical sign of PR."
      },
      {
        q: "How does drug-induced PR differ from idiopathic PR?",
        options: ["It is not itchy", "It may lack a herald patch and often takes longer to resolve after the drug is stopped", "It is only on the face", "It is contagious"],
        ans: 1,
        exp: "Drug-induced forms are often more inflammatory and persistent."
      }
    ]
  },
  {
    title: "The Psoriasis Flare",
    scenario: "A patient with stable psoriasis is started on Lithium for bipolar disorder. Within 2 weeks, his psoriasis flares dramatically, covering almost his entire body.\n\nVitals: Normal.\nPhysical Examination: Diffuse, thick silvery-white scales on erythematous plaques. New pustules are appearing on the palms.\nLaboratory Results: None.",
    disease: "Drug-Induced/Exacerbated Psoriasis",
    questions: [
      {
        q: "Which of the following is a 'big four' drug known for flaring psoriasis?",
        options: ["Aspirin", "Lithium", "Vitamin D", "Penicillin"],
        ans: 1,
        exp: "The 'big four' for psoriasis flares are Lithium, Beta-blockers, Antimalarials, and NSAIDs."
      },
      {
        q: "What happens if you give a psoriasis patient systemic steroids and then stop them abruptly?",
        options: ["The skin clears forever", "Risk of a life-threatening flare of Von Zumbusch (generalized pustular) psoriasis", "Nothing", "The patient gets a tan"],
        ans: 1,
        exp: "NEVER give systemic steroids for psoriasis unless absolutely necessary, due to the rebound risk."
      },
      {
        q: "Which other common heart medication can worsen psoriasis?",
        options: ["ACE inhibitors", "Beta-blockers", "Calcium channel blockers", "Nitrates"],
        ans: 1,
        exp: "Beta-blockers are notorious for exacerbating psoriatic plaques."
      }
    ]
  },
  {
    title: "The 'Red Man' (Erythroderma)",
    scenario: "A 60-year-old male presents with redness covering 95% of his body. He feels cold and is shivering despite the warm room.\n\nVitals: T 35.8 C (Hypothermia), HR 105.\nPhysical Examination: Diffuse erythema and fine scaling over >90% of the BSA. Peripheral edema and lymphadenopathy are present.\nLaboratory Results: Low albumin.",
    disease: "Drug-Induced Erythroderma (Exfoliative Dermatitis)",
    questions: [
      {
        q: "What defines erythroderma?",
        options: ["Red face", "Redness covering >90% of the body surface area", "Red palms only", "50% BSA involvement"],
        ans: 1,
        exp: "Erythroderma is a dermatologic emergency due to the loss of skin function."
      },
      {
        q: "Which is a common drug cause of erythroderma?",
        options: ["Aspirin", "Allopurinol, Sulfonamides, and Antiepileptics", "Vitamin C", "Moisturizers"],
        ans: 1,
        exp: "Many of the same drugs that cause SJS or DRESS can also cause erythroderma."
      },
      {
        q: "What is a major metabolic complication of erythroderma?",
        options: ["High albumin", "Hypothermia and high-output heart failure (due to massive skin blood flow)", "Constipation", "Weight gain"],
        ans: 1,
        exp: "The 'open' skin acts like a heat radiator, causing thermoregulation failure."
      }
    ]
  },
  {
    title: "The Syphilis Reaction",
    scenario: "A patient with secondary syphilis is given his first dose of IM Penicillin G. 6 hours later, he develops fever, chills, headache, and his rash becomes much brighter and more prominent.\n\nVitals: T 38.5 C.\nPhysical Examination: Exacerbation of the existing copper-colored maculopapular rash on palms and soles.\nLaboratory Results: None.",
    disease: "Jarisch-Herxheimer Reaction",
    questions: [
      {
        q: "What causes the Jarisch-Herxheimer reaction?",
        options: ["Allergy to penicillin", "The sudden release of lipoproteins/endotoxins from dying spirochetes (Treponema pallidum)", "Drug overdose", "A new infection"],
        ans: 1,
        exp: "It is an inflammatory response to the 'kill-off' of the bacteria."
      },
      {
        q: "Is this reaction a reason to stop Penicillin?",
        options: ["Yes, always", "No, it is a self-limited reaction (usually <24 hours) and indicates the treatment is working", "Yes, it means the drug is toxic", "Only in children"],
        ans: 1,
        exp: "Management is purely symptomatic (Aspirin/NSAIDS)."
      },
      {
        q: "Besides Syphilis, in which other disease is this reaction common?",
        options: ["Acne", "Lyme disease and Leptospirosis", "Fungal infections", "Cancer"],
        ans: 1,
        exp: "It can occur in any spirochetal infection being treated with effective antibiotics."
      }
    ]
  },
  {
    title: "The Bad IM Injection",
    scenario: "Immediately after receiving an IM injection of penicillin in the buttock, the patient develops severe pain and a blue-gray discoloration around the injection site.\n\nVitals: Normal.\nPhysical Examination: Retiform (star-shaped) cyanosis and livedo-like patches at the site, quickly progressing to deep necrosis.\nLaboratory Results: None.",
    disease: "Nicolau Syndrome (Embolia Cutis Medicamentosa)",
    questions: [
      {
        q: "What is Nicolau Syndrome?",
        options: ["An allergy", "A rare complication of IM injections where the drug accidentally enters an artery or causes vasospasm/thrombosis", "A type of flu", "An infection"],
        ans: 1,
        exp: "It is a vascular catastrophe, not an allergy."
      },
      {
        q: "What is the typical clinical course of Nicolau syndrome?",
        options: ["Resolves in 1 hour", "Immediate pain and discoloration followed by extensive, deep tissue necrosis/sloughing", "Turns into a freckle", "It is painless"],
        ans: 1,
        exp: "It can lead to permanent muscle loss and scarring."
      },
      {
        q: "How can it be prevented?",
        options: ["Injecting faster", "Proper injection technique (aspirating before injecting to ensure no vessel was hit)", "Using a smaller needle", "It cannot be prevented"],
        ans: 1,
        exp: "Aspiration is the key safety step."
      }
    ]
  },
  {
    title: "The Neutrophilic Fever",
    scenario: "A patient being treated for chemotherapy-induced neutropenia with G-CSF develops high fevers and painful, juicy red plaques on her neck and arms.\n\nVitals: T 39.0 C.\nPhysical Examination: 'Succulent' or 'juicy' erythematous plaques and nodules. They look like blisters but are firm (pseudovesiculation).\nLaboratory Results: Biopsy shows a massive infiltrate of neutrophils in the upper dermis.",
    disease: "Drug-Induced Sweet's Syndrome",
    questions: [
      {
        q: "What is Sweet's Syndrome?",
        options: ["A sugar allergy", "Acute Febrile Neutrophilic Dermatosis", "A fungal infection", "A type of acne"],
        ans: 1,
        exp: "Sweet's features fever, neutrophilia, and characteristic 'juicy' skin lesions."
      },
      {
        q: "Which medication is the most common trigger for drug-induced Sweet's?",
        options: ["Aspirin", "G-CSF (Granulocyte Colony-Stimulating Factor)", "Penicillin", "Insulin"],
        ans: 1,
        exp: "Since G-CSF stimulates neutrophil production, it can trigger this neutrophilic dermatosis."
      },
      {
        q: "What is the first-line treatment for Sweet's syndrome?",
        options: ["Antibiotics", "Systemic corticosteroids (e.g., Prednisone)", "Surgery", "Antifungals"],
        ans: 1,
        exp: "Sweet's is exquisitely sensitive to steroids."
      }
    ]
  },
  {
    title: "The Scleroderma Mimic",
    scenario: "A patient being treated with Paclitaxel for breast cancer develops thickening and hardening of the skin on her legs and forearms.\n\nVitals: Normal.\nPhysical Examination: Indurated, 'woody' skin that is difficult to pinch. Raynaud's phenomenon is absent.\nLaboratory Results: ANA is negative.",
    disease: "Drug-Induced Scleroderma-like Reaction",
    questions: [
      {
        q: "Which chemotherapy class is associated with scleroderma-like skin changes?",
        options: ["Penicillins", "Taxanes (Paclitaxel, Docetaxel)", "NSAIDs", "Statins"],
        ans: 1,
        exp: "Taxanes can induce a fibrotic response in the skin."
      },
      {
        q: "How does drug-induced scleroderma differ from systemic sclerosis?",
        options: ["It has a positive ANA", "It usually lacks internal organ involvement and Raynaud's phenomenon", "It is only on the face", "It is contagious"],
        ans: 1,
        exp: "The lack of Raynaud's and nailfold capillary changes helps distinguish the drug-induced form."
      },
      {
        q: "Is it reversible?",
        options: ["Yes", "Often resolves or improves significantly after the drug is stopped", "No, never", "Only with surgery"],
        ans: 1,
        exp: "Cessation of the taxane is the primary treatment."
      }
    ]
  },
  {
    title: "The Eruptive Warts",
    scenario: "A patient on Vemurafenib (BRAF inhibitor) for melanoma develops several dozen new, fast-growing 'warts' on his arms within the first month of treatment.\n\nVitals: Normal.\nPhysical Examination: Multiple 5-10 mm dome-shaped nodules with central keratinous plugs, resembling Keratoacanthomas.\nLaboratory Results: Biopsy confirms well-differentiated SCC/KA.",
    disease: "BRAF Inhibitor-Induced SCCs",
    questions: [
      {
        q: "Why do BRAF inhibitors cause new skin cancers?",
        options: ["They damage DNA", "Paradoxical activation of the MAP kinase pathway in cells that do NOT have the BRAF mutation", "They suppress the immune system", "It is a coincidence"],
        ans: 1,
        exp: "This is a unique 'off-target' effect where the drug actually stimulates growth in normal skin cells."
      },
      {
        q: "How is this side effect managed?",
        options: ["Stopping the melanoma treatment", "Surgical excision or destruction of the new lesions while continuing the BRAF inhibitor", "Radiation", "Topical steroids"],
        ans: 1,
        exp: "The new tumors are low-grade and manageable; the melanoma treatment is usually prioritized."
      },
      {
        q: "Does adding a MEK inhibitor increase or decrease the risk of these lesions?",
        options: ["Increases", "Decreases (it blocks the pathway downstream, preventing the paradoxical activation)", "No effect", "Depends on age"],
        ans: 1,
        exp: "Dual BRAF/MEK therapy significantly lowers the rate of secondary skin cancers."
      }
    ]
  },
  {
    title: "The Hand-Foot Skin Reaction (HFSR)",
    scenario: "A patient on Sorafenib for renal cell carcinoma develops thick, painful calluses on the pressure points of his feet.\n\nVitals: Normal.\nPhysical Examination: Hyperkeratotic (thick, yellow) plaques on the heels and balls of the feet, surrounded by a red halo.\nLaboratory Results: None.",
    disease: "Multi-Kinase Inhibitor HFSR",
    questions: [
      {
        q: "How does Sorafenib-induced HFSR differ from Capecitabine-induced Hand-Foot Syndrome?",
        options: ["It is not painful", "It is more localized to pressure points and shows significant hyperkeratosis (thickening)", "It only affects the hands", "It is a flat rash"],
        ans: 1,
        exp: "Classic HFS (Capecitabine) is diffuse redness; HFSR (Sorafenib/Sunitinib) is localized thick calluses."
      },
      {
        q: "What is the primary management for HFSR?",
        options: ["Walking more", "Keratolytics (urea cream), cushioning, and potential dose reduction", "Surgery", "Antibiotics"],
        ans: 1,
        exp: "Softening the calluses and reducing friction is key."
      },
      {
        q: "Which drug class causes HFSR?",
        options: ["Beta-lactams", "Multi-kinase inhibitors (e.g., Sorafenib, Sunitinib, Regorafenib)", "Statins", "Steroids"],
        ans: 1,
        exp: "These drugs target VEGF and other growth receptors, interfering with skin repair."
      }
    ]
  },
  {
    title: "The Immunotherapy Rash",
    scenario: "A patient receiving Nivolumab (PD-1 inhibitor) develops an itchy, red rash on her trunk after her third infusion.\n\nVitals: Normal.\nPhysical Examination: Mild-to-moderate maculopapular eruption. No blisters or mucosal involvement.\nLaboratory Results: None.",
    disease: "ICPI-induced Maculopapular Eruption",
    questions: [
      {
        q: "What is an ICPI?",
        options: ["A type of antibiotic", "Immune Checkpoint Inhibitor (e.g., PD-1, PD-L1, or CTLA-4 blockers)", "A heart medication", "A vitamin"],
        ans: 1,
        exp: "ICPIs are the mainstay of modern cancer immunotherapy."
      },
      {
        q: "How common are skin side effects with ICPIs?",
        options: ["Rare", "The most common category of Immune-Related Adverse Events (irAEs)", "100%", "Only in the elderly"],
        ans: 1,
        exp: "Skin toxicity is often the first irAE to appear."
      },
      {
        q: "How is a mild-to-moderate ICPI rash typically managed?",
        options: ["Stop the cancer treatment immediately", "Continue the immunotherapy and treat the rash with topical steroids and antihistamines", "Give antibiotics", "Radiation"],
        ans: 1,
        exp: "Most ICPI rashes can be managed 'through' the treatment without stopping it."
      }
    ]
  },
  {
    title: "The Vitiligo-like Depigmentation",
    scenario: "A patient being treated for metastatic melanoma with Pembrolizumab notices white patches appearing on her hands and face.\n\nVitals: Normal.\nPhysical Examination: Sharply demarcated, depigmented (bone-white) patches, indistinguishable from vitiligo.\nLaboratory Results: None.",
    disease: "ICPI-induced Vitiligo-like Depigmentation",
    questions: [
      {
        q: "In which cancer type is ICPI-induced vitiligo most common?",
        options: ["Lung cancer", "Melanoma", "Renal cancer", "Colon cancer"],
        ans: 1,
        exp: "Because the immune system is targeting melanocytic antigens, vitiligo is very frequent in melanoma patients."
      },
      {
        q: "What does the development of vitiligo mean for the patient's cancer prognosis?",
        options: ["It is a bad sign", "It is a good prognostic sign (correlates with improved survival in melanoma)", "It means the drug is toxic", "No correlation"],
        ans: 1,
        exp: "Vitiligo indicates a robust immune response against melanocytes, which includes the melanoma cells."
      },
      {
        q: "Is this vitiligo reversible?",
        options: ["Yes, quickly", "Often permanent, as the melanocytes are destroyed by T-cells", "It turns into a tan", "Only with surgery"],
        ans: 1,
        exp: "Like idiopathic vitiligo, it is often a permanent change."
      }
    ]
  },
  {
    title: "The Immunotherapy Blisters",
    scenario: "Six months into Nivolumab therapy, a patient develops extremely itchy, tense blisters on his trunk and limbs.\n\nVitals: Normal.\nPhysical Examination: Numerous large, tense bullae. DIF shows linear IgG and C3 along the BMZ.\nLaboratory Results: Biopsy confirms subepidermal blister with eosinophils.",
    disease: "ICPI-induced Bullous Pemphigoid",
    questions: [
      {
        q: "Which ICPI-related skin reaction can occur many months after starting or even after stopping the drug?",
        options: ["Maculopapular rash", "Bullous Pemphigoid", "Hives", "Acne"],
        ans: 1,
        exp: "ICPI-induced BP has a very late onset compared to other rashes."
      },
      {
        q: "How is severe ICPI-induced BP managed?",
        options: ["Topical steroids only", "Stopping the immunotherapy and using high-dose systemic steroids or biologics (e.g., Rituximab/Omalizumab)", "Giving more immunotherapy", "Antibiotics"],
        ans: 1,
        exp: "Blistering is a Grade 3/4 event that requires stopping the ICPI."
      },
      {
        q: "Is this reaction specific to melanoma?",
        options: ["Yes", "No, it can occur in any patient receiving ICPIs for any cancer type (e.g., lung, renal, bladder)", "Only in women", "Only in children"],
        ans: 1,
        exp: "It is a drug effect, not limited by tumor type."
      }
    ]
  },
  {
    title: "The Halogen Nodule",
    scenario: "A patient who has been taking a 'calming' health supplement containing Bromide develops large, painful, vegetating plaques on her face and legs.\n\nVitals: Normal.\nPhysical Examination: Large, inflammatory, pustular nodules and plaques that look like an infection but failed to respond to antibiotics.\nLaboratory Results: Biopsy shows massive epidermal hyperplasia (pseudoepitheliomatous hyperplasia) and neutrophils.",
    disease: "Bromoderma",
    questions: [
      {
        q: "What is Bromoderma?",
        options: ["A fungal infection", "A rare skin reaction to the ingestion of bromide-containing compounds", "A type of melanoma", "Sun damage"],
        ans: 1,
        exp: "Halogenodermas (Bromoderma/Iododerma) are rare but dramatic drug reactions."
      },
      {
        q: "What does it often mimic clinically?",
        options: ["A simple mole", "Blastomycosis or Pyoderma Gangrenosum (due to the vegetating, pustular appearance)", "A freckle", "Nothing"],
        ans: 1,
        exp: "It is often mistaken for a deep fungal infection or cancer (SCC)."
      },
      {
        q: "What is the primary treatment?",
        options: ["Antibiotics", "Stopping the source of bromide and potentially using diuretics/saline to speed up excretion", "Surgery", "Radiation"],
        ans: 1,
        exp: "Identifying the hidden source (e.g., sedatives, supplements) is the most important step."
      }
    ]
  },
  {
    title: "The Iodide Plaque",
    scenario: "A patient receives IV contrast for a CT scan. Two days later, he develops several small, painful pustules on his face and trunk.\n\nVitals: Normal.\nPhysical Examination: Discrete, inflammatory papulopustules. He also has some small vegetating plaques on his legs.\nLaboratory Results: Patient has known renal insufficiency.",
    disease: "Iododerma",
    questions: [
      {
        q: "What is the common trigger for Iododerma?",
        options: ["Aspirin", "Iodinated contrast or potassium iodide (SSKI)", "Penicillin", "Insulin"],
        ans: 1,
        exp: "Iodine is the causative agent."
      },
      {
        q: "Which patient population is at higher risk for halogenoderma?",
        options: ["Children", "Patients with renal insufficiency (who cannot clear the halogen efficiently)", "Athletes", "Pregnant women"],
        ans: 1,
        exp: "Impaired excretion leads to higher systemic levels and skin deposition."
      },
      {
        q: "Is Iododerma an IgE-mediated allergy?",
        options: ["Yes", "No, it is a non-immunologic toxic accumulation/sensitivity", "Only in the elderly", "Yes, it is like a bee sting"],
        ans: 1,
        exp: "It is a dose-related or cumulative toxicity, not an allergy."
      }
    ]
  },
  {
    title: "The Sweaty Palm",
    scenario: "A 30-year-old on Sertraline (SSRI) for depression complains that his hands and armpits are constantly dripping with sweat, even when he is cold.\n\nVitals: Normal.\nPhysical Examination: Visible beads of sweat on palms and soles. No other skin rash.\nLaboratory Results: None.",
    disease: "Drug-Induced Hyperhidrosis",
    questions: [
      {
        q: "Which common medication class is a frequent cause of excessive sweating?",
        options: ["Antibiotics", "Antidepressants (especially SSRIs and SNRIs)", "Statins", "Antifungals"],
        ans: 1,
        exp: "Up to 10-15% of patients on SSRIs report hyperhidrosis."
      },
      {
        q: "What is the mechanism for drug-induced hyperhidrosis with SSRIs?",
        options: ["Direct sweat gland stimulation", "Alteration of the hypothalamic thermoregulatory set point", "Allergy", "Fear"],
        ans: 1,
        exp: "It is a central effect on the brain's thermostat."
      },
      {
        q: "How is this side effect managed if the medication cannot be stopped?",
        options: ["Drinking less water", "Anticholinergics (e.g., Glycopyrrolate) or topical aluminum chloride", "Surgery", "Exercise"],
        ans: 1,
        exp: "Anticholinergics can help 'dry out' the patient."
      }
    ]
  },
  {
    title: "The Serpentine Veins",
    scenario: "A patient being treated with IV 5-Fluorouracil (5-FU) for gastric cancer develops dark, linear streaks on his arms that follow the paths of his veins.\n\nVitals: Normal.\nPhysical Examination: Serpentine (snake-like) hyperpigmentation of the skin overlying the venous network where the chemotherapy was infused.\nLaboratory Results: None.",
    disease: "Serpentine Supravenous Hyperpigmentation",
    questions: [
      {
        q: "Which chemotherapy drug is most commonly associated with serpentine supravenous hyperpigmentation?",
        options: ["Bleomycin", "5-Fluorouracil (5-FU)", "Cyclophosphamide", "Cisplatin"],
        ans: 1,
        exp: "5-FU is the classic cause of this unique pigmentary pattern."
      },
      {
        q: "What is the primary management for this condition?",
        options: ["Surgery", "Reassurance (it is a benign, asymptomatic side effect)", "Antibiotics", "Stopping all chemo"],
        ans: 1,
        exp: "It is purely a cosmetic issue and does not require stopping the life-saving chemotherapy."
      },
      {
        q: "Does it cause pain or inflammation of the vein (phlebitis)?",
        options: ["Yes, always", "No, the vein itself is usually healthy; the pigment is in the overlying skin", "Only in the elderly", "Only in children"],
        ans: 1,
        exp: "It is a pigmentary change, not a thrombophlebitis."
      }
    ]
  },
  {
    title: "The Orange-Red Scale",
    scenario: "A patient on Imatinib for GIST develops a widespread orange-red, scaly rash. He has small islands of normal skin within the redness.\n\nVitals: Normal.\nPhysical Examination: Follicular papules on an erythematous base. Distinct 'islands of sparing' (normal skin) are visible. Thicker scales on the palms and soles.\nLaboratory Results: Biopsy shows alternating orthokeratosis and parakeratosis.",
    disease: "Drug-Induced Pityriasis Rubra Pilaris (PRP)",
    questions: [
      {
        q: "What is the hallmark clinical feature of Pityriasis Rubra Pilaris (PRP)?",
        options: ["Blisters", "Islands of sparing (patches of normal skin within the generalized redness)", "Target lesions", "Hives"],
        ans: 1,
        exp: "Islands of sparing are the classic diagnostic clue for PRP."
      },
      {
        q: "Which targeted cancer therapy is a known trigger for a PRP-like eruption?",
        options: ["Aspirin", "Imatinib (Tyrosine Kinase Inhibitor)", "Penicillin", "Insulin"],
        ans: 1,
        exp: "Imatinib is one of the few drugs that can specifically trigger a PRP-like morphology."
      },
      {
        q: "What is the typical color of the rash in PRP?",
        options: ["Bright blue", "Orange-red (salmon-colored)", "Pure white", "Deep black"],
        ans: 1,
        exp: "The 'salmon-colored' or orange-red hue is very characteristic."
      }
    ]
  },
  {
    title: "The PTU Vasculitis",
    scenario: "A woman being treated for Graves'' disease with Propylthiouracil (PTU) develops painful purple spots on her legs and ears.\n\nVitals: Normal.\nPhysical Examination: Palpable purpura and small necrotic ulcers on the lower extremities and ear helices.\nLaboratory Results: Positive ANA and very high titers of p-ANCA (MPO).",
    disease: "PTU-Induced Vasculitis",
    questions: [
      {
        q: "Which medication for hyperthyroidism is a major trigger for ANCA-associated vasculitis?",
        options: ["Methimazole", "Propylthiouracil (PTU)", "Propranolol", "Radioactive Iodine"],
        ans: 1,
        exp: "PTU is significantly more likely than methimazole to cause this serious vasculitis."
      },
      {
        q: "What is a common systemic complication of PTU-induced vasculitis?",
        options: ["Hair loss", "Glomerulonephritis (Kidney damage)", "Constipation", "Hearing loss"],
        ans: 1,
        exp: "Like other ANCA vasculitides, the kidneys are a major target."
      },
      {
        q: "What is the first step in management?",
        options: ["Increase the PTU dose", "Immediate discontinuation of PTU", "Antibiotics", "Apply ice"],
        ans: 1,
        exp: "The drug must be stopped immediately to prevent further organ damage."
      }
    ]
  },
  {
    title: "The True Serum Sickness",
    scenario: "A transplant patient receives Rabbit Antithymocyte Globulin (ATG). Seven days later, he develops high fever, joint pain, and a widespread hive-like rash.\n\nVitals: T 39.5 C.\nPhysical Examination: Urticarial plaques and morbilliform eruption. Swelling of the small joints of the hands.\nLaboratory Results: Low C3 and C4 levels. Proteinuria is present.",
    disease: "True Serum Sickness (Type III)",
    questions: [
      {
        q: "What is the mechanism of True Serum Sickness?",
        options: ["IgE-mediated allergy", "Type III Hypersensitivity (Circulating immune complexes depositing in small vessels)", "Direct mast cell release", "Fungal infection"],
        ans: 1,
        exp: "Classic serum sickness involves the deposition of drug-antibody complexes."
      },
      {
        q: "What is a classic laboratory finding in True Serum Sickness?",
        options: ["High complement (C3/C4)", "Low complement (C3/C4) due to consumption in immune complexes", "Low WBC", "High glucose"],
        ans: 1,
        exp: "Hypocomplementemia is a key indicator of immune complex consumption."
      },
      {
        q: "Which animal-derived products are modern causes of serum sickness?",
        options: ["Milk", "Antivenoms and Antithymocyte Globulin (ATG)", "Wool", "Honey"],
        ans: 1,
        exp: "Therapeutic proteins derived from non-human sources (horses, rabbits) are the most common triggers today."
      }
    ]
  },
  {
    title: "Drug Timelines Review",
    scenario: "A medical student is reviewing for the boards. She wants to know the typical timing for different drug reactions.\n\nVitals: Normal.\nPhysical Examination: None.\nLaboratory Results: None.",
    disease: "Drug Reaction Timelines",
    questions: [
      {
        q: "Which reaction typically occurs within MINUTES to HOURS of exposure?",
        options: ["SJS", "Urticaria/Anaphylaxis", "DRESS", "FDE"],
        ans: 1,
        exp: "IgE-mediated Type I reactions are immediate."
      },
      {
        q: "Which reaction typically occurs 2-8 WEEKS after starting a drug?",
        options: ["AGEP", "DRESS Syndrome", "Urticaria", "FDE"],
        ans: 1,
        exp: "DRESS has a characteristically long latency."
      },
      {
        q: "Which reaction typically occurs 1-3 DAYS after exposure?",
        options: ["SJS", "AGEP", "DRESS", "Melanoma"],
        ans: 1,
        exp: "AGEP is the 'fast' delayed-type reaction."
      }
    ]
  }
];
