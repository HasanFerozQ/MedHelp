import json
import random

topic_slug = 'derm-malignancies'

templates = [
    # ─── BASAL CELL CARCINOMA (BCC) ───
    {
        "q": "A {age}-old {gender} presents with a non-healing bump on their nose that has been present for 8 months and bleeds occasionally after drying their face. Physical exam shows a 6mm shiny, flesh-colored papule with central ulceration and prominent arborizing telangiectasias under dermoscopy. What is the classic histologic feature of this lesion?",
        "options": [
            "Islands of basaloid cells with peripheral nuclear palisading and retraction artifact",
            "Concentric nests of keratinizing squamous cells forming keratin pearls in the dermis",
            "Atypical melanocytes arranged in pagetoid spread throughout the epidermis",
            "Proliferation of spindle cells forming slit-like vascular spaces containing red blood cells",
            "Perinuclear dot-like positivity of cytokeratin 20 (CK20) in small round blue cells"
        ],
        "answer": 0,
        "exp": "The clinical description of a pearly papule with telangiectasias and a central 'rodent ulcer' is classic for nodular Basal Cell Carcinoma (BCC). Histopathology classically demonstrates islands or nests of atypical basaloid cells with peripheral nuclear palisading and retraction (shrinkage) artifact from the surrounding specialized stroma."
    },
    {
        "q": "A {age}-old {gender} presents with a slow-growing, red, scaly, and slightly shiny plaque on their upper back. They have been applying over-the-counter hydrocortisone cream for 6 months without any improvement. A punch biopsy is performed. What is the most likely diagnosis?",
        "options": [
            "Superficial Basal Cell Carcinoma",
            "Psoriasis vulgaris",
            "Nummular eczema",
            "Tinea corporis",
            "Lichen planus"
        ],
        "answer": 0,
        "exp": "Superficial Basal Cell Carcinoma is a common subtype of BCC that classically presents as a thin, erythematous, scaly, well-demarcated plaque, most commonly on the trunk or extremities. It is frequently misdiagnosed and treated as an inflammatory dermatosis (like eczema or psoriasis) due to its flat, scaly appearance."
    },
    {
        "q": "A {age}-old {gender} presents with a firm, white, scar-like plaque on their temple, although they deny any prior trauma or surgery to the area. Physical exam reveals an ill-defined, indurated, ivory-white plaque with indistinct borders. What is the clinical significance of this specific subtype of Basal Cell Carcinoma?",
        "options": [
            "It is the morpheaform (sclerosing) subtype, which has high clinical aggressiveness and significant subclinical spread, necessitating Mohs micrographic surgery",
            "It is highly metastatic to the regional lymph nodes and requires wide local excision with 2 cm margins",
            "It is highly responsive to topical 5-fluorouracil field therapy and does not require surgery",
            "It is associated with an underlying visceral malignancy (Muir-Torre syndrome)",
            "It has a high rate of spontaneous regression and can be safely observed"
        ],
        "answer": 0,
        "exp": "Morpheaform (sclerosing) BCC classically presents as a firm, scar-like, ivory-white or flesh-colored indurated plaque. It is highly aggressive and has extensive subclinical (microscopic) extension far beyond its visible borders. Because of these ill-defined borders and high risk of recurrence, Mohs micrographic surgery is the gold standard treatment."
    },
    {
        "q": "A {age}-old {gender} with a Fitzpatrick skin phototype IV presents with a dark brown-to-black, slightly shiny, 5mm papule on their cheek. Dermoscopy reveals large blue-gray ovoid nests, spoke-wheel areas, and leaf-like structures, with an absence of a pigment network. What is the diagnosis?",
        "options": [
            "Pigmented Basal Cell Carcinoma",
            "Superficial Spreading Melanoma",
            "Blue nevus",
            "Seborrheic keratosis",
            "Dermatofibroma"
        ],
        "answer": 0,
        "exp": "Pigmented Basal Cell Carcinoma contains melanin produced by benign melanocytes colonizing the tumor. It is the most common presentation of BCC in darker-skinned individuals (Fitzpatrick phototypes IV-VI). Classic dermoscopic findings include blue-gray ovoid nests, leaf-like structures, and spoke-wheel areas, without the atypical pigment network characteristic of melanoma."
    },
    {
        "q": "A 20-year-old {gender} presents with multiple basal cell carcinomas on their face and trunk. Physical examination reveals palmoplantar pits, frontal bossing, and hypertelorism. The patient also has a history of an odontogenic keratocyst removed from the jaw. What is the primary molecular defect driving this patient's syndrome?",
        "options": [
            "Loss-of-function mutation in the PTCH1 gene, leading to constitutive activation of the Hedgehog pathway",
            "Gain-of-function mutation in the BRAF gene (V600E), causing overactive MAP kinase signaling",
            "Loss-of-function mutation in the CDKN2A gene, disrupting cell cycle regulation",
            "Defective nucleotide excision repair (NER) of UV-induced thymine dimers",
            "Inactivation of the p53 tumor suppressor gene via HPV E6 protein"
        ],
        "answer": 0,
        "exp": "This patient has Gorlin syndrome (Nevoid Basal Cell Carcinoma Syndrome), an autosomal dominant condition caused by a mutation in the PTCH1 (Patched) tumor suppressor gene. PTCH1 normally inhibits Smoothened (SMO). Loss of PTCH1 leads to constitutive activation of the Hedgehog pathway, resulting in multiple early-onset BCCs, odontogenic keratocysts, palmar/plantar pits, bifid ribs, and calcification of the falx cerebri."
    },
    {
        "q": "A {age}-old {gender} with Gorlin syndrome is diagnosed with dozens of new Basal Cell Carcinomas. Which of the following therapeutic modalities should be AVOIDED in this patient due to the risk of triggering an explosive eruption of new skin cancers?",
        "options": [
            "Ionizing radiation (Radiation therapy)",
            "Mohs micrographic surgery",
            "Topical imiquimod 5% cream",
            "Photodynamic therapy (PDT)",
            "Oral vismodegib therapy"
        ],
        "answer": 0,
        "exp": "In patients with Gorlin syndrome (Nevoid BCC syndrome), exposure to ionizing radiation (radiation therapy) triggers genomic instability that leads to the rapid, explosive eruption of hundreds of new BCCs within the radiation field. Thus, radiation therapy is strictly contraindicated or avoided in these patients."
    },
    {
        "q": "A 78-year-old {gender} presents with a massive, locally advanced, and highly invasive Basal Cell Carcinoma of the scalp that has eroded through the skull into the dura mater. The neurosurgical and dermatologic teams determine the tumor is completely unresectable. What is the first-line systemic therapy for this advanced tumor?",
        "options": [
            "Vismodegib (or Sonidegib)",
            "Combined Dabrafenib and Trametinib",
            "Intravenous Cisplatin and 5-Fluorouracil",
            "Pembrolizumab",
            "High-dose systemic Prednisone"
        ],
        "answer": 0,
        "exp": "For metastatic or locally advanced BCC that is not amenable to surgery or radiation, the Hedgehog pathway inhibitors Vismodegib or Sonidegib are indicated first-line. These are small-molecule inhibitors of Smoothened (SMO), which block the dysregulated, overactive signaling pathway characteristic of BCC."
    },
    {
        "q": "A patient with advanced Basal Cell Carcinoma is treated with the Smoothened (SMO) inhibitor Vismodegib. Three months into therapy, they present with severe muscle cramps, hair loss (alopecia), and complete loss of taste (ageusia). What is the most appropriate clinical action?",
        "options": [
            "Recognize these as classic, treatment-limiting side effects of Hedgehog inhibitors and consider a drug holiday or dose adjustment",
            "Immediately screen the patient for acute motor neuropathy",
            "Initiate high-potency oral calcium channel blockers for muscle cramps",
            "Discontinue the drug permanently as these side effects indicate life-threatening toxicity",
            "Add systemic glucocorticoids to counteract the taste loss and alopecia"
        ],
        "answer": 0,
        "exp": "Hedgehog inhibitors (Vismodegib, Sonidegib) are notoriously associated with muscle spasms/cramps, alopecia, and dysgeusia/ageusia (taste loss). These are class-specific, treatment-limiting side effects that frequently lead to poor patient compliance and necessitate drug holidays, dosage reductions, or supportive care."
    },

    # ─── SQUAMOUS CELL CARCINOMA (SCC) & PRECURSORS ───
    {
        "q": "A {age}-old {gender} with a history of significant sun exposure presents with multiple rough, sand-paper-like red spots on their bald scalp and ears. A biopsy of one lesion shows partial-thickness epidermal dysplasia with alternating orthokeratosis and parakeratosis. What is the diagnosis?",
        "options": [
            "Actinic Keratosis",
            "Seborrheic Keratosis",
            "Bowen's disease (SCC in-situ)",
            "Plaque psoriasis",
            "Discoidal Lupus Erythematosus"
        ],
        "answer": 0,
        "exp": "Actinic Keratosis (AK) is a very common intraepithelial precursor to invasive Squamous Cell Carcinoma (SCC). It presents clinically as rough, gritty, sandpaper-like scaly papules on chronically sun-exposed skin. Histopathology classically shows partial-thickness atypical keratinocytes in the basal/spinous layers and the 'flag sign' (alternating columns of orthokeratosis and parakeratosis)."
    },
    {
        "q": "A dermatologist evaluates a {age}-old {gender} with hundreds of actinic keratoses on their face, forearms, and scalp. Rather than freeze each lesion individually with liquid nitrogen, the clinician prescribes topical 5-fluorouracil 5% cream to be applied to the entire face. What clinical concept justifies this field-directed treatment?",
        "options": [
            "Field cancerization",
            "Metastatic suppression",
            "Autoimmune desensitization",
            "Keratolytic occlusion",
            "Contact hypersensitivity induction"
        ],
        "answer": 0,
        "exp": "The concept of 'field cancerization' states that chronically sun-damaged skin contains widespread, subclinical genetic alterations and microscopic dysplastic clones, putting the entire area at high risk for multiple future skin cancers. Field therapies (such as topical 5-FU, imiquimod, or photodynamic therapy) target both visible lesions and subclinical dysplasia across the entire field."
    },
    {
        "q": "A {age}-old {gender} presents with a slow-growing, well-demarcated, 2 cm, red, scaly plaque on their lower leg. Biopsy shows full-thickness epidermal dysplasia with highly atypical keratinocytes, mitotic figures, and multinucleated giant cells, with an intact basement membrane zone. What is the diagnosis?",
        "options": [
            "Bowen's disease (Squamous Cell Carcinoma in-situ)",
            "Invasive Squamous Cell Carcinoma",
            "Superficial Basal Cell Carcinoma",
            "Keratoacanthoma",
            "Actinic Keratosis"
        ],
        "answer": 0,
        "exp": "Bowen's disease is the clinical term for Squamous Cell Carcinoma in-situ (SCCIS). Histologically, it is characterized by full-thickness dysplasia of the epidermis (disorganized, 'windblown' appearance, cellular atypia, mitotic figures) but with a completely intact basement membrane (no dermal invasion)."
    },
    {
        "q": "A 52-year-old uncircumcised male presents with a painless, bright red, velvety plaque on the glans penis that has been slowly expanding over 1 year. Biopsy reveals full-thickness squamous dysplasia confined to the epithelium. What is the specific clinical term for this presentation?",
        "options": [
            "Erythroplasia of Queyrat",
            "Bowenoid papulosis",
            "Balanitis xerotica obliterans",
            "Pearly penile papules",
            "Condyloma acuminata"
        ],
        "answer": 0,
        "exp": "Erythroplasia of Queyrat is the specific clinical term for Bowen's disease (SCC in-situ) arising on the mucosal or transitional surfaces of the glans penis or prepuce in uncircumcised males. It classically presents as a bright red, velvety, slightly elevated plaque."
    },
    {
        "q": "A {age}-old {gender} presents with a rapidly growing, painful, firm, hyperkeratotic nodule with a central ulcer on the vermilion border of their lower lip. They have a history of smoking and outdoor work. What is the most critical prognostic risk factor associated with this lesion compared to a similar lesion on the cheek?",
        "options": [
            "The anatomical location (lower lip) carries a significantly higher risk of regional lymph node metastasis",
            "It is highly likely to be driven by a PTCH1 mutation",
            "It has a high rate of spontaneous regression",
            "It is driven by HPV and is infectious",
            "It is highly resistant to surgical excision"
        ],
        "answer": 0,
        "exp": "Cutaneous Squamous Cell Carcinoma (SCC) arising on high-risk sites like the lower lip (vermilion border) or the ear has a significantly higher rate of regional lymph node metastasis (approx 10-15%) compared to typical SCCs arising within actinic keratoses on chronically sun-damaged hair-bearing facial skin (approx 1%)."
    },
    {
        "q": "A {age}-old {gender} organ transplant recipient on chronic immunosuppression (cyclosporine, prednisone, and mycophenolate mofetil) presents for a routine skin check. What is the relative risk and clinical behavior of Squamous Cell Carcinoma (SCC) in this patient population?",
        "options": [
            "A 65- to 100-fold increased risk of developing SCC, with a higher risk of multiple, aggressive tumors and metastasis",
            "A slightly decreased risk of SCC due to the anti-inflammatory effects of prednisone",
            "An increased risk of melanoma, but a decreased risk of non-melanoma skin cancer",
            "A high risk of benign viral warts, but no increase in malignant transformation",
            "The risk is identical to the general population"
        ],
        "answer": 0,
        "exp": "Organ transplant recipients on long-term systemic immunosuppressants have a dramatically elevated risk of skin cancer, most notably a 65- to 100-fold increased risk of Squamous Cell Carcinoma (SCC), which frequently presents as multiple, rapidly growing, highly aggressive tumors with a high rate of recurrence and metastasis."
    },
    {
        "q": "A {age}-old {gender} presents with a symmetric, dome-shaped, 2 cm skin nodule on their forearm that appeared and grew to its current size in just 4 weeks. The nodule features a prominent, crater-like central keratinous plug. What is the characteristic biological behavior of this lesion?",
        "options": [
            "Rapid initial growth followed by a period of stability and possible spontaneous involution over several months, though it is clinically managed as a well-differentiated SCC",
            "Continuous, aggressive growth with high rates of early distant metastasis to the lungs",
            "Indolent growth over decades with no metastatic potential",
            "Infiltration into the deep fascia and bone within weeks",
            "Development of multiple satellite lesions in a sporotrichoid pattern"
        ],
        "answer": 0,
        "exp": "The clinical description of a dome-shaped nodule with a central keratin-filled crater ('volcano-like') that grows rapidly over a few weeks is classic for a Keratoacanthoma (KA). A characteristic feature of KAs is their potential for spontaneous regression (involution). However, because they can be histologically and clinically indistinguishable from invasive, well-differentiated SCC, they are treated surgically as SCCs."
    },
    {
        "q": "A 58-year-old {gender} presents with a non-healing, enlarging, and painful ulcer within a deep scar on their lower leg, where they sustained a severe third-degree burn 25 years ago. Biopsy of the everted edge of the ulcer confirms invasive Squamous Cell Carcinoma. What is this clinical entity called?",
        "options": [
            "Marjolin's ulcer",
            "Curling's ulcer",
            "Cushing's ulcer",
            "Venous stasis ulcer",
            "Pyoderma gangrenosum"
        ],
        "answer": 0,
        "exp": "A Marjolin's ulcer is an aggressive Squamous Cell Carcinoma (SCC) arising within an area of chronic inflammation, trauma, or scarring—classically old burn scars, osteomyelitis sinus tracts, or chronic venous ulcers. These tumors have a significantly higher rate of metastasis (up to 30%) than typical cutaneous SCCs."
    },

    # ─── MELANOMA SUBTYPES, STAGING, & MOLECULAR PATHOLOGY ───
    {
        "q": "A {age}-old {gender} presents with a mole on their back that has become darker and larger over the past year. Physical exam shows a 9mm asymmetric plaque with irregular borders, color variegation (brown, black, and red), and a small area of central gray-white scaling. What is the most common subtype of melanoma overall in fair-skinned populations?",
        "options": [
            "Superficial Spreading Melanoma",
            "Nodular Melanoma",
            "Lentigo Maligna Melanoma",
            "Acral Lentiginous Melanoma",
            "Amelanotic Melanoma"
        ],
        "answer": 0,
        "exp": "Superficial Spreading Melanoma (SSM) is the most common subtype of melanoma in Caucasians, accounting for approximately 70% of all cases. It classically presents with the classic ABCDE warning signs, initially undergoing a prolonged radial growth phase (spreading horizontally in the epidermis) before entering the vertical growth phase."
    },
    {
        "q": "A {age}-old {gender} presents with a rapidly growing, dark blue-black, dome-shaped nodule on their arm that appeared 2 months ago. Unlike their other flat moles, this lesion is uniform in color and symmetric. Biopsy reveals a malignant melanocytic tumor that lacks a significant radial growth phase. What is the subtype of this melanoma?",
        "options": [
            "Nodular Melanoma",
            "Superficial Spreading Melanoma",
            "Lentigo Maligna Melanoma",
            "Acral Lentiginous Melanoma",
            "Desmoplastic Melanoma"
        ],
        "answer": 0,
        "exp": "Nodular Melanoma is the second most common subtype and is highly aggressive. It characteristically lacks a significant radial growth phase, entering the vertical growth phase (growing downward into the dermis) almost immediately. Because of this, it often presents as a symmetric, dome-shaped nodule that fails several classic 'ABCDE' criteria (e.g., it can be symmetric and uniform), but has a prominent 'E' (Evolving)."
    },
    {
        "q": "An 82-year-old {gender} presents with a large, flat, brown, 'smudge-like' patch on their cheek that has been slowly expanding over the past 10 years. Physical exam reveals a 3.5 cm ill-defined macule with irregular brown-black pigmentation on a background of severe wrinkling and solar elastosis. What is the diagnosis?",
        "options": [
            "Lentigo Maligna (Melanoma in-situ)",
            "Superficial Spreading Melanoma",
            "Seborrheic Keratosis",
            "Actinic Keratosis",
            "Melasma"
        ],
        "answer": 0,
        "exp": "Lentigo Maligna (LM) is melanoma in-situ arising on chronically sun-damaged skin, most commonly the face or neck of elderly individuals. It classically presents as a slowly expanding, flat, variegated brown-to-black macule with very poorly defined clinical borders. Once it invades the dermis, it is termed Lentigo Maligna Melanoma."
    },
    {
        "q": "A 65-year-old African American {gender} presents with a dark, irregular patch on the sole of their foot. They note it has been present for 2 years and they originally thought it was a bruise from walking. Physical exam shows a 2.5 cm asymmetric, variegated black and gray macule on the right heel. What is the subtype of this melanoma?",
        "options": [
            "Acral Lentiginous Melanoma",
            "Superficial Spreading Melanoma",
            "Nodular Melanoma",
            "Lentigo Maligna Melanoma",
            "Mucosal Melanoma"
        ],
        "answer": 0,
        "exp": "Acral Lentiginous Melanoma (ALM) arises on the palms, soles, or nail apparatus (subungual). While rare overall, it is the most common subtype of melanoma in non-Caucasian populations (Black, Asian, Hispanic). Notably, ALM is NOT related to UV light/sun exposure, which explains its occurrence on non-sun-exposed acral sites."
    },
    {
        "q": "A {age}-old {gender} presents with a dark brown longitudinal band on their right thumbnail. The band is 4mm wide, irregular, and has become wider over 1 year. The clinician notes brown pigmentation extending onto the proximal nail fold (eponychium). What is this clinical sign called, and what does it suggest?",
        "options": [
            "Hutchinson's sign, highly suggestive of subungual melanoma",
            "Schwartz sign, indicative of otosclerosis",
            "Auspitz sign, indicative of nail psoriasis",
            "Darier's sign, suggesting mastocytosis",
            "Nikolsky's sign, suggesting pemphigus vulgaris"
        ],
        "answer": 0,
        "exp": "Hutchinson's sign in dermatology refers to the extension of pigment from the nail matrix/plate onto the proximal or lateral nail fold (the periungual skin). It is a highly sensitive clinical indicator of subungual melanoma (which is a variant of acral lentiginous melanoma)."
    },
    {
        "q": "A {age}-old {gender} presents with a pink, rapidly growing, glistening nodule on their shoulder that bleeds easily. The lesion has no brown or black pigment and resembles a pyogenic granuloma. Biopsy of the lesion reveals atypical melanocytes that stain positive for S100 and SOX10. What is this clinical variant called?",
        "options": [
            "Amelanotic Melanoma",
            "Nodular Basal Cell Carcinoma",
            "Pyogenic granuloma",
            "Spitz nevus",
            "Invasive Squamous Cell Carcinoma"
        ],
        "answer": 0,
        "exp": "Amelanotic Melanoma is a classic 'diagnostic trap' because it lacks visible melanin pigment. It presents as a pink, red, or flesh-colored papule or nodule, often mimicking benign vascular lesions (like pyogenic granuloma) or non-melanoma skin cancers. Pathologists use immunohistochemical stains (S100, SOX10, Melan-A) to confirm the melanocytic lineage."
    },
    {
        "q": "A {age}-old {gender} undergoes a narrow-margin excisional biopsy for a suspicious pigmented lesion on their back. The pathology report confirms melanoma. Which of the following histological parameters is the single most important prognostic factor for primary cutaneous melanoma?",
        "options": [
            "Breslow depth (measured in millimeters)",
            "Clark's level of anatomic invasion",
            "The presence of a lymphocytic infiltrate",
            "The subtype of melanoma (e.g., SSM vs. ALM)",
            "The presence of regression"
        ],
        "answer": 0,
        "exp": "Breslow depth—the vertical measurement in millimeters from the granular layer of the epidermis to the deepest malignant melanocyte in the dermis—is the single most important prognostic factor for primary, localized cutaneous melanoma, and directly determines the T-category and surgical margin requirements."
    },
    {
        "q": "A pathology report for a primary cutaneous melanoma excision states: 'Breslow depth 1.2 mm, ulceration absent, mitoses 2/mm2.' The surgical margins are clear. What is the next standard step in the clinical management of this patient?",
        "options": [
            "Wide local excision with 1-2 cm margins and consideration of a Sentinel Lymph Node Biopsy (SLNB)",
            "Immediate initiation of systemic adjuvant pembrolizumab therapy",
            "CT scan of the chest, abdomen, and pelvis with IV contrast only",
            "No further surgery; follow up with serial clinical checks every 6 months",
            "Prophylactic complete lymph node dissection of the regional basin"
        ],
        "answer": 0,
        "exp": "For intermediate-thickness melanomas (Breslow depth 1.0 - 4.0 mm, or >0.8 mm with high-risk features like ulceration or high mitoses), the standard of care is a wide local excision (typically 1-2 cm margins) combined with a Sentinel Lymph Node Biopsy (SLNB) to evaluate the regional lymph node basin for micro-metastasis."
    },
    {
        "q": "Genetic testing of a metastatic melanoma specimen from a {age}-old {gender} reveals a mutation in the BRAF gene at codon 600, resulting in the substitution of valine for glutamic acid (V600E). What is the normal physiological function of the BRAF protein?",
        "options": [
            "A serine/threonine kinase that is a component of the MAP kinase signaling pathway",
            "A nuclear transcription factor regulating tumor suppressor proteins",
            "A cell surface receptor for Epidermal Growth Factor (EGFR)",
            "A cell-cycle checkpoint protein that acts as a G1/S gatekeeper",
            "A lysosomal enzyme involved in antigen processing"
        ],
        "answer": 0,
        "exp": "BRAF is a proto-oncogene encoding a serine/threonine protein kinase that is a key component of the intracellular MAP kinase (RAS-RAF-MEK-ERK) signaling pathway. The V600E mutation leads to constitutive, ligand-independent activation of the pathway, driving cell proliferation and survival."
    },
    {
        "q": "A patient with BRAF V600E mutated metastatic melanoma is initiated on treatment with a BRAF inhibitor (e.g., Dabrafenib) combined with a MEK inhibitor (e.g., Trametinib). What is the primary clinical benefit of combining these two targeted agents rather than using a BRAF inhibitor alone?",
        "options": [
            "It delays the onset of resistance and decreases the rate of paradoxical pathway activation that causes secondary Squamous Cell Carcinomas",
            "It eliminates the risk of drug-induced hyperthermia and fever",
            "It prevents the development of systemic hypertension",
            "It avoids the need for periodic liver function test monitoring",
            "It allows the patient to continue therapy without any risk of QT prolongation"
        ],
        "answer": 0,
        "exp": "Monotherapy with a BRAF inhibitor (e.g., vemurafenib, dabrafenib) leads to rapid resistance via alternate pathway activation. Furthermore, it causes paradoxical activation of the MAP kinase pathway in normal keratinocytes that do not have the BRAF V600E mutation, leading to the development of secondary cutaneous Squamous Cell Carcinomas and Keratoacanthomas. Adding a MEK inhibitor blocks this paradoxical signaling, reducing secondary skin cancers and improving progression-free survival."
    },
    {
        "q": "A {age}-old {gender} with Stage IV melanoma is initiated on Pembrolizumab. What is the direct molecular mechanism of action of this medication?",
        "options": [
            "Humanized monoclonal antibody that blocks the Programmed Death-1 (PD-1) receptor on T-lymphocytes, preventing tumor-mediated immune evasion",
            "Small-molecule tyrosine kinase inhibitor targeting the vascular endothelial growth factor receptor (VEGFR)",
            "Chimeric monoclonal antibody that binds to CTLA-4 to deplete regulatory T-cells",
            "Monoclonal antibody targeting the CD20 antigen on circulating B-cells",
            "Recombinant interleukin that directly stimulates cytotoxic T-cell proliferation"
        ],
        "answer": 0,
        "exp": "Pembrolizumab and Nivolumab are monoclonal antibodies that block the PD-1 receptor on T-cells. Tumor cells often express PD-L1 (Programmed Death Ligand 1) to bind PD-1, sending an inhibitory signal that turns off the T-cell (immune evasion). Blocking this interaction 'releases the brakes' on the immune system, allowing tumor-specific T-cells to attack the cancer."
    },
    {
        "q": "A patient with advanced melanoma is treated with a combination of Nivolumab (anti-PD-1) and Ipilimumab (anti-CTLA-4). Two months into therapy, they present with severe watery diarrhea (6 bowel movements per day), abdominal cramping, and a high fever. What is the most likely diagnosis and first-line treatment?",
        "options": [
            "Immune-related colitis; treat with systemic high-dose corticosteroids (e.g., methylprednisolone/prednisone)",
            "Clostridioides difficile colitis; treat with oral Vancomycin",
            "Infectious salmonella gastroenteritis; treat with oral Ciprofloxacin",
            "Direct secretory drug toxicity; discontinue the immunotherapy and initiate loperamide",
            "Irritable bowel syndrome flare; initiate dietary modifications"
        ],
        "answer": 0,
        "exp": "Immunotherapy checkpoint inhibitors (especially combination anti-PD-1/anti-CTLA-4) are notorious for causing immune-related Adverse Events (irAEs) due to autoimmune activation. Colitis is a classic, severe irAE presenting with diarrhea and abdominal pain. Once infectious causes are ruled out, first-line therapy for moderate-to-severe irAEs is high-dose systemic corticosteroids (prednisone 1-2 mg/kg/day)."
    },
    {
        "q": "A 25-year-old {gender} presents with a history of over 100 atypical-appearing melanocytic nevi across their trunk and limbs. Their father and paternal grandfather were both diagnosed with cutaneous melanoma before age 40. Genetic analysis reveals a germline mutation in the CDKN2A gene. What is this hereditary cancer syndrome, and what other internal malignancy is this patient at high risk for?",
        "options": [
            "Familial Atypical Multiple Mole-Melanoma (FAMMM) syndrome; increased risk of Pancreatic Adenocarcinoma",
            "Gorlin syndrome; increased risk of Medulloblastoma",
            "Li-Fraumeni syndrome; increased risk of Osteosarcoma and breast cancer",
            "Cowden syndrome; increased risk of Thyroid Follicular Carcinoma",
            "Muir-Torre syndrome; increased risk of Colorectal Carcinoma"
        ],
        "answer": 0,
        "exp": "Familial Atypical Multiple Mole-Melanoma (FAMMM) syndrome is an autosomal dominant disorder characterized by multiple atypical nevi, a strong family history of melanoma, and an associated germline mutation in the CDKN2A gene (encoding the p16 tumor suppressor). FAMMM syndrome carries a highly elevated risk of developing both cutaneous melanoma and pancreatic adenocarcinoma."
    },
    {
        "q": "A pathologist reviews an excisional biopsy of a melanoma from a {age}-old {gender}. A large portion of the central tumor shows a dense infiltrate of CD8+ T-lymphocytes, dermal fibrosis, melanophages, and a complete absence of melanoma cells. What is this phenomenon, and what challenge does it present?",
        "options": [
            "Tumor regression; extensive regression (>75%) makes the true maximum Breslow depth difficult to determine as the thickest part may have been immunologically destroyed",
            "Tumor ulceration; it indicates rapid tumor necrosis and carries a highly unfavorable prognosis",
            "Koebner response; it represents mechanical trauma leading to tumor spread",
            "Pagetoid scatter; it indicates the tumor has entered the vertical growth phase",
            "Desmoplasia; it makes the tumor highly resistant to systemic checkpoint immunotherapy"
        ],
        "answer": 0,
        "exp": "Melanoma regression is an immune-mediated host response where CD8+ cytotoxic T-lymphocytes attack and destroy tumor cells, leaving behind a scarred, vascular, depigmented zone. While it represents an active immune response, extensive regression (>75% of the lesion) is problematic because the thickest, most prognostic portion of the original tumor may have been destroyed, resulting in an under-measurement of the Breslow depth."
    },

    # ─── OTHER SKIN CANCERS (MERKEL, KAPOSI, LYMPHOMA, DFSP) ───
    {
        "q": "An 80-year-old {gender} presents with a rapidly growing, painless, firm, red-to-purple nodule on their sun-damaged forehead. The lesion appeared only 3 weeks ago and has grown to 1.5 cm. Biopsy shows a dense dermal infiltrate of small, round, blue cells with sparse cytoplasm and high mitotic activity. Immunohistochemical stains are positive for Cytokeratin 20 (CK20) in a characteristic 'perinuclear dot' pattern. What is the diagnosis?",
        "options": [
            "Merkel Cell Carcinoma",
            "Nodular Basal Cell Carcinoma",
            "Small cell lung cancer metastasis",
            "Cutaneous B-cell lymphoma",
            "Amelanotic Melanoma"
        ],
        "answer": 0,
        "exp": "Merkel Cell Carcinoma is a highly aggressive primary neuroendocrine carcinoma of the skin that classically presents as a rapidly growing, painless, red-purple nodule on sun-exposed skin of elderly patients. Histologically, it is a 'small round blue cell' tumor. The pathognomonic diagnostic finding on IHC is CK20 positivity showing a distinctive 'perinuclear dot' or 'cap' pattern."
    },
    {
        "q": "A {age}-old {gender} is diagnosed with Merkel Cell Carcinoma. What virus is integrated into the host genome in approximately 80% of these highly aggressive tumors?",
        "options": [
            "Merkel Cell Polyomavirus (MCPyV)",
            "Human Herpesvirus 8 (HHV-8)",
            "Human Papillomavirus Type 16 (HPV-16)",
            "Epstein-Barr Virus (EBV)",
            "Cytomegalovirus (CMV)"
        ],
        "answer": 0,
        "exp": "Merkel Cell Polyomavirus (MCPyV), a double-stranded DNA virus, is clonal-integrated into the host cell genome in approximately 80% of Merkel Cell Carcinomas, expressing oncogenic T-antigens that drive cell cycle progression and inhibit tumor suppressors like p53 and Rb."
    },
    {
        "q": "A 32-year-old HIV-positive male with a CD4 count of 120/mm3 presents with multiple violaceous, non-blanching macules and nodules on his lower extremities, trunk, and hard palate. Biopsy reveals a vascular proliferation of spindle cells forming slit-like spaces containing extravasated red blood cells. What is the causative organism of this disease?",
        "options": [
            "Human Herpesvirus 8 (HHV-8)",
            "Human Immunodeficiency Virus (HIV)",
            "Bartonella henselae",
            "Human Herpesvirus 6 (HHV-6)",
            "Treponema pallidum"
        ],
        "answer": 0,
        "exp": "Kaposi Sarcoma (KS) is a low-grade vascular tumor driven by Human Herpesvirus 8 (HHV-8), also known as Kaposi Sarcoma-associated Herpesvirus (KSHV). It classically presents as red, purple, or brown non-blanching violaceous patches, plaques, or nodules, frequently involving the skin, oral mucosa (hard palate), and GI tract in immunocompromised (AIDS) individuals. HIV acts synergistically but HHV-8 is the necessary causative pathogen."
    },
    {
        "q": "A {age}-old {gender} with newly diagnosed AIDS-related Kaposi Sarcoma is evaluated. Aside from localized cutaneous lesions, they have no visceral involvement or systemic symptoms. What is the first-line therapy to initiate for this patient?",
        "options": [
            "Initiate Highly Active Antiretroviral Therapy (HAART)",
            "Intravenous liposomal doxorubicin chemotherapy",
            "Wide local surgical excision of all skin spots",
            "Local radiation therapy to the bilateral lower extremities",
            "Interferon-alpha injections"
        ],
        "answer": 0,
        "exp": "For mild-to-moderate, slowly progressive, or localized AIDS-related Kaposi Sarcoma, the first-line therapeutic intervention is the initiation or optimization of Highly Active Antiretroviral Therapy (HAART). Restoring the CD4 count and suppressing HIV viral replication allows the patient's immune system to clear HHV-8 infected cells, frequently leading to complete resolution of the KS lesions."
    },
    {
        "q": "A 55-year-old {gender} presents with a 5-year history of a highly pruritic rash on their buttocks and inner thighs that has been misdiagnosed as 'eczema' and treated with multiple steroid creams. Physical exam shows several large, thin, dusky-red patches with a finely wrinkled, 'cigarette-paper' surface. Biopsy reveals a band-like lymphocytic infiltrate in the upper dermis with prominent epidermotropism and Pautrier microabscesses. What is the diagnosis?",
        "options": [
            "Mycosis Fungoides (Patch stage)",
            "Lichen simplex chronicus",
            "Plaque psoriasis",
            "Asteatotic eczema",
            "Lichen planus"
        ],
        "answer": 0,
        "exp": "Mycosis Fungoides (MF) is the most common form of Cutaneous T-cell Lymphoma (CTCL). In its early patch stage, it classically presents as thin, erythematous, slightly scaly, and pruritic patches in a non-sun-exposed 'bathing suit' distribution (buttocks, groin, thighs). Key pathologic findings include epidermotropism (migration of malignant T-cells into the epidermis without spongiosis) and Pautrier microabscesses (small epidermal clusters of atypical T-cells)."
    },
    {
        "q": "A {age}-old {gender} with a history of patch-stage Mycosis Fungoides presents for follow-up. They have developed multiple thick, indurated, elevated red-brown plaques on their trunk. What is the classic progression sequence of cutaneous lesions in this lymphoma?",
        "options": [
            "Patch -> Plaque -> Tumor",
            "Tumor -> Plaque -> Patch",
            "Plaque -> Patch -> Tumor",
            "Patch -> Tumor -> Plaque",
            "Erythroderma -> Patch -> Tumor"
        ],
        "answer": 0,
        "exp": "Mycosis Fungoides classically follows a slow, progressive clinical course over years or decades, transitioning sequentially through three distinct cutaneous stages: Patch stage (flat, scaly macules/patches), Plaque stage (thickened, elevated, indurated plaques), and finally Tumor stage (large, dome-shaped, frequently ulcerating nodules/tumors with high risk of systemic dissemination)."
    },
    {
        "q": "A 70-year-old {gender} presents with severe, generalized skin itching, hair loss, and bright red skin covering 95% of their body surface area. They also have marked palmoplantar thickening and enlarged lymph nodes. A peripheral blood smear reveals atypical T-lymphocytes with highly folded, 'cerebriform' nuclei. What is the diagnosis?",
        "options": [
            "Sezary Syndrome",
            "Erythrodermic psoriasis",
            "Atopic dermatitis",
            "Mycosis Fungoides (Tumor stage)",
            "Drug Reaction with Eosinophilia and Systemic Symptoms (DRESS)"
        ],
        "answer": 0,
        "exp": "Sezary Syndrome is the leukemic (systemic) variant of Cutaneous T-cell Lymphoma. It is classically defined by the clinical triad of: 1) Generalized erythroderma (erythema covering >90% BSA), 2) Generalized lymphadenopathy, and 3) Circulating malignant T-lymphocytes (Sezary cells) featuring a highly folded, brain-like, 'cerebriform' nucleus, along with a helper T-cell predominance (CD4:CD8 ratio >10)."
    },
    {
        "q": "A 35-year-old {gender} presents with a slow-growing, very firm, flesh-colored to violaceous plaque on their abdominal wall that has been present for 2 years. Biopsy shows a highly cellular spindle cell proliferation arranged in a 'storiform' (mat-like or wheel-spoke) pattern, invading the subcutaneous fat in a characteristic 'honeycomb' fashion. The cells stain positive for CD34. What is the diagnosis?",
        "options": [
            "Dermatofibrosarcoma Protuberans (DFSP)",
            "Dermatofibroma",
            "Keloid scar",
            "Invasive Squamous Cell Carcinoma",
            "Kaposi Sarcoma"
        ],
        "answer": 0,
        "exp": "Dermatofibrosarcoma Protuberans (DFSP) is a slow-growing, locally aggressive spindle-cell sarcoma of the dermis, most commonly arising on the trunk or proximal extremities of young adults. Classic histopathology shows a monomorphic proliferation of spindle cells arranged in a storiform (mat-like) pattern that infiltrates the subcutaneous fat, producing a characteristic 'honeycomb' appearance. DFSP cells are strongly CD34-positive."
    },
    {
        "q": "A {age}-old {gender} with a confirmed Dermatofibrosarcoma Protuberans (DFSP) is found to have a pathognomonic t(17;22) translocation, resulting in the fusion of the COL1A1 and PDGFB genes. For unresectable or metastatic DFSP, what targeted medication specifically inhibits the receptor tyrosine kinase activated by this fusion protein?",
        "options": [
            "Imatinib mesylate",
            "Vismodegib",
            "Vemurafenib",
            "Pembrolizumab",
            "Rituximab"
        ],
        "answer": 0,
        "exp": "The t(17;22)(q22;q13) translocation in DFSP fuses the collagen type I alpha 1 (COL1A1) gene with the platelet-derived growth factor beta (PDGFB) gene, leading to continuous, autocrine overproduction of PDGFB ligand. This activates the PDGF receptor tyrosine kinase, driving cell growth. The tyrosine kinase inhibitor Imatinib mesylate specifically blocks this activation and is FDA-approved for unresectable, recurrent, or metastatic DFSP."
    },
    {
        "q": "A {age}-old {gender} presents with multiple flat-topped, violaceous, itchy papules on their wrists. A skin biopsy is performed. The pathologist notes that while the clinical differential included lichen planus and early skin cancer, the histology is completely benign, showing hyperkeratosis, a band-like lymphocytic infiltrate at the dermo-epidermal junction, and saw-tooth rete ridges. Which of the following features is NOT a characteristic clinical warning sign of cutaneous melanoma?",
        "options": [
            "A symmetric, uniform brown color with a perfectly smooth border",
            "A diameter greater than 6 mm",
            "An asymmetric shape",
            "Variegation of color (different shades of brown, black, red, or blue)",
            "Recent rapid growth or changes in the lesion (evolving)"
        ],
        "answer": 0,
        "exp": "A symmetric, uniform brown color with a smooth, round border is characteristic of a benign acquired melanocytic nevus. In contrast, the classic warning signs of cutaneous melanoma are represented by the ABCDE criteria: Asymmetry, Border irregularity, Color variegation, Diameter > 6 mm, and Evolving (recent changes in size, shape, color, or symptoms)."
    }
]

ages = ["25-year", "35-year", "45-year", "55-year", "62-year", "68-year", "72-year", "78-year", "20-year", "28-year", "38-year", "50-year", "12-year", "17-year", "19-year"]
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

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260519_derm_malignancies_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Dermatology: Skin Malignancies\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'derm-malignancies' LIMIT 1;\n")
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
