import json
import random

topic_slug = 'optho-retinopathy'

templates = [
    # ─── TEMPLATE 1: SEVERE NPDR (4-2-1 RULE) ───
    {
        "q": "A {age}-old {gender} with a {years}-year history of poorly controlled type 2 diabetes mellitus presents for a routine annual diabetic eye examination. The patient has no active visual symptoms. Clinical findings include:<br>• Visual acuity: <b>20/20 in both eyes</b><br>• HbA1c: <b>{hba1c}%</b> (normal < 5.7%)<br>• Dilated funduscopy: <b>More than 20 intraretinal hemorrhages in all 4 quadrants; prominent venous beading in {beading_quads} quadrants; no neovascularization</b><br>• Optical coherence tomography (OCT): <b>Normal foveal contour, central subfield thickness {thickness} µm (normal < 250 µm)</b><br><br>What is the correct classification of this patient's retinopathy, and what is the most appropriate management?",
        "options": [
            "Severe non-proliferative diabetic retinopathy (NPDR); close monitoring (every 3-4 months) and strict systemic glycemic, blood pressure, and lipid control",
            "Moderate non-proliferative diabetic retinopathy (NPDR); routine 12-month follow-up without systemic modifications",
            "Proliferative diabetic retinopathy (PDR); immediate bilateral panretinal photocoagulation (PRP)",
            "Diabetic macular edema (DME); prompt intravitreal injection of an anti-VEGF agent",
            "Mild non-proliferative diabetic retinopathy (NPDR); clinical discharge from ophthalmology care"
        ],
        "answer": 0,
        "exp": "This patient meets the diagnostic criteria for **severe non-proliferative diabetic retinopathy (NPDR)** based on the classic **4-2-1 rule**: (1) >20 intraretinal hemorrhages in each of the 4 quadrants, OR (2) definite venous beading in >=2 quadrants, OR (3) prominent intraretinal microvascular abnormalities (IRMA) in >=1 quadrant. Here, the patient has >20 hemorrhages in all 4 quadrants and venous beading in >=2 quadrants. Crucially, there are *no signs of proliferative disease* (no neovascularization of the disc or elsewhere) and *no macular edema* (evidenced by 20/20 visual acuity and normal OCT central subfield thickness). For severe NPDR without macular edema, the standard management is **close monitoring** (every 3 to 4 months) alongside **aggressive control of systemic risk factors** (HbA1c, blood pressure, lipid profile) to prevent progression to proliferative diabetic retinopathy (PDR) or macular edema. Active treatments like PRP or anti-VEGF are not indicated at this stage."
    },

    # ─── TEMPLATE 2: PDR WITH VITREOUS HEMORRHAGE ───
    {
        "q": "A {age}-old {gender} with a {years}-year history of insulin-dependent type 1 diabetes mellitus presents with a sudden, painless onset of severe vision loss and dark, cobweb-like floaters in the {eye_side} eye that started {hours} hours ago. Clinical findings include:<br>• Visual acuity: <b>{va_bad}</b> (baseline 20/25)<br>• Slit-lamp examination: <b>No anterior segment injection or active cell and flare</b><br>• Dilated funduscopy: <b>Obscured view of the retina and optic disc with a dark, reddish haze in the vitreous cavity; a red-lake collection of blood inferiorly</b><br>• Contralateral eye: <b>Neovascularization of the optic disc (NVD) and peripheral fibrovascular membranes</b><br><br>What is the most likely diagnosis, and what is the initial management of this acute presentation?",
        "options": [
            "Vitreous hemorrhage secondary to proliferative diabetic retinopathy (PDR); conservative management with head-of-bed elevation, avoidance of strenuous activity, and close outpatient monitoring",
            "Rhegmatogenous retinal detachment; immediate pars plana vitrectomy within 2 hours",
            "Central retinal artery occlusion (CRAO); urgent anterior chamber paracentesis and ocular massage",
            "Neovascular glaucoma; immediate topical timolol and oral acetazolamide to prevent optic nerve damage",
            "Vitreous hemorrhage secondary to moderate NPDR; immediate panretinal photocoagulation (PRP) directly through the dense blood collection"
        ],
        "answer": 0,
        "exp": "A sudden, painless loss of vision accompanied by floaters or a 'red haze' in a patient with long-standing diabetes is highly suggestive of a **vitreous hemorrhage** secondary to **proliferative diabetic retinopathy (PDR)**. The contralateral eye findings (NVD, neovascularization elsewhere) confirm PDR as the underlying cause. In PDR, severe retinal ischemia causes the release of VEGF, prompting the growth of fragile new blood vessels (neovascularization) that easily rupture, spilling blood into the vitreous gel. The initial management for a fresh, non-clearing vitreous hemorrhage is conservative, including **head-of-bed elevation** (to allow gravity to settle the blood inferiorly and uncover the superior retina for laser therapy), avoidance of heavy lifting/strenuous activity, and close outpatient monitoring. Immediate vitrectomy is reserved for non-clearing hemorrhages lasting >1-3 months, dense tractional retinal detachment, or cases where the underlying pathology cannot be visualized and retinal detachment must be ruled out by ultrasonography (B-scan). Panretinal photocoagulation (PRP) cannot be performed directly through a dense vitreous hemorrhage due to laser beam blockage."
    },

    # ─── TEMPLATE 3: PDR WITH TRACTIONAL RETINAL DETACHMENT ───
    {
        "q": "A {age}-old {gender} with a {years}-year history of poorly controlled type 2 diabetes mellitus presents with a progressive, painless loss of the {field_loss} visual field in the {eye_side} eye over the past {weeks} weeks. The patient denies any flashes of light or sudden floaters. Clinical findings include:<br>• Visual acuity: <b>{va_bad}</b><br>• Dilated funduscopy: <b>Thick, white, fibrous bands in the vitreous cavity causing a smooth, concave elevation of the superior retina; no retinal tears or breaks identified</b><br>• Optical coherence tomography (OCT): <b>Vitreomacular traction with subretinal fluid accumulation and a detached outer neurosensory layer</b><br><br>What is the most likely diagnosis, and what is the gold-standard surgical management?",
        "options": [
            "Tractional retinal detachment secondary to proliferative diabetic retinopathy (PDR); pars plana vitrectomy with membrane peeling and release of vitreoretinal traction",
            "Rhegmatogenous retinal detachment; pneumatic retinopexy",
            "Exudative retinal detachment; high-dose systemic corticosteroids",
            "Severe non-proliferative diabetic retinopathy (NPDR); focal laser photocoagulation",
            "Posterior vitreous detachment (PVD); clinical reassurance and annual screening"
        ],
        "answer": 0,
        "exp": "The progressive, painless loss of visual field *without* flashes of light or sudden floaters in a diabetic patient, combined with funduscopic evidence of a **smooth, concave elevation** of the retina caused by contraction of fibrous membranes, is the classic description of a **tractional retinal detachment (TRD)**. TRD is a major complication of proliferative diabetic retinopathy (PDR). Chronic ischemia leads to neovascularization, which is accompanied by a scaffolding of fibrotic tissue. As these fibrovascular membranes mature and contract, they pull the neurosensory retina away from the underlying retinal pigment epithelium (RPE). Unlike rhegmatogenous detachments, there are no retinal breaks/tears. The gold-standard treatment is **pars plana vitrectomy** to remove the vitreous gel, followed by meticulous **membrane peeling** (delamination and segmenting of the fibrous bands) to release the mechanical traction, permitting the retina to flatten back onto the RPE."
    },

    # ─── TEMPLATE 4: CENTER-INVOLVED DME ───
    {
        "q": "A {age}-old {gender} with type 2 diabetes mellitus presents with a {duration}-month history of progressive, painless blurring of central vision in both eyes. The patient reports having difficulty reading small print and recognizing faces. Clinical findings include:<br>• Visual acuity: <b>{va_bad} in both eyes</b><br>• Dilated funduscopy: <b>Microaneurysms, dot-blot hemorrhages, and a ring of yellow, lipid-rich hard exudates in the macular region with apparent retinal thickening</b><br>• Optical coherence tomography (OCT): <b>Loss of the normal foveal depression with diffuse intraretinal cystic spaces and a central subfield thickness of {thickness} µm (normal < 250 µm)</b><br><br>What is the most likely diagnosis, and what is the established first-line treatment for this condition?",
        "options": [
            "Center-involved diabetic macular edema (DME); intravitreal anti-VEGF injections (e.g., aflibercept or ranibizumab)",
            "Center-involved diabetic macular edema (DME); immediate panretinal photocoagulation (PRP)",
            "Dry age-related macular degeneration (AMD); daily high-dose AREDS2 vitamin supplementation",
            "Non-center-involved DME; observation with no active treatment",
            "Center-involved diabetic macular edema (DME); intravitreal dexamethasone implants as the primary choice in all patients"
        ],
        "answer": 0,
        "exp": "This patient is presenting with **center-involved diabetic macular edema (DME)**, characterized by central vision loss, yellow lipid **hard exudates** in the macula, and diagnostic **Optical Coherence Tomography (OCT)** showing diffuse **intraretinal cystic spaces** and markedly increased central subfield thickness (>250 µm). DME results from a breakdown of the inner blood-retinal barrier (due to chronic hyperglycemia, VEGF, and inflammatory mediators), leading to vascular leakage into the extracellular space of the macular retina. Large multi-center clinical trials (such as those by the DRCR Retina Network) have established **intravitreal anti-VEGF therapy** (such as aflibercept, ranibizumab, or bevacizumab) as the gold-standard first-line treatment for center-involved DME, offering superior visual gains compared to laser photocoagulation. Focal/grid laser is typically reserved for non-center-involved DME. Corticosteroids (e.g., dexamethasone implants) are highly effective but are reserved as second-line therapy for patients who are pseudophakic or unresponsive to anti-VEGF, due to significant side effects (accelerated cataract progression and steroid-induced glaucoma/increased IOP)."
    },

    # ─── TEMPLATE 5: GRADE 3 HYPERTENSIVE RETINOPATHY ───
    {
        "q": "A {age}-old {gender} with a history of poorly controlled hypertension presents for a routine ophthalmic evaluation. The patient has no active visual complaints. Clinical findings include:<br>• Blood pressure: <b>{bp_sys}/{bp_dia} mmHg</b><br>• Visual acuity: <b>20/20 in both eyes</b><br>• Dilated funduscopy: <b>Diffuse retinal arteriolar narrowing, prominent arteriovenous (AV) nicking, multiple flame-shaped hemorrhages in the nerve fiber layer, several fluffy white cotton-wool spots, and a fan-shaped pattern of yellow hard exudates radiating from the fovea (macular star)</b><br>• Optic nerve examination: <b>Pink, sharp margins, no disc edema</b><br><br>According to the Keith-Wagener-Barker classification, what is the grade of this patient's hypertensive retinopathy, and what is the primary clinical management?",
        "options": [
            "Grade 3 hypertensive retinopathy; gradual outpatient control of systemic blood pressure and cardiovascular risk factors",
            "Grade 4 hypertensive retinopathy; immediate hospitalization for rapid intravenous antihypertensive therapy",
            "Grade 2 hypertensive retinopathy; initiation of intravitreal anti-VEGF therapy",
            "Grade 3 hypertensive retinopathy; urgent panretinal photocoagulation (PRP)",
            "Grade 1 hypertensive retinopathy; observation and lifestyle modifications only"
        ],
        "answer": 0,
        "exp": "The clinical findings of diffuse arteriolar narrowing and AV nicking (Grade 1 and 2 signs) *plus* **flame-shaped hemorrhages**, **cotton-wool spots** (microinfarcts of the nerve fiber layer), and **hard exudates in a macular star configuration** (Grade 3 signs), *without* optic disc swelling (Grade 4 sign), define **Grade 3 hypertensive retinopathy** under the Keith-Wagener-Barker classification system. Since visual acuity is preserved and there is no papilledema or end-organ damage indicating a hypertensive emergency, management centers on **gradual, outpatient control of systemic blood pressure** using oral antihypertensives (such as ACE inhibitors or calcium channel blockers) alongside lifestyle changes and cardiovascular risk reduction. Rapid, aggressive lowering of blood pressure is contraindicated in Grade 3 as it can cause optic nerve or cerebral hypoperfusion and stroke. No intraocular laser or injections are indicated for hypertensive retinopathy itself."
    },

    # ─── TEMPLATE 6: GRADE 4 HYPERTENSIVE RETINOPATHY (MALIGNANT EMERGENCY) ───
    {
        "q": "A {age}-old {gender} presents to the emergency department complaining of a severe, throbbing headache, chest tightness, and a {duration}-day history of progressive, bilateral blurry vision. Clinical findings include:<br>• Blood pressure: <b>{bp_sys}/{bp_dia} mmHg</b><br>• Visual acuity: <b>{va_bad} in both eyes</b><br>• Dilated funduscopy: <b>Severe, generalized arteriolar constriction ('silver wiring'), widespread flame-shaped hemorrhages, numerous cotton-wool spots, and bilateral optic disc swelling with blurred margins (papilledema)</b><br>• Renal function: <b>Serum creatinine {creatinine} mg/dL</b> (normal 0.6 - 1.2 mg/dL)<br><br>What is the grade of this patient's hypertensive retinopathy, and what is the immediate, most appropriate management?",
        "options": [
            "Grade 4 hypertensive retinopathy; immediate admission to an intensive care unit (ICU) for controlled, gradual reduction of mean arterial pressure (MAP) by no more than 20-25% in the first few hours using intravenous agents (e.g., clevidipine, nicardipine, or labetalol)",
            "Grade 4 hypertensive retinopathy; immediate, aggressive normalization of blood pressure to < 120/80 mmHg within 30 minutes using bolus intravenous hydralazine",
            "Grade 3 hypertensive retinopathy; outpatient oral blood pressure medication adjustment and 1-week follow-up",
            "Grade 4 hypertensive retinopathy; emergency bilateral lumbar puncture to relieve intracranial pressure",
            "Grade 4 hypertensive retinopathy; immediate bilateral panretinal photocoagulation (PRP) to prevent optic nerve atrophy"
        ],
        "answer": 0,
        "exp": "The combination of severe hypertensive changes (hemorrhages, cotton-wool spots) with **bilateral optic disc swelling (papilledema)** is the hallmark of **Grade 4 hypertensive retinopathy**. This is a hallmark of a **hypertensive emergency** (malignant hypertension), especially in the presence of acute end-organ damage (severe headache, acute kidney injury indicated by elevated creatinine). The immediate treatment is admission to the **ICU for controlled, gradual reduction of the mean arterial pressure (MAP)**. The goal is to lower the MAP by **no more than 20-25%** within the first 1-2 hours, and then safely toward 160/100 mmHg over the next 2-6 hours, using titratable intravenous agents (e.g., nicardipine, labetalol, nitroprusside). Rapid normalization of blood pressure (to normal levels like 120/80) is highly dangerous and contraindicated because chronic hypertension shifts the autoregulation curve of the brain and optic nerve; a precipitous drop in perfusion pressure can lead to ischemic stroke, optic nerve infarction (AION), or death."
    },

    # ─── TEMPLATE 7: HYPERTENSIVE CHOROIDOPATHY ───
    {
        "q": "A {age}-old pregnant {gender} at {weeks} weeks gestation presents with acute onset of severe headache, vomiting, and visual disturbances in both eyes. The patient is diagnosed with preeclampsia with severe features. Clinical findings include:<br>• Blood pressure: <b>{bp_sys}/{bp_dia} mmHg</b><br>• Dilated funduscopy: <b>Focal areas of yellowish-white discoloration at the level of the retinal pigment epithelium (RPE), alongside linear hyperpigmented streaks tracking along the course of the choroidal arteries</b><br>• Diagnosis: <b>Hypertensive choroidopathy</b><br><br>What do the focal spots and linear streaks represent pathophysiologically, and what is the prognosis for these lesions?",
        "options": [
            "Elschnig spots (RPE/choroidal infarcts) and Siegrist streaks (sclerotic choroidal vessels); they will resolve spontaneously or leave residual pigmentary changes once systemic blood pressure and preeclampsia are managed",
            "Drusen and choroidal neovascular membranes; they require immediate anti-VEGF injections to prevent permanent central blindness",
            "Roth spots and Hollenhorst plaques; they indicate high risk for a major embolic stroke and require immediate heparinization",
            "Cytomegalovirus retinitis; they require immediate intravenous ganciclovir therapy",
            "Elschnig spots and Siegrist streaks; they indicate permanent, irreversible choroidal tissue death with absolute loss of peripheral vision"
        ],
        "answer": 0,
        "exp": "In patients with acute, severe hypertension (such as severe preeclampsia/eclampsia or renal crisis), the choroidal vasculature is affected due to its rich sympathetic innervation and lack of autoregulation. Severe spasm of the choriocapillaris leads to **hypertensive choroidopathy**. **Elschnig spots** are small, yellowish-white lesions at the level of the RPE that represent focal infarcts of the choriocapillaris and overlying RPE; as they heal, they become hyperpigmented with a pale halo. **Siegrist streaks** are linear hyperpigmented lesions that follow the course of sclerotic choroidal arteries. These lesions indicate severe acute hypertensive damage, but their management is strictly systemic (control of blood pressure/delivery in preeclampsia). The ocular prognosis is generally excellent, as the lesions resolve or leave benign, asymptomatic pigmentary scars once systemic vascular stability is restored."
    },

    # ─── TEMPLATE 8: PANRETINAL PHOTOCOAGULATION (PRP) COUNSELING ───
    {
        "q": "A {age}-old {gender} with proliferative diabetic retinopathy (PDR) is scheduled to undergo bilateral panretinal photocoagulation (PRP). Clinical findings include:<br>• Visual acuity: <b>20/25 in both eyes</b><br>• Dilated funduscopy: <b>Extensive neovascularization of the optic disc (NVD) and neovascularization elsewhere (NVE); no macular edema</b><br><br>During pre-operative counseling, which of the following side-effects or visual alterations should be highlighted as a standard, expected consequence of successful PRP therapy?",
        "options": [
            "Decreased peripheral vision, reduced night vision (nyctalopia), and transiently blurred central vision",
            "Permanent complete loss of central vision with preserved peripheral and color vision",
            "Immediate development of mature cataracts and rhegmatogenous retinal detachment within 24 hours",
            "Improvement in dark adaptation and expansion of the peripheral visual field",
            "Zero visual changes or side-effects, as the laser is strictly restricted to non-functional tissues"
        ],
        "answer": 0,
        "exp": "**Panretinal photocoagulation (PRP)** is the gold-standard laser therapy for **proliferative diabetic retinopathy (PDR)**. By applying thousands of thermal laser burns to the ischemic peripheral retina, PRP destroys the hypoxic photoreceptors that are producing high levels of VEGF. This reduces the overall oxygen demand of the outer retina, leading to regression of abnormal new vessels (NVD, NVE) and preventing devastating complications like vitreous hemorrhage or tractional retinal detachment. Because PRP ablation destroys peripheral rod photoreceptors, patients must be counseled on the expected side-effects: **loss of peripheral vision**, **impaired night vision (nyctalopia)**, and **transient mild blurring of central vision** (due to transient macular edema). Central visual acuity is preserved or protected in the long run by sacrificing the ischemic periphery."
    },

    # ─── TEMPLATE 9: DEXAMETHASONE IMPLANT MONITORING ───
    {
        "q": "A {age}-old {gender} with a history of chronic diabetic macular edema (DME) in the left eye, which has been refractory to multiple intravitreal aflibercept injections, is transitioned to an intravitreal dexamethasone implant (Ozurdex). Over the next {duration} months, which two key ocular parameters must be monitored closely to detect common, expected side-effects of this therapy?",
        "options": [
            "Intraocular pressure (for steroid-induced glaucoma) and lens clarity (for cataract progression)",
            "Central retinal artery perfusion and optic nerve color",
            "Corneal endothelial cell density and tear film break-up time",
            "Bilateral pupil reactivity and color vision",
            "Conjunctival goblet cell density and preauricular lymph node size"
        ],
        "answer": 0,
        "exp": "**Intravitreal corticosteroid implants** (such as dexamethasone or fluocinolone acetonide) are highly effective second-line therapies for diabetic macular edema (DME), especially in vitrectomized eyes or eyes refractory to anti-VEGF agents. However, corticosteroids in the eye have well-documented side-effects: they decrease aqueous outflow facility through the trabecular meshwork, leading to an **elevation in intraocular pressure (IOP)** (steroid-induced glaucoma), and they alter metabolic processes in the crystalline lens, accelerating **posterior subcapsular cataract** formation. Therefore, monitoring IOP (with tonometry) and lens clarity (with slit-lamp examination) at regular intervals is mandatory."
    },

    # ─── TEMPLATE 10: NON-CENTER-INVOLVED DME DECISIONS ───
    {
        "q": "A {age}-old {gender} with type 2 diabetes mellitus is referred after a dilated exam reveals macular changes. Clinical findings include:<br>• Visual acuity: <b>20/20 in the right eye</b><br>• Dilated funduscopy: <b>Hard exudates and retinal thickening located 800 µm from the center of the fovea</b><br>• Optical coherence tomography (OCT): <b>Retinal thickening in the temporal macula; the central 1 mm subfield is completely normal (thickness {thickness} µm)</b><br><br>What is the correct classification and the most appropriate management?",
        "options": [
            "Non-center-involved diabetic macular edema (DME); observation and tight systemic glycemic/blood pressure control, or focal laser photocoagulation to the leaking microaneurysm",
            "Center-involved diabetic macular edema (DME); immediate intravitreal anti-VEGF injection",
            "Severe non-proliferative diabetic retinopathy (NPDR); urgent panretinal photocoagulation (PRP)",
            "Non-center-involved DME; immediate pars plana vitrectomy with internal limiting membrane peeling",
            "Clinically insignificant macular edema; discharge from the clinic with no further appointments"
        ],
        "answer": 0,
        "exp": "This patient has **non-center-involved diabetic macular edema (DME)**, which is defined as retinal thickening or hard exudates in the macula that do *not* involve the central 1 mm subfield (center of the fovea). Because the center of the macula is unaffected, the patient's visual acuity remains excellent (20/20). For non-center-involved DME with preserved vision, first-line management is conservative, focusing on **observation** and **strict systemic glycemic, blood pressure, and lipid control**. Alternatively, if there is a discrete, focal leak away from the foveal avascular zone (FAZ), **focal laser photocoagulation** can be applied to the leaking microaneurysm to resolve the edema. Immediate intravitreal anti-VEGF is not indicated unless the edema progresses to involve the center of the fovea or causes visual acuity loss."
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
            
        age = random.randint(35, 87)
        gp = random.choice(genders_pool)
        
        # Clinical parameters
        years = random.randint(8, 30)
        hba1c = round(random.uniform(7.8, 12.4), 1)
        beading_quads = random.randint(2, 4)
        thickness = random.randint(180, 240)
        
        eye_side = random.choice(["right", "left"])
        hours = random.randint(3, 48)
        va_bad = random.choice(["20/200", "20/400", "Count fingers (CF) at 3 feet", "Hand motion (HM) only", "Light perception (LP) only"])
        
        field_loss = random.choice(["inferior", "superior", "nasal", "temporal"])
        weeks = random.randint(2, 8)
        duration = random.randint(2, 6)
        
        bp_sys = random.randint(165, 230)
        bp_dia = random.randint(102, 132)
        creatinine = round(random.uniform(1.8, 4.2), 1)
        
        # Hydration values for choroidopathy
        weeks_gest = random.randint(28, 38)
        
        # Formatting values
        q_text = t['q'].format(
            age=age, gender=gp['gender'], pronoun=gp['pronoun'], possessive=gp['possessive'],
            years=years, hba1c=hba1c, beading_quads=beading_quads, thickness=thickness,
            eye_side=eye_side, hours=hours, va_bad=va_bad, field_loss=field_loss,
            weeks=weeks, duration=duration, bp_sys=bp_sys, bp_dia=bp_dia,
            creatinine=creatinine, weeks_gest=weeks_gest
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

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260519_optho_retinopathy_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Ophthalmology: Diabetic & hypertensive retinopathy\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'optho-retinopathy' LIMIT 1;\n")
    f.write("    IF v_topic_id IS NULL THEN\n")
    f.write(f"        RAISE EXCEPTION 'Topic optho-retinopathy not found.';\n")
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
