-- Ophthalmology: Retinopathy
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: optho-retinopathy

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'optho-retinopathy' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'optho-retinopathy';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: The Microvascular Leaks (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Microvascular Leaks (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Microvascular Leaks (V1)', 'A 62-year-old female with a 15-year history of type 2 diabetes presents for an annual dilated eye exam. She has no visual symptoms and thinks her vision is perfect. Her last HbA1c was 10.1%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 135/82 mmHg
*   **Visual Acuity:** Bilateral 20/20 (corrected)
*   **Ocular Examination:** Anterior segments are normal. Dilated fundus examination reveals multiple microaneurysms, scattered red dot-and-blot hemorrhages, several fluffy white cotton-wool spots, and yellowish rings of hard lipid exudates in all four quadrants. No neovascularization is seen. Macular thickness is normal.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 62-year-old female with a 15-year history of type 2 diabetes presents for an annual dilated eye exam. She has no visual symptoms and thinks her vision is perfect. Her last HbA1c was 10.1%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 135/82 mmHg
*   **Visual Acuity:** Bilateral 20/20 (corrected)
*   **Ocular Examination:** Anterior segments are normal. Dilated fundus examination reveals multiple microaneurysms, scattered red dot-and-blot hemorrhages, several fluffy white cotton-wool spots, and yellowish rings of hard lipid exudates in all four quadrants. No neovascularization is seen. Macular thickness is normal.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what are the screening guidelines for this condition?', '["Diabetic macular edema; immediate focal laser photocoagulation", "Proliferative Diabetic Retinopathy (PDR); immediate panretinal photocoagulation", "Hypertensive retinopathy Grade III; urgent administration of IV nitroprusside", "Severe Non-Proliferative Diabetic Retinopathy (NPDR); annual dilated eye exams starting at the time of diagnosis for type 2 diabetes", "Moderate NPDR; dilated eye exams every 5 years starting at the time of diagnosis"]'::jsonb, 3, 'This patient has **Severe NPDR**, characterized by hemorrhages, microaneurysms, cotton-wool spots, and hard exudates in all 4 quadrants without neovascularization. For **Type 2 DM**, the screening guidelines require a **dilated eye exam at the time of diagnosis**, followed by **annual exams** (or more frequent if retinopathy progresses). For Type 1 DM, screening begins 5 years after diagnosis.'),
    (v_case_id, 'What is the key cellular event in the early pathogenesis of diabetic microvascular damage in the retina?', '["Proliferation of retinal pigment epithelial cells into the stroma", "Aqueous humor hypersecretion causing mechanical capillary compression", "Deposition of amyloid fibrils in the vascular wall", "Autoimmune infiltration of the retinal nerve fiber layer by T-cells", "Loss of intramural pericytes and capillary endothelial cell damage"]'::jsonb, 4, 'The earliest cellular changes in diabetic retinopathy are **loss of retinal capillary pericytes** (which provide structural support to capillaries) and **endothelial cell damage** induced by chronic hyperglycemia. This leads to capillary basement membrane thickening, endothelial cell loss, capillary incompetence/occlusion, and hyperpermeability (leaking).'),
    (v_case_id, 'What do the ''cotton-wool spots'' visible on this patient''s fundus exam represent?', '["Small pockets of fluid under the sensory retina", "Extracellular deposits of lipid and lipoprotein leaking from damaged capillaries", "Focal microinfarcts of the retinal nerve fiber layer due to axoplasmic flow obstruction in ischemic areas", "Congenital hamartomas of the astrocytes surrounding the optic nerve", "Fungal abscesses within the vitreous cavity"]'::jsonb, 2, '**Cotton-wool spots** (formerly called soft exudates) represent **focal microinfarcts of the retinal nerve fiber layer (RNFL)**. Capillary occlusion leads to localized ischemia of the axons. This halts axoplasmic transport, causing axoplasmic debris and organelles to accumulate, presenting clinically as fluffy, white-grey patches with indistinct borders.');

    ---------------------------------------------------------------------------
    -- CASE 02: The Neovascular Proliferation (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Neovascular Proliferation (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Neovascular Proliferation (V1)', 'A 63-year-old female with a history of poorly controlled type 1 diabetes presents with sudden onset of numerous floaters and blurry vision in the left eye. She has not had a dilated eye exam in 3 years. Her last HbA1c was 9.8%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 80 bpm | BP: 115/80 mmHg
*   **Visual Acuity:** OS: 20/200; contralateral eye: 20/30
*   **Ocular Examination (OS):** Dilated fundus examination reveals extensive microvascular abnormalities, including multiple looping, fragile new blood vessels growing on the optic disc (NVD) and elsewhere on the retina (NVE). A boat-shaped preretinal hemorrhage is partially obscuring the central macula.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 63-year-old female with a history of poorly controlled type 1 diabetes presents with sudden onset of numerous floaters and blurry vision in the left eye. She has not had a dilated eye exam in 3 years. Her last HbA1c was 9.8%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 80 bpm | BP: 115/80 mmHg
*   **Visual Acuity:** OS: 20/200; contralateral eye: 20/30
*   **Ocular Examination (OS):** Dilated fundus examination reveals extensive microvascular abnormalities, including multiple looping, fragile new blood vessels growing on the optic disc (NVD) and elsewhere on the retina (NVE). A boat-shaped preretinal hemorrhage is partially obscuring the central macula.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the first-line therapy?', '["Central retinal vein occlusion; systemic anticoagulation", "Vitreous detachment; reassurance and observation", "Proliferative Diabetic Retinopathy (PDR); Panretinal Photocoagulation (PRP) laser or intravitreal anti-VEGF injections", "Central retinal artery occlusion; urgent anterior chamber paracentesis", "Severe NPDR; initiating oral metformin and tight glycemic control alone"]'::jsonb, 2, 'This is **Proliferative Diabetic Retinopathy (PDR)**, defined by the presence of **neovascularization** (NVD/NVE). The boat-shaped preretinal hemorrhage is a classic complication. First-line treatments are **Panretinal Photocoagulation (PRP)** or **intravitreal anti-VEGF injections** to regress the abnormal vessels and prevent further bleeding/traction.'),
    (v_case_id, 'What molecular mediator is primarily responsible for driving the growth of abnormal new blood vessels in this condition?', '["Basic Fibroblast Growth Factor (bFGF)", "Transforming Growth Factor-beta (TGF-beta)", "Interleukin-6 (IL-6)", "Vascular Endothelial Growth Factor (VEGF)", "Tumor Necrosis Factor-alpha (TNF-alpha)"]'::jsonb, 3, 'Retinal capillary closure causes widespread tissue **hypoxia**, which triggers the upregulation of hypoxia-inducible factor-1 (HIF-1). This drives the massive production and release of **Vascular Endothelial Growth Factor (VEGF)** by retinal astrocytes, Müller cells, and RPE, which stimulates abnormal angiogenesis.'),
    (v_case_id, 'What is the mechanism by which Panretinal Photocoagulation (PRP) prevents visual loss in Proliferative Diabetic Retinopathy?', '["PRP increases the diameter of ciliary vessels to improve retinal blood flow", "PRP seals the vitreous membrane to the retina, preventing tractional tears", "PRP stimulates the proliferation of pericytes to stabilize the vessels", "PRP ablates the hypoxic peripheral retina, reducing overall oxygen demand and decreasing VEGF production, saving the central macula", "PRP directly coagulates the leaky neovascular vessels on the optic disc"]'::jsonb, 3, '**PRP** works by applying thousands of laser burns to the **hypoxic peripheral retina**, converting it into non-functioning scar tissue. This **reduces the overall metabolic demand and oxygen consumption of the retina**, eliminating the drive for **VEGF release**. With lower VEGF levels, the abnormal new vessels on the disc and retina regress, preserving central macular vision.');

    ---------------------------------------------------------------------------
    -- CASE 03: The Central Blur of DME (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Central Blur of DME (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Central Blur of DME (V1)', 'A 54-year-old male with a 10-year history of diabetes presents with slowly progressive, painless blurring of central vision in both eyes, making it very difficult to read or drive. His blood sugar is managed with insulin.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 76 bpm | BP: 140/88 mmHg
*   **Visual Acuity:** Bilateral 20/80 (no improvement with pinhole)
*   **Ocular Examination:** Dilated fundus examination reveals multiple microaneurysms, dot hemorrhages, and a prominent ring of yellowish hard lipid exudates in the central macula. Slit-lamp biomicroscopy shows significant retinal thickening and swelling in the fovea. Optical coherence tomography (OCT) confirms bilateral cystoid macular edema with subretinal fluid.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 54-year-old male with a 10-year history of diabetes presents with slowly progressive, painless blurring of central vision in both eyes, making it very difficult to read or drive. His blood sugar is managed with insulin.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 76 bpm | BP: 140/88 mmHg
*   **Visual Acuity:** Bilateral 20/80 (no improvement with pinhole)
*   **Ocular Examination:** Dilated fundus examination reveals multiple microaneurysms, dot hemorrhages, and a prominent ring of yellowish hard lipid exudates in the central macula. Slit-lamp biomicroscopy shows significant retinal thickening and swelling in the fovea. Optical coherence tomography (OCT) confirms bilateral cystoid macular edema with subretinal fluid.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the gold-standard treatment?', '["Nuclear cataract; surgical lens extraction", "Central retinal vein occlusion; systemic heparin", "Tractional retinal detachment; urgent vitrectomy", "Dry AMD; high-dose AREDS2 vitamins", "Diabetic Macular Edema (DME); intravitreal anti-VEGF injections"]'::jsonb, 4, 'This is **Diabetic Macular Edema (DME)**, the most common cause of vision loss in diabetic patients. The gold-standard first-line treatment is **intravitreal anti-VEGF injections** (e.g., aflibercept, ranibizumab), which are highly effective at reducing macular thickness and improving visual acuity by closing endothelial tight junctions and stopping vessel leakage.'),
    (v_case_id, 'What is the primary pathophysiological mechanism responsible for fluid accumulation in the macula in DME?', '["Hypersecretion of fluid by the ciliary body epithelium", "An immune-mediated hypersensitivity reaction to insulin molecules", "Mechanical blockage of the ciliary veins at the scleral spur", "Breakdown of the blood-retinal barrier due to loss of endothelial tight junctions", "Tractional pull of the posterior vitreous face on the fovea"]'::jsonb, 3, 'DME is caused by the **breakdown of the blood-retinal barrier (BRB)**. Chronic hyperglycemia and vascular endothelial damage lead to the **loss of endothelial tight junctions (zonula occludens)**. This allows fluid, proteins, and lipids to leak from the capillaries into the extracellular space of the retina, particularly the macula.'),
    (v_case_id, 'Which of the following imaging modalities is most essential for the diagnosis, quantification, and monitoring of Diabetic Macular Edema?', '["CT scan of the orbits", "Fluorescein Angiography (FA)", "Optical Coherence Tomography (OCT)", "Visual field testing (perimetry)", "Ocular B-scan Ultrasound"]'::jsonb, 2, '**Optical Coherence Tomography (OCT)** is the most essential, non-invasive imaging modality for DME. It uses light waves to capture high-resolution, cross-sectional images of the retina, allowing for the precise measurement of retinal thickness, quantification of macular edema, and monitoring of the response to anti-VEGF injections.');

    ---------------------------------------------------------------------------
    -- CASE 04: The Copper Wiring and AV Crossing (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Copper Wiring and AV Crossing (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Copper Wiring and AV Crossing (V1)', 'A 66-year-old female presenting for a routine eye exam is found to have a blood pressure of 138/84 mmHg. She has a history of essential hypertension but admits to frequently missing her antihypertensive medications.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 77 bpm | BP: 138/84 mmHg
*   **Visual Acuity:** Bilateral 20/20 (uncorrected)
*   **Ocular Examination:** Dilated fundus examination reveals generalized narrowing and focal constriction of the retinal arterioles. The arteriolar light reflex is widened, giving the vessels a "copper-wire" appearance. There is prominent arteriovenous (AV) nicking, where arterioles cross and compress the underlying retinal veins. No hemorrhages or disc edema are present.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 66-year-old female presenting for a routine eye exam is found to have a blood pressure of 138/84 mmHg. She has a history of essential hypertension but admits to frequently missing her antihypertensive medications.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 77 bpm | BP: 138/84 mmHg
*   **Visual Acuity:** Bilateral 20/20 (uncorrected)
*   **Ocular Examination:** Dilated fundus examination reveals generalized narrowing and focal constriction of the retinal arterioles. The arteriolar light reflex is widened, giving the vessels a "copper-wire" appearance. There is prominent arteriovenous (AV) nicking, where arterioles cross and compress the underlying retinal veins. No hemorrhages or disc edema are present.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary management?', '["Ocular ischemic syndrome; urgent carotid endarterectomy", "Mild Diabetic Retinopathy; oral metformin and glucose monitoring", "Normal-tension glaucoma; topical prostaglandin drops", "Central retinal artery occlusion; immediate ocular massage", "Moderate Hypertensive Retinopathy; strict systemic blood pressure control"]'::jsonb, 4, 'This patient has **Moderate Hypertensive Retinopathy** (Grade II on the Keith-Wagener-Barker classification), characterized by generalized/focal arteriolar narrowing, **copper wiring**, and **AV nicking** without hemorrhages or disc edema. The primary management is **strict systemic blood pressure control** to prevent further microvascular damage and reduce the risk of stroke/MI.'),
    (v_case_id, 'What is the anatomical explanation for the sign known as ''arteriovenous (AV) nicking''?', '["A localized thrombus forms in the vein due to turbulent flow under the arteriole", "The vein is pulled backward by contracting vitreous strands", "Inflammatory cells accumulate in the sub-adventitial space, obscuring the vein", "The sclerotic arteriole compresses the underlying vein because they share a common adventitial sheath at crossing points", "The arteriole and vein fuse, forming an abnormal micro-fistula"]'::jsonb, 3, '**AV nicking** occurs because the **retinal arteriole and vein share a common adventitial sheath** where they cross. As chronic hypertension causes arteriolar wall hypertrophy and sclerosis, the stiffened, thickened arteriole physically compresses the underlying, thin-walled vein, making the vein appear compressed, tapered, or blocked on either side of the crossing.'),
    (v_case_id, 'What represents the funduscopic sign known as ''silver wiring'' in advanced hypertensive retinopathy?', '["Deposition of calcium in the vessel wall", "A plaque of cholesterol blocking a branch arteriole", "Severe arteriolar wall sclerosis where the lumen is completely obscured and the vessel appears white and reflective", "Calcification of the optic disc margin", "White blood cells lining the endothelium of the arterioles"]'::jsonb, 2, '**Silver wiring** is an advanced stage of arteriolar sclerosis (Keith-Wagener Grade III/IV). The arteriolar wall becomes so thick and opaque that the red blood column inside is completely invisible. The vessel reflects light completely, appearing as a **white, reflective, shiny wire**.');

    ---------------------------------------------------------------------------
    -- CASE 05: The Macular Star and Papilledema (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Macular Star and Papilledema (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Macular Star and Papilledema (V1)', 'A 37-year-old male presents to the emergency department with a severe headache, nausea, and sudden blurry vision in both eyes. His blood pressure is found to be 128/86 mmHg.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 95 bpm | BP: 128/86 mmHg
*   **Visual Acuity:** Bilateral 20/80
*   **Ocular Examination:** Dilated fundus exam reveals multiple flame-shaped hemorrhages, cotton-wool spots, a prominent, radial "macular star" of hard lipid exudates in both maculae, and bilateral marked swelling and blurring of the optic disc margins (Grade IV hypertensive retinopathy).', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 37-year-old male presents to the emergency department with a severe headache, nausea, and sudden blurry vision in both eyes. His blood pressure is found to be 128/86 mmHg.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 95 bpm | BP: 128/86 mmHg
*   **Visual Acuity:** Bilateral 20/80
*   **Ocular Examination:** Dilated fundus exam reveals multiple flame-shaped hemorrhages, cotton-wool spots, a prominent, radial "macular star" of hard lipid exudates in both maculae, and bilateral marked swelling and blurring of the optic disc margins (Grade IV hypertensive retinopathy).', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most urgent medical intervention for this patient?', '["Controlled reduction of blood pressure using intravenous antihypertensives in an intensive care setting", "High-dose systemic oral corticosteroids to reduce optic nerve swelling", "Bilateral anterior chamber paracentesis to lower intraocular pressure", "Urgent lumbar puncture to relieve intracranial pressure", "Immediate bilateral panretinal photocoagulation laser therapy"]'::jsonb, 0, 'This patient has **Severe/Malignant Hypertensive Retinopathy (Grade IV)**, presenting as a **hypertensive emergency**. The most urgent intervention is admission to an ICU for **controlled reduction of blood pressure** using IV medications (e.g., nitroprusside, labetalol) to prevent life-threatening end-organ damage (stroke, encephalopathy, renal failure). Aggressive, too-rapid BP reduction must be avoided to prevent optic nerve or cerebral ischemia.'),
    (v_case_id, 'What is the composition and anatomical location of the ''macular star'' seen in this patient?', '["Lipids and lipoproteins deposited in a radial pattern within the Henle''s fiber layer of the macula", "New blood vessels branching out from the central fovea", "Pockets of serous fluid under the neurosensory retina", "Axoplasmic debris accumulating in the ganglion cell layer", "Calcium deposits in Bruch''s membrane"]'::jsonb, 0, 'The **macular star** is composed of **lipid and lipoprotein exudates** that leak from damaged, hyperpermeable peripapillary and retinal capillaries. These lipids are deposited in the **outer plexiform layer of the macula (specifically Henle''s fiber layer)**, which has a unique, radially oriented anatomy, forcing the exudates into a star-like or fan-like pattern centered on the fovea.'),
    (v_case_id, 'Which of the following represents the recommended rate of blood pressure reduction in the first hour of managing a hypertensive emergency?', '["Reduce the diastolic pressure by exactly 50% within the first 30 minutes", "Reduce the Mean Arterial Pressure (MAP) by no more than 20% to 25% in the first hour", "Drop the BP immediately to 120/80 mmHg to prevent intracranial hemorrhage", "Maintain the BP at baseline and initiate oral beta-blockers for slow reduction over a week", "Lower the systolic pressure to <90 mmHg to reduce ocular pressure"]'::jsonb, 1, 'In a hypertensive emergency, the **Mean Arterial Pressure (MAP) should be lowered by no more than 20% to 25% in the first hour**, and then to stable levels (e.g., 160/100-110) over the next 2 to 6 hours. Lowering the BP too rapidly or to normal levels too quickly can cause **severe organ hypoperfusion**, resulting in ischemic stroke, myocardial infarction, or anterior ischemic optic neuropathy (AION) due to loss of autoregulation.');

    ---------------------------------------------------------------------------
    -- CASE 06: The Premature Baby's Ridge (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Premature Baby''s Ridge (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Premature Baby''s Ridge (V1)', 'A 2-month-old infant born at 27 weeks gestation with a birth weight of 907 grams, who required high-flow supplemental oxygen therapy in the NICU for 44 days, undergoes a screening dilated eye exam.

**Physical Examination:**
*   **Vitals:** Stable premature infant.
*   **Ocular Examination (OU):** Dilated fundus exam reveals incomplete vascularization of the peripheral retina, with a prominent white demarcation line and an elevated ridge between the vascular and avascular zones, along with extraretinal fibrovascular proliferation extending into the vitreous (Stage 3 ROP). There is dilation and tortuosity of the posterior retinal vessels ("plus disease").', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 2-month-old infant born at 27 weeks gestation with a birth weight of 907 grams, who required high-flow supplemental oxygen therapy in the NICU for 44 days, undergoes a screening dilated eye exam.

**Physical Examination:**
*   **Vitals:** Stable premature infant.
*   **Ocular Examination (OU):** Dilated fundus exam reveals incomplete vascularization of the peripheral retina, with a prominent white demarcation line and an elevated ridge between the vascular and avascular zones, along with extraretinal fibrovascular proliferation extending into the vitreous (Stage 3 ROP). There is dilation and tortuosity of the posterior retinal vessels ("plus disease").', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what are the main risk factors?', '["Retinoblastoma; hereditary mutation in the RB1 gene", "Persistent Fetal Vasculature (PFV); maternal rubella infection in utero", "Congenital cataracts; autosomal dominant inheritance", "Coats'' disease; idiopathic retinal telangiectasia in young males", "Retinopathy of Prematurity (ROP); premature birth (<30 weeks), low birth weight (<1500g), and supplemental oxygen therapy"]'::jsonb, 4, 'This infant has **Retinopathy of Prematurity (ROP)**. The primary risk factors are **extreme prematurity (gestational age <30 weeks)**, **low birth weight (<1500 grams)**, and **supplemental oxygen therapy**. High-flow oxygen in the NICU disrupts normal peripheral retinal vascular development, leading to hypoxia and abnormal neovascularization once returned to room air.'),
    (v_case_id, 'What is the dual-phase pathophysiological mechanism of ROP driven by oxygen levels?', '["Oxygen causes primary thrombi in the central retinal artery, followed by venous bleeding", "Hyperoxia directly toxic to ciliary nerves, paralyzing pupil; relative hypoxia causes iris necrosis", "Oxygen stimulates the direct migration of corneal stem cells into the vitreous cavity", "Hyperoxia causes downregulation of VEGF, halting vascular growth; subsequent relative hypoxia in room air triggers massive VEGF upregulation and neovascularization", "Relative hypoxia causes mechanical tearing of the retina due to scleral stretching"]'::jsonb, 3, 'ROP is a **two-phase disease**: (1) **Hyperoxia Phase**: The high oxygen environment of the incubator downregulates VEGF, causing normal vessel growth to halt. (2) **Hypoxia Phase**: When the infant is removed from supplemental oxygen, the avascular peripheral retina becomes ischemic and highly hypoxic, triggering a **massive upregulation of VEGF**. This drives abnormal, fragile neovascularization at the boundary of the vascularized retina.'),
    (v_case_id, 'What represents the definition and significance of ''plus disease'' in Retinopathy of Prematurity?', '["The presence of a patent ductus arteriosus in the infant", "The development of a tractional retinal detachment in Stage 5", "An elevated intraocular pressure >21 mmHg in both eyes", "Severe dilation and tortuosity of the posterior retinal vessels, indicating high disease activity and a need for treatment", "The presence of bilateral congenital cataracts alongside retinal changes"]'::jsonb, 3, '**''Plus disease''** is defined by **marked dilation and tortuosity of the retinal blood vessels in the posterior pole** (in at least two quadrants). It indicates severe shunting and highly active neovascularization, representing a key threshold sign that warrants **prompt treatment** (laser photocoagulation or anti-VEGF) to prevent progression to retinal detachment.');

    ---------------------------------------------------------------------------
    -- CASE 07: The Sea-Fan Neovascularization (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sea-Fan Neovascularization (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sea-Fan Neovascularization (V1)', 'A 32-year-old African American male with HbSC sickle cell disease presents with sudden onset of multiple floaters and mild visual loss in the right eye. He has had no recent sickle cell crises.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 72 bpm | BP: 118/76 mmHg
*   **Visual Acuity:** OD: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OD):** Dilated fundus examination reveals multiple peripheral retinal arteriolar occlusions, with localized areas of retinal thinning. In the temporal periphery, there are multiple abnormal branching vessels resembling sea-fans ("sea-fan neovascularization") arising from the boundary of the vascularized retina, along with a localized vitreous hemorrhage.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 32-year-old African American male with HbSC sickle cell disease presents with sudden onset of multiple floaters and mild visual loss in the right eye. He has had no recent sickle cell crises.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 72 bpm | BP: 118/76 mmHg
*   **Visual Acuity:** OD: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OD):** Dilated fundus examination reveals multiple peripheral retinal arteriolar occlusions, with localized areas of retinal thinning. In the temporal periphery, there are multiple abnormal branching vessels resembling sea-fans ("sea-fan neovascularization") arising from the boundary of the vascularized retina, along with a localized vitreous hemorrhage.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and which sickle cell genotype is most commonly associated with severe proliferative retinopathy?', '["Proliferative Diabetic Retinopathy; HbSS genotype is highly protective", "Eales'' disease; HbAS (carrier) is the only associated genotype", "Sickle Cell Retinopathy; HbSC and HbS-Thal genotypes are more commonly associated with severe proliferative disease than HbSS", "Coats'' disease; HbSS genotype is diagnostic", "Sickle Cell Retinopathy; HbSS genotype is far more common and severe than HbSC"]'::jsonb, 2, 'This is **Sickle Cell Retinopathy**. Interestingly, proliferative retinopathy is **more common and severe in HbSC and HbS-Beta-Thalassemia genotypes** than in the homozygous HbSS genotype (which has more severe systemic vaso-occlusive crises but fewer ocular vascular occlusions). Classic signs are peripheral arteriolar occlusions and **"sea-fan" neovascularization**.'),
    (v_case_id, 'What represents the classic non-proliferative fundus signs known as ''salmon-patch'' and ''black sunburst'' in sickle cell disease?', '["Salmon-patch: RPE atrophy; Black sunburst: choroidal neovascular membrane", "Salmon-patch: congenital choroidal hemangioma; Black sunburst: optic disc calcification", "Salmon-patch: ciliary body cysts; Black sunburst: iris transillumination defects", "Salmon-patch: intraretinal/subretinal hemorrhage that turns yellow-pink; Black sunburst: localized RPE hyperpigmentation from old blood", "Salmon-patch: lipid exudates in Henle''s layer; Black sunburst: cotton-wool spots surrounding the macula"]'::jsonb, 3, '**Salmon-patch hemorrhages** are dome-shaped intraretinal/subretinal hemorrhages in the mid-periphery that liquefy and turn orange-pink over time. **Black sunbursts** are round, dark, hyperpigmented lesions in the peripheral retina caused by hyperplasia of the RPE in response to localized subretinal hemorrhage, representing old, cleared blood.'),
    (v_case_id, 'Why is the use of carbonic anhydrase inhibitors (particularly systemic acetazolamide) strictly CONTRAINDICATED in patients with sickle cell disease who develop elevated intraocular pressure?', '["Acetazolamide causes severe macular edema in sickle cell patients", "Acetazolamide has no efficacy in lowering IOP in these patients", "Acetazolamide triggers an autoimmune hemolytic anemia", "Acetazolamide reacts with hemoglobin S to cause corneal calcification", "Acetazolamide induces systemic acidosis and dehydration, which directly promotes sickling of erythrocytes, worsening vascular occlusion"]'::jsonb, 4, 'Systemic **acetazolamide** (and other CAIs) is **strictly contraindicated in sickle cell disease**. It causes systemic metabolic acidosis and dehydration, which increases the concentration of sickled cells and **promotes sickling of erythrocytes**. In the eye, sickling of RBCs in the anterior chamber can completely block the trabecular meshwork, causing a rapid, uncontrollable IOP spike. Methazolamide or topical drops (excluding CAIs) are used instead.');

    ---------------------------------------------------------------------------
    -- CASE 08: The Stress-Induced Spot (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Stress-Induced Spot (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Stress-Induced Spot (V1)', 'A 34-year-old male corporate executive presents with a sudden, painless central gray spot (scotoma) and distortion of shapes (metamorphopsia) in his right eye. He reports high stress at work and recently received a corticosteroid injection for shoulder pain.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 78 bpm | BP: 118/75 mmHg
*   **Visual Acuity:** OD: 20/40 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior segment is quiet. Dilated fundus exam reveals a well-demarcated, dome-like elevation of the sensory retina in the central macula. No hemorrhages, drusen, or cotton-wool spots are seen. OCT confirms a localized serous detachment of the neurosensory retina with a normal-thickness choroid.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 34-year-old male corporate executive presents with a sudden, painless central gray spot (scotoma) and distortion of shapes (metamorphopsia) in his right eye. He reports high stress at work and recently received a corticosteroid injection for shoulder pain.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 78 bpm | BP: 118/75 mmHg
*   **Visual Acuity:** OD: 20/40 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior segment is quiet. Dilated fundus exam reveals a well-demarcated, dome-like elevation of the sensory retina in the central macula. No hemorrhages, drusen, or cotton-wool spots are seen. OCT confirms a localized serous detachment of the neurosensory retina with a normal-thickness choroid.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the initial management step?', '["Central Serous Chorioretinopathy (CSCR); discontinue all corticosteroids, reduce stress, and observe", "Optic neuritis; initiate high-dose intravenous methylprednisolone", "CMV retinitis; start systemic valganciclovir", "Rhegmatogenous retinal detachment; urgent pneumatic retinopexy", "Wet AMD; immediate intravitreal anti-VEGF injection"]'::jsonb, 0, 'This is **Central Serous Chorioretinopathy (CSCR)**, typically affecting young/middle-aged males under high stress (type A personality) or using **corticosteroids** (oral, topical, inhaled, or joint injection). The initial step is to **discontinue all corticosteroids**, manage stress, and **observe**, as 80-90% of cases resolve spontaneously within 3 to 4 months without intervention.'),
    (v_case_id, 'What is the primary pathophysiological defect leading to fluid leakage under the macula in CSCR?', '["Hypersecretion of aqueous humor by the ciliary muscle", "Autoimmune destruction of the macular photoreceptors", "Thrombosis of the vortex veins leading to back-pressure", "Choroidal hyperpermeability combined with focal dysfunction of the retinal pigment epithelium (RPE) barrier", "Tractional pulling of the fovea by a vitreous membrane"]'::jsonb, 3, 'The primary defect in CSCR is **choroidal hyperpermeability** (possibly driven by high cortisol/epinephrine levels). The hyper-permeable choroid causes fluid to build up under the RPE, eventually leading to a **focal defect or breakdown in the RPE tight junctions (outer blood-retinal barrier)**, allowing fluid to leak into the subretinal space, separating the retina from the RPE.'),
    (v_case_id, 'Which classic pattern is visible on fluorescein angiography during active fluid leakage in CSCR?', '["A ''smokestack'' or ''ink-blot'' leak of dye rising through the RPE into the subretinal space", "Multiple peripheral ''sea-fan'' branching leaks", "A ''cherry-red'' block of dye in the central foveola", "A ''Swiss-cheese'' pattern of late hyperfluorescence at the optic disc", "A ''blood and thunder'' diffuse blockage of choroidal fluorescence"]'::jsonb, 0, 'On **fluorescein angiography (FA)**, CSCR classically presents as an **''ink-blot'' leak** (a expanding spot of dye) or a **''smokestack'' leak** (where dye rises vertically through the RPE leak and spreads horizontally, resembling a plume of smoke, due to convection currents in the subretinal fluid).');

    ---------------------------------------------------------------------------
    -- CASE 09: The Post-Radiation Blur (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Post-Radiation Blur (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Post-Radiation Blur (V1)', 'A 47-year-old female presents with slowly progressive, painless blurring of central vision in her left eye. She has a history of undergoing radiation therapy for a head and neck squamous cell carcinoma 3 years ago. She is not diabetic.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 130/80 mmHg
*   **Visual Acuity:** OS: 20/100; contralateral eye: 20/20
*   **Ocular Examination (OS):** Dilated fundus examination reveals extensive capillary loss, microaneurysms, flame-shaped and dot hemorrhages, cotton-wool spots, and macular edema, closely mimicking diabetic retinopathy but without a history of diabetes or hyperglycemia.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 47-year-old female presents with slowly progressive, painless blurring of central vision in her left eye. She has a history of undergoing radiation therapy for a head and neck squamous cell carcinoma 3 years ago. She is not diabetic.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 130/80 mmHg
*   **Visual Acuity:** OS: 20/100; contralateral eye: 20/20
*   **Ocular Examination (OS):** Dilated fundus examination reveals extensive capillary loss, microaneurysms, flame-shaped and dot hemorrhages, cotton-wool spots, and macular edema, closely mimicking diabetic retinopathy but without a history of diabetes or hyperglycemia.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Diabetic retinopathy", "CMV retinitis", "Radiation retinopathy", "Ocular ischemic syndrome", "Central retinal vein occlusion"]'::jsonb, 2, 'This is **Radiation Retinopathy**, a delayed complication of ionizing radiation to the eye or surrounding structures (e.g. sinuses, brain, head/neck). It closely mimics diabetic retinopathy due to progressive **damage to vascular endothelial cells**, leading to capillary occlusion, retinal ischemia, exudation, and macular edema.'),
    (v_case_id, 'What is the typical latency period between radiation exposure and the development of Radiation Retinopathy?', '["There is no latency; it only occurs during active radiation treatment", "Radiation retinopathy occurs immediately during the first fraction of therapy", "1 to 5 years, depending on the radiation dose and volume", "2 to 7 days, representing acute tissue burn", "Exactly 10 to 15 years, representing late genetic transformation"]'::jsonb, 2, 'Radiation retinopathy has a **latency period of 1 to 5 years** (typically peak onset at 2 to 3 years) between the completion of radiation therapy and the onset of clinical symptoms. The latency is inversely related to the total radiation dose delivered to the eye (doses >30-35 Gy carry high risk).'),
    (v_case_id, 'What is the first-line treatment for managing vision loss from macular edema in Radiation Retinopathy?', '["Bilateral panretinal photocoagulation (PRP) immediately", "Urgent surgical pars plana vitrectomy", "High-dose systemic oral corticosteroids", "Intravitreal injections of broad-spectrum antibiotics", "Intravitreal anti-VEGF injections or focal/grid laser therapy"]'::jsonb, 4, 'Treatment for radiation retinopathy is directed at complications, primarily macular edema and neovascularization. First-line therapy for macular edema is **intravitreal anti-VEGF injections** (aflibercept, ranibizumab) or **focal/grid laser**, similar to diabetic macular edema. PRP is used if proliferative neovascularization develops.');

    ---------------------------------------------------------------------------
    -- CASE 10: The Post-Traumatic White Patches (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Post-Traumatic White Patches (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Post-Traumatic White Patches (V1)', 'A 25-year-old female is brought to the emergency department after a severe motor vehicle collision with massive chest wall compression and bilateral femur fractures. She complains of sudden, profound loss of vision in both eyes that occurred shortly after the accident.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 110 bpm | BP: 100/60 mmHg
*   **Ocular Examination (OU):** Dilated fundus examination reveals multiple, large, polygonal white patches of retinal whitening ("Purtscher flecken") and multiple cotton-wool spots surrounding the optic nerve head bilaterally, accompanied by scattered flame-shaped hemorrhages. The optic discs are normal.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old female is brought to the emergency department after a severe motor vehicle collision with massive chest wall compression and bilateral femur fractures. She complains of sudden, profound loss of vision in both eyes that occurred shortly after the accident.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 110 bpm | BP: 100/60 mmHg
*   **Ocular Examination (OU):** Dilated fundus examination reveals multiple, large, polygonal white patches of retinal whitening ("Purtscher flecken") and multiple cotton-wool spots surrounding the optic nerve head bilaterally, accompanied by scattered flame-shaped hemorrhages. The optic discs are normal.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Malignant hypertensive retinopathy", "Terson''s syndrome", "Traumatic optic neuropathy", "Purtscher''s retinopathy", "CMV retinitis"]'::jsonb, 3, 'This is **Purtscher''s Retinopathy**, a post-traumatic chorioretinopathy associated with severe head or **thoracic compression injury**, long-bone fractures, or acute pancreatitis. Classic fundus findings are **Purtscher flecken** (polygonal areas of inner retinal whitening) and cotton-wool spots located in the peripapillary region, with sudden bilateral visual loss.'),
    (v_case_id, 'What is the primary proposed pathophysiological mechanism driving Purtscher''s Retinopathy?', '["Massive vitreous hemorrhage blocking the visual axis", "Leukoembolization of microvasculature by granulocyte aggregates triggered by complement activation", "Autoimmune destruction of the retinal nerve fiber layer by anti-retinal antibodies", "Direct mechanical shearing of the central retinal artery during trauma", "Retrobulbar hemorrhage compressing the optic nerve in the canal"]'::jsonb, 1, 'The primary mechanism is **leukoembolization**. Severe trauma, complement activation, or fat emboli from long-bone fractures cause the aggregation of white blood cells (granulocytes), platelets, or lipids. These **microemboli clog the precapillary arterioles** of the peripapillary retina, leading to focal microinfarcts (cotton-wool spots) and localized inner retinal ischemia (Purtscher flecken).'),
    (v_case_id, 'What represents the classic funduscopic finding known as ''Purtscher flecken'' that distinguishes this condition?', '["A bright cherry-red spot in the foveola", "Splinter hemorrhages at the optic disc margin", "Polygonal areas of inner retinal whitening located between the retinal arterioles and venules, sparing the immediate peripapillary zone", "Extracellular yellowish drusen in the central macula", "Demarcation line and ridge in the peripheral retina"]'::jsonb, 2, '**Purtscher flecken** are **polygonal areas of inner retinal whitening** located between the retinal arterioles and venules. They characteristically **spare the immediate peripapillary zone** (within 0.5 disc diameters) because of the different vascular supply (cilioretinal) and are highly pathognomonic for this trauma-related or pancreatitis-related micro-embolization.');

    ---------------------------------------------------------------------------
    -- CASE 11: The Microvascular Leaks - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Microvascular Leaks - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Microvascular Leaks - Clinical Presentation (V2)', 'A 47-year-old female with a 15-year history of type 2 diabetes presents for an annual dilated eye exam. She has no visual symptoms and thinks her vision is perfect. Her last HbA1c was 8.9%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 135/82 mmHg
*   **Visual Acuity:** Bilateral 20/20 (corrected)
*   **Ocular Examination:** Anterior segments are normal. Dilated fundus examination reveals multiple microaneurysms, scattered red dot-and-blot hemorrhages, several fluffy white cotton-wool spots, and yellowish rings of hard lipid exudates in all four quadrants. No neovascularization is seen. Macular thickness is normal.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 47-year-old female with a 15-year history of type 2 diabetes presents for an annual dilated eye exam. She has no visual symptoms and thinks her vision is perfect. Her last HbA1c was 8.9%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 135/82 mmHg
*   **Visual Acuity:** Bilateral 20/20 (corrected)
*   **Ocular Examination:** Anterior segments are normal. Dilated fundus examination reveals multiple microaneurysms, scattered red dot-and-blot hemorrhages, several fluffy white cotton-wool spots, and yellowish rings of hard lipid exudates in all four quadrants. No neovascularization is seen. Macular thickness is normal.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what are the screening guidelines for this condition?', '["Hypertensive retinopathy Grade III; urgent administration of IV nitroprusside", "Diabetic macular edema; immediate focal laser photocoagulation", "Proliferative Diabetic Retinopathy (PDR); immediate panretinal photocoagulation", "Severe Non-Proliferative Diabetic Retinopathy (NPDR); annual dilated eye exams starting at the time of diagnosis for type 2 diabetes", "Moderate NPDR; dilated eye exams every 5 years starting at the time of diagnosis"]'::jsonb, 3, 'This patient has **Severe NPDR**, characterized by hemorrhages, microaneurysms, cotton-wool spots, and hard exudates in all 4 quadrants without neovascularization. For **Type 2 DM**, the screening guidelines require a **dilated eye exam at the time of diagnosis**, followed by **annual exams** (or more frequent if retinopathy progresses). For Type 1 DM, screening begins 5 years after diagnosis.'),
    (v_case_id, 'What is the key cellular event in the early pathogenesis of diabetic microvascular damage in the retina?', '["Proliferation of retinal pigment epithelial cells into the stroma", "Autoimmune infiltration of the retinal nerve fiber layer by T-cells", "Deposition of amyloid fibrils in the vascular wall", "Aqueous humor hypersecretion causing mechanical capillary compression", "Loss of intramural pericytes and capillary endothelial cell damage"]'::jsonb, 4, 'The earliest cellular changes in diabetic retinopathy are **loss of retinal capillary pericytes** (which provide structural support to capillaries) and **endothelial cell damage** induced by chronic hyperglycemia. This leads to capillary basement membrane thickening, endothelial cell loss, capillary incompetence/occlusion, and hyperpermeability (leaking).'),
    (v_case_id, 'What do the ''cotton-wool spots'' visible on this patient''s fundus exam represent?', '["Small pockets of fluid under the sensory retina", "Congenital hamartomas of the astrocytes surrounding the optic nerve", "Extracellular deposits of lipid and lipoprotein leaking from damaged capillaries", "Focal microinfarcts of the retinal nerve fiber layer due to axoplasmic flow obstruction in ischemic areas", "Fungal abscesses within the vitreous cavity"]'::jsonb, 3, '**Cotton-wool spots** (formerly called soft exudates) represent **focal microinfarcts of the retinal nerve fiber layer (RNFL)**. Capillary occlusion leads to localized ischemia of the axons. This halts axoplasmic transport, causing axoplasmic debris and organelles to accumulate, presenting clinically as fluffy, white-grey patches with indistinct borders.');

    ---------------------------------------------------------------------------
    -- CASE 12: The Neovascular Proliferation - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Neovascular Proliferation - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Neovascular Proliferation - Clinical Presentation (V2)', 'A 44-year-old male with a history of poorly controlled type 1 diabetes presents with sudden onset of numerous floaters and blurry vision in the right eye. He has not had a dilated eye exam in 3 years. His last HbA1c was 9.3%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 80 bpm | BP: 135/82 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/30
*   **Ocular Examination (OD):** Dilated fundus examination reveals extensive microvascular abnormalities, including multiple looping, fragile new blood vessels growing on the optic disc (NVD) and elsewhere on the retina (NVE). A boat-shaped preretinal hemorrhage is partially obscuring the central macula.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 44-year-old male with a history of poorly controlled type 1 diabetes presents with sudden onset of numerous floaters and blurry vision in the right eye. He has not had a dilated eye exam in 3 years. His last HbA1c was 9.3%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 80 bpm | BP: 135/82 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/30
*   **Ocular Examination (OD):** Dilated fundus examination reveals extensive microvascular abnormalities, including multiple looping, fragile new blood vessels growing on the optic disc (NVD) and elsewhere on the retina (NVE). A boat-shaped preretinal hemorrhage is partially obscuring the central macula.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the first-line therapy?', '["Severe NPDR; initiating oral metformin and tight glycemic control alone", "Proliferative Diabetic Retinopathy (PDR); Panretinal Photocoagulation (PRP) laser or intravitreal anti-VEGF injections", "Central retinal artery occlusion; urgent anterior chamber paracentesis", "Vitreous detachment; reassurance and observation", "Central retinal vein occlusion; systemic anticoagulation"]'::jsonb, 1, 'This is **Proliferative Diabetic Retinopathy (PDR)**, defined by the presence of **neovascularization** (NVD/NVE). The boat-shaped preretinal hemorrhage is a classic complication. First-line treatments are **Panretinal Photocoagulation (PRP)** or **intravitreal anti-VEGF injections** to regress the abnormal vessels and prevent further bleeding/traction.'),
    (v_case_id, 'What molecular mediator is primarily responsible for driving the growth of abnormal new blood vessels in this condition?', '["Basic Fibroblast Growth Factor (bFGF)", "Vascular Endothelial Growth Factor (VEGF)", "Interleukin-6 (IL-6)", "Transforming Growth Factor-beta (TGF-beta)", "Tumor Necrosis Factor-alpha (TNF-alpha)"]'::jsonb, 1, 'Retinal capillary closure causes widespread tissue **hypoxia**, which triggers the upregulation of hypoxia-inducible factor-1 (HIF-1). This drives the massive production and release of **Vascular Endothelial Growth Factor (VEGF)** by retinal astrocytes, Müller cells, and RPE, which stimulates abnormal angiogenesis.'),
    (v_case_id, 'What is the mechanism by which Panretinal Photocoagulation (PRP) prevents visual loss in Proliferative Diabetic Retinopathy?', '["PRP seals the vitreous membrane to the retina, preventing tractional tears", "PRP increases the diameter of ciliary vessels to improve retinal blood flow", "PRP directly coagulates the leaky neovascular vessels on the optic disc", "PRP ablates the hypoxic peripheral retina, reducing overall oxygen demand and decreasing VEGF production, saving the central macula", "PRP stimulates the proliferation of pericytes to stabilize the vessels"]'::jsonb, 3, '**PRP** works by applying thousands of laser burns to the **hypoxic peripheral retina**, converting it into non-functioning scar tissue. This **reduces the overall metabolic demand and oxygen consumption of the retina**, eliminating the drive for **VEGF release**. With lower VEGF levels, the abnormal new vessels on the disc and retina regress, preserving central macular vision.');

    ---------------------------------------------------------------------------
    -- CASE 13: The Central Blur of DME - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Central Blur of DME - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Central Blur of DME - Clinical Presentation (V2)', 'A 73-year-old male with a 10-year history of diabetes presents with slowly progressive, painless blurring of central vision in both eyes, making it very difficult to read or drive. His blood sugar is managed with insulin.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 76 bpm | BP: 140/88 mmHg
*   **Visual Acuity:** Bilateral 20/80 (no improvement with pinhole)
*   **Ocular Examination:** Dilated fundus examination reveals multiple microaneurysms, dot hemorrhages, and a prominent ring of yellowish hard lipid exudates in the central macula. Slit-lamp biomicroscopy shows significant retinal thickening and swelling in the fovea. Optical coherence tomography (OCT) confirms bilateral cystoid macular edema with subretinal fluid.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 73-year-old male with a 10-year history of diabetes presents with slowly progressive, painless blurring of central vision in both eyes, making it very difficult to read or drive. His blood sugar is managed with insulin.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 76 bpm | BP: 140/88 mmHg
*   **Visual Acuity:** Bilateral 20/80 (no improvement with pinhole)
*   **Ocular Examination:** Dilated fundus examination reveals multiple microaneurysms, dot hemorrhages, and a prominent ring of yellowish hard lipid exudates in the central macula. Slit-lamp biomicroscopy shows significant retinal thickening and swelling in the fovea. Optical coherence tomography (OCT) confirms bilateral cystoid macular edema with subretinal fluid.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the gold-standard treatment?', '["Diabetic Macular Edema (DME); intravitreal anti-VEGF injections", "Dry AMD; high-dose AREDS2 vitamins", "Central retinal vein occlusion; systemic heparin", "Tractional retinal detachment; urgent vitrectomy", "Nuclear cataract; surgical lens extraction"]'::jsonb, 0, 'This is **Diabetic Macular Edema (DME)**, the most common cause of vision loss in diabetic patients. The gold-standard first-line treatment is **intravitreal anti-VEGF injections** (e.g., aflibercept, ranibizumab), which are highly effective at reducing macular thickness and improving visual acuity by closing endothelial tight junctions and stopping vessel leakage.'),
    (v_case_id, 'What is the primary pathophysiological mechanism responsible for fluid accumulation in the macula in DME?', '["Breakdown of the blood-retinal barrier due to loss of endothelial tight junctions", "An immune-mediated hypersensitivity reaction to insulin molecules", "Hypersecretion of fluid by the ciliary body epithelium", "Tractional pull of the posterior vitreous face on the fovea", "Mechanical blockage of the ciliary veins at the scleral spur"]'::jsonb, 0, 'DME is caused by the **breakdown of the blood-retinal barrier (BRB)**. Chronic hyperglycemia and vascular endothelial damage lead to the **loss of endothelial tight junctions (zonula occludens)**. This allows fluid, proteins, and lipids to leak from the capillaries into the extracellular space of the retina, particularly the macula.'),
    (v_case_id, 'Which of the following imaging modalities is most essential for the diagnosis, quantification, and monitoring of Diabetic Macular Edema?', '["Visual field testing (perimetry)", "Fluorescein Angiography (FA)", "Optical Coherence Tomography (OCT)", "CT scan of the orbits", "Ocular B-scan Ultrasound"]'::jsonb, 2, '**Optical Coherence Tomography (OCT)** is the most essential, non-invasive imaging modality for DME. It uses light waves to capture high-resolution, cross-sectional images of the retina, allowing for the precise measurement of retinal thickness, quantification of macular edema, and monitoring of the response to anti-VEGF injections.');

    ---------------------------------------------------------------------------
    -- CASE 14: The Copper Wiring and AV Crossing - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Copper Wiring and AV Crossing - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Copper Wiring and AV Crossing - Clinical Presentation (V2)', 'A 60-year-old female presenting for a routine eye exam is found to have a blood pressure of 124/75 mmHg. She has a history of essential hypertension but admits to frequently missing her antihypertensive medications.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 69 bpm | BP: 124/75 mmHg
*   **Visual Acuity:** Bilateral 20/20 (uncorrected)
*   **Ocular Examination:** Dilated fundus examination reveals generalized narrowing and focal constriction of the retinal arterioles. The arteriolar light reflex is widened, giving the vessels a "copper-wire" appearance. There is prominent arteriovenous (AV) nicking, where arterioles cross and compress the underlying retinal veins. No hemorrhages or disc edema are present.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 60-year-old female presenting for a routine eye exam is found to have a blood pressure of 124/75 mmHg. She has a history of essential hypertension but admits to frequently missing her antihypertensive medications.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 69 bpm | BP: 124/75 mmHg
*   **Visual Acuity:** Bilateral 20/20 (uncorrected)
*   **Ocular Examination:** Dilated fundus examination reveals generalized narrowing and focal constriction of the retinal arterioles. The arteriolar light reflex is widened, giving the vessels a "copper-wire" appearance. There is prominent arteriovenous (AV) nicking, where arterioles cross and compress the underlying retinal veins. No hemorrhages or disc edema are present.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary management?', '["Mild Diabetic Retinopathy; oral metformin and glucose monitoring", "Moderate Hypertensive Retinopathy; strict systemic blood pressure control", "Central retinal artery occlusion; immediate ocular massage", "Ocular ischemic syndrome; urgent carotid endarterectomy", "Normal-tension glaucoma; topical prostaglandin drops"]'::jsonb, 1, 'This patient has **Moderate Hypertensive Retinopathy** (Grade II on the Keith-Wagener-Barker classification), characterized by generalized/focal arteriolar narrowing, **copper wiring**, and **AV nicking** without hemorrhages or disc edema. The primary management is **strict systemic blood pressure control** to prevent further microvascular damage and reduce the risk of stroke/MI.'),
    (v_case_id, 'What is the anatomical explanation for the sign known as ''arteriovenous (AV) nicking''?', '["The sclerotic arteriole compresses the underlying vein because they share a common adventitial sheath at crossing points", "The vein is pulled backward by contracting vitreous strands", "The arteriole and vein fuse, forming an abnormal micro-fistula", "A localized thrombus forms in the vein due to turbulent flow under the arteriole", "Inflammatory cells accumulate in the sub-adventitial space, obscuring the vein"]'::jsonb, 0, '**AV nicking** occurs because the **retinal arteriole and vein share a common adventitial sheath** where they cross. As chronic hypertension causes arteriolar wall hypertrophy and sclerosis, the stiffened, thickened arteriole physically compresses the underlying, thin-walled vein, making the vein appear compressed, tapered, or blocked on either side of the crossing.'),
    (v_case_id, 'What represents the funduscopic sign known as ''silver wiring'' in advanced hypertensive retinopathy?', '["A plaque of cholesterol blocking a branch arteriole", "Calcification of the optic disc margin", "White blood cells lining the endothelium of the arterioles", "Severe arteriolar wall sclerosis where the lumen is completely obscured and the vessel appears white and reflective", "Deposition of calcium in the vessel wall"]'::jsonb, 3, '**Silver wiring** is an advanced stage of arteriolar sclerosis (Keith-Wagener Grade III/IV). The arteriolar wall becomes so thick and opaque that the red blood column inside is completely invisible. The vessel reflects light completely, appearing as a **white, reflective, shiny wire**.');

    ---------------------------------------------------------------------------
    -- CASE 15: The Macular Star and Papilledema - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Macular Star and Papilledema - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Macular Star and Papilledema - Clinical Presentation (V2)', 'A 41-year-old female presents to the emergency department with a severe headache, nausea, and sudden blurry vision in both eyes. Her blood pressure is found to be 123/85 mmHg.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 95 bpm | BP: 123/85 mmHg
*   **Visual Acuity:** Bilateral 20/80
*   **Ocular Examination:** Dilated fundus exam reveals multiple flame-shaped hemorrhages, cotton-wool spots, a prominent, radial "macular star" of hard lipid exudates in both maculae, and bilateral marked swelling and blurring of the optic disc margins (Grade IV hypertensive retinopathy).', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 41-year-old female presents to the emergency department with a severe headache, nausea, and sudden blurry vision in both eyes. Her blood pressure is found to be 123/85 mmHg.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 95 bpm | BP: 123/85 mmHg
*   **Visual Acuity:** Bilateral 20/80
*   **Ocular Examination:** Dilated fundus exam reveals multiple flame-shaped hemorrhages, cotton-wool spots, a prominent, radial "macular star" of hard lipid exudates in both maculae, and bilateral marked swelling and blurring of the optic disc margins (Grade IV hypertensive retinopathy).', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most urgent medical intervention for this patient?', '["Immediate bilateral panretinal photocoagulation laser therapy", "High-dose systemic oral corticosteroids to reduce optic nerve swelling", "Controlled reduction of blood pressure using intravenous antihypertensives in an intensive care setting", "Bilateral anterior chamber paracentesis to lower intraocular pressure", "Urgent lumbar puncture to relieve intracranial pressure"]'::jsonb, 2, 'This patient has **Severe/Malignant Hypertensive Retinopathy (Grade IV)**, presenting as a **hypertensive emergency**. The most urgent intervention is admission to an ICU for **controlled reduction of blood pressure** using IV medications (e.g., nitroprusside, labetalol) to prevent life-threatening end-organ damage (stroke, encephalopathy, renal failure). Aggressive, too-rapid BP reduction must be avoided to prevent optic nerve or cerebral ischemia.'),
    (v_case_id, 'What is the composition and anatomical location of the ''macular star'' seen in this patient?', '["Calcium deposits in Bruch''s membrane", "Axoplasmic debris accumulating in the ganglion cell layer", "Pockets of serous fluid under the neurosensory retina", "New blood vessels branching out from the central fovea", "Lipids and lipoproteins deposited in a radial pattern within the Henle''s fiber layer of the macula"]'::jsonb, 4, 'The **macular star** is composed of **lipid and lipoprotein exudates** that leak from damaged, hyperpermeable peripapillary and retinal capillaries. These lipids are deposited in the **outer plexiform layer of the macula (specifically Henle''s fiber layer)**, which has a unique, radially oriented anatomy, forcing the exudates into a star-like or fan-like pattern centered on the fovea.'),
    (v_case_id, 'Which of the following represents the recommended rate of blood pressure reduction in the first hour of managing a hypertensive emergency?', '["Lower the systolic pressure to <90 mmHg to reduce ocular pressure", "Drop the BP immediately to 120/80 mmHg to prevent intracranial hemorrhage", "Reduce the diastolic pressure by exactly 50% within the first 30 minutes", "Maintain the BP at baseline and initiate oral beta-blockers for slow reduction over a week", "Reduce the Mean Arterial Pressure (MAP) by no more than 20% to 25% in the first hour"]'::jsonb, 4, 'In a hypertensive emergency, the **Mean Arterial Pressure (MAP) should be lowered by no more than 20% to 25% in the first hour**, and then to stable levels (e.g., 160/100-110) over the next 2 to 6 hours. Lowering the BP too rapidly or to normal levels too quickly can cause **severe organ hypoperfusion**, resulting in ischemic stroke, myocardial infarction, or anterior ischemic optic neuropathy (AION) due to loss of autoregulation.');

    ---------------------------------------------------------------------------
    -- CASE 16: The Premature Baby's Ridge - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Premature Baby''s Ridge - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Premature Baby''s Ridge - Clinical Presentation (V2)', 'A 2-month-old infant born at 27 weeks gestation with a birth weight of 988 grams, who required high-flow supplemental oxygen therapy in the NICU for 38 days, undergoes a screening dilated eye exam.

**Physical Examination:**
*   **Vitals:** Stable premature infant.
*   **Ocular Examination (OU):** Dilated fundus exam reveals incomplete vascularization of the peripheral retina, with a prominent white demarcation line and an elevated ridge between the vascular and avascular zones, along with extraretinal fibrovascular proliferation extending into the vitreous (Stage 3 ROP). There is dilation and tortuosity of the posterior retinal vessels ("plus disease").', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 2-month-old infant born at 27 weeks gestation with a birth weight of 988 grams, who required high-flow supplemental oxygen therapy in the NICU for 38 days, undergoes a screening dilated eye exam.

**Physical Examination:**
*   **Vitals:** Stable premature infant.
*   **Ocular Examination (OU):** Dilated fundus exam reveals incomplete vascularization of the peripheral retina, with a prominent white demarcation line and an elevated ridge between the vascular and avascular zones, along with extraretinal fibrovascular proliferation extending into the vitreous (Stage 3 ROP). There is dilation and tortuosity of the posterior retinal vessels ("plus disease").', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what are the main risk factors?', '["Persistent Fetal Vasculature (PFV); maternal rubella infection in utero", "Coats'' disease; idiopathic retinal telangiectasia in young males", "Congenital cataracts; autosomal dominant inheritance", "Retinopathy of Prematurity (ROP); premature birth (<30 weeks), low birth weight (<1500g), and supplemental oxygen therapy", "Retinoblastoma; hereditary mutation in the RB1 gene"]'::jsonb, 3, 'This infant has **Retinopathy of Prematurity (ROP)**. The primary risk factors are **extreme prematurity (gestational age <30 weeks)**, **low birth weight (<1500 grams)**, and **supplemental oxygen therapy**. High-flow oxygen in the NICU disrupts normal peripheral retinal vascular development, leading to hypoxia and abnormal neovascularization once returned to room air.'),
    (v_case_id, 'What is the dual-phase pathophysiological mechanism of ROP driven by oxygen levels?', '["Relative hypoxia causes mechanical tearing of the retina due to scleral stretching", "Hyperoxia directly toxic to ciliary nerves, paralyzing pupil; relative hypoxia causes iris necrosis", "Oxygen stimulates the direct migration of corneal stem cells into the vitreous cavity", "Oxygen causes primary thrombi in the central retinal artery, followed by venous bleeding", "Hyperoxia causes downregulation of VEGF, halting vascular growth; subsequent relative hypoxia in room air triggers massive VEGF upregulation and neovascularization"]'::jsonb, 4, 'ROP is a **two-phase disease**: (1) **Hyperoxia Phase**: The high oxygen environment of the incubator downregulates VEGF, causing normal vessel growth to halt. (2) **Hypoxia Phase**: When the infant is removed from supplemental oxygen, the avascular peripheral retina becomes ischemic and highly hypoxic, triggering a **massive upregulation of VEGF**. This drives abnormal, fragile neovascularization at the boundary of the vascularized retina.'),
    (v_case_id, 'What represents the definition and significance of ''plus disease'' in Retinopathy of Prematurity?', '["The development of a tractional retinal detachment in Stage 5", "Severe dilation and tortuosity of the posterior retinal vessels, indicating high disease activity and a need for treatment", "An elevated intraocular pressure >21 mmHg in both eyes", "The presence of bilateral congenital cataracts alongside retinal changes", "The presence of a patent ductus arteriosus in the infant"]'::jsonb, 1, '**''Plus disease''** is defined by **marked dilation and tortuosity of the retinal blood vessels in the posterior pole** (in at least two quadrants). It indicates severe shunting and highly active neovascularization, representing a key threshold sign that warrants **prompt treatment** (laser photocoagulation or anti-VEGF) to prevent progression to retinal detachment.');

    ---------------------------------------------------------------------------
    -- CASE 17: The Sea-Fan Neovascularization - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sea-Fan Neovascularization - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sea-Fan Neovascularization - Clinical Presentation (V2)', 'A 33-year-old African American male with HbSC sickle cell disease presents with sudden onset of multiple floaters and mild visual loss in the left eye. He has had no recent sickle cell crises.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 72 bpm | BP: 118/76 mmHg
*   **Visual Acuity:** OS: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OS):** Dilated fundus examination reveals multiple peripheral retinal arteriolar occlusions, with localized areas of retinal thinning. In the temporal periphery, there are multiple abnormal branching vessels resembling sea-fans ("sea-fan neovascularization") arising from the boundary of the vascularized retina, along with a localized vitreous hemorrhage.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 33-year-old African American male with HbSC sickle cell disease presents with sudden onset of multiple floaters and mild visual loss in the left eye. He has had no recent sickle cell crises.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 72 bpm | BP: 118/76 mmHg
*   **Visual Acuity:** OS: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OS):** Dilated fundus examination reveals multiple peripheral retinal arteriolar occlusions, with localized areas of retinal thinning. In the temporal periphery, there are multiple abnormal branching vessels resembling sea-fans ("sea-fan neovascularization") arising from the boundary of the vascularized retina, along with a localized vitreous hemorrhage.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and which sickle cell genotype is most commonly associated with severe proliferative retinopathy?', '["Proliferative Diabetic Retinopathy; HbSS genotype is highly protective", "Eales'' disease; HbAS (carrier) is the only associated genotype", "Coats'' disease; HbSS genotype is diagnostic", "Sickle Cell Retinopathy; HbSC and HbS-Thal genotypes are more commonly associated with severe proliferative disease than HbSS", "Sickle Cell Retinopathy; HbSS genotype is far more common and severe than HbSC"]'::jsonb, 3, 'This is **Sickle Cell Retinopathy**. Interestingly, proliferative retinopathy is **more common and severe in HbSC and HbS-Beta-Thalassemia genotypes** than in the homozygous HbSS genotype (which has more severe systemic vaso-occlusive crises but fewer ocular vascular occlusions). Classic signs are peripheral arteriolar occlusions and **"sea-fan" neovascularization**.'),
    (v_case_id, 'What represents the classic non-proliferative fundus signs known as ''salmon-patch'' and ''black sunburst'' in sickle cell disease?', '["Salmon-patch: ciliary body cysts; Black sunburst: iris transillumination defects", "Salmon-patch: intraretinal/subretinal hemorrhage that turns yellow-pink; Black sunburst: localized RPE hyperpigmentation from old blood", "Salmon-patch: lipid exudates in Henle''s layer; Black sunburst: cotton-wool spots surrounding the macula", "Salmon-patch: congenital choroidal hemangioma; Black sunburst: optic disc calcification", "Salmon-patch: RPE atrophy; Black sunburst: choroidal neovascular membrane"]'::jsonb, 1, '**Salmon-patch hemorrhages** are dome-shaped intraretinal/subretinal hemorrhages in the mid-periphery that liquefy and turn orange-pink over time. **Black sunbursts** are round, dark, hyperpigmented lesions in the peripheral retina caused by hyperplasia of the RPE in response to localized subretinal hemorrhage, representing old, cleared blood.'),
    (v_case_id, 'Why is the use of carbonic anhydrase inhibitors (particularly systemic acetazolamide) strictly CONTRAINDICATED in patients with sickle cell disease who develop elevated intraocular pressure?', '["Acetazolamide triggers an autoimmune hemolytic anemia", "Acetazolamide induces systemic acidosis and dehydration, which directly promotes sickling of erythrocytes, worsening vascular occlusion", "Acetazolamide causes severe macular edema in sickle cell patients", "Acetazolamide has no efficacy in lowering IOP in these patients", "Acetazolamide reacts with hemoglobin S to cause corneal calcification"]'::jsonb, 1, 'Systemic **acetazolamide** (and other CAIs) is **strictly contraindicated in sickle cell disease**. It causes systemic metabolic acidosis and dehydration, which increases the concentration of sickled cells and **promotes sickling of erythrocytes**. In the eye, sickling of RBCs in the anterior chamber can completely block the trabecular meshwork, causing a rapid, uncontrollable IOP spike. Methazolamide or topical drops (excluding CAIs) are used instead.');

    ---------------------------------------------------------------------------
    -- CASE 18: The Stress-Induced Spot - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Stress-Induced Spot - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Stress-Induced Spot - Clinical Presentation (V2)', 'A 42-year-old male corporate executive presents with a sudden, painless central gray spot (scotoma) and distortion of shapes (metamorphopsia) in her left eye. He reports high stress at work and recently received a corticosteroid injection for shoulder pain.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 76 bpm | BP: 131/82 mmHg
*   **Visual Acuity:** OS: 20/40 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior segment is quiet. Dilated fundus exam reveals a well-demarcated, dome-like elevation of the sensory retina in the central macula. No hemorrhages, drusen, or cotton-wool spots are seen. OCT confirms a localized serous detachment of the neurosensory retina with a normal-thickness choroid.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 42-year-old male corporate executive presents with a sudden, painless central gray spot (scotoma) and distortion of shapes (metamorphopsia) in her left eye. He reports high stress at work and recently received a corticosteroid injection for shoulder pain.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 76 bpm | BP: 131/82 mmHg
*   **Visual Acuity:** OS: 20/40 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior segment is quiet. Dilated fundus exam reveals a well-demarcated, dome-like elevation of the sensory retina in the central macula. No hemorrhages, drusen, or cotton-wool spots are seen. OCT confirms a localized serous detachment of the neurosensory retina with a normal-thickness choroid.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the initial management step?', '["Central Serous Chorioretinopathy (CSCR); discontinue all corticosteroids, reduce stress, and observe", "CMV retinitis; start systemic valganciclovir", "Wet AMD; immediate intravitreal anti-VEGF injection", "Rhegmatogenous retinal detachment; urgent pneumatic retinopexy", "Optic neuritis; initiate high-dose intravenous methylprednisolone"]'::jsonb, 0, 'This is **Central Serous Chorioretinopathy (CSCR)**, typically affecting young/middle-aged males under high stress (type A personality) or using **corticosteroids** (oral, topical, inhaled, or joint injection). The initial step is to **discontinue all corticosteroids**, manage stress, and **observe**, as 80-90% of cases resolve spontaneously within 3 to 4 months without intervention.'),
    (v_case_id, 'What is the primary pathophysiological defect leading to fluid leakage under the macula in CSCR?', '["Tractional pulling of the fovea by a vitreous membrane", "Thrombosis of the vortex veins leading to back-pressure", "Choroidal hyperpermeability combined with focal dysfunction of the retinal pigment epithelium (RPE) barrier", "Autoimmune destruction of the macular photoreceptors", "Hypersecretion of aqueous humor by the ciliary muscle"]'::jsonb, 2, 'The primary defect in CSCR is **choroidal hyperpermeability** (possibly driven by high cortisol/epinephrine levels). The hyper-permeable choroid causes fluid to build up under the RPE, eventually leading to a **focal defect or breakdown in the RPE tight junctions (outer blood-retinal barrier)**, allowing fluid to leak into the subretinal space, separating the retina from the RPE.'),
    (v_case_id, 'Which classic pattern is visible on fluorescein angiography during active fluid leakage in CSCR?', '["Multiple peripheral ''sea-fan'' branching leaks", "A ''cherry-red'' block of dye in the central foveola", "A ''smokestack'' or ''ink-blot'' leak of dye rising through the RPE into the subretinal space", "A ''Swiss-cheese'' pattern of late hyperfluorescence at the optic disc", "A ''blood and thunder'' diffuse blockage of choroidal fluorescence"]'::jsonb, 2, 'On **fluorescein angiography (FA)**, CSCR classically presents as an **''ink-blot'' leak** (a expanding spot of dye) or a **''smokestack'' leak** (where dye rises vertically through the RPE leak and spreads horizontally, resembling a plume of smoke, due to convection currents in the subretinal fluid).');

    ---------------------------------------------------------------------------
    -- CASE 19: The Post-Radiation Blur - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Post-Radiation Blur - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Post-Radiation Blur - Clinical Presentation (V2)', 'A 57-year-old female presents with slowly progressive, painless blurring of central vision in her left eye. She has a history of undergoing radiation therapy for a head and neck squamous cell carcinoma 3 years ago. She is not diabetic.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 130/80 mmHg
*   **Visual Acuity:** OS: 20/100; contralateral eye: 20/20
*   **Ocular Examination (OS):** Dilated fundus examination reveals extensive capillary loss, microaneurysms, flame-shaped and dot hemorrhages, cotton-wool spots, and macular edema, closely mimicking diabetic retinopathy but without a history of diabetes or hyperglycemia.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 57-year-old female presents with slowly progressive, painless blurring of central vision in her left eye. She has a history of undergoing radiation therapy for a head and neck squamous cell carcinoma 3 years ago. She is not diabetic.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 130/80 mmHg
*   **Visual Acuity:** OS: 20/100; contralateral eye: 20/20
*   **Ocular Examination (OS):** Dilated fundus examination reveals extensive capillary loss, microaneurysms, flame-shaped and dot hemorrhages, cotton-wool spots, and macular edema, closely mimicking diabetic retinopathy but without a history of diabetes or hyperglycemia.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Radiation retinopathy", "CMV retinitis", "Diabetic retinopathy", "Ocular ischemic syndrome", "Central retinal vein occlusion"]'::jsonb, 0, 'This is **Radiation Retinopathy**, a delayed complication of ionizing radiation to the eye or surrounding structures (e.g. sinuses, brain, head/neck). It closely mimics diabetic retinopathy due to progressive **damage to vascular endothelial cells**, leading to capillary occlusion, retinal ischemia, exudation, and macular edema.'),
    (v_case_id, 'What is the typical latency period between radiation exposure and the development of Radiation Retinopathy?', '["Exactly 10 to 15 years, representing late genetic transformation", "2 to 7 days, representing acute tissue burn", "Radiation retinopathy occurs immediately during the first fraction of therapy", "1 to 5 years, depending on the radiation dose and volume", "There is no latency; it only occurs during active radiation treatment"]'::jsonb, 3, 'Radiation retinopathy has a **latency period of 1 to 5 years** (typically peak onset at 2 to 3 years) between the completion of radiation therapy and the onset of clinical symptoms. The latency is inversely related to the total radiation dose delivered to the eye (doses >30-35 Gy carry high risk).'),
    (v_case_id, 'What is the first-line treatment for managing vision loss from macular edema in Radiation Retinopathy?', '["Intravitreal anti-VEGF injections or focal/grid laser therapy", "Bilateral panretinal photocoagulation (PRP) immediately", "High-dose systemic oral corticosteroids", "Intravitreal injections of broad-spectrum antibiotics", "Urgent surgical pars plana vitrectomy"]'::jsonb, 0, 'Treatment for radiation retinopathy is directed at complications, primarily macular edema and neovascularization. First-line therapy for macular edema is **intravitreal anti-VEGF injections** (aflibercept, ranibizumab) or **focal/grid laser**, similar to diabetic macular edema. PRP is used if proliferative neovascularization develops.');

    ---------------------------------------------------------------------------
    -- CASE 20: The Post-Traumatic White Patches - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Post-Traumatic White Patches - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Post-Traumatic White Patches - Clinical Presentation (V2)', 'A 21-year-old male is brought to the emergency department after a severe motor vehicle collision with massive chest wall compression and bilateral femur fractures. He complains of sudden, profound loss of vision in both eyes that occurred shortly after the accident.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 110 bpm | BP: 100/60 mmHg
*   **Ocular Examination (OU):** Dilated fundus examination reveals multiple, large, polygonal white patches of retinal whitening ("Purtscher flecken") and multiple cotton-wool spots surrounding the optic nerve head bilaterally, accompanied by scattered flame-shaped hemorrhages. The optic discs are normal.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 21-year-old male is brought to the emergency department after a severe motor vehicle collision with massive chest wall compression and bilateral femur fractures. He complains of sudden, profound loss of vision in both eyes that occurred shortly after the accident.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 110 bpm | BP: 100/60 mmHg
*   **Ocular Examination (OU):** Dilated fundus examination reveals multiple, large, polygonal white patches of retinal whitening ("Purtscher flecken") and multiple cotton-wool spots surrounding the optic nerve head bilaterally, accompanied by scattered flame-shaped hemorrhages. The optic discs are normal.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Terson''s syndrome", "Purtscher''s retinopathy", "Traumatic optic neuropathy", "CMV retinitis", "Malignant hypertensive retinopathy"]'::jsonb, 1, 'This is **Purtscher''s Retinopathy**, a post-traumatic chorioretinopathy associated with severe head or **thoracic compression injury**, long-bone fractures, or acute pancreatitis. Classic fundus findings are **Purtscher flecken** (polygonal areas of inner retinal whitening) and cotton-wool spots located in the peripapillary region, with sudden bilateral visual loss.'),
    (v_case_id, 'What is the primary proposed pathophysiological mechanism driving Purtscher''s Retinopathy?', '["Retrobulbar hemorrhage compressing the optic nerve in the canal", "Autoimmune destruction of the retinal nerve fiber layer by anti-retinal antibodies", "Massive vitreous hemorrhage blocking the visual axis", "Direct mechanical shearing of the central retinal artery during trauma", "Leukoembolization of microvasculature by granulocyte aggregates triggered by complement activation"]'::jsonb, 4, 'The primary mechanism is **leukoembolization**. Severe trauma, complement activation, or fat emboli from long-bone fractures cause the aggregation of white blood cells (granulocytes), platelets, or lipids. These **microemboli clog the precapillary arterioles** of the peripapillary retina, leading to focal microinfarcts (cotton-wool spots) and localized inner retinal ischemia (Purtscher flecken).'),
    (v_case_id, 'What represents the classic funduscopic finding known as ''Purtscher flecken'' that distinguishes this condition?', '["Extracellular yellowish drusen in the central macula", "Splinter hemorrhages at the optic disc margin", "Polygonal areas of inner retinal whitening located between the retinal arterioles and venules, sparing the immediate peripapillary zone", "Demarcation line and ridge in the peripheral retina", "A bright cherry-red spot in the foveola"]'::jsonb, 2, '**Purtscher flecken** are **polygonal areas of inner retinal whitening** located between the retinal arterioles and venules. They characteristically **spare the immediate peripapillary zone** (within 0.5 disc diameters) because of the different vascular supply (cilioretinal) and are highly pathognomonic for this trauma-related or pancreatitis-related micro-embolization.');

    ---------------------------------------------------------------------------
    -- CASE 21: Case Study: The Microvascular Leaks (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Microvascular Leaks (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Microvascular Leaks (V3)', 'A 56-year-old male with a 15-year history of type 2 diabetes presents for an annual dilated eye exam. He has no visual symptoms and thinks his vision is perfect. His last HbA1c was 9.0%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 135/82 mmHg
*   **Visual Acuity:** Bilateral 20/20 (corrected)
*   **Ocular Examination:** Anterior segments are normal. Dilated fundus examination reveals multiple microaneurysms, scattered red dot-and-blot hemorrhages, several fluffy white cotton-wool spots, and yellowish rings of hard lipid exudates in all four quadrants. No neovascularization is seen. Macular thickness is normal.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 56-year-old male with a 15-year history of type 2 diabetes presents for an annual dilated eye exam. He has no visual symptoms and thinks his vision is perfect. His last HbA1c was 9.0%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 135/82 mmHg
*   **Visual Acuity:** Bilateral 20/20 (corrected)
*   **Ocular Examination:** Anterior segments are normal. Dilated fundus examination reveals multiple microaneurysms, scattered red dot-and-blot hemorrhages, several fluffy white cotton-wool spots, and yellowish rings of hard lipid exudates in all four quadrants. No neovascularization is seen. Macular thickness is normal.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what are the screening guidelines for this condition?', '["Moderate NPDR; dilated eye exams every 5 years starting at the time of diagnosis", "Diabetic macular edema; immediate focal laser photocoagulation", "Proliferative Diabetic Retinopathy (PDR); immediate panretinal photocoagulation", "Severe Non-Proliferative Diabetic Retinopathy (NPDR); annual dilated eye exams starting at the time of diagnosis for type 2 diabetes", "Hypertensive retinopathy Grade III; urgent administration of IV nitroprusside"]'::jsonb, 3, 'This patient has **Severe NPDR**, characterized by hemorrhages, microaneurysms, cotton-wool spots, and hard exudates in all 4 quadrants without neovascularization. For **Type 2 DM**, the screening guidelines require a **dilated eye exam at the time of diagnosis**, followed by **annual exams** (or more frequent if retinopathy progresses). For Type 1 DM, screening begins 5 years after diagnosis.'),
    (v_case_id, 'What is the key cellular event in the early pathogenesis of diabetic microvascular damage in the retina?', '["Proliferation of retinal pigment epithelial cells into the stroma", "Loss of intramural pericytes and capillary endothelial cell damage", "Aqueous humor hypersecretion causing mechanical capillary compression", "Autoimmune infiltration of the retinal nerve fiber layer by T-cells", "Deposition of amyloid fibrils in the vascular wall"]'::jsonb, 1, 'The earliest cellular changes in diabetic retinopathy are **loss of retinal capillary pericytes** (which provide structural support to capillaries) and **endothelial cell damage** induced by chronic hyperglycemia. This leads to capillary basement membrane thickening, endothelial cell loss, capillary incompetence/occlusion, and hyperpermeability (leaking).'),
    (v_case_id, 'What do the ''cotton-wool spots'' visible on this patient''s fundus exam represent?', '["Congenital hamartomas of the astrocytes surrounding the optic nerve", "Extracellular deposits of lipid and lipoprotein leaking from damaged capillaries", "Small pockets of fluid under the sensory retina", "Focal microinfarcts of the retinal nerve fiber layer due to axoplasmic flow obstruction in ischemic areas", "Fungal abscesses within the vitreous cavity"]'::jsonb, 3, '**Cotton-wool spots** (formerly called soft exudates) represent **focal microinfarcts of the retinal nerve fiber layer (RNFL)**. Capillary occlusion leads to localized ischemia of the axons. This halts axoplasmic transport, causing axoplasmic debris and organelles to accumulate, presenting clinically as fluffy, white-grey patches with indistinct borders.');

    ---------------------------------------------------------------------------
    -- CASE 22: Case Study: The Neovascular Proliferation (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Neovascular Proliferation (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Neovascular Proliferation (V3)', 'A 62-year-old male with a history of poorly controlled type 1 diabetes presents with sudden onset of numerous floaters and blurry vision in the left eye. He has not had a dilated eye exam in 3 years. His last HbA1c was 11.2%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 80 bpm | BP: 126/82 mmHg
*   **Visual Acuity:** OS: 20/200; contralateral eye: 20/30
*   **Ocular Examination (OS):** Dilated fundus examination reveals extensive microvascular abnormalities, including multiple looping, fragile new blood vessels growing on the optic disc (NVD) and elsewhere on the retina (NVE). A boat-shaped preretinal hemorrhage is partially obscuring the central macula.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 62-year-old male with a history of poorly controlled type 1 diabetes presents with sudden onset of numerous floaters and blurry vision in the left eye. He has not had a dilated eye exam in 3 years. His last HbA1c was 11.2%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 80 bpm | BP: 126/82 mmHg
*   **Visual Acuity:** OS: 20/200; contralateral eye: 20/30
*   **Ocular Examination (OS):** Dilated fundus examination reveals extensive microvascular abnormalities, including multiple looping, fragile new blood vessels growing on the optic disc (NVD) and elsewhere on the retina (NVE). A boat-shaped preretinal hemorrhage is partially obscuring the central macula.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the first-line therapy?', '["Severe NPDR; initiating oral metformin and tight glycemic control alone", "Proliferative Diabetic Retinopathy (PDR); Panretinal Photocoagulation (PRP) laser or intravitreal anti-VEGF injections", "Vitreous detachment; reassurance and observation", "Central retinal vein occlusion; systemic anticoagulation", "Central retinal artery occlusion; urgent anterior chamber paracentesis"]'::jsonb, 1, 'This is **Proliferative Diabetic Retinopathy (PDR)**, defined by the presence of **neovascularization** (NVD/NVE). The boat-shaped preretinal hemorrhage is a classic complication. First-line treatments are **Panretinal Photocoagulation (PRP)** or **intravitreal anti-VEGF injections** to regress the abnormal vessels and prevent further bleeding/traction.'),
    (v_case_id, 'What molecular mediator is primarily responsible for driving the growth of abnormal new blood vessels in this condition?', '["Basic Fibroblast Growth Factor (bFGF)", "Transforming Growth Factor-beta (TGF-beta)", "Tumor Necrosis Factor-alpha (TNF-alpha)", "Vascular Endothelial Growth Factor (VEGF)", "Interleukin-6 (IL-6)"]'::jsonb, 3, 'Retinal capillary closure causes widespread tissue **hypoxia**, which triggers the upregulation of hypoxia-inducible factor-1 (HIF-1). This drives the massive production and release of **Vascular Endothelial Growth Factor (VEGF)** by retinal astrocytes, Müller cells, and RPE, which stimulates abnormal angiogenesis.'),
    (v_case_id, 'What is the mechanism by which Panretinal Photocoagulation (PRP) prevents visual loss in Proliferative Diabetic Retinopathy?', '["PRP ablates the hypoxic peripheral retina, reducing overall oxygen demand and decreasing VEGF production, saving the central macula", "PRP increases the diameter of ciliary vessels to improve retinal blood flow", "PRP directly coagulates the leaky neovascular vessels on the optic disc", "PRP stimulates the proliferation of pericytes to stabilize the vessels", "PRP seals the vitreous membrane to the retina, preventing tractional tears"]'::jsonb, 0, '**PRP** works by applying thousands of laser burns to the **hypoxic peripheral retina**, converting it into non-functioning scar tissue. This **reduces the overall metabolic demand and oxygen consumption of the retina**, eliminating the drive for **VEGF release**. With lower VEGF levels, the abnormal new vessels on the disc and retina regress, preserving central macular vision.');

    ---------------------------------------------------------------------------
    -- CASE 23: Case Study: The Central Blur of DME (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Central Blur of DME (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Central Blur of DME (V3)', 'A 54-year-old female with a 10-year history of diabetes presents with slowly progressive, painless blurring of central vision in both eyes, making it very difficult to read or drive. Her blood sugar is managed with insulin.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 76 bpm | BP: 140/88 mmHg
*   **Visual Acuity:** Bilateral 20/80 (no improvement with pinhole)
*   **Ocular Examination:** Dilated fundus examination reveals multiple microaneurysms, dot hemorrhages, and a prominent ring of yellowish hard lipid exudates in the central macula. Slit-lamp biomicroscopy shows significant retinal thickening and swelling in the fovea. Optical coherence tomography (OCT) confirms bilateral cystoid macular edema with subretinal fluid.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 54-year-old female with a 10-year history of diabetes presents with slowly progressive, painless blurring of central vision in both eyes, making it very difficult to read or drive. Her blood sugar is managed with insulin.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 76 bpm | BP: 140/88 mmHg
*   **Visual Acuity:** Bilateral 20/80 (no improvement with pinhole)
*   **Ocular Examination:** Dilated fundus examination reveals multiple microaneurysms, dot hemorrhages, and a prominent ring of yellowish hard lipid exudates in the central macula. Slit-lamp biomicroscopy shows significant retinal thickening and swelling in the fovea. Optical coherence tomography (OCT) confirms bilateral cystoid macular edema with subretinal fluid.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the gold-standard treatment?', '["Tractional retinal detachment; urgent vitrectomy", "Diabetic Macular Edema (DME); intravitreal anti-VEGF injections", "Nuclear cataract; surgical lens extraction", "Central retinal vein occlusion; systemic heparin", "Dry AMD; high-dose AREDS2 vitamins"]'::jsonb, 1, 'This is **Diabetic Macular Edema (DME)**, the most common cause of vision loss in diabetic patients. The gold-standard first-line treatment is **intravitreal anti-VEGF injections** (e.g., aflibercept, ranibizumab), which are highly effective at reducing macular thickness and improving visual acuity by closing endothelial tight junctions and stopping vessel leakage.'),
    (v_case_id, 'What is the primary pathophysiological mechanism responsible for fluid accumulation in the macula in DME?', '["Breakdown of the blood-retinal barrier due to loss of endothelial tight junctions", "Mechanical blockage of the ciliary veins at the scleral spur", "An immune-mediated hypersensitivity reaction to insulin molecules", "Tractional pull of the posterior vitreous face on the fovea", "Hypersecretion of fluid by the ciliary body epithelium"]'::jsonb, 0, 'DME is caused by the **breakdown of the blood-retinal barrier (BRB)**. Chronic hyperglycemia and vascular endothelial damage lead to the **loss of endothelial tight junctions (zonula occludens)**. This allows fluid, proteins, and lipids to leak from the capillaries into the extracellular space of the retina, particularly the macula.'),
    (v_case_id, 'Which of the following imaging modalities is most essential for the diagnosis, quantification, and monitoring of Diabetic Macular Edema?', '["Fluorescein Angiography (FA)", "CT scan of the orbits", "Optical Coherence Tomography (OCT)", "Ocular B-scan Ultrasound", "Visual field testing (perimetry)"]'::jsonb, 2, '**Optical Coherence Tomography (OCT)** is the most essential, non-invasive imaging modality for DME. It uses light waves to capture high-resolution, cross-sectional images of the retina, allowing for the precise measurement of retinal thickness, quantification of macular edema, and monitoring of the response to anti-VEGF injections.');

    ---------------------------------------------------------------------------
    -- CASE 24: Case Study: The Copper Wiring and AV Crossing (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Copper Wiring and AV Crossing (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Copper Wiring and AV Crossing (V3)', 'A 58-year-old male presenting for a routine eye exam is found to have a blood pressure of 138/87 mmHg. He has a history of essential hypertension but admits to frequently missing his antihypertensive medications.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 76 bpm | BP: 138/87 mmHg
*   **Visual Acuity:** Bilateral 20/20 (uncorrected)
*   **Ocular Examination:** Dilated fundus examination reveals generalized narrowing and focal constriction of the retinal arterioles. The arteriolar light reflex is widened, giving the vessels a "copper-wire" appearance. There is prominent arteriovenous (AV) nicking, where arterioles cross and compress the underlying retinal veins. No hemorrhages or disc edema are present.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 58-year-old male presenting for a routine eye exam is found to have a blood pressure of 138/87 mmHg. He has a history of essential hypertension but admits to frequently missing his antihypertensive medications.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 76 bpm | BP: 138/87 mmHg
*   **Visual Acuity:** Bilateral 20/20 (uncorrected)
*   **Ocular Examination:** Dilated fundus examination reveals generalized narrowing and focal constriction of the retinal arterioles. The arteriolar light reflex is widened, giving the vessels a "copper-wire" appearance. There is prominent arteriovenous (AV) nicking, where arterioles cross and compress the underlying retinal veins. No hemorrhages or disc edema are present.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary management?', '["Moderate Hypertensive Retinopathy; strict systemic blood pressure control", "Mild Diabetic Retinopathy; oral metformin and glucose monitoring", "Ocular ischemic syndrome; urgent carotid endarterectomy", "Normal-tension glaucoma; topical prostaglandin drops", "Central retinal artery occlusion; immediate ocular massage"]'::jsonb, 0, 'This patient has **Moderate Hypertensive Retinopathy** (Grade II on the Keith-Wagener-Barker classification), characterized by generalized/focal arteriolar narrowing, **copper wiring**, and **AV nicking** without hemorrhages or disc edema. The primary management is **strict systemic blood pressure control** to prevent further microvascular damage and reduce the risk of stroke/MI.'),
    (v_case_id, 'What is the anatomical explanation for the sign known as ''arteriovenous (AV) nicking''?', '["The arteriole and vein fuse, forming an abnormal micro-fistula", "The vein is pulled backward by contracting vitreous strands", "A localized thrombus forms in the vein due to turbulent flow under the arteriole", "The sclerotic arteriole compresses the underlying vein because they share a common adventitial sheath at crossing points", "Inflammatory cells accumulate in the sub-adventitial space, obscuring the vein"]'::jsonb, 3, '**AV nicking** occurs because the **retinal arteriole and vein share a common adventitial sheath** where they cross. As chronic hypertension causes arteriolar wall hypertrophy and sclerosis, the stiffened, thickened arteriole physically compresses the underlying, thin-walled vein, making the vein appear compressed, tapered, or blocked on either side of the crossing.'),
    (v_case_id, 'What represents the funduscopic sign known as ''silver wiring'' in advanced hypertensive retinopathy?', '["A plaque of cholesterol blocking a branch arteriole", "White blood cells lining the endothelium of the arterioles", "Deposition of calcium in the vessel wall", "Severe arteriolar wall sclerosis where the lumen is completely obscured and the vessel appears white and reflective", "Calcification of the optic disc margin"]'::jsonb, 3, '**Silver wiring** is an advanced stage of arteriolar sclerosis (Keith-Wagener Grade III/IV). The arteriolar wall becomes so thick and opaque that the red blood column inside is completely invisible. The vessel reflects light completely, appearing as a **white, reflective, shiny wire**.');

    ---------------------------------------------------------------------------
    -- CASE 25: Case Study: The Macular Star and Papilledema (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Macular Star and Papilledema (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Macular Star and Papilledema (V3)', 'A 47-year-old female presents to the emergency department with a severe headache, nausea, and sudden blurry vision in both eyes. Her blood pressure is found to be 119/78 mmHg.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 95 bpm | BP: 119/78 mmHg
*   **Visual Acuity:** Bilateral 20/80
*   **Ocular Examination:** Dilated fundus exam reveals multiple flame-shaped hemorrhages, cotton-wool spots, a prominent, radial "macular star" of hard lipid exudates in both maculae, and bilateral marked swelling and blurring of the optic disc margins (Grade IV hypertensive retinopathy).', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 47-year-old female presents to the emergency department with a severe headache, nausea, and sudden blurry vision in both eyes. Her blood pressure is found to be 119/78 mmHg.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 95 bpm | BP: 119/78 mmHg
*   **Visual Acuity:** Bilateral 20/80
*   **Ocular Examination:** Dilated fundus exam reveals multiple flame-shaped hemorrhages, cotton-wool spots, a prominent, radial "macular star" of hard lipid exudates in both maculae, and bilateral marked swelling and blurring of the optic disc margins (Grade IV hypertensive retinopathy).', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most urgent medical intervention for this patient?', '["Urgent lumbar puncture to relieve intracranial pressure", "Controlled reduction of blood pressure using intravenous antihypertensives in an intensive care setting", "Bilateral anterior chamber paracentesis to lower intraocular pressure", "High-dose systemic oral corticosteroids to reduce optic nerve swelling", "Immediate bilateral panretinal photocoagulation laser therapy"]'::jsonb, 1, 'This patient has **Severe/Malignant Hypertensive Retinopathy (Grade IV)**, presenting as a **hypertensive emergency**. The most urgent intervention is admission to an ICU for **controlled reduction of blood pressure** using IV medications (e.g., nitroprusside, labetalol) to prevent life-threatening end-organ damage (stroke, encephalopathy, renal failure). Aggressive, too-rapid BP reduction must be avoided to prevent optic nerve or cerebral ischemia.'),
    (v_case_id, 'What is the composition and anatomical location of the ''macular star'' seen in this patient?', '["Calcium deposits in Bruch''s membrane", "Pockets of serous fluid under the neurosensory retina", "New blood vessels branching out from the central fovea", "Axoplasmic debris accumulating in the ganglion cell layer", "Lipids and lipoproteins deposited in a radial pattern within the Henle''s fiber layer of the macula"]'::jsonb, 4, 'The **macular star** is composed of **lipid and lipoprotein exudates** that leak from damaged, hyperpermeable peripapillary and retinal capillaries. These lipids are deposited in the **outer plexiform layer of the macula (specifically Henle''s fiber layer)**, which has a unique, radially oriented anatomy, forcing the exudates into a star-like or fan-like pattern centered on the fovea.'),
    (v_case_id, 'Which of the following represents the recommended rate of blood pressure reduction in the first hour of managing a hypertensive emergency?', '["Lower the systolic pressure to <90 mmHg to reduce ocular pressure", "Reduce the Mean Arterial Pressure (MAP) by no more than 20% to 25% in the first hour", "Maintain the BP at baseline and initiate oral beta-blockers for slow reduction over a week", "Reduce the diastolic pressure by exactly 50% within the first 30 minutes", "Drop the BP immediately to 120/80 mmHg to prevent intracranial hemorrhage"]'::jsonb, 1, 'In a hypertensive emergency, the **Mean Arterial Pressure (MAP) should be lowered by no more than 20% to 25% in the first hour**, and then to stable levels (e.g., 160/100-110) over the next 2 to 6 hours. Lowering the BP too rapidly or to normal levels too quickly can cause **severe organ hypoperfusion**, resulting in ischemic stroke, myocardial infarction, or anterior ischemic optic neuropathy (AION) due to loss of autoregulation.');

    ---------------------------------------------------------------------------
    -- CASE 26: Case Study: The Premature Baby's Ridge (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Premature Baby''s Ridge (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Premature Baby''s Ridge (V3)', 'A 2-month-old infant born at 25 weeks gestation with a birth weight of 865 grams, who required high-flow supplemental oxygen therapy in the NICU for 52 days, undergoes a screening dilated eye exam.

**Physical Examination:**
*   **Vitals:** Stable premature infant.
*   **Ocular Examination (OU):** Dilated fundus exam reveals incomplete vascularization of the peripheral retina, with a prominent white demarcation line and an elevated ridge between the vascular and avascular zones, along with extraretinal fibrovascular proliferation extending into the vitreous (Stage 3 ROP). There is dilation and tortuosity of the posterior retinal vessels ("plus disease").', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 2-month-old infant born at 25 weeks gestation with a birth weight of 865 grams, who required high-flow supplemental oxygen therapy in the NICU for 52 days, undergoes a screening dilated eye exam.

**Physical Examination:**
*   **Vitals:** Stable premature infant.
*   **Ocular Examination (OU):** Dilated fundus exam reveals incomplete vascularization of the peripheral retina, with a prominent white demarcation line and an elevated ridge between the vascular and avascular zones, along with extraretinal fibrovascular proliferation extending into the vitreous (Stage 3 ROP). There is dilation and tortuosity of the posterior retinal vessels ("plus disease").', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what are the main risk factors?', '["Coats'' disease; idiopathic retinal telangiectasia in young males", "Congenital cataracts; autosomal dominant inheritance", "Retinopathy of Prematurity (ROP); premature birth (<30 weeks), low birth weight (<1500g), and supplemental oxygen therapy", "Persistent Fetal Vasculature (PFV); maternal rubella infection in utero", "Retinoblastoma; hereditary mutation in the RB1 gene"]'::jsonb, 2, 'This infant has **Retinopathy of Prematurity (ROP)**. The primary risk factors are **extreme prematurity (gestational age <30 weeks)**, **low birth weight (<1500 grams)**, and **supplemental oxygen therapy**. High-flow oxygen in the NICU disrupts normal peripheral retinal vascular development, leading to hypoxia and abnormal neovascularization once returned to room air.'),
    (v_case_id, 'What is the dual-phase pathophysiological mechanism of ROP driven by oxygen levels?', '["Hyperoxia directly toxic to ciliary nerves, paralyzing pupil; relative hypoxia causes iris necrosis", "Oxygen stimulates the direct migration of corneal stem cells into the vitreous cavity", "Hyperoxia causes downregulation of VEGF, halting vascular growth; subsequent relative hypoxia in room air triggers massive VEGF upregulation and neovascularization", "Oxygen causes primary thrombi in the central retinal artery, followed by venous bleeding", "Relative hypoxia causes mechanical tearing of the retina due to scleral stretching"]'::jsonb, 2, 'ROP is a **two-phase disease**: (1) **Hyperoxia Phase**: The high oxygen environment of the incubator downregulates VEGF, causing normal vessel growth to halt. (2) **Hypoxia Phase**: When the infant is removed from supplemental oxygen, the avascular peripheral retina becomes ischemic and highly hypoxic, triggering a **massive upregulation of VEGF**. This drives abnormal, fragile neovascularization at the boundary of the vascularized retina.'),
    (v_case_id, 'What represents the definition and significance of ''plus disease'' in Retinopathy of Prematurity?', '["The presence of a patent ductus arteriosus in the infant", "The development of a tractional retinal detachment in Stage 5", "The presence of bilateral congenital cataracts alongside retinal changes", "An elevated intraocular pressure >21 mmHg in both eyes", "Severe dilation and tortuosity of the posterior retinal vessels, indicating high disease activity and a need for treatment"]'::jsonb, 4, '**''Plus disease''** is defined by **marked dilation and tortuosity of the retinal blood vessels in the posterior pole** (in at least two quadrants). It indicates severe shunting and highly active neovascularization, representing a key threshold sign that warrants **prompt treatment** (laser photocoagulation or anti-VEGF) to prevent progression to retinal detachment.');

    ---------------------------------------------------------------------------
    -- CASE 27: Case Study: The Sea-Fan Neovascularization (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Sea-Fan Neovascularization (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Sea-Fan Neovascularization (V3)', 'A 33-year-old African American male with HbSC sickle cell disease presents with sudden onset of multiple floaters and mild visual loss in the right eye. He has had no recent sickle cell crises.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 72 bpm | BP: 118/76 mmHg
*   **Visual Acuity:** OD: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OD):** Dilated fundus examination reveals multiple peripheral retinal arteriolar occlusions, with localized areas of retinal thinning. In the temporal periphery, there are multiple abnormal branching vessels resembling sea-fans ("sea-fan neovascularization") arising from the boundary of the vascularized retina, along with a localized vitreous hemorrhage.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 33-year-old African American male with HbSC sickle cell disease presents with sudden onset of multiple floaters and mild visual loss in the right eye. He has had no recent sickle cell crises.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 72 bpm | BP: 118/76 mmHg
*   **Visual Acuity:** OD: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OD):** Dilated fundus examination reveals multiple peripheral retinal arteriolar occlusions, with localized areas of retinal thinning. In the temporal periphery, there are multiple abnormal branching vessels resembling sea-fans ("sea-fan neovascularization") arising from the boundary of the vascularized retina, along with a localized vitreous hemorrhage.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and which sickle cell genotype is most commonly associated with severe proliferative retinopathy?', '["Proliferative Diabetic Retinopathy; HbSS genotype is highly protective", "Eales'' disease; HbAS (carrier) is the only associated genotype", "Sickle Cell Retinopathy; HbSC and HbS-Thal genotypes are more commonly associated with severe proliferative disease than HbSS", "Sickle Cell Retinopathy; HbSS genotype is far more common and severe than HbSC", "Coats'' disease; HbSS genotype is diagnostic"]'::jsonb, 2, 'This is **Sickle Cell Retinopathy**. Interestingly, proliferative retinopathy is **more common and severe in HbSC and HbS-Beta-Thalassemia genotypes** than in the homozygous HbSS genotype (which has more severe systemic vaso-occlusive crises but fewer ocular vascular occlusions). Classic signs are peripheral arteriolar occlusions and **"sea-fan" neovascularization**.'),
    (v_case_id, 'What represents the classic non-proliferative fundus signs known as ''salmon-patch'' and ''black sunburst'' in sickle cell disease?', '["Salmon-patch: ciliary body cysts; Black sunburst: iris transillumination defects", "Salmon-patch: congenital choroidal hemangioma; Black sunburst: optic disc calcification", "Salmon-patch: lipid exudates in Henle''s layer; Black sunburst: cotton-wool spots surrounding the macula", "Salmon-patch: RPE atrophy; Black sunburst: choroidal neovascular membrane", "Salmon-patch: intraretinal/subretinal hemorrhage that turns yellow-pink; Black sunburst: localized RPE hyperpigmentation from old blood"]'::jsonb, 4, '**Salmon-patch hemorrhages** are dome-shaped intraretinal/subretinal hemorrhages in the mid-periphery that liquefy and turn orange-pink over time. **Black sunbursts** are round, dark, hyperpigmented lesions in the peripheral retina caused by hyperplasia of the RPE in response to localized subretinal hemorrhage, representing old, cleared blood.'),
    (v_case_id, 'Why is the use of carbonic anhydrase inhibitors (particularly systemic acetazolamide) strictly CONTRAINDICATED in patients with sickle cell disease who develop elevated intraocular pressure?', '["Acetazolamide causes severe macular edema in sickle cell patients", "Acetazolamide triggers an autoimmune hemolytic anemia", "Acetazolamide has no efficacy in lowering IOP in these patients", "Acetazolamide induces systemic acidosis and dehydration, which directly promotes sickling of erythrocytes, worsening vascular occlusion", "Acetazolamide reacts with hemoglobin S to cause corneal calcification"]'::jsonb, 3, 'Systemic **acetazolamide** (and other CAIs) is **strictly contraindicated in sickle cell disease**. It causes systemic metabolic acidosis and dehydration, which increases the concentration of sickled cells and **promotes sickling of erythrocytes**. In the eye, sickling of RBCs in the anterior chamber can completely block the trabecular meshwork, causing a rapid, uncontrollable IOP spike. Methazolamide or topical drops (excluding CAIs) are used instead.');

    ---------------------------------------------------------------------------
    -- CASE 28: Case Study: The Stress-Induced Spot (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Stress-Induced Spot (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Stress-Induced Spot (V3)', 'A 30-year-old male corporate executive presents with a sudden, painless central gray spot (scotoma) and distortion of shapes (metamorphopsia) in her right eye. He reports high stress at work and recently received a corticosteroid injection for shoulder pain.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 81 bpm | BP: 129/81 mmHg
*   **Visual Acuity:** OD: 20/40 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior segment is quiet. Dilated fundus exam reveals a well-demarcated, dome-like elevation of the sensory retina in the central macula. No hemorrhages, drusen, or cotton-wool spots are seen. OCT confirms a localized serous detachment of the neurosensory retina with a normal-thickness choroid.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old male corporate executive presents with a sudden, painless central gray spot (scotoma) and distortion of shapes (metamorphopsia) in her right eye. He reports high stress at work and recently received a corticosteroid injection for shoulder pain.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 81 bpm | BP: 129/81 mmHg
*   **Visual Acuity:** OD: 20/40 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior segment is quiet. Dilated fundus exam reveals a well-demarcated, dome-like elevation of the sensory retina in the central macula. No hemorrhages, drusen, or cotton-wool spots are seen. OCT confirms a localized serous detachment of the neurosensory retina with a normal-thickness choroid.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the initial management step?', '["Rhegmatogenous retinal detachment; urgent pneumatic retinopexy", "Central Serous Chorioretinopathy (CSCR); discontinue all corticosteroids, reduce stress, and observe", "Optic neuritis; initiate high-dose intravenous methylprednisolone", "Wet AMD; immediate intravitreal anti-VEGF injection", "CMV retinitis; start systemic valganciclovir"]'::jsonb, 1, 'This is **Central Serous Chorioretinopathy (CSCR)**, typically affecting young/middle-aged males under high stress (type A personality) or using **corticosteroids** (oral, topical, inhaled, or joint injection). The initial step is to **discontinue all corticosteroids**, manage stress, and **observe**, as 80-90% of cases resolve spontaneously within 3 to 4 months without intervention.'),
    (v_case_id, 'What is the primary pathophysiological defect leading to fluid leakage under the macula in CSCR?', '["Thrombosis of the vortex veins leading to back-pressure", "Autoimmune destruction of the macular photoreceptors", "Tractional pulling of the fovea by a vitreous membrane", "Choroidal hyperpermeability combined with focal dysfunction of the retinal pigment epithelium (RPE) barrier", "Hypersecretion of aqueous humor by the ciliary muscle"]'::jsonb, 3, 'The primary defect in CSCR is **choroidal hyperpermeability** (possibly driven by high cortisol/epinephrine levels). The hyper-permeable choroid causes fluid to build up under the RPE, eventually leading to a **focal defect or breakdown in the RPE tight junctions (outer blood-retinal barrier)**, allowing fluid to leak into the subretinal space, separating the retina from the RPE.'),
    (v_case_id, 'Which classic pattern is visible on fluorescein angiography during active fluid leakage in CSCR?', '["A ''cherry-red'' block of dye in the central foveola", "A ''blood and thunder'' diffuse blockage of choroidal fluorescence", "Multiple peripheral ''sea-fan'' branching leaks", "A ''Swiss-cheese'' pattern of late hyperfluorescence at the optic disc", "A ''smokestack'' or ''ink-blot'' leak of dye rising through the RPE into the subretinal space"]'::jsonb, 4, 'On **fluorescein angiography (FA)**, CSCR classically presents as an **''ink-blot'' leak** (a expanding spot of dye) or a **''smokestack'' leak** (where dye rises vertically through the RPE leak and spreads horizontally, resembling a plume of smoke, due to convection currents in the subretinal fluid).');

    ---------------------------------------------------------------------------
    -- CASE 29: Case Study: The Post-Radiation Blur (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Post-Radiation Blur (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Post-Radiation Blur (V3)', 'A 71-year-old male presents with slowly progressive, painless blurring of central vision in his right eye. He has a history of undergoing radiation therapy for a head and neck squamous cell carcinoma 3 years ago. He is not diabetic.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 130/80 mmHg
*   **Visual Acuity:** OD: 20/100; contralateral eye: 20/20
*   **Ocular Examination (OD):** Dilated fundus examination reveals extensive capillary loss, microaneurysms, flame-shaped and dot hemorrhages, cotton-wool spots, and macular edema, closely mimicking diabetic retinopathy but without a history of diabetes or hyperglycemia.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 71-year-old male presents with slowly progressive, painless blurring of central vision in his right eye. He has a history of undergoing radiation therapy for a head and neck squamous cell carcinoma 3 years ago. He is not diabetic.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 130/80 mmHg
*   **Visual Acuity:** OD: 20/100; contralateral eye: 20/20
*   **Ocular Examination (OD):** Dilated fundus examination reveals extensive capillary loss, microaneurysms, flame-shaped and dot hemorrhages, cotton-wool spots, and macular edema, closely mimicking diabetic retinopathy but without a history of diabetes or hyperglycemia.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["CMV retinitis", "Central retinal vein occlusion", "Ocular ischemic syndrome", "Radiation retinopathy", "Diabetic retinopathy"]'::jsonb, 3, 'This is **Radiation Retinopathy**, a delayed complication of ionizing radiation to the eye or surrounding structures (e.g. sinuses, brain, head/neck). It closely mimics diabetic retinopathy due to progressive **damage to vascular endothelial cells**, leading to capillary occlusion, retinal ischemia, exudation, and macular edema.'),
    (v_case_id, 'What is the typical latency period between radiation exposure and the development of Radiation Retinopathy?', '["2 to 7 days, representing acute tissue burn", "There is no latency; it only occurs during active radiation treatment", "Radiation retinopathy occurs immediately during the first fraction of therapy", "Exactly 10 to 15 years, representing late genetic transformation", "1 to 5 years, depending on the radiation dose and volume"]'::jsonb, 4, 'Radiation retinopathy has a **latency period of 1 to 5 years** (typically peak onset at 2 to 3 years) between the completion of radiation therapy and the onset of clinical symptoms. The latency is inversely related to the total radiation dose delivered to the eye (doses >30-35 Gy carry high risk).'),
    (v_case_id, 'What is the first-line treatment for managing vision loss from macular edema in Radiation Retinopathy?', '["Intravitreal anti-VEGF injections or focal/grid laser therapy", "Bilateral panretinal photocoagulation (PRP) immediately", "Urgent surgical pars plana vitrectomy", "High-dose systemic oral corticosteroids", "Intravitreal injections of broad-spectrum antibiotics"]'::jsonb, 0, 'Treatment for radiation retinopathy is directed at complications, primarily macular edema and neovascularization. First-line therapy for macular edema is **intravitreal anti-VEGF injections** (aflibercept, ranibizumab) or **focal/grid laser**, similar to diabetic macular edema. PRP is used if proliferative neovascularization develops.');

    ---------------------------------------------------------------------------
    -- CASE 30: Case Study: The Post-Traumatic White Patches (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Post-Traumatic White Patches (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Post-Traumatic White Patches (V3)', 'A 23-year-old female is brought to the emergency department after a severe motor vehicle collision with massive chest wall compression and bilateral femur fractures. She complains of sudden, profound loss of vision in both eyes that occurred shortly after the accident.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 110 bpm | BP: 100/60 mmHg
*   **Ocular Examination (OU):** Dilated fundus examination reveals multiple, large, polygonal white patches of retinal whitening ("Purtscher flecken") and multiple cotton-wool spots surrounding the optic nerve head bilaterally, accompanied by scattered flame-shaped hemorrhages. The optic discs are normal.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 23-year-old female is brought to the emergency department after a severe motor vehicle collision with massive chest wall compression and bilateral femur fractures. She complains of sudden, profound loss of vision in both eyes that occurred shortly after the accident.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 110 bpm | BP: 100/60 mmHg
*   **Ocular Examination (OU):** Dilated fundus examination reveals multiple, large, polygonal white patches of retinal whitening ("Purtscher flecken") and multiple cotton-wool spots surrounding the optic nerve head bilaterally, accompanied by scattered flame-shaped hemorrhages. The optic discs are normal.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Terson''s syndrome", "Purtscher''s retinopathy", "Malignant hypertensive retinopathy", "Traumatic optic neuropathy", "CMV retinitis"]'::jsonb, 1, 'This is **Purtscher''s Retinopathy**, a post-traumatic chorioretinopathy associated with severe head or **thoracic compression injury**, long-bone fractures, or acute pancreatitis. Classic fundus findings are **Purtscher flecken** (polygonal areas of inner retinal whitening) and cotton-wool spots located in the peripapillary region, with sudden bilateral visual loss.'),
    (v_case_id, 'What is the primary proposed pathophysiological mechanism driving Purtscher''s Retinopathy?', '["Direct mechanical shearing of the central retinal artery during trauma", "Massive vitreous hemorrhage blocking the visual axis", "Leukoembolization of microvasculature by granulocyte aggregates triggered by complement activation", "Retrobulbar hemorrhage compressing the optic nerve in the canal", "Autoimmune destruction of the retinal nerve fiber layer by anti-retinal antibodies"]'::jsonb, 2, 'The primary mechanism is **leukoembolization**. Severe trauma, complement activation, or fat emboli from long-bone fractures cause the aggregation of white blood cells (granulocytes), platelets, or lipids. These **microemboli clog the precapillary arterioles** of the peripapillary retina, leading to focal microinfarcts (cotton-wool spots) and localized inner retinal ischemia (Purtscher flecken).'),
    (v_case_id, 'What represents the classic funduscopic finding known as ''Purtscher flecken'' that distinguishes this condition?', '["Polygonal areas of inner retinal whitening located between the retinal arterioles and venules, sparing the immediate peripapillary zone", "Extracellular yellowish drusen in the central macula", "Splinter hemorrhages at the optic disc margin", "A bright cherry-red spot in the foveola", "Demarcation line and ridge in the peripheral retina"]'::jsonb, 0, '**Purtscher flecken** are **polygonal areas of inner retinal whitening** located between the retinal arterioles and venules. They characteristically **spare the immediate peripapillary zone** (within 0.5 disc diameters) because of the different vascular supply (cilioretinal) and are highly pathognomonic for this trauma-related or pancreatitis-related micro-embolization.');

    ---------------------------------------------------------------------------
    -- CASE 31: The Microvascular Leaks - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Microvascular Leaks - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Microvascular Leaks - Case Analysis (V4)', 'A 67-year-old male with a 15-year history of type 2 diabetes presents for an annual dilated eye exam. He has no visual symptoms and thinks his vision is perfect. His last HbA1c was 9.5%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 135/82 mmHg
*   **Visual Acuity:** Bilateral 20/20 (corrected)
*   **Ocular Examination:** Anterior segments are normal. Dilated fundus examination reveals multiple microaneurysms, scattered red dot-and-blot hemorrhages, several fluffy white cotton-wool spots, and yellowish rings of hard lipid exudates in all four quadrants. No neovascularization is seen. Macular thickness is normal.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 67-year-old male with a 15-year history of type 2 diabetes presents for an annual dilated eye exam. He has no visual symptoms and thinks his vision is perfect. His last HbA1c was 9.5%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 135/82 mmHg
*   **Visual Acuity:** Bilateral 20/20 (corrected)
*   **Ocular Examination:** Anterior segments are normal. Dilated fundus examination reveals multiple microaneurysms, scattered red dot-and-blot hemorrhages, several fluffy white cotton-wool spots, and yellowish rings of hard lipid exudates in all four quadrants. No neovascularization is seen. Macular thickness is normal.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what are the screening guidelines for this condition?', '["Proliferative Diabetic Retinopathy (PDR); immediate panretinal photocoagulation", "Severe Non-Proliferative Diabetic Retinopathy (NPDR); annual dilated eye exams starting at the time of diagnosis for type 2 diabetes", "Diabetic macular edema; immediate focal laser photocoagulation", "Hypertensive retinopathy Grade III; urgent administration of IV nitroprusside", "Moderate NPDR; dilated eye exams every 5 years starting at the time of diagnosis"]'::jsonb, 1, 'This patient has **Severe NPDR**, characterized by hemorrhages, microaneurysms, cotton-wool spots, and hard exudates in all 4 quadrants without neovascularization. For **Type 2 DM**, the screening guidelines require a **dilated eye exam at the time of diagnosis**, followed by **annual exams** (or more frequent if retinopathy progresses). For Type 1 DM, screening begins 5 years after diagnosis.'),
    (v_case_id, 'What is the key cellular event in the early pathogenesis of diabetic microvascular damage in the retina?', '["Autoimmune infiltration of the retinal nerve fiber layer by T-cells", "Aqueous humor hypersecretion causing mechanical capillary compression", "Loss of intramural pericytes and capillary endothelial cell damage", "Proliferation of retinal pigment epithelial cells into the stroma", "Deposition of amyloid fibrils in the vascular wall"]'::jsonb, 2, 'The earliest cellular changes in diabetic retinopathy are **loss of retinal capillary pericytes** (which provide structural support to capillaries) and **endothelial cell damage** induced by chronic hyperglycemia. This leads to capillary basement membrane thickening, endothelial cell loss, capillary incompetence/occlusion, and hyperpermeability (leaking).'),
    (v_case_id, 'What do the ''cotton-wool spots'' visible on this patient''s fundus exam represent?', '["Extracellular deposits of lipid and lipoprotein leaking from damaged capillaries", "Small pockets of fluid under the sensory retina", "Focal microinfarcts of the retinal nerve fiber layer due to axoplasmic flow obstruction in ischemic areas", "Fungal abscesses within the vitreous cavity", "Congenital hamartomas of the astrocytes surrounding the optic nerve"]'::jsonb, 2, '**Cotton-wool spots** (formerly called soft exudates) represent **focal microinfarcts of the retinal nerve fiber layer (RNFL)**. Capillary occlusion leads to localized ischemia of the axons. This halts axoplasmic transport, causing axoplasmic debris and organelles to accumulate, presenting clinically as fluffy, white-grey patches with indistinct borders.');

    ---------------------------------------------------------------------------
    -- CASE 32: The Neovascular Proliferation - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Neovascular Proliferation - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Neovascular Proliferation - Case Analysis (V4)', 'A 56-year-old male with a history of poorly controlled type 1 diabetes presents with sudden onset of numerous floaters and blurry vision in the right eye. He has not had a dilated eye exam in 3 years. His last HbA1c was 10.8%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 80 bpm | BP: 130/80 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/30
*   **Ocular Examination (OD):** Dilated fundus examination reveals extensive microvascular abnormalities, including multiple looping, fragile new blood vessels growing on the optic disc (NVD) and elsewhere on the retina (NVE). A boat-shaped preretinal hemorrhage is partially obscuring the central macula.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 56-year-old male with a history of poorly controlled type 1 diabetes presents with sudden onset of numerous floaters and blurry vision in the right eye. He has not had a dilated eye exam in 3 years. His last HbA1c was 10.8%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 80 bpm | BP: 130/80 mmHg
*   **Visual Acuity:** OD: 20/200; contralateral eye: 20/30
*   **Ocular Examination (OD):** Dilated fundus examination reveals extensive microvascular abnormalities, including multiple looping, fragile new blood vessels growing on the optic disc (NVD) and elsewhere on the retina (NVE). A boat-shaped preretinal hemorrhage is partially obscuring the central macula.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the first-line therapy?', '["Proliferative Diabetic Retinopathy (PDR); Panretinal Photocoagulation (PRP) laser or intravitreal anti-VEGF injections", "Central retinal vein occlusion; systemic anticoagulation", "Vitreous detachment; reassurance and observation", "Severe NPDR; initiating oral metformin and tight glycemic control alone", "Central retinal artery occlusion; urgent anterior chamber paracentesis"]'::jsonb, 0, 'This is **Proliferative Diabetic Retinopathy (PDR)**, defined by the presence of **neovascularization** (NVD/NVE). The boat-shaped preretinal hemorrhage is a classic complication. First-line treatments are **Panretinal Photocoagulation (PRP)** or **intravitreal anti-VEGF injections** to regress the abnormal vessels and prevent further bleeding/traction.'),
    (v_case_id, 'What molecular mediator is primarily responsible for driving the growth of abnormal new blood vessels in this condition?', '["Basic Fibroblast Growth Factor (bFGF)", "Interleukin-6 (IL-6)", "Transforming Growth Factor-beta (TGF-beta)", "Tumor Necrosis Factor-alpha (TNF-alpha)", "Vascular Endothelial Growth Factor (VEGF)"]'::jsonb, 4, 'Retinal capillary closure causes widespread tissue **hypoxia**, which triggers the upregulation of hypoxia-inducible factor-1 (HIF-1). This drives the massive production and release of **Vascular Endothelial Growth Factor (VEGF)** by retinal astrocytes, Müller cells, and RPE, which stimulates abnormal angiogenesis.'),
    (v_case_id, 'What is the mechanism by which Panretinal Photocoagulation (PRP) prevents visual loss in Proliferative Diabetic Retinopathy?', '["PRP seals the vitreous membrane to the retina, preventing tractional tears", "PRP stimulates the proliferation of pericytes to stabilize the vessels", "PRP ablates the hypoxic peripheral retina, reducing overall oxygen demand and decreasing VEGF production, saving the central macula", "PRP directly coagulates the leaky neovascular vessels on the optic disc", "PRP increases the diameter of ciliary vessels to improve retinal blood flow"]'::jsonb, 2, '**PRP** works by applying thousands of laser burns to the **hypoxic peripheral retina**, converting it into non-functioning scar tissue. This **reduces the overall metabolic demand and oxygen consumption of the retina**, eliminating the drive for **VEGF release**. With lower VEGF levels, the abnormal new vessels on the disc and retina regress, preserving central macular vision.');

    ---------------------------------------------------------------------------
    -- CASE 33: The Central Blur of DME - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Central Blur of DME - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Central Blur of DME - Case Analysis (V4)', 'A 75-year-old male with a 10-year history of diabetes presents with slowly progressive, painless blurring of central vision in both eyes, making it very difficult to read or drive. His blood sugar is managed with insulin.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 76 bpm | BP: 140/88 mmHg
*   **Visual Acuity:** Bilateral 20/80 (no improvement with pinhole)
*   **Ocular Examination:** Dilated fundus examination reveals multiple microaneurysms, dot hemorrhages, and a prominent ring of yellowish hard lipid exudates in the central macula. Slit-lamp biomicroscopy shows significant retinal thickening and swelling in the fovea. Optical coherence tomography (OCT) confirms bilateral cystoid macular edema with subretinal fluid.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 75-year-old male with a 10-year history of diabetes presents with slowly progressive, painless blurring of central vision in both eyes, making it very difficult to read or drive. His blood sugar is managed with insulin.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 76 bpm | BP: 140/88 mmHg
*   **Visual Acuity:** Bilateral 20/80 (no improvement with pinhole)
*   **Ocular Examination:** Dilated fundus examination reveals multiple microaneurysms, dot hemorrhages, and a prominent ring of yellowish hard lipid exudates in the central macula. Slit-lamp biomicroscopy shows significant retinal thickening and swelling in the fovea. Optical coherence tomography (OCT) confirms bilateral cystoid macular edema with subretinal fluid.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the gold-standard treatment?', '["Dry AMD; high-dose AREDS2 vitamins", "Diabetic Macular Edema (DME); intravitreal anti-VEGF injections", "Nuclear cataract; surgical lens extraction", "Central retinal vein occlusion; systemic heparin", "Tractional retinal detachment; urgent vitrectomy"]'::jsonb, 1, 'This is **Diabetic Macular Edema (DME)**, the most common cause of vision loss in diabetic patients. The gold-standard first-line treatment is **intravitreal anti-VEGF injections** (e.g., aflibercept, ranibizumab), which are highly effective at reducing macular thickness and improving visual acuity by closing endothelial tight junctions and stopping vessel leakage.'),
    (v_case_id, 'What is the primary pathophysiological mechanism responsible for fluid accumulation in the macula in DME?', '["Hypersecretion of fluid by the ciliary body epithelium", "Breakdown of the blood-retinal barrier due to loss of endothelial tight junctions", "Mechanical blockage of the ciliary veins at the scleral spur", "An immune-mediated hypersensitivity reaction to insulin molecules", "Tractional pull of the posterior vitreous face on the fovea"]'::jsonb, 1, 'DME is caused by the **breakdown of the blood-retinal barrier (BRB)**. Chronic hyperglycemia and vascular endothelial damage lead to the **loss of endothelial tight junctions (zonula occludens)**. This allows fluid, proteins, and lipids to leak from the capillaries into the extracellular space of the retina, particularly the macula.'),
    (v_case_id, 'Which of the following imaging modalities is most essential for the diagnosis, quantification, and monitoring of Diabetic Macular Edema?', '["Optical Coherence Tomography (OCT)", "Ocular B-scan Ultrasound", "Visual field testing (perimetry)", "CT scan of the orbits", "Fluorescein Angiography (FA)"]'::jsonb, 0, '**Optical Coherence Tomography (OCT)** is the most essential, non-invasive imaging modality for DME. It uses light waves to capture high-resolution, cross-sectional images of the retina, allowing for the precise measurement of retinal thickness, quantification of macular edema, and monitoring of the response to anti-VEGF injections.');

    ---------------------------------------------------------------------------
    -- CASE 34: The Copper Wiring and AV Crossing - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Copper Wiring and AV Crossing - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Copper Wiring and AV Crossing - Case Analysis (V4)', 'A 77-year-old male presenting for a routine eye exam is found to have a blood pressure of 115/80 mmHg. He has a history of essential hypertension but admits to frequently missing his antihypertensive medications.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 75 bpm | BP: 115/80 mmHg
*   **Visual Acuity:** Bilateral 20/20 (uncorrected)
*   **Ocular Examination:** Dilated fundus examination reveals generalized narrowing and focal constriction of the retinal arterioles. The arteriolar light reflex is widened, giving the vessels a "copper-wire" appearance. There is prominent arteriovenous (AV) nicking, where arterioles cross and compress the underlying retinal veins. No hemorrhages or disc edema are present.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 77-year-old male presenting for a routine eye exam is found to have a blood pressure of 115/80 mmHg. He has a history of essential hypertension but admits to frequently missing his antihypertensive medications.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 75 bpm | BP: 115/80 mmHg
*   **Visual Acuity:** Bilateral 20/20 (uncorrected)
*   **Ocular Examination:** Dilated fundus examination reveals generalized narrowing and focal constriction of the retinal arterioles. The arteriolar light reflex is widened, giving the vessels a "copper-wire" appearance. There is prominent arteriovenous (AV) nicking, where arterioles cross and compress the underlying retinal veins. No hemorrhages or disc edema are present.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary management?', '["Mild Diabetic Retinopathy; oral metformin and glucose monitoring", "Normal-tension glaucoma; topical prostaglandin drops", "Ocular ischemic syndrome; urgent carotid endarterectomy", "Central retinal artery occlusion; immediate ocular massage", "Moderate Hypertensive Retinopathy; strict systemic blood pressure control"]'::jsonb, 4, 'This patient has **Moderate Hypertensive Retinopathy** (Grade II on the Keith-Wagener-Barker classification), characterized by generalized/focal arteriolar narrowing, **copper wiring**, and **AV nicking** without hemorrhages or disc edema. The primary management is **strict systemic blood pressure control** to prevent further microvascular damage and reduce the risk of stroke/MI.'),
    (v_case_id, 'What is the anatomical explanation for the sign known as ''arteriovenous (AV) nicking''?', '["The arteriole and vein fuse, forming an abnormal micro-fistula", "Inflammatory cells accumulate in the sub-adventitial space, obscuring the vein", "The vein is pulled backward by contracting vitreous strands", "The sclerotic arteriole compresses the underlying vein because they share a common adventitial sheath at crossing points", "A localized thrombus forms in the vein due to turbulent flow under the arteriole"]'::jsonb, 3, '**AV nicking** occurs because the **retinal arteriole and vein share a common adventitial sheath** where they cross. As chronic hypertension causes arteriolar wall hypertrophy and sclerosis, the stiffened, thickened arteriole physically compresses the underlying, thin-walled vein, making the vein appear compressed, tapered, or blocked on either side of the crossing.'),
    (v_case_id, 'What represents the funduscopic sign known as ''silver wiring'' in advanced hypertensive retinopathy?', '["Severe arteriolar wall sclerosis where the lumen is completely obscured and the vessel appears white and reflective", "Calcification of the optic disc margin", "A plaque of cholesterol blocking a branch arteriole", "Deposition of calcium in the vessel wall", "White blood cells lining the endothelium of the arterioles"]'::jsonb, 0, '**Silver wiring** is an advanced stage of arteriolar sclerosis (Keith-Wagener Grade III/IV). The arteriolar wall becomes so thick and opaque that the red blood column inside is completely invisible. The vessel reflects light completely, appearing as a **white, reflective, shiny wire**.');

    ---------------------------------------------------------------------------
    -- CASE 35: The Macular Star and Papilledema - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Macular Star and Papilledema - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Macular Star and Papilledema - Case Analysis (V4)', 'A 48-year-old female presents to the emergency department with a severe headache, nausea, and sudden blurry vision in both eyes. Her blood pressure is found to be 129/82 mmHg.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 95 bpm | BP: 129/82 mmHg
*   **Visual Acuity:** Bilateral 20/80
*   **Ocular Examination:** Dilated fundus exam reveals multiple flame-shaped hemorrhages, cotton-wool spots, a prominent, radial "macular star" of hard lipid exudates in both maculae, and bilateral marked swelling and blurring of the optic disc margins (Grade IV hypertensive retinopathy).', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 48-year-old female presents to the emergency department with a severe headache, nausea, and sudden blurry vision in both eyes. Her blood pressure is found to be 129/82 mmHg.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 95 bpm | BP: 129/82 mmHg
*   **Visual Acuity:** Bilateral 20/80
*   **Ocular Examination:** Dilated fundus exam reveals multiple flame-shaped hemorrhages, cotton-wool spots, a prominent, radial "macular star" of hard lipid exudates in both maculae, and bilateral marked swelling and blurring of the optic disc margins (Grade IV hypertensive retinopathy).', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most urgent medical intervention for this patient?', '["High-dose systemic oral corticosteroids to reduce optic nerve swelling", "Bilateral anterior chamber paracentesis to lower intraocular pressure", "Controlled reduction of blood pressure using intravenous antihypertensives in an intensive care setting", "Urgent lumbar puncture to relieve intracranial pressure", "Immediate bilateral panretinal photocoagulation laser therapy"]'::jsonb, 2, 'This patient has **Severe/Malignant Hypertensive Retinopathy (Grade IV)**, presenting as a **hypertensive emergency**. The most urgent intervention is admission to an ICU for **controlled reduction of blood pressure** using IV medications (e.g., nitroprusside, labetalol) to prevent life-threatening end-organ damage (stroke, encephalopathy, renal failure). Aggressive, too-rapid BP reduction must be avoided to prevent optic nerve or cerebral ischemia.'),
    (v_case_id, 'What is the composition and anatomical location of the ''macular star'' seen in this patient?', '["Lipids and lipoproteins deposited in a radial pattern within the Henle''s fiber layer of the macula", "New blood vessels branching out from the central fovea", "Axoplasmic debris accumulating in the ganglion cell layer", "Calcium deposits in Bruch''s membrane", "Pockets of serous fluid under the neurosensory retina"]'::jsonb, 0, 'The **macular star** is composed of **lipid and lipoprotein exudates** that leak from damaged, hyperpermeable peripapillary and retinal capillaries. These lipids are deposited in the **outer plexiform layer of the macula (specifically Henle''s fiber layer)**, which has a unique, radially oriented anatomy, forcing the exudates into a star-like or fan-like pattern centered on the fovea.'),
    (v_case_id, 'Which of the following represents the recommended rate of blood pressure reduction in the first hour of managing a hypertensive emergency?', '["Reduce the Mean Arterial Pressure (MAP) by no more than 20% to 25% in the first hour", "Lower the systolic pressure to <90 mmHg to reduce ocular pressure", "Reduce the diastolic pressure by exactly 50% within the first 30 minutes", "Drop the BP immediately to 120/80 mmHg to prevent intracranial hemorrhage", "Maintain the BP at baseline and initiate oral beta-blockers for slow reduction over a week"]'::jsonb, 0, 'In a hypertensive emergency, the **Mean Arterial Pressure (MAP) should be lowered by no more than 20% to 25% in the first hour**, and then to stable levels (e.g., 160/100-110) over the next 2 to 6 hours. Lowering the BP too rapidly or to normal levels too quickly can cause **severe organ hypoperfusion**, resulting in ischemic stroke, myocardial infarction, or anterior ischemic optic neuropathy (AION) due to loss of autoregulation.');

    ---------------------------------------------------------------------------
    -- CASE 36: The Premature Baby's Ridge - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Premature Baby''s Ridge - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Premature Baby''s Ridge - Case Analysis (V4)', 'A 2-month-old infant born at 26 weeks gestation with a birth weight of 1101 grams, who required high-flow supplemental oxygen therapy in the NICU for 41 days, undergoes a screening dilated eye exam.

**Physical Examination:**
*   **Vitals:** Stable premature infant.
*   **Ocular Examination (OU):** Dilated fundus exam reveals incomplete vascularization of the peripheral retina, with a prominent white demarcation line and an elevated ridge between the vascular and avascular zones, along with extraretinal fibrovascular proliferation extending into the vitreous (Stage 3 ROP). There is dilation and tortuosity of the posterior retinal vessels ("plus disease").', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 2-month-old infant born at 26 weeks gestation with a birth weight of 1101 grams, who required high-flow supplemental oxygen therapy in the NICU for 41 days, undergoes a screening dilated eye exam.

**Physical Examination:**
*   **Vitals:** Stable premature infant.
*   **Ocular Examination (OU):** Dilated fundus exam reveals incomplete vascularization of the peripheral retina, with a prominent white demarcation line and an elevated ridge between the vascular and avascular zones, along with extraretinal fibrovascular proliferation extending into the vitreous (Stage 3 ROP). There is dilation and tortuosity of the posterior retinal vessels ("plus disease").', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what are the main risk factors?', '["Retinopathy of Prematurity (ROP); premature birth (<30 weeks), low birth weight (<1500g), and supplemental oxygen therapy", "Congenital cataracts; autosomal dominant inheritance", "Retinoblastoma; hereditary mutation in the RB1 gene", "Coats'' disease; idiopathic retinal telangiectasia in young males", "Persistent Fetal Vasculature (PFV); maternal rubella infection in utero"]'::jsonb, 0, 'This infant has **Retinopathy of Prematurity (ROP)**. The primary risk factors are **extreme prematurity (gestational age <30 weeks)**, **low birth weight (<1500 grams)**, and **supplemental oxygen therapy**. High-flow oxygen in the NICU disrupts normal peripheral retinal vascular development, leading to hypoxia and abnormal neovascularization once returned to room air.'),
    (v_case_id, 'What is the dual-phase pathophysiological mechanism of ROP driven by oxygen levels?', '["Relative hypoxia causes mechanical tearing of the retina due to scleral stretching", "Hyperoxia directly toxic to ciliary nerves, paralyzing pupil; relative hypoxia causes iris necrosis", "Oxygen stimulates the direct migration of corneal stem cells into the vitreous cavity", "Oxygen causes primary thrombi in the central retinal artery, followed by venous bleeding", "Hyperoxia causes downregulation of VEGF, halting vascular growth; subsequent relative hypoxia in room air triggers massive VEGF upregulation and neovascularization"]'::jsonb, 4, 'ROP is a **two-phase disease**: (1) **Hyperoxia Phase**: The high oxygen environment of the incubator downregulates VEGF, causing normal vessel growth to halt. (2) **Hypoxia Phase**: When the infant is removed from supplemental oxygen, the avascular peripheral retina becomes ischemic and highly hypoxic, triggering a **massive upregulation of VEGF**. This drives abnormal, fragile neovascularization at the boundary of the vascularized retina.'),
    (v_case_id, 'What represents the definition and significance of ''plus disease'' in Retinopathy of Prematurity?', '["Severe dilation and tortuosity of the posterior retinal vessels, indicating high disease activity and a need for treatment", "The presence of bilateral congenital cataracts alongside retinal changes", "An elevated intraocular pressure >21 mmHg in both eyes", "The development of a tractional retinal detachment in Stage 5", "The presence of a patent ductus arteriosus in the infant"]'::jsonb, 0, '**''Plus disease''** is defined by **marked dilation and tortuosity of the retinal blood vessels in the posterior pole** (in at least two quadrants). It indicates severe shunting and highly active neovascularization, representing a key threshold sign that warrants **prompt treatment** (laser photocoagulation or anti-VEGF) to prevent progression to retinal detachment.');

    ---------------------------------------------------------------------------
    -- CASE 37: The Sea-Fan Neovascularization - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sea-Fan Neovascularization - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sea-Fan Neovascularization - Case Analysis (V4)', 'A 20-year-old African American male with HbSC sickle cell disease presents with sudden onset of multiple floaters and mild visual loss in the right eye. He has had no recent sickle cell crises.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 72 bpm | BP: 118/76 mmHg
*   **Visual Acuity:** OD: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OD):** Dilated fundus examination reveals multiple peripheral retinal arteriolar occlusions, with localized areas of retinal thinning. In the temporal periphery, there are multiple abnormal branching vessels resembling sea-fans ("sea-fan neovascularization") arising from the boundary of the vascularized retina, along with a localized vitreous hemorrhage.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 20-year-old African American male with HbSC sickle cell disease presents with sudden onset of multiple floaters and mild visual loss in the right eye. He has had no recent sickle cell crises.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 72 bpm | BP: 118/76 mmHg
*   **Visual Acuity:** OD: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OD):** Dilated fundus examination reveals multiple peripheral retinal arteriolar occlusions, with localized areas of retinal thinning. In the temporal periphery, there are multiple abnormal branching vessels resembling sea-fans ("sea-fan neovascularization") arising from the boundary of the vascularized retina, along with a localized vitreous hemorrhage.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and which sickle cell genotype is most commonly associated with severe proliferative retinopathy?', '["Sickle Cell Retinopathy; HbSS genotype is far more common and severe than HbSC", "Coats'' disease; HbSS genotype is diagnostic", "Sickle Cell Retinopathy; HbSC and HbS-Thal genotypes are more commonly associated with severe proliferative disease than HbSS", "Eales'' disease; HbAS (carrier) is the only associated genotype", "Proliferative Diabetic Retinopathy; HbSS genotype is highly protective"]'::jsonb, 2, 'This is **Sickle Cell Retinopathy**. Interestingly, proliferative retinopathy is **more common and severe in HbSC and HbS-Beta-Thalassemia genotypes** than in the homozygous HbSS genotype (which has more severe systemic vaso-occlusive crises but fewer ocular vascular occlusions). Classic signs are peripheral arteriolar occlusions and **"sea-fan" neovascularization**.'),
    (v_case_id, 'What represents the classic non-proliferative fundus signs known as ''salmon-patch'' and ''black sunburst'' in sickle cell disease?', '["Salmon-patch: lipid exudates in Henle''s layer; Black sunburst: cotton-wool spots surrounding the macula", "Salmon-patch: congenital choroidal hemangioma; Black sunburst: optic disc calcification", "Salmon-patch: intraretinal/subretinal hemorrhage that turns yellow-pink; Black sunburst: localized RPE hyperpigmentation from old blood", "Salmon-patch: RPE atrophy; Black sunburst: choroidal neovascular membrane", "Salmon-patch: ciliary body cysts; Black sunburst: iris transillumination defects"]'::jsonb, 2, '**Salmon-patch hemorrhages** are dome-shaped intraretinal/subretinal hemorrhages in the mid-periphery that liquefy and turn orange-pink over time. **Black sunbursts** are round, dark, hyperpigmented lesions in the peripheral retina caused by hyperplasia of the RPE in response to localized subretinal hemorrhage, representing old, cleared blood.'),
    (v_case_id, 'Why is the use of carbonic anhydrase inhibitors (particularly systemic acetazolamide) strictly CONTRAINDICATED in patients with sickle cell disease who develop elevated intraocular pressure?', '["Acetazolamide reacts with hemoglobin S to cause corneal calcification", "Acetazolamide has no efficacy in lowering IOP in these patients", "Acetazolamide causes severe macular edema in sickle cell patients", "Acetazolamide triggers an autoimmune hemolytic anemia", "Acetazolamide induces systemic acidosis and dehydration, which directly promotes sickling of erythrocytes, worsening vascular occlusion"]'::jsonb, 4, 'Systemic **acetazolamide** (and other CAIs) is **strictly contraindicated in sickle cell disease**. It causes systemic metabolic acidosis and dehydration, which increases the concentration of sickled cells and **promotes sickling of erythrocytes**. In the eye, sickling of RBCs in the anterior chamber can completely block the trabecular meshwork, causing a rapid, uncontrollable IOP spike. Methazolamide or topical drops (excluding CAIs) are used instead.');

    ---------------------------------------------------------------------------
    -- CASE 38: The Stress-Induced Spot - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Stress-Induced Spot - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Stress-Induced Spot - Case Analysis (V4)', 'A 47-year-old male corporate executive presents with a sudden, painless central gray spot (scotoma) and distortion of shapes (metamorphopsia) in his right eye. He reports high stress at work and recently received a corticosteroid injection for shoulder pain.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 76 bpm | BP: 121/84 mmHg
*   **Visual Acuity:** OD: 20/40 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior segment is quiet. Dilated fundus exam reveals a well-demarcated, dome-like elevation of the sensory retina in the central macula. No hemorrhages, drusen, or cotton-wool spots are seen. OCT confirms a localized serous detachment of the neurosensory retina with a normal-thickness choroid.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 47-year-old male corporate executive presents with a sudden, painless central gray spot (scotoma) and distortion of shapes (metamorphopsia) in his right eye. He reports high stress at work and recently received a corticosteroid injection for shoulder pain.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 76 bpm | BP: 121/84 mmHg
*   **Visual Acuity:** OD: 20/40 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior segment is quiet. Dilated fundus exam reveals a well-demarcated, dome-like elevation of the sensory retina in the central macula. No hemorrhages, drusen, or cotton-wool spots are seen. OCT confirms a localized serous detachment of the neurosensory retina with a normal-thickness choroid.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the initial management step?', '["Rhegmatogenous retinal detachment; urgent pneumatic retinopexy", "Wet AMD; immediate intravitreal anti-VEGF injection", "CMV retinitis; start systemic valganciclovir", "Optic neuritis; initiate high-dose intravenous methylprednisolone", "Central Serous Chorioretinopathy (CSCR); discontinue all corticosteroids, reduce stress, and observe"]'::jsonb, 4, 'This is **Central Serous Chorioretinopathy (CSCR)**, typically affecting young/middle-aged males under high stress (type A personality) or using **corticosteroids** (oral, topical, inhaled, or joint injection). The initial step is to **discontinue all corticosteroids**, manage stress, and **observe**, as 80-90% of cases resolve spontaneously within 3 to 4 months without intervention.'),
    (v_case_id, 'What is the primary pathophysiological defect leading to fluid leakage under the macula in CSCR?', '["Tractional pulling of the fovea by a vitreous membrane", "Autoimmune destruction of the macular photoreceptors", "Choroidal hyperpermeability combined with focal dysfunction of the retinal pigment epithelium (RPE) barrier", "Hypersecretion of aqueous humor by the ciliary muscle", "Thrombosis of the vortex veins leading to back-pressure"]'::jsonb, 2, 'The primary defect in CSCR is **choroidal hyperpermeability** (possibly driven by high cortisol/epinephrine levels). The hyper-permeable choroid causes fluid to build up under the RPE, eventually leading to a **focal defect or breakdown in the RPE tight junctions (outer blood-retinal barrier)**, allowing fluid to leak into the subretinal space, separating the retina from the RPE.'),
    (v_case_id, 'Which classic pattern is visible on fluorescein angiography during active fluid leakage in CSCR?', '["A ''Swiss-cheese'' pattern of late hyperfluorescence at the optic disc", "A ''cherry-red'' block of dye in the central foveola", "A ''smokestack'' or ''ink-blot'' leak of dye rising through the RPE into the subretinal space", "A ''blood and thunder'' diffuse blockage of choroidal fluorescence", "Multiple peripheral ''sea-fan'' branching leaks"]'::jsonb, 2, 'On **fluorescein angiography (FA)**, CSCR classically presents as an **''ink-blot'' leak** (a expanding spot of dye) or a **''smokestack'' leak** (where dye rises vertically through the RPE leak and spreads horizontally, resembling a plume of smoke, due to convection currents in the subretinal fluid).');

    ---------------------------------------------------------------------------
    -- CASE 39: The Post-Radiation Blur - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Post-Radiation Blur - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Post-Radiation Blur - Case Analysis (V4)', 'A 67-year-old male presents with slowly progressive, painless blurring of central vision in his right eye. He has a history of undergoing radiation therapy for a head and neck squamous cell carcinoma 3 years ago. He is not diabetic.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 130/80 mmHg
*   **Visual Acuity:** OD: 20/100; contralateral eye: 20/20
*   **Ocular Examination (OD):** Dilated fundus examination reveals extensive capillary loss, microaneurysms, flame-shaped and dot hemorrhages, cotton-wool spots, and macular edema, closely mimicking diabetic retinopathy but without a history of diabetes or hyperglycemia.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 67-year-old male presents with slowly progressive, painless blurring of central vision in his right eye. He has a history of undergoing radiation therapy for a head and neck squamous cell carcinoma 3 years ago. He is not diabetic.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 130/80 mmHg
*   **Visual Acuity:** OD: 20/100; contralateral eye: 20/20
*   **Ocular Examination (OD):** Dilated fundus examination reveals extensive capillary loss, microaneurysms, flame-shaped and dot hemorrhages, cotton-wool spots, and macular edema, closely mimicking diabetic retinopathy but without a history of diabetes or hyperglycemia.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Radiation retinopathy", "CMV retinitis", "Ocular ischemic syndrome", "Central retinal vein occlusion", "Diabetic retinopathy"]'::jsonb, 0, 'This is **Radiation Retinopathy**, a delayed complication of ionizing radiation to the eye or surrounding structures (e.g. sinuses, brain, head/neck). It closely mimics diabetic retinopathy due to progressive **damage to vascular endothelial cells**, leading to capillary occlusion, retinal ischemia, exudation, and macular edema.'),
    (v_case_id, 'What is the typical latency period between radiation exposure and the development of Radiation Retinopathy?', '["2 to 7 days, representing acute tissue burn", "Radiation retinopathy occurs immediately during the first fraction of therapy", "There is no latency; it only occurs during active radiation treatment", "Exactly 10 to 15 years, representing late genetic transformation", "1 to 5 years, depending on the radiation dose and volume"]'::jsonb, 4, 'Radiation retinopathy has a **latency period of 1 to 5 years** (typically peak onset at 2 to 3 years) between the completion of radiation therapy and the onset of clinical symptoms. The latency is inversely related to the total radiation dose delivered to the eye (doses >30-35 Gy carry high risk).'),
    (v_case_id, 'What is the first-line treatment for managing vision loss from macular edema in Radiation Retinopathy?', '["Intravitreal anti-VEGF injections or focal/grid laser therapy", "Intravitreal injections of broad-spectrum antibiotics", "Urgent surgical pars plana vitrectomy", "Bilateral panretinal photocoagulation (PRP) immediately", "High-dose systemic oral corticosteroids"]'::jsonb, 0, 'Treatment for radiation retinopathy is directed at complications, primarily macular edema and neovascularization. First-line therapy for macular edema is **intravitreal anti-VEGF injections** (aflibercept, ranibizumab) or **focal/grid laser**, similar to diabetic macular edema. PRP is used if proliferative neovascularization develops.');

    ---------------------------------------------------------------------------
    -- CASE 40: The Post-Traumatic White Patches - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Post-Traumatic White Patches - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Post-Traumatic White Patches - Case Analysis (V4)', 'A 44-year-old female is brought to the emergency department after a severe motor vehicle collision with massive chest wall compression and bilateral femur fractures. She complains of sudden, profound loss of vision in both eyes that occurred shortly after the accident.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 110 bpm | BP: 100/60 mmHg
*   **Ocular Examination (OU):** Dilated fundus examination reveals multiple, large, polygonal white patches of retinal whitening ("Purtscher flecken") and multiple cotton-wool spots surrounding the optic nerve head bilaterally, accompanied by scattered flame-shaped hemorrhages. The optic discs are normal.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 44-year-old female is brought to the emergency department after a severe motor vehicle collision with massive chest wall compression and bilateral femur fractures. She complains of sudden, profound loss of vision in both eyes that occurred shortly after the accident.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 110 bpm | BP: 100/60 mmHg
*   **Ocular Examination (OU):** Dilated fundus examination reveals multiple, large, polygonal white patches of retinal whitening ("Purtscher flecken") and multiple cotton-wool spots surrounding the optic nerve head bilaterally, accompanied by scattered flame-shaped hemorrhages. The optic discs are normal.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Malignant hypertensive retinopathy", "Terson''s syndrome", "CMV retinitis", "Purtscher''s retinopathy", "Traumatic optic neuropathy"]'::jsonb, 3, 'This is **Purtscher''s Retinopathy**, a post-traumatic chorioretinopathy associated with severe head or **thoracic compression injury**, long-bone fractures, or acute pancreatitis. Classic fundus findings are **Purtscher flecken** (polygonal areas of inner retinal whitening) and cotton-wool spots located in the peripapillary region, with sudden bilateral visual loss.'),
    (v_case_id, 'What is the primary proposed pathophysiological mechanism driving Purtscher''s Retinopathy?', '["Autoimmune destruction of the retinal nerve fiber layer by anti-retinal antibodies", "Leukoembolization of microvasculature by granulocyte aggregates triggered by complement activation", "Direct mechanical shearing of the central retinal artery during trauma", "Massive vitreous hemorrhage blocking the visual axis", "Retrobulbar hemorrhage compressing the optic nerve in the canal"]'::jsonb, 1, 'The primary mechanism is **leukoembolization**. Severe trauma, complement activation, or fat emboli from long-bone fractures cause the aggregation of white blood cells (granulocytes), platelets, or lipids. These **microemboli clog the precapillary arterioles** of the peripapillary retina, leading to focal microinfarcts (cotton-wool spots) and localized inner retinal ischemia (Purtscher flecken).'),
    (v_case_id, 'What represents the classic funduscopic finding known as ''Purtscher flecken'' that distinguishes this condition?', '["A bright cherry-red spot in the foveola", "Polygonal areas of inner retinal whitening located between the retinal arterioles and venules, sparing the immediate peripapillary zone", "Demarcation line and ridge in the peripheral retina", "Splinter hemorrhages at the optic disc margin", "Extracellular yellowish drusen in the central macula"]'::jsonb, 1, '**Purtscher flecken** are **polygonal areas of inner retinal whitening** located between the retinal arterioles and venules. They characteristically **spare the immediate peripapillary zone** (within 0.5 disc diameters) because of the different vascular supply (cilioretinal) and are highly pathognomonic for this trauma-related or pancreatitis-related micro-embolization.');

    ---------------------------------------------------------------------------
    -- CASE 41: Vignette: The Microvascular Leaks (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Microvascular Leaks (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Microvascular Leaks (V5)', 'A 50-year-old female with a 15-year history of type 2 diabetes presents for an annual dilated eye exam. She has no visual symptoms and thinks her vision is perfect. Her last HbA1c was 10.3%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 135/82 mmHg
*   **Visual Acuity:** Bilateral 20/20 (corrected)
*   **Ocular Examination:** Anterior segments are normal. Dilated fundus examination reveals multiple microaneurysms, scattered red dot-and-blot hemorrhages, several fluffy white cotton-wool spots, and yellowish rings of hard lipid exudates in all four quadrants. No neovascularization is seen. Macular thickness is normal.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 50-year-old female with a 15-year history of type 2 diabetes presents for an annual dilated eye exam. She has no visual symptoms and thinks her vision is perfect. Her last HbA1c was 10.3%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 135/82 mmHg
*   **Visual Acuity:** Bilateral 20/20 (corrected)
*   **Ocular Examination:** Anterior segments are normal. Dilated fundus examination reveals multiple microaneurysms, scattered red dot-and-blot hemorrhages, several fluffy white cotton-wool spots, and yellowish rings of hard lipid exudates in all four quadrants. No neovascularization is seen. Macular thickness is normal.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what are the screening guidelines for this condition?', '["Moderate NPDR; dilated eye exams every 5 years starting at the time of diagnosis", "Proliferative Diabetic Retinopathy (PDR); immediate panretinal photocoagulation", "Hypertensive retinopathy Grade III; urgent administration of IV nitroprusside", "Diabetic macular edema; immediate focal laser photocoagulation", "Severe Non-Proliferative Diabetic Retinopathy (NPDR); annual dilated eye exams starting at the time of diagnosis for type 2 diabetes"]'::jsonb, 4, 'This patient has **Severe NPDR**, characterized by hemorrhages, microaneurysms, cotton-wool spots, and hard exudates in all 4 quadrants without neovascularization. For **Type 2 DM**, the screening guidelines require a **dilated eye exam at the time of diagnosis**, followed by **annual exams** (or more frequent if retinopathy progresses). For Type 1 DM, screening begins 5 years after diagnosis.'),
    (v_case_id, 'What is the key cellular event in the early pathogenesis of diabetic microvascular damage in the retina?', '["Autoimmune infiltration of the retinal nerve fiber layer by T-cells", "Deposition of amyloid fibrils in the vascular wall", "Proliferation of retinal pigment epithelial cells into the stroma", "Loss of intramural pericytes and capillary endothelial cell damage", "Aqueous humor hypersecretion causing mechanical capillary compression"]'::jsonb, 3, 'The earliest cellular changes in diabetic retinopathy are **loss of retinal capillary pericytes** (which provide structural support to capillaries) and **endothelial cell damage** induced by chronic hyperglycemia. This leads to capillary basement membrane thickening, endothelial cell loss, capillary incompetence/occlusion, and hyperpermeability (leaking).'),
    (v_case_id, 'What do the ''cotton-wool spots'' visible on this patient''s fundus exam represent?', '["Focal microinfarcts of the retinal nerve fiber layer due to axoplasmic flow obstruction in ischemic areas", "Fungal abscesses within the vitreous cavity", "Extracellular deposits of lipid and lipoprotein leaking from damaged capillaries", "Small pockets of fluid under the sensory retina", "Congenital hamartomas of the astrocytes surrounding the optic nerve"]'::jsonb, 0, '**Cotton-wool spots** (formerly called soft exudates) represent **focal microinfarcts of the retinal nerve fiber layer (RNFL)**. Capillary occlusion leads to localized ischemia of the axons. This halts axoplasmic transport, causing axoplasmic debris and organelles to accumulate, presenting clinically as fluffy, white-grey patches with indistinct borders.');

    ---------------------------------------------------------------------------
    -- CASE 42: Vignette: The Neovascular Proliferation (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Neovascular Proliferation (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Neovascular Proliferation (V5)', 'A 53-year-old male with a history of poorly controlled type 1 diabetes presents with sudden onset of numerous floaters and blurry vision in the left eye. He has not had a dilated eye exam in 3 years. His last HbA1c was 9.8%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 80 bpm | BP: 132/75 mmHg
*   **Visual Acuity:** OS: 20/200; contralateral eye: 20/30
*   **Ocular Examination (OS):** Dilated fundus examination reveals extensive microvascular abnormalities, including multiple looping, fragile new blood vessels growing on the optic disc (NVD) and elsewhere on the retina (NVE). A boat-shaped preretinal hemorrhage is partially obscuring the central macula.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 53-year-old male with a history of poorly controlled type 1 diabetes presents with sudden onset of numerous floaters and blurry vision in the left eye. He has not had a dilated eye exam in 3 years. His last HbA1c was 9.8%.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 80 bpm | BP: 132/75 mmHg
*   **Visual Acuity:** OS: 20/200; contralateral eye: 20/30
*   **Ocular Examination (OS):** Dilated fundus examination reveals extensive microvascular abnormalities, including multiple looping, fragile new blood vessels growing on the optic disc (NVD) and elsewhere on the retina (NVE). A boat-shaped preretinal hemorrhage is partially obscuring the central macula.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the first-line therapy?', '["Proliferative Diabetic Retinopathy (PDR); Panretinal Photocoagulation (PRP) laser or intravitreal anti-VEGF injections", "Central retinal vein occlusion; systemic anticoagulation", "Severe NPDR; initiating oral metformin and tight glycemic control alone", "Vitreous detachment; reassurance and observation", "Central retinal artery occlusion; urgent anterior chamber paracentesis"]'::jsonb, 0, 'This is **Proliferative Diabetic Retinopathy (PDR)**, defined by the presence of **neovascularization** (NVD/NVE). The boat-shaped preretinal hemorrhage is a classic complication. First-line treatments are **Panretinal Photocoagulation (PRP)** or **intravitreal anti-VEGF injections** to regress the abnormal vessels and prevent further bleeding/traction.'),
    (v_case_id, 'What molecular mediator is primarily responsible for driving the growth of abnormal new blood vessels in this condition?', '["Tumor Necrosis Factor-alpha (TNF-alpha)", "Transforming Growth Factor-beta (TGF-beta)", "Basic Fibroblast Growth Factor (bFGF)", "Interleukin-6 (IL-6)", "Vascular Endothelial Growth Factor (VEGF)"]'::jsonb, 4, 'Retinal capillary closure causes widespread tissue **hypoxia**, which triggers the upregulation of hypoxia-inducible factor-1 (HIF-1). This drives the massive production and release of **Vascular Endothelial Growth Factor (VEGF)** by retinal astrocytes, Müller cells, and RPE, which stimulates abnormal angiogenesis.'),
    (v_case_id, 'What is the mechanism by which Panretinal Photocoagulation (PRP) prevents visual loss in Proliferative Diabetic Retinopathy?', '["PRP ablates the hypoxic peripheral retina, reducing overall oxygen demand and decreasing VEGF production, saving the central macula", "PRP stimulates the proliferation of pericytes to stabilize the vessels", "PRP seals the vitreous membrane to the retina, preventing tractional tears", "PRP increases the diameter of ciliary vessels to improve retinal blood flow", "PRP directly coagulates the leaky neovascular vessels on the optic disc"]'::jsonb, 0, '**PRP** works by applying thousands of laser burns to the **hypoxic peripheral retina**, converting it into non-functioning scar tissue. This **reduces the overall metabolic demand and oxygen consumption of the retina**, eliminating the drive for **VEGF release**. With lower VEGF levels, the abnormal new vessels on the disc and retina regress, preserving central macular vision.');

    ---------------------------------------------------------------------------
    -- CASE 43: Vignette: The Central Blur of DME (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Central Blur of DME (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Central Blur of DME (V5)', 'A 59-year-old female with a 10-year history of diabetes presents with slowly progressive, painless blurring of central vision in both eyes, making it very difficult to read or drive. Her blood sugar is managed with insulin.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 76 bpm | BP: 140/88 mmHg
*   **Visual Acuity:** Bilateral 20/80 (no improvement with pinhole)
*   **Ocular Examination:** Dilated fundus examination reveals multiple microaneurysms, dot hemorrhages, and a prominent ring of yellowish hard lipid exudates in the central macula. Slit-lamp biomicroscopy shows significant retinal thickening and swelling in the fovea. Optical coherence tomography (OCT) confirms bilateral cystoid macular edema with subretinal fluid.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 59-year-old female with a 10-year history of diabetes presents with slowly progressive, painless blurring of central vision in both eyes, making it very difficult to read or drive. Her blood sugar is managed with insulin.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 76 bpm | BP: 140/88 mmHg
*   **Visual Acuity:** Bilateral 20/80 (no improvement with pinhole)
*   **Ocular Examination:** Dilated fundus examination reveals multiple microaneurysms, dot hemorrhages, and a prominent ring of yellowish hard lipid exudates in the central macula. Slit-lamp biomicroscopy shows significant retinal thickening and swelling in the fovea. Optical coherence tomography (OCT) confirms bilateral cystoid macular edema with subretinal fluid.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the gold-standard treatment?', '["Nuclear cataract; surgical lens extraction", "Central retinal vein occlusion; systemic heparin", "Diabetic Macular Edema (DME); intravitreal anti-VEGF injections", "Dry AMD; high-dose AREDS2 vitamins", "Tractional retinal detachment; urgent vitrectomy"]'::jsonb, 2, 'This is **Diabetic Macular Edema (DME)**, the most common cause of vision loss in diabetic patients. The gold-standard first-line treatment is **intravitreal anti-VEGF injections** (e.g., aflibercept, ranibizumab), which are highly effective at reducing macular thickness and improving visual acuity by closing endothelial tight junctions and stopping vessel leakage.'),
    (v_case_id, 'What is the primary pathophysiological mechanism responsible for fluid accumulation in the macula in DME?', '["Hypersecretion of fluid by the ciliary body epithelium", "Tractional pull of the posterior vitreous face on the fovea", "Breakdown of the blood-retinal barrier due to loss of endothelial tight junctions", "An immune-mediated hypersensitivity reaction to insulin molecules", "Mechanical blockage of the ciliary veins at the scleral spur"]'::jsonb, 2, 'DME is caused by the **breakdown of the blood-retinal barrier (BRB)**. Chronic hyperglycemia and vascular endothelial damage lead to the **loss of endothelial tight junctions (zonula occludens)**. This allows fluid, proteins, and lipids to leak from the capillaries into the extracellular space of the retina, particularly the macula.'),
    (v_case_id, 'Which of the following imaging modalities is most essential for the diagnosis, quantification, and monitoring of Diabetic Macular Edema?', '["CT scan of the orbits", "Visual field testing (perimetry)", "Ocular B-scan Ultrasound", "Optical Coherence Tomography (OCT)", "Fluorescein Angiography (FA)"]'::jsonb, 3, '**Optical Coherence Tomography (OCT)** is the most essential, non-invasive imaging modality for DME. It uses light waves to capture high-resolution, cross-sectional images of the retina, allowing for the precise measurement of retinal thickness, quantification of macular edema, and monitoring of the response to anti-VEGF injections.');

    ---------------------------------------------------------------------------
    -- CASE 44: Vignette: The Copper Wiring and AV Crossing (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Copper Wiring and AV Crossing (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Copper Wiring and AV Crossing (V5)', 'A 64-year-old female presenting for a routine eye exam is found to have a blood pressure of 138/84 mmHg. She has a history of essential hypertension but admits to frequently missing her antihypertensive medications.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 74 bpm | BP: 138/84 mmHg
*   **Visual Acuity:** Bilateral 20/20 (uncorrected)
*   **Ocular Examination:** Dilated fundus examination reveals generalized narrowing and focal constriction of the retinal arterioles. The arteriolar light reflex is widened, giving the vessels a "copper-wire" appearance. There is prominent arteriovenous (AV) nicking, where arterioles cross and compress the underlying retinal veins. No hemorrhages or disc edema are present.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 64-year-old female presenting for a routine eye exam is found to have a blood pressure of 138/84 mmHg. She has a history of essential hypertension but admits to frequently missing her antihypertensive medications.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 74 bpm | BP: 138/84 mmHg
*   **Visual Acuity:** Bilateral 20/20 (uncorrected)
*   **Ocular Examination:** Dilated fundus examination reveals generalized narrowing and focal constriction of the retinal arterioles. The arteriolar light reflex is widened, giving the vessels a "copper-wire" appearance. There is prominent arteriovenous (AV) nicking, where arterioles cross and compress the underlying retinal veins. No hemorrhages or disc edema are present.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the primary management?', '["Mild Diabetic Retinopathy; oral metformin and glucose monitoring", "Moderate Hypertensive Retinopathy; strict systemic blood pressure control", "Ocular ischemic syndrome; urgent carotid endarterectomy", "Central retinal artery occlusion; immediate ocular massage", "Normal-tension glaucoma; topical prostaglandin drops"]'::jsonb, 1, 'This patient has **Moderate Hypertensive Retinopathy** (Grade II on the Keith-Wagener-Barker classification), characterized by generalized/focal arteriolar narrowing, **copper wiring**, and **AV nicking** without hemorrhages or disc edema. The primary management is **strict systemic blood pressure control** to prevent further microvascular damage and reduce the risk of stroke/MI.'),
    (v_case_id, 'What is the anatomical explanation for the sign known as ''arteriovenous (AV) nicking''?', '["The sclerotic arteriole compresses the underlying vein because they share a common adventitial sheath at crossing points", "Inflammatory cells accumulate in the sub-adventitial space, obscuring the vein", "A localized thrombus forms in the vein due to turbulent flow under the arteriole", "The arteriole and vein fuse, forming an abnormal micro-fistula", "The vein is pulled backward by contracting vitreous strands"]'::jsonb, 0, '**AV nicking** occurs because the **retinal arteriole and vein share a common adventitial sheath** where they cross. As chronic hypertension causes arteriolar wall hypertrophy and sclerosis, the stiffened, thickened arteriole physically compresses the underlying, thin-walled vein, making the vein appear compressed, tapered, or blocked on either side of the crossing.'),
    (v_case_id, 'What represents the funduscopic sign known as ''silver wiring'' in advanced hypertensive retinopathy?', '["A plaque of cholesterol blocking a branch arteriole", "White blood cells lining the endothelium of the arterioles", "Calcification of the optic disc margin", "Severe arteriolar wall sclerosis where the lumen is completely obscured and the vessel appears white and reflective", "Deposition of calcium in the vessel wall"]'::jsonb, 3, '**Silver wiring** is an advanced stage of arteriolar sclerosis (Keith-Wagener Grade III/IV). The arteriolar wall becomes so thick and opaque that the red blood column inside is completely invisible. The vessel reflects light completely, appearing as a **white, reflective, shiny wire**.');

    ---------------------------------------------------------------------------
    -- CASE 45: Vignette: The Macular Star and Papilledema (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Macular Star and Papilledema (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Macular Star and Papilledema (V5)', 'A 55-year-old female presents to the emergency department with a severe headache, nausea, and sudden blurry vision in both eyes. Her blood pressure is found to be 119/85 mmHg.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 95 bpm | BP: 119/85 mmHg
*   **Visual Acuity:** Bilateral 20/80
*   **Ocular Examination:** Dilated fundus exam reveals multiple flame-shaped hemorrhages, cotton-wool spots, a prominent, radial "macular star" of hard lipid exudates in both maculae, and bilateral marked swelling and blurring of the optic disc margins (Grade IV hypertensive retinopathy).', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old female presents to the emergency department with a severe headache, nausea, and sudden blurry vision in both eyes. Her blood pressure is found to be 119/85 mmHg.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 95 bpm | BP: 119/85 mmHg
*   **Visual Acuity:** Bilateral 20/80
*   **Ocular Examination:** Dilated fundus exam reveals multiple flame-shaped hemorrhages, cotton-wool spots, a prominent, radial "macular star" of hard lipid exudates in both maculae, and bilateral marked swelling and blurring of the optic disc margins (Grade IV hypertensive retinopathy).', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most urgent medical intervention for this patient?', '["High-dose systemic oral corticosteroids to reduce optic nerve swelling", "Controlled reduction of blood pressure using intravenous antihypertensives in an intensive care setting", "Bilateral anterior chamber paracentesis to lower intraocular pressure", "Urgent lumbar puncture to relieve intracranial pressure", "Immediate bilateral panretinal photocoagulation laser therapy"]'::jsonb, 1, 'This patient has **Severe/Malignant Hypertensive Retinopathy (Grade IV)**, presenting as a **hypertensive emergency**. The most urgent intervention is admission to an ICU for **controlled reduction of blood pressure** using IV medications (e.g., nitroprusside, labetalol) to prevent life-threatening end-organ damage (stroke, encephalopathy, renal failure). Aggressive, too-rapid BP reduction must be avoided to prevent optic nerve or cerebral ischemia.'),
    (v_case_id, 'What is the composition and anatomical location of the ''macular star'' seen in this patient?', '["New blood vessels branching out from the central fovea", "Axoplasmic debris accumulating in the ganglion cell layer", "Calcium deposits in Bruch''s membrane", "Pockets of serous fluid under the neurosensory retina", "Lipids and lipoproteins deposited in a radial pattern within the Henle''s fiber layer of the macula"]'::jsonb, 4, 'The **macular star** is composed of **lipid and lipoprotein exudates** that leak from damaged, hyperpermeable peripapillary and retinal capillaries. These lipids are deposited in the **outer plexiform layer of the macula (specifically Henle''s fiber layer)**, which has a unique, radially oriented anatomy, forcing the exudates into a star-like or fan-like pattern centered on the fovea.'),
    (v_case_id, 'Which of the following represents the recommended rate of blood pressure reduction in the first hour of managing a hypertensive emergency?', '["Drop the BP immediately to 120/80 mmHg to prevent intracranial hemorrhage", "Reduce the Mean Arterial Pressure (MAP) by no more than 20% to 25% in the first hour", "Lower the systolic pressure to <90 mmHg to reduce ocular pressure", "Maintain the BP at baseline and initiate oral beta-blockers for slow reduction over a week", "Reduce the diastolic pressure by exactly 50% within the first 30 minutes"]'::jsonb, 1, 'In a hypertensive emergency, the **Mean Arterial Pressure (MAP) should be lowered by no more than 20% to 25% in the first hour**, and then to stable levels (e.g., 160/100-110) over the next 2 to 6 hours. Lowering the BP too rapidly or to normal levels too quickly can cause **severe organ hypoperfusion**, resulting in ischemic stroke, myocardial infarction, or anterior ischemic optic neuropathy (AION) due to loss of autoregulation.');

    ---------------------------------------------------------------------------
    -- CASE 46: Vignette: The Premature Baby's Ridge (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Premature Baby''s Ridge (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Premature Baby''s Ridge (V5)', 'A 2-month-old infant born at 25 weeks gestation with a birth weight of 1064 grams, who required high-flow supplemental oxygen therapy in the NICU for 51 days, undergoes a screening dilated eye exam.

**Physical Examination:**
*   **Vitals:** Stable premature infant.
*   **Ocular Examination (OU):** Dilated fundus exam reveals incomplete vascularization of the peripheral retina, with a prominent white demarcation line and an elevated ridge between the vascular and avascular zones, along with extraretinal fibrovascular proliferation extending into the vitreous (Stage 3 ROP). There is dilation and tortuosity of the posterior retinal vessels ("plus disease").', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 2-month-old infant born at 25 weeks gestation with a birth weight of 1064 grams, who required high-flow supplemental oxygen therapy in the NICU for 51 days, undergoes a screening dilated eye exam.

**Physical Examination:**
*   **Vitals:** Stable premature infant.
*   **Ocular Examination (OU):** Dilated fundus exam reveals incomplete vascularization of the peripheral retina, with a prominent white demarcation line and an elevated ridge between the vascular and avascular zones, along with extraretinal fibrovascular proliferation extending into the vitreous (Stage 3 ROP). There is dilation and tortuosity of the posterior retinal vessels ("plus disease").', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what are the main risk factors?', '["Retinoblastoma; hereditary mutation in the RB1 gene", "Retinopathy of Prematurity (ROP); premature birth (<30 weeks), low birth weight (<1500g), and supplemental oxygen therapy", "Congenital cataracts; autosomal dominant inheritance", "Persistent Fetal Vasculature (PFV); maternal rubella infection in utero", "Coats'' disease; idiopathic retinal telangiectasia in young males"]'::jsonb, 1, 'This infant has **Retinopathy of Prematurity (ROP)**. The primary risk factors are **extreme prematurity (gestational age <30 weeks)**, **low birth weight (<1500 grams)**, and **supplemental oxygen therapy**. High-flow oxygen in the NICU disrupts normal peripheral retinal vascular development, leading to hypoxia and abnormal neovascularization once returned to room air.'),
    (v_case_id, 'What is the dual-phase pathophysiological mechanism of ROP driven by oxygen levels?', '["Hyperoxia causes downregulation of VEGF, halting vascular growth; subsequent relative hypoxia in room air triggers massive VEGF upregulation and neovascularization", "Oxygen stimulates the direct migration of corneal stem cells into the vitreous cavity", "Oxygen causes primary thrombi in the central retinal artery, followed by venous bleeding", "Relative hypoxia causes mechanical tearing of the retina due to scleral stretching", "Hyperoxia directly toxic to ciliary nerves, paralyzing pupil; relative hypoxia causes iris necrosis"]'::jsonb, 0, 'ROP is a **two-phase disease**: (1) **Hyperoxia Phase**: The high oxygen environment of the incubator downregulates VEGF, causing normal vessel growth to halt. (2) **Hypoxia Phase**: When the infant is removed from supplemental oxygen, the avascular peripheral retina becomes ischemic and highly hypoxic, triggering a **massive upregulation of VEGF**. This drives abnormal, fragile neovascularization at the boundary of the vascularized retina.'),
    (v_case_id, 'What represents the definition and significance of ''plus disease'' in Retinopathy of Prematurity?', '["The presence of a patent ductus arteriosus in the infant", "The presence of bilateral congenital cataracts alongside retinal changes", "The development of a tractional retinal detachment in Stage 5", "Severe dilation and tortuosity of the posterior retinal vessels, indicating high disease activity and a need for treatment", "An elevated intraocular pressure >21 mmHg in both eyes"]'::jsonb, 3, '**''Plus disease''** is defined by **marked dilation and tortuosity of the retinal blood vessels in the posterior pole** (in at least two quadrants). It indicates severe shunting and highly active neovascularization, representing a key threshold sign that warrants **prompt treatment** (laser photocoagulation or anti-VEGF) to prevent progression to retinal detachment.');

    ---------------------------------------------------------------------------
    -- CASE 47: Vignette: The Sea-Fan Neovascularization (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Sea-Fan Neovascularization (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Sea-Fan Neovascularization (V5)', 'A 22-year-old African American female with HbSC sickle cell disease presents with sudden onset of multiple floaters and mild visual loss in the left eye. She has had no recent sickle cell crises.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 72 bpm | BP: 118/76 mmHg
*   **Visual Acuity:** OS: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OS):** Dilated fundus examination reveals multiple peripheral retinal arteriolar occlusions, with localized areas of retinal thinning. In the temporal periphery, there are multiple abnormal branching vessels resembling sea-fans ("sea-fan neovascularization") arising from the boundary of the vascularized retina, along with a localized vitreous hemorrhage.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 22-year-old African American female with HbSC sickle cell disease presents with sudden onset of multiple floaters and mild visual loss in the left eye. She has had no recent sickle cell crises.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 72 bpm | BP: 118/76 mmHg
*   **Visual Acuity:** OS: 20/80; contralateral eye: 20/20
*   **Ocular Examination (OS):** Dilated fundus examination reveals multiple peripheral retinal arteriolar occlusions, with localized areas of retinal thinning. In the temporal periphery, there are multiple abnormal branching vessels resembling sea-fans ("sea-fan neovascularization") arising from the boundary of the vascularized retina, along with a localized vitreous hemorrhage.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and which sickle cell genotype is most commonly associated with severe proliferative retinopathy?', '["Sickle Cell Retinopathy; HbSC and HbS-Thal genotypes are more commonly associated with severe proliferative disease than HbSS", "Coats'' disease; HbSS genotype is diagnostic", "Eales'' disease; HbAS (carrier) is the only associated genotype", "Sickle Cell Retinopathy; HbSS genotype is far more common and severe than HbSC", "Proliferative Diabetic Retinopathy; HbSS genotype is highly protective"]'::jsonb, 0, 'This is **Sickle Cell Retinopathy**. Interestingly, proliferative retinopathy is **more common and severe in HbSC and HbS-Beta-Thalassemia genotypes** than in the homozygous HbSS genotype (which has more severe systemic vaso-occlusive crises but fewer ocular vascular occlusions). Classic signs are peripheral arteriolar occlusions and **"sea-fan" neovascularization**.'),
    (v_case_id, 'What represents the classic non-proliferative fundus signs known as ''salmon-patch'' and ''black sunburst'' in sickle cell disease?', '["Salmon-patch: RPE atrophy; Black sunburst: choroidal neovascular membrane", "Salmon-patch: congenital choroidal hemangioma; Black sunburst: optic disc calcification", "Salmon-patch: ciliary body cysts; Black sunburst: iris transillumination defects", "Salmon-patch: intraretinal/subretinal hemorrhage that turns yellow-pink; Black sunburst: localized RPE hyperpigmentation from old blood", "Salmon-patch: lipid exudates in Henle''s layer; Black sunburst: cotton-wool spots surrounding the macula"]'::jsonb, 3, '**Salmon-patch hemorrhages** are dome-shaped intraretinal/subretinal hemorrhages in the mid-periphery that liquefy and turn orange-pink over time. **Black sunbursts** are round, dark, hyperpigmented lesions in the peripheral retina caused by hyperplasia of the RPE in response to localized subretinal hemorrhage, representing old, cleared blood.'),
    (v_case_id, 'Why is the use of carbonic anhydrase inhibitors (particularly systemic acetazolamide) strictly CONTRAINDICATED in patients with sickle cell disease who develop elevated intraocular pressure?', '["Acetazolamide induces systemic acidosis and dehydration, which directly promotes sickling of erythrocytes, worsening vascular occlusion", "Acetazolamide reacts with hemoglobin S to cause corneal calcification", "Acetazolamide has no efficacy in lowering IOP in these patients", "Acetazolamide causes severe macular edema in sickle cell patients", "Acetazolamide triggers an autoimmune hemolytic anemia"]'::jsonb, 0, 'Systemic **acetazolamide** (and other CAIs) is **strictly contraindicated in sickle cell disease**. It causes systemic metabolic acidosis and dehydration, which increases the concentration of sickled cells and **promotes sickling of erythrocytes**. In the eye, sickling of RBCs in the anterior chamber can completely block the trabecular meshwork, causing a rapid, uncontrollable IOP spike. Methazolamide or topical drops (excluding CAIs) are used instead.');

    ---------------------------------------------------------------------------
    -- CASE 48: Vignette: The Stress-Induced Spot (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Stress-Induced Spot (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Stress-Induced Spot (V5)', 'A 41-year-old male corporate executive presents with a sudden, painless central gray spot (scotoma) and distortion of shapes (metamorphopsia) in his left eye. He reports high stress at work and recently received a corticosteroid injection for shoulder pain.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 68 bpm | BP: 131/77 mmHg
*   **Visual Acuity:** OS: 20/40 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior segment is quiet. Dilated fundus exam reveals a well-demarcated, dome-like elevation of the sensory retina in the central macula. No hemorrhages, drusen, or cotton-wool spots are seen. OCT confirms a localized serous detachment of the neurosensory retina with a normal-thickness choroid.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 41-year-old male corporate executive presents with a sudden, painless central gray spot (scotoma) and distortion of shapes (metamorphopsia) in his left eye. He reports high stress at work and recently received a corticosteroid injection for shoulder pain.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 68 bpm | BP: 131/77 mmHg
*   **Visual Acuity:** OS: 20/40 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior segment is quiet. Dilated fundus exam reveals a well-demarcated, dome-like elevation of the sensory retina in the central macula. No hemorrhages, drusen, or cotton-wool spots are seen. OCT confirms a localized serous detachment of the neurosensory retina with a normal-thickness choroid.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the initial management step?', '["Wet AMD; immediate intravitreal anti-VEGF injection", "Central Serous Chorioretinopathy (CSCR); discontinue all corticosteroids, reduce stress, and observe", "CMV retinitis; start systemic valganciclovir", "Rhegmatogenous retinal detachment; urgent pneumatic retinopexy", "Optic neuritis; initiate high-dose intravenous methylprednisolone"]'::jsonb, 1, 'This is **Central Serous Chorioretinopathy (CSCR)**, typically affecting young/middle-aged males under high stress (type A personality) or using **corticosteroids** (oral, topical, inhaled, or joint injection). The initial step is to **discontinue all corticosteroids**, manage stress, and **observe**, as 80-90% of cases resolve spontaneously within 3 to 4 months without intervention.'),
    (v_case_id, 'What is the primary pathophysiological defect leading to fluid leakage under the macula in CSCR?', '["Thrombosis of the vortex veins leading to back-pressure", "Choroidal hyperpermeability combined with focal dysfunction of the retinal pigment epithelium (RPE) barrier", "Tractional pulling of the fovea by a vitreous membrane", "Hypersecretion of aqueous humor by the ciliary muscle", "Autoimmune destruction of the macular photoreceptors"]'::jsonb, 1, 'The primary defect in CSCR is **choroidal hyperpermeability** (possibly driven by high cortisol/epinephrine levels). The hyper-permeable choroid causes fluid to build up under the RPE, eventually leading to a **focal defect or breakdown in the RPE tight junctions (outer blood-retinal barrier)**, allowing fluid to leak into the subretinal space, separating the retina from the RPE.'),
    (v_case_id, 'Which classic pattern is visible on fluorescein angiography during active fluid leakage in CSCR?', '["A ''smokestack'' or ''ink-blot'' leak of dye rising through the RPE into the subretinal space", "A ''Swiss-cheese'' pattern of late hyperfluorescence at the optic disc", "A ''blood and thunder'' diffuse blockage of choroidal fluorescence", "A ''cherry-red'' block of dye in the central foveola", "Multiple peripheral ''sea-fan'' branching leaks"]'::jsonb, 0, 'On **fluorescein angiography (FA)**, CSCR classically presents as an **''ink-blot'' leak** (a expanding spot of dye) or a **''smokestack'' leak** (where dye rises vertically through the RPE leak and spreads horizontally, resembling a plume of smoke, due to convection currents in the subretinal fluid).');

    ---------------------------------------------------------------------------
    -- CASE 49: Vignette: The Post-Radiation Blur (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Post-Radiation Blur (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Post-Radiation Blur (V5)', 'A 52-year-old female presents with slowly progressive, painless blurring of central vision in her right eye. She has a history of undergoing radiation therapy for a head and neck squamous cell carcinoma 3 years ago. She is not diabetic.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 130/80 mmHg
*   **Visual Acuity:** OD: 20/100; contralateral eye: 20/20
*   **Ocular Examination (OD):** Dilated fundus examination reveals extensive capillary loss, microaneurysms, flame-shaped and dot hemorrhages, cotton-wool spots, and macular edema, closely mimicking diabetic retinopathy but without a history of diabetes or hyperglycemia.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 52-year-old female presents with slowly progressive, painless blurring of central vision in her right eye. She has a history of undergoing radiation therapy for a head and neck squamous cell carcinoma 3 years ago. She is not diabetic.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 72 bpm | BP: 130/80 mmHg
*   **Visual Acuity:** OD: 20/100; contralateral eye: 20/20
*   **Ocular Examination (OD):** Dilated fundus examination reveals extensive capillary loss, microaneurysms, flame-shaped and dot hemorrhages, cotton-wool spots, and macular edema, closely mimicking diabetic retinopathy but without a history of diabetes or hyperglycemia.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Diabetic retinopathy", "Central retinal vein occlusion", "CMV retinitis", "Ocular ischemic syndrome", "Radiation retinopathy"]'::jsonb, 4, 'This is **Radiation Retinopathy**, a delayed complication of ionizing radiation to the eye or surrounding structures (e.g. sinuses, brain, head/neck). It closely mimics diabetic retinopathy due to progressive **damage to vascular endothelial cells**, leading to capillary occlusion, retinal ischemia, exudation, and macular edema.'),
    (v_case_id, 'What is the typical latency period between radiation exposure and the development of Radiation Retinopathy?', '["Exactly 10 to 15 years, representing late genetic transformation", "1 to 5 years, depending on the radiation dose and volume", "2 to 7 days, representing acute tissue burn", "There is no latency; it only occurs during active radiation treatment", "Radiation retinopathy occurs immediately during the first fraction of therapy"]'::jsonb, 1, 'Radiation retinopathy has a **latency period of 1 to 5 years** (typically peak onset at 2 to 3 years) between the completion of radiation therapy and the onset of clinical symptoms. The latency is inversely related to the total radiation dose delivered to the eye (doses >30-35 Gy carry high risk).'),
    (v_case_id, 'What is the first-line treatment for managing vision loss from macular edema in Radiation Retinopathy?', '["Bilateral panretinal photocoagulation (PRP) immediately", "Intravitreal anti-VEGF injections or focal/grid laser therapy", "High-dose systemic oral corticosteroids", "Intravitreal injections of broad-spectrum antibiotics", "Urgent surgical pars plana vitrectomy"]'::jsonb, 1, 'Treatment for radiation retinopathy is directed at complications, primarily macular edema and neovascularization. First-line therapy for macular edema is **intravitreal anti-VEGF injections** (aflibercept, ranibizumab) or **focal/grid laser**, similar to diabetic macular edema. PRP is used if proliferative neovascularization develops.');

    ---------------------------------------------------------------------------
    -- CASE 50: Vignette: The Post-Traumatic White Patches (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Post-Traumatic White Patches (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Post-Traumatic White Patches (V5)', 'A 39-year-old female is brought to the emergency department after a severe motor vehicle collision with massive chest wall compression and bilateral femur fractures. She complains of sudden, profound loss of vision in both eyes that occurred shortly after the accident.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 110 bpm | BP: 100/60 mmHg
*   **Ocular Examination (OU):** Dilated fundus examination reveals multiple, large, polygonal white patches of retinal whitening ("Purtscher flecken") and multiple cotton-wool spots surrounding the optic nerve head bilaterally, accompanied by scattered flame-shaped hemorrhages. The optic discs are normal.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 39-year-old female is brought to the emergency department after a severe motor vehicle collision with massive chest wall compression and bilateral femur fractures. She complains of sudden, profound loss of vision in both eyes that occurred shortly after the accident.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 110 bpm | BP: 100/60 mmHg
*   **Ocular Examination (OU):** Dilated fundus examination reveals multiple, large, polygonal white patches of retinal whitening ("Purtscher flecken") and multiple cotton-wool spots surrounding the optic nerve head bilaterally, accompanied by scattered flame-shaped hemorrhages. The optic discs are normal.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Traumatic optic neuropathy", "Terson''s syndrome", "Malignant hypertensive retinopathy", "Purtscher''s retinopathy", "CMV retinitis"]'::jsonb, 3, 'This is **Purtscher''s Retinopathy**, a post-traumatic chorioretinopathy associated with severe head or **thoracic compression injury**, long-bone fractures, or acute pancreatitis. Classic fundus findings are **Purtscher flecken** (polygonal areas of inner retinal whitening) and cotton-wool spots located in the peripapillary region, with sudden bilateral visual loss.'),
    (v_case_id, 'What is the primary proposed pathophysiological mechanism driving Purtscher''s Retinopathy?', '["Direct mechanical shearing of the central retinal artery during trauma", "Massive vitreous hemorrhage blocking the visual axis", "Autoimmune destruction of the retinal nerve fiber layer by anti-retinal antibodies", "Leukoembolization of microvasculature by granulocyte aggregates triggered by complement activation", "Retrobulbar hemorrhage compressing the optic nerve in the canal"]'::jsonb, 3, 'The primary mechanism is **leukoembolization**. Severe trauma, complement activation, or fat emboli from long-bone fractures cause the aggregation of white blood cells (granulocytes), platelets, or lipids. These **microemboli clog the precapillary arterioles** of the peripapillary retina, leading to focal microinfarcts (cotton-wool spots) and localized inner retinal ischemia (Purtscher flecken).'),
    (v_case_id, 'What represents the classic funduscopic finding known as ''Purtscher flecken'' that distinguishes this condition?', '["Splinter hemorrhages at the optic disc margin", "A bright cherry-red spot in the foveola", "Extracellular yellowish drusen in the central macula", "Demarcation line and ridge in the peripheral retina", "Polygonal areas of inner retinal whitening located between the retinal arterioles and venules, sparing the immediate peripapillary zone"]'::jsonb, 4, '**Purtscher flecken** are **polygonal areas of inner retinal whitening** located between the retinal arterioles and venules. They characteristically **spare the immediate peripapillary zone** (within 0.5 disc diameters) because of the different vascular supply (cilioretinal) and are highly pathognomonic for this trauma-related or pancreatitis-related micro-embolization.');

END $$;
COMMIT;
