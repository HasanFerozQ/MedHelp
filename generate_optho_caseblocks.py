import json
import random

# Topic Slug mappings
topics_config = {
    "glaucoma": {"slug": "optho-glaucoma", "filename": "ophthalmology_glaucoma_caseblocks_50.sql", "title_prefix": "Glaucoma"},
    "retinal_emergencies": {"slug": "optho-retinal-emergencies", "filename": "ophthalmology_retinal_emergencies_caseblocks_50.sql", "title_prefix": "Retinal Emergency"},
    "retinopathy": {"slug": "optho-retinopathy", "filename": "ophthalmology_retinopathy_caseblocks_50.sql", "title_prefix": "Retinopathy"},
    "cataract": {"slug": "optho-cataract", "filename": "ophthalmology_cataract_caseblocks_50.sql", "title_prefix": "Cataract & Lens"},
    "trauma": {"slug": "optho-trauma", "filename": "ophthalmology_trauma_caseblocks_50.sql", "title_prefix": "Ocular Trauma"}
}

genders_pool = [
    {"gender": "female", "pronoun": "she", "possessive": "her", "pronoun_cap": "She", "possessive_cap": "Her"},
    {"gender": "male", "pronoun": "he", "possessive": "his", "pronoun_cap": "He", "possessive_cap": "His"},
]

templates = {}

# =========================================================================
# 1. GLAUCOMA TEMPLATES
# =========================================================================
templates["glaucoma"] = [
    # Template 1: Acute Angle-Closure Glaucoma
    {
        "title": "The Halos at Night",
        "age_range": (50, 75),
        "va_affected": "20/80",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old {gender} presents to the emergency department with sudden, severe pain in {possessive} {eye_side} eye, accompanied by a severe headache, nausea, and blurry vision with rainbow-colored halos around lights. {pronoun_cap} reports the symptoms began after sitting in a dark movie theater.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected} (no improvement with pinhole); contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Marked conjunctival injection with ciliary flush. The cornea appears steamy and cloudy. The pupil is fixed, mid-dilated measuring {pupil_size} mm, and non-reactive to light. The globe is rock-hard to palpation. Intraocular pressure (IOP) is {iop} mmHg. OS gonioscopy shows a completely closed angle."
        ),
        "questions": [
            {
                "q": "Which of the following is the most appropriate next step in the immediate management of this patient?",
                "options": [
                    "Administer topical timolol, pilocarpine, and apraclonidine, combined with systemic intravenous acetazolamide",
                    "Apply a tight pressure patch and schedule outpatient ophthalmology follow-up in 48 hours",
                    "Perform immediate surgical trabeculectomy in the emergency department",
                    "Initiate topical prednisolone acetate 1% drops every 15 minutes as monotherapy",
                    "Prescribe oral ciprofloxacin 750 mg and apply topical tobramycin drops"
                ],
                "answer": 0,
                "exp": "This patient presents with Acute Angle-Closure Glaucoma (AACG), an ocular emergency. Immediate medical management is directed at reducing intraocular pressure (IOP) and opening the angle. This is achieved by combining topical drops that decrease aqueous humor production (beta-blocker: timolol; alpha-2 agonist: apraclonidine) or increase outflow (miotic: pilocarpine, once IOP decreases below 40 mmHg and sphincter ischemia resolves) with systemic carbonic anhydrase inhibitors (IV acetazolamide). Pressure patching is contraindicated, steroids alone are insufficient, and laser peripheral iridotomy (LPI) is the definitive, rather than immediate bedside, treatment once the cornea clears."
            },
            {
                "q": "What is the primary anatomical mechanism driving this condition in hyperopic patients?",
                "options": [
                    "Pupillary block, where contact between the iris and lens prevents aqueous flow, forcing the peripheral iris forward to occlude the trabecular meshwork",
                    "Hypersecretion of aqueous humor by the ciliary body processes due to autonomic dysfunction",
                    "Deposition of abnormal fibrillar basement membrane material in the trabecular meshwork",
                    "Contraction of a fibrovascular membrane over the anterior chamber angle stimulated by retinal ischemia",
                    "Congenital dysgenesis of the trabecular meshwork and iris insertion"
                ],
                "answer": 0,
                "exp": "The primary mechanism of AACG is **pupillary block**. In anatomically predisposed eyes (typically hyperopes with short axial lengths and shallow anterior chambers), the iris comes into contact with the lens, blocking the normal flow of aqueous from the posterior chamber to the anterior chamber. This causes a pressure build-up in the posterior chamber, which pushes the peripheral iris forward (iris bombé) into contact with the trabecular meshwork, completely blocking aqueous drainage."
            },
            {
                "q": "Which of the following classes of systemic or topical medications is strictly CONTRAINDICATED in patients with narrow or closed anterior chamber angles?",
                "options": [
                    "Sympathomimetics and anticholinergics (mydriatics)",
                    "Beta-adrenergic antagonists (beta-blockers)",
                    "Carbonic anhydrase inhibitors",
                    "Prostaglandin analogs",
                    "Osmotic diuretics"
                ],
                "answer": 0,
                "exp": "Mydriatics (both anticholinergics like atropine/tropicamide and sympathomimetics like epinephrine/phenylephrine) cause pupillary dilation. In patients with narrow angles, pupillary dilation causes the iris to bunch up in the angle, which can trigger acute angle closure. Therefore, these drugs are strictly contraindicated in patients with untreated narrow angles."
            }
        ]
    },
    # Template 2: Primary Open-Angle Glaucoma
    {
        "title": "The Slow Loss of Peripheral Vision",
        "age_range": (60, 85),
        "va_affected": "20/30",
        "va_unaffected": "20/25",
        "scenario": (
            "A {age}-year-old {gender} presents for a routine eye exam. {pronoun_cap} denies any eye pain, redness, or sudden vision changes, but admits that {pronoun} feels {pronoun} has been bumping into objects more frequently and has difficulty driving at night.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** OD: {va_affected}; OS: {va_unaffected}\n"
            "*   **Ocular Examination:** Bilateral clear corneas. Anterior chambers are deep and quiet. Gonioscopy shows open angles bilaterally. Slit-lamp fundus exam reveals significant optic nerve cupping, with a cup-to-disc ratio (CDR) of {cdr} in the right eye and {cdr_other} in the left eye, along with neuroretinal rim thinning and nasalization of the disc vessels. Intraocular pressure (IOP) is {iop} mmHg bilaterally."
        ),
        "questions": [
            {
                "q": "Which of the following is the most appropriate first-line pharmacotherapy for this patient's condition?",
                "options": [
                    "Topical prostaglandin analogs (e.g., latanoprost)",
                    "Topical parasympathomimetics (e.g., pilocarpine)",
                    "Oral carbonic anhydrase inhibitors (e.g., acetazolamide)",
                    "Topical non-selective beta-blockers (e.g., timolol) in a patient with severe asthma",
                    "Systemic hyperosmotic agents (e.g., mannitol)"
                ],
                "answer": 0,
                "exp": "This patient has Primary Open-Angle Glaucoma (POAG). First-line medical therapy typically consists of **topical prostaglandin analogs** (e.g., latanoprost, bimatoprost) because they are highly effective, have a once-daily dosing regimen, and have a favorable systemic safety profile compared to beta-blockers (which are contraindicated in asthma/COPD)."
            },
            {
                "q": "What is the primary site of increased resistance to aqueous humor outflow in Primary Open-Angle Glaucoma?",
                "options": [
                    "Trabecular meshwork (specifically the juxtacanalicular tissue) and Schlemm's canal",
                    "The pupillary aperture between the iris and lens",
                    "The uveoscleral pathway through the ciliary muscle",
                    "The endothelial cell junctions of the episcleral veins",
                    "The posterior chamber ciliary body epithelial cells"
                ],
                "answer": 0,
                "exp": "In POAG, the primary site of increased resistance to aqueous humor drainage is the **trabecular meshwork**, particularly the **juxtacanalicular tissue** and the inner wall of Schlemm's canal. This leads to a gradual elevation of IOP, which causes mechanical and ischemic damage to the retinal ganglion cell axons at the optic nerve head."
            },
            {
                "q": "What is the classic visual field defect pattern initially seen in patients with progressive open-angle glaucoma?",
                "options": [
                    "Arcuate (Bjerrum) scotoma and nasal steps, sparing central vision until late stages",
                    "Bitemporal hemianopsia, starting superiorly",
                    "Homonymous hemianopsia involving the macula",
                    "Central scotoma with normal peripheral visual fields",
                    "Binasal hemianopsia sparing the temporal fields"
                ],
                "answer": 0,
                "exp": "Glaucoma characteristically spares the central macula fibers until the very late stages of the disease. The earliest visual field defects are typically located in the mid-periphery and follow the pattern of the retinal nerve fiber layer arching around the macula. This manifests as **arcuate scotomas** (Bjerrum scotomas) and **nasal steps**."
            }
        ]
    },
    # Template 3: Normal-Tension Glaucoma
    {
        "title": "The Cupped Disc with Normal Pressures",
        "age_range": (55, 80),
        "va_affected": "20/25",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old {gender} with a history of severe migraines and Raynaud's phenomenon presents for a comprehensive eye evaluation. {possessive_cap} intraocular pressures (IOP) have historically been normal, measuring {iop} mmHg today.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** Bilateral 20/20\n"
            "*   **Ocular Examination:** Anterior chamber angles are open (Grade 4 bilaterally). Optic nerve head examination shows a cup-to-disc ratio of {cdr} OD and {cdr_other} OS, with significant thinning of the inferior neuroretinal rim. A small, linear splinter-like hemorrhage (Drance hemorrhage) is visible at the inferior border of the right optic disc. Automated visual field testing shows a superior arcuate defect in the right eye."
        ),
        "questions": [
            {
                "q": "Which of the following is the most likely diagnosis?",
                "options": [
                    "Normal-tension glaucoma",
                    "Primary open-angle glaucoma",
                    "Ocular hypertension",
                    "Anterior ischemic optic neuropathy",
                    "Optic neuritis"
                ],
                "answer": 0,
                "exp": "This patient has **Normal-Tension Glaucoma (NTG)**, a subtype of POAG. NTG is characterized by: (1) progressive optic nerve cupping and visual field defects, (2) open angles, and (3) **IOP consistently <= 21 mmHg**. Splinter-like **Drance hemorrhages** at the optic disc margin are highly classic for NTG, as is an association with vasospastic disorders like migraines and Raynaud's phenomenon."
            },
            {
                "q": "Which factor is thought to play a larger role in the pathogenesis of Normal-Tension Glaucoma compared to high-tension POAG?",
                "options": [
                    "Vascular dysregulation, nocturnal hypotension, and poor optic nerve head perfusion",
                    "Trabecular meshwork cellular hypertrophy and sclerosis",
                    "Aqueous humor hypersecretion due to high sympathetic tone",
                    "Mechanical compression of the optic nerve by narrow angles",
                    "Primary autoimmune destruction of the scleral spur"
                ],
                "answer": 0,
                "exp": "While elevated IOP is the main driver in POAG, **vascular dysregulation, optic nerve head ischemia, and nocturnal systemic hypotension** are major pathophysiological contributors in NTG. Patients have a higher prevalence of vasospastic diseases (migraines, Raynaud's) and often experience nighttime blood pressure drops that compromise optic nerve perfusion pressure."
            },
            {
                "q": "What is the recommended target reduction in intraocular pressure for patients with confirmed progression of Normal-Tension Glaucoma?",
                "options": [
                    "At least a 30% reduction from baseline IOP",
                    "Maintaining IOP below 10 mmHg with systemic medications only",
                    "No IOP lowering is required because IOP is already normal",
                    "A 10% reduction using topical steroids to reduce inflammation",
                    "Immediate bilateral trabeculectomy to reach an IOP of 0 mmHg"
                ],
                "answer": 0,
                "exp": "The Collaborative Normal Tension Glaucoma Study (CNTGS) demonstrated that lowering IOP by **at least 30%** from baseline significantly slows the rate of visual field progression in NTG, confirming that even though IOP is in the \"normal\" range, it is still too high for the compromised optic nerves of these patients."
            }
        ]
    },
    # Template 4: Neovascular Glaucoma
    {
        "title": "The Complication of Retinal Ischemia",
        "age_range": (55, 80),
        "va_affected": "20/400",
        "va_unaffected": "20/30",
        "scenario": (
            "A {age}-year-old {gender} with a 20-year history of poorly controlled type 2 diabetes presents with acute, severe pain, redness, and profound vision loss in the {eye_side} eye for 3 days. {pronoun_cap} has a history of proliferative diabetic retinopathy but has missed recent appointments.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Severe conjunctival injection. The cornea is hazy and edematous. Slit-lamp exam reveals multiple, tiny, abnormal looping vessels along the pupillary border (rubeosis iridis) and crossing the trabecular meshwork in the angle. IOP is {iop} mmHg."
        ),
        "questions": [
            {
                "q": "What is the primary underlying driver of abnormal blood vessel growth in this patient's anterior segment?",
                "options": [
                    "Retinal ischemia leading to the release of Vascular Endothelial Growth Factor (VEGF)",
                    "Chronic bacterial infection of the vitreous cavity",
                    "Mechanical friction of the posterior iris against the lens",
                    "High systemic blood glucose directly stimulating iris endothelial cells",
                    "A primary mutation in the fibrillin-1 gene"
                ],
                "answer": 0,
                "exp": "This is **Neovascular Glaucoma (NVG)**. The underlying cause is severe, widespread **retinal ischemia** (most commonly from proliferative diabetic retinopathy or central retinal vein occlusion). Ischemic retinal tissue releases **VEGF**, which diffuses forward into the anterior chamber, stimulating the growth of abnormal new vessels on the iris (rubeosis iridis) and in the anterior chamber angle."
            },
            {
                "q": "What is the definitive therapy to address the underlying cause of this patient's neovascularization?",
                "options": [
                    "Panretinal Photocoagulation (PRP) of the retina and intravitreal anti-VEGF injection",
                    "Urgent laser peripheral iridotomy",
                    "Topical hourly corticosteroids alone",
                    "Surgical iridectomy and vitrectomy",
                    "Intravenous administration of high-dose corticosteroids"
                ],
                "answer": 0,
                "exp": "The definitive treatment to stop the drive for neovascularization is **Panretinal Photocoagulation (PRP)** of the ischemic retina. PRP destroys peripheral retina, reducing oxygen demand and subsequent VEGF release. In the acute phase, **intravitreal anti-VEGF injections** are highly effective in causing rapid regression of the iris and angle vessels, helping to stabilize IOP before PRP can be completed."
            },
            {
                "q": "How does neovascularization in the angle eventually lead to irreversible, closed-angle glaucoma?",
                "options": [
                    "The fibrovascular membrane contracts, pulling the peripheral iris over the trabecular meshwork (synechial angle closure)",
                    "The abnormal vessels mechanically plug Schlemm's canal from the inside",
                    "The vessels bleed, causing a massive hyphema that clots and blocks the trabecular meshwork",
                    "Inflammatory macrophages engulfing the vessels clog the drainage system",
                    "The vessels cause the lens to swell and push forward, occluding the pupil"
                ],
                "answer": 0,
                "exp": "Initially, the neovascular membrane mechanically blocks the trabecular meshwork (open-angle stage). However, the **fibrovascular membrane eventually contracts**, pulling the peripheral iris forward over the trabecular meshwork. This leads to **synechial angle closure**, which is irreversible and requires surgical drainage procedures (like a glaucoma drainage device or trabeculectomy) if medical therapy fails."
            }
        ]
    },
    # Template 5: Pseudoexfoliation Glaucoma
    {
        "title": "The Dandruff-like Deposits",
        "age_range": (65, 85),
        "va_affected": "20/60",
        "va_unaffected": "20/25",
        "scenario": (
            "A {age}-year-old {gender} presents with progressive, painless vision loss in {possessive} {eye_side} eye. {pronoun_cap} has no history of eye trauma or surgery.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Slit-lamp exam reveals clear cornea. The anterior chamber is deep. On the anterior lens capsule, there is a classic three-zone pattern of white, flaky, amyloid-like material (a central disc, a clear zone, and a peripheral band). Similar dandruff-like material is visible at the pupillary margin. Gonioscopy shows a heavily pigmented trabecular meshwork with a dark line of pigment anterior to Schwalbe's line (Sampaolesi line). IOP is {iop} mmHg OD and 16 mmHg OS."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis?",
                "options": [
                    "Pseudoexfoliation glaucoma",
                    "Pigmentary glaucoma",
                    "Phacolytic glaucoma",
                    "Primary open-angle glaucoma",
                    "Uveitic glaucoma"
                ],
                "answer": 0,
                "exp": "This is **Pseudoexfoliation Glaucoma (PXG)**. It is characterized by the deposition of white, flaky, fibrillar extracellular material on the anterior lens capsule, pupillary border, and trabecular meshwork. Classic findings include a **three-zone pattern on the lens capsule** and a **Sampaolesi line** (pigment band at Schwalbe's line) on gonioscopy. It is typically unilateral or highly asymmetric and carries a higher risk of optic nerve damage due to large, volatile IOP spikes."
            },
            {
                "q": "During future cataract extraction surgery, what specific anatomical risk must the surgeon be prepared for in this patient?",
                "options": [
                    "Zonular weakness and laxity, leading to lens subluxation or vitreous loss",
                    "Rapid corneal endothelial cell decompensation",
                    "Severe, intraoperative retrobulbar hemorrhage",
                    "Failure of the pupil to constrict intraoperatively",
                    "An increased risk of postoperative retinal detachment"
                ],
                "answer": 0,
                "exp": "Pseudoexfoliation material deposits on and damages the **lens zonules**, leading to **zonular weakness, laxity, and dialysis**. During cataract surgery, this makes the lens unstable, significantly increasing the risk of lens subluxation, posterior capsular rupture, and vitreous loss."
            },
            {
                "q": "What is the systemic nature of Pseudoexfoliation syndrome?",
                "options": [
                    "A generalized basement membrane disorder with abnormal elastic fiber production throughout the body",
                    "An localized ocular inflammatory reaction to lens proteins",
                    "An autosomal recessive lysosomal storage disease",
                    "An autoimmune vasculitis associated with HLA-B27",
                    "A metastatic neuroendocrine tumor releasing serotonin"
                ],
                "answer": 0,
                "exp": "Pseudoexfoliation syndrome is a **systemic basement membrane disorder** characterized by the widespread production and progressive accumulation of abnormal microfibrillar, proteinaceous material. This material has been detected in the heart, lungs, liver, kidneys, and blood vessels, and is associated with an increased risk of cardiovascular and cerebrovascular disease."
            }
        ]
    },
    # Template 6: Pigmentary Glaucoma
    {
        "title": "The Exercise-Induced Blur",
        "age_range": (25, 45),
        "va_affected": "20/40",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old myopic {gender} presents with a history of recurrent episodes of blurry vision and rainbow halos in the {eye_side} eye, typically occurring after intensive exercise or running. IOP in the affected eye is {iop} mmHg today.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Slit-lamp exam shows a clear cornea with a vertical band of brown pigment on the corneal endothelium (Krukenberg spindle). The anterior chamber is very deep. Transillumination of the iris reveals multiple mid-peripheral spoke-like defects. Gonioscopy shows a wide-open angle with a dense, homogeneous 360-degree dark brown band in the trabecular meshwork."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis?",
                "options": [
                    "Pigmentary glaucoma",
                    "Pseudoexfoliation glaucoma",
                    "Phacolytic glaucoma",
                    "Primary open-angle glaucoma",
                    "Anterior uveitis"
                ],
                "answer": 0,
                "exp": "This is **Pigmentary Glaucoma**, which typically affects young, myopic males. It is characterized by: (1) a deep anterior chamber, (2) pigment deposits on the corneal endothelium in a vertical line (**Krukenberg spindle**), (3) mid-peripheral spoke-like **iris transillumination defects**, and (4) heavy, dark brown pigment in the trabecular meshwork. IOP spikes can be triggered by exercise or pupillary movement, which rubs pigment off the iris."
            },
            {
                "q": "What is the mechanical cause of pigment shedding in this condition?",
                "options": [
                    "Friction between the posterior iris pigment epithelium and the anterior lens zonular fibers",
                    "Autoimmune destruction of the iris melanocytes",
                    "Primary degeneration of the corneal endothelial cells",
                    "Mechanical trauma to the iris from a loose intraocular lens",
                    "A congenital failure of the iris stroma to fuse"
                ],
                "answer": 0,
                "exp": "Pigment dispersion occurs due to a **mechanical friction** between the **posterior iris pigment epithelium** and the **anterior lens zonular fibers**. In myopic eyes with a backward-bowed iris (concave iris configuration), the movement of the iris against the zonules rubs off pigment granules, which are then swept by aqueous currents into the anterior chamber."
            },
            {
                "q": "Why does exercise or pupillary dilation trigger an acute spike in intraocular pressure in these patients?",
                "options": [
                    "Physical movement or rapid pupillary changes cause a sudden shower of pigment to block the trabecular meshwork",
                    "Exercise increases systemic blood pressure, which directly elevates aqueous humor production",
                    "Mydriasis causes pupillary block and acute angle closure in these deep chambers",
                    "Lactic acid accumulation in the cornea causes rapid stromal swelling",
                    "Sympathetic stimulation causes swelling of the ciliary body"
                ],
                "answer": 0,
                "exp": "Exercise or pupillary dilation (mydriasis) causes the iris to rub more vigorously against the zonules, releasing a **sudden shower of pigment granules**. These granules travel into the anterior chamber and physically clog the trabecular meshwork, leading to an acute, transient spike in IOP, presenting as blurry vision and halos from corneal edema."
            }
        ]
    },
    # Template 7: Phacolytic Glaucoma
    {
        "title": "The Hypermature Cataract",
        "age_range": (70, 90),
        "va_affected": "Hand Motion",
        "va_unaffected": "20/40",
        "scenario": (
            "A {age}-year-old {gender} from a rural area presents with acute onset of severe, aching pain, redness, and worsening vision in the {eye_side} eye. {pronoun_cap} has had a dense cataract and very poor vision in that eye for over {duration} years, but did not seek surgery.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Marked conjunctival injection. Cornea is edematous with microcystic changes. Slit-lamp exam shows a completely white, opaque lens with a wrinkled anterior capsule. The anterior chamber is deep but shows 3+ inflammatory cell and flare, and floating white clumps. No keratic precipitates (KPs) are visible on the endothelium. IOP is {iop} mmHg."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis?",
                "options": [
                    "Phacolytic glaucoma",
                    "Acute angle-closure glaucoma",
                    "Phacoanaphylactic endophthalmitis",
                    "Neovascular glaucoma",
                    "HLA-B27 associated anterior uveitis"
                ],
                "answer": 0,
                "exp": "This is **Phacolytic Glaucoma**, a form of lens-induced open-angle glaucoma. It occurs in eyes with a **hypermature or mature cataract**. The lens cortex liquefies and high-molecular-weight lens proteins leak through microscopic pores in the degenerated, **wrinkled anterior lens capsule**. These proteins, along with protein-engulfed macrophages, physically obstruct the trabecular meshwork, causing a rapid, severe rise in IOP."
            },
            {
                "q": "What is the definitive management of this patient's condition?",
                "options": [
                    "Lower IOP medically using topical drops and systemic acetazolamide, followed by urgent cataract extraction",
                    "Immediate laser peripheral iridotomy",
                    "Intravitreal injection of broad-spectrum antibiotics and urgent vitrectomy",
                    "Chronic topical corticosteroid therapy and lifetime Timolol drops",
                    "Surgical trabeculectomy with the cataract left in place"
                ],
                "answer": 0,
                "exp": "The definitive treatment is **cataract extraction** (removal of the leaking lens). Before surgery, IOP must be aggressively lowered medically (using topical beta-blockers, alpha-agonists, and systemic acetazolamide/mannitol) and corneal edema reduced. Once the IOP is controlled and the eye is stabilized, urgent cataract surgery is performed to remove the source of the protein."
            },
            {
                "q": "Which slit-lamp finding helps differentiate Phacolytic Glaucoma from infectious or autoimmune anterior uveitis?",
                "options": [
                    "The absence of keratic precipitates (KPs) on the corneal endothelium despite heavy anterior chamber cell/flare",
                    "The presence of a shallow anterior chamber and pupillary block",
                    "The presence of iris transillumination defects in the mid-periphery",
                    "A Sampaolesi line in the anterior chamber angle on gonioscopy",
                    "An elevated, wrinkled grey retina with a horseshoe-shaped tear"
                ],
                "answer": 0,
                "exp": "Phacolytic glaucoma is an open-angle glaucoma presenting with high IOP and cell/flare. A key clinical differentiator is the **absence of keratic precipitates (KPs)** on the corneal endothelium, despite what appears to be severe \"inflammatory\" cells in the anterior chamber. The \"cells\" are actually protein aggregates and macrophages, rather than primary inflammatory cells adhering to the endothelium."
            }
        ]
    },
    # Template 8: Congenital Glaucoma
    {
        "title": "The Clouded Large Eyes",
        "age_range": (0, 1), # Infant
        "va_affected": "Poor fix and follow",
        "va_unaffected": "Normal",
        "scenario": (
            "A {age}-month-old infant is brought to the ophthalmology clinic by {possessive} mother due to constant tearing (epiphora), extreme sensitivity to light (photophobia), and frequent squeezing of the eyelids (blepharospasm) in both eyes. The mother notes the baby's eyes look unusually large.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Stable infant.\n"
            "*   **Visual Acuity:** Poor fixation and following targets in both eyes.\n"
            "*   **Ocular Examination (OU):** Severe corneal clouding and edema. The corneal diameters are enlarged, measuring {corneal_diam} mm (normal infant diameter is <10.5 mm). Handheld slit-lamp exam under anesthesia reveals horizontal, linear breaks in Descemet's membrane (Haab's striae). IOP is {iop} mmHg bilaterally."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the primary treatment?",
                "options": [
                    "Primary congenital glaucoma; surgical intervention (e.g., goniotomy or trabeculotomy)",
                    "Congenital dacryostenosis; nasolacrimal duct probing and topical antibiotics",
                    "Herpes simplex ophthalmia neonatorum; topical acyclovir gel and systemic acyclovir",
                    "Congenital cataract; urgent lens aspiration and intraocular lens implantation",
                    "Retinoblastoma; immediate systemic chemotherapy or enucleation"
                ],
                "answer": 0,
                "exp": "This infant has **Primary Congenital Glaucoma**, characterized by the triad of **epiphora, photophobia, and blepharospasm**, along with corneal clouding, **buphthalmos** (enlarged eyes), and **Haab's striae** (breaks in Descemet's membrane). Treatment is **primarily surgical** (goniotomy or trabeculotomy) to physically open the malformed angle, as medical therapy is only an adjunct to clear the cornea before surgery."
            },
            {
                "q": "What is the primary developmental defect responsible for Primary Congenital Glaucoma?",
                "options": [
                    "Dysgenesis of the trabecular meshwork and anterior chamber angle (Barkan's membrane)",
                    "Failure of the nasolacrimal duct to canalize prior to birth",
                    "In utero infection with Cytomegalovirus leading to uveal inflammation",
                    "Deposition of abnormal copper in Descemet's membrane",
                    "Autoimmune destruction of the scleral canal of Schlemm"
                ],
                "answer": 0,
                "exp": "Primary congenital glaucoma is caused by **trabecular meshwork dysgenesis** (incomplete development of the trabecular meshwork and anterior chamber angle). A membrane-like tissue sheet (classically called Barkan's membrane, though histologically representing compact trabecular tissue) blocks the outflow of aqueous humor, leading to high IOP in utero or shortly after birth."
            },
            {
                "q": "Why do infants with congenital glaucoma develop abnormally large eyes (buphthalmos), whereas adults with high IOP do not?",
                "options": [
                    "The infant sclera and cornea are highly elastic and stretch under high intraocular pressure",
                    "Infants produce twice the volume of aqueous humor as adults, inflating the globe",
                    "The high pressure stimulates rapid bone growth of the surrounding orbit",
                    "The infant lens swells and expands the entire anterior segment",
                    "High IOP causes chronic hyperopia and axial length shortening"
                ],
                "answer": 0,
                "exp": "In infants (under the age of 3), the collagen fibers of the **sclera and cornea are highly elastic and stretchable**. When exposed to high intraocular pressure, the entire globe stretches and enlarges, a condition known as **buphthalmos** (\"ox eye\"). In adults, the sclera is rigid and calcified, so high IOP does not cause enlargement of the globe."
            }
        ]
    },
    # Template 9: Steroid-Induced Glaucoma
    {
        "title": "The Cost of Suppressed Inflammation",
        "age_range": (30, 55),
        "va_affected": "20/40",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old {gender} with a history of chronic anterior uveitis presents with a 2-week history of mild, painless blurry vision in {possessive} {eye_side} eye. {pronoun_cap} has been using topical prednisolone acetate 1% drops 4 times daily in that eye for the past 3 months to prevent uveitis flare-ups.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Cornea is clear. Anterior chamber is completely quiet (0 cells, 0 flare). Gonioscopy shows an open angle. Slit-lamp exam of the optic nerve reveals a cup-to-disc ratio of {cdr}, with thinning of the superior and inferior neuroretinal rim. IOP is {iop} mmHg. OS exam is completely normal with an IOP of 14 mmHg."
        ),
        "questions": [
            {
                "q": "What is the most appropriate initial management for this patient's elevated intraocular pressure?",
                "options": [
                    "Taper and discontinue the topical prednisolone, switch to a 'soft' steroid if needed, and initiate IOP-lowering drops",
                    "Increase the frequency of prednisolone drops to every hour to reduce trabecular inflammation",
                    "Perform immediate surgical trabeculectomy with mitomycin C",
                    "Prescribe oral prednisone 60 mg daily to systemically control the disease",
                    "Perform a laser peripheral iridotomy"
                ],
                "answer": 0,
                "exp": "This patient has **Steroid-Induced Glaucoma**. The first step is to **taper and discontinue the offending corticosteroid** if the underlying uveitis is quiet. If corticosteroid therapy is still required, the patient should be switched to a \"soft\" steroid with less propensity to raise IOP (e.g., loteprednol, fluorometholone). Topical IOP-lowering agents (like latanoprost or timolol) should be initiated to protect the optic nerve while the steroid effect washes out."
            },
            {
                "q": "What is the molecular mechanism by which corticosteroids increase intraocular pressure?",
                "options": [
                    "Decreasing trabecular meshwork extracellular matrix clearance, increasing outflow resistance",
                    "Stimulating ciliary body beta-2 receptors, increasing aqueous secretion",
                    "Causing swelling of the crystalline lens, leading to pupillary block",
                    "Promoting neovascularization of the anterior chamber angle",
                    "Directly blocking the lumen of Schlemm's canal via microthrombi"
                ],
                "answer": 0,
                "exp": "Corticosteroids increase IOP by **increasing resistance to aqueous outflow at the trabecular meshwork**. They do this by: (1) inhibiting the degradation of extracellular matrix (ECM) proteins, leading to glycosaminoglycan accumulation, (2) increasing expression of myocilin protein, and (3) causing morphologic changes in trabecular meshwork cells (e.g., forming cross-linked actin networks) that decrease their filtering capacity."
            },
            {
                "q": "Which patient population is at the HIGHEST risk of being a high 'steroid responder' (developing high IOP after steroid use)?",
                "options": [
                    "Patients with a personal or first-degree family history of primary open-angle glaucoma, and high myopes",
                    "Patients with hyperopia and shallow anterior chambers",
                    "Young males with pigment dispersion syndrome",
                    "Infants with congenital nasolacrimal duct obstruction",
                    "Patients with a history of HLA-B27 positive ankylosing spondylitis"
                ],
                "answer": 0,
                "exp": "The risk of developing a steroid-induced IOP spike is significantly higher in **patients with POAG (over 90% are responders)**, first-degree relatives of POAG patients, high myopes, patients with connective tissue diseases (like rheumatoid arthritis), and very young or very old patients. These populations must be monitored closely whenever started on steroid drops."
            }
        ]
    },
    # Template 10: Glaucoma Medications Side Effects
    {
        "title": "The Side Effects of Therapy",
        "age_range": (60, 80),
        "va_affected": "20/20",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old {gender} with bilateral primary open-angle glaucoma presents to {possessive} primary care physician complaining of worsening shortness of breath, wheezing, and fatigue. {pronoun_cap} was started on a new eye drop by {possessive} ophthalmologist 2 weeks ago. {pronoun_cap} has a history of moderate asthma.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.4°F | HR: {hr} bpm (bradycardia) | BP: 110/70 mmHg | RR: {rr}/min\n"
            "*   **Pulmonary:** Bilateral expiratory wheezing and prolonged expiratory phase on auscultation.\n"
            "*   **Ocular Examination:** Bilateral quiet eyes, IOPs are well-controlled at 14 mmHg OU."
        ),
        "questions": [
            {
                "q": "Which of the following glaucoma medications is most likely responsible for this patient's systemic symptoms?",
                "options": [
                    "Timolol (non-selective beta-blocker)",
                    "Latanoprost (prostaglandin analog)",
                    "Brimonidine (alpha-2 agonist)",
                    "Dorzolamide (carbonic anhydrase inhibitor)",
                    "Pilocarpine (parasympathomimetic)"
                ],
                "answer": 0,
                "exp": "The patient's presentation of asthma exacerbation (wheezing, dyspnea) and bradycardia (HR <60) after starting a new eye drop is classic for **Timolol**, a non-selective beta-adrenergic antagonist. Topical eye drops undergo mucosal absorption through the nasolacrimal duct, bypassing first-pass hepatic metabolism and achieving significant systemic levels. Timolol blocks beta-2 receptors in the bronchioles, causing life-threatening bronchospasm in asthmatics, and beta-1 receptors in the heart, causing bradycardia and heart block."
            },
            {
                "q": "The patient's timolol is discontinued. The ophthalmologist decides to switch to a prostaglandin analog (e.g., latanoprost). Which local side effect should the patient be educated about?",
                "options": [
                    "Increased brown pigmentation of the iris, lengthening and darkening of eyelashes, and orbital fat atrophy",
                    "Severe allergic follicular conjunctivitis and contact dermatitis",
                    "Dry mouth, drowsiness, and headache",
                    "Bitter taste and corneal endothelial deposits",
                    "Pupillary constriction (miosis), brow ache, and transient myopia"
                ],
                "answer": 0,
                "exp": "Topical **prostaglandin analogs** (latanoprost, bimatoprost) have well-known cosmetic and local side effects: (1) **increased iris pigmentation** (turning blue/green eyes brown due to increased melanin production), (2) **hypertrichosis** (eyelash lengthening, thickening, and darkening), and (3) **prostaglandin-associated periorbitopathy** (orbital fat atrophy, causing a sunken eye appearance/deepening of the lid sulcus)."
            },
            {
                "q": "Another patient is started on Brimonidine (an alpha-2 agonist) and develops severe red eyes. What is the classic local side effect of Brimonidine that necessitates drug discontinuation?",
                "options": [
                    "Allergic follicular conjunctivitis",
                    "Corneal stromal melting",
                    "Posterior synechiae formation",
                    "Macular edema in aphakic patients",
                    "Intraoperative floppy iris syndrome"
                ],
                "answer": 0,
                "exp": "Topical **Brimonidine** (an alpha-2 adrenergic agonist) is notorious for causing **allergic follicular conjunctivitis** or contact blepharoconjunctivitis in up to 15-20% of patients. It typically presents as delayed redness, severe itching, and follicles in the inferior palpebral conjunctiva, requiring discontinuation of the drug. Brimonidine also crosses the blood-brain barrier and can cause systemic somnolence/fatigue and is contraindicated in infants due to risk of central apnea and coma."
            }
        ]
    }
]

# =========================================================================
# 2. RETINAL EMERGENCIES TEMPLATES
# =========================================================================
templates["retinal_emergencies"] = [
    # Template 1: Rhegmatogenous Retinal Detachment
    {
        "title": "The Falling Curtain",
        "age_range": (45, 75),
        "va_affected": "20/200",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old {gender} presents with a sudden onset of flashes of light (photopsias) and a shower of small dark floaters in the {eye_side} eye, followed by a dark curtain-like shadow descending over the upper half of {possessive} vision. {pronoun_cap} has a history of high myopia.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected} (no improvement with pinhole); OS: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Anterior chamber is quiet. Slit-lamp exam of the anterior vitreous reveals small, brown-pigmented cells (\"tobacco dust\" or Shafer's sign). Dilated fundus exam reveals a grey, elevated, corrugated, and wrinkled retina in the inferior-temporal sector with a large, crescentic horseshoe-shaped retinal tear."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the immediate management?",
                "options": [
                    "Rhegmatogenous retinal detachment; urgent ophthalmology referral for surgical repair",
                    "Central retinal artery occlusion; immediate ocular massage and hyperbaric oxygen",
                    "Vitreous hemorrhage; bed rest and head elevation of 45 degrees",
                    "Dry age-related macular degeneration; high-dose AREDS2 vitamins",
                    "Acute retinal necrosis; immediate intravenous acyclovir"
                ],
                "answer": 0,
                "exp": "This patient has a classic **Rhegmatogenous Retinal Detachment (RRD)** with a visible horseshoe tear. The presence of flashes, floaters, and a \"curtain\" visual field loss are hallmarks. The immediate management is an **urgent referral to an ophthalmologist** for surgical reattachment (e.g., vitrectomy, scleral buckle, or pneumatic retinopexy) to prevent permanent macular visual loss (if macula is \"on\")."
            },
            {
                "q": "What is the pathophysiological mechanism responsible for this specific type of retinal detachment?",
                "options": [
                    "Vitreous liquefaction and traction create a full-thickness retinal tear, allowing liquefied vitreous to enter the subretinal space",
                    "Contraction of retroretinal fibrous membranes pulling the neurosensory retina away from the pigment epithelium",
                    "Exudative leakage of fluid from choroidal vessels directly into the subretinal space due to high systemic pressure",
                    "A direct vascular tear causing blood accumulation that mechanically dissects the retina",
                    "Hypersecretion of subretinal fluid by hypertrophied retinal pigment epithelial cells"
                ],
                "answer": 0,
                "exp": "Rhegmatogenous RD (from *rhegma*, meaning tear) occurs when **vitreous liquefaction (synchysis)** and **vitreous traction** lead to a posterior vitreous detachment (PVD) that pulls on and tears the retina. Liquefied vitreous then passes through the tear into the subretinal space, separating the neurosensory retina from the underlying retinal pigment epithelium (RPE)."
            },
            {
                "q": "What does the clinical sign of 'tobacco dust' (Shafer's sign) in the anterior vitreous represent?",
                "options": [
                    "Pigmented retinal pigment epithelial (RPE) cells released into the vitreous following a retinal tear",
                    "Degenerated red blood cells from a vitreous hemorrhage",
                    "Clumps of white blood cells indicating an active vitritis",
                    "Deposits of amyloid protein on the posterior vitreous face",
                    "Calcified deposits on the lens zonules"
                ],
                "answer": 0,
                "exp": "**Shafer's sign** (\"tobacco dust\") represents **pigmented RPE cells** that have escaped through a full-thickness retinal tear into the vitreous cavity. It is a highly specific sign of a retinal tear or detachment, even if the tear itself is not immediately visible."
            }
        ]
    },
    # Template 2: Central Retinal Artery Occlusion
    {
        "title": "The Pale Retina and Cherry-Red Spot",
        "age_range": (55, 80),
        "va_affected": "Count Fingers",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old {gender} with a history of hypertension, hyperlipidemia, and coronary artery disease presents with a sudden, complete, painless loss of vision in the {eye_side} eye that occurred {duration} hours ago. {pronoun_cap} denies any preceding trauma or ocular symptoms.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** A positive relative afferent pupillary defect (APD). Dilated fundus examination reveals marked, generalized pallor and edema of the retina, except for a bright, circumscribed \"cherry-red spot\" in the central fovea. The retinal arterioles are severely narrowed, and segmenting blood columns (\"box-carring\") are visible."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the initial emergency management?",
                "options": [
                    "Central retinal artery occlusion (CRAO); ocular massage, hyperventilate into a paper bag, or AC paracentesis",
                    "Central retinal vein occlusion (CRVO); intravitreal anti-VEGF injection within 24 hours",
                    "Rhegmatogenous retinal detachment; pneumatic retinopexy",
                    "Giant cell arteritis; high-dose oral prednisone monotherapy",
                    "Vitreous hemorrhage; urgent pars plana vitrectomy"
                ],
                "answer": 0,
                "exp": "This is a classic **Central Retinal Artery Occlusion (CRAO)**. It is an ocular emergency analogous to an ischemic stroke. Initial management (within 4 hours of onset) aims to dislodge the embolus and restore perfusion by lowering IOP (via **ocular massage**, **anterior chamber paracentesis**, or IV acetazolamide) or causing vasodilation (breathing into a paper bag to raise CO2 levels)."
            },
            {
                "q": "Why does a 'cherry-red spot' appear in the macula of patients with Central Retinal Artery Occlusion?",
                "options": [
                    "The thin foveola lacks inner retinal layers and is supplied by the underlying choroid, which shines red against the pale, ischemic surrounding retina",
                    "A localized pool of blood accumulates in the subretinal space directly beneath the fovea",
                    "Selective hyper-perfusion of the fovea by a patent cilioretinal artery",
                    "The cherry-red spot represents the embolus itself wedged in the macular arteriole",
                    "Severe localized inflammation of the macular photoreceptors"
                ],
                "answer": 0,
                "exp": "The **cherry-red spot** appears because the foveola is extremely thin and lacks the inner retinal layers (ganglion cells, nerve fibers) that become pale, swollen, and edematous when ischemic. Because the foveola is supplied primarily by the underlying choriocapillaris (which is fed by the ciliary arteries, not the blocked central retinal artery), the vascular choroid continues to shine red through the thin, transparent foveal tissue, contrasting with the pale, opaque surrounding retina."
            },
            {
                "q": "Which of the following diagnostic workups is most critical in this patient to prevent life-threatening stroke or myocardial infarction?",
                "options": [
                    "Carotid duplex ultrasound and echocardiogram",
                    "Brain MRI with contrast",
                    "Temporal artery biopsy",
                    "Coagulation panel including Factor V Leiden",
                    "Fluorescein angiography of both eyes"
                ],
                "answer": 0,
                "exp": "The most common cause of non-arteritic CRAO is an **embolus originating from an ulcerated carotid artery plaque (Hollenhorst plaque) or the heart**. Therefore, a cardiovascular workup consisting of **carotid duplex ultrasound** and an **echocardiogram** is mandatory to identify source lesions and prevent a subsequent stroke or MI."
            }
        ]
    },
    # Template 3: Central Retinal Vein Occlusion
    {
        "title": "The Blood and Thunder Fundus",
        "age_range": (60, 85),
        "va_affected": "20/200",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old {gender} with a long history of poorly controlled hypertension and glaucoma presents with a subacute, painless decrease in vision in {possessive} {eye_side} eye over the past 2 days.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Mild APD. Dilated fundus exam reveals widespread, diffuse flame-shaped and dot-and-blot hemorrhages in all four quadrants (\"blood and thunder fundus\"), along with severely tortuous and dilated retinal veins, scattered cotton-wool spots, and significant optic disc and macular edema."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis?",
                "options": [
                    "Central retinal vein occlusion (CRVO)",
                    "Central retinal artery occlusion (CRAO)",
                    "Proliferative diabetic retinopathy with vitreous hemorrhage",
                    "Hypertensive crisis with Grade IV retinopathy",
                    "Acute retinal necrosis"
                ],
                "answer": 0,
                "exp": "This presentation is diagnostic of a **Central Retinal Vein Occlusion (CRVO)**. The hallmark funduscopic finding is the **'blood and thunder' appearance** (widespread hemorrhages in all 4 quadrants, tortuous dilated veins, disc edema, and cotton-wool spots). It is a venous thrombosis typically occurring at the level of the lamina cribrosa."
            },
            {
                "q": "What is the primary cause of severe, long-term visual loss in patients with Central Retinal Vein Occlusion?",
                "options": [
                    "Macular edema due to vascular leakage and capillary incompetence",
                    "Total retinal detachment due to subretinal fluid accumulation",
                    "Optic nerve atrophy from direct mechanical venous compression",
                    "Corneal edema from chronic secondary glaucoma",
                    "Autoimmune destruction of the retinal pigment epithelium"
                ],
                "answer": 0,
                "exp": "The most common cause of persistent, long-term visual loss in patients with CRVO is **macular edema** driven by capillary leakage and increased intravascular pressure. High venous pressure triggers blood-retinal barrier breakdown and release of VEGF, leading to chronic fluid accumulation in the macula."
            },
            {
                "q": "This patient must be monitored closely for '90-day glaucoma' (neovascular glaucoma). What drives this complication in ischemic CRVO?",
                "options": [
                    "Widespread retinal ischemia triggers VEGF release, which stimulates new blood vessel growth in the iris and angle",
                    "Chronic blood breakdown products block the trabecular meshwork",
                    "Persistent systemic hypertension pushes the lens-iris diaphragm forward",
                    "The thrombus in the central retinal vein back-pressures into the vortex veins, blocking outflow",
                    "Anterior uveitis causes pupillary block synechiae"
                ],
                "answer": 0,
                "exp": "In ischemic CRVO (defined by large areas of capillary non-perfusion on fluorescein angiography), severe **retinal ischemia** triggers the release of **VEGF**. VEGF diffuses into the anterior segment, causing neovascularization of the iris (rubeosis iridis) and angle, which eventually leads to **neovascular glaucoma** (classically appearing around 90 days, hence \"90-day glaucoma\")."
            }
        ]
    },
    # Template 4: Wet Age-Related Macular Degeneration
    {
        "title": "The Wavy Lines and Central Dark Spot",
        "age_range": (70, 88),
        "va_affected": "20/120",
        "va_unaffected": "20/30",
        "scenario": (
            "A {age}-year-old {gender} presents with a sudden onset of distortion in {possessive} central vision in the {eye_side} eye. {pronoun_cap} complains that straight lines (like doorframes) appear wavy and bent, and {pronoun} has difficulty reading. {pronoun_cap} has a long history of dry macular degeneration in both eyes.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Testing with an Amsler grid confirms significant metamorphopsia (wavy lines) and a central scotoma. Dilated fundus examination reveals multiple, large soft yellowish drusen in the macula, along with a grey-green subretinal elevation, subretinal fluid, and a localized pocket of subretinal hemorrhage in the central fovea."
        ),
        "questions": [
            {
                "q": "Which of the following represents the most appropriate first-line treatment for this patient's current condition?",
                "options": [
                    "Intravitreal injections of anti-Vascular Endothelial Growth Factor (anti-VEGF) agents (e.g., aflibercept)",
                    "High-dose antioxidant vitamins and zinc (AREDS2 formulation) alone",
                    "Surgical subretinal membrane scraping and vitrectomy",
                    "Topical prednisolone acetate 1% drops hourly",
                    "Laser photocoagulation of the central foveal hemorrhage"
                ],
                "answer": 0,
                "exp": "The patient has transitioned from dry to **neovascular ('wet') Age-Related Macular Degeneration (Wet AMD)**, evidenced by sudden metamorphopsia (wavy lines), subretinal fluid, and hemorrhage. The standard of care is **intravitreal anti-VEGF injections** (e.g., ranibizumab, aflibercept, bevacizumab), which bind VEGF, stopping neovascularization and reducing vascular leakage, often restoring or stabilizing vision. AREDS2 vitamins are for dry AMD and do not treat active choroidal neovascular membranes."
            },
            {
                "q": "What is the key pathophysiological development that distinguishes 'wet' AMD from 'dry' AMD?",
                "options": [
                    "Growth of abnormal choroidal vessels through Bruch's membrane into the subretinal space (choroidal neovascularization)",
                    "Progressive geographic atrophy of the retinal pigment epithelium and photoreceptors",
                    "Accumulation of extracellular lipofuscin-rich debris (drusen) in the extracellular space",
                    "A sudden mechanical tear in the neurosensory retina due to vitreous traction",
                    "Occlusion of the central retinal vein at the optic disc"
                ],
                "answer": 0,
                "exp": "The defining feature of Wet AMD is **choroidal neovascularization (CNV)**. Unlike Dry AMD, which involves slow atrophy of the RPE and photoreceptors, Wet AMD involves the growth of **abnormal, fragile blood vessels from the choriocapillaris** through breaks in **Bruch's membrane** into the sub-RPE or subretinal space. These vessels leak fluid, protein, and blood, leading to rapid, severe visual loss."
            },
            {
                "q": "Which of the following clinical tests is most appropriate for patients with dry AMD to perform at home for early detection of conversion to wet AMD?",
                "options": [
                    "Amsler grid testing daily",
                    "Frequent self-tonometry using a hand-held tonometer",
                    "Checking color vision with Ishihara plates weekly",
                    "Self-assessment of peripheral visual field boundaries",
                    "Measuring visual acuity using a Snellen pocket card"
                ],
                "answer": 0,
                "exp": "Patients with Dry AMD are instructed to use an **Amsler grid daily** to monitor for early signs of Wet AMD. Metamorphopsia (distortion where straight lines appear wavy) or a new central dark spot (scotoma) on the grid are early signs of subretinal fluid or hemorrhage, prompting immediate evaluation and anti-VEGF therapy."
            }
        ]
    },
    # Template 5: Dry Macular Degeneration
    {
        "title": "The Progressive Central Blindness",
        "age_range": (68, 86),
        "va_affected": "20/50",
        "va_unaffected": "20/40",
        "scenario": (
            "A {age}-year-old {gender} smoker presents with a 2-year history of slowly progressive, bilateral loss of central vision, making it hard to read, sew, or recognize faces. {pronoun_cap} reports no sudden changes in vision, pain, or flashes of light.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** OD: {va_affected}; OS: {va_unaffected} (with correction)\n"
            "*   **Ocular Examination:** Anterior segments are clear. Amsler grid shows no metamorphopsia (lines are straight) but a mild central blur bilaterally. Dilated fundus examination reveals multiple, bilateral, scattered small and large yellowish-white extracellular deposits (drusen) in the macula, along with localized areas of depigmentation and thinning of the retinal pigment epithelium (geographic atrophy). No subretinal fluid or hemorrhage is present."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the recommended management?",
                "options": [
                    "Dry age-related macular degeneration; AREDS2 vitamin formulation and smoking cessation",
                    "Wet age-related macular degeneration; urgent intravitreal anti-VEGF therapy",
                    "Primary open-angle glaucoma; topical prostaglandin drops",
                    "Nuclear cataract; urgent surgical cataract extraction",
                    "Toxic retinopathy; immediate discontinuation of hydroxychloroquine"
                ],
                "answer": 0,
                "exp": "This patient has **Dry Age-Related Macular Degeneration (Dry AMD)**, characterized by progressive central vision loss, geographic atrophy, and **drusen** without fluid or blood. The recommended management for intermediate/advanced dry AMD is the **AREDS2 vitamin formulation** (antioxidant vitamins C, E, zinc, copper, lutein, and zeaxanthin) to slow progression to advanced stages, along with **smoking cessation** (as smoking is the strongest modifiable risk factor)."
            },
            {
                "q": "What represents the substance known as 'drusen' that accumulates in this condition?",
                "options": [
                    "Extracellular debris including lipofuscin, proteins, and lipids accumulating between the RPE and Bruch's membrane",
                    "Abnormal collagen fibers deposited within the stroma of the cornea",
                    "Aggregates of inflammatory cells adhering to the corneal endothelium",
                    "Small microaneurysms that have thrombosed and calcified",
                    "Protein complexes leaking from the vitreous humor"
                ],
                "answer": 0,
                "exp": "**Drusen** are **yellowish extracellular deposits** consisting of undigested cellular waste products (like lipofuscin), proteins, and lipids that accumulate in the extracellular space between the **retinal pigment epithelium (RPE) and Bruch's membrane**. Their accumulation disrupts RPE function and leads to secondary degeneration of the overlying photoreceptors."
            },
            {
                "q": "Why was beta-carotene removed and replaced with Lutein and Zeaxanthin in the AREDS2 clinical trial formulation?",
                "options": [
                    "Beta-carotene was found to significantly increase the risk of lung cancer in smokers",
                    "Lutein and Zeaxanthin were found to lower intraocular pressure",
                    "Beta-carotene caused severe corneal endothelial deposits",
                    "Beta-carotene interfered with the absorption of zinc and copper",
                    "Lutein has superior activity against choroidal neovascularization"
                ],
                "answer": 0,
                "exp": "Beta-carotene was replaced with **Lutein and Zeaxanthin** in the AREDS2 formulation because large clinical trials (like the CARET and ATBC studies) demonstrated that **beta-carotene significantly increases the risk of lung cancer in smokers**. Since many AMD patients have a history of smoking, removing beta-carotene made the formulation safer while maintaining efficacy."
            }
        ]
    },
    # Template 6: Vitreous Hemorrhage
    {
        "title": "The Floating Red Cobwebs",
        "age_range": (50, 75),
        "va_affected": "20/400",
        "va_unaffected": "20/25",
        "scenario": (
            "A {age}-year-old {gender} with a 15-year history of insulin-dependent diabetes presents with a sudden onset of multiple floating dark spots and red cobweb-like lines in the {eye_side} eye, followed by severe, painless blurring of vision. {pronoun_cap} has had no eye trauma.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** The red reflex is severely dim/absent. Slit-lamp exam shows clear cornea and a quiet anterior chamber. On dilated exam, the vitreous cavity is filled with suspended red blood cells, completely obscuring the details of the optic nerve and retinal vasculature. Contralateral eye shows proliferative diabetic retinopathy with neovascularization."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the initial management step?",
                "options": [
                    "Vitreous hemorrhage; elevate the head of the bed, perform ocular ultrasound (B-scan) to rule out retinal detachment, and observe",
                    "Central retinal artery occlusion; perform urgent anterior chamber paracentesis",
                    "Rhegmatogenous retinal detachment; perform immediate pneumatic retinopexy",
                    "CMV retinitis; initiate systemic and intravitreal ganciclovir",
                    "Acute angle-closure glaucoma; administer IV acetazolamide"
                ],
                "answer": 0,
                "exp": "This patient has a **Vitreous Hemorrhage**, a common complication of **Proliferative Diabetic Retinopathy**. The initial steps are: (1) **elevate the head of the bed (30-45 degrees)** to allow the blood to settle inferiorly, clearing the visual axis, (2) perform an **ocular B-scan ultrasound** to ensure the underlying retina is flat and not detached (since the fundus cannot be visualized), and (3) observe, as many hemorrhages clear spontaneously over weeks to months."
            },
            {
                "q": "What is the primary anatomical source of blood in a diabetic patient presenting with a vitreous hemorrhage?",
                "options": [
                    "Fragile, abnormal new vessels (neovascularization) growing along the vitreous face and retina that rupture easily",
                    "A tear in a major branch retinal vein due to severe systemic hypertension",
                    "A full-thickness retinal tear that shears a healthy retinal arteriole",
                    "Bleeding from abnormal choroidal neovascular membranes through Bruch's membrane",
                    "Rupture of ciliary body capillaries due to high intraocular pressure"
                ],
                "answer": 0,
                "exp": "In diabetes, **vitreous hemorrhage** is caused by the **rupture of fragile neovascular vessels (NVD or NVE)**. These abnormal vessels lack a normal muscular coat and tight endothelial junctions, making them extremely fragile. When the vitreous contracts or moves, it exerts traction on these vessels, causing them to tear and bleed directly into the vitreous cavity."
            },
            {
                "q": "In which of the following scenarios is an URGENT pars plana vitrectomy indicated for a patient with a vitreous hemorrhage?",
                "options": [
                    "The presence of a tractional or rhegmatogenous retinal detachment on B-scan ultrasound, or non-clearing hemorrhage >3-6 months",
                    "Any vitreous hemorrhage in a patient with a history of hypertension",
                    "The presence of dry age-related macular degeneration in the contralateral eye",
                    "An elevated intraocular pressure of 22 mmHg in the affected eye",
                    "The presence of hard lipid exudates on the retinal surface"
                ],
                "answer": 0,
                "exp": "An **urgent pars plana vitrectomy** is indicated if: (1) **B-scan ultrasound reveals an associated retinal detachment (tractional or rhegmatogenous)**, (2) the hemorrhage fails to clear after 3 to 6 months of conservative observation, preventing visual recovery and treatment, or (3) neovascularization of the iris/angle (rubeosis) develops, requiring clear media to perform PRP."
            }
        ]
    },
    # Template 7: CMV Retinitis
    {
        "title": "The AIDS-Related Blindness",
        "age_range": (30, 50),
        "va_affected": "20/80",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old {gender} with HIV presents with a 1-week history of floaters, flashes of light, and blurred vision in the {eye_side} eye. {pronoun_cap} admits to non-compliance with antiretroviral therapy (ART). {possessive_cap} CD4 count is {cd4} cells/mcL.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 99.0°F | HR: 72 bpm | BP: 120/80 mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Anterior chamber is quiet. Vitreous shows minimal inflammatory cells (1+). Dilated fundus examination reveals multiple, confluent, thick, yellow-white necrotic retinal lesions with perivascular sheathing and extensive, flame-shaped retinal hemorrhages along the vascular arches, giving a \"pizza-pie\" or \"scrambled eggs and ketchup\" appearance."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the first-line therapy?",
                "options": [
                    "Cytomegalovirus (CMV) retinitis; systemic valganciclovir and/or intravitreal ganciclovir, plus initiation of ART",
                    "Toxoplasma chorioretinitis; pyrimethamine, sulfadiazine, and folinic acid",
                    "Acute retinal necrosis (ARN); intravenous acyclovir and oral valacyclovir",
                    "Bacterial endophthalmitis; intravitreal vancomycin and ceftazidime",
                    "Syphilitic chorioretinitis; intravenous penicillin G for 14 days"
                ],
                "answer": 0,
                "exp": "This patient has **CMV Retinitis**, the most common opportunistic ocular infection in AIDS patients, typically occurring when the **CD4 count is <50 cells/mcL**. The classic fundus appearance is a **\"pizza-pie\" or \"scrambled eggs and ketchup\" pattern** of yellow-white necrotic lesions and massive hemorrhages. First-line therapy consists of **antivirals (ganciclovir/valganciclovir or foscarnet)** administered systemically and/or intravitreally, along with the **initiation or optimization of ART**."
            },
            {
                "q": "Why is there typically very little vitreous cell or anterior chamber inflammation (vitritis/iritis) seen in patients with active CMV retinitis?",
                "options": [
                    "The severe immunosuppression prevents the host from mounting an inflammatory response (quiet vitreous)",
                    "CMV selectively infects only the outer photoreceptors, sparing vascular structures",
                    "The blood-aqueous barrier is completely impermeable to CMV antigens",
                    "CMV produces potent anti-inflammatory cytokines that suppress local T-cells",
                    "The virus is physically restricted to the subretinal space"
                ],
                "answer": 0,
                "exp": "Active CMV retinitis characteristically presents with **minimal vitreous or anterior segment inflammation (quiet vitreous)**. This is because patients are **severely immunocompromised (CD4 < 50)** and cannot mount a cellular inflammatory response. If the immune system recovers (e.g., after starting ART), a massive inflammatory reaction can occur, known as **Immune Reconstitution Inflammatory Syndrome (IRIS)**, presenting as severe vitritis and macular edema."
            },
            {
                "q": "What is the most common vision-threatening complication of CMV retinitis, occurring in up to 30% of patients?",
                "options": [
                    "Rhegmatogenous retinal detachment",
                    "Neovascular glaucoma",
                    "Corneal stromal necrosis",
                    "Tractional retinal detachment",
                    "Sympathetic ophthalmia"
                ],
                "answer": 0,
                "exp": "The most common and feared complication of CMV retinitis is **rhegmatogenous retinal detachment**. The CMV virus causes full-thickness **necrosis and thinning of the retina**, leaving behind fragile, paper-thin necrotic tissue. As the vitreous contracts or pulls, multiple peripheral retinal holes and tears easily form, leading to a high rate of RRD that often requires complex surgery with silicone oil tamponade."
            }
        ]
    },
    # Template 8: Acute Retinal Necrosis
    {
        "title": "The Painful Confluent Necrosis",
        "age_range": (35, 60),
        "va_affected": "20/200",
        "va_unaffected": "20/20",
        "scenario": (
            "A healthy, immunocompetent {age}-year-old {gender} presents with a 4-day history of severe, boring pain, redness, photophobia, and rapidly worsening vision in the {eye_side} eye. {pronoun_cap} has no systemic symptoms.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.6°F | HR: 68 bpm | BP: 120/80 mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Moderate episcleral injection. Slit-lamp shows 2+ granulomatous keratic precipitates on the corneal endothelium and 2+ cell/flare in the anterior chamber. There is significant **vitritis (3+)** obscuring the fundus. Dilated fundus examination reveals confluent, patch-like areas of yellowish-white peripheral retinal necrosis that are spreading circumferentially, with prominent retinal arteritis (perivascular sheathing)."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the primary causative pathogen?",
                "options": [
                    "Acute Retinal Necrosis (ARN); Varicella-Zoster Virus (VZV) or Herpes Simplex Virus (HSV)",
                    "CMV retinitis; Cytomegalovirus in a patient with undiagnosed AIDS",
                    "Toxocariasis; Toxocara canis roundworm infection",
                    "Endogenous bacterial endophthalmitis; Staphylococcus aureus",
                    "Vogt-Koyanagi-Harada disease; autoimmune reaction to melanocytes"
                ],
                "answer": 0,
                "exp": "This is **Acute Retinal Necrosis (ARN)**, which characteristically occurs in **immunocompetent** hosts. It is caused by herpesviruses, most commonly **Varicella-Zoster Virus (VZV)** or **Herpes Simplex Virus (HSV-1 or HSV-2)**. Key clinical features include: (1) severe ocular pain and redness, (2) severe **vitritis** (unlike CMV), and (3) confluent, peripheral **yellowish-white retinal necrosis** with retinal arteritis. Treatment is an emergency, requiring IV acyclovir or oral valacyclovir, combined with intravitreal ganciclovir."
            },
            {
                "q": "Why is systemic corticosteroid therapy often used as an adjunct in the treatment of Acute Retinal Necrosis, and when should it be initiated?",
                "options": [
                    "Corticosteroids are started 24-48 hours after antiviral therapy to reduce the severe, vision-threatening vitreous inflammation",
                    "Corticosteroids are used as monotherapy to suppress the autoimmune destruction of the retina",
                    "Corticosteroids are started immediately before antivirals to open the blood-retinal barrier",
                    "Corticosteroids are strictly contraindicated because they promote viral replication in the retina",
                    "Corticosteroids are used to prevent systemic viral spreading to the brain"
                ],
                "answer": 0,
                "exp": "Systemic **corticosteroids** (prednisone) are used as an adjunct to **reduce the severe, vision-threatening vitritis** and vascular inflammation associated with ARN. However, they must **never be given alone or before antivirals**. They are initiated **24 to 48 hours AFTER adequate antiviral therapy** has begun, ensuring that the viral replication is controlled so that steroids do not promote uncontrolled necrotizing viral spread."
            },
            {
                "q": "What is the most common long-term complication of Acute Retinal Necrosis, occurring in over 75% of untreated patients?",
                "options": [
                    "Rhegmatogenous retinal detachment due to peripheral retinal holes",
                    "Tractional retinal detachment due to fibrovascular membranes",
                    "Neovascular glaucoma from persistent retinal ischemia",
                    "Phacolytic glaucoma from lens protein leakage",
                    "Sympathetic ophthalmia in the contralateral eye"
                ],
                "answer": 0,
                "exp": "The most common and devastating complication of ARN is **rhegmatogenous retinal detachment**, occurring in **75-85% of untreated cases**. As the large, confluent zones of peripheral necrotic retina heal, they become paper-thin and develop **multiple, large, irregular tears and holes**. The severe vitritis also causes vitreous condensation and traction, pulling the torn retina off. Prophylactic laser retinopexy is often performed around necrotic areas to prevent this."
            }
        ]
    },
    # Template 9: Branch Retinal Artery Occlusion
    {
        "title": "The Segmental Shadow",
        "age_range": (55, 78),
        "va_affected": "20/40",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old {gender} with a history of carotid artery disease and smoking presents with a sudden, painless loss of the upper half of {possessive} visual field in the {eye_side} eye that occurred {duration} hours ago. {possessive_cap} central vision is only mildly blurry.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** No APD (or trace APD). Dilated fundus exam reveals a sharply demarcated, wedge-shaped area of pale, edematous retina confined to the inferior-temporal quadrant. At the first bifurcation of the inferior temporal retinal artery, there is a small, highly reflective, golden-yellow plaque (Hollenhorst plaque) obstructing the lumen."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis?",
                "options": [
                    "Branch retinal artery occlusion (BRAO)",
                    "Central retinal artery occlusion (CRAO)",
                    "Branch retinal vein occlusion (BRVO)",
                    "Rhegmatogenous retinal detachment",
                    "Ischemic optic neuropathy"
                ],
                "answer": 0,
                "exp": "This patient has a **Branch Retinal Artery Occlusion (BRAO)**. The clinical features are highly classic: sudden, painless, **segmental visual field loss** (corresponding to the blocked vessel), and a wedge-shaped area of **retinal pallor and edema** in the distribution of a branch arteriole, often with a visible **Hollenhorst plaque** at the bifurcation."
            },
            {
                "q": "What is the primary composition and origin of a Hollenhorst plaque?",
                "options": [
                    "Cholesterol embolus originating from an atheromatous plaque in the internal carotid artery",
                    "Platelet-fibrin thrombus originating from the left atrium in atrial fibrillation",
                    "Calcific embolus originating from a stenotic aortic valve",
                    "Thrombus composed of sickled erythrocytes from ciliary vessels",
                    "Amyloid protein aggregate from systemic amyloidosis"
                ],
                "answer": 0,
                "exp": "A **Hollenhorst plaque** is a **cholesterol embolus** that originates from an **atheromatous, ulcerated plaque in the ipsilateral internal carotid artery** (or aorta). It travels in the bloodstream and becomes lodged at a bifurcation of the retinal vasculature, where the vessel diameter narrows. It appears highly reflective, shiny, and golden-yellow."
            },
            {
                "q": "How does the prognosis of visual acuity in BRAO generally compare to CRAO, and why?",
                "options": [
                    "Significantly better, because the central fovea is usually spared and the macular perfusion is maintained by the unaffected arterioles",
                    "Worse, because branch arterioles are smaller and more prone to permanent spasm",
                    "Identical, because both result in complete degeneration of the optic nerve head",
                    "Better, because the blocked arteriole undergoes spontaneous recanalization within minutes",
                    "Worse, because BRAO is highly associated with systemic vasculitis like Giant Cell Arteritis"
                ],
                "answer": 0,
                "exp": "The prognosis for visual acuity in BRAO is **significantly better than in CRAO**. In BRAO, because only a branch arteriole is occluded, the central fovea is usually spared (unless the macular branch itself is involved), allowing the patient to maintain good central vision (20/40 or better in 80% of cases), though they will have a permanent, segmental visual field defect."
            }
        ]
    },
    # Template 10: Tractional Retinal Detachment
    {
        "title": "The Silent Tension",
        "age_range": (50, 75),
        "va_affected": "20/200",
        "va_unaffected": "20/40",
        "scenario": (
            "A {age}-year-old {gender} with a history of poorly controlled type 1 diabetes and severe proliferative diabetic retinopathy presents with a slowly progressive, painless decrease in vision in {possessive} {eye_side} eye over the past 2 months.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Quiet anterior chamber. Dilated fundus examination reveals dense, white fibrovascular membranes in the vitreous cavity that are adherent to the retina. These bands are contracting and mechanically pulling the neurosensory retina away from the underlying RPE, creating a smooth, immobile, dome-like elevation of the retina. No retinal tears or holes are seen."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the primary surgical management?",
                "options": [
                    "Tractional retinal detachment; pars plana vitrectomy with membrane peeling and endolaser",
                    "Rhegmatogenous retinal detachment; urgent pneumatic retinopexy",
                    "Exudative retinal detachment; systemic corticosteroids and immunosuppressants",
                    "Proliferative diabetic retinopathy; panretinal photocoagulation (PRP) alone",
                    "Neovascular glaucoma; surgical trabeculectomy"
                ],
                "answer": 0,
                "exp": "This is a **Tractional Retinal Detachment (TRD)**, a severe complication of proliferative diabetic retinopathy. Treatment requires **pars plana vitrectomy** to remove the vitreous gel, followed by **micro-surgical membrane peeling** to release the tractional forces pulling the retina, and **intraoperative endolaser (PRP)** to regress the neovascularization."
            },
            {
                "q": "What is the key pathophysiological driver that leads to Tractional Retinal Detachment in diabetic patients?",
                "options": [
                    "Ischemia-induced neovascularization grows along the posterior vitreous face, creating fibrovascular membranes that contract over time",
                    "Liquefied vitreous leaks through a full-thickness retinal hole, dissecting the retina",
                    "Severe systemic hypertension causes transudative fluid to leak under the retina",
                    "Infiltration of the subretinal space by neoplastic retinoblastoma cells",
                    "Deposition of amyloid plaques that stiffen the sensory retina"
                ],
                "answer": 0,
                "exp": "In proliferative diabetic retinopathy, chronic retinal ischemia drives the growth of abnormal new vessels (**neovascularization**). These vessels grow out of the retina and along the **posterior vitreous face**, accompanied by a scaffolding of fibrous tissue. Over time, these **fibrovascular membranes contract**, mechanically pulling the neurosensory retina off the underlying RPE."
            },
            {
                "q": "Which of the following clinical features helps differentiate a Tractional Retinal Detachment from a Rhegmatogenous Retinal Detachment?",
                "options": [
                    "Tractional RD is characteristically slowly progressive, has a smooth/concave surface, is non-shifting, and lacks retinal holes/tears",
                    "Tractional RD presents with sudden flashes, floaters, a corrugated wrinkled surface, and a horseshoe tear",
                    "Tractional RD is associated with high intraocular pressure and corneal clouding",
                    "Tractional RD resolves spontaneously with steroid drops",
                    "Tractional RD is always bilateral and associated with systemic arthritis"
                ],
                "answer": 0,
                "exp": "**Tractional RD** is slowly progressive, has a **smooth, concave surface, is non-shifting** (does not move with gravity/head position), and **lacks full-thickness retinal tears/holes**. **Rhegmatogenous RD** is rapid in onset, has a **corrugated, wrinkled, convex surface, shifts with gravity**, and **always has a causative retinal tear/hole**."
            }
        ]
    }
]

# =========================================================================
# 3. RETINOPATHY TEMPLATES
# =========================================================================
templates["retinopathy"] = [
    # Template 1: Non-Proliferative Diabetic Retinopathy (Moderate/Severe)
    {
        "title": "The Microvascular Leaks",
        "age_range": (45, 70),
        "va_affected": "20/25",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old {gender} with a 15-year history of type 2 diabetes presents for an annual dilated eye exam. {pronoun_cap} has no visual symptoms and thinks {possessive} vision is perfect. {possessive_cap} last HbA1c was {hba1c}%.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 135/82 mmHg\n"
            "*   **Visual Acuity:** Bilateral 20/20 (corrected)\n"
            "*   **Ocular Examination:** Anterior segments are normal. Dilated fundus examination reveals multiple microaneurysms, scattered red dot-and-blot hemorrhages, several fluffy white cotton-wool spots, and yellowish rings of hard lipid exudates in all four quadrants. No neovascularization is seen. Macular thickness is normal."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what are the screening guidelines for this condition?",
                "options": [
                    "Severe Non-Proliferative Diabetic Retinopathy (NPDR); annual dilated eye exams starting at the time of diagnosis for type 2 diabetes",
                    "Moderate NPDR; dilated eye exams every 5 years starting at the time of diagnosis",
                    "Proliferative Diabetic Retinopathy (PDR); immediate panretinal photocoagulation",
                    "Hypertensive retinopathy Grade III; urgent administration of IV nitroprusside",
                    "Diabetic macular edema; immediate focal laser photocoagulation"
                ],
                "answer": 0,
                "exp": "This patient has **Severe NPDR**, characterized by hemorrhages, microaneurysms, cotton-wool spots, and hard exudates in all 4 quadrants without neovascularization. For **Type 2 DM**, the screening guidelines require a **dilated eye exam at the time of diagnosis**, followed by **annual exams** (or more frequent if retinopathy progresses). For Type 1 DM, screening begins 5 years after diagnosis."
            },
            {
                "q": "What is the key cellular event in the early pathogenesis of diabetic microvascular damage in the retina?",
                "options": [
                    "Loss of intramural pericytes and capillary endothelial cell damage",
                    "Autoimmune infiltration of the retinal nerve fiber layer by T-cells",
                    "Aqueous humor hypersecretion causing mechanical capillary compression",
                    "Deposition of amyloid fibrils in the vascular wall",
                    "Proliferation of retinal pigment epithelial cells into the stroma"
                ],
                "answer": 0,
                "exp": "The earliest cellular changes in diabetic retinopathy are **loss of retinal capillary pericytes** (which provide structural support to capillaries) and **endothelial cell damage** induced by chronic hyperglycemia. This leads to capillary basement membrane thickening, endothelial cell loss, capillary incompetence/occlusion, and hyperpermeability (leaking)."
            },
            {
                "q": "What do the 'cotton-wool spots' visible on this patient's fundus exam represent?",
                "options": [
                    "Focal microinfarcts of the retinal nerve fiber layer due to axoplasmic flow obstruction in ischemic areas",
                    "Extracellular deposits of lipid and lipoprotein leaking from damaged capillaries",
                    "Congenital hamartomas of the astrocytes surrounding the optic nerve",
                    "Small pockets of fluid under the sensory retina",
                    "Fungal abscesses within the vitreous cavity"
                ],
                "answer": 0,
                "exp": "**Cotton-wool spots** (formerly called soft exudates) represent **focal microinfarcts of the retinal nerve fiber layer (RNFL)**. Capillary occlusion leads to localized ischemia of the axons. This halts axoplasmic transport, causing axoplasmic debris and organelles to accumulate, presenting clinically as fluffy, white-grey patches with indistinct borders."
            }
        ]
    },
    # Template 2: Proliferative Diabetic Retinopathy
    {
        "title": "The Neovascular Proliferation",
        "age_range": (40, 68),
        "va_affected": "20/200",
        "va_unaffected": "20/30",
        "scenario": (
            "A {age}-year-old {gender} with a history of poorly controlled type 1 diabetes presents with sudden onset of numerous floaters and blurry vision in the {eye_side} eye. {pronoun_cap} has not had a dilated eye exam in 3 years. {possessive_cap} last HbA1c was {hba1c}%.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.6°F | HR: 80 bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Dilated fundus examination reveals extensive microvascular abnormalities, including multiple looping, fragile new blood vessels growing on the optic disc (NVD) and elsewhere on the retina (NVE). A boat-shaped preretinal hemorrhage is partially obscuring the central macula."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the first-line therapy?",
                "options": [
                    "Proliferative Diabetic Retinopathy (PDR); Panretinal Photocoagulation (PRP) laser or intravitreal anti-VEGF injections",
                    "Severe NPDR; initiating oral metformin and tight glycemic control alone",
                    "Central retinal artery occlusion; urgent anterior chamber paracentesis",
                    "Vitreous detachment; reassurance and observation",
                    "Central retinal vein occlusion; systemic anticoagulation"
                ],
                "answer": 0,
                "exp": "This is **Proliferative Diabetic Retinopathy (PDR)**, defined by the presence of **neovascularization** (NVD/NVE). The boat-shaped preretinal hemorrhage is a classic complication. First-line treatments are **Panretinal Photocoagulation (PRP)** or **intravitreal anti-VEGF injections** to regress the abnormal vessels and prevent further bleeding/traction."
            },
            {
                "q": "What molecular mediator is primarily responsible for driving the growth of abnormal new blood vessels in this condition?",
                "options": [
                    "Vascular Endothelial Growth Factor (VEGF)",
                    "Tumor Necrosis Factor-alpha (TNF-alpha)",
                    "Transforming Growth Factor-beta (TGF-beta)",
                    "Interleukin-6 (IL-6)",
                    "Basic Fibroblast Growth Factor (bFGF)"
                ],
                "answer": 0,
                "exp": "Retinal capillary closure causes widespread tissue **hypoxia**, which triggers the upregulation of hypoxia-inducible factor-1 (HIF-1). This drives the massive production and release of **Vascular Endothelial Growth Factor (VEGF)** by retinal astrocytes, Müller cells, and RPE, which stimulates abnormal angiogenesis."
            },
            {
                "q": "What is the mechanism by which Panretinal Photocoagulation (PRP) prevents visual loss in Proliferative Diabetic Retinopathy?",
                "options": [
                    "PRP ablates the hypoxic peripheral retina, reducing overall oxygen demand and decreasing VEGF production, saving the central macula",
                    "PRP directly coagulates the leaky neovascular vessels on the optic disc",
                    "PRP seals the vitreous membrane to the retina, preventing tractional tears",
                    "PRP increases the diameter of ciliary vessels to improve retinal blood flow",
                    "PRP stimulates the proliferation of pericytes to stabilize the vessels"
                ],
                "answer": 0,
                "exp": "**PRP** works by applying thousands of laser burns to the **hypoxic peripheral retina**, converting it into non-functioning scar tissue. This **reduces the overall metabolic demand and oxygen consumption of the retina**, eliminating the drive for **VEGF release**. With lower VEGF levels, the abnormal new vessels on the disc and retina regress, preserving central macular vision."
            }
        ]
    },
    # Template 3: Diabetic Macular Edema
    {
        "title": "The Central Blur of DME",
        "age_range": (50, 75),
        "va_affected": "20/80",
        "va_unaffected": "20/60",
        "scenario": (
            "A {age}-year-old {gender} with a 10-year history of diabetes presents with slowly progressive, painless blurring of central vision in both eyes, making it very difficult to read or drive. {possessive_cap} blood sugar is managed with insulin.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.4°F | HR: 76 bpm | BP: 140/88 mmHg\n"
            "*   **Visual Acuity:** Bilateral {va_affected} (no improvement with pinhole)\n"
            "*   **Ocular Examination:** Dilated fundus examination reveals multiple microaneurysms, dot hemorrhages, and a prominent ring of yellowish hard lipid exudates in the central macula. Slit-lamp biomicroscopy shows significant retinal thickening and swelling in the fovea. Optical coherence tomography (OCT) confirms bilateral cystoid macular edema with subretinal fluid."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the gold-standard treatment?",
                "options": [
                    "Diabetic Macular Edema (DME); intravitreal anti-VEGF injections",
                    "Dry AMD; high-dose AREDS2 vitamins",
                    "Central retinal vein occlusion; systemic heparin",
                    "Nuclear cataract; surgical lens extraction",
                    "Tractional retinal detachment; urgent vitrectomy"
                ],
                "answer": 0,
                "exp": "This is **Diabetic Macular Edema (DME)**, the most common cause of vision loss in diabetic patients. The gold-standard first-line treatment is **intravitreal anti-VEGF injections** (e.g., aflibercept, ranibizumab), which are highly effective at reducing macular thickness and improving visual acuity by closing endothelial tight junctions and stopping vessel leakage."
            },
            {
                "q": "What is the primary pathophysiological mechanism responsible for fluid accumulation in the macula in DME?",
                "options": [
                    "Breakdown of the blood-retinal barrier due to loss of endothelial tight junctions",
                    "Mechanical blockage of the ciliary veins at the scleral spur",
                    "An immune-mediated hypersensitivity reaction to insulin molecules",
                    "Tractional pull of the posterior vitreous face on the fovea",
                    "Hypersecretion of fluid by the ciliary body epithelium"
                ],
                "answer": 0,
                "exp": "DME is caused by the **breakdown of the blood-retinal barrier (BRB)**. Chronic hyperglycemia and vascular endothelial damage lead to the **loss of endothelial tight junctions (zonula occludens)**. This allows fluid, proteins, and lipids to leak from the capillaries into the extracellular space of the retina, particularly the macula."
            },
            {
                "q": "Which of the following imaging modalities is most essential for the diagnosis, quantification, and monitoring of Diabetic Macular Edema?",
                "options": [
                    "Optical Coherence Tomography (OCT)",
                    "Fluorescein Angiography (FA)",
                    "Ocular B-scan Ultrasound",
                    "CT scan of the orbits",
                    "Visual field testing (perimetry)"
                ],
                "answer": 0,
                "exp": "**Optical Coherence Tomography (OCT)** is the most essential, non-invasive imaging modality for DME. It uses light waves to capture high-resolution, cross-sectional images of the retina, allowing for the precise measurement of retinal thickness, quantification of macular edema, and monitoring of the response to anti-VEGF injections."
            }
        ]
    },
    # Template 4: Hypertensive Retinopathy (Mild/Moderate)
    {
        "title": "The Copper Wiring and AV Crossing",
        "age_range": (55, 78),
        "va_affected": "20/20",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old {gender} presenting for a routine eye exam is found to have a blood pressure of {bp_sys}/{bp_dia} mmHg. {pronoun_cap} has a history of essential hypertension but admits to frequently missing {possessive} antihypertensive medications.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.6°F | HR: {hr} bpm | BP: {bp_sys}/{bp_dia} mmHg\n"
            "*   **Visual Acuity:** Bilateral 20/20 (uncorrected)\n"
            "*   **Ocular Examination:** Dilated fundus examination reveals generalized narrowing and focal constriction of the retinal arterioles. The arteriolar light reflex is widened, giving the vessels a \"copper-wire\" appearance. There is prominent arteriovenous (AV) nicking, where arterioles cross and compress the underlying retinal veins. No hemorrhages or disc edema are present."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the primary management?",
                "options": [
                    "Moderate Hypertensive Retinopathy; strict systemic blood pressure control",
                    "Mild Diabetic Retinopathy; oral metformin and glucose monitoring",
                    "Central retinal artery occlusion; immediate ocular massage",
                    "Ocular ischemic syndrome; urgent carotid endarterectomy",
                    "Normal-tension glaucoma; topical prostaglandin drops"
                ],
                "answer": 0,
                "exp": "This patient has **Moderate Hypertensive Retinopathy** (Grade II on the Keith-Wagener-Barker classification), characterized by generalized/focal arteriolar narrowing, **copper wiring**, and **AV nicking** without hemorrhages or disc edema. The primary management is **strict systemic blood pressure control** to prevent further microvascular damage and reduce the risk of stroke/MI."
            },
            {
                "q": "What is the anatomical explanation for the sign known as 'arteriovenous (AV) nicking'?",
                "options": [
                    "The sclerotic arteriole compresses the underlying vein because they share a common adventitial sheath at crossing points",
                    "A localized thrombus forms in the vein due to turbulent flow under the arteriole",
                    "The arteriole and vein fuse, forming an abnormal micro-fistula",
                    "Inflammatory cells accumulate in the sub-adventitial space, obscuring the vein",
                    "The vein is pulled backward by contracting vitreous strands"
                ],
                "answer": 0,
                "exp": "**AV nicking** occurs because the **retinal arteriole and vein share a common adventitial sheath** where they cross. As chronic hypertension causes arteriolar wall hypertrophy and sclerosis, the stiffened, thickened arteriole physically compresses the underlying, thin-walled vein, making the vein appear compressed, tapered, or blocked on either side of the crossing."
            },
            {
                "q": "What represents the funduscopic sign known as 'silver wiring' in advanced hypertensive retinopathy?",
                "options": [
                    "Severe arteriolar wall sclerosis where the lumen is completely obscured and the vessel appears white and reflective",
                    "Deposition of calcium in the vessel wall",
                    "A plaque of cholesterol blocking a branch arteriole",
                    "White blood cells lining the endothelium of the arterioles",
                    "Calcification of the optic disc margin"
                ],
                "answer": 0,
                "exp": "**Silver wiring** is an advanced stage of arteriolar sclerosis (Keith-Wagener Grade III/IV). The arteriolar wall becomes so thick and opaque that the red blood column inside is completely invisible. The vessel reflects light completely, appearing as a **white, reflective, shiny wire**."
            }
        ]
    },
    # Template 5: Hypertensive Retinopathy (Severe)
    {
        "title": "The Macular Star and Papilledema",
        "age_range": (35, 55),
        "va_affected": "20/80",
        "va_unaffected": "20/80",
        "scenario": (
            "A {age}-year-old {gender} presents to the emergency department with a severe headache, nausea, and sudden blurry vision in both eyes. {possessive_cap} blood pressure is found to be {bp_sys}/{bp_dia} mmHg.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.8°F | HR: 95 bpm | BP: {bp_sys}/{bp_dia} mmHg\n"
            "*   **Visual Acuity:** Bilateral {va_affected}\n"
            "*   **Ocular Examination:** Dilated fundus exam reveals multiple flame-shaped hemorrhages, cotton-wool spots, a prominent, radial \"macular star\" of hard lipid exudates in both maculae, and bilateral marked swelling and blurring of the optic disc margins (Grade IV hypertensive retinopathy)."
        ),
        "questions": [
            {
                "q": "What is the most urgent medical intervention for this patient?",
                "options": [
                    "Controlled reduction of blood pressure using intravenous antihypertensives in an intensive care setting",
                    "Immediate bilateral panretinal photocoagulation laser therapy",
                    "High-dose systemic oral corticosteroids to reduce optic nerve swelling",
                    "Bilateral anterior chamber paracentesis to lower intraocular pressure",
                    "Urgent lumbar puncture to relieve intracranial pressure"
                ],
                "answer": 0,
                "exp": "This patient has **Severe/Malignant Hypertensive Retinopathy (Grade IV)**, presenting as a **hypertensive emergency**. The most urgent intervention is admission to an ICU for **controlled reduction of blood pressure** using IV medications (e.g., nitroprusside, labetalol) to prevent life-threatening end-organ damage (stroke, encephalopathy, renal failure). Aggressive, too-rapid BP reduction must be avoided to prevent optic nerve or cerebral ischemia."
            },
            {
                "q": "What is the composition and anatomical location of the 'macular star' seen in this patient?",
                "options": [
                    "Lipids and lipoproteins deposited in a radial pattern within the Henle's fiber layer of the macula",
                    "New blood vessels branching out from the central fovea",
                    "Calcium deposits in Bruch's membrane",
                    "Axoplasmic debris accumulating in the ganglion cell layer",
                    "Pockets of serous fluid under the neurosensory retina"
                ],
                "answer": 0,
                "exp": "The **macular star** is composed of **lipid and lipoprotein exudates** that leak from damaged, hyperpermeable peripapillary and retinal capillaries. These lipids are deposited in the **outer plexiform layer of the macula (specifically Henle's fiber layer)**, which has a unique, radially oriented anatomy, forcing the exudates into a star-like or fan-like pattern centered on the fovea."
            },
            {
                "q": "Which of the following represents the recommended rate of blood pressure reduction in the first hour of managing a hypertensive emergency?",
                "options": [
                    "Reduce the Mean Arterial Pressure (MAP) by no more than 20% to 25% in the first hour",
                    "Drop the BP immediately to 120/80 mmHg to prevent intracranial hemorrhage",
                    "Lower the systolic pressure to <90 mmHg to reduce ocular pressure",
                    "Maintain the BP at baseline and initiate oral beta-blockers for slow reduction over a week",
                    "Reduce the diastolic pressure by exactly 50% within the first 30 minutes"
                ],
                "answer": 0,
                "exp": "In a hypertensive emergency, the **Mean Arterial Pressure (MAP) should be lowered by no more than 20% to 25% in the first hour**, and then to stable levels (e.g., 160/100-110) over the next 2 to 6 hours. Lowering the BP too rapidly or to normal levels too quickly can cause **severe organ hypoperfusion**, resulting in ischemic stroke, myocardial infarction, or anterior ischemic optic neuropathy (AION) due to loss of autoregulation."
            }
        ]
    },
    # Template 6: Retinopathy of Prematurity
    {
        "title": "The Premature Baby's Ridge",
        "age_range": (0, 1), # Infant
        "va_affected": "Poor red reflex",
        "va_unaffected": "Poor red reflex",
        "scenario": (
            "A 2-month-old infant born at {gest_weeks} weeks gestation with a birth weight of {birth_weight} grams, who required high-flow supplemental oxygen therapy in the NICU for {nicu_days} days, undergoes a screening dilated eye exam.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Stable premature infant.\n"
            "*   **Ocular Examination (OU):** Dilated fundus exam reveals incomplete vascularization of the peripheral retina, with a prominent white demarcation line and an elevated ridge between the vascular and avascular zones, along with extraretinal fibrovascular proliferation extending into the vitreous (Stage 3 ROP). There is dilation and tortuosity of the posterior retinal vessels (\"plus disease\")."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what are the main risk factors?",
                "options": [
                    "Retinopathy of Prematurity (ROP); premature birth (<30 weeks), low birth weight (<1500g), and supplemental oxygen therapy",
                    "Persistent Fetal Vasculature (PFV); maternal rubella infection in utero",
                    "Retinoblastoma; hereditary mutation in the RB1 gene",
                    "Congenital cataracts; autosomal dominant inheritance",
                    "Coats' disease; idiopathic retinal telangiectasia in young males"
                ],
                "answer": 0,
                "exp": "This infant has **Retinopathy of Prematurity (ROP)**. The primary risk factors are **extreme prematurity (gestational age <30 weeks)**, **low birth weight (<1500 grams)**, and **supplemental oxygen therapy**. High-flow oxygen in the NICU disrupts normal peripheral retinal vascular development, leading to hypoxia and abnormal neovascularization once returned to room air."
            },
            {
                "q": "What is the dual-phase pathophysiological mechanism of ROP driven by oxygen levels?",
                "options": [
                    "Hyperoxia causes downregulation of VEGF, halting vascular growth; subsequent relative hypoxia in room air triggers massive VEGF upregulation and neovascularization",
                    "Hyperoxia directly toxic to ciliary nerves, paralyzing pupil; relative hypoxia causes iris necrosis",
                    "Oxygen causes primary thrombi in the central retinal artery, followed by venous bleeding",
                    "Oxygen stimulates the direct migration of corneal stem cells into the vitreous cavity",
                    "Relative hypoxia causes mechanical tearing of the retina due to scleral stretching"
                ],
                "answer": 0,
                "exp": "ROP is a **two-phase disease**: (1) **Hyperoxia Phase**: The high oxygen environment of the incubator downregulates VEGF, causing normal vessel growth to halt. (2) **Hypoxia Phase**: When the infant is removed from supplemental oxygen, the avascular peripheral retina becomes ischemic and highly hypoxic, triggering a **massive upregulation of VEGF**. This drives abnormal, fragile neovascularization at the boundary of the vascularized retina."
            },
            {
                "q": "What represents the definition and significance of 'plus disease' in Retinopathy of Prematurity?",
                "options": [
                    "Severe dilation and tortuosity of the posterior retinal vessels, indicating high disease activity and a need for treatment",
                    "The presence of bilateral congenital cataracts alongside retinal changes",
                    "An elevated intraocular pressure >21 mmHg in both eyes",
                    "The development of a tractional retinal detachment in Stage 5",
                    "The presence of a patent ductus arteriosus in the infant"
                ],
                "answer": 0,
                "exp": "**'Plus disease'** is defined by **marked dilation and tortuosity of the retinal blood vessels in the posterior pole** (in at least two quadrants). It indicates severe shunting and highly active neovascularization, representing a key threshold sign that warrants **prompt treatment** (laser photocoagulation or anti-VEGF) to prevent progression to retinal detachment."
            }
        ]
    },
    # Template 7: Sickle Cell Retinopathy
    {
        "title": "The Sea-Fan Neovascularization",
        "age_range": (20, 35),
        "va_affected": "20/80",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old African American {gender} with HbSC sickle cell disease presents with sudden onset of multiple floaters and mild visual loss in the {eye_side} eye. {pronoun_cap} has had no recent sickle cell crises.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.4°F | HR: 72 bpm | BP: 118/76 mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Dilated fundus examination reveals multiple peripheral retinal arteriolar occlusions, with localized areas of retinal thinning. In the temporal periphery, there are multiple abnormal branching vessels resembling sea-fans (\"sea-fan neovascularization\") arising from the boundary of the vascularized retina, along with a localized vitreous hemorrhage."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and which sickle cell genotype is most commonly associated with severe proliferative retinopathy?",
                "options": [
                    "Sickle Cell Retinopathy; HbSC and HbS-Thal genotypes are more commonly associated with severe proliferative disease than HbSS",
                    "Sickle Cell Retinopathy; HbSS genotype is far more common and severe than HbSC",
                    "Proliferative Diabetic Retinopathy; HbSS genotype is highly protective",
                    "Eales' disease; HbAS (carrier) is the only associated genotype",
                    "Coats' disease; HbSS genotype is diagnostic"
                ],
                "answer": 0,
                "exp": "This is **Sickle Cell Retinopathy**. Interestingly, proliferative retinopathy is **more common and severe in HbSC and HbS-Beta-Thalassemia genotypes** than in the homozygous HbSS genotype (which has more severe systemic vaso-occlusive crises but fewer ocular vascular occlusions). Classic signs are peripheral arteriolar occlusions and **\"sea-fan\" neovascularization**."
            },
            {
                "q": "What represents the classic non-proliferative fundus signs known as 'salmon-patch' and 'black sunburst' in sickle cell disease?",
                "options": [
                    "Salmon-patch: intraretinal/subretinal hemorrhage that turns yellow-pink; Black sunburst: localized RPE hyperpigmentation from old blood",
                    "Salmon-patch: congenital choroidal hemangioma; Black sunburst: optic disc calcification",
                    "Salmon-patch: lipid exudates in Henle's layer; Black sunburst: cotton-wool spots surrounding the macula",
                    "Salmon-patch: RPE atrophy; Black sunburst: choroidal neovascular membrane",
                    "Salmon-patch: ciliary body cysts; Black sunburst: iris transillumination defects"
                ],
                "answer": 0,
                "exp": "**Salmon-patch hemorrhages** are dome-shaped intraretinal/subretinal hemorrhages in the mid-periphery that liquefy and turn orange-pink over time. **Black sunbursts** are round, dark, hyperpigmented lesions in the peripheral retina caused by hyperplasia of the RPE in response to localized subretinal hemorrhage, representing old, cleared blood."
            },
            {
                "q": "Why is the use of carbonic anhydrase inhibitors (particularly systemic acetazolamide) strictly CONTRAINDICATED in patients with sickle cell disease who develop elevated intraocular pressure?",
                "options": [
                    "Acetazolamide induces systemic acidosis and dehydration, which directly promotes sickling of erythrocytes, worsening vascular occlusion",
                    "Acetazolamide causes severe macular edema in sickle cell patients",
                    "Acetazolamide has no efficacy in lowering IOP in these patients",
                    "Acetazolamide triggers an autoimmune hemolytic anemia",
                    "Acetazolamide reacts with hemoglobin S to cause corneal calcification"
                ],
                "answer": 0,
                "exp": "Systemic **acetazolamide** (and other CAIs) is **strictly contraindicated in sickle cell disease**. It causes systemic metabolic acidosis and dehydration, which increases the concentration of sickled cells and **promotes sickling of erythrocytes**. In the eye, sickling of RBCs in the anterior chamber can completely block the trabecular meshwork, causing a rapid, uncontrollable IOP spike. Methazolamide or topical drops (excluding CAIs) are used instead."
            }
        ]
    },
    # Template 8: Central Serous Chorioretinopathy
    {
        "title": "The Stress-Induced Spot",
        "age_range": (30, 48),
        "va_affected": "20/40",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old male corporate executive presents with a sudden, painless central gray spot (scotoma) and distortion of shapes (metamorphopsia) in {possessive} {eye_side} eye. He reports high stress at work and recently received a corticosteroid injection for shoulder pain.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.4°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected} (no improvement with pinhole); contralateral eye: 20/20\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Anterior segment is quiet. Dilated fundus exam reveals a well-demarcated, dome-like elevation of the sensory retina in the central macula. No hemorrhages, drusen, or cotton-wool spots are seen. OCT confirms a localized serous detachment of the neurosensory retina with a normal-thickness choroid."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the initial management step?",
                "options": [
                    "Central Serous Chorioretinopathy (CSCR); discontinue all corticosteroids, reduce stress, and observe",
                    "Wet AMD; immediate intravitreal anti-VEGF injection",
                    "Rhegmatogenous retinal detachment; urgent pneumatic retinopexy",
                    "Optic neuritis; initiate high-dose intravenous methylprednisolone",
                    "CMV retinitis; start systemic valganciclovir"
                ],
                "answer": 0,
                "exp": "This is **Central Serous Chorioretinopathy (CSCR)**, typically affecting young/middle-aged males under high stress (type A personality) or using **corticosteroids** (oral, topical, inhaled, or joint injection). The initial step is to **discontinue all corticosteroids**, manage stress, and **observe**, as 80-90% of cases resolve spontaneously within 3 to 4 months without intervention."
            },
            {
                "q": "What is the primary pathophysiological defect leading to fluid leakage under the macula in CSCR?",
                "options": [
                    "Choroidal hyperpermeability combined with focal dysfunction of the retinal pigment epithelium (RPE) barrier",
                    "Tractional pulling of the fovea by a vitreous membrane",
                    "Thrombosis of the vortex veins leading to back-pressure",
                    "Autoimmune destruction of the macular photoreceptors",
                    "Hypersecretion of aqueous humor by the ciliary muscle"
                ],
                "answer": 0,
                "exp": "The primary defect in CSCR is **choroidal hyperpermeability** (possibly driven by high cortisol/epinephrine levels). The hyper-permeable choroid causes fluid to build up under the RPE, eventually leading to a **focal defect or breakdown in the RPE tight junctions (outer blood-retinal barrier)**, allowing fluid to leak into the subretinal space, separating the retina from the RPE."
            },
            {
                "q": "Which classic pattern is visible on fluorescein angiography during active fluid leakage in CSCR?",
                "options": [
                    "A 'smokestack' or 'ink-blot' leak of dye rising through the RPE into the subretinal space",
                    "A 'cherry-red' block of dye in the central foveola",
                    "A 'blood and thunder' diffuse blockage of choroidal fluorescence",
                    "A 'Swiss-cheese' pattern of late hyperfluorescence at the optic disc",
                    "Multiple peripheral 'sea-fan' branching leaks"
                ],
                "answer": 0,
                "exp": "On **fluorescein angiography (FA)**, CSCR classically presents as an **'ink-blot' leak** (a expanding spot of dye) or a **'smokestack' leak** (where dye rises vertically through the RPE leak and spreads horizontally, resembling a plume of smoke, due to convection currents in the subretinal fluid)."
            }
        ]
    },
    # Template 9: Radiation Retinopathy
    {
        "title": "The Post-Radiation Blur",
        "age_range": (45, 72),
        "va_affected": "20/100",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old {gender} presents with slowly progressive, painless blurring of central vision in {possessive} {eye_side} eye. {pronoun_cap} has a history of undergoing radiation therapy for a head and neck squamous cell carcinoma 3 years ago. {pronoun_cap} is not diabetic.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 130/80 mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: 20/20\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Dilated fundus examination reveals extensive capillary loss, microaneurysms, flame-shaped and dot hemorrhages, cotton-wool spots, and macular edema, closely mimicking diabetic retinopathy but without a history of diabetes or hyperglycemia."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis?",
                "options": [
                    "Radiation retinopathy",
                    "Diabetic retinopathy",
                    "Ocular ischemic syndrome",
                    "Central retinal vein occlusion",
                    "CMV retinitis"
                ],
                "answer": 0,
                "exp": "This is **Radiation Retinopathy**, a delayed complication of ionizing radiation to the eye or surrounding structures (e.g. sinuses, brain, head/neck). It closely mimics diabetic retinopathy due to progressive **damage to vascular endothelial cells**, leading to capillary occlusion, retinal ischemia, exudation, and macular edema."
            },
            {
                "q": "What is the typical latency period between radiation exposure and the development of Radiation Retinopathy?",
                "options": [
                    "1 to 5 years, depending on the radiation dose and volume",
                    "2 to 7 days, representing acute tissue burn",
                    "Exactly 10 to 15 years, representing late genetic transformation",
                    "Radiation retinopathy occurs immediately during the first fraction of therapy",
                    "There is no latency; it only occurs during active radiation treatment"
                ],
                "answer": 0,
                "exp": "Radiation retinopathy has a **latency period of 1 to 5 years** (typically peak onset at 2 to 3 years) between the completion of radiation therapy and the onset of clinical symptoms. The latency is inversely related to the total radiation dose delivered to the eye (doses >30-35 Gy carry high risk)."
            },
            {
                "q": "What is the first-line treatment for managing vision loss from macular edema in Radiation Retinopathy?",
                "options": [
                    "Intravitreal anti-VEGF injections or focal/grid laser therapy",
                    "Urgent surgical pars plana vitrectomy",
                    "High-dose systemic oral corticosteroids",
                    "Intravitreal injections of broad-spectrum antibiotics",
                    "Bilateral panretinal photocoagulation (PRP) immediately"
                ],
                "answer": 0,
                "exp": "Treatment for radiation retinopathy is directed at complications, primarily macular edema and neovascularization. First-line therapy for macular edema is **intravitreal anti-VEGF injections** (aflibercept, ranibizumab) or **focal/grid laser**, similar to diabetic macular edema. PRP is used if proliferative neovascularization develops."
            }
        ]
    },
    # Template 10: Purtscher's Retinopathy
    {
        "title": "The Post-Traumatic White Patches",
        "age_range": (20, 45),
        "va_affected": "20/200",
        "va_unaffected": "20/200",
        "scenario": (
            "A {age}-year-old {gender} is brought to the emergency department after a severe motor vehicle collision with massive chest wall compression and bilateral femur fractures. {pronoun_cap} complains of sudden, profound loss of vision in both eyes that occurred shortly after the accident.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.6°F | HR: 110 bpm | BP: 100/60 mmHg\n"
            "*   **Ocular Examination (OU):** Dilated fundus examination reveals multiple, large, polygonal white patches of retinal whitening (\"Purtscher flecken\") and multiple cotton-wool spots surrounding the optic nerve head bilaterally, accompanied by scattered flame-shaped hemorrhages. The optic discs are normal."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis?",
                "options": [
                    "Purtscher's retinopathy",
                    "Terson's syndrome",
                    "Traumatic optic neuropathy",
                    "Malignant hypertensive retinopathy",
                    "CMV retinitis"
                ],
                "answer": 0,
                "exp": "This is **Purtscher's Retinopathy**, a post-traumatic chorioretinopathy associated with severe head or **thoracic compression injury**, long-bone fractures, or acute pancreatitis. Classic fundus findings are **Purtscher flecken** (polygonal areas of inner retinal whitening) and cotton-wool spots located in the peripapillary region, with sudden bilateral visual loss."
            },
            {
                "q": "What is the primary proposed pathophysiological mechanism driving Purtscher's Retinopathy?",
                "options": [
                    "Leukoembolization of microvasculature by granulocyte aggregates triggered by complement activation",
                    "Direct mechanical shearing of the central retinal artery during trauma",
                    "Autoimmune destruction of the retinal nerve fiber layer by anti-retinal antibodies",
                    "Massive vitreous hemorrhage blocking the visual axis",
                    "Retrobulbar hemorrhage compressing the optic nerve in the canal"
                ],
                "answer": 0,
                "exp": "The primary mechanism is **leukoembolization**. Severe trauma, complement activation, or fat emboli from long-bone fractures cause the aggregation of white blood cells (granulocytes), platelets, or lipids. These **microemboli clog the precapillary arterioles** of the peripapillary retina, leading to focal microinfarcts (cotton-wool spots) and localized inner retinal ischemia (Purtscher flecken)."
            },
            {
                "q": "What represents the classic funduscopic finding known as 'Purtscher flecken' that distinguishes this condition?",
                "options": [
                    "Polygonal areas of inner retinal whitening located between the retinal arterioles and venules, sparing the immediate peripapillary zone",
                    "Splinter hemorrhages at the optic disc margin",
                    "Extracellular yellowish drusen in the central macula",
                    "Demarcation line and ridge in the peripheral retina",
                    "A bright cherry-red spot in the foveola"
                ],
                "answer": 0,
                "exp": "**Purtscher flecken** are **polygonal areas of inner retinal whitening** located between the retinal arterioles and venules. They characteristically **spare the immediate peripapillary zone** (within 0.5 disc diameters) because of the different vascular supply (cilioretinal) and are highly pathognomonic for this trauma-related or pancreatitis-related micro-embolization."
            }
        ]
    }
]

# =========================================================================
# 4. CATARACT & LENS DISORDERS TEMPLATES
# =========================================================================
templates["cataract"] = [
    # Template 1: Nuclear Sclerotic Cataract
    {
        "title": "The Myopic Shift of Age",
        "age_range": (65, 82),
        "va_affected": "20/70",
        "va_unaffected": "20/25",
        "scenario": (
            "A {age}-year-old {gender} presents with slowly progressive, painless blurring of vision in both eyes over the past {duration} years. "
            "{pronoun_cap} reports having difficulty reading distance street signs and highway markers. Interestingly, {pronoun} notes a surprising "
            "improvement in {possessive} near vision, allowing {possessive} to read the newspaper without reading glasses for the first time in a decade.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected} (no improvement with pinhole); contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** The anterior chamber is deep and quiet. Slit-lamp biomicroscopy of the lens reveals "
            "significant yellow-to-amber discoloration and moderate compaction of the lens nucleus. The contralateral lens shows similar but milder changes. "
            "Dilated fundus exam reveals normal optic discs with a cup-to-disc ratio of 0.3 OU, and a normal macula."
        ),
        "questions": [
            {
                "q": "Which of the following represents the primary mechanism behind the patient's temporary improvement in near vision?",
                "options": [
                    "Increased refractive power of the lens due to increased density and nuclear compaction, causing a myopic shift",
                    "Spontaneous flattening of the cornea leading to decreased hyperopic refractive error",
                    "Upregulation of ciliary muscle contractility compensating for presbyopia",
                    "Regeneration of accommodation capacity in the crystalline lens fibers",
                    "Resolution of underlying subclinical macular edema"
                ],
                "answer": 0,
                "exp": "This patient has a **nuclear sclerotic cataract**, which characteristically causes a **myopic shift** (often referred to as **'second sight'**). The gradual compaction and sclerosis of the lens nucleus increase its refractive index, shifting the patient's focal point closer. This allows presbyopic patients to temporarily read near print without reading glasses, though at the expense of distance vision."
            },
            {
                "q": "Which of the following is the primary biochemical change associated with the development of nuclear sclerotic cataracts?",
                "options": [
                    "Aggregation and insolubilization of lens crystallin proteins, along with accumulation of urochrome pigment",
                    "Hydration of lens cortical fibers due to osmotic swelling",
                    "Proliferation of anterior lens epithelial cells on the capsular bag",
                    "Deposition of systemic calcium salts within the lens stroma",
                    "Autoimmune degradation of the lens capsule matrix"
                ],
                "answer": 0,
                "exp": "Nuclear sclerotic cataracts are characterized by **aggregation and insolubilization of lens crystallin proteins**, along with the **accumulation of urochrome pigment** (which causes the yellow/brown coloration). This pigment filters out blue light and contributes to decreased color perception and contrast sensitivity."
            },
            {
                "q": "Which of the following is the most appropriate next step in the management of this patient?",
                "options": [
                    "Cataract extraction and intraocular lens (IOL) implantation if the vision impairment interferes with activities of daily living",
                    "Prescribing daily topical non-steroidal anti-inflammatory drops to halt cataract progression",
                    "Immediate referral for YAG laser capsulotomy to clear the visual axis",
                    "Initiation of systemic high-dose vitamin A and lutein supplementation",
                    "Performing urgent surgical trabeculectomy to prevent secondary glaucoma"
                ],
                "answer": 0,
                "exp": "The definitive treatment for cataracts is **cataract extraction and intraocular lens (IOL) implantation**. The indication for surgery is functional visual impairment that interferes with the patient's activities of daily living (e.g. driving, reading). There are no approved pharmacologic agents to halt or reverse cataract formation."
            }
        ]
    },
    # Template 2: Cortical Cataract
    {
        "title": "The Glare of Headlights",
        "age_range": (60, 78),
        "va_affected": "20/50",
        "va_unaffected": "20/30",
        "scenario": (
            "A {age}-year-old {gender} presents complaining of progressive difficulty driving at night. {pronoun_cap} reports experiencing "
            "debilitating glare and starbursts from the headlights of oncoming cars, which makes night driving extremely stressful. "
            "{possessive_cap} distance vision has also become progressively blurry over the past {duration} years.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected} (no improvement with pinhole); contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Slit-lamp biomicroscopy reveals white, wedge-shaped opacities extending from the peripheral lens cortex "
            "towards the center in a spoke-like pattern, particularly in the nasal and inferior quadrants. The lens nucleus is relatively clear. "
            "Fundus examination is normal with clear visualization of the retina."
        ),
        "questions": [
            {
                "q": "Which of the following slit-lamp findings is most pathognomonic for a cortical cataract?",
                "options": [
                    "Wedge-shaped, spoke-like opacities starting in the peripheral cortex",
                    "Golden-brown discoloration of the central lens nucleus",
                    "A granular, plaque-like opacity in the central posterior subcapsular area",
                    "Multiple small, hyper-pigmented spots on the anterior lens capsule",
                    "A subluxated lens showing stretched zonular fibers"
                ],
                "answer": 0,
                "exp": "**Cortical cataracts** classically present as **wedge-shaped, spoke-like opacities** that start in the peripheral cortex and progress toward the center of the lens. They are best visualized with retroillumination, where they appear as dark silhouettes against the red reflex."
            },
            {
                "q": "What is the primary underlying pathophysiological process driving cortical cataract formation?",
                "options": [
                    "Hydration and swelling of lens cortical fibers, leading to vacuole formation and clefting along suture lines",
                    "Direct chemical oxidation of central nuclear crystallins by free radicals",
                    "Proliferation and migration of equatorial lens epithelial cells to the posterior pole",
                    "Deposition of blood-derived lipids in the peripheral lens stroma",
                    "Primary loss of ciliary body perfusion leading to lens ischemia"
                ],
                "answer": 0,
                "exp": "Cortical cataracts are driven by **hydration and swelling of lens cortical fibers**. This occurs due to disruption of the lens cell membrane integrity and the activity of the Na+/K+ ATPase pump. Water enters the lens, causing vacuole formation and subsequent **clefting along the natural lens suture lines**, presenting as the classic cortical spokes."
            },
            {
                "q": "Which visual symptom is most specifically associated with cortical cataracts compared to nuclear sclerotic cataracts?",
                "options": [
                    "Severe glare, starbursts, and monocular diplopia due to irregular light scattering",
                    "Surprising improvement in near vision (second sight)",
                    "A central gray scotoma with distorted lines",
                    "Severe, throbbing ocular pain and redness",
                    "Fluctuating visual acuity related to systemic blood glucose levels"
                ],
                "answer": 0,
                "exp": "Cortical cataracts are highly associated with **significant glare, starbursts, and halos** (especially at night from headlights) due to the irregular refraction and scattering of light as it passes through the peripheral cortical opacities. They can also cause **monocular diplopia** or polyopia due to the split-refractive properties of the hydrated lens clefts."
            }
        ]
    },
    # Template 3: Posterior Subcapsular Cataract (PSC)
    {
        "title": "The Steroid-Induced Plaque",
        "age_range": (35, 60),
        "va_affected": "20/100",
        "va_unaffected": "20/30",
        "scenario": (
            "A {age}-year-old {gender} with a history of severe asthma requiring frequent courses of systemic corticosteroids and daily inhaled fluticasone "
            "presents with a rapid, painless decrease in vision in {possessive} {eye_side} eye over the past {duration} months. {pronoun_cap} reports "
            "that {possessive} near vision is particularly severely affected, making it nearly impossible to read books or look at {possessive} phone. "
            " {pronoun_cap} also complains of disabling glare in bright sunlight.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected} (no improvement with pinhole); contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Anterior chamber is deep and quiet. Slit-lamp exam of the lens reveals a dense, granular, plaque-like "
            "opacity located on the posterior surface of the lens, directly in the visual axis. The lens nucleus and cortex are clear. "
            "The intraocular pressure is 15 mmHg OU. Dilated fundus examination is normal."
        ),
        "questions": [
            {
                "q": "Which of the following is the most likely diagnosis?",
                "options": [
                    "Posterior subcapsular cataract (PSC)",
                    "Nuclear sclerotic cataract",
                    "Cortical cataract",
                    "Posterior capsular opacification (PCO)",
                    "Traumatic cataract"
                ],
                "answer": 0,
                "exp": "This patient has a **Posterior Subcapsular Cataract (PSC)**. Key features include the **plaque-like, granular opacity** on the posterior surface of the lens, a history of **corticosteroid use**, a **relatively young age**, and **disproportionately severe loss of near vision** and glare in bright conditions because the opacity is located directly in the nodal point of the eye."
            },
            {
                "q": "What is the cellular origin of a posterior subcapsular cataract?",
                "options": [
                    "Abnormal migration and swelling of lens epithelial cells from the equator to the posterior pole, forming Wedl (bladder) cells",
                    "Necrosis of the central lens fiber cells due to chronic ischemia",
                    "Deposition of macrophages that have engulfed leaked lens proteins",
                    "Proliferation of iris pigment epithelial cells onto the anterior lens capsule",
                    "Myofibroblastic transdifferentiation of keratocytes in the corneal stroma"
                ],
                "answer": 0,
                "exp": "PSCs arise from the **abnormal migration and swelling of lens epithelial cells**. Normally, lens epithelial cells are located on the anterior surface and migrate to the equator to differentiate into lens fibers. In PSC, these cells aberrantly migrate posteriorly to the posterior pole, where they swell and become large, nucleated, vacuolated cells known as **Wedl cells** or **bladder cells**, forming the posterior plaque."
            },
            {
                "q": "Why does a posterior subcapsular cataract affect near vision more severely than distance vision?",
                "options": [
                    "Accommodative pupillary constriction (miosis) focuses light directly through the central posterior opacity",
                    "The lens becomes extremely rigid and prevents accommodation completely",
                    "Near vision requires a wider pupil, which exposes the peripheral cortical clefts",
                    "The posterior capsule is physically connected to the ciliary zonules",
                    "Corticosteroids selectively damage the macular photoreceptors responsible for near vision"
                ],
                "answer": 0,
                "exp": "PSC affects **near vision more severely** because during near vision, the accommodation reflex triggers **pupillary constriction (miosis)**. This constricts the light path, forcing light to pass directly through the **small, central, posterior subcapsular plaque** located at the nodal point of the eye. In contrast, in dimmer light or distance vision, a slightly wider pupil allows light to pass around the central opacity, resulting in better distance acuity."
            }
        ]
    },
    # Template 4: Congenital Cataract
    {
        "title": "The Absent Red Reflex",
        "age_range": (0, 1), # Infant
        "va_affected": "Poor fix and follow",
        "va_unaffected": "Normal",
        "scenario": (
            "A {age}-month-old infant is brought to the pediatric ophthalmology clinic by {possessive} parents who noticed an abnormal white appearance "
            "in the baby's left pupil on a family photograph. The mother notes the baby does not seem to track toys or look at {possessive} face "
            "as well when the right eye is covered.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Stable infant.\n"
            "*   **Visual Acuity:** Central, steady, and maintained in the right eye; poor fixation and tracking in the left eye.\n"
            "*   **Ocular Examination:** The right eye shows a normal, bright red reflex. The left eye has an absent red reflex, replaced by a dense, white, "
            "homogeneous opacity in the center of the pupil (leukocoria). Handheld slit-lamp exam reveals a dense, central nuclear lens opacity. "
            "The cornea is clear and corneal diameters are symmetric. No signs of intraocular inflammation or retinoblastoma are noted on B-scan ultrasound."
        ),
        "questions": [
            {
                "q": "What is the most critical management priority for a dense, unilateral congenital cataract?",
                "options": [
                    "Urgent surgical cataract extraction within the first 6 to 8 weeks of life to prevent irreversible deprivation amblyopia",
                    "Watchful waiting and visual stimulation therapy until the child is at least 5 years old",
                    "Initiation of daily topical corticosteroid drops to clear the lens opacity",
                    "Fitting with custom glasses and scheduling surgery at school age",
                    "Immediate systemic antiviral therapy for suspected congenital CMV"
                ],
                "answer": 0,
                "exp": "A dense, unilateral congenital cataract is a **visual emergency**. It must be treated with **urgent surgical extraction (lensectomy) within the first 6 to 8 weeks of life**. Delaying surgery beyond the critical period of visual development leads to permanent, irreversible **deprivation amblyopia**, as the visual cortex fails to develop proper synaptic connections with the affected eye."
            },
            {
                "q": "Which congenital infection is most classically associated with congenital cataracts, microphthalmia, and sensorineural hearing loss?",
                "options": [
                    "Congenital Rubella Syndrome",
                    "Congenital Toxoplasmosis",
                    "Congenital Syphilis",
                    "Congenital Cytomegalovirus",
                    "Congenital Herpes Simplex Virus"
                ],
                "answer": 0,
                "exp": "**Congenital Rubella Syndrome** is classically associated with the triad of **cataracts** (often bilateral), **microphthalmia/pigmentary retinopathy**, **sensorineural hearing loss**, and **cardiac defects** (patent ductus arteriosus). The rubella virus directly infects the developing lens vesicle in utero before the capsule forms, leading to chronic replication within the lens fibers."
            },
            {
                "q": "Following congenital cataract surgery in an infant, what is the primary method of visual rehabilitation to prevent amblyopia?",
                "options": [
                    "Fitting with a high-power contact lens (aphakic contact lens) and patching the contralateral eye (occlusion therapy)",
                    "Implantation of a standard adult monofocal intraocular lens without patching",
                    "Prescribing standard bifocal glasses and hoping the eyes self-correct",
                    "Performing daily laser therapy to stimulate the macula",
                    "There is no effective visual rehabilitation method for aphakic infants"
                ],
                "answer": 0,
                "exp": "Visual rehabilitation in an aphakic infant is crucial. Because the infant's eye is small and rapidly growing, primary IOL implantation is highly challenging and risky. Therefore, infants are rehabilitated with a **high-power aphakic contact lens** (or aphakic glasses for bilateral cases) to correct the severe refractive error, combined with **occlusion therapy (patching of the normal eye)** to force the brain to use the surgical eye and prevent amblyopia."
            }
        ]
    },
    # Template 5: Traumatic Cataract
    {
        "title": "The Blunt Rosette",
        "age_range": (18, 35),
        "va_affected": "20/80",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old {gender} presents with a 3-month history of progressive visual blur in {possessive} {eye_side} eye. "
            "Upon questioning, {pronoun} recalls being struck in that eye by a tennis ball during a match approximately 8 months ago. "
            "{pronoun_cap} experienced temporary pain and bruising but did not seek medical attention at the time.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected} (no improvement with pinhole); contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Anterior chamber is deep and quiet. Gonioscopy shows 15% angle recession inferiorly. "
            "Slit-lamp exam of the lens reveals a classic rosette-shaped or star-shaped cortical opacity located in the posterior subcapsular region. "
            "The ciliary zonules appear intact, and there is no lens subluxation or phacodonesis. The intraocular pressure is 14 mmHg OU."
        ),
        "questions": [
            {
                "q": "Which classic morphology is most characteristic of a cataract caused by blunt, non-penetrating ocular trauma?",
                "options": [
                    "Rosette-shaped or stellate-shaped cortical opacity",
                    "Dense, golden-brown nuclear compaction",
                    "Amber-colored central oil-droplet opacity",
                    "Wedge-shaped, spoke-like peripheral clefts",
                    "White, flaky, dandruff-like deposits on the anterior capsule"
                ],
                "answer": 0,
                "exp": "Blunt, non-penetrating ocular trauma characteristically causes a **rosette-shaped or stellate-shaped cortical opacity**, typically located in the posterior or anterior subcapsular cortex. The concussive wave transmission through the eye disrupts the lens fibers, leading to fluid accumulation along the suture lines in this unique flower-like pattern."
            },
            {
                "q": "What is the primary pathophysiology behind traumatic cataract formation after blunt trauma?",
                "options": [
                    "Disruption of the lens capsule or ciliary zonules, allowing aqueous humor to enter and hydrate the lens fibers",
                    "Direct chemical necrosis of lens crystallins by inflammatory cytokines",
                    "Secondary calcification of the posterior lens capsule due to intraocular hemorrhage",
                    "Localized ischemia of the ciliary body processes that supply the lens",
                    "A chronic, low-grade bacterial infection of the lens cortex"
                ],
                "answer": 0,
                "exp": "Blunt trauma causes **micro-ruptures or increased permeability of the lens capsule** (or direct injury to the subcapsular lens fibers). This allows **aqueous humor to enter and hydrate the lens fibers**, leading to localized opacification and swelling. Over time, this focal hydration spreads, often resulting in a mature, completely opaque cataract."
            },
            {
                "q": "What other clinical finding must be ruled out in a patient with a traumatic cataract before planning surgery?",
                "options": [
                    "Zonular dialysis, angle recession, and secondary glaucoma",
                    "Congenital dacryostenosis and tear duct block",
                    "Pseudoexfoliative deposits on the corneal endothelium",
                    "A contralateral optic nerve Drance hemorrhage",
                    "An underlying mutation in the fibrillin-1 gene"
                ],
                "answer": 0,
                "exp": "Prior blunt trauma carries a high risk of **zonular dialysis** (weakness/tearing of the lens support cords), **angle recession** (tearing of the iris insertion, which can lead to late secondary glaucoma), and **vitreous prolapse**. The surgeon must carefully evaluate for iris and lens tremulousness (iridodonesis/phacodonesis) and angle structure, as zonular weakness significantly complicates cataract surgery."
            }
        ]
    },
    # Template 6: Morgagnian (Hypermature) Cataract
    {
        "title": "The Liquefied Cortex",
        "age_range": (72, 90),
        "va_affected": "Hand Motion",
        "va_unaffected": "20/40",
        "scenario": (
            "A {age}-year-old {gender} from an underserved rural community presents with profound, painless vision loss in {possessive} {eye_side} eye. "
            "{pronoun_cap} reports that the eye has been virtually blind for over {duration} years, but {pronoun} did not seek treatment due to lack of local services "
            "and fear of surgery.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: Hand Motion (good light projection); contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Anterior chamber is deep. Slit-lamp biomicroscopy of the lens reveals a completely "
            "white, opaque lens. The lens cortex has completely liquefied into a milky white fluid. The dense, brown, sclerotic lens nucleus is "
            "clearly visible, having subsided and sunk to the bottom of the capsular bag. The anterior lens capsule appears wrinkled and thickened. "
            "There is no active inflammation or elevated IOP today."
        ),
        "questions": [
            {
                "q": "What is the diagnosis for this specific type of hypermature cataract?",
                "options": [
                    "Morgagnian cataract",
                    "Nuclear sclerotic cataract",
                    "Posterior subcapsular cataract",
                    "Cortical cataract",
                    "Phacolytic cataract"
                ],
                "answer": 0,
                "exp": "This is a **Morgagnian cataract**, which is a specific form of **hypermature cataract**. In this advanced stage, the lens cortex undergoes enzymatic degeneration and **completely liquefies into a milky fluid**. Lacking support, the dense, dehydrated, **sclerotic nucleus sinks** to the bottom of the capsular bag under the influence of gravity."
            },
            {
                "q": "Which of the following represents a serious, potentially blinding ocular emergency associated with hypermature cataracts?",
                "options": [
                    "Phacolytic glaucoma, caused by the leakage of high-molecular-weight lens proteins through the intact capsule",
                    "Phacoanaphylactic endophthalmitis, a direct autoimmune response to a ruptured lens capsule",
                    "Acute primary angle-closure glaucoma due to pupillary block",
                    "Tractional retinal detachment due to vitreal-capsular bands",
                    "Neovascular glaucoma driven by chronic lens ischemia"
                ],
                "answer": 0,
                "exp": "Hypermature cataracts carry a high risk of **phacolytic glaucoma**. As the cortex liquefies, **high-molecular-weight lens proteins leak** through microscopic pores in the degenerating, wrinkled anterior lens capsule. Macrophages migrate to engulf these foreign proteins. Both the proteins and protein-laden macrophages physically clog the trabecular meshwork, causing a rapid, severe rise in IOP in a deep-chambered, quiet eye."
            },
            {
                "q": "What is the primary surgical challenge encountered during the extraction of a Morgagnian cataract?",
                "options": [
                    "Creating a continuous curvilinear capsulorhexis in a highly pressurized capsular bag with poor visualization of the capsule",
                    "Fragility of the corneal epithelium under standard ultrasound energy",
                    "An increased risk of severe retrobulbar hemorrhage during anesthesia",
                    "Severe intraoperative miosis that does not respond to epinephrine",
                    "Finding a specialized IOL designed to fit in a liquefied capsule"
                ],
                "answer": 0,
                "exp": "The primary surgical challenge is **creating a safe capsulorhexis**. The liquefied cortex creates a **highly pressurized capsular bag**. When the needle or forceps punctures the anterior capsule, the pressurized milky fluid immediately escapes, obscuring visualization and causing the capsular tear to rapidly run out to the equator (the **'Argentinian flag sign'**). A trypan blue dye stain and venting of the liquid cortex are required to safely complete the capsulorhexis."
            }
        ]
    },
    # Template 7: Ectopia Lentis (Marfan Syndrome)
    {
        "title": "The Superotemporal Subluxation",
        "age_range": (12, 22),
        "va_affected": "20/150",
        "va_unaffected": "20/200",
        "scenario": (
            "A {age}-year-old tall, thin {gender} with a history of joint hypermobility, mild scoliosis, and a pectus excavatum deformity presents for "
            "a comprehensive ophthalmic evaluation. {pronoun_cap} complains of fluctuating, blurry vision in both eyes that has worsened over "
            "the past {duration} years. {pronoun_cap} reports seeing double with either eye individually (monocular diplopia) at times.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.4°F | HR: 65 bpm | BP: 110/70 mmHg\n"
            "*   **Visual Acuity:** Bilateral 20/80 (uncorrected); pinhole corrects to 20/30\n"
            "*   **Ocular Examination (OU):** The anterior chambers are deep. Slit-lamp biomicroscopy after pupillary dilation reveals bilateral, symmetrical "
            "displacement and **subluxation of the crystalline lenses in a superotemporal direction**. Stretched, intact ciliary zonular fibers are "
            "clearly visible in the lower-nasal pupillary aperture. Tremulousness of the iris (iridodonesis) is present upon rapid eye movements."
        ),
        "questions": [
            {
                "q": "What is the most likely underlying diagnosis, and in what direction is the lens classically displaced?",
                "options": [
                    "Marfan syndrome; superotemporal displacement of the lens",
                    "Homocystinuria; inferonasal displacement of the lens",
                    "Weill-Marchesani syndrome; symmetrical inferior displacement",
                    "Sulfite oxidase deficiency; progressive nasal displacement",
                    "Traumatic zonular dialysis; random displacement based on trauma force"
                ],
                "answer": 0,
                "exp": "This patient has **Marfan syndrome**, an autosomal dominant connective tissue disorder. The classic ocular manifestation is **ectopia lentis (lens subluxation)**, which occurs bilaterally and symmetrically in up to 80% of patients. In Marfan syndrome, the lens classically displaces in a **superotemporal direction**, with ciliary zonules remaining stretched but largely intact."
            },
            {
                "q": "Which genetic mutation is responsible for the systemic and ocular manifestations of this patient's syndrome?",
                "options": [
                    "FBN1 gene on chromosome 15, encoding fibrillin-1",
                    "CBS gene on chromosome 21, encoding cystathionine beta-synthase",
                    "COL1A1 gene on chromosome 17, encoding type I collagen",
                    "ELN gene on chromosome 7, encoding elastin",
                    "TGFBR1 gene on chromosome 9, encoding transforming factor receptor"
                ],
                "answer": 0,
                "exp": "Marfan syndrome is caused by mutations in the **FBN1 gene on chromosome 15q21**, which encodes **fibrillin-1**, a major glycoprotein component of extracellular microfibrils. Fibrillin-1 is highly abundant in the **ciliary zonules** (the suspension cords of the lens), as well as the aortic media and skeletal system, explaining the classic multi-system clinical features."
            },
            {
                "q": "Which clinical feature helps differentiate the ectopia lentis of Homocystinuria from that of Marfan Syndrome?",
                "options": [
                    "In Homocystinuria, lens subluxation is classically inferonasal, the zonules are completely broken, and patients have intellectual disability and thromboembolic risk",
                    "In Homocystinuria, the lens is displaced superotemporally and the zonules are completely intact",
                    "In Homocystinuria, the lens never subluxates but undergoes rapid calcification",
                    "In Homocystinuria, patients are extremely short in stature with stiff joints and small hands",
                    "Homocystinuria is inherited in an autosomal dominant pattern with normal life expectancy"
                ],
                "answer": 0,
                "exp": "**Homocystinuria** (an autosomal recessive metabolic disorder) is differentiated by: (1) **inferonasal displacement** of the lens, (2) **complete disintegration and breakdown of the ciliary zonules** (which are composed of cysteine-rich fibers damaged by homocysteine), and (3) systemic features like **intellectual disability, skeletal deformities, and a high risk of life-threatening thromboembolism**."
            }
        ]
    },
    # Template 8: Posterior Capsular Opacification (PCO)
    {
        "title": "The 'Second Cataract'",
        "age_range": (60, 80),
        "va_affected": "20/60",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old {gender} presents complaining that the cataract in {possessive} {eye_side} eye has 'grown back.' "
            "{pronoun_cap} underwent highly successful, uncomplicated cataract extraction with intraocular lens (IOL) implantation in that eye "
            "18 months ago, achieving 20/20 vision postoperatively. However, over the past {duration} months, {possessive} vision has "
            "become progressively blurry and hazy, accompanied by significant glare when looking at bright lights.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.6°F | HR: 70 bpm | BP: 128/78 mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected} (no improvement with pinhole); contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Anterior chamber is quiet. A three-piece monofocal acrylic intraocular lens is perfectly centered "
            "within the capsular bag. However, the posterior capsule behind the IOL appears significantly thickened, hazy, and translucent, "
            "showing multiple small, vesicular, pearl-like vacuolated cells growing across the central visual axis (Elschnig's pearls)."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the gold-standard treatment?",
                "options": [
                    "Posterior capsular opacification (PCO); Nd:YAG laser posterior capsulotomy",
                    "Recurrent nuclear cataract; repeat surgical cataract extraction",
                    "Cystoid macular edema; topical non-steroidal anti-inflammatory drops",
                    "Corneal endothelial decompensation; Descemet's stripping endothelial keratoplasty",
                    "Neovascularization of the posterior capsule; intravitreal anti-VEGF injection"
                ],
                "answer": 0,
                "exp": "This is **Posterior Capsular Opacification (PCO)**, the most common late complication of modern cataract surgery (often called a **'second cataract'** by patients). The gold-standard treatment is an outpatient **Nd:YAG laser posterior capsulotomy**, which uses a specialized laser to safely create a small circular opening in the hazy posterior capsule, instantly restoring the clear optical path."
            },
            {
                "q": "Which cellular mechanism is primarily responsible for the development of PCO?",
                "options": [
                    "Proliferation, migration, and myofibroblastic transdifferentiation of residual lens epithelial cells on the capsular bag",
                    "Deposition of chronic inflammatory cells and macrophages on the posterior lens capsule",
                    "Precipitation of systemic calcium salts onto the surface of the acrylic IOL",
                    "Infiltration of the subretinal space by corneal endothelial cells",
                    "Slow, localized vitreous degeneration and condensation behind the lens"
                ],
                "answer": 0,
                "exp": "PCO is caused by the **proliferation, migration, and myofibroblastic transdifferentiation of residual lens epithelial cells (LECs)**. During cataract surgery, some LECs are left behind in the equatorial region of the capsular bag. Over time, these cells migrate across the posterior capsule, forming **Elschnig's pearls** (vacuolated cells) or causing capsular wrinkling and fibrosis, which scatters light."
            },
            {
                "q": "Which of the following is a potential, rare complication of the laser treatment used to manage PCO?",
                "options": [
                    "Rhegmatogenous retinal detachment and IOL damage/pitting",
                    "Corneal endothelial cell loss and corneal melting",
                    "Ischemia and atrophy of the optic nerve head",
                    "Acute, synechial angle-closure glaucoma",
                    "Neovascularization of the anterior chamber angle"
                ],
                "answer": 0,
                "exp": "While Nd:YAG laser capsulotomy is highly safe, rare complications include: (1) **rhegmatogenous retinal detachment** (due to shockwaves transmitted to the vitreous cavity, especially in high myopes), (2) **transient intraocular pressure spikes**, (3) **IOL damage or pitting** if the laser is misfocused, and (4) **cystoid macular edema** (Irvine-Gass syndrome)."
            }
        ]
    },
    # Template 9: Intraoperative Floppy Iris Syndrome (IFIS)
    {
        "title": "The Billowing Iris",
        "age_range": (65, 80),
        "va_affected": "20/40",
        "va_unaffected": "20/30",
        "scenario": (
            "A {age}-year-old male with a history of benign prostatic hyperplasia (BPH) presenting with a progressive nuclear sclerotic cataract is scheduled "
            "for routine phacoemulsification. During his preoperative assessment, the surgeon reviews his current medications, which include "
            "tamsulosin 0.4 mg daily. Preoperative pupil dilation is achieved but appears slightly sluggish.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.4°F | HR: 68 bpm | BP: 130/82 mmHg\n"
            "*   **Ocular Examination (OU):** The anterior segments are quiet. Deep anterior chambers. Gonioscopy shows open angles (Grade 4). "
            "Lenses show 3+ nuclear sclerosis bilaterally. Retinal examination is normal. During the initial steps of cataract surgery, immediately "
            "after making the corneal incision, the iris appears highly flaccid, billows in response to irrigation fluid, and repeatedly prolapses "
            "towards the surgical wound. The pupil, which was 7.5 mm, progressively constricts to 4.0 mm despite standard epinephrine in the irrigating bottle."
        ),
        "questions": [
            {
                "q": "What is the diagnosis, and which class of medications is responsible for this condition?",
                "options": [
                    "Intraoperative Floppy Iris Syndrome (IFIS); alpha-1A adrenergic receptor antagonists (e.g., tamsulosin)",
                    "Uveitic pupillary block; chronic topical corticosteroid use",
                    "Pseudoexfoliative iridopathy; calcium channel blockers",
                    "Pigment dispersion syndrome; systemic beta-blockers",
                    "Congenital iris hypoplasia; systemic anticholinergic therapy"
                ],
                "answer": 0,
                "exp": "This is **Intraoperative Floppy Iris Syndrome (IFIS)**. It is caused by **alpha-1A adrenergic receptor antagonists**, most notably **tamsulosin (Flomax)**, which is widely prescribed for benign prostatic hyperplasia (BPH). The drug blocks the alpha-1A receptors in the iris dilator muscle, leading to muscle flaccidity, billowing, and intraoperative miosis."
            },
            {
                "q": "What is the classic triad of signs that defines Intraoperative Floppy Iris Syndrome?",
                "options": [
                    "Flaccid iris stroma that billows with fluid currents, progressive intraoperative miosis, and a propensity for the iris to prolapse through corneal incisions",
                    "Heavily pigmented trabecular meshwork, Krukenberg spindle, and mid-peripheral spoke-like iris defects",
                    "Wrinkled anterior lens capsule, Elschnig's pearls, and zonular dialysis",
                    "Shallow anterior chamber, rock-hard globe, and steamy corneal edema",
                    "Posterior synechiae, keratic precipitates, and cystoid macular edema"
                ],
                "answer": 0,
                "exp": "The **classic triad of IFIS** consists of: (1) **a flaccid iris stroma** that billows and waves in response to normal intraoperative irrigation fluid currents, (2) **progressive intraoperative pupillary constriction (miosis)**, and (3) **a strong propensity for the iris tissue to prolapse** and escape through the corneal incisions."
            },
            {
                "q": "Which of the following is the most appropriate management strategy for a patient with known IFIS undergoing cataract surgery?",
                "options": [
                    "Using pupil expansion rings (e.g. Malyugin ring), iris hooks, or intraoperative intracameral phenylephrine/epinephrine",
                    "Stopping tamsulosin 24 hours prior to surgery to fully reverse the iris muscle atrophy",
                    "Increasing the ultrasound phacoemulsification power to rapidly emulsify the lens",
                    "Performing an immediate surgical peripheral iridectomy before removing the cataract",
                    "Postponing the surgery and switching the patient to oral finasteride for 5 years"
                ],
                "answer": 0,
                "exp": "Management of IFIS includes **pupil expansion rings (e.g. Malyugin ring)**, iris hooks, cohesive viscoelastics, or **intraoperative intracameral injection of alpha-agonists (phenylephrine or epinephrine)**. Stopping tamsulosin is generally **unsuccessful at reversing the syndrome**, as the drug causes long-lasting or permanent structural changes/atrophy of the iris dilator muscle; thus, the surgeon must prepare for IFIS even if the patient stopped the drug months ago."
            }
        ]
    },
    # Template 10: Subluxated Lens / Traumatic Zonular Dialysis
    {
        "title": "The Tremulous Lens",
        "age_range": (20, 45),
        "va_affected": "20/120",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old {gender} presents with fluctuating, blurry vision and double vision in {possessive} {eye_side} eye. "
            " {pronoun_cap} reports that {pronoun} was struck in that eye by the fist of an assailant during a physical altercation 2 weeks ago. "
            " {pronoun_cap} notes that when {pronoun} moves {possessive} eye quickly, {possessive} vision seems to 'wobble' and shake.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.6°F | HR: 74 bpm | BP: 120/80 mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected} (pinholes to 20/40); contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** The cornea is clear. Slit-lamp biomicroscopy reveals a highly **tremulous iris (iridodonesis)** "
            "and a **tremulous lens (phacodonesis)** upon eye movement. With a dilated pupil, the lens is seen to be subluxated inferiorly, "
            "exposing a 120-degree sector of **torn ciliary zonules (zonular dialysis)** superiorly. A small amount of vitreous gel is visible "
            "prolapsing into the anterior chamber around the superior edge of the lens. The intraocular pressure is 18 mmHg."
        ),
        "questions": [
            {
                "q": "What is the diagnosis, and what do the terms 'iridodonesis' and 'phacodonesis' represent?",
                "options": [
                    "Lens subluxation with traumatic zonular dialysis; iridodonesis is trembling of the iris, phacodonesis is trembling of the lens",
                    "Pseudoexfoliation syndrome; iridodonesis is iris atrophy, phacodonesis is lens displacement",
                    "Pigmentary glaucoma; iridodonesis is iris transillumination, phacodonesis is pigment in the lens",
                    "Acute angle-closure glaucoma; iridodonesis is fixed pupil, phacodonesis is lens swelling",
                    "Anterior uveitis; iridodonesis is inflammatory cells, phacodonesis is lens proteins"
                ],
                "answer": 0,
                "exp": "This patient has **lens subluxation with traumatic zonular dialysis**. **Iridodonesis** (tremble of the iris) and **phacodonesis** (tremble of the lens) are classic signs of zonular weakness or tearing. When the eye moves, the iris and lens lack proper structural support and oscillate/wobble, which is highly diagnostic of ciliary zonular damage."
            },
            {
                "q": "What is the primary surgical device used during cataract extraction to support the remaining capsular bag in a patient with moderate zonular dialysis?",
                "options": [
                    "Capsular Tension Ring (CTR)",
                    "Malyugin Pupil Expansion Ring",
                    "Ahmed Glaucoma Valve",
                    "Nd:YAG laser capsulotome",
                    "Scleral-fixated iris hook"
                ],
                "answer": 0,
                "exp": "For moderate zonular dialysis (<120-180 degrees), a **Capsular Tension Ring (CTR)** is inserted into the capsular bag. The CTR is a flexible PMMA ring that distributes the mechanical forces of the remaining intact zonules to the weakened areas, stabilizing the capsular bag, preventing vitreous prolapse, and allowing the safe implantation of a standard IOL."
            },
            {
                "q": "Which of the following is the most appropriate surgical management for a patient with severe, progressive lens subluxation (>180 degrees of zonular dialysis) and vitreous in the anterior chamber?",
                "options": [
                    "Pars plana lensectomy and anterior vitrectomy, followed by implantation of a scleral-fixated or iris-claw IOL",
                    "Standard phacoemulsification with a standard CTR and standard bag-IOL placement",
                    "Bilateral laser peripheral iridotomy and lifelong topical beta-blockers",
                    "Pressure patching the eye and scheduling a follow-up in 6 months",
                    "Surgical trabeculectomy with mitomycin C while leaving the subluxated lens in place"
                ],
                "answer": 0,
                "exp": "In cases of **severe lens subluxation (>180 degrees of zonular dialysis)** or when the lens is extremely unstable and vitreous is in the anterior chamber, standard phacoemulsification within the bag is highly dangerous. The recommended approach is a **lensectomy (often via pars plana) combined with an anterior vitrectomy** (to clear the prolapsed vitreous), followed by placement of a **scleral-fixated intraocular lens** (e.g. Yamane technique) or an **iris-claw/anterior chamber IOL**."
            }
        ]
    }
]

# =========================================================================
# 5. OCULAR TRAUMA TEMPLATES
# =========================================================================
templates["trauma"] = [
    # Template 1: Chemical Burn (Alkali)
    {
        "title": "The Lime Splattered Eye",
        "age_range": (20, 50),
        "va_affected": "20/200",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old construction worker presents to the emergency department immediately after a bag of wet concrete mix (calcium hydroxide/alkali) "
            "burst and splashed into {possessive} {eye_side} eye 30 minutes ago. {pronoun_cap} reports intense, burning pain, severe tearing, and "
            "an inability to open the eye. {pronoun_cap} rinsed the eye for about 2 minutes at the site before coming in.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.6°F | HR: 95 bpm | BP: 135/85 mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Severe blepharospasm. After instilling topical anesthetic, slit-lamp exam reveals a "
            "moderately hazy cornea with a large epithelial defect. There is a prominent area of **limbal blanching and ischemia** (porcelain sclera) "
            "involving 180 degrees of the limbus. The conjunctiva is pale and necrotic in the blanched areas. The initial paper pH test of the conjunctival sac shows a pH of 11.0."
        ),
        "questions": [
            {
                "q": "What is the most immediate, critical next step in the management of this patient?",
                "options": [
                    "Perform copious irrigation with sterile saline or water using a Morgan lens until the ocular surface pH is neutralized to 7.0 - 7.2",
                    "Order an urgent CT scan of the brain and orbits to rule out foreign bodies",
                    "Instill topical broad-spectrum antibiotic drops and apply a tight pressure patch",
                    "Prepare the patient for urgent surgical corneal transplant (penetrating keratoplasty)",
                    "Administer systemic high-dose intravenous corticosteroids immediately"
                ],
                "answer": 0,
                "exp": "An ocular chemical burn is a true emergency. The **most critical immediate step is copious irrigation** with sterile saline, balanced salt solution, or tap water (often using a Morgan lens) to flush the chemical. Irrigation must be continued continuously until the ocular surface pH is **fully neutralized (pH 7.0 - 7.2)**, measured 5-10 minutes after stopping irrigation. No other diagnostic test or treatment should delay this."
            },
            {
                "q": "Why are alkali burns generally considered far more destructive and dangerous to the eye than acid burns?",
                "options": [
                    "Alkalies cause saponification of cell membrane lipids and rapidly penetrate deep into the cornea and anterior chamber",
                    "Alkalies directly coagulate corneal proteins, forming a barrier that limits deep tissue penetration",
                    "Alkalies induce a rapid, autoimmune destruction of the contralateral eye",
                    "Alkalies trigger immediate, severe bacterial keratitis within minutes of contact",
                    "Alkalies selectively crystallize within the lens, causing immediate explosive cataract"
                ],
                "answer": 0,
                "exp": "**Alkali substances** (like ammonia, lye, and lime/wet concrete) are highly lipophilic and cause **saponification of cell membrane lipids**. This allows them to **rapidly penetrate** through the corneal epithelium, stroma, and into the anterior chamber within minutes, causing extensive internal damage. In contrast, **acids** cause **coagulation of corneal proteins**, which forms a physical barrier that limits further deep penetration of the acid."
            },
            {
                "q": "What is the clinical significance of 'limbal blanching and ischemia' in a chemical burn?",
                "options": [
                    "It indicates destruction of the limbal stem cells, which are essential for regenerating the corneal epithelium, signifying a poor prognosis",
                    "It is a benign finding that represents temporary vasospasm and resolves spontaneously within 24 hours",
                    "It indicates that the intraocular pressure has dropped to 0 mmHg",
                    "It signifies that a metallic foreign body is embedded in the sclera",
                    "It represents a localized type I hypersensitivity reaction to concrete proteins"
                ],
                "answer": 0,
                "exp": "**Limbal blanching and ischemia** (appearing as a white, bloodless 'porcelain' ring at the cornea-sclera junction) is a severe prognostic sign. The limbus houses the **limbal epithelial stem cells**, which are responsible for the continuous regeneration and maintenance of the corneal epithelium. Destruction of these stem cells leads to chronic epithelial defects, corneal scarring, visual degradation, and conjunctivalization."
            }
        ]
    },
    # Template 2: Corneal Abrasion
    {
        "title": "The Fingernail Scratch",
        "age_range": (18, 40),
        "va_affected": "20/30",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old {gender} presents to the clinic with intense pain, a severe foreign body sensation, constant tearing, and photophobia "
            "in {possessive} {eye_side} eye. {pronoun_cap} reports that {possessive} 8-month-old infant accidentally scratched {possessive} eye "
            "with a fingernail while playing this morning.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: {temp}°F | HR: {hr} bpm | BP: {bp} mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected} (improved with pinhole); contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Marked conjunctival injection. Instillation of fluorescein dye and examination under "
            "cobalt blue light reveals a sharply demarcated, linear, bright green glowing area of epithelial loss measuring 3 mm x 2 mm in the central cornea. "
            "There is no white corneal infiltrate, no corneal thinning, and the anterior chamber is quiet. Pupil is reactive and normal."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the first-line pharmacotherapy?",
                "options": [
                    "Corneal abrasion; topical broad-spectrum antibiotic drops or ointment (e.g. erythromycin or polymyxin/trimethoprim)",
                    "Infectious bacterial keratitis; topical fortified vancomycin and tobramycin every 30 minutes",
                    "Herpes simplex dendritic keratitis; topical acyclovir gel and oral valacyclovir",
                    "Corneal ulcer; immediate outpatient surgical superficial keratectomy",
                    "Dry eye syndrome; lifetime preservative-free artificial tears only"
                ],
                "answer": 0,
                "exp": "This is a simple **corneal abrasion** (epithelial defect without underlying stromal infection). First-line therapy consists of **topical broad-spectrum antibiotic drops or ointment** to prevent secondary bacterial infection while the epithelium heals, along with oral analgesics for pain control. Ointment (e.g., erythromycin) provides lubrication and comfort."
            },
            {
                "q": "Why is the prescription of topical anesthetic drops (e.g. proparacaine) for home pain control strictly CONTRAINDICATED in patients with corneal abrasions?",
                "options": [
                    "Topical anesthetics are directly toxic to the corneal epithelium, inhibit healing, and block the protective blink reflex, leading to severe corneal melting",
                    "Topical anesthetics cause systemic cardiovascular toxicity and bradycardia through lacrimal absorption",
                    "Topical anesthetics promote the rapid growth of fungal spores in the stroma",
                    "Topical anesthetics cause permanent pupillary dilation and acute angle closure",
                    "Topical anesthetics neutralize the efficacy of topical antibiotics"
                ],
                "answer": 0,
                "exp": "Prescribing **topical anesthetics (like proparacaine or tetracaine) for home use is strictly contraindicated**. These drugs are **highly toxic to the corneal epithelium** (epitheliotoxic), severely retard epithelial migration and wound healing, and **abolish the protective corneal blink reflex**. Abuse of these drops leads to progressive, painless **corneal stromal melting, ulceration, and permanent scarring**."
            },
            {
                "q": "What is the most common long-term complication of a corneal abrasion caused by organic trauma (e.g., a fingernail or tree branch)?",
                "options": [
                    "Recurrent corneal erosion syndrome, due to poor basement membrane adhesion",
                    "Sympathetic ophthalmia in the contralateral eye",
                    "Secondary open-angle pigmentary glaucoma",
                    "Late-onset ectopia lentis and lens subluxation",
                    "Autoimmune uveitis associated with HLA-B27"
                ],
                "answer": 0,
                "exp": "A classic complication of organic abrasions (fingernails, paper cuts, tree branches) is **Recurrent Corneal Erosion (RCE) syndrome**. The regenerated corneal epithelial cells fail to form proper hemidesmosomes and adhere securely to the underlying **Bowman's membrane and basement membrane**. Weeks or months later, typically upon opening the eyes in the morning, the dry eyelid adheres to the loose epithelium and rips it off, causing a recurrence of severe pain and abrasion."
            }
        ]
    },
    # Template 3: Corneal Foreign Body & Rust Ring
    {
        "title": "The Machinist's Rust",
        "age_range": (20, 48),
        "va_affected": "20/30",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old machinist presents with a 24-hour history of redness, gritty pain, and tearing in {possessive} {eye_side} eye. "
            " {pronoun_cap} reports that {pronoun} was grinding steel yesterday afternoon without safety goggles and felt something fly into "
            " {possessive} eye.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.4°F | HR: 74 bpm | BP: 122/76 mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Slit-lamp biomicroscopy reveals a tiny, dark, metallic foreign body embedded in the "
            "superficial corneal stroma at the 4 o'clock position, outside of the visual axis. The foreign body is surrounded by a distinct, circular, "
            "orange-brown halo of **rust ring** diffusing into the stroma. The anterior chamber is deep and quiet (0 cells). No Seidel sign is present."
        ),
        "questions": [
            {
                "q": "What is the correct management of this patient's corneal foreign body and associated rust ring?",
                "options": [
                    "Remove the metallic foreign body immediately, and remove the rust ring either today or within 24-48 hours using a sterile needle, spud, or rotating ophthalmic burr under slit-lamp visualization",
                    "Apply a pressure patch for 1 week and wait for the rust ring to dissolve systemically",
                    "Initiate topical corticosteroid drops hourly to dissolve the iron deposits",
                    "Refer the patient for urgent surgical lamellar keratoplasty in the operating room",
                    "Flush the eye with systemic chelating agents (EDTA) for 12 hours"
                ],
                "answer": 0,
                "exp": "Management requires **removal of both the foreign body and the rust ring**. The metallic foreign body is removed immediately using a sterile needle or spud under slit-lamp magnification. The **rust ring** (oxidized iron that diffuses into the stroma) is toxic and retards healing; it must be removed either at the same time or within 24-48 hours (when it softens) using a **rotating ophthalmic burr (Algerbrush)** or needle."
            },
            {
                "q": "Within what timeframe does a metallic iron-containing corneal foreign body begin to form a visible rust ring in the stroma?",
                "options": [
                    "Within 8 to 24 hours of injury",
                    "Immediately upon impact (within seconds)",
                    "Only after 1 to 2 weeks of neglect",
                    "Exactly 30 days post-injury",
                    "Iron foreign bodies never form rust rings in the eye"
                ],
                "answer": 0,
                "exp": "A metallic, iron-containing foreign body oxidizes rapidly when exposed to the moist environment of the tear film and corneal stroma. A **visible orange-brown rust ring** of iron deposition begins to form in the surrounding stroma **within 8 to 24 hours** of the injury. Early removal of the foreign body prevents extensive rust ring formation."
            },
            {
                "q": "Following the removal of a corneal foreign body, which of the following is essential to prevent secondary complications?",
                "options": [
                    "Topical broad-spectrum antibiotics, checking tetanus vaccination status, and avoiding patching if the wound is dirty",
                    "Topical corticosteroid drops every hour for 2 weeks to prevent scarring",
                    "Dilating the pupil with atropine for 6 months to maintain muscle rest",
                    "Oral acyclovir to prevent viral activation",
                    "Implantation of a soft contact lens directly over the rust ring"
                ],
                "answer": 0,
                "exp": "Following foreign body and rust removal, the patient has a corneal epithelial defect (abrasion). Essential care includes **topical broad-spectrum antibiotics** (drops/ointment) to prevent bacterial keratitis, and **updating their tetanus vaccination status** (as corneal wounds can rarely harbor tetanus). The eye is typically **not patched** if there is any suspicion of organic contamination or Pseudomonas risk (e.g. contact lens wearers)."
            }
        ]
    },
    # Template 4: Traumatic Hyphema
    {
        "title": "The Squash Ball Collision",
        "age_range": (10, 22),
        "va_affected": "20/100",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old African American {gender} presents to the emergency department after being struck directly in the {eye_side} eye "
            "by a squash ball during a game. {pronoun_cap} reports sudden, severe pain and a dramatic decrease in vision. {pronoun_cap} denies "
            "any prior eye problems but notes {pronoun} has sickle cell trait.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.6°F | HR: 88 bpm | BP: 122/78 mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Periorbital ecchymosis. Slit-lamp biomicroscopy reveals a prominent, layered column of "
            "red blood cells filling the inferior 30% of the anterior chamber (Grade II hyphema). The pupil is sluggish. The ciliary body is intact, "
            "and there is no open globe injury. The intraocular pressure is {iop} mmHg (significantly elevated)."
        ),
        "questions": [
            {
                "q": "What is the primary underlying anatomical source of blood in a traumatic hyphema?",
                "options": [
                    "Rupture of the blood vessels of the ciliary body face or iris root due to blunt contusion forces",
                    "Bleeding from the retinal arterioles that dissects forward through the vitreous",
                    "Rupture of Schlemm's canal with retrograde venous flow into the chamber",
                    "Exudative hemorrhage from damaged corneal endothelial cells",
                    "Rupture of ciliary body processes due to systemic hypertension"
                ],
                "answer": 0,
                "exp": "A traumatic hyphema (blood in the anterior chamber) is caused by blunt contusion forces that compress the globe along its axial diameter and expand it equatorially. This sudden stretching force tears the anterior segment tissues, resulting in the **rupture of blood vessels of the ciliary body face, iris root, or major arterial circle of the iris**."
            },
            {
                "q": "Why is a traumatic hyphema particularly dangerous in patients with sickle cell trait or disease, and what is the target IOP management?",
                "options": [
                    "Sickled erythrocytes are rigid and clog the trabecular meshwork, causing rapid, severe IOP elevation; even mild IOP elevation (>24 mmHg) can cause optic nerve ischemia, requiring aggressive control and avoiding systemic acetazolamide",
                    "Sickle cell trait prevents the blood from clotting, causing continuous, unstoppable bleeding that fills the entire eye",
                    "Sickle cell patients have fragile corneas that melt rapidly when exposed to red blood cells in the anterior chamber",
                    "The blood in the anterior chamber reacts with sickle hemoglobin to cause irreversible iris necrosis within 2 hours",
                    "Sickle cell patients are completely immune to elevated IOP, so no treatment is required"
                ],
                "answer": 0,
                "exp": "Hyphema in a **sickle cell** patient is a high-risk situation. In the hypoxic, hyperosmolar anterior chamber, red blood cells sickling occurs. The rigid **sickled erythrocytes clog the trabecular meshwork**, causing rapid, severe IOP spikes. Furthermore, the compromised microcirculation of the optic nerve head in sickle cell patients makes them highly vulnerable to ischemic damage, so **even mild IOP elevations (>24 mmHg for >24 hours) can cause permanent optic nerve atrophy or central retinal artery occlusion**. Systemic **acetazolamide is strictly contraindicated** as it promotes sickling."
            },
            {
                "q": "What represents the core conservative management recommendations for a patient with an uncomplicated traumatic hyphema?",
                "options": [
                    "Bed rest with head of bed elevated 30-45 degrees, a rigid eye shield, topical cycloplegic drops, and avoiding aspirin/NSAIDs",
                    "Strict flat bed rest, a pressure patch, daily aspirin to prevent clotting, and hourly topical corticosteroids",
                    "Immediate outpatient surgical anterior chamber washout and trabeculectomy",
                    "Initiation of systemic anticoagulation (warfarin) and vigorous physical exercise to clear the blood",
                    "Applying a tight pressure patch and scheduling follow-up in 1 month"
                ],
                "answer": 0,
                "exp": "Conservative management for hyphema includes: (1) **bed rest with the head of the bed elevated 30 to 45 degrees** (allows blood to settle inferiorly, clearing the visual axis and preventing trabecular clogging), (2) a **rigid metal or plastic eye shield** to prevent accidental touch, (3) **topical cycloplegic drops** (e.g. atropine/cyclopentolate) for pupillary rest and pain control, and (4) **avoiding aspirin/NSAIDs** (which increase the risk of re-bleeding, typically occurring on days 3-5)."
            }
        ]
    },
    # Template 5: Orbital Blowout Fracture
    {
        "title": "The Fist and Floor",
        "age_range": (18, 35),
        "va_affected": "20/25",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old {gender} presents to the emergency department after being punched in the {eye_side} eye during a street fight. "
            "{pronoun_cap} complains of pain, severe swelling, bruising, and double vision (diplopia), especially when looking up. "
            " {pronoun_cap} also notes that {possessive} {eye_side} cheek and upper lip feel numb.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.6°F | HR: 82 bpm | BP: 120/80 mmHg\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Marked periorbital ecchymosis and edema. Subconjunctival hemorrhage is present. "
            "There is **vertical diplopia on upgaze**, and testing of extraocular motility reveals a severe **restriction of elevation** in the affected eye. "
            "Sensation to light touch is significantly decreased over the ipsilateral cheek, side of the nose, and upper lip. "
            "CT scan of the orbits reveals a fracture of the **orbital floor** with herniation of orbital fat and entrapment of the **inferior rectus muscle**."
        ),
        "questions": [
            {
                "q": "What is the diagnosis, and which extraocular muscle is classically entrapped in this condition?",
                "options": [
                    "Orbital floor blowout fracture; entrapment of the inferior rectus muscle",
                    "Medial orbital wall blowout fracture; entrapment of the medial rectus muscle",
                    "Orbital roof blowout fracture; entrapment of the superior rectus muscle",
                    "Lateral orbital wall fracture; entrapment of the lateral rectus muscle",
                    "Superior orbital fissure syndrome; entrapment of all extraocular muscles"
                ],
                "answer": 0,
                "exp": "This patient has an **orbital floor blowout fracture** (the most common type). The classic presentation is **vertical diplopia on upgaze** and **restriction of eye elevation** due to the mechanical **entrapment of the inferior rectus muscle** (and/or surrounding orbital fat/fascia) within the fractured bony fragments of the maxillary bone."
            },
            {
                "q": "Which cranial nerve is injured, resulting in the numbness of the cheek, side of the nose, and upper lip?",
                "options": [
                    "Infraorbital nerve, a branch of the maxillary division of the trigeminal nerve (CN V2)",
                    "Supraorbital nerve, a branch of the ophthalmic division of the trigeminal nerve (CN V1)",
                    "Facial nerve (CN VII), buccal branch",
                    "Abducens nerve (CN VI)",
                    "Oculomotor nerve (CN III), inferior division"
                ],
                "answer": 0,
                "exp": "The **infraorbital nerve** (a terminal branch of the **maxillary division of the trigeminal nerve, CN V2**) travels along the infraorbital groove and canal in the orbital floor. Fractures of the orbital floor frequently bruise, compress, or lacerate this nerve, resulting in **hypoesthesia/numbness of the ipsilateral cheek, lateral nose, upper lip, and anterior maxillary gingiva**."
            },
            {
                "q": "Which of the following is a critical instruction that must be given to patients diagnosed with an acute orbital blowout fracture?",
                "options": [
                    "Strictly avoid blowing their nose to prevent orbital emphysema and potential optic nerve compression",
                    "Vigorously blow their nose to clear any blood or fluid from the maxillary sinus",
                    "Apply a high-pressure patch over the eye for 72 hours",
                    "Perform heavy weightlifting to reduce intraorbital venous pressure",
                    "Avoid sleeping with their head elevated"
                ],
                "answer": 0,
                "exp": "Patients with acute orbital fractures must be **strictly instructed not to blow their nose**. Blowing the nose creates high pressure in the paranasal sinuses (maxillary/ethmoid). This pressure forces air and sinus bacteria through the fracture line into the orbit, causing **orbital emphysema** (which can compress the optic nerve and cause blindness) and increasing the risk of **orbital cellulitis**."
            }
        ]
    },
    # Template 6: Ruptured Globe
    {
        "title": "The Flying Metal Shard",
        "age_range": (20, 55),
        "va_affected": "Hand Motion",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old construction worker is brought to the emergency department after a metal shard flew off a hammering tool "
            "and struck {possessive} {eye_side} eye. He was not wearing safety goggles. He complains of sudden, severe pain and instant, "
            "profound loss of vision in that eye. He reports a watery discharge flowing from the eye immediately after the impact.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.6°F | HR: 90 bpm | BP: 130/80 mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: Hand Motion (light projection intact); contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Diffuse subconjunctival hemorrhage. The anterior chamber is shallow and filled with RBCs "
            "(microhyphema). The pupil is peaked and **teardrop-shaped**, pointing towards a 3-mm laceration at the limbus. "
            "A small amount of dark, uveal tissue (iris) is prolapsing through the wound. Examination of the wound under cobalt blue light reveals "
            "a **positive Seidel sign** (a clear stream of aqueous humor diluting and washing away fluorescein dye)."
        ),
        "questions": [
            {
                "q": "What is the diagnosis, and what is the significance of the teardrop pupil and positive Seidel test?",
                "options": [
                    "Ruptured globe / open globe injury; teardrop pupil points to the site of wound, positive Seidel test indicates active aqueous leakage from a full-thickness laceration",
                    "Severe corneal abrasion; teardrop pupil is a normal physiological variant, Seidel test is positive in any tear film excess",
                    "Traumatic uveitis; teardrop pupil represents severe ciliary spasm, Seidel test is positive due to high protein exudation",
                    "Traumatic hyphema; teardrop pupil is due to iris sphincter rupture, Seidel test indicates red blood cells clogging the cornea",
                    "Orbital compartment syndrome; teardrop pupil indicates optic nerve compression, Seidel test is negative"
                ],
                "answer": 0,
                "exp": "This is a **ruptured globe (open globe injury)**, a surgical emergency. The **teardrop pupil** is highly characteristic, as intraocular pressure forces the iris to prolapse towards the escape wound, pointing like an arrow to the laceration. The **positive Seidel test** (aqueous fluid stream washing away fluorescein dye under cobalt blue light) confirms a **full-thickness wound** with active external leakage of aqueous humor."
            },
            {
                "q": "Which of the following is strictly CONTRAINDICATED during the emergency department evaluation of a suspected ruptured globe?",
                "options": [
                    "Performing applanation tonometry (IOP measurement) or applying any pressure to the globe",
                    "Administering systemic intravenous antibiotics and antiemetics",
                    "Placing a rigid, non-contact eye shield resting on the orbital bones",
                    "Ordering a high-resolution CT scan of the orbits without contrast",
                    "Keeping the patient strictly NPO (nothing by mouth) for surgery"
                ],
                "answer": 0,
                "exp": "In a suspected ruptured globe, **any manipulation or pressure on the eye is strictly contraindicated**. This includes performing **tonometry (IOP measurement)**, opening the eyelids forcibly, or performing a dilated fundus exam. Any external pressure can cause **extrusion of the intraocular contents** (iris, lens, vitreous, retina) through the wound, resulting in irreversible blindness."
            },
            {
                "q": "What are the immediate, first-line management steps for a patient with a confirmed ruptured globe in the emergency department?",
                "options": [
                    "Place a rigid metal/plastic eye shield, keep NPO, initiate IV broad-spectrum antibiotics, administer IV antiemetics, update tetanus, and schedule urgent surgical repair within 24 hours",
                    "Apply a tight pressure patch, prescribe oral pain medications, and schedule outpatient ophthalmology follow-up in 1 week",
                    "Perform immediate bedside surgical suturing of the cornea under topical anesthesia",
                    "Instill topical corticosteroid and anesthetic drops hourly, and discharge the patient home",
                    "Perform immediate anterior chamber paracentesis to lower the intraocular pressure"
                ],
                "answer": 0,
                "exp": "Immediate management of a ruptured globe includes: (1) placing a **rigid eye shield** (e.g. Fox shield) resting on the brow and cheek bones (never place a patch or pad that contacts the eyelids), (2) keeping the patient **strictly NPO** in preparation for urgent surgery, (3) administering **IV broad-spectrum antibiotics** (e.g., cefazolin + levofloxacin) to prevent endophthalmitis, (4) administering **IV antiemetics** (e.g., ondansetron) to prevent vomiting (which raises intraocular pressure), (5) updating **tetanus status**, and (6) securing **urgent surgical closure** in the OR within 24 hours."
            }
        ]
    },
    # Template 7: Retrobulbar Hemorrhage / Orbital Compartment Syndrome
    {
        "title": "The Rock-Hard Orbit",
        "age_range": (20, 60),
        "va_affected": "20/400",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old {gender} presents to the emergency department immediately after sustaining severe blunt facial trauma from a baseball bat. "
            "{pronoun_cap} reports excruciating pain and rapidly progressive vision loss in the {eye_side} eye. "
            " {pronoun_cap} has a history of mild hypertension.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.6°F | HR: 105 bpm | BP: 142/90 mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected} (no improvement with pinhole); contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Extreme, tense **proptosis** and massive subconjunctival hemorrhage. The eyelids are extremely swollen, "
            "tense, and **rock-hard to palpation**, making it highly difficult to separate them. There is a prominent **relative afferent pupillary defect (RAPD)** "
            "in the affected eye. Extraocular movements are completely restricted in all directions (ophthalmoplegia). The intraocular pressure is {iop} mmHg."
        ),
        "questions": [
            {
                "q": "What is the diagnosis, and what is the most urgent, vision-saving intervention for this patient?",
                "options": [
                    "Orbital Compartment Syndrome (OCS) due to retrobulbar hemorrhage; immediate bedside lateral canthotomy and cantholysis",
                    "Ruptured globe; immediate surgical exploration in the operating room",
                    "Carotid-cavernous fistula; urgent carotid artery angiography and embolization",
                    "Optic neuritis; initiate high-dose intravenous methylprednisolone within 1 hour",
                    "Blowout fracture; order an urgent facial CT scan and administer oral prednisone"
                ],
                "answer": 0,
                "exp": "This patient has **Orbital Compartment Syndrome (OCS)** secondary to a **retrobulbar hemorrhage** (bleeding behind the eye). This is a vision-threatening emergency. The most urgent intervention is **immediate bedside lateral canthotomy and cantholysis (LCC)**. LCC must be performed **immediately at the bedside without waiting for CT scans or ophthalmology arrival**, as irreversible ischemic blindness occurs within 90-120 minutes."
            },
            {
                "q": "What is the primary pathophysiological mechanism by which OCS leads to rapid, irreversible blindness?",
                "options": [
                    "High intraorbital pressure compromises perfusion to the optic nerve and retina, causing central retinal artery occlusion or ischemic optic neuropathy",
                    "The retrobulbar blood directly dissects into the optic nerve sheath and destroys axons",
                    "The blood in the orbit triggers a rapid, autoimmune destruction of the contralateral retina",
                    "The compression forces the crystalline lens backward, crushing the vitreous",
                    "Chronic bacterial infection spreads from the retrobulbar space to the brain"
                ],
                "answer": 0,
                "exp": "Because the orbit is a closed, rigid bony compartment bounded anteriorly by the stiff orbital septum and eyelids, a **retrobulbar hemorrhage** causes a rapid rise in intraorbital pressure. When the orbital pressure exceeds the perfusion pressure of the microvasculature, it **compromises blood flow to the optic nerve and retina**, resulting in **central retinal artery occlusion (CRAO)** or **anterior/posterior ischemic optic neuropathy**."
            },
            {
                "q": "How does performing a lateral canthotomy and cantholysis relieve the elevated intraorbital pressure?",
                "options": [
                    "It releases the lateral palpebral ligament, allowing the eyelids and orbital contents to expand forward, rapidly reducing intraorbital pressure",
                    "It allows the retrobulbar blood to drain completely out of the lateral wound",
                    "It directly decompresses the maxillary sinus to relieve pressure",
                    "It paralyzes the extraocular muscles, reducing metabolic demand",
                    "It allows the surgeon to physically push the globe back into the orbit"
                ],
                "answer": 0,
                "exp": "Performing a **lateral canthotomy** (cutting the lateral canthal tendon) and **cantholysis** (specifically cutting the superior and inferior crus of the lateral palpebral ligament) **releases the attachment of the eyelids to the lateral orbital rim**. This allows the **eyelids and globe to expand forward (increasing proptosis)**, which rapidly decompresses the closed orbital compartment, lowering the pressure from dangerous levels (>40-50 mmHg) to safe levels almost instantly."
            }
        ]
    },
    # Template 8: Traumatic Optic Neuropathy (TON)
    {
        "title": "The Numb RAPD",
        "age_range": (18, 45),
        "va_affected": "20/400",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old {gender} is brought to the emergency department after falling off a bicycle and striking the {eye_side} side of {possessive} "
            "forehead against the concrete curb. {pronoun_cap} did not lose consciousness but complains of profound, painless vision loss in {possessive} "
            "{eye_side} eye. {pronoun_cap} has no other injuries.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.6°F | HR: 76 bpm | BP: 120/80 mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** Mild bruising over the forehead and brow. The globe is completely intact, eyelids are soft, "
            "and anterior chamber is quiet. IOP is 14 mmHg OU. However, there is a **prominent relative afferent pupillary defect (RAPD)** "
            "in the affected eye. Dilated fundus examination reveals a **completely normal optic nerve head** with healthy color and sharp margins. "
            "Contralateral eye is normal."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis?",
                "options": [
                    "Traumatic Optic Neuropathy (TON)",
                    "Acute optic neuritis",
                    "Central retinal artery occlusion (CRAO)",
                    "Retinal detachment",
                    "Malingering or functional vision loss"
                ],
                "answer": 0,
                "exp": "This patient has **Traumatic Optic Neuropathy (TON)**, which classically presents as **profound vision loss** following blunt head or orbital trauma, accompanied by a **relative afferent pupillary defect (RAPD)**, in the setting of a **completely normal-appearing optic nerve head** acutely. The nerve is damaged retrobulbar (often inside the optic canal)."
            },
            {
                "q": "Why does the optic nerve head appear completely normal during the acute phase of Traumatic Optic Neuropathy?",
                "options": [
                    "The injury is retrobulbar (within the optic canal), and retrograde degeneration of the axons takes 4 to 6 weeks to manifest as disc pallor",
                    "The visual loss is purely psychological and there is no real nerve damage",
                    "The nerve is temporarily stunned (neuropraxia) and does not undergo physical changes",
                    "The contralateral eye is compensating by sending blood flow to the damaged disc",
                    "The swollen optic nerve is hidden by the vitreous gel"
                ],
                "answer": 0,
                "exp": "Acutely, the optic disc appears **completely normal** because the site of injury in TON is typically **retrobulbar** (most commonly within the bony **optic canal**, where the nerve is sheared or compressed by bone fragments or microvascular ischemia). It takes **4 to 6 weeks for retrograde axoplasmic degeneration** to travel from the site of injury back to the optic nerve head, at which point the disc will develop permanent **optic atrophy and pallor**."
            },
            {
                "q": "Which of the following is the diagnostic test of choice to evaluate a patient with suspected Traumatic Optic Neuropathy?",
                "options": [
                    "High-resolution CT scan of the brain and orbits with thin cuts through the optic canal",
                    "Fluorescein angiography of the retina",
                    "Lumbar puncture to measure cerebrospinal fluid opening pressure",
                    "Ocular B-scan ultrasound of the posterior segment",
                    "Electroretinography (ERG)"
                ],
                "answer": 0,
                "exp": "The diagnostic test of choice is a **high-resolution CT scan of the brain and orbits with thin cuts (1 mm) through the optic canal**. This is essential to evaluate for **optic canal fractures**, bony spicules compressing the nerve, or hematomas within the canal that might warrant surgical decompression."
            }
        ]
    },
    # Template 9: Lid Laceration involving the Canaliculus
    {
        "title": "The Torn Tear Duct",
        "age_range": (5, 18),
        "va_affected": "20/20",
        "va_unaffected": "20/20",
        "scenario": (
            "An {age}-year-old child is brought to the emergency department by {possessive} parents after being scratched in the face by a dog. "
            "The child is crying but has no systemic symptoms. The parents note a deep cut in the child's left lower eyelid.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.6°F | HR: 85 bpm | BP: 110/70 mmHg\n"
            "*   **Visual Acuity:** Bilateral 20/20 (corrected)\n"
            "*   **Ocular Examination:** The left globe is completely intact, with no conjunctival injection, clear cornea, and quiet anterior chamber. "
            "However, there is a deep, full-thickness **laceration of the left lower eyelid medial to the punctum**, completely transecting the "
            "medial canthal angle and the **lower lacrimal canaliculus**. The laceration extends down to the orbicularis oculi muscle."
        ),
        "questions": [
            {
                "q": "What is the management, and where should this repair ideally be performed?",
                "options": [
                    "Surgical repair in the operating room under microscopic visualization, involving canalicular stenting (e.g. Crawford or monocanalicular stent) and meticulous suturing",
                    "Simple bedside closure of the skin laceration using steri-strips or skin glue",
                    "Applying a tight pressure patch for 2 weeks and letting the tear duct heal spontaneously",
                    "Performing immediate surgical excision of the entire lacrimal gland",
                    "Prescribing oral antibiotics and sending the child home without closure"
                ],
                "answer": 0,
                "exp": "A lid laceration medial to the punctum that **transects the lacrimal canaliculus** requires specialized **surgical repair in the operating room**. Under microscopic magnification, the cut ends of the canaliculus must be identified, **stented with a silicone tube** (e.g., Crawford stent or Monoka) to maintain the patency of the lumen during healing, and the surrounding tissues repaired meticulously. Simple skin suturing is a failure of care."
            },
            {
                "q": "What is the primary long-term complication if a canalicular laceration is not repaired or is repaired poorly?",
                "options": [
                    "Chronic, debilitating epiphora (overflow of tears) due to disruption of the tear drainage system",
                    "Permanent loss of central visual acuity and macular edema",
                    "Chronic, intractable dry eye syndrome due to lacrimal hypersecretion",
                    "Severe, progressive orbital blowout fracture and diplopia",
                    "Autoimmune sympathetic ophthalmia in the contralateral eye"
                ],
                "answer": 0,
                "exp": "The lower canaliculus carries approximately 70% of the tear drainage from the ocular surface to the lacrimal sac. If the canaliculus is not repaired or heals with scarring/occlusion, the patient will develop **chronic, debilitating epiphora (persistent tearing and overflow of tears)**. This causes significant visual blurring and skin irritation."
            },
            {
                "q": "Which critical muscle and tendon structures are located in the medial canthus and must be carefully reanchored during repair to prevent eyelid deformity?",
                "options": [
                    "Medial canthal tendon and orbicularis oculi muscle",
                    "Lateral palpebral ligament and levator palpebrae superioris",
                    "Superior oblique muscle and Tenon's capsule",
                    "Inferior rectus muscle and lockwood's ligament",
                    "Corrugator supercilii and frontalis muscle"
                ],
                "answer": 0,
                "exp": "The **medial canthal tendon** and the **pars lacrimalis of the orbicularis oculi muscle (Horner's muscle)** are located medially and are responsible for anchoring the eyelid to the lacrimal bone and driving the 'lacrimal pump' that sucks tears into the drainage system. Failure to carefully reanchor these structures leads to **ectropion** (eyelid turning outward), medial canthal rounding, and permanent tearing dysfunction."
            }
        ]
    },
    # Template 10: Penetrating Intraocular Foreign Body (IOFB)
    {
        "title": "The Hammer and Siderosis",
        "age_range": (20, 50),
        "va_affected": "20/40",
        "va_unaffected": "20/20",
        "scenario": (
            "A {age}-year-old carpenter presents with mild discomfort and slightly blurry vision in {possessive} {eye_side} eye. "
            " {pronoun_cap} reports that {pronoun} was hammering steel-on-steel 2 days ago without safety goggles when {pronoun} felt a "
            "tiny 'tweak' or splash of water in {possessive} eye, but did not think much of it until the vision became slightly fuzzy today.\n\n"
            "**Physical Examination:**\n"
            "*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 120/80 mmHg\n"
            "*   **Visual Acuity:** {eye_side_abbr}: {va_affected}; contralateral eye: {va_unaffected}\n"
            "*   **Ocular Examination ({eye_side_abbr}):** A tiny, self-sealing 1-mm corneal wound is visible at the 9 o'clock position. "
            "Directly behind it, there is a small **iris transillumination defect (hole)**. The lens reveals a tiny, localized **focal cataract** "
            "in the path of the injury. Dilated fundus examination reveals a small, shiny, metallic **foreign body** lodged in the vitreous cavity "
            "inferiorly, surrounded by a localized vitreous hemorrhage. No retinal detachment is seen. IOP is 12 mmHg."
        ),
        "questions": [
            {
                "q": "What is the diagnosis, and what is the definitive management for this patient?",
                "options": [
                    "Penetrating Intraocular Foreign Body (IOFB); urgent surgical pars plana vitrectomy with removal of the foreign body",
                    "Corneal foreign body; perform bedside removal using a sterile needle under topical anesthesia",
                    "Traumatic uveitis; initiate topical corticosteroid drops and monitor closely as an outpatient",
                    "Dry AMD; prescribe high-dose AREDS2 vitamins and reassure",
                    "Ruptured globe; apply a tight pressure patch and perform daily outpatient visual acuity checks"
                ],
                "answer": 0,
                "exp": "This is a **Penetrating Intraocular Foreign Body (IOFB)**. Even if the entry wound is self-sealing and the eye is quiet, a foreign body lodged inside the vitreous cavity is a high risk for endophthalmitis and chronic toxicity. Definitive management is **urgent surgical pars plana vitrectomy (PPV)** to remove the foreign body, repair any retinal tears, and administer intravitreal antibiotics."
            },
            {
                "q": "Which diagnostic imaging modality is strictly CONTRAINDICATED if a metallic intraocular foreign body is suspected?",
                "options": [
                    "Magnetic Resonance Imaging (MRI) of the brain and orbits",
                    "High-resolution CT scan of the orbits without contrast",
                    "B-scan ultrasound of the globe",
                    "Standard orbital X-ray (Caldwell and Waters views)",
                    "Fluorescein angiography of the retina"
                ],
                "answer": 0,
                "exp": "If a metallic (ferrous) intraocular foreign body is suspected, **MRI is strictly contraindicated**. The powerful magnetic field of the MRI will cause the metallic foreign body to **move, rotate, or migrate** within the eye, leading to catastrophic shearing of the retina, vitreous hemorrhage, or lens rupture. **High-resolution CT scan** is the gold standard imaging modality of choice."
            },
            {
                "q": "What is the chronic, blinding toxicity condition that occurs if a ferrous (iron-containing) intraocular foreign body is left inside the eye for months or years?",
                "options": [
                    "Siderosis bulbi, caused by iron toxicity leading to degeneration of the retina and trabecular meshwork",
                    "Chalcosis bulbi, caused by copper deposition in Descemet's membrane",
                    "Sympathetic ophthalmia, a granulomatous uveitis in the contralateral eye",
                    "Phacolytic glaucoma, caused by lens protein leaking through the capsule",
                    "Neovascular glaucoma, driven by chronic iris ischemia"
                ],
                "answer": 0,
                "exp": "If a ferrous (iron) IOFB is left in the eye, the iron slowly oxidizes and dissolves, releasing toxic iron ions that deposit in and destroy intracellular structures. This is known as **Siderosis bulbi**. It leads to **degeneration of the retina** (manifesting as profound night blindness and pigmentary changes), **damage to the trabecular meshwork** (causing secondary open-angle glaucoma), and **cataract formation with iris heterochromia (turning the iris rusty brown)**."
            }
        ]
    }
]

# =========================================================================
# GENERATOR ENGINE & SQL WRITER
# =========================================================================

def generate_sql_for_topic(topic_key, config):
    slug = config["slug"]
    filename = config["filename"]
    title_prefix = config["title_prefix"]
    
    # We need to generate exactly 50 cases for this topic!
    # Since we have 10 templates, we generate 5 variations of each template.
    topic_templates = templates[topic_key]
    
    cases = []
    case_count = 50
    
    for i in range(case_count):
        template_idx = i % 10
        tpl = topic_templates[template_idx]
        
        # Gender and pronouns
        g = random.choice(genders_pool)
        
        # Age
        age = random.randint(tpl["age_range"][0], tpl["age_range"][1])
        
        # Eye side
        eye_side = random.choice(["right", "left"])
        eye_side_abbr = "OD" if eye_side == "right" else "OS"
        eye_side_contr = "left" if eye_side == "right" else "right"
        eye_side_contr_abbr = "OS" if eye_side == "right" else "OD"
        
        # Random Vitals
        temp = f"{random.uniform(98.1, 98.9):.1f}"
        hr = random.randint(68, 85)
        bp_sys = random.randint(115, 138)
        bp_dia = random.randint(75, 88)
        bp = f"{bp_sys}/{bp_dia}"
        rr = random.randint(14, 18)
        
        # Special variables based on templates
        duration = random.randint(2, 5)
        pupil_size = f"{random.uniform(5.2, 6.4):.1f}"
        
        # IOP selection based on template
        if topic_key == "glaucoma":
            if template_idx == 0: # AACG
                iop = random.randint(46, 58)
            elif template_idx == 1: # POAG
                iop = random.randint(24, 30)
            elif template_idx == 2: # NTG
                iop = random.randint(14, 17)
            elif template_idx == 3: # NVG
                iop = random.randint(40, 52)
            elif template_idx == 4: # PXG
                iop = random.randint(28, 38)
            elif template_idx == 5: # Pigmentary
                iop = random.randint(26, 36)
            elif template_idx == 6: # Phacolytic
                iop = random.randint(38, 48)
            elif template_idx == 7: # Congenital
                iop = random.randint(28, 36)
            elif template_idx == 8: # Steroid
                iop = random.randint(26, 34)
            else:
                iop = random.randint(14, 18)
        elif topic_key == "trauma":
            if template_idx == 3: # Hyphema
                iop = random.randint(24, 34)
            elif template_idx == 6: # Retrobulbar
                iop = random.randint(45, 58)
            else:
                iop = random.randint(12, 18)
        else:
            # Default normal or slightly elevated IOP
            iop = random.randint(12, 19)
            
        cdr = f"{random.choice([0.75, 0.80, 0.85, 0.90]):.2f}"
        cdr_other = f"{random.choice([0.30, 0.35, 0.40, 0.45]):.2f}"
        cd4 = random.randint(15, 45)
        hba1c = f"{random.uniform(8.4, 11.2):.1f}"
        gest_weeks = random.randint(24, 28)
        birth_weight = random.randint(750, 1150)
        nicu_days = random.randint(30, 55)
        corneal_diam = f"{random.uniform(11.5, 13.0):.1f}"
        
        # Resolve dynamic VA values
        va_affected = tpl.get("va_affected", "20/80")
        va_unaffected = tpl.get("va_unaffected", "20/20")
        
        # Render scenario
        format_dict = {
            "age": age,
            "gender": g["gender"],
            "pronoun": g["pronoun"],
            "possessive": g["possessive"],
            "pronoun_cap": g["pronoun_cap"],
            "possessive_cap": g["possessive_cap"],
            "eye_side": eye_side,
            "eye_side_abbr": eye_side_abbr,
            "eye_side_contr": eye_side_contr,
            "eye_side_contr_abbr": eye_side_contr_abbr,
            "temp": temp,
            "hr": hr,
            "bp": bp,
            "bp_sys": bp_sys,
            "bp_dia": bp_dia,
            "rr": rr,
            "duration": duration,
            "pupil_size": pupil_size,
            "iop": iop,
            "cdr": cdr,
            "cdr_other": cdr_other,
            "cd4": cd4,
            "hba1c": hba1c,
            "gest_weeks": gest_weeks,
            "birth_weight": birth_weight,
            "nicu_days": nicu_days,
            "corneal_diam": corneal_diam,
            "va_affected": va_affected,
            "va_unaffected": va_unaffected
        }
        
        scenario_rendered = tpl["scenario"].format(**format_dict)
        
        # Unique Title per variation
        title_variants = [
            tpl["title"],
            f"{tpl['title']} - Clinical Presentation",
            f"Case Study: {tpl['title']}",
            f"{tpl['title']} - Case Analysis",
            f"Vignette: {tpl['title']}"
        ]
        # Use a deterministic variant but cycle through them
        variant_idx = i // 10
        title_rendered = title_variants[variant_idx % len(title_variants)]
        # Add a small number if it's the same to make sure it is 100% unique!
        title_rendered = f"{title_rendered} (V{variant_idx + 1})"
        
        # Process Questions
        questions_formatted = []
        for q in tpl["questions"]:
            # Shuffle options
            opts_orig = q["options"]
            ans_idx = q["answer"]
            
            opts_with_idx = list(enumerate(opts_orig))
            random.shuffle(opts_with_idx)
            
            shuffled_opts = [opt for o_idx, opt in opts_with_idx]
            new_ans_idx = [idx for idx, (o_idx, opt) in enumerate(opts_with_idx) if o_idx == ans_idx][0]
            
            questions_formatted.append({
                "q": q["q"],
                "options": shuffled_opts,
                "answer": new_ans_idx,
                "exp": q["exp"]
            })
            
        cases.append({
            "title": title_rendered,
            "scenario": scenario_rendered,
            "questions": questions_formatted
        })
        
    # Now write the SQL file!
    out_file = f"c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\{filename}"
    with open(out_file, 'w', encoding='utf-8') as f:
        f.write(f"-- Ophthalmology: {title_prefix}\n")
        f.write("-- US MD/MBBS (4th Year) clinical case blocks\n")
        f.write("-- Target platform: Supabase (Postgres)\n")
        f.write(f"-- Topic Slug: {slug}\n\n")
        f.write("BEGIN;\n\n")
        f.write("DO $$\n")
        f.write("DECLARE\n")
        f.write("    v_topic_id UUID;\n")
        f.write("    v_case_id UUID;\n")
        f.write("BEGIN\n")
        f.write(f"    SELECT id INTO v_topic_id FROM topics WHERE slug = '{slug}' LIMIT 1;\n")
        f.write("    IF v_topic_id IS NULL THEN\n")
        f.write(f"        RAISE EXCEPTION 'Topic slug % not found.', '{slug}';\n")
        f.write("    END IF;\n\n")

        for idx, c in enumerate(cases):
            case_order = idx + 1
            title_escaped = c['title'].replace("'", "''")
            scenario_escaped = c['scenario'].replace("'", "''")
            
            f.write(f"    ---------------------------------------------------------------------------\n")
            f.write(f"    -- CASE {case_order:02d}: {c['title']}\n")
            f.write(f"    ---------------------------------------------------------------------------\n")
            f.write(f"    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = '{title_escaped}' LIMIT 1;\n")
            f.write(f"    IF v_case_id IS NULL THEN\n")
            f.write(f"        INSERT INTO case_studies (topic_id, title, scenario, \"order\")\n")
            f.write(f"        VALUES (v_topic_id, '{title_escaped}', '{scenario_escaped}', {case_order}) RETURNING id INTO v_case_id;\n")
            f.write(f"    ELSE\n")
            f.write(f"        UPDATE case_studies SET scenario = '{scenario_escaped}', \"order\" = {case_order} WHERE id = v_case_id;\n")
            f.write(f"    END IF;\n\n")
            
            f.write(f"    DELETE FROM case_questions WHERE case_id = v_case_id;\n")
            f.write(f"    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES\n")
            for q_idx, q in enumerate(c['questions']):
                q_text_escaped = q['q'].replace("'", "''")
                opts_json = json.dumps(q['options'], ensure_ascii=False)
                opts_escaped = opts_json.replace("'", "''")
                exp_escaped = q['exp'].replace("'", "''")
                
                comma = "," if q_idx < len(c['questions']) - 1 else ";"
                f.write(f"    (v_case_id, '{q_text_escaped}', '{opts_escaped}'::jsonb, {q['answer']}, '{exp_escaped}'){comma}\n")
            f.write("\n")
            
        f.write("END $$;\n")
        f.write("COMMIT;\n")
        
    print(f"Successfully generated {filename} with 50 cases and 150 questions.")

# Main generation loop
if __name__ == "__main__":
    # Seed random for reproducibility
    random.seed(42)
    
    print("Starting generation of Ophthalmology Case Blocks...")
    for topic_key, config in topics_config.items():
        generate_sql_for_topic(topic_key, config)
    print("All Ophthalmology Case Blocks generated successfully!")

