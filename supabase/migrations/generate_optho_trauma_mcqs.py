import json
import random

topic_slug = 'optho-trauma'

templates = [
    # ─── TEMPLATE 1: OPEN GLOBE INJURY ───
    {
        "q": "A {age}-old {gender} is rushed to the emergency department after a high-velocity piece of metal flew into {possessive} {eye_side} eye while {pronoun} was hammering steel-on-steel at a construction site. The patient reports sudden, severe eye pain, tearing, and a profound loss of vision. Ophthalmic examination reveals:<br>• Best-corrected visual acuity: <b>{va_bad}</b><br>• Slit-lamp biomicroscopy: <b>360-degree subconjunctival hemorrhage, a flat anterior chamber, a teardrop-shaped pupil pointing toward a {laceration_size}-mm scleral wound near the limbus, and a small amount of uveal tissue prolapsing through the wound</b><br>• Intraocular pressure (IOP): <b>Deferred (clinical suspicion of open globe)</b><br>• Fluorescein testing: <b>A clear stream of fluid diluting the concentrated dye and running down the sclera (positive Seidel test)</b><br><br>What is the most likely diagnosis, and what is the most appropriate immediate next step in management?",
        "options": [
            "Open globe injury; place a rigid metal eye shield over the affected eye, keep the patient NPO, initiate IV broad-spectrum antibiotics, and consult ophthalmology for emergent surgical closure",
            "Open globe injury; perform immediate applanation tonometry to measure IOP, apply topical anesthetics, and pressure-patch the eye tightly",
            "Corneal laceration; immediately perform a thorough dilated fundus examination to localize any intraocular foreign body before eye shielding",
            "Traumatic iridodialysis; immediately administer topical pilocarpine to constrict the pupil and pull the iris back into the ciliary sulcus",
            "Retrobulbar hemorrhage; perform emergent bedside lateral canthotomy and cantholysis to reduce intraocular pressure"
        ],
        "answer": 0,
        "exp": "This patient presents with a classic **open globe injury (scleral rupture/penetrating trauma)**. The mechanism (high-velocity metal-on-metal projectile), **360-degree subconjunctival hemorrhage**, **shallow/flat anterior chamber**, **teardrop-shaped pupil** (pointing toward the wound due to iris prolapse), and **positive Seidel test** (aqueous humor leaking and diluting fluorescein dye) are pathognomonic. The immediate management of a suspected open globe injury is a medical emergency: (1) **place a rigid eye shield** (e.g., Fox shield) to protect the eye from accidental external pressure, (2) **keep the patient NPO** for emergent surgical repair, (3) **initiate IV broad-spectrum antibiotics** (e.g., Cefazolin + Levofloxacin) and update tetanus status, (4) provide antiemetics (e.g., Ondansetron) to prevent valsalva/vomiting which could cause extrusion of intraocular contents, and (5) **consult ophthalmology immediately**. Crucially, **avoid any pressure on the globe**: do not perform tonometry, do not apply patches (which compress the eye), and avoid unnecessary topical drops or manipulation."
    },

    # ─── TEMPLATE 2: CORNEAL ABRASION & RETAINED FOREIGN BODY ───
    {
        "q": "A {age}-old {gender} presents with a {duration}-hour history of severe pain, tearing, photophobia, and a persistent foreign body sensation in the {eye_side} eye. The symptoms began shortly after {pronoun} was cutting wood in {possessive} workshop without safety goggles. Visual acuity is {va_good} in the affected eye. Eversion of the upper eyelid reveals a tiny speck of debris embedded in the tarsal conjunctiva. Fluorescein staining under cobalt blue light demonstrates:<br>• Epithelial defects: <b>Multiple vertical, linear linear superficial scratches on the superior cornea</b><br>• Slit-lamp biomicroscopy: <b>Mild conjunctival injection; the anterior chamber is deep and quiet; no hypopyon or infiltrate is present</b><br>• Intraocular pressure: <b>{iop} mmHg</b><br><br>What is the most likely diagnosis, and what is the gold-standard treatment, including specific coverage considerations?",
        "options": [
            "Corneal abrasion secondary to a retained foreign body; remove the foreign body with a saline-moistened sterile swab, initiate topical antibiotic ointment (erythromycin), and update tetanus prophylaxis",
            "Corneal abrasion secondary to a retained foreign body; prescribe take-home topical tetracaine drops for pain control, apply a tight pressure patch for 48 hours, and schedule elective outpatient surgery",
            "Fungal corneal ulcer; prescribe hourly topical natamycin drops, avoid foreign body manipulation, and patch the eye tightly",
            "Open globe injury; place a rigid eye shield, initiate IV broad-spectrum antibiotics, and perform emergent lateral canthotomy",
            "Acanthamoeba keratitis; initiate topical chlorhexidine and propamidine drops, and avoid contact lens wear indefinitely"
        ],
        "answer": 0,
        "exp": "This patient presents with a **corneal abrasion secondary to a retained foreign body**. The pathognomonic finding on fluorescein staining is **multiple vertical, linear corneal scratches (tracks)**, which are caused by the foreign body (embedded on the tarsal conjunctiva of the upper eyelid) repeatedly scraping the cornea during blinking. The primary management is: (1) **eyelid eversion** and **removal of the foreign body** using a saline-moistened sterile cotton swab or a fine needle under slit-lamp guidance, (2) **topical antibiotic ointment** (e.g., **Erythromycin** or Polymyxin/Trimethoprim; in contact lens wearers, cover *Pseudomonas* with a fluoroquinolone like **Ciprofloxacin** or Ofloxacin), and (3) updating **tetanus prophylaxis**. Crucially, **never prescribe take-home topical anesthetics (like tetracaine)** because they are corneal toxins that delay epithelial healing, cause corneal melting, and mask worsening symptoms. **Do not patch the eye** as it promotes a warm, moist environment conducive to bacterial replication."
    },

    # ─── TEMPLATE 3: CHEMICAL OCULAR BURN (ALKALI VS ACIDIC) ───
    {
        "q": "A {age}-old {gender} is brought to the emergency department immediately after a commercial cleaning fluid containing {chemical} splashed into {possessive} {eye_side} eye. The patient reports excruciating pain, blepharospasm, and an inability to open {possessive} eyelids. Ophthalmic examination reveals:<br>• Eyelids/Conjunctiva: <b>Severe chemosis, conjunctival hyperemia, and a {blanching}-degree area of scleral/limbal blanching (ischemia)</b><br>• Slit-lamp biomicroscopy: <b>Moderate corneal clouding with loss of stromal details; pH of the tear film measured at the limbus is {ph}</b><br><br>What is the immediate, highest-priority management before any further diagnostic testing or detailed ocular examination, and what is the clinical significance of this chemical class?",
        "options": [
            "Immediate, copious continuous irrigation with normal saline or tap water for at least 30 minutes until the tear film pH is neutral (7.0 - 7.4); alkaline substances cause liquefactive necrosis which penetrates deeply into the intraocular space",
            "Immediate measurement of best-corrected visual acuity, followed by a complete slit-lamp examination and diagnostic CT scanning to rule out open globe before irrigation",
            "Immediate application of topical acidic neutralizers (dilute vinegar) to rapidly neutralize the alkaline tear film pH back to normal",
            "Immediate application of a tight pressure patch combined with hourly topical prednisolone drops to arrest stromal enzymatic degradation",
            "Immediate surgical debridement of the corneal epithelium to remove the chemical residues, followed by broad-spectrum IV levofloxacin"
        ],
        "answer": 0,
        "exp": "This patient has sustained a **chemical ocular burn**. Ocular chemical burns are a true ophthalmic emergency, and the **absolute first-line, highest-priority management is immediate, copious irrigation** (using normal saline, Lactated Ringer's, or even tap water if medical solutions are unavailable) for a minimum of 30 minutes. **No diagnostic testing (including visual acuity) should delay irrigation**. Irrigation must continue until the **pH of the tear film in the conjunctival sac is neutral (7.0 to 7.4)**, measured 5-10 minutes after stopping irrigation (to prevent false readings). **Alkali chemicals** (such as ammonia, lye, sodium hydroxide, or lime) are far more dangerous than acid chemicals because they cause **liquefactive necrosis**. This process denatures proteins and saponifies lipids, allowing the alkaline substance to rapidly penetrate deep into the corneal stroma and anterior chamber. In contrast, **acid chemicals** cause **coagulative necrosis**, which precipitates proteins to form a physical barrier that limits deeper ocular penetration."
    },

    # ─── TEMPLATE 4: TRAUMATIC HYPHEMA ───
    {
        "q": "A {age}-old {gender} presents with progressive blurring of vision and moderate aching pain in the {eye_side} eye 2 hours after being struck with a {projectile} during a recreational game. On physical examination, the patient is alert and cooperative. Ophthalmic examination reveals:<br>• Best-corrected visual acuity: <b>{va_bad}</b><br>• Slit-lamp biomicroscopy: <b>A layered, red band of red blood cells occupying the inferior {percent}% of the anterior chamber (hypophema)</b><br>• Intraocular pressure (IOP): <b>{iop} mmHg</b> (normal 10-21 mmHg)<br>• Dilated funduscopy: <b>Quiet vitreous; normal optic nerve and macula</b><br><br>What is the most likely diagnosis, what are the primary pillars of conservative management, and what critical hematological screening is mandatory?",
        "options": [
            "Traumatic hyphema; elevate the head of the bed to 30-45 degrees, place a rigid eye shield, prescribe topical cycloplegics, avoid NSAIDs/aspirin, and screen for sickle cell disease/trait",
            "Traumatic hyphema; prescribe intensive oral aspirin for pain control, apply a tight pressure patch, and initiate immediate surgical anterior chamber washout",
            "Retrobulbar hemorrhage; perform emergent lateral canthotomy, prescribe oral acetazolamide, and place the patient in a prone position",
            "Traumatic iridocyclitis; prescribe systemic corticosteroids, tight pressure-patching, and immediate surgical iridectomy",
            "Traumatic cataract; perform emergent phacoemulsification, prescribe topical NSAIDs, and screen the patient for G6PD deficiency"
        ],
        "answer": 0,
        "exp": "This patient has a **traumatic hyphema**, defined as the presence of red blood cells in the anterior chamber, typically resulting from blunt trauma that tears the blood vessels of the ciliary body or iris. Management is primarily conservative to prevent complications (secondary hemorrhage, corneal blood staining, and secondary glaucoma): (1) **elevate the head of the bed to 30-45 degrees** to facilitate settling of blood inferiorly (clearing the visual axis and preventing corneal endothelial staining), (2) **place a rigid eye shield** to protect from further trauma, (3) prescribe **topical cycloplegics** (to relax the ciliary body and relieve photophobia) and **topical corticosteroids** (to decrease sterile inflammation), and (4) **strictly avoid NSAIDs or aspirin** due to their antiplatelet effects which significantly elevate the risk of a secondary rebleed (which classically peaks on days 3-5). Crucially, **all patients must be screened for sickle cell disease or trait** (especially in high-risk populations). Sickled red blood cells clog the trabecular meshwork far more easily, causing a catastrophic spike in IOP. In sickle cell patients, **avoid carbonic anhydrase inhibitors like acetazolamide** because they promote systemic and aqueous acidosis, which further accelerates sickling of red blood cells in the anterior chamber."
    },

    # ─── TEMPLATE 5: ORBITAL BLOWOUT FRACTURE ───
    {
        "q": "A {age}-old {gender} is evaluated in the emergency department after being punched in the {eye_side} orbit during an altercation. The patient reports dull orbital pain and binocular double vision, particularly when looking upwards. Physical examination reveals periorbital ecchymosis and edema. Ophthalmic examination findings include:<br>• Extraocular movements: <b>Severe restriction of upward gaze in the affected eye, with reproduction of vertical diplopia</b><br>• Sensory testing: <b>Marked numbness/decreased sensation to light touch over the ipsilateral cheek, upper lip, and lateral nose</b><br>• Palpation: <b>Subcutaneous crepitus over the infraorbital rim upon blowing {possessive} nose</b><br>• Intraocular pressure: <b>{iop} mmHg</b><br><br>What is the most likely diagnosis, which structure is classically entrapped, and what is the most appropriate initial management?",
        "options": [
            "Orbital blowout fracture (orbital floor); entrapment of the inferior rectus muscle and herniation of orbital fat into the maxillary sinus; prescribe oral antibiotics, nasal decongestants, and strictly instruct the patient to avoid blowing {possessive} nose",
            "Orbital blowout fracture (orbital roof); entrapment of the superior rectus muscle and herniation into the frontal sinus; perform emergent surgical decompression within 6 hours",
            "Retrobulbar hemorrhage; entrapment of the lateral rectus muscle; initiate high-dose IV methylprednisolone and immediate lateral canthotomy",
            "Zygomaticomaxillary complex fracture; entrapment of the medial rectus muscle; instruct the patient to perform daily eye exercises and blow {possessive} nose aggressively",
            "Traumatic orbital cellulitis; entrapment of the inferior oblique muscle; initiate IV broad-spectrum vancomycin and ceftriaxone, and apply a pressure patch"
        ],
        "answer": 0,
        "exp": "This patient presents with a classic **orbital blowout fracture**, most commonly involving the **orbital floor** (composed of the thin maxillary bone). Blunt force to the orbit increases intraorbital pressure, fracturing the thin floor and causing herniation of orbital contents. Key diagnostic features include: (1) **vertical diplopia on upward gaze** due to **entrapment of the inferior rectus muscle** and orbital fat within the fracture site, (2) **hypoesthesia of the ipsilateral cheek, upper lip, and lateral nose** due to injury of the **infraorbital nerve (CN V2)** which courses through the orbital floor, and (3) **subcutaneous emphysema/crepitus** that occurs when air from the maxillary sinus is forced into the orbit (classically triggered by **blowing the nose**). Initial management is conservative: (1) **strictly instruct the patient to avoid blowing their nose** to prevent forcing sinus bacteria and air into the orbit (which could cause orbital compartment syndrome), (2) **oral antibiotics** (e.g., Amoxicillin-Clavulanate) to cover sinus pathogens, (3) **nasal decongestants** (e.g., Oxymetazoline) to facilitate sinus drainage, and (4) outpatient ophthalmology/maxillofacial follow-up. Surgical repair is indicated if there is persistent diplopia, significant enophthalmos (>2 mm), or CT evidence of a large fracture."
    },

    # ─── TEMPLATE 6: TRAUMATIC IRIDODIALYSIS ───
    {
        "q": "A {age}-old {gender} reports photophobia and a highly bothersome 'double vision' in the {eye_side} eye {duration} days after being struck by a high-speed squash ball. Crucially, when the patient closes {possessive} uninjured eye, the double vision persists (monocular diplopia). Ophthalmic examination reveals:<br>• Best-corrected visual acuity: <b>20/40</b><br>• Slit-lamp biomicroscopy: <b>A D-shaped pupil in the affected eye, and a distinct, dark, crescent-shaped gap at the peripheral {limbus_side} limbus, exposing the underlying lens equator</b><br>• Lens/Fundus: <b>The crystalline lens is clear and stable; dilated fundus examination is normal; no retinal tears are present</b><br>• Intraocular pressure: <b>{iop} mmHg</b><br><br>What is the most likely diagnosis, what is the pathophysiology of the patient's double vision, and what is the treatment of choice?",
        "options": [
            "Traumatic iridodialysis; separation of the iris root from the ciliary body creating an accessory optical axis (second pupil) causing monocular diplopia; manage conservatively with cycloplegics/tinted contact lenses, or perform surgical iridopexy if highly symptomatic",
            "Traumatic iridodialysis; tear of the iris sphincter muscle causing a second pupil; manage with emergent laser peripheral iridotomy within 24 hours",
            "Subluxated crystalline lens (ectopia lentis); disruption of the ciliary zonules causing asymmetric refraction; perform emergent lens extraction and PCIOL exchange",
            "Posterior synechiae; adhesion of the iris to the anterior lens capsule causing monocular diplopia; treat with aggressive topical pilocarpine and surgical pupilloplasty",
            "Open globe injury; rupture of the scleral wall near the limbus; place a tight pressure patch, administer IV cefazolin, and perform emergent vitrectomy"
        ],
        "answer": 0,
        "exp": "This patient has a **traumatic iridodialysis**, which is the localized separation of the **iris root from the ciliary body**, typically caused by severe blunt trauma. The separation creates a peripheral gap or 'second pupil' (accessory optical axis). When light enters the eye through both the normal pupil and the peripheral iridodialysis gap, two separate images are projected onto the retina, resulting in **monocular diplopia** (double vision that persists when the opposite eye is closed). Slit-lamp findings classically reveal a **D-shaped pupil** and a visible peripheral crescent gap. Management depends on symptoms: small, asymptomatic iridodialyses require only observation. Mild cases with photophobia or mild glare can be managed conservatively with tinted/cosmetic contact lenses or sunglasses. Large, highly symptomatic iridodialyses causing disabling glare, monocular diplopia, or cosmetic defects are treated with **surgical iridopexy** (suturing the iris root back to the ciliary body scleral spur)."
    },

    # ─── TEMPLATE 7: RETROBULBAR HEMORRHAGE & ORBITAL COMPARTMENT SYNDROME ───
    {
        "q": "A {age}-old {gender} is brought to the emergency department with progressive, excruciating pain and rapidly worsening vision in the {eye_side} eye 1 hour after sustaining blunt facial trauma in a motor vehicle collision. Ophthalmic examination reveals:<br>• Eyelids: <b>Marked ecchymosis, extreme swelling, and a rock-hard orbit ( eyelids are tense, rigid, and resistant to manual opening or retropulsion)</b><br>• Pupil: <b>A {pupil_size}-mm fixed, dilated pupil with a prominent relative afferent pupillary defect (RAPD)</b><br>• Visual acuity: <b>{va_bad}</b><br>• Intraocular pressure: <b>{iop} mmHg</b> (normal 10-21 mmHg)<br><br>What is the most likely diagnosis, and what is the immediate, gold-standard, life-and-sight-saving intervention?",
        "options": [
            "Retrobulbar hemorrhage / Orbital Compartment Syndrome (OCS); immediate bedside lateral canthotomy and cantholysis (LCC) without waiting for imaging",
            "Retrobulbar hemorrhage; emergent maxillofacial CT scan to plan surgical bony decompression, combined with high-dose IV methylprednisolone",
            "Acute angle-closure glaucoma; immediate laser peripheral iridotomy and administration of IV mannitol and topical timolol",
            "Traumatic carotid-cavernous fistula; immediate endovascular embolization of the internal carotid artery",
            "Open globe injury; immediate placement of a rigid eye shield, administration of IV antibiotics, and emergent anterior chamber washout"
        ],
        "answer": 0,
        "exp": "This patient presents with a **retrobulbar hemorrhage causing Orbital Compartment Syndrome (OCS)**. The orbit is a rigid, bony cavity bounded anteriorly by the orbital septum. Hemorrhage or edema within this closed space rapidly increases intraorbital pressure. When the pressure exceeds central retinal artery perfusion pressure, ischemia of the optic nerve and retina ensues, leading to permanent blindness within 90-120 minutes. Key diagnostic signs include a **rock-hard orbit on palpation** (tense, rigid eyelids resistant to manual opening), **progressive proptosis**, severe visual decline, **RAPD**, a fixed/dilated pupil, and a **severely elevated IOP (often >40-50 mmHg)**. **OCS is a clinical diagnosis and an absolute surgical emergency**. The immediate, gold-standard treatment is a bedside **lateral canthotomy and cantholysis (LCC)**, which releases the lateral palpebral ligament and allows the orbital contents to expand anteriorly, immediately lowering intraorbital pressure. **Imaging (such as a CT scan) or medical therapy must NEVER delay LCC**."
    },

    # ─── TEMPLATE 8: SYMPATHETIC OPHTHALMIA ───
    {
        "q": "A {age}-old {gender} presents with progressive blurring of vision, floaters, and photophobia in {possessive} {eye_side} eye over the past {duration} weeks. Ophthalmic history is notable for a penetrating, open-globe injury to the **contralateral** eye {months} months ago, which resulted in complete permanent blindness in that eye. Ophthalmic examination of the **previously uninjured, contralateral** eye reveals:<br>• Visual acuity: <b>20/100</b><br>• Slit-lamp biomicroscopy: <b>Moderate conjunctival injection, ciliary flush, keratic precipitates on the corneal endothelium, severe anterior chamber cell and flare, and posterior synechiae</b><br>• Dilated fundus examination: <b>Bilateral vitritis, optic disc edema, and multiple small, yellowish-white nodules scattered throughout the peripheral retina (Dalen-Fuchs nodules)</b><br><br>What is the most likely diagnosis, what is the underlying pathophysiology, and how could this condition have been prevented?",
        "options": [
            "Sympathetic ophthalmia; bilateral granulomatous uveitis caused by a T-cell mediated autoimmune response to sequestered retinal antigens released during trauma; prevented by enucleation of the injured eye within 2 weeks of the initial trauma",
            "Sympathetic ophthalmia; bacterial endophthalmitis crossing the optic chiasm via retrochiasmatic pathways; prevented by high-dose broad-spectrum IV ceftriaxone at the time of injury",
            "Traumatic sympathetic uveitis; delayed hypersensitivity reaction to intraocular retained wood foreign body; prevented by immediate MRI imaging and surgical extraction",
            "Phacoanaphylactic endophthalmitis; autoimmune reaction to lens proteins exposed during trauma; prevented by immediate posterior chamber intraocular lens (PCIOL) implantation",
            "Vogt-Koyanagi-Harada (VKH) syndrome; systemic autoimmune melanocortin attack; prevented by aggressive prophylactic systemic cyclosporine and topical prednisone"
        ],
        "answer": 0,
        "exp": "**Sympathetic Ophthalmia** is a rare, bilateral, granulomatous uveitis that occurs weeks to years (most commonly within 3 months) following a penetrating open-globe injury to **one** eye (the **'exciting' eye**). The pathophysiology is **autoimmune**: the initial trauma disrupts the blood-ocular barrier, exposing **sequestered retinal self-antigens** (which are normally immunologically privileged) to the lymphatic system. This triggers a **T-cell mediated autoimmune attack** against the uveal tract in both the traumatized exciting eye and the previously uninjured **contralateral 'sympathizing' eye**. Classic findings include keratic precipitates, vitritis, optic disc edema, and **Dalen-Fuchs nodules** (epithelioid cell clusters between the RPE and Bruch's membrane). Sympathetic ophthalmia can be **prevented by early enucleation of the severely traumatized, blind exciting eye within 2 weeks of the initial injury** (before autoimmune sensitization occurs). Once sympathetic ophthalmia has developed in the sympathizing eye, enucleation of the exciting eye is no longer helpful, and the patient must be treated with aggressive, long-term **systemic corticosteroids and immunosuppressants**."
    },

    # ─── TEMPLATE 9: TRAUMATIC OPTIC NEUROPATHY ───
    {
        "q": "A {age}-old {gender} is evaluated in the emergency department following high-impact blunt head trauma after a fall from a height of {fall_height} feet, striking {possessive} ipsilateral forehead and brow. The patient reports sudden, profound loss of vision in the {eye_side} eye. Ophthalmic examination findings include:<br>• Best-corrected visual acuity: <b>{va_bad}</b> in the affected eye (20/20 in contralateral eye)<br>• Pupillary examination: <b>A positive relative afferent pupillary defect (RAPD) in the affected eye</b><br>• Color vision: <b>Severe dyschromatopsia (red-green color desaturation; red caps appear grey)</b><br>• Dilated funduscopy: <b>The optic disc, macula, and peripheral retina appear completely normal and healthy</b><br>• Intraocular pressure: <b>{iop} mmHg</b><br><br>What is the most likely diagnosis, and what is the underlying mechanism?",
        "options": [
            "Traumatic optic neuropathy (indirect TON); shearing of the intracanalicular optic nerve fibers or microvascular blood supply due to force transmitted through the orbital bones; initial optic disc is normal, with pallor developing over 4-6 weeks",
            "Central retinal artery occlusion (CRAO); embolic obstruction of the central retinal artery at the optic disc; fundus examination classically reveals a pale retina with a cherry-red spot at the fovea",
            "Retrobulbar hemorrhage; orbital compartment syndrome compressing the orbital veins; fundus examination reveals severe optic nerve swelling and diffuse flame hemorrhages",
            "Traumatic optic neuropathy (direct TON); direct laceration of the intraocular optic disc by a bony fragment; fundus examination classically reveals immediate massive disc edema and vitreous hemorrhage",
            "Retinal detachment; rhegmatogenous tear of the peripheral sensory retina; fundus examination classically reveals a elevated, grey, undulating retina with a horseshoe tear"
        ],
        "answer": 0,
        "exp": "This patient presents with **indirect Traumatic Optic Neuropathy (TON)**. Indirect TON is caused by blunt head trauma (classically a force transmitted from an impact to the forehead, brow, or temple) where the shockwave is transmitted through the orbital bones to the **optic canal**, resulting in **shearing of the intracanalicular optic nerve fibers** or disruption of its delicate microvascular blood supply. Clinical hallmarks include: (1) **sudden, severe vision loss** immediately following blunt trauma, (2) **severe dyschromatopsia** (color desaturation, classically checked by asking the patient to view a red cap), and (3) a **positive relative afferent pupillary defect (RAPD)**. Crucially, **dilated funduscopy is completely normal initially**, because the injury occurs posteriorly within the optic canal (retrobulbar region). Over **4 to 6 weeks**, retrograde degeneration occurs, and the patient develops **optic disc pallor/atrophy**. Diagnostic evaluation includes thin-cut CT scanning of the orbits to evaluate the optic canal for fractures or bony fragments."
    },

    # ─── TEMPLATE 10: TRAUMATIC IRIDOCYCLITIS (TRAUMATIC UVEITIS) ───
    {
        "q": "A {age}-old {gender} presents with a {duration}-day history of dull, aching pain, severe photophobia, tearing, and mild blurry vision in the {eye_side} eye. The symptoms began {days} days after {pronoun} was struck in the eye by a {projectile}. Ophthalmic examination reveals:<br>• Best-corrected visual acuity: <b>{va_good}</b><br>• Conjunctiva: <b>Mild circumcorneal conjunctival injection (ciliary flush)</b><br>• Slit-lamp biomicroscopy: <b>Cornea is clear; 2+ cells and 1+ flare are visible in the anterior chamber; the pupil is mildly constricted (miotic) and sluggishly reactive to light; no hypopyon or fibrin is present</b><br>• Intraocular pressure: <b>{iop} mmHg</b> (normal 10-21 mmHg)<br>• Dilated fundus examination: <b>Normal posterior segment, clear vitreous, no macular edema</b><br><br>What is the most likely diagnosis, and what is the standard first-line management?",
        "options": [
            "Traumatic iridocyclitis (traumatic anterior uveitis); treat with topical cycloplegics (e.g., cyclopentolate) to relieve ciliary spasm pain and topical corticosteroids (e.g., prednisolone acetate) to suppress sterile inflammation",
            "Acute postoperative endophthalmitis; treat with emergent vitreous tap and intravitreal broad-spectrum vancomycin and ceftazidime injections",
            "Corneal abrasion; treat with topical ciprofloxacin ointment, a tight pressure patch, and avoid topical steroids",
            "Primary open-angle glaucoma; treat with topical latanoprost drops and systemic acetazolamide, and avoid pupillary dilation",
            "Toxic Anterior Segment Syndrome (TASS); treat with immediate hourly topical prednisolone acetate and systemic broad-spectrum levofloxacin"
        ],
        "answer": 0,
        "exp": "This patient presents with **traumatic iridocyclitis (also known as traumatic anterior uveitis)**. This is a sterile inflammatory response of the iris and ciliary body that typically develops **1 to 3 days following blunt trauma**. Clinical findings include a dull, aching ocular pain, severe photophobia, **ciliary flush** (circumcorneal conjunctival injection), **anterior chamber cell and flare** (due to protein and inflammatory cells leaking from injured iris blood vessels), and a **sluggish, mildly constricted (miotic) pupil** caused by iris sphincter spasm. Standard first-line management is twofold: (1) **topical cycloplegics** (e.g., Cyclopentolate, Homatropine) to dilate the pupil, which prevents the formation of posterior synechiae and immobilizes the iris/ciliary muscle to **relieve the painful ciliary spasm**, and (2) **topical corticosteroids** (e.g., Prednisolone acetate 1%) to suppress the sterile anterior segment inflammation. Symptoms typically resolve within a few weeks with gradual tapering of the corticosteroid drops."
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
            
        age = random.randint(18, 76)
        gp = random.choice(genders_pool)
        
        # Clinical parameters
        duration = random.randint(12, 72)
        eye_side = random.choice(["right", "left"])
        
        laceration_size = round(random.uniform(0.5, 3.5), 1)
        iop = random.randint(10, 24)
        if t['options'][0].startswith("Retrobulbar hemorrhage / Orbital Compartment"):
            iop = random.randint(42, 64)
            
        days = random.randint(1, 4)
        chemical = random.choice([
            "alkaline drain cleaner (containing sodium hydroxide)",
            "industrial bleach (containing sodium hypochlorite)",
            "ammonia-based window cleaner",
            "masonry wet cement (containing calcium hydroxide)",
            "sulfuric acid battery fluid",
            "nitric acid metal cleaner"
        ])
        
        blanching = random.randint(45, 270)
        ph = round(random.uniform(9.0, 11.5), 1) if "alkaline" in chemical or "bleach" in chemical or "ammonia" in chemical or "cement" in chemical else round(random.uniform(2.0, 4.5), 1)
        
        projectile = random.choice(["tennis ball", "bungee cord strap", "fist", "paintball", "squash ball", "champagne cork"])
        percent = random.choice([10, 15, 20, 25, 30, 40, 50])
        limbus_side = random.choice(["superotemporal", "inferonasal", "nasal", "temporal", "superior", "inferior"])
        pupil_size = random.randint(5, 8)
        months = random.randint(2, 18)
        fall_height = random.randint(6, 22)
        
        va_bad = random.choice(["20/200", "20/300", "20/400", "Count fingers (CF) at 3 feet", "Hand motion (HM) only", "Light perception (LP) only"])
        va_good = random.choice(["20/25", "20/30", "20/40", "20/50"])
        
        # Formatting values
        q_text = t['q'].format(
            age=age, gender=gp['gender'], pronoun=gp['pronoun'], possessive=gp['possessive'],
            duration=duration, eye_side=eye_side, laceration_size=laceration_size,
            iop=iop, days=days, chemical=chemical, ph=ph, blanching=blanching,
            projectile=projectile, percent=percent, limbus_side=limbus_side,
            pupil_size=pupil_size, months=months, fall_height=fall_height,
            va_bad=va_bad, va_good=va_good
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

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260519_optho_trauma_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Ophthalmology: Ocular trauma\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'optho-trauma' LIMIT 1;\n")
    f.write("    IF v_topic_id IS NULL THEN\n")
    f.write(f"        RAISE EXCEPTION 'Topic optho-trauma not found.';\n")
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
