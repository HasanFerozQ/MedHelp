import json
import random

topic_slug = 'optho-retinal-emergencies'

templates = [
    # ─── 1. RHEGMATOGENOUS RETINAL DETACHMENT (MACULA-ON) ───
    {
        "q": "A {age}-old {gender} presents to the emergency department with a {duration}-hour history of sudden flashes of light (photopsia) and a flurry of dark, hair-like floaters in the {eye_side} eye. Over the past few hours, the patient has noticed a dark, shadow-like \"curtain\" expanding from the superior-temporal periphery toward the center of their vision. Clinical findings include:<br>• Visual acuity: <b>20/20 in the affected eye</b><br>• Pupillary response: <b>Normal, no afferent pupillary defect (RAPD)</b><br>• Dilated funduscopy: <b>Dome-shaped, corrugated gray retina in the temporal quadrant with a horseshoe-shaped tear; macula is flat</b><br><br>What is the most appropriate classification and the most urgent management step?",
        "options": [
            "Rhegmatogenous retinal detachment, macula-on; urgent surgical intervention (e.g., pneumatic retinopexy or vitrectomy) within 24 hours to preserve central vision",
            "Rhegmatogenous retinal detachment, macula-off; elective outpatient surgical repair within 1-2 weeks",
            "Tractional retinal detachment; immediate intravitreal anti-VEGF injection",
            "Exudative retinal detachment; high-dose systemic corticosteroid therapy",
            "Posterior vitreous detachment (PVD) without tear; routine follow-up in 4-6 weeks with no intervention"
        ],
        "answer": 0,
        "exp": "This patient is presenting with a **rhegmatogenous retinal detachment (RRD)** that is classified as **macula-on** (meaning the macula is still attached, as evidenced by the preserved 20/20 visual acuity). RRD occurs when a retinal tear (typically horseshoe-shaped, secondary to vitreous traction during a posterior vitreous detachment) allows liquefied vitreous to enter the subretinal space, separating the neurosensory retina from the underlying retinal pigment epithelium (RPE). A **macula-on RRD is a true surgical emergency** because the detachment can rapidly progress to involve the macula (macula-off), which leads to permanent loss of central visual acuity. Prompt intervention (within 24 hours) via pneumatic retinopexy, scleral buckle, or pars plana vitrectomy is required to wall off the tear and prevent macular involvement. Once the macula detaches (macula-off), the visual prognosis drops significantly, and surgery can be scheduled within a few days rather than hours."
    },

    # ─── 2. RHEGMATOGENOUS RETINAL DETACHMENT (MACULA-OFF) ───
    {
        "q": "A {age}-old {gender} presents with a {duration}-day history of painless vision loss in the {eye_side} eye. The patient reports that their symptoms began with flashes of light and floaters, followed by a shadow that eventually covered their central vision. Examination findings include:<br>• Visual acuity: <b>{va_low} in the affected eye</b><br>• Pupillary response: <b>Mild relative afferent pupillary defect (RAPD) present</b><br>• Dilated funduscopy: <b>Wrinkled, gray, mobile neurosensory retinal layer with a large superior tear; fovea is detached</b><br><br>What is the classification of this detachment, and how does the management urgency compare to a macula-on detachment?",
        "options": [
            "Rhegmatogenous retinal detachment, macula-off; urgent surgical repair is still indicated but can be safely scheduled within a few days without compromising visual recovery further",
            "Rhegmatogenous retinal detachment, macula-on; emergency surgery must be performed immediately within 2 hours",
            "Exudative retinal detachment; immediate anterior chamber paracentesis",
            "Tractional retinal detachment; immediate panretinal photocoagulation (PRP)",
            "Central retinal vein occlusion; urgent intravitreal anti-VEGF injection"
        ],
        "answer": 0,
        "exp": "This patient has a **rhegmatogenous retinal detachment (RRD)** that is classified as **macula-off** (the macula/fovea is detached, resulting in poor visual acuity). While RRD still requires surgical repair to prevent total blindness and facilitate whatever visual recovery is possible, the urgency is **subacute** compared to a macula-on detachment. In a macula-on detachment, the primary goal is to *prevent* the macula from detaching to protect 20/20 vision—making it an immediate emergency. In a macula-off detachment, the photoreceptors in the fovea have already been separated from their choroidal blood supply, and the visual acuity has already dropped. Studies show that visual outcomes are similar whether surgery is performed within 24 hours or delayed for a few days (up to 7-10 days), so it can be scheduled semi-urgently."
    },

    # ─── 3. CENTRAL RETINAL ARTERY OCCLUSION (EMBOLIC) ───
    {
        "q": "A {age}-old {gender} with a history of hypertension, type 2 diabetes, and tobacco use presents with sudden, painless, complete loss of vision in the {eye_side} eye that occurred {duration_hrs} hours ago. Ophthalmic examination reveals:<br>• Visual acuity: <b>{va_very_low} (complete darkness)</b><br>• Pupillary response: <b>Prominent relative afferent pupillary defect (RAPD)</b><br>• Dilated funduscopy: <b>Diffuse, pale, milk-white retina with a distinct cherry-red spot in the fovea</b><br><br>What is the most likely diagnosis, and what is the underlying pathophysiology?",
        "options": [
            "Central retinal artery occlusion (CRAO); embolic obstruction of the central retinal artery leading to retinal ischemia",
            "Central retinal vein occlusion (CRVO); thrombosis of the central retinal vein at the lamina cribrosa",
            "Rhegmatogenous retinal detachment; separation of the neurosensory retina from the RPE",
            "Acute angle-closure glaucoma; pupillary block with mechanical obstruction of the trabecular meshwork",
            "Optic neuritis; autoimmune inflammatory demyelination of the optic nerve"
        ],
        "answer": 0,
        "exp": "The sudden onset of profound, painless, unilateral vision loss, accompanied by an RAPD, a diffuse **pale/whitened retina**, and a pathognomonic **cherry-red spot** in the fovea, is the classic presentation of **Central Retinal Artery Occlusion (CRAO)**. The central retinal artery is a branch of the ophthalmic artery, which branches from the internal carotid artery. Occlusion (most commonly embolic in origin, such as a cholesterol Hollenhorst plaque from the carotid, a calcific plaque from cardiac valves, or platelet-fibrin thrombi) leads to rapid ischemia of the inner retinal layers. The retina becomes opaque and white due to swelling of the ganglion cell layer. The fovea remains red (cherry-red spot) because the fovea lacks ganglion cells, allowing the underlying vascularized choroid to show through the thin foveal tissue. Management is an ophthalmic emergency and includes maneuvers to lower intraocular pressure (ocular massage, anterior chamber paracentesis, IV acetazolamide) to try and dislodge the embolus."
    },

    # ─── 4. CRAO (GIANT CELL ARTERITIS ETIOLOGY) ───
    {
        "q": "An {age}-old {gender} presents with sudden, painless, severe vision loss in the {eye_side} eye of {duration_hrs} hours duration. The patient also reports a 3-week history of throbbing unilateral headache, pain in the jaw when chewing food (jaw claudication), and muscle aches in the shoulders and hips. Diagnostic workup reveals:<br>• Visual acuity: <b>{va_very_low}</b><br>• Erythrocyte sedimentation rate (ESR): <b>{esr} mm/hr</b> (normal < 30)<br>• C-reactive protein (CRP): <b>{crp} mg/L</b> (normal < 5)<br>• Dilated funduscopy: <b>Pale retina with a distinct foveal cherry-red spot</b><br><br>What is the most appropriate next step in management to prevent bilateral blindness?",
        "options": [
            "Immediate high-dose intravenous methylprednisolone, followed by a temporal artery biopsy",
            "Temporal artery biopsy first, and defer steroids until histopathologic confirmation of Giant Cell Arteritis",
            "Ocular massage and anterior chamber paracentesis only, with no systemic therapy",
            "Topical timolol drops and oral acetazolamide, with outpatient rheumatology referral",
            "Urgent pars plana vitrectomy with subretinal tissue plasminogen activator (tPA) injection"
        ],
        "answer": 0,
        "exp": "In an elderly patient presenting with a **Central Retinal Artery Occlusion (CRAO)** or anterior ischemic optic neuropathy, accompanied by systemic symptoms such as jaw claudication, headache, polymyalgia rheumatica (shoulder/hip pain), and markedly elevated inflammatory markers (ESR, CRP), **Giant Cell Arteritis (GCA / temporal arteritis)** must be suspected immediately. GCA is an inflammatory vasculitis of medium-sized arteries. If left untreated, there is an extremely high risk (up to 50%) of rapid, bilateral, permanent blindness due to involvement of the contralateral eye's posterior ciliary or central retinal arteries. **High-dose systemic corticosteroids (IV methylprednisolone)** must be initiated **immediately** upon clinical suspicion, and should *never* be delayed for a temporal artery biopsy, which can be performed within 1-2 weeks without losing diagnostic accuracy."
    },

    # ─── 5. BRANCH RETINAL ARTERY OCCLUSION (BRAO) ───
    {
        "q": "A {age}-old {gender} with severe carotid artery atherosclerosis presents with a {duration}-hour history of sudden, painless loss of the {field_defect} visual field in the {eye_side} eye. Clinical examination reveals:<br>• Visual acuity: <b>20/20 in both eyes</b><br>• Pupillary response: <b>Normal, no RAPD</b><br>• Dilated funduscopy: <b>Localized, wedge-shaped area of retinal pallor and edema in the superotemporal quadrant</b><br>• Vascular examination: <b>Small, refractile, bright yellow Hollenhorst plaque at the first bifurcation of the retinal artery</b><br><br>What is the most likely diagnosis, and what is the source of the plaque?",
        "options": [
            "Branch retinal artery occlusion (BRAO) caused by a cholesterol embolus originating from an ipsilateral carotid artery plaque",
            "Branch retinal vein occlusion (BRVO) caused by a venous thrombus at an arteriole-venous crossing",
            "Central retinal artery occlusion (CRAO) caused by a calcific embolus from the heart",
            "Rhegmatogenous retinal detachment caused by an operculated retinal tear",
            "Lattice degeneration with subretinal fluid accumulation"
        ],
        "answer": 0,
        "exp": "This patient is presenting with a **Branch Retinal Artery Occlusion (BRAO)**, characterized by a sudden, painless, sectoral or partial visual field loss. On fundus examination, there is a **localized, wedge-shaped area of retinal pallor** corresponding to the distribution of the occluded branch retinal arteriole. The presence of a bright yellow, highly refractile plaque at a vascular bifurcation is a **Hollenhorst plaque**, which is composed of **cholesterol** and almost always originates from an **atherosclerotic plaque in the ipsilateral carotid artery** (or less commonly the aorta). Because visual acuity is preserved (unless the fovea is involved), the primary focus in BRAO is a comprehensive stroke workup, including carotid duplex ultrasound, echocardiography, and cardiovascular risk optimization, as these patients are at high risk for a future cerebral stroke."
    },

    # ─── 6. CENTRAL RETINAL VEIN OCCLUSION (CRVO - ISCHEMIC) ───
    {
        "q": "A {age}-old {gender} with a history of poorly controlled hypertension and hyperlipidemia presents with a {duration}-day history of painless, subacute, moderate-to-severe vision loss in the {eye_side} eye. Ophthalmic examination reveals:<br>• Visual acuity: <b>{va_low}</b><br>• Pupillary response: <b>Positive relative afferent pupillary defect (RAPD)</b><br>• Dilated funduscopy: <b>Classic \"blood and thunder\" appearance with diffuse flame-shaped hemorrhages in all four quadrants, tortuous dilated veins, optic disc edema, and cotton-wool spots</b><br><br>What is the most likely diagnosis, and what is the primary chronic complication for which this patient must be closely monitored?",
        "options": [
            "Central retinal vein occlusion (CRVO); neovascular glaucoma (due to iris neovascularization / rubeosis iridis)",
            "Central retinal artery occlusion (CRAO); bilateral retinal necrosis",
            "Rhegmatogenous retinal detachment; macular hole formation",
            "Dry age-related macular degeneration; geographic atrophy of the RPE",
            "Open-angle glaucoma; progressive cupping of the optic nerve"
        ],
        "answer": 0,
        "exp": "The classic **'blood and thunder'** fundus appearance—consisting of diffuse retinal hemorrhages in all four quadrants, dilated/tortuous veins, optic disc edema, and cotton-wool spots—is pathognomonic for **Central Retinal Vein Occlusion (CRVO)**. CRVO is caused by thrombosis of the central retinal vein at or near the lamina cribrosa. It can be non-ischemic (milder) or **ischemic** (defined by >10 disc areas of capillary non-perfusion, often presenting with worse visual acuity and a positive RAPD). The ischemic retina releases large amounts of vascular endothelial growth factor (VEGF) in response to hypoxia. The primary, highly feared chronic complication of ischemic CRVO is **neovascular glaucoma** (classically occurring around **90 days** post-occlusion, hence the term '90-day glaucoma'), where new vessels grow on the iris (rubeosis iridis) and pull the iridocorneal angle shut, leading to severe, painful secondary closed-angle glaucoma. Patients must be monitored closely with gonioscopy and treated with anti-VEGF or panretinal photocoagulation (PRP) if neovascularization occurs."
    },

    # ─── 7. BRANCH RETINAL VEIN OCCLUSION (BRVO) ───
    {
        "q": "A {age}-old {gender} with long-standing hypertension presents with sudden, painless, partial vision loss in the {eye_side} eye of {duration}-day duration. Clinical examination reveals:<br>• Visual acuity: <b>{va_mid}</b><br>• Dilated funduscopy: <b>Flame-shaped and dot-blot hemorrhages, retinal edema, and cotton-wool spots restricted entirely to the superotemporal quadrant</b><br>• Slit-lamp examination: <b>Thickened, sclerotic retinal arteriole crossing over and compressing the underlying retinal vein at a bifurcation</b><br><br>What is the most likely diagnosis, and what is the primary mechanism of this condition?",
        "options": [
            "Branch retinal vein occlusion (BRVO) caused by arterial compression of the vein at an arteriovenous (AV) crossing site",
            "Branch retinal artery occlusion (BRAO) caused by a calcific embolus from the heart",
            "Rhegmatogenous retinal detachment caused by vitreous traction",
            "Diaper-pattern hypertensive retinopathy caused by severe arteriolosclerosis",
            "Chorioretinitis caused by Toxoplasma gondii infection"
        ],
        "answer": 0,
        "exp": "This patient is presenting with a **Branch Retinal Vein Occlusion (BRVO)**, which is characterized by hemorrhages, edema, and cotton-wool spots restricted to a single quadrant or sectoral distribution of the retina (most commonly the **superotemporal quadrant**). The primary pathophysiologic mechanism of BRVO is **compression of the retinal vein by an overlying sclerotic retinal arteriole at an arteriovenous (AV) crossing site**. Retinal arteries and veins share a common adventitial sheath at these crossings. In patients with chronic hypertension, arterial sclerosis and wall thickening cause the rigid artery to compress the thin-walled vein, leading to turbulent flow, endothelial damage, and localized thrombosis. The pooling of blood upstream of the occlusion causes capillary rupture (hemorrhages) and fluid leakage (macular edema). Management focuses on treating macular edema with intravitreal anti-VEGF agents or laser photocoagulation."
    },

    # ─── 8. TRACTIONAL RETINAL DETACHMENT (DIABETIC) ───
    {
        "q": "A {age}-old {gender} with a 25-year history of poorly controlled type 1 diabetes mellitus presents with progressive, painless loss of the {field_defect} visual field in the {eye_side} eye over the past {duration} weeks. The patient denies flashes of light or floaters. Clinical examination reveals:<br>• Visual acuity: <b>20/100 in the affected eye</b><br>• Dilated funduscopy: <b>Dense fibrous bands in the vitreous cavity firmly attached to the retina, causing a smooth, concave elevation of the temporal neurosensory retina; no retinal tears or breaks identified</b><br><br>What is the most likely diagnosis, and what is the appropriate management?",
        "options": [
            "Tractional retinal detachment; pars plana vitrectomy with membrane peeling",
            "Rhegmatogenous retinal detachment; urgent pneumatic retinopexy",
            "Exudative retinal detachment; systemic high-dose corticosteroids",
            "Central retinal artery occlusion; ocular massage and hyperbaric oxygen",
            "Proliferative diabetic retinopathy without detachment; observation only"
        ],
        "answer": 0,
        "exp": "This patient has a **tractional retinal detachment**, which is a classic complication of advanced **Proliferative Diabetic Retinopathy (PDR)**. Unlike rhegmatogenous retinal detachments (which are caused by a tear/break and present acutely with flashes and floaters), tractional detachments are **painless, slowly progressive**, and **lack flashes/floaters** because there is no sudden tear. They are caused by the contraction of fibrovascular membranes that grow on the retinal surface in response to chronic ischemia (VEGF-induced neovascularization). These contracting membranes pull the neurosensory retina away from the underlying retinal pigment epithelium (RPE). Funduscopic examination classically shows a smooth, concave elevation without a retinal break. The gold-standard treatment is a **pars plana vitrectomy** to remove the vitreous gel, followed by meticulous **membrane peeling** (delamination and segmenting of the fibrous bands) to release the traction and allow the retina to flatten."
    },

    # ─── 9. EXUDATIVE (SEROUS) RETINAL DETACHMENT ───
    {
        "q": "A {age}-old {gender} with a history of severe malignant hypertension presents to the clinic with progressive, painless blurring of vision and distortion of images (metamorphopsia) in both eyes. Slit-lamp and fundus examinations reveal:<br>• Visual acuity: <b>20/80 in both eyes</b><br>• Dilated funduscopy: <b>Smooth, dome-shaped elevation of the retina in the inferior quadrants without any visible retinal tears, breaks, or vitreoretinal traction bands</b><br>• Clinical test: <b>Subretinal fluid shifts position when the patient changes from an upright to a supine position (shifting fluid sign)</b><br><br>What is the classification of this retinal detachment, and what is the primary therapeutic approach?",
        "options": [
            "Exudative (serous) retinal detachment; aggressive management of the underlying systemic condition (e.g., blood pressure control)",
            "Rhegmatogenous retinal detachment; urgent scleral buckle surgery",
            "Tractional retinal detachment; immediate pars plana vitrectomy and laser photocoagulation",
            "Central retinal vein occlusion; intravitreal anti-VEGF injections",
            "Choroidal hemangioma; immediate transpupillary thermotherapy"
        ],
        "answer": 0,
        "exp": "This patient has an **exudative (serous) retinal detachment**, characterized by the accumulation of fluid in the subretinal space *without* a retinal tear/break (rhegmatogenous) or vitreoretinal traction (tractional). Exudative detachments occur due to diseases that disrupt the blood-retinal barrier (retinal vascular or choroidal systems), allowing fluid to leak under the retina. Causes include **severe malignant hypertension**, preeclampsia, inflammatory conditions (e.g., Vogt-Koyanagi-Harada disease, sympathetic ophthalmia), infectious choroiditis, or neoplasms (e.g., choroidal melanoma). A highly classic clinical feature is the **shifting fluid sign**, where subretinal fluid moves under the influence of gravity when the patient changes positions. Treatment is directed entirely at **managing the underlying systemic or inflammatory condition** (e.g., aggressively lowering blood pressure in malignant hypertension or systemic steroids for inflammatory etiologies), which resolves the fluid leakage and allows the retina to reattach spontaneously."
    },

    # ─── 10. AMAUROSIS FUGAX (TRANSIENT MONOCULAR BLINDNESS) ───
    {
        "q": "A {age}-old {gender} with a history of smoking and hypercholesterolemia presents to the clinic after experiencing a sudden, painless episode of complete vision loss in the {eye_side} eye that lasted {duration_mins} minutes before resolving completely. Clinical details include:<br>• Patient description: <b>Temporary dark shade or curtain that descended from the top of the eye to the bottom, remained for a few minutes, and then slowly rolled back up</b><br>• Ophthalmic examination: <b>Entirely normal, visual acuity 20/20 in both eyes, flat maculae, no active vascular emboli seen</b><br>• Neurologic examination: <b>No focal deficits</b><br><br>What is the most likely diagnosis, and what is the most appropriate next diagnostic step?",
        "options": [
            "Amaurosis fugax; urgent carotid duplex ultrasound and echocardiogram",
            "Rhegmatogenous retinal detachment; immediate dilated funduscopy and scleral buckle",
            "Central retinal vein occlusion; urgent optical coherence tomography (OCT)",
            "Temporal arteritis; immediate temporal artery biopsy and systemic high-dose steroids",
            "Migraine with aura; reassurance and outpatient neurology follow-up"
        ],
        "answer": 0,
        "exp": "The presentation of sudden, painless, transient monocular vision loss described as a **'curtain descending and ascending'** over the eye, which resolves completely within minutes, is the classic description of **amaurosis fugax** (transient monocular blindness). This is a form of transient ischemic attack (TIA) affecting the eye, most commonly caused by **microemboli (e.g., cholesterol Hollenhorst plaques)** that temporarily occlude the ophthalmic or central retinal artery before dissolving or passing. The most common source of these emboli is a stenotic **atherosclerotic plaque at the bifurcation of the ipsilateral common carotid artery**. Because amaurosis fugax is a highly predictive warning sign for an impending major cerebral stroke or permanent retinal infarction, the most urgent next step is to obtain a **carotid duplex ultrasound** to evaluate for carotid stenosis, along with an **echocardiogram** to rule out cardioembolic sources (e.g., atrial fibrillation, valvular disease)."
    },

    # ─── 11. WET AMD (CHOROIDAL NEOVASCULARIZATION) ───
    {
        "q": "A {age}-old {gender} with dry age-related macular degeneration (AMD) in both eyes presents with a {duration}-week history of sudden onset of visual distortion in their {eye_side} eye, reporting that straight lines appear wavy and bent (metamorphopsia). Clinical workup reveals:<br>• Visual acuity: <b>Dropped from a baseline of 20/40 to {va_low} in the affected eye</b><br>• Dilated funduscopy: <b>Grey-green subretinal membrane in the macula associated with a localized subretinal hemorrhage and lipid exudates</b><br>• Optical coherence tomography (OCT): <b>Subretinal fluid and choroidal neovascularization (CNV)</b><br><br>What is the most likely diagnosis, and what is the first-line treatment?",
        "options": [
            "Neovascular (wet) age-related macular degeneration (AMD); prompt intravitreal anti-VEGF injections (e.g., aflibercept or ranibizumab)",
            "Non-neovascular (dry) AMD; daily supplementation with high-dose AREDS2 vitamins",
            "Central retinal artery occlusion; ocular massage and carbogen therapy",
            "Rhegmatogenous retinal detachment; urgent pneumatic retinopexy",
            "Central serous chorioretinopathy; observation and lifestyle modification"
        ],
        "answer": 0,
        "exp": "This patient is presenting with the acute conversion of dry AMD to **neovascular (wet) AMD**, which is characterized by the sudden onset of **metamorphopsia** (distortion of straight lines, classically checked with an Amsler grid) and central vision loss. The underlying pathophysiology is **choroidal neovascularization (CNV)**, where abnormal new blood vessels sprout from the choriocapillaris, penetrate Bruch's membrane, and enter the sub-RPE or subretinal space. Because these vessels are fragile and lack tight junctions, they leak fluid, lipids, and blood, leading to subretinal hemorrhage and rapid disciform scarring if untreated. First-line therapy consists of **prompt intravitreal injections of anti-vascular endothelial growth factor (anti-VEGF)** agents (such as aflibercept, ranibizumab, or bevacizumab) to inhibit vessel growth, promote fluid absorption, and stabilize or improve vision."
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
            
        age = random.randint(45, 87)
        gp = random.choice(genders_pool)
        
        # Duration variations
        duration = str(random.randint(2, 9))
        duration_hrs = str(random.randint(1, 8))
        duration_mins = str(random.randint(5, 45))
        
        # Eye side
        eye_side = random.choice(["right", "left"])
        
        # Temporal artery indicators
        esr = str(random.randint(72, 115))
        crp = str(random.randint(35, 95))
        
        # visual acuities
        va_low = random.choice(["20/200", "20/400", "Count fingers (CF) at 3 feet", "Hand motion (HM) only", "Light perception (LP) only"])
        va_very_low = random.choice(["Count fingers (CF) at 1 foot", "Hand motion (HM) only", "Light perception (LP) only", "No light perception (NLP)"])
        va_mid = random.choice(["20/50", "20/70", "20/80", "20/100"])
        
        # Field defects
        field_defect = random.choice(["inferior", "superior", "nasal", "inferonasal"])
        
        pronoun_cap = gp['pronoun'].capitalize()
        
        q_text = t['q'].format(
            age=age, gender=gp['gender'], pronoun=gp['pronoun'], possessive=gp['possessive'],
            pronoun_cap=pronoun_cap, duration=duration, duration_hrs=duration_hrs, duration_mins=duration_mins,
            eye_side=eye_side, esr=esr, crp=crp, va_low=va_low, va_very_low=va_very_low, va_mid=va_mid,
            field_defect=field_defect
        )
        
        # Shuffle options
        opts = list(t['options'])
        correct_opt = opts[t['answer']]
        random.shuffle(opts)
        new_ans_idx = opts.index(correct_opt)
        
        # Escape characters for SQL
        q_escaped = q_text.replace("'", "''")
        opts_json_escaped = json.dumps(opts).replace("'", "''")
        exp_escaped = t['exp'].replace("'", "''")
        
        mcq_str = f"    (v_topic_id, '{q_escaped}', '{opts_json_escaped}'::jsonb, {new_ans_idx}, '{exp_escaped}')"
        
        if mcq_str not in mcqs:
            mcqs.append(mcq_str)
            counter += 1

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260519_optho_retinal_emergencies_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Ophthalmology: Retinal emergencies — detachment, CRAO, CRVO\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'optho-retinal-emergencies' LIMIT 1;\n")
    f.write("    IF v_topic_id IS NULL THEN\n")
    f.write("        RAISE EXCEPTION 'Topic optho-retinal-emergencies not found.';\n")
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

print(f"Successfully generated {len(mcqs)} MCQs and wrote them to {out_file}")
