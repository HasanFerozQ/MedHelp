import json
import random

topic_slug = 'ent-throat'

templates = [
    # ── Acute Pharyngitis ──
    {
        "q": "A {age}-old {gender} presents with a 2-day history of severe sore throat, high fever, and painful swallowing. The patient does not have a cough or runny nose. Physical exam reveals beefy red tonsils with white exudates and tender anterior cervical lymphadenopathy. What is the most appropriate next step in management?",
        "options": ["Perform a Rapid Antigen Detection Test (RADT)", "Empirically initiate oral Penicillin V", "Prescribe oral Azithromycin", "Obtain a throat culture and start Amoxicillin immediately", "Reassure the patient and recommend supportive care only"],
        "answer": 0,
        "exp": "This patient has a Centor score of 4 (fever, tonsillar exudates, tender anterior cervical adenopathy, absence of cough), which indicates a high probability of Group A Beta-Hemolytic Streptococcus (GABHS) pharyngitis. Current guidelines recommend confirming the diagnosis with a Rapid Antigen Detection Test (RADT) or throat culture before initiating antibiotic therapy to avoid unnecessary use."
    },
    {
        "q": "A {age}-old {gender} is diagnosed with Streptococcus pyogenes pharyngitis. What is the primary medical reason for treating this patient with a full course of antibiotics?",
        "options": ["To prevent the development of Acute Rheumatic Fever (ARF)", "To prevent Post-Streptococcal Glomerulonephritis (PSGN)", "To decrease the risk of secondary bacterial sinusitis", "To shorten the duration of symptomatic sore throat", "To prevent transmission of viral co-infections"],
        "answer": 0,
        "exp": "The primary clinical driver for antibiotic therapy (such as Penicillin or Amoxicillin) in GABHS pharyngitis is the prevention of Acute Rheumatic Fever (ARF). While antibiotics reduce the severity and duration of symptoms, they do NOT reliably prevent the development of post-streptococcal glomerulonephritis (PSGN)."
    },
    {
        "q": "A {age}-old {gender} presents with a sore throat, fever, and tonsillar exudates. The clinician calculates a Centor score. Which of the following is NOT a component of the Centor criteria?",
        "options": ["Presence of rhinorrhea and cough", "Tonsillar exudates or swelling", "Tender anterior cervical lymphadenopathy", "History of fever >38°C (100.4°F)", "Age between 3 and 14 years"],
        "answer": 0,
        "exp": "The Centor criteria (and its McIsaac modification) include: history of fever (1 point), tonsillar exudates or swelling (1 point), tender anterior cervical adenopathy (1 point), and absence of cough (1 point). A cough or runny nose (rhinorrhea) actually subtracts from the likelihood of a bacterial infection, as it points to a viral etiology."
    },

    # ── Infectious Mononucleosis ──
    {
        "q": "A {age}-old {gender} presents with 2 weeks of progressive fatigue, severe sore throat, and swollen glands. The patient was given Amoxicillin at an urgent care clinic 3 days ago and has since developed a generalized, pruritic, maculopapular rash. Physical exam shows posterior cervical lymphadenopathy and splenomegaly. What is the most likely diagnosis?",
        "options": ["Infectious Mononucleosis (EBV)", "Type I immediate hypersensitivity to Penicillins", "Acute retroviral syndrome (HIV)", "Toxic Epidermal Necrolysis (TEN)", "Scarlet Fever"],
        "answer": 0,
        "exp": "This is a classic presentation of Infectious Mononucleosis caused by the Epstein-Barr Virus (EBV). When patients with EBV mono are mistakenly treated with aminopenicillins (such as Amoxicillin or Ampicillin), a characteristic non-allergic maculopapular rash develops in up to 90% of cases. Posterior cervical lymphadenopathy and splenomegaly are highly indicative of EBV."
    },
    {
        "q": "A {age}-old {gender} is confirmed to have Infectious Mononucleosis. What is the most critical activity restriction that must be advised to this patient?",
        "options": ["Avoidance of contact sports for at least 3-4 weeks", "Strict bed rest for 2 months", "Isolation from household contacts for 10 days", "Avoidance of dairy products and fatty foods", "Complete avoidance of physical exercise for 6 months"],
        "answer": 0,
        "exp": "Splenic rupture is a rare but life-threatening complication of Infectious Mononucleosis due to transient splenomegaly. Patients must be strictly advised to avoid contact sports and heavy lifting for a minimum of 3 to 4 weeks from symptom onset, or until clinical resolution and confirmation that splenomegaly has resolved."
    },

    # ── Peritonsillar Abscess ──
    {
        "q": "A {age}-old {gender} presents with a severe, progressive unilateral sore throat, high fever, and difficulty opening their mouth (trismus). The voice sounds muffled ('hot potato' voice) and there is pooling of saliva. On exam, the right tonsil is bulging medially, pushing the uvula to the left. What is the most appropriate definitive management?",
        "options": ["Needle aspiration or incision and drainage (I&D) plus intravenous antibiotics", "High-dose oral Amoxicillin and close outpatient observation", "Immediate urgent bilateral tonsillectomy", "Intranasal corticosteroid sprays and oral antihistamines", "Direct laryngoscopy in the operating room under general anesthesia"],
        "answer": 0,
        "exp": "The clinical presentation (unilateral tonsillar bulge, uvular deviation to the opposite side, trismus, and muffled 'hot potato' voice) is diagnostic of a Peritonsillar Abscess (PTA / Quinsy). The standard definitive management is drainage (either via needle aspiration or incision and drainage) combined with systemic antibiotics to cover mixed aerobes and anaerobes."
    },
    {
        "q": "A {age}-old {gender} presents with trismus and a peritonsillar abscess. Irritation of which anatomical structure is responsible for the patient's trismus?",
        "options": ["Internal pterygoid muscle", "Glossopharyngeal nerve", "Masseter muscle", "Temporomandibular joint capsule", "Styloglossus muscle"],
        "answer": 0,
        "exp": "Trismus (difficulty opening the mouth) in a peritonsillar abscess is caused by inflammatory irritation and spasm of the adjacent internal (medial) pterygoid muscle, which lies close to the superior tonsillar pillar."
    },

    # ── Retropharyngeal Abscess ──
    {
        "q": "A {age}-old child is brought to the emergency department with high fever, neck stiffness, and refusal to swallow. The child is holding their head in a slightly extended position. Lateral neck X-ray reveals significant widening of the prevertebral soft tissue space. What is the most likely diagnosis?",
        "options": ["Retropharyngeal Abscess", "Acute Epiglottitis", "Cervical Spine Osteomyelitis", "Peritonsillar Abscess", "Laryngotracheobronchitis (Croup)"],
        "answer": 0,
        "exp": "Retropharyngeal abscess typically occurs in young children (under age 6) due to suppuration of lymph nodes in the retropharyngeal space (Nodes of Rouviere) that subsequently atrophy. Key findings include high fever, neck stiffness (often mistaken for meningitis), head extension, and prevertebral space widening on lateral X-ray."
    },
    {
        "q": "A child is diagnosed with a retropharyngeal abscess. If untreated, this infection can spread directly downward into which anatomical compartment, causing life-threatening complications?",
        "options": ["Posterior mediastinum via the 'danger space'", "Anterior mediastinum via the pretracheal space", "Submandibular space", "Epidural space of the cervical spine", "Pleural cavity"],
        "answer": 0,
        "exp": "The retropharyngeal space communicates directly with the posterior mediastinum via the 'danger space' (located between the alar fascia and prevertebral fascia). Uncontrolled retropharyngeal infections can track rapidly into the chest, causing highly lethal acute mediastinitis."
    },

    # ── Ludwig's Angina ──
    {
        "q": "A {age}-old {gender} with a history of poor dental hygiene presents with rapid onset of bilateral submandibular swelling, severe mouth pain, and a 'woody' induration of the neck. On examination, the floor of the mouth is highly elevated and erythematous, pushing the tongue upward and backward. The patient is drooling and tachypneic. What is the most crucial first step in management?",
        "options": ["Securing the airway (via awake fiberoptic intubation or tracheostomy)", "Immediate intravenous administration of high-dose Clindamycin", "Incision and drainage of the submandibular space under local anesthesia", "Obtaining an urgent contrast-enhanced CT scan of the neck", "Extracting the infected mandibular molars"],
        "answer": 0,
        "exp": "This patient has Ludwig's Angina, a rapidly progressive, life-threatening bilateral cellulitis of the sublingual, submandibular, and submental spaces. The primary cause of death is asphyxiation due to posterior displacement of the tongue obstructing the airway. The absolute first priority is securing the airway, preferably via awake fiberoptic intubation or surgical airway. CT scans or drainage must never delay airway protection."
    },
    {
        "q": "A {age}-old {gender} is diagnosed with Ludwig's Angina. What is the most common anatomical source of this infection?",
        "options": ["Infection of the mandibular second or third molars", "Suppurative palatine tonsillitis", "Acute sialadenitis of the parotid gland", "Erosion of a branchial cleft cyst", "Deep laceration of the posterior pharyngeal wall"],
        "answer": 0,
        "exp": "Ludwig's Angina is most frequently odontogenic in origin (~70-90% of cases), specifically arising from infections of the second and third mandibular molars. The roots of these teeth extend below the mylohyoid line, allowing infection to spread directly into the submandibular space."
    },

    # ── Eagle's Syndrome ──
    {
        "q": "A {age}-old {gender} complains of chronic unilateral throat pain, a sensation of a foreign body in the throat (globus), and referred ear pain that is characteristically exacerbated by head rotation. The patient had a tonsillectomy 5 years ago. Palpation of the tonsillar fossa reproduces the exact pain. What is the diagnostic finding on CT imaging?",
        "options": ["Elongated styloid process (>30 mm) and calcification of the stylohyoid ligament", "Erosion of the glossopharyngeal nerve by a posterior skull base tumor", "Diverticular pouch originating from the pyriform sinus", "Avascular necrosis of the hyoid bone", "Thrombosis of the internal jugular vein"],
        "answer": 0,
        "exp": "This is Eagle's Syndrome, which is caused by an elongated styloid process (>30 mm) or calcification of the stylohyoid ligament. Post-tonsillectomy tissue scarring can tether local nerves (particularly the glossopharyngeal nerve) against the rigid styloid process, causing unilateral throat pain, globus sensation, and referred otalgia worsened by swallowing or turning the head."
    },

    # ── Lemierre's Syndrome ──
    {
        "q": "A {age}-old {gender} presents with severe neck pain, high fevers, and pleuritic chest pain one week after recovering from a mild sore throat. Physical exam shows tenderness and induration along the anterior border of the sternocleidomastoid muscle. CT of the neck reveals internal jugular vein (IJV) thrombophlebitis, and chest X-ray shows multiple cavitary nodules. What is the classic causative pathogen?",
        "options": ["Fusobacterium necrophorum", "Streptococcus pyogenes", "Staphylococcus aureus", "Pseudomonas aeruginosa", "Eikenella corrodens"],
        "answer": 0,
        "exp": "This is Lemierre's Syndrome (post-anginal septicemia), characterized by septic thrombophlebitis of the internal jugular vein following a recent oropharyngeal infection, with subsequent metastatic septic emboli (typically to the lungs). The classic, highly associated causative pathogen is Fusobacterium necrophorum, an anaerobic gram-negative rod."
    },

    # ── Zenker's Diverticulum ──
    {
        "q": "A {age}-old {gender} presents with a 2-year history of progressive dysphagia, severe halitosis, and recurrent regurgitation of undigested food eaten hours prior. Occasionally, the patient experiences nocturnal coughing and choking episodes. What is the underlying pathophysiology of this condition?",
        "options": ["Herniation of mucosa through Killian's triangle due to cricopharyngeal incoordination", "Failure of the lower esophageal sphincter to relax (achalasia)", "Autoimmune destruction of the esophageal mucosal lining", "Traction diverticulum from mediastinal lymph node tuberculosis", "Congenital duplication cyst of the upper esophagus"],
        "answer": 0,
        "exp": "This patient has a Zenker's Diverticulum, a posterior pharyngeal pulsion diverticulum (a 'false' diverticulum containing only mucosa and submucosa). It occurs at Killian's Triangle, a site of natural weakness between the oblique fibers of the thyropharyngeus muscle and the transverse fibers of the cricopharyngeus muscle. It is caused by chronic elevated intraluminal pressure, usually due to cricopharyngeal spasm or incoordination."
    },
    {
        "q": "A {age}-old {gender} is suspected of having a Zenker's Diverticulum based on clinical symptoms. Which of the following represents the diagnostic test of choice, and what procedure is strictly avoided/cautioned?",
        "options": ["Barium swallow is diagnostic; upper endoscopy is cautioned due to perforation risk", "Upper endoscopy is diagnostic; CT scan is cautioned due to radiation risk", "Esophageal manometry is diagnostic; barium swallow is cautioned", "CT scan with oral contrast is diagnostic; barium swallow is cautioned", "MRI of the neck is diagnostic; ultrasound is cautioned"],
        "answer": 0,
        "exp": "A barium swallow (videofluoroscopy) is the gold standard diagnostic test for Zenker's Diverticulum as it safely demonstrates the pouch. Upper endoscopy (esophagogastroduodenoscopy) must be performed with extreme caution, as the endoscope can easily slip into the blind pouch and cause direct instrumental perforation of the thin wall."
    },

    # ── Acute Epiglottitis ──
    {
        "q": "A {age}-old {gender} presents with rapid onset of high fever, severe sore throat, drooling, and difficulty breathing. The patient is sitting in a 'tripod' position (leaning forward, hands on knees, neck hyperextended) and has inspiratory stridor. No cough is heard. Lateral neck X-ray shows a swollen epiglottis ('thumbprint sign'). What is the most immediate priority?",
        "options": ["Securing the airway in a controlled environment (operating room) with ENT and anesthesia present", "Taking a throat swab for culture and sensitivity in the emergency room", "Intravenous administration of Ceftriaxone and Dexamethasone", "Obtaining an urgent contrast CT scan of the neck to rule out abscess", "Applying a tight-fitting oxygen mask and placing the patient supine"],
        "answer": 0,
        "exp": "This is a classic presentation of Acute Epiglottitis, a medical emergency. The primary concern is sudden, complete airway obstruction. The absolute priority is securing the airway under controlled conditions (preferably in the operating room with a surgical airway cart standby). Any distressing procedures (such as throat examination, IV placement, or placing the patient supine) must be strictly avoided until the airway is secure."
    },

    # ── Laryngomalacia ──
    {
        "q": "A 2-month-old infant is brought to the clinic due to a high-pitched inspiratory stridor that is louder when the baby is supine or crying, and improves when prone. The baby is feeding well and gaining weight appropriately. Flexible laryngoscopy shows an 'omega-shaped' epiglottis that collapses into the laryngeal inlet during inspiration. What is the most appropriate management?",
        "options": ["Reassurance and observation, as most cases resolve spontaneously by 18-24 months", "Immediate surgical supraglottoplasty to prevent airway damage", "Initiation of high-dose systemic corticosteroids", "Tracheostomy placement and long-term mechanical ventilation", "Urgent referral for adenoidectomy and tonsillectomy"],
        "answer": 0,
        "exp": "Laryngomalacia is the most common cause of congenital stridor, characterized by flaccidity of the supraglottic structures. The classic findings are an 'omega-shaped' epiglottis and inspiratory collapse. In mild-to-moderate cases where the infant is thriving, feeding normally, and not hypoxic, the treatment is supportive reassurance and observation, as it typically resolves spontaneously by 18-24 months of age as laryngeal cartilage matures."
    },

    # ── Vocal Cord Pathology ──
    {
        "q": "A {age}-old singer presents with a 6-month history of progressive hoarseness. Flexible laryngoscopy reveals bilateral, symmetric, small, well-demarcated fibrous nodules at the junction of the anterior one-third and posterior two-thirds of the true vocal cords. What is the first-line treatment?",
        "options": ["Speech therapy (voice hygiene and behavioral therapy)", "Micro-laryngeal surgery (laser excision)", "Systemic corticosteroid therapy", "Bilateral vocal cord steroid injections", "Long-term proton pump inhibitor therapy"],
        "answer": 0,
        "exp": "This patient has Vocal Cord Nodules ('singer's nodes'), which are bilateral, symmetric lesions caused by chronic vocal abuse or phonotrauma. They characteristically form at the junction of the anterior 1/3 and posterior 2/3 of the vocal cords (the point of maximum vibratory impact). First-line therapy is conservative speech/voice therapy to correct vocal mechanics. Surgery is reserved only for refractory cases in adults."
    },
    {
        "q": "A {age}-old {gender} complains of sudden-onset hoarseness after screaming loudly at a sporting event last weekend. Laryngoscopy reveals a unilateral, pedunculated, fluid-filled translucent lesion on the left true vocal cord. What is the diagnosis?",
        "options": ["Vocal cord polyp", "Vocal cord nodules", "Reinke's edema", "Contact granuloma", "Laryngeal papillomatosis"],
        "answer": 0,
        "exp": "A vocal cord polyp is typically a unilateral, pedunculated or sessile lesion that often arises after a single episode of acute vocal trauma (causing local capillary hemorrhage in the superficial lamina propria). This contrasts with vocal cord nodules, which are always bilateral and result from chronic vocal abuse."
    },
    {
        "q": "A {age}-old {gender} with a 45-pack-year smoking history presents with a progressive, painless lowering of their voice pitch ('smoker's voice'). Laryngoscopy reveals bilateral, diffuse, gelatinous, 'jelly-like' swelling of the superficial lamina propria of both true vocal cords. What is the diagnosis?",
        "options": ["Reinke's Edema", "Vocal cord nodules", "Glottic Squamous Cell Carcinoma", "Laryngeal papillomatosis", "Contact granuloma"],
        "answer": 0,
        "exp": "Reinke's Edema is a bilateral, diffuse, gelatinous swelling of the superficial lamina propria (Reinke's space) of the vocal cords. It is strongly associated with chronic smoking and vocal abuse, presenting classically as a very low-pitched, gravelly voice, particularly in older women."
    },
    {
        "q": "A {age}-old child presents with progressive hoarseness and inspiratory stridor. Laryngoscopy reveals multiple 'raspberry-like', exophytic, warty growths on the true vocal cords and epiglottis. Biopsy shows benign squamous papillomas. What are the most common causative viral strains?",
        "options": ["Human Papillomavirus (HPV) types 6 and 11", "Human Papillomavirus (HPV) types 16 and 18", "Epstein-Barr Virus (EBV)", "Cytomegalovirus (CMV)", "Adenovirus type 7"],
        "answer": 0,
        "exp": "This is Recurrent Respiratory Papillomatosis (RRP), a benign but aggressive condition caused by Human Papillomavirus (HPV) types 6 and 11. It is acquired via vertical transmission during childbirth from maternal vaginal condylomas. It is characterized by frequent recurrences requiring multiple surgical debulking procedures to maintain airway patency."
    },
    {
        "q": "A {age}-old {gender} complains of throat discomfort and a 'catching' sensation when speaking. The patient has a history of being intubated in the ICU for 6 days following a major trauma 2 months ago. Laryngoscopy shows a reddish-gray mass on the medial surface of the vocal process of the left arytenoid cartilage. What is the diagnosis?",
        "options": ["Contact granuloma", "Vocal cord polyp", "Glottic carcinoma", "Intubation web", "Vocal cord nodule"],
        "answer": 0,
        "exp": "This is a Contact Granuloma (intubation granuloma), which typically forms on the posterior third of the vocal cords (the vocal process of the arytenoid cartilage). This is where the endotracheal tube rests during intubation, leading to mucosal erosion and subsequent granuloma formation. They can also be caused by gastroesophageal reflux and severe throat clearing."
    },

    # ── Laryngeal Malignancy ──
    {
        "q": "A {age}-old {gender} with a heavy smoking history presents with persistent hoarseness for 3 months. There is no dysphagia or weight loss. Laryngoscopy reveals a small, white, leukoplakic lesion on the middle third of the right true vocal cord. Vocal cord mobility is completely normal. Biopsy confirms squamous cell carcinoma. What is the lymphatic staging implication?",
        "options": ["Very low risk of early nodal metastasis due to the scant lymphatic drainage of the true vocal cords", "High risk of bilateral cervical nodal metastasis due to rich glottic lymphatics", "Immediate systemic chemotherapy is indicated for distant micro-metastases", "Mandatory bilateral neck dissection is required", "Occult nodal rate is greater than 30%"],
        "answer": 0,
        "exp": "This is an early (T1) Glottic Cancer. The true vocal cords (glottis) have virtually absent (scant) lymphatic drainage. Therefore, T1 glottic squamous cell carcinoma carries an extremely low risk of cervical lymph node metastasis (<1%). Consequently, neck dissection is not indicated for early glottic cancer, and local therapy (radiation or laser cordectomy) yields cure rates >90-95%."
    },
    {
        "q": "A {age}-old {gender} presents with a persistent 'lump in the throat', painful swallowing (dysphagia), referred ear pain (otalgia), and weight loss. Laryngoscopy reveals a large, ulcerated mass on the epiglottis. Biopsy shows squamous cell carcinoma. What is the primary pathway for the referred ear pain?",
        "options": ["Referred pain via the Vagus nerve (Arnold's branch) and Glossopharyngeal nerve (Jacobson's branch)", "Direct tumor invasion into the Eustachian tube", "Tumor obstruction of the external auditory canal", "Secondary middle ear effusion due to lymphatic backup", "Referred pain via the Trigeminal nerve (auriculotemporal branch)"],
        "answer": 0,
        "exp": "Referred otalgia in supraglottic or hypopharyngeal cancer is a classic red flag. The Vagus nerve (CN X) provides sensory innervation to the larynx (internal laryngeal nerve) and also has an auricular branch (Arnold's nerve) supplying the ear canal. The Glossopharyngeal nerve (CN IX) also participates via its tympanic branch (Jacobson's nerve) from the pharynx. Irritation of CN IX or X by the tumor is referred to the ear."
    },

    # ── Vocal Cord Paralysis ──
    {
        "q": "A {age}-old {gender} presents with a weak, 'breathy' voice and frequent coughing when drinking liquids following a recent total thyroidectomy. Laryngoscopy reveals that the left vocal cord is fixed in an abducted (lateral) position. What nerve was injured, and what is the goal of medialization thyroplasty?",
        "options": ["Left Recurrent Laryngeal Nerve; to push the paralyzed cord to the midline so the mobile right cord can approximate it", "Left Superior Laryngeal Nerve; to restore tensing capability of the cricothyroid muscle", "Left Vagus Nerve; to bypass the motor pathway using an electrical implant", "Bilateral Recurrent Laryngeal Nerves; to widen the glottic aperture for breathing", "Ansa Cervicalis; to reinnervate the lateral cricoarytenoid muscle"],
        "answer": 0,
        "exp": "The Recurrent Laryngeal Nerve (RLN) provides motor supply to all intrinsic muscles of the larynx except the cricothyroid. Injury (commonly during thyroidectomy) leads to vocal cord paralysis. Unilateral paralysis causes a breathy voice and aspiration of liquids due to incomplete glottic closure. Medialization thyroplasty (Type I) surgically shifts the paralyzed cord medially so the functioning opposite cord can achieve closure."
    },
    {
        "q": "A patient develops immediate severe inspiratory stridor and respiratory distress in the recovery room after a total thyroidectomy. Surprisingly, the patient's voice is near-normal. Laryngoscopy shows both vocal cords are fixed in the midline position. What is the explanation and immediate management?",
        "options": ["Bilateral Recurrent Laryngeal Nerve injury; emergency airway management (re-intubation or tracheostomy)", "Unilateral Recurrent Laryngeal Nerve injury; urgent speech therapy", "Bilateral Superior Laryngeal Nerve injury; administration of high-dose IV calcium", "Post-operative hypocalcemia causing laryngeal spasm; oral calcium supplementation", "Tracheal compression from hematoma; immediate opening of the neck incision"],
        "answer": 0,
        "exp": "Bilateral Recurrent Laryngeal Nerve (RLN) injury is a catastrophic surgical complication. Because the vocal cords lose all abductor function (Posterior Cricoarytenoid muscle is the sole abductor), they drift into the midline (paramedian) position. While this allows near-normal voice production (since they are close together), it severely compromises the airway, causing immediate post-operative stridor. Emergency airway protection is mandatory."
    },
    {
        "q": "During laryngoscopy, the clinician wishes to assess the sole abductor muscle of the vocal cords. Which muscle is the only abductor of the true vocal cords?",
        "options": ["Posterior cricoarytenoid muscle", "Lateral cricoarytenoid muscle", "Thyroarytenoid muscle", "Cricothyroid muscle", "Arytenoideus muscle"],
        "answer": 0,
        "exp": "The Posterior Cricoarytenoid (PCA) muscle is the ONLY abductor of the vocal cords (it rotates the arytenoids laterally to open the glottis). All other intrinsic laryngeal muscles act as adductors (closing the cords) or tensors."
    },

    # ── Laryngopharyngeal Reflux ──
    {
        "q": "A {age}-old {gender} complains of a persistent globus sensation ('lump in the throat'), chronic throat clearing, and morning hoarseness. The patient denies having any heartburn or indigestion. Laryngoscopy reveals marked erythema of the arytenoids and thickening of the posterior commissure ('pachyderma'). What is the most appropriate management?",
        "options": ["Proton pump inhibitor (PPI) therapy twice daily and dietary modifications", "Standard once-daily H2-blocker therapy", "Empiric course of oral antibiotics for chronic laryngitis", "Surgical Nissen fundoplication immediately", "Direct laryngoscopy with biopsy of the posterior commissure"],
        "answer": 0,
        "exp": "This is Laryngopharyngeal Reflux (LPR), also known as 'silent reflux' because patients frequently lack classic gastroesophageal reflux symptoms (heartburn). Laryngoscopy typically shows posterior glottic inflammation (arytenoid erythema, pachyderma). First-line therapy requires twice-daily proton pump inhibitors (PPIs) for a prolonged course (3-6 months) along with anti-reflux dietary modifications."
    },

    # ── Salivary Gland Pathology ──
    {
        "q": "A {age}-old {gender} complains of a painful swelling under the left jaw that occurs predictably at mealtimes and gradually subsides over the next 1-2 hours. Physical exam reveals a firm, tender mass in the left submandibular region. What is the most likely diagnosis?",
        "options": ["Sialolithiasis of Wharton's duct", "Sialolithiasis of Stensen's duct", "Pleomorphic adenoma of the submandibular gland", "Acute suppurative parotitis", "Branchial cleft cyst"],
        "answer": 0,
        "exp": "This is Sialolithiasis (salivary duct stone) of Wharton's duct, which drains the submandibular gland. Mealtime salivary stimulation causes saliva backup behind the obstructing stone, leading to acute, painful swelling that slowly resolves as saliva trickles out. The submandibular gland is the most common site (~80%) due to its viscous, alkaline saliva and tortuous, upward duct."
    },
    {
        "q": "A 78-year-old post-operative patient who has been nil-per-os (NPO) and on morphine since a hip replacement 4 days ago develops severe pain and swelling of the right cheek. Physical exam shows exquisite tenderness of the right parotid gland and purulent discharge from Stensen's duct. What is the most common causative pathogen?",
        "options": ["Staphylococcus aureus", "Streptococcus pneumoniae", "Fusobacterium necrophorum", "Mumps paramyxovirus", "Haemophilus influenzae"],
        "answer": 0,
        "exp": "This is Acute Suppurative Parotitis, classically seen in elderly, dehydrated, post-operative, or debilitated patients who are NPO. Reduced salivary flow allows retrograde migration of oral bacteria up Stensen's duct into the parotid gland. The most common pathogen isolated is Staphylococcus aureus."
    },
    {
        "q": "A {age}-old {gender} presents with a painless, slow-growing mass in front of their right ear. Physical exam reveals a 2.5 cm, firm, mobile, non-tender lobulated mass in the superficial lobe of the parotid gland. There is no facial weakness. MRI shows a well-demarcated heterogeneous mass. What is the most likely diagnosis?",
        "options": ["Pleomorphic adenoma", "Warthin's tumor", "Mucoepidermoid carcinoma", "Adenoid cystic carcinoma", "Parotid abscess"],
        "answer": 0,
        "exp": "Pleomorphic Adenoma (benign mixed tumor) is the most common salivary gland neoplasm (~80% of all salivary tumors, primarily occurring in the superficial lobe of the parotid gland). It is slow-growing, painless, firm, and mobile. Because of its irregular pseudopods and incomplete capsule, simple enucleation is associated with high recurrence rates; the standard treatment is superficial parotidectomy."
    },
    {
        "q": "A 68-year-old male with a heavy smoking history presents with bilateral, painless, soft swellings at the angle of the jaw. Fine needle aspiration reveals oncocytes and a lymphoid stroma. Tc-99m scintigraphy demonstrates increased uptake ('hot spots') in both parotid tails. What is the diagnosis?",
        "options": ["Warthin's tumor", "Pleomorphic adenoma", "Mucoepidermoid carcinoma", "Sjogren's syndrome", "Oncocytoma"],
        "answer": 0,
        "exp": "Warthin's Tumor (cystadenoma lymphomatosum) is the second most common benign parotid tumor. It is highly associated with male gender and smoking, and is bilateral/multifocal in 10% of cases. Histologically, it contains oncocytic epithelium and a lymphoid stroma. It is the only salivary tumor that concentrates Technetium-99m, appearing 'hot' on nuclear scintigraphy."
    },
    {
        "q": "A {age}-old {gender} presents with a painful submandibular gland mass and numbness of the chin. Biopsy reveals a malignant tumor with a classic 'cribriform' (Swiss-cheese) histological pattern. What is the primary route of spread for this neoplasm?",
        "options": ["Perineural invasion and tracking along nerve sheaths", "Early hematogenous spread to liver and brain", "Rapid lymphatic spread to bilateral cervical nodes", "Direct local invasion of the mandible", "Trans-coelomic seeding"],
        "answer": 0,
        "exp": "This is Adenoid Cystic Carcinoma, a malignant salivary gland tumor. It is highly characterized by perineural invasion (tendency to track along nerve sheaths), which explains the presentation of pain and neurological symptoms (like numbness in the V3 distribution). Histologically, the 'cribriform' or Swiss-cheese pattern is classic. It has a high late recurrence and distant metastasis rate (especially to the lungs)."
    },

    # ── Cervical Masses & Remnants ──
    {
        "q": "A 10-year-old child presents with a painless, smooth, fluctuant midline neck mass at the level of the hyoid bone. On examination, the mass is observed to move upward when the child swallows and when they protrude their tongue. What embryological remnant is responsible, and what is the definitive surgery?",
        "options": ["Thyroglossal duct remnant; Sistrunk procedure (excision of cyst, tract, and central hyoid bone)", "Second branchial cleft remnant; simple surgical excision of the cyst", "First branchial cleft remnant; superficial parotidectomy", "Cystic hygroma; sclerotherapy with bleomycin", "Thyroid dysgenesis; total thyroidectomy"],
        "answer": 0,
        "exp": "This is a Thyroglossal Duct Cyst, a congenital midline mass arising from the persistent tract of the descending thyroid gland from the foramen cecum. The pathognomonic sign is elevation upon tongue protrusion or swallowing due to its attachment to the hyoid bone. The definitive treatment is the Sistrunk Procedure, which requires excision of the cyst, the entire tract, and the central body of the hyoid bone to minimize recurrence."
    },
    {
        "q": "A {age}-old {gender} presents with a painless lateral neck mass located along the anterior border of the upper third of the sternocleidomastoid (SCM) muscle. The mass is soft and fluctuant. What is the most likely embryological origin?",
        "options": ["Second branchial cleft cyst", "First branchial cleft cyst", "Thyroglossal duct cyst", "Cystic hygroma", "Thymic duct cyst"],
        "answer": 0,
        "exp": "A Second Branchial Cleft Cyst is the most common branchial anomaly (~95%). It presents classically as a soft, fluctuant, painless mass along the anterior border of the upper SCM muscle, lateral to the carotid sheath. First branchial cleft cysts are located near the external auditory canal or angle of the jaw."
    },
    {
        "q": "A newborn is noted to have a large, soft, compressible, and brilliantly transilluminating mass in the posterior triangle of the neck. What is the diagnosis, and what genetic syndrome is most commonly associated?",
        "options": ["Cystic hygroma (lymphatic malformation); Turner syndrome (45,X)", "Thyroglossal duct cyst; Down syndrome (Trisomy 21)", "Hemangioma; Sturge-Weber syndrome", "Branchial cleft cyst; DiGeorge syndrome", "Plunging ranula; Marfan syndrome"],
        "answer": 0,
        "exp": "A Cystic Hygroma is a congenital macrocystic lymphatic malformation, most commonly found in the posterior triangle of the neck. It is soft, compressible, and characteristically transilluminates brilliantly. It is highly associated with Turner Syndrome (45,X) and other aneuploidies (Down syndrome, Edwards syndrome)."
    },
    {
        "q": "A {age}-old {gender} presents with a slowly enlarging, painless neck mass at the level of the hyoid bone. Physical exam reveals a firm, pulsatile mass that can be moved horizontally but NOT vertically. Angiography reveals a splaying of the internal and external carotid arteries ('lyre sign'). What is the diagnosis?",
        "options": ["Carotid body tumor (paraganglioma)", "Cervical lymph node metastasis", "Aneurysm of the internal carotid artery", "Second branchial cleft cyst", "Lymphoma"],
        "answer": 0,
        "exp": "This is a Carotid Body Tumor (chemodectoma/paraganglioma), a highly vascular neuroendocrine tumor located at the carotid bifurcation. Classic findings include a pulsatile mass with lateral but not vertical mobility (Fontaine's Sign) and splaying of the ICA and ECA on angiography (the 'Lyre Sign'). Office biopsy is strictly contraindicated. Hereditary cases are associated with succinate dehydrogenase (SDH) mutations."
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

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260518_ent_throat_mcqs_300.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - ENT (Throat)\n")
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
