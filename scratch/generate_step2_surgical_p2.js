module.exports = [
  {
    title: "The 'Target' and the 'Burn' (Size)",
    scenario: "A 25-year-old male was in a house fire. He has burns on his entire right arm and the anterior trunk (chest and abdomen).\n\nVitals: Tachycardic, BP 100/60.\nPhysical Examination: Blistered, painful burns on the right arm and chest.\nLaboratory Results: None.",
    disease: "Burn Surface Area (Rule of Nines)",
    questions: [
      {
        q: "Using the 'Rule of Nines', what is the estimated Body Surface Area (BSA) of this patient's burns?",
        options: ["18%", "27% (Right arm = 9%, Anterior Trunk = 18%)", "36%", "45%"],
        ans: 1,
        exp: "Accurate BSA calculation is critical for fluid resuscitation protocols (Parkland formula)."
      },
      {
        q: "What is the 'Best Initial Management' for a patient with >20% BSA burns?",
        options: ["Topical antibiotics only", "Aggressive IV fluid resuscitation and transfer to a specialized Burn Center", "Surgical grafting immediately", "None"],
        ans: 1,
        exp: "Large burns are systemic injuries requiring specialized multi-disciplinary care."
      },
      {
        q: "Which 'Surgical' emergency can occur in a circumferential full-thickness burn of a limb or the chest?",
        options: ["Infection", "Compartment Syndrome (limb) or Respiratory failure (chest) due to the constricting eschar, requiring Escharotomy", "Heart attack", "None"],
        ans: 1,
        exp: "Escharotomy is a life-saving 'surgical' bedside procedure to relieve pressure."
      }
    ]
  },
  {
    title: "The 'Pearly' Bump and the 'Radiation'",
    scenario: "An 85-year-old male with a 1-cm BCC on the eyelid. He is on multiple anticoagulants and is not a candidate for surgery.\n\nVitals: Normal.\nPhysical Examination: Pearly papule on the lower eyelid margin.\nLaboratory Results: None.",
    disease: "BCC Management (Radiation)",
    questions: [
      {
        q: "When is Radiation Therapy considered an appropriate 'Primary' treatment for BCC?",
        options: ["For all young patients", "For older patients who are non-surgical candidates or those who refuse surgery", "Never", "Only for tumors on the back"],
        ans: 1,
        exp: "Radiation is a valid alternative to surgery in the elderly, with good local control rates."
      },
      {
        q: "What is a disadvantage of radiation for skin cancer in a YOUNG patient?",
        options: ["It's too fast", "Risk of long-term cosmetic deterioration (atrophy, telangiectasias) and potential for secondary radiation-induced malignancies later in life", "It doesn't work", "None"],
        ans: 1,
        exp: "Surgery is generally preferred in younger patients to avoid these late effects."
      },
      {
        q: "How does radiation affect future surgical options in the same area?",
        options: ["It makes them easier", "It makes future surgery more difficult due to poor wound healing in irradiated tissue", "No effect", "None"],
        ans: 1,
        exp: "Prior radiation is a 'high-risk' feature for any subsequent surgical repair."
      }
    ]
  },
  {
    title: "The 'Target' and the 'SLNB' (Reasoning)",
    scenario: "A 40-year-old with a 2.5 mm thick melanoma on the back. No nodes are palpable on exam.\n\nVitals: Normal.\nPhysical Examination: No clinical lymphadenopathy.\nLaboratory Results: None.",
    disease: "Sentinel Lymph Node Biopsy (SLNB) Indications",
    questions: [
      {
        q: "What is the primary purpose of a Sentinel Lymph Node Biopsy in melanoma?",
        options: ["To cure the patient", "To provide accurate staging information by checking the 'first' draining node for microscopic metastasis", "To remove all the lymph nodes", "None"],
        ans: 1,
        exp: "SLNB is a staging procedure, not a therapeutic one."
      },
      {
        q: "Based on the depth (2.5 mm), is SLNB indicated?",
        options: ["Yes, for all melanomas > 1 mm (and some T1b lesions)", "No, it is too deep", "Only if it is red", "None"],
        ans: 0,
        exp: "Intermediate thickness (1-4 mm) melanomas are the 'sweet spot' for SLNB indications."
      },
      {
        q: "What is the 'Best Next Step' if the SLNB is POSITIVE (shows microscopic tumor cells)?",
        options: ["Immediate amputation", "Systemic adjuvant therapy (e.g., immunotherapy or targeted therapy) and close nodal basin monitoring", "Radiation only", "None"],
        ans: 1,
        exp: "Modern management has shifted from completion lymph node dissection (CLND) to systemic therapy for positive nodes."
      }
    ]
  },
  {
    title: "The 'Psoriasis' and the 'Surgical' Flare",
    scenario: "A patient with psoriasis is undergoing an elective hip replacement. He is worried about his skin reacting to the surgery.\n\nVitals: Normal.\nPhysical Examination: Stable plaques.\nLaboratory Results: None.",
    disease: "Koebner Phenomenon (Surgical Context)",
    questions: [
      {
        q: "What is the term for the development of psoriasis at the site of surgical incisions?",
        options: ["Infection", "Koebner Phenomenon (Isomorphic response)", "Allergy to sutures", "None"],
        ans: 1,
        exp: "Trauma to the skin can trigger new psoriatic lesions."
      },
      {
        q: "Should this patient's psoriasis be aggressively controlled BEFORE surgery?",
        options: ["No", "Yes, to minimize the inflammatory state and reduce the risk of Koebnerization or post-operative infection", "Only if it is itchy", "None"],
        ans: 1,
        exp: "Pre-operative optimization is beneficial."
      },
      {
        q: "If he developed 'pustules' after surgery, what would be the concern?",
        options: ["Normal healing", "Triggering of generalized pustular psoriasis due to surgical stress or medication changes", "Allergy to soap", "None"],
        ans: 1,
        exp: "Acute flares must be monitored in the post-operative period."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Stitch' (Allergy)",
    scenario: "A patient develops a red, itchy rash exactly where the surgical 'tape' was applied after an excision.\n\nVitals: Normal.\nPhysical Examination: Erythematous, vesicular plaque in a rectangular shape corresponding to the adhesive tape.\nLaboratory Results: None.",
    disease: "Contact Dermatitis (Surgical Adhesive)",
    questions: [
      {
        q: "What is the most likely diagnosis?",
        options: ["Wound infection", "Allergic Contact Dermatitis to the adhesive or rubber component of the tape", "BCC recurrence", "None"],
        ans: 1,
        exp: "The sharp, geometric shape matching the tape is pathognomonic."
      },
      {
        q: "How can you distinguish this from a 'surgical site infection' (SSI)?",
        options: ["SSI has a fever and pus; dermatitis has intense itching and a geometric pattern", "They are the same", "Dermatitis is more painful", "None"],
        ans: 0,
        exp: "Itch vs. Pain and Pattern vs. Diffuse spreading are key differentiators."
      },
      {
        q: "What is the management?",
        options: ["IV Antibiotics", "Discontinue the specific tape and use a low-potency topical steroid if needed", "Give more tape", "None"],
        ans: 1,
        exp: "Avoidance of the allergen is the priority."
      }
    ]
  },
  {
    title: "The 'Bite' and the 'Delayed' Closure",
    scenario: "A patient presents with a 12-hour-old human bite wound on the forearm.\n\nVitals: Normal.\nPhysical Examination: A deep jagged wound with visible bruising.\nLaboratory Results: None.",
    disease: "Human Bite (Delayed Primary Closure)",
    questions: [
      {
        q: "Why is primary (immediate) closure of a human bite on the arm generally AVOIDED?",
        options: ["It hurts", "Extremely high risk of polymicrobial infection due to human oral flora (including Eikenella)", "It leaves a bad scar", "None"],
        ans: 1,
        exp: "Closing 'dirty' wounds traps bacteria and leads to abscess/cellulitis."
      },
      {
        q: "What is the 'Best' management strategy for this wound?",
        options: ["Immediate sutures", "Irrigation, debridement, antibiotics, and 'Healing by Secondary Intention' or 'Delayed Primary Closure'", "Topical steroids", "None"],
        ans: 1,
        exp: "Letting the wound 'breathe' and drain while treating the infection is safer."
      },
      {
        q: "What is the prophylactic antibiotic of choice?",
        options: ["Penicillin only", "Amoxicillin-Clavulanate (Augmentin) to cover Eikenella and anaerobes", "Ciprofloxacin", "None"],
        ans: 1,
        exp: "Augmentin is the gold standard for bites."
      }
    ]
  },
  {
    title: "The 'Pearly' Bump and the 'Shave' (Trap)",
    scenario: "A surgeon performs a 'deep shave' biopsy of a suspicious mole. The pathology returns 'Malignant Melanoma, at least 0.4 mm, transected at the base'.\n\nVitals: Normal.\nPhysical Examination: Shave site on the trunk.\nLaboratory Results: Transected melanoma.",
    disease: "Inadequate Melanoma Biopsy",
    questions: [
      {
        q: "Why was the 'Shave' biopsy a suboptimal choice in this case?",
        options: ["It's too fast", "It transected the base, making it impossible to determine the true Breslow depth (and thus the stage/prognosis)", "It causes too much bleeding", "None"],
        ans: 1,
        exp: "Depth is the most critical staging variable; shave biopsies often cut through the tumor."
      },
      {
        q: "What is the 'Best' next step now that the base is transected?",
        options: ["Wait and see", "Perform a wider/deeper re-excision (residual depth may still be uncertain) and manage based on the visible features", "Give chemotherapy", "None"],
        ans: 1,
        exp: "A 're-excision' is mandatory, but the initial staging data is permanently compromised."
      },
      {
        q: "What would have been the 'Ideal' initial biopsy technique?",
        options: ["Shave", "Excisional biopsy (full-thickness) with narrow (1-3 mm) margins", "Needle aspiration", "None"],
        ans: 1,
        exp: "Full-thickness specimens are required for melanoma."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Graft' (Success)",
    scenario: "A patient has a large skin graft on his leg. Three days later, the graft looks 'purple and boggy'.\n\nVitals: Normal.\nPhysical Examination: Fluid collection under the graft.\nLaboratory Results: None.",
    disease: "Skin Graft Failure (Hematoma/Seroma)",
    questions: [
      {
        q: "What is the most common cause of skin graft 'failure' in the first 48-72 hours?",
        options: ["Infection", "Hematoma or Seroma (fluid collection) preventing the graft from adhering to the bed", "The patient's diet", "None"],
        ans: 1,
        exp: "Fluid acts as a physical barrier to revascularization (plasmatic imbibition)."
      },
      {
        q: "What is the term for the initial stage of graft survival where it 'drinks' nutrients from the bed?",
        options: ["Inosculation", "Plasmatic imbibition", "Neovascularization", "None"],
        ans: 1,
        exp: "This occurs in the first 24-48 hours."
      },
      {
        q: "How do surgeons often prevent fluid collection under a graft?",
        options: ["By using lots of tape", "Applying a 'bolster' (Tie-over) dressing or 'pie-crusting' (making small slits in the graft)", "Giving aspirin", "None"],
        ans: 1,
        exp: "Pressure and drainage are essential for graft 'take'."
      }
    ]
  },
  {
    title: "The 'Pearly' Bump and the 'Lidocaine' (Toxicity)",
    scenario: "During a long Mohs procedure, a patient is given multiple injections of Lidocaine with Epinephrine. She begins to feel 'anxious' and complains of a 'metallic taste' and 'numbness around her mouth'.\n\nVitals: BP 150/90, HR 110.\nPhysical Examination: Circumoral paresthesias and tremors.\nLaboratory Results: None.",
    disease: "Local Anesthetic Systemic Toxicity (LAST)",
    questions: [
      {
        q: "What is the classic early symptom of lidocaine toxicity?",
        options: ["Heart attack", "CNS symptoms: metallic taste, tinnitus, circumoral numbness, and lightheadedness", "Itch", "None"],
        ans: 1,
        exp: "CNS signs usually precede cardiac toxicity."
      },
      {
        q: "What is the maximum recommended dose of Lidocaine WITH Epinephrine for local infiltration?",
        options: ["4.5 mg/kg", "7 mg/kg", "10 mg/kg", "None"],
        ans: 1,
        exp: "Epinephrine allows for a higher dose by slowing absorption; the limit without Epi is 4.5 mg/kg."
      },
      {
        q: "What is the 'Antidote' for severe, life-threatening LAST (seizures/arrhythmia)?",
        options: ["Oxygen", "Intravenous Lipid Emulsion (20% Intralipid)", "Epinephrine", "None"],
        ans: 1,
        exp: "Lipid emulsion acts as a 'sink' to pull the local anesthetic out of the heart/brain."
      }
    ]
  },
  {
    title: "The 'Bite' and the 'Rabies' (Decision)",
    scenario: "A patient was bitten by a 'stray dog' that ran away. The wound is on the hand.\n\nVitals: Normal.\nPhysical Examination: Small puncture wounds.\nLaboratory Results: None.",
    disease: "Rabies Prophylaxis Decision",
    questions: [
      {
        q: "What is the management if the biting animal is a healthy domestic dog that can be observed for 10 days?",
        options: ["Start PEP immediately", "Observe the animal; start PEP only if the animal develops signs of rabies", "Give antibiotics only", "None"],
        ans: 1,
        exp: "Healthy domestic animals can be monitored safely."
      },
      {
        q: "What if the animal is a 'stray' that cannot be found or a 'high-risk' wild animal (e.g., bat, raccoon, skunk)?",
        options: ["Wait for symptoms", "Immediate Post-Exposure Prophylaxis (PEP) with Rabies Vaccine and RIG", "Give Tetanus only", "None"],
        ans: 1,
        exp: "Rabies is 100% fatal once symptoms appear; empiric PEP is mandatory for high-risk exposures."
      },
      {
        q: "Where should the Rabies Immune Globulin (RIG) be administered?",
        options: ["Intramuscularly in the gluteus", "Infiltrated directly into and around the wound site (if possible)", "Only in the arm", "None"],
        ans: 1,
        exp: "RIG provides immediate local neutralizing antibodies."
      }
    ]
  },
  {
    title: "The 'Psoriasis' and the 'Wound' (Infection)",
    scenario: "A psoriasis patient has an elective excision. Three days later, the wound is red and there is 'pustular' drainage.\n\nVitals: T 38.2 C.\nPhysical Examination: Erythema, warmth, and purulent discharge from the incision.\nLaboratory Results: None.",
    disease: "Post-operative Wound Infection",
    questions: [
      {
        q: "What is the most likely causative organism for a surgical site infection occurring < 1 week post-op?",
        options: ["Pseudomonas", "Staphylococcus aureus or Streptococcus pyogenes", "Fungus", "None"],
        ans: 1,
        exp: "Skin flora are the primary pathogens."
      },
      {
        q: "What is the 'Surgical' management for a purulent wound infection?",
        options: ["More antibiotics only", "Opening the wound, drainage of the pus, and potentially packing (healing by secondary intention)", "Tighten the stitches", "None"],
        ans: 1,
        exp: "Source control (drainage) is fundamental to managing an infected space."
      },
      {
        q: "How does the 'Psoriasis' history complicate the diagnosis?",
        options: ["It doesn't", "Koebnerization or localized pustular flare can mimic infection, but fever and purulence strongly favor infection", "It makes it heal faster", "None"],
        ans: 1,
        exp: "The surgeon must distinguish between a 'sterile' flare and a true infection."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Flap' (Decision)",
    scenario: "A surgeon is repairing a defect on the nose. A 'Primary Closure' would cause the nostril to pull upward.\n\nVitals: Normal.\nPhysical Examination: 1-cm defect on the nasal alar rim.\nLaboratory Results: None.",
    disease: "Reconstructive Ladder (Flaps)",
    questions: [
      {
        q: "What is the 'Reconstructive Ladder'?",
        options: ["A list of tools", "A hierarchy of closure techniques from simplest (secondary intention) to most complex (free flap)", "A type of surgery", "None"],
        ans: 1,
        exp: "Surgeons should use the simplest technique that provides an optimal outcome."
      },
      {
        q: "If primary closure causes 'distal distortion' (e.g., pulling the eyelid or nostril), what is the next step up the ladder?",
        options: ["Skin graft", "Local Skin Flap (which recruits adjacent tissue without tension)", "Leave it open", "None"],
        ans: 1,
        exp: "Flaps are preferred on the face for better color and texture match compared to grafts."
      },
      {
        q: "What is the primary difference between a 'Flap' and a 'Graft'?",
        options: ["Flaps are smaller", "A flap maintains its own blood supply (pedicle); a graft is completely severed from its blood supply and must 'take' from the bed", "Grafts are more complex", "None"],
        ans: 1,
        exp: "This is a fundamental principle of plastic and reconstructive surgery."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Latex' (Surgical)",
    scenario: "During a procedure, a patient suddenly develops hives, wheezing, and hypotension.\n\nVitals: BP 80/40, HR 130.\nPhysical Examination: Generalized urticaria, angioedema, and stridor.\nLaboratory Results: None.",
    disease: "Intraoperative Anaphylaxis (Latex)",
    questions: [
      {
        q: "What is the 'Best Initial Treatment' for intraoperative anaphylaxis?",
        options: ["IV Antihistamines", "Intramuscular or IV Epinephrine, aggressive fluids, and removing the trigger", "Steroids", "Oxygen only"],
        ans: 1,
        exp: "Epinephrine is the life-saving treatment of choice."
      },
      {
        q: "Which common surgical item is a frequent cause of intraoperative Type I hypersensitivity?",
        options: ["Scalpels", "Latex gloves/catheters", "Sutures", "None"],
        ans: 1,
        exp: "Latex allergy is a major safety concern in the OR."
      },
      {
        q: "Which 'Fruit' allergies are associated with a higher risk of Latex allergy?",
        options: ["Apples and oranges", "Avocado, Banana, Kiwi, and Chestnut (Latex-fruit syndrome)", "Grapes", "None"],
        ans: 1,
        exp: "Cross-reactivity between plant proteins and latex is a common 'Step' association."
      }
    ]
  },
  {
    title: "The 'Pearly' Bump and the 'Cautery' (Danger)",
    scenario: "A surgeon is using electrocautery near a patient''s pacemaker.\n\nVitals: Normal.\nPhysical Examination: BCC on the upper chest.\nLaboratory Results: None.",
    disease: "Electrosurgery and Pacemakers",
    questions: [
      {
        q: "What is the primary risk of using MONOPOLAR electrocautery in a patient with a pacemaker or ICD?",
        options: ["None", "Electromagnetic interference (EMI) that can cause the device to malfunction, inhibit pacing, or trigger a shock", "It drains the battery", "None"],
        ans: 1,
        exp: "The current path in monopolar cautery travels through the body."
      },
      {
        q: "What is a 'Safer' electrosurgical alternative for these patients?",
        options: ["Lasers", "Bipolar electrocautery (where the current only stays between the two tips of the forceps)", "None", "Burning a candle"],
        ans: 1,
        exp: "Bipolar cautery minimizes the risk of EMI."
      },
      {
        q: "Where should the 'Grounding Pad' be placed in monopolar surgery to minimize risk?",
        options: ["Near the pacemaker", "As far as possible from the device, with the operative site located between the pad and the device", "It doesn't matter", "None"],
        ans: 1,
        exp: "Proper pad placement directs the current away from the electronics."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Adhesive' (Reasoning)",
    scenario: "A patient with a 'wound' is using a transparent film dressing (e.g., Tegaderm).\n\nVitals: Normal.\nPhysical Examination: Clean surgical wound.\nLaboratory Results: None.",
    disease: "Wound Dressing Selection",
    questions: [
      {
        q: "Which type of dressing is best for a 'heavily exudative' (weeping) wound?",
        options: ["Transparent film", "Alginates or Foams (which have high absorbent capacity)", "Dry gauze only", "None"],
        ans: 1,
        exp: "Matching the dressing to the amount of drainage is key to preventing maceration."
      },
      {
        q: "What is the primary function of a 'Hydrocolloid' dressing?",
        options: ["To dry the wound", "To maintain a moist environment and provide autolytic debridement", "To kill bacteria", "None"],
        ans: 1,
        exp: "Hydrocolloids are excellent for superficial wounds with minimal drainage."
      },
      {
        q: "Which dressing should be avoided on 'Infected' wounds because it creates an occlusive environment?",
        options: ["Transparent films and Hydrocolloids", "Gauze", "Antibiotic ointment", "None"],
        ans: 0,
        exp: "Occlusion can promote bacterial overgrowth in an already infected wound."
      }
    ]
  },
  {
    title: "The 'Bite' and the 'Tetanus' (Status)",
    scenario: "A 40-year-old male has a dirty laceration. His last tetanus shot was 12 years ago.\n\nVitals: Normal.\nPhysical Examination: 2-cm dirty wound.\nLaboratory Results: None.",
    disease: "Tetanus Prophylaxis Protocol",
    questions: [
      {
        q: "For a 'dirty' or 'contaminated' wound, what is the threshold for a tetanus booster if the primary series was completed?",
        options: ["Every year", "Every 5 years", "Every 10 years", "None"],
        ans: 1,
        exp: "For clean wounds, it's 10 years; for dirty wounds, it's 5 years."
      },
      {
        q: "In which scenario would Tetanus Immune Globulin (TIG) be required?",
        options: ["For all dirty wounds", "For a dirty wound in a patient with an uncertain or incomplete primary series ( < 3 doses)", "Only if they have a fever", "None"],
        ans: 1,
        exp: "Passive immunization is only for those without a foundational primary series."
      },
      {
        q: "Is the Tetanus vaccine (Tdap/Td) given in the same syringe as RIG?",
        options: ["Yes", "No, they should be given in separate syringes and at separate anatomical sites", "Only in children", "None"],
        ans: 1,
        exp: "Standard protocol for all vaccine/IG combinations."
      }
    ]
  },
  {
    title: "The 'Pearly' Bump and the 'Lidocaine' (Epi)",
    scenario: "A surgeon is injecting lidocaine with epinephrine into a patient''s 'finger' to remove a growth.\n\nVitals: Normal.\nPhysical Examination: Growth on the distal phalanx.\nLaboratory Results: None.",
    disease: "Epinephrine in 'End-Organs' (The Myth)",
    questions: [
      {
        q: "What was the traditional 'Surgical Teaching' regarding epinephrine in fingers, toes, and the nose?",
        options: ["Always use it", "Avoid it due to the risk of distal necrosis/ischemia", "It makes the heart stop", "None"],
        ans: 1,
        exp: "Historically, students were taught 'no epi' in end organs."
      },
      {
        q: "Is there strong evidence for necrosis when using modern, low-concentration (1:100k) epinephrine in these areas?",
        options: ["Yes", "No, recent evidence and large studies show it is safe and highly effective at reducing bleeding and prolonging anesthesia", "Only in smokers", "None"],
        ans: 1,
        exp: "Many dermatologists and hand surgeons now use epinephrine in digits safely."
      },
      {
        q: "Which medication can be used as an 'Antidote' to reverse local epinephrine-induced vasoconstriction if ischemia is suspected?",
        options: ["Lidocaine", "Phentolamine (an alpha-blocker)", "Aspirin", "None"],
        ans: 1,
        exp: "Phentolamine rescue is the standard reversal agent."
      }
    ]
  },
  {
    title: "The 'Psoriasis' and the 'Steroid' (Joint)",
    scenario: "A patient with psoriasis has a very painful, swollen knee. The surgeon is considering an intra-articular steroid injection.\n\nVitals: Normal.\nPhysical Examination: Swollen, warm knee.\nLaboratory Results: Joint aspiration shows 50,000 WBCs (mostly neutrophils).",
    disease: "Septic Arthritis vs. Gout vs. Psoriatic Arthritis",
    questions: [
      {
        q: "What is the 'Most Important' step before injecting a steroid into a swollen joint?",
        options: ["Give oral antibiotics", "Perform joint aspiration and gram stain/culture to rule out septic arthritis", "Apply ice", "None"],
        ans: 1,
        exp: "Injecting a steroid into an infected joint can be catastrophic."
      },
      {
        q: "If the joint shows 'crystals' but the culture is negative, what is the diagnosis?",
        options: ["Septic arthritis", "Gout (monosodium urate) or Pseudogout (CPPD)", "Psoriatic arthritis", "None"],
        ans: 1,
        exp: "Crystals point to a metabolic inflammatory arthritis."
      },
      {
        q: "Psoriatic arthritis can also involve which 'axial' skeleton location?",
        options: ["Cervical spine", "Sacroiliac (SI) joints (Sacroiliitis)", "Skull", "None"],
        ans: 1,
        exp: "PsA is part of the seronegative spondyloarthropathy family."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Biopsy' (Infection)",
    scenario: "A patient with a suspected deep fungal infection (e.g., Sporotrichosis) needs a tissue diagnosis.\n\nVitals: Normal.\nPhysical Examination: Linear nodules on the arm.\nLaboratory Results: None.",
    disease: "Tissue Culture vs. Pathology",
    questions: [
      {
        q: "When biopsying for a suspected deep infection, what should be done with the tissue specimen?",
        options: ["Put it all in Formalin", "Split the specimen: one part in Formalin (for Histology) and one part in Sterile Saline (for Tissue Culture)", "Discard it", "None"],
        ans: 1,
        exp: "Formalin kills organisms; culture requires fresh, sterile tissue."
      },
      {
        q: "Why is 'Tissue Culture' superior to a standard 'Surface Swab' for deep infections?",
        options: ["It's cheaper", "Surface swabs often show colonizing bacteria; tissue culture identifies the actual invading pathogen", "It takes less time", "None"],
        ans: 1,
        exp: "Deep tissue is the 'gold standard' for mycobacterial and fungal infections."
      },
      {
        q: "What is the term for the inflammatory pattern seen on pathology in these cases?",
        options: ["Granulomatous inflammation", "Acne", "Hives", "None"],
        ans: 0,
        exp: "Granulomas are a common response to chronic infection or foreign bodies."
      }
    ]
  },
  {
    title: "The 'Bite' and the 'Cat' (Danger)",
    scenario: "A 10-year-old girl is bitten on the hand by her pet cat.\n\nVitals: Normal.\nPhysical Examination: Small, deep 'puncture' wounds on the dorsum of the hand.\nLaboratory Results: None.",
    disease: "Cat Bites (Surgical Context)",
    questions: [
      {
        q: "Why are 'Cat' bites considered higher risk for deep infection than 'Dog' bites?",
        options: ["Cats are dirtier", "Long, thin fangs create deep puncture wounds that 'inject' bacteria into joints, tendons, and bone", "Cats have more rabies", "None"],
        ans: 1,
        exp: "The 'puncture' mechanism is more likely to cause tenosynovitis or septic arthritis."
      },
      {
        q: "Which specific organism is the 'classic' culprit in cat bite infections?",
        options: ["Staphylococcus", "Pasteurella multocida", "E. coli", "None"],
        ans: 1,
        exp: "Pasteurella is a fast-growing Gram-negative rod found in feline oral flora."
      },
      {
        q: "What is the management for a cat bite on the hand that shows early signs of infection?",
        options: ["Oral antibiotics and outpatient follow-up", "Hospitalization, IV antibiotics, and potentially surgical exploration/irrigation", "Ice only", "None"],
        ans: 1,
        exp: "Hand infections in children can lead to rapid functional loss."
      }
    ]
  },
  {
    title: "The 'Pearly' Bump and the 'Flap' (Necrosis)",
    scenario: "A patient has a transposition flap on the nose. Three days later, the 'tip' of the flap looks black.\n\nVitals: Normal.\nPhysical Examination: Distal necrosis of the skin flap.\nLaboratory Results: None.",
    disease: "Flap Necrosis (Tension vs. Blood Supply)",
    questions: [
      {
        q: "What is the most likely cause of distal flap necrosis?",
        options: ["Infection", "Excessive tension or inadequate venous/arterial supply to the tip", "The patient's age", "None"],
        ans: 1,
        exp: "Flaps have limited blood supply; tension further compromises perfusion."
      },
      {
        q: "Should the 'black' tissue be surgically debrided immediately?",
        options: ["Yes", "No, it is often best to allow the 'biological dressing' (eschar) to declare itself while the underlying tissue heals", "Only if it smells", "None"],
        ans: 1,
        exp: "Early debridement can damage potentially viable tissue underneath."
      },
      {
        q: "What is the primary factor that determines the maximum length of a skin flap?",
        options: ["The surgeon's skill", "The width of the flap base (the pedicle) and the blood supply", "The patient's height", "None"],
        ans: 1,
        exp: "The 'Length-to-Width' ratio is a fundamental rule in flap design."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Silicone'",
    scenario: "A patient is using silicone sheets to treat a hypertrophic scar.\n\nVitals: Normal.\nPhysical Examination: A thick, red, raised scar on the chest.\nLaboratory Results: None.",
    disease: "Silicone Sheeting (Scar Management)",
    questions: [
      {
        q: "How does silicone sheeting help improve the appearance of scars?",
        options: ["It bleaches them", "By increasing hydration and slightly increasing the temperature of the scar, which modifies collagen remodeling", "It kills the scar", "None"],
        ans: 1,
        exp: "Hydration is the primary mechanism."
      },
      {
        q: "How many hours a day should the sheets be worn?",
        options: ["1 hour", "At least 12-24 hours a day for several months", "Only at night", "None"],
        ans: 1,
        exp: "Consistency and long duration are required for efficacy."
      },
      {
        q: "Is it more effective for 'Old' or 'New' scars?",
        options: ["Newer scars (usually starting after the wound has fully closed)", "Old scars from 20 years ago", "Both are equal", "None"],
        ans: 0,
        exp: "Active, remodeling scars respond best."
      }
    ]
  },
  {
    title: "The 'Pearly' Bump and the 'Complication' (Hematoma)",
    scenario: "Four hours after an excision on the scalp, the patient calls because the dressing is 'soaked with blood' and the area is 'tight and painful'.\n\nVitals: Normal.\nPhysical Examination: A firm, tense, and bulging mass under the incision line.\nLaboratory Results: None.",
    disease: "Post-operative Hematoma",
    questions: [
      {
        q: "What is the immediate management for an expanding, tense hematoma?",
        options: ["Apply ice and wait", "Open the incision, evacuate the blood, identify and cauterize any bleeding vessels, and re-suture", "Give antibiotics", "None"],
        ans: 1,
        exp: "Relieving pressure and stopping the bleed is the priority."
      },
      {
        q: "What is the 'Surgical' risk of an untreated hematoma?",
        options: ["None", "Pressure necrosis of the skin edges, wound dehiscence, and increased risk of infection", "It turns into a cyst", "None"],
        ans: 1,
        exp: "The blood acts as a culture medium and a physical barrier to healing."
      },
      {
        q: "Which medication should the patient be asked about as a potential risk factor?",
        options: ["Aspirin, Anticoagulants, or certain herbal supplements (Ginkgo, Fish oil)", "Acetaminophen", "Vitamins", "None"],
        ans: 0,
        exp: "Anti-platelet and anticoagulant agents increase surgical bleeding risk."
      }
    ]
  },
  {
    title: "The 'Target' and the 'Mesh' (Grafting)",
    scenario: "A surgeon 'meshes' a skin graft before applying it to a large leg wound.\n\nVitals: Normal.\nPhysical Examination: A graft with multiple small slits.\nLaboratory Results: None.",
    disease: "Meshed Skin Graft",
    questions: [
      {
        q: "What is the primary purpose of 'Meshing' a skin graft?",
        options: ["To make it look better", "To allow the graft to expand to cover a larger area and to allow for drainage of fluid (preventing seroma)", "To make it thicker", "None"],
        ans: 1,
        exp: "Expansion and drainage are the two main reasons for meshing."
      },
      {
        q: "What is the 'Cosmetic' drawback of a meshed graft?",
        options: ["It's too smooth", "The 'chicken-wire' or 'fish-net' appearance of the healed graft", "It's too red", "None"],
        ans: 1,
        exp: "Meshed grafts are usually avoided on the face for this reason."
      },
      {
        q: "A graft that is NOT meshed is called what?",
        options: ["A full graft", "A Sheet Graft", "A plate graft", "None"],
        ans: 1,
        exp: "Sheet grafts are used in cosmetically sensitive areas like the face and hands."
      }
    ]
  },
  {
    title: "The 'Itch' and the 'Suture' (Removal)",
    scenario: "A patient is asking when the stitches on his 'back' can be removed.\n\nVitals: Normal.\nPhysical Examination: 4-cm incision on the upper back.\nLaboratory Results: None.",
    disease: "Suture Removal Timing",
    questions: [
      {
        q: "What is the standard time for suture removal on the 'Face'?",
        options: ["3-5 days", "7-10 days", "14 days", "1 month"],
        ans: 0,
        exp: "Early removal on the face prevents 'railroad track' scarring."
      },
      {
        q: "How does the 'Back' or 'Joint' surfaces differ in timing?",
        options: ["It's the same", "Longer duration (usually 10-14 days) due to higher tension and slower healing", "Shorter duration", "None"],
        ans: 1,
        exp: "Premature removal in high-tension areas leads to wound dehiscence."
      },
      {
        q: "If the sutures are left in too long (e.g., 3 weeks on the face), what occurs?",
        options: ["Stronger wound", "Suture tracks and 'epithelialized tunnels' (permanent scarring)", "Infection only", "None"],
        ans: 1,
        exp: "The skin grows around the suture, leaving permanent marks."
      }
    ]
  }
];
