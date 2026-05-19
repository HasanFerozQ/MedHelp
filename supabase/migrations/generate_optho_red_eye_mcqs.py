import json
import random

topic_slug = 'optho-red-eye'

templates = [
    # ─── 1. VIRAL CONJUNCTIVITIS ───
    {
        "q": "A {age}-old {gender} presents to the clinic with a {duration}-day history of redness, burning, and a gritty foreign body sensation in the right eye that has recently spread to the left eye. {pronoun_cap} reports a mild sore throat and clear rhinorrhea over the past week. On physical examination, there is bilateral conjunctival injection, watery discharge, and prominent follicles on the palpebral conjunctiva. A tender, palpable lymph node is noted in the {node_loc} preauricular region. Visual acuity is 20/20 in both eyes, and the pupillary response is normal. What is the most likely diagnosis, and what is the next step in management?",
        "options": [
            "Viral conjunctivitis; supportive care with cold compresses and artificial tears",
            "Bacterial conjunctivitis; topical erythromycin ophthalmic ointment",
            "Allergic conjunctivitis; topical olopatadine antihistamine/mast cell stabilizer drops",
            "Herpes simplex keratitis; topical ganciclovir ophthalmic gel",
            "Epidemic keratoconjunctivitis; urgent referral for topical corticosteroid therapy"
        ],
        "answer": 0,
        "exp": "This presentation is classic for **viral conjunctivitis**, most commonly caused by **adenovirus** (frequently associated with a recent viral upper respiratory tract infection or pharyngoconjunctival fever). Hallmark clinical features include: (1) acute onset of watery/serous discharge, (2) burning or grittiness, (3) progression from unilateral to bilateral involvement, (4) conjunctival injection with palpebral follicles, and (5) a tender **preauricular lymphadenopathy**. The condition is highly contagious but self-limiting. Management is strictly **supportive** with cold compresses, artificial tears, and hand hygiene. Topical antibiotics are not indicated unless a secondary bacterial infection is suspected."
    },

    # ─── 2. ALLERGIC CONJUNCTIVITIS ───
    {
        "q": "A {age}-old {gender} presents with a {duration}-day history of bilateral eye redness accompanied by intense, intolerable itching and a stringy, mucoid discharge. {pronoun_cap} notes that these symptoms are worse during the spring season and are accompanied by frequent sneezing. Physical examination reveals bilateral conjunctival injection, marked chemosis (conjunctival edema), and a cobblestone-like appearance of the papillae on the superior palpebral conjunctiva. Visual acuity is normal, and there is no preauricular lymphadenopathy. Which of the following is the most appropriate first-line pharmacotherapy?",
        "options": [
            "Topical olopatadine (dual-acting antihistamine and mast cell stabilizer)",
            "Topical ciprofloxacin (fluoroquinolone antibiotic drops)",
            "Topical prednisolone acetate (corticosteroid drops)",
            "Oral acyclovir antiviral therapy",
            "Urgent surgical debridement of the superior palpebral conjunctiva"
        ],
        "answer": 0,
        "exp": "The hallmark of **allergic conjunctivitis** is bilateral, intense **pruritus** (itching). Other classic findings include a history of atopy (sneezing, seasonal allergies), stringy or mucoid discharge, conjunctival injection, chemosis, and **cobblestone papillae** on the superior tarsal/palpebral conjunctiva. First-line management involves allergen avoidance and topical dual-acting agents like **olopatadine** or ketotifen, which provide both immediate antihistamine relief and long-term mast cell stabilization. Topical steroids are reserved for severe, refractory cases under specialist guidance due to risks of glaucoma and cataracts."
    },

    # ─── 3. BACTERIAL CONJUNCTIVITIS (CONTACT LENS WEARER) ───
    {
        "q": "A {age}-old {gender} who wears extended-wear contact lenses presents with a {duration}-day history of rapid-onset redness, pain, and thick, yellowish-green purulent discharge in the {eye_side} eye. {pronoun_cap} reports that the eyelids were completely 'glued shut' in the morning. Physical examination reveals conjunctival injection, a normal pupillary response, and a small, hazy focal corneal infiltrate on fluorescein staining. Visual acuity is {va}. What is the most likely pathogen, and what is the most appropriate empiric therapy?",
        "options": [
            "Pseudomonas aeruginosa; topical fluoroquinolone drops (e.g., moxifloxacin or ciprofloxacin)",
            "Staphylococcus aureus; topical erythromycin ointment",
            "Streptococcus pneumoniae; topical sulfacetamide drops",
            "Neisseria gonorrhoeae; intravenous ceftriaxone and topical saline irrigation",
            "Adenovirus; supportive care with cold compresses"
        ],
        "answer": 0,
        "exp": "Acute bacterial conjunctivitis typically presents with a unilateral or bilateral red eye, thick purulent discharge, and morning crusting ('eyelids glued shut'). In patients who wear **contact lenses**, the bacterial profile shifts significantly towards Gram-negative rods, particularly **Pseudomonas aeruginosa**, which can cause rapid, aggressive corneal melting and perforation. Therefore, empiric therapy in any contact lens wearer must cover Pseudomonas. Topical **fluoroquinolones** (such as ciprofloxacin, ofloxacin, or moxifloxacin) are the preferred first-line agents. Topical erythromycin or bacitracin-polymyxin is insufficient for contact lens wearers due to inadequate Gram-negative coverage."
    },

    # ─── 4. ANTERIOR UVEITIS (IRITIS) ───
    {
        "q": "A {age}-old {gender} with a history of recurrent lower back stiffness presents with a {duration}-day history of severe {eye_side} eye pain, redness, and marked photophobia. {pronoun_cap} reports that looking at light triggers a deep, aching pain in the eye, and even shining a light in the contralateral eye triggers pain in the affected eye. Physical examination reveals a circular pattern of conjunctival injection localized around the cornea (ciliary flush), a constricted pupil measuring {pupil_size} mm (compared to {normal_pupil} mm in the unaffected eye) with sluggish response, and inflammatory cells and flare in the anterior chamber on slit-lamp examination. What is the most likely diagnosis, and what is the initial management?",
        "options": [
            "Anterior uveitis (iritis); topical corticosteroids (prednisolone) and topical cycloplegics (homatropine)",
            "Acute angle-closure glaucoma; topical pilocarpine and intravenous acetazolamide",
            "Bacterial keratitis; topical hourly fluoroquinolone drops",
            "Herpes simplex dendritic keratitis; topical trifluridine or ganciclovir",
            "Scleritis; systemic NSAIDs or systemic immunosuppressants"
        ],
        "answer": 0,
        "exp": "This clinical presentation is highly characteristic of **anterior uveitis (iritis)**, characterized by: (1) deep aching pain, (2) intense **photophobia** (direct and reactive/consensual, caused by pupillary constriction), (3) **ciliary flush** (circumcorneal injection), (4) a constricted/miotic, sluggishly reactive pupil, and (5) **cells and flare** (white blood cells and proteins suspended in the aqueous humor due to blood-aqueous barrier breakdown) on slit-lamp exam. It is strongly associated with HLA-B27 seronegative spondyloarthropathies (e.g., ankylosing spondylitis). Management involves topical **corticosteroids** (e.g., prednisolone acetate) to reduce inflammation, and topical **cycloplegics/mydriatics** (e.g., homatropine, cyclopentolate) to dilate the pupil, relieve pain from ciliary spasm, and prevent posterior synechiae (adhesions between iris and lens)."
    },

    # ─── 5. HERPES SIMPLEX KERATITIS ───
    {
        "q": "A {age}-old {gender} presents with a {duration}-day history of unilateral left eye redness, moderate pain, photophobia, and a foreign body sensation. Physical examination reveals conjunctival injection and mild eyelid swelling. Slit-lamp examination with fluorescein staining demonstrates a clear, branching **dendritic corneal ulcer** with prominent terminal bulbs. Visual acuity is slightly decreased. Which of the following represents the most appropriate pharmacotherapy, and which is strictly contraindicated?",
        "options": [
            "Topical ganciclovir gel or oral acyclovir is indicated; topical corticosteroids are strictly contraindicated",
            "Topical prednisolone acetate is indicated; topical ganciclovir gel is strictly contraindicated",
            "Topical ciprofloxacin drops are indicated; topical cycloplegics are strictly contraindicated",
            "Topical natamycin drops are indicated; systemic acyclovir is strictly contraindicated",
            "Immediate corneal patch grafting is indicated; topical antivirals are strictly contraindicated"
        ],
        "answer": 0,
        "exp": "The presence of a **dendritic corneal ulcer** with terminal bulbs on fluorescein staining is pathognomonic for **Herpes Simplex Virus (HSV) epithelial keratitis**. Management consists of topical antivirals (e.g., **ganciclovir gel**, trifluridine drops) or oral acyclovir/valacyclovir. **Topical corticosteroids are strictly contraindicated** in epithelial HSV keratitis, as they suppress local immune responses, leading to rapid viral replication, enlargement of the ulcer into a geographic configuration, and significantly increased risk of corneal melting, scarring, and perforation."
    },

    # ─── 6. HERPES ZOSTER OPHTHALMICUS ───
    {
        "q": "A {age}-old {gender} presents with a {duration}-day history of painful blistering skin rash over the left forehead, upper eyelid, and the tip of the nose. Physical examination reveals multiple grouped, erythematous vesicles along the V1 distribution of the trigeminal nerve, including the nasal tip (**Hutchinson's sign**). The patient reports moderate eye redness, tearing, and photophobia in the left eye. Slit-lamp fluorescein examination shows raised, linear corneal lesions without terminal bulbs (pseudodendrites). What is the most appropriate management?",
        "options": [
            "High-dose oral acyclovir or valacyclovir therapy, initiated within 72 hours of rash onset",
            "Topical prednisolone drops alone, with no systemic therapy",
            "Topical natamycin antifungal therapy and tight eye patching",
            "Urgent surgical lateral tarsorrhaphy",
            "Intravenous vancomycin and topical bacitracin ointment"
        ],
        "answer": 0,
        "exp": "This patient presents with **Herpes Zoster Ophthalmicus (HZO)**, which is a reactivation of the Varicella-Zoster Virus (VZV) in the ophthalmic division (V1) of the trigeminal nerve. The presence of vesicles on the tip or side of the nose is known as **Hutchinson's sign**, indicating nasociliary nerve involvement, which is highly predictive of active intraocular inflammation (75% correlation). Slit-lamp exam classically shows **pseudodendrites** (mucus plaques that lack terminal bulbs). First-line treatment is high-dose **oral acyclovir** (800 mg five times daily) or **valacyclovir** (1000 mg three times daily) initiated within 72 hours to reduce ocular complications, postherpetic neuralgia, and skin viral shedding."
    },

    # ─── 7. HYPERACUTE NEISSERIA GONORRHOEAE CONJUNCTIVITIS ───
    {
        "q": "A {age}-old {gender} presents with an acute, rapidly progressive, and highly severe redness of the left eye of {duration}-day duration. The patient reports a massive, continuous, 'gushing' amount of thick, purulent discharge from the eye that returns immediately after wiping. Physical examination reveals severe eyelid edema, chemosis, marked conjunctival injection, and preauricular lymphadenopathy. Fluorescein staining reveals a peripheral corneal thinning and early ulceration. Gram stain of the discharge shows Gram-negative intracellular diplococci. What is the most appropriate management?",
        "options": [
            "Intramuscular ceftriaxone (1g) plus oral azithromycin, combined with frequent topical saline irrigation and topical fluoroquinolone drops",
            "Topical erythromycin ointment monotherapy for 7 days",
            "Oral acyclovir and tight eye patching for 48 hours",
            "Topical prednisolone acetate drops every hour without systemic antibiotics",
            "Urgent enucleation of the left eye to prevent sympathetic ophthalmia"
        ],
        "answer": 0,
        "exp": "This patient is presenting with **hyperacute bacterial conjunctivitis** caused by **Neisseria gonorrhoeae**. This is a true ophthalmic emergency because N. gonorrhoeae can rapidly penetrate an intact corneal epithelium, leading to corneal ulceration, stromal melting, and globe perforation within 24-48 hours. The clinical hallmark is a hyperacute onset of massive, copious, **'gushing' purulent discharge** accompanied by severe chemosis and eyelid swelling. Management requires systemic therapy with a single dose of **intramuscular ceftriaxone (1g)** plus oral azithromycin (to cover co-infection with Chlamydia and enhance gonococcicide activity), alongside frequent **topical saline irrigation** to clear the discharge, and topical fluoroquinolones (e.g., moxifloxacin) to protect the cornea."
    }
]

genders_pool = [
    {"gender": "female", "pronoun": "she", "possessive": "her"},
    {"gender": "male", "pronoun": "he", "possessive": "his"},
    {"gender": "woman", "pronoun": "she", "possessive": "her"},
    {"gender": "man", "pronoun": "he", "possessive": "his"},
    {"gender": "lady", "pronoun": "she", "possessive": "her"},
    {"gender": "gentleman", "pronoun": "he", "possessive": "his"}
]

mcqs = []
counter = 0

# Target: 350 MCQs
while counter < 350:
    for t in templates:
        if counter >= 350:
            break
            
        age = random.randint(18, 85)
        gp = random.choice(genders_pool)
        
        # Randomize duration
        duration_num = random.randint(2, 6)
        duration_unit = random.choice(["", ""])
        duration = f"{duration_num}"
        
        # Preauricular node location
        node_loc = random.choice(["ipsilateral", "right", "left"])
        
        # Left or Right eye
        eye_side = random.choice(["right", "left"])
        
        # Visual acuity
        va = random.choice(["20/40", "20/50", "20/70", "20/80", "20/100"])
        
        # Pupil sizes
        pupil_size = random.randint(2, 3)
        normal_pupil = random.randint(4, 5)
        
        pronoun_cap = gp['pronoun'].capitalize()
        
        q_text = t['q'].format(
            age=age, gender=gp['gender'], pronoun=gp['pronoun'], possessive=gp['possessive'],
            pronoun_cap=pronoun_cap,
            duration=duration, node_loc=node_loc, eye_side=eye_side, va=va,
            pupil_size=pupil_size, normal_pupil=normal_pupil
        )
        
        # Shuffling options
        opts = list(t['options'])
        correct_opt = opts[t['answer']]
        random.shuffle(opts)
        new_ans_idx = opts.index(correct_opt)
        
        # Escape characters
        q_text_escaped = q_text.replace("'", "''")
        opts_json_escaped = json.dumps(opts).replace("'", "''")
        exp_escaped = t['exp'].replace("'", "''")
        
        mcq_str = f"    (v_topic_id, '{q_text_escaped}', '{opts_json_escaped}'::jsonb, {new_ans_idx}, '{exp_escaped}')"
        
        if mcq_str not in mcqs:
            mcqs.append(mcq_str)
            counter += 1

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260519_optho_red_eye_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Ophthalmology: Red eye — conjunctivitis, uveitis, keratitis\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'optho-red-eye' LIMIT 1;\n")
    f.write("    IF v_topic_id IS NULL THEN\n")
    f.write(f"        RAISE EXCEPTION 'Topic optho-red-eye not found.';\n")
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
