module.exports = [
  {
    title: "The 'Psoriasis' and the Liver",
    scenario: "A 50-year-old male with long-standing psoriasis has been on Methotrexate for 10 years. He is a social drinker.\n\nVitals: Normal.\nPhysical Examination: Minimal psoriasis plaques.\nLaboratory Results: AST/ALT are mildly elevated (1.5x normal). Procollagen III peptide is elevated.",
    disease: "Methotrexate Hepatotoxicity",
    questions: [
      {
        q: "What is the long-term cumulative risk of Methotrexate use?",
        options: ["Kidney failure", "Hepatic fibrosis and cirrhosis", "Hearing loss", "None"],
        ans: 1,
        exp: "Liver toxicity is dose-dependent and cumulative."
      },
      {
        q: "Which lifestyle factor significantly increases the risk of MTX-induced liver damage?",
        options: ["Smoking", "Alcohol consumption", "High protein diet", "None"],
        ans: 1,
        exp: "Alcohol and MTX are synergistic hepatotoxins."
      },
      {
        q: "What is the 'Gold Standard' for assessing MTX-induced liver fibrosis (though less commonly used now due to non-invasive tests)?",
        options: ["CT scan", "Liver Biopsy", "Ultrasound", "None"],
        ans: 1,
        exp: "Historically, liver biopsy was required after 1.5-4g cumulative dose."
      }
    ]
  },
  {
    title: "The 'Lupus' and the 'White' Blood Cells",
    scenario: "A patient with systemic lupus is started on Azathioprine.\n\nVitals: Normal.\nPhysical Examination: Joint pain and rash.\nLaboratory Results: None.",
    disease: "Azathioprine (TPMT Screening)",
    questions: [
      {
        q: "Which enzyme must be measured BEFORE starting Azathioprine to prevent life-threatening bone marrow suppression?",
        options: ["G6PD", "Thiopurine Methyltransferase (TPMT)", "Amylase", "None"],
        ans: 1,
        exp: "Patients with low TPMT activity cannot metabolize the drug, leading to toxic levels of 6-TGN."
      },
      {
        q: "Azathioprine is a 'prodrug' that is converted to which active metabolite?",
        options: ["6-Mercaptopurine (6-MP)", "Methotrexate", "Prednisone", "None"],
        ans: 0,
        exp: "6-MP is the active compound."
      },
      {
        q: "A dangerous drug interaction occurs when Azathioprine is combined with which gout medication?",
        options: ["Colchicine", "Allopurinol (which inhibits xanthine oxidase, the alternative metabolic pathway)", "Probenecid", "None"],
        ans: 1,
        exp: "Allopurinol can increase Azathioprine levels by 4-fold, leading to severe leukopenia."
      }
    ]
  },
  {
    title: "The 'Transplant' and the Gum Swelling",
    scenario: "A renal transplant patient on Cyclosporine presents with 'swollen gums'.\n\nVitals: BP 155/95 (High).\nPhysical Examination: Gingival hyperplasia (overgrowth of the gums). Hirsutism (excess body hair).\nLaboratory Results: Elevated Creatinine.",
    disease: "Cyclosporine Side Effects",
    questions: [
      {
        q: "What are the two major 'systemic' side effects of Cyclosporine?",
        options: ["Weight loss and diarrhea", "Nephrotoxicity and Hypertension", "Anemia and hair loss", "None"],
        ans: 1,
        exp: "Renal vasoconstriction leads to both high blood pressure and kidney damage."
      },
      {
        q: "The 'Gingival Hyperplasia' seen with Cyclosporine is shared with which other common drug class?",
        options: ["Beta blockers", "Calcium Channel Blockers (e.g., Nifedipine) and Phenytoin", "Antibiotics", "None"],
        ans: 1,
        exp: "This is a classic 'Step' association for gum overgrowth."
      },
      {
        q: "Which medication is an 'alternative' to Cyclosporine with less hirsutism and gum hyperplasia, but more risk of hair loss (alopecia)?",
        options: ["Azathioprine", "Tacrolimus", "Methotrexate", "None"],
        ans: 1,
        exp: "Tacrolimus is also a calcineurin inhibitor but has a different side effect profile."
      }
    ]
  },
  {
    title: "The 'Pemphigus' and the 'Red' Urine",
    scenario: "A patient with severe Pemphigus Vulgaris is started on Cyclophosphamide.\n\nVitals: Normal.\nPhysical Examination: Blisters.\nLaboratory Results: UA shows microscopic hematuria.",
    disease: "Cyclophosphamide (Hemorrhagic Cystitis)",
    questions: [
      {
        q: "What is the most common 'Bladder' complication of Cyclophosphamide therapy?",
        options: ["Bladder stones", "Hemorrhagic Cystitis (due to the metabolite Acrolein)", "Bladder cancer (long-term risk)", "Both 1 and 2"],
        ans: 3,
        exp: "Acrolein is toxic to the urothelium."
      },
      {
        q: "What can be given to patients on high-dose IV Cyclophosphamide to prevent this bladder toxicity?",
        options: ["Vitamin C", "MESNA (2-mercaptoethane sulfonate) and vigorous hydration", "Aspirin", "None"],
        ans: 1,
        exp: "MESNA binds Acrolein in the bladder, rendering it non-toxic."
      },
      {
        q: "Besides the bladder, which system is frequently affected by Cyclophosphamide, leading to 'Infertility'?",
        options: ["Liver", "Gonads (Ovarian failure or permanent azoospermia)", "Thyroid", "None"],
        ans: 1,
        exp: "Gonadal toxicity is a major counseling point for young patients."
      }
    ]
  },
  {
    title: "The 'Acne' and the 'Headache'",
    scenario: "A 20-year-old female taking Doxycycline for acne and oral contraceptives starts Isotretinoin. She develops a severe, 'throbbing' headache and blurry vision.\n\nVitals: Normal.\nPhysical Examination: Papilledema (swollen optic discs) on fundoscopy.\nLaboratory Results: Normal Brain MRI.",
    disease: "Pseudotumor Cerebri (Drug Interaction)",
    questions: [
      {
        q: "What is the diagnosis for increased intracranial pressure without a tumor?",
        options: ["Meningitis", "Pseudotumor Cerebri (Idiopathic Intracranial Hypertension)", "Migraine", "Stroke"],
        ans: 1,
        exp: "Drug-induced IIH is a known risk."
      },
      {
        q: "The combination of which two drug classes is notoriously linked to this complication?",
        options: ["Penicillins and Steroids", "Tetracyclines (Doxy/Mino) and Retinoids (Isotretinoin)", "Statins and Fibrates", "None"],
        ans: 1,
        exp: "Tetracyclines and Retinoids should NEVER be used together for this reason."
      },
      {
        q: "What is the first step in management?",
        options: ["Increase the drug dose", "Discontinue the offending medications immediately and refer to Neurology/Ophthalmology", "Give Aspirin", "None"],
        ans: 1,
        exp: "Immediate cessation is required to prevent permanent vision loss from optic nerve damage."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Bone' Pain",
    scenario: "A woman with psoriasis has been on long-term, high-dose oral Prednisone. She develops sudden, severe hip pain.\n\nVitals: Normal.\nPhysical Examination: Pain with internal rotation of the hip. No fever.\nLaboratory Results: MRI shows 'Avascular Necrosis' of the femoral head.",
    disease: "Steroid-induced Avascular Necrosis (AVN)",
    questions: [
      {
        q: "Long-term systemic corticosteroids are a major risk factor for which skeletal complication?",
        options: ["Osteosarcoma", "Avascular Necrosis (Osteonecrosis)", "Bone spurs", "None"],
        ans: 1,
        exp: "This is a non-dose-dependent, potentially devastating side effect."
      },
      {
        q: "Which metabolic bone disease is almost 'Guaranteed' with long-term steroid use, requiring prophylactic therapy?",
        options: ["Rickets", "Steroid-induced Osteoporosis", "Paget's disease", "None"],
        ans: 1,
        exp: "Bisphosphonates, Calcium, and Vitamin D are often started early."
      },
      {
        q: "What happens to the 'Sugar' in a diabetic patient started on systemic steroids?",
        options: ["It goes down", "It goes up (Hyperglycemia)", "It stays the same", "None"],
        ans: 1,
        exp: "Steroids increase gluconeogenesis and decrease insulin sensitivity."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Yeast'",
    scenario: "A patient being treated with an IL-17 inhibitor (e.g., Taltz) for psoriasis develops white patches in his mouth.\n\nVitals: Normal.\nPhysical Examination: Oral thrush.\nLaboratory Results: KOH shows pseudohyphae.",
    disease: "IL-17 Inhibitor and Candidiasis",
    questions: [
      {
        q: "Why does blocking IL-17 increase the risk of fungal infections like Candida?",
        options: ["It kills white blood cells", "IL-17 is essential for the recruitment of neutrophils to fight fungal infections at mucosal surfaces", "It makes the mouth dry", "None"],
        ans: 1,
        exp: "The Th17 pathway is the primary defense against extracellular fungi."
      },
      {
        q: "Is oral thrush a reason to permanently stop the IL-17 inhibitor?",
        options: ["Yes, always", "No, it is usually mild and can be managed with standard topical antifungals (e.g., Nystatin) while continuing the biologic", "Only in the elderly", "None"],
        ans: 1,
        exp: "The benefit of psoriasis control usually outweighs the manageable side effect."
      },
      {
        q: "Which other IL-17 related agent (a receptor blocker) has an even higher rate of candidiasis?",
        options: ["Secukinumab", "Brodalumab", "Ixekizumab", "None"],
        ans: 1,
        exp: "Brodalumab (the receptor blocker) has slightly higher reported rates."
      }
    ]
  },
  {
    title: "The 'Acne' and the 'Yellow' Eyes",
    scenario: "A 16-year-old on Minocycline for 6 months develops fatigue and 'yellow eyes'.\n\nVitals: Normal.\nPhysical Examination: Scleral icterus.\nLaboratory Results: AST/ALT 800 (very high). Positive Anti-nuclear antibody (ANA) and Anti-smooth muscle antibody (ASMA).",
    disease: "Drug-induced Autoimmune Hepatitis (Minocycline)",
    questions: [
      {
        q: "Minocycline is a recognized trigger for which autoimmune liver condition?",
        options: ["Primary Biliary Cholangitis", "Drug-induced Autoimmune Hepatitis (DIAH)", "Liver cancer", "None"],
        ans: 1,
        exp: "It can mimic idiopathic AIH with positive ANA and ASMA."
      },
      {
        q: "What is the management of Minocycline-induced hepatitis?",
        options: ["Add Prednisone and stop the Minocycline", "Increase the Minocycline dose", "Antibiotics", "None"],
        ans: 0,
        exp: "Stopping the drug is mandatory; steroids may be needed if the hepatitis is severe."
      },
      {
        q: "Besides the liver, which 'Lupus-like' syndrome can Minocycline cause?",
        options: ["Discoid lupus", "Drug-induced Systemic Lupus Erythematosus (DILE)", "Neonatal lupus", "None"],
        ans: 1,
        exp: "Minocycline is a classic cause of DILE, along with Hydralazine and Procainamide."
      }
    ]
  },
  {
    title: "The 'Psoriasis' and the 'Bad Mood'",
    scenario: "A patient on Brodalumab (Siliq) for severe psoriasis mentions he has been 'feeling very down' and thinking about hurting himself.\n\nVitals: Normal.\nPhysical Examination: Plaques are clear.\nLaboratory Results: None.",
    disease: "Brodalumab and Suicidality (REMS)",
    questions: [
      {
        q: "Why does Brodalumab have a 'Black Box Warning' and a REMS (Risk Evaluation and Mitigation Strategy) program?",
        options: ["Liver failure", "Observed suicidal ideation and behavior in clinical trials", "Kidney failure", "Heart attacks"],
        ans: 1,
        exp: "While the causal link is debated, the warning remains part of the mandatory safety protocol."
      },
      {
        q: "What should you do if a patient on Brodalumab develops new or worsening depression?",
        options: ["Nothing, keep the drug", "Refer for psychiatric evaluation and consider discontinuing the drug", "Give more psoriasis medicine", "None"],
        ans: 1,
        exp: "Patient safety regarding mood is a priority for this specific medication."
      },
      {
        q: "Brodalumab is unique among IL-17 agents because it targets what?",
        options: ["The IL-17A cytokine", "The IL-17 Receptor A (IL-17RA)", "IL-23", "None"],
        ans: 1,
        exp: "It blocks the receptor, thereby blocking signaling from multiple IL-17 isoforms (A, F, A/F, E)."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Pill' Absorption",
    scenario: "A patient with high cholesterol taking Cholestyramine is also prescribed oral Terbinafine for onychomycosis.\n\nVitals: Normal.\nPhysical Examination: Thick nails.\nLaboratory Results: None.",
    disease: "Cholestyramine (Drug Interactions)",
    questions: [
      {
        q: "How does Cholestyramine affect the absorption of other oral medications?",
        options: ["It increases it", "It binds to many drugs in the GI tract, significantly decreasing their absorption", "It has no effect", "None"],
        ans: 1,
        exp: "It is a non-specific bile acid sequestrant."
      },
      {
        q: "What is the best way to avoid this interaction?",
        options: ["Take them together", "Space the medications out (e.g., take other drugs 1 hour before or 4-6 hours after the resin)", "Take with fat", "None"],
        ans: 1,
        exp: "Timing is everything with binding resins."
      },
      {
        q: "Which vitamin absorption can also be impaired by chronic resin use?",
        options: ["Vitamin C", "Fat-soluble vitamins (A, D, E, K)", "B-vitamins", "None"],
        ans: 1,
        exp: "Bile is needed for the absorption of fat-soluble vitamins."
      }
    ]
  },
  {
    title: "The 'Blister' and the 'Dapsone'",
    scenario: "A patient with Dermatitis Herpetiformis is started on Dapsone. A few days later, he feels 'short of breath' and his lips look 'blue-gray'.\n\nVitals: O2 Sat 88% (on room air, but does not improve with 100% oxygen).\nPhysical Examination: Cyanosis (blue lips/nails). The blood draw looks 'chocolate-colored'.\nLaboratory Results: Normal PaO2 on ABG.",
    disease: "Dapsone-induced Methemoglobinemia",
    questions: [
      {
        q: "What is the diagnosis for cyanosis with a normal PaO2 and 'chocolate blood'?",
        options: ["Heart failure", "Methemoglobinemia", "Carbon monoxide poisoning", "Anemia"],
        ans: 1,
        exp: "Dapsone is a powerful oxidizing agent that converts ferrous iron to ferric iron in hemoglobin."
      },
      {
        q: "What is the 'Antidote' for severe, symptomatic methemoglobinemia?",
        options: ["Oxygen only", "Methylene Blue (which reduces the iron back to the ferrous state)", "Vitamin C", "None"],
        ans: 1,
        exp: "Methylene blue is the rapid treatment of choice."
      },
      {
        q: "Which enzyme deficiency makes the hemolytic side effects of Dapsone much worse?",
        options: ["TPMT", "G6PD Deficiency", "Amylase", "None"],
        ans: 1,
        exp: "G6PD is needed to protect RBCs from oxidative stress."
      }
    ]
  },
  {
    title: "The 'Lupus' and the 'Puffy' Face",
    scenario: "A patient on long-term Prednisone for lupus presents with a 'round' face and a 'hump' on her upper back.\n\nVitals: BP 150/90.\nPhysical Examination: Moon facies, buffalo hump, and wide purple striae (stretch marks) on the abdomen.\nLaboratory Results: None.",
    disease: "Iatrogenic Cushing Syndrome",
    questions: [
      {
        q: "What is the cause of these physical changes?",
        options: ["The underlying lupus", "Iatrogenic Cushing Syndrome due to chronic exogenous corticosteroid use", "Too much salt", "None"],
        ans: 1,
        exp: "Excessive cortisol (synthetic) leads to fat redistribution and skin thinning."
      },
      {
        q: "What should be done when a patient has been on high-dose steroids for several weeks and needs to stop?",
        options: ["Stop immediately", "Taper the dose slowly to allow the suppressed HPA axis (adrenal glands) to recover", "Switch to oral antibiotics", "None"],
        ans: 1,
        exp: "Sudden withdrawal can lead to life-threatening adrenal crisis."
      },
      {
        q: "Why do the 'striae' in Cushing's look purple?",
        options: ["They are bruised", "The skin is so thin that the underlying blood vessels are visible", "It is an allergy", "None"],
        ans: 1,
        exp: "Wide (>1cm), purple striae are highly suggestive of Cushing's."
      }
    ]
  },
  {
    title: "The 'Pemphigus' and the 'Rituximab'",
    scenario: "A patient with refractory Pemphigus Vulgaris is receiving Rituximab infusions.\n\nVitals: Normal.\nPhysical Examination: Eroded skin.\nLaboratory Results: None.",
    disease: "Rituximab (Pharmacology)",
    questions: [
      {
        q: "Rituximab is a monoclonal antibody that targets which protein on B-cells?",
        options: ["CD4", "CD20", "CD8", "None"],
        ans: 1,
        exp: "Depleting B-cells reduces the production of the pathogenic desmoglein autoantibodies."
      },
      {
        q: "What is the major systemic risk during the infusion of Rituximab?",
        options: ["Kidney stones", "Infusion-related reactions (fever, chills, hypotension) and anaphylaxis", "Hair loss", "None"],
        ans: 1,
        exp: "Patients are often pre-medicated with antihistamines and acetaminophen."
      },
      {
        q: "Which rare but fatal brain infection can occur with Rituximab (and other immunosuppressants)?",
        options: ["Meningitis", "Progressive Multifocal Leukoencephalopathy (PML) due to JC virus reactivation", "Brain abscess", "None"],
        ans: 1,
        exp: "PML is a serious safety concern for many targeted biologic therapies."
      }
    ]
  },
  {
    title: "The 'Acne' and the 'Pill' Safety",
    scenario: "A woman on Isotretinoin is using oral contraceptives and condoms for the 'two forms of birth control' required by iPLEDGE.\n\nVitals: Normal.\nPhysical Examination: Acne.\nLaboratory Results: None.",
    disease: "Isotretinoin and OCPs",
    questions: [
      {
        q: "Why are progestin-only 'mini-pills' NOT recommended as a primary form of birth control on Isotretinoin?",
        options: ["They cause acne", "They have a higher failure rate and are considered less reliable than combined OCPs", "They are too expensive", "None"],
        ans: 1,
        exp: "iPLEDGE has specific requirements for 'highly effective' contraception."
      },
      {
        q: "Which common antibiotic used for acne can potentially decrease the efficacy of oral contraceptives (though this is debated)?",
        options: ["Tetracyclines", "Rifampin (the only one with strong evidence for this)", "Penicillin", "None"],
        ans: 1,
        exp: "While commonly taught, only enzyme-inducers like Rifampin have solid evidence for OCP failure."
      },
      {
        q: "What is the 'iPLEDGE' requirement for pregnancy testing?",
        options: ["Once a year", "Monthly, before each new prescription is issued", "Only at the start", "None"],
        ans: 1,
        exp: "Strict monthly adherence is mandatory."
      }
    ]
  },
  {
    title: "The 'Psoriasis' and the 'Stomach' Pain",
    scenario: "A patient on Methotrexate for 2 years develops abdominal pain and dark, tarry stools.\n\nVitals: HR 110, BP 100/60.\nPhysical Examination: Epigastric tenderness.\nLaboratory Results: Hemoglobin 9.0 (Low).",
    disease: "Methotrexate and NSAID Interaction",
    questions: [
      {
        q: "Which common over-the-counter medication class can dangerously increase Methotrexate levels by competing for renal excretion?",
        options: ["Acetaminophen", "NSAIDs (e.g., Ibuprofen, Naproxen)", "Vitamins", "None"],
        ans: 1,
        exp: "NSAIDs can lead to Methotrexate toxicity, including GI ulceration and bone marrow suppression."
      },
      {
        q: "What is the primary site of Methotrexate elimination?",
        options: ["Liver", "Kidneys (Renal excretion)", "Lungs", "None"],
        ans: 1,
        exp: "Dosage must be adjusted for renal impairment."
      },
      {
        q: "Besides NSAIDs, which other drug class can decrease renal MTX clearance?",
        options: ["Statins", "Proton Pump Inhibitors (PPIs)", "Antibiotics like Penicillin", "Both 2 and 3"],
        ans: 3,
        exp: "Many common drugs can interfere with MTX clearance."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Nail' Polish (Management)",
    scenario: "A patient with allergic contact dermatitis to nickel is looking for ways to prevent the rash.\n\nVitals: Normal.\nPhysical Examination: Red, itchy rash under the metal button of her jeans.\nLaboratory Results: Positive patch test to Nickel.",
    disease: "Nickel Allergy (Pharmacotherapy/Prevention)",
    questions: [
      {
        q: "What is the best 'Non-pharmacologic' way to prevent nickel dermatitis from clothing?",
        options: ["Wash clothes in bleach", "Apply a barrier (like a piece of tape or clear nail polish) over the metal button, or wear a shirt tucked in", "Take an antihistamine daily", "None"],
        ans: 1,
        exp: "Physical separation of the skin and the allergen is key."
      },
      {
        q: "Which chemical test kit can be used to identify nickel in jewelry at home?",
        options: ["Wood's lamp", "Dimethylglyoxime test (turns pink in the presence of nickel)", "Pregnancy test", "None"],
        ans: 1,
        exp: "This is a practical tool for sensitized patients."
      },
      {
        q: "What is the best initial treatment for the 'rash' itself once it appears?",
        options: ["Topical steroids", "Topical antibiotics", "Oral steroids", "None"],
        ans: 0,
        exp: "Topical steroids treat the acute allergic inflammation."
      }
    ]
  },
  {
    title: "The 'Pemphigus' and the 'Bone' Safety",
    scenario: "A 60-year-old female is starting a 6-month course of high-dose Prednisone for Pemphigus.\n\nVitals: Normal.\nPhysical Examination: Blisters.\nLaboratory Results: None.",
    disease: "Steroid-induced Osteoporosis Prevention",
    questions: [
      {
        q: "What is the recommended baseline screening for this patient?",
        options: ["Liver ultrasound", "DEXA scan (to measure bone mineral density)", "Chest X-ray", "None"],
        ans: 1,
        exp: "Long-term steroids (>3 months) carry a high risk of osteoporosis."
      },
      {
        q: "Which supplement combination is standard for prevention?",
        options: ["Iron and Zinc", "Calcium and Vitamin D", "Vitamin C and E", "None"],
        ans: 1,
        exp: "These provide the building blocks for bone maintenance."
      },
      {
        q: "Which class of medication is often added if the patient is at high risk for fracture?",
        options: ["Statins", "Bisphosphonates (e.g., Alendronate)", "Antibiotics", "None"],
        ans: 1,
        exp: "Bisphosphonates are first-line for steroid-induced osteoporosis."
      }
    ]
  },
  {
    title: "The 'Acne' and the 'Birth' Defects",
    scenario: "A woman on Isotretinoin discovers she is pregnant.\n\nVitals: Normal.\nPhysical Examination: Acne.\nLaboratory Results: Positive HCG.",
    disease: "Isotretinoin Embryopathy",
    questions: [
      {
        q: "Isotretinoin is what Category in pregnancy?",
        options: ["Category A", "Category X (Teratogenic)", "Category B", "None"],
        ans: 1,
        exp: "It is one of the most potent human teratogens known."
      },
      {
        q: "What is the characteristic 'Retinoid Embryopathy' triad of defects?",
        options: ["Heart, Brain, and Ears (e.g., microtia)", "Lungs, Liver, Kidneys", "Skin only", "None"],
        ans: 0,
        exp: "Craniofacial, CNS, and cardiovascular defects are classic."
      },
      {
        q: "How many months after stopping Isotretinoin is it safe to conceive?",
        options: ["Immediately", "1 month (due to the short half-life of 20 hours)", "3 years", "Never"],
        ans: 1,
        exp: "This is a key contrast to Acitretin (3 years)."
      }
    ]
  },
  {
    title: "The 'Psoriasis' and the 'Blood' Pressure",
    scenario: "A 50-year-old male on Cyclosporine for psoriasis has a blood pressure of 160/100.\n\nVitals: BP 160/100.\nPhysical Examination: Plaques are better.\nLaboratory Results: Creatinine 1.5 (Baseline 0.9).",
    disease: "Cyclosporine Nephrotoxicity/Hypertension",
    questions: [
      {
        q: "What is the primary mechanism of Cyclosporine-induced hypertension?",
        options: ["Too much salt", "Renal afferent arteriolar vasoconstriction", "Direct effect on the heart", "None"],
        ans: 1,
        exp: "Reduced blood flow to the kidneys triggers the RAAS system."
      },
      {
        q: "Which anti-hypertensive class is often preferred to treat this specific side effect?",
        options: ["Beta blockers", "Calcium Channel Blockers (e.g., Nifedipine/Amlodipine) as they may help reverse the vasoconstriction", "Diuretics", "None"],
        ans: 1,
        exp: "Dihydropyridine CCBs are a logical choice."
      },
      {
        q: "What should be done with the Cyclosporine dose if the Creatinine rises >30% above baseline?",
        options: ["Increase it", "Decrease the dose or discontinue the drug", "Keep it the same", "None"],
        ans: 1,
        exp: "Close monitoring of renal function is the cornerstone of safe Cyclosporine use."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Light'",
    scenario: "A patient with severe eczema is receiving Narrowband UVB therapy.\n\nVitals: Normal.\nPhysical Examination: Lichenified skin.\nLaboratory Results: None.",
    disease: "Phototherapy (Narrowband UVB)",
    questions: [
      {
        q: "What is the wavelength of Narrowband UVB (NB-UVB)?",
        options: ["254 nm", "311-313 nm", "350 nm", "None"],
        ans: 1,
        exp: "This narrow peak provides the best therapeutic effect with the least burning (erythema)."
      },
      {
        q: "What is the most common 'Acute' side effect of phototherapy?",
        options: ["Skin cancer", "Erythema (sunburn) and itching", "Weight gain", "None"],
        ans: 1,
        exp: "Monitoring the Minimal Erythema Dose (MED) is part of the protocol."
      },
      {
        q: "What is the long-term risk of excessive phototherapy over many years?",
        options: ["Cataracts", "Photoaging and increased risk of non-melanoma skin cancer", "Liver failure", "None"],
        ans: 1,
        exp: "Cumulative UV exposure is a risk factor for carcinogenesis."
      }
    ]
  },
  {
    title: "The 'Psoriasis' and the 'Joint' Pain",
    scenario: "A patient with psoriasis develops joint swelling. He is started on Methotrexate.\n\nVitals: Normal.\nPhysical Examination: Swollen PIP and DIP joints (Dactylitis/Sausage digits).\nLaboratory Results: Negative Rheumatoid Factor.",
    disease: "Methotrexate (Psoriatic Arthritis)",
    questions: [
      {
        q: "Why is Methotrexate often chosen for patients with both skin psoriasis and joint involvement?",
        options: ["It's cheap", "It treats both the cutaneous plaques and the underlying inflammatory arthritis", "It's a pill", "None"],
        ans: 1,
        exp: "MTX is a first-line DMARD for psoriatic arthritis."
      },
      {
        q: "Which specific joint finding is more common in Psoriatic Arthritis than Rheumatoid Arthritis?",
        options: ["Wrist swelling", "DIP joint involvement and dactylitis (sausage digits)", "Knee pain", "None"],
        ans: 1,
        exp: "DIP involvement is a hallmark of PsA."
      },
      {
        q: "If the patient fails Methotrexate, which drug class is usually the next step for psoriatic arthritis?",
        options: ["Topical steroids", "TNF-alpha inhibitors (e.g., Etanercept, Adalimumab)", "Antibiotics", "None"],
        ans: 1,
        exp: "Biologics are highly effective for the axial and peripheral joints in PsA."
      }
    ]
  },
  {
    title: "The 'Acne' and the 'Mood' (Reasoning)",
    scenario: "A 17-year-old male on Isotretinoin for 3 months has become withdrawn and is no longer interested in playing soccer with his friends.\n\nVitals: Normal.\nPhysical Examination: Acne is improving.\nLaboratory Results: None.",
    disease: "Isotretinoin and Depression (Algorithm)",
    questions: [
      {
        q: "Is there a proven causal link between Isotretinoin and depression/suicide?",
        options: ["Yes, 100%", "It remains controversial; studies show mixed results, but the risk must be taken seriously and monitored", "No, it's impossible", "None"],
        ans: 1,
        exp: "The FDA requires warnings despite the lack of a definitive causative mechanism."
      },
      {
        q: "What is the best next step in management for this patient?",
        options: ["Increase the dose to clear the acne faster", "Screen for depression, involve the parents, and consider discontinuing the drug for evaluation", "Give an antidepressant and keep the drug", "None"],
        ans: 1,
        exp: "Clinical safety and mental health take priority over acne clearing."
      },
      {
        q: "Which other systemic 'Retinoid' (used for psoriasis) has a similar warning?",
        options: ["Tretinoin", "Acitretin", "None", "Brodalumab (biologic, not a retinoid)"],
        ans: 3,
        exp: "While Brodalumab has the warning, Acitretin generally does not have the same level of focus on mood as Isotretinoin."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Heart' (Reasoning)",
    scenario: "An elderly patient with onychomycosis is taking Terbinafine. He also takes Digoxin for atrial fibrillation.\n\nVitals: Normal.\nPhysical Examination: Brittle nails.\nLaboratory Results: None.",
    disease: "Terbinafine vs. Itraconazole (Safety)",
    questions: [
      {
        q: "Between Terbinafine and Itraconazole, which has 'Fewer' cytochrome P450 drug interactions?",
        options: ["Itraconazole", "Terbinafine", "They are the same", "None"],
        ans: 1,
        exp: "Terbinafine is a safer choice for patients on multiple medications (polypharmacy)."
      },
      {
        q: "Which specific Digoxin-related risk is a concern with Itraconazole (but not Terbinafine)?",
        options: ["It makes Digoxin stop working", "It can increase Digoxin levels, leading to toxicity", "It causes rashes", "None"],
        ans: 1,
        exp: "Itraconazole is a CYP3A4 inhibitor; Terbinafine is a CYP2D6 inhibitor."
      },
      {
        q: "What is the preferred management for nail fungus in a patient with multi-organ failure?",
        options: ["Oral antifungals", "Topical therapy (e.g., Efinaconazole) or conservative nail trimming", "Surgery", "None"],
        ans: 1,
        exp: "The risks of systemic therapy often outweigh the benefits in very frail patients."
      }
    ]
  },
  {
    title: "The 'Pemphigus' and the 'Sugar' (Reasoning)",
    scenario: "A diabetic patient with Pemphigus Vulgaris needs a high-dose steroid taper.\n\nVitals: Normal.\nPhysical Examination: Blisters.\nLaboratory Results: Blood sugar 350.",
    disease: "Steroid Management in Diabetes",
    questions: [
      {
        q: "What is the expected effect of Prednisone on insulin requirements?",
        options: ["Requirement decreases", "Requirement increases (often requiring a significant increase in basal and bolus insulin)", "No change", "None"],
        ans: 1,
        exp: "Steroids induce significant insulin resistance."
      },
      {
        q: "Which steroid has 'Zero' mineralocorticoid (salt-retaining) activity, making it safer for patients with heart failure or severe edema?",
        options: ["Hydrocortisone", "Dexamethasone", "Prednisone", "None"],
        ans: 1,
        exp: "Dexamethasone and Betamethasone have purely glucocorticoid activity."
      },
      {
        q: "When a patient is on long-term steroids, what happens to their 'WBC' count?",
        options: ["It goes down", "It goes up (Leukocytosis with Neutrophilia due to demargination)", "It stays the same", "None"],
        ans: 1,
        exp: "This is a benign 'Step' association; it doesn't always mean infection."
      }
    ]
  },
  {
    title: "The 'Acne' and the 'Liver' (Reasoning)",
    scenario: "A patient on Isotretinoin has an ALT that is 2x the upper limit of normal.\n\nVitals: Normal.\nPhysical Examination: Acne.\nLaboratory Results: ALT 80, AST 70 (Normal <40).",
    disease: "Isotretinoin Laboratory Management",
    questions: [
      {
        q: "What is the standard management for a mild ( < 3x normal) elevation of transaminases on Isotretinoin?",
        options: ["Stop immediately", "Monitor closely and repeat labs; only discontinue if levels exceed 3x normal or the patient becomes symptomatic", "Ignore it forever", "None"],
        ans: 1,
        exp: "Minor elevations often stabilize or resolve without stopping the drug."
      },
      {
        q: "If the Triglycerides rise to > 500 mg/dL, what is the concern?",
        options: ["Heart attack", "Risk of acute pancreatitis", "Hair loss", "None"],
        ans: 1,
        exp: "Severe hypertriglyceridemia (>800-1000) is a mandatory reason for drug cessation."
      },
      {
        q: "What is the effect of Isotretinoin on 'Bone' in long-term high-dose therapy (e.g., for ichthyosis)?",
        options: ["None", "Premature epiphyseal closure and DISH (diffuse idiopathic skeletal hyperostosis)", "Bone growth", "None"],
        ans: 1,
        exp: "Skeletal toxicity is a concern with multi-year high-dose retinoid use."
      }
    ]
  }
];
