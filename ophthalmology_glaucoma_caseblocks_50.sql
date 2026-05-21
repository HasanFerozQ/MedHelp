-- Ophthalmology: Glaucoma
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: optho-glaucoma

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'optho-glaucoma' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'optho-glaucoma';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: The Halos at Night (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Halos at Night (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Halos at Night (V1)', 'A 50-year-old female presents to the emergency department with sudden, severe pain in her left eye, accompanied by a severe headache, nausea, and blurry vision with rainbow-colored halos around lights. She reports the symptoms began after sitting in a dark movie theater.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 72 bpm | BP: 138/76 mmHg
*   **Visual Acuity:** OS: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Marked conjunctival injection with ciliary flush. The cornea appears steamy and cloudy. The pupil is fixed, mid-dilated measuring 5.9 mm, and non-reactive to light. The globe is rock-hard to palpation. Intraocular pressure (IOP) is 46 mmHg. OS gonioscopy shows a completely closed angle.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old female presents to the emergency department with sudden, severe pain in her left eye, accompanied by a severe headache, nausea, and blurry vision with rainbow-colored halos around lights. She reports the symptoms began after sitting in a dark movie theater.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 72 bpm | BP: 138/76 mmHg
*   **Visual Acuity:** OS: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Marked conjunctival injection with ciliary flush. The cornea appears steamy and cloudy. The pupil is fixed, mid-dilated measuring 5.9 mm, and non-reactive to light. The globe is rock-hard to palpation. Intraocular pressure (IOP) is 46 mmHg. OS gonioscopy shows a completely closed angle.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate next step in the immediate management of this patient?', '["Perform immediate surgical trabeculectomy in the emergency department", "Apply a tight pressure patch and schedule outpatient ophthalmology follow-up in 48 hours", "Administer topical timolol, pilocarpine, and apraclonidine, combined with systemic intravenous acetazolamide", "Initiate topical prednisolone acetate 1% drops every 15 minutes as monotherapy", "Prescribe oral ciprofloxacin 750 mg and apply topical tobramycin drops"]'::jsonb, 2, 'This patient presents with Acute Angle-Closure Glaucoma (AACG), an ocular emergency. Immediate medical management is directed at reducing intraocular pressure (IOP) and opening the angle. This is achieved by combining topical drops that decrease aqueous humor production (beta-blocker: timolol; alpha-2 agonist: apraclonidine) or increase outflow (miotic: pilocarpine, once IOP decreases below 40 mmHg and sphincter ischemia resolves) with systemic carbonic anhydrase inhibitors (IV acetazolamide). Pressure patching is contraindicated, steroids alone are insufficient, and laser peripheral iridotomy (LPI) is the definitive, rather than immediate bedside, treatment once the cornea clears.'),
    (v_case_id, 'What is the primary anatomical mechanism driving this condition in hyperopic patients?', '["Hypersecretion of aqueous humor by the ciliary body processes due to autonomic dysfunction", "Contraction of a fibrovascular membrane over the anterior chamber angle stimulated by retinal ischemia", "Pupillary block, where contact between the iris and lens prevents aqueous flow, forcing the peripheral iris forward to occlude the trabecular meshwork", "Deposition of abnormal fibrillar basement membrane material in the trabecular meshwork", "Congenital dysgenesis of the trabecular meshwork and iris insertion"]'::jsonb, 2, 'The primary mechanism of AACG is **pupillary block**. In anatomically predisposed eyes (typically hyperopes with short axial lengths and shallow anterior chambers), the iris comes into contact with the lens, blocking the normal flow of aqueous from the posterior chamber to the anterior chamber. This causes a pressure build-up in the posterior chamber, which pushes the peripheral iris forward (iris bombé) into contact with the trabecular meshwork, completely blocking aqueous drainage.'),
    (v_case_id, 'Which of the following classes of systemic or topical medications is strictly CONTRAINDICATED in patients with narrow or closed anterior chamber angles?', '["Osmotic diuretics", "Sympathomimetics and anticholinergics (mydriatics)", "Beta-adrenergic antagonists (beta-blockers)", "Carbonic anhydrase inhibitors", "Prostaglandin analogs"]'::jsonb, 1, 'Mydriatics (both anticholinergics like atropine/tropicamide and sympathomimetics like epinephrine/phenylephrine) cause pupillary dilation. In patients with narrow angles, pupillary dilation causes the iris to bunch up in the angle, which can trigger acute angle closure. Therefore, these drugs are strictly contraindicated in patients with untreated narrow angles.');

    ---------------------------------------------------------------------------
    -- CASE 02: The Slow Loss of Peripheral Vision (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Slow Loss of Peripheral Vision (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Slow Loss of Peripheral Vision (V1)', 'A 84-year-old female presents for a routine eye exam. She denies any eye pain, redness, or sudden vision changes, but admits that she feels she has been bumping into objects more frequently and has difficulty driving at night.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 80 bpm | BP: 118/80 mmHg
*   **Visual Acuity:** OD: 20/30; OS: 20/25
*   **Ocular Examination:** Bilateral clear corneas. Anterior chambers are deep and quiet. Gonioscopy shows open angles bilaterally. Slit-lamp fundus exam reveals significant optic nerve cupping, with a cup-to-disc ratio (CDR) of 0.90 in the right eye and 0.30 in the left eye, along with neuroretinal rim thinning and nasalization of the disc vessels. Intraocular pressure (IOP) is 29 mmHg bilaterally.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 84-year-old female presents for a routine eye exam. She denies any eye pain, redness, or sudden vision changes, but admits that she feels she has been bumping into objects more frequently and has difficulty driving at night.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 80 bpm | BP: 118/80 mmHg
*   **Visual Acuity:** OD: 20/30; OS: 20/25
*   **Ocular Examination:** Bilateral clear corneas. Anterior chambers are deep and quiet. Gonioscopy shows open angles bilaterally. Slit-lamp fundus exam reveals significant optic nerve cupping, with a cup-to-disc ratio (CDR) of 0.90 in the right eye and 0.30 in the left eye, along with neuroretinal rim thinning and nasalization of the disc vessels. Intraocular pressure (IOP) is 29 mmHg bilaterally.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate first-line pharmacotherapy for this patient''s condition?', '["Topical non-selective beta-blockers (e.g., timolol) in a patient with severe asthma", "Topical prostaglandin analogs (e.g., latanoprost)", "Systemic hyperosmotic agents (e.g., mannitol)", "Topical parasympathomimetics (e.g., pilocarpine)", "Oral carbonic anhydrase inhibitors (e.g., acetazolamide)"]'::jsonb, 1, 'This patient has Primary Open-Angle Glaucoma (POAG). First-line medical therapy typically consists of **topical prostaglandin analogs** (e.g., latanoprost, bimatoprost) because they are highly effective, have a once-daily dosing regimen, and have a favorable systemic safety profile compared to beta-blockers (which are contraindicated in asthma/COPD).'),
    (v_case_id, 'What is the primary site of increased resistance to aqueous humor outflow in Primary Open-Angle Glaucoma?', '["The uveoscleral pathway through the ciliary muscle", "The posterior chamber ciliary body epithelial cells", "The endothelial cell junctions of the episcleral veins", "The pupillary aperture between the iris and lens", "Trabecular meshwork (specifically the juxtacanalicular tissue) and Schlemm''s canal"]'::jsonb, 4, 'In POAG, the primary site of increased resistance to aqueous humor drainage is the **trabecular meshwork**, particularly the **juxtacanalicular tissue** and the inner wall of Schlemm''s canal. This leads to a gradual elevation of IOP, which causes mechanical and ischemic damage to the retinal ganglion cell axons at the optic nerve head.'),
    (v_case_id, 'What is the classic visual field defect pattern initially seen in patients with progressive open-angle glaucoma?', '["Central scotoma with normal peripheral visual fields", "Homonymous hemianopsia involving the macula", "Binasal hemianopsia sparing the temporal fields", "Arcuate (Bjerrum) scotoma and nasal steps, sparing central vision until late stages", "Bitemporal hemianopsia, starting superiorly"]'::jsonb, 3, 'Glaucoma characteristically spares the central macula fibers until the very late stages of the disease. The earliest visual field defects are typically located in the mid-periphery and follow the pattern of the retinal nerve fiber layer arching around the macula. This manifests as **arcuate scotomas** (Bjerrum scotomas) and **nasal steps**.');

    ---------------------------------------------------------------------------
    -- CASE 03: The Cupped Disc with Normal Pressures (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cupped Disc with Normal Pressures (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cupped Disc with Normal Pressures (V1)', 'A 75-year-old male with a history of severe migraines and Raynaud''s phenomenon presents for a comprehensive eye evaluation. His intraocular pressures (IOP) have historically been normal, measuring 15 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 79 bpm | BP: 121/85 mmHg
*   **Visual Acuity:** Bilateral 20/20
*   **Ocular Examination:** Anterior chamber angles are open (Grade 4 bilaterally). Optic nerve head examination shows a cup-to-disc ratio of 0.80 OD and 0.35 OS, with significant thinning of the inferior neuroretinal rim. A small, linear splinter-like hemorrhage (Drance hemorrhage) is visible at the inferior border of the right optic disc. Automated visual field testing shows a superior arcuate defect in the right eye.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 75-year-old male with a history of severe migraines and Raynaud''s phenomenon presents for a comprehensive eye evaluation. His intraocular pressures (IOP) have historically been normal, measuring 15 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 79 bpm | BP: 121/85 mmHg
*   **Visual Acuity:** Bilateral 20/20
*   **Ocular Examination:** Anterior chamber angles are open (Grade 4 bilaterally). Optic nerve head examination shows a cup-to-disc ratio of 0.80 OD and 0.35 OS, with significant thinning of the inferior neuroretinal rim. A small, linear splinter-like hemorrhage (Drance hemorrhage) is visible at the inferior border of the right optic disc. Automated visual field testing shows a superior arcuate defect in the right eye.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Ocular hypertension", "Anterior ischemic optic neuropathy", "Optic neuritis", "Primary open-angle glaucoma", "Normal-tension glaucoma"]'::jsonb, 4, 'This patient has **Normal-Tension Glaucoma (NTG)**, a subtype of POAG. NTG is characterized by: (1) progressive optic nerve cupping and visual field defects, (2) open angles, and (3) **IOP consistently <= 21 mmHg**. Splinter-like **Drance hemorrhages** at the optic disc margin are highly classic for NTG, as is an association with vasospastic disorders like migraines and Raynaud''s phenomenon.'),
    (v_case_id, 'Which factor is thought to play a larger role in the pathogenesis of Normal-Tension Glaucoma compared to high-tension POAG?', '["Trabecular meshwork cellular hypertrophy and sclerosis", "Primary autoimmune destruction of the scleral spur", "Vascular dysregulation, nocturnal hypotension, and poor optic nerve head perfusion", "Aqueous humor hypersecretion due to high sympathetic tone", "Mechanical compression of the optic nerve by narrow angles"]'::jsonb, 2, 'While elevated IOP is the main driver in POAG, **vascular dysregulation, optic nerve head ischemia, and nocturnal systemic hypotension** are major pathophysiological contributors in NTG. Patients have a higher prevalence of vasospastic diseases (migraines, Raynaud''s) and often experience nighttime blood pressure drops that compromise optic nerve perfusion pressure.'),
    (v_case_id, 'What is the recommended target reduction in intraocular pressure for patients with confirmed progression of Normal-Tension Glaucoma?', '["A 10% reduction using topical steroids to reduce inflammation", "Maintaining IOP below 10 mmHg with systemic medications only", "At least a 30% reduction from baseline IOP", "No IOP lowering is required because IOP is already normal", "Immediate bilateral trabeculectomy to reach an IOP of 0 mmHg"]'::jsonb, 2, 'The Collaborative Normal Tension Glaucoma Study (CNTGS) demonstrated that lowering IOP by **at least 30%** from baseline significantly slows the rate of visual field progression in NTG, confirming that even though IOP is in the "normal" range, it is still too high for the compromised optic nerves of these patients.');

    ---------------------------------------------------------------------------
    -- CASE 04: The Complication of Retinal Ischemia (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Complication of Retinal Ischemia (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Complication of Retinal Ischemia (V1)', 'A 75-year-old male with a 20-year history of poorly controlled type 2 diabetes presents with acute, severe pain, redness, and profound vision loss in the left eye for 3 days. He has a history of proliferative diabetic retinopathy but has missed recent appointments.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 72 bpm | BP: 122/86 mmHg
*   **Visual Acuity:** OS: 20/400; contralateral eye: 20/30
*   **Ocular Examination (OS):** Severe conjunctival injection. The cornea is hazy and edematous. Slit-lamp exam reveals multiple, tiny, abnormal looping vessels along the pupillary border (rubeosis iridis) and crossing the trabecular meshwork in the angle. IOP is 46 mmHg.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 75-year-old male with a 20-year history of poorly controlled type 2 diabetes presents with acute, severe pain, redness, and profound vision loss in the left eye for 3 days. He has a history of proliferative diabetic retinopathy but has missed recent appointments.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 72 bpm | BP: 122/86 mmHg
*   **Visual Acuity:** OS: 20/400; contralateral eye: 20/30
*   **Ocular Examination (OS):** Severe conjunctival injection. The cornea is hazy and edematous. Slit-lamp exam reveals multiple, tiny, abnormal looping vessels along the pupillary border (rubeosis iridis) and crossing the trabecular meshwork in the angle. IOP is 46 mmHg.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary underlying driver of abnormal blood vessel growth in this patient''s anterior segment?', '["Chronic bacterial infection of the vitreous cavity", "Mechanical friction of the posterior iris against the lens", "High systemic blood glucose directly stimulating iris endothelial cells", "A primary mutation in the fibrillin-1 gene", "Retinal ischemia leading to the release of Vascular Endothelial Growth Factor (VEGF)"]'::jsonb, 4, 'This is **Neovascular Glaucoma (NVG)**. The underlying cause is severe, widespread **retinal ischemia** (most commonly from proliferative diabetic retinopathy or central retinal vein occlusion). Ischemic retinal tissue releases **VEGF**, which diffuses forward into the anterior chamber, stimulating the growth of abnormal new vessels on the iris (rubeosis iridis) and in the anterior chamber angle.'),
    (v_case_id, 'What is the definitive therapy to address the underlying cause of this patient''s neovascularization?', '["Intravenous administration of high-dose corticosteroids", "Topical hourly corticosteroids alone", "Urgent laser peripheral iridotomy", "Panretinal Photocoagulation (PRP) of the retina and intravitreal anti-VEGF injection", "Surgical iridectomy and vitrectomy"]'::jsonb, 3, 'The definitive treatment to stop the drive for neovascularization is **Panretinal Photocoagulation (PRP)** of the ischemic retina. PRP destroys peripheral retina, reducing oxygen demand and subsequent VEGF release. In the acute phase, **intravitreal anti-VEGF injections** are highly effective in causing rapid regression of the iris and angle vessels, helping to stabilize IOP before PRP can be completed.'),
    (v_case_id, 'How does neovascularization in the angle eventually lead to irreversible, closed-angle glaucoma?', '["The fibrovascular membrane contracts, pulling the peripheral iris over the trabecular meshwork (synechial angle closure)", "The abnormal vessels mechanically plug Schlemm''s canal from the inside", "The vessels bleed, causing a massive hyphema that clots and blocks the trabecular meshwork", "Inflammatory macrophages engulfing the vessels clog the drainage system", "The vessels cause the lens to swell and push forward, occluding the pupil"]'::jsonb, 0, 'Initially, the neovascular membrane mechanically blocks the trabecular meshwork (open-angle stage). However, the **fibrovascular membrane eventually contracts**, pulling the peripheral iris forward over the trabecular meshwork. This leads to **synechial angle closure**, which is irreversible and requires surgical drainage procedures (like a glaucoma drainage device or trabeculectomy) if medical therapy fails.');

    ---------------------------------------------------------------------------
    -- CASE 05: The Dandruff-like Deposits (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dandruff-like Deposits (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dandruff-like Deposits (V1)', 'A 68-year-old female presents with progressive, painless vision loss in her left eye. She has no history of eye trauma or surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 78 bpm | BP: 118/79 mmHg
*   **Visual Acuity:** OS: 20/60; contralateral eye: 20/25
*   **Ocular Examination (OS):** Slit-lamp exam reveals clear cornea. The anterior chamber is deep. On the anterior lens capsule, there is a classic three-zone pattern of white, flaky, amyloid-like material (a central disc, a clear zone, and a peripheral band). Similar dandruff-like material is visible at the pupillary margin. Gonioscopy shows a heavily pigmented trabecular meshwork with a dark line of pigment anterior to Schwalbe''s line (Sampaolesi line). IOP is 32 mmHg OD and 16 mmHg OS.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 68-year-old female presents with progressive, painless vision loss in her left eye. She has no history of eye trauma or surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 78 bpm | BP: 118/79 mmHg
*   **Visual Acuity:** OS: 20/60; contralateral eye: 20/25
*   **Ocular Examination (OS):** Slit-lamp exam reveals clear cornea. The anterior chamber is deep. On the anterior lens capsule, there is a classic three-zone pattern of white, flaky, amyloid-like material (a central disc, a clear zone, and a peripheral band). Similar dandruff-like material is visible at the pupillary margin. Gonioscopy shows a heavily pigmented trabecular meshwork with a dark line of pigment anterior to Schwalbe''s line (Sampaolesi line). IOP is 32 mmHg OD and 16 mmHg OS.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Primary open-angle glaucoma", "Uveitic glaucoma", "Phacolytic glaucoma", "Pseudoexfoliation glaucoma", "Pigmentary glaucoma"]'::jsonb, 3, 'This is **Pseudoexfoliation Glaucoma (PXG)**. It is characterized by the deposition of white, flaky, fibrillar extracellular material on the anterior lens capsule, pupillary border, and trabecular meshwork. Classic findings include a **three-zone pattern on the lens capsule** and a **Sampaolesi line** (pigment band at Schwalbe''s line) on gonioscopy. It is typically unilateral or highly asymmetric and carries a higher risk of optic nerve damage due to large, volatile IOP spikes.'),
    (v_case_id, 'During future cataract extraction surgery, what specific anatomical risk must the surgeon be prepared for in this patient?', '["Severe, intraoperative retrobulbar hemorrhage", "Rapid corneal endothelial cell decompensation", "An increased risk of postoperative retinal detachment", "Zonular weakness and laxity, leading to lens subluxation or vitreous loss", "Failure of the pupil to constrict intraoperatively"]'::jsonb, 3, 'Pseudoexfoliation material deposits on and damages the **lens zonules**, leading to **zonular weakness, laxity, and dialysis**. During cataract surgery, this makes the lens unstable, significantly increasing the risk of lens subluxation, posterior capsular rupture, and vitreous loss.'),
    (v_case_id, 'What is the systemic nature of Pseudoexfoliation syndrome?', '["An autoimmune vasculitis associated with HLA-B27", "A metastatic neuroendocrine tumor releasing serotonin", "A generalized basement membrane disorder with abnormal elastic fiber production throughout the body", "An localized ocular inflammatory reaction to lens proteins", "An autosomal recessive lysosomal storage disease"]'::jsonb, 2, 'Pseudoexfoliation syndrome is a **systemic basement membrane disorder** characterized by the widespread production and progressive accumulation of abnormal microfibrillar, proteinaceous material. This material has been detected in the heart, lungs, liver, kidneys, and blood vessels, and is associated with an increased risk of cardiovascular and cerebrovascular disease.');

    ---------------------------------------------------------------------------
    -- CASE 06: The Exercise-Induced Blur (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Exercise-Induced Blur (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Exercise-Induced Blur (V1)', 'A 27-year-old myopic female presents with a history of recurrent episodes of blurry vision and rainbow halos in the left eye, typically occurring after intensive exercise or running. IOP in the affected eye is 35 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 85 bpm | BP: 119/77 mmHg
*   **Visual Acuity:** OS: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OS):** Slit-lamp exam shows a clear cornea with a vertical band of brown pigment on the corneal endothelium (Krukenberg spindle). The anterior chamber is very deep. Transillumination of the iris reveals multiple mid-peripheral spoke-like defects. Gonioscopy shows a wide-open angle with a dense, homogeneous 360-degree dark brown band in the trabecular meshwork.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 27-year-old myopic female presents with a history of recurrent episodes of blurry vision and rainbow halos in the left eye, typically occurring after intensive exercise or running. IOP in the affected eye is 35 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 85 bpm | BP: 119/77 mmHg
*   **Visual Acuity:** OS: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OS):** Slit-lamp exam shows a clear cornea with a vertical band of brown pigment on the corneal endothelium (Krukenberg spindle). The anterior chamber is very deep. Transillumination of the iris reveals multiple mid-peripheral spoke-like defects. Gonioscopy shows a wide-open angle with a dense, homogeneous 360-degree dark brown band in the trabecular meshwork.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pigmentary glaucoma", "Pseudoexfoliation glaucoma", "Anterior uveitis", "Primary open-angle glaucoma", "Phacolytic glaucoma"]'::jsonb, 0, 'This is **Pigmentary Glaucoma**, which typically affects young, myopic males. It is characterized by: (1) a deep anterior chamber, (2) pigment deposits on the corneal endothelium in a vertical line (**Krukenberg spindle**), (3) mid-peripheral spoke-like **iris transillumination defects**, and (4) heavy, dark brown pigment in the trabecular meshwork. IOP spikes can be triggered by exercise or pupillary movement, which rubs pigment off the iris.'),
    (v_case_id, 'What is the mechanical cause of pigment shedding in this condition?', '["Mechanical trauma to the iris from a loose intraocular lens", "Primary degeneration of the corneal endothelial cells", "A congenital failure of the iris stroma to fuse", "Autoimmune destruction of the iris melanocytes", "Friction between the posterior iris pigment epithelium and the anterior lens zonular fibers"]'::jsonb, 4, 'Pigment dispersion occurs due to a **mechanical friction** between the **posterior iris pigment epithelium** and the **anterior lens zonular fibers**. In myopic eyes with a backward-bowed iris (concave iris configuration), the movement of the iris against the zonules rubs off pigment granules, which are then swept by aqueous currents into the anterior chamber.'),
    (v_case_id, 'Why does exercise or pupillary dilation trigger an acute spike in intraocular pressure in these patients?', '["Exercise increases systemic blood pressure, which directly elevates aqueous humor production", "Lactic acid accumulation in the cornea causes rapid stromal swelling", "Sympathetic stimulation causes swelling of the ciliary body", "Physical movement or rapid pupillary changes cause a sudden shower of pigment to block the trabecular meshwork", "Mydriasis causes pupillary block and acute angle closure in these deep chambers"]'::jsonb, 3, 'Exercise or pupillary dilation (mydriasis) causes the iris to rub more vigorously against the zonules, releasing a **sudden shower of pigment granules**. These granules travel into the anterior chamber and physically clog the trabecular meshwork, leading to an acute, transient spike in IOP, presenting as blurry vision and halos from corneal edema.');

    ---------------------------------------------------------------------------
    -- CASE 07: The Hypermature Cataract (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hypermature Cataract (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hypermature Cataract (V1)', 'A 70-year-old female from a rural area presents with acute onset of severe, aching pain, redness, and worsening vision in the right eye. She has had a dense cataract and very poor vision in that eye for over 4 years, but did not seek surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 69 bpm | BP: 122/76 mmHg
*   **Visual Acuity:** OD: Hand Motion; contralateral eye: 20/40
*   **Ocular Examination (OD):** Marked conjunctival injection. Cornea is edematous with microcystic changes. Slit-lamp exam shows a completely white, opaque lens with a wrinkled anterior capsule. The anterior chamber is deep but shows 3+ inflammatory cell and flare, and floating white clumps. No keratic precipitates (KPs) are visible on the endothelium. IOP is 41 mmHg.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old female from a rural area presents with acute onset of severe, aching pain, redness, and worsening vision in the right eye. She has had a dense cataract and very poor vision in that eye for over 4 years, but did not seek surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 69 bpm | BP: 122/76 mmHg
*   **Visual Acuity:** OD: Hand Motion; contralateral eye: 20/40
*   **Ocular Examination (OD):** Marked conjunctival injection. Cornea is edematous with microcystic changes. Slit-lamp exam shows a completely white, opaque lens with a wrinkled anterior capsule. The anterior chamber is deep but shows 3+ inflammatory cell and flare, and floating white clumps. No keratic precipitates (KPs) are visible on the endothelium. IOP is 41 mmHg.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Acute angle-closure glaucoma", "Phacoanaphylactic endophthalmitis", "Phacolytic glaucoma", "HLA-B27 associated anterior uveitis", "Neovascular glaucoma"]'::jsonb, 2, 'This is **Phacolytic Glaucoma**, a form of lens-induced open-angle glaucoma. It occurs in eyes with a **hypermature or mature cataract**. The lens cortex liquefies and high-molecular-weight lens proteins leak through microscopic pores in the degenerated, **wrinkled anterior lens capsule**. These proteins, along with protein-engulfed macrophages, physically obstruct the trabecular meshwork, causing a rapid, severe rise in IOP.'),
    (v_case_id, 'What is the definitive management of this patient''s condition?', '["Surgical trabeculectomy with the cataract left in place", "Intravitreal injection of broad-spectrum antibiotics and urgent vitrectomy", "Immediate laser peripheral iridotomy", "Chronic topical corticosteroid therapy and lifetime Timolol drops", "Lower IOP medically using topical drops and systemic acetazolamide, followed by urgent cataract extraction"]'::jsonb, 4, 'The definitive treatment is **cataract extraction** (removal of the leaking lens). Before surgery, IOP must be aggressively lowered medically (using topical beta-blockers, alpha-agonists, and systemic acetazolamide/mannitol) and corneal edema reduced. Once the IOP is controlled and the eye is stabilized, urgent cataract surgery is performed to remove the source of the protein.'),
    (v_case_id, 'Which slit-lamp finding helps differentiate Phacolytic Glaucoma from infectious or autoimmune anterior uveitis?', '["The presence of a shallow anterior chamber and pupillary block", "The absence of keratic precipitates (KPs) on the corneal endothelium despite heavy anterior chamber cell/flare", "The presence of iris transillumination defects in the mid-periphery", "An elevated, wrinkled grey retina with a horseshoe-shaped tear", "A Sampaolesi line in the anterior chamber angle on gonioscopy"]'::jsonb, 1, 'Phacolytic glaucoma is an open-angle glaucoma presenting with high IOP and cell/flare. A key clinical differentiator is the **absence of keratic precipitates (KPs)** on the corneal endothelium, despite what appears to be severe "inflammatory" cells in the anterior chamber. The "cells" are actually protein aggregates and macrophages, rather than primary inflammatory cells adhering to the endothelium.');

    ---------------------------------------------------------------------------
    -- CASE 08: The Clouded Large Eyes (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Clouded Large Eyes (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Clouded Large Eyes (V1)', 'A 0-month-old infant is brought to the ophthalmology clinic by her mother due to constant tearing (epiphora), extreme sensitivity to light (photophobia), and frequent squeezing of the eyelids (blepharospasm) in both eyes. The mother notes the baby''s eyes look unusually large.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Poor fixation and following targets in both eyes.
*   **Ocular Examination (OU):** Severe corneal clouding and edema. The corneal diameters are enlarged, measuring 12.8 mm (normal infant diameter is <10.5 mm). Handheld slit-lamp exam under anesthesia reveals horizontal, linear breaks in Descemet''s membrane (Haab''s striae). IOP is 30 mmHg bilaterally.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 0-month-old infant is brought to the ophthalmology clinic by her mother due to constant tearing (epiphora), extreme sensitivity to light (photophobia), and frequent squeezing of the eyelids (blepharospasm) in both eyes. The mother notes the baby''s eyes look unusually large.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Poor fixation and following targets in both eyes.
*   **Ocular Examination (OU):** Severe corneal clouding and edema. The corneal diameters are enlarged, measuring 12.8 mm (normal infant diameter is <10.5 mm). Handheld slit-lamp exam under anesthesia reveals horizontal, linear breaks in Descemet''s membrane (Haab''s striae). IOP is 30 mmHg bilaterally.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary treatment?', '["Congenital dacryostenosis; nasolacrimal duct probing and topical antibiotics", "Herpes simplex ophthalmia neonatorum; topical acyclovir gel and systemic acyclovir", "Congenital cataract; urgent lens aspiration and intraocular lens implantation", "Primary congenital glaucoma; surgical intervention (e.g., goniotomy or trabeculotomy)", "Retinoblastoma; immediate systemic chemotherapy or enucleation"]'::jsonb, 3, 'This infant has **Primary Congenital Glaucoma**, characterized by the triad of **epiphora, photophobia, and blepharospasm**, along with corneal clouding, **buphthalmos** (enlarged eyes), and **Haab''s striae** (breaks in Descemet''s membrane). Treatment is **primarily surgical** (goniotomy or trabeculotomy) to physically open the malformed angle, as medical therapy is only an adjunct to clear the cornea before surgery.'),
    (v_case_id, 'What is the primary developmental defect responsible for Primary Congenital Glaucoma?', '["In utero infection with Cytomegalovirus leading to uveal inflammation", "Deposition of abnormal copper in Descemet''s membrane", "Autoimmune destruction of the scleral canal of Schlemm", "Failure of the nasolacrimal duct to canalize prior to birth", "Dysgenesis of the trabecular meshwork and anterior chamber angle (Barkan''s membrane)"]'::jsonb, 4, 'Primary congenital glaucoma is caused by **trabecular meshwork dysgenesis** (incomplete development of the trabecular meshwork and anterior chamber angle). A membrane-like tissue sheet (classically called Barkan''s membrane, though histologically representing compact trabecular tissue) blocks the outflow of aqueous humor, leading to high IOP in utero or shortly after birth.'),
    (v_case_id, 'Why do infants with congenital glaucoma develop abnormally large eyes (buphthalmos), whereas adults with high IOP do not?', '["The high pressure stimulates rapid bone growth of the surrounding orbit", "Infants produce twice the volume of aqueous humor as adults, inflating the globe", "The infant sclera and cornea are highly elastic and stretch under high intraocular pressure", "High IOP causes chronic hyperopia and axial length shortening", "The infant lens swells and expands the entire anterior segment"]'::jsonb, 2, 'In infants (under the age of 3), the collagen fibers of the **sclera and cornea are highly elastic and stretchable**. When exposed to high intraocular pressure, the entire globe stretches and enlarges, a condition known as **buphthalmos** ("ox eye"). In adults, the sclera is rigid and calcified, so high IOP does not cause enlargement of the globe.');

    ---------------------------------------------------------------------------
    -- CASE 09: The Cost of Suppressed Inflammation (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cost of Suppressed Inflammation (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cost of Suppressed Inflammation (V1)', 'A 35-year-old female with a history of chronic anterior uveitis presents with a 2-week history of mild, painless blurry vision in her left eye. She has been using topical prednisolone acetate 1% drops 4 times daily in that eye for the past 3 months to prevent uveitis flare-ups.

**Physical Examination:**
*   **Vitals:** Temp: 98.1°F | HR: 80 bpm | BP: 123/87 mmHg
*   **Visual Acuity:** OS: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OS):** Cornea is clear. Anterior chamber is completely quiet (0 cells, 0 flare). Gonioscopy shows an open angle. Slit-lamp exam of the optic nerve reveals a cup-to-disc ratio of 0.90, with thinning of the superior and inferior neuroretinal rim. IOP is 34 mmHg. OS exam is completely normal with an IOP of 14 mmHg.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old female with a history of chronic anterior uveitis presents with a 2-week history of mild, painless blurry vision in her left eye. She has been using topical prednisolone acetate 1% drops 4 times daily in that eye for the past 3 months to prevent uveitis flare-ups.

**Physical Examination:**
*   **Vitals:** Temp: 98.1°F | HR: 80 bpm | BP: 123/87 mmHg
*   **Visual Acuity:** OS: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OS):** Cornea is clear. Anterior chamber is completely quiet (0 cells, 0 flare). Gonioscopy shows an open angle. Slit-lamp exam of the optic nerve reveals a cup-to-disc ratio of 0.90, with thinning of the superior and inferior neuroretinal rim. IOP is 34 mmHg. OS exam is completely normal with an IOP of 14 mmHg.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate initial management for this patient''s elevated intraocular pressure?', '["Perform a laser peripheral iridotomy", "Increase the frequency of prednisolone drops to every hour to reduce trabecular inflammation", "Prescribe oral prednisone 60 mg daily to systemically control the disease", "Taper and discontinue the topical prednisolone, switch to a ''soft'' steroid if needed, and initiate IOP-lowering drops", "Perform immediate surgical trabeculectomy with mitomycin C"]'::jsonb, 3, 'This patient has **Steroid-Induced Glaucoma**. The first step is to **taper and discontinue the offending corticosteroid** if the underlying uveitis is quiet. If corticosteroid therapy is still required, the patient should be switched to a "soft" steroid with less propensity to raise IOP (e.g., loteprednol, fluorometholone). Topical IOP-lowering agents (like latanoprost or timolol) should be initiated to protect the optic nerve while the steroid effect washes out.'),
    (v_case_id, 'What is the molecular mechanism by which corticosteroids increase intraocular pressure?', '["Promoting neovascularization of the anterior chamber angle", "Causing swelling of the crystalline lens, leading to pupillary block", "Decreasing trabecular meshwork extracellular matrix clearance, increasing outflow resistance", "Stimulating ciliary body beta-2 receptors, increasing aqueous secretion", "Directly blocking the lumen of Schlemm''s canal via microthrombi"]'::jsonb, 2, 'Corticosteroids increase IOP by **increasing resistance to aqueous outflow at the trabecular meshwork**. They do this by: (1) inhibiting the degradation of extracellular matrix (ECM) proteins, leading to glycosaminoglycan accumulation, (2) increasing expression of myocilin protein, and (3) causing morphologic changes in trabecular meshwork cells (e.g., forming cross-linked actin networks) that decrease their filtering capacity.'),
    (v_case_id, 'Which patient population is at the HIGHEST risk of being a high ''steroid responder'' (developing high IOP after steroid use)?', '["Patients with a history of HLA-B27 positive ankylosing spondylitis", "Infants with congenital nasolacrimal duct obstruction", "Young males with pigment dispersion syndrome", "Patients with a personal or first-degree family history of primary open-angle glaucoma, and high myopes", "Patients with hyperopia and shallow anterior chambers"]'::jsonb, 3, 'The risk of developing a steroid-induced IOP spike is significantly higher in **patients with POAG (over 90% are responders)**, first-degree relatives of POAG patients, high myopes, patients with connective tissue diseases (like rheumatoid arthritis), and very young or very old patients. These populations must be monitored closely whenever started on steroid drops.');

    ---------------------------------------------------------------------------
    -- CASE 10: The Side Effects of Therapy (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Side Effects of Therapy (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Side Effects of Therapy (V1)', 'A 72-year-old female with bilateral primary open-angle glaucoma presents to her primary care physician complaining of worsening shortness of breath, wheezing, and fatigue. She was started on a new eye drop by her ophthalmologist 2 weeks ago. She has a history of moderate asthma.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 75 bpm (bradycardia) | BP: 110/70 mmHg | RR: 14/min
*   **Pulmonary:** Bilateral expiratory wheezing and prolonged expiratory phase on auscultation.
*   **Ocular Examination:** Bilateral quiet eyes, IOPs are well-controlled at 14 mmHg OU.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 72-year-old female with bilateral primary open-angle glaucoma presents to her primary care physician complaining of worsening shortness of breath, wheezing, and fatigue. She was started on a new eye drop by her ophthalmologist 2 weeks ago. She has a history of moderate asthma.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 75 bpm (bradycardia) | BP: 110/70 mmHg | RR: 14/min
*   **Pulmonary:** Bilateral expiratory wheezing and prolonged expiratory phase on auscultation.
*   **Ocular Examination:** Bilateral quiet eyes, IOPs are well-controlled at 14 mmHg OU.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following glaucoma medications is most likely responsible for this patient''s systemic symptoms?', '["Pilocarpine (parasympathomimetic)", "Timolol (non-selective beta-blocker)", "Latanoprost (prostaglandin analog)", "Dorzolamide (carbonic anhydrase inhibitor)", "Brimonidine (alpha-2 agonist)"]'::jsonb, 1, 'The patient''s presentation of asthma exacerbation (wheezing, dyspnea) and bradycardia (HR <60) after starting a new eye drop is classic for **Timolol**, a non-selective beta-adrenergic antagonist. Topical eye drops undergo mucosal absorption through the nasolacrimal duct, bypassing first-pass hepatic metabolism and achieving significant systemic levels. Timolol blocks beta-2 receptors in the bronchioles, causing life-threatening bronchospasm in asthmatics, and beta-1 receptors in the heart, causing bradycardia and heart block.'),
    (v_case_id, 'The patient''s timolol is discontinued. The ophthalmologist decides to switch to a prostaglandin analog (e.g., latanoprost). Which local side effect should the patient be educated about?', '["Severe allergic follicular conjunctivitis and contact dermatitis", "Pupillary constriction (miosis), brow ache, and transient myopia", "Dry mouth, drowsiness, and headache", "Bitter taste and corneal endothelial deposits", "Increased brown pigmentation of the iris, lengthening and darkening of eyelashes, and orbital fat atrophy"]'::jsonb, 4, 'Topical **prostaglandin analogs** (latanoprost, bimatoprost) have well-known cosmetic and local side effects: (1) **increased iris pigmentation** (turning blue/green eyes brown due to increased melanin production), (2) **hypertrichosis** (eyelash lengthening, thickening, and darkening), and (3) **prostaglandin-associated periorbitopathy** (orbital fat atrophy, causing a sunken eye appearance/deepening of the lid sulcus).'),
    (v_case_id, 'Another patient is started on Brimonidine (an alpha-2 agonist) and develops severe red eyes. What is the classic local side effect of Brimonidine that necessitates drug discontinuation?', '["Intraoperative floppy iris syndrome", "Macular edema in aphakic patients", "Posterior synechiae formation", "Corneal stromal melting", "Allergic follicular conjunctivitis"]'::jsonb, 4, 'Topical **Brimonidine** (an alpha-2 adrenergic agonist) is notorious for causing **allergic follicular conjunctivitis** or contact blepharoconjunctivitis in up to 15-20% of patients. It typically presents as delayed redness, severe itching, and follicles in the inferior palpebral conjunctiva, requiring discontinuation of the drug. Brimonidine also crosses the blood-brain barrier and can cause systemic somnolence/fatigue and is contraindicated in infants due to risk of central apnea and coma.');

    ---------------------------------------------------------------------------
    -- CASE 11: The Halos at Night - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Halos at Night - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Halos at Night - Clinical Presentation (V2)', 'A 61-year-old female presents to the emergency department with sudden, severe pain in her right eye, accompanied by a severe headache, nausea, and blurry vision with rainbow-colored halos around lights. She reports the symptoms began after sitting in a dark movie theater.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 79 bpm | BP: 124/77 mmHg
*   **Visual Acuity:** OD: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Marked conjunctival injection with ciliary flush. The cornea appears steamy and cloudy. The pupil is fixed, mid-dilated measuring 5.9 mm, and non-reactive to light. The globe is rock-hard to palpation. Intraocular pressure (IOP) is 58 mmHg. OS gonioscopy shows a completely closed angle.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 61-year-old female presents to the emergency department with sudden, severe pain in her right eye, accompanied by a severe headache, nausea, and blurry vision with rainbow-colored halos around lights. She reports the symptoms began after sitting in a dark movie theater.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 79 bpm | BP: 124/77 mmHg
*   **Visual Acuity:** OD: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Marked conjunctival injection with ciliary flush. The cornea appears steamy and cloudy. The pupil is fixed, mid-dilated measuring 5.9 mm, and non-reactive to light. The globe is rock-hard to palpation. Intraocular pressure (IOP) is 58 mmHg. OS gonioscopy shows a completely closed angle.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate next step in the immediate management of this patient?', '["Administer topical timolol, pilocarpine, and apraclonidine, combined with systemic intravenous acetazolamide", "Perform immediate surgical trabeculectomy in the emergency department", "Initiate topical prednisolone acetate 1% drops every 15 minutes as monotherapy", "Apply a tight pressure patch and schedule outpatient ophthalmology follow-up in 48 hours", "Prescribe oral ciprofloxacin 750 mg and apply topical tobramycin drops"]'::jsonb, 0, 'This patient presents with Acute Angle-Closure Glaucoma (AACG), an ocular emergency. Immediate medical management is directed at reducing intraocular pressure (IOP) and opening the angle. This is achieved by combining topical drops that decrease aqueous humor production (beta-blocker: timolol; alpha-2 agonist: apraclonidine) or increase outflow (miotic: pilocarpine, once IOP decreases below 40 mmHg and sphincter ischemia resolves) with systemic carbonic anhydrase inhibitors (IV acetazolamide). Pressure patching is contraindicated, steroids alone are insufficient, and laser peripheral iridotomy (LPI) is the definitive, rather than immediate bedside, treatment once the cornea clears.'),
    (v_case_id, 'What is the primary anatomical mechanism driving this condition in hyperopic patients?', '["Pupillary block, where contact between the iris and lens prevents aqueous flow, forcing the peripheral iris forward to occlude the trabecular meshwork", "Contraction of a fibrovascular membrane over the anterior chamber angle stimulated by retinal ischemia", "Deposition of abnormal fibrillar basement membrane material in the trabecular meshwork", "Hypersecretion of aqueous humor by the ciliary body processes due to autonomic dysfunction", "Congenital dysgenesis of the trabecular meshwork and iris insertion"]'::jsonb, 0, 'The primary mechanism of AACG is **pupillary block**. In anatomically predisposed eyes (typically hyperopes with short axial lengths and shallow anterior chambers), the iris comes into contact with the lens, blocking the normal flow of aqueous from the posterior chamber to the anterior chamber. This causes a pressure build-up in the posterior chamber, which pushes the peripheral iris forward (iris bombé) into contact with the trabecular meshwork, completely blocking aqueous drainage.'),
    (v_case_id, 'Which of the following classes of systemic or topical medications is strictly CONTRAINDICATED in patients with narrow or closed anterior chamber angles?', '["Sympathomimetics and anticholinergics (mydriatics)", "Osmotic diuretics", "Prostaglandin analogs", "Carbonic anhydrase inhibitors", "Beta-adrenergic antagonists (beta-blockers)"]'::jsonb, 0, 'Mydriatics (both anticholinergics like atropine/tropicamide and sympathomimetics like epinephrine/phenylephrine) cause pupillary dilation. In patients with narrow angles, pupillary dilation causes the iris to bunch up in the angle, which can trigger acute angle closure. Therefore, these drugs are strictly contraindicated in patients with untreated narrow angles.');

    ---------------------------------------------------------------------------
    -- CASE 12: The Slow Loss of Peripheral Vision - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Slow Loss of Peripheral Vision - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Slow Loss of Peripheral Vision - Clinical Presentation (V2)', 'A 61-year-old male presents for a routine eye exam. He denies any eye pain, redness, or sudden vision changes, but admits that he feels he has been bumping into objects more frequently and has difficulty driving at night.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 76 bpm | BP: 116/75 mmHg
*   **Visual Acuity:** OD: 20/30; OS: 20/25
*   **Ocular Examination:** Bilateral clear corneas. Anterior chambers are deep and quiet. Gonioscopy shows open angles bilaterally. Slit-lamp fundus exam reveals significant optic nerve cupping, with a cup-to-disc ratio (CDR) of 0.80 in the right eye and 0.45 in the left eye, along with neuroretinal rim thinning and nasalization of the disc vessels. Intraocular pressure (IOP) is 26 mmHg bilaterally.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 61-year-old male presents for a routine eye exam. He denies any eye pain, redness, or sudden vision changes, but admits that he feels he has been bumping into objects more frequently and has difficulty driving at night.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 76 bpm | BP: 116/75 mmHg
*   **Visual Acuity:** OD: 20/30; OS: 20/25
*   **Ocular Examination:** Bilateral clear corneas. Anterior chambers are deep and quiet. Gonioscopy shows open angles bilaterally. Slit-lamp fundus exam reveals significant optic nerve cupping, with a cup-to-disc ratio (CDR) of 0.80 in the right eye and 0.45 in the left eye, along with neuroretinal rim thinning and nasalization of the disc vessels. Intraocular pressure (IOP) is 26 mmHg bilaterally.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate first-line pharmacotherapy for this patient''s condition?', '["Oral carbonic anhydrase inhibitors (e.g., acetazolamide)", "Topical non-selective beta-blockers (e.g., timolol) in a patient with severe asthma", "Systemic hyperosmotic agents (e.g., mannitol)", "Topical prostaglandin analogs (e.g., latanoprost)", "Topical parasympathomimetics (e.g., pilocarpine)"]'::jsonb, 3, 'This patient has Primary Open-Angle Glaucoma (POAG). First-line medical therapy typically consists of **topical prostaglandin analogs** (e.g., latanoprost, bimatoprost) because they are highly effective, have a once-daily dosing regimen, and have a favorable systemic safety profile compared to beta-blockers (which are contraindicated in asthma/COPD).'),
    (v_case_id, 'What is the primary site of increased resistance to aqueous humor outflow in Primary Open-Angle Glaucoma?', '["The uveoscleral pathway through the ciliary muscle", "The posterior chamber ciliary body epithelial cells", "Trabecular meshwork (specifically the juxtacanalicular tissue) and Schlemm''s canal", "The pupillary aperture between the iris and lens", "The endothelial cell junctions of the episcleral veins"]'::jsonb, 2, 'In POAG, the primary site of increased resistance to aqueous humor drainage is the **trabecular meshwork**, particularly the **juxtacanalicular tissue** and the inner wall of Schlemm''s canal. This leads to a gradual elevation of IOP, which causes mechanical and ischemic damage to the retinal ganglion cell axons at the optic nerve head.'),
    (v_case_id, 'What is the classic visual field defect pattern initially seen in patients with progressive open-angle glaucoma?', '["Binasal hemianopsia sparing the temporal fields", "Central scotoma with normal peripheral visual fields", "Bitemporal hemianopsia, starting superiorly", "Arcuate (Bjerrum) scotoma and nasal steps, sparing central vision until late stages", "Homonymous hemianopsia involving the macula"]'::jsonb, 3, 'Glaucoma characteristically spares the central macula fibers until the very late stages of the disease. The earliest visual field defects are typically located in the mid-periphery and follow the pattern of the retinal nerve fiber layer arching around the macula. This manifests as **arcuate scotomas** (Bjerrum scotomas) and **nasal steps**.');

    ---------------------------------------------------------------------------
    -- CASE 13: The Cupped Disc with Normal Pressures - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cupped Disc with Normal Pressures - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cupped Disc with Normal Pressures - Clinical Presentation (V2)', 'A 76-year-old female with a history of severe migraines and Raynaud''s phenomenon presents for a comprehensive eye evaluation. Her intraocular pressures (IOP) have historically been normal, measuring 15 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 85 bpm | BP: 128/84 mmHg
*   **Visual Acuity:** Bilateral 20/20
*   **Ocular Examination:** Anterior chamber angles are open (Grade 4 bilaterally). Optic nerve head examination shows a cup-to-disc ratio of 0.90 OD and 0.30 OS, with significant thinning of the inferior neuroretinal rim. A small, linear splinter-like hemorrhage (Drance hemorrhage) is visible at the inferior border of the right optic disc. Automated visual field testing shows a superior arcuate defect in the right eye.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 76-year-old female with a history of severe migraines and Raynaud''s phenomenon presents for a comprehensive eye evaluation. Her intraocular pressures (IOP) have historically been normal, measuring 15 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 85 bpm | BP: 128/84 mmHg
*   **Visual Acuity:** Bilateral 20/20
*   **Ocular Examination:** Anterior chamber angles are open (Grade 4 bilaterally). Optic nerve head examination shows a cup-to-disc ratio of 0.90 OD and 0.30 OS, with significant thinning of the inferior neuroretinal rim. A small, linear splinter-like hemorrhage (Drance hemorrhage) is visible at the inferior border of the right optic disc. Automated visual field testing shows a superior arcuate defect in the right eye.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Optic neuritis", "Anterior ischemic optic neuropathy", "Normal-tension glaucoma", "Ocular hypertension", "Primary open-angle glaucoma"]'::jsonb, 2, 'This patient has **Normal-Tension Glaucoma (NTG)**, a subtype of POAG. NTG is characterized by: (1) progressive optic nerve cupping and visual field defects, (2) open angles, and (3) **IOP consistently <= 21 mmHg**. Splinter-like **Drance hemorrhages** at the optic disc margin are highly classic for NTG, as is an association with vasospastic disorders like migraines and Raynaud''s phenomenon.'),
    (v_case_id, 'Which factor is thought to play a larger role in the pathogenesis of Normal-Tension Glaucoma compared to high-tension POAG?', '["Aqueous humor hypersecretion due to high sympathetic tone", "Primary autoimmune destruction of the scleral spur", "Trabecular meshwork cellular hypertrophy and sclerosis", "Vascular dysregulation, nocturnal hypotension, and poor optic nerve head perfusion", "Mechanical compression of the optic nerve by narrow angles"]'::jsonb, 3, 'While elevated IOP is the main driver in POAG, **vascular dysregulation, optic nerve head ischemia, and nocturnal systemic hypotension** are major pathophysiological contributors in NTG. Patients have a higher prevalence of vasospastic diseases (migraines, Raynaud''s) and often experience nighttime blood pressure drops that compromise optic nerve perfusion pressure.'),
    (v_case_id, 'What is the recommended target reduction in intraocular pressure for patients with confirmed progression of Normal-Tension Glaucoma?', '["At least a 30% reduction from baseline IOP", "No IOP lowering is required because IOP is already normal", "Immediate bilateral trabeculectomy to reach an IOP of 0 mmHg", "A 10% reduction using topical steroids to reduce inflammation", "Maintaining IOP below 10 mmHg with systemic medications only"]'::jsonb, 0, 'The Collaborative Normal Tension Glaucoma Study (CNTGS) demonstrated that lowering IOP by **at least 30%** from baseline significantly slows the rate of visual field progression in NTG, confirming that even though IOP is in the "normal" range, it is still too high for the compromised optic nerves of these patients.');

    ---------------------------------------------------------------------------
    -- CASE 14: The Complication of Retinal Ischemia - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Complication of Retinal Ischemia - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Complication of Retinal Ischemia - Clinical Presentation (V2)', 'A 62-year-old female with a 20-year history of poorly controlled type 2 diabetes presents with acute, severe pain, redness, and profound vision loss in the right eye for 3 days. She has a history of proliferative diabetic retinopathy but has missed recent appointments.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 80 bpm | BP: 125/79 mmHg
*   **Visual Acuity:** OD: 20/400; contralateral eye: 20/30
*   **Ocular Examination (OD):** Severe conjunctival injection. The cornea is hazy and edematous. Slit-lamp exam reveals multiple, tiny, abnormal looping vessels along the pupillary border (rubeosis iridis) and crossing the trabecular meshwork in the angle. IOP is 48 mmHg.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 62-year-old female with a 20-year history of poorly controlled type 2 diabetes presents with acute, severe pain, redness, and profound vision loss in the right eye for 3 days. She has a history of proliferative diabetic retinopathy but has missed recent appointments.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 80 bpm | BP: 125/79 mmHg
*   **Visual Acuity:** OD: 20/400; contralateral eye: 20/30
*   **Ocular Examination (OD):** Severe conjunctival injection. The cornea is hazy and edematous. Slit-lamp exam reveals multiple, tiny, abnormal looping vessels along the pupillary border (rubeosis iridis) and crossing the trabecular meshwork in the angle. IOP is 48 mmHg.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary underlying driver of abnormal blood vessel growth in this patient''s anterior segment?', '["A primary mutation in the fibrillin-1 gene", "Chronic bacterial infection of the vitreous cavity", "High systemic blood glucose directly stimulating iris endothelial cells", "Retinal ischemia leading to the release of Vascular Endothelial Growth Factor (VEGF)", "Mechanical friction of the posterior iris against the lens"]'::jsonb, 3, 'This is **Neovascular Glaucoma (NVG)**. The underlying cause is severe, widespread **retinal ischemia** (most commonly from proliferative diabetic retinopathy or central retinal vein occlusion). Ischemic retinal tissue releases **VEGF**, which diffuses forward into the anterior chamber, stimulating the growth of abnormal new vessels on the iris (rubeosis iridis) and in the anterior chamber angle.'),
    (v_case_id, 'What is the definitive therapy to address the underlying cause of this patient''s neovascularization?', '["Surgical iridectomy and vitrectomy", "Panretinal Photocoagulation (PRP) of the retina and intravitreal anti-VEGF injection", "Urgent laser peripheral iridotomy", "Intravenous administration of high-dose corticosteroids", "Topical hourly corticosteroids alone"]'::jsonb, 1, 'The definitive treatment to stop the drive for neovascularization is **Panretinal Photocoagulation (PRP)** of the ischemic retina. PRP destroys peripheral retina, reducing oxygen demand and subsequent VEGF release. In the acute phase, **intravitreal anti-VEGF injections** are highly effective in causing rapid regression of the iris and angle vessels, helping to stabilize IOP before PRP can be completed.'),
    (v_case_id, 'How does neovascularization in the angle eventually lead to irreversible, closed-angle glaucoma?', '["The vessels bleed, causing a massive hyphema that clots and blocks the trabecular meshwork", "The fibrovascular membrane contracts, pulling the peripheral iris over the trabecular meshwork (synechial angle closure)", "The vessels cause the lens to swell and push forward, occluding the pupil", "The abnormal vessels mechanically plug Schlemm''s canal from the inside", "Inflammatory macrophages engulfing the vessels clog the drainage system"]'::jsonb, 1, 'Initially, the neovascular membrane mechanically blocks the trabecular meshwork (open-angle stage). However, the **fibrovascular membrane eventually contracts**, pulling the peripheral iris forward over the trabecular meshwork. This leads to **synechial angle closure**, which is irreversible and requires surgical drainage procedures (like a glaucoma drainage device or trabeculectomy) if medical therapy fails.');

    ---------------------------------------------------------------------------
    -- CASE 15: The Dandruff-like Deposits - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dandruff-like Deposits - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dandruff-like Deposits - Clinical Presentation (V2)', 'A 65-year-old male presents with progressive, painless vision loss in his right eye. He has no history of eye trauma or surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 70 bpm | BP: 136/80 mmHg
*   **Visual Acuity:** OD: 20/60; contralateral eye: 20/25
*   **Ocular Examination (OD):** Slit-lamp exam reveals clear cornea. The anterior chamber is deep. On the anterior lens capsule, there is a classic three-zone pattern of white, flaky, amyloid-like material (a central disc, a clear zone, and a peripheral band). Similar dandruff-like material is visible at the pupillary margin. Gonioscopy shows a heavily pigmented trabecular meshwork with a dark line of pigment anterior to Schwalbe''s line (Sampaolesi line). IOP is 29 mmHg OD and 16 mmHg OS.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 65-year-old male presents with progressive, painless vision loss in his right eye. He has no history of eye trauma or surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 70 bpm | BP: 136/80 mmHg
*   **Visual Acuity:** OD: 20/60; contralateral eye: 20/25
*   **Ocular Examination (OD):** Slit-lamp exam reveals clear cornea. The anterior chamber is deep. On the anterior lens capsule, there is a classic three-zone pattern of white, flaky, amyloid-like material (a central disc, a clear zone, and a peripheral band). Similar dandruff-like material is visible at the pupillary margin. Gonioscopy shows a heavily pigmented trabecular meshwork with a dark line of pigment anterior to Schwalbe''s line (Sampaolesi line). IOP is 29 mmHg OD and 16 mmHg OS.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pseudoexfoliation glaucoma", "Uveitic glaucoma", "Phacolytic glaucoma", "Primary open-angle glaucoma", "Pigmentary glaucoma"]'::jsonb, 0, 'This is **Pseudoexfoliation Glaucoma (PXG)**. It is characterized by the deposition of white, flaky, fibrillar extracellular material on the anterior lens capsule, pupillary border, and trabecular meshwork. Classic findings include a **three-zone pattern on the lens capsule** and a **Sampaolesi line** (pigment band at Schwalbe''s line) on gonioscopy. It is typically unilateral or highly asymmetric and carries a higher risk of optic nerve damage due to large, volatile IOP spikes.'),
    (v_case_id, 'During future cataract extraction surgery, what specific anatomical risk must the surgeon be prepared for in this patient?', '["Failure of the pupil to constrict intraoperatively", "Zonular weakness and laxity, leading to lens subluxation or vitreous loss", "An increased risk of postoperative retinal detachment", "Severe, intraoperative retrobulbar hemorrhage", "Rapid corneal endothelial cell decompensation"]'::jsonb, 1, 'Pseudoexfoliation material deposits on and damages the **lens zonules**, leading to **zonular weakness, laxity, and dialysis**. During cataract surgery, this makes the lens unstable, significantly increasing the risk of lens subluxation, posterior capsular rupture, and vitreous loss.'),
    (v_case_id, 'What is the systemic nature of Pseudoexfoliation syndrome?', '["An autoimmune vasculitis associated with HLA-B27", "An localized ocular inflammatory reaction to lens proteins", "A generalized basement membrane disorder with abnormal elastic fiber production throughout the body", "A metastatic neuroendocrine tumor releasing serotonin", "An autosomal recessive lysosomal storage disease"]'::jsonb, 2, 'Pseudoexfoliation syndrome is a **systemic basement membrane disorder** characterized by the widespread production and progressive accumulation of abnormal microfibrillar, proteinaceous material. This material has been detected in the heart, lungs, liver, kidneys, and blood vessels, and is associated with an increased risk of cardiovascular and cerebrovascular disease.');

    ---------------------------------------------------------------------------
    -- CASE 16: The Exercise-Induced Blur - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Exercise-Induced Blur - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Exercise-Induced Blur - Clinical Presentation (V2)', 'A 39-year-old myopic male presents with a history of recurrent episodes of blurry vision and rainbow halos in the left eye, typically occurring after intensive exercise or running. IOP in the affected eye is 36 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 74 bpm | BP: 131/82 mmHg
*   **Visual Acuity:** OS: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OS):** Slit-lamp exam shows a clear cornea with a vertical band of brown pigment on the corneal endothelium (Krukenberg spindle). The anterior chamber is very deep. Transillumination of the iris reveals multiple mid-peripheral spoke-like defects. Gonioscopy shows a wide-open angle with a dense, homogeneous 360-degree dark brown band in the trabecular meshwork.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 39-year-old myopic male presents with a history of recurrent episodes of blurry vision and rainbow halos in the left eye, typically occurring after intensive exercise or running. IOP in the affected eye is 36 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 74 bpm | BP: 131/82 mmHg
*   **Visual Acuity:** OS: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OS):** Slit-lamp exam shows a clear cornea with a vertical band of brown pigment on the corneal endothelium (Krukenberg spindle). The anterior chamber is very deep. Transillumination of the iris reveals multiple mid-peripheral spoke-like defects. Gonioscopy shows a wide-open angle with a dense, homogeneous 360-degree dark brown band in the trabecular meshwork.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Primary open-angle glaucoma", "Phacolytic glaucoma", "Pigmentary glaucoma", "Anterior uveitis", "Pseudoexfoliation glaucoma"]'::jsonb, 2, 'This is **Pigmentary Glaucoma**, which typically affects young, myopic males. It is characterized by: (1) a deep anterior chamber, (2) pigment deposits on the corneal endothelium in a vertical line (**Krukenberg spindle**), (3) mid-peripheral spoke-like **iris transillumination defects**, and (4) heavy, dark brown pigment in the trabecular meshwork. IOP spikes can be triggered by exercise or pupillary movement, which rubs pigment off the iris.'),
    (v_case_id, 'What is the mechanical cause of pigment shedding in this condition?', '["A congenital failure of the iris stroma to fuse", "Friction between the posterior iris pigment epithelium and the anterior lens zonular fibers", "Primary degeneration of the corneal endothelial cells", "Mechanical trauma to the iris from a loose intraocular lens", "Autoimmune destruction of the iris melanocytes"]'::jsonb, 1, 'Pigment dispersion occurs due to a **mechanical friction** between the **posterior iris pigment epithelium** and the **anterior lens zonular fibers**. In myopic eyes with a backward-bowed iris (concave iris configuration), the movement of the iris against the zonules rubs off pigment granules, which are then swept by aqueous currents into the anterior chamber.'),
    (v_case_id, 'Why does exercise or pupillary dilation trigger an acute spike in intraocular pressure in these patients?', '["Exercise increases systemic blood pressure, which directly elevates aqueous humor production", "Physical movement or rapid pupillary changes cause a sudden shower of pigment to block the trabecular meshwork", "Mydriasis causes pupillary block and acute angle closure in these deep chambers", "Sympathetic stimulation causes swelling of the ciliary body", "Lactic acid accumulation in the cornea causes rapid stromal swelling"]'::jsonb, 1, 'Exercise or pupillary dilation (mydriasis) causes the iris to rub more vigorously against the zonules, releasing a **sudden shower of pigment granules**. These granules travel into the anterior chamber and physically clog the trabecular meshwork, leading to an acute, transient spike in IOP, presenting as blurry vision and halos from corneal edema.');

    ---------------------------------------------------------------------------
    -- CASE 17: The Hypermature Cataract - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hypermature Cataract - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hypermature Cataract - Clinical Presentation (V2)', 'A 85-year-old male from a rural area presents with acute onset of severe, aching pain, redness, and worsening vision in the left eye. He has had a dense cataract and very poor vision in that eye for over 3 years, but did not seek surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 68 bpm | BP: 118/87 mmHg
*   **Visual Acuity:** OS: Hand Motion; contralateral eye: 20/40
*   **Ocular Examination (OS):** Marked conjunctival injection. Cornea is edematous with microcystic changes. Slit-lamp exam shows a completely white, opaque lens with a wrinkled anterior capsule. The anterior chamber is deep but shows 3+ inflammatory cell and flare, and floating white clumps. No keratic precipitates (KPs) are visible on the endothelium. IOP is 46 mmHg.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 85-year-old male from a rural area presents with acute onset of severe, aching pain, redness, and worsening vision in the left eye. He has had a dense cataract and very poor vision in that eye for over 3 years, but did not seek surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 68 bpm | BP: 118/87 mmHg
*   **Visual Acuity:** OS: Hand Motion; contralateral eye: 20/40
*   **Ocular Examination (OS):** Marked conjunctival injection. Cornea is edematous with microcystic changes. Slit-lamp exam shows a completely white, opaque lens with a wrinkled anterior capsule. The anterior chamber is deep but shows 3+ inflammatory cell and flare, and floating white clumps. No keratic precipitates (KPs) are visible on the endothelium. IOP is 46 mmHg.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Phacolytic glaucoma", "Neovascular glaucoma", "Acute angle-closure glaucoma", "Phacoanaphylactic endophthalmitis", "HLA-B27 associated anterior uveitis"]'::jsonb, 0, 'This is **Phacolytic Glaucoma**, a form of lens-induced open-angle glaucoma. It occurs in eyes with a **hypermature or mature cataract**. The lens cortex liquefies and high-molecular-weight lens proteins leak through microscopic pores in the degenerated, **wrinkled anterior lens capsule**. These proteins, along with protein-engulfed macrophages, physically obstruct the trabecular meshwork, causing a rapid, severe rise in IOP.'),
    (v_case_id, 'What is the definitive management of this patient''s condition?', '["Intravitreal injection of broad-spectrum antibiotics and urgent vitrectomy", "Immediate laser peripheral iridotomy", "Lower IOP medically using topical drops and systemic acetazolamide, followed by urgent cataract extraction", "Chronic topical corticosteroid therapy and lifetime Timolol drops", "Surgical trabeculectomy with the cataract left in place"]'::jsonb, 2, 'The definitive treatment is **cataract extraction** (removal of the leaking lens). Before surgery, IOP must be aggressively lowered medically (using topical beta-blockers, alpha-agonists, and systemic acetazolamide/mannitol) and corneal edema reduced. Once the IOP is controlled and the eye is stabilized, urgent cataract surgery is performed to remove the source of the protein.'),
    (v_case_id, 'Which slit-lamp finding helps differentiate Phacolytic Glaucoma from infectious or autoimmune anterior uveitis?', '["An elevated, wrinkled grey retina with a horseshoe-shaped tear", "The presence of a shallow anterior chamber and pupillary block", "The absence of keratic precipitates (KPs) on the corneal endothelium despite heavy anterior chamber cell/flare", "The presence of iris transillumination defects in the mid-periphery", "A Sampaolesi line in the anterior chamber angle on gonioscopy"]'::jsonb, 2, 'Phacolytic glaucoma is an open-angle glaucoma presenting with high IOP and cell/flare. A key clinical differentiator is the **absence of keratic precipitates (KPs)** on the corneal endothelium, despite what appears to be severe "inflammatory" cells in the anterior chamber. The "cells" are actually protein aggregates and macrophages, rather than primary inflammatory cells adhering to the endothelium.');

    ---------------------------------------------------------------------------
    -- CASE 18: The Clouded Large Eyes - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Clouded Large Eyes - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Clouded Large Eyes - Clinical Presentation (V2)', 'A 0-month-old infant is brought to the ophthalmology clinic by his mother due to constant tearing (epiphora), extreme sensitivity to light (photophobia), and frequent squeezing of the eyelids (blepharospasm) in both eyes. The mother notes the baby''s eyes look unusually large.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Poor fixation and following targets in both eyes.
*   **Ocular Examination (OU):** Severe corneal clouding and edema. The corneal diameters are enlarged, measuring 11.6 mm (normal infant diameter is <10.5 mm). Handheld slit-lamp exam under anesthesia reveals horizontal, linear breaks in Descemet''s membrane (Haab''s striae). IOP is 29 mmHg bilaterally.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 0-month-old infant is brought to the ophthalmology clinic by his mother due to constant tearing (epiphora), extreme sensitivity to light (photophobia), and frequent squeezing of the eyelids (blepharospasm) in both eyes. The mother notes the baby''s eyes look unusually large.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Poor fixation and following targets in both eyes.
*   **Ocular Examination (OU):** Severe corneal clouding and edema. The corneal diameters are enlarged, measuring 11.6 mm (normal infant diameter is <10.5 mm). Handheld slit-lamp exam under anesthesia reveals horizontal, linear breaks in Descemet''s membrane (Haab''s striae). IOP is 29 mmHg bilaterally.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary treatment?', '["Primary congenital glaucoma; surgical intervention (e.g., goniotomy or trabeculotomy)", "Congenital dacryostenosis; nasolacrimal duct probing and topical antibiotics", "Retinoblastoma; immediate systemic chemotherapy or enucleation", "Herpes simplex ophthalmia neonatorum; topical acyclovir gel and systemic acyclovir", "Congenital cataract; urgent lens aspiration and intraocular lens implantation"]'::jsonb, 0, 'This infant has **Primary Congenital Glaucoma**, characterized by the triad of **epiphora, photophobia, and blepharospasm**, along with corneal clouding, **buphthalmos** (enlarged eyes), and **Haab''s striae** (breaks in Descemet''s membrane). Treatment is **primarily surgical** (goniotomy or trabeculotomy) to physically open the malformed angle, as medical therapy is only an adjunct to clear the cornea before surgery.'),
    (v_case_id, 'What is the primary developmental defect responsible for Primary Congenital Glaucoma?', '["In utero infection with Cytomegalovirus leading to uveal inflammation", "Failure of the nasolacrimal duct to canalize prior to birth", "Autoimmune destruction of the scleral canal of Schlemm", "Dysgenesis of the trabecular meshwork and anterior chamber angle (Barkan''s membrane)", "Deposition of abnormal copper in Descemet''s membrane"]'::jsonb, 3, 'Primary congenital glaucoma is caused by **trabecular meshwork dysgenesis** (incomplete development of the trabecular meshwork and anterior chamber angle). A membrane-like tissue sheet (classically called Barkan''s membrane, though histologically representing compact trabecular tissue) blocks the outflow of aqueous humor, leading to high IOP in utero or shortly after birth.'),
    (v_case_id, 'Why do infants with congenital glaucoma develop abnormally large eyes (buphthalmos), whereas adults with high IOP do not?', '["High IOP causes chronic hyperopia and axial length shortening", "Infants produce twice the volume of aqueous humor as adults, inflating the globe", "The high pressure stimulates rapid bone growth of the surrounding orbit", "The infant sclera and cornea are highly elastic and stretch under high intraocular pressure", "The infant lens swells and expands the entire anterior segment"]'::jsonb, 3, 'In infants (under the age of 3), the collagen fibers of the **sclera and cornea are highly elastic and stretchable**. When exposed to high intraocular pressure, the entire globe stretches and enlarges, a condition known as **buphthalmos** ("ox eye"). In adults, the sclera is rigid and calcified, so high IOP does not cause enlargement of the globe.');

    ---------------------------------------------------------------------------
    -- CASE 19: The Cost of Suppressed Inflammation - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cost of Suppressed Inflammation - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cost of Suppressed Inflammation - Clinical Presentation (V2)', 'A 30-year-old male with a history of chronic anterior uveitis presents with a 2-week history of mild, painless blurry vision in his left eye. He has been using topical prednisolone acetate 1% drops 4 times daily in that eye for the past 3 months to prevent uveitis flare-ups.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 80 bpm | BP: 128/83 mmHg
*   **Visual Acuity:** OS: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OS):** Cornea is clear. Anterior chamber is completely quiet (0 cells, 0 flare). Gonioscopy shows an open angle. Slit-lamp exam of the optic nerve reveals a cup-to-disc ratio of 0.90, with thinning of the superior and inferior neuroretinal rim. IOP is 30 mmHg. OS exam is completely normal with an IOP of 14 mmHg.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old male with a history of chronic anterior uveitis presents with a 2-week history of mild, painless blurry vision in his left eye. He has been using topical prednisolone acetate 1% drops 4 times daily in that eye for the past 3 months to prevent uveitis flare-ups.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 80 bpm | BP: 128/83 mmHg
*   **Visual Acuity:** OS: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OS):** Cornea is clear. Anterior chamber is completely quiet (0 cells, 0 flare). Gonioscopy shows an open angle. Slit-lamp exam of the optic nerve reveals a cup-to-disc ratio of 0.90, with thinning of the superior and inferior neuroretinal rim. IOP is 30 mmHg. OS exam is completely normal with an IOP of 14 mmHg.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate initial management for this patient''s elevated intraocular pressure?', '["Perform immediate surgical trabeculectomy with mitomycin C", "Prescribe oral prednisone 60 mg daily to systemically control the disease", "Perform a laser peripheral iridotomy", "Taper and discontinue the topical prednisolone, switch to a ''soft'' steroid if needed, and initiate IOP-lowering drops", "Increase the frequency of prednisolone drops to every hour to reduce trabecular inflammation"]'::jsonb, 3, 'This patient has **Steroid-Induced Glaucoma**. The first step is to **taper and discontinue the offending corticosteroid** if the underlying uveitis is quiet. If corticosteroid therapy is still required, the patient should be switched to a "soft" steroid with less propensity to raise IOP (e.g., loteprednol, fluorometholone). Topical IOP-lowering agents (like latanoprost or timolol) should be initiated to protect the optic nerve while the steroid effect washes out.'),
    (v_case_id, 'What is the molecular mechanism by which corticosteroids increase intraocular pressure?', '["Causing swelling of the crystalline lens, leading to pupillary block", "Stimulating ciliary body beta-2 receptors, increasing aqueous secretion", "Directly blocking the lumen of Schlemm''s canal via microthrombi", "Promoting neovascularization of the anterior chamber angle", "Decreasing trabecular meshwork extracellular matrix clearance, increasing outflow resistance"]'::jsonb, 4, 'Corticosteroids increase IOP by **increasing resistance to aqueous outflow at the trabecular meshwork**. They do this by: (1) inhibiting the degradation of extracellular matrix (ECM) proteins, leading to glycosaminoglycan accumulation, (2) increasing expression of myocilin protein, and (3) causing morphologic changes in trabecular meshwork cells (e.g., forming cross-linked actin networks) that decrease their filtering capacity.'),
    (v_case_id, 'Which patient population is at the HIGHEST risk of being a high ''steroid responder'' (developing high IOP after steroid use)?', '["Infants with congenital nasolacrimal duct obstruction", "Young males with pigment dispersion syndrome", "Patients with a history of HLA-B27 positive ankylosing spondylitis", "Patients with a personal or first-degree family history of primary open-angle glaucoma, and high myopes", "Patients with hyperopia and shallow anterior chambers"]'::jsonb, 3, 'The risk of developing a steroid-induced IOP spike is significantly higher in **patients with POAG (over 90% are responders)**, first-degree relatives of POAG patients, high myopes, patients with connective tissue diseases (like rheumatoid arthritis), and very young or very old patients. These populations must be monitored closely whenever started on steroid drops.');

    ---------------------------------------------------------------------------
    -- CASE 20: The Side Effects of Therapy - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Side Effects of Therapy - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Side Effects of Therapy - Clinical Presentation (V2)', 'A 66-year-old male with bilateral primary open-angle glaucoma presents to his primary care physician complaining of worsening shortness of breath, wheezing, and fatigue. He was started on a new eye drop by his ophthalmologist 2 weeks ago. He has a history of moderate asthma.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 80 bpm (bradycardia) | BP: 110/70 mmHg | RR: 17/min
*   **Pulmonary:** Bilateral expiratory wheezing and prolonged expiratory phase on auscultation.
*   **Ocular Examination:** Bilateral quiet eyes, IOPs are well-controlled at 14 mmHg OU.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 66-year-old male with bilateral primary open-angle glaucoma presents to his primary care physician complaining of worsening shortness of breath, wheezing, and fatigue. He was started on a new eye drop by his ophthalmologist 2 weeks ago. He has a history of moderate asthma.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 80 bpm (bradycardia) | BP: 110/70 mmHg | RR: 17/min
*   **Pulmonary:** Bilateral expiratory wheezing and prolonged expiratory phase on auscultation.
*   **Ocular Examination:** Bilateral quiet eyes, IOPs are well-controlled at 14 mmHg OU.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following glaucoma medications is most likely responsible for this patient''s systemic symptoms?', '["Dorzolamide (carbonic anhydrase inhibitor)", "Brimonidine (alpha-2 agonist)", "Pilocarpine (parasympathomimetic)", "Latanoprost (prostaglandin analog)", "Timolol (non-selective beta-blocker)"]'::jsonb, 4, 'The patient''s presentation of asthma exacerbation (wheezing, dyspnea) and bradycardia (HR <60) after starting a new eye drop is classic for **Timolol**, a non-selective beta-adrenergic antagonist. Topical eye drops undergo mucosal absorption through the nasolacrimal duct, bypassing first-pass hepatic metabolism and achieving significant systemic levels. Timolol blocks beta-2 receptors in the bronchioles, causing life-threatening bronchospasm in asthmatics, and beta-1 receptors in the heart, causing bradycardia and heart block.'),
    (v_case_id, 'The patient''s timolol is discontinued. The ophthalmologist decides to switch to a prostaglandin analog (e.g., latanoprost). Which local side effect should the patient be educated about?', '["Bitter taste and corneal endothelial deposits", "Dry mouth, drowsiness, and headache", "Increased brown pigmentation of the iris, lengthening and darkening of eyelashes, and orbital fat atrophy", "Severe allergic follicular conjunctivitis and contact dermatitis", "Pupillary constriction (miosis), brow ache, and transient myopia"]'::jsonb, 2, 'Topical **prostaglandin analogs** (latanoprost, bimatoprost) have well-known cosmetic and local side effects: (1) **increased iris pigmentation** (turning blue/green eyes brown due to increased melanin production), (2) **hypertrichosis** (eyelash lengthening, thickening, and darkening), and (3) **prostaglandin-associated periorbitopathy** (orbital fat atrophy, causing a sunken eye appearance/deepening of the lid sulcus).'),
    (v_case_id, 'Another patient is started on Brimonidine (an alpha-2 agonist) and develops severe red eyes. What is the classic local side effect of Brimonidine that necessitates drug discontinuation?', '["Corneal stromal melting", "Intraoperative floppy iris syndrome", "Posterior synechiae formation", "Allergic follicular conjunctivitis", "Macular edema in aphakic patients"]'::jsonb, 3, 'Topical **Brimonidine** (an alpha-2 adrenergic agonist) is notorious for causing **allergic follicular conjunctivitis** or contact blepharoconjunctivitis in up to 15-20% of patients. It typically presents as delayed redness, severe itching, and follicles in the inferior palpebral conjunctiva, requiring discontinuation of the drug. Brimonidine also crosses the blood-brain barrier and can cause systemic somnolence/fatigue and is contraindicated in infants due to risk of central apnea and coma.');

    ---------------------------------------------------------------------------
    -- CASE 21: Case Study: The Halos at Night (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Halos at Night (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Halos at Night (V3)', 'A 72-year-old male presents to the emergency department with sudden, severe pain in his left eye, accompanied by a severe headache, nausea, and blurry vision with rainbow-colored halos around lights. He reports the symptoms began after sitting in a dark movie theater.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 73 bpm | BP: 134/84 mmHg
*   **Visual Acuity:** OS: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Marked conjunctival injection with ciliary flush. The cornea appears steamy and cloudy. The pupil is fixed, mid-dilated measuring 6.4 mm, and non-reactive to light. The globe is rock-hard to palpation. Intraocular pressure (IOP) is 47 mmHg. OS gonioscopy shows a completely closed angle.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 72-year-old male presents to the emergency department with sudden, severe pain in his left eye, accompanied by a severe headache, nausea, and blurry vision with rainbow-colored halos around lights. He reports the symptoms began after sitting in a dark movie theater.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 73 bpm | BP: 134/84 mmHg
*   **Visual Acuity:** OS: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Marked conjunctival injection with ciliary flush. The cornea appears steamy and cloudy. The pupil is fixed, mid-dilated measuring 6.4 mm, and non-reactive to light. The globe is rock-hard to palpation. Intraocular pressure (IOP) is 47 mmHg. OS gonioscopy shows a completely closed angle.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate next step in the immediate management of this patient?', '["Perform immediate surgical trabeculectomy in the emergency department", "Initiate topical prednisolone acetate 1% drops every 15 minutes as monotherapy", "Administer topical timolol, pilocarpine, and apraclonidine, combined with systemic intravenous acetazolamide", "Apply a tight pressure patch and schedule outpatient ophthalmology follow-up in 48 hours", "Prescribe oral ciprofloxacin 750 mg and apply topical tobramycin drops"]'::jsonb, 2, 'This patient presents with Acute Angle-Closure Glaucoma (AACG), an ocular emergency. Immediate medical management is directed at reducing intraocular pressure (IOP) and opening the angle. This is achieved by combining topical drops that decrease aqueous humor production (beta-blocker: timolol; alpha-2 agonist: apraclonidine) or increase outflow (miotic: pilocarpine, once IOP decreases below 40 mmHg and sphincter ischemia resolves) with systemic carbonic anhydrase inhibitors (IV acetazolamide). Pressure patching is contraindicated, steroids alone are insufficient, and laser peripheral iridotomy (LPI) is the definitive, rather than immediate bedside, treatment once the cornea clears.'),
    (v_case_id, 'What is the primary anatomical mechanism driving this condition in hyperopic patients?', '["Hypersecretion of aqueous humor by the ciliary body processes due to autonomic dysfunction", "Contraction of a fibrovascular membrane over the anterior chamber angle stimulated by retinal ischemia", "Deposition of abnormal fibrillar basement membrane material in the trabecular meshwork", "Pupillary block, where contact between the iris and lens prevents aqueous flow, forcing the peripheral iris forward to occlude the trabecular meshwork", "Congenital dysgenesis of the trabecular meshwork and iris insertion"]'::jsonb, 3, 'The primary mechanism of AACG is **pupillary block**. In anatomically predisposed eyes (typically hyperopes with short axial lengths and shallow anterior chambers), the iris comes into contact with the lens, blocking the normal flow of aqueous from the posterior chamber to the anterior chamber. This causes a pressure build-up in the posterior chamber, which pushes the peripheral iris forward (iris bombé) into contact with the trabecular meshwork, completely blocking aqueous drainage.'),
    (v_case_id, 'Which of the following classes of systemic or topical medications is strictly CONTRAINDICATED in patients with narrow or closed anterior chamber angles?', '["Sympathomimetics and anticholinergics (mydriatics)", "Beta-adrenergic antagonists (beta-blockers)", "Osmotic diuretics", "Prostaglandin analogs", "Carbonic anhydrase inhibitors"]'::jsonb, 0, 'Mydriatics (both anticholinergics like atropine/tropicamide and sympathomimetics like epinephrine/phenylephrine) cause pupillary dilation. In patients with narrow angles, pupillary dilation causes the iris to bunch up in the angle, which can trigger acute angle closure. Therefore, these drugs are strictly contraindicated in patients with untreated narrow angles.');

    ---------------------------------------------------------------------------
    -- CASE 22: Case Study: The Slow Loss of Peripheral Vision (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Slow Loss of Peripheral Vision (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Slow Loss of Peripheral Vision (V3)', 'A 76-year-old female presents for a routine eye exam. She denies any eye pain, redness, or sudden vision changes, but admits that she feels she has been bumping into objects more frequently and has difficulty driving at night.

**Physical Examination:**
*   **Vitals:** Temp: 98.1°F | HR: 81 bpm | BP: 130/76 mmHg
*   **Visual Acuity:** OD: 20/30; OS: 20/25
*   **Ocular Examination:** Bilateral clear corneas. Anterior chambers are deep and quiet. Gonioscopy shows open angles bilaterally. Slit-lamp fundus exam reveals significant optic nerve cupping, with a cup-to-disc ratio (CDR) of 0.90 in the right eye and 0.35 in the left eye, along with neuroretinal rim thinning and nasalization of the disc vessels. Intraocular pressure (IOP) is 30 mmHg bilaterally.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 76-year-old female presents for a routine eye exam. She denies any eye pain, redness, or sudden vision changes, but admits that she feels she has been bumping into objects more frequently and has difficulty driving at night.

**Physical Examination:**
*   **Vitals:** Temp: 98.1°F | HR: 81 bpm | BP: 130/76 mmHg
*   **Visual Acuity:** OD: 20/30; OS: 20/25
*   **Ocular Examination:** Bilateral clear corneas. Anterior chambers are deep and quiet. Gonioscopy shows open angles bilaterally. Slit-lamp fundus exam reveals significant optic nerve cupping, with a cup-to-disc ratio (CDR) of 0.90 in the right eye and 0.35 in the left eye, along with neuroretinal rim thinning and nasalization of the disc vessels. Intraocular pressure (IOP) is 30 mmHg bilaterally.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate first-line pharmacotherapy for this patient''s condition?', '["Topical prostaglandin analogs (e.g., latanoprost)", "Oral carbonic anhydrase inhibitors (e.g., acetazolamide)", "Topical parasympathomimetics (e.g., pilocarpine)", "Topical non-selective beta-blockers (e.g., timolol) in a patient with severe asthma", "Systemic hyperosmotic agents (e.g., mannitol)"]'::jsonb, 0, 'This patient has Primary Open-Angle Glaucoma (POAG). First-line medical therapy typically consists of **topical prostaglandin analogs** (e.g., latanoprost, bimatoprost) because they are highly effective, have a once-daily dosing regimen, and have a favorable systemic safety profile compared to beta-blockers (which are contraindicated in asthma/COPD).'),
    (v_case_id, 'What is the primary site of increased resistance to aqueous humor outflow in Primary Open-Angle Glaucoma?', '["The endothelial cell junctions of the episcleral veins", "Trabecular meshwork (specifically the juxtacanalicular tissue) and Schlemm''s canal", "The pupillary aperture between the iris and lens", "The uveoscleral pathway through the ciliary muscle", "The posterior chamber ciliary body epithelial cells"]'::jsonb, 1, 'In POAG, the primary site of increased resistance to aqueous humor drainage is the **trabecular meshwork**, particularly the **juxtacanalicular tissue** and the inner wall of Schlemm''s canal. This leads to a gradual elevation of IOP, which causes mechanical and ischemic damage to the retinal ganglion cell axons at the optic nerve head.'),
    (v_case_id, 'What is the classic visual field defect pattern initially seen in patients with progressive open-angle glaucoma?', '["Central scotoma with normal peripheral visual fields", "Binasal hemianopsia sparing the temporal fields", "Bitemporal hemianopsia, starting superiorly", "Homonymous hemianopsia involving the macula", "Arcuate (Bjerrum) scotoma and nasal steps, sparing central vision until late stages"]'::jsonb, 4, 'Glaucoma characteristically spares the central macula fibers until the very late stages of the disease. The earliest visual field defects are typically located in the mid-periphery and follow the pattern of the retinal nerve fiber layer arching around the macula. This manifests as **arcuate scotomas** (Bjerrum scotomas) and **nasal steps**.');

    ---------------------------------------------------------------------------
    -- CASE 23: Case Study: The Cupped Disc with Normal Pressures (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Cupped Disc with Normal Pressures (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Cupped Disc with Normal Pressures (V3)', 'A 73-year-old male with a history of severe migraines and Raynaud''s phenomenon presents for a comprehensive eye evaluation. His intraocular pressures (IOP) have historically been normal, measuring 16 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 83 bpm | BP: 125/77 mmHg
*   **Visual Acuity:** Bilateral 20/20
*   **Ocular Examination:** Anterior chamber angles are open (Grade 4 bilaterally). Optic nerve head examination shows a cup-to-disc ratio of 0.85 OD and 0.40 OS, with significant thinning of the inferior neuroretinal rim. A small, linear splinter-like hemorrhage (Drance hemorrhage) is visible at the inferior border of the right optic disc. Automated visual field testing shows a superior arcuate defect in the right eye.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 73-year-old male with a history of severe migraines and Raynaud''s phenomenon presents for a comprehensive eye evaluation. His intraocular pressures (IOP) have historically been normal, measuring 16 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 83 bpm | BP: 125/77 mmHg
*   **Visual Acuity:** Bilateral 20/20
*   **Ocular Examination:** Anterior chamber angles are open (Grade 4 bilaterally). Optic nerve head examination shows a cup-to-disc ratio of 0.85 OD and 0.40 OS, with significant thinning of the inferior neuroretinal rim. A small, linear splinter-like hemorrhage (Drance hemorrhage) is visible at the inferior border of the right optic disc. Automated visual field testing shows a superior arcuate defect in the right eye.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Ocular hypertension", "Optic neuritis", "Anterior ischemic optic neuropathy", "Normal-tension glaucoma", "Primary open-angle glaucoma"]'::jsonb, 3, 'This patient has **Normal-Tension Glaucoma (NTG)**, a subtype of POAG. NTG is characterized by: (1) progressive optic nerve cupping and visual field defects, (2) open angles, and (3) **IOP consistently <= 21 mmHg**. Splinter-like **Drance hemorrhages** at the optic disc margin are highly classic for NTG, as is an association with vasospastic disorders like migraines and Raynaud''s phenomenon.'),
    (v_case_id, 'Which factor is thought to play a larger role in the pathogenesis of Normal-Tension Glaucoma compared to high-tension POAG?', '["Vascular dysregulation, nocturnal hypotension, and poor optic nerve head perfusion", "Primary autoimmune destruction of the scleral spur", "Aqueous humor hypersecretion due to high sympathetic tone", "Trabecular meshwork cellular hypertrophy and sclerosis", "Mechanical compression of the optic nerve by narrow angles"]'::jsonb, 0, 'While elevated IOP is the main driver in POAG, **vascular dysregulation, optic nerve head ischemia, and nocturnal systemic hypotension** are major pathophysiological contributors in NTG. Patients have a higher prevalence of vasospastic diseases (migraines, Raynaud''s) and often experience nighttime blood pressure drops that compromise optic nerve perfusion pressure.'),
    (v_case_id, 'What is the recommended target reduction in intraocular pressure for patients with confirmed progression of Normal-Tension Glaucoma?', '["Maintaining IOP below 10 mmHg with systemic medications only", "No IOP lowering is required because IOP is already normal", "At least a 30% reduction from baseline IOP", "Immediate bilateral trabeculectomy to reach an IOP of 0 mmHg", "A 10% reduction using topical steroids to reduce inflammation"]'::jsonb, 2, 'The Collaborative Normal Tension Glaucoma Study (CNTGS) demonstrated that lowering IOP by **at least 30%** from baseline significantly slows the rate of visual field progression in NTG, confirming that even though IOP is in the "normal" range, it is still too high for the compromised optic nerves of these patients.');

    ---------------------------------------------------------------------------
    -- CASE 24: Case Study: The Complication of Retinal Ischemia (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Complication of Retinal Ischemia (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Complication of Retinal Ischemia (V3)', 'A 62-year-old male with a 20-year history of poorly controlled type 2 diabetes presents with acute, severe pain, redness, and profound vision loss in the left eye for 3 days. He has a history of proliferative diabetic retinopathy but has missed recent appointments.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 77 bpm | BP: 136/84 mmHg
*   **Visual Acuity:** OS: 20/400; contralateral eye: 20/30
*   **Ocular Examination (OS):** Severe conjunctival injection. The cornea is hazy and edematous. Slit-lamp exam reveals multiple, tiny, abnormal looping vessels along the pupillary border (rubeosis iridis) and crossing the trabecular meshwork in the angle. IOP is 45 mmHg.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 62-year-old male with a 20-year history of poorly controlled type 2 diabetes presents with acute, severe pain, redness, and profound vision loss in the left eye for 3 days. He has a history of proliferative diabetic retinopathy but has missed recent appointments.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 77 bpm | BP: 136/84 mmHg
*   **Visual Acuity:** OS: 20/400; contralateral eye: 20/30
*   **Ocular Examination (OS):** Severe conjunctival injection. The cornea is hazy and edematous. Slit-lamp exam reveals multiple, tiny, abnormal looping vessels along the pupillary border (rubeosis iridis) and crossing the trabecular meshwork in the angle. IOP is 45 mmHg.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary underlying driver of abnormal blood vessel growth in this patient''s anterior segment?', '["A primary mutation in the fibrillin-1 gene", "High systemic blood glucose directly stimulating iris endothelial cells", "Retinal ischemia leading to the release of Vascular Endothelial Growth Factor (VEGF)", "Mechanical friction of the posterior iris against the lens", "Chronic bacterial infection of the vitreous cavity"]'::jsonb, 2, 'This is **Neovascular Glaucoma (NVG)**. The underlying cause is severe, widespread **retinal ischemia** (most commonly from proliferative diabetic retinopathy or central retinal vein occlusion). Ischemic retinal tissue releases **VEGF**, which diffuses forward into the anterior chamber, stimulating the growth of abnormal new vessels on the iris (rubeosis iridis) and in the anterior chamber angle.'),
    (v_case_id, 'What is the definitive therapy to address the underlying cause of this patient''s neovascularization?', '["Panretinal Photocoagulation (PRP) of the retina and intravitreal anti-VEGF injection", "Surgical iridectomy and vitrectomy", "Topical hourly corticosteroids alone", "Intravenous administration of high-dose corticosteroids", "Urgent laser peripheral iridotomy"]'::jsonb, 0, 'The definitive treatment to stop the drive for neovascularization is **Panretinal Photocoagulation (PRP)** of the ischemic retina. PRP destroys peripheral retina, reducing oxygen demand and subsequent VEGF release. In the acute phase, **intravitreal anti-VEGF injections** are highly effective in causing rapid regression of the iris and angle vessels, helping to stabilize IOP before PRP can be completed.'),
    (v_case_id, 'How does neovascularization in the angle eventually lead to irreversible, closed-angle glaucoma?', '["The abnormal vessels mechanically plug Schlemm''s canal from the inside", "Inflammatory macrophages engulfing the vessels clog the drainage system", "The fibrovascular membrane contracts, pulling the peripheral iris over the trabecular meshwork (synechial angle closure)", "The vessels cause the lens to swell and push forward, occluding the pupil", "The vessels bleed, causing a massive hyphema that clots and blocks the trabecular meshwork"]'::jsonb, 2, 'Initially, the neovascular membrane mechanically blocks the trabecular meshwork (open-angle stage). However, the **fibrovascular membrane eventually contracts**, pulling the peripheral iris forward over the trabecular meshwork. This leads to **synechial angle closure**, which is irreversible and requires surgical drainage procedures (like a glaucoma drainage device or trabeculectomy) if medical therapy fails.');

    ---------------------------------------------------------------------------
    -- CASE 25: Case Study: The Dandruff-like Deposits (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Dandruff-like Deposits (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Dandruff-like Deposits (V3)', 'A 72-year-old male presents with progressive, painless vision loss in his left eye. He has no history of eye trauma or surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 68 bpm | BP: 137/83 mmHg
*   **Visual Acuity:** OS: 20/60; contralateral eye: 20/25
*   **Ocular Examination (OS):** Slit-lamp exam reveals clear cornea. The anterior chamber is deep. On the anterior lens capsule, there is a classic three-zone pattern of white, flaky, amyloid-like material (a central disc, a clear zone, and a peripheral band). Similar dandruff-like material is visible at the pupillary margin. Gonioscopy shows a heavily pigmented trabecular meshwork with a dark line of pigment anterior to Schwalbe''s line (Sampaolesi line). IOP is 28 mmHg OD and 16 mmHg OS.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 72-year-old male presents with progressive, painless vision loss in his left eye. He has no history of eye trauma or surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 68 bpm | BP: 137/83 mmHg
*   **Visual Acuity:** OS: 20/60; contralateral eye: 20/25
*   **Ocular Examination (OS):** Slit-lamp exam reveals clear cornea. The anterior chamber is deep. On the anterior lens capsule, there is a classic three-zone pattern of white, flaky, amyloid-like material (a central disc, a clear zone, and a peripheral band). Similar dandruff-like material is visible at the pupillary margin. Gonioscopy shows a heavily pigmented trabecular meshwork with a dark line of pigment anterior to Schwalbe''s line (Sampaolesi line). IOP is 28 mmHg OD and 16 mmHg OS.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pseudoexfoliation glaucoma", "Phacolytic glaucoma", "Pigmentary glaucoma", "Uveitic glaucoma", "Primary open-angle glaucoma"]'::jsonb, 0, 'This is **Pseudoexfoliation Glaucoma (PXG)**. It is characterized by the deposition of white, flaky, fibrillar extracellular material on the anterior lens capsule, pupillary border, and trabecular meshwork. Classic findings include a **three-zone pattern on the lens capsule** and a **Sampaolesi line** (pigment band at Schwalbe''s line) on gonioscopy. It is typically unilateral or highly asymmetric and carries a higher risk of optic nerve damage due to large, volatile IOP spikes.'),
    (v_case_id, 'During future cataract extraction surgery, what specific anatomical risk must the surgeon be prepared for in this patient?', '["Failure of the pupil to constrict intraoperatively", "Severe, intraoperative retrobulbar hemorrhage", "An increased risk of postoperative retinal detachment", "Zonular weakness and laxity, leading to lens subluxation or vitreous loss", "Rapid corneal endothelial cell decompensation"]'::jsonb, 3, 'Pseudoexfoliation material deposits on and damages the **lens zonules**, leading to **zonular weakness, laxity, and dialysis**. During cataract surgery, this makes the lens unstable, significantly increasing the risk of lens subluxation, posterior capsular rupture, and vitreous loss.'),
    (v_case_id, 'What is the systemic nature of Pseudoexfoliation syndrome?', '["An autoimmune vasculitis associated with HLA-B27", "An autosomal recessive lysosomal storage disease", "An localized ocular inflammatory reaction to lens proteins", "A metastatic neuroendocrine tumor releasing serotonin", "A generalized basement membrane disorder with abnormal elastic fiber production throughout the body"]'::jsonb, 4, 'Pseudoexfoliation syndrome is a **systemic basement membrane disorder** characterized by the widespread production and progressive accumulation of abnormal microfibrillar, proteinaceous material. This material has been detected in the heart, lungs, liver, kidneys, and blood vessels, and is associated with an increased risk of cardiovascular and cerebrovascular disease.');

    ---------------------------------------------------------------------------
    -- CASE 26: Case Study: The Exercise-Induced Blur (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Exercise-Induced Blur (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Exercise-Induced Blur (V3)', 'A 43-year-old myopic female presents with a history of recurrent episodes of blurry vision and rainbow halos in the right eye, typically occurring after intensive exercise or running. IOP in the affected eye is 35 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 77 bpm | BP: 117/78 mmHg
*   **Visual Acuity:** OD: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OD):** Slit-lamp exam shows a clear cornea with a vertical band of brown pigment on the corneal endothelium (Krukenberg spindle). The anterior chamber is very deep. Transillumination of the iris reveals multiple mid-peripheral spoke-like defects. Gonioscopy shows a wide-open angle with a dense, homogeneous 360-degree dark brown band in the trabecular meshwork.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 43-year-old myopic female presents with a history of recurrent episodes of blurry vision and rainbow halos in the right eye, typically occurring after intensive exercise or running. IOP in the affected eye is 35 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 77 bpm | BP: 117/78 mmHg
*   **Visual Acuity:** OD: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OD):** Slit-lamp exam shows a clear cornea with a vertical band of brown pigment on the corneal endothelium (Krukenberg spindle). The anterior chamber is very deep. Transillumination of the iris reveals multiple mid-peripheral spoke-like defects. Gonioscopy shows a wide-open angle with a dense, homogeneous 360-degree dark brown band in the trabecular meshwork.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pseudoexfoliation glaucoma", "Primary open-angle glaucoma", "Phacolytic glaucoma", "Pigmentary glaucoma", "Anterior uveitis"]'::jsonb, 3, 'This is **Pigmentary Glaucoma**, which typically affects young, myopic males. It is characterized by: (1) a deep anterior chamber, (2) pigment deposits on the corneal endothelium in a vertical line (**Krukenberg spindle**), (3) mid-peripheral spoke-like **iris transillumination defects**, and (4) heavy, dark brown pigment in the trabecular meshwork. IOP spikes can be triggered by exercise or pupillary movement, which rubs pigment off the iris.'),
    (v_case_id, 'What is the mechanical cause of pigment shedding in this condition?', '["Primary degeneration of the corneal endothelial cells", "Friction between the posterior iris pigment epithelium and the anterior lens zonular fibers", "Mechanical trauma to the iris from a loose intraocular lens", "A congenital failure of the iris stroma to fuse", "Autoimmune destruction of the iris melanocytes"]'::jsonb, 1, 'Pigment dispersion occurs due to a **mechanical friction** between the **posterior iris pigment epithelium** and the **anterior lens zonular fibers**. In myopic eyes with a backward-bowed iris (concave iris configuration), the movement of the iris against the zonules rubs off pigment granules, which are then swept by aqueous currents into the anterior chamber.'),
    (v_case_id, 'Why does exercise or pupillary dilation trigger an acute spike in intraocular pressure in these patients?', '["Lactic acid accumulation in the cornea causes rapid stromal swelling", "Mydriasis causes pupillary block and acute angle closure in these deep chambers", "Physical movement or rapid pupillary changes cause a sudden shower of pigment to block the trabecular meshwork", "Sympathetic stimulation causes swelling of the ciliary body", "Exercise increases systemic blood pressure, which directly elevates aqueous humor production"]'::jsonb, 2, 'Exercise or pupillary dilation (mydriasis) causes the iris to rub more vigorously against the zonules, releasing a **sudden shower of pigment granules**. These granules travel into the anterior chamber and physically clog the trabecular meshwork, leading to an acute, transient spike in IOP, presenting as blurry vision and halos from corneal edema.');

    ---------------------------------------------------------------------------
    -- CASE 27: Case Study: The Hypermature Cataract (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Hypermature Cataract (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Hypermature Cataract (V3)', 'A 70-year-old female from a rural area presents with acute onset of severe, aching pain, redness, and worsening vision in the left eye. She has had a dense cataract and very poor vision in that eye for over 4 years, but did not seek surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 83 bpm | BP: 124/75 mmHg
*   **Visual Acuity:** OS: Hand Motion; contralateral eye: 20/40
*   **Ocular Examination (OS):** Marked conjunctival injection. Cornea is edematous with microcystic changes. Slit-lamp exam shows a completely white, opaque lens with a wrinkled anterior capsule. The anterior chamber is deep but shows 3+ inflammatory cell and flare, and floating white clumps. No keratic precipitates (KPs) are visible on the endothelium. IOP is 45 mmHg.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old female from a rural area presents with acute onset of severe, aching pain, redness, and worsening vision in the left eye. She has had a dense cataract and very poor vision in that eye for over 4 years, but did not seek surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 83 bpm | BP: 124/75 mmHg
*   **Visual Acuity:** OS: Hand Motion; contralateral eye: 20/40
*   **Ocular Examination (OS):** Marked conjunctival injection. Cornea is edematous with microcystic changes. Slit-lamp exam shows a completely white, opaque lens with a wrinkled anterior capsule. The anterior chamber is deep but shows 3+ inflammatory cell and flare, and floating white clumps. No keratic precipitates (KPs) are visible on the endothelium. IOP is 45 mmHg.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Acute angle-closure glaucoma", "HLA-B27 associated anterior uveitis", "Phacoanaphylactic endophthalmitis", "Phacolytic glaucoma", "Neovascular glaucoma"]'::jsonb, 3, 'This is **Phacolytic Glaucoma**, a form of lens-induced open-angle glaucoma. It occurs in eyes with a **hypermature or mature cataract**. The lens cortex liquefies and high-molecular-weight lens proteins leak through microscopic pores in the degenerated, **wrinkled anterior lens capsule**. These proteins, along with protein-engulfed macrophages, physically obstruct the trabecular meshwork, causing a rapid, severe rise in IOP.'),
    (v_case_id, 'What is the definitive management of this patient''s condition?', '["Surgical trabeculectomy with the cataract left in place", "Chronic topical corticosteroid therapy and lifetime Timolol drops", "Lower IOP medically using topical drops and systemic acetazolamide, followed by urgent cataract extraction", "Intravitreal injection of broad-spectrum antibiotics and urgent vitrectomy", "Immediate laser peripheral iridotomy"]'::jsonb, 2, 'The definitive treatment is **cataract extraction** (removal of the leaking lens). Before surgery, IOP must be aggressively lowered medically (using topical beta-blockers, alpha-agonists, and systemic acetazolamide/mannitol) and corneal edema reduced. Once the IOP is controlled and the eye is stabilized, urgent cataract surgery is performed to remove the source of the protein.'),
    (v_case_id, 'Which slit-lamp finding helps differentiate Phacolytic Glaucoma from infectious or autoimmune anterior uveitis?', '["An elevated, wrinkled grey retina with a horseshoe-shaped tear", "The presence of iris transillumination defects in the mid-periphery", "A Sampaolesi line in the anterior chamber angle on gonioscopy", "The presence of a shallow anterior chamber and pupillary block", "The absence of keratic precipitates (KPs) on the corneal endothelium despite heavy anterior chamber cell/flare"]'::jsonb, 4, 'Phacolytic glaucoma is an open-angle glaucoma presenting with high IOP and cell/flare. A key clinical differentiator is the **absence of keratic precipitates (KPs)** on the corneal endothelium, despite what appears to be severe "inflammatory" cells in the anterior chamber. The "cells" are actually protein aggregates and macrophages, rather than primary inflammatory cells adhering to the endothelium.');

    ---------------------------------------------------------------------------
    -- CASE 28: Case Study: The Clouded Large Eyes (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Clouded Large Eyes (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Clouded Large Eyes (V3)', 'A 0-month-old infant is brought to the ophthalmology clinic by his mother due to constant tearing (epiphora), extreme sensitivity to light (photophobia), and frequent squeezing of the eyelids (blepharospasm) in both eyes. The mother notes the baby''s eyes look unusually large.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Poor fixation and following targets in both eyes.
*   **Ocular Examination (OU):** Severe corneal clouding and edema. The corneal diameters are enlarged, measuring 12.8 mm (normal infant diameter is <10.5 mm). Handheld slit-lamp exam under anesthesia reveals horizontal, linear breaks in Descemet''s membrane (Haab''s striae). IOP is 28 mmHg bilaterally.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 0-month-old infant is brought to the ophthalmology clinic by his mother due to constant tearing (epiphora), extreme sensitivity to light (photophobia), and frequent squeezing of the eyelids (blepharospasm) in both eyes. The mother notes the baby''s eyes look unusually large.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Poor fixation and following targets in both eyes.
*   **Ocular Examination (OU):** Severe corneal clouding and edema. The corneal diameters are enlarged, measuring 12.8 mm (normal infant diameter is <10.5 mm). Handheld slit-lamp exam under anesthesia reveals horizontal, linear breaks in Descemet''s membrane (Haab''s striae). IOP is 28 mmHg bilaterally.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary treatment?', '["Congenital cataract; urgent lens aspiration and intraocular lens implantation", "Congenital dacryostenosis; nasolacrimal duct probing and topical antibiotics", "Herpes simplex ophthalmia neonatorum; topical acyclovir gel and systemic acyclovir", "Primary congenital glaucoma; surgical intervention (e.g., goniotomy or trabeculotomy)", "Retinoblastoma; immediate systemic chemotherapy or enucleation"]'::jsonb, 3, 'This infant has **Primary Congenital Glaucoma**, characterized by the triad of **epiphora, photophobia, and blepharospasm**, along with corneal clouding, **buphthalmos** (enlarged eyes), and **Haab''s striae** (breaks in Descemet''s membrane). Treatment is **primarily surgical** (goniotomy or trabeculotomy) to physically open the malformed angle, as medical therapy is only an adjunct to clear the cornea before surgery.'),
    (v_case_id, 'What is the primary developmental defect responsible for Primary Congenital Glaucoma?', '["In utero infection with Cytomegalovirus leading to uveal inflammation", "Failure of the nasolacrimal duct to canalize prior to birth", "Deposition of abnormal copper in Descemet''s membrane", "Dysgenesis of the trabecular meshwork and anterior chamber angle (Barkan''s membrane)", "Autoimmune destruction of the scleral canal of Schlemm"]'::jsonb, 3, 'Primary congenital glaucoma is caused by **trabecular meshwork dysgenesis** (incomplete development of the trabecular meshwork and anterior chamber angle). A membrane-like tissue sheet (classically called Barkan''s membrane, though histologically representing compact trabecular tissue) blocks the outflow of aqueous humor, leading to high IOP in utero or shortly after birth.'),
    (v_case_id, 'Why do infants with congenital glaucoma develop abnormally large eyes (buphthalmos), whereas adults with high IOP do not?', '["The high pressure stimulates rapid bone growth of the surrounding orbit", "The infant sclera and cornea are highly elastic and stretch under high intraocular pressure", "Infants produce twice the volume of aqueous humor as adults, inflating the globe", "The infant lens swells and expands the entire anterior segment", "High IOP causes chronic hyperopia and axial length shortening"]'::jsonb, 1, 'In infants (under the age of 3), the collagen fibers of the **sclera and cornea are highly elastic and stretchable**. When exposed to high intraocular pressure, the entire globe stretches and enlarges, a condition known as **buphthalmos** ("ox eye"). In adults, the sclera is rigid and calcified, so high IOP does not cause enlargement of the globe.');

    ---------------------------------------------------------------------------
    -- CASE 29: Case Study: The Cost of Suppressed Inflammation (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Cost of Suppressed Inflammation (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Cost of Suppressed Inflammation (V3)', 'A 50-year-old male with a history of chronic anterior uveitis presents with a 2-week history of mild, painless blurry vision in his left eye. He has been using topical prednisolone acetate 1% drops 4 times daily in that eye for the past 3 months to prevent uveitis flare-ups.

**Physical Examination:**
*   **Vitals:** Temp: 98.9°F | HR: 83 bpm | BP: 126/81 mmHg
*   **Visual Acuity:** OS: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OS):** Cornea is clear. Anterior chamber is completely quiet (0 cells, 0 flare). Gonioscopy shows an open angle. Slit-lamp exam of the optic nerve reveals a cup-to-disc ratio of 0.85, with thinning of the superior and inferior neuroretinal rim. IOP is 28 mmHg. OS exam is completely normal with an IOP of 14 mmHg.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old male with a history of chronic anterior uveitis presents with a 2-week history of mild, painless blurry vision in his left eye. He has been using topical prednisolone acetate 1% drops 4 times daily in that eye for the past 3 months to prevent uveitis flare-ups.

**Physical Examination:**
*   **Vitals:** Temp: 98.9°F | HR: 83 bpm | BP: 126/81 mmHg
*   **Visual Acuity:** OS: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OS):** Cornea is clear. Anterior chamber is completely quiet (0 cells, 0 flare). Gonioscopy shows an open angle. Slit-lamp exam of the optic nerve reveals a cup-to-disc ratio of 0.85, with thinning of the superior and inferior neuroretinal rim. IOP is 28 mmHg. OS exam is completely normal with an IOP of 14 mmHg.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate initial management for this patient''s elevated intraocular pressure?', '["Perform a laser peripheral iridotomy", "Prescribe oral prednisone 60 mg daily to systemically control the disease", "Increase the frequency of prednisolone drops to every hour to reduce trabecular inflammation", "Perform immediate surgical trabeculectomy with mitomycin C", "Taper and discontinue the topical prednisolone, switch to a ''soft'' steroid if needed, and initiate IOP-lowering drops"]'::jsonb, 4, 'This patient has **Steroid-Induced Glaucoma**. The first step is to **taper and discontinue the offending corticosteroid** if the underlying uveitis is quiet. If corticosteroid therapy is still required, the patient should be switched to a "soft" steroid with less propensity to raise IOP (e.g., loteprednol, fluorometholone). Topical IOP-lowering agents (like latanoprost or timolol) should be initiated to protect the optic nerve while the steroid effect washes out.'),
    (v_case_id, 'What is the molecular mechanism by which corticosteroids increase intraocular pressure?', '["Stimulating ciliary body beta-2 receptors, increasing aqueous secretion", "Directly blocking the lumen of Schlemm''s canal via microthrombi", "Causing swelling of the crystalline lens, leading to pupillary block", "Promoting neovascularization of the anterior chamber angle", "Decreasing trabecular meshwork extracellular matrix clearance, increasing outflow resistance"]'::jsonb, 4, 'Corticosteroids increase IOP by **increasing resistance to aqueous outflow at the trabecular meshwork**. They do this by: (1) inhibiting the degradation of extracellular matrix (ECM) proteins, leading to glycosaminoglycan accumulation, (2) increasing expression of myocilin protein, and (3) causing morphologic changes in trabecular meshwork cells (e.g., forming cross-linked actin networks) that decrease their filtering capacity.'),
    (v_case_id, 'Which patient population is at the HIGHEST risk of being a high ''steroid responder'' (developing high IOP after steroid use)?', '["Young males with pigment dispersion syndrome", "Patients with a personal or first-degree family history of primary open-angle glaucoma, and high myopes", "Patients with hyperopia and shallow anterior chambers", "Infants with congenital nasolacrimal duct obstruction", "Patients with a history of HLA-B27 positive ankylosing spondylitis"]'::jsonb, 1, 'The risk of developing a steroid-induced IOP spike is significantly higher in **patients with POAG (over 90% are responders)**, first-degree relatives of POAG patients, high myopes, patients with connective tissue diseases (like rheumatoid arthritis), and very young or very old patients. These populations must be monitored closely whenever started on steroid drops.');

    ---------------------------------------------------------------------------
    -- CASE 30: Case Study: The Side Effects of Therapy (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Side Effects of Therapy (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Side Effects of Therapy (V3)', 'A 76-year-old female with bilateral primary open-angle glaucoma presents to her primary care physician complaining of worsening shortness of breath, wheezing, and fatigue. She was started on a new eye drop by her ophthalmologist 2 weeks ago. She has a history of moderate asthma.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 83 bpm (bradycardia) | BP: 110/70 mmHg | RR: 14/min
*   **Pulmonary:** Bilateral expiratory wheezing and prolonged expiratory phase on auscultation.
*   **Ocular Examination:** Bilateral quiet eyes, IOPs are well-controlled at 14 mmHg OU.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 76-year-old female with bilateral primary open-angle glaucoma presents to her primary care physician complaining of worsening shortness of breath, wheezing, and fatigue. She was started on a new eye drop by her ophthalmologist 2 weeks ago. She has a history of moderate asthma.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 83 bpm (bradycardia) | BP: 110/70 mmHg | RR: 14/min
*   **Pulmonary:** Bilateral expiratory wheezing and prolonged expiratory phase on auscultation.
*   **Ocular Examination:** Bilateral quiet eyes, IOPs are well-controlled at 14 mmHg OU.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following glaucoma medications is most likely responsible for this patient''s systemic symptoms?', '["Brimonidine (alpha-2 agonist)", "Timolol (non-selective beta-blocker)", "Dorzolamide (carbonic anhydrase inhibitor)", "Pilocarpine (parasympathomimetic)", "Latanoprost (prostaglandin analog)"]'::jsonb, 1, 'The patient''s presentation of asthma exacerbation (wheezing, dyspnea) and bradycardia (HR <60) after starting a new eye drop is classic for **Timolol**, a non-selective beta-adrenergic antagonist. Topical eye drops undergo mucosal absorption through the nasolacrimal duct, bypassing first-pass hepatic metabolism and achieving significant systemic levels. Timolol blocks beta-2 receptors in the bronchioles, causing life-threatening bronchospasm in asthmatics, and beta-1 receptors in the heart, causing bradycardia and heart block.'),
    (v_case_id, 'The patient''s timolol is discontinued. The ophthalmologist decides to switch to a prostaglandin analog (e.g., latanoprost). Which local side effect should the patient be educated about?', '["Severe allergic follicular conjunctivitis and contact dermatitis", "Dry mouth, drowsiness, and headache", "Increased brown pigmentation of the iris, lengthening and darkening of eyelashes, and orbital fat atrophy", "Bitter taste and corneal endothelial deposits", "Pupillary constriction (miosis), brow ache, and transient myopia"]'::jsonb, 2, 'Topical **prostaglandin analogs** (latanoprost, bimatoprost) have well-known cosmetic and local side effects: (1) **increased iris pigmentation** (turning blue/green eyes brown due to increased melanin production), (2) **hypertrichosis** (eyelash lengthening, thickening, and darkening), and (3) **prostaglandin-associated periorbitopathy** (orbital fat atrophy, causing a sunken eye appearance/deepening of the lid sulcus).'),
    (v_case_id, 'Another patient is started on Brimonidine (an alpha-2 agonist) and develops severe red eyes. What is the classic local side effect of Brimonidine that necessitates drug discontinuation?', '["Corneal stromal melting", "Posterior synechiae formation", "Intraoperative floppy iris syndrome", "Macular edema in aphakic patients", "Allergic follicular conjunctivitis"]'::jsonb, 4, 'Topical **Brimonidine** (an alpha-2 adrenergic agonist) is notorious for causing **allergic follicular conjunctivitis** or contact blepharoconjunctivitis in up to 15-20% of patients. It typically presents as delayed redness, severe itching, and follicles in the inferior palpebral conjunctiva, requiring discontinuation of the drug. Brimonidine also crosses the blood-brain barrier and can cause systemic somnolence/fatigue and is contraindicated in infants due to risk of central apnea and coma.');

    ---------------------------------------------------------------------------
    -- CASE 31: The Halos at Night - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Halos at Night - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Halos at Night - Case Analysis (V4)', 'A 72-year-old male presents to the emergency department with sudden, severe pain in his left eye, accompanied by a severe headache, nausea, and blurry vision with rainbow-colored halos around lights. He reports the symptoms began after sitting in a dark movie theater.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 76 bpm | BP: 128/88 mmHg
*   **Visual Acuity:** OS: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Marked conjunctival injection with ciliary flush. The cornea appears steamy and cloudy. The pupil is fixed, mid-dilated measuring 5.5 mm, and non-reactive to light. The globe is rock-hard to palpation. Intraocular pressure (IOP) is 54 mmHg. OS gonioscopy shows a completely closed angle.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 72-year-old male presents to the emergency department with sudden, severe pain in his left eye, accompanied by a severe headache, nausea, and blurry vision with rainbow-colored halos around lights. He reports the symptoms began after sitting in a dark movie theater.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 76 bpm | BP: 128/88 mmHg
*   **Visual Acuity:** OS: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Marked conjunctival injection with ciliary flush. The cornea appears steamy and cloudy. The pupil is fixed, mid-dilated measuring 5.5 mm, and non-reactive to light. The globe is rock-hard to palpation. Intraocular pressure (IOP) is 54 mmHg. OS gonioscopy shows a completely closed angle.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate next step in the immediate management of this patient?', '["Administer topical timolol, pilocarpine, and apraclonidine, combined with systemic intravenous acetazolamide", "Prescribe oral ciprofloxacin 750 mg and apply topical tobramycin drops", "Apply a tight pressure patch and schedule outpatient ophthalmology follow-up in 48 hours", "Initiate topical prednisolone acetate 1% drops every 15 minutes as monotherapy", "Perform immediate surgical trabeculectomy in the emergency department"]'::jsonb, 0, 'This patient presents with Acute Angle-Closure Glaucoma (AACG), an ocular emergency. Immediate medical management is directed at reducing intraocular pressure (IOP) and opening the angle. This is achieved by combining topical drops that decrease aqueous humor production (beta-blocker: timolol; alpha-2 agonist: apraclonidine) or increase outflow (miotic: pilocarpine, once IOP decreases below 40 mmHg and sphincter ischemia resolves) with systemic carbonic anhydrase inhibitors (IV acetazolamide). Pressure patching is contraindicated, steroids alone are insufficient, and laser peripheral iridotomy (LPI) is the definitive, rather than immediate bedside, treatment once the cornea clears.'),
    (v_case_id, 'What is the primary anatomical mechanism driving this condition in hyperopic patients?', '["Congenital dysgenesis of the trabecular meshwork and iris insertion", "Hypersecretion of aqueous humor by the ciliary body processes due to autonomic dysfunction", "Contraction of a fibrovascular membrane over the anterior chamber angle stimulated by retinal ischemia", "Deposition of abnormal fibrillar basement membrane material in the trabecular meshwork", "Pupillary block, where contact between the iris and lens prevents aqueous flow, forcing the peripheral iris forward to occlude the trabecular meshwork"]'::jsonb, 4, 'The primary mechanism of AACG is **pupillary block**. In anatomically predisposed eyes (typically hyperopes with short axial lengths and shallow anterior chambers), the iris comes into contact with the lens, blocking the normal flow of aqueous from the posterior chamber to the anterior chamber. This causes a pressure build-up in the posterior chamber, which pushes the peripheral iris forward (iris bombé) into contact with the trabecular meshwork, completely blocking aqueous drainage.'),
    (v_case_id, 'Which of the following classes of systemic or topical medications is strictly CONTRAINDICATED in patients with narrow or closed anterior chamber angles?', '["Carbonic anhydrase inhibitors", "Beta-adrenergic antagonists (beta-blockers)", "Sympathomimetics and anticholinergics (mydriatics)", "Prostaglandin analogs", "Osmotic diuretics"]'::jsonb, 2, 'Mydriatics (both anticholinergics like atropine/tropicamide and sympathomimetics like epinephrine/phenylephrine) cause pupillary dilation. In patients with narrow angles, pupillary dilation causes the iris to bunch up in the angle, which can trigger acute angle closure. Therefore, these drugs are strictly contraindicated in patients with untreated narrow angles.');

    ---------------------------------------------------------------------------
    -- CASE 32: The Slow Loss of Peripheral Vision - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Slow Loss of Peripheral Vision - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Slow Loss of Peripheral Vision - Case Analysis (V4)', 'A 71-year-old male presents for a routine eye exam. He denies any eye pain, redness, or sudden vision changes, but admits that he feels he has been bumping into objects more frequently and has difficulty driving at night.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 85 bpm | BP: 127/82 mmHg
*   **Visual Acuity:** OD: 20/30; OS: 20/25
*   **Ocular Examination:** Bilateral clear corneas. Anterior chambers are deep and quiet. Gonioscopy shows open angles bilaterally. Slit-lamp fundus exam reveals significant optic nerve cupping, with a cup-to-disc ratio (CDR) of 0.90 in the right eye and 0.35 in the left eye, along with neuroretinal rim thinning and nasalization of the disc vessels. Intraocular pressure (IOP) is 25 mmHg bilaterally.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 71-year-old male presents for a routine eye exam. He denies any eye pain, redness, or sudden vision changes, but admits that he feels he has been bumping into objects more frequently and has difficulty driving at night.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 85 bpm | BP: 127/82 mmHg
*   **Visual Acuity:** OD: 20/30; OS: 20/25
*   **Ocular Examination:** Bilateral clear corneas. Anterior chambers are deep and quiet. Gonioscopy shows open angles bilaterally. Slit-lamp fundus exam reveals significant optic nerve cupping, with a cup-to-disc ratio (CDR) of 0.90 in the right eye and 0.35 in the left eye, along with neuroretinal rim thinning and nasalization of the disc vessels. Intraocular pressure (IOP) is 25 mmHg bilaterally.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate first-line pharmacotherapy for this patient''s condition?', '["Topical parasympathomimetics (e.g., pilocarpine)", "Topical prostaglandin analogs (e.g., latanoprost)", "Oral carbonic anhydrase inhibitors (e.g., acetazolamide)", "Systemic hyperosmotic agents (e.g., mannitol)", "Topical non-selective beta-blockers (e.g., timolol) in a patient with severe asthma"]'::jsonb, 1, 'This patient has Primary Open-Angle Glaucoma (POAG). First-line medical therapy typically consists of **topical prostaglandin analogs** (e.g., latanoprost, bimatoprost) because they are highly effective, have a once-daily dosing regimen, and have a favorable systemic safety profile compared to beta-blockers (which are contraindicated in asthma/COPD).'),
    (v_case_id, 'What is the primary site of increased resistance to aqueous humor outflow in Primary Open-Angle Glaucoma?', '["The uveoscleral pathway through the ciliary muscle", "The pupillary aperture between the iris and lens", "The posterior chamber ciliary body epithelial cells", "Trabecular meshwork (specifically the juxtacanalicular tissue) and Schlemm''s canal", "The endothelial cell junctions of the episcleral veins"]'::jsonb, 3, 'In POAG, the primary site of increased resistance to aqueous humor drainage is the **trabecular meshwork**, particularly the **juxtacanalicular tissue** and the inner wall of Schlemm''s canal. This leads to a gradual elevation of IOP, which causes mechanical and ischemic damage to the retinal ganglion cell axons at the optic nerve head.'),
    (v_case_id, 'What is the classic visual field defect pattern initially seen in patients with progressive open-angle glaucoma?', '["Homonymous hemianopsia involving the macula", "Bitemporal hemianopsia, starting superiorly", "Binasal hemianopsia sparing the temporal fields", "Central scotoma with normal peripheral visual fields", "Arcuate (Bjerrum) scotoma and nasal steps, sparing central vision until late stages"]'::jsonb, 4, 'Glaucoma characteristically spares the central macula fibers until the very late stages of the disease. The earliest visual field defects are typically located in the mid-periphery and follow the pattern of the retinal nerve fiber layer arching around the macula. This manifests as **arcuate scotomas** (Bjerrum scotomas) and **nasal steps**.');

    ---------------------------------------------------------------------------
    -- CASE 33: The Cupped Disc with Normal Pressures - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cupped Disc with Normal Pressures - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cupped Disc with Normal Pressures - Case Analysis (V4)', 'A 78-year-old female with a history of severe migraines and Raynaud''s phenomenon presents for a comprehensive eye evaluation. Her intraocular pressures (IOP) have historically been normal, measuring 17 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 72 bpm | BP: 117/82 mmHg
*   **Visual Acuity:** Bilateral 20/20
*   **Ocular Examination:** Anterior chamber angles are open (Grade 4 bilaterally). Optic nerve head examination shows a cup-to-disc ratio of 0.75 OD and 0.40 OS, with significant thinning of the inferior neuroretinal rim. A small, linear splinter-like hemorrhage (Drance hemorrhage) is visible at the inferior border of the right optic disc. Automated visual field testing shows a superior arcuate defect in the right eye.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 78-year-old female with a history of severe migraines and Raynaud''s phenomenon presents for a comprehensive eye evaluation. Her intraocular pressures (IOP) have historically been normal, measuring 17 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 72 bpm | BP: 117/82 mmHg
*   **Visual Acuity:** Bilateral 20/20
*   **Ocular Examination:** Anterior chamber angles are open (Grade 4 bilaterally). Optic nerve head examination shows a cup-to-disc ratio of 0.75 OD and 0.40 OS, with significant thinning of the inferior neuroretinal rim. A small, linear splinter-like hemorrhage (Drance hemorrhage) is visible at the inferior border of the right optic disc. Automated visual field testing shows a superior arcuate defect in the right eye.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Primary open-angle glaucoma", "Optic neuritis", "Ocular hypertension", "Normal-tension glaucoma", "Anterior ischemic optic neuropathy"]'::jsonb, 3, 'This patient has **Normal-Tension Glaucoma (NTG)**, a subtype of POAG. NTG is characterized by: (1) progressive optic nerve cupping and visual field defects, (2) open angles, and (3) **IOP consistently <= 21 mmHg**. Splinter-like **Drance hemorrhages** at the optic disc margin are highly classic for NTG, as is an association with vasospastic disorders like migraines and Raynaud''s phenomenon.'),
    (v_case_id, 'Which factor is thought to play a larger role in the pathogenesis of Normal-Tension Glaucoma compared to high-tension POAG?', '["Primary autoimmune destruction of the scleral spur", "Mechanical compression of the optic nerve by narrow angles", "Vascular dysregulation, nocturnal hypotension, and poor optic nerve head perfusion", "Aqueous humor hypersecretion due to high sympathetic tone", "Trabecular meshwork cellular hypertrophy and sclerosis"]'::jsonb, 2, 'While elevated IOP is the main driver in POAG, **vascular dysregulation, optic nerve head ischemia, and nocturnal systemic hypotension** are major pathophysiological contributors in NTG. Patients have a higher prevalence of vasospastic diseases (migraines, Raynaud''s) and often experience nighttime blood pressure drops that compromise optic nerve perfusion pressure.'),
    (v_case_id, 'What is the recommended target reduction in intraocular pressure for patients with confirmed progression of Normal-Tension Glaucoma?', '["Maintaining IOP below 10 mmHg with systemic medications only", "Immediate bilateral trabeculectomy to reach an IOP of 0 mmHg", "No IOP lowering is required because IOP is already normal", "At least a 30% reduction from baseline IOP", "A 10% reduction using topical steroids to reduce inflammation"]'::jsonb, 3, 'The Collaborative Normal Tension Glaucoma Study (CNTGS) demonstrated that lowering IOP by **at least 30%** from baseline significantly slows the rate of visual field progression in NTG, confirming that even though IOP is in the "normal" range, it is still too high for the compromised optic nerves of these patients.');

    ---------------------------------------------------------------------------
    -- CASE 34: The Complication of Retinal Ischemia - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Complication of Retinal Ischemia - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Complication of Retinal Ischemia - Case Analysis (V4)', 'A 60-year-old male with a 20-year history of poorly controlled type 2 diabetes presents with acute, severe pain, redness, and profound vision loss in the left eye for 3 days. He has a history of proliferative diabetic retinopathy but has missed recent appointments.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 69 bpm | BP: 125/87 mmHg
*   **Visual Acuity:** OS: 20/400; contralateral eye: 20/30
*   **Ocular Examination (OS):** Severe conjunctival injection. The cornea is hazy and edematous. Slit-lamp exam reveals multiple, tiny, abnormal looping vessels along the pupillary border (rubeosis iridis) and crossing the trabecular meshwork in the angle. IOP is 46 mmHg.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old male with a 20-year history of poorly controlled type 2 diabetes presents with acute, severe pain, redness, and profound vision loss in the left eye for 3 days. He has a history of proliferative diabetic retinopathy but has missed recent appointments.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 69 bpm | BP: 125/87 mmHg
*   **Visual Acuity:** OS: 20/400; contralateral eye: 20/30
*   **Ocular Examination (OS):** Severe conjunctival injection. The cornea is hazy and edematous. Slit-lamp exam reveals multiple, tiny, abnormal looping vessels along the pupillary border (rubeosis iridis) and crossing the trabecular meshwork in the angle. IOP is 46 mmHg.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary underlying driver of abnormal blood vessel growth in this patient''s anterior segment?', '["Mechanical friction of the posterior iris against the lens", "Retinal ischemia leading to the release of Vascular Endothelial Growth Factor (VEGF)", "A primary mutation in the fibrillin-1 gene", "Chronic bacterial infection of the vitreous cavity", "High systemic blood glucose directly stimulating iris endothelial cells"]'::jsonb, 1, 'This is **Neovascular Glaucoma (NVG)**. The underlying cause is severe, widespread **retinal ischemia** (most commonly from proliferative diabetic retinopathy or central retinal vein occlusion). Ischemic retinal tissue releases **VEGF**, which diffuses forward into the anterior chamber, stimulating the growth of abnormal new vessels on the iris (rubeosis iridis) and in the anterior chamber angle.'),
    (v_case_id, 'What is the definitive therapy to address the underlying cause of this patient''s neovascularization?', '["Panretinal Photocoagulation (PRP) of the retina and intravitreal anti-VEGF injection", "Intravenous administration of high-dose corticosteroids", "Topical hourly corticosteroids alone", "Surgical iridectomy and vitrectomy", "Urgent laser peripheral iridotomy"]'::jsonb, 0, 'The definitive treatment to stop the drive for neovascularization is **Panretinal Photocoagulation (PRP)** of the ischemic retina. PRP destroys peripheral retina, reducing oxygen demand and subsequent VEGF release. In the acute phase, **intravitreal anti-VEGF injections** are highly effective in causing rapid regression of the iris and angle vessels, helping to stabilize IOP before PRP can be completed.'),
    (v_case_id, 'How does neovascularization in the angle eventually lead to irreversible, closed-angle glaucoma?', '["The abnormal vessels mechanically plug Schlemm''s canal from the inside", "The fibrovascular membrane contracts, pulling the peripheral iris over the trabecular meshwork (synechial angle closure)", "The vessels cause the lens to swell and push forward, occluding the pupil", "The vessels bleed, causing a massive hyphema that clots and blocks the trabecular meshwork", "Inflammatory macrophages engulfing the vessels clog the drainage system"]'::jsonb, 1, 'Initially, the neovascular membrane mechanically blocks the trabecular meshwork (open-angle stage). However, the **fibrovascular membrane eventually contracts**, pulling the peripheral iris forward over the trabecular meshwork. This leads to **synechial angle closure**, which is irreversible and requires surgical drainage procedures (like a glaucoma drainage device or trabeculectomy) if medical therapy fails.');

    ---------------------------------------------------------------------------
    -- CASE 35: The Dandruff-like Deposits - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dandruff-like Deposits - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dandruff-like Deposits - Case Analysis (V4)', 'A 74-year-old male presents with progressive, painless vision loss in his right eye. He has no history of eye trauma or surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 79 bpm | BP: 133/79 mmHg
*   **Visual Acuity:** OD: 20/60; contralateral eye: 20/25
*   **Ocular Examination (OD):** Slit-lamp exam reveals clear cornea. The anterior chamber is deep. On the anterior lens capsule, there is a classic three-zone pattern of white, flaky, amyloid-like material (a central disc, a clear zone, and a peripheral band). Similar dandruff-like material is visible at the pupillary margin. Gonioscopy shows a heavily pigmented trabecular meshwork with a dark line of pigment anterior to Schwalbe''s line (Sampaolesi line). IOP is 32 mmHg OD and 16 mmHg OS.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 74-year-old male presents with progressive, painless vision loss in his right eye. He has no history of eye trauma or surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 79 bpm | BP: 133/79 mmHg
*   **Visual Acuity:** OD: 20/60; contralateral eye: 20/25
*   **Ocular Examination (OD):** Slit-lamp exam reveals clear cornea. The anterior chamber is deep. On the anterior lens capsule, there is a classic three-zone pattern of white, flaky, amyloid-like material (a central disc, a clear zone, and a peripheral band). Similar dandruff-like material is visible at the pupillary margin. Gonioscopy shows a heavily pigmented trabecular meshwork with a dark line of pigment anterior to Schwalbe''s line (Sampaolesi line). IOP is 32 mmHg OD and 16 mmHg OS.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Primary open-angle glaucoma", "Pigmentary glaucoma", "Pseudoexfoliation glaucoma", "Uveitic glaucoma", "Phacolytic glaucoma"]'::jsonb, 2, 'This is **Pseudoexfoliation Glaucoma (PXG)**. It is characterized by the deposition of white, flaky, fibrillar extracellular material on the anterior lens capsule, pupillary border, and trabecular meshwork. Classic findings include a **three-zone pattern on the lens capsule** and a **Sampaolesi line** (pigment band at Schwalbe''s line) on gonioscopy. It is typically unilateral or highly asymmetric and carries a higher risk of optic nerve damage due to large, volatile IOP spikes.'),
    (v_case_id, 'During future cataract extraction surgery, what specific anatomical risk must the surgeon be prepared for in this patient?', '["Rapid corneal endothelial cell decompensation", "Failure of the pupil to constrict intraoperatively", "An increased risk of postoperative retinal detachment", "Zonular weakness and laxity, leading to lens subluxation or vitreous loss", "Severe, intraoperative retrobulbar hemorrhage"]'::jsonb, 3, 'Pseudoexfoliation material deposits on and damages the **lens zonules**, leading to **zonular weakness, laxity, and dialysis**. During cataract surgery, this makes the lens unstable, significantly increasing the risk of lens subluxation, posterior capsular rupture, and vitreous loss.'),
    (v_case_id, 'What is the systemic nature of Pseudoexfoliation syndrome?', '["An autosomal recessive lysosomal storage disease", "A generalized basement membrane disorder with abnormal elastic fiber production throughout the body", "An localized ocular inflammatory reaction to lens proteins", "An autoimmune vasculitis associated with HLA-B27", "A metastatic neuroendocrine tumor releasing serotonin"]'::jsonb, 1, 'Pseudoexfoliation syndrome is a **systemic basement membrane disorder** characterized by the widespread production and progressive accumulation of abnormal microfibrillar, proteinaceous material. This material has been detected in the heart, lungs, liver, kidneys, and blood vessels, and is associated with an increased risk of cardiovascular and cerebrovascular disease.');

    ---------------------------------------------------------------------------
    -- CASE 36: The Exercise-Induced Blur - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Exercise-Induced Blur - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Exercise-Induced Blur - Case Analysis (V4)', 'A 32-year-old myopic male presents with a history of recurrent episodes of blurry vision and rainbow halos in the right eye, typically occurring after intensive exercise or running. IOP in the affected eye is 26 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 135/76 mmHg
*   **Visual Acuity:** OD: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OD):** Slit-lamp exam shows a clear cornea with a vertical band of brown pigment on the corneal endothelium (Krukenberg spindle). The anterior chamber is very deep. Transillumination of the iris reveals multiple mid-peripheral spoke-like defects. Gonioscopy shows a wide-open angle with a dense, homogeneous 360-degree dark brown band in the trabecular meshwork.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 32-year-old myopic male presents with a history of recurrent episodes of blurry vision and rainbow halos in the right eye, typically occurring after intensive exercise or running. IOP in the affected eye is 26 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 135/76 mmHg
*   **Visual Acuity:** OD: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OD):** Slit-lamp exam shows a clear cornea with a vertical band of brown pigment on the corneal endothelium (Krukenberg spindle). The anterior chamber is very deep. Transillumination of the iris reveals multiple mid-peripheral spoke-like defects. Gonioscopy shows a wide-open angle with a dense, homogeneous 360-degree dark brown band in the trabecular meshwork.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pigmentary glaucoma", "Anterior uveitis", "Primary open-angle glaucoma", "Phacolytic glaucoma", "Pseudoexfoliation glaucoma"]'::jsonb, 0, 'This is **Pigmentary Glaucoma**, which typically affects young, myopic males. It is characterized by: (1) a deep anterior chamber, (2) pigment deposits on the corneal endothelium in a vertical line (**Krukenberg spindle**), (3) mid-peripheral spoke-like **iris transillumination defects**, and (4) heavy, dark brown pigment in the trabecular meshwork. IOP spikes can be triggered by exercise or pupillary movement, which rubs pigment off the iris.'),
    (v_case_id, 'What is the mechanical cause of pigment shedding in this condition?', '["Friction between the posterior iris pigment epithelium and the anterior lens zonular fibers", "Mechanical trauma to the iris from a loose intraocular lens", "A congenital failure of the iris stroma to fuse", "Primary degeneration of the corneal endothelial cells", "Autoimmune destruction of the iris melanocytes"]'::jsonb, 0, 'Pigment dispersion occurs due to a **mechanical friction** between the **posterior iris pigment epithelium** and the **anterior lens zonular fibers**. In myopic eyes with a backward-bowed iris (concave iris configuration), the movement of the iris against the zonules rubs off pigment granules, which are then swept by aqueous currents into the anterior chamber.'),
    (v_case_id, 'Why does exercise or pupillary dilation trigger an acute spike in intraocular pressure in these patients?', '["Sympathetic stimulation causes swelling of the ciliary body", "Lactic acid accumulation in the cornea causes rapid stromal swelling", "Exercise increases systemic blood pressure, which directly elevates aqueous humor production", "Physical movement or rapid pupillary changes cause a sudden shower of pigment to block the trabecular meshwork", "Mydriasis causes pupillary block and acute angle closure in these deep chambers"]'::jsonb, 3, 'Exercise or pupillary dilation (mydriasis) causes the iris to rub more vigorously against the zonules, releasing a **sudden shower of pigment granules**. These granules travel into the anterior chamber and physically clog the trabecular meshwork, leading to an acute, transient spike in IOP, presenting as blurry vision and halos from corneal edema.');

    ---------------------------------------------------------------------------
    -- CASE 37: The Hypermature Cataract - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hypermature Cataract - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hypermature Cataract - Case Analysis (V4)', 'A 77-year-old female from a rural area presents with acute onset of severe, aching pain, redness, and worsening vision in the left eye. She has had a dense cataract and very poor vision in that eye for over 2 years, but did not seek surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.9°F | HR: 85 bpm | BP: 126/76 mmHg
*   **Visual Acuity:** OS: Hand Motion; contralateral eye: 20/40
*   **Ocular Examination (OS):** Marked conjunctival injection. Cornea is edematous with microcystic changes. Slit-lamp exam shows a completely white, opaque lens with a wrinkled anterior capsule. The anterior chamber is deep but shows 3+ inflammatory cell and flare, and floating white clumps. No keratic precipitates (KPs) are visible on the endothelium. IOP is 39 mmHg.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 77-year-old female from a rural area presents with acute onset of severe, aching pain, redness, and worsening vision in the left eye. She has had a dense cataract and very poor vision in that eye for over 2 years, but did not seek surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.9°F | HR: 85 bpm | BP: 126/76 mmHg
*   **Visual Acuity:** OS: Hand Motion; contralateral eye: 20/40
*   **Ocular Examination (OS):** Marked conjunctival injection. Cornea is edematous with microcystic changes. Slit-lamp exam shows a completely white, opaque lens with a wrinkled anterior capsule. The anterior chamber is deep but shows 3+ inflammatory cell and flare, and floating white clumps. No keratic precipitates (KPs) are visible on the endothelium. IOP is 39 mmHg.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Acute angle-closure glaucoma", "Neovascular glaucoma", "HLA-B27 associated anterior uveitis", "Phacolytic glaucoma", "Phacoanaphylactic endophthalmitis"]'::jsonb, 3, 'This is **Phacolytic Glaucoma**, a form of lens-induced open-angle glaucoma. It occurs in eyes with a **hypermature or mature cataract**. The lens cortex liquefies and high-molecular-weight lens proteins leak through microscopic pores in the degenerated, **wrinkled anterior lens capsule**. These proteins, along with protein-engulfed macrophages, physically obstruct the trabecular meshwork, causing a rapid, severe rise in IOP.'),
    (v_case_id, 'What is the definitive management of this patient''s condition?', '["Surgical trabeculectomy with the cataract left in place", "Immediate laser peripheral iridotomy", "Intravitreal injection of broad-spectrum antibiotics and urgent vitrectomy", "Lower IOP medically using topical drops and systemic acetazolamide, followed by urgent cataract extraction", "Chronic topical corticosteroid therapy and lifetime Timolol drops"]'::jsonb, 3, 'The definitive treatment is **cataract extraction** (removal of the leaking lens). Before surgery, IOP must be aggressively lowered medically (using topical beta-blockers, alpha-agonists, and systemic acetazolamide/mannitol) and corneal edema reduced. Once the IOP is controlled and the eye is stabilized, urgent cataract surgery is performed to remove the source of the protein.'),
    (v_case_id, 'Which slit-lamp finding helps differentiate Phacolytic Glaucoma from infectious or autoimmune anterior uveitis?', '["A Sampaolesi line in the anterior chamber angle on gonioscopy", "The absence of keratic precipitates (KPs) on the corneal endothelium despite heavy anterior chamber cell/flare", "The presence of iris transillumination defects in the mid-periphery", "The presence of a shallow anterior chamber and pupillary block", "An elevated, wrinkled grey retina with a horseshoe-shaped tear"]'::jsonb, 1, 'Phacolytic glaucoma is an open-angle glaucoma presenting with high IOP and cell/flare. A key clinical differentiator is the **absence of keratic precipitates (KPs)** on the corneal endothelium, despite what appears to be severe "inflammatory" cells in the anterior chamber. The "cells" are actually protein aggregates and macrophages, rather than primary inflammatory cells adhering to the endothelium.');

    ---------------------------------------------------------------------------
    -- CASE 38: The Clouded Large Eyes - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Clouded Large Eyes - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Clouded Large Eyes - Case Analysis (V4)', 'A 1-month-old infant is brought to the ophthalmology clinic by his mother due to constant tearing (epiphora), extreme sensitivity to light (photophobia), and frequent squeezing of the eyelids (blepharospasm) in both eyes. The mother notes the baby''s eyes look unusually large.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Poor fixation and following targets in both eyes.
*   **Ocular Examination (OU):** Severe corneal clouding and edema. The corneal diameters are enlarged, measuring 12.6 mm (normal infant diameter is <10.5 mm). Handheld slit-lamp exam under anesthesia reveals horizontal, linear breaks in Descemet''s membrane (Haab''s striae). IOP is 36 mmHg bilaterally.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 1-month-old infant is brought to the ophthalmology clinic by his mother due to constant tearing (epiphora), extreme sensitivity to light (photophobia), and frequent squeezing of the eyelids (blepharospasm) in both eyes. The mother notes the baby''s eyes look unusually large.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Poor fixation and following targets in both eyes.
*   **Ocular Examination (OU):** Severe corneal clouding and edema. The corneal diameters are enlarged, measuring 12.6 mm (normal infant diameter is <10.5 mm). Handheld slit-lamp exam under anesthesia reveals horizontal, linear breaks in Descemet''s membrane (Haab''s striae). IOP is 36 mmHg bilaterally.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary treatment?', '["Retinoblastoma; immediate systemic chemotherapy or enucleation", "Primary congenital glaucoma; surgical intervention (e.g., goniotomy or trabeculotomy)", "Herpes simplex ophthalmia neonatorum; topical acyclovir gel and systemic acyclovir", "Congenital cataract; urgent lens aspiration and intraocular lens implantation", "Congenital dacryostenosis; nasolacrimal duct probing and topical antibiotics"]'::jsonb, 1, 'This infant has **Primary Congenital Glaucoma**, characterized by the triad of **epiphora, photophobia, and blepharospasm**, along with corneal clouding, **buphthalmos** (enlarged eyes), and **Haab''s striae** (breaks in Descemet''s membrane). Treatment is **primarily surgical** (goniotomy or trabeculotomy) to physically open the malformed angle, as medical therapy is only an adjunct to clear the cornea before surgery.'),
    (v_case_id, 'What is the primary developmental defect responsible for Primary Congenital Glaucoma?', '["In utero infection with Cytomegalovirus leading to uveal inflammation", "Dysgenesis of the trabecular meshwork and anterior chamber angle (Barkan''s membrane)", "Failure of the nasolacrimal duct to canalize prior to birth", "Autoimmune destruction of the scleral canal of Schlemm", "Deposition of abnormal copper in Descemet''s membrane"]'::jsonb, 1, 'Primary congenital glaucoma is caused by **trabecular meshwork dysgenesis** (incomplete development of the trabecular meshwork and anterior chamber angle). A membrane-like tissue sheet (classically called Barkan''s membrane, though histologically representing compact trabecular tissue) blocks the outflow of aqueous humor, leading to high IOP in utero or shortly after birth.'),
    (v_case_id, 'Why do infants with congenital glaucoma develop abnormally large eyes (buphthalmos), whereas adults with high IOP do not?', '["The infant sclera and cornea are highly elastic and stretch under high intraocular pressure", "High IOP causes chronic hyperopia and axial length shortening", "The infant lens swells and expands the entire anterior segment", "Infants produce twice the volume of aqueous humor as adults, inflating the globe", "The high pressure stimulates rapid bone growth of the surrounding orbit"]'::jsonb, 0, 'In infants (under the age of 3), the collagen fibers of the **sclera and cornea are highly elastic and stretchable**. When exposed to high intraocular pressure, the entire globe stretches and enlarges, a condition known as **buphthalmos** ("ox eye"). In adults, the sclera is rigid and calcified, so high IOP does not cause enlargement of the globe.');

    ---------------------------------------------------------------------------
    -- CASE 39: The Cost of Suppressed Inflammation - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cost of Suppressed Inflammation - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cost of Suppressed Inflammation - Case Analysis (V4)', 'A 41-year-old female with a history of chronic anterior uveitis presents with a 2-week history of mild, painless blurry vision in her right eye. She has been using topical prednisolone acetate 1% drops 4 times daily in that eye for the past 3 months to prevent uveitis flare-ups.

**Physical Examination:**
*   **Vitals:** Temp: 98.9°F | HR: 79 bpm | BP: 132/85 mmHg
*   **Visual Acuity:** OD: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OD):** Cornea is clear. Anterior chamber is completely quiet (0 cells, 0 flare). Gonioscopy shows an open angle. Slit-lamp exam of the optic nerve reveals a cup-to-disc ratio of 0.75, with thinning of the superior and inferior neuroretinal rim. IOP is 29 mmHg. OS exam is completely normal with an IOP of 14 mmHg.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 41-year-old female with a history of chronic anterior uveitis presents with a 2-week history of mild, painless blurry vision in her right eye. She has been using topical prednisolone acetate 1% drops 4 times daily in that eye for the past 3 months to prevent uveitis flare-ups.

**Physical Examination:**
*   **Vitals:** Temp: 98.9°F | HR: 79 bpm | BP: 132/85 mmHg
*   **Visual Acuity:** OD: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OD):** Cornea is clear. Anterior chamber is completely quiet (0 cells, 0 flare). Gonioscopy shows an open angle. Slit-lamp exam of the optic nerve reveals a cup-to-disc ratio of 0.75, with thinning of the superior and inferior neuroretinal rim. IOP is 29 mmHg. OS exam is completely normal with an IOP of 14 mmHg.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate initial management for this patient''s elevated intraocular pressure?', '["Prescribe oral prednisone 60 mg daily to systemically control the disease", "Taper and discontinue the topical prednisolone, switch to a ''soft'' steroid if needed, and initiate IOP-lowering drops", "Perform immediate surgical trabeculectomy with mitomycin C", "Perform a laser peripheral iridotomy", "Increase the frequency of prednisolone drops to every hour to reduce trabecular inflammation"]'::jsonb, 1, 'This patient has **Steroid-Induced Glaucoma**. The first step is to **taper and discontinue the offending corticosteroid** if the underlying uveitis is quiet. If corticosteroid therapy is still required, the patient should be switched to a "soft" steroid with less propensity to raise IOP (e.g., loteprednol, fluorometholone). Topical IOP-lowering agents (like latanoprost or timolol) should be initiated to protect the optic nerve while the steroid effect washes out.'),
    (v_case_id, 'What is the molecular mechanism by which corticosteroids increase intraocular pressure?', '["Promoting neovascularization of the anterior chamber angle", "Directly blocking the lumen of Schlemm''s canal via microthrombi", "Causing swelling of the crystalline lens, leading to pupillary block", "Stimulating ciliary body beta-2 receptors, increasing aqueous secretion", "Decreasing trabecular meshwork extracellular matrix clearance, increasing outflow resistance"]'::jsonb, 4, 'Corticosteroids increase IOP by **increasing resistance to aqueous outflow at the trabecular meshwork**. They do this by: (1) inhibiting the degradation of extracellular matrix (ECM) proteins, leading to glycosaminoglycan accumulation, (2) increasing expression of myocilin protein, and (3) causing morphologic changes in trabecular meshwork cells (e.g., forming cross-linked actin networks) that decrease their filtering capacity.'),
    (v_case_id, 'Which patient population is at the HIGHEST risk of being a high ''steroid responder'' (developing high IOP after steroid use)?', '["Patients with a history of HLA-B27 positive ankylosing spondylitis", "Infants with congenital nasolacrimal duct obstruction", "Patients with a personal or first-degree family history of primary open-angle glaucoma, and high myopes", "Young males with pigment dispersion syndrome", "Patients with hyperopia and shallow anterior chambers"]'::jsonb, 2, 'The risk of developing a steroid-induced IOP spike is significantly higher in **patients with POAG (over 90% are responders)**, first-degree relatives of POAG patients, high myopes, patients with connective tissue diseases (like rheumatoid arthritis), and very young or very old patients. These populations must be monitored closely whenever started on steroid drops.');

    ---------------------------------------------------------------------------
    -- CASE 40: The Side Effects of Therapy - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Side Effects of Therapy - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Side Effects of Therapy - Case Analysis (V4)', 'A 64-year-old male with bilateral primary open-angle glaucoma presents to his primary care physician complaining of worsening shortness of breath, wheezing, and fatigue. He was started on a new eye drop by his ophthalmologist 2 weeks ago. He has a history of moderate asthma.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 73 bpm (bradycardia) | BP: 110/70 mmHg | RR: 14/min
*   **Pulmonary:** Bilateral expiratory wheezing and prolonged expiratory phase on auscultation.
*   **Ocular Examination:** Bilateral quiet eyes, IOPs are well-controlled at 14 mmHg OU.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 64-year-old male with bilateral primary open-angle glaucoma presents to his primary care physician complaining of worsening shortness of breath, wheezing, and fatigue. He was started on a new eye drop by his ophthalmologist 2 weeks ago. He has a history of moderate asthma.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 73 bpm (bradycardia) | BP: 110/70 mmHg | RR: 14/min
*   **Pulmonary:** Bilateral expiratory wheezing and prolonged expiratory phase on auscultation.
*   **Ocular Examination:** Bilateral quiet eyes, IOPs are well-controlled at 14 mmHg OU.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following glaucoma medications is most likely responsible for this patient''s systemic symptoms?', '["Pilocarpine (parasympathomimetic)", "Brimonidine (alpha-2 agonist)", "Latanoprost (prostaglandin analog)", "Dorzolamide (carbonic anhydrase inhibitor)", "Timolol (non-selective beta-blocker)"]'::jsonb, 4, 'The patient''s presentation of asthma exacerbation (wheezing, dyspnea) and bradycardia (HR <60) after starting a new eye drop is classic for **Timolol**, a non-selective beta-adrenergic antagonist. Topical eye drops undergo mucosal absorption through the nasolacrimal duct, bypassing first-pass hepatic metabolism and achieving significant systemic levels. Timolol blocks beta-2 receptors in the bronchioles, causing life-threatening bronchospasm in asthmatics, and beta-1 receptors in the heart, causing bradycardia and heart block.'),
    (v_case_id, 'The patient''s timolol is discontinued. The ophthalmologist decides to switch to a prostaglandin analog (e.g., latanoprost). Which local side effect should the patient be educated about?', '["Dry mouth, drowsiness, and headache", "Bitter taste and corneal endothelial deposits", "Severe allergic follicular conjunctivitis and contact dermatitis", "Increased brown pigmentation of the iris, lengthening and darkening of eyelashes, and orbital fat atrophy", "Pupillary constriction (miosis), brow ache, and transient myopia"]'::jsonb, 3, 'Topical **prostaglandin analogs** (latanoprost, bimatoprost) have well-known cosmetic and local side effects: (1) **increased iris pigmentation** (turning blue/green eyes brown due to increased melanin production), (2) **hypertrichosis** (eyelash lengthening, thickening, and darkening), and (3) **prostaglandin-associated periorbitopathy** (orbital fat atrophy, causing a sunken eye appearance/deepening of the lid sulcus).'),
    (v_case_id, 'Another patient is started on Brimonidine (an alpha-2 agonist) and develops severe red eyes. What is the classic local side effect of Brimonidine that necessitates drug discontinuation?', '["Macular edema in aphakic patients", "Corneal stromal melting", "Posterior synechiae formation", "Allergic follicular conjunctivitis", "Intraoperative floppy iris syndrome"]'::jsonb, 3, 'Topical **Brimonidine** (an alpha-2 adrenergic agonist) is notorious for causing **allergic follicular conjunctivitis** or contact blepharoconjunctivitis in up to 15-20% of patients. It typically presents as delayed redness, severe itching, and follicles in the inferior palpebral conjunctiva, requiring discontinuation of the drug. Brimonidine also crosses the blood-brain barrier and can cause systemic somnolence/fatigue and is contraindicated in infants due to risk of central apnea and coma.');

    ---------------------------------------------------------------------------
    -- CASE 41: Vignette: The Halos at Night (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Halos at Night (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Halos at Night (V5)', 'A 70-year-old male presents to the emergency department with sudden, severe pain in his right eye, accompanied by a severe headache, nausea, and blurry vision with rainbow-colored halos around lights. He reports the symptoms began after sitting in a dark movie theater.

**Physical Examination:**
*   **Vitals:** Temp: 98.1°F | HR: 83 bpm | BP: 127/81 mmHg
*   **Visual Acuity:** OD: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Marked conjunctival injection with ciliary flush. The cornea appears steamy and cloudy. The pupil is fixed, mid-dilated measuring 6.1 mm, and non-reactive to light. The globe is rock-hard to palpation. Intraocular pressure (IOP) is 53 mmHg. OS gonioscopy shows a completely closed angle.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old male presents to the emergency department with sudden, severe pain in his right eye, accompanied by a severe headache, nausea, and blurry vision with rainbow-colored halos around lights. He reports the symptoms began after sitting in a dark movie theater.

**Physical Examination:**
*   **Vitals:** Temp: 98.1°F | HR: 83 bpm | BP: 127/81 mmHg
*   **Visual Acuity:** OD: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Marked conjunctival injection with ciliary flush. The cornea appears steamy and cloudy. The pupil is fixed, mid-dilated measuring 6.1 mm, and non-reactive to light. The globe is rock-hard to palpation. Intraocular pressure (IOP) is 53 mmHg. OS gonioscopy shows a completely closed angle.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate next step in the immediate management of this patient?', '["Administer topical timolol, pilocarpine, and apraclonidine, combined with systemic intravenous acetazolamide", "Initiate topical prednisolone acetate 1% drops every 15 minutes as monotherapy", "Apply a tight pressure patch and schedule outpatient ophthalmology follow-up in 48 hours", "Perform immediate surgical trabeculectomy in the emergency department", "Prescribe oral ciprofloxacin 750 mg and apply topical tobramycin drops"]'::jsonb, 0, 'This patient presents with Acute Angle-Closure Glaucoma (AACG), an ocular emergency. Immediate medical management is directed at reducing intraocular pressure (IOP) and opening the angle. This is achieved by combining topical drops that decrease aqueous humor production (beta-blocker: timolol; alpha-2 agonist: apraclonidine) or increase outflow (miotic: pilocarpine, once IOP decreases below 40 mmHg and sphincter ischemia resolves) with systemic carbonic anhydrase inhibitors (IV acetazolamide). Pressure patching is contraindicated, steroids alone are insufficient, and laser peripheral iridotomy (LPI) is the definitive, rather than immediate bedside, treatment once the cornea clears.'),
    (v_case_id, 'What is the primary anatomical mechanism driving this condition in hyperopic patients?', '["Hypersecretion of aqueous humor by the ciliary body processes due to autonomic dysfunction", "Deposition of abnormal fibrillar basement membrane material in the trabecular meshwork", "Pupillary block, where contact between the iris and lens prevents aqueous flow, forcing the peripheral iris forward to occlude the trabecular meshwork", "Congenital dysgenesis of the trabecular meshwork and iris insertion", "Contraction of a fibrovascular membrane over the anterior chamber angle stimulated by retinal ischemia"]'::jsonb, 2, 'The primary mechanism of AACG is **pupillary block**. In anatomically predisposed eyes (typically hyperopes with short axial lengths and shallow anterior chambers), the iris comes into contact with the lens, blocking the normal flow of aqueous from the posterior chamber to the anterior chamber. This causes a pressure build-up in the posterior chamber, which pushes the peripheral iris forward (iris bombé) into contact with the trabecular meshwork, completely blocking aqueous drainage.'),
    (v_case_id, 'Which of the following classes of systemic or topical medications is strictly CONTRAINDICATED in patients with narrow or closed anterior chamber angles?', '["Sympathomimetics and anticholinergics (mydriatics)", "Carbonic anhydrase inhibitors", "Prostaglandin analogs", "Beta-adrenergic antagonists (beta-blockers)", "Osmotic diuretics"]'::jsonb, 0, 'Mydriatics (both anticholinergics like atropine/tropicamide and sympathomimetics like epinephrine/phenylephrine) cause pupillary dilation. In patients with narrow angles, pupillary dilation causes the iris to bunch up in the angle, which can trigger acute angle closure. Therefore, these drugs are strictly contraindicated in patients with untreated narrow angles.');

    ---------------------------------------------------------------------------
    -- CASE 42: Vignette: The Slow Loss of Peripheral Vision (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Slow Loss of Peripheral Vision (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Slow Loss of Peripheral Vision (V5)', 'A 73-year-old female presents for a routine eye exam. She denies any eye pain, redness, or sudden vision changes, but admits that she feels she has been bumping into objects more frequently and has difficulty driving at night.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 80 bpm | BP: 128/86 mmHg
*   **Visual Acuity:** OD: 20/30; OS: 20/25
*   **Ocular Examination:** Bilateral clear corneas. Anterior chambers are deep and quiet. Gonioscopy shows open angles bilaterally. Slit-lamp fundus exam reveals significant optic nerve cupping, with a cup-to-disc ratio (CDR) of 0.85 in the right eye and 0.40 in the left eye, along with neuroretinal rim thinning and nasalization of the disc vessels. Intraocular pressure (IOP) is 29 mmHg bilaterally.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 73-year-old female presents for a routine eye exam. She denies any eye pain, redness, or sudden vision changes, but admits that she feels she has been bumping into objects more frequently and has difficulty driving at night.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 80 bpm | BP: 128/86 mmHg
*   **Visual Acuity:** OD: 20/30; OS: 20/25
*   **Ocular Examination:** Bilateral clear corneas. Anterior chambers are deep and quiet. Gonioscopy shows open angles bilaterally. Slit-lamp fundus exam reveals significant optic nerve cupping, with a cup-to-disc ratio (CDR) of 0.85 in the right eye and 0.40 in the left eye, along with neuroretinal rim thinning and nasalization of the disc vessels. Intraocular pressure (IOP) is 29 mmHg bilaterally.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate first-line pharmacotherapy for this patient''s condition?', '["Oral carbonic anhydrase inhibitors (e.g., acetazolamide)", "Topical parasympathomimetics (e.g., pilocarpine)", "Systemic hyperosmotic agents (e.g., mannitol)", "Topical non-selective beta-blockers (e.g., timolol) in a patient with severe asthma", "Topical prostaglandin analogs (e.g., latanoprost)"]'::jsonb, 4, 'This patient has Primary Open-Angle Glaucoma (POAG). First-line medical therapy typically consists of **topical prostaglandin analogs** (e.g., latanoprost, bimatoprost) because they are highly effective, have a once-daily dosing regimen, and have a favorable systemic safety profile compared to beta-blockers (which are contraindicated in asthma/COPD).'),
    (v_case_id, 'What is the primary site of increased resistance to aqueous humor outflow in Primary Open-Angle Glaucoma?', '["The endothelial cell junctions of the episcleral veins", "The posterior chamber ciliary body epithelial cells", "The uveoscleral pathway through the ciliary muscle", "Trabecular meshwork (specifically the juxtacanalicular tissue) and Schlemm''s canal", "The pupillary aperture between the iris and lens"]'::jsonb, 3, 'In POAG, the primary site of increased resistance to aqueous humor drainage is the **trabecular meshwork**, particularly the **juxtacanalicular tissue** and the inner wall of Schlemm''s canal. This leads to a gradual elevation of IOP, which causes mechanical and ischemic damage to the retinal ganglion cell axons at the optic nerve head.'),
    (v_case_id, 'What is the classic visual field defect pattern initially seen in patients with progressive open-angle glaucoma?', '["Binasal hemianopsia sparing the temporal fields", "Homonymous hemianopsia involving the macula", "Bitemporal hemianopsia, starting superiorly", "Central scotoma with normal peripheral visual fields", "Arcuate (Bjerrum) scotoma and nasal steps, sparing central vision until late stages"]'::jsonb, 4, 'Glaucoma characteristically spares the central macula fibers until the very late stages of the disease. The earliest visual field defects are typically located in the mid-periphery and follow the pattern of the retinal nerve fiber layer arching around the macula. This manifests as **arcuate scotomas** (Bjerrum scotomas) and **nasal steps**.');

    ---------------------------------------------------------------------------
    -- CASE 43: Vignette: The Cupped Disc with Normal Pressures (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Cupped Disc with Normal Pressures (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Cupped Disc with Normal Pressures (V5)', 'A 64-year-old female with a history of severe migraines and Raynaud''s phenomenon presents for a comprehensive eye evaluation. Her intraocular pressures (IOP) have historically been normal, measuring 16 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 84 bpm | BP: 121/77 mmHg
*   **Visual Acuity:** Bilateral 20/20
*   **Ocular Examination:** Anterior chamber angles are open (Grade 4 bilaterally). Optic nerve head examination shows a cup-to-disc ratio of 0.85 OD and 0.30 OS, with significant thinning of the inferior neuroretinal rim. A small, linear splinter-like hemorrhage (Drance hemorrhage) is visible at the inferior border of the right optic disc. Automated visual field testing shows a superior arcuate defect in the right eye.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 64-year-old female with a history of severe migraines and Raynaud''s phenomenon presents for a comprehensive eye evaluation. Her intraocular pressures (IOP) have historically been normal, measuring 16 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 84 bpm | BP: 121/77 mmHg
*   **Visual Acuity:** Bilateral 20/20
*   **Ocular Examination:** Anterior chamber angles are open (Grade 4 bilaterally). Optic nerve head examination shows a cup-to-disc ratio of 0.85 OD and 0.30 OS, with significant thinning of the inferior neuroretinal rim. A small, linear splinter-like hemorrhage (Drance hemorrhage) is visible at the inferior border of the right optic disc. Automated visual field testing shows a superior arcuate defect in the right eye.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Anterior ischemic optic neuropathy", "Primary open-angle glaucoma", "Ocular hypertension", "Normal-tension glaucoma", "Optic neuritis"]'::jsonb, 3, 'This patient has **Normal-Tension Glaucoma (NTG)**, a subtype of POAG. NTG is characterized by: (1) progressive optic nerve cupping and visual field defects, (2) open angles, and (3) **IOP consistently <= 21 mmHg**. Splinter-like **Drance hemorrhages** at the optic disc margin are highly classic for NTG, as is an association with vasospastic disorders like migraines and Raynaud''s phenomenon.'),
    (v_case_id, 'Which factor is thought to play a larger role in the pathogenesis of Normal-Tension Glaucoma compared to high-tension POAG?', '["Primary autoimmune destruction of the scleral spur", "Aqueous humor hypersecretion due to high sympathetic tone", "Mechanical compression of the optic nerve by narrow angles", "Trabecular meshwork cellular hypertrophy and sclerosis", "Vascular dysregulation, nocturnal hypotension, and poor optic nerve head perfusion"]'::jsonb, 4, 'While elevated IOP is the main driver in POAG, **vascular dysregulation, optic nerve head ischemia, and nocturnal systemic hypotension** are major pathophysiological contributors in NTG. Patients have a higher prevalence of vasospastic diseases (migraines, Raynaud''s) and often experience nighttime blood pressure drops that compromise optic nerve perfusion pressure.'),
    (v_case_id, 'What is the recommended target reduction in intraocular pressure for patients with confirmed progression of Normal-Tension Glaucoma?', '["Maintaining IOP below 10 mmHg with systemic medications only", "A 10% reduction using topical steroids to reduce inflammation", "At least a 30% reduction from baseline IOP", "Immediate bilateral trabeculectomy to reach an IOP of 0 mmHg", "No IOP lowering is required because IOP is already normal"]'::jsonb, 2, 'The Collaborative Normal Tension Glaucoma Study (CNTGS) demonstrated that lowering IOP by **at least 30%** from baseline significantly slows the rate of visual field progression in NTG, confirming that even though IOP is in the "normal" range, it is still too high for the compromised optic nerves of these patients.');

    ---------------------------------------------------------------------------
    -- CASE 44: Vignette: The Complication of Retinal Ischemia (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Complication of Retinal Ischemia (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Complication of Retinal Ischemia (V5)', 'A 73-year-old female with a 20-year history of poorly controlled type 2 diabetes presents with acute, severe pain, redness, and profound vision loss in the left eye for 3 days. She has a history of proliferative diabetic retinopathy but has missed recent appointments.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 68 bpm | BP: 117/86 mmHg
*   **Visual Acuity:** OS: 20/400; contralateral eye: 20/30
*   **Ocular Examination (OS):** Severe conjunctival injection. The cornea is hazy and edematous. Slit-lamp exam reveals multiple, tiny, abnormal looping vessels along the pupillary border (rubeosis iridis) and crossing the trabecular meshwork in the angle. IOP is 47 mmHg.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 73-year-old female with a 20-year history of poorly controlled type 2 diabetes presents with acute, severe pain, redness, and profound vision loss in the left eye for 3 days. She has a history of proliferative diabetic retinopathy but has missed recent appointments.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 68 bpm | BP: 117/86 mmHg
*   **Visual Acuity:** OS: 20/400; contralateral eye: 20/30
*   **Ocular Examination (OS):** Severe conjunctival injection. The cornea is hazy and edematous. Slit-lamp exam reveals multiple, tiny, abnormal looping vessels along the pupillary border (rubeosis iridis) and crossing the trabecular meshwork in the angle. IOP is 47 mmHg.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary underlying driver of abnormal blood vessel growth in this patient''s anterior segment?', '["High systemic blood glucose directly stimulating iris endothelial cells", "Mechanical friction of the posterior iris against the lens", "A primary mutation in the fibrillin-1 gene", "Chronic bacterial infection of the vitreous cavity", "Retinal ischemia leading to the release of Vascular Endothelial Growth Factor (VEGF)"]'::jsonb, 4, 'This is **Neovascular Glaucoma (NVG)**. The underlying cause is severe, widespread **retinal ischemia** (most commonly from proliferative diabetic retinopathy or central retinal vein occlusion). Ischemic retinal tissue releases **VEGF**, which diffuses forward into the anterior chamber, stimulating the growth of abnormal new vessels on the iris (rubeosis iridis) and in the anterior chamber angle.'),
    (v_case_id, 'What is the definitive therapy to address the underlying cause of this patient''s neovascularization?', '["Intravenous administration of high-dose corticosteroids", "Surgical iridectomy and vitrectomy", "Urgent laser peripheral iridotomy", "Topical hourly corticosteroids alone", "Panretinal Photocoagulation (PRP) of the retina and intravitreal anti-VEGF injection"]'::jsonb, 4, 'The definitive treatment to stop the drive for neovascularization is **Panretinal Photocoagulation (PRP)** of the ischemic retina. PRP destroys peripheral retina, reducing oxygen demand and subsequent VEGF release. In the acute phase, **intravitreal anti-VEGF injections** are highly effective in causing rapid regression of the iris and angle vessels, helping to stabilize IOP before PRP can be completed.'),
    (v_case_id, 'How does neovascularization in the angle eventually lead to irreversible, closed-angle glaucoma?', '["The fibrovascular membrane contracts, pulling the peripheral iris over the trabecular meshwork (synechial angle closure)", "The vessels bleed, causing a massive hyphema that clots and blocks the trabecular meshwork", "The abnormal vessels mechanically plug Schlemm''s canal from the inside", "The vessels cause the lens to swell and push forward, occluding the pupil", "Inflammatory macrophages engulfing the vessels clog the drainage system"]'::jsonb, 0, 'Initially, the neovascular membrane mechanically blocks the trabecular meshwork (open-angle stage). However, the **fibrovascular membrane eventually contracts**, pulling the peripheral iris forward over the trabecular meshwork. This leads to **synechial angle closure**, which is irreversible and requires surgical drainage procedures (like a glaucoma drainage device or trabeculectomy) if medical therapy fails.');

    ---------------------------------------------------------------------------
    -- CASE 45: Vignette: The Dandruff-like Deposits (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Dandruff-like Deposits (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Dandruff-like Deposits (V5)', 'A 81-year-old female presents with progressive, painless vision loss in her right eye. She has no history of eye trauma or surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 71 bpm | BP: 124/85 mmHg
*   **Visual Acuity:** OD: 20/60; contralateral eye: 20/25
*   **Ocular Examination (OD):** Slit-lamp exam reveals clear cornea. The anterior chamber is deep. On the anterior lens capsule, there is a classic three-zone pattern of white, flaky, amyloid-like material (a central disc, a clear zone, and a peripheral band). Similar dandruff-like material is visible at the pupillary margin. Gonioscopy shows a heavily pigmented trabecular meshwork with a dark line of pigment anterior to Schwalbe''s line (Sampaolesi line). IOP is 32 mmHg OD and 16 mmHg OS.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 81-year-old female presents with progressive, painless vision loss in her right eye. She has no history of eye trauma or surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 71 bpm | BP: 124/85 mmHg
*   **Visual Acuity:** OD: 20/60; contralateral eye: 20/25
*   **Ocular Examination (OD):** Slit-lamp exam reveals clear cornea. The anterior chamber is deep. On the anterior lens capsule, there is a classic three-zone pattern of white, flaky, amyloid-like material (a central disc, a clear zone, and a peripheral band). Similar dandruff-like material is visible at the pupillary margin. Gonioscopy shows a heavily pigmented trabecular meshwork with a dark line of pigment anterior to Schwalbe''s line (Sampaolesi line). IOP is 32 mmHg OD and 16 mmHg OS.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pseudoexfoliation glaucoma", "Phacolytic glaucoma", "Primary open-angle glaucoma", "Uveitic glaucoma", "Pigmentary glaucoma"]'::jsonb, 0, 'This is **Pseudoexfoliation Glaucoma (PXG)**. It is characterized by the deposition of white, flaky, fibrillar extracellular material on the anterior lens capsule, pupillary border, and trabecular meshwork. Classic findings include a **three-zone pattern on the lens capsule** and a **Sampaolesi line** (pigment band at Schwalbe''s line) on gonioscopy. It is typically unilateral or highly asymmetric and carries a higher risk of optic nerve damage due to large, volatile IOP spikes.'),
    (v_case_id, 'During future cataract extraction surgery, what specific anatomical risk must the surgeon be prepared for in this patient?', '["An increased risk of postoperative retinal detachment", "Rapid corneal endothelial cell decompensation", "Failure of the pupil to constrict intraoperatively", "Zonular weakness and laxity, leading to lens subluxation or vitreous loss", "Severe, intraoperative retrobulbar hemorrhage"]'::jsonb, 3, 'Pseudoexfoliation material deposits on and damages the **lens zonules**, leading to **zonular weakness, laxity, and dialysis**. During cataract surgery, this makes the lens unstable, significantly increasing the risk of lens subluxation, posterior capsular rupture, and vitreous loss.'),
    (v_case_id, 'What is the systemic nature of Pseudoexfoliation syndrome?', '["An autosomal recessive lysosomal storage disease", "A metastatic neuroendocrine tumor releasing serotonin", "A generalized basement membrane disorder with abnormal elastic fiber production throughout the body", "An localized ocular inflammatory reaction to lens proteins", "An autoimmune vasculitis associated with HLA-B27"]'::jsonb, 2, 'Pseudoexfoliation syndrome is a **systemic basement membrane disorder** characterized by the widespread production and progressive accumulation of abnormal microfibrillar, proteinaceous material. This material has been detected in the heart, lungs, liver, kidneys, and blood vessels, and is associated with an increased risk of cardiovascular and cerebrovascular disease.');

    ---------------------------------------------------------------------------
    -- CASE 46: Vignette: The Exercise-Induced Blur (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Exercise-Induced Blur (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Exercise-Induced Blur (V5)', 'A 41-year-old myopic female presents with a history of recurrent episodes of blurry vision and rainbow halos in the left eye, typically occurring after intensive exercise or running. IOP in the affected eye is 35 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 69 bpm | BP: 128/75 mmHg
*   **Visual Acuity:** OS: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OS):** Slit-lamp exam shows a clear cornea with a vertical band of brown pigment on the corneal endothelium (Krukenberg spindle). The anterior chamber is very deep. Transillumination of the iris reveals multiple mid-peripheral spoke-like defects. Gonioscopy shows a wide-open angle with a dense, homogeneous 360-degree dark brown band in the trabecular meshwork.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 41-year-old myopic female presents with a history of recurrent episodes of blurry vision and rainbow halos in the left eye, typically occurring after intensive exercise or running. IOP in the affected eye is 35 mmHg today.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 69 bpm | BP: 128/75 mmHg
*   **Visual Acuity:** OS: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OS):** Slit-lamp exam shows a clear cornea with a vertical band of brown pigment on the corneal endothelium (Krukenberg spindle). The anterior chamber is very deep. Transillumination of the iris reveals multiple mid-peripheral spoke-like defects. Gonioscopy shows a wide-open angle with a dense, homogeneous 360-degree dark brown band in the trabecular meshwork.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pigmentary glaucoma", "Primary open-angle glaucoma", "Anterior uveitis", "Pseudoexfoliation glaucoma", "Phacolytic glaucoma"]'::jsonb, 0, 'This is **Pigmentary Glaucoma**, which typically affects young, myopic males. It is characterized by: (1) a deep anterior chamber, (2) pigment deposits on the corneal endothelium in a vertical line (**Krukenberg spindle**), (3) mid-peripheral spoke-like **iris transillumination defects**, and (4) heavy, dark brown pigment in the trabecular meshwork. IOP spikes can be triggered by exercise or pupillary movement, which rubs pigment off the iris.'),
    (v_case_id, 'What is the mechanical cause of pigment shedding in this condition?', '["A congenital failure of the iris stroma to fuse", "Mechanical trauma to the iris from a loose intraocular lens", "Autoimmune destruction of the iris melanocytes", "Friction between the posterior iris pigment epithelium and the anterior lens zonular fibers", "Primary degeneration of the corneal endothelial cells"]'::jsonb, 3, 'Pigment dispersion occurs due to a **mechanical friction** between the **posterior iris pigment epithelium** and the **anterior lens zonular fibers**. In myopic eyes with a backward-bowed iris (concave iris configuration), the movement of the iris against the zonules rubs off pigment granules, which are then swept by aqueous currents into the anterior chamber.'),
    (v_case_id, 'Why does exercise or pupillary dilation trigger an acute spike in intraocular pressure in these patients?', '["Physical movement or rapid pupillary changes cause a sudden shower of pigment to block the trabecular meshwork", "Sympathetic stimulation causes swelling of the ciliary body", "Mydriasis causes pupillary block and acute angle closure in these deep chambers", "Lactic acid accumulation in the cornea causes rapid stromal swelling", "Exercise increases systemic blood pressure, which directly elevates aqueous humor production"]'::jsonb, 0, 'Exercise or pupillary dilation (mydriasis) causes the iris to rub more vigorously against the zonules, releasing a **sudden shower of pigment granules**. These granules travel into the anterior chamber and physically clog the trabecular meshwork, leading to an acute, transient spike in IOP, presenting as blurry vision and halos from corneal edema.');

    ---------------------------------------------------------------------------
    -- CASE 47: Vignette: The Hypermature Cataract (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Hypermature Cataract (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Hypermature Cataract (V5)', 'A 82-year-old female from a rural area presents with acute onset of severe, aching pain, redness, and worsening vision in the left eye. She has had a dense cataract and very poor vision in that eye for over 2 years, but did not seek surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 75 bpm | BP: 125/87 mmHg
*   **Visual Acuity:** OS: Hand Motion; contralateral eye: 20/40
*   **Ocular Examination (OS):** Marked conjunctival injection. Cornea is edematous with microcystic changes. Slit-lamp exam shows a completely white, opaque lens with a wrinkled anterior capsule. The anterior chamber is deep but shows 3+ inflammatory cell and flare, and floating white clumps. No keratic precipitates (KPs) are visible on the endothelium. IOP is 39 mmHg.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 82-year-old female from a rural area presents with acute onset of severe, aching pain, redness, and worsening vision in the left eye. She has had a dense cataract and very poor vision in that eye for over 2 years, but did not seek surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 75 bpm | BP: 125/87 mmHg
*   **Visual Acuity:** OS: Hand Motion; contralateral eye: 20/40
*   **Ocular Examination (OS):** Marked conjunctival injection. Cornea is edematous with microcystic changes. Slit-lamp exam shows a completely white, opaque lens with a wrinkled anterior capsule. The anterior chamber is deep but shows 3+ inflammatory cell and flare, and floating white clumps. No keratic precipitates (KPs) are visible on the endothelium. IOP is 39 mmHg.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Neovascular glaucoma", "Phacolytic glaucoma", "Phacoanaphylactic endophthalmitis", "HLA-B27 associated anterior uveitis", "Acute angle-closure glaucoma"]'::jsonb, 1, 'This is **Phacolytic Glaucoma**, a form of lens-induced open-angle glaucoma. It occurs in eyes with a **hypermature or mature cataract**. The lens cortex liquefies and high-molecular-weight lens proteins leak through microscopic pores in the degenerated, **wrinkled anterior lens capsule**. These proteins, along with protein-engulfed macrophages, physically obstruct the trabecular meshwork, causing a rapid, severe rise in IOP.'),
    (v_case_id, 'What is the definitive management of this patient''s condition?', '["Surgical trabeculectomy with the cataract left in place", "Chronic topical corticosteroid therapy and lifetime Timolol drops", "Intravitreal injection of broad-spectrum antibiotics and urgent vitrectomy", "Immediate laser peripheral iridotomy", "Lower IOP medically using topical drops and systemic acetazolamide, followed by urgent cataract extraction"]'::jsonb, 4, 'The definitive treatment is **cataract extraction** (removal of the leaking lens). Before surgery, IOP must be aggressively lowered medically (using topical beta-blockers, alpha-agonists, and systemic acetazolamide/mannitol) and corneal edema reduced. Once the IOP is controlled and the eye is stabilized, urgent cataract surgery is performed to remove the source of the protein.'),
    (v_case_id, 'Which slit-lamp finding helps differentiate Phacolytic Glaucoma from infectious or autoimmune anterior uveitis?', '["The absence of keratic precipitates (KPs) on the corneal endothelium despite heavy anterior chamber cell/flare", "The presence of a shallow anterior chamber and pupillary block", "The presence of iris transillumination defects in the mid-periphery", "An elevated, wrinkled grey retina with a horseshoe-shaped tear", "A Sampaolesi line in the anterior chamber angle on gonioscopy"]'::jsonb, 0, 'Phacolytic glaucoma is an open-angle glaucoma presenting with high IOP and cell/flare. A key clinical differentiator is the **absence of keratic precipitates (KPs)** on the corneal endothelium, despite what appears to be severe "inflammatory" cells in the anterior chamber. The "cells" are actually protein aggregates and macrophages, rather than primary inflammatory cells adhering to the endothelium.');

    ---------------------------------------------------------------------------
    -- CASE 48: Vignette: The Clouded Large Eyes (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Clouded Large Eyes (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Clouded Large Eyes (V5)', 'A 0-month-old infant is brought to the ophthalmology clinic by his mother due to constant tearing (epiphora), extreme sensitivity to light (photophobia), and frequent squeezing of the eyelids (blepharospasm) in both eyes. The mother notes the baby''s eyes look unusually large.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Poor fixation and following targets in both eyes.
*   **Ocular Examination (OU):** Severe corneal clouding and edema. The corneal diameters are enlarged, measuring 12.5 mm (normal infant diameter is <10.5 mm). Handheld slit-lamp exam under anesthesia reveals horizontal, linear breaks in Descemet''s membrane (Haab''s striae). IOP is 29 mmHg bilaterally.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 0-month-old infant is brought to the ophthalmology clinic by his mother due to constant tearing (epiphora), extreme sensitivity to light (photophobia), and frequent squeezing of the eyelids (blepharospasm) in both eyes. The mother notes the baby''s eyes look unusually large.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Poor fixation and following targets in both eyes.
*   **Ocular Examination (OU):** Severe corneal clouding and edema. The corneal diameters are enlarged, measuring 12.5 mm (normal infant diameter is <10.5 mm). Handheld slit-lamp exam under anesthesia reveals horizontal, linear breaks in Descemet''s membrane (Haab''s striae). IOP is 29 mmHg bilaterally.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary treatment?', '["Herpes simplex ophthalmia neonatorum; topical acyclovir gel and systemic acyclovir", "Retinoblastoma; immediate systemic chemotherapy or enucleation", "Congenital dacryostenosis; nasolacrimal duct probing and topical antibiotics", "Congenital cataract; urgent lens aspiration and intraocular lens implantation", "Primary congenital glaucoma; surgical intervention (e.g., goniotomy or trabeculotomy)"]'::jsonb, 4, 'This infant has **Primary Congenital Glaucoma**, characterized by the triad of **epiphora, photophobia, and blepharospasm**, along with corneal clouding, **buphthalmos** (enlarged eyes), and **Haab''s striae** (breaks in Descemet''s membrane). Treatment is **primarily surgical** (goniotomy or trabeculotomy) to physically open the malformed angle, as medical therapy is only an adjunct to clear the cornea before surgery.'),
    (v_case_id, 'What is the primary developmental defect responsible for Primary Congenital Glaucoma?', '["Dysgenesis of the trabecular meshwork and anterior chamber angle (Barkan''s membrane)", "In utero infection with Cytomegalovirus leading to uveal inflammation", "Autoimmune destruction of the scleral canal of Schlemm", "Failure of the nasolacrimal duct to canalize prior to birth", "Deposition of abnormal copper in Descemet''s membrane"]'::jsonb, 0, 'Primary congenital glaucoma is caused by **trabecular meshwork dysgenesis** (incomplete development of the trabecular meshwork and anterior chamber angle). A membrane-like tissue sheet (classically called Barkan''s membrane, though histologically representing compact trabecular tissue) blocks the outflow of aqueous humor, leading to high IOP in utero or shortly after birth.'),
    (v_case_id, 'Why do infants with congenital glaucoma develop abnormally large eyes (buphthalmos), whereas adults with high IOP do not?', '["The high pressure stimulates rapid bone growth of the surrounding orbit", "The infant lens swells and expands the entire anterior segment", "The infant sclera and cornea are highly elastic and stretch under high intraocular pressure", "Infants produce twice the volume of aqueous humor as adults, inflating the globe", "High IOP causes chronic hyperopia and axial length shortening"]'::jsonb, 2, 'In infants (under the age of 3), the collagen fibers of the **sclera and cornea are highly elastic and stretchable**. When exposed to high intraocular pressure, the entire globe stretches and enlarges, a condition known as **buphthalmos** ("ox eye"). In adults, the sclera is rigid and calcified, so high IOP does not cause enlargement of the globe.');

    ---------------------------------------------------------------------------
    -- CASE 49: Vignette: The Cost of Suppressed Inflammation (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Cost of Suppressed Inflammation (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Cost of Suppressed Inflammation (V5)', 'A 55-year-old female with a history of chronic anterior uveitis presents with a 2-week history of mild, painless blurry vision in her left eye. She has been using topical prednisolone acetate 1% drops 4 times daily in that eye for the past 3 months to prevent uveitis flare-ups.

**Physical Examination:**
*   **Vitals:** Temp: 98.9°F | HR: 70 bpm | BP: 131/85 mmHg
*   **Visual Acuity:** OS: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OS):** Cornea is clear. Anterior chamber is completely quiet (0 cells, 0 flare). Gonioscopy shows an open angle. Slit-lamp exam of the optic nerve reveals a cup-to-disc ratio of 0.90, with thinning of the superior and inferior neuroretinal rim. IOP is 33 mmHg. OS exam is completely normal with an IOP of 14 mmHg.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old female with a history of chronic anterior uveitis presents with a 2-week history of mild, painless blurry vision in her left eye. She has been using topical prednisolone acetate 1% drops 4 times daily in that eye for the past 3 months to prevent uveitis flare-ups.

**Physical Examination:**
*   **Vitals:** Temp: 98.9°F | HR: 70 bpm | BP: 131/85 mmHg
*   **Visual Acuity:** OS: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OS):** Cornea is clear. Anterior chamber is completely quiet (0 cells, 0 flare). Gonioscopy shows an open angle. Slit-lamp exam of the optic nerve reveals a cup-to-disc ratio of 0.90, with thinning of the superior and inferior neuroretinal rim. IOP is 33 mmHg. OS exam is completely normal with an IOP of 14 mmHg.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate initial management for this patient''s elevated intraocular pressure?', '["Prescribe oral prednisone 60 mg daily to systemically control the disease", "Increase the frequency of prednisolone drops to every hour to reduce trabecular inflammation", "Perform immediate surgical trabeculectomy with mitomycin C", "Taper and discontinue the topical prednisolone, switch to a ''soft'' steroid if needed, and initiate IOP-lowering drops", "Perform a laser peripheral iridotomy"]'::jsonb, 3, 'This patient has **Steroid-Induced Glaucoma**. The first step is to **taper and discontinue the offending corticosteroid** if the underlying uveitis is quiet. If corticosteroid therapy is still required, the patient should be switched to a "soft" steroid with less propensity to raise IOP (e.g., loteprednol, fluorometholone). Topical IOP-lowering agents (like latanoprost or timolol) should be initiated to protect the optic nerve while the steroid effect washes out.'),
    (v_case_id, 'What is the molecular mechanism by which corticosteroids increase intraocular pressure?', '["Promoting neovascularization of the anterior chamber angle", "Stimulating ciliary body beta-2 receptors, increasing aqueous secretion", "Directly blocking the lumen of Schlemm''s canal via microthrombi", "Causing swelling of the crystalline lens, leading to pupillary block", "Decreasing trabecular meshwork extracellular matrix clearance, increasing outflow resistance"]'::jsonb, 4, 'Corticosteroids increase IOP by **increasing resistance to aqueous outflow at the trabecular meshwork**. They do this by: (1) inhibiting the degradation of extracellular matrix (ECM) proteins, leading to glycosaminoglycan accumulation, (2) increasing expression of myocilin protein, and (3) causing morphologic changes in trabecular meshwork cells (e.g., forming cross-linked actin networks) that decrease their filtering capacity.'),
    (v_case_id, 'Which patient population is at the HIGHEST risk of being a high ''steroid responder'' (developing high IOP after steroid use)?', '["Patients with hyperopia and shallow anterior chambers", "Patients with a personal or first-degree family history of primary open-angle glaucoma, and high myopes", "Infants with congenital nasolacrimal duct obstruction", "Patients with a history of HLA-B27 positive ankylosing spondylitis", "Young males with pigment dispersion syndrome"]'::jsonb, 1, 'The risk of developing a steroid-induced IOP spike is significantly higher in **patients with POAG (over 90% are responders)**, first-degree relatives of POAG patients, high myopes, patients with connective tissue diseases (like rheumatoid arthritis), and very young or very old patients. These populations must be monitored closely whenever started on steroid drops.');

    ---------------------------------------------------------------------------
    -- CASE 50: Vignette: The Side Effects of Therapy (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Side Effects of Therapy (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Side Effects of Therapy (V5)', 'A 62-year-old male with bilateral primary open-angle glaucoma presents to his primary care physician complaining of worsening shortness of breath, wheezing, and fatigue. He was started on a new eye drop by his ophthalmologist 2 weeks ago. He has a history of moderate asthma.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 77 bpm (bradycardia) | BP: 110/70 mmHg | RR: 17/min
*   **Pulmonary:** Bilateral expiratory wheezing and prolonged expiratory phase on auscultation.
*   **Ocular Examination:** Bilateral quiet eyes, IOPs are well-controlled at 14 mmHg OU.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 62-year-old male with bilateral primary open-angle glaucoma presents to his primary care physician complaining of worsening shortness of breath, wheezing, and fatigue. He was started on a new eye drop by his ophthalmologist 2 weeks ago. He has a history of moderate asthma.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 77 bpm (bradycardia) | BP: 110/70 mmHg | RR: 17/min
*   **Pulmonary:** Bilateral expiratory wheezing and prolonged expiratory phase on auscultation.
*   **Ocular Examination:** Bilateral quiet eyes, IOPs are well-controlled at 14 mmHg OU.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following glaucoma medications is most likely responsible for this patient''s systemic symptoms?', '["Dorzolamide (carbonic anhydrase inhibitor)", "Latanoprost (prostaglandin analog)", "Brimonidine (alpha-2 agonist)", "Timolol (non-selective beta-blocker)", "Pilocarpine (parasympathomimetic)"]'::jsonb, 3, 'The patient''s presentation of asthma exacerbation (wheezing, dyspnea) and bradycardia (HR <60) after starting a new eye drop is classic for **Timolol**, a non-selective beta-adrenergic antagonist. Topical eye drops undergo mucosal absorption through the nasolacrimal duct, bypassing first-pass hepatic metabolism and achieving significant systemic levels. Timolol blocks beta-2 receptors in the bronchioles, causing life-threatening bronchospasm in asthmatics, and beta-1 receptors in the heart, causing bradycardia and heart block.'),
    (v_case_id, 'The patient''s timolol is discontinued. The ophthalmologist decides to switch to a prostaglandin analog (e.g., latanoprost). Which local side effect should the patient be educated about?', '["Bitter taste and corneal endothelial deposits", "Severe allergic follicular conjunctivitis and contact dermatitis", "Increased brown pigmentation of the iris, lengthening and darkening of eyelashes, and orbital fat atrophy", "Dry mouth, drowsiness, and headache", "Pupillary constriction (miosis), brow ache, and transient myopia"]'::jsonb, 2, 'Topical **prostaglandin analogs** (latanoprost, bimatoprost) have well-known cosmetic and local side effects: (1) **increased iris pigmentation** (turning blue/green eyes brown due to increased melanin production), (2) **hypertrichosis** (eyelash lengthening, thickening, and darkening), and (3) **prostaglandin-associated periorbitopathy** (orbital fat atrophy, causing a sunken eye appearance/deepening of the lid sulcus).'),
    (v_case_id, 'Another patient is started on Brimonidine (an alpha-2 agonist) and develops severe red eyes. What is the classic local side effect of Brimonidine that necessitates drug discontinuation?', '["Intraoperative floppy iris syndrome", "Macular edema in aphakic patients", "Allergic follicular conjunctivitis", "Corneal stromal melting", "Posterior synechiae formation"]'::jsonb, 2, 'Topical **Brimonidine** (an alpha-2 adrenergic agonist) is notorious for causing **allergic follicular conjunctivitis** or contact blepharoconjunctivitis in up to 15-20% of patients. It typically presents as delayed redness, severe itching, and follicles in the inferior palpebral conjunctiva, requiring discontinuation of the drug. Brimonidine also crosses the blood-brain barrier and can cause systemic somnolence/fatigue and is contraindicated in infants due to risk of central apnea and coma.');

END $$;
COMMIT;
