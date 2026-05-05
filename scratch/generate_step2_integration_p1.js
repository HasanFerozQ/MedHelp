module.exports = [
  {
    title: "The Rapid Rash and Headache",
    scenario: "A 19-year-old college student is brought to the ER with a severe headache, high fever, and a rapidly spreading rash. He was well 12 hours ago.\n\nVitals: T 39.8 C, BP 85/50 mmHg, HR 125 bpm, RR 26 bpm.\nPhysical Examination: Ill-appearing, confused. Neck stiffness and positive Brudzinski sign. The skin shows multiple petechiae and large, dusky purpuric patches (purpura fulminans) on the lower extremities.\nLaboratory Results: WBC 22,000 (85% neutrophils, 10% bands). Platelets 45,000. LP shows cloudy fluid with 2,000 neutrophils and Gram-negative diplococci.",
    disease: "Meningococcemia",
    questions: [
      {
        q: "What is the most likely causative organism for this multi-system presentation?",
        options: ["Streptococcus pneumoniae", "Neisseria meningitidis", "Staphylococcus aureus", "Haemophilus influenzae"],
        ans: 1,
        exp: "Neisseria meningitidis is a classic cause of rapid-onset sepsis, meningitis, and purpura fulminans (DIC)."
      },
      {
        q: "What is the mechanism behind the 'purpura fulminans' seen in this patient?",
        options: ["Direct bacterial invasion of skin cells", "Disseminated Intravascular Coagulation (DIC) leading to microvascular thrombosis and hemorrhagic necrosis", "Allergic reaction to the fever", "Venous insufficiency"],
        ans: 1,
        exp: "The toxin-induced inflammatory cascade triggers systemic clotting and consumption of coagulation factors."
      },
      {
        q: "What is the immediate management priority for this patient?",
        options: ["Wait for blood culture results", "CT head", "Empiric IV antibiotics (e.g., Ceftriaxone and Vancomycin) and aggressive fluid resuscitation", "Topical steroids for the rash"],
        ans: 2,
        exp: "Time is of the essence; antibiotics must be started immediately after (or even before) LP if delayed."
      }
    ]
  },
  {
    title: "The Heart and the Hand",
    scenario: "A 65-year-old male with a history of a prosthetic heart valve presents with low-grade fever, weight loss, and 'painful spots' on his fingertips for 3 days.\n\nVitals: T 38.1 C, BP 130/80 mmHg.\nPhysical Examination: A new grade III/VI systolic murmur at the apex. Small, tender, erythematous nodules on the pads of the fingers (Osler nodes). Non-tender, hemorrhagic macules on the palms (Janeway lesions). Splinter hemorrhages in the nails.\nLaboratory Results: ESR 85. Blood cultures show growth of Streptococcus viridans in 3 of 3 sets. Echocardiogram shows a 5mm vegetation on the mitral valve.",
    disease: "Infective Endocarditis",
    questions: [
      {
        q: "What is the immunopathologic mechanism of 'Osler Nodes'?",
        options: ["Microemboli of bacteria", "Immune complex deposition (Type III hypersensitivity)", "Direct fungal infection", "Mechanical trauma"],
        ans: 1,
        exp: "Osler nodes are tender, immunologic phenomena, whereas Janeway lesions are non-tender and embolic."
      },
      {
        q: "Which of the following is considered a 'Major' Duke criterion for the diagnosis of IE?",
        options: ["Osler nodes", "Fever > 38.0 C", "Positive echocardiogram showing vegetation", "Janeway lesions"],
        ans: 2,
        exp: "Duke Major criteria include positive blood cultures (typical organism) and evidence of endocardial involvement (Echo)."
      },
      {
        q: "The splinter hemorrhages in this patient are caused by which mechanism?",
        options: ["Vitamin deficiency", "Microemboli from the heart vegetation", "Fungal infection", "None of the above"],
        ans: 1,
        exp: "Septic microemboli lodge in the small capillaries of the nail bed."
      }
    ]
  },
  {
    title: "The Target and the Joint",
    scenario: "A 32-year-old male presents with a large 'bulls-eye' rash on his leg and a swollen, painful right knee. He went hiking in Connecticut 4 weeks ago.\n\nVitals: Normal.\nPhysical Examination: A large (15 cm) annular plaque with central clearing on the thigh (Erythema Migrans). Right knee is swollen, warm, and tender with limited range of motion.\nLaboratory Results: Synovial fluid shows WBC 40,000 (neutrophil-predominant) with no crystals or bacteria. Serology for Borrelia burgdorferi is positive.",
    disease: "Lyme Disease (Lyme Arthritis)",
    questions: [
      {
        q: "What is the vector for the transmission of this disease?",
        options: ["Anopheles mosquito", "Ixodes tick (Deer tick)", "Dermacentor tick", "Flea"],
        ans: 1,
        exp: "Lyme disease is transmitted by the Ixodes scapularis tick."
      },
      {
        q: "Which stage of Lyme disease is represented by the swollen knee (arthritis)?",
        options: ["Early localized", "Early disseminated", "Late disseminated", "None of the above"],
        ans: 2,
        exp: "Arthritis is a hallmark of late Lyme disease (months after the initial bite)."
      },
      {
        q: "What is the treatment of choice for early localized Lyme disease (EM rash) in a non-pregnant adult?",
        options: ["Penicillin", "Doxycycline", "Vancomycin", "Acyclovir"],
        ans: 1,
        exp: "Oral Doxycycline for 10-14 days is the standard treatment."
      }
    ]
  },
  {
    title: "The Copper Penny Rash",
    scenario: "A 28-year-old male presents with a non-itchy rash on his trunk, palms, and soles. He remembers having a painless 'ulcer' on his penis about 2 months ago that healed on its own.\n\nVitals: Normal.\nPhysical Examination: Symmetric, red-brown, maculopapular rash on the trunk and prominent 'copper-penny' lesions on the palms and soles. Generalized lymphadenopathy (epitrochlear nodes present). Small, flat, moist-appearing gray papules in the perianal area.\nLaboratory Results: RPR positive (1:64). FTA-ABS positive.",
    disease: "Secondary Syphilis",
    questions: [
      {
        q: "What is the name for the moist, gray perianal papules seen in this patient?",
        options: ["Condyloma acuminata", "Condyloma lata", "Molluscum", "Hemorrhoids"],
        ans: 1,
        exp: "Condyloma lata are highly infectious lesions of secondary syphilis. Condyloma acuminata are HPV-induced warts."
      },
      {
        q: "The presence of a rash on the palms and soles should strongly raise suspicion for which conditions?",
        options: ["Syphilis, Rocky Mountain Spotted Fever, and Coxsackievirus (Hand-Foot-Mouth)", "Eczema and Psoriasis", "Acne and Rosacea", "Tinea and Vitiligo"],
        ans: 0,
        exp: "This is a classic 'high-yield' clinical distribution triad."
      },
      {
        q: "What is the treatment of choice for secondary syphilis?",
        options: ["Oral Azithromycin", "IM Penicillin G benzathine (2.4 million units, single dose)", "IV Ceftriaxone", "Topical Steroids"],
        ans: 1,
        exp: "Single-dose IM Benzathine Penicillin G is the standard treatment for early syphilis."
      }
    ]
  },
  {
    title: "The Purple Patch and the Cough",
    scenario: "A 35-year-old HIV-positive male with a CD4 count of 80 presents with several dark purple, firm patches on his legs and a persistent dry cough.\n\nVitals: Normal.\nPhysical Examination: Multiple violaceous, non-blanching nodules and plaques on the lower extremities and hard palate. Lung auscultation is clear.\nLaboratory Results: Chest X-ray shows bibasilar infiltrates and pleural effusions. Bronchoscopy shows similar violaceous lesions on the bronchial mucosa.",
    disease: "Kaposi Sarcoma",
    questions: [
      {
        q: "Which virus is the causative agent of Kaposi Sarcoma?",
        options: ["HIV", "Human Herpesvirus 8 (HHV-8)", "EBV", "HPV"],
        ans: 1,
        exp: "While HIV provides the immunosuppressive environment, HHV-8 is the oncogenic driver."
      },
      {
        q: "Kaposi sarcoma is a malignancy of which cell type?",
        options: ["Keratinocytes", "Melanocytes", "Vascular endothelial cells", "Lymphocytes"],
        ans: 2,
        exp: "It is an angioproliferative disorder of the vascular endothelium."
      },
      {
        q: "What is the first-line management for AIDS-associated Kaposi Sarcoma?",
        options: ["Chemotherapy only", "Initiation or optimization of Antiretroviral Therapy (ART)", "Surgical excision of all lesions", "Antibiotics"],
        ans: 1,
        exp: "Restoring immune function with ART often leads to regression of KS lesions."
      }
    ]
  },
  {
    title: "The Peeling Child",
    scenario: "A 4-year-old child presents with a 5-day history of high fever, red eyes, and a peeling rash on his hands.\n\nVitals: T 39.5 C.\nPhysical Examination: Bilateral non-exudative conjunctival injection. Strawberry tongue and cracked red lips. Erythematous, polymorphous rash on the trunk. Edema and erythema of the hands with desquamation (peeling) around the fingernails. Single enlarged cervical lymph node (2 cm).\nLaboratory Results: WBC 15,000. Platelets 600,000 (thrombocytosis). ESR 100.",
    disease: "Kawasaki Disease",
    questions: [
      {
        q: "What is the most serious potential complication of this disease?",
        options: ["Liver failure", "Coronary artery aneurysms", "Blindness", "Kidney stones"],
        ans: 1,
        exp: "Kawasaki disease is a medium-vessel vasculitis with a predilection for coronary arteries."
      },
      {
        q: "What is the recommended treatment to reduce the risk of the complication mentioned above?",
        options: ["High-dose Aspirin and IVIG (Intravenous Immunoglobulin)", "Steroids and Ibuprofen", "Antibiotics", "Acyclovir"],
        ans: 0,
        exp: "IVIG within the first 10 days significantly reduces the risk of aneurysms."
      },
      {
        q: "This patient's 'Strawberry Tongue' is also seen in which other pediatric infection?",
        options: ["Chickenpox", "Scarlet Fever (Group A Strep)", "Roseola", "Hand-Foot-Mouth"],
        ans: 1,
        exp: "Scarlet fever also presents with a strawberry tongue and rash, but lacks the conjunctivitis and hand changes of Kawasaki."
      }
    ]
  },
  {
    title: "The Butterfly and the Protein",
    scenario: "A 26-year-old female presents with a red rash on her cheeks, joint pain in her hands, and swelling of her ankles.\n\nVitals: BP 150/95 mmHg.\nPhysical Examination: Malar erythema sparing the nasolabial folds. Swelling and tenderness of the PIP and MCP joints. 2+ pitting edema of the lower legs.\nLaboratory Results: UA shows 3+ protein and RBC casts. Positive ANA (1:1280) and low C3/C4 levels.",
    disease: "Systemic Lupus Erythematosus (SLE) with Lupus Nephritis",
    questions: [
      {
        q: "The combination of malar rash, arthritis, and proteinuria meets how many SLICC criteria for SLE?",
        options: ["1", "2", "3", "4 (meets diagnosis)", "5"],
        ans: 3,
        exp: "Malar rash (1), Arthritis (2), Proteinuria (3), and ANA positive (4) satisfy the clinical/immunologic criteria."
      },
      {
        q: "What is the significance of the 'RBC casts' in the urine?",
        options: ["Bladder infection", "Glomerulonephritis (nephritic syndrome)", "Kidney stones", "Normal in women"],
        ans: 1,
        exp: "RBC casts are pathognomonic for glomerular bleeding, indicating active lupus nephritis."
      },
      {
        q: "Which antibody is MOST specific for the diagnosis of SLE?",
        options: ["ANA", "Anti-dsDNA or Anti-Smith", "Anti-Ro", "Anti-Histone"],
        ans: 1,
        exp: "While ANA is very sensitive, Anti-dsDNA and Anti-Smith are highly specific for SLE."
      }
    ]
  },
  {
    title: "The Heliotrope and the Weakness",
    scenario: "A 55-year-old male presents with difficulty rising from a chair and a purple rash on his face.\n\nVitals: Normal.\nPhysical Examination: Violaceous erythema of the eyelids (heliotrope rash). Red, scaly papules on the knuckles (Gottron papules). Symmetric proximal muscle weakness (3/5) in the deltoids and hip flexors.\nLaboratory Results: Elevated CK and Aldolase. CT Chest/Abdomen reveals an irregular mass in the right lung.",
    disease: "Dermatomyositis (Paraneoplastic)",
    questions: [
      {
        q: "Dermatomyositis in an older adult should prompt an immediate evaluation for what?",
        options: ["Diabetes", "Internal malignancy (Paraneoplastic syndrome)", "Vitamin D deficiency", "Fungal infection"],
        ans: 1,
        exp: "About 20-25% of adult dermatomyositis cases are associated with an underlying cancer."
      },
      {
        q: "What is the primary site of muscle involvement in dermatomyositis?",
        options: ["Distal muscles (hands/feet)", "Proximal muscles (shoulders/hips)", "Only the face", "Smooth muscle of the gut"],
        ans: 1,
        exp: "DM/PM typically presents with symmetric proximal muscle weakness."
      },
      {
        q: "Which specific skin finding is considered 'pathognomonic' for dermatomyositis?",
        options: ["Heliotrope rash", "Gottron papules", "Malar rash", "Psoriasis"],
        ans: 1,
        exp: "Gottron papules (violaceous papules over the joints) are highly specific for DM."
      }
    ]
  },
  {
    title: "The Hard Skin and the Heartburn",
    scenario: "A 45-year-old woman complains of 'shiny' skin on her hands, difficulty swallowing solid food, and fingers that turn white in the cold.\n\nVitals: Normal.\nPhysical Examination: Tightening and thickening of the skin on the fingers (sclerodactyly). Telangiectasias on the face. Raynaud's phenomenon in the fingers.\nLaboratory Results: Positive Anti-Centromere antibody. Esophageal manometry shows aperistalsis in the lower two-thirds.",
    disease: "Limited Systemic Sclerosis (CREST Syndrome)",
    questions: [
      {
        q: "What does the 'E' in the CREST mnemonic stand for?",
        options: ["Edema", "Esophageal dysmotility", "Eczema", "Erythema"],
        ans: 1,
        exp: "C-Calcinosis, R-Raynaud's, E-Esophageal dysmotility, S-Sclerodactyly, T-Telangiectasia."
      },
      {
        q: "Which serious vascular complication is most associated with the LIMITED form of systemic sclerosis?",
        options: ["Renal crisis", "Pulmonary Arterial Hypertension (PAH)", "Aortic aneurysm", "Stroke"],
        ans: 1,
        exp: "PAH is a major cause of late mortality in limited disease, whereas Renal Crisis is more common in diffuse disease."
      },
      {
        q: "The Anti-Scl-70 (Topoisomerase I) antibody is associated with which form of scleroderma?",
        options: ["Limited", "Diffuse (associated with pulmonary fibrosis)", "Morphea", "None"],
        ans: 1,
        exp: "Anti-Scl-70 is the marker for diffuse systemic sclerosis."
      }
    ]
  },
  {
    title: "The Blood in the Urine and the Nose",
    scenario: "A 50-year-old male presents with chronic sinusitis, a persistent cough with bloody sputum, and dark-colored urine.\n\nVitals: BP 160/100 mmHg.\nPhysical Examination: Crusts and ulcerations in the nasal cavity (saddle-nose deformity). Lung exam shows rales. Pitting edema of the legs.\nLaboratory Results: UA shows RBCs and RBC casts. Positive c-ANCA (PR3-ANCA). Biopsy of the lung shows necrotizing granulomatous vasculitis.",
    disease: "Granulomatosis with Polyangiitis (GPA/Wegener''s)",
    questions: [
      {
        q: "Which triad of systems is classically involved in GPA?",
        options: ["Upper respiratory, Lower respiratory, and Renal", "Heart, Brain, and Gut", "Skin, Joints, and Eyes", "Liver, Spleen, and Bone"],
        ans: 0,
        exp: "The 'Wegener's triad' involves the nasopharynx, lungs, and kidneys."
      },
      {
        q: "What is the most characteristic laboratory marker for GPA?",
        options: ["p-ANCA", "c-ANCA (Anti-proteinase 3)", "ANA", "Rheumatoid Factor"],
        ans: 1,
        exp: "c-ANCA is highly sensitive and specific for GPA."
      },
      {
        q: "The 'saddle-nose' deformity is caused by destruction of which structure?",
        options: ["Nasal bone", "Nasal cartilage", "Skin of the nose", "Brain"],
        ans: 1,
        exp: "Chronic granulomatous inflammation destroys the cartilaginous nasal bridge."
      }
    ]
  },
  {
    title: "The Purple Spots on the Child",
    scenario: "An 8-year-old boy presents with a purple rash on his legs, belly pain, and dark urine following a cold 1 week ago.\n\nVitals: Normal.\nPhysical Examination: Palpable purpura on the buttocks and lower extremities. Abdomen is tender. Joint swelling in the ankles.\nLaboratory Results: UA shows microscopic hematuria. Platelet count is normal. Biopsy of a skin lesion shows IgA-dominant leukocytoclastic vasculitis.",
    disease: "Henoch-Schönlein Purpura (IgA Vasculitis)",
    questions: [
      {
        q: "What is the key clinical finding that distinguishes HSP from other causes of purpura (like ITP)?",
        options: ["The spots are itchy", "The purpura are 'palpable' and occur with a normal platelet count", "The patient is old", "There is no fever"],
        ans: 1,
        exp: "HSP is a small-vessel vasculitis; the spots are raised (palpable) because of vessel wall inflammation, not low platelets."
      },
      {
        q: "What is the classic tetrad of HSP?",
        options: ["Purpura, Arthritis, Abdominal pain, and Renal disease", "Fever, Rash, Cough, Diarrhea", "Headache, Neck pain, Photophobia, Vomiting", "None of the above"],
        ans: 0,
        exp: "This is the 'classic' pediatric vasculitis presentation."
      },
      {
        q: "Which gastrointestinal emergency is a known complication of HSP in children?",
        options: ["Appendicitis", "Intussusception", "Pyloric stenosis", "Volvulus"],
        ans: 1,
        exp: "Bowel wall edema can act as a lead point for intussusception (usually ileo-ileal)."
      }
    ]
  },
  {
    title: "The Sinus, the Asthma, and the Spots",
    scenario: "A 40-year-old male with a long history of severe asthma develops numbness in his left foot and purple spots on his legs.\n\nVitals: Normal.\nPhysical Examination: Palpable purpura on the lower limbs. Weakness in dorsiflexion of the left foot (foot drop). Lung exam shows diffuse wheezing.\nLaboratory Results: WBC 15,000 with 30% eosinophils (Eosinophilia). Positive p-ANCA (MPO-ANCA). Chest X-ray shows transient pulmonary infiltrates.",
    disease: "Eosinophilic Granulomatosis with Polyangiitis (Churg-Strauss)",
    questions: [
      {
        q: "What is the 'hallmark' laboratory finding in Churg-Strauss syndrome?",
        options: ["Neutrophilia", "Peripheral eosinophilia (>10% or absolute count >1500)", "High glucose", "Low platelets"],
        ans: 1,
        exp: "Eosinophilia is a diagnostic requirement for EGPA."
      },
      {
        q: "The numbness and 'foot drop' in this patient represent which complication?",
        options: ["Stroke", "Mononeuritis multiplex (due to vasculitis of the vasa nervorum)", "Herniated disc", "Muscle strain"],
        ans: 1,
        exp: "Vasculitis affecting the blood supply to nerves is common in ANCA-associated vasculitides."
      },
      {
        q: "Which systemic condition is almost universally present in patients with EGPA?",
        options: ["Diabetes", "Asthma (often severe or late-onset)", "Hypertension", "Psoriasis"],
        ans: 1,
        exp: "EGPA almost always develops in patients with pre-existing asthma and allergic rhinitis."
      }
    ]
  },
  {
    title: "The Mouth Sores and the Belly Pain",
    scenario: "A 22-year-old female presents with recurrent, painful mouth ulcers and bloody diarrhea.\n\nVitals: Normal.\nPhysical Examination: Multiple aphthous ulcers on the buccal mucosa. Tender, red nodules on the shins (erythema nodosum). Abdominal tenderness.\nLaboratory Results: Colonoscopy shows 'skip lesions' and a 'cobblestone' appearance of the terminal ileum.",
    disease: "Crohn''s Disease with Extra-intestinal Manifestations",
    questions: [
      {
        q: "What is the red, tender nodule on the shins called?",
        options: ["Pyoderma gangrenosum", "Erythema nodosum", "Sweet's syndrome", "Cellulitis"],
        ans: 1,
        exp: "EN is a septal panniculitis and a common skin finding in IBD and Sarcoidosis."
      },
      {
        q: "How does the 'skip lesion' pattern help distinguish Crohn's from Ulcerative Colitis (UC)?",
        options: ["Crohn's is continuous; UC skips", "Crohn's involves patchy areas with normal mucosa in between; UC is continuous starting from the rectum", "There is no difference", "Crohn's only affects the colon"],
        ans: 1,
        exp: "Patchy involvement (skip lesions) and transmural inflammation are hallmarks of Crohn's."
      },
      {
        q: "Which skin condition in IBD presents as a painful ulcer with a 'violaceous, undermined' border?",
        options: ["Erythema nodosum", "Pyoderma gangrenosum", "Acanthosis nigricans", "Vitiligo"],
        ans: 1,
        exp: "PG is the more severe and ulcerative skin manifestation of IBD."
      }
    ]
  },
  {
    title: "The Cough and the Red Eyes",
    scenario: "A 30-year-old African American female presents with a dry cough, blurry vision, and red bumps on her shins.\n\nVitals: Normal.\nPhysical Examination: Painful, erythematous nodules on the pretibial area. Bilateral redness of the eyes (uveitis). Enlarged, firm parotid glands.\nLaboratory Results: Chest X-ray shows bilateral hilar lymphadenopathy. Serum ACE (Angiotensin-Converting Enzyme) level is high. Biopsy of a shin nodule shows non-caseating granulomas.",
    disease: "Sarcoidosis",
    questions: [
      {
        q: "What is the classic histological finding in sarcoidosis?",
        options: ["Caseating granulomas", "Non-caseating granulomas", "Pus-filled abscesses", "Acantholysis"],
        ans: 1,
        exp: "Non-caseating granulomas are the hallmark, distinguishing it from Tuberculosis."
      },
      {
        q: "What is the name for the syndrome of fever, uveitis, parotitis, and facial nerve palsy in sarcoidosis?",
        options: ["Lofgren Syndrome", "Heerfordt Syndrome (Uveoparotid fever)", "Sweet Syndrome", "CREST"],
        ans: 1,
        exp: "This is a specific, rare constellation of sarcoid findings."
      },
      {
        q: "Lofgren syndrome includes which clinical triad?",
        options: ["Erythema nodosum, hilar lymphadenopathy, and polyarthritis", "Cough, rash, diarrhea", "Fever, headache, stiff neck", "None of the above"],
        ans: 0,
        exp: "Lofgren syndrome is a benign, acute presentation of sarcoidosis."
      }
    ]
  },
  {
    title: "The Velvety Neck and the Weight Loss",
    scenario: "A 60-year-old male notices dark, thick, 'velvety' skin in his armpits and on the back of his neck. He has also lost 15 lbs unintentionally.\n\nVitals: Normal.\nPhysical Examination: Hyperpigmented, velvety plaques in the intertriginous areas (acanthosis nigricans). Multiple sudden-onset seborrheic keratoses on the back (Leser-Trélat sign).\nLaboratory Results: Fasting glucose is normal. Abdominal CT shows a mass in the stomach.",
    disease: "Malignancy-associated Acanthosis Nigricans",
    questions: [
      {
        q: "While acanthosis nigricans is often associated with insulin resistance, sudden onset in an older patient with weight loss should suggest:",
        options: ["New-onset Diabetes", "Internal malignancy (especially Gastric Adenocarcinoma)", "Fungal infection", "Poor hygiene"],
        ans: 1,
        exp: "Malignant AN is a paraneoplastic sign."
      },
      {
        q: "What is the 'Leser-Trélat sign'?",
        options: ["A type of fracture", "The sudden appearance of multiple seborrheic keratoses, indicating an underlying malignancy", "Red eyes", "Clubbing"],
        ans: 1,
        exp: "Both AN and Leser-Trélat can be triggered by transforming growth factor alpha (TGF-a) from a tumor."
      },
      {
        q: "Which hormone is usually responsible for the 'benign' form of acanthosis nigricans in obese patients?",
        options: ["Thyroid hormone", "Insulin (binding to IGF-1 receptors on keratinocytes)", "Estrogen", "Cortisol"],
        ans: 1,
        exp: "Hyperinsulinemia triggers the growth of keratinocytes and fibroblasts."
      }
    ]
  },
  {
    title: "The Bronze Skin and the High Sugar",
    scenario: "A 50-year-old male presents with joint pain, new-onset diabetes, and skin that looks 'permanently tanned'.\n\nVitals: Normal.\nPhysical Examination: Generalized hyperpigmentation (bronze skin). Hepatomegaly. Tenderness of the 2nd and 3rd MCP joints.\nLaboratory Results: Fasting glucose 180 mg/dL. Ferritin 2,000 ng/mL. Transferrin saturation 85%.",
    disease: "Hereditary Hemochromatosis (Bronze Diabetes)",
    questions: [
      {
        q: "What is the classic triad of Hemochromatosis?",
        options: ["Cirrhosis, Diabetes, and Hyperpigmentation", "Fever, Rash, Joint pain", "Anemia, Jaundice, Splenomegaly", "None of the above"],
        ans: 0,
        exp: "This is often referred to as 'Bronze Diabetes'."
      },
      {
        q: "What is the genetic defect in the most common form of this disease?",
        options: ["CFTR mutation", "HFE gene mutation (C282Y)", "RB1 mutation", "JAK2 mutation"],
        ans: 1,
        exp: "HFE mutations lead to increased iron absorption in the gut."
      },
      {
        q: "What is the first-line treatment for symptomatic hemochromatosis?",
        options: ["Iron supplements", "Therapeutic phlebotomy", "Antibiotics", "Liver transplant"],
        ans: 1,
        exp: "Regularly removing blood reduces the total body iron stores."
      }
    ]
  },
  {
    title: "The Thickened Shin and the Fast Heart",
    scenario: "A 35-year-old female complains of anxiety, weight loss despite increased appetite, and a 'weird thickening' on her shins.\n\nVitals: HR 115 bpm (regular), BP 145/70 mmHg.\nPhysical Examination: Exophthalmos (bulging eyes). Diffuse, non-tender goiter. Non-pitting, orange-peel-like induration on the bilateral pre-tibial areas (pretibial myxedema).\nLaboratory Results: TSH < 0.01 (Low), Free T4 High. Positive TSH-receptor antibodies.",
    disease: "Graves'' Disease",
    questions: [
      {
        q: "Pretibial myxedema (thyroid dermopathy) is most specific for which condition?",
        options: ["Hypothyroidism", "Graves' Disease", "Iodine deficiency", "Thyroid cancer"],
        ans: 1,
        exp: "While 'myxedema' usually implies hypo, 'pretibial myxedema' is a hallmark of Graves' hyperthyroidism."
      },
      {
        q: "What is the mechanism of the skin thickening in this patient?",
        options: ["Fat accumulation", "Accumulation of glycosaminoglycans (mucin) in the dermis due to fibroblast stimulation", "Water retention", "Bacterial infection"],
        ans: 1,
        exp: "The same autoimmune process affecting the eyes (orbitopathy) affects the skin."
      },
      {
        q: "Which medication is used to provide symptomatic relief of the tachycardia and tremors in this patient?",
        options: ["Methimazole", "Propranolol (Beta-blocker)", "Radioactive iodine", "Levothyroxine"],
        ans: 1,
        exp: "Beta-blockers manage the adrenergic symptoms of thyrotoxicosis."
      }
    ]
  },
  {
    title: "The Tan in the Winter",
    scenario: "A 40-year-old female presents with severe fatigue, weight loss, and darkening of her skin, especially in the creases of her palms and around old scars.\n\nVitals: BP 90/60 mmHg (orthostatic).\nPhysical Examination: Diffuse hyperpigmentation. Hyperpigmented palmar creases and buccal mucosa. Sparse axillary and pubic hair.\nLaboratory Results: Na+ 130 (Low), K+ 5.5 (High). Morning cortisol is low; ACTH is high.",
    disease: "Addison''s Disease (Primary Adrenal Insufficiency)",
    questions: [
      {
        q: "Why does the skin become hyperpigmented in primary adrenal insufficiency?",
        options: ["The patient spends more time in the sun", "High ACTH levels cross-react with Melanocyte-Stimulating Hormone (MSH) receptors", "Liver failure", "Low glucose"],
        ans: 1,
        exp: "ACTH and MSH share a common precursor (POMC); high ACTH stimulates melanocytes."
      },
      {
        q: "Would you see hyperpigmentation in SECONDARY adrenal insufficiency (pituitary failure)?",
        options: ["Yes", "No, because ACTH levels would be low, not high", "Only if they have a tumor", "Only on the face"],
        ans: 1,
        exp: "Lack of ACTH in secondary insufficiency means no stimulation of pigment."
      },
      {
        q: "The electrolyte pattern (Low Na, High K) suggests a deficiency of which hormone?",
        options: ["Cortisol only", "Aldosterone", "Growth Hormone", "Insulin"],
        ans: 1,
        exp: "Aldosterone normally saves sodium and excretes potassium; its absence leads to this pattern."
      }
    ]
  },
  {
    title: "The Purple Striae",
    scenario: "A 30-year-old female presents with weight gain, a 'round face', and large purple 'stretch marks' on her belly.\n\nVitals: BP 165/105 mmHg.\nPhysical Examination: Central obesity with thin limbs. Moon facies and a 'buffalo hump'. Wide (>1 cm), violaceous striae on the abdomen. Multiple bruises with minimal trauma.\nLaboratory Results: 24-hour urinary free cortisol is high. High-dose dexamethasone suppression test fails to suppress cortisol. ACTH is low.",
    disease: "Cushing''s Syndrome (Adrenal Adenoma)",
    questions: [
      {
        q: "What is the difference between Cushing 'Syndrome' and Cushing 'Disease'?",
        options: ["They are synonyms", "Syndrome is the clinical state of high cortisol; Disease specifically refers to a pituitary ACTH-secreting tumor", "Disease is worse", "Syndrome is only from steroids"],
        ans: 1,
        exp: "This is a key nomenclature distinction in Step 2 CK."
      },
      {
        q: "The 'purple striae' in Cushing's are caused by:",
        options: ["Rapid weight gain stretching the skin", "Cortisol-induced inhibition of collagen synthesis leading to dermal thinning and visible blood vessels", "Bacterial infection", "Allergy"],
        ans: 1,
        exp: "Cortisol is catabolic to skin collagen."
      },
      {
        q: "What is the most likely source of cortisol in this patient given the low ACTH?",
        options: ["Pituitary tumor", "Exogenous steroids or an Adrenal tumor", "Small cell lung cancer", "Thyroid tumor"],
        ans: 1,
        exp: "Low ACTH indicates that the source of cortisol is independent of the pituitary (Adrenal or Exogenous)."
      }
    ]
  },
  {
    title: "The Lumpy Face and the Seizures",
    scenario: "A 12-year-old boy presents for a school physical. His mother mentions he has had 'difficulty focusing' and occasional 'staring spells'.\n\nVitals: Normal.\nPhysical Examination: Small, flesh-colored-to-pink papules in a malar distribution on the face (angiofibromas). A patch of thick, dimpled skin on the lower back (shagreen patch). Several hypopigmented, leaf-shaped macules (ash-leaf spots) on the trunk.\nLaboratory Results: Brain MRI shows subependymal nodules.",
    disease: "Tuberous Sclerosis Complex (TSC)",
    questions: [
      {
        q: "What is the name for the 'leaf-shaped' white spots in TSC?",
        options: ["Vitiligo", "Ash-leaf spots", "Shagreen patch", "Cafe-au-lait spots"],
        ans: 1,
        exp: "These are often the earliest visible sign of TSC."
      },
      {
        q: "Which cardiac tumor is most associated with infants who have TSC?",
        options: ["Myxoma", "Rhabdomyoma", "Sarcoma", "Fibroma"],
        ans: 1,
        exp: "Cardiac rhabdomyomas often regress spontaneously but are a major clue in infancy."
      },
      {
        q: "What is the classic clinical triad of Tuberous Sclerosis (Vogt triad)?",
        options: ["Seizures, Intellectual disability, and Adenoma sebaceum (Angiofibromas)", "Fever, rash, joint pain", "Cough, rash, diarrhea", "None of the above"],
        ans: 0,
        exp: "Though only 30% of patients have all three, it is a classic Step 2 description."
      }
    ]
  },
  {
    title: "The Cafe-au-Lait and the Bumps",
    scenario: "A 20-year-old male presents with multiple brown spots on his skin and soft, fleshy bumps that have been increasing in number.\n\nVitals: Normal.\nPhysical Examination: >6 light-brown, oval macules (cafe-au-lait spots). Hundreds of soft, pedunculated skin-colored papules (neurofibromas). Freckling in the armpits (axillary freckling/Lisch sign).\nLaboratory Results: Eye exam shows pigmented hamartomas on the iris (Lisch nodules).",
    disease: "Neurofibromatosis Type 1 (NF1)",
    questions: [
      {
        q: "What is the genetic inheritance pattern of NF1?",
        options: ["Autosomal Recessive", "Autosomal Dominant", "X-linked", "Mitochondrial"],
        ans: 1,
        exp: "NF1 is autosomal dominant, with about 50% of cases being de novo mutations."
      },
      {
        q: "What is 'Crowe sign' in the context of NF1?",
        options: ["Lisch nodules", "Axillary or inguinal freckling", "Neurofibromas", "Optic glioma"],
        ans: 1,
        exp: "Crowe sign refers to freckling in non-sun-exposed intertriginous areas."
      },
      {
        q: "NF1 is caused by a mutation in a gene on which chromosome?",
        options: ["13", "17", "22", "X"],
        ans: 1,
        exp: "NF1 = 17 letters/Chromosome 17. NF2 = Chromosome 22."
      }
    ]
  },
  {
    title: "The Port-Wine Stain and the Seizures",
    scenario: "An infant is born with a large, flat, purple-red patch covering the left side of his face, including the eyelid.\n\nVitals: Normal.\nPhysical Examination: Port-wine stain (nevus flammeus) in the V1/V2 distribution of the trigeminal nerve. The ophthalmology exam shows increased intraocular pressure (glaucoma) in the left eye.\nLaboratory Results: Head CT shows 'tram-track' calcifications in the left cerebral cortex.",
    disease: "Sturge-Weber Syndrome",
    questions: [
      {
        q: "What is the underlying vascular abnormality in Sturge-Weber?",
        options: ["Capillary malformation of the skin and leptomeningeal angiomatosis", "Venous thrombosis", "Arterial aneurysm", "None of the above"],
        ans: 0,
        exp: "It is a phakomatosis involving skin and brain capillaries."
      },
      {
        q: "Why is the distribution of the port-wine stain critical for the diagnosis?",
        options: ["Only stains in the V1/V2 distribution carry a significant risk of associated brain involvement", "It doesn't matter", "It must be on the legs", "It must be blue"],
        ans: 0,
        exp: "Specifically, involvement of the upper eyelid (V1 area) is the highest risk factor."
      },
      {
        q: "Which complication is common on the same side as the port-wine stain?",
        options: ["Deafness", "Glaucoma and Seizures", "Limb overgrowth", "Liver failure"],
        ans: 1,
        exp: "Ipsilateral glaucoma and contralateral seizures/hemiparesis are classic features."
      }
    ]
  },
  {
    title: "The Nosebleed and the Red Spots",
    scenario: "A 40-year-old male presents with recurrent nosebleeds (epistaxis) and several small red spots on his lips and tongue.\n\nVitals: Normal.\nPhysical Examination: Multiple 1-2 mm telangiectasias on the lips, tongue, and fingertips. He also has clubbing of the fingers.\nLaboratory Results: Hemoglobin 18 g/dL (Polycythemia). Chest X-ray shows a well-circumscribed nodule in the right lung. Pulse oximetry is 88%.",
    disease: "Hereditary Hemorrhagic Telangiectasia (Osler-Weber-Rendu)",
    questions: [
      {
        q: "What is the cause of the polycythemia and low oxygen saturation in this patient?",
        options: ["Smoking", "Pulmonary Arteriovenous Malformations (AVMs) causing right-to-left shunting", "Dehydration", "High altitude"],
        ans: 1,
        exp: "AVMs in the lung allow blood to bypass gas exchange, leading to chronic hypoxemia and secondary polycythemia."
      },
      {
        q: "HHT is an autosomal dominant disorder of which system?",
        options: ["Coagulation factors", "Vascular wall integrity and angiogenesis", "Platelet function", "Red blood cell enzymes"],
        ans: 1,
        exp: "It leads to the formation of fragile telangiectasias and AVMs."
      },
      {
        q: "Patients with HHT are at an increased risk of 'paradoxical' brain abscesses. Why?",
        options: ["Poor immune system", "Bacteria from the venous system bypass the capillary filter of the lungs through a pulmonary AVM", "The nosebleeds let bacteria in", "Direct spread from the ears"],
        ans: 1,
        exp: "The lung capillaries normally filter out small septic emboli; AVMs create a bypass to the brain."
      }
    ]
  },
  {
    title: "The Mouth Spots and the Bowel Obstruction",
    scenario: "A 15-year-old boy presents with dark spots on his lips and severe abdominal pain.\n\nVitals: Normal.\nPhysical Examination: Multiple brown macules (freckle-like) on the lips and oral mucosa. Abdomen is distended with decreased bowel sounds.\nLaboratory Results: X-ray shows multiple dilated loops of small bowel. Colonoscopy reveals numerous hamartomatous polyps.",
    disease: "Peutz-Jeghers Syndrome",
    questions: [
      {
        q: "What is the hallmark combination of Peutz-Jeghers Syndrome?",
        options: ["Mucocutaneous hyperpigmentation and GI hamartomatous polyps", "Skin cancer and polyps", "Diabetes and freckles", "Obesity and warts"],
        ans: 0,
        exp: "The lentigines on the lips and polyps in the gut define the syndrome."
      },
      {
        q: "What is the most likely cause of the acute abdominal pain in this patient?",
        options: ["Appendicitis", "Intussusception (with a polyp acting as a lead point)", "Food poisoning", "Ulcer"],
        ans: 1,
        exp: "The large hamartomatous polyps frequently trigger intussusception."
      },
      {
        q: "Peutz-Jeghers syndrome is associated with an increased risk of which cancers?",
        options: ["Colorectal, Pancreatic, Breast, and Ovarian cancers", "Only skin cancer", "Brain cancer only", "None"],
        ans: 0,
        exp: "Surveillance for multiple internal malignancies is required."
      }
    ]
  },
  {
    title: "The Bone Cysts and the Skin Spots",
    scenario: "A 10-year-old girl presents with early onset of menses (precocious puberty) and several large, irregular brown spots on her back.\n\nVitals: Normal.\nPhysical Examination: Large, 'jagged-edged' cafe-au-lait patches (Coast of Maine) that do not cross the midline. Prominent breasts (Tanner stage 3).\nLaboratory Results: X-ray of the femur shows multiple cystic lesions (polyostotic fibrous dysplasia).",
    disease: "McCune-Albright Syndrome",
    questions: [
      {
        q: "What is the classic triad of McCune-Albright Syndrome?",
        options: ["Precocious puberty, Fibrous dysplasia of bone, and Cafe-au-lait spots", "Fever, rash, joint pain", "Anemia, jaundice, bone pain", "Seizures, spots, tumors"],
        ans: 0,
        exp: "This is a sporadic disorder caused by a G-protein signaling mutation (GNAS)."
      },
      {
        q: "How do the cafe-au-lait spots of McCune-Albright differ from those of NF1?",
        options: ["NF1 are smaller", "McCune-Albright spots are larger, irregular, 'jagged' (Coast of Maine), and typically follow Blaschko lines or respect the midline; NF1 are smooth (Coast of California)", "There is no difference", "McCune-Albright spots are blue"],
        ans: 1,
        exp: "The 'Coast of Maine' vs 'Coast of California' description is a classic Step 2 CK pearl."
      },
      {
        q: "Is McCune-Albright syndrome inherited from parents?",
        options: ["Yes, Autosomal Dominant", "No, it is caused by a somatic mosaic mutation that occurs after fertilization", "Yes, Autosomal Recessive", "Only from the mother"],
        ans: 1,
        exp: "If the mutation were germline (inherited), it would be lethal."
      }
    ]
  }
];
