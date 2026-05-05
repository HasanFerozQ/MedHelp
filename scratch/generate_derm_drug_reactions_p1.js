module.exports = [
  {
    title: "The Typical Rash",
    scenario: "A 25-year-old male presents with a widespread rash that started 7 days after beginning Amoxicillin for a throat infection. He denies any fever, mucosal pain, or skin tenderness.\n\nVitals: Normal.\nPhysical Examination: Symmetric, erythematous macules and papules on the trunk and proximal extremities. Many lesions are 'morbilliform' (measles-like). No blisters or Nikolsky sign.\nLaboratory Results: CBC shows no significant eosinophilia.",
    disease: "Exanthematous Drug Eruption",
    questions: [
      {
        q: "What is the most common type of adverse drug reaction in the skin?",
        options: ["SJS", "Exanthematous (Morbiliform) Drug Eruption", "Fixed Drug Eruption", "TEN"],
        ans: 1,
        exp: "Exanthematous eruptions account for approximately 90% of all skin drug reactions."
      },
      {
        q: "What is the typical timing for the onset of an exanthematous eruption in a previously unexposed patient?",
        options: ["1-2 hours", "7-14 days", "6 months", "Immediate"],
        ans: 1,
        exp: "It typically develops 1-2 weeks after starting a new medication, reflecting a delayed Type IV hypersensitivity."
      },
      {
        q: "Which finding would be MOST concerning for a transition to a more severe reaction (like SJS)?",
        options: ["Itching", "Skin tenderness and fever", "Redness on the trunk", "History of asthma"],
        ans: 1,
        exp: "Fever and skin pain are 'red flag' symptoms that suggest a more serious bullous reaction."
      }
    ]
  },
  {
    title: "The Recurrent Spot",
    scenario: "A 30-year-old male presents with a recurring dark spot on his glans penis. He notes that every time he takes Trimethoprim-Sulfamethoxazole for a UTI, the same spot becomes red, itchy, and occasionally blisters.\n\nVitals: Normal.\nPhysical Examination: A single, well-demarcated, 1.5 cm dusky red-to-violaceous plaque on the glans. \nLaboratory Results: Biopsy shows interface dermatitis with many necrotic keratinocytes and dermal melanophages.",
    disease: "Fixed Drug Eruption (FDE)",
    questions: [
      {
        q: "What is the hallmark clinical feature of a Fixed Drug Eruption?",
        options: ["It moves around the body", "It recurs in the exact same location upon re-exposure to the drug", "It only affects the face", "It is always associated with hair loss"],
        ans: 1,
        exp: "FDE 'fixes' to the same site due to resident memory T-cells."
      },
      {
        q: "Which medication class is the most common trigger for FDE on the genitalia?",
        options: ["Aspirin", "Sulfonamides", "Beta-blockers", "Statins"],
        ans: 1,
        exp: "Sulfonamides are classic triggers for genital FDE."
      },
      {
        q: "What is the characteristic residual appearance of an FDE after the acute inflammation subsides?",
        options: ["A scar", "Post-inflammatory hyperpigmentation (dusky brown)", "White patch", "The skin returns to normal instantly"],
        ans: 1,
        exp: "FDE typically leaves a persistent dusky brown patch due to pigment incontinence."
      }
    ]
  },
  {
    title: "The Puffy Face and Rash",
    scenario: "A 40-year-old woman began Carbamazepine 3 weeks ago for trigeminal neuralgia. She now presents with high fever, a diffuse rash, and facial swelling.\n\nVitals: T 39.2 C, HR 110, BP 120/80.\nPhysical Examination: Diffuse morbilliform eruption becoming confluent. Marked periorbital and facial edema. Palpable lymphadenopathy in the neck.\nLaboratory Results: WBC 15,000 with 15% eosinophils (Absolute eosinophil count 2,250). AST/ALT are elevated (3x normal).",
    disease: "DRESS Syndrome (DIHS)",
    questions: [
      {
        q: "What does the acronym DRESS stand for?",
        options: ["Drug Rash with Eosinophilia and Systemic Symptoms", "Delayed Rash and Eosinophil Skin Sore", "Drug-induced Redness and Eczema", "Direct Reaction to Exogenous Systemic Steroids"],
        ans: 0,
        exp: "DRESS is a severe systemic drug reaction involving internal organs."
      },
      {
        q: "What is the typical latency period for DRESS syndrome?",
        options: ["1 day", "2-8 weeks", "1 year", "1 hour"],
        ans: 1,
        exp: "DRESS has a longer latency than most other drug reactions (average 3-6 weeks)."
      },
      {
        q: "Which virus reactivation is frequently associated with DRESS syndrome?",
        options: ["HIV", "HHV-6 (Human Herpesvirus 6)", "Hepatitis C", "HPV"],
        ans: 1,
        exp: "HHV-6 reactivation is a key part of the pathogenesis in many DRESS cases."
      }
    ]
  },
  {
    title: "The Acute Pustules",
    scenario: "A 50-year-old male starts Cephalexin for a leg infection. 48 hours later, he develops a high fever and a burning rash in his skin folds.\n\nVitals: T 38.8 C.\nPhysical Examination: Diffuse erythema with hundreds of non-follicular, sterile, pinpoint pustules concentrated in the axillae and groin.\nLaboratory Results: WBC 18,000 with neutrophilia. Pustule culture is negative.",
    disease: "Acute Generalized Exanthematous Pustulosis (AGEP)",
    questions: [
      {
        q: "What is the characteristic timing for AGEP?",
        options: ["1 month", "Rapid onset (usually <48 hours after drug exposure)", "10 days", "Instant"],
        ans: 1,
        exp: "AGEP is one of the fastest-onset delayed-type hypersensitivity reactions."
      },
      {
        q: "Which medication class is most commonly associated with AGEP?",
        options: ["Aminoglycosides", "Beta-lactam antibiotics (Penicillins/Cephalosporins)", "NSAIDS", "Calcium channel blockers"],
        ans: 1,
        exp: "Beta-lactams and Macrolides are top triggers."
      },
      {
        q: "What is the typical prognosis for AGEP after stopping the offending drug?",
        options: ["Lethal", "Excellent; pustules typically desquamate and resolve within 1-2 weeks", "Requires lifelong steroids", "Causes permanent scarring"],
        ans: 1,
        exp: "AGEP has a very good prognosis once the drug is discontinued."
      }
    ]
  },
  {
    title: "The Painful Mouth and Skin",
    scenario: "A 60-year-old male started Allopurinol 2 weeks ago. He now presents with a painful rash and mouth sores.\n\nVitals: T 38.5 C.\nPhysical Examination: Atypical 'targetoid' macules on the chest and face. Two or more mucosal sites (mouth and eyes) are involved. Skin detachment is noted on about 5% of the body surface area.\nLaboratory Results: Skin biopsy shows full-thickness epidermal necrosis.",
    disease: "Stevens-Johnson Syndrome (SJS)",
    questions: [
      {
        q: "What is the defining body surface area (BSA) threshold for SJS?",
        options: [">30% BSA", "<10% BSA detachment", "50% BSA", "Must involve the whole body"],
        ans: 1,
        exp: "SJS involves <10% BSA detachment; 10-30% is overlap, and >30% is TEN."
      },
      {
        q: "Which HLA allele is strongly associated with Allopurinol-induced SJS in Han Chinese and Thai populations?",
        options: ["HLA-B*5701", "HLA-B*5801", "HLA-B*1502", "HLA-B*27"],
        ans: 1,
        exp: "HLA-B*5801 is the marker for Allopurinol risk; B*1502 is for Carbamazepine."
      },
      {
        q: "What is the hallmark histologic finding in SJS/TEN?",
        options: ["Pustules", "Full-thickness epidermal necrosis/apoptosis with minimal dermal inflammation", "Thickened epidermis", "Fungal hyphae"],
        ans: 1,
        exp: "The massive cell death is caused by cytotoxic T-cells and granulysin."
      }
    ]
  },
  {
    title: "The Sheet-Like Sloughing",
    scenario: "A 70-year-old patient on Phenytoin for seizures develops a high fever and widespread skin pain. Within 24 hours, her skin begins to peel off in large sheets.\n\nVitals: T 39.5 C, HR 120, BP 90/60.\nPhysical Examination: Dusky erythema progressing to confluent blisters. Nikolsky sign is positive. Epidermal detachment is estimated at 40% of the BSA.\nLaboratory Results: SCORTEN score is calculated to predict mortality.",
    disease: "Toxic Epidermal Necrolysis (TEN)",
    questions: [
      {
        q: "What is the Nikolsky sign?",
        options: ["Rubbing skin to see if it turns red", "Applying lateral pressure to the skin causes the epidermis to slide off the dermis", "A type of headache", "Pain on joint movement"],
        ans: 1,
        exp: "A positive Nikolsky sign indicates active epidermal cleavage."
      },
      {
        q: "What is the primary cause of death in TEN patients?",
        options: ["Liver failure", "Infection/Sepsis and multi-organ failure", "Brain damage", "Heart attack"],
        ans: 1,
        exp: "Loss of the skin barrier leads to massive fluid loss and overwhelming infection."
      },
      {
        q: "Where should a patient with >30% BSA involvement from TEN be managed?",
        options: ["At home", "A specialized Burn Unit or ICU", "Standard medical ward", "Psychiatric unit"],
        ans: 1,
        exp: "TEN patients require intensive fluid management and wound care similar to major burns."
      }
    ]
  },
  {
    title: "The Skin Necrosis (Warfarin)",
    scenario: "A 55-year-old woman with a history of DVT is started on Warfarin without a Heparin bridge. On day 3, she develops extremely painful, dark purple patches on her breasts and thighs.\n\nVitals: Normal.\nPhysical Examination: Well-demarcated areas of ecchymosis progressing to necrotic black eschars on adipose-rich areas.\nLaboratory Results: Patient is found to have a hereditary Protein C deficiency.",
    disease: "Warfarin-Induced Skin Necrosis",
    questions: [
      {
        q: "Why does Warfarin-induced skin necrosis occur early in treatment?",
        options: ["The drug is toxic to skin cells", "Warfarin causes a rapid drop in Protein C (which has a short half-life), creating a transient hypercoagulable state before the pro-coagulant factors fall", "It is an allergic reaction", "It only happens in the winter"],
        ans: 1,
        exp: "Protein C falls faster than Factors II, IX, and X, leading to microthrombosis in skin vessels."
      },
      {
        q: "What is the treatment for this condition?",
        options: ["Increase the Warfarin dose", "Stop Warfarin, give Vitamin K, and administer Protein C concentrate or Fresh Frozen Plasma (FFP)", "Apply topical steroids", "Antibiotics"],
        ans: 1,
        exp: "You must reverse the Warfarin effect and restore anticoagulation with Heparin."
      },
      {
        q: "Which body areas are most commonly affected by this condition?",
        options: ["Face", "Fat-rich areas (breasts, thighs, buttocks)", "Palms and soles", "Scalp"],
        ans: 1,
        exp: "Adipose tissue is the classic location for these necrotic lesions."
      }
    ]
  },
  {
    title: "The Sunburn-like Rash",
    scenario: "A patient taking Doxycycline for acne goes to the beach for 2 hours. She returns with a severe, painful redness only on her face, neck, and the backs of her hands.\n\nVitals: Normal.\nPhysical Examination: Well-demarcated, bright red erythema and edema in a strictly 'sun-exposed' distribution.\nLaboratory Results: None.",
    disease: "Phototoxic Drug Reaction",
    questions: [
      {
        q: "What is a Phototoxic reaction?",
        options: ["An allergy to the sun", "A non-immunologic reaction where a drug absorbs UV energy and directly damages the skin", "A fungal infection", "A type of acne"],
        ans: 1,
        exp: "Phototoxicity can happen to anyone if the drug concentration and UV dose are high enough."
      },
      {
        q: "Which class of antibiotics is the most common cause of phototoxicity?",
        options: ["Penicillins", "Tetracyclines (especially Doxycycline)", "Cephalosporins", "Macrolides"],
        ans: 1,
        exp: "Tetracyclines, Sulfonamides, and Fluoroquinolones are common triggers."
      },
      {
        q: "How does the distribution of phototoxicity differ from a typical drug rash?",
        options: ["It is only on the trunk", "It is limited to areas exposed to the sun (sun-exposed distribution)", "It is only on the feet", "It is random"],
        ans: 1,
        exp: "The 'sparing' of areas covered by clothing or shadows (like under the chin) is a key clue."
      }
    ]
  },
  {
    title: "The Anti-Histone Positive Rash",
    scenario: "A 65-year-old male on Procainamide for arrhythmias presents with joint pain, fever, and a rash on his face and trunk.\n\nVitals: T 38.0 C.\nPhysical Examination: Malar-like erythema and discoid-like plaques on the trunk.\nLaboratory Results: Positive ANA (1:640) and positive Anti-Histone antibodies. Anti-dsDNA is negative.",
    disease: "Drug-Induced Lupus Erythematosus (DILE)",
    questions: [
      {
        q: "Which antibody is highly sensitive (approx 95%) for Drug-Induced Lupus?",
        options: ["Anti-dsDNA", "Anti-Histone", "Anti-Smith", "Anti-Ro/SSA"],
        ans: 1,
        exp: "Anti-histone antibodies are the classic marker for DILE."
      },
      {
        q: "Which common medication for hypertension is a classic cause of DILE?",
        options: ["Amlodipine", "Hydralazine", "Lisinopril", "Hydrochlorothiazide"],
        ans: 1,
        exp: "Hydralazine, Procainamide, and Isoniazid are the 'big three' triggers."
      },
      {
        q: "Does DILE typically involve the kidneys or CNS?",
        options: ["Yes, frequently", "No, systemic involvement is usually limited to skin, joints, and serositis (pleuritis/pericarditis)", "Only in children", "Always"],
        ans: 1,
        exp: "Unlike idiopathic SLE, DILE rarely involves the renal or central nervous systems."
      }
    ]
  },
  {
    title: "The New Blisters (Pemphigus)",
    scenario: "A patient being treated with D-Penicillamine for Wilson's disease develops flaccid blisters and painful erosions in her mouth and on her chest.\n\nVitals: Normal.\nPhysical Examination: Flaccid bullae that rupture easily. Positive Nikolsky sign on the skin.\nLaboratory Results: Biopsy shows acantholysis. Direct Immunofluorescence (DIF) shows IgG in a 'fishnet' pattern.",
    disease: "Drug-Induced Pemphigus",
    questions: [
      {
        q: "Which chemical group in drugs like Penicillamine is thought to trigger Pemphigus?",
        options: ["Phenol", "Thiol (Sulfhydryl) group", "Amine", "Carboxyl"],
        ans: 1,
        exp: "Thiol-containing drugs can biochemically interfere with desmosome stability or act as haptens."
      },
      {
        q: "How does Drug-Induced Pemphigus behave compared to Pemphigus Vulgaris?",
        options: ["It is much worse", "It often resolves spontaneously upon discontinuation of the drug (especially if thiol-induced)", "It is contagious", "It is caused by a virus"],
        ans: 1,
        exp: "Many cases of drug-induced pemphigus are reversible."
      },
      {
        q: "What is the target of the autoantibodies in Pemphigus?",
        options: ["BP180", "Desmogleins (Dsg1 and Dsg3)", "Type VII Collagen", "Laminin"],
        ans: 1,
        exp: "Desmogleins are the 'glue' between keratinocytes that is destroyed in pemphigus."
      }
    ]
  },
  {
    title: "The Tense Blisters (Pemphigoid)",
    scenario: "An 80-year-old male on Furosemide develops large, very itchy, firm blisters on his legs and arms.\n\nVitals: Normal.\nPhysical Examination: Multiple large, tense bullae on an erythematous base. Nikolsky sign is negative.\nLaboratory Results: DIF shows a linear band of IgG and C3 along the basement membrane zone.",
    disease: "Drug-Induced Bullous Pemphigoid",
    questions: [
      {
        q: "What is the primary difference in the physical exam between Pemphigus and Pemphigoid?",
        options: ["Color of skin", "Pemphigoid has tense blisters (subepidermal); Pemphigus has flaccid blisters (intraepidermal)", "Pemphigoid is not itchy", "Pemphigus only affects feet"],
        ans: 1,
        exp: "Tense bullae are the hallmark of subepidermal blistering diseases like Bullous Pemphigoid."
      },
      {
        q: "Which drug class has been recently and strongly associated with Bullous Pemphigoid?",
        options: ["Statins", "DPP-4 inhibitors (Gliptins, e.g., Linagliptin)", "Metformin", "Aspirin"],
        ans: 1,
        exp: "Gliptins are now recognized as a major trigger for BP, especially in the elderly."
      },
      {
        q: "What is the target antigen in Bullous Pemphigoid?",
        options: ["Desmoglein 1", "BP180 (Type XVII Collagen) and BP230", "Desmoglein 3", "Integrin"],
        ans: 1,
        exp: "Autoantibodies target the hemidesmosomes that anchor the epidermis to the dermis."
      }
    ]
  },
  {
    title: "The Purple, Polygonal Papules",
    scenario: "A 50-year-old patient being treated with Gold salts for rheumatoid arthritis develops itchy, flat-topped purple bumps on his wrists.\n\nVitals: Normal.\nPhysical Examination: Multiple purple, polygonal, planar, pruritic papules (The '4 Ps'). Fine white lines (Wickham striae) are seen on the surface.",
    disease: "Drug-Induced Lichen Planus",
    questions: [
      {
        q: "What are the '4 Ps' of Lichen Planus?",
        options: ["Painful, Puffy, Pink, Pustular", "Purple, Polygonal, Planar, Pruritic", "Peeling, Pale, Pitted, Pointy", "Persisting, Papular, Phlegmonous, Pale"],
        ans: 1,
        exp: "These describe the classic morphology of LP."
      },
      {
        q: "How does drug-induced (lichenoid) LP often differ from 'classic' LP?",
        options: ["It is not itchy", "It is often more generalized, symmetric, and may lack Wickham striae or mucosal involvement", "It is only on the face", "It looks like a blister"],
        ans: 1,
        exp: "Lichenoid drug eruptions are often more extensive than idiopathic LP."
      },
      {
        q: "Which cardiovascular drug class is a common cause of lichenoid eruptions?",
        options: ["Beta-blockers and ACE inhibitors", "Statins", "Calcium channel blockers", "Nitrates"],
        ans: 0,
        exp: "Antihypertensives are frequent culprits for lichenoid drug rashes."
      }
    ]
  },
  {
    title: "The Steroid Acne",
    scenario: "A bodybuilder presents with an explosive onset of acne on his chest, back, and shoulders. He denies having acne as a teenager.\n\nVitals: Normal.\nPhysical Examination: Numerous monomorphic (all same size) inflammatory papules and pustules. No comedones (blackheads/whiteheads) are seen.\nLaboratory Results: Patient admits to taking anabolic steroids.",
    disease: "Drug-Induced (Steroid) Acne",
    questions: [
      {
        q: "What is the hallmark clinical feature of steroid-induced acne?",
        options: ["Deep cysts", "Monomorphic appearance (all lesions are at the same stage of development) and absence of comedones", "Only on the face", "Presence of many blackheads"],
        ans: 1,
        exp: "True acne has lesions in various stages (polymorphic); drug-induced is usually uniform (monomorphic)."
      },
      {
        q: "Besides anabolic steroids, which medication is a common cause of this eruption?",
        options: ["Systemic corticosteroids (e.g., Prednisone)", "Antibiotics", "Aspirin", "Vitamin C"],
        ans: 0,
        exp: "Prednisone is a classic trigger for 'steroid acne' in patients being treated for systemic diseases."
      },
      {
        q: "What is the primary treatment?",
        options: ["More steroids", "Discontinuing the offending agent", "Surgery", "Radiation"],
        ans: 1,
        exp: "The acne usually resolves once the steroids are stopped."
      }
    ]
  },
  {
    title: "The Target Lesion",
    scenario: "A 20-year-old presents with a 'bullseye' rash on his palms after taking a sulfonamide for a cold. He has no fever or mouth sores.\n\nVitals: Normal.\nPhysical Examination: Symmetric targetoid lesions with three distinct zones (dusky center, pale ring, erythematous rim) on the hands and feet.\nLaboratory Results: Biopsy shows vacuolar interface dermatitis.",
    disease: "Drug-Induced Erythema Multiforme (EM)",
    questions: [
      {
        q: "What is the most common cause of Erythema Multiforme overall?",
        options: ["Drugs", "Infections (especially Herpes Simplex Virus)", "Food", "Stress"],
        ans: 1,
        exp: "HSV is responsible for up to 90% of EM cases. Drugs are a much less common cause."
      },
      {
        q: "How many zones of color are typically seen in a 'classic' EM target lesion?",
        options: ["1", "2", "3", "4"],
        ans: 2,
        exp: "Classic targets have 3 zones; 'atypical' targets (seen in SJS) often have only 2."
      },
      {
        q: "What is the difference between EM Minor and EM Major?",
        options: ["Size of lesions", "EM Major involves one or more mucosal surfaces; EM Minor does not", "EM Major is lethal", "There is no difference"],
        ans: 1,
        exp: "Mucosal involvement defines the 'Major' subtype."
      }
    ]
  },
  {
    title: "The Red Man",
    scenario: "A patient receiving a rapid infusion of IV Vancomycin develops flushing, redness, and itching of his face, neck, and upper torso.\n\nVitals: HR 110, BP 100/60.\nPhysical Examination: Diffuse erythematous flush of the upper body. No hives or wheezing.\nLaboratory Results: None.",
    disease: "Red Man Syndrome",
    questions: [
      {
        q: "What is the mechanism of Red Man Syndrome?",
        options: ["IgE-mediated allergy", "Direct, non-immunologic histamine release from mast cells triggered by rapid vancomycin infusion", "A fungal infection", "An autoimmune attack"],
        ans: 1,
        exp: "It is a pseudo-allergy (anaphylactoid), not a true Type I allergy."
      },
      {
        q: "How can Red Man Syndrome be prevented?",
        options: ["Give the drug faster", "Slowing the rate of infusion (to >60 minutes) and pre-treating with antihistamines", "It cannot be prevented", "Avoid all antibiotics"],
        ans: 1,
        exp: "Infusion rate is the key factor."
      },
      {
        q: "Is Red Man Syndrome a contraindication to future Vancomycin use?",
        options: ["Yes, always", "No, it is not a true allergy; the drug can be used again with slower infusion rates", "Only if the patient is old", "Only in children"],
        ans: 1,
        exp: "Unlike anaphylaxis, you can safely reuse the drug."
      }
    ]
  },
  {
    title: "The Heparin Skin Necrosis",
    scenario: "A patient on Unfractionated Heparin for 1 week develops painful, red-to-purple patches at his abdominal injection sites.\n\nVitals: Normal.\nPhysical Examination: Circumscribed areas of necrosis and bruising around the needle marks.\nLaboratory Results: Platelet count has dropped from 250,000 to 80,000.",
    disease: "Heparin-Induced Skin Necrosis (HIT association)",
    questions: [
      {
        q: "What is the significance of skin necrosis in a patient on Heparin?",
        options: ["It is a normal bruise", "It is often a localized manifestation of Heparin-Induced Thrombocytopenia (HIT)", "It means the heparin is too strong", "It is an infection"],
        ans: 1,
        exp: "Skin necrosis at injection sites should immediately raise suspicion for systemic HIT."
      },
      {
        q: "What antibody is responsible for HIT?",
        options: ["Anti-dsDNA", "Antibodies against Platelet Factor 4 (PF4)-Heparin complexes", "Anti-S100", "ANA"],
        ans: 1,
        exp: "These antibodies activate platelets, causing both a drop in platelet count and massive clotting."
      },
      {
        q: "What is the first step in management?",
        options: ["Increase the heparin", "Stop all heparin immediately and switch to a non-heparin anticoagulant (e.g., Argatroban)", "Give Vitamin K", "Apply ice"],
        ans: 1,
        exp: "Stopping heparin is critical to prevent life-threatening thrombosis."
      }
    ]
  },
  {
    title: "The Cefaclor Rash",
    scenario: "A 5-year-old child presents with a hive-like rash and joint swelling 10 days after starting Cefaclor for an ear infection.\n\nVitals: T 37.8 C.\nPhysical Examination: Large, dusky, annular wheals. Swollen knees and ankles.\nLaboratory Results: CBC is normal; no true vasculitis on biopsy.",
    disease: "Serum Sickness-Like Reaction (SSLR)",
    questions: [
      {
        q: "What is a Serum Sickness-Like Reaction?",
        options: ["A true Type III reaction", "A reaction mimicking serum sickness (rash, fever, arthralgia) but lacking circulating immune complexes and vasculitis", "A bacterial infection", "A drug overdose"],
        ans: 1,
        exp: "SSLR is common in children, especially with Cefaclor."
      },
      {
        q: "How does SSLR differ from true Serum Sickness?",
        options: ["SSLR has kidney damage", "SSLR lacks immune complexes, proteinuria, and vasculitis", "SSLR is lethal", "There is no difference"],
        ans: 1,
        exp: "SSLR is a much milder, though dramatic-looking, condition."
      },
      {
        q: "What is the prognosis?",
        options: ["Requires surgery", "Excellent; spontaneous resolution after stopping the drug", "Chronic arthritis", "Permanent kidney failure"],
        ans: 1,
        exp: "It clears quickly and leaves no long-term damage."
      }
    ]
  },
  {
    title: "The Hand-Foot Soreness",
    scenario: "A patient on high-dose Capecitabine for colon cancer presents with redness, tingling, and pain on his palms and soles.\n\nVitals: Normal.\nPhysical Examination: Symmetric, bright red erythema and edema of the palms and soles. Some areas have begun to peel.\nLaboratory Results: None.",
    disease: "Hand-Foot Syndrome (PPE)",
    questions: [
      {
        q: "What is another name for Hand-Foot Syndrome?",
        options: ["SJS", "Palmar-Plantar Erythrodysesthesia (PPE)", "Acne", "Dermatitis"],
        ans: 1,
        exp: "PPE is the formal medical term."
      },
      {
        q: "Which chemotherapy agents are most commonly associated with PPE?",
        options: ["Penicillin", "Capecitabine, 5-FU, and Cytarabine", "Aspirin", "Statins"],
        ans: 1,
        exp: "Capecitabine is the classic trigger in oncology."
      },
      {
        q: "What is the mechanism thought to cause PPE?",
        options: ["Allergy", "Leakage of the drug from small capillaries into the thick skin of the palms and soles", "A viral infection", "Sun damage"],
        ans: 1,
        exp: "The high density of sweat glands and pressure/friction in these areas are also factors."
      }
    ]
  },
  {
    title: "The Acneiform Chemo Rash",
    scenario: "A patient being treated with Cetuximab for lung cancer develops an acne-like rash on his face and chest 1 week into treatment.\n\nVitals: Normal.\nPhysical Examination: Numerous small, itchy papules and pustules on the face and upper trunk. No comedones.\nLaboratory Results: None.",
    disease: "EGFR Inhibitor Acneiform Eruption",
    questions: [
      {
        q: "What is the significance of this rash in a patient on Cetuximab?",
        options: ["It means the drug is not working", "It is a positive prognostic indicator (the rash correlates with tumor response)", "It is a dangerous allergy", "It is an infection"],
        ans: 1,
        exp: "Counter-intuitively, patients who get the 'EGFR rash' often have better cancer outcomes."
      },
      {
        q: "What is the target of Cetuximab?",
        options: ["TNF-alpha", "Epidermal Growth Factor Receptor (EGFR)", "VEGF", "BRAF"],
        ans: 1,
        exp: "EGFR is essential for normal skin development, which is why blocking it causes this rash."
      },
      {
        q: "Should the Cetuximab be stopped because of this rash?",
        options: ["Yes, immediately", "No, it is usually managed with topical/oral antibiotics and steroids while continuing the chemo", "Yes, forever", "No, it goes away in 1 hour"],
        ans: 1,
        exp: "Dose reduction is only needed for very severe (Grade 3/4) rashes."
      }
    ]
  },
  {
    title: "The Blue Gums",
    scenario: "A 20-year-old on long-term Minocycline for acne presents with a new blue-gray color on his gums and shins.\n\nVitals: Normal.\nPhysical Examination: Muddy, blue-gray hyperpigmentation of the shins and the oral mucosa.\nLaboratory Results: Biopsy shows iron-containing pigment in the dermis.",
    disease: "Drug-Induced Pigmentation (Minocycline)",
    questions: [
      {
        q: "How many types of Minocycline pigmentation are there?",
        options: ["1", "2", "3", "4"],
        ans: 2,
        exp: "Type I (scars), Type II (shins/arms), and Type III (sun-exposed muddy-brown)."
      },
      {
        q: "What is the classic appearance of Type II Minocycline pigmentation?",
        options: ["Blue-gray color on the shins and forearms (like bruises that don't fade)", "Red spots", "White patches", "Orange skin"],
        ans: 0,
        exp: "The shins are the most classic 'high-yield' location for Type II."
      },
      {
        q: "Is this pigmentation permanent?",
        options: ["Yes", "It fades very slowly (months to years) after stopping the drug, and some types may require laser treatment", "It goes away in 1 day", "No, it turns into a tan"],
        ans: 1,
        exp: "Pigmentation can be very persistent and psychologically distressing."
      }
    ]
  },
  {
    title: "The Blue-Gray Face",
    scenario: "A 70-year-old male with a history of chronic arrhythmias on Amiodarone presents with a distinct blue-gray color on his face and ears.\n\nVitals: Normal.\nPhysical Examination: Slate-gray to violaceous pigmentation of sun-exposed areas (face, ears, neck).\nLaboratory Results: Biopsy shows lipofuscin-like granules in dermal macrophages.",
    disease: "Drug-Induced Pigmentation (Amiodarone)",
    questions: [
      {
        q: "What is the causative agent for 'slate-gray' facial pigmentation?",
        options: ["Aspirin", "Amiodarone", "Penicillin", "Insulin"],
        ans: 1,
        exp: "Amiodarone is the classic cause of this 'blue man' appearance."
      },
      {
        q: "In what distribution does Amiodarone pigmentation occur?",
        options: ["Only on the feet", "Sun-exposed areas (it is a photo-induced process)", "Only the palms", "Internal organs only"],
        ans: 1,
        exp: "UV light is required for the development of the pigment."
      },
      {
        q: "What is another potential skin side effect of Amiodarone?",
        options: ["Hair growth", "Photosensitivity (exaggerated sunburn)", "Skin thickening", "Warts"],
        ans: 1,
        exp: "Up to 50% of patients on Amiodarone experience some degree of photosensitivity."
      }
    ]
  },
  {
    title: "The Shifting Bullae",
    scenario: "A patient on Sulfasalazine for Crohn's disease presents with a fever and a rash covering 20% of his body. The skin is beginning to slough.\n\nVitals: T 38.5 C.\nPhysical Examination: Detached skin on the trunk and limbs. Nikolsky sign is positive. BSA of detachment is exactly 20%.\nLaboratory Results: SCORTEN is 2.",
    disease: "SJS/TEN Overlap",
    questions: [
      {
        q: "What defines the 'SJS/TEN Overlap' category?",
        options: ["1-5% BSA", "10% to 30% BSA detachment", "Exactly 50% BSA", "It involves only the mouth"],
        ans: 1,
        exp: "This is the 'gray zone' between SJS and TEN."
      },
      {
        q: "Which medication is a major trigger for the SJS/TEN spectrum in patients with the HLA-B*1502 allele?",
        options: ["Aspirin", "Carbamazepine", "Allopurinol", "Doxycycline"],
        ans: 1,
        exp: "B*1502 screening is mandatory before starting Carbamazepine in many Asian countries."
      },
      {
        q: "What is the SCORTEN system used for?",
        options: ["To measure height", "To predict the probability of death (prognosis) in SJS/TEN based on 7 clinical variables", "To count white blood cells", "To measure BP"],
        ans: 1,
        exp: "Variables include age, heart rate, BUN, BSA, bicarbonate, malignancy history, and glucose."
      }
    ]
  },
  {
    title: "The Flagellate Erythema",
    scenario: "A 30-year-old woman being treated with Bleomycin for Hodgkin's lymphoma develops itchy, linear red streaks on her back that look like 'whip marks'.\n\nVitals: Normal.\nPhysical Examination: Multiple linear, criss-crossing erythematous streaks on the trunk and back.\nLaboratory Results: None.",
    disease: "Flagellate Erythema",
    questions: [
      {
        q: "Which medication is the classic cause of flagellate erythema?",
        options: ["Penicillin", "Bleomycin", "Insulin", "Methotrexate"],
        ans: 1,
        exp: "The 'whip-mark' appearance is virtually pathognomonic for bleomycin toxicity (though it can rarely occur with shiitake mushroom ingestion)."
      },
      {
        q: "What is the mechanism for the flagellate distribution?",
        options: ["The patient is scratching", "Induced by minor trauma or scratching (Koebner-like) in the setting of the drug", "It follows the nerves", "It follows the veins"],
        ans: 1,
        exp: "Scratching likely concentrates the drug or its effects along the lines of trauma."
      },
      {
        q: "Is flagellate erythema a reason to stop Bleomycin?",
        options: ["Yes, always", "No, it is usually managed symptomatically (antihistamines) and isn't a contraindication to more chemo", "Yes, it means the patient is allergic", "Only in children"],
        ans: 1,
        exp: "It is a cutaneous side effect, not a life-threatening emergency."
      }
    ]
  },
  {
    title: "The Gingival Overgrowth",
    scenario: "A patient being treated for epilepsy presents with 'swollen gums' that are now covering half of his teeth.\n\nVitals: Normal.\nPhysical Examination: Firm, non-tender, fibrous enlargement of the gingival papillae.\nLaboratory Results: Patient is taking Phenytoin.",
    disease: "Drug-Induced Gingival Hyperplasia",
    questions: [
      {
        q: "Besides Phenytoin, which other drug class is a major cause of gingival hyperplasia?",
        options: ["Calcium channel blockers (especially Nifedipine)", "ACE inhibitors", "Statins", "NSAIDs"],
        ans: 0,
        exp: "Nifedipine and Cyclosporine are the other two major culprits."
      },
      {
        q: "What is the best way to manage drug-induced gingival hyperplasia?",
        options: ["Pulling the teeth", "Meticulous oral hygiene and potentially switching to an alternative medication", "Gargling with salt water", "Nothing"],
        ans: 1,
        exp: "Good hygiene can significantly reduce the severity of the overgrowth."
      },
      {
        q: "Is this condition reversible?",
        options: ["Yes, it usually resolves several months after stopping the offending drug", "No, it requires surgery", "Yes, in 1 day", "No, it is permanent"],
        ans: 0,
        exp: "While it can resolve after drug cessation, severe cases may require surgical gingivectomy."
      }
    ]
  },
  {
    title: "The Naproxen Blisters",
    scenario: "A patient taking Naproxen for arthritis develops small, fragile blisters on the back of his hands. He notes his skin is 'fragile' and shears easily.\n\nVitals: Normal.\nPhysical Examination: Multiple small vesicles and erosions on sun-exposed hands. Milia are present.\nLaboratory Results: Normal porphyrin levels (rules out Porphyria Cutanea Tarda).",
    disease: "Pseudoporphyria",
    questions: [
      {
        q: "What is Pseudoporphyria?",
        options: ["A real porphyria", "A condition that clinically and histologically mimics Porphyria Cutanea Tarda (PCT) but has normal porphyrin levels", "A fungal infection", "A type of bruise"],
        ans: 1,
        exp: "It looks identical to PCT but is triggered by drugs rather than metabolic defects."
      },
      {
        q: "Which medication is the most common cause of Pseudoporphyria?",
        options: ["Naproxen", "Aspirin", "Penicillin", "Metformin"],
        ans: 0,
        exp: "NSAIDs, particularly naproxen, are the leading cause."
      },
      {
        q: "How do you distinguish Pseudoporphyria from PCT?",
        options: ["Check the color of the skin", "Test urine and blood for porphyrin levels (normal in pseudoporphyria)", "By the patient's age", "Biopsy only"],
        ans: 1,
        exp: "Normal porphyrin studies are diagnostic for pseudoporphyria."
      }
    ]
  }
];
