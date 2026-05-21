import json
import random

random.seed(42)

topic_slug = 'geri-sensory-changes'

# ============================================================
# Pools of Variables for Randomization
# ============================================================
female_names = [
    "Margaret", "Eleanor", "Dorothy", "Ruth", "Mildred", "Frances", "Elizabeth",
    "Helen", "Alice", "Florence", "Gladys", "Marie", "Lillian", "Evelyn", "Jean",
    "Rose", "Irene", "Shirley", "Hazel", "Gertrude", "Louise", "Grace", "Ruby",
    "Virginia", "Catherine", "Martha", "Edna", "Phyllis", "Clara", "Edith"
]

male_names = [
    "James", "John", "Robert", "William", "Charles", "Thomas", "Walter", "Arthur",
    "Albert", "Harold", "Richard", "Joseph", "Henry", "George", "Edward", "Raymond",
    "Paul", "Donald", "Harry", "Ralph", "Kenneth", "David", "Eugene", "Howard",
    "Frank", "Lawrence", "Herbert", "Roy", "Clarence", "Stanley"
]

genders_pool = [
    {
        "gender": "male",
        "pronoun": "he",
        "pronoun_cap": "He",
        "possessive": "his",
        "possessive_cap": "His",
        "names": male_names
    },
    {
        "gender": "female",
        "pronoun": "she",
        "pronoun_cap": "She",
        "possessive": "her",
        "possessive_cap": "Her",
        "names": female_names
    }
]

# ============================================================
# 35 UNIQUE TEMPLATES - Geriatrics: Sensory changes — presbycusis, presbyopia, functional consequences
# ============================================================
templates = [
    # ===== PRESBYCUSIS & HEARING DOMAIN (Templates 1-15) =====
    # T1: Pathophysiology - Organ of Corti
    {
        "q": "A {age}-year-old {gender} named {name} is evaluated for progressive, bilateral hearing loss that has developed over the past several years. {pronoun_cap} reports having particular difficulty following conversations in public settings. Audiology confirms a diagnosis of presbycusis. What is the primary underlying pathophysiology of this age-related sensorineural hearing change?",
        "options": [
            "Degeneration and progressive loss of sensory hair cells (primarily outer hair cells) and spiral ganglion neurons, starting in the basal turn of the organ of Corti",
            "Stiffening of the tympanic membrane and calcification of the ossicular chain (particularly the stapes footplate)",
            "Atrophy of the primary auditory cortex and loss of temporal lobe neurons with normal cochlear function",
            "Excessive accumulation of endolymph within the semicircular canals and cochlear duct",
            "Chronic low-grade inflammation of the eustachian tube leading to bilateral middle ear effusion"
        ],
        "answer": 0,
        "exp": "Presbycusis is the most common form of age-related sensorineural hearing loss in older adults. The primary pathophysiology involves the **progressive degeneration and loss of sensory hair cells** (especially outer hair cells, then inner hair cells) and **spiral ganglion neurons**, beginning in the **basal turn of the organ of Corti** (which detects high-frequency sounds). Stiffening of the basilar membrane and atrophy of the stria vascularis (strial or metabolic presbycusis, which causes a flat hearing loss pattern) also contribute. Tympanic membrane stiffening is not the primary mechanism of presbycusis, nor is middle ear effusion. (Ref: Hazzard's Ch. 45; AGS Geriatrics At Your Fingertips; UWorld Step 2 CK)"
    },
    # T2: Audiogram Interpretation
    {
        "q": "A {age}-year-old {gender} named {name} presents to the clinic with slowly progressive, bilateral hearing difficulty. {pronoun_cap} reports that {pronoun} can hear that people are speaking but struggles to comprehend the specific words. An audiometry test is performed. Which of the following audiometric patterns is most characteristic of age-related presbycusis?",
        "options": [
            "Bilateral, symmetric, sloping high-frequency sensorineural hearing loss with relatively preserved low-frequency thresholds",
            "Unilateral, low-frequency sensorineural hearing loss with prominent acoustic recruitment",
            "Bilateral, symmetric conductive hearing loss with a maximum air-bone gap of 40 dB across all frequencies",
            "Bilateral sensorineural hearing loss demonstrating a sharp, localized notch at 4000 Hz with normal high frequencies",
            "Fluctuating sensorineural hearing loss affecting both high and low frequencies, associated with persistent episodic vertigo"
        ],
        "answer": 0,
        "exp": "Age-related presbycusis classically presents as a **bilateral, symmetric, sloping high-frequency sensorineural hearing loss**. Low frequencies are typically preserved in the early to moderate stages of the disease. Unilateral or highly asymmetric loss should prompt investigation for other etiologies, such as vestibular schwannoma (acoustic neuroma). A localized 4000 Hz notch is characteristic of noise-induced hearing loss (trauma), whereas fluctuating sensorineural loss with vertigo is characteristic of Meniere's disease. (Ref: Current Diagnosis & Treatment: Geriatrics Ch. 12; UWorld Step 2 CK; First Aid Step 2 CK)"
    },
    # T3: Consonant Speech Discrimination
    {
        "q": "A {age}-year-old {gender} named {name} reports difficulty understanding speech, particularly when attending family gatherings or sitting in noisy restaurants. {name} notes that people seem to 'mumble' and that {pronoun} can hear their voices but cannot make out the words. Which of the following best explains this clinical phenomenon in presbycusis?",
        "options": [
            "Selective loss of high-frequency hearing impairs the perception of voiceless consonants (e.g., s, f, t, p, k, sh, th), which carry the primary information for speech clarity and word discrimination",
            "A central processing deficit in the primary auditory cortex that specifically prevents the parsing of low-frequency vowel sounds",
            "Degeneration of the low-frequency hair cells in the apex of the cochlea, which are responsible for detecting the overall loudness of speech",
            "Excessive acoustic impedance in the middle ear due to fluid accumulation that dampens all incoming speech sounds equally",
            "Transient vestibular dysfunction that causes visual and auditory stimuli to become uncoupled in noisy settings"
        ],
        "answer": 0,
        "exp": "Speech is composed of low-frequency vowels (which provide volume) and high-frequency consonants (which provide clarity and word discrimination). Voiceless consonants like *s, f, t, p, k, sh, th* operate at higher frequencies (2000-8000 Hz). Because presbycusis selectively degrades high-frequency hearing, older adults lose the ability to distinguish these consonants. Consequently, speech sounds loud enough (due to preserved low-frequency vowels) but lacks clarity ('people are mumbling'), especially in environments with background noise (cocktail party effect). (Ref: Hazzard's Ch. 45; AGS Geriatrics At Your Fingertips; Master the Boards Step 2 CK)"
    },
    # T4: Hearing Aid Selection & Fitting (Directional Microphones)
    {
        "q": "A {age}-year-old {gender} named {name} with moderate presbycusis is fitted with a digital hearing aid. After {weeks_duration} weeks of use, {pronoun} complains that although {pronoun} can hear better in quiet rooms, {pronoun} still struggles significantly in noisy social settings because the device amplifies background noise. Which of the following hearing aid technologies or adjustments is most appropriate to address {possessive} complaint?",
        "options": [
            "Activation of a directional microphone system that prioritizes sounds coming from the front while attenuating noise from the sides and behind",
            "Increasing the overall gain of the hearing aid across all frequencies to overpower background noise",
            "Switching from a digital hearing aid to an analog hearing aid with a bone-conduction receiver",
            "Disabling the digital noise reduction algorithms to allow natural sound filtering by the brainstem",
            "Recommending a monaural hearing aid fitting instead of a bilateral fitting to reduce total auditory input"
        ],
        "answer": 0,
        "exp": "Modern digital hearing aids use **directional microphones** to help older adults with presbycusis distinguish speech from background noise. By prioritizing acoustic inputs from the front (where the speaker is typically located) and attenuating ambient noise from the sides and rear, directional microphones improve the signal-to-noise ratio. Other helpful features include digital noise reduction and feedback cancellation. Monaural fitting is inferior to binaural fitting for speech localization and understanding in noise. (Ref: Hazzard's Ch. 45; Current Diagnosis & Treatment: Geriatrics Ch. 12)"
    },
    # T5: Assistive Listening Devices (ALDs)
    {
        "q": "A {age}-year-old {gender} named {name} residing in an assisted living facility has severe presbycusis and struggles to participate in group lectures or hear the television, even when wearing properly fitted digital hearing aids. Which of the following is the most appropriate next step to improve {possessive} functional communication and quality of life?",
        "options": [
            "Introduce an Assistive Listening Device (ALD) such as a personal frequency-modulated (FM) system, infrared system, or a personal amplifier (e.g., PocketTalker)",
            "Discontinue the hearing aids permanently and initiate speech-reading (lip-reading) training as the sole communication modality",
            "Refer the patient for immediate surgical middle ear ossicular reconstruction to bypass the sensorineural loss",
            "Increase the hearing aid volume until it produces a continuous high-pitched squeal (acoustic feedback) to ensure maximum amplification",
            "Prescribe a course of high-dose oral glucocorticoids to regenerate the degenerated auditory pathway"
        ],
        "answer": 0,
        "exp": "When hearing aids are insufficient for functional communication, particularly in large rooms, classrooms, or for watching television, **Assistive Listening Devices (ALDs)** are indicated. These include personal frequency-modulated (FM) systems, infrared systems, or simple personal amplifiers (e.g., PocketTalker). ALDs work by bringing the sound source directly to the listener's ear, minimizing the negative effects of distance, reverberation, and background noise. Acoustic feedback (squealing) indicates a poor mold fit or excessive volume and is undesirable. (Ref: Hazzard's Ch. 45; AGS Geriatrics At Your Fingertips)"
    },
    # T6: Cochlear Implants Criteria
    {
        "q": "A {age}-year-old {gender} named {name} has severe-to-profound bilateral sensorineural hearing loss and derives virtually no benefit from high-power, properly fitted digital hearing aids. {possessive_cap} speech recognition score is {speech_score}% on standardized sentence tests. {pronoun_cap} is otherwise cognitively intact and medically stable. Which of the following is the most appropriate recommendation?",
        "options": [
            "Refer to an otolaryngologist for cochlear implant evaluation; older adults can achieve significant improvements in speech perception and quality of life, regardless of advanced age",
            "Advise the patient that cochlear implantation is strictly contraindicated in individuals aged >= 65 due to poor neuroplasticity",
            "Recommend continuing with non-functioning hearing aids and starting low-dose antidepressant therapy to manage sensory deprivation",
            "Suggest bilateral middle ear implants (vibrant soundbridge) as they are superior to cochlear implants for profound sensorineural loss",
            "Prescribe a trial of hyperbaric oxygen therapy to regenerate the damaged hair cells of the organ of Corti"
        ],
        "answer": 0,
        "exp": "**Cochlear implants** are the standard of care for adults with severe-to-profound bilateral sensorineural hearing loss who receive limited benefit from hearing aids (defined typically as speech/sentence recognition scores <= 50-60%). Advanced age is **not a contraindication** to cochlear implantation; studies show that older adults (even octogenarians and nonagenarians) experience significant gains in speech understanding, functional independence, and quality of life, with surgical complication rates comparable to younger cohorts. (Ref: Hazzard's Ch. 45; Current Diagnosis & Treatment: Geriatrics Ch. 12; JAMA Otolaryngol 2018)"
    },
    # T7: Ototoxic Medications (Aminoglycosides)
    {
        "q": "A {age}-year-old {gender} named {name} is hospitalized for a severe pseudomonal urinary tract infection and treated with intravenous {aminoglycoside}. On day {day_num} of therapy, {pronoun} complains of new-onset bilateral high-pitched tinnitus and a feeling of imbalance. What is the mechanism of action of the drug causing this adverse effect, and what is the target tissue?",
        "options": [
            "Aminoglycoside-induced cochleotoxicity and vestibulotoxicity via accumulation in the endolymph, leading to reactive oxygen species (ROS) generation and apoptosis of sensory hair cells",
            "Loop diuretic-induced edema of the stria vascularis, altering the endolymphatic potential and blocking acoustic transduction",
            "Salicylate-induced inhibition of cyclooxygenase, disrupting the cochlear microcirculation and causing reversible tinnitus",
            "Cisplatin-induced cross-linking of DNA in the spiral ganglion neurons of the cochlear apex",
            "Antihistamine-induced anticholinergic blockade of the vestibular nuclei in the brainstem causing sensory conflict"
        ],
        "answer": 0,
        "exp": "**Aminoglycosides** (gentamicin, tobramycin, amikacin) are well-known ototoxic agents. They are cleared slowly from the inner ear fluids (endolymph and perilymph), leading to accumulation. Once inside sensory hair cells, they generate **reactive oxygen species (ROS)**, which trigger cascade pathways resulting in **outer hair cell apoptosis**. Gentamicin and tobramycin are primarily vestibulotoxic (causing ataxia, oscillopsia, and gait instability), whereas amikacin and neomycin are primarily cochleotoxic (causing permanent high-frequency hearing loss and tinnitus). Risk factors include prolonged therapy, renal impairment, and concomitant use of other ototoxic drugs (e.g., loop diuretics). (Ref: Hazzard's Ch. 45; AGS Beers Criteria 2023; First Aid Step 2 CK)"
    },
    # T8: Loop Diuretics & Ototoxicity (Furosemide)
    {
        "q": "A {age}-year-old {gender} named {name} with chronic kidney disease stage G{ckd_stage} is admitted for an acute flare of congestive heart failure. {pronoun_cap} is started on high-dose intravenous {loop_diuretic}. During the rapid infusion, {pronoun} complains of sudden hearing loss and roaring tinnitus. Which of the following best describes the pathophysiology and clinical course of this ototoxic event?",
        "options": [
            "Loop diuretics inhibit the Na+/K+/2Cl- cotransporter in the stria vascularis of the cochlea, disrupting the endolymphatic potential; this effect is typically transient and reversible but can be permanent with rapid high-dose infusions, especially in renal impairment",
            "Loop diuretics cause irreversible degeneration of the spiral ganglion neurons in the basal turn of the cochlea",
            "Loop diuretics cause a conductive hearing loss by promoting fluid accumulation (effusion) within the middle ear cleft",
            "Loop diuretics inhibit cochlear cyclooxygenase, leading to chronic vasoconstriction of the internal auditory artery",
            "Loop diuretics cause central auditory processing delays by blocking calcium channels in the olivocochlear bundle"
        ],
        "answer": 0,
        "exp": "**Loop diuretics** (furosemide, bumetanide, torsemide, ethacrynic acid) cause ototoxicity by inhibiting the **Na+/K+/2Cl- cotransporter (NKCC1)** in the **stria vascularis** of the cochlea. This disrupts the ion transport required to maintain the high potassium concentration in the endolymph, thereby abolishing the endocochlear potential and causing hearing loss and tinnitus. This ototoxicity is **usually transient and reversible** once the drug is discontinued. However, it can become **permanent**, particularly when administered as a rapid IV bolus at high doses, in patients with chronic kidney disease (where drug clearance is impaired), or when co-administered with other ototoxic drugs like aminoglycosides. (Ref: Hazzard's Ch. 45; AGS Beers Criteria 2023; UWorld Step 2 CK)"
    },
    # T9: Salicylates Tinnitus & Hearing Loss
    {
        "q": "A {age}-year-old {gender} named {name} with severe osteoarthritis has been self-medicating with high doses of over-the-counter {aspirin_name} (taking {aspirin_dose} g daily). {pronoun_cap} presents with bilateral, continuous high-pitched tinnitus and mild, flat sensorineural hearing loss. What is the most appropriate clinical reasoning and management?",
        "options": [
            "Salicylate ototoxicity is caused by reversible inhibition of prestin (the motor protein of outer hair cells) and altered arachidonic acid metabolism; the symptoms are completely reversible and will resolve within 24-72 hours of discontinuing the drug",
            "Salicylates cause permanent necrosis of the inner hair cells in the apex of the cochlea; the hearing loss is irreversible, and the patient should be referred for immediate hearing aid fitting",
            "The symptoms are caused by salicylate-induced chronic otitis media; prescribe a 10-day course of oral amoxicillin-clavulanate",
            "Salicylates cause central vestibular neuropathy; obtain a brain MRI to evaluate for cerebellar demyelination and stop the drug",
            "Instruct the patient to double the salicylate dose to suppress the auditory phantom perception (tinnitus) via NMDA blockade"
        ],
        "answer": 0,
        "exp": "High-dose **salicylates (aspirin)** cause ototoxicity characterized by **bilateral high-pitched tinnitus** and mild-to-moderate symmetric sensorineural hearing loss. The pathophysiology involves: (1) Inhibition of **prestin**, a motor protein in outer hair cells responsible for electromotility (cochlear amplifier), which dampens cochlear sensitivity, and (2) Alterations in arachidonic acid metabolism, causing NMDA receptor hyperactivation in spiral ganglion neurons. Salicylate-induced ototoxicity is **completely reversible** and typically resolves within 24 to 72 hours after discontinuing or reducing the dose. (Ref: Hazzard's Ch. 45; AGS Beers Criteria 2023; First Aid Step 2 CK)"
    },
    # T10: Cerumen Impaction vs. Presbycusis
    {
        "q": "A {age}-year-old {gender} named {name} presents with a chief complaint of sudden worsening of hearing in {possessive} {ear_side} ear over the past 24 hours. Physical examination reveals:\n• Weber test: **Lateralizes to the {ear_side} ear**\n• Rinne test: **Bone conduction > Air conduction in the {ear_side} ear; Air conduction > Bone conduction in the opposite ear**\nOtoscopy reveals a large, dark brown, solid mass occluding 100% of the external auditory canal. What is the most likely diagnosis, and what is the underlying physical mechanism?",
        "options": [
            "Cerumen impaction causing conductive hearing loss; the physical barrier prevents sound waves from reaching the tympanic membrane, resulting in bone conduction bypass lateralizing to the affected side",
            "Presbycusis causing sensorineural hearing loss; degeneration of the hair cells in the basal turn of the cochlea preventing hair cell depolarization",
            "Otosclerosis causing sensorineural hearing loss; bony overgrowth of the semicircular canals and oval window",
            "Acoustic neuroma causing conductive hearing loss; tumor compression of the facial nerve and internal auditory canal",
            "Meniere's disease causing conductive hearing loss; endolymphatic hydrops disrupting the ossicular chain and tympanic membrane"
        ],
        "answer": 0,
        "exp": "This patient presents with a **conductive hearing loss** in the affected ear, as demonstrated by the **Weber test lateralizing to the affected ear** and a **negative Rinne test (BC > AC)** in that same ear. Conductive hearing loss is caused by a defect in the sound-conducting mechanism (external canal, tympanic membrane, or ossicles). **Cerumen impaction** is the most common cause of conductive hearing loss in older adults, affecting up to 57% of nursing home residents. Removing the cerumen (via irrigation, cerumenolytics, or manual extraction) restores hearing. Presbycusis is a sensorineural hearing loss, which would show Weber lateralizing to the *normal* ear and Rinne *positive (AC > BC)* in both ears. (Ref: Hazzard's Ch. 45; AGS Geriatrics At Your Fingertips; UWorld Step 2 CK)"
    },
    # T11: Otosclerosis in Older Adults
    {
        "q": "A {age}-year-old {gender} named {name} presents with slowly progressive, bilateral hearing loss. Rinne test is negative (BC > AC) bilaterally. Weber test does not lateralize. Audiogram shows a bilateral conductive hearing loss, with a specific drop in bone conduction thresholds at 2000 Hz (**Carhart's notch**). Otoscopy is completely normal. What is the most likely diagnosis?",
        "options": [
            "Otosclerosis; a metabolic bone disease characterized by abnormal bone remodeling of the otic capsule, leading to fixation of the stapes footplate",
            "Presbycusis; age-related sensorineural degeneration of the auditory nerve and sensory cochlear structures",
            "Cholesteatoma; a destructive, keratinizing epithelial lesion of the middle ear or mastoid cavity",
            "Temporal arteritis; autoimmune vasculitis causing ischemia of the cochlea and stria vascularis",
            "Eustachian tube dysfunction; chronic negative middle ear pressure with retraction pocket and fluid accumulation"
        ],
        "answer": 0,
        "exp": "**Otosclerosis** is a metabolic bone disease of the otic capsule characterized by abnormal bone resorption and deposition. It classically leads to **fixation of the stapes footplate** in the oval window, causing progressive conductive hearing loss. Key diagnostic features: (1) Bilateral conductive hearing loss (Rinne negative BC > AC), (2) Normal tympanic membrane (ruling out otitis media or cholesteatoma), and (3) **Carhart's notch** (a characteristic artificial dip in bone conduction thresholds at 2000 Hz due to loss of the normal stapes resonance). While typically presenting in young adulthood, otosclerosis can progress or present in older adults. Treatment includes hearing aids or stapedectomy. (Ref: Hazzard's Ch. 45; First Aid Step 2 CK)"
    },
    # T12: Sudden Sensorineural Hearing Loss (SSNHL)
    {
        "q": "A {age}-year-old {gender} named {name} presents with a sudden loss of hearing in the {ear_side} ear that occurred over {hours_duration} hours yesterday morning. {pronoun_cap} reports associated high-pitched tinnitus and mild vertigo. There is no history of trauma or ototoxic exposures. Otoscopy is normal. Weber test lateralizes to the **opposite** ear. Rinne test is positive (AC > BC) bilaterally. Which of the following is the most appropriate next step in management?",
        "options": [
            "Initiate high-dose oral glucocorticoids (e.g., prednisone 60 mg daily for 10-14 days) immediately, and refer to an otolaryngologist for urgent evaluation; this is a medical emergency",
            "Reassure the patient that this is a normal age-related hearing change (presbycusis) and schedule a routine audiology referral in 6 months",
            "Start empiric oral amoxicillin-clavulanate for acute otitis media and advise hydrogen peroxide ear drops to clear cerumen",
            "Order an urgent non-contrast CT scan of the temporal bone and defer all medications until the imaging is reviewed",
            "Prescribe a 5-day course of oral acyclovir, as the condition is universally caused by herpes simplex virus reactivation and steroids are contraindicated"
        ],
        "answer": 0,
        "exp": "**Sudden sensorineural hearing loss (SSNHL)** is defined as a rapid-onset sensorineural hearing loss of >= 30 decibels affecting >= 3 contiguous frequencies within 72 hours. It is a **medical emergency**. The Weber test lateralizing to the *opposite (normal) ear* and Rinne test *positive (AC > BC)* confirms a sensorineural deficit on the affected side. The etiology is idiopathic in most cases (post-viral or microvascular). **Immediate initiation of high-dose oral corticosteroids** (prednisone 1 mg/kg/day, up to 60 mg, or intratympanic steroid injections) within 2 weeks of onset significantly improves the rate of hearing recovery. Deferring treatment leads to permanent hearing loss. (Ref: Hazzard's Ch. 45; AAO-HNS Clinical Practice Guideline; UWorld Step 2 CK)"
    },
    # T13: Presbycusis and Vestibular Function
    {
        "q": "A {age}-year-old {gender} named {name} with severe presbycusis presents with progressive gait instability and recurrent falls, especially in low-light environments. Neurological examination reveals normal strength, reflexes, and proprioception. However, the patient has a wide-based gait and sways significantly during the Romberg test **only** when eyes are closed. What is the most likely pathophysiological link between {possessive} hearing loss and {possessive} balance deficit?",
        "options": [
            "Concurrent age-related degeneration of vestibular hair cells and otoconia in the saccule and utricle (presbyb equilibrium/presbyastasis), compounding the sensory deficit of presbycusis",
            "A localized cerebellar vermis infarct that selectively damages high-frequency auditory inputs and vestibulospinal reflexes",
            "Diabetic peripheral neuropathy causing sensory ataxia due to demyelination of the dorsal columns of the spinal cord",
            "Excessive accumulation of endolymph within the cochlea leading to mechanical blockage of the Eustachian tube",
            "Hearing aids causing chronic visual vestibular mismatch by vibrating the ossicular chain and semicircular canals"
        ],
        "answer": 0,
        "exp": "Age-related hearing loss (presbycusis) often co-occurs with age-related vestibular decline (**presbyastasis** or presbyb equilibrium) because both cochlear and vestibular structures reside in the inner ear and share common arterial supply (internal auditory artery) and pathways. Pathophysiology includes: (1) Degeneration of hair cells in the semicircular canals, saccule, and utricle, (2) Loss of vestibular nerve fibers, and (3) Reduction in otoconia. This vestibular deficit impairs the vestibulo-ocular reflex (VOR) and vestibulospinal reflex, causing gait instability. In low light, the loss of visual compensation worsens the instability, leading to falls. (Ref: Hazzard's Ch. 45; AGS Geriatrics At Your Fingertips; Current Geriatrics)"
    },
    # T14: Auditory Rehabilitation & Communication Strategies
    {
        "q": "A {age}-year-old {gender} named {name} with severe presbycusis has recently moved to a long-term care facility. The nursing staff notes that the patient often withdraws from conversations, appears confused during medical reviews, and is suspected of having cognitive impairment. What is the most appropriate first-line communication strategy for the staff to implement?",
        "options": [
            "Face the patient directly at eye level, minimize background noise, speak slowly and clearly in a slightly lower pitch/tone, and use concise sentences; avoid shouting",
            "Shout directly into the patient's ear at a high volume and high pitch to overcome the high-frequency hearing loss",
            "Communicate exclusively through written notes, as older adults with presbycusis cannot process any spoken words",
            "Increase the speed of speech to keep the auditory cortex stimulated and prevent central cognitive processing delays",
            "Stand behind the patient while speaking to prevent the patient from relying on lip-reading, which impairs central auditory adaptation"
        ],
        "answer": 0,
        "exp": "Proper communication techniques are essential when interacting with older adults with presbycusis: (1) **Face the patient directly** to allow visual cues (speech-reading/lip-reading) and gestures, (2) **Minimize background noise** (turn off TV, close door), (3) **Speak slowly and clearly**, (4) **Lower the pitch of your voice** (low-frequency hearing is preserved, while high-frequency hearing is lost), (5) **Do NOT shout** (shouting distorts the acoustic signal, increases the pitch of the voice, and makes speech even harder to understand). These strategies help prevent misdiagnosing hearing loss as cognitive decline or dementia. (Ref: Hazzard's Ch. 45; AGS Geriatrics At Your Fingertips)"
    },
    # T15: Tinnitus in Older Adults
    {
        "q": "A {age}-year-old {gender} named {name} with long-standing bilateral presbycusis presents with a 6-month history of continuous, high-pitched, bilateral ringing in {possessive} ears. The tinnitus is most bothersome at night in a quiet bedroom, causing insomnia and anxiety. There are no focal neurological deficits. What is the most appropriate initial management strategy?",
        "options": [
            "Reassure the patient, recommend sound masking (e.g., white noise machines, fans, or hearing aids that amplify ambient noise during the day), and initiate cognitive behavioral therapy (CBT) to reduce tinnitus-associated distress",
            "Prescribe a daily long-acting benzodiazepine (e.g., clorazepate or flurazepam) at bedtime as first-line therapy to suppress the auditory signal",
            "Refer for immediate intracranial angiogram to rule out a high-flow arteriovenous malformation",
            "Start the patient on high-dose oral aminoglycosides to chemically ablate the hyperactive cochlear hair cells",
            "Recommend absolute silence in the bedroom and avoiding all background sounds to allow the auditory system to rest"
        ],
        "answer": 0,
        "exp": "Tinnitus is highly prevalent in older adults with presbycusis. It represents a central auditory neuroplastic response to peripheral sensory deprivation (cochlear deafferentation). Management focuses on **habituation and distress reduction**: (1) **Reassurance** (tinnitus is rarely a sign of serious disease), (2) **Sound masking** (white noise, fans, or hearing aids, which amplify ambient noise and decrease the brain's focus on the internal phantom sound), and (3) **Cognitive Behavioral Therapy (CBT)**, which is the most evidence-based approach for tinnitus-related distress. Benzodiazepines are **Beers Criteria drugs** and should be avoided due to fall and delirium risk. Aminoglycosides are ototoxic and will worsen hearing loss and tinnitus. (Ref: AAO-HNS Clinical Practice Guideline; Hazzard's Ch. 45; AGS Beers Criteria 2023)"
    },

    # ===== PRESBYOPIA & VISION DOMAIN (Templates 16-24) =====
    # T16: Presbyopia Pathophysiology
    {
        "q": "A {age}-year-old {gender} named {name} presents with blurred near vision and eye strain. {pronoun_cap} reports holding reading materials at arm's length to see clearly. What is the primary underlying pathophysiology of this universal, age-related ocular change?",
        "options": [
            "Progressive stiffening and loss of elasticity of the lens nucleus and capsule, combined with age-related functional decline of the ciliary muscle, leading to a loss of accommodative power",
            "Progressive shortening of the anteroposterior diameter of the globe, causing light to focus behind the retina",
            "Degeneration of the photoreceptor cells within the fovea centralis of the macula lutea",
            "Progressive clouding and opacification of the crystalline lens matrix due to protein denaturation",
            "Increased resistance to aqueous humor outflow through the trabecular meshwork"
        ],
        "answer": 0,
        "exp": "**Presbyopia** is the universal age-related loss of **accommodative amplitude** (the ability to focus on near objects). The primary pathophysiology involves: (1) **Loss of elasticity** and progressive stiffening of the lens capsule and lens nucleus (lens sclerosis), making it less able to become spherical, and (2) **Functional decline of the ciliary muscle**. When ciliary muscle contracts, zonules relax, and a young elastic lens naturally rounds up to increase refractive power. An older stiffened lens cannot change shape, so light from near objects focuses *behind* the retina rather than *on* it. (Ref: Hazzard's Ch. 44; Current Diagnosis & Treatment: Geriatrics Ch. 12; UWorld Step 2 CK)"
    },
    # T17: Convex Lens Prescribing
    {
        "q": "A {age}-year-old {gender} named {name} is diagnosed with presbyopia. {possessive_cap} distance vision is completely normal (20/20), but {pronoun} requires correction for reading. Which of the following lens types is indicated to correct {possessive} near vision, and what is its optical mechanism?",
        "options": [
            "Convex (plus) lenses; they converge incoming light rays before they enter the eye, shifting the focal point forward onto the retina to compensate for the loss of natural lens accommodation",
            "Concave (minus) lenses; they diverge incoming light rays, shifting the focal point backward to compensate for an abnormally elongated globe",
            "Cylindrical lenses; they correct focal disparities along different meridians of the cornea and anterior chamber",
            "Prism lenses; they shift the visual field to correct binocular diplopia and ocular misalignment",
            "Photochromic lenses; they filter high-intensity ultraviolet light to prevent corneal edema and pupil constriction"
        ],
        "answer": 0,
        "exp": "Presbyopia causes the near point of accommodation to recede, meaning light from near objects focuses behind the retina. To correct near vision in a patient with normal distance vision (emmetropia), **convex (plus) lenses** are prescribed. Convex lenses are converging lenses: they bend light rays inward before they reach the cornea, increasing the refractive power of the optical system and shifting the focal point forward onto the fovea. Concave lenses are diverging lenses used to correct myopia (nearsightedness). Cylindrical lenses correct astigmatism. (Ref: Hazzard's Ch. 44; First Aid Step 2 CK)"
    },
    # T18: Multifocal Lenses as Fall Risk
    {
        "q": "A {age}-year-old {gender} named {name} with a history of hypertension and osteoarthritis is prescribed {lens_type} glasses to manage concurrent presbyopia and myopia. {pronoun_cap} presents to the clinic after sustaining a fall while walking down {possessive} basement stairs. {pronoun_cap} reports that {pronoun} misjudged the height of the step. Which of the following is the most accurate clinical reasoning regarding the relationship between {possessive} eyewear and {possessive} fall?",
        "options": [
            "The lower segment of multifocal/bifocal lenses is designed for near vision; looking through it while walking distorts depth perception and spatial awareness of the lower visual field (e.g., stairs, curbs), increasing fall risk",
            "Multifocal lenses cause chronic pupillary constriction, which impairs dark adaptation and leads to sudden autonomic syncope on stairs",
            "The patient should wear stronger reading glasses while walking to improve visual acuity of distant stairs and obstacles",
            "Multifocal glasses cause transient horizontal nystagmus by stimulating the vestibular system during vertical eye movements",
            "The fall was unrelated to the glasses and was entirely caused by age-related peripheral motor apraxia"
        ],
        "answer": 0,
        "exp": "**Multifocal, bifocal, and progressive lenses** are a major, often overlooked, modifiable risk factor for falls in older adults. The lower portion of these lenses is corrected for near vision (reading distance). When an older adult looks down through the bottom of the lens while walking or navigating stairs, the ground and steps appear **blurred and distorted**, which severely **impairs depth perception and spatial contrast sensitivity**. The **Visible Trial** demonstrated that providing **single-lens distance glasses for outdoor walking and stair navigation** in older adults who habitually wore multifocals reduced fall rates by 40%. (Ref: Visible Trial, BMJ 2010; Hazzard's Ch. 12; AGS/BGS Fall Prevention Guidelines)"
    },
    # T19: Contrast Sensitivity Decline
    {
        "q": "A {age}-year-old {gender} named {name} with mild cataracts and presbyopia reports increasing difficulty walking in the evening, stepping off curbs, and reading text printed on colored paper. {pronoun_cap} has 20/30 visual acuity on the Snellen chart in bright light. Which of the following visual parameters is impaired in this patient, and what is its functional consequence?",
        "options": [
            "Contrast sensitivity (the ability to detect subtle differences between target and background); impairment increases the risk of falls on stairs, curbs, and uneven surfaces, especially in low-light conditions, even if Snellen visual acuity is relatively preserved",
            "Kinetic visual field; leading to selective loss of peripheral vision and bitemporal hemianopsia",
            "Intraocular pressure accommodation; leading to optic nerve head cupping and decreased tear production",
            "Glare recovery; causing immediate permanent pupillary dilation and corneal clouding",
            "Color vision (trichromacy); causing selective loss of red-green perception due to rod degeneration"
        ],
        "answer": 0,
        "exp": "**Contrast sensitivity** is the ability of the visual system to distinguish an object from its background (e.g., detecting a grey step against a grey floor). It naturally declines with age due to changes in the lens (cataracts/increased light scattering) and retina (loss of ganglion cells). A patient can have **near-normal Snellen visual acuity (e.g., 20/30) in high-contrast, bright clinical settings** but still have severe functional impairment in low-contrast, real-world settings (e.g., dim light, fog, rain). Poor contrast sensitivity is strongly associated with **recurrent falls, driving accidents**, and difficulty performing activities of daily living (ADLs). (Ref: Hazzard's Ch. 44; AGS Geriatrics At Your Fingertips; Ophthalmology 2011)"
    },
    # T20: Glare Sensitivity & Night Driving
    {
        "q": "A {age}-year-old {gender} named {name} presents for a routine physical. {possessive_cap} family reports that {pronoun} recently stopped driving at night because {pronoun} was 'blinded' by the headlights of oncoming cars, taking several seconds to recover {possessive} vision. What is the physiological basis of this sensory change, and what is the best clinical recommendation?",
        "options": [
            "Increased glare sensitivity and delayed glare recovery due to light scattering by age-related lens opacities (cataracts) and slower pupillary constriction/adaptation; recommend formal driving assessment and counsel on avoiding night driving",
            "Accelerated degeneration of the outer segment of macular cones; prescribe high-dose vitamin A and recommend driving only during twilight",
            "Severe atrophy of the optic tract; refer for emergent neurosurgical decompression",
            "Excessive accumulation of rhodopsin in the vitreous humor; prescribe topical miotic drops to induce miosis",
            "Age-related loss of visual pathway myelin; reassure the patient that this is normal and advise using high-beam headlights continuously"
        ],
        "answer": 0,
        "exp": "Age-related ocular changes, particularly **cataracts** (which cause light to scatter across the retina) and **miosis** (smaller resting pupil size) coupled with **slower pupillary light reflex/adaptation**, lead to **increased glare sensitivity and prolonged glare recovery time**. When exposed to a bright light source (such as oncoming headlights at night), older adults are functionally blinded for several seconds. This represents a significant **driving safety hazard**. The best recommendation is to evaluate for cataracts, optimize corrective lenses, and counsel the patient to avoid night driving. (Ref: Hazzard's Ch. 44; Current Diagnosis & Treatment: Geriatrics Ch. 12; AGS Geriatrics At Your Fingertips)"
    },
    # T21: Visual Field Deficits & Driving
    {
        "q": "A {age}-year-old {gender} named {name} with advanced bilateral open-angle glaucoma is undergoing a visual assessment. {possessive_cap} visual acuity is 20/30 bilaterally with corrective lenses. However, automated perimetry reveals significant binocular peripheral visual field loss. What is the most appropriate clinical advice regarding {possessive} driving safety?",
        "options": [
            "Visual field integrity is critical for driving safety; peripheral field loss increases the risk of intersection crashes and colliding with obstacles, meaning visual acuity alone is insufficient to guarantee safety, and the patient may fail state DMV licensing requirements",
            "The patient is safe to drive without restrictions because {possessive} visual acuity is better than 20/40, which is the sole metric used by regulatory agencies",
            "Advise the patient to install convex mirrors on the hood of {possessive} car to completely bypass the need for peripheral vision while driving",
            "Prescribe a high-power prism lens to expand {possessive} visual field by 180 degrees and bypass glaucoma damage",
            "Glaucoma-related visual field deficits only affect near vision, so the patient is safe to drive at high speeds on highways"
        ],
        "answer": 0,
        "exp": "Glaucoma causes progressive loss of **peripheral vision (visual field)** while preserving central visual acuity until advanced stages. A patient can easily read 20/30 on a Snellen chart but have a severe visual field deficit (tunnel vision). **Driving requires an intact visual field** (typically at least 110-120 degrees horizontally in most states) to detect hazards, traffic signs, and pedestrians from the sides. Patients with visual field deficits are at a highly elevated risk for motor vehicle collisions. Visual acuity alone does not reflect driving safety. (Ref: Hazzard's Ch. 44; AGS Geriatrics At Your Fingertips; AMA Guide to Assessing Older Drivers)"
    },
    # T22: Charles Bonnet Syndrome
    {
        "q": "A {age}-year-old {gender} named {name} with severe bilateral central vision loss due to dry age-related macular degeneration (visual acuity {vis_acuity} bilaterally) is brought to the clinic by {possessive} family. The family is highly concerned because the patient reports seeing colorful, detailed images of 'cartoons, flowers, and children' sitting in {possessive} living room. The patient is fully aware that these figures are not real and has no cognitive impairment, memory loss, or auditory hallucinations. What is the most likely diagnosis and underlying mechanism?",
        "options": [
            "Charles Bonnet Syndrome; visual release hallucinations caused by sensory deprivation (loss of visual input) leading to spontaneous, hyperactive firing of cortical visual association areas",
            "Dementia with Lewy Bodies; progressive cortical neurodegeneration characterized by visual hallucinations, parkinsonism, and fluctuating cognition",
            "Late-onset schizophrenia; chronic primary psychotic disorder characterized by complex visual hallucinations and persecutory delusions",
            "Creutzfeldt-Jakob Disease; rapidly progressive prion-induced encephalopathy causing cortical blindness and hallucinations",
            "Anticholinergic toxicity; acute delirium induced by over-the-counter sleep aids"
        ],
        "answer": 0,
        "exp": "**Charles Bonnet Syndrome (CBS)** is characterized by **complex, vivid visual hallucinations** in patients with **severe visual impairment** (most commonly macular degeneration, cataracts, or glaucoma). Pathophysiology involves **sensory deprivation (deafferentation)**: when visual input to the brain is lost, the visual association cortex is no longer inhibited and begins to fire spontaneously and hyperactively (visual release phenomenon). Crucially, **cognition is intact, and patients retain insight** — they know the hallucinations are not real. CBS is often misdiagnosed as dementia, schizophrenia, or delirium, causing unnecessary anxiety. Reassurance is the primary intervention. (Ref: Hazzard's Ch. 44; Current Diagnosis & Treatment: Geriatrics Ch. 12; UWorld Step 2 CK)"
    },
    # T23: Auditory/Musical Hallucinations (Deafness-induced)
    {
        "q": "A {age}-year-old {gender} named {name} with long-standing, severe bilateral presbycusis and poor compliance with hearing aids presents with a complaint of hearing familiar melodies and hymns playing continuously in {possessive} head. The patient does not own a radio, has normal cognitive function, no history of psychiatric illness, and is fully aware that the music is an auditory illusion. What is the most likely diagnosis and underlying mechanism?",
        "options": [
            "Musical hallucinations (auditory release phenomenon); sensory deprivation of the auditory cortex due to severe hearing loss leads to spontaneous activation of central neural networks",
            "Schizophrenia; presenting with primary psychotic auditory verbal hallucinations and persecutory delusions",
            "Herpes simplex virus encephalitis; localized temporal lobe infection causing complex auditory hallucinations and focal seizures",
            "Salicylate overdose; acute toxicity causing musical hallucinations as a primary symptom with no change in hearing",
            "Frontotemporal dementia; selective degeneration of the auditory cortex causing loss of semantic insight and musical hallucinations"
        ],
        "answer": 0,
        "exp": "Similar to Charles Bonnet Syndrome in the visual system, **musical hallucinations (auditory release phenomenon)** occur in older adults with **severe, long-standing hearing loss**. Sensory deprivation leads to a loss of normal inhibitory input to the auditory association cortex, causing cortical hyperexcitability and spontaneous firing that is interpreted by the brain as complex auditory stimuli (often familiar melodies, songs, or hymns). The patient **retains insight** and knows no real music is playing. This is a benign condition related to hearing loss, not a psychiatric disorder or dementia. Treatment involves optimizing hearing aids and environmental sound enrichment. (Ref: Hazzard's Ch. 45; Oliver Sacks' *Musicophilia*; Current Geriatrics)"
    },
    # T24: Lighting Optimization & Home Safety
    {
        "q": "A {age}-year-old {gender} named {name} with presbyopia and mild cataracts has experienced two falls at home at night. As part of a home safety evaluation, which of the following lighting modifications is most appropriate to reduce {possessive} fall risk?",
        "options": [
            "Install high-intensity, glare-free indirect LED lighting with nightlights along pathways, and use contrasting colored tape on the edges of stairs; avoid high-glare bulbs",
            "Install extremely bright, direct spotlight bulbs facing the stairs to maximize visual illumination, regardless of glare",
            "Recommend using a single handheld flashlight as the sole light source when walking at night to conserve home energy",
            "Replace all white light bulbs with red light bulbs to enhance macular cone adaptation and pupillary response",
            "Keep the home in dim lighting at all times to allow the eyes to remain continuously dark-adapted"
        ],
        "answer": 0,
        "exp": "Visual changes in older adults require **lighting optimization** to prevent falls: (1) **Increase illumination** (older eyes need 3-4 times more light than younger eyes to see clearly), (2) **Minimize glare** (glare from exposed bulbs or polished floors scatters light in a cataractous lens, blinding the patient), (3) **Uniform illumination** (delayed dark/light adaptation makes moving from a bright room to a dark hallway hazardous), (4) **Nightlights along pathways** (bedroom to bathroom), and (5) **High-contrast markings** (edges of steps). Spotlights create harsh shadows and glare, which increase fall risk. (Ref: Hazzard's Ch. 12; AGS/BGS Fall Prevention Guidelines; Current Geriatrics)"
    },

    # ===== OLFACTORY & GUSTATORY DOMAIN (Templates 25-29) =====
    # T25: Olfactory Decline Pathophysiology
    {
        "q": "A {age}-year-old {gender} named {name} is noted to have a significant decline in {possessive} ability to identify common odors during a clinical examination. What is the primary underlying anatomical and physiological change responsible for age-related olfactory loss (presbyosmia)?",
        "options": [
            "Degeneration and reduction of olfactory receptor neurons in the nasal mucosa, thinning of the cribriform plate, and loss of glomeruli volume within the olfactory bulb",
            "Severe hypertrophy of the turbinates with permanent mechanical obstruction of the olfactory cleft",
            "Selective atrophy of the trigeminal nerve (CN V) general sensory pathways in the nasal cavity",
            "Deposition of calcium pyrophosphate crystals within the nasal septum and cribriform plate",
            "Hypersecretion of serous glands within the Bowman's capsules of the olfactory epithelium"
        ],
        "answer": 0,
        "exp": "Age-related olfactory decline (**presbyosmia**) affects up to 75% of individuals over age 80. The primary pathophysiology involves: (1) **Degeneration and decreased replacement of olfactory receptor neurons** in the olfactory neuroepithelium, (2) **Thinning of the cribriform plate**, and (3) **Loss of olfactory bulb volume and glomeruli** (due to decreased sensory input and age-related neurodegeneration). Olfactory decline is also a well-recognized early biomarker for neurodegenerative diseases like Parkinson's disease and Alzheimer's disease. (Ref: Hazzard's Ch. 46; Current Diagnosis & Treatment: Geriatrics Ch. 12)"
    },
    # T26: Olfactory Loss & Nutritional Depletion
    {
        "q": "A {age}-year-old {gender} named {name} presents with involuntary weight loss of {weight_loss} lbs over the past {weight_loss_months} months. {possessive_cap} medical workup for malignancy and depression is completely negative. {pronoun_cap} reports that 'food just doesn't taste good anymore' and {possessive} appetite is severely diminished. Further testing reveals profound hyposmia. Which of the following best explains this clinical presentation?",
        "options": [
            "Flavor perception is primarily driven by retronasal olfaction; age-related olfactory loss impairs the ability to enjoy food, leading to decreased appetite, poor caloric intake, and nutritional depletion",
            "Taste buds on the tongue are completely degenerated by age 70, preventing the perception of basic sweet and salty tastes",
            "Olfactory loss causes a reflexive hypersecretion of gastric acid, leading to early satiety and chronic dyspepsia",
            "The patient has a central chewing apraxia caused by sensory deafferentation of the trigeminal nerve",
            "Anosmia causes chronic malabsorption of micronutrients and fats in the duodenum"
        ],
        "answer": 0,
        "exp": "**Retronasal olfaction** (odor molecules passing from the oral cavity to the nasal cavity during chewing) is responsible for **up to 80-90% of flavor perception**. In contrast, taste buds only detect five basic tastes (sweet, salty, sour, bitter, umami). When an older adult experiences **olfactory decline**, they lose the ability to perceive flavor, making food bland and unappealing. This leads to **anorexia of aging, decreased caloric intake, involuntary weight loss, and nutritional deficiencies**. It is a major cause of functional decline in older adults. (Ref: Hazzard's Ch. 46; Current Diagnosis & Treatment: Geriatrics Ch. 12; AGS Geriatrics At Your Fingertips)"
    },
    # T27: Compensatory Sodium/Sugar Overuse
    {
        "q": "A {age}-year-old {gender} named {name} with a history of long-standing hypertension and type 2 diabetes presents with progressively worsening blood pressure control (BP {bp_sys}/{bp_dia} mmHg) and elevated HbA1c ({hba1c}%). A dietary review reveals that the patient has been heavily salting {possessive} meals and consuming highly sweetened foods. The patient explains that {pronoun} does this because {possessive} food has become 'tasteless.' What is the most likely underlying cause of this clinical change?",
        "options": [
            "The patient has age-related hyposmia; the loss of flavor perception leads to a compensatory overreliance on basic tastes (sodium and sugar) to make food palatable, worsening {possessive} hypertension and glycemic control",
            "The patient has developed a primary salt-secreting salivary gland tumor that alters the oral microbiome",
            "Diabetic nephropathy has altered the renal excretion of sodium, causing a systemic craving for salty foods",
            "Age-related hypergeusia has hyper-sensitized the tongue's sweet receptors, leading to sugar cravings",
            "The patient has developed an underlying obsessive-compulsive disorder targeting sodium and glucose intake"
        ],
        "answer": 0,
        "exp": "Older adults with **olfactory decline (hyposmia)** often complain that food is bland. Because basic taste thresholds (sweet, salty) are relatively preserved compared to olfaction, these patients frequently **compensate by adding excessive amounts of salt and sugar** to their food to achieve some palatability. In patients with pre-existing comorbidities like **hypertension, congestive heart failure, or diabetes**, this compensatory dietary change can lead to **worsening blood pressure control, fluid overload, and poor glycemic control**. Clinicians must screen for olfactory loss and recommend safe flavor enhancers (spices, herbs, lemon juice, vinegar) instead of salt and sugar. (Ref: Hazzard's Ch. 46; Current Geriatrics; AGS Geriatrics At Your Fingertips)"
    },
    # T28: Gas Leak & Fire Safety Hazards (Anosmia)
    {
        "q": "A {age}-year-old {gender} named {name} with severe hyposmia lives independently. During a home safety evaluation, which of the following is the most critical recommendation to address {possessive} olfactory deficit and prevent life-threatening domestic hazards?",
        "options": [
            "Install specialized natural gas and propane detectors in the kitchen, place visual strobe-light and audible smoke alarms in every room, and transition from a gas stove to an electric or induction cooktop",
            "Recommend checking for gas leaks manually by applying soapy water to all gas pipes weekly",
            "Advise the patient to leave windows open continuously to ensure proper ventilation, regardless of outdoor temperature",
            "No interventions are needed because utility companies add mercaptan to gas, which stimulates the trigeminal nerve independently of olfaction",
            "Move the patient to a skilled nursing facility immediately, as anosmic patients cannot safely live independently under any circumstances"
        ],
        "answer": 0,
        "exp": "Olfactory decline represents a severe **safety hazard** for older adults living independently. They are **unable to smell gas leaks** (mercaptan is added to natural gas, but detection thresholds decline significantly with age), **smoke/fire, or spoiled food**. Home safety interventions are vital: (1) **Natural gas/propane detectors** with loud audible alarms, (2) **Electric/induction stoves** (eliminating the risk of an unlit gas burner leaking gas), and (3) **Functional smoke alarms**. Relying on trigeminal stimulation is unsafe because detection thresholds are highly variable and often elevated in older adults. (Ref: Hazzard's Ch. 46; Current Diagnosis & Treatment: Geriatrics Ch. 12)"
    },
    # T29: Spoiled Food Ingestion Risk
    {
        "q": "A {age}-year-old {gender} named {name} with known anosmia is evaluated in the emergency department for severe gastroenteritis due to a foodborne bacterial infection. {possessive_cap} family notes that {pronoun} frequently eats expired foods from the refrigerator. Which of the following is the most appropriate preventive recommendation for this patient?",
        "options": [
            "Implement a system of clear date-labeling on all refrigerator items, have a family member or caregiver check the refrigerator weekly to discard expired food, and advise the patient to strictly follow expiration dates rather than relying on 'smell or taste'",
            "Prescribe daily prophylactic oral antibiotics to prevent future gastrointestinal infections",
            "Recommend boiling all food (including fresh produce and dairy) for at least 30 minutes before consumption",
            "Advise the patient that foodborne pathogens are killed by standard refrigeration, so expired food remains completely safe",
            "Perform an urgent upper endoscopy to evaluate for underlying age-related gastric hypoacidity and mucosal atrophy"
        ],
        "answer": 0,
        "exp": "Older adults with **anosmia (loss of smell)** are at high risk for **foodborne illnesses** because they cannot smell the sour or putrid odors of spoiled food (e.g., spoiled milk, rotten meat). This is compounded by age-related declines in gastric acid secretion (achlorhydria/hypochlorhydria) and immune senescence, making infections more severe. Prevention requires **active caregiver/family involvement** in date-labeling and regular refrigerator sweeps, and educating the patient to never eat food past its expiration date simply because 'it smells fine.' (Ref: Hazzard's Ch. 46; Current Geriatrics)"
    },

    # ===== MAJOR FUNCTIONAL & PSYCHOSOCIAL CONSEQUENCES (Templates 30-35) =====
    # T30: Hearing Loss & Social Isolation
    {
        "q": "A {age}-year-old {gender} named {name} with progressive presbycusis has stopped attending weekly community bridge games and family gatherings. {possessive_cap} daughter reports that {name} has become increasingly withdrawn, irritable, and expresses feelings of loneliness. The patient refuses to wear {possessive} hearing aids because they are 'uncomfortable.' What is the most accurate clinical interpretation of this presentation?",
        "options": [
            "Untreated hearing loss is a primary driver of social isolation, depression, and functional decline in older adults; the effort required to decode speech in groups leads to cognitive fatigue and social withdrawal",
            "The patient is exhibiting early signs of antisocial personality disorder, which commonly emerges after age 75",
            "The patient's withdrawal is a normal and healthy age-related change called 'geriatric disengagement' and should be supported",
            "The patient has developed a primary major depressive disorder that should be treated with high-dose SSRIs as the sole intervention",
            "The daughter is overreacting; older adults with hearing loss prefer isolation and do not experience depression"
        ],
        "answer": 0,
        "exp": "**Untreated hearing loss** is strongly associated with **social isolation, loneliness, and depression** in older adults. In group settings with background noise, older adults must expend significant cognitive effort to decode degraded auditory signals (auditory fatigue). Over time, the embarrassment of asking people to repeat themselves, combined with the exhaustion of straining to hear, leads to **social withdrawal**. This isolation is a major risk factor for functional decline and mortality. Optimizing hearing aid fit, using assistive devices, and addressing communication barriers are critical first-line interventions. (Ref: Hazzard's Ch. 45; Current Geriatrics Ch. 12; JAMA Otolaryngol 2019)"
    },
    # T31: Hearing Loss & Cognitive Decline
    {
        "q": "A {age}-year-old {gender} named {name} with mild cognitive impairment (MCI) and severe untreated presbycusis is evaluated for progressive memory loss. According to recent epidemiological evidence (such as the *Lancet* Commission on Dementia), which of the following is the most accurate statement regarding the relationship between hearing loss and dementia?",
        "options": [
            "Midlife and late-life hearing loss is identified as the single largest modifiable risk factor for dementia; untreated hearing loss is associated with accelerated cognitive decline and brain atrophy, and treating it with hearing aids may delay or reduce cognitive decline",
            "Hearing loss is a late symptom of dementia and has no causative or accelerating relationship with cognitive decline",
            "Hearing aids increase the rate of cognitive decline by over-stimulating the temporal lobes and causing neuronal exhaustion",
            "Dementia only occurs in individuals with conductive hearing loss; sensorineural loss is protective against Alzheimer's disease",
            "There is no association between sensory deficits and cognitive function; they are entirely independent processes"
        ],
        "answer": 0,
        "exp": "The **2020 Lancet Commission on Dementia Prevention, Intervention, and Care** identified **hearing loss as the single largest modifiable risk factor for dementia**, accounting for approximately 8% of all dementia cases. Pathophysiological hypotheses include: (1) **Cognitive load hypothesis** (auditory processing exhausts cognitive reserve, leaving fewer resources for memory and executive function), (2) **Sensory deprivation hypothesis** (lack of input leads to direct temporal lobe atrophy), and (3) **Social isolation hypothesis** (hearing loss causes isolation, which accelerates decline). Large trials (e.g., the ACHIEVE study) indicate that treating hearing loss with hearing aids significantly reduces cognitive decline in older adults at increased risk. (Ref: Lancet Commission 2020; ACHIEVE Trial, Lancet 2023; Hazzard's Ch. 45)"
    },
    # T32: Hearing Loss Screening in Primary Care
    {
        "q": "A {age}-year-old {gender} named {name} presents for an annual wellness visit. {pronoun_cap} has no specific hearing complaints, but {possessive} family reports that the television is always played at a very high volume. Which of the following is the most appropriate and evidence-based screening approach for hearing loss in this patient?",
        "options": [
            "Administer the Hearing Handicap Inventory for the Elderly-Screening version (HHIE-S) questionnaire, and perform a handheld audiometry screen or a structured whisper test",
            "Immediately order a brain MRI and a brainstem auditory evoked response (BAER) test for all patients over 70",
            "Rely solely on the patient's self-report, as older adults are highly accurate at detecting and reporting their own hearing loss",
            "Perform a tuning fork Rinne test on the forehead as the primary screening tool for sensorineural hearing loss",
            "Defer all screening until the patient sustains a fall or develops advanced dementia"
        ],
        "answer": 0,
        "exp": "**Screening for hearing loss** in primary care is vital because older adults frequently underreport hearing deficits (due to gradual onset, adaptation, or stigma). The USPSTF and AGS recommend screening older adults using: (1) **The Whisper Test** (highly sensitive and specific when standardized: stand 2 feet behind, whisper 3 numbers/letters after exhaling, failure to repeat >= 3/6 is positive), (2) **Handheld audiometry** (screening at 1000, 2000, and 4000 Hz at 25-40 dB), or (3) **The HHIE-S** (a 10-item questionnaire assessing the emotional and social impact of hearing loss). Tuning fork tests are diagnostic for conductive/sensorineural distinction but are not validated screening tools. (Ref: Hazzard's Ch. 45; AGS Geriatrics At Your Fingertips; USPSTF)"
    },
    # T33: Specialized Home Safety Equipment
    {
        "q": "A {age}-year-old {gender} named {name} with severe bilateral presbycusis lives independently. {pronoun_cap} cannot hear standard high-frequency smoke alarms (which operate at 3000-4000 Hz). Which of the following home safety modifications is most appropriate to ensure {possessive} safety in the event of a fire?",
        "options": [
            "Install specialized low-frequency smoke alarms (520 Hz) and connect them to tactile bed shakers and high-intensity visual strobe lights in the bedroom",
            "Install a secondary standard smoke alarm immediately next to the pillow to increase the decibel level",
            "Rely on a trained hearing dog as the sole fire safety measure",
            "Replace all smoke alarms with carbon monoxide detectors, as they operate at lower frequencies",
            "Recommend sleeping with hearing aids turned on at maximum volume, despite the risk of acoustic feedback"
        ],
        "answer": 0,
        "exp": "Standard smoke alarms emit a high-pitched beep (typically 3000-4000 Hz) to maximize loudness in younger ears. However, this is precisely the frequency range lost in **presbycusis**. Older adults, especially when sleeping without their hearing aids, often fail to wake up to standard smoke alarms. Specialized home safety modifications are critical: (1) **Low-frequency smoke alarms (520 Hz square-wave)** are far more effective at waking older adults and those with hearing loss, (2) **Visual strobe lights** (high-intensity flashing lights), and (3) **Tactile alarms** (bed or pillow shakers triggered by the alarm). (Ref: NFPA Guidelines; Hazzard's Ch. 12 & 45)"
    },
    # T34: Somatosensory & Proprioceptive Decline
    {
        "q": "A {age}-year-old {gender} named {name} presents with progressive balance difficulty, describing a feeling of 'walking on pillows' or 'walking in the dark.' Physical examination reveals:\n• Neurological: **Normal motor strength (5/5); absent vibration sense at the hallux bilaterally; decreased light touch in a stocking distribution up to the mid-calf**\n• Romberg test: **Stable with eyes open, but sways significantly and loses balance immediately upon closing the eyes**\nWhat is the most likely diagnosis, the anatomical pathway involved, and the primary functional consequence?",
        "options": [
            "Age-related somatosensory and proprioceptive decline; degeneration of the large myelinated fibers in the dorsal (posterior) columns of the spinal cord, leading to sensory ataxia and high fall risk",
            "Cerebellar atrophy; degeneration of the Purkinje cells in the spinocerebellar tract, leading to motor ataxia",
            "Advanced presbyopia; loss of visual accommodation causing visual-evoked motor apraxia",
            "Vestibular neuritis; acute viral infection of the vestibular nerve leading to unilateral canal paresis",
            "Normal pressure hydrocephalus; classic triad of gait apraxia, urinary incontinence, and cognitive decline"
        ],
        "answer": 0,
        "exp": "This patient presents with **sensory ataxia** characterized by a wide-based gait, impaired vibration and tactile sensation (stocking distribution), and a **positive Romberg test** (instability only when visual input is removed by closing the eyes). The pathophysiology involves **degeneration of large, myelinated sensory fibers** and age-related changes in the **dorsal (posterior) columns** (which carry proprioception and vibration). The functional consequence is a severe loss of balance and postural stability, particularly in the dark or on uneven surfaces, resulting in a high risk of falls. (Ref: Hazzard's Ch. 12 & 71; AGS Geriatrics At Your Fingertips; UWorld Step 2 CK)"
    },
    # T35: Sensory Deprivation and Delirium
    {
        "q": "A {age}-year-old {gender} named {name} with a history of mild cognitive impairment, presbyopia, and presbycusis is admitted to the hospital for a severe urinary tract infection. During admission, {possessive} hearing aids and reading glasses are left at home. On hospital day 2, the patient becomes acutely agitated, disoriented, and starts hallucinating. Which of the following is the most appropriate first-line intervention?",
        "options": [
            "Retrieve and ensure the patient wears {possessive} reading glasses and hearing aids immediately, implement frequent orientation protocols, and optimize lighting (bright during the day, dark at night)",
            "Administer a 2 mg intravenous dose of haloperidol immediately to suppress the visual and auditory hallucinations",
            "Place the patient in bilateral wrist restraints to prevent falls and accidental line pulling",
            "Move the patient to a quiet, windowless isolation room to minimize all sensory inputs and allow the brain to rest",
            "Prescribe a continuous intravenous infusion of midazolam to sedate the patient throughout the hospitalization"
        ],
        "answer": 0,
        "exp": "Sensory deprivation (due to not having glasses or hearing aids in an unfamiliar, low-stimulation hospital environment) is a **major, highly modifiable precipitant of delirium** in older adults, especially those with pre-existing cognitive impairment. The **Hospital Elder Life Program (HELP)** emphasizes the importance of **non-pharmacologic interventions** as first-line: (1) **Provide visual and hearing aids** (glasses, hearing aids, pocket talkers), (2) **Frequent orientation** and cognitive stimulation, (3) **Sleep hygiene** (quiet environments and darkness at night), and (4) **Early mobilization**. Pharmacologic agents (like haloperidol) do not treat the underlying delirium, carry a high risk of adverse effects (Beers Criteria), and should only be used as a last resort for severe distress or safety risks. Restraints are contraindicated. (Ref: HELP, NEJM 1999; Hazzard's Ch. 29; AGS Beers Criteria 2023)"
    }
]

# ============================================================
# Generation Loop: Generate exactly 10 variants for each of the 35 templates (350 MCQs total)
# ============================================================
mcqs = []
seen_questions = set()

# Seed age pool
ages_pool = [66, 68, 71, 73, 75, 77, 79, 81, 83, 85, 87, 89, 91, 93, 95, 97]
speech_scores_pool = [44, 48, 52, 55]
aminoglycosides_pool = ["gentamicin", "tobramycin", "amikacin"]
loop_diuretics_pool = ["furosemide", "bumetanide", "ethacrynic acid"]
aspirin_names_pool = ["aspirin", "salicylates", "Bayer aspirin"]
aspirin_doses_pool = ["3.5", "4.0", "5.0", "6.0"]
ckd_stages_pool = ["3b", "4"]
ear_sides_pool = ["right", "left"]
lens_types_pool = ["bifocal", "progressive", "multifocal"]
vis_acuities_pool = ["20/100", "20/150", "20/200"]
weight_losses_pool = [10, 12, 15, 18, 20]
weight_loss_months_pool = [3, 4, 5, 6]
bp_sys_pool = [156, 162, 168, 174]
bp_dia_pool = [92, 95, 98, 102]
hba1c_pool = [8.3, 8.7, 9.1, 9.5]

for t_idx, t in enumerate(templates):
    variants_generated = 0
    attempts = 0
    
    # We want exactly 10 unique variants per template
    while variants_generated < 10 and attempts < 1000:
        attempts += 1
        
        # Select gender and name
        gp = random.choice(genders_pool)
        name = random.choice(gp["names"])
        gender = gp["gender"]
        pronoun = gp["pronoun"]
        pronoun_cap = gp["pronoun_cap"]
        possessive = gp["possessive"]
        possessive_cap = gp["possessive_cap"]
        
        age = random.choice(ages_pool)
        speech_score = random.choice(speech_scores_pool)
        aminoglycoside = random.choice(aminoglycosides_pool)
        loop_diuretic = random.choice(loop_diuretics_pool)
        aspirin_name = random.choice(aspirin_names_pool)
        aspirin_dose = random.choice(aspirin_doses_pool)
        ckd_stage = random.choice(ckd_stages_pool)
        ear_side = random.choice(ear_sides_pool)
        lens_type = random.choice(lens_types_pool)
        vis_acuity = random.choice(vis_acuities_pool)
        weight_loss = random.choice(weight_losses_pool)
        weight_loss_months = random.choice(weight_loss_months_pool)
        bp_sys = random.choice(bp_sys_pool)
        bp_dia = random.choice(bp_dia_pool)
        hba1c = random.choice(hba1c_pool)
        weeks_duration = random.choice([2, 3, 4, 6])
        day_num = random.choice([4, 5, 6, 7])
        hours_duration = random.choice([2, 3, 4, 6])
        
        format_kwargs = {
            "age": age,
            "gender": gender,
            "name": name,
            "pronoun": pronoun,
            "pronoun_cap": pronoun_cap,
            "possessive": possessive,
            "possessive_cap": possessive_cap,
            "speech_score": speech_score,
            "aminoglycoside": aminoglycoside,
            "loop_diuretic": loop_diuretic,
            "aspirin_name": aspirin_name,
            "aspirin_dose": aspirin_dose,
            "ckd_stage": ckd_stage,
            "ear_side": ear_side,
            "lens_type": lens_type,
            "vis_acuity": vis_acuity,
            "weight_loss": weight_loss,
            "weight_loss_months": weight_loss_months,
            "bp_sys": bp_sys,
            "bp_dia": bp_dia,
            "hba1c": hba1c,
            "weeks_duration": weeks_duration,
            "day_num": day_num,
            "hours_duration": hours_duration
        }
        
        try:
            q_text = t["q"].format(**format_kwargs)
        except KeyError as e:
            print(f"KeyError in template {t_idx} (q): {e}")
            continue
            
        if q_text in seen_questions:
            continue
            
        # Format options
        opts = list(t["options"])
        opts_formatted = []
        for o in opts:
            try:
                o_fmt = o.format(**format_kwargs)
            except (KeyError, IndexError):
                o_fmt = o
            opts_formatted.append(o_fmt)
            
        answer_idx = t["answer"]
        correct_opt = opts_formatted[answer_idx]
        
        # Shuffle options
        random.shuffle(opts_formatted)
        new_ans_idx = opts_formatted.index(correct_opt)
        
        # Format explanation
        try:
            exp_formatted = t["exp"].format(**format_kwargs)
        except (KeyError, IndexError):
            exp_formatted = t["exp"]
            
        # Escape for SQL single quotes
        q_esc = q_text.replace("'", "''")
        opts_json = json.dumps(opts_formatted).replace("'", "''")
        exp_esc = exp_formatted.replace("'", "''")
        
        mcq_str = f"    (v_topic_id, '{q_esc}', '{opts_json}'::jsonb, {new_ans_idx}, '{exp_esc}')"
        
        seen_questions.add(q_text)
        mcqs.append(mcq_str)
        variants_generated += 1
        
    if variants_generated < 10:
        print(f"WARNING: Template {t_idx} only generated {variants_generated} variants after {attempts} attempts")

print(f"Total unique MCQs generated: {len(mcqs)}")

# ============================================================
# Partition and Write to 4 Files (100, 100, 100, 50)
# ============================================================
parts = [
    mcqs[0:100],
    mcqs[100:200],
    mcqs[200:300],
    mcqs[300:350]
]

for part_num, part_mcqs in enumerate(parts, 1):
    out_file = f"c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260521_geri_sensory_mcqs_p{part_num}.sql"
    with open(out_file, "w", encoding="utf-8") as f:
        f.write(f"-- US MD/MBBS (4th Year) clinical case blocks - Geriatrics: Sensory changes — presbycusis, presbyopia, functional consequences - Part {part_num} ({(part_num-1)*100+1}-{((part_num-1)*100)+len(part_mcqs)})\n")
        f.write("BEGIN;\n\n")
        f.write("DO $$\nDECLARE\n    v_topic_id UUID;\nBEGIN\n")
        f.write(f"    SELECT id INTO v_topic_id FROM topics WHERE slug = '{topic_slug}' LIMIT 1;\n")
        f.write(f"    IF v_topic_id IS NULL THEN\n        RAISE EXCEPTION 'Topic {topic_slug} not found.';\n    END IF;\n\n")
        
        if part_num == 1:
            f.write("    DELETE FROM mcqs WHERE topic_id = v_topic_id;\n\n")
            
        f.write("    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES\n")
        for i, m in enumerate(part_mcqs):
            if i < len(part_mcqs) - 1:
                f.write(m + ",\n")
            else:
                f.write(m + ";\n")
        f.write("END $$;\nCOMMIT;\n")
        
    print(f"Part {part_num}: {len(part_mcqs)} MCQs -> {out_file}")

print(f"\nDone! Total: {len(mcqs)} MCQs in {len(parts)} files.")
