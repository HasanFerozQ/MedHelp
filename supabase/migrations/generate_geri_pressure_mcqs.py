import json
import random

topic_slug = 'geri-pressure-ulcers'

templates = [
    # TEMPLATE 1: STAGE 1 PRESSURE INJURY
    {
        "q": "A {age}-old {gender} who has been bedbound for {duration} weeks following a hip fracture repair is evaluated by the wound care team. On examination of the sacrum, the nurse identifies a **{size}-cm area of intact skin with non-blanchable erythema**. When a gloved finger is pressed firmly over the reddened area and released, the redness does **not** blanch (does not turn white and then re-fill). The surrounding skin is warm to the touch. There is no skin breakdown, no blister formation, and no open wound. Which of the following is the correct staging of this pressure injury, and what is the most appropriate initial intervention?",
        "options": [
            "Stage 1 Pressure Injury (intact skin with non-blanchable erythema); relieve pressure immediately with repositioning every 2 hours, use pressure-redistributing support surfaces, and optimize nutrition",
            "Stage 2 Pressure Injury (partial-thickness skin loss); apply a hydrocolloid or foam dressing and schedule daily wound debridement",
            "Deep Tissue Pressure Injury (DTPI); obtain an emergent MRI to evaluate for osteomyelitis and consult orthopedic surgery",
            "Stage 3 Pressure Injury (full-thickness skin loss); perform sharp surgical debridement in the operating room under general anesthesia",
            "Unstageable Pressure Injury; remove eschar with enzymatic debridement before staging can be determined"
        ],
        "answer": 0,
        "exp": "This patient has a **Stage 1 Pressure Injury** according to the National Pressure Injury Advisory Panel (NPIAP) staging system. Stage 1 is defined as **intact skin with a localized area of non-blanchable erythema**, which may appear differently in darkly pigmented skin. The area may be painful, firm, soft, warmer, or cooler compared to adjacent tissue. Crucially, **the skin is not broken**—there is no blister, abrasion, or open wound. Non-blanchable erythema means that when pressure is applied to the reddened area, it does not turn white (blanch), indicating capillary damage and tissue ischemia. The most critical initial intervention is to **immediately relieve pressure** on the affected area through repositioning every 2 hours, using pressure-redistributing support surfaces (e.g., alternating-pressure air mattresses or low-air-loss beds), keeping the skin clean and dry, and optimizing nutritional intake (adequate protein, calories, and hydration). Stage 1 injuries are **fully reversible** if pressure is promptly relieved."
    },
    # TEMPLATE 2: STAGE 2 PRESSURE INJURY
    {
        "q": "A {age}-old {gender} in a skilled nursing facility is found to have a painful lesion over the left trochanter. On examination, the wound shows a **shallow, open ulcer with a red-pink wound bed** and no slough or eschar. A small, intact, serum-filled blister is present adjacent to the ulcer. The wound measures **{size} cm x {size2} cm** and involves only the epidermis and partial dermis. No subcutaneous fat, muscle, tendon, or bone is visible. Which of the following is the correct staging and the most appropriate wound dressing choice?",
        "options": [
            "Stage 2 Pressure Injury (partial-thickness skin loss with exposed dermis); apply a moisture-retentive dressing such as a hydrocolloid, transparent film, or foam dressing",
            "Stage 1 Pressure Injury (intact non-blanchable erythema); no dressing is needed, only repositioning",
            "Stage 3 Pressure Injury (full-thickness skin loss); pack the wound with wet-to-dry gauze and schedule surgical debridement",
            "Stage 4 Pressure Injury (full-thickness tissue loss with exposed bone); consult plastic surgery for a myocutaneous flap closure",
            "Unstageable Pressure Injury; apply silver sulfadiazine cream and reassess in 2 weeks after eschar removal"
        ],
        "answer": 0,
        "exp": "This wound is a **Stage 2 Pressure Injury**, defined as **partial-thickness loss of skin with exposed dermis**. The wound bed is viable, pink or red, and moist, and may present as an intact or ruptured serum-filled blister. Adipose (fat) tissue is not visible, and deeper tissues are not exposed. Stage 2 does NOT include skin tears, tape burns, perineal dermatitis, maceration, or excoriation. The most appropriate wound management is a **moisture-retentive dressing** that maintains a moist wound-healing environment and protects the wound bed. Options include **hydrocolloid dressings** (e.g., DuoDERM), **transparent film dressings**, or **foam dressings**. These dressings promote autolytic debridement of any minor necrotic tissue, maintain optimal moisture, and reduce friction. **Wet-to-dry gauze** is no longer considered standard of care for any pressure injury as it causes non-selective mechanical debridement and damages granulation tissue."
    },
    # TEMPLATE 3: STAGE 3 PRESSURE INJURY
    {
        "q": "A {age}-old {gender} with paraplegia secondary to a spinal cord injury is evaluated for a worsening sacral wound. On examination, the wound reveals **full-thickness skin loss** with visible subcutaneous adipose (fat) tissue in the wound bed. There is a moderate amount of yellow slough but no eschar. Fascia, muscle, tendon, and bone are **not** directly visible or palpable. The wound measures **{size} cm x {size2} cm x {depth} cm** deep. Which of the following is the correct staging, and what is the most critical element of wound bed preparation?",
        "options": [
            "Stage 3 Pressure Injury (full-thickness skin loss with visible fat); wound bed preparation requires debridement of slough to allow granulation tissue formation",
            "Stage 2 Pressure Injury (partial-thickness skin loss); apply a transparent film dressing and observe weekly",
            "Stage 4 Pressure Injury (full-thickness tissue loss with exposed bone); perform an immediate bone biopsy to rule out osteomyelitis",
            "Deep Tissue Pressure Injury; apply a hydrocolloid dressing and reassess in 48 hours for evolution",
            "Unstageable Pressure Injury; the wound cannot be staged until all necrotic tissue and eschar are removed"
        ],
        "answer": 0,
        "exp": "This wound is a **Stage 3 Pressure Injury**, defined as **full-thickness skin loss** in which adipose (fat) tissue is visible in the ulcer, and granulation tissue or rolled wound edges (epibole) are often present. **Slough** may be present but does not obscure the depth of tissue loss. Fascia, muscle, tendon, ligament, cartilage, and/or bone are **not exposed**. The depth of a Stage 3 pressure injury varies by anatomical location; it can be very shallow in areas without subcutaneous tissue (e.g., the bridge of the nose, ear, occiput) but very deep in areas with significant adiposity. The most critical element of wound bed preparation is **debridement of non-viable tissue (slough)** to create a clean wound bed that supports granulation tissue formation. Debridement methods include autolytic (moisture-retentive dressings), enzymatic (collagenase/Santyl), mechanical, or sharp/surgical debridement depending on the wound characteristics."
    },
    # TEMPLATE 4: STAGE 4 PRESSURE INJURY
    {
        "q": "A {age}-old {gender} with advanced dementia who has been bedbound for {duration} months is evaluated for a large sacral wound. On examination, the wound shows **full-thickness tissue loss with directly visible and palpable bone (the sacral periosteum)**. Exposed necrotic muscle and tendon are present at the wound base. There is evidence of undermining and tunneling extending {tunnel} cm laterally. The wound measures **{size} cm x {size2} cm x {depth} cm** deep. Which of the following is the correct staging and what complication must be urgently evaluated?",
        "options": [
            "Stage 4 Pressure Injury (full-thickness tissue loss with exposed bone/muscle/tendon); urgently evaluate for osteomyelitis with ESR, CRP, MRI, and consider bone biopsy",
            "Stage 3 Pressure Injury (full-thickness skin loss with visible fat); apply negative pressure wound therapy (wound VAC) and reassess in 1 week",
            "Unstageable Pressure Injury; remove all eschar with enzymatic debridement before attempting to stage the wound",
            "Stage 2 Pressure Injury (partial-thickness loss); apply a hydrocolloid dressing and schedule outpatient follow-up",
            "Deep Tissue Pressure Injury; observe for 72 hours to determine if the injury will evolve into a higher stage"
        ],
        "answer": 0,
        "exp": "This wound is a **Stage 4 Pressure Injury**, the most severe stage, defined as **full-thickness skin and tissue loss with exposed or directly palpable fascia, muscle, tendon, ligament, cartilage, or bone** in the ulcer. Slough and/or eschar may be present, and undermining and tunneling often occur. When **bone is directly visible or palpable** at the wound base (a positive ''probe-to-bone'' test), the most critical complication to urgently evaluate is **osteomyelitis** (infection of the underlying bone). Diagnostic evaluation includes: (1) inflammatory markers (**ESR** and **CRP**, both elevated in osteomyelitis), (2) **MRI of the affected area** (the imaging modality of choice, showing bone marrow edema and periosteal enhancement), and (3) **bone biopsy with culture** (the gold standard for definitive diagnosis and guiding antibiotic therapy). Osteomyelitis in pressure injuries typically requires prolonged IV antibiotic courses (6-8 weeks) and surgical debridement of necrotic bone."
    },
    # TEMPLATE 5: UNSTAGEABLE PRESSURE INJURY
    {
        "q": "A {age}-old {gender} who has been hospitalized for {duration} weeks is found to have a sacral wound covered entirely by **thick, adherent, dry, black eschar** with no visible wound bed. The eschar is firmly attached and there is no fluctuance, purulent drainage, or surrounding cellulitis. The true depth and extent of tissue destruction beneath the eschar cannot be determined. Which of the following is the correct classification and the most appropriate management approach?",
        "options": [
            "Unstageable Pressure Injury (obscured full-thickness skin and tissue loss); the wound cannot be staged until the eschar is removed; if stable and dry with no signs of infection, the eschar may be left intact as a natural biological cover on the heels",
            "Stage 4 Pressure Injury; the eschar indicates exposed bone beneath and the patient requires emergent surgical debridement under general anesthesia",
            "Stage 1 Pressure Injury; the black discoloration represents deep non-blanchable erythema over intact skin",
            "Stage 2 Pressure Injury; the eschar is a dried serum-filled blister and should be de-roofed for a culture swab",
            "Deep Tissue Pressure Injury; the black area represents intact skin with a deep bruise-like discoloration from damage to underlying soft tissue"
        ],
        "answer": 0,
        "exp": "This wound is an **Unstageable Pressure Injury**, defined as **obscured full-thickness skin and tissue loss** in which the extent of tissue damage within the ulcer cannot be confirmed because it is obscured by **slough (yellow, tan, gray, green, or brown)** or **eschar (tan, brown, or black)**. Until enough slough and/or eschar is removed to expose the base of the wound, the true depth—and therefore the true stage—cannot be determined. **Once debrided, these wounds will be classified as Stage 3 or Stage 4.** A critical clinical exception is **stable, dry, intact eschar on the heel**. Because the heel has minimal subcutaneous tissue and limited blood supply, a stable, dry, adherent eschar without erythema, fluctuance, or drainage **should NOT be debrided**, as it serves as a natural biological cover (the body''s ''natural bandage''). In all other anatomical locations, eschar generally requires debridement to allow proper staging, assessment, and healing."
    },
    # TEMPLATE 6: DEEP TISSUE PRESSURE INJURY (DTPI)
    {
        "q": "A {age}-old {gender} is admitted to the ICU following a {duration}-day period of prolonged immobility due to mechanical ventilation. On the second day in the ICU, the nursing staff notices a **localized area of intact skin with a persistent, non-blanchable, deep red, maroon, or purple discoloration** over the right heel. The area feels boggy and painful compared to adjacent tissue. There is no open wound, no blister, and no eschar. Which of the following is the correct classification, and what is the expected clinical evolution of this injury?",
        "options": [
            "Deep Tissue Pressure Injury (DTPI); the injury may rapidly evolve to reveal the actual extent of tissue damage, potentially unmasking a Stage 3 or Stage 4 wound within days despite optimal treatment",
            "Stage 1 Pressure Injury; the injury will remain stable and resolve completely with repositioning alone within 24-48 hours",
            "Stage 2 Pressure Injury; the injury has already progressed to partial-thickness skin loss and requires immediate hydrocolloid application",
            "Arterial insufficiency ulcer; obtain an ankle-brachial index (ABI) and urgent vascular surgery consultation for revascularization",
            "Venous stasis ulcer; apply a multi-layer compression bandage and elevate the extremity above the level of the heart"
        ],
        "answer": 0,
        "exp": "This is a **Deep Tissue Pressure Injury (DTPI)**, defined as **intact or non-intact skin with a localized area of persistent, non-blanchable deep red, maroon, or purple discoloration, or epidermal separation revealing a dark wound bed or blood-filled blister**. Pain and temperature change often precede skin color changes. This injury results from **intense and/or prolonged pressure and shear forces at the bone-muscle interface**, causing damage to the underlying soft tissue (muscle, fascia) that then propagates upward toward the skin surface. The critical clinical feature of DTPI is its **unpredictable and often rapid evolution**: despite optimal pressure relief and wound care, the injury may **rapidly deteriorate over days to weeks**, with the overlying skin breaking down to reveal a Stage 3 or Stage 4 pressure injury with extensive tissue necrosis underneath. This occurs because the deep tissue damage has already occurred at the time of initial presentation, and the skin changes are a delayed manifestation."
    },
    # TEMPLATE 7: BRADEN SCALE RISK ASSESSMENT
    {
        "q": "A {age}-old {gender} is admitted to the hospital with a recent ischemic stroke resulting in right-sided hemiplegia and dysphagia. The patient is unable to reposition independently, requires a pureed diet with thickened liquids, has mild urinary incontinence managed with an absorbent pad, and has diminished sensation over the affected hemiplegic side. The nursing team conducts a Braden Scale assessment and assigns the following subscale scores: Sensory Perception: {s1}, Moisture: {s2}, Activity: {s3}, Mobility: {s4}, Nutrition: {s5}, Friction/Shear: {s6}. The total Braden Scale score is **{total}**. What does this score indicate, and what is the most appropriate preventive intervention?",
        "options": [
            "The patient is at high risk for pressure injury development (Braden score ≤18); implement a comprehensive prevention bundle including repositioning every 2 hours, a pressure-redistributing mattress, nutritional optimization, and meticulous skin care",
            "The patient is at no risk for pressure injury development; standard hospital bed and routine nursing care are sufficient",
            "The Braden Scale is only validated for outpatient settings and cannot be used to guide inpatient pressure injury prevention",
            "The patient is at minimal risk; only a foam mattress overlay is needed, with repositioning every 8 hours during sleep",
            "The Braden Scale only measures wound healing potential, not pressure injury risk; use the Norton Scale instead"
        ],
        "answer": 0,
        "exp": "The **Braden Scale** is the most widely used and validated tool for assessing **pressure injury risk** in hospitalized and long-term care patients. It evaluates **six subscales**: (1) **Sensory Perception** (ability to respond to pressure-related discomfort), (2) **Moisture** (degree of skin exposure to moisture), (3) **Activity** (degree of physical activity), (4) **Mobility** (ability to change and control body position), (5) **Nutrition** (usual food intake pattern), and (6) **Friction and Shear**. Each subscale is scored from 1 (worst/highest risk) to 3 or 4 (best/lowest risk), yielding a total score of **6 to 23**. Lower scores indicate higher risk: a total score of **≤18 indicates at-risk**, **≤14 indicates moderate risk**, **≤12 indicates high risk**, and **≤9 indicates very high risk**. This patient's total score of **{total}** places them at high risk. The most appropriate intervention is a **comprehensive pressure injury prevention bundle**: repositioning every 2 hours, a pressure-redistributing support surface, nutritional optimization (adequate protein and calories), moisture management, and meticulous skin inspection."
    },
    # TEMPLATE 8: NUTRITION & WOUND HEALING
    {
        "q": "A {age}-old {gender} with a Stage 3 sacral pressure injury measuring {size} cm x {size2} cm is noted to have poor wound healing despite appropriate pressure relief and wound care over the past {duration} weeks. Laboratory evaluation reveals: serum albumin **{albumin} g/dL** (normal: 3.5-5.0), prealbumin **{prealbumin} mg/dL** (normal: 20-40), and a BMI of **{bmi}**. The patient has been eating only 50% of meals. Which of the following is the most important nutritional intervention to promote wound healing in this patient?",
        "options": [
            "Increase daily protein intake to 1.25-1.5 g/kg/day, ensure adequate caloric intake (30-35 kcal/kg/day), and supplement with vitamin C and zinc",
            "Restrict protein intake to less than 0.6 g/kg/day to prevent renal overload and prescribe a high-carbohydrate liquid supplement",
            "Initiate total parenteral nutrition (TPN) through a central venous catheter as oral supplementation is always ineffective in elderly patients",
            "Prescribe high-dose intravenous iron infusions and erythropoietin injections to improve tissue oxygenation",
            "Place a percutaneous endoscopic gastrostomy (PEG) tube immediately without attempting oral diet modifications"
        ],
        "answer": 0,
        "exp": "**Malnutrition is one of the most significant modifiable risk factors for pressure injury development AND impaired wound healing.** This patient's laboratory values demonstrate protein-calorie malnutrition: a low serum **albumin of {albumin} g/dL** (reflecting chronic nutritional status over 2-3 weeks) and a low **prealbumin of {prealbumin} mg/dL** (a more sensitive and acute marker of nutritional status, reflecting changes over 2-3 days). For patients with pressure injuries, the evidence-based nutritional recommendations include: (1) **increased protein intake to 1.25-1.5 g/kg/day** (protein is essential for collagen synthesis, immune function, and granulation tissue formation), (2) **adequate caloric intake of 30-35 kcal/kg/day** to prevent catabolism, (3) **supplementation with vitamin C** (necessary for collagen cross-linking and immune function) and **zinc** (essential for cell division and protein synthesis in wound repair), and (4) oral nutritional supplements (ONS) between meals to increase overall intake. PEG tubes are reserved for patients who cannot meet nutritional goals via oral intake despite optimization."
    },
    # TEMPLATE 9: IMMOBILITY COMPLICATIONS (DVT/PE, CONTRACTURES, DECONDITIONING)
    {
        "q": "A {age}-old {gender} has been immobilized in bed for {duration} weeks following a severe stroke with dense left hemiplegia. On examination, the patient is noted to have a fixed flexion deformity of the left elbow at 90 degrees that cannot be passively extended beyond 95 degrees. The left calf is swollen, warm, and tender to palpation with a positive Homans'' sign. Chest X-ray is clear but the patient reports new-onset dyspnea. Which of the following best describes the full spectrum of complications this patient is experiencing from prolonged immobility?",
        "options": [
            "Joint contracture (irreversible soft tissue shortening), deep vein thrombosis (venous stasis), and potential pulmonary embolism; manage with physical therapy, anticoagulation, and CT pulmonary angiography",
            "Osteoarthritis flare, superficial thrombophlebitis, and exercise-induced asthma; manage with NSAIDs and albuterol inhaler",
            "Rheumatoid arthritis with joint fusion, arterial insufficiency, and pneumothorax; manage with methotrexate and chest tube insertion",
            "Gout-induced tophi with joint destruction, lymphedema, and pleural effusion; manage with colchicine and thoracentesis",
            "Septic arthritis of the elbow, cellulitis of the leg, and empyema; manage with broad-spectrum IV antibiotics and surgical drainage"
        ],
        "answer": 0,
        "exp": "This patient is demonstrating three classic complications of **prolonged immobility**: (1) **Joint contractures**: Fixed flexion deformity from irreversible shortening of muscles, tendons, ligaments, and joint capsules due to prolonged positioning without range-of-motion exercises. Prevention requires early and regular passive/active range-of-motion exercises and proper positioning with splints. (2) **Deep Vein Thrombosis (DVT)**: Virchow''s triad (venous stasis from immobility, endothelial injury, and hypercoagulability) predisposes immobilized patients to DVT, presenting with unilateral calf swelling, warmth, and tenderness. Diagnosis is confirmed by compression ultrasonography. (3) **Pulmonary Embolism (PE)**: DVT can embolize to the pulmonary vasculature, causing dyspnea, tachycardia, hypoxia, and potentially fatal hemodynamic collapse. Diagnosis requires CT pulmonary angiography (CTPA). Management includes therapeutic anticoagulation (heparin bridge to warfarin or direct oral anticoagulants), aggressive physical therapy with early mobilization protocols, and DVT prophylaxis for all immobilized patients."
    },
    # TEMPLATE 10: WOUND INFECTION & NEGATIVE PRESSURE WOUND THERAPY
    {
        "q": "A {age}-old {gender} with a Stage {stage} sacral pressure injury has been receiving appropriate wound care for {duration} weeks. On reassessment, the wound shows increasing **purulent drainage, foul odor, expanding periwound erythema and induration extending {erythema} cm beyond the wound margins**, and new-onset wound pain. The patient is now febrile at **{temp}°F** ({temp_c}°C) with a WBC count of **{wbc} x10³/µL**. Which of the following is the most appropriate management of this wound?",
        "options": [
            "Obtain wound tissue culture (not swab), initiate empiric systemic antibiotics, perform sharp debridement of necrotic tissue, and consider negative pressure wound therapy (NPWT/wound VAC) after infection control",
            "Apply topical triple antibiotic ointment (Neosporin) to the wound surface and continue current wound care without systemic antibiotics",
            "Immediately pack the wound tightly with iodoform gauze and leave it undisturbed for 7 days to promote anaerobic healing",
            "Obtain only a superficial wound swab culture, prescribe a single dose of oral azithromycin, and schedule outpatient follow-up in 2 weeks",
            "Discontinue all wound care and apply a dry occlusive dressing to create a sealed anaerobic environment that suppresses bacterial growth"
        ],
        "answer": 0,
        "exp": "This patient is presenting with signs of **wound infection** (purulent drainage, foul odor, expanding periwound erythema/cellulitis, increasing pain, and systemic signs including fever of {temp}°F and leukocytosis of {wbc} x10³/µL). The most appropriate management includes: (1) **Tissue culture** (not a superficial wound swab, which only captures surface colonizers)—a deep wound tissue biopsy or Levine technique culture is the gold standard for identifying the causative pathogen and guiding antibiotic selection. (2) **Empiric systemic antibiotics** (covering gram-positives including MRSA, gram-negatives, and anaerobes) initiated after cultures are obtained. (3) **Sharp debridement** of all necrotic, devitalized tissue, which serves as a bacterial nidus and impairs healing. (4) After infection is controlled, **Negative Pressure Wound Therapy (NPWT/wound VAC)** can be applied to promote granulation tissue formation, reduce wound volume, remove excess exudate, and increase local blood flow. NPWT is contraindicated in the presence of untreated osteomyelitis, malignancy in the wound, or exposed blood vessels."
    }
]

genders_pool = [
    {"gender": "female", "pronoun": "she", "pronoun_cap": "She", "possessive": "her", "possessive_cap": "Her"},
    {"gender": "male", "pronoun": "he", "pronoun_cap": "He", "possessive": "his", "possessive_cap": "His"},
    {"gender": "woman", "pronoun": "she", "pronoun_cap": "She", "possessive": "her", "possessive_cap": "Her"},
    {"gender": "man", "pronoun": "he", "pronoun_cap": "He", "possessive": "his", "possessive_cap": "His"}
]

mcqs = []
seen_questions = set()
counter = 0

while counter < 400:
    for t_idx, t in enumerate(templates):
        if counter >= 400:
            break
        age = random.randint(65, 95)
        gp = random.choice(genders_pool)
        duration = random.randint(2, 8)
        size = random.choice([2, 3, 4, 5, 6])
        size2 = random.choice([2, 3, 4, 5])
        depth = random.choice([1, 2, 3, 4])
        tunnel = random.choice([2, 3, 4, 5])
        # Braden subscale scores
        s1 = random.randint(1, 3)
        s2 = random.randint(1, 3)
        s3 = random.randint(1, 2)
        s4 = random.randint(1, 3)
        s5 = random.randint(1, 3)
        s6 = random.randint(1, 2)
        total = s1 + s2 + s3 + s4 + s5 + s6
        # Nutrition labs
        albumin = round(random.uniform(1.8, 2.9), 1)
        prealbumin = random.randint(8, 16)
        bmi = round(random.uniform(16.5, 20.5), 1)
        # Infection vitals
        stage = random.choice([3, 4])
        erythema = random.randint(2, 5)
        temp_f = round(random.uniform(101.0, 103.5), 1)
        temp_c = round((temp_f - 32) * 5 / 9, 1)
        wbc = round(random.uniform(14.0, 22.0), 1)

        q_text = t['q'].format(
            age=age, gender=gp['gender'], pronoun=gp['pronoun'], pronoun_cap=gp['pronoun_cap'],
            possessive=gp['possessive'], possessive_cap=gp['possessive_cap'],
            duration=duration, size=size, size2=size2, depth=depth, tunnel=tunnel,
            s1=s1, s2=s2, s3=s3, s4=s4, s5=s5, s6=s6, total=total,
            albumin=albumin, prealbumin=prealbumin, bmi=bmi,
            stage=stage, erythema=erythema, temp=temp_f, temp_c=temp_c, wbc=wbc
        )

        opts_formatted = []
        for o in t['options']:
            o_fmt = o.format(total=total, albumin=albumin, prealbumin=prealbumin, temp=temp_f, wbc=wbc)
            opts_formatted.append(o_fmt)

        exp_formatted = t['exp'].format(
            total=total, albumin=albumin, prealbumin=prealbumin, temp=temp_f, temp_c=temp_c, wbc=wbc
        )

        correct_opt = opts_formatted[t['answer']]
        random.shuffle(opts_formatted)
        new_ans_idx = opts_formatted.index(correct_opt)

        q_esc = q_text.replace("'", "''")
        opts_json = json.dumps(opts_formatted).replace("'", "''")
        exp_esc = exp_formatted.replace("'", "''")

        mcq_str = f"    (v_topic_id, '{q_esc}', '{opts_json}'::jsonb, {new_ans_idx}, '{exp_esc}')"

        if q_text not in seen_questions:
            seen_questions.add(q_text)
            mcqs.append(mcq_str)
            counter += 1

out_file = r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260520_geri_pressure_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Geriatrics: Immobility & pressure ulcers — staging, prevention, management\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\nDECLARE\n    v_topic_id UUID;\nBEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'geri-pressure-ulcers' LIMIT 1;\n")
    f.write("    IF v_topic_id IS NULL THEN\n        RAISE EXCEPTION 'Topic geri-pressure-ulcers not found.';\n    END IF;\n\n")
    f.write("    DELETE FROM mcqs WHERE topic_id = v_topic_id;\n\n")
    f.write("    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES\n")
    for i, m in enumerate(mcqs):
        if i < len(mcqs) - 1:
            f.write(m + ",\n")
        else:
            f.write(m + ";\n")
    f.write("END $$;\nCOMMIT;\n")

print(f"Generated {len(mcqs)} MCQs to {out_file}")
