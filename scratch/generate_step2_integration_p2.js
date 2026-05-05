module.exports = [
  {
    title: "The Drug, the Fever, and the Eosinophils",
    scenario: "A 45-year-old male was started on Allopurinol for gout 4 weeks ago. He now presents with a high fever, a widespread rash, and swelling of his face.\n\nVitals: T 39.2 C, BP 110/70 mmHg.\nPhysical Examination: Diffuse erythematous maculopapular rash covering 80% of the body. Facial edema. Generalized lymphadenopathy. Liver is tender to palpation.\nLaboratory Results: WBC 18,000 with 15% eosinophils. ALT 450, AST 380 (Elevated). Cr 1.8 (Baseline 1.0).",
    disease: "DRESS Syndrome (Drug Reaction with Eosinophilia and Systemic Symptoms)",
    questions: [
      {
        q: "What is the characteristic latency period between starting a drug and the onset of DRESS?",
        options: ["1-3 days", "2-8 weeks", "6 months", "1 year"],
        ans: 1,
        exp: "DRESS has a much longer latency than simple morbilliform rashes or SJS."
      },
      {
        q: "Which systemic organ is MOST commonly involved in DRESS?",
        options: ["Lungs", "Liver (Hepatitis)", "Heart", "Pancreas"],
        ans: 1,
        exp: "Hepatitis is the most frequent systemic manifestation of DRESS."
      },
      {
        q: "Besides Allopurinol, which drug class is a frequent trigger for DRESS?",
        options: ["Anticonvulsants (e.g., Phenytoin, Carbamazepine)", "Antibiotics (Penicillins)", "Aspirin", "Statins"],
        ans: 0,
        exp: "Anticonvulsants and sulfonamides are common culprits."
      }
    ]
  },
  {
    title: "The Sloughed Skin and the Mucosal Pain",
    scenario: "A 30-year-old female presents with a painful rash and peeling skin 10 days after starting Sulfamethoxazole-Trimethoprim for a UTI.\n\nVitals: T 38.5 C, BP 100/60 mmHg.\nPhysical Examination: Diffuse dusky-red macules that are beginning to coalesce. Two areas of the back show large sheets of skin peeling off. Positive Nikolsky sign. Severe erosions on the lips and conjunctiva. Approximately 25% of the total body surface area (TBSA) is denuded.\nLaboratory Results: None.",
    disease: "SJS/TEN Overlap",
    questions: [
      {
        q: "How is the diagnosis categorized based on the percentage of skin detachment (TBSA)?",
        options: ["SJS < 10%; SJS/TEN Overlap 10-30%; TEN > 30%", "SJS < 30%; TEN > 30%", "SJS = only mouth; TEN = whole body", "None of the above"],
        ans: 0,
        exp: "This is the standard classification based on epidermal detachment."
      },
      {
        q: "What is the primary histological finding in SJS/TEN?",
        options: ["Acantholysis", "Full-thickness epidermal necrosis", "Subcutaneous fat inflammation", "Bacterial invasion"],
        ans: 1,
        exp: "Extensive apoptosis of keratinocytes leads to the sloughing."
      },
      {
        q: "What is the most important initial management step for this patient?",
        options: ["High-dose steroids", "IV Antibiotics", "Discontinuation of the offending drug and transfer to a burn unit for supportive care", "Surgical debridement"],
        ans: 2,
        exp: "Immediate removal of the trigger and intensive supportive care (fluid/electrolyte management) are life-saving."
      }
    ]
  },
  {
    title: "The Itch and the Yellow Eyes",
    scenario: "A 28-year-old female in her third trimester of pregnancy presents with intense itching that is worse on her palms and soles. She has no visible rash.\n\nVitals: Normal.\nPhysical Examination: Scleral icterus. Multiple excoriations on the limbs from scratching. No primary skin lesions.\nLaboratory Results: Elevated serum bile acids (45 µmol/L). Mildly elevated ALT/AST and Bilirubin.",
    disease: "Intrahepatic Cholestasis of Pregnancy (ICP)",
    questions: [
      {
        q: "What is the hallmark symptom of ICP?",
        options: ["Painful blisters", "Severe pruritus (itching) involving the palms and soles, usually in the 3rd trimester", "Cough", "Headache"],
        ans: 1,
        exp: "The 'palms and soles' distribution is a classic clue for ICP."
      },
      {
        q: "What is the main risk associated with ICP?",
        options: ["Maternal liver failure", "Fetal complications (preterm birth, meconium staining, intrauterine fetal demise)", "Maternal skin scarring", "Diabetes"],
        ans: 1,
        exp: "High bile acids are toxic to the fetus, necessitating close monitoring and often early delivery."
      },
      {
        q: "What is the first-line medication used to treat ICP and reduce bile acids?",
        options: ["Diphenhydramine", "Ursodeoxycholic acid (Ursodiol)", "Topical steroids", "Aspirin"],
        ans: 1,
        exp: "Ursodiol improves bile flow and reduces symptoms/fetal risk."
      }
    ]
  },
  {
    title: "The Red-Man and the Vancomycin",
    scenario: "A patient being treated for MRSA bacteremia develops sudden flushing, redness, and itching of the face, neck, and upper chest during an IV infusion.\n\nVitals: BP 115/75 mmHg (Stable).\nPhysical Examination: Intense erythema on the upper body. No hives (urticaria) or swelling of the lips.\nLaboratory Results: None.",
    disease: "Vancomycin Flushing Syndrome (formerly Red-Man Syndrome)",
    questions: [
      {
        q: "What is the mechanism of this reaction?",
        options: ["IgE-mediated Type I hypersensitivity", "Direct, non-immunologic release of histamine from mast cells", "Toxic epidermal necrolysis", "Bacterial lysis"],
        ans: 1,
        exp: "This is a 'pseudoallergic' reaction, not a true IgE-mediated allergy."
      },
      {
        q: "How can this reaction be prevented or managed?",
        options: ["Stop the drug forever", "Slow the rate of the vancomycin infusion and pre-treat with antihistamines", "Give high-dose steroids", "Switch to Penicillin"],
        ans: 1,
        exp: "The reaction is rate-dependent. Infusing over 60+ minutes usually prevents it."
      },
      {
        q: "If the patient also had hypotension, wheezing, and hives, what would the diagnosis be?",
        options: ["Still Red-Man syndrome", "Anaphylaxis", "SJS", "Anxiety"],
        ans: 1,
        exp: "Hypotension and wheezing indicate a systemic IgE-mediated response (Anaphylaxis)."
      }
    ]
  },
  {
    title: "The Confusion and the Petechiae",
    scenario: "A 22-year-old male is admitted after a femur fracture from a motorcycle accident. Two days later, he becomes suddenly confused and short of breath.\n\nVitals: T 38.2 C, HR 110, RR 28, O2 Sat 88%.\nPhysical Examination: Confused and agitated. Scattered petechiae on the chest and axillae. Lung exam shows bilateral crackles.\nLaboratory Results: Chest X-ray shows diffuse bilateral infiltrates.",
    disease: "Fat Embolism Syndrome",
    questions: [
      {
        q: "What is the classic triad of Fat Embolism Syndrome?",
        options: ["Hypoxemia, Neurologic abnormalities, and Petechial rash", "Fever, rash, joint pain", "Tachycardia, Hypotension, Muffled heart sounds", "None of the above"],
        ans: 0,
        exp: "The petechial rash (usually upper body) is a very specific but transient sign."
      },
      {
        q: "What is the most common trigger for this syndrome?",
        options: ["Bedrest", "Long bone fractures (e.g., femur, pelvis)", "Skin infection", "Pneumonia"],
        ans: 1,
        exp: "Fat droplets from the bone marrow enter the venous circulation."
      },
      {
        q: "How is Fat Embolism Syndrome primarily managed?",
        options: ["Heparin", "Supportive care (Oxygen, mechanical ventilation if needed)", "IV Antibiotics", "Surgical removal of the fat"],
        ans: 1,
        exp: "There is no specific 'clot-buster' for fat; treatment is purely supportive until it resolves."
      }
    ]
  },
  {
    title: "The Purple Toes and the Stent",
    scenario: "An 80-year-old male with severe atherosclerosis undergoes an urgent cardiac catheterization. Three days later, he develops painful, blue-purple toes and livedo reticularis on his legs.\n\nVitals: BP 160/95 mmHg.\nPhysical Examination: 'Blue toes' (cyanosis) with palpable pulses. Livedo reticularis (lace-like rash) on the thighs. Hollenhorst plaques seen on fundoscopy.\nLaboratory Results: Eosinophilia and Eosinophiluria. Cr 3.2 (Baseline 1.1).",
    disease: "Cholesterol Embolism Syndrome (Atheroembolism)",
    questions: [
      {
        q: "What is the typical trigger for Cholesterol Embolism?",
        options: ["Sitting too long", "Invasive vascular procedures (e.g., catheterization, surgery) or anticoagulation", "A fall", "Drinking too much water"],
        ans: 1,
        exp: "The procedure mechanically dislodges cholesterol plaques from the aorta."
      },
      {
        q: "What is the classic renal finding on biopsy for this condition?",
        options: ["RBC casts", "Biconvex, needle-shaped 'cholesterol clefts' within small arteries", "Normal kidneys", "Bacteria"],
        ans: 1,
        exp: "The cholesterol crystals dissolve during processing, leaving 'clefts'."
      },
      {
        q: "Why are the pedal pulses usually 'palpable' in these patients?",
        options: ["They aren't", "The emboli are tiny and lodge in the microvasculature (arterioles) distal to the large palpable arteries", "The patient has high blood pressure", "None of the above"],
        ans: 1,
        exp: "This distinguishes atheroembolism from a large-vessel acute arterial occlusion (where pulses would be absent)."
      }
    ]
  },
  {
    title: "The Stiff Skin and the MRI",
    scenario: "A patient with end-stage renal disease (ESRD) on dialysis underwent an MRI of the brain with gadolinium 2 weeks ago. He now presents with 'woody', painful thickening of the skin on his limbs.\n\nVitals: Normal.\nPhysical Examination: Symmetric, indurated, 'bound-down' plaques on the extremities. The face is spared. He has difficulty moving his joints due to the skin's stiffness.\nLaboratory Results: GFR 10 mL/min.",
    disease: "Nephrogenic Systemic Fibrosis (NSF)",
    questions: [
      {
        q: "NSF is strongly linked to the use of which contrast agent in patients with renal failure?",
        options: ["Iodine", "Gadolinium-based contrast", "Barium", "Air"],
        ans: 1,
        exp: "Free gadolinium ions trigger a massive fibrotic response in predisposed patients."
      },
      {
        q: "How does NSF differ from systemic sclerosis (scleroderma)?",
        options: ["NSF characteristically spares the face and does NOT have Raynaud's phenomenon", "NSF is on the face", "NSF is not painful", "They are the same"],
        ans: 0,
        exp: "The clinical distribution and lack of Raynaud's are key differences."
      },
      {
        q: "What is the best way to prevent NSF?",
        options: ["Drinking water", "Avoiding gadolinium contrast in patients with GFR < 30 mL/min", "Taking steroids", "None"],
        ans: 1,
        exp: "Prevention is critical as there is no effective treatment for advanced NSF."
      }
    ]
  },
  {
    title: "The Painful Skin and the Dialysis",
    scenario: "A 60-year-old female with ESRD presents with extremely painful, purple patches on her thighs that are beginning to turn into black, necrotic ulcers.\n\nVitals: Normal.\nPhysical Examination: Retiform (stellate) purpura and large necrotic ulcers with a firm, lumpy texture on palpation. Very tender.\nLaboratory Results: Cr 8.0. Ca 10.5, Phos 7.2 (High Ca x Phos product). PTH is markedly elevated.",
    disease: "Calciphylaxis (Calcific Uremic Arteriolopathy)",
    questions: [
      {
        q: "What is the underlying pathology of calciphylaxis?",
        options: ["Infection", "Calcification of the tunica media of small dermohypodermal arteries, leading to ischemia and necrosis", "Vasculitis", "Low calcium"],
        ans: 1,
        exp: "Vessel calcification 'chokes' the blood supply to the skin."
      },
      {
        q: "Which lab abnormality is a major risk factor for calciphylaxis?",
        options: ["Anemia", "High Calcium-Phosphate product and Secondary/Tertiary Hyperparathyroidism", "Low potassium", "High glucose"],
        ans: 1,
        exp: "Mineral bone disease in ESRD drives the calcification process."
      },
      {
        q: "What is the prognosis for patients with ulcerated calciphylaxis?",
        options: ["Excellent", "Poor (high mortality due to sepsis from infected ulcers)", "It resolves with moisturizers", "Good with surgery"],
        ans: 1,
        exp: "Calciphylaxis is a devastating condition with a 1-year mortality rate of >50%."
      }
    ]
  },
  {
    title: "The Smoker, the Weight Loss, and the Red Migrating Spots",
    scenario: "A 68-year-old male with a 50-pack-year smoking history presents with 'red cords' on his legs that seem to move from one place to another over weeks.\n\nVitals: Normal.\nPhysical Examination: Linear, tender, erythematous nodules following the course of superficial veins. The lesions resolve in one area and appear in another (migratory thrombophlebitis).\nLaboratory Results: CBC shows mild anemia. CT Abdomen shows a mass in the head of the pancreas.",
    disease: "Trousseau Syndrome (Migratory Thrombophlebitis)",
    questions: [
      {
        q: "Trousseau syndrome is a paraneoplastic manifestation of which type of cancer?",
        options: ["Skin cancer", "Visceral malignancy (especially Pancreatic Adenocarcinoma)", "Brain tumor", "Leukemia"],
        ans: 1,
        exp: "The cancer secretes procoagulants that cause recurrent superficial clots."
      },
      {
        q: "What is the name for this sign?",
        options: ["Trousseau sign of malignancy", "Homans sign", "Nikolsky sign", "Darier sign"],
        ans: 0,
        exp: "Not to be confused with the Trousseau sign of hypocalcemia (carpal spasm)."
      },
      {
        q: "What is the treatment for the underlying cause of these spots?",
        options: ["Antibiotics", "Treatment of the underlying malignancy and Low Molecular Weight Heparin (LMWH)", "Warfarin", "Aspirin"],
        ans: 1,
        exp: "LMWH is the preferred anticoagulant in cancer-associated thrombosis."
      }
    ]
  },
  {
    title: "The Itchy Patient and the High WBC",
    scenario: "A 70-year-old male presents with generalized redness and scaling of his entire skin surface (erythroderma). He also has enlarged lymph nodes and severe itching.\n\nVitals: Normal.\nPhysical Examination: 95% of the body surface is red and scaly (exfoliative dermatitis). Thickened, hyperkeratotic palms and soles (keratoderma).\nLaboratory Results: WBC 25,000. Peripheral blood smear shows 'Sezary cells' (lymphocytes with cerebriform nuclei).",
    disease: "Sezary Syndrome",
    questions: [
      {
        q: "What is Sezary Syndrome?",
        options: ["A fungal infection", "The leukemic (systemic) phase of Mycosis Fungoides (Cutaneous T-cell Lymphoma)", "A type of eczema", "A viral rash"],
        ans: 1,
        exp: "It is defined by erythroderma, lymphadenopathy, and circulating malignant T-cells."
      },
      {
        q: "What does a 'cerebriform' nucleus look like?",
        options: ["A circle", "Brain-like, with multiple folds and indentations", "A star", "A square"],
        ans: 1,
        exp: "This is a pathognomonic finding on the blood smear."
      },
      {
        q: "What is the term for a patient with >90% body surface area involvement of any skin rash?",
        options: ["Urticaria", "Erythroderma (Exfoliative dermatitis)", "Psoriasis", "Vitiligo"],
        ans: 1,
        exp: "Erythroderma is a dermatologic emergency that can lead to high-output heart failure and thermoregulatory issues."
      }
    ]
  },
  {
    title: "The Diabetic and the Necrotic Rash",
    scenario: "A 55-year-old female with a history of weight loss and mild diabetes presents with a painful, 'angry' rash on her groin and legs.\n\nVitals: Normal.\nPhysical Examination: Erythematous patches with central blistering and erosion. The border is scaly and 'migrating' (necrolytic migratory erythema). She also has a smooth, red tongue (glossitis).\nLaboratory Results: Glucagon level is 1,200 pg/mL (extremely high). CT shows a mass in the tail of the pancreas.",
    disease: "Glucagonoma Syndrome",
    questions: [
      {
        q: "What is the classic skin rash associated with Glucagonoma?",
        options: ["Acanthosis nigricans", "Necrolytic Migratory Erythema (NME)", "Pyoderma gangrenosum", "Sweet's syndrome"],
        ans: 1,
        exp: "NME is the hallmark paraneoplastic sign of this tumor."
      },
      {
        q: "What are the '4 D's' of Glucagonoma?",
        options: ["Diabetes, Dermatosis (NME), Depression, and Decline (weight loss)", "Dizziness, Diarrhea, Deafness, Death", "None of the above", "Doughy skin, Dementia, Death, Dryness"],
        ans: 0,
        exp: "This mnemonic helps remember the systemic presentation."
      },
      {
        q: "Where is the glucagonoma tumor typically located in the pancreas?",
        options: ["Head", "Body/Tail", "Duct", "Ampulla"],
        ans: 1,
        exp: "Islet cell tumors are more common in the body and tail."
      }
    ]
  },
  {
    title: "The Blue Gums and the Lead",
    scenario: "A 30-year-old construction worker presents with abdominal pain, constipation, and 'pins and needles' in his hands.\n\nVitals: Normal.\nPhysical Examination: A bluish-gray line along the margin of the gums (Burton's line). Weakness in wrist extension (wrist drop).\nLaboratory Results: Microcytic anemia. Peripheral smear shows 'basophilic stippling' of the RBCs. Elevated Lead level.",
    disease: "Lead Poisoning (Plumbism)",
    questions: [
      {
        q: "What is 'Burton's line'?",
        options: ["A scar", "A dark line on the gums caused by reaction of lead with oral bacteria", "A type of rash", "A sign of cancer"],
        ans: 1,
        exp: "It is a characteristic finding of chronic lead poisoning."
      },
      {
        q: "What is the classic hematologic finding on the blood smear for lead poisoning?",
        options: ["Target cells", "Basophilic stippling", "Howell-Jolly bodies", "Schistocytes"],
        ans: 1,
        exp: "Lead inhibits an enzyme (pyrimidine 5'-nucleotidase) leading to ribosomes clumping in the RBCs."
      },
      {
        q: "What is the first-line chelation therapy for SEVERE lead poisoning in an adult?",
        options: ["Iron", "EDTA or Succimer", "Penicillin", "Activated charcoal"],
        ans: 1,
        exp: "Chelating agents bind the lead to allow for excretion."
      }
    ]
  },
  {
    title: "The Red Urine and the Sun Blisters",
    scenario: "A 50-year-old male with Hepatitis C notices that every time he spends a day in the sun, he gets small blisters on the back of his hands that heal with scars.\n\nVitals: Normal.\nPhysical Examination: Small vesicles, bullae, and erosions on the dorsal hands. Milia (tiny white cysts) and hyperpigmentation in the same areas. Facial hair is increased (hypertrichosis).\nLaboratory Results: Elevated ALT/AST. Urine fluoresces coral-red under a Wood's lamp.",
    disease: "Porphyria Cutanea Tarda (PCT)",
    questions: [
      {
        q: "What is the enzyme deficiency in PCT?",
        options: ["Uroporphyrinogen decarboxylase (UROD)", "PPOX", "HMBS", "ALAS"],
        ans: 0,
        exp: "Deficiency of UROD leads to accumulation of uroporphyrins."
      },
      {
        q: "PCT is strongly associated with which chronic infection?",
        options: ["HIV", "Hepatitis C", "Syphilis", "Tuberculosis"],
        ans: 1,
        exp: "Alcohol and iron overload are also common triggers."
      },
      {
        q: "What is the first-line treatment for PCT to reduce iron and porphyrin levels?",
        options: ["Steroids", "Phlebotomy or low-dose Hydroxychloroquine", "Antibiotics", "Surgical skin graft"],
        ans: 1,
        exp: "Phlebotomy reduces iron, which is a cofactor for the dysfunctional enzyme."
      }
    ]
  },
  {
    title: "The Itchy Diver",
    scenario: "A 40-year-old male develops an intensely itchy, red, 'winding' rash on his foot after walking barefoot on a beach in the Caribbean.\n\nVitals: Normal.\nPhysical Examination: A serpiginous, erythematous, raised track that has moved about 2 cm since yesterday.\nLaboratory Results: None.",
    disease: "Cutaneous Larva Migrans",
    questions: [
      {
        q: "What is the most common cause of Cutaneous Larva Migrans?",
        options: ["Human hookworm", "Dog or cat hookworm (Ancylostoma braziliense)", "Tapeworm", "Pinworm"],
        ans: 1,
        exp: "The larvae cannot complete their life cycle in humans and wander aimlessly in the skin."
      },
      {
        q: "How does the larva enter the skin?",
        options: ["Ingestion", "Direct penetration through intact skin from contaminated sand or soil", "Insect bite", "Breathing in dust"],
        ans: 1,
        exp: "Walking barefoot on beaches with dog/cat feces is the classic history."
      },
      {
        q: "What is the treatment for this condition?",
        options: ["Surgery to cut out the track", "Oral Ivermectin or Albendazole", "Topical antifungals", "Antibiotics"],
        ans: 1,
        exp: "Anti-helminthics are highly effective."
      }
    ]
  },
  {
    title: "The Sudden Hair Loss and the Stress",
    scenario: "A 30-year-old female presents with dramatic hair loss. She says her hair is 'falling out in handfuls' every time she brushes it. She had a major surgery 3 months ago.\n\nVitals: Normal.\nPhysical Examination: Diffuse thinning of the scalp hair. A 'hair pull test' yields >10 hairs from multiple sites. No inflammation or bald patches.\nLaboratory Results: CBC and TSH are normal.",
    disease: "Telogen Effluvium",
    questions: [
      {
        q: "What is the pathophysiology of Telogen Effluvium?",
        options: ["Fungus eating the hair", "A physiological stressor causes a large percentage of hair follicles to shift prematurely into the resting (telogen) phase", "Autoimmune destruction", "Vitamin D toxicity"],
        ans: 1,
        exp: "The hair falls out when the new hair starts growing, usually 3-4 months after the stressor."
      },
      {
        q: "Common triggers for Telogen Effluvium include:",
        options: ["Major surgery, pregnancy/childbirth, severe illness, or extreme weight loss", "Drinking too much water", "Sunlight", "Reading too much"],
        ans: 0,
        exp: "Significant systemic stressors are the usual cause."
      },
      {
        q: "What is the prognosis?",
        options: ["Permanent baldness", "Excellent (most cases resolve spontaneously within 6-12 months once the stressor is removed)", "Requires a transplant", "Requires lifelong medication"],
        ans: 1,
        exp: "It is a temporary, self-limited process."
      }
    ]
  },
  {
    title: "The Thick Nails and the Smokers",
    scenario: "A 65-year-old male with COPD has extremely thick, yellow, curved nails and swelling in both legs.\n\nVitals: RR 22, O2 Sat 92%.\nPhysical Examination: All 20 nails are thickened, yellowish-green, and slow-growing. Non-pitting edema of the lower legs. Breath sounds are decreased with wheezing.\nLaboratory Results: Chest X-ray shows hyperinflation and a pleural effusion.",
    disease: "Yellow Nail Syndrome",
    questions: [
      {
        q: "What is the classic triad of Yellow Nail Syndrome?",
        options: ["Yellow nails, Lymphedema, and Respiratory disease (e.g., pleural effusion, bronchiectasis)", "Fever, rash, joint pain", "Diabetes, jaundice, rash", "None of the above"],
        ans: 0,
        exp: "This is a rare but high-yield multi-system syndrome."
      },
      {
        q: "What is the suspected underlying cause of the edema and nail changes?",
        options: ["Fungal infection", "Impaired lymphatic drainage", "Heart failure", "Protein deficiency"],
        ans: 1,
        exp: "Sluggish lymphatics cause the color and the fluid buildup."
      },
      {
        q: "Do the nails typically have cuticles in this condition?",
        options: ["Yes", "No, loss of the cuticle is a characteristic feature", "Only on the feet", "Only in women"],
        ans: 1,
        exp: "The cuticle is often absent."
      }
    ]
  },
  {
    title: "The Itchy Feet and the Hepatitis",
    scenario: "A 50-year-old male with chronic Hepatitis C develops very itchy, flat, purple bumps on his shins and white lacy lines in his mouth.\n\nVitals: Normal.\nPhysical Examination: Purple, polygonal, planar papules (6 P's) on the shins. Wickham striae on the buccal mucosa.\nLaboratory Results: Elevated Liver Function Tests (LFTs). Positive Hepatitis C RNA.",
    disease: "Lichen Planus (Hep C Association)",
    questions: [
      {
        q: "Lichen Planus is famously associated with which viral infection?",
        options: ["HIV", "Hepatitis C", "Herpes", "HPV"],
        ans: 1,
        exp: "While not all LP patients have Hep C, the association is significant enough to warrant screening in widespread cases."
      },
      {
        q: "Which 'P' is NOT part of the classic Lichen Planus mnemonic?",
        options: ["Purple", "Polygonal", "Painless", "Pruritic (Itchy)"],
        ans: 2,
        exp: "The papules are intensely itchy (pruritic), not painless."
      },
      {
        q: "What is the histological hallmark of Lichen Planus?",
        options: ["Pus", "Saw-tooth pattern of epidermal hyperplasia and interface dermatitis", "Bacteria", "Cancer cells"],
        ans: 1,
        exp: "The inflammation 'nibbles' at the base of the epidermis."
      }
    ]
  },
  {
    title: "The Red Eyes, the Joint Pain, and the Rash",
    scenario: "A 25-year-old male presents with painful urination, red eyes, and a scaly rash on the soles of his feet. He had a stomach flu 3 weeks ago.\n\nVitals: T 37.8 C.\nPhysical Examination: Conjunctivitis. Asymmetric arthritis of the right knee. Scaly, yellowish plaques on the soles (keratoderma blennorrhagicum). Small, painless ulcers on the glans penis (circinate balanitis).\nLaboratory Results: Positive HLA-B27.",
    disease: "Reactive Arthritis (formerly Reiter''s Syndrome)",
    questions: [
      {
        q: "What is the classic 'can't see, can't pee, can't climb a tree' triad?",
        options: ["Uveitis/Conjunctivitis, Urethritis, and Arthritis", "Fever, Rash, Diarrhea", "Headache, Stiff neck, Vomiting", "None of the above"],
        ans: 0,
        exp: "This refers to the three systems involved in reactive arthritis."
      },
      {
        q: "What is the name for the scaly rash on the palms and soles in this condition?",
        options: ["Psoriasis", "Keratoderma blennorrhagicum", "Syphilis", "Eczema"],
        ans: 1,
        exp: "It looks very similar to pustular psoriasis."
      },
      {
        q: "Which antecedent infections are most commonly linked to reactive arthritis?",
        options: ["Chlamydia or Enteric infections (Salmonella, Shigella, Campylobacter)", "Common cold", "Strep throat", "Fungal infection"],
        ans: 0,
        exp: "It is an autoimmune reaction following a distant infection."
      }
    ]
  },
  {
    title: "The Flushed Face and the Diarrhea",
    scenario: "A 60-year-old female presents with sudden episodes of facial flushing, wheezing, and watery diarrhea.\n\nVitals: BP 100/60 mmHg, HR 105.\nPhysical Examination: Diffuse erythema of the face and neck during an episode. A soft systolic murmur of tricuspid regurgitation is heard.\nLaboratory Results: Elevated 24-hour urinary 5-HIAA. CT scan shows a mass in the liver and small bowel.",
    disease: "Carcinoid Syndrome",
    questions: [
      {
        q: "Carcinoid syndrome usually only occurs once the tumor has metastasized to which organ?",
        options: ["Brain", "Liver (so that the serotonin bypasses the first-pass metabolism)", "Lungs", "Bones"],
        ans: 1,
        exp: "If the tumor is in the gut, the liver usually inactivates the hormones before they reach the general circulation."
      },
      {
        q: "What is the primary hormone responsible for the symptoms of Carcinoid syndrome?",
        options: ["Insulin", "Serotonin", "Cortisol", "Thyroid hormone"],
        ans: 1,
        exp: "Serotonin causes the diarrhea, flushing, and fibrosis of heart valves."
      },
      {
        q: "Which vitamin deficiency can occur in Carcinoid syndrome due to the depletion of Tryptophan?",
        options: ["Vitamin B12", "Niacin (B3) - leading to Pellagra", "Vitamin C", "Vitamin D"],
        ans: 1,
        exp: "Tryptophan is used up to make Serotonin instead of Niacin."
      }
    ]
  },
  {
    title: "The Three D''s of Pellagra",
    scenario: "A chronic alcoholic presents with a scaly, red rash on his face and hands that looks like a severe sunburn. He also seems confused and has diarrhea.\n\nVitals: Normal.\nPhysical Examination: Symmetric, hyperpigmented, scaly rash on the face, neck ('Casal necklace'), and dorsal hands. He is oriented only to person.\nLaboratory Results: Mild anemia.",
    disease: "Pellagra (Niacin Deficiency)",
    questions: [
      {
        q: "What are the 'Three D's' of Pellagra?",
        options: ["Dementia, Diarrhea, and Dermatitis", "Deafness, Dizziness, Death", "Dryness, Dullness, Darkness", "None of the above"],
        ans: 0,
        exp: "The fourth 'D' is Death if left untreated."
      },
      {
        q: "What is the 'Casal necklace'?",
        options: ["A piece of jewelry", "A characteristic dermatitis around the neck in Niacin deficiency", "A surgical scar", "None of the above"],
        ans: 1,
        exp: "It is one of the classic signs of Pellagra."
      },
      {
        q: "Pellagra can occur in patients with Hartnup disease due to the inability to absorb which amino acid?",
        options: ["Leucine", "Tryptophan (the precursor to Niacin)", "Lysine", "Valine"],
        ans: 1,
        exp: "Tryptophan is required for endogenous niacin synthesis."
      }
    ]
  },
  {
    title: "The Mouth Sores and the Genital Sores",
    scenario: "A 25-year-old male of Turkish descent has had recurrent mouth ulcers for years. He now has a painful sore on his scrotum and red, blurry vision.\n\nVitals: Normal.\nPhysical Examination: Painful oral ulcers and a deep genital ulcer. Inflammation of the eye (uveitis). A pustule forms at the site of a recent blood draw.\nLaboratory Results: Positive Pathergy test.",
    disease: "Behcet''s Disease",
    questions: [
      {
        q: "What is the name for the skin test where a small needle prick causes a pustule?",
        options: ["Nikolsky test", "Pathergy test", "Patch test", "Prick test"],
        ans: 1,
        exp: "Pathergy is a hallmark of Behcet's and reflects neutrophilic hyperactivity."
      },
      {
        q: "Which systemic complication is the leading cause of death in Behcet's?",
        options: ["Mouth ulcers", "Vascular involvement (e.g., aneurysms, pulmonary artery aneurysm rupture)", "Blindness", "Skin rash"],
        ans: 1,
        exp: "Behcet's is a vasculitis that can affect vessels of all sizes."
      },
      {
        q: "Is there a specific lab test to diagnose Behcet's?",
        options: ["Yes, the Behcet antibody", "No, it is a clinical diagnosis based on the pattern of involvement", "ANA", "Blood culture"],
        ans: 1,
        exp: "Diagnosis is based on clinical criteria (Recurrent oral ulcers + 2 others: Genital ulcers, eye lesions, skin lesions, or + pathergy)."
      }
    ]
  },
  {
    title: "The Swollen Face and the Drug",
    scenario: "A 60-year-old male starts taking Lisinopril for hypertension. Two hours later, his lips and tongue begin to swell rapidly. He has no rash or itching.\n\nVitals: BP 140/90, HR 85, RR 20.\nPhysical Examination: Marked edema of the lips, tongue, and eyelids. No urticaria (hives). Lungs are clear.\nLaboratory Results: None.",
    disease: "ACE Inhibitor-induced Angioedema",
    questions: [
      {
        q: "What is the mediator of ACE inhibitor-induced angioedema?",
        options: ["Histamine", "Bradykinin", "Leukotrienes", "Serotonin"],
        ans: 1,
        exp: "ACE normally breaks down bradykinin; inhibitors lead to its accumulation, causing vasodilation and edema."
      },
      {
        q: "Why are there no hives (urticaria) in this reaction?",
        options: ["The patient is too old", "It is not a histamine-mediated (Type I) allergic reaction", "Hives are only on the legs", "None of the above"],
        ans: 1,
        exp: "Bradykinin-mediated angioedema is characteristically non-pruritic and lacks urticaria."
      },
      {
        q: "If the patient develops airway obstruction, what is the first priority?",
        options: ["Epinephrine", "Airway management (Intubation or Cricothyrotomy if necessary)", "Steroids", "Benadryl"],
        ans: 1,
        exp: "While Epinephrine is used for anaphylaxis, bradykinin-mediated edema may not respond to it, and the airway must be secured."
      }
    ]
  },
  {
    title: "The Fever, the Joint Pain, and the Evanescent Rash",
    scenario: "A 24-year-old female presents with daily spiking fevers for 2 weeks, severe joint pain, and a salmon-pink rash that comes and goes with the fever.\n\nVitals: T 39.5 C.\nPhysical Examination: Salmon-pink maculopapular rash on the trunk. Swelling and tenderness of the wrists and knees. Enlarged spleen and lymph nodes.\nLaboratory Results: WBC 20,000 (Neutrophilia). Ferritin 5,000 ng/mL (extremely high). ANA and RF are negative.",
    disease: "Adult-Onset Still''s Disease (AOSD)",
    questions: [
      {
        q: "What is the character of the rash in Still's disease?",
        options: ["Permanent purple patches", "Evanescent (fleeting), salmon-pink macules that typically appear during febrile spikes", "Itchy blisters", "Warts"],
        ans: 1,
        exp: "The 'evanescent' nature is a key clinical differentiator."
      },
      {
        q: "Which laboratory marker is characteristically extremely elevated in AOSD?",
        options: ["Glucose", "Ferritin", "Cholesterol", "Bilirubin"],
        ans: 1,
        exp: "Hyperferritinemia is a major clue for AOSD."
      },
      {
        q: "Is AOSD considered an autoimmune or an autoinflammatory disease?",
        options: ["Autoimmune", "Autoinflammatory (involving the innate immune system)", "Allergy", "Infection"],
        ans: 1,
        exp: "It is often managed with IL-1 inhibitors, reflecting its autoinflammatory nature."
      }
    ]
  },
  {
    title: "The Red Eyes and the Joint Pain (Traps)",
    scenario: "A patient presents with a 'strawberry tongue', red eyes, and a peeling rash. He is 25 years old.\n\nVitals: T 38.5 C.\nPhysical Examination: Conjunctivitis, cracked red lips, and a rash on his hands that is starting to peel.\nLaboratory Results: RPR positive (1:32).",
    disease: "Secondary Syphilis (Kawasaki Mimic)",
    questions: [
      {
        q: "While the symptoms look like Kawasaki disease, why is that diagnosis unlikely in a 25-year-old?",
        options: ["Adults don't get Kawasaki", "Kawasaki is almost exclusively a disease of early childhood (90% are < 5 years old)", "Adults don't get fevers", "None of the above"],
        ans: 1,
        exp: "In an adult, systemic symptoms with hand peeling and mucosal changes should prompt a check for Syphilis or TSS."
      },
      {
        q: "This case highlights that which infection is 'The Great Mimicker'?",
        options: ["Flu", "Syphilis", "Fungus", "HIV"],
        ans: 1,
        exp: "Syphilis can present with almost any dermatologic pattern."
      },
      {
        q: "What is the name for the reaction of fever and worsening rash that can occur after the first dose of Penicillin for syphilis?",
        options: ["Anaphylaxis", "Jarisch-Herxheimer reaction", "SJS", "Drug rash"],
        ans: 1,
        exp: "This is caused by the release of endotoxin-like substances from dying spirochetes."
      }
    ]
  },
  {
    title: "The Sudden Itch and the Pancreas",
    scenario: "A 75-year-old smoker presents with sudden onset of jaundice and intense, generalized itching. He has lost 20 lbs.\n\nVitals: Normal.\nPhysical Examination: Scleral icterus and generalized jaundice. Palpable, non-tender gallbladder (Courvoisier sign). Multiple scratch marks on the skin.\nLaboratory Results: Bilirubin 12.0 (High), Alkaline Phosphatase 600 (High).",
    disease: "Pancreatic Cancer (Head)",
    questions: [
      {
        q: "What is the cause of the intense itching in this patient?",
        options: ["Dry skin", "Accumulation of bile salts in the skin due to obstructive jaundice", "Allergy to the cancer", "Lice"],
        ans: 1,
        exp: "Obstructive jaundice from the tumor blocking the common bile duct leads to pruritus."
      },
      {
        q: "What is the 'Courvoisier sign'?",
        options: ["A type of rash", "A palpable, non-tender, enlarged gallbladder in the presence of jaundice, suggesting malignancy", "Red eyes", "A heart murmur"],
        ans: 1,
        exp: "This distinguishes malignant obstruction from gallstone obstruction (where the gallbladder is usually scarred and not palpable)."
      },
      {
        q: "Which marker is most commonly used for monitoring (not diagnosis) of pancreatic cancer?",
        options: ["CEA", "CA 19-9", "AFP", "PSA"],
        ans: 1,
        exp: "CA 19-9 is the classic pancreatic cancer marker."
      }
    ]
  }
];
