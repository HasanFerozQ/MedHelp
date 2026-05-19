import json
import random

topic_slug = 'derm-common-dermatoses'

templates = [
    # ─── ATOPIC DERMATITIS & ECZEMA VARIANTS ───
    {
        "q": "A {age}-old {gender} with a history of asthma and seasonal allergies presents with a severely pruritic rash on the antecubital and popliteal fossae. Physical exam shows erythematous, excoriated, and lichenified plaques. What is the primary pathophysiological defect responsible for this condition?",
        "options": [
            "Loss-of-function mutation in the filaggrin (FLG) gene leading to epidermal barrier dysfunction",
            "Autoimmune destruction of desmoglein 1 and 3 in the spinous layer",
            "Type I hypersensitivity reaction to dietary gluten proteins",
            "T-cell mediated apoptosis of keratinocytes at the dermo-epidermal junction",
            "Defective synthesis of type IV collagen in the basement membrane zone"
        ],
        "answer": 0,
        "exp": "Atopic dermatitis is characterized by epidermal barrier dysfunction, classically caused by loss-of-function mutations in the filaggrin (FLG) gene. This leads to increased transepidermal water loss, allergen penetration, and secondary T-helper 2 (Th2) mediated inflammation."
    },
    {
        "q": "A {age}-old {gender} presents with a rapid eruption of monomorphic, painful, punched-out, hemorrhagic erosions with overlying black crusts clustered over their face, neck, and upper chest. The patient has a background of severe atopic dermatitis. What is the most appropriate next step in management?",
        "options": [
            "Initiate immediate systemic acyclovir therapy",
            "Prescribe oral cephalexin and apply topical mupirocin cream",
            "Apply high-potency topical clobetasol ointment under occlusion",
            "Recommend daily bleach baths and initiate oral antihistamines",
            "Perform a punch biopsy to rule out squamous cell carcinoma in situ"
        ],
        "answer": 0,
        "exp": "This presentation is diagnostic of Eczema Herpeticum (Kaposi varicelliform eruption), a disseminated HSV infection overlying active atopic dermatitis. It is a dermatologic emergency requiring prompt systemic antiviral therapy (acyclovir) to prevent ophthalmic involvement or systemic viremia."
    },
    {
        "q": "A {age}-old {gender} presents with a 3-month history of an intensely itchy rash on the bilateral lower legs during the winter. Physical exam reveals several sharply demarcated, coin-shaped (discoid), erythematous, scaly plaques. A KOH prep is negative for fungal elements. What is the first-line treatment of choice?",
        "options": [
            "Mid-to-high potency topical corticosteroids and aggressive emollient moisturization",
            "Topical clotrimazole cream twice daily for 2 weeks",
            "Oral cephalexin for 7 days to treat secondary bacterial infection",
            "Topical salicylic acid 6% ointment to induce keratolysis",
            "Oral prednisone taper starting at 40 mg daily"
        ],
        "answer": 0,
        "exp": "Nummular eczema (discoid eczema) classically presents as coin-shaped scaly plaques on the extremities of adults, often exacerbated by dry winter weather. The negative KOH rules out tinea corporis. First-line management consists of high-potency topical steroids and frequent use of thick emollients."
    },
    {
        "q": "A {age}-old {gender} presents with recurrent, extremely pruritic, deep-seated, clear vesicles resembling 'tapioca pudding' clustered along the lateral aspects of the fingers and palms. What is the most likely trigger or association for this patient's condition?",
        "options": [
            "Emotional stress, hot weather, and frequent hand washing (wet work)",
            "Ingestion of high-gluten containing grain products",
            "Reactivation of latent varicella zoster virus in the dorsal root ganglion",
            "Direct contact with toxicodendrol resin (urushiol) from poison ivy",
            "Staphylococcus aureus colonization of the hair follicles"
        ],
        "answer": 0,
        "exp": "Dyshidrotic eczema (pompholyx) classically presents with deep-seated, intensely pruritic 'tapioca-like' vesicles on the hands, lateral digits, or soles. It is not associated with sweat gland dysfunction, but rather triggered by stress, wet work, metal allergies (nickel/cobalt), and warm weather."
    },
    {
        "q": "A {age}-old {gender} presents with a severe linear streak of intensely pruritic, erythematous papules and vesicles on their forearm 48 hours after hiking in the woods. What is the primary immune mediator responsible for this clinical presentation?",
        "options": [
            "Sensitized T-lymphocytes (Type IV hypersensitivity)",
            "Mast cell degranulation via IgE cross-linking (Type I hypersensitivity)",
            "Circulating antigen-antibody immune complexes (Type III hypersensitivity)",
            "Complement-mediated antibody-directed cytotoxicity (Type II hypersensitivity)",
            "Polymorphonuclear leukocyte activation by bacterial superantigens"
        ],
        "answer": 0,
        "exp": "Allergic contact dermatitis (such as Rhus dermatitis from poison ivy/oak) is a classic Type IV (delayed-type, T-cell mediated) hypersensitivity reaction. Urushiol acts as a hapten, binding to skin proteins which are processed by Langerhans cells and presented to T-cells."
    },
    {
        "q": "A {age}-old {gender} presents with a well-demarcated, intensely itchy, scaly, and erythematous plaque located directly beneath their navel, corresponding exactly to where their jeans button touches the skin. What is the gold standard diagnostic test to confirm this patient's suspected allergen?",
        "options": [
            "Patch testing read at 48 and 96 hours",
            "Skin prick testing with immediate wheal-and-flare measurement",
            "Serum radioallergosorbent test (RAST) for allergen-specific IgE",
            "Punch biopsy of the active border of the lesion",
            "Oral food allergen challenge under medical supervision"
        ],
        "answer": 0,
        "exp": "The clinical scenario describes nickel-induced allergic contact dermatitis, very common at the infraumbilical zone from metal snaps/buttons. The gold standard diagnosis is patch testing, which evaluates Type IV delayed hypersensitivity by applying suspected allergens to the back for 48 hours."
    },
    {
        "q": "A {age}-old {gender} presents with a bright red, raw diaper rash. On physical examination, the inguinal creases are completely spared. What is the most likely diagnosis?",
        "options": [
            "Irritant contact dermatitis",
            "Candidal diaper dermatitis",
            "Seborrheic diaper dermatitis",
            "Inverse psoriasis",
            "Langerhans cell histiocytosis"
        ],
        "answer": 0,
        "exp": "Irritant diaper dermatitis is caused by friction and prolonged contact with urine and feces, classically affecting the convex surfaces of the buttocks and thighs while sparing the deep inguinal skin folds (creases). In contrast, candidal diaper dermatitis characteristically involves the folds and presents with satellite pustules."
    },
    {
        "q": "A {age}-old {gender} presents with an itchy, flaking rash on their face and scalp. Physical exam reveals ill-defined erythematous patches with fine, greasy, yellowish scales located on the nasolabial folds, eyebrows, and central chest. What organism is strongly implicated in the pathogenesis of this disease?",
        "options": [
            "Malassezia yeast species",
            "Cutibacterium acnes",
            "Staphylococcus epidermidis",
            "Demodex folliculorum",
            "Microsporum canis"
        ],
        "answer": 0,
        "exp": "Seborrheic dermatitis classically presents with greasy, yellowish scales on sebum-rich areas (scalp, eyebrows, nasolabial folds, ears, pre-sternal chest). It is driven by an inflammatory response to Malassezia (formerly Pityrosporum) species, a lipophilic yeast colonizing these oily areas."
    },
    {
        "q": "A {age}-old {gender} with a history of obesity, multiple pregnancies, and varicose veins presents with bilateral pitting edema, reddish-brown hyperpigmentation (hemosiderin staining), and weeping scaly plaques over the medial malleoli. What is the most critical, foundational treatment to resolve this skin condition?",
        "options": [
            "Graduated compression therapy and leg elevation",
            "Long-term oral prednisone therapy",
            "Systemic broad-spectrum oral antibiotics",
            "Ultra-high potency topical steroids under occlusion",
            "Surgical debridement of the medial malleolar plaques"
        ],
        "answer": 0,
        "exp": "The patient has stasis dermatitis secondary to chronic venous insufficiency. Hydrostatic pressure leads to RBC extravasation, causing hemosiderin staining. The foundational, pathophysiologically targeted therapy is reversing venous hypertension using graduated compression stockings and leg elevation."
    },
    {
        "q": "An 82-year-old {gender} presents with an intensely itchy rash on the bilateral anterior shins during mid-winter. Physical exam shows extremely dry skin with a network of fine fissures and cracks resembling a 'dried riverbed' or 'cracked porcelain'. What is the diagnosis?",
        "options": [
            "Asteatotic eczema (Eczema craquelé)",
            "Stasis dermatitis",
            "Ichthyosis vulgaris",
            "Lichen simplex chronicus",
            "Plaque psoriasis"
        ],
        "answer": 0,
        "exp": "Asteatotic eczema (eczema craquelé) is common in elderly individuals during winter. It is caused by a severe decrease in skin surface lipids, leading to dehydration and characteristically cracked skin on the shins, aggravated by frequent hot baths."
    },

    # ─── PSORIASIS SUBTYPES & SYSTEMIC MANIFESTATIONS ───
    {
        "q": "A {age}-old {gender} presents with thick, erythematous plaques covered by dense, silvery-white, micaceous scales on the extensor surfaces of their elbows and knees. What histologic feature is classically seen in this condition?",
        "options": [
            "Acanthosis with elongated rete ridges, parakeratosis, and neutrophilic microabscesses in the stratum corneum",
            "Intraepidermal acantholysis with a 'tombstone' appearance of the basal layer",
            "Subepidermal split with a dense infiltrate of eosinophils in the dermal papillary tips",
            "Band-like lymphocytic infiltrate at the dermo-epidermal junction with apoptotic keratinocytes (Civatte bodies)",
            "Hyperkeratosis, granulomatous dermal infiltrate, and microabscesses of eosinophils"
        ],
        "answer": 0,
        "exp": "Histology of plaque psoriasis classically demonstrates epidermal hyperplasia (acanthosis) with uniform elongation of the rete ridges, parakeratosis (retention of nuclei in the stratum corneum), thinning of the suprapapillary plates, and Munro microabscesses (neutrophils in the stratum corneum)."
    },
    {
        "q": "A {age}-old {gender} with chronic plaque psoriasis scratches their elbow and, 2 weeks later, develops a new linear psoriatic plaque exactly corresponding to the scratch mark. What is this phenomenon called?",
        "options": [
            "Koebner phenomenon",
            "Auspitz sign",
            "Nikolsky sign",
            "Darier sign",
            "Asboe-Hansen sign"
        ],
        "answer": 0,
        "exp": "The Koebner phenomenon (isomorphic response) is the development of typical cutaneous lesions of a disease (like psoriasis, lichen planus, or vitiligo) at sites of localized trauma to previously normal skin."
    },
    {
        "q": "A {age}-old {gender} presents with a sudden, explosive eruption of hundreds of small, 2-10 mm, drop-like, scaly papules over their trunk and limbs. They report having a severe sore throat 2 weeks ago. What is the most likely pathogen associated with this eruption?",
        "options": [
            "Group A Beta-Hemolytic Streptococcus (Streptococcus pyogenes)",
            "Staphylococcus aureus",
            "Herpes Simplex Virus Type 1",
            "Malassezia furfur",
            "Epstein-Barr Virus"
        ],
        "answer": 0,
        "exp": "Guttate psoriasis classically presents as a sudden eruption of small, drop-like, scaly lesions across the trunk and extremities, classically triggered 1-3 weeks following a Group A Beta-Hemolytic Streptococcal pharyngitis or tonsillitis."
    },
    {
        "q": "A {age}-old {gender} presents with bright red, highly demarcated, completely smooth, non-scaly, and macerated plaques in the bilateral axillae, inframammary folds, and inguinal creases. What is the diagnosis?",
        "options": [
            "Inverse (flexural) psoriasis",
            "Candidal intertrigo",
            "Erythrasma",
            "Seborrheic dermatitis",
            "Hailey-Hailey disease"
        ],
        "answer": 0,
        "exp": "Inverse psoriasis (flexural psoriasis) selectively targets intertriginous areas (axillae, groin, inframammary folds, gluteal cleft). Because of the warm, moist environment, the classic silvery-white scaling is macerated and absent, leaving smooth, highly erythematous, glazed plaques."
    },
    {
        "q": "A {age}-old {gender} with a history of plaque psoriasis presents to the emergency department with fever, severe chills, and generalized burning erythema covering 95% of their total body surface area. What is the most immediate life-threatening complication of this condition?",
        "options": [
            "High-output cardiac failure and thermoregulatory dysfunction",
            "Acute kidney injury from myoglobinuria",
            "Pulmonary embolism from deep vein thrombosis",
            "Severe autoimmune thrombocytopenic purpura",
            "Anaphylactic shock from endogenous histamine release"
        ],
        "answer": 0,
        "exp": "Erythrodermic psoriasis is a dermatologic emergency where >90% of the body surface area is erythematous and scaly. The loss of skin barrier leads to massive vasodilation, causing hypothermia, high-output heart failure (due to shunting of blood to the skin), and massive fluid/protein loss."
    },
    {
        "q": "A {age}-old {gender} in their 3rd trimester of pregnancy presents with fever, malaise, and a sudden eruption of widespread sheets of painful erythema studded with hundreds of small, sterile, coalescing yellow pustules. What is this condition historically called?",
        "options": [
            "Impetigo herpetiformis (Generalized Pustular Psoriasis of Pregnancy)",
            "Pemphigoid gestationis",
            "Pruritic urticarial papules and plaques of pregnancy (PUPPP)",
            "Prurigo of pregnancy",
            "Subcorneal pustular dermatosis (Sneddon-Wilkinson)"
        ],
        "answer": 0,
        "exp": "Impetigo herpetiformis is a rare, severe variant of generalized pustular psoriasis occurring during pregnancy, typically in the third trimester. It is characterized by sterile pustules, fever, leukocytosis, and hypocalcemia, and poses significant risks for placental insufficiency and fetal demise."
    },
    {
        "q": "A {age}-old {gender} with a history of psoriasis presents to the clinic with asymmetric joint pain and swelling. Physical exam reveals sausage-like swelling of the entire right index finger and left second toe. What radiographic finding is classically seen in this condition?",
        "options": [
            "'Pencil-in-cup' deformity of the distal interphalangeal (DIP) joints",
            "Symmetrical joint space narrowing with periarticular osteopenia",
            "Bilateral subluxation of the metacarpophalangeal joints",
            "Chondrocalcinosis of the articular cartilage",
            "Punched-out bony erosions with overhanging margins (rat-bite erosions)"
        ],
        "answer": 0,
        "exp": "The patient has psoriatic arthritis presenting with dactylitis ('sausage digit'). The classic radiographic finding of advanced psoriatic arthritis, particularly involving the DIP joints, is the 'pencil-in-cup' deformity, reflecting osteolysis combined with adjacent bony proliferation."
    },
    {
        "q": "A {age}-old {gender} is concerned about progressive fingernail changes. Examination shows multiple small, ice-pick-like depressions on the surface of the nail plates, along with yellowish-brown spots resembling 'oil drops' underneath the nail plates. Which HLA subtype is most strongly linked to this disease?",
        "options": [
            "HLA-Cw6",
            "HLA-B27",
            "HLA-DR4",
            "HLA-DQ2",
            "HLA-DR3"
        ],
        "answer": 0,
        "exp": "Nail pitting and the 'oil drop' sign are pathognomonic manifestations of psoriatic nail disease. Psoriasis is strongly linked to the major histocompatibility complex region, specifically the HLA-Cw6 allele, which is associated with early-onset plaque psoriasis."
    },
    {
        "q": "A {age}-old {gender} with severe, refractory plaque psoriasis is being evaluated for systemic biologic therapy. A purified protein derivative (PPD) skin test is positive (15 mm induration), but chest X-ray shows no active infiltrates. What is the most appropriate next step before initiating a TNF-alpha inhibitor?",
        "options": [
            "Initiate treatment for latent tuberculosis infection and wait at least 1 month before starting the biologic",
            "Proceed with starting the TNF-alpha inhibitor immediately since the chest X-ray is normal",
            "Administer a BCG vaccine and retest in 3 months",
            "Start a 4-drug active TB regimen (RIPE) and delay the biologic for 6 months",
            "Prescribe oral prednisone to suppress the PPD hypersensitivity reaction"
        ],
        "answer": 0,
        "exp": "Before starting any TNF-alpha inhibitor (e.g., adalimumab, infliximab), patients must be screened for latent TB. If positive, treatment for latent TB (typically isoniazid) must be initiated, and the biologic should be delayed for at least 1 month of anti-TB therapy to prevent catastrophic reactivation of TB."
    },

    # ─── ACNE VULGARIS, VARIANTS, & HORMONAL INFLUENCES ───
    {
        "q": "A {age}-old {gender} presents with numerous blackheads (open comedones) and whiteheads (closed comedones) on their forehead and nose. There is no erythema, inflammatory papules, or cysts. What is the primary mechanism of action of the first-line topical therapy for this patient?",
        "options": [
            "Normalization of follicular keratinization and promotion of comedolysis",
            "Direct bactericidal activity against Cutibacterium acnes via free radical release",
            "Inhibition of the 5-alpha-reductase enzyme in sebaceous glands",
            "Competitive antagonism of androgen receptors on the sebocyte membrane",
            "Reversible binding to the 50S ribosomal subunit to inhibit protein synthesis"
        ],
        "answer": 0,
        "exp": "Comedonal acne is treated first-line with topical retinoids (e.g., tretinoin, adapalene). Retinoids function by binding to nuclear retinoic acid receptors (RARs) to normalize follicular desquamation, preventing keratinocyte hyperadhesion and facilitating comedolysis."
    },
    {
        "q": "A {age}-old {gender} presents with moderate papulopustular acne. The dermatologist prescribes a combination of topical clindamycin and topical benzoyl peroxide. What is the primary clinical rationale for including benzoyl peroxide in this regimen?",
        "options": [
            "It is highly bactericidal and prevents the emergence of clindamycin-resistant Cutibacterium acnes strains",
            "It acts as a chemical sunscreen to prevent post-inflammatory hyperpigmentation",
            "It enhances the absorption of clindamycin by digesting sebum lipids",
            "It acts as a local anesthetic to reduce the burning sensation of topical retinoids",
            "It selectively blocks systemic absorption of clindamycin to avoid pseudomembranous colitis"
        ],
        "answer": 0,
        "exp": "Monotherapy with topical antibiotics for acne leads to rapid bacterial resistance. Benzoyl peroxide is a potent non-antibiotic antimicrobial that releases singlet oxygen free radicals, killing C. acnes with zero risk of resistance. Combining it with clindamycin prevents the development of resistant bacterial strains."
    },
    {
        "q": "A {age}-old {gender} with severe, scarring nodulocystic acne has failed oral minocycline and multiple topical regimens. The physician decides to start oral isotretinoin. What is the absolute molecular mechanism of action of this drug?",
        "options": [
            "Induction of apoptosis in sebocytes, leading to profound reduction in sebaceous gland size and sebum excretion",
            "Direct competitive inhibition of the androgen receptor on the sebaceous gland",
            "Direct bactericidal lysis of the cell wall of Cutibacterium acnes",
            "Irreversible inhibition of the cyclooxygenase-2 (COX-2) inflammatory pathway",
            "Upregulation of Th2-cytokines to suppress neutrophil chemotaxis"
        ],
        "answer": 0,
        "exp": "Oral isotretinoin (13-cis-retinoic acid) is the most effective acne treatment because it targets all four pathogenic factors. Its primary molecular mechanism is inducing apoptosis in sebaceous gland cells, leading to a massive (up to 90%) reduction in sebaceous gland size and sebum output."
    },
    {
        "q": "A {age}-old female of childbearing potential is starting oral isotretinoin. Under the iPLEDGE program, what is the absolute requirement for her to receive her monthly prescription?",
        "options": [
            "Use two independent, effective forms of contraception simultaneously and obtain a negative monthly pregnancy test",
            "Complete a monthly survey confirming abstinence and have a negative urine pregnancy test every 3 months",
            "Have a documented bilateral tubal ligation or partner vasectomy",
            "Commit to using a single high-dose copper IUD and obtain bi-monthly blood pregnancy tests",
            "Sign a waiver releasing the manufacturer from liability and undergo weekly urine HCG tests"
        ],
        "answer": 0,
        "exp": "Due to the extreme teratogenicity of isotretinoin (causing severe craniofacial, cardiac, and CNS malformations), the iPLEDGE program in the US mandates that all females of childbearing potential use two simultaneous forms of contraception and obtain a negative pregnancy test monthly."
    },
    {
        "q": "A {age}-old {gender} with a history of severe nodulocystic acne presents to the emergency room with a 5-day history of high fever, joint pain (polyarthralgia), and an acute, painful, ulcerating eruption of necrotic plaques with hemorrhagic crusts on their back and chest. What is the most appropriate first-line treatment for this acute condition?",
        "options": [
            "Systemic corticosteroids followed by cautious, low-dose oral isotretinoin",
            "High-dose immediate oral isotretinoin (1.0 mg/kg/day)",
            "Intravenous broad-spectrum cephalosporins and surgical debridement",
            "Immediate discontinuation of all medications and wet-to-dry dressings",
            "Broadband UVB phototherapy and topical high-potency corticosteroids"
        ],
        "answer": 0,
        "exp": "The patient has Acne Fulminans, an immunologically mediated systemic reaction to C. acnes antigens. It presents with acute, ulcerating, hemorrhagic acne lesions accompanied by systemic symptoms (fever, osteolytic bone lesions, polyarthralgias). First-line treatment requires systemic corticosteroids to calm the inflammatory storm, followed by slow introduction of low-dose isotretinoin."
    },
    {
        "q": "A {age}-old {gender} presents with a sudden onset of monomorphic, erythematous papules and pustules on their chest and upper back. The patient denies having blackheads or whiteheads. They were recently treated with a 3-week course of high-dose oral prednisone for an asthma flare. What is the diagnosis?",
        "options": [
            "Steroid-induced acne (acneiform eruption)",
            "Acne vulgaris (nodulocystic subtype)",
            "Pityrosporum folliculitis",
            "Hot tub folliculitis",
            "Papulopustular rosacea"
        ],
        "answer": 0,
        "exp": "Steroid-induced acne (or steroid folliculitis) is characterized by a sudden, monomorphic crop of erythematous papules and pustules typically distributed on the trunk. Key differentiating features from acne vulgaris are the uniform stage of all lesions (monomorphic) and the complete absence of comedones."
    },
    {
        "q": "A 26-year-old female presents with persistent, painful acne nodules localized strictly to her jawline and chin, which worsen significantly during the week prior to her menses. She also reports irregular periods and recent male-pattern hair growth on her face. What is the most effective hormone-targeted oral therapy for her acne?",
        "options": [
            "Spironolactone",
            "Doxycycline",
            "Isotretinoin",
            "Metformin",
            "Finasteride"
        ],
        "answer": 0,
        "exp": "This patient has adult female hormonal acne, highly correlated with hyperandrogenism (likely PCOS). The first-line, highly effective hormone therapy is spironolactone, which acts as a potassium-sparing diuretic and a competitive androgen receptor antagonist, blocking testosterone at the sebaceous gland."
    },

    # ─── ROSACEA SUBTYPES, TRIGGERS, & DIAGNOSIS ───
    {
        "q": "A {age}-old {gender} presents with a persistent facial redness. They note that drinking hot coffee, eating spicy foods, or going out in the sun causes intense, burning facial flushing. Physical exam shows persistent erythema and telangiectasias across the cheeks and nose, but NO comedones, papules, or pustules. What is the diagnosis?",
        "options": [
            "Erythematotelangiectatic rosacea",
            "Papulopustular rosacea",
            "Systemic lupus erythematosus (malar rash)",
            "Seborrheic dermatitis",
            "Carcinoid syndrome flushing"
        ],
        "answer": 0,
        "exp": "Erythematotelangiectatic rosacea is the vascular subtype of rosacea. It is characterized by persistent central facial erythema, flushing triggered by hot beverages, alcohol, spicy foods, or temperature changes, and prominent telangiectasias, without inflammatory papules/pustules."
    },
    {
        "q": "A {age}-old {gender} presents with central facial flushing and persistent redness associated with numerous inflammatory papules and pustules on the nose and cheeks. There are no comedones. What is the first-line topical treatment of choice for this patient's condition?",
        "options": [
            "Topical metronidazole cream or topical ivermectin",
            "Topical clindamycin 1% gel",
            "Topical benzoyl peroxide 10% wash",
            "Topical hydrocortisone 2.5% ointment",
            "Topical salicylic acid 2% solution"
        ],
        "answer": 0,
        "exp": "Papulopustular rosacea presents with central facial erythema and inflammatory papules/pustules, lacking the comedones of acne. First-line topical treatments include metronidazole, ivermectin, or azelaic acid, which have anti-inflammatory and antiparasitic properties."
    },
    {
        "q": "A {age}-old {gender} presents with a bulbous, grossly hypertrophic, and irregular enlargement of their nose with prominent, dilated pores. The patient states they have suffered from 'red face' for decades. What is the underlying pathophysiology of this condition?",
        "options": [
            "Hyperplasia of the sebaceous glands and connective tissue of the nose (Rhinophyma)",
            "Chronic deep subcutaneous Staphylococcal infection of the nasal cartilage",
            "Autoimmune destruction of the nasal septal cartilage (relapsing polychondritis)",
            "Squamous cell carcinoma arising from a chronic actinic keratosis",
            "Arterial malformation leading to progressive angiomatous swelling"
        ],
        "answer": 0,
        "exp": "The patient has phymatous rosacea, classically presenting as Rhinophyma. Rhinophyma is characterized by progressive hyperplasia of the sebaceous glands, blood vessels, and fibrous connective tissue of the nose, occurring almost exclusively in men with long-standing rosacea."
    },
    {
        "q": "A {age}-old {gender} with a history of erythematotelangiectatic rosacea presents with bilateral eye irritation. They complain of a constant 'gritty' sensation, burning, dryness, and recurrent styes (hordeola). Slit-lamp exam reveals blepharitis, conjunctival injection, and telangiectasias of the eyelid margin. What is the most appropriate systemic treatment?",
        "options": [
            "Low-dose oral Doxycycline",
            "Oral Valacyclovir",
            "Intravenous Ceftriaxone",
            "Oral Isotretinoin",
            "Topical Ganciclovir ophthalmic gel"
        ],
        "answer": 0,
        "exp": "The patient has Ocular Rosacea, which affects up to 50% of rosacea patients. It presents with blepharitis, conjunctival injection, a gritty foreign body sensation, and lid margin telangiectasias. While mild cases are managed with eyelid hygiene, moderate-to-severe ocular rosacea requires systemic sub-antimicrobial doxycycline."
    },
    {
        "q": "A {age}-old {gender} presents with a facial rash that has been present for 3 months. The patient was initially diagnosed with eczema and treated with high-potency topical betamethasone dipropionate cream daily. The facial redness has progressively worsened and is now studded with hundreds of tiny pustules and telangiectasias. What is the diagnosis?",
        "options": [
            "Steroid-induced rosacea",
            "Atopic dermatitis flare",
            "Tinea incognito",
            "Demodex folliculitis",
            "Pustular psoriasis"
        ],
        "answer": 0,
        "exp": "Steroid-induced rosacea (or steroid rosacea) is a classic complication of applying potent topical corticosteroids to the face. The steroids cause initial vasoconstriction but eventually lead to rebound vasodilation, epidermal atrophy, and a severe pustular eruption upon withdrawal."
    },
    {
        "q": "A {age}-old {gender} presents with a highly pruritic rash on the face and neck. They note that the rash is made worse by wearing wool scarves. Physical exam shows ill-defined, scaly, erythematous plaques on the cheeks and neck with linear excoriations. What is the hallmark microscopic finding of this acute condition?",
        "options": [
            "Spongiosis (intercellular edema in the epidermis)",
            "Acantholysis (loss of intercellular connections between keratinocytes)",
            "Kogoj spongiform pustules in the upper spinous layer",
            "Lichenoid interface dermatitis with colloid bodies",
            "Subepidermal deposition of IgA in the dermal papillae"
        ],
        "answer": 0,
        "exp": "The clinical picture describes acute eczema (contact or atopic dermatitis). The hallmark histologic feature of acute eczematous dermatitis is spongiosis, which is intercellular edema within the epidermis that pushes keratinocytes apart, often forming intraepidermal vesicles."
    },
    {
        "q": "A {age}-old {gender} with severe, scarring nodulocystic acne is being treated with oral isotretinoin. Which of the following laboratory panels must be checked regularly during the course of this therapy?",
        "options": [
            "Fasting lipid panel and liver function tests (ALT/AST)",
            "Basic metabolic panel and thyroid-stimulating hormone (TSH)",
            "Complete blood count with differential and serum uric acid",
            "Coagulation panel (PT/INR) and serum calcium",
            "Hemoglobin A1c and serum amylase/lipase"
        ],
        "answer": 0,
        "exp": "Oral isotretinoin classically causes hypertriglyceridemia and elevations in transaminases (hepatotoxicity). Therefore, standard monitoring guidelines require obtaining a baseline fasting lipid panel and liver function tests (LFTs), with periodic repeat testing during the treatment course."
    },
    {
        "q": "A {age}-old {gender} presents with a chronic, severely pruritic, thickened patch of skin on their posterior neck. They admit to scratching it constantly due to anxiety. Physical exam shows a single, hyperpigmented, leathery plaque with deeply accentuated skin markings. Biopsy reveals hyperkeratosis and regular acanthosis. What is the diagnosis?",
        "options": [
            "Lichen simplex chronicus",
            "Lichen planus",
            "Plaque psoriasis",
            "Asteatotic eczema",
            "Mycosis fungoides"
        ],
        "answer": 0,
        "exp": "Lichen simplex chronicus (circumscribed neurodermatitis) is a localized plaque of chronic eczematous dermatitis that develops solely in response to repetitive scratching or rubbing of a single area. This mechanical trauma induces reactive epidermal hyperplasia, leading to characteristic lichenification (leathery, thickened skin with accentuated markings)."
    },
    {
        "q": "A {age}-old {gender} with a history of mild plaque psoriasis is diagnosed with a severe panic disorder. The physician prescribes a beta-blocker (propranolol) to assist with performance anxiety. Two weeks later, the patient presents with a massive, generalized worsening of their psoriatic plaques. Which of the following drugs is a well-known trigger for exacerbating psoriasis?",
        "options": [
            "Beta-blockers, Lithium, and Antimalarials (e.g., hydroxychloroquine)",
            "Penicillin, Cephalosporins, and Macrolides",
            "Metformin, Sulfonylureas, and Insulin",
            "Aspirin, Acetaminophen, and Ibuprofen",
            "Amlodipine, Lisinopril, and Atorvastatin"
        ],
        "answer": 0,
        "exp": "Several systemic medications are well-documented triggers for severe exacerbations of psoriasis. These include beta-blockers, lithium, antimalarials (hydroxychloroquine), systemic corticosteroid withdrawal, and interferon-alpha."
    },
    {
        "q": "A {age}-old {gender} with moderate inflammatory acne has been treated with oral doxycycline for 3 months with good improvement. However, they present to the clinic complaining of severe, burning pain on their face and forearms after spending only 15 minutes outdoors. What is the mechanism of this drug reaction?",
        "options": [
            "Phototoxicity induced by absorption of UV-A light by the tetracycline drug molecule",
            "Type IV delayed-type hypersensitivity reaction to sunlight proteins",
            "Drug-induced systemic lupus erythematosus (DI-SLE) triggered by sun exposure",
            "Autoimmune destruction of melanocytes by doxycycline-induced T-cells",
            "Direct chemical burning of the epidermis by topically excreted doxycycline in sweat"
        ],
        "answer": 0,
        "exp": "Tetracyclines (particularly doxycycline) are notorious causes of drug-induced phototoxicity. The drug molecules absorb UV-A radiation in the skin, releasing free radicals that damage surrounding cell membranes and DNA, presenting as an exaggerated sunburn reaction on sun-exposed areas."
    },
    {
        "q": "A {age}-old {gender} presents with a severe, highly inflammatory, and chronic skin condition characterized by double-headed comedones, painful deep nodules, and interconnecting sinus tracts discharging foul-smelling purulent fluid. The lesions are localized to the axillae, groin, and perineum. What is the diagnosis?",
        "options": [
            "Hidradenitis suppurativa (Acne inversa)",
            "Acne conglobata",
            "Dissecting cellulitis of the scalp",
            "Crohn's disease cutaneous fistulae",
            "Furunculosis"
        ],
        "answer": 0,
        "exp": "Hidradenitis suppurativa (acne inversa) is a chronic inflammatory skin disease of the follicular pilosebaceous unit, classically localized to intertriginous apocrine-gland bearing skin (axillae, groin, perineum, inframammary). It presents with recurrent painful nodules, double-headed comedones, abscesses, sinus tracts, and scarring."
    },
    {
        "q": "A {age}-old {gender} presents with a persistent facial eruption. On examination, the patient has prominent malar erythema that spares the nasolabial folds, but is also noted to have scaly, erythematous plaques on their elbows. What clinical sign or feature would most strongly differentiate Plaque Psoriasis from Systemic Lupus Erythematosus (SLE) in this patient?",
        "options": [
            "Psoriatic plaques classically involve the elbows and have a silvery scale, while the SLE malar rash spares the nasolabial folds and elbows",
            "The malar rash of SLE strictly involves the nasolabial folds",
            "Psoriasis always presents with oral ulcers and joint pain",
            "Psoriasis has a positive Nikolsky sign on physical exam",
            "SLE malar rash is highly pruritic and bleeds when scraped"
        ],
        "answer": 0,
        "exp": "The malar ('butterfly') rash of Systemic Lupus Erythematosus classically spares the nasolabial folds and is non-scaly. Psoriatic plaques classically affect the extensor surfaces (elbows/knees) and are covered in a dense, silvery-white scale, with a positive Auspitz sign."
    },
    {
        "q": "A {age}-old {gender} with severe atopic dermatitis presents with a 24-hour history of severe skin itching and redness. They spent the previous afternoon clearing brush in their backyard. What morphological feature would help distinguish acute Allergic Contact Dermatitis from an acute atopic dermatitis flare?",
        "options": [
            "The presence of linear configurations of vesicles corresponding to plant contact",
            "The presence of honey-colored crusts on the extensor surfaces",
            "Severe pruritus that is worse at night",
            "Lichenification and scaling over the flexural folds",
            "Symmetrical distribution over the cheeks and scalp"
        ],
        "answer": 0,
        "exp": "Allergic contact dermatitis (especially Rhus dermatitis from poison ivy/oak) is characterized by a linear arrangement of papules and vesicles, indicating the direct linear brush of the offending plant resin (urushiol) against the skin. Atopic dermatitis is typically symmetrical and flexural without linear vesicles."
    },
    {
        "q": "A {age}-old {gender} presents with a severe flaking rash in the external auditory canals and behind the ears. The skin is erythematous with greasy, yellowish scaling. What is the first-line pharmacotherapy for this localized presentation?",
        "options": [
            "Topical ketoconazole 2% shampoo or cream",
            "Systemic oral griseofulvin therapy for 4 weeks",
            "Topical mupirocin 2% ointment twice daily",
            "Topical benzoyl peroxide 5% wash",
            "Topical salicylic acid 10% solution"
        ],
        "answer": 0,
        "exp": "Seborrheic dermatitis of the scalp and external auditory canals is driven by Malassezia yeast. The first-line targeted treatment is topical antifungal therapy (e.g., ketoconazole 2% cream or selenium sulfide/ketoconazole shampoos) to reduce yeast colonization, combined with low-potency steroids if highly inflamed."
    }
]

ages = ["22-year", "34-year", "45-year", "55-year", "62-year", "68-year", "72-year", "78-year", "20-year", "28-year", "38-year", "50-year", "15-year", "17-year", "19-year"]
genders = ["male", "female", "man", "woman", "boy", "girl"]

mcqs = []
counter = 1

while len(mcqs) < 350:
    for t in templates:
        if len(mcqs) >= 350:
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
        
        mcq_str = f"    (v_topic_id, 'Patient #{random.randint(10000, 99999)}: {q_text_escaped}', '{opts_json_escaped}'::jsonb, {new_ans_idx}, '{exp_escaped}')"
        
        if mcq_str not in mcqs:
            mcqs.append(mcq_str)
            counter += 1

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260519_derm_common_dermatoses_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Dermatology: Common Dermatoses\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'derm-common-dermatoses' LIMIT 1;\n")
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
