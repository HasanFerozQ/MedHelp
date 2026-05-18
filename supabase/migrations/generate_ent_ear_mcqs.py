import json
import random

topic_slug = 'ent-ear'

templates = [
    # ── Acute Otitis Media (AOM) ──
    {
        "q": "A {age}-old {gender} presents with a 2-day history of fever, ear tugging, and irritability. Otoscopy reveals a bulging, erythematous, and opaque tympanic membrane with decreased mobility on pneumatic otoscopy. What is the most likely pathogen?",
        "options": ["Streptococcus pneumoniae", "Staphylococcus aureus", "Pseudomonas aeruginosa", "Aspergillus niger", "Mycoplasma pneumoniae"],
        "answer": 0,
        "exp": "Streptococcus pneumoniae, non-typeable Haemophilus influenzae, and Moraxella catarrhalis are the most common bacterial causes of Acute Otitis Media (AOM). Otoscopy showing a bulging TM with decreased mobility is the hallmark of AOM."
    },
    {
        "q": "A {age}-old {gender} is diagnosed with acute otitis media (AOM). The patient has no known drug allergies and has not received any antibiotics in the past month. What is the first-line empiric antibiotic therapy?",
        "options": ["Amoxicillin (high-dose)", "Amoxicillin-clavulanate", "Azithromycin", "Ciprofloxacin otic drops", "Ceftriaxone IM"],
        "answer": 0,
        "exp": "High-dose amoxicillin (80-90 mg/kg/day) is the first-line treatment for AOM in children without recent antibiotic exposure or purulent conjunctivitis."
    },
    {
        "q": "A {age}-old {gender} with acute otitis media is treated with high-dose amoxicillin. Three days later, the child continues to have fever and severe otalgia. Otoscopy still shows a bulging TM. What is the most appropriate next step in management?",
        "options": ["Switch to Amoxicillin-clavulanate", "Continue Amoxicillin for another 3 days", "Switch to oral Clindamycin", "Perform immediate tympanocentesis", "Refer for adenoidectomy"],
        "answer": 0,
        "exp": "If a patient fails initial therapy with amoxicillin after 48-72 hours, the treatment should be escalated to cover beta-lactamase-producing organisms (like H. influenzae or M. catarrhalis). Amoxicillin-clavulanate is the drug of choice."
    },

    # ── Otitis Media with Effusion (OME) ──
    {
        "q": "A {age}-old {gender} is brought to the clinic due to failed school hearing screening. The parents note the child often asks them to repeat things. The child is afebrile and has no ear pain. Otoscopy reveals a retracted, amber-colored tympanic membrane with visible air-fluid levels, and decreased mobility. What is the most likely diagnosis?",
        "options": ["Otitis Media with Effusion (OME)", "Acute Otitis Media (AOM)", "Otosclerosis", "Cholesteatoma", "Tympanosclerosis"],
        "answer": 0,
        "exp": "Otitis media with effusion (OME) presents with asymptomatic hearing loss (conductive) and a TM that is retracted or neutral, often amber/yellow with air-fluid levels or bubbles. It lacks the acute inflammatory signs (bulging, fever, severe pain) of AOM."
    },
    {
        "q": "A {age}-old {gender} has had persistent Otitis Media with Effusion (OME) bilaterally for the past 4 months. Audiometry shows a 30 dB conductive hearing loss bilaterally. The child is experiencing speech delay. What is the most appropriate definitive management?",
        "options": ["Tympanostomy tube placement", "A 14-day course of Amoxicillin-clavulanate", "Intranasal corticosteroids", "Oral antihistamines and decongestants", "Observation for another 3 months"],
        "answer": 0,
        "exp": "Tympanostomy tube insertion is indicated for children with OME lasting >3 months accompanied by hearing loss, speech delay, or structural damage to the TM. Medications (antihistamines, decongestants, steroids, or prolonged antibiotics) are not effective for long-term resolution of OME."
    },

    # ── Otitis Externa (Swimmer's Ear) ──
    {
        "q": "A {age}-old {gender} presents with severe right ear pain, especially when chewing. The pain started 2 days after returning from a summer camp where the child swam daily. Examination shows a highly edematous, erythematous external auditory canal with purulent debris. The tympanic membrane is difficult to visualize but appears intact. Pulling the pinna elicits severe pain. What is the most common causative organism?",
        "options": ["Pseudomonas aeruginosa", "Streptococcus pneumoniae", "Haemophilus influenzae", "Candida albicans", "Streptococcus pyogenes"],
        "answer": 0,
        "exp": "Pseudomonas aeruginosa and Staphylococcus aureus are the most common pathogens causing acute otitis externa (Swimmer's ear). Pain with traction on the pinna or tragus is a classic finding."
    },
    {
        "q": "A {age}-old {gender} with type 2 diabetes presents with exquisite left ear pain, purulent otorrhea, and lower facial weakness on the left side. Otoscopy reveals granulation tissue at the bony-cartilaginous junction of the external auditory canal. What is the most likely diagnosis?",
        "options": ["Necrotizing (Malignant) Otitis Externa", "Acute Otitis Media with mastoiditis", "Cholesteatoma", "Ramsay Hunt syndrome", "Squamous cell carcinoma of the ear canal"],
        "answer": 0,
        "exp": "Necrotizing (malignant) otitis externa is an invasive Pseudomonas infection of the external auditory canal and skull base, seen primarily in elderly diabetic or immunocompromised patients. Granulation tissue at the floor of the canal and cranial nerve palsies (e.g., Facial nerve/CN VII) are characteristic."
    },
    {
        "q": "What is the most appropriate treatment for a {age}-old {gender} diabetic patient diagnosed with Necrotizing (Malignant) Otitis Externa?",
        "options": ["Intravenous Ciprofloxacin", "Topical Neomycin/Polymyxin B/Hydrocortisone", "Intravenous Vancomycin", "Topical Clotrimazole", "Oral Amoxicillin"],
        "answer": 0,
        "exp": "Necrotizing otitis externa requires prolonged systemic antipseudomonal therapy (e.g., IV ciprofloxacin) due to osteomyelitis of the skull base. Topical drops alone are insufficient."
    },

    # ── Cholesteatoma ──
    {
        "q": "A {age}-old {gender} presents with a 6-month history of painless, foul-smelling, continuous purulent otorrhea from the right ear, associated with progressive hearing loss. Otoscopy reveals a pearly white mass in the pars flaccida region with a marginal tympanic membrane perforation. What is the most likely diagnosis?",
        "options": ["Cholesteatoma", "Chronic Suppurative Otitis Media without cholesteatoma", "Glomus tympanicum tumor", "Squamous cell carcinoma", "Otitis Media with Effusion"],
        "answer": 0,
        "exp": "A cholesteatoma is a destructive and expanding growth consisting of keratinizing squamous epithelium in the middle ear. It classically presents with painless, foul-smelling otorrhea, conductive hearing loss, and a pearly white mass typically in the pars flaccida."
    },
    {
        "q": "What is the definitive treatment for a confirmed cholesteatoma in a {age}-old {gender}?",
        "options": ["Surgical excision (tympanomastoidectomy)", "Prolonged course of topical ciprofloxacin drops", "Intravenous antipseudomonal antibiotics", "Observation with serial audiograms", "Tympanostomy tube placement"],
        "answer": 0,
        "exp": "Cholesteatomas are locally destructive due to pressure necrosis and enzymatic activity. Medical therapy cannot eradicate them. Definitive treatment requires complete surgical excision (e.g., tympanomastoidectomy)."
    },

    # ── Hearing Loss / Tuning Fork Tests ──
    {
        "q": "A {age}-old {gender} complains of decreased hearing in the right ear. On physical exam, the Weber test lateralizes to the right ear. The Rinne test on the right ear shows Bone Conduction > Air Conduction (BC > AC). What type of hearing loss does this patient have?",
        "options": ["Right-sided conductive hearing loss", "Right-sided sensorineural hearing loss", "Left-sided conductive hearing loss", "Left-sided sensorineural hearing loss", "Normal hearing"],
        "answer": 0,
        "exp": "In conductive hearing loss, the Weber test lateralizes to the AFFECTED ear, and Rinne is abnormal (BC > AC) in the affected ear. Therefore, this is a right-sided conductive hearing loss."
    },
    {
        "q": "A {age}-old {gender} complains of decreased hearing in the left ear. On physical exam, the Weber test lateralizes to the RIGHT ear. The Rinne test on the left ear shows Air Conduction > Bone Conduction (AC > BC). What type of hearing loss does this patient have?",
        "options": ["Left-sided sensorineural hearing loss", "Left-sided conductive hearing loss", "Right-sided sensorineural hearing loss", "Right-sided conductive hearing loss", "Bilateral conductive hearing loss"],
        "answer": 0,
        "exp": "In sensorineural hearing loss, the Weber test lateralizes to the NORMAL (better) ear, and Rinne is normal (AC > BC) in the affected ear. Since Weber lateralizes to the right (normal ear) and Rinne is AC > BC on the left, the patient has a left-sided sensorineural hearing loss."
    },
    {
        "q": "A {age}-old {gender} with a strong family history of early-onset hearing loss presents with progressive bilateral hearing impairment. Tympanometry is Type A (normal). The Schwartz sign (a flamingo-pink blush behind the TM) is noted on otoscopy. What is the most likely diagnosis?",
        "options": ["Otosclerosis", "Presbycusis", "Meniere's disease", "Acoustic neuroma", "Tympanosclerosis"],
        "answer": 0,
        "exp": "Otosclerosis is an autosomal dominant condition causing fixation of the stapes footplate, leading to progressive conductive hearing loss. The Schwartz sign (vascular blush over the promontory) indicates active otospongiosis."
    },
    {
        "q": "A {age}-old {gender} presents with progressive, bilateral, high-frequency hearing loss over the past 5 years. They have difficulty understanding speech, especially in noisy environments. Otoscopy is normal. What is the most likely diagnosis?",
        "options": ["Presbycusis", "Otosclerosis", "Noise-induced hearing loss", "Meniere's disease", "Ototoxicity"],
        "answer": 0,
        "exp": "Presbycusis is age-related sensorineural hearing loss. It is typically bilateral, symmetrical, and initially affects high frequencies, leading to difficulty discriminating speech in noisy backgrounds."
    },
    {
        "q": "A {age}-old {gender} construction worker presents with bilateral hearing loss. Audiogram shows a characteristic sensorineural hearing loss with a \"notch\" at the 4000 Hz frequency. What is the most likely cause?",
        "options": ["Noise-induced hearing loss", "Presbycusis", "Ototoxicity from aminoglycosides", "Meniere's disease", "Acoustic neuroma"],
        "answer": 0,
        "exp": "Noise-induced hearing loss classically presents on audiometry as a sensorineural dip or \"notch\" around the 4000 Hz frequency."
    },

    # ── Vertigo ──
    {
        "q": "A {age}-old {gender} presents with recurrent, brief episodes of severe room-spinning vertigo that last for 15-30 seconds. The episodes are reliably triggered by rolling over in bed or looking up at a high shelf. There is no hearing loss or tinnitus. What is the most likely diagnosis?",
        "options": ["Benign Paroxysmal Positional Vertigo (BPPV)", "Vestibular neuritis", "Meniere's disease", "Labyrinthitis", "Acoustic neuroma"],
        "answer": 0,
        "exp": "BPPV is caused by canalithiasis (calcium debris in the semicircular canals, usually posterior). It classically presents as brief (<1 minute) episodes of vertigo provoked by specific head movements, without auditory symptoms."
    },
    {
        "q": "What is the most appropriate diagnostic maneuver for a {age}-old {gender} suspected of having Benign Paroxysmal Positional Vertigo (BPPV) of the posterior semicircular canal?",
        "options": ["Dix-Hallpike maneuver", "Epley maneuver", "Caloric testing", "Head thrust test (Halmagyi)", "Romberg test"],
        "answer": 0,
        "exp": "The Dix-Hallpike maneuver is the diagnostic test for posterior canal BPPV. A positive test elicits vertigo and an upbeat, torsional nystagmus. The Epley maneuver is therapeutic, not diagnostic."
    },
    {
        "q": "A {age}-old {gender} presents with a 3-day history of severe, constant, continuous room-spinning vertigo, nausea, and vomiting. The patient had an upper respiratory tract infection 1 week ago. The patient denies any hearing loss or tinnitus. A horizontal nystagmus beating away from the affected side is observed. What is the most likely diagnosis?",
        "options": ["Vestibular neuritis", "Labyrinthitis", "Benign Paroxysmal Positional Vertigo (BPPV)", "Meniere's disease", "Cerebellar infarction"],
        "answer": 0,
        "exp": "Vestibular neuritis causes acute, severe, continuous peripheral vertigo (lasting days) often following a viral illness. It involves inflammation of the vestibular nerve. Because the cochlear nerve is spared, there is NO hearing loss (distinguishing it from labyrinthitis)."
    },
    {
        "q": "A {age}-old {gender} presents with a 2-day history of severe vertigo, nausea, and vomiting, identical to vestibular neuritis, but ALSO complains of severe unilateral hearing loss and ringing in the right ear. What is the most likely diagnosis?",
        "options": ["Labyrinthitis", "Vestibular neuritis", "Meniere's disease", "Acoustic neuroma", "BPPV"],
        "answer": 0,
        "exp": "Labyrinthitis involves inflammation of BOTH the vestibular and cochlear portions of CN VIII (or the inner ear itself). Therefore, it presents with acute, continuous severe vertigo PLUS sensorineural hearing loss and tinnitus."
    },
    {
        "q": "A {age}-old {gender} complains of episodic vertigo lasting 2 to 4 hours per episode. These episodes are accompanied by a feeling of \"fullness\" in the right ear, roaring tinnitus, and fluctuating low-frequency hearing loss. Between episodes, the patient feels entirely normal. What is the most likely diagnosis?",
        "options": ["Meniere's disease", "Vestibular migraine", "BPPV", "Vestibular neuritis", "Acoustic neuroma"],
        "answer": 0,
        "exp": "Meniere's disease (endolymphatic hydrops) is characterized by the classic triad of episodic vertigo (lasting 20 mins to hours), fluctuating sensorineural hearing loss (initially low frequency), and tinnitus/aural fullness."
    },
    {
        "q": "What is the recommended initial lifestyle and dietary modification for a {age}-old {gender} diagnosed with Meniere's disease?",
        "options": ["Low-salt diet and restriction of caffeine/alcohol", "Epley maneuver daily", "High-protein, low-carbohydrate diet", "Strict bed rest for 1 week", "Avoiding rapid head turning"],
        "answer": 0,
        "exp": "The initial management of Meniere's disease (endolymphatic hydrops) focuses on reducing endolymph fluid volume. This is achieved via a low-salt diet and avoiding triggers like caffeine, alcohol, and nicotine. Diuretics (e.g., HCTZ) are added if dietary changes fail."
    },

    # ── Acoustic Neuroma (Vestibular Schwannoma) ──
    {
        "q": "A {age}-old {gender} presents with slowly progressive, unilateral sensorineural hearing loss in the left ear over the past 2 years, accompanied by continuous tinnitus and mild unsteadiness (but no severe vertigo). Examination reveals an absent corneal reflex on the left side. What is the most likely diagnosis?",
        "options": ["Acoustic neuroma (Vestibular Schwannoma)", "Meniere's disease", "Cholesteatoma", "Presbycusis", "Labyrinthitis"],
        "answer": 0,
        "exp": "Acoustic neuromas are benign Schwann cell tumors of CN VIII. They cause progressive unilateral SNHL and tinnitus. As they grow in the cerebellopontine angle (CPA), they can compress CN V (causing loss of the corneal reflex) and CN VII (causing facial weakness)."
    },
    {
        "q": "Bilateral acoustic neuromas (vestibular schwannomas) are the hallmark of which genetic disorder?",
        "options": ["Neurofibromatosis type 2 (NF-2)", "Neurofibromatosis type 1 (NF-1)", "Tuberous Sclerosis", "Von Hippel-Lindau disease", "Sturge-Weber syndrome"],
        "answer": 0,
        "exp": "Bilateral vestibular schwannomas are virtually pathognomonic for Neurofibromatosis type 2 (NF-2), an autosomal dominant disorder caused by a mutation on chromosome 22."
    },

    # ── Temporal Bone Fractures ──
    {
        "q": "A {age}-old {gender} is involved in a severe motor vehicle collision and suffers a basilar skull fracture involving the temporal bone. Physical exam reveals clear fluid leaking from the ear canal (CSF otorrhea), profound sensorineural hearing loss, and immediate facial nerve paralysis. What type of temporal bone fracture is most likely present?",
        "options": ["Transverse temporal bone fracture", "Longitudinal temporal bone fracture", "Squamous cell fracture", "Mastoid tip fracture", "Zygomatic arch fracture"],
        "answer": 0,
        "exp": "Transverse temporal bone fractures cross the otic capsule, causing profound sensorineural hearing loss and severe vertigo. They also cross the facial nerve canal, resulting in a high rate (up to 50%) of immediate facial nerve paralysis."
    },
    {
        "q": "A {age}-old {gender} suffers a head injury. Exam shows bleeding from the ear canal, a step-off in the bony canal, and a torn tympanic membrane resulting in conductive hearing loss. Facial nerve function is intact initially but slightly delayed weakness occurs 2 days later. What type of temporal bone fracture is most likely?",
        "options": ["Longitudinal temporal bone fracture", "Transverse temporal bone fracture", "Occipital condyle fracture", "Sphenoid sinus fracture", "Parietal bone fracture"],
        "answer": 0,
        "exp": "Longitudinal temporal bone fractures are more common. They typically bypass the inner ear (causing conductive hearing loss due to ossicular disruption or TM tear) and have a lower rate of facial nerve paralysis (which is often delayed due to edema rather than immediate transection)."
    },

    # ── Miscellaneous / Pharmacology / Complications ──
    {
        "q": "A {age}-old {gender} with a history of recurrent acute otitis media presents with post-auricular pain, erythema, swelling, and outward/downward displacement of the auricle. The patient is febrile. What is the most appropriate initial diagnostic imaging modality to confirm the suspected diagnosis?",
        "options": ["CT scan of the temporal bones with contrast", "MRI of the brain", "Plain radiograph (X-ray) of the mastoid (Law/Schuller views)", "Ultrasound of the neck", "Bone scintigraphy"],
        "answer": 0,
        "exp": "The clinical picture describes Acute Mastoiditis, a severe complication of AOM. A CT scan of the temporal bones with IV contrast is the imaging modality of choice to confirm coalescent mastoiditis and evaluate for intracranial complications (e.g., epidural abscess, venous sinus thrombosis)."
    },
    {
        "q": "A {age}-old {gender} is prescribed otic drops for severe acute otitis externa. Otoscopy reveals a large central tympanic membrane perforation. Which of the following topical medications is CONTRAINDICATED in this patient due to ototoxicity?",
        "options": ["Neomycin/Polymyxin B/Hydrocortisone drops", "Ofloxacin drops", "Ciprofloxacin/Dexamethasone drops", "Fluocinolone drops", "Ketoconazole cream"],
        "answer": 0,
        "exp": "Aminoglycosides (like Neomycin) are highly ototoxic and are contraindicated if the tympanic membrane is perforated (or if a tympanostomy tube is in place) because they can reach the middle/inner ear and cause irreversible sensorineural hearing loss. Fluoroquinolone drops (Ofloxacin, Ciprofloxacin) are safe to use with a TM perforation."
    },
    {
        "q": "A {age}-old {gender} presents with sudden onset of unilateral peripheral facial palsy (inability to wrinkle forehead, close eye, or smile on the affected side). The ear exam reveals a vesicular rash on the concha and external auditory canal, and the patient reports severe otalgia. What is the most likely diagnosis?",
        "options": ["Ramsay Hunt syndrome (Herpes Zoster Oticus)", "Bell's palsy", "Acoustic neuroma", "Malignant otitis externa", "Acute mastoiditis"],
        "answer": 0,
        "exp": "Ramsay Hunt syndrome is caused by reactivation of the Varicella Zoster Virus (VZV) in the geniculate ganglion. It presents with the classic triad of ipsilateral facial nerve paralysis, severe ear pain, and a vesicular rash in the auditory canal/auricle."
    },
    {
        "q": "A {age}-old {gender} complains of pulsatile tinnitus in the right ear. Otoscopy reveals a reddish-blue, pulsatile mass behind an intact, transparent tympanic membrane. Blanching of the mass occurs with pneumatic otoscopy (Brown sign). What is the most likely diagnosis?",
        "options": ["Glomus tympanicum tumor", "Cholesteatoma", "Aberrant internal carotid artery", "High jugular bulb", "Otosclerosis"],
        "answer": 0,
        "exp": "A glomus tympanicum is a benign, highly vascular paraganglioma of the middle ear. It classically presents with pulsatile tinnitus and a red-blue pulsatile mass behind the TM that blanches with positive pressure (Brown's sign)."
    },
    {
        "q": "Which of the following medications is a well-known cause of reversible, dose-dependent tinnitus and sensorineural hearing loss?",
        "options": ["High-dose Aspirin (Salicylates)", "Amoxicillin", "Lisinopril", "Metformin", "Omeprazole"],
        "answer": 0,
        "exp": "High-dose salicylates (aspirin) classically cause a reversible, bilateral high-frequency sensorineural hearing loss accompanied by tinnitus. The symptoms usually resolve 24-72 hours after discontinuing the drug."
    }
]

ages = ["20-year", "35-year", "45-year", "55-year", "60-year", "65-year", "70-year", "75-year", "80-year", "18-year", "25-year", "40-year", "50-year", "12-year", "8-year", "5-year", "14-month", "3-year"]
genders = ["male", "female", "man", "woman", "gentleman", "lady", "boy", "girl"]

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
        
        # We assume topic id exists, format exact same as other scripts
        mcq_str = f"    (v_topic_id, 'Patient #{random.randint(10000, 99999)}: {q_text_escaped}', '{opts_json_escaped}'::jsonb, {new_ans_idx}, '{exp_escaped}')"
        
        if mcq_str not in mcqs:
            mcqs.append(mcq_str)
            counter += 1

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260518_ent_ear_mcqs_300.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - ENT (Ear)\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ent-ear' LIMIT 1;\n")
    f.write("    IF v_topic_id IS NULL THEN\n")
    f.write(f"        RAISE EXCEPTION 'Topic {topic_slug} not found.';\n")
    f.write("    END IF;\n\n")
    
    f.write("    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES\n")
    
    for i, m in enumerate(mcqs):
        if i < len(mcqs) - 1:
            f.write(m + ",\n")
        else:
            f.write(m + ";\n")
            
    f.write("END $$;\n")
    f.write("COMMIT;\n")

print(f"Generated {len(mcqs)} MCQs to {out_file}")
