module.exports = [
  {
    title: "The Abscess Dilemma",
    scenario: "A 30-year-old male presents with a painful, red lump on his buttock for 3 days.\n\nVitals: Normal.\nPhysical Examination: A 3-cm erythematous, warm, fluctuant nodule. There is no surrounding cellulitis.\nLaboratory Results: None.",
    disease: "Cutaneous Abscess (I&D vs. Antibiotics)",
    questions: [
      {
        q: "What is the 'Best Initial Management' for a simple, fluctuant cutaneous abscess?",
        options: ["Oral Antibiotics only", "Incision and Drainage (I&D) only", "Topical Steroids", "Needle aspiration"],
        ans: 1,
        exp: "For a simple abscess, I&D is the definitive treatment and often does not require antibiotics."
      },
      {
        q: "In which of the following scenarios should systemic antibiotics be ADDED to I&D?",
        options: ["Severe or extensive disease", "Systemic signs of infection (fever, tachycardia)", "Associated cellulitis", "All of the above"],
        ans: 3,
        exp: "Antibiotics are reserved for complicated cases or those with systemic involvement."
      },
      {
        q: "Is a 'culture' of the pus usually required for a simple abscess in a healthy patient?",
        options: ["Yes, always", "No, it is usually unnecessary for simple abscesses as the results rarely change management", "Only in the elderly", "None"],
        ans: 1,
        exp: "Empiric management after drainage is standard for low-risk patients."
      }
    ]
  },
  {
    title: "The Face 'Pimple' and the Mohs",
    scenario: "A 65-year-old male has a biopsy-proven Basal Cell Carcinoma on the tip of his nose.\n\nVitals: Normal.\nPhysical Examination: 8-mm pearly papule on the nasal tip.\nLaboratory Results: Biopsy shows nodular BCC.",
    disease: "BCC Management (Mohs vs. WLE)",
    questions: [
      {
        q: "Why is Mohs Micrographic Surgery preferred over standard Wide Local Excision (WLE) for this patient?",
        options: ["It is cheaper", "It provides the highest cure rate while maximizing tissue sparing in a cosmetically sensitive area (H-zone)", "It doesn't require anesthesia", "None"],
        ans: 1,
        exp: "Mohs is the gold standard for 'high-risk' locations like the nose, ears, and eyes."
      },
      {
        q: "What is the primary difference in how 'margins' are checked in Mohs vs. standard excision?",
        options: ["In Mohs, 100% of the surgical margin is examined intraoperatively; standard excision uses 'bread-loafing' which only checks ~1%", "There is no difference", "Standard excision is more accurate", "None"],
        ans: 0,
        exp: "The horizontal sectioning in Mohs ensures no tumor 'roots' are missed."
      },
      {
        q: "If the tumor were on the back and was < 1cm, what would be an appropriate alternative?",
        options: ["Mohs", "Standard excision with 4mm margins or Electrodesiccation and Curettage (ED&C)", "Chemotherapy", "None"],
        ans: 1,
        exp: "Low-risk sites can be managed with simpler surgical techniques."
      }
    ]
  },
  {
    title: "The Melanoma Depth",
    scenario: "A biopsy of a dark mole on the leg shows Malignant Melanoma with a Breslow depth of 0.5 mm. There is no ulceration and no lymphadenopathy.\n\nVitals: Normal.\nPhysical Examination: No palpable nodes.\nLaboratory Results: Biopsy: 0.5 mm depth, Stage IA.",
    disease: "Melanoma (Excision Margins)",
    questions: [
      {
        q: "What is the required margin for Wide Local Excision (WLE) of a melanoma < 1 mm thick (T1)?",
        options: ["0.5 cm", "1 cm", "2 cm", "5 cm"],
        ans: 1,
        exp: "Standard WLE margin for T1 melanoma is 1 cm."
      },
      {
        q: "Is Sentinel Lymph Node Biopsy (SLNB) indicated for this patient (0.5 mm, no ulceration)?",
        options: ["Yes", "No, it is generally not indicated for depth < 0.8 mm without other high-risk features", "Only if the patient is young", "None"],
        ans: 1,
        exp: "SLNB is usually reserved for T1b (ulceration or >0.8mm) or higher."
      },
      {
        q: "What is the most important prognostic factor for this patient?",
        options: ["Width of the lesion", "Breslow thickness", "The number of colors", "None"],
        ans: 1,
        exp: "Depth of invasion remains the primary survival predictor."
      }
    ]
  },
  {
    title: "The 'Boils' that Won''t Quit",
    scenario: "A 28-year-old female with Hurley Stage II Hidradenitis Suppurativa (recurrent abscesses and a few sinus tracts in the axilla) has failed oral antibiotics.\n\nVitals: Normal.\nPhysical Examination: Chronic inflammatory nodules and one interconnected sinus tract in the left axilla.\nLaboratory Results: None.",
    disease: "Hidradenitis Suppurativa (Medical vs. Surgical)",
    questions: [
      {
        q: "For an acutely painful, fluctuant HS abscess, what is the 'surgical' procedure of choice for IMMEDIATE relief?",
        options: ["Wide radical excision", "Incision and Drainage (I&D)", "Deroofing of the sinus tract", "None"],
        ans: 1,
        exp: "I&D provides fast symptomatic relief but has a high recurrence rate in HS."
      },
      {
        q: "Which surgical technique is preferred for chronic, recurrent HS sinus tracts to minimize recurrence?",
        options: ["Simple I&D", "Deroofing (unroofing) of the tract or local excision", "Liposuction", "None"],
        ans: 1,
        exp: "Deroofing preserves more tissue while removing the epithelialized tract."
      },
      {
        q: "When should 'Radical Wide Excision' be considered?",
        options: ["For a single pimple", "For severe, diffuse Hurley Stage III disease where medical and limited surgical therapies have failed", "Never", "Only in children"],
        ans: 1,
        exp: "Radical excision is a 'last-resort' surgery for extensive disease."
      }
    ]
  },
  {
    title: "The Leg Ulcer Choice",
    scenario: "A 70-year-old male with chronic venous insufficiency presents with a large, shallow ulcer on his medial malleolus.\n\nVitals: Normal.\nPhysical Examination: Pitting edema, stasis dermatitis, and a shallow ulcer with irregular borders and 'brawny' pigmentation.\nLaboratory Results: ABI (Ankle-Brachial Index) is 1.0 (Normal).",
    disease: "Venous Ulcer (Compression vs. Surgery)",
    questions: [
      {
        q: "What is the 'Gold Standard' for the medical management of venous ulcers?",
        options: ["Bed rest only", "Compression therapy (e.g., bandages, stockings)", "Topical antibiotics", "Surgical debridement alone"],
        ans: 1,
        exp: "Compression reverses the underlying venous hypertension."
      },
      {
        q: "When should 'Surgical' intervention (e.g., endovenous ablation of the saphenous vein) be considered?",
        options: ["Immediately for all patients", "For ulcers that fail to heal with 3-6 months of adequate compression therapy, or to prevent recurrence", "Never", "Only if the ulcer is infected"],
        ans: 1,
        exp: "Surgical correction of the underlying reflux is a key 'Step 2' management point for refractory cases."
      },
      {
        q: "What must be ruled out (via ABI) BEFORE applying strong compression?",
        options: ["Venous reflux", "Peripheral Arterial Disease (PAD)", "Diabetes", "None"],
        ans: 1,
        exp: "Compressing a limb with poor arterial supply can lead to necrosis."
      }
    ]
  },
  {
    title: "The Rapid Growth Volcano",
    scenario: "A 60-year-old male has a 2-cm dome-shaped red nodule on his hand that grew over 4 weeks.\n\nVitals: Normal.\nPhysical Examination: A firm nodule with a central 'keratin plug'.\nLaboratory Results: None.",
    disease: "Keratoacanthoma (Management)",
    questions: [
      {
        q: "What is the standard surgical approach for a suspected Keratoacanthoma?",
        options: ["Observation (it might go away)", "Excisional biopsy with margins similar to Squamous Cell Carcinoma (SCC)", "Shave biopsy only", "None"],
        ans: 1,
        exp: "Since KAs are difficult to distinguish from invasive SCC, they are treated as SCCs."
      },
      {
        q: "Why is 'Watchful Waiting' generally avoided despite the potential for spontaneous regression?",
        options: ["It takes too long", "The risk of misdiagnosing an invasive SCC and allowing it to metastasize", "Insurance reasons", "None"],
        ans: 1,
        exp: "Clinical and histologic overlap with SCC makes observation dangerous."
      },
      {
        q: "What is the 'Most Likely' diagnosis for this rapid-growth nodule?",
        options: ["BCC", "Keratoacanthoma (often considered a variant of SCC)", "Molluscum", "Wart"],
        ans: 1,
        exp: "The 'volcano' appearance is classic for KA."
      }
    ]
  },
  {
    title: "The Neck Lump and the 'Pore'",
    scenario: "A 30-year-old male presents with a firm lump on his neck that sometimes expresses 'cheesy, smelly' material.\n\nVitals: Normal.\nPhysical Examination: A 2-cm subcutaneous nodule with a central 'punctum' (opening).\nLaboratory Results: None.",
    disease: "Epidermoid Cyst (Incision vs. Excision)",
    questions: [
      {
        q: "If the cyst is acutely inflamed, red, and painful, what is the best initial step?",
        options: ["Immediate surgical excision of the whole cyst", "Incision and Drainage (I&D) or intralesional steroid injection", "Oral antibiotics only", "None"],
        ans: 1,
        exp: "Inflamed cysts are difficult to excise cleanly; calming the inflammation first is preferred."
      },
      {
        q: "What is REQUIRED for definitive, permanent removal of the cyst?",
        options: ["I&D alone", "Complete excision of the cyst wall (capsule)", "Oral antibiotics", "None"],
        ans: 1,
        exp: "If the wall remains, the cyst will likely recur."
      },
      {
        q: "The 'cheesy' material inside the cyst is composed of what?",
        options: ["Pus (bacteria)", "Macerated Keratin", "Sebum", "None"],
        ans: 1,
        exp: "Epidermoid cysts are lined with stratified squamous epithelium and fill with keratin."
      }
    ]
  },
  {
    title: "The 'Red Flag' Leg Pain",
    scenario: "A patient with a 'skin infection' on the leg has pain that is 'out of proportion' to the redness. He is now febrile and tachycardic.\n\nVitals: T 39.8 C, BP 90/60.\nPhysical Examination: Dusky erythema, crepitus, and extreme tenderness extending beyond the visible redness.\nLaboratory Results: WBC 35,000.",
    disease: "Necrotizing Fasciitis (Surgical Emergency)",
    questions: [
      {
        q: "What is the single most important intervention for this patient?",
        options: ["IV Antibiotics", "Emergent surgical debridement and exploration", "Hyperbaric oxygen", "Wait for MRI"],
        ans: 1,
        exp: "Surgery is the only way to stop the spread of necrotizing fasciitis; antibiotics alone are insufficient."
      },
      {
        q: "How does the surgeon determine the extent of debridement?",
        options: ["Based on the surface redness", "By exploring the fascia until healthy, bleeding tissue is reached ('Finger sweep' test)", "Based on the CT scan only", "None"],
        ans: 1,
        exp: "Intraoperative exploration is the gold standard for assessing depth and spread."
      },
      {
        q: "What is a characteristic intraoperative finding?",
        options: ["Pus-filled pockets", "'Dishwater' fluid and lack of bleeding/resistance of the fascia", "Normal tissue", "None"],
        ans: 1,
        exp: "The 'dishwater' discharge is a hallmark of tissue liquefaction."
      }
    ]
  },
  {
    title: "The Bleeding Bump",
    scenario: "A 20-year-old male has a red bump on his lip that bleeds every time he eats.\n\nVitals: Normal.\nPhysical Examination: A 5-mm friable, red papule with a collarette of scale.\nLaboratory Results: None.",
    disease: "Pyogenic Granuloma (Shave vs. Cautery)",
    questions: [
      {
        q: "What is the most effective surgical treatment for a pyogenic granuloma?",
        options: ["Observation", "Shave excision followed by curettage and electrocautery of the base", "Topical antibiotics", "Cryotherapy"],
        ans: 1,
        exp: "Deep cautery of the base is needed to prevent high rates of recurrence."
      },
      {
        q: "Why is 'Shave' preferred over 'Punch' or 'Excision' for this specific lesion?",
        options: ["It's faster and provides a specimen for pathology to rule out amelanotic melanoma", "It doesn't require numbing", "It's cheaper", "None"],
        ans: 0,
        exp: "Shave allows for quick removal and essential histologic confirmation."
      },
      {
        q: "Is this lesion likely to resolve on its own?",
        options: ["Yes, after 1 week", "No, they usually persist and continue to bleed until treated", "Only in children", "None"],
        ans: 1,
        exp: "The chronic bleeding makes active management necessary."
      }
    ]
  },
  {
    title: "The Ear Earlobe Piercing Keloid",
    scenario: "A 16-year-old female presents with a large keloid on her earlobe 1 year after a piercing.\n\nVitals: Normal.\nPhysical Examination: A 2.5-cm firm, rubbery mass extending from the earlobe.\nLaboratory Results: None.",
    disease: "Keloid (Surgery vs. Medical)",
    questions: [
      {
        q: "What is the risk of performing 'Simple Surgical Excision' for a keloid?",
        options: ["None", "High rate of recurrence (often returning larger than the original)", "It heals perfectly", "None"],
        ans: 1,
        exp: "Keloids are notorious for recurring after trauma (including surgery)."
      },
      {
        q: "What is the preferred management algorithm for this patient?",
        options: ["Surgery only", "Intralesional steroid injections (first-line) or Surgery combined with adjuvant therapy (steroids, pressure, or radiation)", "Topical antibiotics", "None"],
        ans: 1,
        exp: "Combined therapy is required to minimize the risk of a larger recurrence."
      },
      {
        q: "Which specific adjuvant therapy is often used on the earlobe specifically?",
        options: ["Radiation", "Pressure earrings", "Chemotherapy", "None"],
        ans: 1,
        exp: "Compression is a recognized tool to prevent keloid regrowth."
      }
    ]
  },
  {
    title: "The Scalp Tumor and the Mohs",
    scenario: "An 80-year-old male with a 2-cm Squamous Cell Carcinoma (SCC) on his scalp. The skin is tight.\n\nVitals: Normal.\nPhysical Examination: Indurated plaque on the vertex scalp.\nLaboratory Results: Biopsy shows SCC.",
    disease: "SCC Management (Mohs)",
    questions: [
      {
        q: "Why is Mohs surgery indicated for a 2-cm SCC on the scalp?",
        options: ["Large size (>2cm) and high-risk location", "It's the only option", "It prevents hair loss", "None"],
        ans: 0,
        exp: "Size > 2cm on the scalp is an NCCN criterion for high-risk SCC, making Mohs appropriate."
      },
      {
        q: "If the SCC is found to be invading the bone, what is the next step?",
        options: ["Continue Mohs", "Refer to Surgical Oncology/ENT for multidisciplinary management (e.g., partial calvariectomy)", "Topical 5-FU", "None"],
        ans: 1,
        exp: "Bone invasion exceeds the limits of standard outpatient Mohs."
      },
      {
        q: "What is the primary benefit of Mohs in 'tight' skin areas like the scalp?",
        options: ["It makes the skin loose", "Maximum tissue conservation to allow for easier closure or grafting", "No stitches are needed", "None"],
        ans: 1,
        exp: "Sparing every millimeter is critical when there is little redundant skin for repair."
      }
    ]
  },
  {
    title: "The Infantile Hemangioma",
    scenario: "A 2-month-old infant has a rapidly growing 'strawberry' mark on the eyelid that is starting to obstruct vision.\n\nVitals: Normal.\nPhysical Examination: A bright red, raised plaque on the upper eyelid.\nLaboratory Results: None.",
    disease: "Infantile Hemangioma (Medical vs. Surgical)",
    questions: [
      {
        q: "What is the 'First-Line' treatment for a vision-threatening infantile hemangioma?",
        options: ["Surgical excision", "Oral Propranolol", "Laser therapy", "Wait for spontaneous regression"],
        ans: 1,
        exp: "Beta-blockers (Propranolol) are the gold standard for shrinking high-risk hemangiomas."
      },
      {
        q: "When should surgery be considered for a hemangioma?",
        options: ["Day 1 for all lesions", "Residual skin changes (fibrofatty tissue) after the involution phase (usually age 4-10) or if medical therapy fails", "Never", "Only if it is blue"],
        ans: 1,
        exp: "Early surgery is rarely needed now that medical therapy is so effective."
      },
      {
        q: "What is the natural history of most infantile hemangiomas?",
        options: ["They grow forever", "Rapid proliferation (first 6-9 months) followed by slow spontaneous involution (years)", "They disappear overnight", "None"],
        ans: 1,
        exp: "Most will eventually regress without treatment, but high-risk sites (eyes, airway) require intervention."
      }
    ]
  },
  {
    title: "The Burn and the Graft",
    scenario: "A patient with a deep partial-thickness burn on the back of the hand. The wound has not healed after 3 weeks.\n\nVitals: Normal.\nPhysical Examination: Pale, non-blanching burn wound on the dorsal hand.\nLaboratory Results: None.",
    disease: "Burn Management (Grafting)",
    questions: [
      {
        q: "What is the indication for skin grafting in a burn patient?",
        options: ["All first-degree burns", "Full-thickness burns or deep partial-thickness burns that fail to heal within 2-3 weeks", "Only for cosmetic reasons", "None"],
        ans: 1,
        exp: "Failure to re-epithelialize within 3 weeks significantly increases the risk of hypertrophic scarring."
      },
      {
        q: "What is the primary benefit of 'Early Excision and Grafting'?",
        options: ["Less pain", "Reduced infection risk, shorter hospital stay, and better functional outcomes", "Cheaper", "None"],
        ans: 1,
        exp: "Removing necrotic tissue (eschar) and providing a permanent cover is the pillar of modern burn care."
      },
      {
        q: "What is the 'Donor Site'?",
        options: ["The area being grafted", "The healthy skin area from which the graft is harvested", "The hospital", "None"],
        ans: 1,
        exp: "Donor site management is also a critical part of the surgical plan."
      }
    ]
  },
  {
    title: "The Venous Ulcer and the Ablation",
    scenario: "A patient with a chronic venous ulcer that has recurred 3 times despite compression.\n\nVitals: Normal.\nPhysical Examination: Varicose veins, stasis changes, and a recurrent ulcer.\nLaboratory Results: Duplex ultrasound shows severe reflux in the Great Saphenous Vein (GSV).",
    disease: "Venous Reflux (Surgical Decision)",
    questions: [
      {
        q: "What is the best 'Surgical' next step to prevent further ulcer recurrence?",
        options: ["Skin grafting the ulcer only", "Endovenous Thermal Ablation (EVTA) of the refluxing saphenous vein", "Amputation", "None"],
        ans: 1,
        exp: "Fixing the 'source' (the venous reflux) is more important than just treating the 'symptom' (the ulcer)."
      },
      {
        q: "How does ablation work?",
        options: ["It removes the vein", "It uses heat (laser or radiofrequency) to seal the incompetent vein, diverting blood to healthy deep veins", "It stretches the vein", "None"],
        ans: 1,
        exp: "Modern minimally invasive techniques have largely replaced traditional vein stripping."
      },
      {
        q: "Should compression be continued after surgery?",
        options: ["No", "Yes, it is often still necessary for long-term management of chronic venous insufficiency", "Only for 1 day", "None"],
        ans: 1,
        exp: "Surgery treats the reflux, but the overall venous health remains a priority."
      }
    ]
  },
  {
    title: "The Suspicious Subungual Line",
    scenario: "A 50-year-old female has a 4-mm dark, longitudinal brown band on her thumbnail that has widened over the last year.\n\nVitals: Normal.\nPhysical Examination: Pigmentation involves the proximal nail fold (Hutchinson sign).\nLaboratory Results: None.",
    disease: "Subungual Melanoma (Management)",
    questions: [
      {
        q: "What is the 'Best Next Step' for a suspicious pigmented nail band?",
        options: ["Observation", "Nail matrix biopsy (typically a punch or longitudinal excision)", "Wait for the nail to grow out", "Antifungal cream"],
        ans: 1,
        exp: "Biopsy of the nail matrix is required to rule out melanoma."
      },
      {
        q: "The Hutchinson sign in this context refers to what?",
        options: ["Nerve pain", "Pigment extending onto the nail fold, highly suggestive of subungual melanoma", "Nail pitting", "None"],
        ans: 1,
        exp: "This is a classic 'Step' clinical sign."
      },
      {
        q: "If the biopsy confirms invasive melanoma, what is the standard surgical treatment?",
        options: ["Nail removal only", "Amputation (at the IP joint for a digit)", "WLE of the skin only", "None"],
        ans: 1,
        exp: "Wide margins often necessitate amputation of the distal phalanx."
      }
    ]
  },
  {
    title: "The Pressure Ulcer (Debridement)",
    scenario: "A bedbound patient has a Stage 4 pressure ulcer on the sacrum with thick, black, leathery tissue in the base.\n\nVitals: Normal.\nPhysical Examination: A deep ulcer with visible bone and a 'cap' of black eschar.\nLaboratory Results: None.",
    disease: "Pressure Ulcer (Surgical Management)",
    questions: [
      {
        q: "What is the first step in managing the 'Eschar' (black tissue) in a pressure ulcer (assuming it is NOT on the heel)?",
        options: ["Keep it dry", "Surgical (sharp) debridement of all necrotic tissue", "Topical antibiotics", "None"],
        ans: 1,
        exp: "Necrotic tissue must be removed to allow for granulation and to prevent infection."
      },
      {
        q: "Why is 'Stable Eschar' on the heel sometimes left alone (NOT debrided)?",
        options: ["It heals faster", "The heel has poor blood supply; the intact eschar acts as a natural biological cover as long as there is no infection", "Heels don't get infected", "None"],
        ans: 1,
        exp: "This is a key exception in wound management protocols."
      },
      {
        q: "Is 'Wound Vac' (Negative Pressure Wound Therapy) used before or after debridement?",
        options: ["Before", "After (only once the wound bed is clean and free of necrotic tissue)", "Instead of debridement", "None"],
        ans: 1,
        exp: "The wound must be 'prepped' surgically before advanced therapies can work."
      }
    ]
  },
  {
    title: "The Lipoma and the Pain",
    scenario: "A 40-year-old male has several soft, rubbery lumps under the skin of his arms. One is becoming painful when touched.\n\nVitals: Normal.\nPhysical Examination: Multiple 2-4 cm soft, mobile subcutaneous nodules. One nodule on the forearm is tender.\nLaboratory Results: None.",
    disease: "Lipoma vs. Angiolipoma",
    questions: [
      {
        q: "What is the management for an asymptomatic, classic lipoma?",
        options: ["Surgical excision", "Observation and reassurance", "Liposuction only", "None"],
        ans: 1,
        exp: "Benign lipomas do not require removal unless symptomatic or for cosmetic reasons."
      },
      {
        q: "A PAINFUL lipoma is often histologically classified as what?",
        options: ["Malignant Liposarcoma", "Angiolipoma", "Fibroma", "None"],
        ans: 1,
        exp: "Angiolipomas contain prominent small vessels and are characteristically tender."
      },
      {
        q: "When should a subcutaneous 'fatty' mass prompt an urgent biopsy/excision?",
        options: ["If it is soft", "If it is >10 cm, deep (subfascial), rapidly growing, or firm/fixed (risk of Liposarcoma)", "If there are many of them", "None"],
        ans: 1,
        exp: "Size and depth are key 'Red Flags' for malignancy."
      }
    ]
  },
  {
    title: "The Seborrheic Keratosis and the Shave",
    scenario: "An 80-year-old male has an itchy, 'stuck-on' brown growth on his back.\n\nVitals: Normal.\nPhysical Examination: Classic seborrheic keratosis.\nLaboratory Results: None.",
    disease: "Seborrheic Keratosis (Management)",
    questions: [
      {
        q: "What is the best initial management for a bothersome but benign SK?",
        options: ["Wait for it to fall off", "Cryotherapy (freezing) or Shave removal", "Chemotherapy", "None"],
        ans: 1,
        exp: "Simple destructive or surgical methods are curative."
      },
      {
        q: "Why might you choose 'Shave Removal' over 'Cryotherapy'?",
        options: ["It's faster", "It provides a tissue specimen for pathology to confirm the diagnosis (especially if melanoma is in the differential)", "It doesn't hurt", "None"],
        ans: 1,
        exp: "Confirmation is critical if the lesion has atypical features."
      },
      {
        q: "Does an SK need margins?",
        options: ["Yes, 5mm", "No, it is a benign epidermal proliferation; removal of the visible lesion is sufficient", "Only in the elderly", "None"],
        ans: 1,
        exp: "SKs are purely superficial."
      }
    ]
  },
  {
    title: "The 'Pearly' Bump and the Curettage",
    scenario: "A 75-year-old male has a small (4mm) pearly papule on his shoulder. Biopsy shows superficial BCC.\n\nVitals: Normal.\nPhysical Examination: Small pearly papule on the back.\nLaboratory Results: Superficial BCC.",
    disease: "BCC (ED&C vs. Excision)",
    questions: [
      {
        q: "What is 'Electrodesiccation and Curettage' (ED&C)?",
        options: ["A type of laser", "A technique of scraping away soft tumor tissue and cauterizing the base", "A freezing technique", "None"],
        ans: 1,
        exp: "ED&C is effective for low-risk, superficial tumors in non-critical areas."
      },
      {
        q: "Why is ED&C NOT recommended for the face?",
        options: ["It doesn't work there", "It leaves a 'cigarette-burn' scar and has higher recurrence rates on the face compared to Mohs/Excision", "It causes nerve damage", "None"],
        ans: 1,
        exp: "The cosmetic outcome is generally poor."
      },
      {
        q: "How does the surgeon know they have scraped deep enough during ED&C?",
        options: ["Based on time", "The 'feel' of the tissue (tumor is soft/mushy; healthy dermis is firm/gritty)", "Based on the patient's scream", "None"],
        ans: 1,
        exp: "This is a 'blind' procedure that relies on the tactile feedback of the curette."
      }
    ]
  },
  {
    title: "The Warty Foot and the Surgery",
    scenario: "A patient has a large, painful plantar wart on the heel.\n\nVitals: Normal.\nPhysical Examination: A thick, hyperkeratotic plaque with black dots.\nLaboratory Results: None.",
    disease: "Plantar Wart (Management)",
    questions: [
      {
        q: "Why is 'Deep Surgical Excision' generally AVOIDED for plantar warts?",
        options: ["Warts have roots", "High risk of painful, permanent scarring on the weight-bearing sole, which can be more bothersome than the wart", "The wart will always return", "None"],
        ans: 1,
        exp: "Preserving the architectural integrity of the sole is the priority."
      },
      {
        q: "What is the preferred 'Destructive' management for plantar warts?",
        options: ["Topical Salicylic acid or Cryotherapy", "Oral antibiotics", "IV steroids", "None"],
        ans: 0,
        exp: "Non-scarring methods are first-line."
      },
      {
        q: "What are the 'Black Dots' seen in a wart?",
        options: ["Dirt", "Thrombosed capillaries", "Mites", "None"],
        ans: 1,
        exp: "Paring down the wart to see these dots helps confirm the diagnosis."
      }
    ]
  },
  {
    title: "The Dog Bite and the Sutures",
    scenario: "A child is brought in with a jagged laceration on the cheek from a dog bite that happened 2 hours ago.\n\nVitals: Normal.\nPhysical Examination: A 3-cm clean laceration on the face.\nLaboratory Results: None.",
    disease: "Mammalian Bites (Management)",
    questions: [
      {
        q: "Can a 'Face' bite be primarily sutured (closed immediately)?",
        options: ["No, never", "Yes, the excellent blood supply of the face allows for primary closure of clean, early bites with good cosmetic results", "Only in adults", "None"],
        ans: 1,
        exp: "The face is an exception to the 'don't close bites' rule."
      },
      {
        q: "How does this differ from a dog bite to the 'Hand'?",
        options: ["Hands are cleaner", "Hand bites are generally left open (secondary intention) or loosely closed due to the high risk of infection in the small spaces", "There is no difference", "None"],
        ans: 1,
        exp: "Hand infections can be devastating for function."
      },
      {
        q: "Which antibiotic is first-line for prophylaxis in an animal bite?",
        options: ["Cephalexin", "Amoxicillin-Clavulanate (Augmentin)", "Doxycycline", "None"],
        ans: 1,
        exp: "It covers Pasteurella and anaerobic organisms."
      }
    ]
  },
  {
    title: "The 'Red' Leg and the Doppler",
    scenario: "A patient with unilateral leg swelling and redness. Is it cellulitis or DVT?\n\nVitals: HR 110.\nPhysical Examination: Warm, red, swollen right calf. Tender along the deep vein.\nLaboratory Results: None.",
    disease: "Cellulitis vs. DVT (Diagnostic Reasoning)",
    questions: [
      {
        q: "When a patient presents with unilateral leg redness and swelling, which 'Surgical' emergency must be ruled out first?",
        options: ["Cellulitis", "Deep Vein Thrombosis (DVT)", "Fungal infection", "None"],
        ans: 1,
        exp: "A missed DVT can lead to a fatal pulmonary embolism."
      },
      {
        q: "What is the 'Best Initial Test' to rule out DVT in this patient?",
        options: ["Blood cultures", "Venous Duplex Ultrasound", "CT scan", "ABI"],
        ans: 1,
        exp: "Ultrasound is the highly sensitive/specific first step."
      },
      {
        q: "If the Ultrasound is negative and the patient has a high fever/WBC, what is the most likely diagnosis?",
        options: ["DVT", "Cellulitis", "Stasis dermatitis", "None"],
        ans: 1,
        exp: "Once a clot is ruled out, the focus shifts to infection."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Wound' (Reasoning)",
    scenario: "A patient with a non-healing ulcer is having a 'biopsy' taken.\n\nVitals: Normal.\nPhysical Examination: Ulcer.\nLaboratory Results: None.",
    disease: "Chronic Ulcer (Biopsy Decision)",
    questions: [
      {
        q: "What is the 'Marjolin Ulcer'?",
        options: ["A type of bedsore", "A Squamous Cell Carcinoma arising within a chronic wound or burn scar", "A fungal ulcer", "None"],
        ans: 1,
        exp: "Any chronic wound that changes or fails to heal must be biopsied to rule out malignancy."
      },
      {
        q: "How many years does it typically take for a Marjolin ulcer to develop?",
        options: ["1 week", "Decades (typically 20-30 years of chronic inflammation)", "1 month", "None"],
        ans: 1,
        exp: "It is a late complication of chronic tissue injury."
      },
      {
        q: "Is a Marjolin ulcer more aggressive than a sun-induced SCC?",
        options: ["No", "Yes, they have a much higher rate of metastasis", "Only in the elderly", "None"],
        ans: 1,
        exp: "These are high-risk tumors requiring aggressive surgical management."
      }
    ]
  },
  {
    title: "The 'Pearly' Papule and the 'Cryo'",
    scenario: "A 90-year-old frail female with a small BCC on her forehead. The family wants to avoid surgery.\n\nVitals: Normal.\nPhysical Examination: 5-mm BCC.\nLaboratory Results: None.",
    disease: "BCC in the Elderly (Non-surgical options)",
    questions: [
      {
        q: "What is a reasonable 'Non-surgical' destructive option for a small, low-risk BCC in a very elderly patient?",
        options: ["Oral antibiotics", "Cryosurgery or Radiation therapy", "Topical steroids", "None"],
        ans: 1,
        exp: "Minimizing surgical burden is a valid consideration in the frail elderly."
      },
      {
        q: "What is the primary disadvantage of 'Cryosurgery' for BCC?",
        options: ["It hurts", "Lack of a tissue specimen to confirm margins", "It's too fast", "None"],
        ans: 1,
        exp: "The surgeon is essentially treating 'blindly'."
      },
      {
        q: "Is Topical Imiquimod or 5-FU FDA-approved for INVASIVE BCC?",
        options: ["Yes", "No, they are only approved for SUPERFICIAL BCC", "Only for nodular BCC", "None"],
        ans: 1,
        exp: "Topicals do not penetrate deeply enough for nodular or invasive tumors."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Punctum' (Reasoning)",
    scenario: "A patient with a 'cyst' on his back. It is not bothering him, but his wife wants it gone.\n\nVitals: Normal.\nPhysical Examination: 2-cm epidermoid cyst.\nLaboratory Results: None.",
    disease: "Epidermoid Cyst (Observation Decision)",
    questions: [
      {
        q: "In the absence of symptoms (pain, inflammation, rapid growth), what is the most appropriate management for an epidermoid cyst?",
        options: ["Immediate surgery", "Observation and reassurance", "Oral antibiotics", "None"],
        ans: 1,
        exp: "Elective removal is only for cosmetic preference or recurrent inflammation."
      },
      {
        q: "If the cyst 'ruptures' internally, what does it look like clinically?",
        options: ["It disappears", "It looks like an abscess (red, painful, hot) but is often a 'sterile' inflammatory response to the keratin", "It causes cancer", "None"],
        ans: 1,
        exp: "This 'pseudo-abscess' often requires I&D even if not infected."
      },
      {
        q: "Can you 'squeeze' a cyst out through the punctum safely?",
        options: ["Yes", "No, this often ruptures the wall internally, leading to severe inflammation", "Only with a needle", "None"],
        ans: 1,
        exp: "Squeezing is discouraged due to the risk of internal rupture."
      }
    ]
  }
];
