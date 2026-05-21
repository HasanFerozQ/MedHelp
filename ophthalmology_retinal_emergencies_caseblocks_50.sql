-- Ophthalmology: Retinal Emergency
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: optho-retinal-emergencies

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'optho-retinal-emergencies' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'optho-retinal-emergencies';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: The Falling Curtain (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Falling Curtain (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Falling Curtain (V1)', 'A 51-year-old male presents with a sudden onset of flashes of light (photopsias) and a shower of small dark floaters in the right eye, followed by a dark curtain-like shadow descending over the upper half of his vision. He has a history of high myopia.

**Physical Examination:**
*   **Vitals:** Temp: 98.9°F | HR: 72 bpm | BP: 117/79 mmHg
*   **Visual Acuity:** OD: 20/200 (no improvement with pinhole); OS: 20/20
*   **Ocular Examination (OD):** Anterior chamber is quiet. Slit-lamp exam of the anterior vitreous reveals small, brown-pigmented cells ("tobacco dust" or Shafer''s sign). Dilated fundus exam reveals a grey, elevated, corrugated, and wrinkled retina in the inferior-temporal sector with a large, crescentic horseshoe-shaped retinal tear.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 51-year-old male presents with a sudden onset of flashes of light (photopsias) and a shower of small dark floaters in the right eye, followed by a dark curtain-like shadow descending over the upper half of his vision. He has a history of high myopia.

**Physical Examination:**
*   **Vitals:** Temp: 98.9°F | HR: 72 bpm | BP: 117/79 mmHg
*   **Visual Acuity:** OD: 20/200 (no improvement with pinhole); OS: 20/20
*   **Ocular Examination (OD):** Anterior chamber is quiet. Slit-lamp exam of the anterior vitreous reveals small, brown-pigmented cells ("tobacco dust" or Shafer''s sign). Dilated fundus exam reveals a grey, elevated, corrugated, and wrinkled retina in the inferior-temporal sector with a large, crescentic horseshoe-shaped retinal tear.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the immediate management?', '["Central retinal artery occlusion; immediate ocular massage and hyperbaric oxygen", "Rhegmatogenous retinal detachment; urgent ophthalmology referral for surgical repair", "Acute retinal necrosis; immediate intravenous acyclovir", "Vitreous hemorrhage; bed rest and head elevation of 45 degrees", "Dry age-related macular degeneration; high-dose AREDS2 vitamins"]'::jsonb, 1, 'This patient has a classic **Rhegmatogenous Retinal Detachment (RRD)** with a visible horseshoe tear. The presence of flashes, floaters, and a "curtain" visual field loss are hallmarks. The immediate management is an **urgent referral to an ophthalmologist** for surgical reattachment (e.g., vitrectomy, scleral buckle, or pneumatic retinopexy) to prevent permanent macular visual loss (if macula is "on").'),
    (v_case_id, 'What is the pathophysiological mechanism responsible for this specific type of retinal detachment?', '["Vitreous liquefaction and traction create a full-thickness retinal tear, allowing liquefied vitreous to enter the subretinal space", "Contraction of retroretinal fibrous membranes pulling the neurosensory retina away from the pigment epithelium", "Hypersecretion of subretinal fluid by hypertrophied retinal pigment epithelial cells", "Exudative leakage of fluid from choroidal vessels directly into the subretinal space due to high systemic pressure", "A direct vascular tear causing blood accumulation that mechanically dissects the retina"]'::jsonb, 0, 'Rhegmatogenous RD (from *rhegma*, meaning tear) occurs when **vitreous liquefaction (synchysis)** and **vitreous traction** lead to a posterior vitreous detachment (PVD) that pulls on and tears the retina. Liquefied vitreous then passes through the tear into the subretinal space, separating the neurosensory retina from the underlying retinal pigment epithelium (RPE).'),
    (v_case_id, 'What does the clinical sign of ''tobacco dust'' (Shafer''s sign) in the anterior vitreous represent?', '["Pigmented retinal pigment epithelial (RPE) cells released into the vitreous following a retinal tear", "Clumps of white blood cells indicating an active vitritis", "Deposits of amyloid protein on the posterior vitreous face", "Calcified deposits on the lens zonules", "Degenerated red blood cells from a vitreous hemorrhage"]'::jsonb, 0, '**Shafer''s sign** ("tobacco dust") represents **pigmented RPE cells** that have escaped through a full-thickness retinal tear into the vitreous cavity. It is a highly specific sign of a retinal tear or detachment, even if the tear itself is not immediately visible.');

    ---------------------------------------------------------------------------
    -- CASE 02: The Pale Retina and Cherry-Red Spot (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pale Retina and Cherry-Red Spot (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pale Retina and Cherry-Red Spot (V1)', 'A 66-year-old female with a history of hypertension, hyperlipidemia, and coronary artery disease presents with a sudden, complete, painless loss of vision in the left eye that occurred 5 hours ago. She denies any preceding trauma or ocular symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 77 bpm | BP: 127/83 mmHg
*   **Visual Acuity:** OS: Count Fingers; contralateral eye: 20/20
*   **Ocular Examination (OS):** A positive relative afferent pupillary defect (APD). Dilated fundus examination reveals marked, generalized pallor and edema of the retina, except for a bright, circumscribed "cherry-red spot" in the central fovea. The retinal arterioles are severely narrowed, and segmenting blood columns ("box-carring") are visible.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 66-year-old female with a history of hypertension, hyperlipidemia, and coronary artery disease presents with a sudden, complete, painless loss of vision in the left eye that occurred 5 hours ago. She denies any preceding trauma or ocular symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 77 bpm | BP: 127/83 mmHg
*   **Visual Acuity:** OS: Count Fingers; contralateral eye: 20/20
*   **Ocular Examination (OS):** A positive relative afferent pupillary defect (APD). Dilated fundus examination reveals marked, generalized pallor and edema of the retina, except for a bright, circumscribed "cherry-red spot" in the central fovea. The retinal arterioles are severely narrowed, and segmenting blood columns ("box-carring") are visible.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the initial emergency management?', '["Rhegmatogenous retinal detachment; pneumatic retinopexy", "Giant cell arteritis; high-dose oral prednisone monotherapy", "Central retinal vein occlusion (CRVO); intravitreal anti-VEGF injection within 24 hours", "Central retinal artery occlusion (CRAO); ocular massage, hyperventilate into a paper bag, or AC paracentesis", "Vitreous hemorrhage; urgent pars plana vitrectomy"]'::jsonb, 3, 'This is a classic **Central Retinal Artery Occlusion (CRAO)**. It is an ocular emergency analogous to an ischemic stroke. Initial management (within 4 hours of onset) aims to dislodge the embolus and restore perfusion by lowering IOP (via **ocular massage**, **anterior chamber paracentesis**, or IV acetazolamide) or causing vasodilation (breathing into a paper bag to raise CO2 levels).'),
    (v_case_id, 'Why does a ''cherry-red spot'' appear in the macula of patients with Central Retinal Artery Occlusion?', '["The cherry-red spot represents the embolus itself wedged in the macular arteriole", "The thin foveola lacks inner retinal layers and is supplied by the underlying choroid, which shines red against the pale, ischemic surrounding retina", "Severe localized inflammation of the macular photoreceptors", "Selective hyper-perfusion of the fovea by a patent cilioretinal artery", "A localized pool of blood accumulates in the subretinal space directly beneath the fovea"]'::jsonb, 1, 'The **cherry-red spot** appears because the foveola is extremely thin and lacks the inner retinal layers (ganglion cells, nerve fibers) that become pale, swollen, and edematous when ischemic. Because the foveola is supplied primarily by the underlying choriocapillaris (which is fed by the ciliary arteries, not the blocked central retinal artery), the vascular choroid continues to shine red through the thin, transparent foveal tissue, contrasting with the pale, opaque surrounding retina.'),
    (v_case_id, 'Which of the following diagnostic workups is most critical in this patient to prevent life-threatening stroke or myocardial infarction?', '["Temporal artery biopsy", "Brain MRI with contrast", "Fluorescein angiography of both eyes", "Carotid duplex ultrasound and echocardiogram", "Coagulation panel including Factor V Leiden"]'::jsonb, 3, 'The most common cause of non-arteritic CRAO is an **embolus originating from an ulcerated carotid artery plaque (Hollenhorst plaque) or the heart**. Therefore, a cardiovascular workup consisting of **carotid duplex ultrasound** and an **echocardiogram** is mandatory to identify source lesions and prevent a subsequent stroke or MI.');

    ---------------------------------------------------------------------------
    -- CASE 03: The Blood and Thunder Fundus (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blood and Thunder Fundus (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blood and Thunder Fundus (V1)', 'A 60-year-old male with a long history of poorly controlled hypertension and glaucoma presents with a subacute, painless decrease in vision in his left eye over the past 2 days.

**Physical Examination:**
*   **Vitals:** Temp: 98.1°F | HR: 84 bpm | BP: 126/78 mmHg
*   **Visual Acuity:** OS: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OS):** Mild APD. Dilated fundus exam reveals widespread, diffuse flame-shaped and dot-and-blot hemorrhages in all four quadrants ("blood and thunder fundus"), along with severely tortuous and dilated retinal veins, scattered cotton-wool spots, and significant optic disc and macular edema.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old male with a long history of poorly controlled hypertension and glaucoma presents with a subacute, painless decrease in vision in his left eye over the past 2 days.

**Physical Examination:**
*   **Vitals:** Temp: 98.1°F | HR: 84 bpm | BP: 126/78 mmHg
*   **Visual Acuity:** OS: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OS):** Mild APD. Dilated fundus exam reveals widespread, diffuse flame-shaped and dot-and-blot hemorrhages in all four quadrants ("blood and thunder fundus"), along with severely tortuous and dilated retinal veins, scattered cotton-wool spots, and significant optic disc and macular edema.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Central retinal vein occlusion (CRVO)", "Acute retinal necrosis", "Proliferative diabetic retinopathy with vitreous hemorrhage", "Central retinal artery occlusion (CRAO)", "Hypertensive crisis with Grade IV retinopathy"]'::jsonb, 0, 'This presentation is diagnostic of a **Central Retinal Vein Occlusion (CRVO)**. The hallmark funduscopic finding is the **''blood and thunder'' appearance** (widespread hemorrhages in all 4 quadrants, tortuous dilated veins, disc edema, and cotton-wool spots). It is a venous thrombosis typically occurring at the level of the lamina cribrosa.'),
    (v_case_id, 'What is the primary cause of severe, long-term visual loss in patients with Central Retinal Vein Occlusion?', '["Total retinal detachment due to subretinal fluid accumulation", "Optic nerve atrophy from direct mechanical venous compression", "Autoimmune destruction of the retinal pigment epithelium", "Macular edema due to vascular leakage and capillary incompetence", "Corneal edema from chronic secondary glaucoma"]'::jsonb, 3, 'The most common cause of persistent, long-term visual loss in patients with CRVO is **macular edema** driven by capillary leakage and increased intravascular pressure. High venous pressure triggers blood-retinal barrier breakdown and release of VEGF, leading to chronic fluid accumulation in the macula.'),
    (v_case_id, 'This patient must be monitored closely for ''90-day glaucoma'' (neovascular glaucoma). What drives this complication in ischemic CRVO?', '["Anterior uveitis causes pupillary block synechiae", "The thrombus in the central retinal vein back-pressures into the vortex veins, blocking outflow", "Widespread retinal ischemia triggers VEGF release, which stimulates new blood vessel growth in the iris and angle", "Chronic blood breakdown products block the trabecular meshwork", "Persistent systemic hypertension pushes the lens-iris diaphragm forward"]'::jsonb, 2, 'In ischemic CRVO (defined by large areas of capillary non-perfusion on fluorescein angiography), severe **retinal ischemia** triggers the release of **VEGF**. VEGF diffuses into the anterior segment, causing neovascularization of the iris (rubeosis iridis) and angle, which eventually leads to **neovascular glaucoma** (classically appearing around 90 days, hence "90-day glaucoma").');

    ---------------------------------------------------------------------------
    -- CASE 04: The Wavy Lines and Central Dark Spot (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Wavy Lines and Central Dark Spot (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Wavy Lines and Central Dark Spot (V1)', 'A 79-year-old female presents with a sudden onset of distortion in her central vision in the right eye. She complains that straight lines (like doorframes) appear wavy and bent, and she has difficulty reading. She has a long history of dry macular degeneration in both eyes.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 69 bpm | BP: 122/81 mmHg
*   **Visual Acuity:** OD: 20/120; contralateral eye: 20/30
*   **Ocular Examination (OD):** Testing with an Amsler grid confirms significant metamorphopsia (wavy lines) and a central scotoma. Dilated fundus examination reveals multiple, large soft yellowish drusen in the macula, along with a grey-green subretinal elevation, subretinal fluid, and a localized pocket of subretinal hemorrhage in the central fovea.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 79-year-old female presents with a sudden onset of distortion in her central vision in the right eye. She complains that straight lines (like doorframes) appear wavy and bent, and she has difficulty reading. She has a long history of dry macular degeneration in both eyes.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 69 bpm | BP: 122/81 mmHg
*   **Visual Acuity:** OD: 20/120; contralateral eye: 20/30
*   **Ocular Examination (OD):** Testing with an Amsler grid confirms significant metamorphopsia (wavy lines) and a central scotoma. Dilated fundus examination reveals multiple, large soft yellowish drusen in the macula, along with a grey-green subretinal elevation, subretinal fluid, and a localized pocket of subretinal hemorrhage in the central fovea.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following represents the most appropriate first-line treatment for this patient''s current condition?', '["High-dose antioxidant vitamins and zinc (AREDS2 formulation) alone", "Surgical subretinal membrane scraping and vitrectomy", "Intravitreal injections of anti-Vascular Endothelial Growth Factor (anti-VEGF) agents (e.g., aflibercept)", "Topical prednisolone acetate 1% drops hourly", "Laser photocoagulation of the central foveal hemorrhage"]'::jsonb, 2, 'The patient has transitioned from dry to **neovascular (''wet'') Age-Related Macular Degeneration (Wet AMD)**, evidenced by sudden metamorphopsia (wavy lines), subretinal fluid, and hemorrhage. The standard of care is **intravitreal anti-VEGF injections** (e.g., ranibizumab, aflibercept, bevacizumab), which bind VEGF, stopping neovascularization and reducing vascular leakage, often restoring or stabilizing vision. AREDS2 vitamins are for dry AMD and do not treat active choroidal neovascular membranes.'),
    (v_case_id, 'What is the key pathophysiological development that distinguishes ''wet'' AMD from ''dry'' AMD?', '["Progressive geographic atrophy of the retinal pigment epithelium and photoreceptors", "A sudden mechanical tear in the neurosensory retina due to vitreous traction", "Growth of abnormal choroidal vessels through Bruch''s membrane into the subretinal space (choroidal neovascularization)", "Accumulation of extracellular lipofuscin-rich debris (drusen) in the extracellular space", "Occlusion of the central retinal vein at the optic disc"]'::jsonb, 2, 'The defining feature of Wet AMD is **choroidal neovascularization (CNV)**. Unlike Dry AMD, which involves slow atrophy of the RPE and photoreceptors, Wet AMD involves the growth of **abnormal, fragile blood vessels from the choriocapillaris** through breaks in **Bruch''s membrane** into the sub-RPE or subretinal space. These vessels leak fluid, protein, and blood, leading to rapid, severe visual loss.'),
    (v_case_id, 'Which of the following clinical tests is most appropriate for patients with dry AMD to perform at home for early detection of conversion to wet AMD?', '["Checking color vision with Ishihara plates weekly", "Frequent self-tonometry using a hand-held tonometer", "Amsler grid testing daily", "Measuring visual acuity using a Snellen pocket card", "Self-assessment of peripheral visual field boundaries"]'::jsonb, 2, 'Patients with Dry AMD are instructed to use an **Amsler grid daily** to monitor for early signs of Wet AMD. Metamorphopsia (distortion where straight lines appear wavy) or a new central dark spot (scotoma) on the grid are early signs of subretinal fluid or hemorrhage, prompting immediate evaluation and anti-VEGF therapy.');

    ---------------------------------------------------------------------------
    -- CASE 05: The Progressive Central Blindness (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Progressive Central Blindness (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Progressive Central Blindness (V1)', 'A 76-year-old male smoker presents with a 2-year history of slowly progressive, bilateral loss of central vision, making it hard to read, sew, or recognize faces. He reports no sudden changes in vision, pain, or flashes of light.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 70 bpm | BP: 126/78 mmHg
*   **Visual Acuity:** OD: 20/50; OS: 20/40 (with correction)
*   **Ocular Examination:** Anterior segments are clear. Amsler grid shows no metamorphopsia (lines are straight) but a mild central blur bilaterally. Dilated fundus examination reveals multiple, bilateral, scattered small and large yellowish-white extracellular deposits (drusen) in the macula, along with localized areas of depigmentation and thinning of the retinal pigment epithelium (geographic atrophy). No subretinal fluid or hemorrhage is present.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 76-year-old male smoker presents with a 2-year history of slowly progressive, bilateral loss of central vision, making it hard to read, sew, or recognize faces. He reports no sudden changes in vision, pain, or flashes of light.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 70 bpm | BP: 126/78 mmHg
*   **Visual Acuity:** OD: 20/50; OS: 20/40 (with correction)
*   **Ocular Examination:** Anterior segments are clear. Amsler grid shows no metamorphopsia (lines are straight) but a mild central blur bilaterally. Dilated fundus examination reveals multiple, bilateral, scattered small and large yellowish-white extracellular deposits (drusen) in the macula, along with localized areas of depigmentation and thinning of the retinal pigment epithelium (geographic atrophy). No subretinal fluid or hemorrhage is present.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the recommended management?', '["Nuclear cataract; urgent surgical cataract extraction", "Toxic retinopathy; immediate discontinuation of hydroxychloroquine", "Primary open-angle glaucoma; topical prostaglandin drops", "Dry age-related macular degeneration; AREDS2 vitamin formulation and smoking cessation", "Wet age-related macular degeneration; urgent intravitreal anti-VEGF therapy"]'::jsonb, 3, 'This patient has **Dry Age-Related Macular Degeneration (Dry AMD)**, characterized by progressive central vision loss, geographic atrophy, and **drusen** without fluid or blood. The recommended management for intermediate/advanced dry AMD is the **AREDS2 vitamin formulation** (antioxidant vitamins C, E, zinc, copper, lutein, and zeaxanthin) to slow progression to advanced stages, along with **smoking cessation** (as smoking is the strongest modifiable risk factor).'),
    (v_case_id, 'What represents the substance known as ''drusen'' that accumulates in this condition?', '["Abnormal collagen fibers deposited within the stroma of the cornea", "Small microaneurysms that have thrombosed and calcified", "Protein complexes leaking from the vitreous humor", "Aggregates of inflammatory cells adhering to the corneal endothelium", "Extracellular debris including lipofuscin, proteins, and lipids accumulating between the RPE and Bruch''s membrane"]'::jsonb, 4, '**Drusen** are **yellowish extracellular deposits** consisting of undigested cellular waste products (like lipofuscin), proteins, and lipids that accumulate in the extracellular space between the **retinal pigment epithelium (RPE) and Bruch''s membrane**. Their accumulation disrupts RPE function and leads to secondary degeneration of the overlying photoreceptors.'),
    (v_case_id, 'Why was beta-carotene removed and replaced with Lutein and Zeaxanthin in the AREDS2 clinical trial formulation?', '["Beta-carotene interfered with the absorption of zinc and copper", "Beta-carotene caused severe corneal endothelial deposits", "Lutein has superior activity against choroidal neovascularization", "Beta-carotene was found to significantly increase the risk of lung cancer in smokers", "Lutein and Zeaxanthin were found to lower intraocular pressure"]'::jsonb, 3, 'Beta-carotene was replaced with **Lutein and Zeaxanthin** in the AREDS2 formulation because large clinical trials (like the CARET and ATBC studies) demonstrated that **beta-carotene significantly increases the risk of lung cancer in smokers**. Since many AMD patients have a history of smoking, removing beta-carotene made the formulation safer while maintaining efficacy.');

    ---------------------------------------------------------------------------
    -- CASE 06: The Floating Red Cobwebs (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Floating Red Cobwebs (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Floating Red Cobwebs (V1)', 'A 67-year-old male with a 15-year history of insulin-dependent diabetes presents with a sudden onset of multiple floating dark spots and red cobweb-like lines in the left eye, followed by severe, painless blurring of vision. He has had no eye trauma.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 74 bpm | BP: 124/80 mmHg
*   **Visual Acuity:** OS: 20/400; contralateral eye: 20/25
*   **Ocular Examination (OS):** The red reflex is severely dim/absent. Slit-lamp exam shows clear cornea and a quiet anterior chamber. On dilated exam, the vitreous cavity is filled with suspended red blood cells, completely obscuring the details of the optic nerve and retinal vasculature. Contralateral eye shows proliferative diabetic retinopathy with neovascularization.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 67-year-old male with a 15-year history of insulin-dependent diabetes presents with a sudden onset of multiple floating dark spots and red cobweb-like lines in the left eye, followed by severe, painless blurring of vision. He has had no eye trauma.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 74 bpm | BP: 124/80 mmHg
*   **Visual Acuity:** OS: 20/400; contralateral eye: 20/25
*   **Ocular Examination (OS):** The red reflex is severely dim/absent. Slit-lamp exam shows clear cornea and a quiet anterior chamber. On dilated exam, the vitreous cavity is filled with suspended red blood cells, completely obscuring the details of the optic nerve and retinal vasculature. Contralateral eye shows proliferative diabetic retinopathy with neovascularization.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the initial management step?', '["Vitreous hemorrhage; elevate the head of the bed, perform ocular ultrasound (B-scan) to rule out retinal detachment, and observe", "Central retinal artery occlusion; perform urgent anterior chamber paracentesis", "Acute angle-closure glaucoma; administer IV acetazolamide", "Rhegmatogenous retinal detachment; perform immediate pneumatic retinopexy", "CMV retinitis; initiate systemic and intravitreal ganciclovir"]'::jsonb, 0, 'This patient has a **Vitreous Hemorrhage**, a common complication of **Proliferative Diabetic Retinopathy**. The initial steps are: (1) **elevate the head of the bed (30-45 degrees)** to allow the blood to settle inferiorly, clearing the visual axis, (2) perform an **ocular B-scan ultrasound** to ensure the underlying retina is flat and not detached (since the fundus cannot be visualized), and (3) observe, as many hemorrhages clear spontaneously over weeks to months.'),
    (v_case_id, 'What is the primary anatomical source of blood in a diabetic patient presenting with a vitreous hemorrhage?', '["A full-thickness retinal tear that shears a healthy retinal arteriole", "A tear in a major branch retinal vein due to severe systemic hypertension", "Rupture of ciliary body capillaries due to high intraocular pressure", "Bleeding from abnormal choroidal neovascular membranes through Bruch''s membrane", "Fragile, abnormal new vessels (neovascularization) growing along the vitreous face and retina that rupture easily"]'::jsonb, 4, 'In diabetes, **vitreous hemorrhage** is caused by the **rupture of fragile neovascular vessels (NVD or NVE)**. These abnormal vessels lack a normal muscular coat and tight endothelial junctions, making them extremely fragile. When the vitreous contracts or moves, it exerts traction on these vessels, causing them to tear and bleed directly into the vitreous cavity.'),
    (v_case_id, 'In which of the following scenarios is an URGENT pars plana vitrectomy indicated for a patient with a vitreous hemorrhage?', '["The presence of a tractional or rhegmatogenous retinal detachment on B-scan ultrasound, or non-clearing hemorrhage >3-6 months", "An elevated intraocular pressure of 22 mmHg in the affected eye", "The presence of dry age-related macular degeneration in the contralateral eye", "Any vitreous hemorrhage in a patient with a history of hypertension", "The presence of hard lipid exudates on the retinal surface"]'::jsonb, 0, 'An **urgent pars plana vitrectomy** is indicated if: (1) **B-scan ultrasound reveals an associated retinal detachment (tractional or rhegmatogenous)**, (2) the hemorrhage fails to clear after 3 to 6 months of conservative observation, preventing visual recovery and treatment, or (3) neovascularization of the iris/angle (rubeosis) develops, requiring clear media to perform PRP.');

    ---------------------------------------------------------------------------
    -- CASE 07: The AIDS-Related Blindness (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The AIDS-Related Blindness (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The AIDS-Related Blindness (V1)', 'A 33-year-old male with HIV presents with a 1-week history of floaters, flashes of light, and blurred vision in the right eye. He admits to non-compliance with antiretroviral therapy (ART). His CD4 count is 16 cells/mcL.

**Physical Examination:**
*   **Vitals:** Temp: 99.0°F | HR: 72 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OD: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior chamber is quiet. Vitreous shows minimal inflammatory cells (1+). Dilated fundus examination reveals multiple, confluent, thick, yellow-white necrotic retinal lesions with perivascular sheathing and extensive, flame-shaped retinal hemorrhages along the vascular arches, giving a "pizza-pie" or "scrambled eggs and ketchup" appearance.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 33-year-old male with HIV presents with a 1-week history of floaters, flashes of light, and blurred vision in the right eye. He admits to non-compliance with antiretroviral therapy (ART). His CD4 count is 16 cells/mcL.

**Physical Examination:**
*   **Vitals:** Temp: 99.0°F | HR: 72 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OD: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior chamber is quiet. Vitreous shows minimal inflammatory cells (1+). Dilated fundus examination reveals multiple, confluent, thick, yellow-white necrotic retinal lesions with perivascular sheathing and extensive, flame-shaped retinal hemorrhages along the vascular arches, giving a "pizza-pie" or "scrambled eggs and ketchup" appearance.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the first-line therapy?', '["Bacterial endophthalmitis; intravitreal vancomycin and ceftazidime", "Toxoplasma chorioretinitis; pyrimethamine, sulfadiazine, and folinic acid", "Acute retinal necrosis (ARN); intravenous acyclovir and oral valacyclovir", "Syphilitic chorioretinitis; intravenous penicillin G for 14 days", "Cytomegalovirus (CMV) retinitis; systemic valganciclovir and/or intravitreal ganciclovir, plus initiation of ART"]'::jsonb, 4, 'This patient has **CMV Retinitis**, the most common opportunistic ocular infection in AIDS patients, typically occurring when the **CD4 count is <50 cells/mcL**. The classic fundus appearance is a **"pizza-pie" or "scrambled eggs and ketchup" pattern** of yellow-white necrotic lesions and massive hemorrhages. First-line therapy consists of **antivirals (ganciclovir/valganciclovir or foscarnet)** administered systemically and/or intravitreally, along with the **initiation or optimization of ART**.'),
    (v_case_id, 'Why is there typically very little vitreous cell or anterior chamber inflammation (vitritis/iritis) seen in patients with active CMV retinitis?', '["CMV produces potent anti-inflammatory cytokines that suppress local T-cells", "The virus is physically restricted to the subretinal space", "The severe immunosuppression prevents the host from mounting an inflammatory response (quiet vitreous)", "CMV selectively infects only the outer photoreceptors, sparing vascular structures", "The blood-aqueous barrier is completely impermeable to CMV antigens"]'::jsonb, 2, 'Active CMV retinitis characteristically presents with **minimal vitreous or anterior segment inflammation (quiet vitreous)**. This is because patients are **severely immunocompromised (CD4 < 50)** and cannot mount a cellular inflammatory response. If the immune system recovers (e.g., after starting ART), a massive inflammatory reaction can occur, known as **Immune Reconstitution Inflammatory Syndrome (IRIS)**, presenting as severe vitritis and macular edema.'),
    (v_case_id, 'What is the most common vision-threatening complication of CMV retinitis, occurring in up to 30% of patients?', '["Neovascular glaucoma", "Corneal stromal necrosis", "Rhegmatogenous retinal detachment", "Tractional retinal detachment", "Sympathetic ophthalmia"]'::jsonb, 2, 'The most common and feared complication of CMV retinitis is **rhegmatogenous retinal detachment**. The CMV virus causes full-thickness **necrosis and thinning of the retina**, leaving behind fragile, paper-thin necrotic tissue. As the vitreous contracts or pulls, multiple peripheral retinal holes and tears easily form, leading to a high rate of RRD that often requires complex surgery with silicone oil tamponade.');

    ---------------------------------------------------------------------------
    -- CASE 08: The Painful Confluent Necrosis (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Painful Confluent Necrosis (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Painful Confluent Necrosis (V1)', 'A healthy, immunocompetent 42-year-old female presents with a 4-day history of severe, boring pain, redness, photophobia, and rapidly worsening vision in the left eye. She has no systemic symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 68 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OS):** Moderate episcleral injection. Slit-lamp shows 2+ granulomatous keratic precipitates on the corneal endothelium and 2+ cell/flare in the anterior chamber. There is significant **vitritis (3+)** obscuring the fundus. Dilated fundus examination reveals confluent, patch-like areas of yellowish-white peripheral retinal necrosis that are spreading circumferentially, with prominent retinal arteritis (perivascular sheathing).', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A healthy, immunocompetent 42-year-old female presents with a 4-day history of severe, boring pain, redness, photophobia, and rapidly worsening vision in the left eye. She has no systemic symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 68 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OS):** Moderate episcleral injection. Slit-lamp shows 2+ granulomatous keratic precipitates on the corneal endothelium and 2+ cell/flare in the anterior chamber. There is significant **vitritis (3+)** obscuring the fundus. Dilated fundus examination reveals confluent, patch-like areas of yellowish-white peripheral retinal necrosis that are spreading circumferentially, with prominent retinal arteritis (perivascular sheathing).', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary causative pathogen?', '["Acute Retinal Necrosis (ARN); Varicella-Zoster Virus (VZV) or Herpes Simplex Virus (HSV)", "Vogt-Koyanagi-Harada disease; autoimmune reaction to melanocytes", "Toxocariasis; Toxocara canis roundworm infection", "Endogenous bacterial endophthalmitis; Staphylococcus aureus", "CMV retinitis; Cytomegalovirus in a patient with undiagnosed AIDS"]'::jsonb, 0, 'This is **Acute Retinal Necrosis (ARN)**, which characteristically occurs in **immunocompetent** hosts. It is caused by herpesviruses, most commonly **Varicella-Zoster Virus (VZV)** or **Herpes Simplex Virus (HSV-1 or HSV-2)**. Key clinical features include: (1) severe ocular pain and redness, (2) severe **vitritis** (unlike CMV), and (3) confluent, peripheral **yellowish-white retinal necrosis** with retinal arteritis. Treatment is an emergency, requiring IV acyclovir or oral valacyclovir, combined with intravitreal ganciclovir.'),
    (v_case_id, 'Why is systemic corticosteroid therapy often used as an adjunct in the treatment of Acute Retinal Necrosis, and when should it be initiated?', '["Corticosteroids are strictly contraindicated because they promote viral replication in the retina", "Corticosteroids are started immediately before antivirals to open the blood-retinal barrier", "Corticosteroids are used as monotherapy to suppress the autoimmune destruction of the retina", "Corticosteroids are started 24-48 hours after antiviral therapy to reduce the severe, vision-threatening vitreous inflammation", "Corticosteroids are used to prevent systemic viral spreading to the brain"]'::jsonb, 3, 'Systemic **corticosteroids** (prednisone) are used as an adjunct to **reduce the severe, vision-threatening vitritis** and vascular inflammation associated with ARN. However, they must **never be given alone or before antivirals**. They are initiated **24 to 48 hours AFTER adequate antiviral therapy** has begun, ensuring that the viral replication is controlled so that steroids do not promote uncontrolled necrotizing viral spread.'),
    (v_case_id, 'What is the most common long-term complication of Acute Retinal Necrosis, occurring in over 75% of untreated patients?', '["Rhegmatogenous retinal detachment due to peripheral retinal holes", "Sympathetic ophthalmia in the contralateral eye", "Neovascular glaucoma from persistent retinal ischemia", "Tractional retinal detachment due to fibrovascular membranes", "Phacolytic glaucoma from lens protein leakage"]'::jsonb, 0, 'The most common and devastating complication of ARN is **rhegmatogenous retinal detachment**, occurring in **75-85% of untreated cases**. As the large, confluent zones of peripheral necrotic retina heal, they become paper-thin and develop **multiple, large, irregular tears and holes**. The severe vitritis also causes vitreous condensation and traction, pulling the torn retina off. Prophylactic laser retinopexy is often performed around necrotic areas to prevent this.');

    ---------------------------------------------------------------------------
    -- CASE 09: The Segmental Shadow (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Segmental Shadow (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Segmental Shadow (V1)', 'A 61-year-old male with a history of carotid artery disease and smoking presents with a sudden, painless loss of the upper half of his visual field in the right eye that occurred 2 hours ago. His central vision is only mildly blurry.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 70 bpm | BP: 129/77 mmHg
*   **Visual Acuity:** OD: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OD):** No APD (or trace APD). Dilated fundus exam reveals a sharply demarcated, wedge-shaped area of pale, edematous retina confined to the inferior-temporal quadrant. At the first bifurcation of the inferior temporal retinal artery, there is a small, highly reflective, golden-yellow plaque (Hollenhorst plaque) obstructing the lumen.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 61-year-old male with a history of carotid artery disease and smoking presents with a sudden, painless loss of the upper half of his visual field in the right eye that occurred 2 hours ago. His central vision is only mildly blurry.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 70 bpm | BP: 129/77 mmHg
*   **Visual Acuity:** OD: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OD):** No APD (or trace APD). Dilated fundus exam reveals a sharply demarcated, wedge-shaped area of pale, edematous retina confined to the inferior-temporal quadrant. At the first bifurcation of the inferior temporal retinal artery, there is a small, highly reflective, golden-yellow plaque (Hollenhorst plaque) obstructing the lumen.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Ischemic optic neuropathy", "Branch retinal artery occlusion (BRAO)", "Rhegmatogenous retinal detachment", "Branch retinal vein occlusion (BRVO)", "Central retinal artery occlusion (CRAO)"]'::jsonb, 1, 'This patient has a **Branch Retinal Artery Occlusion (BRAO)**. The clinical features are highly classic: sudden, painless, **segmental visual field loss** (corresponding to the blocked vessel), and a wedge-shaped area of **retinal pallor and edema** in the distribution of a branch arteriole, often with a visible **Hollenhorst plaque** at the bifurcation.'),
    (v_case_id, 'What is the primary composition and origin of a Hollenhorst plaque?', '["Thrombus composed of sickled erythrocytes from ciliary vessels", "Calcific embolus originating from a stenotic aortic valve", "Amyloid protein aggregate from systemic amyloidosis", "Platelet-fibrin thrombus originating from the left atrium in atrial fibrillation", "Cholesterol embolus originating from an atheromatous plaque in the internal carotid artery"]'::jsonb, 4, 'A **Hollenhorst plaque** is a **cholesterol embolus** that originates from an **atheromatous, ulcerated plaque in the ipsilateral internal carotid artery** (or aorta). It travels in the bloodstream and becomes lodged at a bifurcation of the retinal vasculature, where the vessel diameter narrows. It appears highly reflective, shiny, and golden-yellow.'),
    (v_case_id, 'How does the prognosis of visual acuity in BRAO generally compare to CRAO, and why?', '["Worse, because BRAO is highly associated with systemic vasculitis like Giant Cell Arteritis", "Identical, because both result in complete degeneration of the optic nerve head", "Worse, because branch arterioles are smaller and more prone to permanent spasm", "Significantly better, because the central fovea is usually spared and the macular perfusion is maintained by the unaffected arterioles", "Better, because the blocked arteriole undergoes spontaneous recanalization within minutes"]'::jsonb, 3, 'The prognosis for visual acuity in BRAO is **significantly better than in CRAO**. In BRAO, because only a branch arteriole is occluded, the central fovea is usually spared (unless the macular branch itself is involved), allowing the patient to maintain good central vision (20/40 or better in 80% of cases), though they will have a permanent, segmental visual field defect.');

    ---------------------------------------------------------------------------
    -- CASE 10: The Silent Tension (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Silent Tension (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Silent Tension (V1)', 'A 75-year-old male with a history of poorly controlled type 1 diabetes and severe proliferative diabetic retinopathy presents with a slowly progressive, painless decrease in vision in his right eye over the past 2 months.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 70 bpm | BP: 117/79 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/40
*   **Ocular Examination (OD):** Quiet anterior chamber. Dilated fundus examination reveals dense, white fibrovascular membranes in the vitreous cavity that are adherent to the retina. These bands are contracting and mechanically pulling the neurosensory retina away from the underlying RPE, creating a smooth, immobile, dome-like elevation of the retina. No retinal tears or holes are seen.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 75-year-old male with a history of poorly controlled type 1 diabetes and severe proliferative diabetic retinopathy presents with a slowly progressive, painless decrease in vision in his right eye over the past 2 months.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 70 bpm | BP: 117/79 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/40
*   **Ocular Examination (OD):** Quiet anterior chamber. Dilated fundus examination reveals dense, white fibrovascular membranes in the vitreous cavity that are adherent to the retina. These bands are contracting and mechanically pulling the neurosensory retina away from the underlying RPE, creating a smooth, immobile, dome-like elevation of the retina. No retinal tears or holes are seen.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary surgical management?', '["Exudative retinal detachment; systemic corticosteroids and immunosuppressants", "Proliferative diabetic retinopathy; panretinal photocoagulation (PRP) alone", "Tractional retinal detachment; pars plana vitrectomy with membrane peeling and endolaser", "Neovascular glaucoma; surgical trabeculectomy", "Rhegmatogenous retinal detachment; urgent pneumatic retinopexy"]'::jsonb, 2, 'This is a **Tractional Retinal Detachment (TRD)**, a severe complication of proliferative diabetic retinopathy. Treatment requires **pars plana vitrectomy** to remove the vitreous gel, followed by **micro-surgical membrane peeling** to release the tractional forces pulling the retina, and **intraoperative endolaser (PRP)** to regress the neovascularization.'),
    (v_case_id, 'What is the key pathophysiological driver that leads to Tractional Retinal Detachment in diabetic patients?', '["Liquefied vitreous leaks through a full-thickness retinal hole, dissecting the retina", "Severe systemic hypertension causes transudative fluid to leak under the retina", "Infiltration of the subretinal space by neoplastic retinoblastoma cells", "Ischemia-induced neovascularization grows along the posterior vitreous face, creating fibrovascular membranes that contract over time", "Deposition of amyloid plaques that stiffen the sensory retina"]'::jsonb, 3, 'In proliferative diabetic retinopathy, chronic retinal ischemia drives the growth of abnormal new vessels (**neovascularization**). These vessels grow out of the retina and along the **posterior vitreous face**, accompanied by a scaffolding of fibrous tissue. Over time, these **fibrovascular membranes contract**, mechanically pulling the neurosensory retina off the underlying RPE.'),
    (v_case_id, 'Which of the following clinical features helps differentiate a Tractional Retinal Detachment from a Rhegmatogenous Retinal Detachment?', '["Tractional RD is always bilateral and associated with systemic arthritis", "Tractional RD resolves spontaneously with steroid drops", "Tractional RD is characteristically slowly progressive, has a smooth/concave surface, is non-shifting, and lacks retinal holes/tears", "Tractional RD presents with sudden flashes, floaters, a corrugated wrinkled surface, and a horseshoe tear", "Tractional RD is associated with high intraocular pressure and corneal clouding"]'::jsonb, 2, '**Tractional RD** is slowly progressive, has a **smooth, concave surface, is non-shifting** (does not move with gravity/head position), and **lacks full-thickness retinal tears/holes**. **Rhegmatogenous RD** is rapid in onset, has a **corrugated, wrinkled, convex surface, shifts with gravity**, and **always has a causative retinal tear/hole**.');

    ---------------------------------------------------------------------------
    -- CASE 11: The Falling Curtain - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Falling Curtain - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Falling Curtain - Clinical Presentation (V2)', 'A 56-year-old female presents with a sudden onset of flashes of light (photopsias) and a shower of small dark floaters in the left eye, followed by a dark curtain-like shadow descending over the upper half of her vision. She has a history of high myopia.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 76 bpm | BP: 121/85 mmHg
*   **Visual Acuity:** OS: 20/200 (no improvement with pinhole); OS: 20/20
*   **Ocular Examination (OS):** Anterior chamber is quiet. Slit-lamp exam of the anterior vitreous reveals small, brown-pigmented cells ("tobacco dust" or Shafer''s sign). Dilated fundus exam reveals a grey, elevated, corrugated, and wrinkled retina in the inferior-temporal sector with a large, crescentic horseshoe-shaped retinal tear.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 56-year-old female presents with a sudden onset of flashes of light (photopsias) and a shower of small dark floaters in the left eye, followed by a dark curtain-like shadow descending over the upper half of her vision. She has a history of high myopia.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 76 bpm | BP: 121/85 mmHg
*   **Visual Acuity:** OS: 20/200 (no improvement with pinhole); OS: 20/20
*   **Ocular Examination (OS):** Anterior chamber is quiet. Slit-lamp exam of the anterior vitreous reveals small, brown-pigmented cells ("tobacco dust" or Shafer''s sign). Dilated fundus exam reveals a grey, elevated, corrugated, and wrinkled retina in the inferior-temporal sector with a large, crescentic horseshoe-shaped retinal tear.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the immediate management?', '["Central retinal artery occlusion; immediate ocular massage and hyperbaric oxygen", "Rhegmatogenous retinal detachment; urgent ophthalmology referral for surgical repair", "Dry age-related macular degeneration; high-dose AREDS2 vitamins", "Vitreous hemorrhage; bed rest and head elevation of 45 degrees", "Acute retinal necrosis; immediate intravenous acyclovir"]'::jsonb, 1, 'This patient has a classic **Rhegmatogenous Retinal Detachment (RRD)** with a visible horseshoe tear. The presence of flashes, floaters, and a "curtain" visual field loss are hallmarks. The immediate management is an **urgent referral to an ophthalmologist** for surgical reattachment (e.g., vitrectomy, scleral buckle, or pneumatic retinopexy) to prevent permanent macular visual loss (if macula is "on").'),
    (v_case_id, 'What is the pathophysiological mechanism responsible for this specific type of retinal detachment?', '["Exudative leakage of fluid from choroidal vessels directly into the subretinal space due to high systemic pressure", "Contraction of retroretinal fibrous membranes pulling the neurosensory retina away from the pigment epithelium", "A direct vascular tear causing blood accumulation that mechanically dissects the retina", "Hypersecretion of subretinal fluid by hypertrophied retinal pigment epithelial cells", "Vitreous liquefaction and traction create a full-thickness retinal tear, allowing liquefied vitreous to enter the subretinal space"]'::jsonb, 4, 'Rhegmatogenous RD (from *rhegma*, meaning tear) occurs when **vitreous liquefaction (synchysis)** and **vitreous traction** lead to a posterior vitreous detachment (PVD) that pulls on and tears the retina. Liquefied vitreous then passes through the tear into the subretinal space, separating the neurosensory retina from the underlying retinal pigment epithelium (RPE).'),
    (v_case_id, 'What does the clinical sign of ''tobacco dust'' (Shafer''s sign) in the anterior vitreous represent?', '["Calcified deposits on the lens zonules", "Pigmented retinal pigment epithelial (RPE) cells released into the vitreous following a retinal tear", "Clumps of white blood cells indicating an active vitritis", "Deposits of amyloid protein on the posterior vitreous face", "Degenerated red blood cells from a vitreous hemorrhage"]'::jsonb, 1, '**Shafer''s sign** ("tobacco dust") represents **pigmented RPE cells** that have escaped through a full-thickness retinal tear into the vitreous cavity. It is a highly specific sign of a retinal tear or detachment, even if the tear itself is not immediately visible.');

    ---------------------------------------------------------------------------
    -- CASE 12: The Pale Retina and Cherry-Red Spot - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pale Retina and Cherry-Red Spot - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pale Retina and Cherry-Red Spot - Clinical Presentation (V2)', 'A 75-year-old male with a history of hypertension, hyperlipidemia, and coronary artery disease presents with a sudden, complete, painless loss of vision in the left eye that occurred 4 hours ago. He denies any preceding trauma or ocular symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 77 bpm | BP: 130/78 mmHg
*   **Visual Acuity:** OS: Count Fingers; contralateral eye: 20/20
*   **Ocular Examination (OS):** A positive relative afferent pupillary defect (APD). Dilated fundus examination reveals marked, generalized pallor and edema of the retina, except for a bright, circumscribed "cherry-red spot" in the central fovea. The retinal arterioles are severely narrowed, and segmenting blood columns ("box-carring") are visible.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 75-year-old male with a history of hypertension, hyperlipidemia, and coronary artery disease presents with a sudden, complete, painless loss of vision in the left eye that occurred 4 hours ago. He denies any preceding trauma or ocular symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 77 bpm | BP: 130/78 mmHg
*   **Visual Acuity:** OS: Count Fingers; contralateral eye: 20/20
*   **Ocular Examination (OS):** A positive relative afferent pupillary defect (APD). Dilated fundus examination reveals marked, generalized pallor and edema of the retina, except for a bright, circumscribed "cherry-red spot" in the central fovea. The retinal arterioles are severely narrowed, and segmenting blood columns ("box-carring") are visible.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the initial emergency management?', '["Giant cell arteritis; high-dose oral prednisone monotherapy", "Central retinal artery occlusion (CRAO); ocular massage, hyperventilate into a paper bag, or AC paracentesis", "Central retinal vein occlusion (CRVO); intravitreal anti-VEGF injection within 24 hours", "Vitreous hemorrhage; urgent pars plana vitrectomy", "Rhegmatogenous retinal detachment; pneumatic retinopexy"]'::jsonb, 1, 'This is a classic **Central Retinal Artery Occlusion (CRAO)**. It is an ocular emergency analogous to an ischemic stroke. Initial management (within 4 hours of onset) aims to dislodge the embolus and restore perfusion by lowering IOP (via **ocular massage**, **anterior chamber paracentesis**, or IV acetazolamide) or causing vasodilation (breathing into a paper bag to raise CO2 levels).'),
    (v_case_id, 'Why does a ''cherry-red spot'' appear in the macula of patients with Central Retinal Artery Occlusion?', '["Severe localized inflammation of the macular photoreceptors", "The cherry-red spot represents the embolus itself wedged in the macular arteriole", "A localized pool of blood accumulates in the subretinal space directly beneath the fovea", "The thin foveola lacks inner retinal layers and is supplied by the underlying choroid, which shines red against the pale, ischemic surrounding retina", "Selective hyper-perfusion of the fovea by a patent cilioretinal artery"]'::jsonb, 3, 'The **cherry-red spot** appears because the foveola is extremely thin and lacks the inner retinal layers (ganglion cells, nerve fibers) that become pale, swollen, and edematous when ischemic. Because the foveola is supplied primarily by the underlying choriocapillaris (which is fed by the ciliary arteries, not the blocked central retinal artery), the vascular choroid continues to shine red through the thin, transparent foveal tissue, contrasting with the pale, opaque surrounding retina.'),
    (v_case_id, 'Which of the following diagnostic workups is most critical in this patient to prevent life-threatening stroke or myocardial infarction?', '["Fluorescein angiography of both eyes", "Temporal artery biopsy", "Brain MRI with contrast", "Carotid duplex ultrasound and echocardiogram", "Coagulation panel including Factor V Leiden"]'::jsonb, 3, 'The most common cause of non-arteritic CRAO is an **embolus originating from an ulcerated carotid artery plaque (Hollenhorst plaque) or the heart**. Therefore, a cardiovascular workup consisting of **carotid duplex ultrasound** and an **echocardiogram** is mandatory to identify source lesions and prevent a subsequent stroke or MI.');

    ---------------------------------------------------------------------------
    -- CASE 13: The Blood and Thunder Fundus - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blood and Thunder Fundus - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blood and Thunder Fundus - Clinical Presentation (V2)', 'A 64-year-old female with a long history of poorly controlled hypertension and glaucoma presents with a subacute, painless decrease in vision in her right eye over the past 2 days.

**Physical Examination:**
*   **Vitals:** Temp: 98.1°F | HR: 80 bpm | BP: 134/81 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OD):** Mild APD. Dilated fundus exam reveals widespread, diffuse flame-shaped and dot-and-blot hemorrhages in all four quadrants ("blood and thunder fundus"), along with severely tortuous and dilated retinal veins, scattered cotton-wool spots, and significant optic disc and macular edema.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 64-year-old female with a long history of poorly controlled hypertension and glaucoma presents with a subacute, painless decrease in vision in her right eye over the past 2 days.

**Physical Examination:**
*   **Vitals:** Temp: 98.1°F | HR: 80 bpm | BP: 134/81 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OD):** Mild APD. Dilated fundus exam reveals widespread, diffuse flame-shaped and dot-and-blot hemorrhages in all four quadrants ("blood and thunder fundus"), along with severely tortuous and dilated retinal veins, scattered cotton-wool spots, and significant optic disc and macular edema.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Acute retinal necrosis", "Central retinal artery occlusion (CRAO)", "Proliferative diabetic retinopathy with vitreous hemorrhage", "Hypertensive crisis with Grade IV retinopathy", "Central retinal vein occlusion (CRVO)"]'::jsonb, 4, 'This presentation is diagnostic of a **Central Retinal Vein Occlusion (CRVO)**. The hallmark funduscopic finding is the **''blood and thunder'' appearance** (widespread hemorrhages in all 4 quadrants, tortuous dilated veins, disc edema, and cotton-wool spots). It is a venous thrombosis typically occurring at the level of the lamina cribrosa.'),
    (v_case_id, 'What is the primary cause of severe, long-term visual loss in patients with Central Retinal Vein Occlusion?', '["Macular edema due to vascular leakage and capillary incompetence", "Corneal edema from chronic secondary glaucoma", "Optic nerve atrophy from direct mechanical venous compression", "Autoimmune destruction of the retinal pigment epithelium", "Total retinal detachment due to subretinal fluid accumulation"]'::jsonb, 0, 'The most common cause of persistent, long-term visual loss in patients with CRVO is **macular edema** driven by capillary leakage and increased intravascular pressure. High venous pressure triggers blood-retinal barrier breakdown and release of VEGF, leading to chronic fluid accumulation in the macula.'),
    (v_case_id, 'This patient must be monitored closely for ''90-day glaucoma'' (neovascular glaucoma). What drives this complication in ischemic CRVO?', '["The thrombus in the central retinal vein back-pressures into the vortex veins, blocking outflow", "Persistent systemic hypertension pushes the lens-iris diaphragm forward", "Chronic blood breakdown products block the trabecular meshwork", "Anterior uveitis causes pupillary block synechiae", "Widespread retinal ischemia triggers VEGF release, which stimulates new blood vessel growth in the iris and angle"]'::jsonb, 4, 'In ischemic CRVO (defined by large areas of capillary non-perfusion on fluorescein angiography), severe **retinal ischemia** triggers the release of **VEGF**. VEGF diffuses into the anterior segment, causing neovascularization of the iris (rubeosis iridis) and angle, which eventually leads to **neovascular glaucoma** (classically appearing around 90 days, hence "90-day glaucoma").');

    ---------------------------------------------------------------------------
    -- CASE 14: The Wavy Lines and Central Dark Spot - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Wavy Lines and Central Dark Spot - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Wavy Lines and Central Dark Spot - Clinical Presentation (V2)', 'A 79-year-old male presents with a sudden onset of distortion in his central vision in the right eye. He complains that straight lines (like doorframes) appear wavy and bent, and he has difficulty reading. He has a long history of dry macular degeneration in both eyes.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 81 bpm | BP: 119/79 mmHg
*   **Visual Acuity:** OD: 20/120; contralateral eye: 20/30
*   **Ocular Examination (OD):** Testing with an Amsler grid confirms significant metamorphopsia (wavy lines) and a central scotoma. Dilated fundus examination reveals multiple, large soft yellowish drusen in the macula, along with a grey-green subretinal elevation, subretinal fluid, and a localized pocket of subretinal hemorrhage in the central fovea.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 79-year-old male presents with a sudden onset of distortion in his central vision in the right eye. He complains that straight lines (like doorframes) appear wavy and bent, and he has difficulty reading. He has a long history of dry macular degeneration in both eyes.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 81 bpm | BP: 119/79 mmHg
*   **Visual Acuity:** OD: 20/120; contralateral eye: 20/30
*   **Ocular Examination (OD):** Testing with an Amsler grid confirms significant metamorphopsia (wavy lines) and a central scotoma. Dilated fundus examination reveals multiple, large soft yellowish drusen in the macula, along with a grey-green subretinal elevation, subretinal fluid, and a localized pocket of subretinal hemorrhage in the central fovea.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following represents the most appropriate first-line treatment for this patient''s current condition?', '["High-dose antioxidant vitamins and zinc (AREDS2 formulation) alone", "Intravitreal injections of anti-Vascular Endothelial Growth Factor (anti-VEGF) agents (e.g., aflibercept)", "Topical prednisolone acetate 1% drops hourly", "Surgical subretinal membrane scraping and vitrectomy", "Laser photocoagulation of the central foveal hemorrhage"]'::jsonb, 1, 'The patient has transitioned from dry to **neovascular (''wet'') Age-Related Macular Degeneration (Wet AMD)**, evidenced by sudden metamorphopsia (wavy lines), subretinal fluid, and hemorrhage. The standard of care is **intravitreal anti-VEGF injections** (e.g., ranibizumab, aflibercept, bevacizumab), which bind VEGF, stopping neovascularization and reducing vascular leakage, often restoring or stabilizing vision. AREDS2 vitamins are for dry AMD and do not treat active choroidal neovascular membranes.'),
    (v_case_id, 'What is the key pathophysiological development that distinguishes ''wet'' AMD from ''dry'' AMD?', '["A sudden mechanical tear in the neurosensory retina due to vitreous traction", "Accumulation of extracellular lipofuscin-rich debris (drusen) in the extracellular space", "Occlusion of the central retinal vein at the optic disc", "Growth of abnormal choroidal vessels through Bruch''s membrane into the subretinal space (choroidal neovascularization)", "Progressive geographic atrophy of the retinal pigment epithelium and photoreceptors"]'::jsonb, 3, 'The defining feature of Wet AMD is **choroidal neovascularization (CNV)**. Unlike Dry AMD, which involves slow atrophy of the RPE and photoreceptors, Wet AMD involves the growth of **abnormal, fragile blood vessels from the choriocapillaris** through breaks in **Bruch''s membrane** into the sub-RPE or subretinal space. These vessels leak fluid, protein, and blood, leading to rapid, severe visual loss.'),
    (v_case_id, 'Which of the following clinical tests is most appropriate for patients with dry AMD to perform at home for early detection of conversion to wet AMD?', '["Frequent self-tonometry using a hand-held tonometer", "Self-assessment of peripheral visual field boundaries", "Amsler grid testing daily", "Measuring visual acuity using a Snellen pocket card", "Checking color vision with Ishihara plates weekly"]'::jsonb, 2, 'Patients with Dry AMD are instructed to use an **Amsler grid daily** to monitor for early signs of Wet AMD. Metamorphopsia (distortion where straight lines appear wavy) or a new central dark spot (scotoma) on the grid are early signs of subretinal fluid or hemorrhage, prompting immediate evaluation and anti-VEGF therapy.');

    ---------------------------------------------------------------------------
    -- CASE 15: The Progressive Central Blindness - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Progressive Central Blindness - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Progressive Central Blindness - Clinical Presentation (V2)', 'A 84-year-old male smoker presents with a 2-year history of slowly progressive, bilateral loss of central vision, making it hard to read, sew, or recognize faces. He reports no sudden changes in vision, pain, or flashes of light.

**Physical Examination:**
*   **Vitals:** Temp: 98.1°F | HR: 72 bpm | BP: 137/80 mmHg
*   **Visual Acuity:** OD: 20/50; OS: 20/40 (with correction)
*   **Ocular Examination:** Anterior segments are clear. Amsler grid shows no metamorphopsia (lines are straight) but a mild central blur bilaterally. Dilated fundus examination reveals multiple, bilateral, scattered small and large yellowish-white extracellular deposits (drusen) in the macula, along with localized areas of depigmentation and thinning of the retinal pigment epithelium (geographic atrophy). No subretinal fluid or hemorrhage is present.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 84-year-old male smoker presents with a 2-year history of slowly progressive, bilateral loss of central vision, making it hard to read, sew, or recognize faces. He reports no sudden changes in vision, pain, or flashes of light.

**Physical Examination:**
*   **Vitals:** Temp: 98.1°F | HR: 72 bpm | BP: 137/80 mmHg
*   **Visual Acuity:** OD: 20/50; OS: 20/40 (with correction)
*   **Ocular Examination:** Anterior segments are clear. Amsler grid shows no metamorphopsia (lines are straight) but a mild central blur bilaterally. Dilated fundus examination reveals multiple, bilateral, scattered small and large yellowish-white extracellular deposits (drusen) in the macula, along with localized areas of depigmentation and thinning of the retinal pigment epithelium (geographic atrophy). No subretinal fluid or hemorrhage is present.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the recommended management?', '["Dry age-related macular degeneration; AREDS2 vitamin formulation and smoking cessation", "Wet age-related macular degeneration; urgent intravitreal anti-VEGF therapy", "Primary open-angle glaucoma; topical prostaglandin drops", "Nuclear cataract; urgent surgical cataract extraction", "Toxic retinopathy; immediate discontinuation of hydroxychloroquine"]'::jsonb, 0, 'This patient has **Dry Age-Related Macular Degeneration (Dry AMD)**, characterized by progressive central vision loss, geographic atrophy, and **drusen** without fluid or blood. The recommended management for intermediate/advanced dry AMD is the **AREDS2 vitamin formulation** (antioxidant vitamins C, E, zinc, copper, lutein, and zeaxanthin) to slow progression to advanced stages, along with **smoking cessation** (as smoking is the strongest modifiable risk factor).'),
    (v_case_id, 'What represents the substance known as ''drusen'' that accumulates in this condition?', '["Protein complexes leaking from the vitreous humor", "Aggregates of inflammatory cells adhering to the corneal endothelium", "Abnormal collagen fibers deposited within the stroma of the cornea", "Extracellular debris including lipofuscin, proteins, and lipids accumulating between the RPE and Bruch''s membrane", "Small microaneurysms that have thrombosed and calcified"]'::jsonb, 3, '**Drusen** are **yellowish extracellular deposits** consisting of undigested cellular waste products (like lipofuscin), proteins, and lipids that accumulate in the extracellular space between the **retinal pigment epithelium (RPE) and Bruch''s membrane**. Their accumulation disrupts RPE function and leads to secondary degeneration of the overlying photoreceptors.'),
    (v_case_id, 'Why was beta-carotene removed and replaced with Lutein and Zeaxanthin in the AREDS2 clinical trial formulation?', '["Lutein has superior activity against choroidal neovascularization", "Lutein and Zeaxanthin were found to lower intraocular pressure", "Beta-carotene caused severe corneal endothelial deposits", "Beta-carotene interfered with the absorption of zinc and copper", "Beta-carotene was found to significantly increase the risk of lung cancer in smokers"]'::jsonb, 4, 'Beta-carotene was replaced with **Lutein and Zeaxanthin** in the AREDS2 formulation because large clinical trials (like the CARET and ATBC studies) demonstrated that **beta-carotene significantly increases the risk of lung cancer in smokers**. Since many AMD patients have a history of smoking, removing beta-carotene made the formulation safer while maintaining efficacy.');

    ---------------------------------------------------------------------------
    -- CASE 16: The Floating Red Cobwebs - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Floating Red Cobwebs - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Floating Red Cobwebs - Clinical Presentation (V2)', 'A 69-year-old female with a 15-year history of insulin-dependent diabetes presents with a sudden onset of multiple floating dark spots and red cobweb-like lines in the left eye, followed by severe, painless blurring of vision. She has had no eye trauma.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 75 bpm | BP: 138/75 mmHg
*   **Visual Acuity:** OS: 20/400; contralateral eye: 20/25
*   **Ocular Examination (OS):** The red reflex is severely dim/absent. Slit-lamp exam shows clear cornea and a quiet anterior chamber. On dilated exam, the vitreous cavity is filled with suspended red blood cells, completely obscuring the details of the optic nerve and retinal vasculature. Contralateral eye shows proliferative diabetic retinopathy with neovascularization.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 69-year-old female with a 15-year history of insulin-dependent diabetes presents with a sudden onset of multiple floating dark spots and red cobweb-like lines in the left eye, followed by severe, painless blurring of vision. She has had no eye trauma.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 75 bpm | BP: 138/75 mmHg
*   **Visual Acuity:** OS: 20/400; contralateral eye: 20/25
*   **Ocular Examination (OS):** The red reflex is severely dim/absent. Slit-lamp exam shows clear cornea and a quiet anterior chamber. On dilated exam, the vitreous cavity is filled with suspended red blood cells, completely obscuring the details of the optic nerve and retinal vasculature. Contralateral eye shows proliferative diabetic retinopathy with neovascularization.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the initial management step?', '["Rhegmatogenous retinal detachment; perform immediate pneumatic retinopexy", "Vitreous hemorrhage; elevate the head of the bed, perform ocular ultrasound (B-scan) to rule out retinal detachment, and observe", "Acute angle-closure glaucoma; administer IV acetazolamide", "Central retinal artery occlusion; perform urgent anterior chamber paracentesis", "CMV retinitis; initiate systemic and intravitreal ganciclovir"]'::jsonb, 1, 'This patient has a **Vitreous Hemorrhage**, a common complication of **Proliferative Diabetic Retinopathy**. The initial steps are: (1) **elevate the head of the bed (30-45 degrees)** to allow the blood to settle inferiorly, clearing the visual axis, (2) perform an **ocular B-scan ultrasound** to ensure the underlying retina is flat and not detached (since the fundus cannot be visualized), and (3) observe, as many hemorrhages clear spontaneously over weeks to months.'),
    (v_case_id, 'What is the primary anatomical source of blood in a diabetic patient presenting with a vitreous hemorrhage?', '["A tear in a major branch retinal vein due to severe systemic hypertension", "Fragile, abnormal new vessels (neovascularization) growing along the vitreous face and retina that rupture easily", "A full-thickness retinal tear that shears a healthy retinal arteriole", "Rupture of ciliary body capillaries due to high intraocular pressure", "Bleeding from abnormal choroidal neovascular membranes through Bruch''s membrane"]'::jsonb, 1, 'In diabetes, **vitreous hemorrhage** is caused by the **rupture of fragile neovascular vessels (NVD or NVE)**. These abnormal vessels lack a normal muscular coat and tight endothelial junctions, making them extremely fragile. When the vitreous contracts or moves, it exerts traction on these vessels, causing them to tear and bleed directly into the vitreous cavity.'),
    (v_case_id, 'In which of the following scenarios is an URGENT pars plana vitrectomy indicated for a patient with a vitreous hemorrhage?', '["The presence of a tractional or rhegmatogenous retinal detachment on B-scan ultrasound, or non-clearing hemorrhage >3-6 months", "An elevated intraocular pressure of 22 mmHg in the affected eye", "The presence of dry age-related macular degeneration in the contralateral eye", "The presence of hard lipid exudates on the retinal surface", "Any vitreous hemorrhage in a patient with a history of hypertension"]'::jsonb, 0, 'An **urgent pars plana vitrectomy** is indicated if: (1) **B-scan ultrasound reveals an associated retinal detachment (tractional or rhegmatogenous)**, (2) the hemorrhage fails to clear after 3 to 6 months of conservative observation, preventing visual recovery and treatment, or (3) neovascularization of the iris/angle (rubeosis) develops, requiring clear media to perform PRP.');

    ---------------------------------------------------------------------------
    -- CASE 17: The AIDS-Related Blindness - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The AIDS-Related Blindness - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The AIDS-Related Blindness - Clinical Presentation (V2)', 'A 46-year-old male with HIV presents with a 1-week history of floaters, flashes of light, and blurred vision in the left eye. He admits to non-compliance with antiretroviral therapy (ART). His CD4 count is 45 cells/mcL.

**Physical Examination:**
*   **Vitals:** Temp: 99.0°F | HR: 72 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior chamber is quiet. Vitreous shows minimal inflammatory cells (1+). Dilated fundus examination reveals multiple, confluent, thick, yellow-white necrotic retinal lesions with perivascular sheathing and extensive, flame-shaped retinal hemorrhages along the vascular arches, giving a "pizza-pie" or "scrambled eggs and ketchup" appearance.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 46-year-old male with HIV presents with a 1-week history of floaters, flashes of light, and blurred vision in the left eye. He admits to non-compliance with antiretroviral therapy (ART). His CD4 count is 45 cells/mcL.

**Physical Examination:**
*   **Vitals:** Temp: 99.0°F | HR: 72 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior chamber is quiet. Vitreous shows minimal inflammatory cells (1+). Dilated fundus examination reveals multiple, confluent, thick, yellow-white necrotic retinal lesions with perivascular sheathing and extensive, flame-shaped retinal hemorrhages along the vascular arches, giving a "pizza-pie" or "scrambled eggs and ketchup" appearance.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the first-line therapy?', '["Toxoplasma chorioretinitis; pyrimethamine, sulfadiazine, and folinic acid", "Cytomegalovirus (CMV) retinitis; systemic valganciclovir and/or intravitreal ganciclovir, plus initiation of ART", "Bacterial endophthalmitis; intravitreal vancomycin and ceftazidime", "Syphilitic chorioretinitis; intravenous penicillin G for 14 days", "Acute retinal necrosis (ARN); intravenous acyclovir and oral valacyclovir"]'::jsonb, 1, 'This patient has **CMV Retinitis**, the most common opportunistic ocular infection in AIDS patients, typically occurring when the **CD4 count is <50 cells/mcL**. The classic fundus appearance is a **"pizza-pie" or "scrambled eggs and ketchup" pattern** of yellow-white necrotic lesions and massive hemorrhages. First-line therapy consists of **antivirals (ganciclovir/valganciclovir or foscarnet)** administered systemically and/or intravitreally, along with the **initiation or optimization of ART**.'),
    (v_case_id, 'Why is there typically very little vitreous cell or anterior chamber inflammation (vitritis/iritis) seen in patients with active CMV retinitis?', '["The severe immunosuppression prevents the host from mounting an inflammatory response (quiet vitreous)", "The virus is physically restricted to the subretinal space", "CMV selectively infects only the outer photoreceptors, sparing vascular structures", "The blood-aqueous barrier is completely impermeable to CMV antigens", "CMV produces potent anti-inflammatory cytokines that suppress local T-cells"]'::jsonb, 0, 'Active CMV retinitis characteristically presents with **minimal vitreous or anterior segment inflammation (quiet vitreous)**. This is because patients are **severely immunocompromised (CD4 < 50)** and cannot mount a cellular inflammatory response. If the immune system recovers (e.g., after starting ART), a massive inflammatory reaction can occur, known as **Immune Reconstitution Inflammatory Syndrome (IRIS)**, presenting as severe vitritis and macular edema.'),
    (v_case_id, 'What is the most common vision-threatening complication of CMV retinitis, occurring in up to 30% of patients?', '["Tractional retinal detachment", "Rhegmatogenous retinal detachment", "Neovascular glaucoma", "Corneal stromal necrosis", "Sympathetic ophthalmia"]'::jsonb, 1, 'The most common and feared complication of CMV retinitis is **rhegmatogenous retinal detachment**. The CMV virus causes full-thickness **necrosis and thinning of the retina**, leaving behind fragile, paper-thin necrotic tissue. As the vitreous contracts or pulls, multiple peripheral retinal holes and tears easily form, leading to a high rate of RRD that often requires complex surgery with silicone oil tamponade.');

    ---------------------------------------------------------------------------
    -- CASE 18: The Painful Confluent Necrosis - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Painful Confluent Necrosis - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Painful Confluent Necrosis - Clinical Presentation (V2)', 'A healthy, immunocompetent 47-year-old male presents with a 4-day history of severe, boring pain, redness, photophobia, and rapidly worsening vision in the left eye. He has no systemic symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 68 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OS):** Moderate episcleral injection. Slit-lamp shows 2+ granulomatous keratic precipitates on the corneal endothelium and 2+ cell/flare in the anterior chamber. There is significant **vitritis (3+)** obscuring the fundus. Dilated fundus examination reveals confluent, patch-like areas of yellowish-white peripheral retinal necrosis that are spreading circumferentially, with prominent retinal arteritis (perivascular sheathing).', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A healthy, immunocompetent 47-year-old male presents with a 4-day history of severe, boring pain, redness, photophobia, and rapidly worsening vision in the left eye. He has no systemic symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 68 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OS):** Moderate episcleral injection. Slit-lamp shows 2+ granulomatous keratic precipitates on the corneal endothelium and 2+ cell/flare in the anterior chamber. There is significant **vitritis (3+)** obscuring the fundus. Dilated fundus examination reveals confluent, patch-like areas of yellowish-white peripheral retinal necrosis that are spreading circumferentially, with prominent retinal arteritis (perivascular sheathing).', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary causative pathogen?', '["Vogt-Koyanagi-Harada disease; autoimmune reaction to melanocytes", "Endogenous bacterial endophthalmitis; Staphylococcus aureus", "Toxocariasis; Toxocara canis roundworm infection", "Acute Retinal Necrosis (ARN); Varicella-Zoster Virus (VZV) or Herpes Simplex Virus (HSV)", "CMV retinitis; Cytomegalovirus in a patient with undiagnosed AIDS"]'::jsonb, 3, 'This is **Acute Retinal Necrosis (ARN)**, which characteristically occurs in **immunocompetent** hosts. It is caused by herpesviruses, most commonly **Varicella-Zoster Virus (VZV)** or **Herpes Simplex Virus (HSV-1 or HSV-2)**. Key clinical features include: (1) severe ocular pain and redness, (2) severe **vitritis** (unlike CMV), and (3) confluent, peripheral **yellowish-white retinal necrosis** with retinal arteritis. Treatment is an emergency, requiring IV acyclovir or oral valacyclovir, combined with intravitreal ganciclovir.'),
    (v_case_id, 'Why is systemic corticosteroid therapy often used as an adjunct in the treatment of Acute Retinal Necrosis, and when should it be initiated?', '["Corticosteroids are used to prevent systemic viral spreading to the brain", "Corticosteroids are strictly contraindicated because they promote viral replication in the retina", "Corticosteroids are started immediately before antivirals to open the blood-retinal barrier", "Corticosteroids are started 24-48 hours after antiviral therapy to reduce the severe, vision-threatening vitreous inflammation", "Corticosteroids are used as monotherapy to suppress the autoimmune destruction of the retina"]'::jsonb, 3, 'Systemic **corticosteroids** (prednisone) are used as an adjunct to **reduce the severe, vision-threatening vitritis** and vascular inflammation associated with ARN. However, they must **never be given alone or before antivirals**. They are initiated **24 to 48 hours AFTER adequate antiviral therapy** has begun, ensuring that the viral replication is controlled so that steroids do not promote uncontrolled necrotizing viral spread.'),
    (v_case_id, 'What is the most common long-term complication of Acute Retinal Necrosis, occurring in over 75% of untreated patients?', '["Neovascular glaucoma from persistent retinal ischemia", "Sympathetic ophthalmia in the contralateral eye", "Phacolytic glaucoma from lens protein leakage", "Rhegmatogenous retinal detachment due to peripheral retinal holes", "Tractional retinal detachment due to fibrovascular membranes"]'::jsonb, 3, 'The most common and devastating complication of ARN is **rhegmatogenous retinal detachment**, occurring in **75-85% of untreated cases**. As the large, confluent zones of peripheral necrotic retina heal, they become paper-thin and develop **multiple, large, irregular tears and holes**. The severe vitritis also causes vitreous condensation and traction, pulling the torn retina off. Prophylactic laser retinopexy is often performed around necrotic areas to prevent this.');

    ---------------------------------------------------------------------------
    -- CASE 19: The Segmental Shadow - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Segmental Shadow - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Segmental Shadow - Clinical Presentation (V2)', 'A 77-year-old male with a history of carotid artery disease and smoking presents with a sudden, painless loss of the upper half of his visual field in the left eye that occurred 5 hours ago. His central vision is only mildly blurry.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 72 bpm | BP: 115/83 mmHg
*   **Visual Acuity:** OS: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OS):** No APD (or trace APD). Dilated fundus exam reveals a sharply demarcated, wedge-shaped area of pale, edematous retina confined to the inferior-temporal quadrant. At the first bifurcation of the inferior temporal retinal artery, there is a small, highly reflective, golden-yellow plaque (Hollenhorst plaque) obstructing the lumen.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 77-year-old male with a history of carotid artery disease and smoking presents with a sudden, painless loss of the upper half of his visual field in the left eye that occurred 5 hours ago. His central vision is only mildly blurry.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 72 bpm | BP: 115/83 mmHg
*   **Visual Acuity:** OS: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OS):** No APD (or trace APD). Dilated fundus exam reveals a sharply demarcated, wedge-shaped area of pale, edematous retina confined to the inferior-temporal quadrant. At the first bifurcation of the inferior temporal retinal artery, there is a small, highly reflective, golden-yellow plaque (Hollenhorst plaque) obstructing the lumen.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Rhegmatogenous retinal detachment", "Ischemic optic neuropathy", "Branch retinal vein occlusion (BRVO)", "Central retinal artery occlusion (CRAO)", "Branch retinal artery occlusion (BRAO)"]'::jsonb, 4, 'This patient has a **Branch Retinal Artery Occlusion (BRAO)**. The clinical features are highly classic: sudden, painless, **segmental visual field loss** (corresponding to the blocked vessel), and a wedge-shaped area of **retinal pallor and edema** in the distribution of a branch arteriole, often with a visible **Hollenhorst plaque** at the bifurcation.'),
    (v_case_id, 'What is the primary composition and origin of a Hollenhorst plaque?', '["Amyloid protein aggregate from systemic amyloidosis", "Calcific embolus originating from a stenotic aortic valve", "Cholesterol embolus originating from an atheromatous plaque in the internal carotid artery", "Thrombus composed of sickled erythrocytes from ciliary vessels", "Platelet-fibrin thrombus originating from the left atrium in atrial fibrillation"]'::jsonb, 2, 'A **Hollenhorst plaque** is a **cholesterol embolus** that originates from an **atheromatous, ulcerated plaque in the ipsilateral internal carotid artery** (or aorta). It travels in the bloodstream and becomes lodged at a bifurcation of the retinal vasculature, where the vessel diameter narrows. It appears highly reflective, shiny, and golden-yellow.'),
    (v_case_id, 'How does the prognosis of visual acuity in BRAO generally compare to CRAO, and why?', '["Identical, because both result in complete degeneration of the optic nerve head", "Worse, because branch arterioles are smaller and more prone to permanent spasm", "Significantly better, because the central fovea is usually spared and the macular perfusion is maintained by the unaffected arterioles", "Worse, because BRAO is highly associated with systemic vasculitis like Giant Cell Arteritis", "Better, because the blocked arteriole undergoes spontaneous recanalization within minutes"]'::jsonb, 2, 'The prognosis for visual acuity in BRAO is **significantly better than in CRAO**. In BRAO, because only a branch arteriole is occluded, the central fovea is usually spared (unless the macular branch itself is involved), allowing the patient to maintain good central vision (20/40 or better in 80% of cases), though they will have a permanent, segmental visual field defect.');

    ---------------------------------------------------------------------------
    -- CASE 20: The Silent Tension - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Silent Tension - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Silent Tension - Clinical Presentation (V2)', 'A 50-year-old female with a history of poorly controlled type 1 diabetes and severe proliferative diabetic retinopathy presents with a slowly progressive, painless decrease in vision in her left eye over the past 2 months.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 71 bpm | BP: 125/79 mmHg
*   **Visual Acuity:** OS: 20/200; contralateral eye: 20/40
*   **Ocular Examination (OS):** Quiet anterior chamber. Dilated fundus examination reveals dense, white fibrovascular membranes in the vitreous cavity that are adherent to the retina. These bands are contracting and mechanically pulling the neurosensory retina away from the underlying RPE, creating a smooth, immobile, dome-like elevation of the retina. No retinal tears or holes are seen.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old female with a history of poorly controlled type 1 diabetes and severe proliferative diabetic retinopathy presents with a slowly progressive, painless decrease in vision in her left eye over the past 2 months.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 71 bpm | BP: 125/79 mmHg
*   **Visual Acuity:** OS: 20/200; contralateral eye: 20/40
*   **Ocular Examination (OS):** Quiet anterior chamber. Dilated fundus examination reveals dense, white fibrovascular membranes in the vitreous cavity that are adherent to the retina. These bands are contracting and mechanically pulling the neurosensory retina away from the underlying RPE, creating a smooth, immobile, dome-like elevation of the retina. No retinal tears or holes are seen.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary surgical management?', '["Neovascular glaucoma; surgical trabeculectomy", "Proliferative diabetic retinopathy; panretinal photocoagulation (PRP) alone", "Tractional retinal detachment; pars plana vitrectomy with membrane peeling and endolaser", "Rhegmatogenous retinal detachment; urgent pneumatic retinopexy", "Exudative retinal detachment; systemic corticosteroids and immunosuppressants"]'::jsonb, 2, 'This is a **Tractional Retinal Detachment (TRD)**, a severe complication of proliferative diabetic retinopathy. Treatment requires **pars plana vitrectomy** to remove the vitreous gel, followed by **micro-surgical membrane peeling** to release the tractional forces pulling the retina, and **intraoperative endolaser (PRP)** to regress the neovascularization.'),
    (v_case_id, 'What is the key pathophysiological driver that leads to Tractional Retinal Detachment in diabetic patients?', '["Deposition of amyloid plaques that stiffen the sensory retina", "Infiltration of the subretinal space by neoplastic retinoblastoma cells", "Ischemia-induced neovascularization grows along the posterior vitreous face, creating fibrovascular membranes that contract over time", "Liquefied vitreous leaks through a full-thickness retinal hole, dissecting the retina", "Severe systemic hypertension causes transudative fluid to leak under the retina"]'::jsonb, 2, 'In proliferative diabetic retinopathy, chronic retinal ischemia drives the growth of abnormal new vessels (**neovascularization**). These vessels grow out of the retina and along the **posterior vitreous face**, accompanied by a scaffolding of fibrous tissue. Over time, these **fibrovascular membranes contract**, mechanically pulling the neurosensory retina off the underlying RPE.'),
    (v_case_id, 'Which of the following clinical features helps differentiate a Tractional Retinal Detachment from a Rhegmatogenous Retinal Detachment?', '["Tractional RD is always bilateral and associated with systemic arthritis", "Tractional RD presents with sudden flashes, floaters, a corrugated wrinkled surface, and a horseshoe tear", "Tractional RD is characteristically slowly progressive, has a smooth/concave surface, is non-shifting, and lacks retinal holes/tears", "Tractional RD is associated with high intraocular pressure and corneal clouding", "Tractional RD resolves spontaneously with steroid drops"]'::jsonb, 2, '**Tractional RD** is slowly progressive, has a **smooth, concave surface, is non-shifting** (does not move with gravity/head position), and **lacks full-thickness retinal tears/holes**. **Rhegmatogenous RD** is rapid in onset, has a **corrugated, wrinkled, convex surface, shifts with gravity**, and **always has a causative retinal tear/hole**.');

    ---------------------------------------------------------------------------
    -- CASE 21: Case Study: The Falling Curtain (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Falling Curtain (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Falling Curtain (V3)', 'A 50-year-old female presents with a sudden onset of flashes of light (photopsias) and a shower of small dark floaters in the right eye, followed by a dark curtain-like shadow descending over the upper half of her vision. She has a history of high myopia.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 75 bpm | BP: 115/79 mmHg
*   **Visual Acuity:** OD: 20/200 (no improvement with pinhole); OS: 20/20
*   **Ocular Examination (OD):** Anterior chamber is quiet. Slit-lamp exam of the anterior vitreous reveals small, brown-pigmented cells ("tobacco dust" or Shafer''s sign). Dilated fundus exam reveals a grey, elevated, corrugated, and wrinkled retina in the inferior-temporal sector with a large, crescentic horseshoe-shaped retinal tear.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old female presents with a sudden onset of flashes of light (photopsias) and a shower of small dark floaters in the right eye, followed by a dark curtain-like shadow descending over the upper half of her vision. She has a history of high myopia.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 75 bpm | BP: 115/79 mmHg
*   **Visual Acuity:** OD: 20/200 (no improvement with pinhole); OS: 20/20
*   **Ocular Examination (OD):** Anterior chamber is quiet. Slit-lamp exam of the anterior vitreous reveals small, brown-pigmented cells ("tobacco dust" or Shafer''s sign). Dilated fundus exam reveals a grey, elevated, corrugated, and wrinkled retina in the inferior-temporal sector with a large, crescentic horseshoe-shaped retinal tear.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the immediate management?', '["Acute retinal necrosis; immediate intravenous acyclovir", "Dry age-related macular degeneration; high-dose AREDS2 vitamins", "Vitreous hemorrhage; bed rest and head elevation of 45 degrees", "Rhegmatogenous retinal detachment; urgent ophthalmology referral for surgical repair", "Central retinal artery occlusion; immediate ocular massage and hyperbaric oxygen"]'::jsonb, 3, 'This patient has a classic **Rhegmatogenous Retinal Detachment (RRD)** with a visible horseshoe tear. The presence of flashes, floaters, and a "curtain" visual field loss are hallmarks. The immediate management is an **urgent referral to an ophthalmologist** for surgical reattachment (e.g., vitrectomy, scleral buckle, or pneumatic retinopexy) to prevent permanent macular visual loss (if macula is "on").'),
    (v_case_id, 'What is the pathophysiological mechanism responsible for this specific type of retinal detachment?', '["Hypersecretion of subretinal fluid by hypertrophied retinal pigment epithelial cells", "Contraction of retroretinal fibrous membranes pulling the neurosensory retina away from the pigment epithelium", "Vitreous liquefaction and traction create a full-thickness retinal tear, allowing liquefied vitreous to enter the subretinal space", "Exudative leakage of fluid from choroidal vessels directly into the subretinal space due to high systemic pressure", "A direct vascular tear causing blood accumulation that mechanically dissects the retina"]'::jsonb, 2, 'Rhegmatogenous RD (from *rhegma*, meaning tear) occurs when **vitreous liquefaction (synchysis)** and **vitreous traction** lead to a posterior vitreous detachment (PVD) that pulls on and tears the retina. Liquefied vitreous then passes through the tear into the subretinal space, separating the neurosensory retina from the underlying retinal pigment epithelium (RPE).'),
    (v_case_id, 'What does the clinical sign of ''tobacco dust'' (Shafer''s sign) in the anterior vitreous represent?', '["Degenerated red blood cells from a vitreous hemorrhage", "Pigmented retinal pigment epithelial (RPE) cells released into the vitreous following a retinal tear", "Deposits of amyloid protein on the posterior vitreous face", "Clumps of white blood cells indicating an active vitritis", "Calcified deposits on the lens zonules"]'::jsonb, 1, '**Shafer''s sign** ("tobacco dust") represents **pigmented RPE cells** that have escaped through a full-thickness retinal tear into the vitreous cavity. It is a highly specific sign of a retinal tear or detachment, even if the tear itself is not immediately visible.');

    ---------------------------------------------------------------------------
    -- CASE 22: Case Study: The Pale Retina and Cherry-Red Spot (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Pale Retina and Cherry-Red Spot (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Pale Retina and Cherry-Red Spot (V3)', 'A 66-year-old male with a history of hypertension, hyperlipidemia, and coronary artery disease presents with a sudden, complete, painless loss of vision in the right eye that occurred 4 hours ago. He denies any preceding trauma or ocular symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 72 bpm | BP: 130/77 mmHg
*   **Visual Acuity:** OD: Count Fingers; contralateral eye: 20/20
*   **Ocular Examination (OD):** A positive relative afferent pupillary defect (APD). Dilated fundus examination reveals marked, generalized pallor and edema of the retina, except for a bright, circumscribed "cherry-red spot" in the central fovea. The retinal arterioles are severely narrowed, and segmenting blood columns ("box-carring") are visible.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 66-year-old male with a history of hypertension, hyperlipidemia, and coronary artery disease presents with a sudden, complete, painless loss of vision in the right eye that occurred 4 hours ago. He denies any preceding trauma or ocular symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 72 bpm | BP: 130/77 mmHg
*   **Visual Acuity:** OD: Count Fingers; contralateral eye: 20/20
*   **Ocular Examination (OD):** A positive relative afferent pupillary defect (APD). Dilated fundus examination reveals marked, generalized pallor and edema of the retina, except for a bright, circumscribed "cherry-red spot" in the central fovea. The retinal arterioles are severely narrowed, and segmenting blood columns ("box-carring") are visible.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the initial emergency management?', '["Central retinal vein occlusion (CRVO); intravitreal anti-VEGF injection within 24 hours", "Giant cell arteritis; high-dose oral prednisone monotherapy", "Vitreous hemorrhage; urgent pars plana vitrectomy", "Central retinal artery occlusion (CRAO); ocular massage, hyperventilate into a paper bag, or AC paracentesis", "Rhegmatogenous retinal detachment; pneumatic retinopexy"]'::jsonb, 3, 'This is a classic **Central Retinal Artery Occlusion (CRAO)**. It is an ocular emergency analogous to an ischemic stroke. Initial management (within 4 hours of onset) aims to dislodge the embolus and restore perfusion by lowering IOP (via **ocular massage**, **anterior chamber paracentesis**, or IV acetazolamide) or causing vasodilation (breathing into a paper bag to raise CO2 levels).'),
    (v_case_id, 'Why does a ''cherry-red spot'' appear in the macula of patients with Central Retinal Artery Occlusion?', '["The cherry-red spot represents the embolus itself wedged in the macular arteriole", "Severe localized inflammation of the macular photoreceptors", "Selective hyper-perfusion of the fovea by a patent cilioretinal artery", "A localized pool of blood accumulates in the subretinal space directly beneath the fovea", "The thin foveola lacks inner retinal layers and is supplied by the underlying choroid, which shines red against the pale, ischemic surrounding retina"]'::jsonb, 4, 'The **cherry-red spot** appears because the foveola is extremely thin and lacks the inner retinal layers (ganglion cells, nerve fibers) that become pale, swollen, and edematous when ischemic. Because the foveola is supplied primarily by the underlying choriocapillaris (which is fed by the ciliary arteries, not the blocked central retinal artery), the vascular choroid continues to shine red through the thin, transparent foveal tissue, contrasting with the pale, opaque surrounding retina.'),
    (v_case_id, 'Which of the following diagnostic workups is most critical in this patient to prevent life-threatening stroke or myocardial infarction?', '["Carotid duplex ultrasound and echocardiogram", "Fluorescein angiography of both eyes", "Coagulation panel including Factor V Leiden", "Temporal artery biopsy", "Brain MRI with contrast"]'::jsonb, 0, 'The most common cause of non-arteritic CRAO is an **embolus originating from an ulcerated carotid artery plaque (Hollenhorst plaque) or the heart**. Therefore, a cardiovascular workup consisting of **carotid duplex ultrasound** and an **echocardiogram** is mandatory to identify source lesions and prevent a subsequent stroke or MI.');

    ---------------------------------------------------------------------------
    -- CASE 23: Case Study: The Blood and Thunder Fundus (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Blood and Thunder Fundus (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Blood and Thunder Fundus (V3)', 'A 81-year-old female with a long history of poorly controlled hypertension and glaucoma presents with a subacute, painless decrease in vision in her right eye over the past 2 days.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 83 bpm | BP: 117/83 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OD):** Mild APD. Dilated fundus exam reveals widespread, diffuse flame-shaped and dot-and-blot hemorrhages in all four quadrants ("blood and thunder fundus"), along with severely tortuous and dilated retinal veins, scattered cotton-wool spots, and significant optic disc and macular edema.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 81-year-old female with a long history of poorly controlled hypertension and glaucoma presents with a subacute, painless decrease in vision in her right eye over the past 2 days.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 83 bpm | BP: 117/83 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OD):** Mild APD. Dilated fundus exam reveals widespread, diffuse flame-shaped and dot-and-blot hemorrhages in all four quadrants ("blood and thunder fundus"), along with severely tortuous and dilated retinal veins, scattered cotton-wool spots, and significant optic disc and macular edema.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Hypertensive crisis with Grade IV retinopathy", "Acute retinal necrosis", "Proliferative diabetic retinopathy with vitreous hemorrhage", "Central retinal artery occlusion (CRAO)", "Central retinal vein occlusion (CRVO)"]'::jsonb, 4, 'This presentation is diagnostic of a **Central Retinal Vein Occlusion (CRVO)**. The hallmark funduscopic finding is the **''blood and thunder'' appearance** (widespread hemorrhages in all 4 quadrants, tortuous dilated veins, disc edema, and cotton-wool spots). It is a venous thrombosis typically occurring at the level of the lamina cribrosa.'),
    (v_case_id, 'What is the primary cause of severe, long-term visual loss in patients with Central Retinal Vein Occlusion?', '["Optic nerve atrophy from direct mechanical venous compression", "Autoimmune destruction of the retinal pigment epithelium", "Total retinal detachment due to subretinal fluid accumulation", "Corneal edema from chronic secondary glaucoma", "Macular edema due to vascular leakage and capillary incompetence"]'::jsonb, 4, 'The most common cause of persistent, long-term visual loss in patients with CRVO is **macular edema** driven by capillary leakage and increased intravascular pressure. High venous pressure triggers blood-retinal barrier breakdown and release of VEGF, leading to chronic fluid accumulation in the macula.'),
    (v_case_id, 'This patient must be monitored closely for ''90-day glaucoma'' (neovascular glaucoma). What drives this complication in ischemic CRVO?', '["Persistent systemic hypertension pushes the lens-iris diaphragm forward", "Chronic blood breakdown products block the trabecular meshwork", "The thrombus in the central retinal vein back-pressures into the vortex veins, blocking outflow", "Widespread retinal ischemia triggers VEGF release, which stimulates new blood vessel growth in the iris and angle", "Anterior uveitis causes pupillary block synechiae"]'::jsonb, 3, 'In ischemic CRVO (defined by large areas of capillary non-perfusion on fluorescein angiography), severe **retinal ischemia** triggers the release of **VEGF**. VEGF diffuses into the anterior segment, causing neovascularization of the iris (rubeosis iridis) and angle, which eventually leads to **neovascular glaucoma** (classically appearing around 90 days, hence "90-day glaucoma").');

    ---------------------------------------------------------------------------
    -- CASE 24: Case Study: The Wavy Lines and Central Dark Spot (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Wavy Lines and Central Dark Spot (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Wavy Lines and Central Dark Spot (V3)', 'A 79-year-old female presents with a sudden onset of distortion in her central vision in the left eye. She complains that straight lines (like doorframes) appear wavy and bent, and she has difficulty reading. She has a long history of dry macular degeneration in both eyes.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 72 bpm | BP: 135/86 mmHg
*   **Visual Acuity:** OS: 20/120; contralateral eye: 20/30
*   **Ocular Examination (OS):** Testing with an Amsler grid confirms significant metamorphopsia (wavy lines) and a central scotoma. Dilated fundus examination reveals multiple, large soft yellowish drusen in the macula, along with a grey-green subretinal elevation, subretinal fluid, and a localized pocket of subretinal hemorrhage in the central fovea.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 79-year-old female presents with a sudden onset of distortion in her central vision in the left eye. She complains that straight lines (like doorframes) appear wavy and bent, and she has difficulty reading. She has a long history of dry macular degeneration in both eyes.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 72 bpm | BP: 135/86 mmHg
*   **Visual Acuity:** OS: 20/120; contralateral eye: 20/30
*   **Ocular Examination (OS):** Testing with an Amsler grid confirms significant metamorphopsia (wavy lines) and a central scotoma. Dilated fundus examination reveals multiple, large soft yellowish drusen in the macula, along with a grey-green subretinal elevation, subretinal fluid, and a localized pocket of subretinal hemorrhage in the central fovea.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following represents the most appropriate first-line treatment for this patient''s current condition?', '["Laser photocoagulation of the central foveal hemorrhage", "Topical prednisolone acetate 1% drops hourly", "Surgical subretinal membrane scraping and vitrectomy", "High-dose antioxidant vitamins and zinc (AREDS2 formulation) alone", "Intravitreal injections of anti-Vascular Endothelial Growth Factor (anti-VEGF) agents (e.g., aflibercept)"]'::jsonb, 4, 'The patient has transitioned from dry to **neovascular (''wet'') Age-Related Macular Degeneration (Wet AMD)**, evidenced by sudden metamorphopsia (wavy lines), subretinal fluid, and hemorrhage. The standard of care is **intravitreal anti-VEGF injections** (e.g., ranibizumab, aflibercept, bevacizumab), which bind VEGF, stopping neovascularization and reducing vascular leakage, often restoring or stabilizing vision. AREDS2 vitamins are for dry AMD and do not treat active choroidal neovascular membranes.'),
    (v_case_id, 'What is the key pathophysiological development that distinguishes ''wet'' AMD from ''dry'' AMD?', '["A sudden mechanical tear in the neurosensory retina due to vitreous traction", "Growth of abnormal choroidal vessels through Bruch''s membrane into the subretinal space (choroidal neovascularization)", "Accumulation of extracellular lipofuscin-rich debris (drusen) in the extracellular space", "Progressive geographic atrophy of the retinal pigment epithelium and photoreceptors", "Occlusion of the central retinal vein at the optic disc"]'::jsonb, 1, 'The defining feature of Wet AMD is **choroidal neovascularization (CNV)**. Unlike Dry AMD, which involves slow atrophy of the RPE and photoreceptors, Wet AMD involves the growth of **abnormal, fragile blood vessels from the choriocapillaris** through breaks in **Bruch''s membrane** into the sub-RPE or subretinal space. These vessels leak fluid, protein, and blood, leading to rapid, severe visual loss.'),
    (v_case_id, 'Which of the following clinical tests is most appropriate for patients with dry AMD to perform at home for early detection of conversion to wet AMD?', '["Self-assessment of peripheral visual field boundaries", "Checking color vision with Ishihara plates weekly", "Frequent self-tonometry using a hand-held tonometer", "Measuring visual acuity using a Snellen pocket card", "Amsler grid testing daily"]'::jsonb, 4, 'Patients with Dry AMD are instructed to use an **Amsler grid daily** to monitor for early signs of Wet AMD. Metamorphopsia (distortion where straight lines appear wavy) or a new central dark spot (scotoma) on the grid are early signs of subretinal fluid or hemorrhage, prompting immediate evaluation and anti-VEGF therapy.');

    ---------------------------------------------------------------------------
    -- CASE 25: Case Study: The Progressive Central Blindness (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Progressive Central Blindness (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Progressive Central Blindness (V3)', 'A 85-year-old male smoker presents with a 2-year history of slowly progressive, bilateral loss of central vision, making it hard to read, sew, or recognize faces. He reports no sudden changes in vision, pain, or flashes of light.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 75 bpm | BP: 129/80 mmHg
*   **Visual Acuity:** OD: 20/50; OS: 20/40 (with correction)
*   **Ocular Examination:** Anterior segments are clear. Amsler grid shows no metamorphopsia (lines are straight) but a mild central blur bilaterally. Dilated fundus examination reveals multiple, bilateral, scattered small and large yellowish-white extracellular deposits (drusen) in the macula, along with localized areas of depigmentation and thinning of the retinal pigment epithelium (geographic atrophy). No subretinal fluid or hemorrhage is present.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 85-year-old male smoker presents with a 2-year history of slowly progressive, bilateral loss of central vision, making it hard to read, sew, or recognize faces. He reports no sudden changes in vision, pain, or flashes of light.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 75 bpm | BP: 129/80 mmHg
*   **Visual Acuity:** OD: 20/50; OS: 20/40 (with correction)
*   **Ocular Examination:** Anterior segments are clear. Amsler grid shows no metamorphopsia (lines are straight) but a mild central blur bilaterally. Dilated fundus examination reveals multiple, bilateral, scattered small and large yellowish-white extracellular deposits (drusen) in the macula, along with localized areas of depigmentation and thinning of the retinal pigment epithelium (geographic atrophy). No subretinal fluid or hemorrhage is present.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the recommended management?', '["Primary open-angle glaucoma; topical prostaglandin drops", "Nuclear cataract; urgent surgical cataract extraction", "Wet age-related macular degeneration; urgent intravitreal anti-VEGF therapy", "Dry age-related macular degeneration; AREDS2 vitamin formulation and smoking cessation", "Toxic retinopathy; immediate discontinuation of hydroxychloroquine"]'::jsonb, 3, 'This patient has **Dry Age-Related Macular Degeneration (Dry AMD)**, characterized by progressive central vision loss, geographic atrophy, and **drusen** without fluid or blood. The recommended management for intermediate/advanced dry AMD is the **AREDS2 vitamin formulation** (antioxidant vitamins C, E, zinc, copper, lutein, and zeaxanthin) to slow progression to advanced stages, along with **smoking cessation** (as smoking is the strongest modifiable risk factor).'),
    (v_case_id, 'What represents the substance known as ''drusen'' that accumulates in this condition?', '["Small microaneurysms that have thrombosed and calcified", "Aggregates of inflammatory cells adhering to the corneal endothelium", "Protein complexes leaking from the vitreous humor", "Extracellular debris including lipofuscin, proteins, and lipids accumulating between the RPE and Bruch''s membrane", "Abnormal collagen fibers deposited within the stroma of the cornea"]'::jsonb, 3, '**Drusen** are **yellowish extracellular deposits** consisting of undigested cellular waste products (like lipofuscin), proteins, and lipids that accumulate in the extracellular space between the **retinal pigment epithelium (RPE) and Bruch''s membrane**. Their accumulation disrupts RPE function and leads to secondary degeneration of the overlying photoreceptors.'),
    (v_case_id, 'Why was beta-carotene removed and replaced with Lutein and Zeaxanthin in the AREDS2 clinical trial formulation?', '["Beta-carotene interfered with the absorption of zinc and copper", "Beta-carotene caused severe corneal endothelial deposits", "Beta-carotene was found to significantly increase the risk of lung cancer in smokers", "Lutein has superior activity against choroidal neovascularization", "Lutein and Zeaxanthin were found to lower intraocular pressure"]'::jsonb, 2, 'Beta-carotene was replaced with **Lutein and Zeaxanthin** in the AREDS2 formulation because large clinical trials (like the CARET and ATBC studies) demonstrated that **beta-carotene significantly increases the risk of lung cancer in smokers**. Since many AMD patients have a history of smoking, removing beta-carotene made the formulation safer while maintaining efficacy.');

    ---------------------------------------------------------------------------
    -- CASE 26: Case Study: The Floating Red Cobwebs (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Floating Red Cobwebs (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Floating Red Cobwebs (V3)', 'A 57-year-old male with a 15-year history of insulin-dependent diabetes presents with a sudden onset of multiple floating dark spots and red cobweb-like lines in the left eye, followed by severe, painless blurring of vision. He has had no eye trauma.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 78 bpm | BP: 122/79 mmHg
*   **Visual Acuity:** OS: 20/400; contralateral eye: 20/25
*   **Ocular Examination (OS):** The red reflex is severely dim/absent. Slit-lamp exam shows clear cornea and a quiet anterior chamber. On dilated exam, the vitreous cavity is filled with suspended red blood cells, completely obscuring the details of the optic nerve and retinal vasculature. Contralateral eye shows proliferative diabetic retinopathy with neovascularization.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 57-year-old male with a 15-year history of insulin-dependent diabetes presents with a sudden onset of multiple floating dark spots and red cobweb-like lines in the left eye, followed by severe, painless blurring of vision. He has had no eye trauma.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 78 bpm | BP: 122/79 mmHg
*   **Visual Acuity:** OS: 20/400; contralateral eye: 20/25
*   **Ocular Examination (OS):** The red reflex is severely dim/absent. Slit-lamp exam shows clear cornea and a quiet anterior chamber. On dilated exam, the vitreous cavity is filled with suspended red blood cells, completely obscuring the details of the optic nerve and retinal vasculature. Contralateral eye shows proliferative diabetic retinopathy with neovascularization.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the initial management step?', '["Vitreous hemorrhage; elevate the head of the bed, perform ocular ultrasound (B-scan) to rule out retinal detachment, and observe", "Central retinal artery occlusion; perform urgent anterior chamber paracentesis", "Acute angle-closure glaucoma; administer IV acetazolamide", "Rhegmatogenous retinal detachment; perform immediate pneumatic retinopexy", "CMV retinitis; initiate systemic and intravitreal ganciclovir"]'::jsonb, 0, 'This patient has a **Vitreous Hemorrhage**, a common complication of **Proliferative Diabetic Retinopathy**. The initial steps are: (1) **elevate the head of the bed (30-45 degrees)** to allow the blood to settle inferiorly, clearing the visual axis, (2) perform an **ocular B-scan ultrasound** to ensure the underlying retina is flat and not detached (since the fundus cannot be visualized), and (3) observe, as many hemorrhages clear spontaneously over weeks to months.'),
    (v_case_id, 'What is the primary anatomical source of blood in a diabetic patient presenting with a vitreous hemorrhage?', '["Fragile, abnormal new vessels (neovascularization) growing along the vitreous face and retina that rupture easily", "A full-thickness retinal tear that shears a healthy retinal arteriole", "Rupture of ciliary body capillaries due to high intraocular pressure", "A tear in a major branch retinal vein due to severe systemic hypertension", "Bleeding from abnormal choroidal neovascular membranes through Bruch''s membrane"]'::jsonb, 0, 'In diabetes, **vitreous hemorrhage** is caused by the **rupture of fragile neovascular vessels (NVD or NVE)**. These abnormal vessels lack a normal muscular coat and tight endothelial junctions, making them extremely fragile. When the vitreous contracts or moves, it exerts traction on these vessels, causing them to tear and bleed directly into the vitreous cavity.'),
    (v_case_id, 'In which of the following scenarios is an URGENT pars plana vitrectomy indicated for a patient with a vitreous hemorrhage?', '["The presence of hard lipid exudates on the retinal surface", "The presence of dry age-related macular degeneration in the contralateral eye", "The presence of a tractional or rhegmatogenous retinal detachment on B-scan ultrasound, or non-clearing hemorrhage >3-6 months", "An elevated intraocular pressure of 22 mmHg in the affected eye", "Any vitreous hemorrhage in a patient with a history of hypertension"]'::jsonb, 2, 'An **urgent pars plana vitrectomy** is indicated if: (1) **B-scan ultrasound reveals an associated retinal detachment (tractional or rhegmatogenous)**, (2) the hemorrhage fails to clear after 3 to 6 months of conservative observation, preventing visual recovery and treatment, or (3) neovascularization of the iris/angle (rubeosis) develops, requiring clear media to perform PRP.');

    ---------------------------------------------------------------------------
    -- CASE 27: Case Study: The AIDS-Related Blindness (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The AIDS-Related Blindness (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The AIDS-Related Blindness (V3)', 'A 34-year-old male with HIV presents with a 1-week history of floaters, flashes of light, and blurred vision in the left eye. He admits to non-compliance with antiretroviral therapy (ART). His CD4 count is 35 cells/mcL.

**Physical Examination:**
*   **Vitals:** Temp: 99.0°F | HR: 72 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior chamber is quiet. Vitreous shows minimal inflammatory cells (1+). Dilated fundus examination reveals multiple, confluent, thick, yellow-white necrotic retinal lesions with perivascular sheathing and extensive, flame-shaped retinal hemorrhages along the vascular arches, giving a "pizza-pie" or "scrambled eggs and ketchup" appearance.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 34-year-old male with HIV presents with a 1-week history of floaters, flashes of light, and blurred vision in the left eye. He admits to non-compliance with antiretroviral therapy (ART). His CD4 count is 35 cells/mcL.

**Physical Examination:**
*   **Vitals:** Temp: 99.0°F | HR: 72 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior chamber is quiet. Vitreous shows minimal inflammatory cells (1+). Dilated fundus examination reveals multiple, confluent, thick, yellow-white necrotic retinal lesions with perivascular sheathing and extensive, flame-shaped retinal hemorrhages along the vascular arches, giving a "pizza-pie" or "scrambled eggs and ketchup" appearance.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the first-line therapy?', '["Bacterial endophthalmitis; intravitreal vancomycin and ceftazidime", "Acute retinal necrosis (ARN); intravenous acyclovir and oral valacyclovir", "Syphilitic chorioretinitis; intravenous penicillin G for 14 days", "Cytomegalovirus (CMV) retinitis; systemic valganciclovir and/or intravitreal ganciclovir, plus initiation of ART", "Toxoplasma chorioretinitis; pyrimethamine, sulfadiazine, and folinic acid"]'::jsonb, 3, 'This patient has **CMV Retinitis**, the most common opportunistic ocular infection in AIDS patients, typically occurring when the **CD4 count is <50 cells/mcL**. The classic fundus appearance is a **"pizza-pie" or "scrambled eggs and ketchup" pattern** of yellow-white necrotic lesions and massive hemorrhages. First-line therapy consists of **antivirals (ganciclovir/valganciclovir or foscarnet)** administered systemically and/or intravitreally, along with the **initiation or optimization of ART**.'),
    (v_case_id, 'Why is there typically very little vitreous cell or anterior chamber inflammation (vitritis/iritis) seen in patients with active CMV retinitis?', '["CMV selectively infects only the outer photoreceptors, sparing vascular structures", "The blood-aqueous barrier is completely impermeable to CMV antigens", "CMV produces potent anti-inflammatory cytokines that suppress local T-cells", "The severe immunosuppression prevents the host from mounting an inflammatory response (quiet vitreous)", "The virus is physically restricted to the subretinal space"]'::jsonb, 3, 'Active CMV retinitis characteristically presents with **minimal vitreous or anterior segment inflammation (quiet vitreous)**. This is because patients are **severely immunocompromised (CD4 < 50)** and cannot mount a cellular inflammatory response. If the immune system recovers (e.g., after starting ART), a massive inflammatory reaction can occur, known as **Immune Reconstitution Inflammatory Syndrome (IRIS)**, presenting as severe vitritis and macular edema.'),
    (v_case_id, 'What is the most common vision-threatening complication of CMV retinitis, occurring in up to 30% of patients?', '["Corneal stromal necrosis", "Rhegmatogenous retinal detachment", "Tractional retinal detachment", "Neovascular glaucoma", "Sympathetic ophthalmia"]'::jsonb, 1, 'The most common and feared complication of CMV retinitis is **rhegmatogenous retinal detachment**. The CMV virus causes full-thickness **necrosis and thinning of the retina**, leaving behind fragile, paper-thin necrotic tissue. As the vitreous contracts or pulls, multiple peripheral retinal holes and tears easily form, leading to a high rate of RRD that often requires complex surgery with silicone oil tamponade.');

    ---------------------------------------------------------------------------
    -- CASE 28: Case Study: The Painful Confluent Necrosis (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Painful Confluent Necrosis (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Painful Confluent Necrosis (V3)', 'A healthy, immunocompetent 44-year-old male presents with a 4-day history of severe, boring pain, redness, photophobia, and rapidly worsening vision in the right eye. He has no systemic symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 68 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OD):** Moderate episcleral injection. Slit-lamp shows 2+ granulomatous keratic precipitates on the corneal endothelium and 2+ cell/flare in the anterior chamber. There is significant **vitritis (3+)** obscuring the fundus. Dilated fundus examination reveals confluent, patch-like areas of yellowish-white peripheral retinal necrosis that are spreading circumferentially, with prominent retinal arteritis (perivascular sheathing).', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A healthy, immunocompetent 44-year-old male presents with a 4-day history of severe, boring pain, redness, photophobia, and rapidly worsening vision in the right eye. He has no systemic symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 68 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OD):** Moderate episcleral injection. Slit-lamp shows 2+ granulomatous keratic precipitates on the corneal endothelium and 2+ cell/flare in the anterior chamber. There is significant **vitritis (3+)** obscuring the fundus. Dilated fundus examination reveals confluent, patch-like areas of yellowish-white peripheral retinal necrosis that are spreading circumferentially, with prominent retinal arteritis (perivascular sheathing).', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary causative pathogen?', '["Acute Retinal Necrosis (ARN); Varicella-Zoster Virus (VZV) or Herpes Simplex Virus (HSV)", "Endogenous bacterial endophthalmitis; Staphylococcus aureus", "CMV retinitis; Cytomegalovirus in a patient with undiagnosed AIDS", "Vogt-Koyanagi-Harada disease; autoimmune reaction to melanocytes", "Toxocariasis; Toxocara canis roundworm infection"]'::jsonb, 0, 'This is **Acute Retinal Necrosis (ARN)**, which characteristically occurs in **immunocompetent** hosts. It is caused by herpesviruses, most commonly **Varicella-Zoster Virus (VZV)** or **Herpes Simplex Virus (HSV-1 or HSV-2)**. Key clinical features include: (1) severe ocular pain and redness, (2) severe **vitritis** (unlike CMV), and (3) confluent, peripheral **yellowish-white retinal necrosis** with retinal arteritis. Treatment is an emergency, requiring IV acyclovir or oral valacyclovir, combined with intravitreal ganciclovir.'),
    (v_case_id, 'Why is systemic corticosteroid therapy often used as an adjunct in the treatment of Acute Retinal Necrosis, and when should it be initiated?', '["Corticosteroids are started immediately before antivirals to open the blood-retinal barrier", "Corticosteroids are started 24-48 hours after antiviral therapy to reduce the severe, vision-threatening vitreous inflammation", "Corticosteroids are used as monotherapy to suppress the autoimmune destruction of the retina", "Corticosteroids are strictly contraindicated because they promote viral replication in the retina", "Corticosteroids are used to prevent systemic viral spreading to the brain"]'::jsonb, 1, 'Systemic **corticosteroids** (prednisone) are used as an adjunct to **reduce the severe, vision-threatening vitritis** and vascular inflammation associated with ARN. However, they must **never be given alone or before antivirals**. They are initiated **24 to 48 hours AFTER adequate antiviral therapy** has begun, ensuring that the viral replication is controlled so that steroids do not promote uncontrolled necrotizing viral spread.'),
    (v_case_id, 'What is the most common long-term complication of Acute Retinal Necrosis, occurring in over 75% of untreated patients?', '["Sympathetic ophthalmia in the contralateral eye", "Tractional retinal detachment due to fibrovascular membranes", "Rhegmatogenous retinal detachment due to peripheral retinal holes", "Neovascular glaucoma from persistent retinal ischemia", "Phacolytic glaucoma from lens protein leakage"]'::jsonb, 2, 'The most common and devastating complication of ARN is **rhegmatogenous retinal detachment**, occurring in **75-85% of untreated cases**. As the large, confluent zones of peripheral necrotic retina heal, they become paper-thin and develop **multiple, large, irregular tears and holes**. The severe vitritis also causes vitreous condensation and traction, pulling the torn retina off. Prophylactic laser retinopexy is often performed around necrotic areas to prevent this.');

    ---------------------------------------------------------------------------
    -- CASE 29: Case Study: The Segmental Shadow (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Segmental Shadow (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Segmental Shadow (V3)', 'A 68-year-old male with a history of carotid artery disease and smoking presents with a sudden, painless loss of the upper half of his visual field in the right eye that occurred 4 hours ago. His central vision is only mildly blurry.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 75 bpm | BP: 138/77 mmHg
*   **Visual Acuity:** OD: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OD):** No APD (or trace APD). Dilated fundus exam reveals a sharply demarcated, wedge-shaped area of pale, edematous retina confined to the inferior-temporal quadrant. At the first bifurcation of the inferior temporal retinal artery, there is a small, highly reflective, golden-yellow plaque (Hollenhorst plaque) obstructing the lumen.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 68-year-old male with a history of carotid artery disease and smoking presents with a sudden, painless loss of the upper half of his visual field in the right eye that occurred 4 hours ago. His central vision is only mildly blurry.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 75 bpm | BP: 138/77 mmHg
*   **Visual Acuity:** OD: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OD):** No APD (or trace APD). Dilated fundus exam reveals a sharply demarcated, wedge-shaped area of pale, edematous retina confined to the inferior-temporal quadrant. At the first bifurcation of the inferior temporal retinal artery, there is a small, highly reflective, golden-yellow plaque (Hollenhorst plaque) obstructing the lumen.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Branch retinal artery occlusion (BRAO)", "Rhegmatogenous retinal detachment", "Central retinal artery occlusion (CRAO)", "Ischemic optic neuropathy", "Branch retinal vein occlusion (BRVO)"]'::jsonb, 0, 'This patient has a **Branch Retinal Artery Occlusion (BRAO)**. The clinical features are highly classic: sudden, painless, **segmental visual field loss** (corresponding to the blocked vessel), and a wedge-shaped area of **retinal pallor and edema** in the distribution of a branch arteriole, often with a visible **Hollenhorst plaque** at the bifurcation.'),
    (v_case_id, 'What is the primary composition and origin of a Hollenhorst plaque?', '["Cholesterol embolus originating from an atheromatous plaque in the internal carotid artery", "Amyloid protein aggregate from systemic amyloidosis", "Calcific embolus originating from a stenotic aortic valve", "Platelet-fibrin thrombus originating from the left atrium in atrial fibrillation", "Thrombus composed of sickled erythrocytes from ciliary vessels"]'::jsonb, 0, 'A **Hollenhorst plaque** is a **cholesterol embolus** that originates from an **atheromatous, ulcerated plaque in the ipsilateral internal carotid artery** (or aorta). It travels in the bloodstream and becomes lodged at a bifurcation of the retinal vasculature, where the vessel diameter narrows. It appears highly reflective, shiny, and golden-yellow.'),
    (v_case_id, 'How does the prognosis of visual acuity in BRAO generally compare to CRAO, and why?', '["Significantly better, because the central fovea is usually spared and the macular perfusion is maintained by the unaffected arterioles", "Better, because the blocked arteriole undergoes spontaneous recanalization within minutes", "Identical, because both result in complete degeneration of the optic nerve head", "Worse, because BRAO is highly associated with systemic vasculitis like Giant Cell Arteritis", "Worse, because branch arterioles are smaller and more prone to permanent spasm"]'::jsonb, 0, 'The prognosis for visual acuity in BRAO is **significantly better than in CRAO**. In BRAO, because only a branch arteriole is occluded, the central fovea is usually spared (unless the macular branch itself is involved), allowing the patient to maintain good central vision (20/40 or better in 80% of cases), though they will have a permanent, segmental visual field defect.');

    ---------------------------------------------------------------------------
    -- CASE 30: Case Study: The Silent Tension (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Silent Tension (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Silent Tension (V3)', 'A 67-year-old female with a history of poorly controlled type 1 diabetes and severe proliferative diabetic retinopathy presents with a slowly progressive, painless decrease in vision in her right eye over the past 2 months.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 70 bpm | BP: 136/75 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/40
*   **Ocular Examination (OD):** Quiet anterior chamber. Dilated fundus examination reveals dense, white fibrovascular membranes in the vitreous cavity that are adherent to the retina. These bands are contracting and mechanically pulling the neurosensory retina away from the underlying RPE, creating a smooth, immobile, dome-like elevation of the retina. No retinal tears or holes are seen.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 67-year-old female with a history of poorly controlled type 1 diabetes and severe proliferative diabetic retinopathy presents with a slowly progressive, painless decrease in vision in her right eye over the past 2 months.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 70 bpm | BP: 136/75 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/40
*   **Ocular Examination (OD):** Quiet anterior chamber. Dilated fundus examination reveals dense, white fibrovascular membranes in the vitreous cavity that are adherent to the retina. These bands are contracting and mechanically pulling the neurosensory retina away from the underlying RPE, creating a smooth, immobile, dome-like elevation of the retina. No retinal tears or holes are seen.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary surgical management?', '["Tractional retinal detachment; pars plana vitrectomy with membrane peeling and endolaser", "Rhegmatogenous retinal detachment; urgent pneumatic retinopexy", "Exudative retinal detachment; systemic corticosteroids and immunosuppressants", "Proliferative diabetic retinopathy; panretinal photocoagulation (PRP) alone", "Neovascular glaucoma; surgical trabeculectomy"]'::jsonb, 0, 'This is a **Tractional Retinal Detachment (TRD)**, a severe complication of proliferative diabetic retinopathy. Treatment requires **pars plana vitrectomy** to remove the vitreous gel, followed by **micro-surgical membrane peeling** to release the tractional forces pulling the retina, and **intraoperative endolaser (PRP)** to regress the neovascularization.'),
    (v_case_id, 'What is the key pathophysiological driver that leads to Tractional Retinal Detachment in diabetic patients?', '["Infiltration of the subretinal space by neoplastic retinoblastoma cells", "Liquefied vitreous leaks through a full-thickness retinal hole, dissecting the retina", "Severe systemic hypertension causes transudative fluid to leak under the retina", "Deposition of amyloid plaques that stiffen the sensory retina", "Ischemia-induced neovascularization grows along the posterior vitreous face, creating fibrovascular membranes that contract over time"]'::jsonb, 4, 'In proliferative diabetic retinopathy, chronic retinal ischemia drives the growth of abnormal new vessels (**neovascularization**). These vessels grow out of the retina and along the **posterior vitreous face**, accompanied by a scaffolding of fibrous tissue. Over time, these **fibrovascular membranes contract**, mechanically pulling the neurosensory retina off the underlying RPE.'),
    (v_case_id, 'Which of the following clinical features helps differentiate a Tractional Retinal Detachment from a Rhegmatogenous Retinal Detachment?', '["Tractional RD resolves spontaneously with steroid drops", "Tractional RD presents with sudden flashes, floaters, a corrugated wrinkled surface, and a horseshoe tear", "Tractional RD is associated with high intraocular pressure and corneal clouding", "Tractional RD is always bilateral and associated with systemic arthritis", "Tractional RD is characteristically slowly progressive, has a smooth/concave surface, is non-shifting, and lacks retinal holes/tears"]'::jsonb, 4, '**Tractional RD** is slowly progressive, has a **smooth, concave surface, is non-shifting** (does not move with gravity/head position), and **lacks full-thickness retinal tears/holes**. **Rhegmatogenous RD** is rapid in onset, has a **corrugated, wrinkled, convex surface, shifts with gravity**, and **always has a causative retinal tear/hole**.');

    ---------------------------------------------------------------------------
    -- CASE 31: The Falling Curtain - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Falling Curtain - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Falling Curtain - Case Analysis (V4)', 'A 45-year-old male presents with a sudden onset of flashes of light (photopsias) and a shower of small dark floaters in the left eye, followed by a dark curtain-like shadow descending over the upper half of his vision. He has a history of high myopia.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 73 bpm | BP: 118/76 mmHg
*   **Visual Acuity:** OS: 20/200 (no improvement with pinhole); OS: 20/20
*   **Ocular Examination (OS):** Anterior chamber is quiet. Slit-lamp exam of the anterior vitreous reveals small, brown-pigmented cells ("tobacco dust" or Shafer''s sign). Dilated fundus exam reveals a grey, elevated, corrugated, and wrinkled retina in the inferior-temporal sector with a large, crescentic horseshoe-shaped retinal tear.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old male presents with a sudden onset of flashes of light (photopsias) and a shower of small dark floaters in the left eye, followed by a dark curtain-like shadow descending over the upper half of his vision. He has a history of high myopia.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 73 bpm | BP: 118/76 mmHg
*   **Visual Acuity:** OS: 20/200 (no improvement with pinhole); OS: 20/20
*   **Ocular Examination (OS):** Anterior chamber is quiet. Slit-lamp exam of the anterior vitreous reveals small, brown-pigmented cells ("tobacco dust" or Shafer''s sign). Dilated fundus exam reveals a grey, elevated, corrugated, and wrinkled retina in the inferior-temporal sector with a large, crescentic horseshoe-shaped retinal tear.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the immediate management?', '["Acute retinal necrosis; immediate intravenous acyclovir", "Rhegmatogenous retinal detachment; urgent ophthalmology referral for surgical repair", "Dry age-related macular degeneration; high-dose AREDS2 vitamins", "Vitreous hemorrhage; bed rest and head elevation of 45 degrees", "Central retinal artery occlusion; immediate ocular massage and hyperbaric oxygen"]'::jsonb, 1, 'This patient has a classic **Rhegmatogenous Retinal Detachment (RRD)** with a visible horseshoe tear. The presence of flashes, floaters, and a "curtain" visual field loss are hallmarks. The immediate management is an **urgent referral to an ophthalmologist** for surgical reattachment (e.g., vitrectomy, scleral buckle, or pneumatic retinopexy) to prevent permanent macular visual loss (if macula is "on").'),
    (v_case_id, 'What is the pathophysiological mechanism responsible for this specific type of retinal detachment?', '["A direct vascular tear causing blood accumulation that mechanically dissects the retina", "Exudative leakage of fluid from choroidal vessels directly into the subretinal space due to high systemic pressure", "Contraction of retroretinal fibrous membranes pulling the neurosensory retina away from the pigment epithelium", "Hypersecretion of subretinal fluid by hypertrophied retinal pigment epithelial cells", "Vitreous liquefaction and traction create a full-thickness retinal tear, allowing liquefied vitreous to enter the subretinal space"]'::jsonb, 4, 'Rhegmatogenous RD (from *rhegma*, meaning tear) occurs when **vitreous liquefaction (synchysis)** and **vitreous traction** lead to a posterior vitreous detachment (PVD) that pulls on and tears the retina. Liquefied vitreous then passes through the tear into the subretinal space, separating the neurosensory retina from the underlying retinal pigment epithelium (RPE).'),
    (v_case_id, 'What does the clinical sign of ''tobacco dust'' (Shafer''s sign) in the anterior vitreous represent?', '["Degenerated red blood cells from a vitreous hemorrhage", "Clumps of white blood cells indicating an active vitritis", "Pigmented retinal pigment epithelial (RPE) cells released into the vitreous following a retinal tear", "Calcified deposits on the lens zonules", "Deposits of amyloid protein on the posterior vitreous face"]'::jsonb, 2, '**Shafer''s sign** ("tobacco dust") represents **pigmented RPE cells** that have escaped through a full-thickness retinal tear into the vitreous cavity. It is a highly specific sign of a retinal tear or detachment, even if the tear itself is not immediately visible.');

    ---------------------------------------------------------------------------
    -- CASE 32: The Pale Retina and Cherry-Red Spot - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pale Retina and Cherry-Red Spot - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pale Retina and Cherry-Red Spot - Case Analysis (V4)', 'A 57-year-old female with a history of hypertension, hyperlipidemia, and coronary artery disease presents with a sudden, complete, painless loss of vision in the left eye that occurred 2 hours ago. She denies any preceding trauma or ocular symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 78 bpm | BP: 133/88 mmHg
*   **Visual Acuity:** OS: Count Fingers; contralateral eye: 20/20
*   **Ocular Examination (OS):** A positive relative afferent pupillary defect (APD). Dilated fundus examination reveals marked, generalized pallor and edema of the retina, except for a bright, circumscribed "cherry-red spot" in the central fovea. The retinal arterioles are severely narrowed, and segmenting blood columns ("box-carring") are visible.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 57-year-old female with a history of hypertension, hyperlipidemia, and coronary artery disease presents with a sudden, complete, painless loss of vision in the left eye that occurred 2 hours ago. She denies any preceding trauma or ocular symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 78 bpm | BP: 133/88 mmHg
*   **Visual Acuity:** OS: Count Fingers; contralateral eye: 20/20
*   **Ocular Examination (OS):** A positive relative afferent pupillary defect (APD). Dilated fundus examination reveals marked, generalized pallor and edema of the retina, except for a bright, circumscribed "cherry-red spot" in the central fovea. The retinal arterioles are severely narrowed, and segmenting blood columns ("box-carring") are visible.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the initial emergency management?', '["Vitreous hemorrhage; urgent pars plana vitrectomy", "Giant cell arteritis; high-dose oral prednisone monotherapy", "Central retinal artery occlusion (CRAO); ocular massage, hyperventilate into a paper bag, or AC paracentesis", "Rhegmatogenous retinal detachment; pneumatic retinopexy", "Central retinal vein occlusion (CRVO); intravitreal anti-VEGF injection within 24 hours"]'::jsonb, 2, 'This is a classic **Central Retinal Artery Occlusion (CRAO)**. It is an ocular emergency analogous to an ischemic stroke. Initial management (within 4 hours of onset) aims to dislodge the embolus and restore perfusion by lowering IOP (via **ocular massage**, **anterior chamber paracentesis**, or IV acetazolamide) or causing vasodilation (breathing into a paper bag to raise CO2 levels).'),
    (v_case_id, 'Why does a ''cherry-red spot'' appear in the macula of patients with Central Retinal Artery Occlusion?', '["The thin foveola lacks inner retinal layers and is supplied by the underlying choroid, which shines red against the pale, ischemic surrounding retina", "The cherry-red spot represents the embolus itself wedged in the macular arteriole", "Selective hyper-perfusion of the fovea by a patent cilioretinal artery", "A localized pool of blood accumulates in the subretinal space directly beneath the fovea", "Severe localized inflammation of the macular photoreceptors"]'::jsonb, 0, 'The **cherry-red spot** appears because the foveola is extremely thin and lacks the inner retinal layers (ganglion cells, nerve fibers) that become pale, swollen, and edematous when ischemic. Because the foveola is supplied primarily by the underlying choriocapillaris (which is fed by the ciliary arteries, not the blocked central retinal artery), the vascular choroid continues to shine red through the thin, transparent foveal tissue, contrasting with the pale, opaque surrounding retina.'),
    (v_case_id, 'Which of the following diagnostic workups is most critical in this patient to prevent life-threatening stroke or myocardial infarction?', '["Brain MRI with contrast", "Coagulation panel including Factor V Leiden", "Fluorescein angiography of both eyes", "Temporal artery biopsy", "Carotid duplex ultrasound and echocardiogram"]'::jsonb, 4, 'The most common cause of non-arteritic CRAO is an **embolus originating from an ulcerated carotid artery plaque (Hollenhorst plaque) or the heart**. Therefore, a cardiovascular workup consisting of **carotid duplex ultrasound** and an **echocardiogram** is mandatory to identify source lesions and prevent a subsequent stroke or MI.');

    ---------------------------------------------------------------------------
    -- CASE 33: The Blood and Thunder Fundus - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blood and Thunder Fundus - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blood and Thunder Fundus - Case Analysis (V4)', 'A 81-year-old male with a long history of poorly controlled hypertension and glaucoma presents with a subacute, painless decrease in vision in his left eye over the past 2 days.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 72 bpm | BP: 137/86 mmHg
*   **Visual Acuity:** OS: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OS):** Mild APD. Dilated fundus exam reveals widespread, diffuse flame-shaped and dot-and-blot hemorrhages in all four quadrants ("blood and thunder fundus"), along with severely tortuous and dilated retinal veins, scattered cotton-wool spots, and significant optic disc and macular edema.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 81-year-old male with a long history of poorly controlled hypertension and glaucoma presents with a subacute, painless decrease in vision in his left eye over the past 2 days.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 72 bpm | BP: 137/86 mmHg
*   **Visual Acuity:** OS: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OS):** Mild APD. Dilated fundus exam reveals widespread, diffuse flame-shaped and dot-and-blot hemorrhages in all four quadrants ("blood and thunder fundus"), along with severely tortuous and dilated retinal veins, scattered cotton-wool spots, and significant optic disc and macular edema.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Hypertensive crisis with Grade IV retinopathy", "Central retinal artery occlusion (CRAO)", "Acute retinal necrosis", "Central retinal vein occlusion (CRVO)", "Proliferative diabetic retinopathy with vitreous hemorrhage"]'::jsonb, 3, 'This presentation is diagnostic of a **Central Retinal Vein Occlusion (CRVO)**. The hallmark funduscopic finding is the **''blood and thunder'' appearance** (widespread hemorrhages in all 4 quadrants, tortuous dilated veins, disc edema, and cotton-wool spots). It is a venous thrombosis typically occurring at the level of the lamina cribrosa.'),
    (v_case_id, 'What is the primary cause of severe, long-term visual loss in patients with Central Retinal Vein Occlusion?', '["Optic nerve atrophy from direct mechanical venous compression", "Total retinal detachment due to subretinal fluid accumulation", "Macular edema due to vascular leakage and capillary incompetence", "Autoimmune destruction of the retinal pigment epithelium", "Corneal edema from chronic secondary glaucoma"]'::jsonb, 2, 'The most common cause of persistent, long-term visual loss in patients with CRVO is **macular edema** driven by capillary leakage and increased intravascular pressure. High venous pressure triggers blood-retinal barrier breakdown and release of VEGF, leading to chronic fluid accumulation in the macula.'),
    (v_case_id, 'This patient must be monitored closely for ''90-day glaucoma'' (neovascular glaucoma). What drives this complication in ischemic CRVO?', '["Persistent systemic hypertension pushes the lens-iris diaphragm forward", "Widespread retinal ischemia triggers VEGF release, which stimulates new blood vessel growth in the iris and angle", "Chronic blood breakdown products block the trabecular meshwork", "The thrombus in the central retinal vein back-pressures into the vortex veins, blocking outflow", "Anterior uveitis causes pupillary block synechiae"]'::jsonb, 1, 'In ischemic CRVO (defined by large areas of capillary non-perfusion on fluorescein angiography), severe **retinal ischemia** triggers the release of **VEGF**. VEGF diffuses into the anterior segment, causing neovascularization of the iris (rubeosis iridis) and angle, which eventually leads to **neovascular glaucoma** (classically appearing around 90 days, hence "90-day glaucoma").');

    ---------------------------------------------------------------------------
    -- CASE 34: The Wavy Lines and Central Dark Spot - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Wavy Lines and Central Dark Spot - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Wavy Lines and Central Dark Spot - Case Analysis (V4)', 'A 72-year-old male presents with a sudden onset of distortion in his central vision in the left eye. He complains that straight lines (like doorframes) appear wavy and bent, and he has difficulty reading. He has a long history of dry macular degeneration in both eyes.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 70 bpm | BP: 117/79 mmHg
*   **Visual Acuity:** OS: 20/120; contralateral eye: 20/30
*   **Ocular Examination (OS):** Testing with an Amsler grid confirms significant metamorphopsia (wavy lines) and a central scotoma. Dilated fundus examination reveals multiple, large soft yellowish drusen in the macula, along with a grey-green subretinal elevation, subretinal fluid, and a localized pocket of subretinal hemorrhage in the central fovea.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 72-year-old male presents with a sudden onset of distortion in his central vision in the left eye. He complains that straight lines (like doorframes) appear wavy and bent, and he has difficulty reading. He has a long history of dry macular degeneration in both eyes.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 70 bpm | BP: 117/79 mmHg
*   **Visual Acuity:** OS: 20/120; contralateral eye: 20/30
*   **Ocular Examination (OS):** Testing with an Amsler grid confirms significant metamorphopsia (wavy lines) and a central scotoma. Dilated fundus examination reveals multiple, large soft yellowish drusen in the macula, along with a grey-green subretinal elevation, subretinal fluid, and a localized pocket of subretinal hemorrhage in the central fovea.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following represents the most appropriate first-line treatment for this patient''s current condition?', '["High-dose antioxidant vitamins and zinc (AREDS2 formulation) alone", "Laser photocoagulation of the central foveal hemorrhage", "Topical prednisolone acetate 1% drops hourly", "Intravitreal injections of anti-Vascular Endothelial Growth Factor (anti-VEGF) agents (e.g., aflibercept)", "Surgical subretinal membrane scraping and vitrectomy"]'::jsonb, 3, 'The patient has transitioned from dry to **neovascular (''wet'') Age-Related Macular Degeneration (Wet AMD)**, evidenced by sudden metamorphopsia (wavy lines), subretinal fluid, and hemorrhage. The standard of care is **intravitreal anti-VEGF injections** (e.g., ranibizumab, aflibercept, bevacizumab), which bind VEGF, stopping neovascularization and reducing vascular leakage, often restoring or stabilizing vision. AREDS2 vitamins are for dry AMD and do not treat active choroidal neovascular membranes.'),
    (v_case_id, 'What is the key pathophysiological development that distinguishes ''wet'' AMD from ''dry'' AMD?', '["Growth of abnormal choroidal vessels through Bruch''s membrane into the subretinal space (choroidal neovascularization)", "Accumulation of extracellular lipofuscin-rich debris (drusen) in the extracellular space", "Occlusion of the central retinal vein at the optic disc", "A sudden mechanical tear in the neurosensory retina due to vitreous traction", "Progressive geographic atrophy of the retinal pigment epithelium and photoreceptors"]'::jsonb, 0, 'The defining feature of Wet AMD is **choroidal neovascularization (CNV)**. Unlike Dry AMD, which involves slow atrophy of the RPE and photoreceptors, Wet AMD involves the growth of **abnormal, fragile blood vessels from the choriocapillaris** through breaks in **Bruch''s membrane** into the sub-RPE or subretinal space. These vessels leak fluid, protein, and blood, leading to rapid, severe visual loss.'),
    (v_case_id, 'Which of the following clinical tests is most appropriate for patients with dry AMD to perform at home for early detection of conversion to wet AMD?', '["Checking color vision with Ishihara plates weekly", "Frequent self-tonometry using a hand-held tonometer", "Self-assessment of peripheral visual field boundaries", "Measuring visual acuity using a Snellen pocket card", "Amsler grid testing daily"]'::jsonb, 4, 'Patients with Dry AMD are instructed to use an **Amsler grid daily** to monitor for early signs of Wet AMD. Metamorphopsia (distortion where straight lines appear wavy) or a new central dark spot (scotoma) on the grid are early signs of subretinal fluid or hemorrhage, prompting immediate evaluation and anti-VEGF therapy.');

    ---------------------------------------------------------------------------
    -- CASE 35: The Progressive Central Blindness - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Progressive Central Blindness - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Progressive Central Blindness - Case Analysis (V4)', 'A 78-year-old female smoker presents with a 2-year history of slowly progressive, bilateral loss of central vision, making it hard to read, sew, or recognize faces. She reports no sudden changes in vision, pain, or flashes of light.

**Physical Examination:**
*   **Vitals:** Temp: 98.1°F | HR: 81 bpm | BP: 127/87 mmHg
*   **Visual Acuity:** OD: 20/50; OS: 20/40 (with correction)
*   **Ocular Examination:** Anterior segments are clear. Amsler grid shows no metamorphopsia (lines are straight) but a mild central blur bilaterally. Dilated fundus examination reveals multiple, bilateral, scattered small and large yellowish-white extracellular deposits (drusen) in the macula, along with localized areas of depigmentation and thinning of the retinal pigment epithelium (geographic atrophy). No subretinal fluid or hemorrhage is present.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 78-year-old female smoker presents with a 2-year history of slowly progressive, bilateral loss of central vision, making it hard to read, sew, or recognize faces. She reports no sudden changes in vision, pain, or flashes of light.

**Physical Examination:**
*   **Vitals:** Temp: 98.1°F | HR: 81 bpm | BP: 127/87 mmHg
*   **Visual Acuity:** OD: 20/50; OS: 20/40 (with correction)
*   **Ocular Examination:** Anterior segments are clear. Amsler grid shows no metamorphopsia (lines are straight) but a mild central blur bilaterally. Dilated fundus examination reveals multiple, bilateral, scattered small and large yellowish-white extracellular deposits (drusen) in the macula, along with localized areas of depigmentation and thinning of the retinal pigment epithelium (geographic atrophy). No subretinal fluid or hemorrhage is present.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the recommended management?', '["Dry age-related macular degeneration; AREDS2 vitamin formulation and smoking cessation", "Toxic retinopathy; immediate discontinuation of hydroxychloroquine", "Wet age-related macular degeneration; urgent intravitreal anti-VEGF therapy", "Primary open-angle glaucoma; topical prostaglandin drops", "Nuclear cataract; urgent surgical cataract extraction"]'::jsonb, 0, 'This patient has **Dry Age-Related Macular Degeneration (Dry AMD)**, characterized by progressive central vision loss, geographic atrophy, and **drusen** without fluid or blood. The recommended management for intermediate/advanced dry AMD is the **AREDS2 vitamin formulation** (antioxidant vitamins C, E, zinc, copper, lutein, and zeaxanthin) to slow progression to advanced stages, along with **smoking cessation** (as smoking is the strongest modifiable risk factor).'),
    (v_case_id, 'What represents the substance known as ''drusen'' that accumulates in this condition?', '["Protein complexes leaking from the vitreous humor", "Aggregates of inflammatory cells adhering to the corneal endothelium", "Abnormal collagen fibers deposited within the stroma of the cornea", "Extracellular debris including lipofuscin, proteins, and lipids accumulating between the RPE and Bruch''s membrane", "Small microaneurysms that have thrombosed and calcified"]'::jsonb, 3, '**Drusen** are **yellowish extracellular deposits** consisting of undigested cellular waste products (like lipofuscin), proteins, and lipids that accumulate in the extracellular space between the **retinal pigment epithelium (RPE) and Bruch''s membrane**. Their accumulation disrupts RPE function and leads to secondary degeneration of the overlying photoreceptors.'),
    (v_case_id, 'Why was beta-carotene removed and replaced with Lutein and Zeaxanthin in the AREDS2 clinical trial formulation?', '["Lutein has superior activity against choroidal neovascularization", "Beta-carotene was found to significantly increase the risk of lung cancer in smokers", "Beta-carotene caused severe corneal endothelial deposits", "Beta-carotene interfered with the absorption of zinc and copper", "Lutein and Zeaxanthin were found to lower intraocular pressure"]'::jsonb, 1, 'Beta-carotene was replaced with **Lutein and Zeaxanthin** in the AREDS2 formulation because large clinical trials (like the CARET and ATBC studies) demonstrated that **beta-carotene significantly increases the risk of lung cancer in smokers**. Since many AMD patients have a history of smoking, removing beta-carotene made the formulation safer while maintaining efficacy.');

    ---------------------------------------------------------------------------
    -- CASE 36: The Floating Red Cobwebs - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Floating Red Cobwebs - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Floating Red Cobwebs - Case Analysis (V4)', 'A 53-year-old male with a 15-year history of insulin-dependent diabetes presents with a sudden onset of multiple floating dark spots and red cobweb-like lines in the right eye, followed by severe, painless blurring of vision. He has had no eye trauma.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 80 bpm | BP: 125/88 mmHg
*   **Visual Acuity:** OD: 20/400; contralateral eye: 20/25
*   **Ocular Examination (OD):** The red reflex is severely dim/absent. Slit-lamp exam shows clear cornea and a quiet anterior chamber. On dilated exam, the vitreous cavity is filled with suspended red blood cells, completely obscuring the details of the optic nerve and retinal vasculature. Contralateral eye shows proliferative diabetic retinopathy with neovascularization.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 53-year-old male with a 15-year history of insulin-dependent diabetes presents with a sudden onset of multiple floating dark spots and red cobweb-like lines in the right eye, followed by severe, painless blurring of vision. He has had no eye trauma.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 80 bpm | BP: 125/88 mmHg
*   **Visual Acuity:** OD: 20/400; contralateral eye: 20/25
*   **Ocular Examination (OD):** The red reflex is severely dim/absent. Slit-lamp exam shows clear cornea and a quiet anterior chamber. On dilated exam, the vitreous cavity is filled with suspended red blood cells, completely obscuring the details of the optic nerve and retinal vasculature. Contralateral eye shows proliferative diabetic retinopathy with neovascularization.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the initial management step?', '["Rhegmatogenous retinal detachment; perform immediate pneumatic retinopexy", "Vitreous hemorrhage; elevate the head of the bed, perform ocular ultrasound (B-scan) to rule out retinal detachment, and observe", "Acute angle-closure glaucoma; administer IV acetazolamide", "CMV retinitis; initiate systemic and intravitreal ganciclovir", "Central retinal artery occlusion; perform urgent anterior chamber paracentesis"]'::jsonb, 1, 'This patient has a **Vitreous Hemorrhage**, a common complication of **Proliferative Diabetic Retinopathy**. The initial steps are: (1) **elevate the head of the bed (30-45 degrees)** to allow the blood to settle inferiorly, clearing the visual axis, (2) perform an **ocular B-scan ultrasound** to ensure the underlying retina is flat and not detached (since the fundus cannot be visualized), and (3) observe, as many hemorrhages clear spontaneously over weeks to months.'),
    (v_case_id, 'What is the primary anatomical source of blood in a diabetic patient presenting with a vitreous hemorrhage?', '["Fragile, abnormal new vessels (neovascularization) growing along the vitreous face and retina that rupture easily", "Rupture of ciliary body capillaries due to high intraocular pressure", "A tear in a major branch retinal vein due to severe systemic hypertension", "A full-thickness retinal tear that shears a healthy retinal arteriole", "Bleeding from abnormal choroidal neovascular membranes through Bruch''s membrane"]'::jsonb, 0, 'In diabetes, **vitreous hemorrhage** is caused by the **rupture of fragile neovascular vessels (NVD or NVE)**. These abnormal vessels lack a normal muscular coat and tight endothelial junctions, making them extremely fragile. When the vitreous contracts or moves, it exerts traction on these vessels, causing them to tear and bleed directly into the vitreous cavity.'),
    (v_case_id, 'In which of the following scenarios is an URGENT pars plana vitrectomy indicated for a patient with a vitreous hemorrhage?', '["The presence of a tractional or rhegmatogenous retinal detachment on B-scan ultrasound, or non-clearing hemorrhage >3-6 months", "The presence of dry age-related macular degeneration in the contralateral eye", "An elevated intraocular pressure of 22 mmHg in the affected eye", "Any vitreous hemorrhage in a patient with a history of hypertension", "The presence of hard lipid exudates on the retinal surface"]'::jsonb, 0, 'An **urgent pars plana vitrectomy** is indicated if: (1) **B-scan ultrasound reveals an associated retinal detachment (tractional or rhegmatogenous)**, (2) the hemorrhage fails to clear after 3 to 6 months of conservative observation, preventing visual recovery and treatment, or (3) neovascularization of the iris/angle (rubeosis) develops, requiring clear media to perform PRP.');

    ---------------------------------------------------------------------------
    -- CASE 37: The AIDS-Related Blindness - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The AIDS-Related Blindness - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The AIDS-Related Blindness - Case Analysis (V4)', 'A 42-year-old male with HIV presents with a 1-week history of floaters, flashes of light, and blurred vision in the left eye. He admits to non-compliance with antiretroviral therapy (ART). His CD4 count is 40 cells/mcL.

**Physical Examination:**
*   **Vitals:** Temp: 99.0°F | HR: 72 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior chamber is quiet. Vitreous shows minimal inflammatory cells (1+). Dilated fundus examination reveals multiple, confluent, thick, yellow-white necrotic retinal lesions with perivascular sheathing and extensive, flame-shaped retinal hemorrhages along the vascular arches, giving a "pizza-pie" or "scrambled eggs and ketchup" appearance.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 42-year-old male with HIV presents with a 1-week history of floaters, flashes of light, and blurred vision in the left eye. He admits to non-compliance with antiretroviral therapy (ART). His CD4 count is 40 cells/mcL.

**Physical Examination:**
*   **Vitals:** Temp: 99.0°F | HR: 72 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior chamber is quiet. Vitreous shows minimal inflammatory cells (1+). Dilated fundus examination reveals multiple, confluent, thick, yellow-white necrotic retinal lesions with perivascular sheathing and extensive, flame-shaped retinal hemorrhages along the vascular arches, giving a "pizza-pie" or "scrambled eggs and ketchup" appearance.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the first-line therapy?', '["Syphilitic chorioretinitis; intravenous penicillin G for 14 days", "Cytomegalovirus (CMV) retinitis; systemic valganciclovir and/or intravitreal ganciclovir, plus initiation of ART", "Bacterial endophthalmitis; intravitreal vancomycin and ceftazidime", "Toxoplasma chorioretinitis; pyrimethamine, sulfadiazine, and folinic acid", "Acute retinal necrosis (ARN); intravenous acyclovir and oral valacyclovir"]'::jsonb, 1, 'This patient has **CMV Retinitis**, the most common opportunistic ocular infection in AIDS patients, typically occurring when the **CD4 count is <50 cells/mcL**. The classic fundus appearance is a **"pizza-pie" or "scrambled eggs and ketchup" pattern** of yellow-white necrotic lesions and massive hemorrhages. First-line therapy consists of **antivirals (ganciclovir/valganciclovir or foscarnet)** administered systemically and/or intravitreally, along with the **initiation or optimization of ART**.'),
    (v_case_id, 'Why is there typically very little vitreous cell or anterior chamber inflammation (vitritis/iritis) seen in patients with active CMV retinitis?', '["The blood-aqueous barrier is completely impermeable to CMV antigens", "CMV selectively infects only the outer photoreceptors, sparing vascular structures", "The severe immunosuppression prevents the host from mounting an inflammatory response (quiet vitreous)", "The virus is physically restricted to the subretinal space", "CMV produces potent anti-inflammatory cytokines that suppress local T-cells"]'::jsonb, 2, 'Active CMV retinitis characteristically presents with **minimal vitreous or anterior segment inflammation (quiet vitreous)**. This is because patients are **severely immunocompromised (CD4 < 50)** and cannot mount a cellular inflammatory response. If the immune system recovers (e.g., after starting ART), a massive inflammatory reaction can occur, known as **Immune Reconstitution Inflammatory Syndrome (IRIS)**, presenting as severe vitritis and macular edema.'),
    (v_case_id, 'What is the most common vision-threatening complication of CMV retinitis, occurring in up to 30% of patients?', '["Rhegmatogenous retinal detachment", "Neovascular glaucoma", "Corneal stromal necrosis", "Tractional retinal detachment", "Sympathetic ophthalmia"]'::jsonb, 0, 'The most common and feared complication of CMV retinitis is **rhegmatogenous retinal detachment**. The CMV virus causes full-thickness **necrosis and thinning of the retina**, leaving behind fragile, paper-thin necrotic tissue. As the vitreous contracts or pulls, multiple peripheral retinal holes and tears easily form, leading to a high rate of RRD that often requires complex surgery with silicone oil tamponade.');

    ---------------------------------------------------------------------------
    -- CASE 38: The Painful Confluent Necrosis - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Painful Confluent Necrosis - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Painful Confluent Necrosis - Case Analysis (V4)', 'A healthy, immunocompetent 52-year-old male presents with a 4-day history of severe, boring pain, redness, photophobia, and rapidly worsening vision in the right eye. He has no systemic symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 68 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OD):** Moderate episcleral injection. Slit-lamp shows 2+ granulomatous keratic precipitates on the corneal endothelium and 2+ cell/flare in the anterior chamber. There is significant **vitritis (3+)** obscuring the fundus. Dilated fundus examination reveals confluent, patch-like areas of yellowish-white peripheral retinal necrosis that are spreading circumferentially, with prominent retinal arteritis (perivascular sheathing).', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A healthy, immunocompetent 52-year-old male presents with a 4-day history of severe, boring pain, redness, photophobia, and rapidly worsening vision in the right eye. He has no systemic symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 68 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OD):** Moderate episcleral injection. Slit-lamp shows 2+ granulomatous keratic precipitates on the corneal endothelium and 2+ cell/flare in the anterior chamber. There is significant **vitritis (3+)** obscuring the fundus. Dilated fundus examination reveals confluent, patch-like areas of yellowish-white peripheral retinal necrosis that are spreading circumferentially, with prominent retinal arteritis (perivascular sheathing).', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary causative pathogen?', '["CMV retinitis; Cytomegalovirus in a patient with undiagnosed AIDS", "Vogt-Koyanagi-Harada disease; autoimmune reaction to melanocytes", "Acute Retinal Necrosis (ARN); Varicella-Zoster Virus (VZV) or Herpes Simplex Virus (HSV)", "Endogenous bacterial endophthalmitis; Staphylococcus aureus", "Toxocariasis; Toxocara canis roundworm infection"]'::jsonb, 2, 'This is **Acute Retinal Necrosis (ARN)**, which characteristically occurs in **immunocompetent** hosts. It is caused by herpesviruses, most commonly **Varicella-Zoster Virus (VZV)** or **Herpes Simplex Virus (HSV-1 or HSV-2)**. Key clinical features include: (1) severe ocular pain and redness, (2) severe **vitritis** (unlike CMV), and (3) confluent, peripheral **yellowish-white retinal necrosis** with retinal arteritis. Treatment is an emergency, requiring IV acyclovir or oral valacyclovir, combined with intravitreal ganciclovir.'),
    (v_case_id, 'Why is systemic corticosteroid therapy often used as an adjunct in the treatment of Acute Retinal Necrosis, and when should it be initiated?', '["Corticosteroids are used as monotherapy to suppress the autoimmune destruction of the retina", "Corticosteroids are strictly contraindicated because they promote viral replication in the retina", "Corticosteroids are used to prevent systemic viral spreading to the brain", "Corticosteroids are started immediately before antivirals to open the blood-retinal barrier", "Corticosteroids are started 24-48 hours after antiviral therapy to reduce the severe, vision-threatening vitreous inflammation"]'::jsonb, 4, 'Systemic **corticosteroids** (prednisone) are used as an adjunct to **reduce the severe, vision-threatening vitritis** and vascular inflammation associated with ARN. However, they must **never be given alone or before antivirals**. They are initiated **24 to 48 hours AFTER adequate antiviral therapy** has begun, ensuring that the viral replication is controlled so that steroids do not promote uncontrolled necrotizing viral spread.'),
    (v_case_id, 'What is the most common long-term complication of Acute Retinal Necrosis, occurring in over 75% of untreated patients?', '["Rhegmatogenous retinal detachment due to peripheral retinal holes", "Sympathetic ophthalmia in the contralateral eye", "Tractional retinal detachment due to fibrovascular membranes", "Neovascular glaucoma from persistent retinal ischemia", "Phacolytic glaucoma from lens protein leakage"]'::jsonb, 0, 'The most common and devastating complication of ARN is **rhegmatogenous retinal detachment**, occurring in **75-85% of untreated cases**. As the large, confluent zones of peripheral necrotic retina heal, they become paper-thin and develop **multiple, large, irregular tears and holes**. The severe vitritis also causes vitreous condensation and traction, pulling the torn retina off. Prophylactic laser retinopexy is often performed around necrotic areas to prevent this.');

    ---------------------------------------------------------------------------
    -- CASE 39: The Segmental Shadow - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Segmental Shadow - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Segmental Shadow - Case Analysis (V4)', 'A 66-year-old female with a history of carotid artery disease and smoking presents with a sudden, painless loss of the upper half of her visual field in the right eye that occurred 3 hours ago. Her central vision is only mildly blurry.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 77 bpm | BP: 128/76 mmHg
*   **Visual Acuity:** OD: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OD):** No APD (or trace APD). Dilated fundus exam reveals a sharply demarcated, wedge-shaped area of pale, edematous retina confined to the inferior-temporal quadrant. At the first bifurcation of the inferior temporal retinal artery, there is a small, highly reflective, golden-yellow plaque (Hollenhorst plaque) obstructing the lumen.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 66-year-old female with a history of carotid artery disease and smoking presents with a sudden, painless loss of the upper half of her visual field in the right eye that occurred 3 hours ago. Her central vision is only mildly blurry.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 77 bpm | BP: 128/76 mmHg
*   **Visual Acuity:** OD: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OD):** No APD (or trace APD). Dilated fundus exam reveals a sharply demarcated, wedge-shaped area of pale, edematous retina confined to the inferior-temporal quadrant. At the first bifurcation of the inferior temporal retinal artery, there is a small, highly reflective, golden-yellow plaque (Hollenhorst plaque) obstructing the lumen.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Ischemic optic neuropathy", "Central retinal artery occlusion (CRAO)", "Branch retinal artery occlusion (BRAO)", "Branch retinal vein occlusion (BRVO)", "Rhegmatogenous retinal detachment"]'::jsonb, 2, 'This patient has a **Branch Retinal Artery Occlusion (BRAO)**. The clinical features are highly classic: sudden, painless, **segmental visual field loss** (corresponding to the blocked vessel), and a wedge-shaped area of **retinal pallor and edema** in the distribution of a branch arteriole, often with a visible **Hollenhorst plaque** at the bifurcation.'),
    (v_case_id, 'What is the primary composition and origin of a Hollenhorst plaque?', '["Calcific embolus originating from a stenotic aortic valve", "Platelet-fibrin thrombus originating from the left atrium in atrial fibrillation", "Thrombus composed of sickled erythrocytes from ciliary vessels", "Amyloid protein aggregate from systemic amyloidosis", "Cholesterol embolus originating from an atheromatous plaque in the internal carotid artery"]'::jsonb, 4, 'A **Hollenhorst plaque** is a **cholesterol embolus** that originates from an **atheromatous, ulcerated plaque in the ipsilateral internal carotid artery** (or aorta). It travels in the bloodstream and becomes lodged at a bifurcation of the retinal vasculature, where the vessel diameter narrows. It appears highly reflective, shiny, and golden-yellow.'),
    (v_case_id, 'How does the prognosis of visual acuity in BRAO generally compare to CRAO, and why?', '["Better, because the blocked arteriole undergoes spontaneous recanalization within minutes", "Worse, because BRAO is highly associated with systemic vasculitis like Giant Cell Arteritis", "Identical, because both result in complete degeneration of the optic nerve head", "Worse, because branch arterioles are smaller and more prone to permanent spasm", "Significantly better, because the central fovea is usually spared and the macular perfusion is maintained by the unaffected arterioles"]'::jsonb, 4, 'The prognosis for visual acuity in BRAO is **significantly better than in CRAO**. In BRAO, because only a branch arteriole is occluded, the central fovea is usually spared (unless the macular branch itself is involved), allowing the patient to maintain good central vision (20/40 or better in 80% of cases), though they will have a permanent, segmental visual field defect.');

    ---------------------------------------------------------------------------
    -- CASE 40: The Silent Tension - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Silent Tension - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Silent Tension - Case Analysis (V4)', 'A 67-year-old female with a history of poorly controlled type 1 diabetes and severe proliferative diabetic retinopathy presents with a slowly progressive, painless decrease in vision in her right eye over the past 2 months.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 81 bpm | BP: 129/78 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/40
*   **Ocular Examination (OD):** Quiet anterior chamber. Dilated fundus examination reveals dense, white fibrovascular membranes in the vitreous cavity that are adherent to the retina. These bands are contracting and mechanically pulling the neurosensory retina away from the underlying RPE, creating a smooth, immobile, dome-like elevation of the retina. No retinal tears or holes are seen.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 67-year-old female with a history of poorly controlled type 1 diabetes and severe proliferative diabetic retinopathy presents with a slowly progressive, painless decrease in vision in her right eye over the past 2 months.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 81 bpm | BP: 129/78 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/40
*   **Ocular Examination (OD):** Quiet anterior chamber. Dilated fundus examination reveals dense, white fibrovascular membranes in the vitreous cavity that are adherent to the retina. These bands are contracting and mechanically pulling the neurosensory retina away from the underlying RPE, creating a smooth, immobile, dome-like elevation of the retina. No retinal tears or holes are seen.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary surgical management?', '["Exudative retinal detachment; systemic corticosteroids and immunosuppressants", "Proliferative diabetic retinopathy; panretinal photocoagulation (PRP) alone", "Neovascular glaucoma; surgical trabeculectomy", "Rhegmatogenous retinal detachment; urgent pneumatic retinopexy", "Tractional retinal detachment; pars plana vitrectomy with membrane peeling and endolaser"]'::jsonb, 4, 'This is a **Tractional Retinal Detachment (TRD)**, a severe complication of proliferative diabetic retinopathy. Treatment requires **pars plana vitrectomy** to remove the vitreous gel, followed by **micro-surgical membrane peeling** to release the tractional forces pulling the retina, and **intraoperative endolaser (PRP)** to regress the neovascularization.'),
    (v_case_id, 'What is the key pathophysiological driver that leads to Tractional Retinal Detachment in diabetic patients?', '["Liquefied vitreous leaks through a full-thickness retinal hole, dissecting the retina", "Infiltration of the subretinal space by neoplastic retinoblastoma cells", "Severe systemic hypertension causes transudative fluid to leak under the retina", "Deposition of amyloid plaques that stiffen the sensory retina", "Ischemia-induced neovascularization grows along the posterior vitreous face, creating fibrovascular membranes that contract over time"]'::jsonb, 4, 'In proliferative diabetic retinopathy, chronic retinal ischemia drives the growth of abnormal new vessels (**neovascularization**). These vessels grow out of the retina and along the **posterior vitreous face**, accompanied by a scaffolding of fibrous tissue. Over time, these **fibrovascular membranes contract**, mechanically pulling the neurosensory retina off the underlying RPE.'),
    (v_case_id, 'Which of the following clinical features helps differentiate a Tractional Retinal Detachment from a Rhegmatogenous Retinal Detachment?', '["Tractional RD resolves spontaneously with steroid drops", "Tractional RD presents with sudden flashes, floaters, a corrugated wrinkled surface, and a horseshoe tear", "Tractional RD is characteristically slowly progressive, has a smooth/concave surface, is non-shifting, and lacks retinal holes/tears", "Tractional RD is always bilateral and associated with systemic arthritis", "Tractional RD is associated with high intraocular pressure and corneal clouding"]'::jsonb, 2, '**Tractional RD** is slowly progressive, has a **smooth, concave surface, is non-shifting** (does not move with gravity/head position), and **lacks full-thickness retinal tears/holes**. **Rhegmatogenous RD** is rapid in onset, has a **corrugated, wrinkled, convex surface, shifts with gravity**, and **always has a causative retinal tear/hole**.');

    ---------------------------------------------------------------------------
    -- CASE 41: Vignette: The Falling Curtain (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Falling Curtain (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Falling Curtain (V5)', 'A 53-year-old female presents with a sudden onset of flashes of light (photopsias) and a shower of small dark floaters in the left eye, followed by a dark curtain-like shadow descending over the upper half of her vision. She has a history of high myopia.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 78 bpm | BP: 134/81 mmHg
*   **Visual Acuity:** OS: 20/200 (no improvement with pinhole); OS: 20/20
*   **Ocular Examination (OS):** Anterior chamber is quiet. Slit-lamp exam of the anterior vitreous reveals small, brown-pigmented cells ("tobacco dust" or Shafer''s sign). Dilated fundus exam reveals a grey, elevated, corrugated, and wrinkled retina in the inferior-temporal sector with a large, crescentic horseshoe-shaped retinal tear.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 53-year-old female presents with a sudden onset of flashes of light (photopsias) and a shower of small dark floaters in the left eye, followed by a dark curtain-like shadow descending over the upper half of her vision. She has a history of high myopia.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 78 bpm | BP: 134/81 mmHg
*   **Visual Acuity:** OS: 20/200 (no improvement with pinhole); OS: 20/20
*   **Ocular Examination (OS):** Anterior chamber is quiet. Slit-lamp exam of the anterior vitreous reveals small, brown-pigmented cells ("tobacco dust" or Shafer''s sign). Dilated fundus exam reveals a grey, elevated, corrugated, and wrinkled retina in the inferior-temporal sector with a large, crescentic horseshoe-shaped retinal tear.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the immediate management?', '["Acute retinal necrosis; immediate intravenous acyclovir", "Dry age-related macular degeneration; high-dose AREDS2 vitamins", "Rhegmatogenous retinal detachment; urgent ophthalmology referral for surgical repair", "Vitreous hemorrhage; bed rest and head elevation of 45 degrees", "Central retinal artery occlusion; immediate ocular massage and hyperbaric oxygen"]'::jsonb, 2, 'This patient has a classic **Rhegmatogenous Retinal Detachment (RRD)** with a visible horseshoe tear. The presence of flashes, floaters, and a "curtain" visual field loss are hallmarks. The immediate management is an **urgent referral to an ophthalmologist** for surgical reattachment (e.g., vitrectomy, scleral buckle, or pneumatic retinopexy) to prevent permanent macular visual loss (if macula is "on").'),
    (v_case_id, 'What is the pathophysiological mechanism responsible for this specific type of retinal detachment?', '["Hypersecretion of subretinal fluid by hypertrophied retinal pigment epithelial cells", "Contraction of retroretinal fibrous membranes pulling the neurosensory retina away from the pigment epithelium", "A direct vascular tear causing blood accumulation that mechanically dissects the retina", "Vitreous liquefaction and traction create a full-thickness retinal tear, allowing liquefied vitreous to enter the subretinal space", "Exudative leakage of fluid from choroidal vessels directly into the subretinal space due to high systemic pressure"]'::jsonb, 3, 'Rhegmatogenous RD (from *rhegma*, meaning tear) occurs when **vitreous liquefaction (synchysis)** and **vitreous traction** lead to a posterior vitreous detachment (PVD) that pulls on and tears the retina. Liquefied vitreous then passes through the tear into the subretinal space, separating the neurosensory retina from the underlying retinal pigment epithelium (RPE).'),
    (v_case_id, 'What does the clinical sign of ''tobacco dust'' (Shafer''s sign) in the anterior vitreous represent?', '["Clumps of white blood cells indicating an active vitritis", "Pigmented retinal pigment epithelial (RPE) cells released into the vitreous following a retinal tear", "Calcified deposits on the lens zonules", "Deposits of amyloid protein on the posterior vitreous face", "Degenerated red blood cells from a vitreous hemorrhage"]'::jsonb, 1, '**Shafer''s sign** ("tobacco dust") represents **pigmented RPE cells** that have escaped through a full-thickness retinal tear into the vitreous cavity. It is a highly specific sign of a retinal tear or detachment, even if the tear itself is not immediately visible.');

    ---------------------------------------------------------------------------
    -- CASE 42: Vignette: The Pale Retina and Cherry-Red Spot (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Pale Retina and Cherry-Red Spot (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Pale Retina and Cherry-Red Spot (V5)', 'A 68-year-old male with a history of hypertension, hyperlipidemia, and coronary artery disease presents with a sudden, complete, painless loss of vision in the right eye that occurred 3 hours ago. He denies any preceding trauma or ocular symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 85 bpm | BP: 137/85 mmHg
*   **Visual Acuity:** OD: Count Fingers; contralateral eye: 20/20
*   **Ocular Examination (OD):** A positive relative afferent pupillary defect (APD). Dilated fundus examination reveals marked, generalized pallor and edema of the retina, except for a bright, circumscribed "cherry-red spot" in the central fovea. The retinal arterioles are severely narrowed, and segmenting blood columns ("box-carring") are visible.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 68-year-old male with a history of hypertension, hyperlipidemia, and coronary artery disease presents with a sudden, complete, painless loss of vision in the right eye that occurred 3 hours ago. He denies any preceding trauma or ocular symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 85 bpm | BP: 137/85 mmHg
*   **Visual Acuity:** OD: Count Fingers; contralateral eye: 20/20
*   **Ocular Examination (OD):** A positive relative afferent pupillary defect (APD). Dilated fundus examination reveals marked, generalized pallor and edema of the retina, except for a bright, circumscribed "cherry-red spot" in the central fovea. The retinal arterioles are severely narrowed, and segmenting blood columns ("box-carring") are visible.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the initial emergency management?', '["Central retinal artery occlusion (CRAO); ocular massage, hyperventilate into a paper bag, or AC paracentesis", "Vitreous hemorrhage; urgent pars plana vitrectomy", "Rhegmatogenous retinal detachment; pneumatic retinopexy", "Giant cell arteritis; high-dose oral prednisone monotherapy", "Central retinal vein occlusion (CRVO); intravitreal anti-VEGF injection within 24 hours"]'::jsonb, 0, 'This is a classic **Central Retinal Artery Occlusion (CRAO)**. It is an ocular emergency analogous to an ischemic stroke. Initial management (within 4 hours of onset) aims to dislodge the embolus and restore perfusion by lowering IOP (via **ocular massage**, **anterior chamber paracentesis**, or IV acetazolamide) or causing vasodilation (breathing into a paper bag to raise CO2 levels).'),
    (v_case_id, 'Why does a ''cherry-red spot'' appear in the macula of patients with Central Retinal Artery Occlusion?', '["The thin foveola lacks inner retinal layers and is supplied by the underlying choroid, which shines red against the pale, ischemic surrounding retina", "Selective hyper-perfusion of the fovea by a patent cilioretinal artery", "A localized pool of blood accumulates in the subretinal space directly beneath the fovea", "Severe localized inflammation of the macular photoreceptors", "The cherry-red spot represents the embolus itself wedged in the macular arteriole"]'::jsonb, 0, 'The **cherry-red spot** appears because the foveola is extremely thin and lacks the inner retinal layers (ganglion cells, nerve fibers) that become pale, swollen, and edematous when ischemic. Because the foveola is supplied primarily by the underlying choriocapillaris (which is fed by the ciliary arteries, not the blocked central retinal artery), the vascular choroid continues to shine red through the thin, transparent foveal tissue, contrasting with the pale, opaque surrounding retina.'),
    (v_case_id, 'Which of the following diagnostic workups is most critical in this patient to prevent life-threatening stroke or myocardial infarction?', '["Fluorescein angiography of both eyes", "Temporal artery biopsy", "Carotid duplex ultrasound and echocardiogram", "Brain MRI with contrast", "Coagulation panel including Factor V Leiden"]'::jsonb, 2, 'The most common cause of non-arteritic CRAO is an **embolus originating from an ulcerated carotid artery plaque (Hollenhorst plaque) or the heart**. Therefore, a cardiovascular workup consisting of **carotid duplex ultrasound** and an **echocardiogram** is mandatory to identify source lesions and prevent a subsequent stroke or MI.');

    ---------------------------------------------------------------------------
    -- CASE 43: Vignette: The Blood and Thunder Fundus (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Blood and Thunder Fundus (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Blood and Thunder Fundus (V5)', 'A 69-year-old female with a long history of poorly controlled hypertension and glaucoma presents with a subacute, painless decrease in vision in her right eye over the past 2 days.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 85 bpm | BP: 124/77 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OD):** Mild APD. Dilated fundus exam reveals widespread, diffuse flame-shaped and dot-and-blot hemorrhages in all four quadrants ("blood and thunder fundus"), along with severely tortuous and dilated retinal veins, scattered cotton-wool spots, and significant optic disc and macular edema.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 69-year-old female with a long history of poorly controlled hypertension and glaucoma presents with a subacute, painless decrease in vision in her right eye over the past 2 days.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 85 bpm | BP: 124/77 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OD):** Mild APD. Dilated fundus exam reveals widespread, diffuse flame-shaped and dot-and-blot hemorrhages in all four quadrants ("blood and thunder fundus"), along with severely tortuous and dilated retinal veins, scattered cotton-wool spots, and significant optic disc and macular edema.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Proliferative diabetic retinopathy with vitreous hemorrhage", "Central retinal vein occlusion (CRVO)", "Acute retinal necrosis", "Central retinal artery occlusion (CRAO)", "Hypertensive crisis with Grade IV retinopathy"]'::jsonb, 1, 'This presentation is diagnostic of a **Central Retinal Vein Occlusion (CRVO)**. The hallmark funduscopic finding is the **''blood and thunder'' appearance** (widespread hemorrhages in all 4 quadrants, tortuous dilated veins, disc edema, and cotton-wool spots). It is a venous thrombosis typically occurring at the level of the lamina cribrosa.'),
    (v_case_id, 'What is the primary cause of severe, long-term visual loss in patients with Central Retinal Vein Occlusion?', '["Corneal edema from chronic secondary glaucoma", "Autoimmune destruction of the retinal pigment epithelium", "Macular edema due to vascular leakage and capillary incompetence", "Optic nerve atrophy from direct mechanical venous compression", "Total retinal detachment due to subretinal fluid accumulation"]'::jsonb, 2, 'The most common cause of persistent, long-term visual loss in patients with CRVO is **macular edema** driven by capillary leakage and increased intravascular pressure. High venous pressure triggers blood-retinal barrier breakdown and release of VEGF, leading to chronic fluid accumulation in the macula.'),
    (v_case_id, 'This patient must be monitored closely for ''90-day glaucoma'' (neovascular glaucoma). What drives this complication in ischemic CRVO?', '["The thrombus in the central retinal vein back-pressures into the vortex veins, blocking outflow", "Chronic blood breakdown products block the trabecular meshwork", "Widespread retinal ischemia triggers VEGF release, which stimulates new blood vessel growth in the iris and angle", "Anterior uveitis causes pupillary block synechiae", "Persistent systemic hypertension pushes the lens-iris diaphragm forward"]'::jsonb, 2, 'In ischemic CRVO (defined by large areas of capillary non-perfusion on fluorescein angiography), severe **retinal ischemia** triggers the release of **VEGF**. VEGF diffuses into the anterior segment, causing neovascularization of the iris (rubeosis iridis) and angle, which eventually leads to **neovascular glaucoma** (classically appearing around 90 days, hence "90-day glaucoma").');

    ---------------------------------------------------------------------------
    -- CASE 44: Vignette: The Wavy Lines and Central Dark Spot (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Wavy Lines and Central Dark Spot (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Wavy Lines and Central Dark Spot (V5)', 'A 77-year-old female presents with a sudden onset of distortion in her central vision in the right eye. She complains that straight lines (like doorframes) appear wavy and bent, and she has difficulty reading. She has a long history of dry macular degeneration in both eyes.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 79 bpm | BP: 137/84 mmHg
*   **Visual Acuity:** OD: 20/120; contralateral eye: 20/30
*   **Ocular Examination (OD):** Testing with an Amsler grid confirms significant metamorphopsia (wavy lines) and a central scotoma. Dilated fundus examination reveals multiple, large soft yellowish drusen in the macula, along with a grey-green subretinal elevation, subretinal fluid, and a localized pocket of subretinal hemorrhage in the central fovea.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 77-year-old female presents with a sudden onset of distortion in her central vision in the right eye. She complains that straight lines (like doorframes) appear wavy and bent, and she has difficulty reading. She has a long history of dry macular degeneration in both eyes.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 79 bpm | BP: 137/84 mmHg
*   **Visual Acuity:** OD: 20/120; contralateral eye: 20/30
*   **Ocular Examination (OD):** Testing with an Amsler grid confirms significant metamorphopsia (wavy lines) and a central scotoma. Dilated fundus examination reveals multiple, large soft yellowish drusen in the macula, along with a grey-green subretinal elevation, subretinal fluid, and a localized pocket of subretinal hemorrhage in the central fovea.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following represents the most appropriate first-line treatment for this patient''s current condition?', '["Intravitreal injections of anti-Vascular Endothelial Growth Factor (anti-VEGF) agents (e.g., aflibercept)", "High-dose antioxidant vitamins and zinc (AREDS2 formulation) alone", "Topical prednisolone acetate 1% drops hourly", "Laser photocoagulation of the central foveal hemorrhage", "Surgical subretinal membrane scraping and vitrectomy"]'::jsonb, 0, 'The patient has transitioned from dry to **neovascular (''wet'') Age-Related Macular Degeneration (Wet AMD)**, evidenced by sudden metamorphopsia (wavy lines), subretinal fluid, and hemorrhage. The standard of care is **intravitreal anti-VEGF injections** (e.g., ranibizumab, aflibercept, bevacizumab), which bind VEGF, stopping neovascularization and reducing vascular leakage, often restoring or stabilizing vision. AREDS2 vitamins are for dry AMD and do not treat active choroidal neovascular membranes.'),
    (v_case_id, 'What is the key pathophysiological development that distinguishes ''wet'' AMD from ''dry'' AMD?', '["Accumulation of extracellular lipofuscin-rich debris (drusen) in the extracellular space", "Progressive geographic atrophy of the retinal pigment epithelium and photoreceptors", "A sudden mechanical tear in the neurosensory retina due to vitreous traction", "Growth of abnormal choroidal vessels through Bruch''s membrane into the subretinal space (choroidal neovascularization)", "Occlusion of the central retinal vein at the optic disc"]'::jsonb, 3, 'The defining feature of Wet AMD is **choroidal neovascularization (CNV)**. Unlike Dry AMD, which involves slow atrophy of the RPE and photoreceptors, Wet AMD involves the growth of **abnormal, fragile blood vessels from the choriocapillaris** through breaks in **Bruch''s membrane** into the sub-RPE or subretinal space. These vessels leak fluid, protein, and blood, leading to rapid, severe visual loss.'),
    (v_case_id, 'Which of the following clinical tests is most appropriate for patients with dry AMD to perform at home for early detection of conversion to wet AMD?', '["Frequent self-tonometry using a hand-held tonometer", "Measuring visual acuity using a Snellen pocket card", "Self-assessment of peripheral visual field boundaries", "Checking color vision with Ishihara plates weekly", "Amsler grid testing daily"]'::jsonb, 4, 'Patients with Dry AMD are instructed to use an **Amsler grid daily** to monitor for early signs of Wet AMD. Metamorphopsia (distortion where straight lines appear wavy) or a new central dark spot (scotoma) on the grid are early signs of subretinal fluid or hemorrhage, prompting immediate evaluation and anti-VEGF therapy.');

    ---------------------------------------------------------------------------
    -- CASE 45: Vignette: The Progressive Central Blindness (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Progressive Central Blindness (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Progressive Central Blindness (V5)', 'A 75-year-old female smoker presents with a 2-year history of slowly progressive, bilateral loss of central vision, making it hard to read, sew, or recognize faces. She reports no sudden changes in vision, pain, or flashes of light.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 75 bpm | BP: 136/81 mmHg
*   **Visual Acuity:** OD: 20/50; OS: 20/40 (with correction)
*   **Ocular Examination:** Anterior segments are clear. Amsler grid shows no metamorphopsia (lines are straight) but a mild central blur bilaterally. Dilated fundus examination reveals multiple, bilateral, scattered small and large yellowish-white extracellular deposits (drusen) in the macula, along with localized areas of depigmentation and thinning of the retinal pigment epithelium (geographic atrophy). No subretinal fluid or hemorrhage is present.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 75-year-old female smoker presents with a 2-year history of slowly progressive, bilateral loss of central vision, making it hard to read, sew, or recognize faces. She reports no sudden changes in vision, pain, or flashes of light.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 75 bpm | BP: 136/81 mmHg
*   **Visual Acuity:** OD: 20/50; OS: 20/40 (with correction)
*   **Ocular Examination:** Anterior segments are clear. Amsler grid shows no metamorphopsia (lines are straight) but a mild central blur bilaterally. Dilated fundus examination reveals multiple, bilateral, scattered small and large yellowish-white extracellular deposits (drusen) in the macula, along with localized areas of depigmentation and thinning of the retinal pigment epithelium (geographic atrophy). No subretinal fluid or hemorrhage is present.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the recommended management?', '["Dry age-related macular degeneration; AREDS2 vitamin formulation and smoking cessation", "Toxic retinopathy; immediate discontinuation of hydroxychloroquine", "Wet age-related macular degeneration; urgent intravitreal anti-VEGF therapy", "Nuclear cataract; urgent surgical cataract extraction", "Primary open-angle glaucoma; topical prostaglandin drops"]'::jsonb, 0, 'This patient has **Dry Age-Related Macular Degeneration (Dry AMD)**, characterized by progressive central vision loss, geographic atrophy, and **drusen** without fluid or blood. The recommended management for intermediate/advanced dry AMD is the **AREDS2 vitamin formulation** (antioxidant vitamins C, E, zinc, copper, lutein, and zeaxanthin) to slow progression to advanced stages, along with **smoking cessation** (as smoking is the strongest modifiable risk factor).'),
    (v_case_id, 'What represents the substance known as ''drusen'' that accumulates in this condition?', '["Abnormal collagen fibers deposited within the stroma of the cornea", "Small microaneurysms that have thrombosed and calcified", "Aggregates of inflammatory cells adhering to the corneal endothelium", "Extracellular debris including lipofuscin, proteins, and lipids accumulating between the RPE and Bruch''s membrane", "Protein complexes leaking from the vitreous humor"]'::jsonb, 3, '**Drusen** are **yellowish extracellular deposits** consisting of undigested cellular waste products (like lipofuscin), proteins, and lipids that accumulate in the extracellular space between the **retinal pigment epithelium (RPE) and Bruch''s membrane**. Their accumulation disrupts RPE function and leads to secondary degeneration of the overlying photoreceptors.'),
    (v_case_id, 'Why was beta-carotene removed and replaced with Lutein and Zeaxanthin in the AREDS2 clinical trial formulation?', '["Lutein has superior activity against choroidal neovascularization", "Lutein and Zeaxanthin were found to lower intraocular pressure", "Beta-carotene was found to significantly increase the risk of lung cancer in smokers", "Beta-carotene caused severe corneal endothelial deposits", "Beta-carotene interfered with the absorption of zinc and copper"]'::jsonb, 2, 'Beta-carotene was replaced with **Lutein and Zeaxanthin** in the AREDS2 formulation because large clinical trials (like the CARET and ATBC studies) demonstrated that **beta-carotene significantly increases the risk of lung cancer in smokers**. Since many AMD patients have a history of smoking, removing beta-carotene made the formulation safer while maintaining efficacy.');

    ---------------------------------------------------------------------------
    -- CASE 46: Vignette: The Floating Red Cobwebs (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Floating Red Cobwebs (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Floating Red Cobwebs (V5)', 'A 63-year-old female with a 15-year history of insulin-dependent diabetes presents with a sudden onset of multiple floating dark spots and red cobweb-like lines in the right eye, followed by severe, painless blurring of vision. She has had no eye trauma.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 78 bpm | BP: 124/80 mmHg
*   **Visual Acuity:** OD: 20/400; contralateral eye: 20/25
*   **Ocular Examination (OD):** The red reflex is severely dim/absent. Slit-lamp exam shows clear cornea and a quiet anterior chamber. On dilated exam, the vitreous cavity is filled with suspended red blood cells, completely obscuring the details of the optic nerve and retinal vasculature. Contralateral eye shows proliferative diabetic retinopathy with neovascularization.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 63-year-old female with a 15-year history of insulin-dependent diabetes presents with a sudden onset of multiple floating dark spots and red cobweb-like lines in the right eye, followed by severe, painless blurring of vision. She has had no eye trauma.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 78 bpm | BP: 124/80 mmHg
*   **Visual Acuity:** OD: 20/400; contralateral eye: 20/25
*   **Ocular Examination (OD):** The red reflex is severely dim/absent. Slit-lamp exam shows clear cornea and a quiet anterior chamber. On dilated exam, the vitreous cavity is filled with suspended red blood cells, completely obscuring the details of the optic nerve and retinal vasculature. Contralateral eye shows proliferative diabetic retinopathy with neovascularization.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the initial management step?', '["Rhegmatogenous retinal detachment; perform immediate pneumatic retinopexy", "Vitreous hemorrhage; elevate the head of the bed, perform ocular ultrasound (B-scan) to rule out retinal detachment, and observe", "Acute angle-closure glaucoma; administer IV acetazolamide", "CMV retinitis; initiate systemic and intravitreal ganciclovir", "Central retinal artery occlusion; perform urgent anterior chamber paracentesis"]'::jsonb, 1, 'This patient has a **Vitreous Hemorrhage**, a common complication of **Proliferative Diabetic Retinopathy**. The initial steps are: (1) **elevate the head of the bed (30-45 degrees)** to allow the blood to settle inferiorly, clearing the visual axis, (2) perform an **ocular B-scan ultrasound** to ensure the underlying retina is flat and not detached (since the fundus cannot be visualized), and (3) observe, as many hemorrhages clear spontaneously over weeks to months.'),
    (v_case_id, 'What is the primary anatomical source of blood in a diabetic patient presenting with a vitreous hemorrhage?', '["Rupture of ciliary body capillaries due to high intraocular pressure", "Fragile, abnormal new vessels (neovascularization) growing along the vitreous face and retina that rupture easily", "A full-thickness retinal tear that shears a healthy retinal arteriole", "A tear in a major branch retinal vein due to severe systemic hypertension", "Bleeding from abnormal choroidal neovascular membranes through Bruch''s membrane"]'::jsonb, 1, 'In diabetes, **vitreous hemorrhage** is caused by the **rupture of fragile neovascular vessels (NVD or NVE)**. These abnormal vessels lack a normal muscular coat and tight endothelial junctions, making them extremely fragile. When the vitreous contracts or moves, it exerts traction on these vessels, causing them to tear and bleed directly into the vitreous cavity.'),
    (v_case_id, 'In which of the following scenarios is an URGENT pars plana vitrectomy indicated for a patient with a vitreous hemorrhage?', '["The presence of hard lipid exudates on the retinal surface", "The presence of a tractional or rhegmatogenous retinal detachment on B-scan ultrasound, or non-clearing hemorrhage >3-6 months", "An elevated intraocular pressure of 22 mmHg in the affected eye", "Any vitreous hemorrhage in a patient with a history of hypertension", "The presence of dry age-related macular degeneration in the contralateral eye"]'::jsonb, 1, 'An **urgent pars plana vitrectomy** is indicated if: (1) **B-scan ultrasound reveals an associated retinal detachment (tractional or rhegmatogenous)**, (2) the hemorrhage fails to clear after 3 to 6 months of conservative observation, preventing visual recovery and treatment, or (3) neovascularization of the iris/angle (rubeosis) develops, requiring clear media to perform PRP.');

    ---------------------------------------------------------------------------
    -- CASE 47: Vignette: The AIDS-Related Blindness (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The AIDS-Related Blindness (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The AIDS-Related Blindness (V5)', 'A 38-year-old male with HIV presents with a 1-week history of floaters, flashes of light, and blurred vision in the right eye. He admits to non-compliance with antiretroviral therapy (ART). His CD4 count is 21 cells/mcL.

**Physical Examination:**
*   **Vitals:** Temp: 99.0°F | HR: 72 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OD: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior chamber is quiet. Vitreous shows minimal inflammatory cells (1+). Dilated fundus examination reveals multiple, confluent, thick, yellow-white necrotic retinal lesions with perivascular sheathing and extensive, flame-shaped retinal hemorrhages along the vascular arches, giving a "pizza-pie" or "scrambled eggs and ketchup" appearance.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 38-year-old male with HIV presents with a 1-week history of floaters, flashes of light, and blurred vision in the right eye. He admits to non-compliance with antiretroviral therapy (ART). His CD4 count is 21 cells/mcL.

**Physical Examination:**
*   **Vitals:** Temp: 99.0°F | HR: 72 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OD: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior chamber is quiet. Vitreous shows minimal inflammatory cells (1+). Dilated fundus examination reveals multiple, confluent, thick, yellow-white necrotic retinal lesions with perivascular sheathing and extensive, flame-shaped retinal hemorrhages along the vascular arches, giving a "pizza-pie" or "scrambled eggs and ketchup" appearance.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the first-line therapy?', '["Acute retinal necrosis (ARN); intravenous acyclovir and oral valacyclovir", "Toxoplasma chorioretinitis; pyrimethamine, sulfadiazine, and folinic acid", "Syphilitic chorioretinitis; intravenous penicillin G for 14 days", "Cytomegalovirus (CMV) retinitis; systemic valganciclovir and/or intravitreal ganciclovir, plus initiation of ART", "Bacterial endophthalmitis; intravitreal vancomycin and ceftazidime"]'::jsonb, 3, 'This patient has **CMV Retinitis**, the most common opportunistic ocular infection in AIDS patients, typically occurring when the **CD4 count is <50 cells/mcL**. The classic fundus appearance is a **"pizza-pie" or "scrambled eggs and ketchup" pattern** of yellow-white necrotic lesions and massive hemorrhages. First-line therapy consists of **antivirals (ganciclovir/valganciclovir or foscarnet)** administered systemically and/or intravitreally, along with the **initiation or optimization of ART**.'),
    (v_case_id, 'Why is there typically very little vitreous cell or anterior chamber inflammation (vitritis/iritis) seen in patients with active CMV retinitis?', '["CMV selectively infects only the outer photoreceptors, sparing vascular structures", "The virus is physically restricted to the subretinal space", "The blood-aqueous barrier is completely impermeable to CMV antigens", "CMV produces potent anti-inflammatory cytokines that suppress local T-cells", "The severe immunosuppression prevents the host from mounting an inflammatory response (quiet vitreous)"]'::jsonb, 4, 'Active CMV retinitis characteristically presents with **minimal vitreous or anterior segment inflammation (quiet vitreous)**. This is because patients are **severely immunocompromised (CD4 < 50)** and cannot mount a cellular inflammatory response. If the immune system recovers (e.g., after starting ART), a massive inflammatory reaction can occur, known as **Immune Reconstitution Inflammatory Syndrome (IRIS)**, presenting as severe vitritis and macular edema.'),
    (v_case_id, 'What is the most common vision-threatening complication of CMV retinitis, occurring in up to 30% of patients?', '["Corneal stromal necrosis", "Neovascular glaucoma", "Sympathetic ophthalmia", "Rhegmatogenous retinal detachment", "Tractional retinal detachment"]'::jsonb, 3, 'The most common and feared complication of CMV retinitis is **rhegmatogenous retinal detachment**. The CMV virus causes full-thickness **necrosis and thinning of the retina**, leaving behind fragile, paper-thin necrotic tissue. As the vitreous contracts or pulls, multiple peripheral retinal holes and tears easily form, leading to a high rate of RRD that often requires complex surgery with silicone oil tamponade.');

    ---------------------------------------------------------------------------
    -- CASE 48: Vignette: The Painful Confluent Necrosis (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Painful Confluent Necrosis (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Painful Confluent Necrosis (V5)', 'A healthy, immunocompetent 58-year-old female presents with a 4-day history of severe, boring pain, redness, photophobia, and rapidly worsening vision in the right eye. She has no systemic symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 68 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OD):** Moderate episcleral injection. Slit-lamp shows 2+ granulomatous keratic precipitates on the corneal endothelium and 2+ cell/flare in the anterior chamber. There is significant **vitritis (3+)** obscuring the fundus. Dilated fundus examination reveals confluent, patch-like areas of yellowish-white peripheral retinal necrosis that are spreading circumferentially, with prominent retinal arteritis (perivascular sheathing).', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A healthy, immunocompetent 58-year-old female presents with a 4-day history of severe, boring pain, redness, photophobia, and rapidly worsening vision in the right eye. She has no systemic symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 68 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/20
*   **Ocular Examination (OD):** Moderate episcleral injection. Slit-lamp shows 2+ granulomatous keratic precipitates on the corneal endothelium and 2+ cell/flare in the anterior chamber. There is significant **vitritis (3+)** obscuring the fundus. Dilated fundus examination reveals confluent, patch-like areas of yellowish-white peripheral retinal necrosis that are spreading circumferentially, with prominent retinal arteritis (perivascular sheathing).', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary causative pathogen?', '["Acute Retinal Necrosis (ARN); Varicella-Zoster Virus (VZV) or Herpes Simplex Virus (HSV)", "Vogt-Koyanagi-Harada disease; autoimmune reaction to melanocytes", "Toxocariasis; Toxocara canis roundworm infection", "Endogenous bacterial endophthalmitis; Staphylococcus aureus", "CMV retinitis; Cytomegalovirus in a patient with undiagnosed AIDS"]'::jsonb, 0, 'This is **Acute Retinal Necrosis (ARN)**, which characteristically occurs in **immunocompetent** hosts. It is caused by herpesviruses, most commonly **Varicella-Zoster Virus (VZV)** or **Herpes Simplex Virus (HSV-1 or HSV-2)**. Key clinical features include: (1) severe ocular pain and redness, (2) severe **vitritis** (unlike CMV), and (3) confluent, peripheral **yellowish-white retinal necrosis** with retinal arteritis. Treatment is an emergency, requiring IV acyclovir or oral valacyclovir, combined with intravitreal ganciclovir.'),
    (v_case_id, 'Why is systemic corticosteroid therapy often used as an adjunct in the treatment of Acute Retinal Necrosis, and when should it be initiated?', '["Corticosteroids are used to prevent systemic viral spreading to the brain", "Corticosteroids are started immediately before antivirals to open the blood-retinal barrier", "Corticosteroids are strictly contraindicated because they promote viral replication in the retina", "Corticosteroids are started 24-48 hours after antiviral therapy to reduce the severe, vision-threatening vitreous inflammation", "Corticosteroids are used as monotherapy to suppress the autoimmune destruction of the retina"]'::jsonb, 3, 'Systemic **corticosteroids** (prednisone) are used as an adjunct to **reduce the severe, vision-threatening vitritis** and vascular inflammation associated with ARN. However, they must **never be given alone or before antivirals**. They are initiated **24 to 48 hours AFTER adequate antiviral therapy** has begun, ensuring that the viral replication is controlled so that steroids do not promote uncontrolled necrotizing viral spread.'),
    (v_case_id, 'What is the most common long-term complication of Acute Retinal Necrosis, occurring in over 75% of untreated patients?', '["Sympathetic ophthalmia in the contralateral eye", "Neovascular glaucoma from persistent retinal ischemia", "Tractional retinal detachment due to fibrovascular membranes", "Phacolytic glaucoma from lens protein leakage", "Rhegmatogenous retinal detachment due to peripheral retinal holes"]'::jsonb, 4, 'The most common and devastating complication of ARN is **rhegmatogenous retinal detachment**, occurring in **75-85% of untreated cases**. As the large, confluent zones of peripheral necrotic retina heal, they become paper-thin and develop **multiple, large, irregular tears and holes**. The severe vitritis also causes vitreous condensation and traction, pulling the torn retina off. Prophylactic laser retinopexy is often performed around necrotic areas to prevent this.');

    ---------------------------------------------------------------------------
    -- CASE 49: Vignette: The Segmental Shadow (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Segmental Shadow (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Segmental Shadow (V5)', 'A 59-year-old male with a history of carotid artery disease and smoking presents with a sudden, painless loss of the upper half of his visual field in the right eye that occurred 4 hours ago. His central vision is only mildly blurry.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 70 bpm | BP: 122/83 mmHg
*   **Visual Acuity:** OD: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OD):** No APD (or trace APD). Dilated fundus exam reveals a sharply demarcated, wedge-shaped area of pale, edematous retina confined to the inferior-temporal quadrant. At the first bifurcation of the inferior temporal retinal artery, there is a small, highly reflective, golden-yellow plaque (Hollenhorst plaque) obstructing the lumen.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 59-year-old male with a history of carotid artery disease and smoking presents with a sudden, painless loss of the upper half of his visual field in the right eye that occurred 4 hours ago. His central vision is only mildly blurry.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 70 bpm | BP: 122/83 mmHg
*   **Visual Acuity:** OD: 20/40; contralateral eye: 20/20
*   **Ocular Examination (OD):** No APD (or trace APD). Dilated fundus exam reveals a sharply demarcated, wedge-shaped area of pale, edematous retina confined to the inferior-temporal quadrant. At the first bifurcation of the inferior temporal retinal artery, there is a small, highly reflective, golden-yellow plaque (Hollenhorst plaque) obstructing the lumen.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Ischemic optic neuropathy", "Branch retinal vein occlusion (BRVO)", "Rhegmatogenous retinal detachment", "Central retinal artery occlusion (CRAO)", "Branch retinal artery occlusion (BRAO)"]'::jsonb, 4, 'This patient has a **Branch Retinal Artery Occlusion (BRAO)**. The clinical features are highly classic: sudden, painless, **segmental visual field loss** (corresponding to the blocked vessel), and a wedge-shaped area of **retinal pallor and edema** in the distribution of a branch arteriole, often with a visible **Hollenhorst plaque** at the bifurcation.'),
    (v_case_id, 'What is the primary composition and origin of a Hollenhorst plaque?', '["Calcific embolus originating from a stenotic aortic valve", "Amyloid protein aggregate from systemic amyloidosis", "Thrombus composed of sickled erythrocytes from ciliary vessels", "Platelet-fibrin thrombus originating from the left atrium in atrial fibrillation", "Cholesterol embolus originating from an atheromatous plaque in the internal carotid artery"]'::jsonb, 4, 'A **Hollenhorst plaque** is a **cholesterol embolus** that originates from an **atheromatous, ulcerated plaque in the ipsilateral internal carotid artery** (or aorta). It travels in the bloodstream and becomes lodged at a bifurcation of the retinal vasculature, where the vessel diameter narrows. It appears highly reflective, shiny, and golden-yellow.'),
    (v_case_id, 'How does the prognosis of visual acuity in BRAO generally compare to CRAO, and why?', '["Better, because the blocked arteriole undergoes spontaneous recanalization within minutes", "Identical, because both result in complete degeneration of the optic nerve head", "Worse, because branch arterioles are smaller and more prone to permanent spasm", "Significantly better, because the central fovea is usually spared and the macular perfusion is maintained by the unaffected arterioles", "Worse, because BRAO is highly associated with systemic vasculitis like Giant Cell Arteritis"]'::jsonb, 3, 'The prognosis for visual acuity in BRAO is **significantly better than in CRAO**. In BRAO, because only a branch arteriole is occluded, the central fovea is usually spared (unless the macular branch itself is involved), allowing the patient to maintain good central vision (20/40 or better in 80% of cases), though they will have a permanent, segmental visual field defect.');

    ---------------------------------------------------------------------------
    -- CASE 50: Vignette: The Silent Tension (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Silent Tension (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Silent Tension (V5)', 'A 62-year-old female with a history of poorly controlled type 1 diabetes and severe proliferative diabetic retinopathy presents with a slowly progressive, painless decrease in vision in her left eye over the past 2 months.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 73 bpm | BP: 130/87 mmHg
*   **Visual Acuity:** OS: 20/200; contralateral eye: 20/40
*   **Ocular Examination (OS):** Quiet anterior chamber. Dilated fundus examination reveals dense, white fibrovascular membranes in the vitreous cavity that are adherent to the retina. These bands are contracting and mechanically pulling the neurosensory retina away from the underlying RPE, creating a smooth, immobile, dome-like elevation of the retina. No retinal tears or holes are seen.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 62-year-old female with a history of poorly controlled type 1 diabetes and severe proliferative diabetic retinopathy presents with a slowly progressive, painless decrease in vision in her left eye over the past 2 months.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 73 bpm | BP: 130/87 mmHg
*   **Visual Acuity:** OS: 20/200; contralateral eye: 20/40
*   **Ocular Examination (OS):** Quiet anterior chamber. Dilated fundus examination reveals dense, white fibrovascular membranes in the vitreous cavity that are adherent to the retina. These bands are contracting and mechanically pulling the neurosensory retina away from the underlying RPE, creating a smooth, immobile, dome-like elevation of the retina. No retinal tears or holes are seen.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary surgical management?', '["Tractional retinal detachment; pars plana vitrectomy with membrane peeling and endolaser", "Exudative retinal detachment; systemic corticosteroids and immunosuppressants", "Rhegmatogenous retinal detachment; urgent pneumatic retinopexy", "Proliferative diabetic retinopathy; panretinal photocoagulation (PRP) alone", "Neovascular glaucoma; surgical trabeculectomy"]'::jsonb, 0, 'This is a **Tractional Retinal Detachment (TRD)**, a severe complication of proliferative diabetic retinopathy. Treatment requires **pars plana vitrectomy** to remove the vitreous gel, followed by **micro-surgical membrane peeling** to release the tractional forces pulling the retina, and **intraoperative endolaser (PRP)** to regress the neovascularization.'),
    (v_case_id, 'What is the key pathophysiological driver that leads to Tractional Retinal Detachment in diabetic patients?', '["Severe systemic hypertension causes transudative fluid to leak under the retina", "Deposition of amyloid plaques that stiffen the sensory retina", "Infiltration of the subretinal space by neoplastic retinoblastoma cells", "Liquefied vitreous leaks through a full-thickness retinal hole, dissecting the retina", "Ischemia-induced neovascularization grows along the posterior vitreous face, creating fibrovascular membranes that contract over time"]'::jsonb, 4, 'In proliferative diabetic retinopathy, chronic retinal ischemia drives the growth of abnormal new vessels (**neovascularization**). These vessels grow out of the retina and along the **posterior vitreous face**, accompanied by a scaffolding of fibrous tissue. Over time, these **fibrovascular membranes contract**, mechanically pulling the neurosensory retina off the underlying RPE.'),
    (v_case_id, 'Which of the following clinical features helps differentiate a Tractional Retinal Detachment from a Rhegmatogenous Retinal Detachment?', '["Tractional RD presents with sudden flashes, floaters, a corrugated wrinkled surface, and a horseshoe tear", "Tractional RD resolves spontaneously with steroid drops", "Tractional RD is always bilateral and associated with systemic arthritis", "Tractional RD is characteristically slowly progressive, has a smooth/concave surface, is non-shifting, and lacks retinal holes/tears", "Tractional RD is associated with high intraocular pressure and corneal clouding"]'::jsonb, 3, '**Tractional RD** is slowly progressive, has a **smooth, concave surface, is non-shifting** (does not move with gravity/head position), and **lacks full-thickness retinal tears/holes**. **Rhegmatogenous RD** is rapid in onset, has a **corrugated, wrinkled, convex surface, shifts with gravity**, and **always has a causative retinal tear/hole**.');

END $$;
COMMIT;
