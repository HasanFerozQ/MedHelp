import json
import random

topic_slug = 'derm-drug-reactions'

templates = [
    # ─── SJS, TEN, & OVERLAP ───
    {
        "q": "A {age}-old {gender} is brought to the emergency department with a painful rash, high fever, and severe eye soreness that began 2 weeks after starting Allopurinol. Physical exam reveals confluent, atypical targetoid macules with flaccid blisters and sloughing covering approximately 8% of the total body surface area (BSA). Two mucosal sites are severely involved. Skin biopsy shows full-thickness epidermal necrosis with minimal dermal inflammation. What is the diagnosis?",
        "options": [
            "Stevens-Johnson Syndrome (SJS)",
            "Toxic Epidermal Necrolysis (TEN)",
            "SJS/TEN Overlap Syndrome",
            "Acute Generalized Exanthematous Pustulosis (AGEP)",
            "Erythema Multiforme Major"
        ],
        "answer": 0,
        "exp": "This patient has Stevens-Johnson Syndrome (SJS), defined by fever, mucosal involvement of $\\ge 2$ sites, targetoid macules, and epidermal detachment affecting <10% of the body surface area (BSA). Biopsy characteristically shows full-thickness epidermal necrosis (apoptosis of keratinocytes) driven by cytotoxic T-cells and granulysin."
    },
    {
        "q": "A {age}-old {gender} on Phenytoin for seizures presents with fever and widespread skin tenderness. Within 24 hours, the skin begins to peel off in large sheets. Physical examination shows dusky erythema progressing to confluent blisters. Gentle lateral pressure on the erythematous skin causes the epidermis to slide off the dermis (positive Nikolsky sign). The epidermal detachment is estimated at 35% of the total body surface area. What is the primary cause of mortality in this condition?",
        "options": [
            "Infection, sepsis, and multi-organ failure",
            "Acute kidney injury from severe myoglobinuria",
            "High-output cardiac failure and hypothermia",
            "Pulmonary embolism from deep vein thrombosis",
            "Hepatocellular failure and acute encephalopathy"
        ],
        "answer": 0,
        "exp": "This patient has Toxic Epidermal Necrolysis (TEN), characterized by epidermal detachment of >30% BSA and a positive Nikolsky sign. The loss of the skin barrier leads to massive fluid shifts, hypothermia, and high-output heart failure, but the leading cause of death in these patients is infection (sepsis) and subsequent multi-organ failure."
    },
    {
        "q": "A {age}-old {gender} presents with a painful, blistering rash and fever. They recently started Sulfasalazine for inflammatory bowel disease. Physical examination reveals atypical targetoid plaques on the trunk and extremities, with flaccid bullae that slide off under lateral pressure. The surface area of epidermal detachment is measured at exactly 18% of the total BSA. What is the clinical category of this patient's drug reaction?",
        "options": [
            "SJS/TEN Overlap Syndrome",
            "Stevens-Johnson Syndrome (SJS)",
            "Toxic Epidermal Necrolysis (TEN)",
            "Erythema Multiforme Major",
            "DRESS syndrome"
        ],
        "answer": 0,
        "exp": "The SJS/TEN spectrum is categorized by the percentage of body surface area showing epidermal detachment: SJS involves <10% BSA detachment; SJS/TEN Overlap involves 10% to 30% BSA detachment; and TEN involves >30% BSA detachment. At 18% detachment, this patient falls into the SJS/TEN Overlap category."
    },
    {
        "q": "A {age}-old {gender} of East Asian descent is about to start Carbamazepine for neuropathic pain. The clinician orders genetic screening for the HLA-B*1502 allele before prescribing. What is the clinical significance of this allele?",
        "options": [
            "It carries an extremely high risk of Carbamazepine-induced SJS and TEN in Asian populations",
            "It is associated with rapid metabolic clearance of Carbamazepine, making it ineffective",
            "It indicates an increased risk of severe, irreversible agranulocytosis",
            "It correlates with an increased risk of drug-induced gingival hyperplasia",
            "It is a marker for drug-induced phototoxicity and exaggerated sunburns"
        ],
        "answer": 0,
        "exp": "The HLA-B*1502 allele is strongly associated with an increased risk of developing Carbamazepine-induced SJS and TEN in individuals of East Asian and South-East Asian descent. Screening is mandatory or highly recommended prior to starting Carbamazepine in these high-risk populations."
    },
    {
        "q": "A {age}-old {gender} with Han Chinese ancestry is diagnosed with gout and is about to start Allopurinol therapy. Which HLA allele is strongly associated with Allopurinol-induced Stevens-Johnson Syndrome (SJS) and Toxic Epidermal Necrolysis (TEN) in this population?",
        "options": [
            "HLA-B*5801",
            "HLA-B*1502",
            "HLA-B*5701",
            "HLA-B*2705",
            "HLA-DRB1*0401"
        ],
        "answer": 0,
        "exp": "The HLA-B*5801 allele is a potent genetic risk factor for Allopurinol-induced severe cutaneous adverse reactions, including SJS and TEN, particularly in Han Chinese, Thai, and Korean populations. HLA-B*1502 is associated with carbamazepine, and HLA-B*5701 is linked to abacavir hypersensitivity."
    },
    {
        "q": "A {age}-old {gender} with Toxic Epidermal Necrolysis (TEN) involving 45% BSA is admitted to the hospital. Which of the following clinical settings is the most appropriate for the management of this patient?",
        "options": [
            "A specialized Burn Unit or Intensive Care Unit (ICU)",
            "A standard dermatology inpatient ward",
            "A clean private room in a general medical ward",
            "An outpatient clinic with daily nurse home visits",
            "An infectious disease isolation room"
        ],
        "answer": 0,
        "exp": "TEN is a life-threatening dermatologic emergency. Due to extensive skin loss, patients require meticulous sterile wound care, specialized non-adherent dressings, tight fluid resuscitation, and temperature regulation identical to severe burn victims. Management in a specialized Burn Unit or intensive care setting significantly reduces mortality."
    },

    # ─── DRESS SYNDROME ───
    {
        "q": "A {age}-old {gender} began taking Carbamazepine 4 weeks ago. They now present with a high fever (39.0 C), a widespread red skin eruption, and severe facial and periorbital swelling. Physical exam reveals confluent morbilliform plaques on the trunk, palpable lymphadenopathy in the neck and axillae, and moderate tender hepatomegaly. Lab work shows a WBC of 16,500/mm3 with 18% eosinophils (absolute eosinophil count 2,970/mm3) and AST/ALT elevated at 4 times the upper limit of normal. What is the diagnosis?",
        "options": [
            "Drug Reaction with Eosinophilia and Systemic Symptoms (DRESS) syndrome",
            "Stevens-Johnson Syndrome (SJS)",
            "Acute Generalized Exanthematous Pustulosis (AGEP)",
            "Exanthematous (Morbilliform) Drug Eruption",
            "Serum Sickness"
        ],
        "answer": 0,
        "exp": "DRESS syndrome (also known as Drug-Induced Hypersensitivity Syndrome) is a severe, life-threatening drug reaction characterized by a long latency period (2-8 weeks), high fever, a diffuse erythematous eruption, facial/periorbital edema, lymphadenopathy, hematologic abnormalities (eosinophilia, atypical lymphocytosis), and visceral organ involvement—most commonly hepatitis."
    },
    {
        "q": "A patient is diagnosed with DRESS syndrome after starting Phenytoin 6 weeks ago. Aside from stopping the offending drug, what virus reactivation is frequently associated with the pathogenesis and flare-ups of this systemic drug hypersensitivity?",
        "options": [
            "Human Herpesvirus 6 (HHV-6)",
            "Human Immunodeficiency Virus (HIV)",
            "Hepatitis C Virus (HCV)",
            "Epstein-Barr Virus (EBV)",
            "Human Papillomavirus Type 16 (HPV-16)"
        ],
        "answer": 0,
        "exp": "DRESS syndrome is strongly associated with the sequential reactivation of latent herpesviruses, most notably Human Herpesvirus 6 (HHV-6), as well as HHV-7, EBV, and CMV. This viral reactivation is thought to drive the prolonged, recurrent course of the disease even after the causative drug has been completely cleared."
    },

    # ─── AGEP ───
    {
        "q": "A {age}-old {gender} is started on Cephalexin for a suspected soft tissue infection. Forty-eight hours later, they develop a high fever (39.2 C) and a burning rash that started in the groin and axillae. Physical exam reveals diffuse, bright erythema studded with hundreds of non-follicular, sterile, pinpoint pustules. Lab work shows a marked leukocytosis with neutrophilia (WBC 19,000/mm3). Pustule cultures are sterile. What is the diagnosis?",
        "options": [
            "Acute Generalized Exanthematous Pustulosis (AGEP)",
            "Generalized Pustular Psoriasis (Von Zumbusch)",
            "DRESS syndrome",
            "Subcorneal Pustular Dermatosis",
            "Disseminated candidiasis"
        ],
        "answer": 0,
        "exp": "AGEP is a rare, severe cutaneous reaction characterized by the rapid onset (typically <48 hours after drug exposure) of high fever and hundreds of small, sterile, non-follicular pustules arising on a background of edematous erythema, classically starting in flexural folds (groin/axillae). Beta-lactams and macrolides are the most common triggers. Leukocytosis with marked neutrophilia is characteristic."
    },

    # ─── FIXED DRUG ERUPTION (FDE) ───
    {
        "q": "A {age}-old {gender} presents with a dark, round spot on their left forearm. They note that every time they take Trimethoprim-Sulfamethoxazole for a urinary tract infection, the exact same spot becomes red, swollen, and itchy, occasionally forming a small central blister. Once it heals, a persistent dusky brown patch remains. What is the mechanism of this 'fixing' to the same anatomic site?",
        "options": [
            "Persistence of resident memory CD8+ T-cells in the affected epidermis",
            "Localized accumulation of IgE molecules on dermal mast cells",
            "Slow lymphatic clearance of the drug from that specific site",
            "Localized somatic mutation in the keratinocytes of that area",
            "Deposition of circulating IgG immune complexes in the local capillary bed"
        ],
        "answer": 0,
        "exp": "Fixed Drug Eruption (FDE) is characterized by recurrent erythematous plaques that appear in the exact same localized site (skin or mucosa) upon re-exposure to the offending drug. This site-specific memory is mediated by resident memory CD8+ T-cells that remain quiescent in the basal epidermis of the affected plaque and rapidly degranulate upon systemic re-exposure to the drug."
    },
    {
        "q": "A {age}-old {gender} presents with a single, highly circumscribed, dusky-red, itchy patch on their glans penis that developed 24 hours after taking a medication. Which of the following drugs is the most common trigger for a fixed drug eruption (FDE) affecting the genitalia?",
        "options": [
            "Trimethoprim-Sulfamethoxazole (Sulfonamides)",
            "Aspirin",
            "Metformin",
            "Atorvastatin",
            "Amlodipine"
        ],
        "answer": 0,
        "exp": "While FDE can be triggered by many drugs (including NSAIDs and tetracyclines), sulfonamides—most notably Trimethoprim-Sulfamethoxazole—are the most common triggers for fixed drug eruptions located on the genitalia (glans penis or labia)."
    },

    # ─── WARFARIN & HEPARIN NECROSIS ───
    {
        "q": "A 55-year-old {gender} is started on Warfarin for a new deep vein thrombosis. Due to an oversight, no Heparin bridge is administered. On day 3 of therapy, the patient develops severe pain and dark purple, well-demarcated patches on their breasts and thighs. Within 24 hours, these lesions progress to necrotic black eschars. What is the primary molecular cause of this reaction?",
        "options": [
            "A rapid drop in Protein C levels (due to its short half-life), causing a transient hypercoagulable state and microthrombosis",
            "Direct toxic necrosis of adipocytes caused by accumulation of the warfarin molecule",
            "An IgE-mediated anaphylactoid reaction causing localized vasculitis",
            "A drop in antithrombin III levels leading to arterial spasm",
            "Localized vasoconstriction from paradoxical alpha-adrenergic stimulation"
        ],
        "answer": 0,
        "exp": "Warfarin-induced skin necrosis occurs early in therapy (typically days 3-5) when warfarin is initiated without a heparin bridge, especially in patients with hereditary Protein C or S deficiency. Protein C has a very short half-life (approx 8 hours) and falls rapidly, while procoagulant factors II, IX, and X fall slowly. This creates a transient, severe hypercoagulable state leading to microthrombosis in the capillaries supplying fat-rich areas (breasts, thighs, buttocks)."
    },
    {
        "q": "A patient on subcutaneous Unfractionated Heparin therapy for a pulmonary embolism develops painful, red-to-purple patches at their abdominal injection sites 7 days into therapy, which quickly progress to localized skin necrosis. Lab work reveals a platelet count that has dropped from 280,000/mm3 to 90,000/mm3. What is the target of the autoantibodies driving this clinical presentation?",
        "options": [
            "Platelet Factor 4 (PF4)-Heparin complexes",
            "Protein C and Protein S",
            "Desmoglein 1 and Desmoglein 3 in the epidermis",
            "The G-protein coupled thrombin receptor",
            "Type XVII Collagen (BP180) in the basement membrane"
        ],
        "answer": 0,
        "exp": "This patient has Heparin-Induced Thrombocytopenia (HIT) presenting with localized heparin-induced skin necrosis at the injection sites. HIT is mediated by IgG autoantibodies targeting Platelet Factor 4 (PF4)-Heparin complexes, which bind and activate platelets, causing both thrombocytopenia (clearance of platelets) and a severe, life-threatening prothrombotic state."
    },
    {
        "q": "A patient develops heparin-induced skin necrosis and thrombocytopenia (HIT). Which of the following is the most critical and immediate next step in management?",
        "options": [
            "Discontinue all heparin products immediately and initiate a non-heparin anticoagulant (e.g., Argatroban)",
            "Increase the heparin dose to overcome the antibody-mediated clearance",
            "Transfuse 2 units of platelets and continue subcutaneous heparin",
            "Stop heparin, administer Vitamin K, and start oral warfarin immediately",
            "Apply high-potency topical steroids to the necrotic injection sites"
        ],
        "answer": 0,
        "exp": "When HIT is suspected or confirmed (due to a platelet drop >50% and/or skin necrosis), the immediate action must be to stop all heparin products (including low-molecular-weight heparin and heparin flushes) and start an alternative, non-heparin rapid anticoagulant (e.g., a direct thrombin inhibitor like Argatroban or Bivalirudin) to prevent catastrophic thromboembolism. Warfarin is contraindicated in active HIT as it can precipitate gangrene."
    },

    # ─── DRUG-INDUCED LUPUS (DILE) ───
    {
        "q": "A {age}-old {gender} being treated with Hydralazine for severe hypertension presents with joint pain, fever, and a mild malar-like rash on their face. Lab results show a positive ANA (1:640) and highly elevated Anti-Histone antibodies. Anti-dsDNA and Anti-Smith antibodies are negative. Urinalysis and serum creatinine are normal. What is the clinical significance of anti-histone antibodies in this patient?",
        "options": [
            "They are highly sensitive (approx 95%) for drug-induced lupus erythematosus (DILE)",
            "They are highly specific for idiopathic systemic lupus erythematosus (SLE)",
            "They indicate severe, silent lupus nephritis requiring renal biopsy",
            "They represent a high risk of transition to Toxic Epidermal Necrolysis",
            "They are caused by a cross-reaction with the hydralazine molecule itself"
        ],
        "answer": 0,
        "exp": "Anti-histone antibodies are highly sensitive (present in 90-95% of cases) for Drug-Induced Lupus Erythematosus (DILE). Common triggers include Hydralazine, Procainamide, and Isoniazid. Unlike idiopathic SLE, DILE rarely involves the kidneys or central nervous system, and anti-dsDNA or anti-Smith antibodies are usually absent."
    },

    # ─── DRUG-INDUCED BULLOUS DISEASES ───
    {
        "q": "A {age}-old {gender} being treated with D-Penicillamine for Wilson's disease develops flaccid blisters on their chest and upper back, along with painful sores in their mouth. Physical exam shows a positive Nikolsky sign. A skin biopsy reveals intraepidermal acantholysis. Direct Immunofluorescence (DIF) demonstrates intercellular IgG deposition in a 'fishnet' pattern throughout the epidermis. What is the target of the autoantibodies in this drug-induced condition?",
        "options": [
            "Desmogleins (Dsg1 and Dsg3)",
            "BP180 (Type XVII Collagen) and BP230",
            "Type VII Collagen in the anchoring fibrils",
            "Laminin-332 in the lamina lucida",
            "Integrin alpha-6 beta-4 in the hemidesmosomes"
        ],
        "answer": 0,
        "exp": "This patient has Drug-Induced Pemphigus, characteristically triggered by thiol (sulfhydryl) group-containing drugs like D-Penicillamine, Captopril, and Gold salts. Thiol groups can biochemically disrupt desmosomes or act as haptens. The autoantibodies target desmoglein 1 and/or 3, leading to flaccid blisters, mucosal lesions, acantholysis, and a 'fishnet' DIF pattern."
    },
    {
        "q": "An 82-year-old {gender} on Linagliptin (a DPP-4 inhibitor) for type 2 diabetes presents with an intensely pruritic rash and several large, firm, tense blisters on their abdomen and lower extremities. Nikolsky sign is negative. A biopsy shows a subepidermal split with numerous eosinophils. DIF demonstrates a linear band of IgG and C3 deposition along the basement membrane zone. What is the diagnosis?",
        "options": [
            "Drug-induced Bullous Pemphigoid",
            "Drug-induced Pemphigus Vulgaris",
            "Linear IgA Bullous Dermatosis",
            "Epidermolysis Bullosa Acquisita",
            "Pseudoporphyria"
        ],
        "answer": 0,
        "exp": "This patient has Drug-induced Bullous Pemphigoid (BP), characteristically presenting with tense subepidermal blisters and severe pruritus. In recent years, Dipeptidyl peptidase-4 (DPP-4) inhibitors (gliptins) have been recognized as a major drug trigger for BP, particularly in elderly patients. Loop diuretics (furosemide) are another classic trigger."
    },

    # ─── LICHENOID DRUG ERUPTION ───
    {
        "q": "A {age}-old {gender} being treated with a Beta-blocker for hypertension presents with an extremely itchy rash on their forearms and shins. Physical examination reveals symmetric, flat-topped, polygonal, purple papules. Fine white lines (Wickham striae) are visible on the surface under magnification. How does this drug-induced lichenoid eruption typically differ from classic, idiopathic Lichen Planus?",
        "options": [
            "It is often more generalized, symmetric, and frequently lacks mucosal involvement or classic Wickham striae",
            "It is completely non-pruritic and does not show interface dermatitis on biopsy",
            "It selectively targets the face and spares the extremities",
            "It presents with large, flaccid blisters and a positive Nikolsky sign",
            "It is highly infectious and spreads to close contacts"
        ],
        "answer": 0,
        "exp": "Lichenoid drug eruptions (triggered by beta-blockers, ACE inhibitors, thiazides, and gold) clinically mimic Lichen Planus. However, they typically differ by being more generalized, symmetric, and having a eczematous or psoriasiform appearance, while frequently sparing the oral mucosa and showing a slower resolution after drug withdrawal."
    },

    # ─── STEROID ACNE ───
    {
        "q": "A {age}-old {gender} presents with an explosive onset of acne-like bumps on their chest and upper back. They deny having any acne as a teenager. Physical exam reveals dozens of monomorphic (all at the same stage of development) erythematous inflammatory papules and pustules. No blackheads or whiteheads (comedones) are present. The patient was recently treated with a high-dose oral prednisone taper. What is the diagnosis?",
        "options": [
            "Steroid-induced acne (acneiform eruption)",
            "Acne vulgaris (papulopustular subtype)",
            "Pityrosporum folliculitis",
            "Papulopustular rosacea",
            "Hot tub folliculitis"
        ],
        "answer": 0,
        "exp": "Steroid acne is an acneiform drug eruption caused by systemic or high-potency topical corticosteroids. Clinically, it is characterized by a sudden, monomorphic crop of erythematous papules and pustules on the trunk and shoulders. Unlike acne vulgaris, steroid acne lacks comedones (blackheads/whiteheads) and the lesions are all at the identical stage of development."
    },

    # ─── RED MAN SYNDROME ───
    {
        "q": "A patient receiving a rapid intravenous infusion of Vancomycin suddenly develops severe flushing, pruritus, and a bright red rash over their face, neck, and upper torso. Their heart rate is 115/min and blood pressure is 98/60 mmHg. There is no wheezing, lip swelling, or hives. What is the primary mechanism of this reaction?",
        "options": [
            "Direct, non-immunologic histamine release from mast cells triggered by the rapid drug infusion",
            "IgE-mediated Type I hypersensitivity reaction causing systemic anaphylaxis",
            "Type III hypersensitivity with deposition of IgA immune complexes in dermal vessels",
            "Direct toxic effect of the vancomycin molecule on vascular smooth muscle",
            "T-cell mediated cytotoxic destruction of endothelial cells"
        ],
        "answer": 0,
        "exp": "This is Red Man Syndrome, a pseudo-allergic (anaphylactoid) reaction caused by a rapid infusion of intravenous Vancomycin. The drug directly degranulates mast cells and basophils in a non-immunologic fashion, releasing histamine. It is not a true IgE-mediated allergy. It can be prevented by slowing the infusion rate (to over 60 minutes) and pre-treating with antihistamines."
    },

    # ─── SERUM SICKNESS-LIKE REACTION ───
    {
        "q": "A 6-year-old child presents with a widespread, hive-like rash, severe joint pain and swelling of the ankles, and a low-grade fever that began 10 days after starting Cefaclor for an ear infection. Lab work shows a normal platelet count and no proteinuria. What is the diagnosis?",
        "options": [
            "Serum Sickness-Like Reaction (SSLR)",
            "True Serum Sickness",
            "Henoch-Schönlein Purpura (IgA Vasculitis)",
            "Stevens-Johnson Syndrome",
            "Acute Rheumatic Fever"
        ],
        "answer": 0,
        "exp": "Serum Sickness-Like Reaction (SSLR) is a benign, transient reaction that classically occurs in children 1-3 weeks after starting certain drugs, most famously Cefaclor, as well as penicillins and sulfonamides. It mimics true serum sickness with fever, arthralgias, and urticarial plaques, but crucially LACKS circulating immune complexes, complement depletion, vasculitis, and renal damage (proteinuria)."
    },

    # ─── CHEMO & ONCOLOGY DRUG REACTIONS ───
    {
        "q": "A {age}-old {gender} being treated with high-dose Capecitabine for metastatic colorectal cancer presents with painful redness, swelling, and tingling on their palms and soles. Physical examination reveals symmetric, bright erythema and edema of the palmar and plantar surfaces, with early desquamation. What is the clinical term for this condition?",
        "options": [
            "Palmar-Plantar Erythrodysesthesia (Hand-Foot Syndrome)",
            "Hand-Foot-and-Mouth Disease",
            "Erythema Multiforme Major",
            "Fixed Drug Eruption",
            "Contact Dermatitis"
        ],
        "answer": 0,
        "exp": "Palmar-Plantar Erythrodysesthesia (also known as Hand-Foot Syndrome) is a common cutaneous side effect of several chemotherapy agents, most classically Capecitabine, 5-Fluorouracil (5-FU), and Cytarabine. It is caused by drug leaking from small capillaries into the thick skin of the palms and soles, leading to direct toxicity, pain, symmetric erythema, swelling, and peeling."
    },
    {
        "q": "A {age}-old {gender} being treated with Cetuximab (an EGFR inhibitor) for lung cancer develops an itchy, acne-like rash consisting of papules and pustules on their face, neck, and upper chest. Comedones are completely absent. What is the clinical significance of this rash?",
        "options": [
            "It is a positive prognostic indicator (the development and severity of the rash correlate with a favorable tumor response)",
            "It indicates a life-threatening drug allergy and the Cetuximab must be stopped permanently",
            "It represents a deep follicular bacterial infection requiring intravenous antibiotics",
            "It is caused by secondary adrenal insufficiency from the chemotherapy",
            "It is a sign of tumor progression and therapeutic failure"
        ],
        "answer": 0,
        "exp": "EGFR inhibitor-induced acneiform (papulopustular) eruption is a highly common and expected class-effect of drugs like Cetuximab, Erlotinib, and Panitumumab. Counter-intuitively, the development and severity of this rash act as a positive surrogate marker for drug efficacy, correlating with improved tumor response and patient survival. It is managed with topical/oral antibiotics (doxycycline) and steroids without stopping the chemotherapy."
    },

    # ─── DRUG HYPERPIGMENTATION ───
    {
        "q": "A {age}-old {gender} who has been taking Minocycline for severe acne for 3 years presents with a new, muddy, blue-gray discoloration on their shins and the mucosal surface of their lower gums. A skin biopsy reveals iron-containing and melanin-containing pigment deposits within the dermis. What is the subtype and characteristic appearance of this minocycline-induced hyperpigmentation?",
        "options": [
            "Type II Minocycline Hyperpigmentation, affecting normal skin of the shins and forearms, as well as gums",
            "Type I Minocycline Hyperpigmentation, limited strictly to sites of prior inflammation and scarring",
            "Type III Minocycline Hyperpigmentation, presenting as a diffuse muddy-brown tan in sun-exposed areas",
            "Argiria, caused by silver deposition in the eccrine glands",
            "Slate-gray facial pigmentation induced by drug-induced lipofuscin"
        ],
        "answer": 0,
        "exp": "Minocycline can induce three distinct types of skin hyperpigmentation: Type I occurs strictly in scars and areas of prior inflammation (blue-black pigment); Type II occurs on normal skin, classically the shins, forearms, and gums (slate-blue/gray pigment containing iron and melanin); and Type III is a diffuse, muddy-brown hyperpigmentation in sun-exposed areas (pure melanin)."
    },
    {
        "q": "A 72-year-old {gender} with a history of refractory cardiac arrhythmias has been taking Amiodarone for 5 years. They present to the clinic complaining of a blue-gray discoloration of their face, nose, and ears. Biopsy of the affected skin reveals lipofuscin-like granules within dermal macrophages. What is the key environmental trigger required for the development of this specific pigmentation?",
        "options": [
            "Ultraviolet (UV) light exposure (sunlight)",
            "Chronic mechanical friction",
            "High dietary intake of vitamin C",
            "Frequent hot water baths",
            "Exposure to cold weather (Raynaud-like)"
        ],
        "answer": 0,
        "exp": "Amiodarone-induced hyperpigmentation is a classic side effect occurring in patients on long-term, high-dose amiodarone therapy. It presents as a slate-gray to blue-violet discoloration strictly in sun-exposed areas (face, nose, ears). Ultraviolet (UV) light is required to trigger the deposition of a drug-lipid complex (lipofuscin) inside dermal macrophages."
    },
    {
        "q": "A {age}-old {gender} with systemic lupus erythematosus has been taking Hydroxychloroquine for 6 years. During a routine skin check, the dermatologist notes well-demarcated, slate-gray patches on the patient's bilateral shins and a bluish-gray discoloration of the hard palate. What is the prognosis and clinical course of this pigmentation?",
        "options": [
            "It is slowly reversible over months to years after stopping the hydroxychloroquine, though some areas may persist",
            "It is completely permanent and will continue to spread even if the drug is discontinued",
            "It resolves spontaneously within 2 weeks of stopping the drug",
            "It indicates an immediate risk of acute hepatic failure",
            "It is highly infectious and can be transmitted to others"
        ],
        "answer": 0,
        "exp": "Skin and mucosal hyperpigmentation occurs in up to 25% of patients on long-term antimalarials (Chloroquine/Hydroxychloroquine). Classic sites are the shins (pretibial area), the hard palate, and the nail beds. The pigmentation is slowly reversible over many months or years after drug cessation, though some localized areas may remain permanently."
    },

    # ─── FLAGELLATE ERYTHEMA ───
    {
        "q": "A 32-year-old woman undergoing chemotherapy for Hodgkin's lymphoma develops intensely pruritic, linear, criss-crossing red streaks on her back and chest that resemble 'whip marks'. She admits to scratching her skin due to dryness. Which of the following chemotherapy agents is the classic cause of this flagellate erythema?",
        "options": [
            "Bleomycin",
            "5-Fluorouracil (5-FU)",
            "Paclitaxel",
            "Cyclophosphamide",
            "Doxorubicin"
        ],
        "answer": 0,
        "exp": "Flagellate erythema is a virtually pathognomonic cutaneous toxicity associated with Bleomycin therapy. It presents as highly characteristic, linear, criss-crossing erythematous streaks that look like 'whip marks' on the back and trunk. It represents a Koebner-like response where minor scratching or friction concentrates the drug in the local skin vessels."
    },

    # ─── GINGIVAL HYPERPLASIA ───
    {
        "q": "A {age}-old {gender} presents with progressive, painless, firm, fibrous swelling of their gums that has begun to cover the crowns of their teeth. They have a history of epilepsy. Which of the following triads of medications represents the classic causes of drug-induced gingival hyperplasia?",
        "options": [
            "Phenytoin, Cyclosporine, and Nifedipine",
            "Aspirin, Acetaminophen, and Ibuprofen",
            "Metformin, Lisinopril, and Atorvastatin",
            "Penicillin, Doxycycline, and Cephalexin",
            "Prednisone, Isotretinoin, and Spironolactone"
        ],
        "answer": 0,
        "exp": "Drug-induced gingival hyperplasia is a classic side effect characterized by fibrous overgrowth of the gingival papillae. The three classic, high-yield culprits are Phenytoin (anti-epileptic), Cyclosporine (immunosuppressant), and Calcium Channel Blockers (especially Nifedipine, but also Amlodipine/Diltiazem)."
    },

    # ─── PSEUDOPORPHYRIA ───
    {
        "q": "A {age}-old {gender} taking Naproxen for osteoarthritic pain presents with skin fragility and multiple small, tense vesicles and erosions on the dorsum of their hands. Biopsy reveals a subepidermal blister with minimal inflammatory cell infiltrate. Laboratory workup demonstrates normal levels of urinary and fecal porphyrins, ruling out Porphyria Cutanea Tarda (PCT). What is the diagnosis?",
        "options": [
            "Pseudoporphyria",
            "Porphyria Cutanea Tarda (PCT)",
            "Bullous Pemphigoid",
            "Epidermolysis Bullosa Acquisita",
            "Allergic Contact Dermatitis"
        ],
        "answer": 0,
        "exp": "Pseudoporphyria is a drug-induced condition that clinically and histologically mimics Porphyria Cutanea Tarda (PCT), presenting with skin fragility, blistering, and scarring on sun-exposed hands. Crucially, porphyrin levels in the blood, urine, and stool are completely normal in pseudoporphyria. NSAIDs (most famously Naproxen) are the leading cause."
    },

    # ─── ERYTHEMA NODOSUM ───
    {
        "q": "A 25-year-old female presents with multiple extremely painful, warm, red, deep-seated nodules on her bilateral shins that have been present for 2 weeks. She reports starting oral contraceptive pills (OCPs) 2 months ago. A biopsy reveals septal panniculitis without vasculitis. What is the diagnosis?",
        "options": [
            "Erythema Nodosum (EN)",
            "Erythema Induratum (Bazin's disease)",
            "Polyarteritis Nodosa (PAN)",
            "Weber-Christian disease",
            "Sweet's syndrome"
        ],
        "answer": 0,
        "exp": "Erythema Nodosum (EN) is a classic form of panniculitis (inflammation of subcutaneous fat) that presents as tender, warm, erythematous nodules on the pretibial shins. It represents a hypersensitivity reaction to various triggers, including infections (strep, TB) and medications—most commonly oral contraceptives (OCPs) and sulfonamides. Histology classically shows septal panniculitis."
    },

    # ─── MIRAS ───
    {
        "q": "A 12-year-old child presents with high fever, severe mucosal crusting and ulceration of the lips and mouth, and conjunctival redness with purulent discharge. Physical exam reveals less than 1% BSA of skin detachment with only a few targetoid macules on the limbs. The child was treated for 'walking pneumonia' 1 week ago. What is the diagnosis?",
        "options": [
            "Mycoplasma-Induced Rash and Mucositis (MIRAS)",
            "Stevens-Johnson Syndrome (SJS)",
            "Erythema Multiforme Major",
            "Toxic Epidermal Necrolysis (TEN)",
            "Primary Herpes Simplex Gingivostomatitis"
        ],
        "answer": 0,
        "exp": "Mycoplasma-Induced Rash and Mucositis (MIRAS) is triggered by Mycoplasma pneumoniae infection, most commonly in children and young adults. It is characterized by severe mucositis involving $\\ge 2$ mucosal sites (typically oral and ocular) with minimal or absent cutaneous lesions (<1% BSA skin involvement). It mimics SJS but has a distinct pathogenesis and carries a significantly better prognosis with lower mortality."
    },

    # ─── LEVAMISOLE-INDUCED RETIFORM PURPURA ───
    {
        "q": "A 35-year-old patient presents with painful, dark purple, necrotic, star-shaped (retiform) patches on their bilateral earlobes, cheeks, and lower extremities. Lab work reveals a severe neutropenia (WBC 1,200/mm3 with an absolute neutrophil count of 350/mm3). A urine drug screen is positive for Cocaine. What is the causative agent responsible for this patient's necrotic ear skin and bone marrow suppression?",
        "options": [
            "Levamisole (a veterinary dewormer used as a cocaine cutting agent)",
            "Direct vasoconstrictive toxicity of the cocaine molecule itself",
            "An IgE-mediated drug allergy to benzoylecgonine",
            "A contamination of cocaine with Streptococcus pyogenes",
            "Amiodarone-induced photo-vasculitis"
        ],
        "answer": 0,
        "exp": "This patient has Levamisole-induced retiform purpura. Levamisole is a veterinary anthelmintic commonly used as an adulterant (cutting agent) in illicit cocaine. It triggers a unique, severe autoimmune vasculitis characterized by painful, retiform (star-shaped) purpura with central necrosis, characteristically involving the ears/earlobes and face. It is also a potent bone marrow suppressant, leading to severe neutropenia/agranulocytosis."
    },

    # ─── DRUG-INDUCED ANCA VASCULITIS ───
    {
        "q": "A {age}-old {gender} being treated with Hydralazine for 8 years presents with fever, joint pain, weight loss, and palpable purple spots (purpura) on their lower legs. Lab results show a positive ANA, dual positivity for p-ANCA (MPO) and c-ANCA (PR3) antibodies, and urinalysis reveals proteinuria and hematuria with red blood cell casts. What is the diagnosis?",
        "options": [
            "Drug-induced ANCA-associated vasculitis",
            "Drug-Induced Lupus Erythematosus (DILE)",
            "Henoch-Schönlein Purpura",
            "SJS/TEN Overlap Syndrome",
            "Granulomatosis with Polyangiitis (GPA)"
        ],
        "answer": 0,
        "exp": "Drug-induced ANCA-associated vasculitis is a severe necrotizing vasculitis classically triggered by long-term use of Hydralazine, Propylthiouracil (PTU), or Methimazole. Unlike simple drug-induced lupus (DILE), drug-induced ANCA vasculitis features high titers of p-ANCA (MPO) and PR3, palpable purpura, and significant internal organ involvement—most notably rapidly progressive glomerulonephritis (renal failure)."
    },

    # ─── PITYRIASIS ROSEA-LIKE ───
    {
        "q": "A {age}-old {gender} on Captopril (an ACE inhibitor) develops a widespread scaly rash on their trunk. They report a large, oval, scaly 'herald patch' appeared on their chest first, followed by smaller oval plaques along the skin tension lines on their back in a 'Christmas tree' distribution. How does this drug-induced Pityriasis Rosea-like eruption typically differ from idiopathic Pityriasis Rosea?",
        "options": [
            "It often lacks a distinct initial herald patch and takes much longer to resolve after stopping the drug",
            "It is highly contagious and spreads to children via respiratory droplets",
            "It is accompanied by severe kidney damage and proteinuria",
            "It presents with deep, tense bullae and a positive Nikolsky sign",
            "It strictly affects the face and spares the trunk"
        ],
        "answer": 0,
        "exp": "Pityriasis Rosea-like drug eruptions (triggered by ACE inhibitors, gold, beta-blockers, and metronidazole) closely mimic classic PR. However, the drug-induced form typically lacks the single large 'herald patch' that precedes the main eruption, shows more confluent and inflammatory lesions, and is much more persistent, resolving slowly only after the offending drug is discontinued."
    },

    # ─── PSORIASIS EXACERBATION ───
    {
        "q": "A patient with a history of stable, mild plaque psoriasis is diagnosed with bipolar disorder and started on Lithium. Two weeks later, they present with an explosive, severe flare of psoriasis, with thick, silvery plaques now covering 40% of their BSA. Which of the following lists represents the 'big four' systemic drugs most famous for flaring or worsening psoriasis?",
        "options": [
            "Lithium, Beta-blockers, Antimalarials (hydroxychloroquine), and NSAIDs",
            "Penicillins, Cephalosporins, Macrolides, and Sulfonamides",
            "Statins, Fibrates, Metformin, and Lisinopril",
            "Amlodipine, Warfarin, Heparin, and Aspirin",
            "Isotretinoin, Spironolactone, Cyclosporine, and Prednisone"
        ],
        "answer": 0,
        "exp": "Systemic drugs are common triggers for the onset or severe exacerbation of psoriasis. The classic, high-yield 'big four' culprits are Lithium (bipolar therapy), Beta-blockers (cardiovascular therapy), Antimalarials (e.g., hydroxychloroquine/chloroquine), and NSAIDs. Systemic steroid withdrawal can also precipitate a life-threatening rebound flare of generalized pustular psoriasis."
    },

    # ─── NICOLAU SYNDROME ───
    {
        "q": "Immediately after receiving an intramuscular (IM) injection of Penicillin G benzathine in the upper outer quadrant of the buttock, a {age}-old {gender} develops excruciating, burning pain and livedo-like, blue-gray discoloration around the injection site. Within 48 hours, this area develops deep, necrotic sloughing of the skin and underlying gluteal muscle. What is this clinical entity?",
        "options": [
            "Nicolau Syndrome (Embolia Cutis Medicamentosa)",
            "An IgE-mediated anaphylactic reaction",
            "Necrotizing fasciitis from bacterial contamination",
            "Arthus reaction from vaccine immune complex deposition",
            "Warfarin-induced skin necrosis"
        ],
        "answer": 0,
        "exp": "Nicolau Syndrome (also known as Embolia Cutis Medicamentosa) is a rare, devastating non-allergic vascular complication of intramuscular injections. It occurs due to accidental intra-arterial injection, peri-arterial injection, or drug-induced vasospasm/thrombosis. It presents with immediate severe pain, retiform cyanosis, and subsequent deep tissue necrosis of the skin, fat, and muscle."
    },

    # ─── SWEET'S SYNDROME ───
    {
        "q": "A patient undergoing chemotherapy for leukemia is treated with G-CSF (Granulocyte Colony-Stimulating Factor) to manage neutropenia. Three days later, they develop a high fever (39.5 C) and several painful, bright red, 'succulent' or 'juicy' plaques on their neck and upper back. Biopsy reveals a massive, dense neutrophilic infiltrate in the upper dermis without vasculitis. What is the diagnosis?",
        "options": [
            "Sweet's Syndrome (Acute Febrile Neutrophilic Dermatosis)",
            "Pyoderma Gangrenosum",
            "AGEP",
            "DRESS syndrome",
            "Erysipelas"
        ],
        "answer": 0,
        "exp": "Sweet's syndrome (Acute Febrile Neutrophilic Dermatosis) is characterized by high fever, leukocytosis, and tender, erythematous plaques that are clinically described as 'juicy' or 'succulent' due to profound upper dermal edema. Histology shows a dense dermal neutrophilic infiltrate without vasculitis. G-CSF is a classic drug trigger because it directly stimulates neutrophil production."
    },

    # ─── TAXANE SCLERODERMA ───
    {
        "q": "A {age}-old {gender} being treated with Paclitaxel for breast cancer develops bilateral, woody thickening and hardening of the skin of their lower legs and forearms. Physical exam shows marked induration, but there is an absence of Raynaud's phenomenon or nail fold capillary changes, and systemic organ involvement is absent. ANA testing is negative. What is the diagnosis?",
        "options": [
            "Taxane-induced scleroderma-like changes",
            "Systemic Sclerosis (Scleroderma)",
            "Eosinophilic Fasciitis",
            "Nephrogenic Systemic Fibrosis",
            "Stasis dermatitis"
        ],
        "answer": 0,
        "exp": "Taxanes (Paclitaxel, Docetaxel) can induce scleroderma-like skin changes (induration, woody thickening) typically localized to the extremities. The key clinical clues to distinguish this drug-induced form from idiopathic Systemic Sclerosis are the absence of Raynaud's phenomenon, normal nail fold capillaries, negative autoantibodies (ANA/Scl-70), and lack of visceral sclerosis."
    },

    # ─── ERUPTIVE WARTS / BRAF INHIBITORS ───
    {
        "q": "A {age}-old {gender} taking Vemurafenib (a BRAF inhibitor) for metastatic melanoma develops several fast-growing, dome-shaped nodules with central keratinous craters on their arms within 3 weeks of starting the drug. Biopsy of one lesion shows a well-differentiated squamous cell carcinoma/keratoacanthoma (SCC/KA). What is the mechanism driving these secondary skin malignancies?",
        "options": [
            "Paradoxical activation of the MAP kinase pathway in normal keratinocytes that do NOT have the BRAF mutation",
            "Direct mutagenic damage to epidermal stem cell DNA by the drug molecule",
            "Systemic immunosuppression leading to explosive reactivation of HPV-16",
            "Upregulation of the Hedgehog pathway in follicular basal cells",
            "A metastatic spread of the primary melanoma to the skin"
        ],
        "answer": 0,
        "exp": "Vemurafenib and other BRAF inhibitors cause paradoxical activation of the MAP kinase pathway in normal cells that do not harbor the BRAF V600E mutation. The drug binds to wild-type BRAF, causing it to homodimerize and hyper-activate downstream MEK/ERK signaling, driving rapid keratinocyte proliferation and leading to eruptive Keratoacanthomas and low-grade Squamous Cell Carcinomas."
    },

    # ─── MULTI-KINASE INHIBITOR HFSR ───
    {
        "q": "A {age}-old {gender} on Sorafenib (a multi-kinase inhibitor) for renal cell carcinoma develops thick, painful, yellow calluses surrounded by a bright red halo on the heels and lateral aspects of their feet. How does this Sorafenib-induced Hand-Foot Skin Reaction (HFSR) clinically differ from Capecitabine-induced Hand-Foot Syndrome (HFS)?",
        "options": [
            "HFSR presents as localized hyperkeratosis and thick calluses on pressure points, whereas classic HFS is characterized by diffuse, symmetric erythema and peeling",
            "HFSR is completely painless and resolves within 24 hours of starting the drug",
            "Classic HFS is caused by direct exposure to sunlight",
            "HFSR strictly affects the fingernails and spares the skin",
            "There is no clinical difference between the two reactions"
        ],
        "answer": 0,
        "exp": "While both affect the hands/feet, Sorafenib-induced Hand-Foot Skin Reaction (HFSR) is clinically distinct from capecitabine-induced Hand-Foot Syndrome (HFS). HFSR is characterized by localized, hyperkeratotic, thick yellow plaques and blisters on high-friction pressure points (heels/lateral sole), while classic HFS (capecitabine) presents as diffuse, confluent erythema, edema, and desquamation."
    },

    # ─── HALOGENODERMAS ───
    {
        "q": "A {age}-old {gender} with chronic renal insufficiency receives intravenous iodinated contrast for a CT scan. Two days later, they develop painful, rapidly expanding, pustular, vegetating plaques on their face and lower extremities. Pustule culture is negative. Biopsy shows massive epidermal hyperplasia (pseudoepitheliomatous hyperplasia) and dense neutrophilic microabscesses. What is the diagnosis?",
        "options": [
            "Iododerma (Halogenoderma)",
            "Pyoderma Gangrenosum",
            "Blastomycosis",
            "Sweet's syndrome",
            "Invasive Squamous Cell Carcinoma"
        ],
        "answer": 0,
        "exp": "Halogenodermas (Iododerma and Bromoderma) are rare cutaneous toxic accumulations of halogens, most commonly occurring in patients with impaired renal clearance. Clinically, they present as highly inflammatory, pustular, vegetating plaques that can closely mimic Pyoderma Gangrenosum, deep fungal infections (like Blastomycosis), or Squamous Cell Carcinoma. Histology shows marked pseudoepitheliomatous hyperplasia."
    }
]

ages = ["26-year", "35-year", "45-year", "55-year", "62-year", "68-year", "72-year", "78-year", "20-year", "28-year", "38-year", "50-year", "12-year", "17-year", "19-year"]
genders = ["male", "female", "man", "woman", "boy", "girl"]

mcqs = []
counter = 1

while len(mcqs) < 300:
    for t in templates:
        if len(mcqs) >= 300:
            break
        
        q_text = t["q"]
        if "{age}" in q_text:
            q_text = q_text.replace("{age}", random.choice(ages))
        if "{gender}" in q_text:
            q_text = q_text.replace("{gender}", random.choice(genders))
        
        opts = list(t["options"])
        ans_idx = t["answer"]
        ans_text = opts[ans_idx]
        
        random.shuffle(opts)
        new_ans_idx = opts.index(ans_text)
        
        q_text_escaped = q_text.replace("'", "''")
        opts_json_escaped = json.dumps(opts).replace("'", "''")
        exp_escaped = t['exp'].replace("'", "''")
        
        mcq_str = f"    (v_topic_id, '{q_text_escaped}', '{opts_json_escaped}'::jsonb, {new_ans_idx}, '{exp_escaped}')"
        
        if mcq_str not in mcqs:
            mcqs.append(mcq_str)
            counter += 1

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260519_derm_drug_reactions_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Dermatology: Drug-induced skin reactions (SJS, TEN)\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'derm-drug-reactions' LIMIT 1;\n")
    f.write("    IF v_topic_id IS NULL THEN\n")
    f.write(f"        RAISE EXCEPTION 'Topic {topic_slug} not found.';\n")
    f.write("    END IF;\n\n")
    
    f.write("    -- Clear existing MCQs for this topic to avoid duplicates\n")
    f.write("    DELETE FROM mcqs WHERE topic_id = v_topic_id;\n\n")
    
    f.write("    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES\n")
    
    for i, m in enumerate(mcqs):
        if i < len(mcqs) - 1:
            f.write(m + ",\n")
        else:
            f.write(m + ";\n")
            
    f.write("END $$;\n")
    f.write("COMMIT;\n")

print(f"Generated {len(mcqs)} MCQs to {out_file}")
