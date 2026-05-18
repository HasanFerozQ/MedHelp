import json
import random

topic_slug = 'ent-nose'

templates = [
    # ── Acute Rhinosinusitis ──
    {
        "q": "A {age}-old {gender} presents with 11 days of facial pressure, nasal congestion, and yellow nasal discharge. The patient initially felt better on day 5, but symptoms returned with greater severity on day 8 (\"double sickening\"). Vitals show Temp 100.2°F. What is the most likely pathogen?",
        "options": ["Streptococcus pneumoniae", "Rhinovirus", "Staphylococcus aureus", "Aspergillus fumigatus", "Pseudomonas aeruginosa"],
        "answer": 0,
        "exp": "The clinical picture of symptoms lasting >10 days or 'double sickening' (worsening on day 5-8 after initial improvement) suggests Acute Bacterial Rhinosinusitis (ABRS). Streptococcus pneumoniae and Haemophilus influenzae are the most common bacterial pathogens. Viral rhinosinusitis typically resolves within 10 days."
    },
    {
        "q": "A {age}-old {gender} is diagnosed with Acute Bacterial Rhinosinusitis (ABRS). The patient has a history of mild rash after taking penicillin. What is the first-line empiric antibiotic therapy according to current IDSA guidelines?",
        "options": ["Amoxicillin-clavulanate", "Amoxicillin alone", "Azithromycin", "Ciprofloxacin", "Clindamycin"],
        "answer": 0,
        "exp": "Current IDSA guidelines recommend Amoxicillin-clavulanate (standard or high-dose) as first-line therapy for ABRS to cover beta-lactamase-producing H. influenzae and M. catarrhalis. For patients with a non-type I penicillin allergy (like a mild rash), third-generation cephalosporins or respiratory fluoroquinolones are alternatives, but Amoxicillin-clavulanate remains first-line for those without severe allergies."
    },
    {
        "q": "Which of the following represents a \"major\" symptom criteria for the diagnosis of acute rhinosinusitis under the AAO-HNS guidelines?",
        "options": ["Purulent nasal discharge", "Headache", "Ear pain/fullness", "Halitosis", "Cough"],
        "answer": 0,
        "exp": "Major criteria include: purulent anterior nasal discharge, purulent nasal blockage/obstruction, facial congestion/fullness, facial pain/pressure, and hyposmia/anosmia. Minor criteria include headache, fever, halitosis, fatigue, dental pain, cough, and ear pain/fullness."
    },

    # ── Chronic Rhinosinusitis (CRS) ──
    {
        "q": "A {age}-old {gender} presents with bilateral nasal obstruction, facial pressure, and post-nasal drip for 5 months. Nasal endoscopy shows mucosal edema and purulent drainage in the middle meatus without polyps. What is the minimum duration of symptoms required to establish a diagnosis of Chronic Rhinosinusitis (CRS)?",
        "options": ["12 weeks", "4 weeks", "8 weeks", "6 months", "1 year"],
        "answer": 0,
        "exp": "Chronic Rhinosinusitis (CRS) is defined by at least 12 weeks of continuous inflammatory symptoms (such as mucopurulent drainage, nasal obstruction, facial pain/pressure, or decreased smell) plus objective evidence of sinonasal inflammation on endoscopy or CT scan."
    },
    {
        "q": "A {age}-old {gender} is diagnosed with Chronic Rhinosinusitis with Nasal Polyps (CRSwNP) and has a history of severe adult-onset asthma. The patient experiences a severe bronchospastic reaction after taking ibuprofen. What is the underlying pathophysiology of this syndrome?",
        "options": ["Dysregulation of arachidonic acid metabolism with leukotriene overproduction", "IgE-mediated hypersensitivity to NSAIDs", "Type III immune-complex mediated hypersensitivity", "Autoimmune destruction of nasal cartilage", "T-cell mediated delayed hypersensitivity"],
        "answer": 0,
        "exp": "This patient has Samter's Triad (Aspirin-Exacerbated Respiratory Disease / AERD): nasal polyps, asthma, and aspirin/NSAID sensitivity. The pathophysiology is non-allergic and involves dysregulation of the arachidonic acid pathway, specifically COX-1 inhibition leading to shunting towards the lipoxygenase pathway and massive overproduction of pro-inflammatory cysteinyl leukotrienes."
    },
    {
        "q": "A {age}-old child is found to have bilateral nasal polyposis on anterior rhinoscopy. Which of the following diagnostic tests is most crucial to perform next in this patient?",
        "options": ["Sweat chloride test", "Skin prick allergy panel", "CT scan of the brain", "Serum IgA levels", "Biopsy of the polyp"],
        "answer": 0,
        "exp": "Bilateral nasal polyps are extremely rare in children. In pediatric patients, nasal polyposis is considered pathognomonic for Cystic Fibrosis (CF) until proven otherwise. A sweat chloride test must be performed immediately to rule out CF."
    },

    # ── Invasive Fungal Sinusitis ──
    {
        "q": "A {age}-old {gender} with poorly controlled type 1 diabetes presents with severe left-sided facial pain, headache, and orbital swelling. Nasal endoscopy reveals a dry, black eschar on the left middle turbinate. What is the hallmark microscopic finding on tissue biopsy?",
        "options": ["Broad, ribbon-like, non-septate hyphae branching at 90 degrees", "Narrow, septate hyphae branching at 45 degrees", "Budding yeast cells with pseudohyphae", "Spherules containing thousands of endospores", "Capsulated yeast cells showing narrow-based budding"],
        "answer": 0,
        "exp": "The clinical presentation describes Acute Invasive Fungal Sinusitis (Mucormycosis), a highly lethal infection seen in diabetic ketoacidosis (DKA) or immunocompromised patients. The causative Mucorales fungi invade blood vessels, causing thrombosis and tissue necrosis (black eschar). Biopsy characteristically shows broad, non-septate hyphae branching at right (90-degree) angles."
    },
    {
        "q": "A {age}-old {gender} with acute myeloid leukemia and severe neutropenia develops fever, facial pain, and progressive unilateral vision loss. Endoscopy reveals ischemic mucosal necrosis. Biopsy shows narrow, septate hyphae branching at 45-degree angles. What is the most appropriate first-line medical treatment?",
        "options": ["Intravenous Amphotericin B and urgent surgical debridement", "Oral Voriconazole alone", "Intravenous Caspofungin and broad-spectrum antibiotics", "High-dose oral Fluconazole", "Hyperbaric oxygen and topical corticosteroid sprays"],
        "answer": 0,
        "exp": "This is Acute Invasive Fungal Sinusitis due to Aspergillus (characterized by narrow septate hyphae branching at 45-degree angles). It is a surgical emergency requiring immediate, aggressive surgical debridement of all necrotic tissue combined with systemic antieukaryotic therapy (IV Amphotericin B or Voriconazole). Delay leads to intracranial spread and death."
    },

    # ── Allergic Fungal Rhinosinusitis (AFRS) ──
    {
        "q": "A {age}-old {gender} presents with progressive unilateral nasal obstruction and mild proptosis. CT scan shows heterogeneous opacification of the maxillary sinus with characteristic central \"hyperdense\" signals. During surgery, a thick, \"peanut butter-like\" mucin is evacuated. Pathology reveals Charcot-Leyden crystals and rare non-invasive fungal hyphae. What is the diagnosis?",
        "options": ["Allergic Fungal Rhinosinusitis (AFRS)", "Acute Invasive Fungal Sinusitis", "Chronic Granulomatous Fungal Sinusitis", "Maxillary Sinus Squamous Cell Carcinoma", "Antrochoanal Polyp"],
        "answer": 0,
        "exp": "AFRS is a non-invasive, IgE-mediated hypersensitivity reaction to colonizing fungi (usually Dematiaceous fungi like Bipolaris or Alternaria). Classic findings include hyperdense signals on CT (due to accumulated fungal heavy metals and calcium), thick 'peanut butter' allergic mucin containing Charcot-Leyden crystals (degraded eosinophils), and fungal elements without tissue invasion."
    },

    # ── Complications of Sinusitis ──
    {
        "q": "A {age}-old {gender} with a recent ethmoid sinusitis presents with left eye swelling, painful extraocular movements, proptosis, and decreased visual acuity. What is the most likely diagnosis?",
        "options": ["Orbital cellulitis (Chandler Stage II/III)", "Preseptal cellulitis (Chandler Stage I)", "Cavernous sinus thrombosis (Chandler Stage V)", "Subperiosteal abscess without orbital involvement", "Thyroid eye disease"],
        "answer": 0,
        "exp": "Orbital cellulitis (Chandler Stage II) involves infection spreading deep to the orbital septum (usually from the ethmoid sinus via the lamina papyracea). It is distinguished from preseptal cellulitis by the presence of proptosis, ophthalmoplegia (painful/restricted eye movements), and potentially decreased vision."
    },
    {
        "q": "A {age}-old {gender} presents with a tender, fluctuant, soft-tissue swelling over the forehead following a 2-week history of untreated frontal sinusitis. CT scan reveals frontal bone osteomyelitis with an associated subperiosteal abscess. What is this clinical entity called?",
        "options": ["Pott's Puffy Tumor", "Brown's tumor", "Silent Sinus Syndrome", "Wegener's granulomatosis", "Mucoceles of the frontal sinus"],
        "answer": 0,
        "exp": "Pott's Puffy Tumor is a rare but classic complication of frontal sinusitis characterized by osteomyelitis of the frontal bone and a forehead subperiosteal abscess. It spreads via thrombophlebitis of the diploic veins and carries a high risk of intracranial spread (e.g., epidural or subdural empyema)."
    },
    {
        "q": "A {age}-old {gender} with severe sphenoid sinusitis develops high fever, bilateral eye swelling, severe chemosis, progressive proptosis, and ophthalmoplegia with loss of the corneal reflex. What is the most likely diagnosis?",
        "options": ["Cavernous Sinus Thrombosis", "Bilateral orbital cellulitis", "Subperiosteal abscess", "Thyroid storm", "Pituitary apoplexy"],
        "answer": 0,
        "exp": "Cavernous Sinus Thrombosis (CST) is a life-threatening complication typically arising from sphenoid or ethmoid sinusitis (or facial infections in the danger triangle). It is characterized by high fever, rapid progression to bilateral orbital symptoms (proptosis, chemosis) due to venous engorgement, and cranial nerve palsies (CN III, IV, V1/V2, VI) due to compression within the cavernous sinus."
    },

    # ── Epistaxis ──
    {
        "q": "A {age}-old {gender} presents with active bleeding from the anterior right nasal septum. The clinician identifies Kiesselbach's plexus as the source. Which of the following arteries does NOT contribute to this vascular plexus?",
        "options": ["Posterior ethmoidal artery", "Anterior ethmoidal artery", "Sphenopalatine artery", "Greater palatine artery", "Superior labial artery"],
        "answer": 0,
        "exp": "Kiesselbach's plexus (Little's area) on the anterior nasal septum is the site of over 90% of nosebleeds. It is an anastomosis of 4-5 arteries: Anterior ethmoidal (ophthalmic a. branch), Sphenopalatine (maxillary a. branch), Greater palatine (maxillary a. branch), and Superior labial (facial a. branch). The posterior ethmoidal artery does NOT contribute to this plexus."
    },
    {
        "q": "A {age}-old {gender} presents with severe epistaxis that streams down the posterior pharynx. Pressure and anterior packing fail to stop the bleeding. The patient is admitted to the ICU with posterior packing. What is the primary arterial supply to the region of Woodruff's plexus?",
        "options": ["Sphenopalatine artery", "Anterior ethmoidal artery", "Superior labial artery", "Facial artery", "Internal carotid artery"],
        "answer": 0,
        "exp": "Posterior epistaxis arises from Woodruff's plexus, located posterior to the inferior turbinate. The primary blood supply is the sphenopalatine artery (a terminal branch of the maxillary artery / external carotid system). Posterior bleeds are severe, arterial, and can lead to hypoxia or bradycardia (nasopulmonary reflex) when packed, requiring close monitoring."
    },
    {
        "q": "A {age}-old {gender} presents with lifelong recurrent nosebleeds, and their parent has a similar history. Examination reveals multiple red, blanching telangiectasias on the nasal mucosa, lips, and tongue. What is the inheritance pattern of this disease?",
        "options": ["Autosomal dominant", "Autosomal recessive", "X-linked recessive", "X-linked dominant", "Mitochondrial"],
        "answer": 0,
        "exp": "This is Hereditary Hemorrhagic Telangiectasia (HHT / Osler-Weber-Rendu disease). It is an autosomal dominant vascular dysplasia characterized by recurrent epistaxis, cutaneous/mucosal telangiectasias, and visceral arteriovenous malformations (AVMs) in the lungs, liver, and brain."
    },

    # ── Allergic and Non-Allergic Rhinitis ──
    {
        "q": "A {age}-old {gender} complains of sneezing, itchy nose, and watery eyes every spring. Nasal endoscopy reveals pale, boggy, bluish-gray turbinates. What is the first-line, most effective long-term medical therapy for this condition?",
        "options": ["Intranasal corticosteroid spray", "Oral H1-receptor antihistamine", "Topical nasal decongestant (Oxymetazoline)", "Intranasal saline irrigation", "Oral leukotriene receptor antagonist"],
        "answer": 0,
        "exp": "The patient has Allergic Rhinitis (IgE-mediated Type I hypersensitivity). Intranasal corticosteroids (e.g., Fluticasone, Budesonide) are the most effective first-line monotherapy for moderate-to-severe symptoms, superior to oral antihistamines, especially for nasal congestion."
    },
    {
        "q": "A {age}-old {gender} experiences profuse watery rhinorrhea when moving from a warm room into cold air or when eating hot, spicy foods. Allergy testing is completely negative. What is the first-line topical treatment for this patient's primary symptom?",
        "options": ["Intranasal Ipratropium bromide", "Intranasal Fluticasone", "Topical Oxymetazoline", "Oral Pseudoephedrine", "Intranasal Azelastine"],
        "answer": 0,
        "exp": "This is Vasomotor Rhinitis (Non-allergic rhinitis), characterized by nasal hyper-responsiveness to physical triggers (temperature, dry air, food). The profuse watery rhinorrhea is parasympathetically driven. Intranasal Ipratropium bromide, a topical anticholinergic agent, is highly effective at blocking these secretomotor pathways."
    },
    {
        "q": "A {age}-old {gender} presents with severe, refractory nasal congestion. The patient has been using an over-the-counter oxymetazoline nasal spray 5-6 times daily for 3 weeks. Examination shows beefy, red, and edematous nasal mucosa. What is the pathophysiological cause of this condition?",
        "options": ["Downregulation and desensitization of alpha-adrenergic receptors", "Beta-adrenergic receptor hypersensitivity", "Bacterial colonization of the nasal mucosa", "Th2-mediated eosinophilic inflammation", "Parasympathetic secretomotor blockade"],
        "answer": 0,
        "exp": "This describes Rhinitis Medicamentosa, a rebound nasal congestion resulting from prolonged use (>3-5 days) of topical nasal decongestants (like oxymetazoline). Constant receptor stimulation causes downregulation and desensitization of local alpha-adrenergic receptors, leading to severe rebound vasodilation when the drug wears off."
    },

    # ── Nasal Foreign Bodies ──
    {
        "q": "A {age}-old child is brought to the clinic with unilateral, foul-smelling, purulent nasal discharge for 3 days. What is the most likely diagnosis?",
        "options": ["Nasal foreign body", "Acute maxillary sinusitis", "Allergic rhinitis", "Choanal atresia", "Nasal dermoid cyst"],
        "answer": 0,
        "exp": "In a pediatric patient, unilateral, foul-smelling, purulent or bloody nasal discharge is considered a nasal foreign body until proven otherwise. Immediate inspection and removal are indicated."
    },
    {
        "q": "A {age}-old child is brought to the emergency department after placing a button battery in the left nostril 1 hour ago. What is the most appropriate management?",
        "options": ["Urgent endoscopic removal under direct visualization and avoidance of irrigation", "Nasal irrigation with normal saline to flush the battery out", "Observation for 24 hours to see if it passes into the nasopharynx", "Prescribe oral antibiotics and topical steroids for discharge", "Apply silver nitrate cautery to the surrounding mucosa"],
        "answer": 0,
        "exp": "A button battery in the nose is a true medical emergency. It causes rapid tissue destruction via liquefactive necrosis, electrolysis, and chemical burns within 2 hours, leading to septal perforation. Immediate, urgent removal is required. Saline or water irrigation is strictly contraindicated as it accelerates the electrical reaction."
    },

    # ── Trauma and Structural ──
    {
        "q": "A {age}-old {gender} is evaluated in the clinic 2 hours after a nasal injury. The patient has complete nasal obstruction. Examination shows a symmetric, fluctuant, dark-purple bulge along both sides of the anterior nasal septum. What is the most urgent next step?",
        "options": ["Immediate incision and drainage followed by bilateral anterior nasal packing", "Cold compresses and referral to ENT in 1 week", "Oral antibiotics and close outpatient follow-up", "Urgent CT scan of the facial bones", "Closed reduction of the nasal bones under local anesthesia"],
        "answer": 0,
        "exp": "The patient has a Septal Hematoma. Because the septal cartilage relies entirely on the overlying perichondrium for blood supply, a hematoma cuts off this perfusion. Untreated, ischemic cartilage necrosis occurs within hours, leading to septal collapse, septal abscess, and a permanent 'saddle nose deformity'. Immediate I&D and packing are mandatory."
    },
    {
        "q": "A {age}-old {gender} presents with clear, watery fluid leaking from the left nostril after a motor vehicle collision. The fluid tests positive for Beta-2 transferrin. What is the source of this fluid?",
        "options": ["Cerebrospinal fluid (CSF)", "Allergic serous secretion", "Lacrimal gland duct overflow", "Maxillary sinus mucocele", "Sphenoid sinus cyst fluid"],
        "answer": 0,
        "exp": "A clear, watery nasal discharge following head trauma that increases when leaning forward is highly suggestive of a CSF leak (CSF rhinorrhea). The gold-standard laboratory test to confirm CSF is the detection of Beta-2 transferrin, a protein found uniquely in CSF, perilymph, and vitreous humor, but absent in normal nasal secretions."
    },

    # ── Tumors and Congenital ──
    {
        "q": "A {age}-old {gender} presents with a 1-year history of progressive unilateral nasal obstruction and recurrent epistaxis. Nasal endoscopy reveals a fleshy, cauliflower-like mass originating from the lateral nasal wall. Biopsy confirms an Inverted Papilloma. What is the primary clinical significance of this tumor?",
        "options": ["High rate of local recurrence and a 5-10% risk of squamous cell carcinoma transformation", "High risk of hematogenous metastasis to the lungs and bone", "Strong association with Epstein-Barr Virus and obligate radiotherapy", "Testosterone-dependent vascular tumor with massive office biopsy bleeding", "Congenital connection to the anterior cranial fossa via the foramen cecum"],
        "answer": 0,
        "exp": "Sinonasal Inverted Papilloma is a benign but locally aggressive epithelial tumor originating from the lateral nasal wall. It has two major clinical hallmarks: a high rate of local recurrence if not fully excised (requires complete surgical excision) and an associated 5-10% risk of synchronous or metachronous Squamous Cell Carcinoma (SCC) transformation."
    },
    {
        "q": "A 14-year-old male presents with recurrent, massive, spontaneous left-sided epistaxis and progressive nasal obstruction. Nasal endoscopy reveals a lobulated, reddish-purple mass in the posterior nasal cavity. Imaging shows anterior bowing of the posterior maxillary sinus wall (Holman-Miller sign). What is the most appropriate management strategy?",
        "options": ["Surgical resection after preoperative embolization; diagnostic office biopsy is contraindicated", "Immediate office biopsy to confirm histopathology followed by chemotherapy", "Radiotherapy as the primary, first-line curative treatment", "Observation with serial MRI scans until puberty", "Intranasal corticosteroid sprays and systemic antihistamines"],
        "answer": 0,
        "exp": "This is a classic presentation of a Juvenile Nasopharyngeal Angiofibroma (JNA), a benign but highly vascular, locally invasive tumor occurring almost exclusively in adolescent males. The Holman-Miller sign (anterior bowing of the posterior maxillary wall) is pathognomonic on CT/MRI. Office biopsy is strictly contraindicated due to the extreme risk of catastrophic, uncontrollable hemorrhage. Management is surgical resection preceded by angiographic embolization to reduce blood loss."
    },
    {
        "q": "A {age}-old {gender} of Southern Chinese descent presents with a painless neck lump and unilateral right-sided ear clogging. Examination shows a serous middle ear effusion on the right, and a firm Level II cervical lymph node. Biopsy confirms undifferentiated Nasopharyngeal Carcinoma. What is the primary etiologic agent?",
        "options": ["Epstein-Barr Virus (EBV)", "Human Papillomavirus (HPV)", "Tobacco and alcohol abuse", "Occupational exposure to hardwood dust", "Chronic sinusitis and allergic rhinitis"],
        "answer": 0,
        "exp": "Nasopharyngeal Carcinoma (NPC), particularly the WHO Type III undifferentiated variant, is strongly associated with Epstein-Barr Virus (EBV) infection. It is highly endemic in Southern China. Unilateral otitis media with effusion (OME) in an adult is a critical red flag and warrants direct fiberoptic examination of the nasopharynx to rule out NPC obstructing the Eustachian tube. Cervical lymphadenopathy (Level II) is the most common presenting symptom."
    }
]

ages = ["20-year", "35-year", "45-year", "55-year", "60-year", "65-year", "70-year", "75-year", "80-year", "18-year", "25-year", "40-year", "50-year", "12-year", "8-year", "5-year", "3-year"]
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
        
        mcq_str = f"    ((SELECT id FROM topics WHERE slug = '{topic_slug}' LIMIT 1), '{q_text_escaped}', '{opts_json_escaped}'::jsonb, {new_ans_idx}, '{exp_escaped}')"
        
        if mcq_str not in mcqs:
            mcqs.append(mcq_str)
            counter += 1

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260518_ent_nose_mcqs_300.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - ENT (Nose)\n")
    f.write("BEGIN;\n\n")
    
    f.write("    -- Delete already populated MCQs first\n")
    f.write(f"    DELETE FROM mcqs WHERE topic_id = (SELECT id FROM topics WHERE slug = '{topic_slug}' LIMIT 1);\n\n")
    
    f.write("    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES\n")
    
    for i, m in enumerate(mcqs):
        if i < len(mcqs) - 1:
            f.write(m + ",\n")
        else:
            f.write(m + ";\n")
            
    f.write("\nCOMMIT;\n")

print(f"Generated {len(mcqs)} MCQs to {out_file}")
