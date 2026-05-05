module.exports = [
  {
    title: "The Patchy Itch",
    scenario: "A 55-year-old male presents with long-standing 'eczema' on his buttocks and trunk. It has not responded to mid-potency topical steroids over several years.\n\nVitals: Normal.\nPhysical Examination: Multiple 5-10 cm, thin, erythematous, slightly scaly patches with a 'cigarette paper' (atrophic) appearance. Distribution is in non-sun-exposed 'bathing suit' areas.\nLaboratory Results: Biopsy shows a band-like infiltrate of atypical lymphocytes in the upper dermis with prominent epidermotropism (Pautrier microabscesses).",
    disease: "Mycosis Fungoides (Patch Stage)",
    questions: [
      {
        q: "What is Mycosis Fungoides?",
        options: ["A fungal infection", "The most common form of Cutaneous T-Cell Lymphoma (CTCL)", "A type of SCC", "A benign growth"],
        ans: 1,
        exp: "Despite the name, it is a primary skin lymphoma, not a fungal infection."
      },
      {
        q: "What is epidermotropism in the context of MF?",
        options: ["Cancer spreading to the liver", "The migration of malignant T-cells into the epidermis without significant spongiosis", "Skin thickening", "Loss of hair"],
        ans: 1,
        exp: "Epidermotropism is a hallmark histologic feature of MF."
      },
      {
        q: "What is the classic distribution for early Mycosis Fungoides?",
        options: ["Face and sun-exposed areas", "Non-sun-exposed 'bathing suit' distribution (buttocks, trunk, inner thighs)", "Palms and soles", "Scalp only"],
        ans: 1,
        exp: "MF classically avoids the sun, favoring areas covered by clothing."
      }
    ]
  },
  {
    title: "The Thickening Patch",
    scenario: "A patient with known patch-stage MF returns with several areas that have become thick, indurated, and elevated.\n\nVitals: Normal.\nPhysical Examination: Well-demarcated, dusky red, scaly, elevated plaques on the trunk and limbs.\nLaboratory Results: Biopsy shows a denser dermal infiltrate of atypical T-cells.",
    disease: "Mycosis Fungoides (Plaque Stage)",
    questions: [
      {
        q: "What is the progression of MF stages?",
        options: ["Tumor -> Plaque -> Patch", "Patch -> Plaque -> Tumor", "Patch -> Tumor -> Plaque", "Plaque -> Patch -> Tumor"],
        ans: 1,
        exp: "MF typically follows a slow progression over years or decades through these three clinical stages."
      },
      {
        q: "What is a Pautrier microabscess?",
        options: ["A collection of pus", "A small cluster of malignant T-cells within the epidermis", "A fungal colony", "A calcified follicle"],
        ans: 1,
        exp: "These clusters are highly suggestive of MF."
      },
      {
        q: "What is a common skin-directed therapy for plaque-stage MF?",
        options: ["Systemic chemotherapy", "Phototherapy (PUVA or Narrowband UVB) or topical nitrogen mustard", "Oral antibiotics", "Topical antifungal"],
        ans: 1,
        exp: "Skin-directed therapies are preferred for early-stage disease to minimize systemic toxicity."
      }
    ]
  },
  {
    title: "The Ulcerating Tumor",
    scenario: "A 65-year-old with a 20-year history of MF now presents with large, mushroom-like, ulcerating nodules on his chest.\n\nVitals: Normal.\nPhysical Examination: Multiple 3-5 cm firm, reddish-brown, ulcerated nodules.\nLaboratory Results: Biopsy shows a diffuse, non-epidermotropic dermal infiltrate of large atypical T-cells. Large cell transformation is noted.",
    disease: "Mycosis Fungoides (Tumor Stage)",
    questions: [
      {
        q: "What is the prognosis of tumor-stage MF compared to patch-stage?",
        options: ["Better", "Significantly worse, with high risk of systemic involvement (lymph nodes, viscera)", "The same", "Always curative"],
        ans: 1,
        exp: "Tumor stage indicates a more aggressive biology and a higher stage (IIB)."
      },
      {
        q: "What is 'large cell transformation' in MF?",
        options: ["The cells get bigger and more benign", "A poor prognostic finding where >25% of the infiltrate consists of cells 4x larger than small lymphocytes", "The tumor turns into BCC", "The cells turn into fat"],
        ans: 1,
        exp: "Transformation marks a transition to a more aggressive clinical course."
      },
      {
        q: "Which systemic therapy is specifically used for tumor-stage or refractory MF?",
        options: ["Topical steroids", "Bexarotene (a systemic retinoid X receptor selective retinoid)", "Penicillin", "Moisturizers"],
        ans: 1,
        exp: "Systemic retinoids like Bexarotene or HDAC inhibitors like Vorinostat are used for advanced MF."
      }
    ]
  },
  {
    title: "The Red Man (Sezary)",
    scenario: "A 70-year-old male presents with generalized redness and severe itching. He has enlarged lymph nodes in his neck and groin.\n\nVitals: Normal.\nPhysical Examination: Diffuse erythroderma (redness >90% BSA). Palmoplantar keratoderma. Generalized lymphadenopathy.\nLaboratory Results: Peripheral blood smear shows lymphocytes with 'cerebriform' nuclei. Flow cytometry shows a CD4:CD8 ratio >10.",
    disease: "Sezary Syndrome",
    questions: [
      {
        q: "What is Sezary Syndrome?",
        options: ["A fungal infection of the blood", "The leukemic (systemic) phase of CTCL, characterized by erythroderma, lymphadenopathy, and circulating malignant T-cells", "A type of psoriasis", "A benign drug rash"],
        ans: 1,
        exp: "Sezary syndrome is defined by the triad of erythroderma, lymphadenopathy, and circulating Sezary cells."
      },
      {
        q: "What is a Sezary cell?",
        options: ["A red blood cell", "A malignant T-cell with a folded, 'cerebriform' (brain-like) nucleus", "A giant cell", "A plasma cell"],
        ans: 1,
        exp: "The unique nuclear morphology is a key diagnostic clue."
      },
      {
        q: "What is the primary treatment modality for Sezary Syndrome?",
        options: ["Topical steroids only", "Extracorporeal Photopheresis (ECP)", "Oral antibiotics", "Surgical excision"],
        ans: 1,
        exp: "ECP is a systemic therapy that treats the patient's blood with a photosensitizer and UV light to induce apoptosis of malignant T-cells."
      }
    ]
  },
  {
    title: "The Firm Plaque on the Trunk",
    scenario: "A 35-year-old female presents with a slow-growing, firm, 'woody' plaque on her abdomen that has been present for 2 years.\n\nVitals: Normal.\nPhysical Examination: A 5 cm multi-nodular, firm, flesh-colored to violaceous plaque on the abdominal wall.\nLaboratory Results: Biopsy shows a 'storiform' (mat-like) pattern of spindle cells invading the subcutaneous fat in a 'honeycomb' fashion. IHC is positive for CD34.",
    disease: "Dermatofibrosarcoma Protuberans (DFSP)",
    questions: [
      {
        q: "What is the classic histological pattern of DFSP?",
        options: ["Peripheral palisading", "Storiform pattern of spindle cells", "Keratin pearls", "Melanin nests"],
        ans: 1,
        exp: "A storiform (wheel-spoke) arrangement of fibroblasts is characteristic."
      },
      {
        q: "Which genetic translocation is pathognomonic for DFSP?",
        options: ["t(9;22)", "t(17;22) involving COL1A1 and PDGFB", "t(15;17)", "t(8;14)"],
        ans: 1,
        exp: "This translocation results in the overexpression of Platelet-Derived Growth Factor Beta (PDGFB), driving tumor growth."
      },
      {
        q: "What is the treatment of choice for DFSP?",
        options: ["Shave excision", "Mohs Micrographic Surgery or Wide Local Excision with very broad margins (2-3 cm)", "Topical imiquimod", "Radiation only"],
        ans: 1,
        exp: "DFSP has long, tentacle-like extensions into the surrounding tissue, necessitating wide or Mohs-guided clearance to prevent recurrence."
      }
    ]
  },
  {
    title: "The Bruise that Grew",
    scenario: "An 80-year-old male with chronic lymphedema of the arm following axillary node dissection for breast cancer presents with purple spots on the swollen limb.\n\nVitals: Normal.\nPhysical Examination: Multiple ill-defined purple-to-red 'bruise-like' patches and nodules on an edematous arm.\nLaboratory Results: Biopsy shows malignant endothelial cells forming irregular vascular channels that dissect between collagen bundles.",
    disease: "Angiosarcoma (Stewart-Treves Syndrome)",
    questions: [
      {
        q: "What is Stewart-Treves Syndrome?",
        options: ["A type of melanoma", "Angiosarcoma arising in a setting of chronic lymphedema", "A genetic heart defect", "A fungal infection"],
        ans: 1,
        exp: "Chronic lymphedema is a known risk factor for the development of this aggressive vascular malignancy."
      },
      {
        q: "What is the most common site for 'classic' (non-Stewart-Treves) angiosarcoma?",
        options: ["Scalp and face of elderly males", "Palms", "Lower legs of children", "Internal organs only"],
        ans: 0,
        exp: "Classic angiosarcoma typically affects the head and neck of older men."
      },
      {
        q: "What is the prognosis for cutaneous angiosarcoma?",
        options: ["Excellent", "Poor, with high rates of local recurrence and early pulmonary metastasis", "Benign", "Curable with topical therapy"],
        ans: 1,
        exp: "Angiosarcoma is one of the most aggressive and lethal skin malignancies."
      }
    ]
  },
  {
    title: "The Eyelid Nodule",
    scenario: "A 65-year-old female presents with a yellow-orange nodule on her right upper eyelid. She has been treated for 'recurrent chalazion' multiple times at the same site.\n\nVitals: Normal.\nPhysical Examination: A firm, yellow-hued nodule on the tarsal plate of the upper eyelid. Loss of eyelashes (madarosis) in that area.\nLaboratory Results: Biopsy shows lobules of cells with foamy, vacuolated cytoplasm (sebaceous differentiation).",
    disease: "Sebaceous Carcinoma",
    questions: [
      {
        q: "Why is sebaceous carcinoma often misdiagnosed?",
        options: ["It is invisible", "It mimics benign conditions like chalazion or blepharitis", "It looks like a wart", "It looks like a freckle"],
        ans: 1,
        exp: "A 'chalazion' that recurs in the same spot or doesn't respond to standard treatment must be biopsied to rule out sebaceous carcinoma."
      },
      {
        q: "Which syndrome is associated with multiple sebaceous tumors and internal malignancies (especially GI)?",
        options: ["Gorlin syndrome", "Muir-Torre syndrome (a variant of Lynch syndrome)", "Cowden syndrome", "Gardner syndrome"],
        ans: 1,
        exp: "Muir-Torre features sebaceous adenomas, epitheliomas, or carcinomas and internal cancers (mismatch repair defect)."
      },
      {
        q: "What is 'pagetoid spread' in sebaceous carcinoma?",
        options: ["Spread to the bones", "The migration of malignant cells individually into the overlying conjunctival or epidermal epithelium", "Spread to the lymph nodes", "Spread to the liver"],
        ans: 1,
        exp: "Pagetoid spread makes determining surgical margins very difficult."
      }
    ]
  },
  {
    title: "The Itchy Vulva",
    scenario: "A 60-year-old woman presents with a chronic, 'unbearably itchy' red patch on her vulva. She has used antifungal creams for a year.\n\nVitals: Normal.\nPhysical Examination: A well-demarcated, bright red, moist plaque with small white islands of hyperkeratosis ('strawberries and cream' appearance).\nLaboratory Results: Biopsy shows large, pale cells (Paget cells) infiltrating the epidermis. They are PAS positive.",
    disease: "Extramammary Paget's Disease (EMPD)",
    questions: [
      {
        q: "What is Extramammary Paget's Disease?",
        options: ["An infection", "An intraepithelial adenocarcinoma, most commonly on the vulva or perianal skin", "A type of SCC", "A fungal rash"],
        ans: 1,
        exp: "EMPD is a slow-growing cancer that mimics eczema or tinea."
      },
      {
        q: "What is the significance of diagnosing EMPD, especially in the perianal area?",
        options: ["It is always benign", "It is associated with an underlying internal malignancy (e.g., colorectal or urogenital) in up to 25% of cases", "It means the patient has breast cancer", "It is contagious"],
        ans: 1,
        exp: "A thorough workup for internal adenocarcinoma is mandatory in EMPD patients."
      },
      {
        q: "What stain helps differentiate Paget cells from melanoma cells?",
        options: ["S100", "PAS (Periodic Acid-Schiff) or Mucicarmine (Paget cells contain mucin and are positive; melanoma is negative)", "Gram stain", "KOH"],
        ans: 1,
        exp: "The presence of mucin (PAS+) confirms the glandular (adenocarcinoma) nature of Paget's."
      }
    ]
  },
  {
    title: "Melanoma Complications: Brain",
    scenario: "A 55-year-old male with a history of a 4mm Breslow melanoma on his back 2 years ago presents with new-onset headaches and a seizure.\n\nVitals: Normal.\nPhysical Examination: No new skin lesions. Neurological deficits noted on exam.\nLaboratory Results: MRI shows multiple ring-enhancing lesions in the brain.",
    disease: "Metastatic Melanoma (CNS)",
    questions: [
      {
        q: "What is the most common cause of death from metastatic melanoma?",
        options: ["Liver failure", "Central Nervous System (CNS) metastases", "Skin infection", "Kidney failure"],
        ans: 1,
        exp: "Melanoma has a high predilection for spreading to the brain."
      },
      {
        q: "If a patient has a single brain metastasis from melanoma, what is a potential treatment?",
        options: ["Topical imiquimod", "Surgical resection or Stereotactic Radiosurgery (Gamma Knife)", "Oral antibiotics", "Wait and see"],
        ans: 1,
        exp: "Local control of brain mets can significantly improve quality of life and survival."
      },
      {
        q: "Does immunotherapy work for brain metastases?",
        options: ["No, it can't cross the blood-brain barrier", "Yes, drugs like Nivolumab and Ipilimumab have shown activity against intracranial melanoma", "Only if given as an injection into the brain", "Only in children"],
        ans: 1,
        exp: "Modern immunotherapy has revolutionized the treatment of CNS melanoma."
      }
    ]
  },
  {
    title: "SCC: The Nodal Mass",
    scenario: "A 70-year-old male with a history of multiple SCCs of the scalp presents with a firm, painless 3 cm lump in his neck.\n\nVitals: Normal.\nPhysical Examination: A fixed, non-tender, firm mass in the right cervical lymph node chain.\nLaboratory Results: Fine needle aspiration (FNA) confirms metastatic squamous cell carcinoma.",
    disease: "Metastatic SCC (Nodal)",
    questions: [
      {
        q: "Which cutaneous SCCs are at highest risk for nodal metastasis?",
        options: ["Small ones on the trunk", "Large (>2cm), deep (>6mm), poorly differentiated tumors on the ear or lip", "Those arising in a sunspot", "All SCCs have equal risk"],
        ans: 1,
        exp: "Size, depth, and location are key prognostic indicators for SCC."
      },
      {
        q: "What is the standard management for a patient with a single regional node metastasis from skin SCC?",
        options: ["Chemotherapy only", "Regional lymph node dissection and potentially adjuvant radiation", "Topical therapy", "Observation"],
        ans: 1,
        exp: "Surgical removal of the nodal basin is the mainstay of treatment for regional spread."
      },
      {
        q: "What is the role of PD-1 inhibitors (e.g., Cemiplimab) in SCC?",
        options: ["None", "First-line for metastatic or locally advanced SCC not amenable to surgery/radiation", "Only for BCC", "Only for melanoma"],
        ans: 1,
        exp: "Cemiplimab was the first immunotherapy approved specifically for advanced cutaneous SCC."
      }
    ]
  },
  {
    title: "Targeted Therapy: The Escape",
    scenario: "A patient on Vemurafenib (BRAF inhibitor) for metastatic melanoma initially had a dramatic response, but after 6 months, the tumors have begun to grow back.\n\nVitals: Normal.\nPhysical Examination: New subcutaneous nodules appearing.\nLaboratory Results: Repeat biopsy shows the same V600E mutation.",
    disease: "BRAF Inhibitor Resistance",
    questions: [
      {
        q: "What is the most common mechanism of resistance to BRAF inhibitor monotherapy?",
        options: ["The mutation disappears", "Reactivation of the MAP kinase pathway through alternative routes (e.g., MEK or NRAS bypass)", "The patient stops taking the drug", "The tumor turns into BCC"],
        ans: 1,
        exp: "Tumors 'learn' to bypass the specific BRAF block."
      },
      {
        q: "How is this resistance clinically managed?",
        options: ["Increasing the dose of the BRAF inhibitor", "Using dual therapy with both a BRAF inhibitor AND a MEK inhibitor (e.g., Dabrafenib + Trametinib)", "Switching to antibiotics", "Surgery"],
        ans: 1,
        exp: "Blocking the pathway at two points (BRAF and MEK) significantly delays the onset of resistance."
      },
      {
        q: "Is immunotherapy an option after BRAF therapy fails?",
        options: ["No", "Yes, and it is often sequenced either before or after targeted therapy", "Only if the BRAF mutation is gone", "Only in the elderly"],
        ans: 1,
        exp: "Patients who fail targeted therapy can still respond to checkpoint inhibitors."
      }
    ]
  },
  {
    title: "Immunotherapy: The Side Effect",
    scenario: "A patient receiving Ipilimumab for melanoma develops 10 episodes of bloody diarrhea per day and severe abdominal pain.\n\nVitals: T 38.0 C, HR 105, BP 100/60.\nPhysical Examination: Diffuse abdominal tenderness.\nLaboratory Results: Colonoscopy shows diffuse ulceration and inflammation of the colonic mucosa.",
    disease: "Immune-Mediated Colitis",
    questions: [
      {
        q: "What is the cause of this patient's diarrhea?",
        options: ["Infection (C. diff)", "Immune-related Adverse Event (irAE) - specifically Ipilimumab-induced autoimmune colitis", "Food poisoning", "Side effect of surgery"],
        ans: 1,
        exp: "Checkpoint inhibitors can cause 'autoimmune' side effects in almost any organ."
      },
      {
        q: "What is the first-line treatment for severe (Grade 3/4) immune-mediated colitis?",
        options: ["Antibiotics", "High-dose systemic corticosteroids (e.g., IV Methylprednisolone)", "Increasing the Ipilimumab dose", "Anti-diarrheal meds (Loperamide) only"],
        ans: 1,
        exp: "You must suppress the overactive immune system to prevent bowel perforation."
      },
      {
        q: "If steroids fail to improve the colitis, what biologic can be used?",
        options: ["Nivolumab", "Infliximab (TNF-alpha inhibitor)", "Rituximab", "Insulin"],
        ans: 1,
        exp: "Infliximab is the standard 'rescue' therapy for steroid-refractory immunotherapy colitis."
      }
    ]
  },
  {
    title: "Immunotherapy: Endocrine Effects",
    scenario: "A patient on Pembrolizumab complains of extreme fatigue, cold intolerance, and weight gain.\n\nVitals: HR 55 (bradycardia).\nPhysical Examination: Non-pitting edema (myxedema), delayed relaxation of deep tendon reflexes.\nLaboratory Results: TSH 50 (Very high), Free T4 low.",
    disease: "Immunotherapy-induced Hypothyroidism",
    questions: [
      {
        q: "How common are endocrine side effects with PD-1 inhibitors?",
        options: ["Very rare", "Relatively common (up to 10-15% of patients)", "100%", "Only in women"],
        ans: 1,
        exp: "Thyroid dysfunction is one of the most frequent irAEs."
      },
      {
        q: "Unlike colitis, if a patient develops hypothyroidism from immunotherapy, do you usually need to stop the cancer treatment?",
        options: ["Yes, immediately", "No, you usually continue the immunotherapy and simply provide lifelong thyroid hormone replacement (Levothyroxine)", "Yes, forever", "No, it goes away on its own"],
        ans: 1,
        exp: "Endocrine toxicities are often permanent but easily managed with replacement therapy."
      },
      {
        q: "What is another, more dangerous endocrine irAE to watch for?",
        options: ["Diabetes type 2", "Primary Adrenal Insufficiency (Adrenal Crisis) or Hypophysitis", "Hyperparathyroidism", "Gout"],
        ans: 1,
        exp: "Adrenal crisis can be life-threatening and requires prompt steroid replacement."
      }
    ]
  },
  {
    title: "The Blue-White Veil",
    scenario: "A dermatologist is performing dermoscopy on a dark, suspicious lesion on a patient's back.\n\nVitals: Normal.\nPhysical Examination: A 7mm dark blue and white variegated plaque.\nLaboratory Results: Dermoscopy shows a 'blue-white veil' and 'atypical pigment network'.",
    disease: "Dermoscopy of Melanoma",
    questions: [
      {
        q: "What does a 'blue-white veil' on dermoscopy represent histologically?",
        options: ["Too much water", "A thick area of orthokeratosis (the white) overlying a dense collection of heavily pigmented melanocytes in the dermis (the blue/Tyndall effect)", "A fungal infection", "A scar"],
        ans: 1,
        exp: "The blue-white veil is highly specific for invasive melanoma."
      },
      {
        q: "What are 'chrysalis structures' (or shiny white streaks)?",
        options: ["Bugs", "Bright white, short, linear streaks seen only with polarized dermoscopy, representing altered dermal collagen", "Small blisters", "Hairs"],
        ans: 1,
        exp: "These structures are often seen in melanoma and BCC."
      },
      {
        q: "What is the benefit of dermoscopy for the clinician?",
        options: ["It cures the cancer", "It increases sensitivity and specificity for the diagnosis of melanoma compared to the naked eye", "It is used for treatment", "It is only for research"],
        ans: 1,
        exp: "Dermoscopy allows visualization of structures beneath the stratum corneum."
      }
    ]
  },
  {
    title: "Mohs Micrographic Surgery",
    scenario: "A patient is undergoing Mohs surgery for a BCC on the tip of the nose.\n\nVitals: Normal.\nPhysical Examination: Small defect on the nose after the first 'stage'.\nLaboratory Results: The surgeon is looking at frozen sections in the office.",
    disease: "Mohs Surgery Technique",
    questions: [
      {
        q: "What is the primary advantage of Mohs surgery over standard wide local excision?",
        options: ["It is faster", "It allows for 100% margin evaluation while preserving as much healthy tissue as possible", "It uses general anesthesia", "It doesn't leave a scar"],
        ans: 1,
        exp: "By examining horizontal sections of the entire margin, Mohs provides the highest cure rate."
      },
      {
        q: "How are Mohs sections cut compared to traditional 'bread-loafing'?",
        options: ["Vertically", "Horizontally (tangentially), allowing the entire deep and peripheral margin to be seen on one slide", "In triangles", "They aren't cut"],
        ans: 1,
        exp: "Traditional bread-loafing only samples about 1% of the margin."
      },
      {
        q: "Which skin cancer is Mohs NOT typically the first-line treatment for?",
        options: ["Nodular BCC on the nose", "Superficial BCC on the back", "Infiltrative BCC on the eyelid", "SCC on the lip"],
        ans: 1,
        exp: "Low-risk tumors in low-risk areas (like the trunk) can be treated with simpler, less expensive methods."
      }
    ]
  },
  {
    title: "Field Therapy for AKs",
    scenario: "A patient with dozens of actinic keratoses on his face is prescribed a cream to use for 5 days.\n\nVitals: Normal.\nPhysical Examination: Diffuse sun damage and multiple AKs.\nLaboratory Results: None.",
    disease: "Topical Field Therapy",
    questions: [
      {
        q: "What is the mechanism of 5-fluorouracil (5-FU) cream?",
        options: ["Antifungal", "Antimetabolite that inhibits thymidylate synthase, causing death of rapidly dividing (dysplastic) cells", "Antibiotic", "Steroid"],
        ans: 1,
        exp: "5-FU targets the DNA synthesis of the precancerous cells."
      },
      {
        q: "What is Imiquimod's mechanism?",
        options: ["Killing cells directly", "Toll-like receptor 7 (TLR7) agonist that stimulates the local innate and adaptive immune response", "Blocking the sun", "Moisturizing"],
        ans: 1,
        exp: "Imiquimod uses the patient's own immune system to clear the AKs."
      },
      {
        q: "What should the patient be warned about when using these creams?",
        options: ["The skin will look perfect during treatment", "The treated area will become red, crusty, and inflamed (this is a sign the drug is working)", "The skin will turn blue", "There are no side effects"],
        ans: 1,
        exp: "The 'brisk' inflammatory response is expected and necessary for efficacy."
      }
    ]
  },
  {
    title: "The Sister Mary Joseph Nodule",
    scenario: "A 65-year-old male presents with a firm, red-to-purple nodule in his umbilicus.\n\nVitals: Normal.\nPhysical Examination: A 1.5 cm indurated, slightly ulcerated nodule at the umbilicus.\nLaboratory Results: Biopsy shows adenocarcinoma. Imaging reveals a mass in the stomach.",
    disease: "Sister Mary Joseph Nodule",
    questions: [
      {
        q: "What is a Sister Mary Joseph nodule?",
        options: ["A type of BCC", "Cutaneous metastasis to the umbilicus from an internal (usually intra-abdominal) malignancy", "A hernia", "An umbilical infection"],
        ans: 1,
        exp: "It is a classic sign of advanced internal cancer, most commonly gastric, pancreatic, or ovarian."
      },
      {
        q: "Who was Sister Mary Joseph?",
        options: ["A dermatologist", "The surgical assistant to Dr. William Mayo who noticed that patients with umbilical nodules often had advanced abdominal cancer", "The patient", "A famous surgeon"],
        ans: 1,
        exp: "Her observation has remained a classic clinical sign in medicine."
      },
      {
        q: "What is the prognosis when this nodule is found?",
        options: ["Excellent", "Poor, as it usually represents advanced, metastatic disease", "Benign", "Curative"],
        ans: 1,
        exp: "The presence of cutaneous metastasis generally indicates Stage IV disease."
      }
    ]
  },
  {
    title: "SCC: The High-Risk Ear",
    scenario: "A 70-year-old male has an SCC on the helix of his ear. It is 2.5 cm in diameter.\n\nVitals: Normal.\nPhysical Examination: Firm, scaly nodule on the ear.\nLaboratory Results: Biopsy shows poorly differentiated SCC with perineural invasion.",
    disease: "High-Risk SCC Features",
    questions: [
      {
        q: "Which of these is a high-risk feature for SCC recurrence and metastasis?",
        options: ["Diameter < 1cm", "Perineural invasion (tumor cells wrapping around nerves)", "Well-differentiated histology", "Location on the arm"],
        ans: 1,
        exp: "Perineural invasion allows the tumor to travel along nerve sheaths far from the primary site."
      },
      {
        q: "Why is the ear a high-risk location?",
        options: ["It has a lot of hair", "Thin skin and proximity to large vessels/lymphatics, leading to higher metastatic rates", "It is hard to wash", "It is cold"],
        ans: 1,
        exp: "SCCs on the 'mask' area of the face (ears, lips, nose) are inherently more aggressive."
      },
      {
        q: "What is the management of choice for this ear lesion?",
        options: ["Cryosurgery", "Mohs Micrographic Surgery", "Topical imiquimod", "Shave excision"],
        ans: 1,
        exp: "High-risk SCCs should be managed with Mohs or wide local excision with margin control."
      }
    ]
  },
  {
    title: "SCC: The Lower Lip",
    scenario: "A 60-year-old male smoker with a history of many years of sun exposure presents with a non-healing white patch on his lower lip.\n\nVitals: Normal.\nPhysical Examination: Diffuse blurring of the vermilion border of the lower lip with scaly white patches (leukoplakia). One area is ulcerated.\nLaboratory Results: Biopsy of the ulcer shows invasive SCC.",
    disease: "Actinic Cheilitis and Lip SCC",
    questions: [
      {
        q: "What is the precursor to SCC of the lip?",
        options: ["Cold sores", "Actinic Cheilitis (essentially AK of the lip)", "Fordyce spots", "Mucocele"],
        ans: 1,
        exp: "Actinic cheilitis results from chronic sun damage to the lower lip."
      },
      {
        q: "Which lip is more commonly affected by SCC and why?",
        options: ["Upper lip, more sun exposure", "Lower lip, because it protrudes more and receives more direct UV radiation", "Both equally", "Upper lip, due to smoking"],
        ans: 1,
        exp: "The lower lip's anatomy makes it much more susceptible to sun damage."
      },
      {
        q: "What is the metastatic rate for SCC of the lip?",
        options: ["0%", "Approximately 10-15%", "90%", "50%"],
        ans: 1,
        exp: "The lip is a high-risk site with significant potential for nodal spread."
      }
    ]
  },
  {
    title: "SCC: The Slow-Growing Wart",
    scenario: "A 70-year-old male presents with a large, wart-like growth on the sole of his foot that has been present for 5 years. He thought it was a plantar wart.\n\nVitals: Normal.\nPhysical Examination: A massive, cauliflower-like, malodorous plaque on the heel. It is very slow-growing and locally destructive.\nLaboratory Results: Biopsy shows a very well-differentiated squamous proliferation with 'pushing' borders.",
    disease: "Verrucous Carcinoma (Ackerman Tumor)",
    questions: [
      {
        q: "What is Verrucous Carcinoma?",
        options: ["A viral wart", "A low-grade, well-differentiated variant of SCC that is locally aggressive but rarely metastasizes", "A type of melanoma", "A benign cyst"],
        ans: 1,
        exp: "It looks like a wart but is a slow-motion cancer."
      },
      {
        q: "What is the term for verrucous carcinoma occurring in the oral cavity (often in tobacco chewers)?",
        options: ["Bowen's disease", "Oral florid papillomatosis", "Erythroplasia of Queyrat", "Leukoplakia"],
        ans: 1,
        exp: "It presents as white, shaggy plaques in the mouth."
      },
      {
        q: "What is the treatment?",
        options: ["Wart freezing", "Wide surgical excision", "Antibiotics", "Topical steroids"],
        ans: 1,
        exp: "Surgery is curative, but it must be completely removed to prevent local destruction."
      }
    ]
  },
  {
    title: "BCC: The Recurrent Nodule",
    scenario: "A patient has a BCC on the nose that was treated with 'scraping and burning' 2 years ago. It has now returned as a scar with a small pearl in the center.\n\nVitals: Normal.\nPhysical Examination: A 1 cm scar on the nasal tip with a recurrent pearly papule and telangiectasias.\nLaboratory Results: Biopsy confirms recurrent BCC.",
    disease: "Recurrent BCC Management",
    questions: [
      {
        q: "Why is a recurrent BCC more difficult to treat than a primary one?",
        options: ["The cells are stronger", "The tumor is often larger than it appears and is hidden within the surgical scar tissue", "It is always metastatic", "It doesn't bleed"],
        ans: 1,
        exp: "Scar tissue masks the borders of the tumor."
      },
      {
        q: "What is the gold standard treatment for recurrent BCC on the face?",
        options: ["Repeat scraping (C&E)", "Mohs Micrographic Surgery", "Topical 5-FU", "Radiation"],
        ans: 1,
        exp: "Mohs surgery is specifically indicated for recurrent tumors due to its margin-mapping capability."
      },
      {
        q: "What is the 5-year cure rate for Mohs surgery in recurrent BCC?",
        options: ["50%", "Approximately 95-97%", "10%", "100%"],
        ans: 1,
        exp: "Even for difficult recurrent cases, Mohs offers excellent cure rates."
      }
    ]
  },
  {
    title: "The High-Yield Malignancy Review",
    scenario: "A medical student is preparing for the dermatology shelf exam.\n\nVitals: Normal.\nPhysical Examination: Focused.\nLaboratory Results: None.",
    disease: "Skin Malignancy Summary",
    questions: [
      {
        q: "What is the most important prognostic factor for a localized melanoma?",
        options: ["Color", "Breslow depth", "Diameter", "Patient age"],
        ans: 1,
        exp: "Depth is the key to staging and prognosis."
      },
      {
        q: "Which skin cancer is most common in organ transplant recipients?",
        options: ["BCC", "SCC (often outnumbering BCC 3:1 or 4:1)", "Melanoma", "Kaposi Sarcoma"],
        ans: 1,
        exp: "Immunosuppression specifically favors SCC development."
      },
      {
        q: "Which tumor is associated with the Hedgehog signaling pathway?",
        options: ["SCC", "BCC (PTCH1 and SMO mutations)", "Melanoma", "Merkel Cell"],
        ans: 1,
        exp: "BCC pathogenesis is almost universally driven by Hedgehog pathway activation."
      }
    ]
  },
  {
    title: "The Scalp Nodule",
    scenario: "An 80-year-old male presents with a rapidly growing, firm, red-to-purple nodule on his sun-damaged scalp. It appeared only 1 month ago.\n\nVitals: Normal.\nPhysical Examination: A 1.5 cm dome-shaped, ulcerated nodule. It looks very aggressive.\nLaboratory Results: Biopsy shows a pleomorphic spindle cell tumor in the superficial dermis. IHC is negative for S100, Cytokeratins, and Desmin, but positive for CD10.",
    disease: "Atypical Fibroxanthoma (AFX)",
    questions: [
      {
        q: "What is Atypical Fibroxanthoma?",
        options: ["A benign mole", "A low-grade, pleomorphic spindle cell sarcoma of sun-damaged skin", "A type of melanoma", "A fungal infection"],
        ans: 1,
        exp: "AFX is a diagnosis of exclusion (IHC must be negative for melanoma, SCC, and leiomyosarcoma markers) in a spindle cell tumor."
      },
      {
        q: "In which population and site is AFX most common?",
        options: ["Children, trunk", "Elderly men, sun-damaged scalp and ears", "Young women, legs", "Infants, face"],
        ans: 1,
        exp: "Severe solar damage is the primary risk factor for AFX."
      },
      {
        q: "What is the prognosis for AFX?",
        options: ["Poor, high metastatic rate", "Generally excellent with local excision, despite its aggressive histological appearance", "Always lethal", "Benign"],
        ans: 1,
        exp: "AFX looks very 'scary' under the microscope but rarely metastasizes if caught early."
      }
    ]
  },
  {
    title: "The Subtle Indurated Plaque",
    scenario: "A 50-year-old female presents with a slow-growing, skin-colored plaque on her upper lip that she thought was a scar from 10 years ago.\n\nVitals: Normal.\nPhysical Examination: An ill-defined, firm, yellowish-white indurated plaque. It is painless.\nLaboratory Results: Biopsy shows small nests and cords of cells with prominent ductal/microcystic structures infiltrating deep into the dermis and muscle. Perineural invasion is present.",
    disease: "Microcystic Adnexal Carcinoma (MAC)",
    questions: [
      {
        q: "What is the clinical hallmark of MAC?",
        options: ["Rapid growth", "Extremely slow growth and subtle clinical appearance masking deep, aggressive local invasion", "It is always purple", "It is very painful"],
        ans: 1,
        exp: "MAC is a 'wolf in sheep''s clothing,' often misdiagnosed as a benign cyst or scar for years."
      },
      {
        q: "What is the preferred treatment for MAC?",
        options: ["Shave excision", "Mohs Micrographic Surgery (due to its high rate of subclinical spread and perineural invasion)", "Cryosurgery", "Antibiotics"],
        ans: 1,
        exp: "Mohs is essential to track the subtle, deep 'tentacles' of this tumor."
      },
      {
        q: "MAC is a malignancy of which structure?",
        options: ["Melanocytes", "Sweat duct (adnexal) structures", "Nerves", "Fat"],
        ans: 1,
        exp: "It shows differentiation toward sweat ducts and hair follicles."
      }
    ]
  },
  {
    title: "The Red-Purple Back Nodule",
    scenario: "A 45-year-old male presents with several firm, red-to-violaceous nodules on his back. They are not itchy or painful.\n\nVitals: Normal.\nPhysical Examination: Multiple 1-2 cm smooth, non-scaly, erythematous-to-purple nodules on the upper back.\nLaboratory Results: Biopsy shows a dense dermal infiltrate of small lymphocytes, plasma cells, and reactive follicles. IHC shows a B-cell phenotype (CD19+, CD20+, CD79a+).",
    disease: "Primary Cutaneous Marginal Zone Lymphoma (PCMZL)",
    questions: [
      {
        q: "What is PCMZL?",
        options: ["A type of T-cell lymphoma", "An indolent form of Primary Cutaneous B-cell Lymphoma", "A metastatic lung cancer", "A bacterial infection"],
        ans: 1,
        exp: "PCMZL is a low-grade B-cell lymphoma that often remains confined to the skin."
      },
      {
        q: "Which infectious agent has been associated with PCMZL in Europe?",
        options: ["HIV", "Borrelia burgdorferi (the cause of Lyme disease)", "Hepatitis C", "HPV"],
        ans: 1,
        exp: "In certain geographic areas, Borrelia is thought to provide the chronic antigenic stimulus for the B-cell proliferation."
      },
      {
        q: "What is the 5-year survival rate for PCMZL?",
        options: ["10%", "Nearly 100% (it is extremely indolent)", "50%", "0%"],
        ans: 1,
        exp: "Cutaneous marginal zone lymphoma has an excellent prognosis."
      }
    ]
  }
];
