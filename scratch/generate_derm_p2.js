module.exports = [
  {
    title: "The Target Lesion",
    scenario: "A 25-year-old male presents with a sudden rash on his hands and arms. He had a cold sore on his lip one week ago.\n\nVitals: Normal.\nPhysical Examination: Multiple 'target' or 'iris' lesions on the palms, forearms, and soles. They consist of a dusky central blister, a pale ring of edema, and an erythematous halo. The oral mucosa is spared.\nLaboratory Results: None.",
    disease: "Erythema Multiforme (EM) Minor",
    questions: [
      {
        q: "What is the most common infectious trigger for Erythema Multiforme?",
        options: ["Mycoplasma pneumoniae", "Herpes Simplex Virus (HSV)", "Streptococcus pyogenes", "Staphylococcus aureus"],
        ans: 1,
        exp: "Over 90% of EM cases are triggered by a preceding HSV infection."
      },
      {
        q: "What morphological feature is an absolute requirement for the diagnosis of classic Erythema Multiforme?",
        options: ["Pustules", "The 3-zone target lesion", "Silvery scale", "Black comedones"],
        ans: 1,
        exp: "The target lesion represents cell-mediated immune destruction of the epidermis (the dark center is necrotic skin)."
      },
      {
        q: "How does EM 'Minor' clinically differ from EM 'Major'?",
        options: ["EM minor affects the trunk", "EM Minor lacks significant mucosal involvement (mouth, eyes, genitals) and has no systemic symptoms, whereas EM Major involves at least one mucosal surface", "EM minor is caused by drugs", "EM minor leaves scars"],
        ans: 1,
        exp: "Mucosal involvement is the key distinguishing factor."
      }
    ]
  },
  {
    title: "The Sloughing Skin",
    scenario: "A 40-year-old woman was started on Allopurinol 2 weeks ago for gout. She presents to the ER with high fever, sore throat, and severe eye pain. Her skin is exquisitely painful to touch.\n\nVitals: T 39.5 C, HR 120.\nPhysical Examination: Widespread dusky erythematous macules that coalesce into flaccid blisters. Gently rubbing the normal-appearing skin causes the epidermis to shear off completely. Severe hemorrhagic crusting of the lips and conjunctivitis are present.\nLaboratory Results: Skin biopsy shows full-thickness epidermal necrosis.",
    disease: "Stevens-Johnson Syndrome (SJS)",
    questions: [
      {
        q: "What is the clinical sign demonstrated by rubbing the skin and causing it to shear off?",
        options: ["Auspitz sign", "Nikolsky sign", "Koebner phenomenon", "Darier sign"],
        ans: 1,
        exp: "A positive Nikolsky sign indicates that the intraepidermal adhesion is completely destroyed, allowing the top layer of skin to slip off with slight friction."
      },
      {
        q: "What is the defining threshold that separates Stevens-Johnson Syndrome (SJS) from Toxic Epidermal Necrolysis (TEN)?",
        options: ["The type of drug", "SJS involves <10% of the body surface area (BSA) detachment; TEN involves >30% BSA detachment (10-30% is SJS/TEN overlap)", "The presence of mucosal lesions", "The presence of fever"],
        ans: 1,
        exp: "They are the same disease spectrum (massive drug-induced apoptosis of keratinocytes), graded by the percentage of skin lost."
      },
      {
        q: "What class of medications is the most notorious trigger for SJS/TEN?",
        options: ["Antihistamines", "Anticonvulsants (Carbamazepine, Lamotrigine), Allopurinol, Sulfa antibiotics, and NSAIDs", "Beta-blockers", "Statins"],
        ans: 1,
        exp: "These specific drugs are extreme high-risk triggers."
      }
    ]
  },
  {
    title: "The Blistering Elderly Man",
    scenario: "An 80-year-old man presents with severe itching and large blisters on his abdomen and thighs. He feels otherwise well.\n\nVitals: Normal.\nPhysical Examination: Numerous large, tense, thick-roofed bullae on an erythematous base located on the lower trunk and flexural thighs. Nikolsky sign is NEGATIVE. Mucous membranes are clear.\nLaboratory Results: Direct immunofluorescence (DIF) shows linear IgG and C3 deposited along the basement membrane zone.",
    disease: "Bullous Pemphigoid",
    questions: [
      {
        q: "Why are the blisters in Bullous Pemphigoid described as 'tense' and why is the Nikolsky sign negative?",
        options: ["The fluid is very thick", "The split occurs DEEP in the skin, at the dermoepidermal junction (subepidermal), meaning the entire thickness of the epidermis forms a strong roof over the blister", "They are viral", "They are small"],
        ans: 1,
        exp: "Subepidermal blisters don't rupture easily."
      },
      {
        q: "What are the specific autoantibodies in Bullous Pemphigoid targeting?",
        options: ["Desmoglein 1 and 3", "Hemidesmosomes (BP180 and BP230 antigens), which anchor the basal keratinocytes to the basement membrane", "Transglutaminase", "Nuclear antigens"],
        ans: 1,
        exp: "Destroying the hemidesmosome unzips the epidermis from the dermis."
      },
      {
        q: "What is the initial treatment of choice for localized Bullous Pemphigoid?",
        options: ["Oral antibiotics", "High-potency topical corticosteroids (e.g., Clobetasol) to shut down local inflammation", "IVIG", "Surgery"],
        ans: 1,
        exp: "Topical steroids are surprisingly effective even for widespread disease and carry less mortality risk than systemic steroids in the elderly."
      }
    ]
  },
  {
    title: "The Painful Mouth",
    scenario: "A 50-year-old woman presents with severe mouth pain and weight loss because she cannot eat. Over the past month, she developed painful sores on her chest.\n\nVitals: Normal.\nPhysical Examination: Extensive, painful erosions on the buccal mucosa and palate. The chest shows flaccid, easily ruptured blisters that leave raw, weeping, painful erosions. Nikolsky sign is strongly POSITIVE.\nLaboratory Results: DIF shows intercellular IgG deposition in a 'chicken wire' pattern throughout the epidermis.",
    disease: "Pemphigus Vulgaris",
    questions: [
      {
        q: "Why are the blisters in Pemphigus Vulgaris flaccid and easily ruptured (positive Nikolsky)?",
        options: ["They are filled with acid", "The split occurs SHALLOW within the epidermis (intraepidermal) just above the basal layer, so the roof of the blister is incredibly thin and fragile", "They are subepidermal", "They are infectious"],
        ans: 1,
        exp: "The blister roof is only a few cell layers thick, so it pops almost immediately, leaving painful erosions."
      },
      {
        q: "What specific adhesion structures are the autoantibodies targeting in Pemphigus Vulgaris?",
        options: ["Hemidesmosomes", "Desmosomes (specifically Desmoglein 1 and 3), which glue adjacent keratinocytes together", "Basement membrane", "Collagen"],
        ans: 1,
        exp: "When the desmosomes are destroyed, the keratinocytes fall apart from each other (acantholysis)."
      },
      {
        q: "Historically, before the invention of systemic corticosteroids and immunosuppressants (like Rituximab), what was the mortality rate of Pemphigus Vulgaris?",
        options: ["10%", "Near 100% due to massive fluid loss and fatal sepsis from the raw, open skin", "0%", "50%"],
        ans: 1,
        exp: "It is an inherently fatal disease without aggressive systemic immunosuppression."
      }
    ]
  },
  {
    title: "The Gluten Itch",
    scenario: "A 35-year-old male with chronic diarrhea and bloating presents with an excruciatingly itchy rash on his elbows, knees, and buttocks.\n\nVitals: Normal.\nPhysical Examination: Symmetrically distributed, severely excoriated grouped papules and tiny vesicles on the extensor surfaces of the elbows, knees, and buttocks.\nLaboratory Results: Skin biopsy with DIF shows granular IgA deposits in the tips of the dermal papillae.",
    disease: "Dermatitis Herpetiformis",
    questions: [
      {
        q: "Dermatitis Herpetiformis is the cutaneous manifestation of what underlying systemic disease?",
        options: ["Crohn's disease", "Celiac Disease (Gluten-sensitive enteropathy)", "Ulcerative Colitis", "Rheumatoid Arthritis"],
        ans: 1,
        exp: "Almost all patients with DH have histologic evidence of celiac disease, even if they have no GI symptoms."
      },
      {
        q: "What is the target antigen that the IgA antibodies are attacking in the skin?",
        options: ["Desmoglein", "Epidermal Transglutaminase (which is highly homologous to tissue transglutaminase in the gut)", "Hemidesmosomes", "Collagen VII"],
        ans: 1,
        exp: "The body makes antibodies against the gut enzyme handling gluten, and these antibodies cross-react with a similar enzyme in the skin."
      },
      {
        q: "While a strict gluten-free diet is the definitive long-term cure, what oral medication provides rapid (within 24-48 hours) relief of the severe itching?",
        options: ["Prednisone", "Dapsone", "Antihistamines", "Ibuprofen"],
        ans: 1,
        exp: "Dapsone shuts down the massive neutrophilic inflammation in the dermal papillae almost instantly."
      }
    ]
  },
  {
    title: "The Vancomycin Blisters",
    scenario: "A 60-year-old man hospitalized for MRSA pneumonia has been receiving IV Vancomycin for 10 days. He suddenly develops a widespread, itchy, blistering rash.\n\nVitals: Normal.\nPhysical Examination: Numerous tense bullae arranged in an annular (ring-like) fashion, resembling a 'string of pearls' or 'crown of jewels', primarily on the trunk.\nLaboratory Results: DIF shows a linear band of IgA deposited strictly along the basement membrane.",
    disease: "Linear IgA Bullous Dermatosis (LABD)",
    questions: [
      {
        q: "What is the diagnosis?",
        options: ["Bullous pemphigoid", "Linear IgA Bullous Dermatosis", "Dermatitis herpetiformis", "Erythema multiforme"],
        ans: 1,
        exp: "The 'string of pearls' clinical appearance and the linear IgA on immunofluorescence are diagnostic."
      },
      {
        q: "While LABD can be idiopathic, what is the most notorious medication trigger, as seen in this patient?",
        options: ["Penicillin", "Vancomycin", "Aspirin", "Prednisone"],
        ans: 1,
        exp: "Drug-induced LABD almost always resolves quickly upon stopping the offending drug."
      },
      {
        q: "How does the immunofluorescence pattern of LABD differ from Dermatitis Herpetiformis (DH)?",
        options: ["There is no difference", "LABD has a LINEAR band of IgA along the basement membrane, whereas DH has GRANULAR deposits of IgA in the dermal papillae", "LABD is IgG", "LABD is IgM"],
        ans: 1,
        exp: "They are both IgA-mediated diseases, but the antibody target and deposition pattern are entirely different."
      }
    ]
  },
  {
    title: "The Herald Patch",
    scenario: "A 22-year-old otherwise healthy male presents with a rash on his trunk that started 2 weeks ago as a single, large, scaly red spot on his chest. Yesterday, hundreds of smaller spots appeared.\n\nVitals: Normal.\nPhysical Examination: A single 4cm erythematous plaque with a collarette of scale on the chest. The back is covered in numerous 1cm oval, salmon-colored scaly papules arranged along the skin tension lines in a 'Christmas tree' pattern.\nLaboratory Results: RPR is negative.",
    disease: "Pityriasis Rosea",
    questions: [
      {
        q: "What is the name of the initial, large 4cm plaque that preceded the widespread eruption?",
        options: ["Auspitz patch", "The Herald Patch", "The Mother plaque", "The Primary chancre"],
        ans: 1,
        exp: "The herald patch is a classic finding that occurs 1-2 weeks before the secondary generalized eruption."
      },
      {
        q: "Why was an RPR (Rapid Plasma Reagin) test drawn in this patient?",
        options: ["To check for HIV", "To strictly rule out Secondary Syphilis, which can look completely identical to Pityriasis Rosea (including a 'herald patch' primary chancre)", "To check for lupus", "To check for Lyme disease"],
        ans: 1,
        exp: "Secondary syphilis is 'the great imitator' and must always be ruled out in a new-onset, widespread papulosquamous eruption."
      },
      {
        q: "What is the appropriate treatment for Pityriasis Rosea?",
        options: ["Oral antibiotics", "Reassurance; it is a benign, self-limiting (likely viral) eruption that completely resolves on its own in 6-8 weeks", "Oral steroids", "Topical antifungals"],
        ans: 1,
        exp: "It requires no treatment other than symptom management for itching."
      }
    ]
  },
  {
    title: "The Purple Wrists",
    scenario: "A 45-year-old female presents with intensely itchy wrists and ankles. She rubs the lesions instead of scratching them because scratching hurts.\n\nVitals: Normal.\nPhysical Examination: Flat-topped, polygonal, purple, intensely pruritic papules located on the flexor surfaces of the wrists and the ankles. Close inspection reveals a fine network of white lines on the surface of the papules. The buccal mucosa shows similar white, lacy patches.\nLaboratory Results: Hepatitis C antibody is positive.",
    disease: "Lichen Planus",
    questions: [
      {
        q: "What are the classic '6 Ps' of Lichen Planus?",
        options: ["Pink, Pustular, Painful, Pitted, Patchy, Pruritic", "Planar (flat-topped), Purple, Polygonal, Pruritic, Papules, and Plaques", "Pale, Purulent, Papillary, Pitted, Peeling, Painful", "None"],
        ans: 1,
        exp: "This morphologic description perfectly captures the unique look of Lichen Planus."
      },
      {
        q: "What is the name of the fine, white, lacy network seen on the surface of the papules and in the mouth?",
        options: ["Auspitz lines", "Wickham Striae", "Koebner lines", "Meess lines"],
        ans: 1,
        exp: "Wickham striae represent focal hypergranulosis in the epidermis."
      },
      {
        q: "Lichen Planus has a well-documented epidemiological association with what systemic viral infection?",
        options: ["HIV", "Hepatitis C Virus (HCV)", "Herpes Simplex", "HPV"],
        ans: 1,
        exp: "Especially in certain geographic areas, patients presenting with widespread Lichen Planus should be screened for Hepatitis C."
      }
    ]
  },
  {
    title: "The Islands of Sparing",
    scenario: "A 55-year-old man presents with a rapidly spreading, orange-red scaly rash that started on his head and moved downward. His palms and soles are incredibly thick and yellow.\n\nVitals: Normal.\nPhysical Examination: Diffuse orange-red scaling erythroderma covering the trunk. Embedded within the vast sheets of red skin are sharply demarcated, totally normal-looking patches of pale skin. The palms and soles exhibit waxy, orange-red keratoderma.\nLaboratory Results: None.",
    disease: "Pityriasis Rubra Pilaris (PRP)",
    questions: [
      {
        q: "What is the classic, pathognomonic physical exam finding described in this scenario?",
        options: ["Christmas tree pattern", "'Islands of sparing' (sharply demarcated areas of totally normal, unaffected skin amidst the erythroderma)", "Target lesions", "Honey crusts"],
        ans: 1,
        exp: "PRP typically presents in a cephalocaudal (head-to-toe) spread, leaving classic islands of completely normal skin behind."
      },
      {
        q: "What finding on the fingers is highly characteristic of PRP?",
        options: ["Pitting", "Follicular hyperkeratosis (tiny, spiky, rough cones) on the dorsal aspects of the proximal phalanges ('nutmeg grater' papules)", "Clubbing", "Splinter hemorrhages"],
        ans: 1,
        exp: "The 'rubra pilaris' refers to redness around the hair follicles."
      },
      {
        q: "How does the palmar/plantar involvement in PRP differ from psoriasis?",
        options: ["It doesn't", "PRP causes a diffuse, waxy, orange-red thickening (keratoderma), whereas psoriasis usually causes discrete, silvery-scaly plaques", "PRP only affects the nails", "PRP causes blisters"],
        ans: 1,
        exp: "The thick, orange, waxy palms are a major diagnostic clue."
      }
    ]
  },
  {
    title: "The Ring of Bumps",
    scenario: "A 12-year-old girl is brought in by her mother for a 'ringworm' on her foot that hasn't responded to OTC antifungal cream for 3 months. It is not itchy or scaly.\n\nVitals: Normal.\nPhysical Examination: A 3cm annular (ring-shaped) plaque on the dorsal foot. The border consists of firm, smooth, flesh-colored to slightly erythematous papules. The center of the ring is slightly depressed and completely lacks any scale.\nLaboratory Results: KOH is negative.",
    disease: "Granuloma Annulare",
    questions: [
      {
        q: "How does the physical exam quickly rule out Tinea Corporis (ringworm)?",
        options: ["It is the wrong color", "There is absolutely NO scale on the leading edge of Granuloma Annulare; Tinea corporis ALWAYS has a scaly advancing border", "It is on the foot", "It is a ring"],
        ans: 1,
        exp: "Fungal infections live in the stratum corneum, so they must produce scale. Granuloma Annulare is a disease deep in the dermis."
      },
      {
        q: "What is the underlying pathophysiology of Granuloma Annulare?",
        options: ["Fungal infection", "A localized, benign granulomatous inflammation in the dermis surrounding a zone of altered collagen (necrobiosis)", "Viral infection", "Cancer"],
        ans: 1,
        exp: "It is an immune reaction causing collagen degradation."
      },
      {
        q: "What is the typical clinical course and recommended treatment for localized Granuloma Annulare in a child?",
        options: ["Oral antibiotics", "Reassurance; the majority of localized cases spontaneously resolve over 1-2 years without any treatment", "Surgical excision", "Chemotherapy"],
        ans: 1,
        exp: "It is entirely benign. Topical or intralesional steroids can be used if cosmetically bothersome."
      }
    ]
  },
  {
    title: "The Tender Shins",
    scenario: "A 28-year-old female presents with fever, malaise, and extremely painful bumps on her lower legs. She recently started taking oral contraceptive pills.\n\nVitals: T 38.0 C.\nPhysical Examination: Bilateral anterior shins exhibit multiple, poorly demarcated, deep-seated, incredibly tender, warm, erythematous nodules resembling deep bruises. There is no ulceration.\nLaboratory Results: ESR is 85.",
    disease: "Erythema Nodosum",
    questions: [
      {
        q: "What anatomic layer of the skin is inflamed in Erythema Nodosum?",
        options: ["Epidermis", "The subcutaneous fat (a septal panniculitis without vasculitis)", "The dermis", "The fascia"],
        ans: 1,
        exp: "Because the inflammation is deep in the fat, the lesions are felt more than they are seen, appearing as deep, bruised nodules rather than superficial plaques."
      },
      {
        q: "Erythema Nodosum is a delayed hypersensitivity reaction. What is a very common infectious trigger in young adults?",
        options: ["Staph aureus", "Streptococcal pharyngitis (Group A Strep)", "HIV", "Malaria"],
        ans: 1,
        exp: "Like Guttate Psoriasis, EN is often triggered by a recent Strep throat infection."
      },
      {
        q: "Besides Strep, drugs (OCPs), and pregnancy, what underlying systemic inflammatory disease must be strongly suspected and screened for (via chest X-ray)?",
        options: ["Lupus", "Sarcoidosis (Lofgren's syndrome presents with EN, bilateral hilar lymphadenopathy, and arthritis)", "Rheumatoid arthritis", "Multiple sclerosis"],
        ans: 1,
        exp: "A chest X-ray is mandatory in the workup of unexplained Erythema Nodosum."
      }
    ]
  },
  {
    title: "The Fever and Plaques",
    scenario: "A 45-year-old woman with a history of Acute Myeloid Leukemia (AML) presents with sudden onset of high fever and painful skin lesions.\n\nVitals: T 39.5 C, HR 110.\nPhysical Examination: Face, neck, and upper arms show sharply demarcated, juicy, edematous, erythematous plaques that appear almost vesicular (pseudovesicular) but are solid to the touch.\nLaboratory Results: WBC 25,000 (90% neutrophils). Skin biopsy shows a massive, dense infiltrate of neutrophils in the upper dermis with severe edema, but NO vasculitis.",
    disease: "Sweet Syndrome (Acute Febrile Neutrophilic Dermatosis)",
    questions: [
      {
        q: "What is the diagnosis?",
        options: ["Cellulitis", "Sweet Syndrome", "Erythema multiforme", "Psoriasis"],
        ans: 1,
        exp: "The triad of fever, neutrophilia, and juicy/painful pseudovesicular plaques is classic for Sweet syndrome."
      },
      {
        q: "Why do the plaques look like blisters (pseudovesicular) but feel solid?",
        options: ["They are filled with pus", "Massive edema (fluid) in the upper dermis elevates the epidermis to look like a blister, but it is just severely swollen solid tissue", "They are calluses", "They are tumors"],
        ans: 1,
        exp: "This is a hallmark morphologic feature of the disease."
      },
      {
        q: "Because this is an intensely inflammatory, non-infectious neutrophilic disease, what is the highly effective, rapid treatment of choice?",
        options: ["IV Vancomycin", "Systemic corticosteroids (e.g., oral prednisone); patients improve dramatically within 24-48 hours", "Surgery", "Antifungals"],
        ans: 1,
        exp: "Antibiotics will do nothing; steroids turn off the massive neutrophilic storm."
      }
    ]
  },
  {
    title: "The Expanding Ulcer",
    scenario: "A 35-year-old man with a long history of Crohn's disease presents with an ulcer on his leg. He states it started as a small 'pimple' a week ago after he bumped his leg on a table, and rapidly grew into a massive, agonizingly painful hole.\n\nVitals: Normal.\nPhysical Examination: A 10 cm ulcer on the left calf. The ulcer has a purulent, necrotic base and an exquisitely painful, undermined, violaceous (purple) border.\nLaboratory Results: Bacterial cultures of the ulcer are completely sterile.",
    disease: "Pyoderma Gangrenosum",
    questions: [
      {
        q: "What is the diagnosis?",
        options: ["Necrotizing fasciitis", "Pyoderma Gangrenosum (PG)", "Stasis ulcer", "Arterial ulcer"],
        ans: 1,
        exp: "PG is a severe, destructive, sterile neutrophilic dermatosis that classically presents as a rapidly expanding, agonizingly painful ulcer with an undermined purple border."
      },
      {
        q: "What is the term for the phenomenon where the ulcer began exactly at the site of minor skin trauma (bumping his leg)?",
        options: ["Auspitz sign", "Pathergy", "Nikolsky sign", "Darier sign"],
        ans: 1,
        exp: "Pathergy is an exaggerated inflammatory response to minor trauma, leading to tissue destruction. It is a hallmark of PG."
      },
      {
        q: "Given the phenomenon of pathergy, what common medical procedure is absolutely CONTRAINDICATED in the management of this ulcer?",
        options: ["Steroid injections", "Surgical debridement; cutting the tissue will trigger massive pathergy and cause the ulcer to rapidly expand and worsen", "Applying bandages", "Taking cultures"],
        ans: 1,
        exp: "You cannot cut out Pyoderma Gangrenosum; it must be treated medically with systemic immunosuppressants (steroids, cyclosporine, or biologics)."
      }
    ]
  },
  {
    title: "The Hand Eczema",
    scenario: "A 28-year-old healthcare worker presents with severe, painful, dry, cracked skin on her hands. She washes her hands up to 50 times a shift and uses alcohol sanitizer constantly.\n\nVitals: Normal.\nPhysical Examination: The dorsal and palmar aspects of both hands are severely erythematous, fissured, scaling, and lichenified. The web spaces are heavily involved.\nLaboratory Results: None.",
    disease: "Occupational Hand Eczema (Irritant Contact)",
    questions: [
      {
        q: "What is the primary underlying cause of this patient's hand eczema?",
        options: ["Allergy to latex", "Chronic cumulative irritant contact dermatitis from repetitive exposure to water, soap, and alcohol, stripping the epidermal lipid barrier", "Fungal infection", "Autoimmune disease"],
        ans: 1,
        exp: "Water and soap are potent irritants when used in massive excess."
      },
      {
        q: "Why is Irritant Contact Dermatitis far more common in the finger web spaces than on the palms?",
        options: ["There are more nerves there", "Soap and water get trapped in the web spaces beneath rings, while the thick stratum corneum of the palms provides better natural protection", "There is no hair there", "There are more sweat glands"],
        ans: 1,
        exp: "The thin skin of the webs is highly susceptible to trapped irritants."
      },
      {
        q: "What is an essential behavioral modification, alongside topical steroids and thick emollients, for managing occupational hand eczema?",
        options: ["Stop working forever", "Washing with lukewarm (not hot) water, drying hands completely, and wearing cotton-lined gloves during wet work to prevent the irritant exposure", "Using more hand sanitizer", "Only washing with bleach"],
        ans: 1,
        exp: "If the barrier continues to be stripped daily, medical therapy will fail."
      }
    ]
  },
  {
    title: "The Hair Loss and Red Face",
    scenario: "A 25-year-old African American female presents with a rash on her face that gets worse in the sun. She also notes severe fatigue, joint pain in her hands, and patches of hair loss on her scalp.\n\nVitals: Normal.\nPhysical Examination: An erythematous, sharply defined, scaly plaque over the bridge of the nose and bilateral cheeks, sparing the nasolabial folds (Malar rash). The scalp has scarred, bald patches with follicular plugging (Discoid lupus).\nLaboratory Results: ANA is positive at 1:1280. Anti-dsDNA is positive.",
    disease: "Systemic Lupus Erythematosus (SLE) - Cutaneous manifestations",
    questions: [
      {
        q: "What is the classic physical exam feature of the acute cutaneous lupus 'Malar rash' that heavily distinguishes it from facial Rosacea or Seborrheic Dermatitis?",
        options: ["It has pustules", "It strictly SPARES the nasolabial folds, whereas seborrheic dermatitis specifically targets them", "It only affects the chin", "It has blackheads"],
        ans: 1,
        exp: "The malar 'butterfly' rash sits high on the cheeks and nose, leaving the deep creases around the mouth clear."
      },
      {
        q: "What type of alopecia is caused by Discoid Lupus Erythematosus (DLE) lesions on the scalp?",
        options: ["Non-scarring", "Scarring (Cicatricial) alopecia; the intense dermal inflammation permanently destroys the hair follicles", "Telogen effluvium", "Alopecia areata"],
        ans: 1,
        exp: "Once the follicle is replaced by a scar, the hair will never grow back."
      },
      {
        q: "What is a universally essential preventative measure for all patients with cutaneous lupus?",
        options: ["Eating more meat", "Aggressive, daily, broad-spectrum sun protection (sunscreen/clothing), as ultraviolet radiation is a massive trigger for both skin lesions and systemic flares", "Avoiding water", "Using tanning beds"],
        ans: 1,
        exp: "UV light induces keratinocyte apoptosis, releasing nuclear antigens and driving the autoimmune loop."
      }
    ]
  },
  {
    title: "The Thickened Knuckles",
    scenario: "A 50-year-old woman presents with profound muscle weakness. She cannot raise her arms to comb her hair or stand up from a chair without using her hands. She also has a rash on her hands and face.\n\nVitals: Normal.\nPhysical Examination: Violaceous (heliotrope) erythema of the upper eyelids with periorbital edema. The dorsal aspects of the metacarpophalangeal (MCP) and interphalangeal joints show flat-topped, violaceous papules.\nLaboratory Results: Creatine kinase (CK) is massively elevated.",
    disease: "Dermatomyositis",
    questions: [
      {
        q: "What is the classic name for the violaceous papules over the knuckles described in this patient?",
        options: ["Heberden nodes", "Gottron papules (pathognomonic for dermatomyositis)", "Osler nodes", "Janeway lesions"],
        ans: 1,
        exp: "These papules strictly overlie the bony prominences of the joints."
      },
      {
        q: "How does the distribution of the hand rash in Dermatomyositis differ from Systemic Lupus Erythematosus (SLE)?",
        options: ["There is no difference", "Dermatomyositis targets the skin OVER the joints (knuckles), while SLE classically targets the skin BETWEEN the joints (interphalangeal skin), sparing the knuckles", "Dermatomyositis only affects the palms", "SLE only affects the nails"],
        ans: 1,
        exp: "This is a critical, high-yield clinical distinction on physical exam."
      },
      {
        q: "In an adult patient presenting with new-onset Dermatomyositis, what underlying condition MUST be aggressively screened for?",
        options: ["Heart disease", "An occult internal malignancy (e.g., ovarian, lung, GI, or breast cancer); it is frequently a paraneoplastic syndrome in adults", "Diabetes", "HIV"],
        ans: 1,
        exp: "Up to 25% of adult dermatomyositis cases are paraneoplastic."
      }
    ]
  },
  {
    title: "The Hard Skin",
    scenario: "A 40-year-old woman complains that her fingers turn white, then blue, then red when she goes out in the cold. Over the last year, she noticed the skin on her hands and face is becoming incredibly tight. She cannot open her mouth fully.\n\nVitals: BP 160/100.\nPhysical Examination: The skin of the fingers is thickened, shiny, and firmly bound down to the underlying tissue (sclerodactyly). The face is tight and expressionless, with radial furrowing around the mouth (microstomia).\nLaboratory Results: Anti-Centromere antibody is positive.",
    disease: "Systemic Sclerosis (Scleroderma)",
    questions: [
      {
        q: "What is the name of the exaggerated vascular response to cold described in this patient's fingers?",
        options: ["Livedo reticularis", "Raynaud phenomenon", "Acrocyanosis", "Erythromelalgia"],
        ans: 1,
        exp: "Raynaud's is often the very first presenting symptom of scleroderma, occurring years before skin thickening."
      },
      {
        q: "What is the fundamental pathophysiologic process causing the skin tightening in Scleroderma?",
        options: ["Loss of water", "Massive overproduction and deposition of dense collagen bundles in the dermis by hyperactive fibroblasts, driven by autoimmune vascular injury", "Calcification", "Loss of fat"],
        ans: 1,
        exp: "The skin literally turns into thick, unyielding scar tissue."
      },
      {
        q: "This patient has Limited Cutaneous Systemic Sclerosis (CREST syndrome). What does the 'C' stand for?",
        options: ["Cardiomyopathy", "Calcinosis cutis (deposition of hard calcium nodules under the skin)", "Cirrhosis", "Cancer"],
        ans: 1,
        exp: "CREST: Calcinosis, Raynaud's, Esophageal dysmotility, Sclerodactyly, Telangiectasia."
      }
    ]
  },
  {
    title: "The Bullseye Tick Bite",
    scenario: "A 30-year-old male recently went hiking in Connecticut. He presents with a large, expanding rash on his thigh. He feels fatigued and has mild muscle aches.\n\nVitals: T 37.8 C.\nPhysical Examination: A single, 12 cm, sharply demarcated erythematous annular plaque on the left thigh with central clearing, resembling a 'bullseye'. It is not scaly or itchy.\nLaboratory Results: None.",
    disease: "Erythema Migrans (Lyme Disease)",
    questions: [
      {
        q: "What is the diagnosis of this specific rash?",
        options: ["Tinea Corporis", "Erythema Migrans", "Granuloma Annulare", "Cellulitis"],
        ans: 1,
        exp: "Erythema migrans is the pathognomonic early skin lesion of Lyme disease caused by Borrelia burgdorferi."
      },
      {
        q: "How does Erythema Migrans clinically differ from Tinea Corporis (ringworm)?",
        options: ["It is smaller", "Erythema migrans expands very rapidly (over days), can get massive (>5cm), and completely LACKS the epidermal scale typical of a fungal infection", "It is very itchy", "It is raised"],
        ans: 1,
        exp: "Borrelia is spreading through the dermis, not the stratum corneum, so there is no scale."
      },
      {
        q: "If a patient presents with a classic Erythema Migrans rash, what is the next step in management?",
        options: ["Order Lyme serology (ELISA/Western Blot) and wait for results", "Immediately prescribe oral Doxycycline; the clinical rash alone is diagnostic for early localized Lyme disease, and serology is often negative at this stage", "Skin biopsy", "Topical steroids"],
        ans: 1,
        exp: "Do not wait for blood tests in early Lyme disease; treat the classic rash immediately."
      }
    ]
  },
  {
    title: "The Itchy Groin",
    scenario: "A 22-year-old male college athlete presents with an intensely itchy rash in his groin that has been present for 3 weeks. He uses public locker rooms.\n\nVitals: Normal.\nPhysical Examination: Bilateral inguinal folds and upper inner thighs show sharply demarcated, erythematous, annular plaques with a raised, scaly advancing border. Crucially, the scrotum and penis are completely spared.\nLaboratory Results: KOH preparation of the scaly border shows branching, septate hyphae.",
    disease: "Tinea Cruris (Jock Itch)",
    questions: [
      {
        q: "What is the diagnosis?",
        options: ["Candidal intertrigo", "Tinea Cruris", "Inverse psoriasis", "Seborrheic dermatitis"],
        ans: 1,
        exp: "This is a classic dermatophyte fungal infection of the groin."
      },
      {
        q: "How does the physical exam definitively differentiate Tinea Cruris from Candidal intertrigo?",
        options: ["Candida is less red", "Tinea cruris classically SPARES the scrotum, whereas Candida heavily involves the scrotum and penis and has satellite pustules", "Tinea has satellite lesions", "There is no difference"],
        ans: 1,
        exp: "Dermatophytes do not like the scrotum, while yeast thrives there."
      },
      {
        q: "Patients with Tinea Cruris must always be examined for a concurrent fungal infection in what other body location?",
        options: ["The scalp (Tinea capitis)", "The feet (Tinea pedis), as patients often infect their groin by pulling their underwear over their fungus-infected feet", "The face (Tinea faciei)", "The hands (Tinea manuum)"],
        ans: 1,
        exp: "If you cure the groin but ignore the feet, the groin will get reinfected immediately."
      }
    ]
  },
  {
    title: "The Moccasin Foot",
    scenario: "A 45-year-old male presents with chronic, asymptomatic scaling on the bottoms of his feet. He thought he just had 'dry skin.'\n\nVitals: Normal.\nPhysical Examination: Bilateral soles and lateral borders of the feet exhibit diffuse, fine, silvery-white scaling on an erythematous base, extending up the sides of the feet in a 'moccasin' distribution. The web spaces are clear.\nLaboratory Results: KOH prep shows branching hyphae.",
    disease: "Tinea Pedis (Moccasin Type)",
    questions: [
      {
        q: "What specific dermatophyte organism is the most common cause of chronic, moccasin-type Tinea Pedis?",
        options: ["Microsporum canis", "Trichophyton rubrum", "Epidermophyton floccosum", "Candida albicans"],
        ans: 1,
        exp: "T. rubrum causes a chronic, non-inflammatory, highly hyperkeratotic infection that mimics dry skin."
      },
      {
        q: "Patients with moccasin-type tinea pedis frequently also have 'Two-foot, one-hand' syndrome. What is this?",
        options: ["Arthritis in 3 joints", "Concurrent fungal infection (Tinea manuum) that inexplicably involves only ONE hand alongside both feet", "A bacterial infection", "A nerve palsy"],
        ans: 1,
        exp: "The dominant hand used to pick at the feet often becomes infected."
      },
      {
        q: "Why do topical antifungal creams frequently fail to cure moccasin-type tinea pedis?",
        options: ["The fungus is resistant", "The massive, thick layer of hyperkeratotic scale prevents the topical medication from penetrating to the fungus; keratolytic agents (urea/lactic acid) or oral antifungals are often required", "It is a virus", "The patient sweats too much"],
        ans: 1,
        exp: "You must break down the thick stratum corneum to reach the infection."
      }
    ]
  },
  {
    title: "The Spotted Back",
    scenario: "A 19-year-old female returns from a beach vacation. She complains of a rash on her back that doesn't tan in the sun, leaving her with spotty, discolored skin.\n\nVitals: Normal.\nPhysical Examination: The upper back and chest are covered in dozens of small, well-demarcated, hypopigmented (lighter than surrounding skin) and slightly hyperpigmented macules with a very fine, powdery scale. When stretched, the scale becomes more obvious (positive stretch sign).\nLaboratory Results: KOH prep of the scale shows short, thick hyphae and clusters of round spores.",
    disease: "Tinea Versicolor (Pityriasis Versicolor)",
    questions: [
      {
        q: "What is the classic description of the KOH preparation findings in Tinea Versicolor?",
        options: ["Branching septate hyphae only", "'Spaghetti and meatballs' (short hyphae and round spores)", "Pseudohyphae and budding yeast", "Multinucleated giant cells"],
        ans: 1,
        exp: "This specific appearance is diagnostic for Malassezia species."
      },
      {
        q: "Despite the name 'Tinea', what organism actually causes this disease?",
        options: ["A dermatophyte", "Malassezia globosa or furfur (a dimorphic, lipophilic yeast, NOT a dermatophyte)", "Candida", "Staphylococcus"],
        ans: 1,
        exp: "This is why treatments targeting true dermatophytes (like oral terbinafine) are completely ineffective for Tinea Versicolor."
      },
      {
        q: "Why do the lesions appear hypopigmented (pale) in the summer?",
        options: ["The yeast bleaches the skin", "The Malassezia yeast produces azelaic acid, which inhibits tyrosinase in the melanocytes, blocking melanin production", "The yeast blocks the sun", "The skin is dead"],
        ans: 1,
        exp: "The yeast actively turns off the pigment factories in the skin."
      }
    ]
  },
  {
    title: "The Honey Crust",
    scenario: "A 5-year-old boy presents with a rash around his mouth and nose. It started as a small red bump but has spread. He frequently picks his nose.\n\nVitals: Normal.\nPhysical Examination: Erythematous erosions covered by a thick, golden, 'honey-colored' crust localized to the perioral and perinasal areas.\nLaboratory Results: Bacterial culture grows Gram-positive cocci in clusters.",
    disease: "Non-Bullous Impetigo",
    questions: [
      {
        q: "What is the most common bacterial etiology of non-bullous impetigo?",
        options: ["Streptococcus pyogenes", "Staphylococcus aureus (followed by Group A Strep)", "Pseudomonas aeruginosa", "Escherichia coli"],
        ans: 1,
        exp: "S. aureus is the dominant pathogen in most skin and soft tissue infections."
      },
      {
        q: "The 'honey-colored crust' is the classic hallmark of impetigo. What is the standard topical treatment for limited disease?",
        options: ["Topical steroids", "Topical Mupirocin (Bactroban) ointment", "Topical antifungals", "Salicylic acid"],
        ans: 1,
        exp: "Mupirocin is highly effective against both Staph and Strep."
      },
      {
        q: "If impetigo is caused by specific nephritogenic strains of Group A Streptococcus, what severe complication can occur 1-2 weeks later?",
        options: ["Rheumatic fever", "Post-streptococcal glomerulonephritis (PSGN)", "Endocarditis", "Meningitis"],
        ans: 1,
        exp: "While Strep pharyngitis can cause both Rheumatic Fever and PSGN, Strep skin infections (impetigo) only cause PSGN."
      }
    ]
  },
  {
    title: "The Painful Red Face",
    scenario: "A 60-year-old woman presents with rapid onset of fever, chills, and a painful, swollen red face.\n\nVitals: T 39.0 C, HR 115.\nPhysical Examination: A brilliant red, indurated, extremely painful plaque covering the right cheek and nose. The plaque has a very sharply demarcated, raised border separating it from the normal skin. She has a tender enlarged lymph node in her neck.\nLaboratory Results: WBC 15,000.",
    disease: "Erysipelas",
    questions: [
      {
        q: "How does Erysipelas clinically and anatomically differ from deeper Cellulitis?",
        options: ["There is no difference", "Erysipelas involves the upper dermis and superficial lymphatics, resulting in a bright red, intensely swollen plaque with a very SHARPLY DEMARCATED, raised edge. Cellulitis is deeper, with ill-defined borders.", "Erysipelas only affects the legs", "Erysipelas is viral"],
        ans: 1,
        exp: "The sharp step-off border is the key distinguishing feature on exam."
      },
      {
        q: "What is the overwhelmingly most common organism causing Erysipelas?",
        options: ["Staphylococcus aureus", "Group A Beta-Hemolytic Streptococcus (Streptococcus pyogenes)", "Pseudomonas aeruginosa", "Clostridium perfringens"],
        ans: 1,
        exp: "While Staph often causes purulent cellulitis, Strep is the classic cause of non-purulent, sharply defined erysipelas."
      },
      {
        q: "What is the appropriate first-line oral antibiotic for uncomplicated Erysipelas targeting this organism?",
        options: ["Ciprofloxacin", "Penicillin V or Amoxicillin (or Cephalexin)", "Doxycycline", "Metronidazole"],
        ans: 1,
        exp: "Group A Strep remains exquisitely sensitive to Penicillin."
      }
    ]
  },
  {
    title: "The Tunneling Mite",
    scenario: "A 25-year-old male presents with incredibly severe itching that is much worse at night. He says his roommate recently had the same problem.\n\nVitals: Normal.\nPhysical Examination: Excoriated, tiny erythematous papules located exclusively in the finger web spaces, the flexor wrists, the axillae, the umbilicus, and the genitalia. A few short, 2-3 mm, wavy, grayish lines are visible on the sides of the fingers.\nLaboratory Results: Skin scraping of a wavy line shows a microscopic mite and its eggs.",
    disease: "Scabies",
    questions: [
      {
        q: "What are the 2-3 mm, wavy, grayish lines seen on the skin?",
        options: ["Veins", "Burrows (the path where the female Sarcoptes scabiei mite has tunneled into the stratum corneum to lay eggs)", "Stretch marks", "Scars"],
        ans: 1,
        exp: "Burrows are the pathognomonic lesion of scabies, though they are often destroyed by scratching."
      },
      {
        q: "Why is the itching in scabies famously worse at night?",
        options: ["The patient is bored", "The itching is a Type IV delayed hypersensitivity reaction to the mite feces and eggs, and the mites are more active at night", "The air is colder", "The blanket causes friction"],
        ans: 1,
        exp: "It takes 3-4 weeks for a newly infected person to develop the allergy and start itching."
      },
      {
        q: "What is the crucial counseling point when prescribing Topical Permethrin 5% cream for Scabies?",
        options: ["Apply it only to the itchy spots", "The cream must be applied to the ENTIRE body surface from the neck down to the toes, left on for 8-14 hours (overnight), and all close contacts must be treated simultaneously", "Wash it off immediately", "Use it every day for a month"],
        ans: 1,
        exp: "If you miss a single spot (like between the toes) or fail to treat the roommate, the patient will be immediately reinfected."
      }
    ]
  },
  {
    title: "The Derm Summary",
    scenario: "A 4th-year medical student is reviewing high-yield Dermatology for the USMLE.\n\nVitals: Normal.\nPhysical Examination: Focused.\nLaboratory Results: None.",
    disease: "Dermatology High-Yield Review",
    questions: [
      {
        q: "What is the first-line treatment for a healthy 15-year-old with moderate comedonal and papulopustular acne?",
        options: ["Oral isotretinoin", "Topical retinoid (e.g., adapalene) + Topical benzoyl peroxide", "Oral steroids", "Topical steroid"],
        ans: 1,
        exp: "This combination targets abnormal desquamation, kills C. acnes, and prevents antibiotic resistance."
      },
      {
        q: "What rash is characterized by severely pruritic, purple, flat-topped, polygonal papules with Wickham striae?",
        options: ["Psoriasis", "Lichen Planus", "Eczema", "Pityriasis Rosea"],
        ans: 1,
        exp: "The 6 Ps of Lichen Planus are a classic board buzzword."
      },
      {
        q: "What is the diagnosis for an infant with a severely itchy rash on the face and extensor surfaces, sparing the diaper area?",
        options: ["Seborrheic dermatitis", "Atopic Dermatitis (Infantile eczema)", "Irritant diaper dermatitis", "Candidiasis"],
        ans: 1,
        exp: "The distribution (face/extensors) and the intense itch are the keys to identifying infantile eczema."
      }
    ]
  }
];
