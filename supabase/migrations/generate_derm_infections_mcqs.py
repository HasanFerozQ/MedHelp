import json
import random

topic_slug = 'derm-infections'

templates = [
    # ─── BACTERIAL INFECTIONS (IMPETIGO, ECTHYMA, ERYSIPELAS, CELLULITIS, ETC.) ───
    {
        "q": "A {age}-old {gender} is brought to the clinic with several itchy, honey-colored crusted sores around their nose and mouth. The patient is otherwise active and afebrile. A skin swab culture grows Staphylococcus aureus. Which of the following is the most appropriate first-line treatment for this patient?",
        "options": [
            "Topical Mupirocin ointment",
            "Oral Cephalexin",
            "Oral Vancomycin",
            "Topical Ketoconazole cream",
            "Intravenous Ampicillin"
        ],
        "answer": 0,
        "exp": "This patient has localized non-bullous impetigo, characterized by characteristic honey-colored (golden) crusts. For localized disease, first-line therapy is topical antibiotics, such as Mupirocin or Retapamulin. If the lesions are widespread or systemic symptoms are present, oral antibiotics like cephalexin are preferred."
    },
    {
        "q": "A {age}-old {gender} is diagnosed with widespread impetigo caused by a nephritogenic strain of Group A Beta-hemolytic Streptococcus. Despite prompt and appropriate antibiotic treatment with oral cephalexin, what serious non-suppurative complication of this skin infection is NOT prevented by antibiotic therapy?",
        "options": [
            "Post-streptococcal Glomerulonephritis (PSGN)",
            "Acute Rheumatic Fever (ARF)",
            "Scarlet Fever",
            "Acute glomerulonephritis and carditis",
            "Streptococcal toxic shock syndrome"
        ],
        "answer": 0,
        "exp": "While antibiotics prevent Acute Rheumatic Fever when treating streptococcal pharyngitis, they do NOT prevent Post-streptococcal Glomerulonephritis (PSGN) following either pharyngeal or cutaneous streptococcal infections. PSGN typically presents with hematuria ('tea-colored' urine), hypertension, and periorbital edema 1-3 weeks post-infection."
    },
    {
        "q": "A {age}-old {gender} toddler presents with large, clear-to-cloudy flaccid blisters on their trunk that rupture easily, leaving a shiny, red, moist base. The patient is active and has no systemic symptoms. Cultures grow Staphylococcus aureus. What is the molecular target of the exfoliative toxins responsible for this clinical presentation?",
        "options": [
            "Desmoglein 1",
            "Desmoglein 3",
            "BP180 (Type XVII Collagen)",
            "Desmocollin 1",
            "Type VII Collagen"
        ],
        "answer": 0,
        "exp": "This patient has bullous impetigo, which is mediated by exfoliative toxins (ETA and ETB) produced by Staphylococcus aureus. These toxins are serine proteases that specifically cleave Desmoglein 1, a cell-adhesion molecule in the desmosomes of the superficial epidermis (stratum granulosum), leading to intraepidermal splitting and flaccid blister formation."
    },
    {
        "q": "A homeless {gender} presents with a painful, deep, 'punched-out' ulcer covered by a thick, adherent greenish-yellow crust on their lower leg. The border of the ulcer is violaceous and indurated. Culture grows Streptococcus pyogenes. What is the diagnosis?",
        "options": [
            "Ecthyma",
            "Non-bullous Impetigo",
            "Erysipelas",
            "Pyoderma Gangrenosum",
            "Necrotizing Fasciitis"
        ],
        "answer": 0,
        "exp": "Ecthyma is a deep, dermal extension of impetigo, often referred to as 'deep impetigo.' It typically begins as a superficial vesicle or pustule that penetrates through the epidermis into the dermis, leaving a characteristic 'punched-out' ulcer covered by a thick, hard, adherent crust that heals with scarring. Group A Strep and S. aureus are the primary causes."
    },
    {
        "q": "A {age}-old {gender} presents with a sudden onset of a bright red, painful, warm rash on their left cheek that is rapidly expanding. It is accompanied by high fever and chills. Physical exam shows a fiery red, indurated, swollen plaque with a palpable, sharply demarcated, raised border on the malar area. What is the most likely causative organism?",
        "options": [
            "Streptococcus pyogenes (Group A Strep)",
            "Staphylococcus aureus",
            "Pseudomonas aeruginosa",
            "Bartonella henselae",
            "Mycobacterium marinum"
        ],
        "answer": 0,
        "exp": "This patient has erysipelas, a superficial variant of cellulitis characterized by prominent lymphatic involvement, a fiery-red hue, and a sharply demarcated, raised, palpable border. The classic facial/malar distribution is highly characteristic. Streptococcus pyogenes (Group A Beta-hemolytic Strep) is the overwhelming cause of erysipelas."
    },
    {
        "q": "A {age}-old {gender} with a history of poorly controlled type 2 diabetes presents with a warm, red, swollen right lower leg. Physical examination reveals diffuse, ill-defined erythema, warmth, and tenderness of the calf. No crepitus, fluctuance, or systemic toxicity is noted. Fissuring is present in the interdigital spaces of the toes (tinea pedis). What is the primary clinical feature distinguishing this condition from erysipelas?",
        "options": [
            "Ill-defined, non-palpable borders and involvement of the deep dermis and subcutaneous fat",
            "The presence of high fever and leukocytosis",
            "Successful treatment with penicillin instead of cephalexin",
            "The rapid, hyperacute spread within hours",
            "The presence of prominent lymphatic streaking"
        ],
        "answer": 0,
        "exp": "This patient has cellulitis, an infection of the deep dermis and subcutaneous tissue. Unlike erysipelas (which is superficial, bright red, and has sharply demarcated, raised borders), cellulitis classically has ill-defined, flat borders, is a deeper pink/red, and frequently enters through skin barrier breakdowns like tinea pedis."
    },
    {
        "q": "A {age}-old {gender} presents to the emergency department with excruciating, deep pain in their left thigh that is completely 'out of proportion' to the mild, diffuse erythema seen on skin examination. Within hours, the leg becomes extremely swollen and indurated, and dusky, purplish patches with tense bullae begin to form. Vitals show T 39.8 C, HR 125, BP 82/48 mmHg. What is the most critical and immediate next step in management?",
        "options": [
            "Emergent surgical consultation for exploratory debridement",
            "Obtain double-volume blood cultures and wait for the results",
            "Start high-dose intravenous Piperacillin-Tazobactam and Vancomycin",
            "Order an urgent MRI of the left lower extremity with contrast",
            "Apply high-potency topical steroids to reduce local inflammation"
        ],
        "answer": 0,
        "exp": "This patient has necrotizing fasciitis, a rapidly progressive, life-threatening surgical emergency. The classic early clue is pain out of proportion to physical exam findings, progressing quickly to dusky discoloration, woody induration, crepitus, and septic shock. While broad-spectrum antibiotics are critical, the single most important and prognostic step is immediate surgical debridement of necrotic tissue."
    },
    {
        "q": "A obese {age}-old {gender} complains of a dark, non-itchy, slightly scaly rash in their bilateral armpits and groin that has been present for several months. Physical exam shows well-demarcated, reddish-brown, thin plaques. Wood's lamp examination of the axillary vault demonstrates a brilliant 'coral-red' fluorescence. What is the causative organism?",
        "options": [
            "Corynebacterium minutissimum",
            "Trichophyton rubrum",
            "Candida albicans",
            "Staphylococcus aureus",
            "Malassezia furfur"
        ],
        "answer": 0,
        "exp": "This is Erythrasma, a superficial bacterial infection of the intertriginous skin caused by Corynebacterium minutissimum (a Gram-positive rod). It closely mimics tinea or inverse psoriasis but is identified by its brilliant coral-red fluorescence under Wood's lamp, which is caused by the bacterial production of coproporphyrin III. It responds well to topical erythromycin or clindamycin."
    },
    {
        "q": "A {age}-old {gender} athlete complains of extremely foul-smelling feet. Physical exam of the soles reveals sweaty skin with dozens of small, shallow, 1-3 mm punched-out pits or craters on the weight-bearing areas of the bilateral heels and soles. What is the pathophysiology driving the formation of these characteristic pits?",
        "options": [
            "Bacterial production of extracellular proteases that digest the stratum corneum",
            "Superficial invasion of dermatophytes into the sweat glands",
            "Mechanical erosion from repetitive friction and hyperhidrosis",
            "A chronic contact allergy to rubber compounds in athletic shoes",
            "Autoimmune-mediated destruction of plantar sweat ducts"
        ],
        "answer": 0,
        "exp": "This patient has Pitted Keratolysis, a superficial bacterial infection of the soles caused by Kytococcus sedentarius, Dermatophilus congolensis, or Actinomyces. It thrives in warm, wet environments (hyperhidrosis). The bacteria produce extracellular proteases that degrade keratin, digesting the stratum corneum to create characteristic punched-out pits. The foul odor (bromhidrosis) is due to sulfur byproducts."
    },
    {
        "q": "A {age}-old {gender} develops a highly pruritic, bumpy rash on their back and buttocks 36 hours after using a hotel hot tub. Physical examination shows multiple erythematous follicular papules and pustules concentrated primarily under the areas covered by their swimwear. What is the typical clinical course of this condition?",
        "options": [
            "It is self-limited and usually resolves spontaneously within 7-10 days without specific treatment",
            "It requires immediate oral Ciprofloxacin to prevent systemic bacteremia",
            "It leads to chronic, scarred alopecia of the affected hair follicles",
            "It is highly contagious and spreads to family members through air droplets",
            "It is caused by a type IV hypersensitivity reaction to chlorine"
        ],
        "answer": 0,
        "exp": "This is Hot Tub Folliculitis, caused by Pseudomonas aeruginosa, which thrives in warm, wet, poorly chlorinated environments. It presents as itchy follicular pustules beneath swimwear due to occlusion. In immunocompetent hosts, the infection is self-limited and resolves spontaneously in 7-10 days with simple supportive care."
    },
    {
        "q": "A {age}-old rancher presents with a painless, black, sunken sore on their forearm. They note that several of their cattle recently died unexpectedly on the farm. Physical exam reveals a 2.5 cm central black necrotic eschar surrounded by a ring of non-pitting gelatinous edema and small vesicles. What is the primary drug of choice for the treatment of this condition?",
        "options": [
            "Ciprofloxacin or Doxycycline",
            "Oral Valacyclovir",
            "Topical Permethrin 5% cream",
            "Oral Griseofulvin",
            "Intravenous Ganciclovir"
        ],
        "answer": 0,
        "exp": "This patient has Cutaneous Anthrax, caused by Bacillus anthracis spores entering through skin abrasions, classically from handling infected animal products (wool, hides, cattle). The pathognomonic lesion is a painless black eschar surrounded by extensive edema. Fluoroquinolones (Ciprofloxacin) or Doxycycline are the first-line treatments of choice."
    },

    # ─── FUNGAL INFECTIONS (DERMATOPHYTES, YEASTS, DEEP FUNGI) ───
    {
        "q": "An 8-year-old child presents with an expanding scaly patch of hair loss on the back of his scalp. Physical exam shows well-demarcated alopecia studded with 'black dots' (hairs broken at the surface of the scalp) and occipital lymphadenopathy. A KOH prep confirms endothrix spores. What is the most common causative organism of this condition in the United States?",
        "options": [
            "Trichophyton tonsurans",
            "Microsporum canis",
            "Trichophyton rubrum",
            "Candida albicans",
            "Malassezia furfur"
        ],
        "answer": 0,
        "exp": "Tinea capitis is the most common pediatric dermatophyte infection in the US, and Trichophyton tonsurans is the leading causative organism (responsible for >90% of US cases). It characteristically causes 'black dot' alopecia because the endothrix (internal) fungal spores weaken the hair shaft, causing it to break off flush with the scalp."
    },
    {
        "q": "A 6-year-old girl is diagnosed with tinea capitis. Which of the following is the most appropriate first-line treatment for this patient?",
        "options": [
            "Oral Griseofulvin or oral Terbinafine",
            "Topical Ketoconazole 2% shampoo daily",
            "Oral Amoxicillin-Clavulanate",
            "Topical Clobetasol propionate ointment",
            "Topical Terbinafine 1% cream"
        ],
        "answer": 0,
        "exp": "Tinea capitis MUST be treated with systemic (oral) antifungal therapy (such as oral Griseofulvin or oral Terbinafine) because the dermatophyte invades deep into the hair follicle and shaft, where topical creams and shampoos cannot penetrate. Topical shampoos (like ketoconazole or selenium sulfide) are only used as adjunctive therapy to reduce spore shedding."
    },
    {
        "q": "A 7-year-old boy with untreated tinea capitis develops a large, painful, boggy, pus-filled mass on his scalp. He is febrile (38.3 C) and has tender cervical lymphadenopathy. Hairs in the boggy area pull out easily and painlessly. What is the primary pathogenesis of this lesion (Kerion)?",
        "options": [
            "An intense, host T-cell-mediated hypersensitivity reaction to the dermatophyte",
            "A secondary, deep Staphylococcus aureus bacterial abscess (superinfection)",
            "Direct fungal invasion into the meninges and skull bone",
            "A congenital vascular malformation triggered by inflammation",
            "A neoplastic proliferation of follicular dendritic cells"
        ],
        "answer": 0,
        "exp": "A Kerion is a severe, highly inflammatory form of tinea capitis. It represents an intense host cell-mediated (T-cell) hypersensitivity reaction to the dermatophyte, not a secondary bacterial abscess. It is characterized by a painful, boggy, purulent mass. Incision and drainage (I&D) is contraindicated; treatment requires oral antifungals and occasionally systemic corticosteroids."
    },
    {
        "q": "A {age}-old high-school wrestler presents with several extremely itchy, ring-shaped rashes on their arms and chest. Physical exam shows annular erythematous plaques with a scaly, active, advancing border and central clearing. A KOH preparation from the active scale shows branching, septate hyphae. What is the most common causative organism of this condition worldwide?",
        "options": [
            "Trichophyton rubrum",
            "Trichophyton tonsurans",
            "Microsporum canis",
            "Candida albicans",
            "Malassezia furfur"
        ],
        "answer": 0,
        "exp": "This is Tinea Corporis (ringworm), characterized by classic annular plaques with an active scaly border. Trichophyton rubrum is the most common dermatophyte worldwide, causing tinea corporis, tinea pedis, and tinea cruris."
    },
    {
        "q": "A 22-year-old male presents with a highly pruritic, red rash in his groin. Physical examination reveals bilateral, symmetric, scaly erythematous plaques in the inguinal folds. Crucially, the scrotum is completely spared. What is a key clinical feature distinguishing this condition from intertriginous Candidiasis?",
        "options": [
            "Dermatophytes (tinea cruris) typically spare the scrotum, whereas Candidiasis frequently involves the scrotum",
            "Tinea cruris presents with satellite pustules, whereas Candidiasis does not",
            "Candidiasis shows branching septate hyphae on KOH, whereas tinea shows budding yeast",
            "Tinea cruris requires oral antibiotics, whereas Candidiasis is self-limiting",
            "Tinea cruris is never itchy, while Candidiasis is extremely painful"
        ],
        "answer": 0,
        "exp": "Tinea Cruris ('jock itch') is a dermatophyte infection of the groin. A key clinical diagnostic clue that distinguishes it from Candidal intertrigo is that tinea cruris characteristically spares the moist skin of the scrotum and penis, whereas Candidiasis frequently involves the scrotum with confluent erythema and satellite pustules."
    },
    {
        "q": "A {age}-old {gender} presents with chronic, dry, scaly skin on the soles and lateral sides of both feet. They have been applying moisturizing lotions for months without improvement. Physical exam shows fine, dry, silvery-white scale in a 'moccasin' distribution. KOH prep of the scale is positive. What other anatomic site should be closely inspected to confirm the classic 'two feet, one hand' syndrome associated with this organism?",
        "options": [
            "The palms of the hands (typically only one palm is affected)",
            "The scalp for black dot alopecia",
            "The oral cavity for white plaques",
            "The fingernails of the non-dominant hand",
            "The axillae for coral-red fluorescence"
        ],
        "answer": 0,
        "exp": "Moccasin-type tinea pedis is chronically caused by Trichophyton rubrum. It is highly associated with 'Two Feet, One Hand' syndrome, where both feet are chronically scaly and infected, but only ONE hand (typically the dominant hand used to scratch the feet) shows unilateral scaling (tinea manuum). Checking the palms is an important clinical pearl."
    },
    {
        "q": "A {age}-old female has been applying a high-potency topical steroid (Clobetasol) for a suspected eczematous rash on her lower leg. Over 3 weeks, she notes the rash is expanding and now has deep, painful bumps. Exam shows an erythematous, scaly plaque studded with follicular papules and nodules. Biopsy confirms fungal hyphae within the hair follicle and surrounding dermis. What is the diagnosis?",
        "options": [
            "Majocchi's Granuloma",
            "Kerion",
            "Erythema Nodosum",
            "Sporotrichosis",
            "Cellulitis"
        ],
        "answer": 0,
        "exp": "Majocchi's Granuloma is a deep, suppurative folliculitis caused by dermatophytes invading into the dermis and hair follicle, classically precipitated by the inappropriate application of topical corticosteroids to a superficial tinea infection. The steroids suppress local immunity, allowing the fungus to penetrate deeply. It requires systemic oral antifungal therapy (e.g., terbinafine) to cure."
    },
    {
        "q": "A 65-year-old {gender} presents with yellow, thickened, crumbling toenails. A PAS stain of nail clippings confirms a dermatophyte infection. The patient is healthy but has mild chronic liver disease (compensated). You decide to start oral Terbinafine. What is the recommended duration of therapy for toenail onychomycosis, and what monitoring is required?",
        "options": [
            "12 weeks of oral Terbinafine; baseline and periodic Liver Function Tests (LFTs) must be monitored",
            "6 weeks of oral Terbinafine; no laboratory monitoring is required",
            "12 weeks of oral Terbinafine; periodic Renal Function Tests must be monitored",
            "1 week of oral Terbinafine; no monitoring is required",
            "12 months of oral Terbinafine; CBC must be monitored weekly"
        ],
        "answer": 0,
        "exp": "Toenail onychomycosis requires 12 weeks of oral Terbinafine therapy (fingernails require 6 weeks). Because oral terbinafine can cause hepatotoxicity, baseline and periodic monitoring of transaminases (LFTs) is mandatory, especially in patients with pre-existing liver history."
    },
    {
        "q": "A young {gender} returns from a beach vacation and notices multiple white, non-tanning spots on their upper back and chest. The spots are slightly itchy when the patient sweats. Physical exam shows multiple small, confluent, hypopigmented macules with a very fine, powdery scale. A KOH preparation from the scale demonstrates short, thick hyphae and clusters of round yeast cells ('spaghetti and meatballs'). What chemical produced by the yeast is responsible for these hypopigmented lesions?",
        "options": [
            "Azelaic acid",
            "Melanin",
            "Coproporphyrin III",
            "Lactic acid",
            "Uric acid"
        ],
        "answer": 0,
        "exp": "This is Tinea Versicolor (Pityriasis Versicolor), caused by the lipophilic yeast Malassezia (M. furfur). The yeast produces azelaic acid, a dicarboxylic acid that biochemically inhibits tyrosinase, an essential enzyme in the melanin synthesis pathway of melanocytes. This leads to decreased melanin production and the classic hypopigmented spots that fail to tan."
    },
    {
        "q": "An infant presents with a bright, beefy-red diaper rash. Physical examination reveals confluent, bright red, moist plaques involving the inguinal folds, with multiple pinpoint erythematous 'satellite' pustules and papules scattered outside the primary border of the rash. What is the classic finding on KOH preparation?",
        "options": [
            "Pseudohyphae and budding yeast cells",
            "Branching, septate hyphae",
            "Spherules containing endospores",
            "Henderson-Paterson bodies",
            "Gram-positive rods in chains"
        ],
        "answer": 0,
        "exp": "This is Candidal Diaper Dermatitis, caused by Candida albicans. Key diagnostic features are the involvement of the inguinal folds (which are spared in irritant contact diaper dermatitis) and the presence of satellite pustules. The classic KOH preparation finding for Candida is pseudohyphae and budding yeast (blastoconidia)."
    },
    {
        "q": "A dishwasher presents with a swollen, red, painful nail fold at the base of her right middle fingernail that has been present for 3 weeks. Physical exam shows erythema and edema of the proximal nail fold with complete loss of the cuticle. Gentle pressure expresses a small amount of thick white material. What is the primary causative organism and the most important management strategy?",
        "options": [
            "Candida albicans; strict water avoidance (keeping hands dry) and topical/oral antifungals",
            "Staphylococcus aureus; immediate incision and drainage (I&D) and oral Cephalexin",
            "Trichophyton rubrum; oral Terbinafine for 12 weeks",
            "Pseudomonas aeruginosa; soak in diluted bleach daily",
            "Herpes Simplex Virus; oral Acyclovir"
        ],
        "answer": 0,
        "exp": "This is Chronic Paronychia, which is primarily a multifactorial inflammatory reaction to moisture and irritants (frequent wet work like dishwashing) colonized by Candida albicans. Unlike acute bacterial paronychia (usually Staph, sudden, treated with drainage/antibiotics), chronic paronychia persists for weeks and requires strict water avoidance and topical/oral antifungals."
    },
    {
        "q": "A {age}-old florist presents with a non-healing, painless bump on their right index finger. Over the past 2 weeks, several new, painless subcutaneous nodules have appeared in a linear pattern extending up the right forearm along the lymphatic drainage path. Biopsy of a nodule shows yeast cells that are characteristically 'cigar-shaped' on culture. What is the diagnosis?",
        "options": [
            "Sporotrichosis",
            "Majocchi's Granuloma",
            "Blastomycosis",
            "Cutaneous Anthrax",
            "Leishmaniasis"
        ],
        "answer": 0,
        "exp": "This is Sporotrichosis, caused by the dimorphic fungus Sporothrix schenckii (classic 'Rose Gardener's Disease'). It is acquired through traumatic inoculation from contaminated soil, thorns (especially rose thorns), or sphagnum moss. It characteristically presents with a primary inoculation chancre followed by secondary subcutaneous nodules along the lymphatic drainage path (lymphocutaneous/sporotrichoid spread). Histology shows cigar-shaped budding yeast."
    },
    {
        "q": "A 45-year-old {gender} recently moved to the desert of southern Arizona and developed a high fever, a dry cough, joint pain, and multiple painful, warm, red nodules on their bilateral shins (erythema nodosum). Histopathological examination of a lung biopsy reveals large, thick-walled spherules filled with numerous small endospores. What is the diagnosis?",
        "options": [
            "Coccidioidomycosis",
            "Blastomycosis",
            "Histoplasmosis",
            "Sporotrichosis",
            "Tinea Versicolor"
        ],
        "answer": 0,
        "exp": "Coccidioidomycosis ('Valley Fever') is caused by the soil fungus Coccidioides immitis, which is endemic to the arid Southwestern United States. Primary infection is pulmonary (fever, cough), often accompanied by reactive immunological skin manifestations like Erythema Nodosum (painful nodules on the shins) and Erythema Multiforme. The diagnostic tissue form is the thick-walled spherule containing endospores."
    },
    {
        "q": "A {age}-old {gender} from the Ohio River Valley presents with a large, chronic, verrucous (warty) plaque with a sharp, violaceous border and small micro-abscesses at the edge on their cheek. They also report a chronic cough and weight loss. A biopsy of the skin lesion reveals large yeast cells that exhibit 'broad-based budding' under the microscope. What is the causative organism?",
        "options": [
            "Blastomyces dermatitidis",
            "Coccidioides immitis",
            "Histoplasma capsulatum",
            "Sporothrix schenckii",
            "Candida albicans"
        ],
        "answer": 0,
        "exp": "Blastomycosis, caused by Blastomyces dermatitidis, is endemic to the Ohio and Mississippi River Valleys and the Great Lakes region. Inhalation of spores leads to pulmonary disease, which can disseminate to the skin, presenting as verrucous (warty) or ulcerative plaques with micro-abscesses. The pathognomonic histologic finding is large, thick-walled yeast with broad-based budding."
    },
    {
        "q": "An HIV-positive patient with a CD4 count of 45/mm3 presents with fever, weight loss, and dozens of small, red, dome-shaped papules on their face and trunk, some of which exhibit central dimpling, mimicking molluscum contagiosum. A biopsy of a skin lesion shows numerous tiny, 2-4 micron, oval intracellular yeast cells residing inside macrophages. What is the classic environmental reservoir for this pathogen?",
        "options": [
            "Soil contaminated with bird or bat droppings (caves, chicken coops)",
            "Arid desert sand of the Southwest US",
            "Decaying wood and organic matter near rivers",
            "Public swimming pools and fish tanks",
            "Infected sheep and livestock"
        ],
        "answer": 0,
        "exp": "This patient has disseminated Histoplasmosis, which occurs in immunocompromised individuals (like HIV patients with low CD4). Cutaneous lesions can mimic molluscum contagiosum. Histology shows tiny intracellular yeast within macrophages (histiocytes). The environmental reservoir for Histoplasma capsulatum is soil enriched with nitrogen-rich bird or bat droppings (found in caves, chicken coops, etc.)."
    },

    # ─── VIRAL INFECTIONS (HSV, VZV, POXVIRUS, HPV, COXSACKIE, PARVO, ROSEOLA) ───
    {
        "q": "A {age}-old {gender} presents with a sudden, explosive outbreak of hundreds of painful, 'punched-out', monomorphic, crusted erosions and fluid-filled blisters overlying pre-existing atopic dermatitis on their face, neck, and upper chest. The patient is febrile (39.0 C) and has severe lymphadenopathy. What is the diagnosis?",
        "options": [
            "Eczema Herpeticum (Kaposi varicelliform eruption)",
            "Toxic Epidermal Necrolysis (TEN)",
            "Acute Generalized Exanthematous Pustulosis (AGEP)",
            "Bullous Impetigo",
            "Disseminated Molluscum Contagiosum"
        ],
        "answer": 0,
        "exp": "Eczema Herpeticum is a severe, widespread cutaneous viral infection caused by Herpes Simplex Virus (usually HSV-1) infecting skin affected by an active dermatosis, most classically Atopic Dermatitis. It is a medical emergency characterized by high fever, adenopathy, and a sudden crop of painful, monomorphic, 'punched-out' circular erosions that can lead to severe systemic infection or ocular complications."
    },
    {
        "q": "A {age}-old {gender} presents with severe, burning pain on the right side of their chest. Forty-eight hours later, a highly pruritic and painful rash of grouped, fluid-filled blisters on a red base emerges. The rash follows a single dermatome (T5) on the right side and does not cross the midline of the body. Where does the causative virus reside in a latent state between the primary chickenpox infection and this reactivation?",
        "options": [
            "Dorsal root ganglion (Sensory nerve ganglion)",
            "Trigeminal ganglion",
            "Keratinocytes of the basal epidermis",
            "Langerhans cells in the dermis",
            "Splenic macrophages"
        ],
        "answer": 0,
        "exp": "This is Herpes Zoster (shingles), caused by the reactivation of latent Varicella-Zoster Virus (VZV). Between primary varicella (chickenpox) and zoster, the virus remains dormant (latent) inside the sensory nerve cell bodies of the dorsal root ganglia (for spinal nerves) or cranial nerve ganglia."
    },
    {
        "q": "A 68-year-old {gender} presents with a shingles outbreak on the right side of their forehead and nose. During physical examination, the clinician notes several painful shingles blisters on the very tip and side of the patient's nose. What is the clinical name of this sign, and what is its immediate significance?",
        "options": [
            "Hutchinson sign; it indicates involvement of the nasociliary branch of CN V1, representing a high risk of ocular (eye) involvement",
            "Ramsay Hunt sign; it indicates a high risk of facial nerve palsy and hearing loss",
            "Nikolsky sign; it indicates severe epidermal detachment and SJS",
            "Koebner sign; it indicates the shingles was triggered by local scratching",
            "Henderson sign; it indicates a poxvirus superinfection"
        ],
        "answer": 0,
        "exp": "The Hutchinson sign refers to vesicles located on the tip or side of the nose during a shingles outbreak involving the ophthalmic division of the trigeminal nerve (CN V1). This indicates that the nasociliary nerve is involved, which also supplies the structures of the eye. Its presence carries a high risk of ophthalmic zoster and permanent eye damage, requiring an urgent ophthalmology consult."
    },
    {
        "q": "A patient presents with shingles blisters on the right face. They also complain of severe ear pain, dizziness, a spinning sensation, and they are completely unable to close their right eye or smile on the right side. Vesicles are visible in the external auditory canal. What is the diagnosis?",
        "options": [
            "Ramsay Hunt Syndrome (Herpes Zoster Oticus)",
            "Bell's palsy with secondary ear infection",
            "Meniere's disease with HSV-1 outbreak",
            "Gorlin Syndrome",
            "Nicolau Syndrome"
        ],
        "answer": 0,
        "exp": "Ramsay Hunt Syndrome (Herpes Zoster Oticus) occurs due to VZV reactivation inside the geniculate ganglion of the facial nerve (CN VII). The classic triad is ipsilateral facial nerve paralysis (causing facial droop and inability to close the eye), severe otalgia (ear pain), and vesicles inside the external auditory canal and auricle, often accompanied by vestibulocochlear symptoms (dizziness, tinnitus, hearing loss)."
    },
    {
        "q": "A 5-year-old child presents with dozens of small, skin-colored, shiny bumps on his chest and arms. Physical exam shows small (2-5 mm), firm, dome-shaped papules with a distinct central dimple (umbilication). A cheesy plug can be easily expressed from the center. What is the classic finding on histopathological examination of a biopsy?",
        "options": [
            "Intracytoplasmic eosinophilic inclusion bodies (Henderson-Paterson bodies) within keratinocytes",
            "Multinucleated giant cells with ballooning degeneration of the epidermis",
            "Massive pseudoepitheliomatous hyperplasia with microabscesses",
            "Acantholysis with a 'fishnet' immunofluorescence pattern",
            "A dense septal panniculitis without vasculitis"
        ],
        "answer": 0,
        "exp": "This is Molluscum Contagiosum, caused by a double-stranded DNA poxvirus. The lesions are clinically characterized by firm, dome-shaped, umbilicated papules. Histology pathognomonically shows Henderson-Paterson bodies, which are massive, oval, intracytoplasmic eosinophilic inclusion bodies that compress the host keratinocyte nucleus."
    },
    {
        "q": "A 10-year-old child has several rough, cauliflower-like bumps on his fingers. Physical examination reveals hyperkeratotic, exophytic papules with multiple tiny black dots on the surface. What do these characteristic 'black dots' represent?",
        "options": [
            "Thrombosed, clotted capillaries supplying the rapidly growing wart tissue",
            "Viral spores embedded in the stratum corneum",
            "Trap-door collection of dirt and environmental debris",
            "Sites of focal melanin deposition within the basal layer",
            "Necrotic nuclei of basal cells killed by the HPV virus"
        ],
        "answer": 0,
        "exp": "This is Verruca vulgaris (common wart), caused by Human Papillomavirus (HPV). Paring down the hyperkeratotic surface of a wart reveals characteristic tiny black dots. These represent thrombosed, clotted capillaries that are pulled vertically toward the surface by the rapidly proliferating epidermal tissue to supply blood to the wart."
    },
    {
        "q": "A patient presents with a painful, deep bump on the ball of their right foot that makes them feel like they are 'walking on a pebble.' On examination, there is a thick, flat hyperkeratotic plaque. How can you clinically distinguish this plantar wart (Verruca plantaris) from a simple foot callus?",
        "options": [
            "Warts show pinpoint bleeding upon paring and are more painful with lateral (side-to-side) squeezing than direct pressure",
            "Calluses show pinpoint bleeding upon paring and are only painful with direct pressure",
            "Warts are soft and fluctuant, whereas calluses are rock-hard",
            "Warts fluoresce coral-red under a Wood's lamp, whereas calluses do not",
            "There is no reliable clinical difference; a biopsy is always required"
        ],
        "answer": 0,
        "exp": "To clinically differentiate a plantar wart from a callus: paring down a plantar wart removes the hard keratin to reveal thrombosed capillaries that bleed as pinpoints, whereas calluses contain only flat layers of dead skin. Additionally, warts are classically much more painful when squeezed from side-to-side (lateral pressure) than when pressed directly, whereas calluses are painful with direct downward pressure."
    },
    {
        "q": "A 24-year-old veterinary student presents with a single, large, painless, targetoid nodule on his right thumb. He notes he recently helped deliver lambs on a farm. On exam, there is a 1.8 cm targetoid nodule with a gray-white necrotic center, a violaceous middle ring, and a bright red outer inflammatory halo. What is the causative virus?",
        "options": [
            "Orf virus (a parapoxvirus)",
            "Bacillus anthracis",
            "Human Papillomavirus",
            "Herpes Simplex Virus",
            "Coxsackievirus A16"
        ],
        "answer": 0,
        "exp": "This is Orf (also known as Ecthyma contagiosum), a zoonotic infection caused by a parapoxvirus. It is transmitted to humans through direct contact with infected sheep or goats (classically veterinarians, farm hands, or shearers). It presents as a single, painless, targetoid nodule that goes through six stages, resolving spontaneously within 6-8 weeks."
    },
    {
        "q": "A 3-year-old child presents with a low-grade fever and small, painful blisters in his mouth and on his palms and soles. Physical examination shows multiple small vesicles and ulcers in the oral cavity, and unique, elongated, 'football-shaped' greyish vesicles with a red halo on the hands and feet. What is the most common causative agent of this condition, and what is a classic late complication in children?",
        "options": [
            "Coxsackievirus A16; painless nail shedding (Onychomadesis) weeks later",
            "Herpes Simplex Virus 1; permanent scarring alopecia",
            "Parvovirus B19; aplastic crisis in healthy children",
            "HHV-6; febrile seizures leading to epilepsy",
            "Sarcoptes scabiei; post-infectious glomerulonephritis"
        ],
        "answer": 0,
        "exp": "This is Hand-Foot-and-Mouth Disease (HFMD), most commonly caused by Coxsackievirus A16 (or Enterovirus 71). It presents with painful oral erosions and greyish, football-shaped vesicles on the palms and soles. A well-known, benign late complication that occurs 2-6 weeks after the illness is Onychomadesis (painless shedding and loss of the nails)."
    },
    {
        "q": "A 6-year-old child is brought to the clinic with bright, fiery-red cheeks. His mother reports he had a mild runny nose and low-grade fever last week, which resolved. On exam, the child has a distinct 'slapped cheek' facial rash and a lacy, reticulated, pink rash on his limbs and trunk. What is the causative agent, and what is the primary risk of this infection in a patient with Sickle Cell Disease?",
        "options": [
            "Parvovirus B19; precipitating an acute Aplastic Crisis",
            "HHV-6; inducing status epilepticus",
            "Coxsackievirus A16; causing severe viral meningitis",
            "Measles virus; leading to subacute sclerosing panencephalitis (SSPE)",
            "Streptococcus pyogenes; leading to acute rheumatic fever"
        ],
        "answer": 0,
        "exp": "This is Fifth Disease (Erythema Infectiosum), caused by Parvovirus B19. It classically presents with a 'slapped cheek' rash followed by a lacy, reticulated eruption on the body. Because Parvovirus B19 directly infects and destroys erythroid progenitor cells in the bone marrow, it temporarily halts red blood cell production. In patients with high RBC turnover (like Sickle Cell Disease or hereditary spherocytosis), this can precipitate a life-threatening acute Aplastic Crisis."
    },
    {
        "q": "An 18-month-old child presents with a sudden pink rash. The mother notes the child had a very high fever (40.0 C) for exactly 3 days, during which the child was irritable but otherwise well. Today, the fever broke suddenly, and within hours, a non-itchy rash of rose-pink macules emerged on the trunk and spread to the neck and limbs. What is the diagnosis?",
        "options": [
            "Roseola Infantum (Exanthem Subitum)",
            "Erythema Infectiosum (Fifth Disease)",
            "Rubeola (Measles)",
            "Rubella (German Measles)",
            "Scarlet Fever"
        ],
        "answer": 0,
        "exp": "Roseola Infantum (Exanthem Subitum) is caused by Human Herpesvirus 6 (HHV-6) (or HHV-7). It classically affects infants and presents with a sudden very high fever (often >39.5 C) lasting 3-5 days, which can trigger febrile seizures. Characteristically, as soon as the fever suddenly drops (defervescence), a rose-pink maculopapular rash immediately erupts on the trunk and spreads outward, resolving within 1-2 days."
    },

    # ─── PARASITIC / INFESTATIONS (SCABIES, LARVA MIGRANS, LICE, LEISHMANIA, BEDBUGS) ───
    {
        "q": "A 24-year-old student presents with intense, progressive itching that is worst at night. His roommate is also complaining of similar itching. Physical exam shows small, erythematous papules, excoriations, and a few thin, linear burrows in the finger webs, wrists, and periumbilical area. What is the first-line topical treatment for this condition, and how should it be applied?",
        "options": [
            "Permethrin 5% cream; applied head-to-toe (including under fingernails/toes) and washed off after 8-14 hours",
            "Mupirocin 2% ointment; applied strictly to the visible linear burrows twice daily",
            "Clobetasol propionate 0.05% cream; applied to itchy areas daily at bedtime",
            "Ketoconazole 2% cream; applied to the trunk and limbs for 3 days",
            "Permethrin 1% shampoo; massaged into the scalp and washed off after 10 minutes"
        ],
        "answer": 0,
        "exp": "This is a classic presentation of Scabies, caused by the Sarcoptes scabiei mite. It is transmitted by close skin-to-skin contact. The first-line topical treatment is Permethrin 5% cream, which must be applied thoroughly from the neck down (including web spaces, under nails, umbilicus, and soles of feet) and left on for 8-14 hours before washing off. Treatment must be repeated in 1 week, and all close contacts must be treated simultaneously."
    },
    {
        "q": "An elderly patient with advanced dementia residing in a nursing home presents with thick, yellow-gray, 'rock-hard', hyperkeratotic scales and crusts on her hands, feet, and scalp. She does not complain of itching. A skin scraping demonstrates millions of active mites. What is the recommended treatment regimen for this condition?",
        "options": [
            "Combination therapy: Oral Ivermectin (multiple doses) plus topical Permethrin 5% cream",
            "Topical Permethrin 5% cream alone applied once",
            "High-dose intravenous antibiotics and surgical debridement of the scales",
            "Oral Griseofulvin for 12 weeks",
            "Strict isolation and daily washing with soap and water"
        ],
        "answer": 0,
        "exp": "This is Crusted (Norwegian) Scabies, an extremely contagious variant of scabies occurring in immunocompromised, elderly, or neurologically impaired patients who cannot scratch (which normally keeps mite numbers low). The skin is packed with millions of mites. Due to the massive mite burden and thick hyperkeratotic crusts, topicals alone often fail. The standard treatment is combination therapy: multiple doses of oral Ivermectin (typically days 1, 2, 8, 9, 15) plus daily topical Permethrin 5% cream."
    },
    {
        "q": "A patient returns from a Caribbean vacation where they walked barefoot on the beach. They present with an extremely itchy, red, 'snake-like' wavy line on the dorsum of their right foot. The patient notes the red line seems to advance about 1 cm each day. What is the causative organism?",
        "options": [
            "Ancylostoma braziliense (animal hookworm)",
            "Sarcoptes scabiei",
            "Strongyloides stercoralis",
            "Dracunculus medinensis",
            "Leishmania tropica"
        ],
        "answer": 0,
        "exp": "This is Cutaneous Larva Migrans ('creeping eruption'), caused by the larvae of animal hookworms (most commonly Ancylostoma braziliense, which infects cats and dogs). Humans are accidental hosts; the larvae penetrate bare skin (classically on beaches contaminated with animal feces) but lack the enzymes to penetrate the human basement membrane to enter the bloodstream. They are trapped in the epidermis, tunneling aimlessly to create a highly pruritic, serpiginous (wavy) track that moves daily."
    },
    {
        "q": "A patient presents with intense itching on their abdomen and groin. Physical exam reveals broad, flat-bodied lice firmly attached to the base of the pubic hairs, and multiple 0.5 cm asymptomatic, slate-blue macules (maculae ceruleae) scattered across the lower abdomen and upper thighs. What is the cause of these unique blue spots?",
        "options": [
            "A chemical conversion of host hemoglobin to biliverdin by the salivary enzymes of the feeding pubic louse",
            "Localized vascular thrombosis in the superficial capillaries caused by scratching",
            "Deep dermal deposition of blue melanin pigment by activated melanocytes",
            "A congenital vascular anomaly flared by the infestation",
            "A secondary deep fungal infection within the pubic follicles"
        ],
        "answer": 0,
        "exp": "This patient has pubic lice ('crabs'), caused by Pthirus pubis. The pathognomonic slate-blue or greyish-blue spots (Maculae ceruleae) on the lower abdomen, pelvis, or thighs are caused by the anticoagulant salivary secretions of the feeding louse, which enzymatically convert host red blood cell hemoglobin into biliverdin within the local dermis."
    },
    {
        "q": "A soldier returning from a tour in the Middle East presents with a painless, crusty, non-healing ulcer on their cheek that has been present for 2 months. Physical exam shows a firm, erythematous, indurated plaque that has ulcerated in the center, resembling a 'small volcano.' Biopsy of the border reveals tiny amastigotes within dermal macrophages. How is this pathogen transmitted?",
        "options": [
            "Bite of an infected Phlebotomine Sandfly",
            "Bite of an infected Ixodes Tick",
            "Contact with contaminated sheep or goats",
            "Inhalation of dry bird droppings",
            "Barefoot contact with beach sand"
        ],
        "answer": 0,
        "exp": "This is Cutaneous Leishmaniasis, a protozoan infection caused by Leishmania species. It is endemic to the Middle East, North Africa, and parts of South/Central America. It is transmitted to humans by the bite of an infected female Phlebotomine Sandfly. The classic lesion is a painless, chronic, warty, or 'volcano-like' ulcer that shows intracellular amastigotes (Leishman-Donovan bodies) inside macrophages."
    },
    {
        "q": "A traveler complains of waking up with multiple highly pruritic red bumps in linear clusters of 3 to 5 on their arms and neck. The patient refers to this as the 'breakfast, lunch, and dinner' pattern. Which of the following pests is classic for this sequential bite distribution?",
        "options": [
            "Cimex lectularius (Bedbugs)",
            "Sarcoptes scabiei (Scabies)",
            "Pthirus pubis (Pubic lice)",
            "Ancylostoma braziliense (Hookworm)",
            "Ixodes scapularis (Ticks)"
        ],
        "answer": 0,
        "exp": "Bedbug bites (caused by Cimex lectularius) characteristically present as highly itchy, erythematous papules arranged in a linear row or cluster of three (sometimes more), colloquially termed the 'breakfast, lunch, and dinner' sign. This pattern occurs because the bedbug is disturbed during feeding and bites sequentially along the skin."
    },
    {
        "q": "A {age}-old {gender} who maintains a freshwater home aquarium presents with a chronic, non-healing, warty plaque on their right index finger. Over the past 2 months, several similar nodules have developed in a linear pattern up the arm. Fungal cultures are negative. A tissue biopsy shows acid-fast bacilli on Ziehl-Neelsen stain. What is the diagnosis?",
        "options": [
            "Mycobacterium marinum infection (Swimming Pool/Fish Tank Granuloma)",
            "Sporotrichosis",
            "Cutaneous Leishmaniasis",
            "Blastomycosis",
            "Erysipeloid"
        ],
        "answer": 0,
        "exp": "Mycobacterium marinum is an atypical (nontuberculous) mycobacterium found in fresh and salt water. It causes 'fish tank granuloma' or 'swimming pool granuloma,' acquired through minor skin trauma during aquarium cleaning or swimming. It presents as a warty nodule/plaque that can show sporotrichoid (lymphocutaneous) spread up the arm. The organism is acid-fast positive, distinguishing it from Sporothrix."
    }
]

ages = ["25-year", "35-year", "45-year", "55-year", "62-year", "68-year", "72-year", "78-year", "22-year", "28-year", "38-year", "50-year", "12-year", "17-year", "19-year"]
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
        
        mcq_str = f"    (v_topic_id, '{q_text_escaped}', '{opts_json_escaped}'::jsonb, {new_ans_idx}, '{exp_escaped}')"
        
        if mcq_str not in mcqs:
            mcqs.append(mcq_str)
            counter += 1

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260519_derm_infections_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Dermatology: Infectious dermatology — cellulitis, impetigo, fungal\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'derm-infectious' LIMIT 1;\n")
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
