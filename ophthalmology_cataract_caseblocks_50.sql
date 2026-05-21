-- Ophthalmology: Cataract & Lens
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: optho-cataract

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'optho-cataract' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'optho-cataract';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: The Myopic Shift of Age (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Myopic Shift of Age (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Myopic Shift of Age (V1)', 'A 78-year-old female presents with slowly progressive, painless blurring of vision in both eyes over the past 3 years. She reports having difficulty reading distance street signs and highway markers. Interestingly, she notes a surprising improvement in her near vision, allowing her to read the newspaper without reading glasses for the first time in a decade.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 69 bpm | BP: 137/83 mmHg
*   **Visual Acuity:** OS: 20/70 (no improvement with pinhole); contralateral eye: 20/25
*   **Ocular Examination (OS):** The anterior chamber is deep and quiet. Slit-lamp biomicroscopy of the lens reveals significant yellow-to-amber discoloration and moderate compaction of the lens nucleus. The contralateral lens shows similar but milder changes. Dilated fundus exam reveals normal optic discs with a cup-to-disc ratio of 0.3 OU, and a normal macula.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 78-year-old female presents with slowly progressive, painless blurring of vision in both eyes over the past 3 years. She reports having difficulty reading distance street signs and highway markers. Interestingly, she notes a surprising improvement in her near vision, allowing her to read the newspaper without reading glasses for the first time in a decade.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 69 bpm | BP: 137/83 mmHg
*   **Visual Acuity:** OS: 20/70 (no improvement with pinhole); contralateral eye: 20/25
*   **Ocular Examination (OS):** The anterior chamber is deep and quiet. Slit-lamp biomicroscopy of the lens reveals significant yellow-to-amber discoloration and moderate compaction of the lens nucleus. The contralateral lens shows similar but milder changes. Dilated fundus exam reveals normal optic discs with a cup-to-disc ratio of 0.3 OU, and a normal macula.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following represents the primary mechanism behind the patient''s temporary improvement in near vision?', '["Upregulation of ciliary muscle contractility compensating for presbyopia", "Resolution of underlying subclinical macular edema", "Increased refractive power of the lens due to increased density and nuclear compaction, causing a myopic shift", "Spontaneous flattening of the cornea leading to decreased hyperopic refractive error", "Regeneration of accommodation capacity in the crystalline lens fibers"]'::jsonb, 2, 'This patient has a **nuclear sclerotic cataract**, which characteristically causes a **myopic shift** (often referred to as **''second sight''**). The gradual compaction and sclerosis of the lens nucleus increase its refractive index, shifting the patient''s focal point closer. This allows presbyopic patients to temporarily read near print without reading glasses, though at the expense of distance vision.'),
    (v_case_id, 'Which of the following is the primary biochemical change associated with the development of nuclear sclerotic cataracts?', '["Proliferation of anterior lens epithelial cells on the capsular bag", "Aggregation and insolubilization of lens crystallin proteins, along with accumulation of urochrome pigment", "Hydration of lens cortical fibers due to osmotic swelling", "Deposition of systemic calcium salts within the lens stroma", "Autoimmune degradation of the lens capsule matrix"]'::jsonb, 1, 'Nuclear sclerotic cataracts are characterized by **aggregation and insolubilization of lens crystallin proteins**, along with the **accumulation of urochrome pigment** (which causes the yellow/brown coloration). This pigment filters out blue light and contributes to decreased color perception and contrast sensitivity.'),
    (v_case_id, 'Which of the following is the most appropriate next step in the management of this patient?', '["Prescribing daily topical non-steroidal anti-inflammatory drops to halt cataract progression", "Initiation of systemic high-dose vitamin A and lutein supplementation", "Immediate referral for YAG laser capsulotomy to clear the visual axis", "Performing urgent surgical trabeculectomy to prevent secondary glaucoma", "Cataract extraction and intraocular lens (IOL) implantation if the vision impairment interferes with activities of daily living"]'::jsonb, 4, 'The definitive treatment for cataracts is **cataract extraction and intraocular lens (IOL) implantation**. The indication for surgery is functional visual impairment that interferes with the patient''s activities of daily living (e.g. driving, reading). There are no approved pharmacologic agents to halt or reverse cataract formation.');

    ---------------------------------------------------------------------------
    -- CASE 02: The Glare of Headlights (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Glare of Headlights (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Glare of Headlights (V1)', 'A 72-year-old female presents complaining of progressive difficulty driving at night. She reports experiencing debilitating glare and starbursts from the headlights of oncoming cars, which makes night driving extremely stressful. Her distance vision has also become progressively blurry over the past 3 years.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 78 bpm | BP: 128/80 mmHg
*   **Visual Acuity:** OD: 20/50 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OD):** Slit-lamp biomicroscopy reveals white, wedge-shaped opacities extending from the peripheral lens cortex towards the center in a spoke-like pattern, particularly in the nasal and inferior quadrants. The lens nucleus is relatively clear. Fundus examination is normal with clear visualization of the retina.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 72-year-old female presents complaining of progressive difficulty driving at night. She reports experiencing debilitating glare and starbursts from the headlights of oncoming cars, which makes night driving extremely stressful. Her distance vision has also become progressively blurry over the past 3 years.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 78 bpm | BP: 128/80 mmHg
*   **Visual Acuity:** OD: 20/50 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OD):** Slit-lamp biomicroscopy reveals white, wedge-shaped opacities extending from the peripheral lens cortex towards the center in a spoke-like pattern, particularly in the nasal and inferior quadrants. The lens nucleus is relatively clear. Fundus examination is normal with clear visualization of the retina.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following slit-lamp findings is most pathognomonic for a cortical cataract?', '["A granular, plaque-like opacity in the central posterior subcapsular area", "Golden-brown discoloration of the central lens nucleus", "Wedge-shaped, spoke-like opacities starting in the peripheral cortex", "A subluxated lens showing stretched zonular fibers", "Multiple small, hyper-pigmented spots on the anterior lens capsule"]'::jsonb, 2, '**Cortical cataracts** classically present as **wedge-shaped, spoke-like opacities** that start in the peripheral cortex and progress toward the center of the lens. They are best visualized with retroillumination, where they appear as dark silhouettes against the red reflex.'),
    (v_case_id, 'What is the primary underlying pathophysiological process driving cortical cataract formation?', '["Hydration and swelling of lens cortical fibers, leading to vacuole formation and clefting along suture lines", "Proliferation and migration of equatorial lens epithelial cells to the posterior pole", "Direct chemical oxidation of central nuclear crystallins by free radicals", "Deposition of blood-derived lipids in the peripheral lens stroma", "Primary loss of ciliary body perfusion leading to lens ischemia"]'::jsonb, 0, 'Cortical cataracts are driven by **hydration and swelling of lens cortical fibers**. This occurs due to disruption of the lens cell membrane integrity and the activity of the Na+/K+ ATPase pump. Water enters the lens, causing vacuole formation and subsequent **clefting along the natural lens suture lines**, presenting as the classic cortical spokes.'),
    (v_case_id, 'Which visual symptom is most specifically associated with cortical cataracts compared to nuclear sclerotic cataracts?', '["Severe glare, starbursts, and monocular diplopia due to irregular light scattering", "Surprising improvement in near vision (second sight)", "Severe, throbbing ocular pain and redness", "A central gray scotoma with distorted lines", "Fluctuating visual acuity related to systemic blood glucose levels"]'::jsonb, 0, 'Cortical cataracts are highly associated with **significant glare, starbursts, and halos** (especially at night from headlights) due to the irregular refraction and scattering of light as it passes through the peripheral cortical opacities. They can also cause **monocular diplopia** or polyopia due to the split-refractive properties of the hydrated lens clefts.');

    ---------------------------------------------------------------------------
    -- CASE 03: The Steroid-Induced Plaque (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Steroid-Induced Plaque (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Steroid-Induced Plaque (V1)', 'A 56-year-old female with a history of severe asthma requiring frequent courses of systemic corticosteroids and daily inhaled fluticasone presents with a rapid, painless decrease in vision in her right eye over the past 3 months. She reports that her near vision is particularly severely affected, making it nearly impossible to read books or look at her phone.  She also complains of disabling glare in bright sunlight.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 82 bpm | BP: 137/77 mmHg
*   **Visual Acuity:** OD: 20/100 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OD):** Anterior chamber is deep and quiet. Slit-lamp exam of the lens reveals a dense, granular, plaque-like opacity located on the posterior surface of the lens, directly in the visual axis. The lens nucleus and cortex are clear. The intraocular pressure is 15 mmHg OU. Dilated fundus examination is normal.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 56-year-old female with a history of severe asthma requiring frequent courses of systemic corticosteroids and daily inhaled fluticasone presents with a rapid, painless decrease in vision in her right eye over the past 3 months. She reports that her near vision is particularly severely affected, making it nearly impossible to read books or look at her phone.  She also complains of disabling glare in bright sunlight.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 82 bpm | BP: 137/77 mmHg
*   **Visual Acuity:** OD: 20/100 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OD):** Anterior chamber is deep and quiet. Slit-lamp exam of the lens reveals a dense, granular, plaque-like opacity located on the posterior surface of the lens, directly in the visual axis. The lens nucleus and cortex are clear. The intraocular pressure is 15 mmHg OU. Dilated fundus examination is normal.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Nuclear sclerotic cataract", "Cortical cataract", "Posterior subcapsular cataract (PSC)", "Posterior capsular opacification (PCO)", "Traumatic cataract"]'::jsonb, 2, 'This patient has a **Posterior Subcapsular Cataract (PSC)**. Key features include the **plaque-like, granular opacity** on the posterior surface of the lens, a history of **corticosteroid use**, a **relatively young age**, and **disproportionately severe loss of near vision** and glare in bright conditions because the opacity is located directly in the nodal point of the eye.'),
    (v_case_id, 'What is the cellular origin of a posterior subcapsular cataract?', '["Myofibroblastic transdifferentiation of keratocytes in the corneal stroma", "Abnormal migration and swelling of lens epithelial cells from the equator to the posterior pole, forming Wedl (bladder) cells", "Proliferation of iris pigment epithelial cells onto the anterior lens capsule", "Necrosis of the central lens fiber cells due to chronic ischemia", "Deposition of macrophages that have engulfed leaked lens proteins"]'::jsonb, 1, 'PSCs arise from the **abnormal migration and swelling of lens epithelial cells**. Normally, lens epithelial cells are located on the anterior surface and migrate to the equator to differentiate into lens fibers. In PSC, these cells aberrantly migrate posteriorly to the posterior pole, where they swell and become large, nucleated, vacuolated cells known as **Wedl cells** or **bladder cells**, forming the posterior plaque.'),
    (v_case_id, 'Why does a posterior subcapsular cataract affect near vision more severely than distance vision?', '["The posterior capsule is physically connected to the ciliary zonules", "The lens becomes extremely rigid and prevents accommodation completely", "Near vision requires a wider pupil, which exposes the peripheral cortical clefts", "Accommodative pupillary constriction (miosis) focuses light directly through the central posterior opacity", "Corticosteroids selectively damage the macular photoreceptors responsible for near vision"]'::jsonb, 3, 'PSC affects **near vision more severely** because during near vision, the accommodation reflex triggers **pupillary constriction (miosis)**. This constricts the light path, forcing light to pass directly through the **small, central, posterior subcapsular plaque** located at the nodal point of the eye. In contrast, in dimmer light or distance vision, a slightly wider pupil allows light to pass around the central opacity, resulting in better distance acuity.');

    ---------------------------------------------------------------------------
    -- CASE 04: The Absent Red Reflex (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Absent Red Reflex (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Absent Red Reflex (V1)', 'A 1-month-old infant is brought to the pediatric ophthalmology clinic by his parents who noticed an abnormal white appearance in the baby''s left pupil on a family photograph. The mother notes the baby does not seem to track toys or look at his face as well when the right eye is covered.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Central, steady, and maintained in the right eye; poor fixation and tracking in the left eye.
*   **Ocular Examination:** The right eye shows a normal, bright red reflex. The left eye has an absent red reflex, replaced by a dense, white, homogeneous opacity in the center of the pupil (leukocoria). Handheld slit-lamp exam reveals a dense, central nuclear lens opacity. The cornea is clear and corneal diameters are symmetric. No signs of intraocular inflammation or retinoblastoma are noted on B-scan ultrasound.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 1-month-old infant is brought to the pediatric ophthalmology clinic by his parents who noticed an abnormal white appearance in the baby''s left pupil on a family photograph. The mother notes the baby does not seem to track toys or look at his face as well when the right eye is covered.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Central, steady, and maintained in the right eye; poor fixation and tracking in the left eye.
*   **Ocular Examination:** The right eye shows a normal, bright red reflex. The left eye has an absent red reflex, replaced by a dense, white, homogeneous opacity in the center of the pupil (leukocoria). Handheld slit-lamp exam reveals a dense, central nuclear lens opacity. The cornea is clear and corneal diameters are symmetric. No signs of intraocular inflammation or retinoblastoma are noted on B-scan ultrasound.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most critical management priority for a dense, unilateral congenital cataract?', '["Watchful waiting and visual stimulation therapy until the child is at least 5 years old", "Fitting with custom glasses and scheduling surgery at school age", "Immediate systemic antiviral therapy for suspected congenital CMV", "Initiation of daily topical corticosteroid drops to clear the lens opacity", "Urgent surgical cataract extraction within the first 6 to 8 weeks of life to prevent irreversible deprivation amblyopia"]'::jsonb, 4, 'A dense, unilateral congenital cataract is a **visual emergency**. It must be treated with **urgent surgical extraction (lensectomy) within the first 6 to 8 weeks of life**. Delaying surgery beyond the critical period of visual development leads to permanent, irreversible **deprivation amblyopia**, as the visual cortex fails to develop proper synaptic connections with the affected eye.'),
    (v_case_id, 'Which congenital infection is most classically associated with congenital cataracts, microphthalmia, and sensorineural hearing loss?', '["Congenital Cytomegalovirus", "Congenital Syphilis", "Congenital Herpes Simplex Virus", "Congenital Rubella Syndrome", "Congenital Toxoplasmosis"]'::jsonb, 3, '**Congenital Rubella Syndrome** is classically associated with the triad of **cataracts** (often bilateral), **microphthalmia/pigmentary retinopathy**, **sensorineural hearing loss**, and **cardiac defects** (patent ductus arteriosus). The rubella virus directly infects the developing lens vesicle in utero before the capsule forms, leading to chronic replication within the lens fibers.'),
    (v_case_id, 'Following congenital cataract surgery in an infant, what is the primary method of visual rehabilitation to prevent amblyopia?', '["There is no effective visual rehabilitation method for aphakic infants", "Fitting with a high-power contact lens (aphakic contact lens) and patching the contralateral eye (occlusion therapy)", "Implantation of a standard adult monofocal intraocular lens without patching", "Performing daily laser therapy to stimulate the macula", "Prescribing standard bifocal glasses and hoping the eyes self-correct"]'::jsonb, 1, 'Visual rehabilitation in an aphakic infant is crucial. Because the infant''s eye is small and rapidly growing, primary IOL implantation is highly challenging and risky. Therefore, infants are rehabilitated with a **high-power aphakic contact lens** (or aphakic glasses for bilateral cases) to correct the severe refractive error, combined with **occlusion therapy (patching of the normal eye)** to force the brain to use the surgical eye and prevent amblyopia.');

    ---------------------------------------------------------------------------
    -- CASE 05: The Blunt Rosette (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blunt Rosette (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blunt Rosette (V1)', 'A 20-year-old female presents with a 3-month history of progressive visual blur in her right eye. Upon questioning, she recalls being struck in that eye by a tennis ball during a match approximately 8 months ago. She experienced temporary pain and bruising but did not seek medical attention at the time.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 85 bpm | BP: 133/80 mmHg
*   **Visual Acuity:** OD: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior chamber is deep and quiet. Gonioscopy shows 15% angle recession inferiorly. Slit-lamp exam of the lens reveals a classic rosette-shaped or star-shaped cortical opacity located in the posterior subcapsular region. The ciliary zonules appear intact, and there is no lens subluxation or phacodonesis. The intraocular pressure is 14 mmHg OU.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 20-year-old female presents with a 3-month history of progressive visual blur in her right eye. Upon questioning, she recalls being struck in that eye by a tennis ball during a match approximately 8 months ago. She experienced temporary pain and bruising but did not seek medical attention at the time.

**Physical Examination:**
*   **Vitals:** Temp: 98.5°F | HR: 85 bpm | BP: 133/80 mmHg
*   **Visual Acuity:** OD: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior chamber is deep and quiet. Gonioscopy shows 15% angle recession inferiorly. Slit-lamp exam of the lens reveals a classic rosette-shaped or star-shaped cortical opacity located in the posterior subcapsular region. The ciliary zonules appear intact, and there is no lens subluxation or phacodonesis. The intraocular pressure is 14 mmHg OU.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which classic morphology is most characteristic of a cataract caused by blunt, non-penetrating ocular trauma?', '["Wedge-shaped, spoke-like peripheral clefts", "White, flaky, dandruff-like deposits on the anterior capsule", "Dense, golden-brown nuclear compaction", "Amber-colored central oil-droplet opacity", "Rosette-shaped or stellate-shaped cortical opacity"]'::jsonb, 4, 'Blunt, non-penetrating ocular trauma characteristically causes a **rosette-shaped or stellate-shaped cortical opacity**, typically located in the posterior or anterior subcapsular cortex. The concussive wave transmission through the eye disrupts the lens fibers, leading to fluid accumulation along the suture lines in this unique flower-like pattern.'),
    (v_case_id, 'What is the primary pathophysiology behind traumatic cataract formation after blunt trauma?', '["Disruption of the lens capsule or ciliary zonules, allowing aqueous humor to enter and hydrate the lens fibers", "Direct chemical necrosis of lens crystallins by inflammatory cytokines", "Localized ischemia of the ciliary body processes that supply the lens", "Secondary calcification of the posterior lens capsule due to intraocular hemorrhage", "A chronic, low-grade bacterial infection of the lens cortex"]'::jsonb, 0, 'Blunt trauma causes **micro-ruptures or increased permeability of the lens capsule** (or direct injury to the subcapsular lens fibers). This allows **aqueous humor to enter and hydrate the lens fibers**, leading to localized opacification and swelling. Over time, this focal hydration spreads, often resulting in a mature, completely opaque cataract.'),
    (v_case_id, 'What other clinical finding must be ruled out in a patient with a traumatic cataract before planning surgery?', '["Zonular dialysis, angle recession, and secondary glaucoma", "Congenital dacryostenosis and tear duct block", "Pseudoexfoliative deposits on the corneal endothelium", "An underlying mutation in the fibrillin-1 gene", "A contralateral optic nerve Drance hemorrhage"]'::jsonb, 0, 'Prior blunt trauma carries a high risk of **zonular dialysis** (weakness/tearing of the lens support cords), **angle recession** (tearing of the iris insertion, which can lead to late secondary glaucoma), and **vitreous prolapse**. The surgeon must carefully evaluate for iris and lens tremulousness (iridodonesis/phacodonesis) and angle structure, as zonular weakness significantly complicates cataract surgery.');

    ---------------------------------------------------------------------------
    -- CASE 06: The Liquefied Cortex (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Liquefied Cortex (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Liquefied Cortex (V1)', 'A 82-year-old female from an underserved rural community presents with profound, painless vision loss in her left eye. She reports that the eye has been virtually blind for over 2 years, but she did not seek treatment due to lack of local services and fear of surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 68 bpm | BP: 130/76 mmHg
*   **Visual Acuity:** OS: Hand Motion (good light projection); contralateral eye: 20/40
*   **Ocular Examination (OS):** Anterior chamber is deep. Slit-lamp biomicroscopy of the lens reveals a completely white, opaque lens. The lens cortex has completely liquefied into a milky white fluid. The dense, brown, sclerotic lens nucleus is clearly visible, having subsided and sunk to the bottom of the capsular bag. The anterior lens capsule appears wrinkled and thickened. There is no active inflammation or elevated IOP today.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 82-year-old female from an underserved rural community presents with profound, painless vision loss in her left eye. She reports that the eye has been virtually blind for over 2 years, but she did not seek treatment due to lack of local services and fear of surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 68 bpm | BP: 130/76 mmHg
*   **Visual Acuity:** OS: Hand Motion (good light projection); contralateral eye: 20/40
*   **Ocular Examination (OS):** Anterior chamber is deep. Slit-lamp biomicroscopy of the lens reveals a completely white, opaque lens. The lens cortex has completely liquefied into a milky white fluid. The dense, brown, sclerotic lens nucleus is clearly visible, having subsided and sunk to the bottom of the capsular bag. The anterior lens capsule appears wrinkled and thickened. There is no active inflammation or elevated IOP today.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis for this specific type of hypermature cataract?', '["Phacolytic cataract", "Morgagnian cataract", "Cortical cataract", "Nuclear sclerotic cataract", "Posterior subcapsular cataract"]'::jsonb, 1, 'This is a **Morgagnian cataract**, which is a specific form of **hypermature cataract**. In this advanced stage, the lens cortex undergoes enzymatic degeneration and **completely liquefies into a milky fluid**. Lacking support, the dense, dehydrated, **sclerotic nucleus sinks** to the bottom of the capsular bag under the influence of gravity.'),
    (v_case_id, 'Which of the following represents a serious, potentially blinding ocular emergency associated with hypermature cataracts?', '["Phacoanaphylactic endophthalmitis, a direct autoimmune response to a ruptured lens capsule", "Neovascular glaucoma driven by chronic lens ischemia", "Phacolytic glaucoma, caused by the leakage of high-molecular-weight lens proteins through the intact capsule", "Acute primary angle-closure glaucoma due to pupillary block", "Tractional retinal detachment due to vitreal-capsular bands"]'::jsonb, 2, 'Hypermature cataracts carry a high risk of **phacolytic glaucoma**. As the cortex liquefies, **high-molecular-weight lens proteins leak** through microscopic pores in the degenerating, wrinkled anterior lens capsule. Macrophages migrate to engulf these foreign proteins. Both the proteins and protein-laden macrophages physically clog the trabecular meshwork, causing a rapid, severe rise in IOP in a deep-chambered, quiet eye.'),
    (v_case_id, 'What is the primary surgical challenge encountered during the extraction of a Morgagnian cataract?', '["Finding a specialized IOL designed to fit in a liquefied capsule", "Creating a continuous curvilinear capsulorhexis in a highly pressurized capsular bag with poor visualization of the capsule", "Fragility of the corneal epithelium under standard ultrasound energy", "An increased risk of severe retrobulbar hemorrhage during anesthesia", "Severe intraoperative miosis that does not respond to epinephrine"]'::jsonb, 1, 'The primary surgical challenge is **creating a safe capsulorhexis**. The liquefied cortex creates a **highly pressurized capsular bag**. When the needle or forceps punctures the anterior capsule, the pressurized milky fluid immediately escapes, obscuring visualization and causing the capsular tear to rapidly run out to the equator (the **''Argentinian flag sign''**). A trypan blue dye stain and venting of the liquid cortex are required to safely complete the capsulorhexis.');

    ---------------------------------------------------------------------------
    -- CASE 07: The Superotemporal Subluxation (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Superotemporal Subluxation (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Superotemporal Subluxation (V1)', 'A 14-year-old tall, thin male with a history of joint hypermobility, mild scoliosis, and a pectus excavatum deformity presents for a comprehensive ophthalmic evaluation. He complains of fluctuating, blurry vision in both eyes that has worsened over the past 4 years. He reports seeing double with either eye individually (monocular diplopia) at times.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 65 bpm | BP: 110/70 mmHg
*   **Visual Acuity:** Bilateral 20/80 (uncorrected); pinhole corrects to 20/30
*   **Ocular Examination (OU):** The anterior chambers are deep. Slit-lamp biomicroscopy after pupillary dilation reveals bilateral, symmetrical displacement and **subluxation of the crystalline lenses in a superotemporal direction**. Stretched, intact ciliary zonular fibers are clearly visible in the lower-nasal pupillary aperture. Tremulousness of the iris (iridodonesis) is present upon rapid eye movements.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 14-year-old tall, thin male with a history of joint hypermobility, mild scoliosis, and a pectus excavatum deformity presents for a comprehensive ophthalmic evaluation. He complains of fluctuating, blurry vision in both eyes that has worsened over the past 4 years. He reports seeing double with either eye individually (monocular diplopia) at times.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 65 bpm | BP: 110/70 mmHg
*   **Visual Acuity:** Bilateral 20/80 (uncorrected); pinhole corrects to 20/30
*   **Ocular Examination (OU):** The anterior chambers are deep. Slit-lamp biomicroscopy after pupillary dilation reveals bilateral, symmetrical displacement and **subluxation of the crystalline lenses in a superotemporal direction**. Stretched, intact ciliary zonular fibers are clearly visible in the lower-nasal pupillary aperture. Tremulousness of the iris (iridodonesis) is present upon rapid eye movements.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely underlying diagnosis, and in what direction is the lens classically displaced?', '["Homocystinuria; inferonasal displacement of the lens", "Traumatic zonular dialysis; random displacement based on trauma force", "Weill-Marchesani syndrome; symmetrical inferior displacement", "Marfan syndrome; superotemporal displacement of the lens", "Sulfite oxidase deficiency; progressive nasal displacement"]'::jsonb, 3, 'This patient has **Marfan syndrome**, an autosomal dominant connective tissue disorder. The classic ocular manifestation is **ectopia lentis (lens subluxation)**, which occurs bilaterally and symmetrically in up to 80% of patients. In Marfan syndrome, the lens classically displaces in a **superotemporal direction**, with ciliary zonules remaining stretched but largely intact.'),
    (v_case_id, 'Which genetic mutation is responsible for the systemic and ocular manifestations of this patient''s syndrome?', '["FBN1 gene on chromosome 15, encoding fibrillin-1", "CBS gene on chromosome 21, encoding cystathionine beta-synthase", "TGFBR1 gene on chromosome 9, encoding transforming factor receptor", "COL1A1 gene on chromosome 17, encoding type I collagen", "ELN gene on chromosome 7, encoding elastin"]'::jsonb, 0, 'Marfan syndrome is caused by mutations in the **FBN1 gene on chromosome 15q21**, which encodes **fibrillin-1**, a major glycoprotein component of extracellular microfibrils. Fibrillin-1 is highly abundant in the **ciliary zonules** (the suspension cords of the lens), as well as the aortic media and skeletal system, explaining the classic multi-system clinical features.'),
    (v_case_id, 'Which clinical feature helps differentiate the ectopia lentis of Homocystinuria from that of Marfan Syndrome?', '["Homocystinuria is inherited in an autosomal dominant pattern with normal life expectancy", "In Homocystinuria, lens subluxation is classically inferonasal, the zonules are completely broken, and patients have intellectual disability and thromboembolic risk", "In Homocystinuria, the lens is displaced superotemporally and the zonules are completely intact", "In Homocystinuria, the lens never subluxates but undergoes rapid calcification", "In Homocystinuria, patients are extremely short in stature with stiff joints and small hands"]'::jsonb, 1, '**Homocystinuria** (an autosomal recessive metabolic disorder) is differentiated by: (1) **inferonasal displacement** of the lens, (2) **complete disintegration and breakdown of the ciliary zonules** (which are composed of cysteine-rich fibers damaged by homocysteine), and (3) systemic features like **intellectual disability, skeletal deformities, and a high risk of life-threatening thromboembolism**.');

    ---------------------------------------------------------------------------
    -- CASE 08: The 'Second Cataract' (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The ''Second Cataract'' (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The ''Second Cataract'' (V1)', 'A 72-year-old male presents complaining that the cataract in his right eye has ''grown back.'' He underwent highly successful, uncomplicated cataract extraction with intraocular lens (IOL) implantation in that eye 18 months ago, achieving 20/20 vision postoperatively. However, over the past 5 months, his vision has become progressively blurry and hazy, accompanied by significant glare when looking at bright lights.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 70 bpm | BP: 128/78 mmHg
*   **Visual Acuity:** OD: 20/60 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior chamber is quiet. A three-piece monofocal acrylic intraocular lens is perfectly centered within the capsular bag. However, the posterior capsule behind the IOL appears significantly thickened, hazy, and translucent, showing multiple small, vesicular, pearl-like vacuolated cells growing across the central visual axis (Elschnig''s pearls).', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 72-year-old male presents complaining that the cataract in his right eye has ''grown back.'' He underwent highly successful, uncomplicated cataract extraction with intraocular lens (IOL) implantation in that eye 18 months ago, achieving 20/20 vision postoperatively. However, over the past 5 months, his vision has become progressively blurry and hazy, accompanied by significant glare when looking at bright lights.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 70 bpm | BP: 128/78 mmHg
*   **Visual Acuity:** OD: 20/60 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior chamber is quiet. A three-piece monofocal acrylic intraocular lens is perfectly centered within the capsular bag. However, the posterior capsule behind the IOL appears significantly thickened, hazy, and translucent, showing multiple small, vesicular, pearl-like vacuolated cells growing across the central visual axis (Elschnig''s pearls).', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the gold-standard treatment?', '["Recurrent nuclear cataract; repeat surgical cataract extraction", "Posterior capsular opacification (PCO); Nd:YAG laser posterior capsulotomy", "Neovascularization of the posterior capsule; intravitreal anti-VEGF injection", "Cystoid macular edema; topical non-steroidal anti-inflammatory drops", "Corneal endothelial decompensation; Descemet''s stripping endothelial keratoplasty"]'::jsonb, 1, 'This is **Posterior Capsular Opacification (PCO)**, the most common late complication of modern cataract surgery (often called a **''second cataract''** by patients). The gold-standard treatment is an outpatient **Nd:YAG laser posterior capsulotomy**, which uses a specialized laser to safely create a small circular opening in the hazy posterior capsule, instantly restoring the clear optical path.'),
    (v_case_id, 'Which cellular mechanism is primarily responsible for the development of PCO?', '["Precipitation of systemic calcium salts onto the surface of the acrylic IOL", "Slow, localized vitreous degeneration and condensation behind the lens", "Infiltration of the subretinal space by corneal endothelial cells", "Deposition of chronic inflammatory cells and macrophages on the posterior lens capsule", "Proliferation, migration, and myofibroblastic transdifferentiation of residual lens epithelial cells on the capsular bag"]'::jsonb, 4, 'PCO is caused by the **proliferation, migration, and myofibroblastic transdifferentiation of residual lens epithelial cells (LECs)**. During cataract surgery, some LECs are left behind in the equatorial region of the capsular bag. Over time, these cells migrate across the posterior capsule, forming **Elschnig''s pearls** (vacuolated cells) or causing capsular wrinkling and fibrosis, which scatters light.'),
    (v_case_id, 'Which of the following is a potential, rare complication of the laser treatment used to manage PCO?', '["Rhegmatogenous retinal detachment and IOL damage/pitting", "Corneal endothelial cell loss and corneal melting", "Acute, synechial angle-closure glaucoma", "Neovascularization of the anterior chamber angle", "Ischemia and atrophy of the optic nerve head"]'::jsonb, 0, 'While Nd:YAG laser capsulotomy is highly safe, rare complications include: (1) **rhegmatogenous retinal detachment** (due to shockwaves transmitted to the vitreous cavity, especially in high myopes), (2) **transient intraocular pressure spikes**, (3) **IOL damage or pitting** if the laser is misfocused, and (4) **cystoid macular edema** (Irvine-Gass syndrome).');

    ---------------------------------------------------------------------------
    -- CASE 09: The Billowing Iris (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Billowing Iris (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Billowing Iris (V1)', 'A 73-year-old male with a history of benign prostatic hyperplasia (BPH) presenting with a progressive nuclear sclerotic cataract is scheduled for routine phacoemulsification. During his preoperative assessment, the surgeon reviews his current medications, which include tamsulosin 0.4 mg daily. Preoperative pupil dilation is achieved but appears slightly sluggish.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 68 bpm | BP: 130/82 mmHg
*   **Ocular Examination (OU):** The anterior segments are quiet. Deep anterior chambers. Gonioscopy shows open angles (Grade 4). Lenses show 3+ nuclear sclerosis bilaterally. Retinal examination is normal. During the initial steps of cataract surgery, immediately after making the corneal incision, the iris appears highly flaccid, billows in response to irrigation fluid, and repeatedly prolapses towards the surgical wound. The pupil, which was 7.5 mm, progressively constricts to 4.0 mm despite standard epinephrine in the irrigating bottle.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 73-year-old male with a history of benign prostatic hyperplasia (BPH) presenting with a progressive nuclear sclerotic cataract is scheduled for routine phacoemulsification. During his preoperative assessment, the surgeon reviews his current medications, which include tamsulosin 0.4 mg daily. Preoperative pupil dilation is achieved but appears slightly sluggish.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 68 bpm | BP: 130/82 mmHg
*   **Ocular Examination (OU):** The anterior segments are quiet. Deep anterior chambers. Gonioscopy shows open angles (Grade 4). Lenses show 3+ nuclear sclerosis bilaterally. Retinal examination is normal. During the initial steps of cataract surgery, immediately after making the corneal incision, the iris appears highly flaccid, billows in response to irrigation fluid, and repeatedly prolapses towards the surgical wound. The pupil, which was 7.5 mm, progressively constricts to 4.0 mm despite standard epinephrine in the irrigating bottle.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis, and which class of medications is responsible for this condition?', '["Pigment dispersion syndrome; systemic beta-blockers", "Uveitic pupillary block; chronic topical corticosteroid use", "Congenital iris hypoplasia; systemic anticholinergic therapy", "Pseudoexfoliative iridopathy; calcium channel blockers", "Intraoperative Floppy Iris Syndrome (IFIS); alpha-1A adrenergic receptor antagonists (e.g., tamsulosin)"]'::jsonb, 4, 'This is **Intraoperative Floppy Iris Syndrome (IFIS)**. It is caused by **alpha-1A adrenergic receptor antagonists**, most notably **tamsulosin (Flomax)**, which is widely prescribed for benign prostatic hyperplasia (BPH). The drug blocks the alpha-1A receptors in the iris dilator muscle, leading to muscle flaccidity, billowing, and intraoperative miosis.'),
    (v_case_id, 'What is the classic triad of signs that defines Intraoperative Floppy Iris Syndrome?', '["Posterior synechiae, keratic precipitates, and cystoid macular edema", "Wrinkled anterior lens capsule, Elschnig''s pearls, and zonular dialysis", "Flaccid iris stroma that billows with fluid currents, progressive intraoperative miosis, and a propensity for the iris to prolapse through corneal incisions", "Heavily pigmented trabecular meshwork, Krukenberg spindle, and mid-peripheral spoke-like iris defects", "Shallow anterior chamber, rock-hard globe, and steamy corneal edema"]'::jsonb, 2, 'The **classic triad of IFIS** consists of: (1) **a flaccid iris stroma** that billows and waves in response to normal intraoperative irrigation fluid currents, (2) **progressive intraoperative pupillary constriction (miosis)**, and (3) **a strong propensity for the iris tissue to prolapse** and escape through the corneal incisions.'),
    (v_case_id, 'Which of the following is the most appropriate management strategy for a patient with known IFIS undergoing cataract surgery?', '["Increasing the ultrasound phacoemulsification power to rapidly emulsify the lens", "Stopping tamsulosin 24 hours prior to surgery to fully reverse the iris muscle atrophy", "Postponing the surgery and switching the patient to oral finasteride for 5 years", "Using pupil expansion rings (e.g. Malyugin ring), iris hooks, or intraoperative intracameral phenylephrine/epinephrine", "Performing an immediate surgical peripheral iridectomy before removing the cataract"]'::jsonb, 3, 'Management of IFIS includes **pupil expansion rings (e.g. Malyugin ring)**, iris hooks, cohesive viscoelastics, or **intraoperative intracameral injection of alpha-agonists (phenylephrine or epinephrine)**. Stopping tamsulosin is generally **unsuccessful at reversing the syndrome**, as the drug causes long-lasting or permanent structural changes/atrophy of the iris dilator muscle; thus, the surgeon must prepare for IFIS even if the patient stopped the drug months ago.');

    ---------------------------------------------------------------------------
    -- CASE 10: The Tremulous Lens (V1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tremulous Lens (V1)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tremulous Lens (V1)', 'A 24-year-old male presents with fluctuating, blurry vision and double vision in his left eye.  He reports that he was struck in that eye by the fist of an assailant during a physical altercation 2 weeks ago.  He notes that when he moves his eye quickly, his vision seems to ''wobble'' and shake.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 74 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/120 (pinholes to 20/40); contralateral eye: 20/20
*   **Ocular Examination (OS):** The cornea is clear. Slit-lamp biomicroscopy reveals a highly **tremulous iris (iridodonesis)** and a **tremulous lens (phacodonesis)** upon eye movement. With a dilated pupil, the lens is seen to be subluxated inferiorly, exposing a 120-degree sector of **torn ciliary zonules (zonular dialysis)** superiorly. A small amount of vitreous gel is visible prolapsing into the anterior chamber around the superior edge of the lens. The intraocular pressure is 18 mmHg.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old male presents with fluctuating, blurry vision and double vision in his left eye.  He reports that he was struck in that eye by the fist of an assailant during a physical altercation 2 weeks ago.  He notes that when he moves his eye quickly, his vision seems to ''wobble'' and shake.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 74 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/120 (pinholes to 20/40); contralateral eye: 20/20
*   **Ocular Examination (OS):** The cornea is clear. Slit-lamp biomicroscopy reveals a highly **tremulous iris (iridodonesis)** and a **tremulous lens (phacodonesis)** upon eye movement. With a dilated pupil, the lens is seen to be subluxated inferiorly, exposing a 120-degree sector of **torn ciliary zonules (zonular dialysis)** superiorly. A small amount of vitreous gel is visible prolapsing into the anterior chamber around the superior edge of the lens. The intraocular pressure is 18 mmHg.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis, and what do the terms ''iridodonesis'' and ''phacodonesis'' represent?', '["Lens subluxation with traumatic zonular dialysis; iridodonesis is trembling of the iris, phacodonesis is trembling of the lens", "Pseudoexfoliation syndrome; iridodonesis is iris atrophy, phacodonesis is lens displacement", "Acute angle-closure glaucoma; iridodonesis is fixed pupil, phacodonesis is lens swelling", "Anterior uveitis; iridodonesis is inflammatory cells, phacodonesis is lens proteins", "Pigmentary glaucoma; iridodonesis is iris transillumination, phacodonesis is pigment in the lens"]'::jsonb, 0, 'This patient has **lens subluxation with traumatic zonular dialysis**. **Iridodonesis** (tremble of the iris) and **phacodonesis** (tremble of the lens) are classic signs of zonular weakness or tearing. When the eye moves, the iris and lens lack proper structural support and oscillate/wobble, which is highly diagnostic of ciliary zonular damage.'),
    (v_case_id, 'What is the primary surgical device used during cataract extraction to support the remaining capsular bag in a patient with moderate zonular dialysis?', '["Scleral-fixated iris hook", "Nd:YAG laser capsulotome", "Malyugin Pupil Expansion Ring", "Capsular Tension Ring (CTR)", "Ahmed Glaucoma Valve"]'::jsonb, 3, 'For moderate zonular dialysis (<120-180 degrees), a **Capsular Tension Ring (CTR)** is inserted into the capsular bag. The CTR is a flexible PMMA ring that distributes the mechanical forces of the remaining intact zonules to the weakened areas, stabilizing the capsular bag, preventing vitreous prolapse, and allowing the safe implantation of a standard IOL.'),
    (v_case_id, 'Which of the following is the most appropriate surgical management for a patient with severe, progressive lens subluxation (>180 degrees of zonular dialysis) and vitreous in the anterior chamber?', '["Pressure patching the eye and scheduling a follow-up in 6 months", "Pars plana lensectomy and anterior vitrectomy, followed by implantation of a scleral-fixated or iris-claw IOL", "Surgical trabeculectomy with mitomycin C while leaving the subluxated lens in place", "Standard phacoemulsification with a standard CTR and standard bag-IOL placement", "Bilateral laser peripheral iridotomy and lifelong topical beta-blockers"]'::jsonb, 1, 'In cases of **severe lens subluxation (>180 degrees of zonular dialysis)** or when the lens is extremely unstable and vitreous is in the anterior chamber, standard phacoemulsification within the bag is highly dangerous. The recommended approach is a **lensectomy (often via pars plana) combined with an anterior vitrectomy** (to clear the prolapsed vitreous), followed by placement of a **scleral-fixated intraocular lens** (e.g. Yamane technique) or an **iris-claw/anterior chamber IOL**.');

    ---------------------------------------------------------------------------
    -- CASE 11: The Myopic Shift of Age - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Myopic Shift of Age - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Myopic Shift of Age - Clinical Presentation (V2)', 'A 76-year-old male presents with slowly progressive, painless blurring of vision in both eyes over the past 5 years. He reports having difficulty reading distance street signs and highway markers. Interestingly, he notes a surprising improvement in his near vision, allowing his to read the newspaper without reading glasses for the first time in a decade.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 83 bpm | BP: 138/82 mmHg
*   **Visual Acuity:** OS: 20/70 (no improvement with pinhole); contralateral eye: 20/25
*   **Ocular Examination (OS):** The anterior chamber is deep and quiet. Slit-lamp biomicroscopy of the lens reveals significant yellow-to-amber discoloration and moderate compaction of the lens nucleus. The contralateral lens shows similar but milder changes. Dilated fundus exam reveals normal optic discs with a cup-to-disc ratio of 0.3 OU, and a normal macula.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 76-year-old male presents with slowly progressive, painless blurring of vision in both eyes over the past 5 years. He reports having difficulty reading distance street signs and highway markers. Interestingly, he notes a surprising improvement in his near vision, allowing his to read the newspaper without reading glasses for the first time in a decade.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 83 bpm | BP: 138/82 mmHg
*   **Visual Acuity:** OS: 20/70 (no improvement with pinhole); contralateral eye: 20/25
*   **Ocular Examination (OS):** The anterior chamber is deep and quiet. Slit-lamp biomicroscopy of the lens reveals significant yellow-to-amber discoloration and moderate compaction of the lens nucleus. The contralateral lens shows similar but milder changes. Dilated fundus exam reveals normal optic discs with a cup-to-disc ratio of 0.3 OU, and a normal macula.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following represents the primary mechanism behind the patient''s temporary improvement in near vision?', '["Spontaneous flattening of the cornea leading to decreased hyperopic refractive error", "Upregulation of ciliary muscle contractility compensating for presbyopia", "Resolution of underlying subclinical macular edema", "Increased refractive power of the lens due to increased density and nuclear compaction, causing a myopic shift", "Regeneration of accommodation capacity in the crystalline lens fibers"]'::jsonb, 3, 'This patient has a **nuclear sclerotic cataract**, which characteristically causes a **myopic shift** (often referred to as **''second sight''**). The gradual compaction and sclerosis of the lens nucleus increase its refractive index, shifting the patient''s focal point closer. This allows presbyopic patients to temporarily read near print without reading glasses, though at the expense of distance vision.'),
    (v_case_id, 'Which of the following is the primary biochemical change associated with the development of nuclear sclerotic cataracts?', '["Aggregation and insolubilization of lens crystallin proteins, along with accumulation of urochrome pigment", "Autoimmune degradation of the lens capsule matrix", "Deposition of systemic calcium salts within the lens stroma", "Hydration of lens cortical fibers due to osmotic swelling", "Proliferation of anterior lens epithelial cells on the capsular bag"]'::jsonb, 0, 'Nuclear sclerotic cataracts are characterized by **aggregation and insolubilization of lens crystallin proteins**, along with the **accumulation of urochrome pigment** (which causes the yellow/brown coloration). This pigment filters out blue light and contributes to decreased color perception and contrast sensitivity.'),
    (v_case_id, 'Which of the following is the most appropriate next step in the management of this patient?', '["Cataract extraction and intraocular lens (IOL) implantation if the vision impairment interferes with activities of daily living", "Prescribing daily topical non-steroidal anti-inflammatory drops to halt cataract progression", "Initiation of systemic high-dose vitamin A and lutein supplementation", "Performing urgent surgical trabeculectomy to prevent secondary glaucoma", "Immediate referral for YAG laser capsulotomy to clear the visual axis"]'::jsonb, 0, 'The definitive treatment for cataracts is **cataract extraction and intraocular lens (IOL) implantation**. The indication for surgery is functional visual impairment that interferes with the patient''s activities of daily living (e.g. driving, reading). There are no approved pharmacologic agents to halt or reverse cataract formation.');

    ---------------------------------------------------------------------------
    -- CASE 12: The Glare of Headlights - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Glare of Headlights - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Glare of Headlights - Clinical Presentation (V2)', 'A 74-year-old male presents complaining of progressive difficulty driving at night. He reports experiencing debilitating glare and starbursts from the headlights of oncoming cars, which makes night driving extremely stressful. His distance vision has also become progressively blurry over the past 3 years.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 84 bpm | BP: 129/81 mmHg
*   **Visual Acuity:** OS: 20/50 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OS):** Slit-lamp biomicroscopy reveals white, wedge-shaped opacities extending from the peripheral lens cortex towards the center in a spoke-like pattern, particularly in the nasal and inferior quadrants. The lens nucleus is relatively clear. Fundus examination is normal with clear visualization of the retina.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 74-year-old male presents complaining of progressive difficulty driving at night. He reports experiencing debilitating glare and starbursts from the headlights of oncoming cars, which makes night driving extremely stressful. His distance vision has also become progressively blurry over the past 3 years.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 84 bpm | BP: 129/81 mmHg
*   **Visual Acuity:** OS: 20/50 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OS):** Slit-lamp biomicroscopy reveals white, wedge-shaped opacities extending from the peripheral lens cortex towards the center in a spoke-like pattern, particularly in the nasal and inferior quadrants. The lens nucleus is relatively clear. Fundus examination is normal with clear visualization of the retina.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following slit-lamp findings is most pathognomonic for a cortical cataract?', '["A granular, plaque-like opacity in the central posterior subcapsular area", "Multiple small, hyper-pigmented spots on the anterior lens capsule", "Golden-brown discoloration of the central lens nucleus", "A subluxated lens showing stretched zonular fibers", "Wedge-shaped, spoke-like opacities starting in the peripheral cortex"]'::jsonb, 4, '**Cortical cataracts** classically present as **wedge-shaped, spoke-like opacities** that start in the peripheral cortex and progress toward the center of the lens. They are best visualized with retroillumination, where they appear as dark silhouettes against the red reflex.'),
    (v_case_id, 'What is the primary underlying pathophysiological process driving cortical cataract formation?', '["Direct chemical oxidation of central nuclear crystallins by free radicals", "Primary loss of ciliary body perfusion leading to lens ischemia", "Proliferation and migration of equatorial lens epithelial cells to the posterior pole", "Deposition of blood-derived lipids in the peripheral lens stroma", "Hydration and swelling of lens cortical fibers, leading to vacuole formation and clefting along suture lines"]'::jsonb, 4, 'Cortical cataracts are driven by **hydration and swelling of lens cortical fibers**. This occurs due to disruption of the lens cell membrane integrity and the activity of the Na+/K+ ATPase pump. Water enters the lens, causing vacuole formation and subsequent **clefting along the natural lens suture lines**, presenting as the classic cortical spokes.'),
    (v_case_id, 'Which visual symptom is most specifically associated with cortical cataracts compared to nuclear sclerotic cataracts?', '["Surprising improvement in near vision (second sight)", "Fluctuating visual acuity related to systemic blood glucose levels", "Severe, throbbing ocular pain and redness", "A central gray scotoma with distorted lines", "Severe glare, starbursts, and monocular diplopia due to irregular light scattering"]'::jsonb, 4, 'Cortical cataracts are highly associated with **significant glare, starbursts, and halos** (especially at night from headlights) due to the irregular refraction and scattering of light as it passes through the peripheral cortical opacities. They can also cause **monocular diplopia** or polyopia due to the split-refractive properties of the hydrated lens clefts.');

    ---------------------------------------------------------------------------
    -- CASE 13: The Steroid-Induced Plaque - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Steroid-Induced Plaque - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Steroid-Induced Plaque - Clinical Presentation (V2)', 'A 55-year-old female with a history of severe asthma requiring frequent courses of systemic corticosteroids and daily inhaled fluticasone presents with a rapid, painless decrease in vision in her left eye over the past 3 months. She reports that her near vision is particularly severely affected, making it nearly impossible to read books or look at her phone.  She also complains of disabling glare in bright sunlight.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 75 bpm | BP: 138/79 mmHg
*   **Visual Acuity:** OS: 20/100 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OS):** Anterior chamber is deep and quiet. Slit-lamp exam of the lens reveals a dense, granular, plaque-like opacity located on the posterior surface of the lens, directly in the visual axis. The lens nucleus and cortex are clear. The intraocular pressure is 15 mmHg OU. Dilated fundus examination is normal.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old female with a history of severe asthma requiring frequent courses of systemic corticosteroids and daily inhaled fluticasone presents with a rapid, painless decrease in vision in her left eye over the past 3 months. She reports that her near vision is particularly severely affected, making it nearly impossible to read books or look at her phone.  She also complains of disabling glare in bright sunlight.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 75 bpm | BP: 138/79 mmHg
*   **Visual Acuity:** OS: 20/100 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OS):** Anterior chamber is deep and quiet. Slit-lamp exam of the lens reveals a dense, granular, plaque-like opacity located on the posterior surface of the lens, directly in the visual axis. The lens nucleus and cortex are clear. The intraocular pressure is 15 mmHg OU. Dilated fundus examination is normal.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Posterior subcapsular cataract (PSC)", "Nuclear sclerotic cataract", "Posterior capsular opacification (PCO)", "Cortical cataract", "Traumatic cataract"]'::jsonb, 0, 'This patient has a **Posterior Subcapsular Cataract (PSC)**. Key features include the **plaque-like, granular opacity** on the posterior surface of the lens, a history of **corticosteroid use**, a **relatively young age**, and **disproportionately severe loss of near vision** and glare in bright conditions because the opacity is located directly in the nodal point of the eye.'),
    (v_case_id, 'What is the cellular origin of a posterior subcapsular cataract?', '["Abnormal migration and swelling of lens epithelial cells from the equator to the posterior pole, forming Wedl (bladder) cells", "Proliferation of iris pigment epithelial cells onto the anterior lens capsule", "Deposition of macrophages that have engulfed leaked lens proteins", "Myofibroblastic transdifferentiation of keratocytes in the corneal stroma", "Necrosis of the central lens fiber cells due to chronic ischemia"]'::jsonb, 0, 'PSCs arise from the **abnormal migration and swelling of lens epithelial cells**. Normally, lens epithelial cells are located on the anterior surface and migrate to the equator to differentiate into lens fibers. In PSC, these cells aberrantly migrate posteriorly to the posterior pole, where they swell and become large, nucleated, vacuolated cells known as **Wedl cells** or **bladder cells**, forming the posterior plaque.'),
    (v_case_id, 'Why does a posterior subcapsular cataract affect near vision more severely than distance vision?', '["Accommodative pupillary constriction (miosis) focuses light directly through the central posterior opacity", "The lens becomes extremely rigid and prevents accommodation completely", "Near vision requires a wider pupil, which exposes the peripheral cortical clefts", "The posterior capsule is physically connected to the ciliary zonules", "Corticosteroids selectively damage the macular photoreceptors responsible for near vision"]'::jsonb, 0, 'PSC affects **near vision more severely** because during near vision, the accommodation reflex triggers **pupillary constriction (miosis)**. This constricts the light path, forcing light to pass directly through the **small, central, posterior subcapsular plaque** located at the nodal point of the eye. In contrast, in dimmer light or distance vision, a slightly wider pupil allows light to pass around the central opacity, resulting in better distance acuity.');

    ---------------------------------------------------------------------------
    -- CASE 14: The Absent Red Reflex - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Absent Red Reflex - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Absent Red Reflex - Clinical Presentation (V2)', 'A 1-month-old infant is brought to the pediatric ophthalmology clinic by his parents who noticed an abnormal white appearance in the baby''s left pupil on a family photograph. The mother notes the baby does not seem to track toys or look at his face as well when the right eye is covered.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Central, steady, and maintained in the right eye; poor fixation and tracking in the left eye.
*   **Ocular Examination:** The right eye shows a normal, bright red reflex. The left eye has an absent red reflex, replaced by a dense, white, homogeneous opacity in the center of the pupil (leukocoria). Handheld slit-lamp exam reveals a dense, central nuclear lens opacity. The cornea is clear and corneal diameters are symmetric. No signs of intraocular inflammation or retinoblastoma are noted on B-scan ultrasound.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 1-month-old infant is brought to the pediatric ophthalmology clinic by his parents who noticed an abnormal white appearance in the baby''s left pupil on a family photograph. The mother notes the baby does not seem to track toys or look at his face as well when the right eye is covered.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Central, steady, and maintained in the right eye; poor fixation and tracking in the left eye.
*   **Ocular Examination:** The right eye shows a normal, bright red reflex. The left eye has an absent red reflex, replaced by a dense, white, homogeneous opacity in the center of the pupil (leukocoria). Handheld slit-lamp exam reveals a dense, central nuclear lens opacity. The cornea is clear and corneal diameters are symmetric. No signs of intraocular inflammation or retinoblastoma are noted on B-scan ultrasound.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most critical management priority for a dense, unilateral congenital cataract?', '["Immediate systemic antiviral therapy for suspected congenital CMV", "Watchful waiting and visual stimulation therapy until the child is at least 5 years old", "Urgent surgical cataract extraction within the first 6 to 8 weeks of life to prevent irreversible deprivation amblyopia", "Initiation of daily topical corticosteroid drops to clear the lens opacity", "Fitting with custom glasses and scheduling surgery at school age"]'::jsonb, 2, 'A dense, unilateral congenital cataract is a **visual emergency**. It must be treated with **urgent surgical extraction (lensectomy) within the first 6 to 8 weeks of life**. Delaying surgery beyond the critical period of visual development leads to permanent, irreversible **deprivation amblyopia**, as the visual cortex fails to develop proper synaptic connections with the affected eye.'),
    (v_case_id, 'Which congenital infection is most classically associated with congenital cataracts, microphthalmia, and sensorineural hearing loss?', '["Congenital Herpes Simplex Virus", "Congenital Cytomegalovirus", "Congenital Rubella Syndrome", "Congenital Toxoplasmosis", "Congenital Syphilis"]'::jsonb, 2, '**Congenital Rubella Syndrome** is classically associated with the triad of **cataracts** (often bilateral), **microphthalmia/pigmentary retinopathy**, **sensorineural hearing loss**, and **cardiac defects** (patent ductus arteriosus). The rubella virus directly infects the developing lens vesicle in utero before the capsule forms, leading to chronic replication within the lens fibers.'),
    (v_case_id, 'Following congenital cataract surgery in an infant, what is the primary method of visual rehabilitation to prevent amblyopia?', '["Fitting with a high-power contact lens (aphakic contact lens) and patching the contralateral eye (occlusion therapy)", "There is no effective visual rehabilitation method for aphakic infants", "Prescribing standard bifocal glasses and hoping the eyes self-correct", "Performing daily laser therapy to stimulate the macula", "Implantation of a standard adult monofocal intraocular lens without patching"]'::jsonb, 0, 'Visual rehabilitation in an aphakic infant is crucial. Because the infant''s eye is small and rapidly growing, primary IOL implantation is highly challenging and risky. Therefore, infants are rehabilitated with a **high-power aphakic contact lens** (or aphakic glasses for bilateral cases) to correct the severe refractive error, combined with **occlusion therapy (patching of the normal eye)** to force the brain to use the surgical eye and prevent amblyopia.');

    ---------------------------------------------------------------------------
    -- CASE 15: The Blunt Rosette - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blunt Rosette - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blunt Rosette - Clinical Presentation (V2)', 'A 25-year-old male presents with a 3-month history of progressive visual blur in his right eye. Upon questioning, he recalls being struck in that eye by a tennis ball during a match approximately 8 months ago. He experienced temporary pain and bruising but did not seek medical attention at the time.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 80 bpm | BP: 127/78 mmHg
*   **Visual Acuity:** OD: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior chamber is deep and quiet. Gonioscopy shows 15% angle recession inferiorly. Slit-lamp exam of the lens reveals a classic rosette-shaped or star-shaped cortical opacity located in the posterior subcapsular region. The ciliary zonules appear intact, and there is no lens subluxation or phacodonesis. The intraocular pressure is 14 mmHg OU.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old male presents with a 3-month history of progressive visual blur in his right eye. Upon questioning, he recalls being struck in that eye by a tennis ball during a match approximately 8 months ago. He experienced temporary pain and bruising but did not seek medical attention at the time.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 80 bpm | BP: 127/78 mmHg
*   **Visual Acuity:** OD: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior chamber is deep and quiet. Gonioscopy shows 15% angle recession inferiorly. Slit-lamp exam of the lens reveals a classic rosette-shaped or star-shaped cortical opacity located in the posterior subcapsular region. The ciliary zonules appear intact, and there is no lens subluxation or phacodonesis. The intraocular pressure is 14 mmHg OU.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which classic morphology is most characteristic of a cataract caused by blunt, non-penetrating ocular trauma?', '["Amber-colored central oil-droplet opacity", "Rosette-shaped or stellate-shaped cortical opacity", "Wedge-shaped, spoke-like peripheral clefts", "White, flaky, dandruff-like deposits on the anterior capsule", "Dense, golden-brown nuclear compaction"]'::jsonb, 1, 'Blunt, non-penetrating ocular trauma characteristically causes a **rosette-shaped or stellate-shaped cortical opacity**, typically located in the posterior or anterior subcapsular cortex. The concussive wave transmission through the eye disrupts the lens fibers, leading to fluid accumulation along the suture lines in this unique flower-like pattern.'),
    (v_case_id, 'What is the primary pathophysiology behind traumatic cataract formation after blunt trauma?', '["Disruption of the lens capsule or ciliary zonules, allowing aqueous humor to enter and hydrate the lens fibers", "Secondary calcification of the posterior lens capsule due to intraocular hemorrhage", "Direct chemical necrosis of lens crystallins by inflammatory cytokines", "A chronic, low-grade bacterial infection of the lens cortex", "Localized ischemia of the ciliary body processes that supply the lens"]'::jsonb, 0, 'Blunt trauma causes **micro-ruptures or increased permeability of the lens capsule** (or direct injury to the subcapsular lens fibers). This allows **aqueous humor to enter and hydrate the lens fibers**, leading to localized opacification and swelling. Over time, this focal hydration spreads, often resulting in a mature, completely opaque cataract.'),
    (v_case_id, 'What other clinical finding must be ruled out in a patient with a traumatic cataract before planning surgery?', '["An underlying mutation in the fibrillin-1 gene", "A contralateral optic nerve Drance hemorrhage", "Zonular dialysis, angle recession, and secondary glaucoma", "Pseudoexfoliative deposits on the corneal endothelium", "Congenital dacryostenosis and tear duct block"]'::jsonb, 2, 'Prior blunt trauma carries a high risk of **zonular dialysis** (weakness/tearing of the lens support cords), **angle recession** (tearing of the iris insertion, which can lead to late secondary glaucoma), and **vitreous prolapse**. The surgeon must carefully evaluate for iris and lens tremulousness (iridodonesis/phacodonesis) and angle structure, as zonular weakness significantly complicates cataract surgery.');

    ---------------------------------------------------------------------------
    -- CASE 16: The Liquefied Cortex - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Liquefied Cortex - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Liquefied Cortex - Clinical Presentation (V2)', 'A 89-year-old female from an underserved rural community presents with profound, painless vision loss in her right eye. She reports that the eye has been virtually blind for over 5 years, but she did not seek treatment due to lack of local services and fear of surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 71 bpm | BP: 124/79 mmHg
*   **Visual Acuity:** OD: Hand Motion (good light projection); contralateral eye: 20/40
*   **Ocular Examination (OD):** Anterior chamber is deep. Slit-lamp biomicroscopy of the lens reveals a completely white, opaque lens. The lens cortex has completely liquefied into a milky white fluid. The dense, brown, sclerotic lens nucleus is clearly visible, having subsided and sunk to the bottom of the capsular bag. The anterior lens capsule appears wrinkled and thickened. There is no active inflammation or elevated IOP today.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 89-year-old female from an underserved rural community presents with profound, painless vision loss in her right eye. She reports that the eye has been virtually blind for over 5 years, but she did not seek treatment due to lack of local services and fear of surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 71 bpm | BP: 124/79 mmHg
*   **Visual Acuity:** OD: Hand Motion (good light projection); contralateral eye: 20/40
*   **Ocular Examination (OD):** Anterior chamber is deep. Slit-lamp biomicroscopy of the lens reveals a completely white, opaque lens. The lens cortex has completely liquefied into a milky white fluid. The dense, brown, sclerotic lens nucleus is clearly visible, having subsided and sunk to the bottom of the capsular bag. The anterior lens capsule appears wrinkled and thickened. There is no active inflammation or elevated IOP today.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis for this specific type of hypermature cataract?', '["Phacolytic cataract", "Morgagnian cataract", "Nuclear sclerotic cataract", "Posterior subcapsular cataract", "Cortical cataract"]'::jsonb, 1, 'This is a **Morgagnian cataract**, which is a specific form of **hypermature cataract**. In this advanced stage, the lens cortex undergoes enzymatic degeneration and **completely liquefies into a milky fluid**. Lacking support, the dense, dehydrated, **sclerotic nucleus sinks** to the bottom of the capsular bag under the influence of gravity.'),
    (v_case_id, 'Which of the following represents a serious, potentially blinding ocular emergency associated with hypermature cataracts?', '["Phacoanaphylactic endophthalmitis, a direct autoimmune response to a ruptured lens capsule", "Neovascular glaucoma driven by chronic lens ischemia", "Tractional retinal detachment due to vitreal-capsular bands", "Phacolytic glaucoma, caused by the leakage of high-molecular-weight lens proteins through the intact capsule", "Acute primary angle-closure glaucoma due to pupillary block"]'::jsonb, 3, 'Hypermature cataracts carry a high risk of **phacolytic glaucoma**. As the cortex liquefies, **high-molecular-weight lens proteins leak** through microscopic pores in the degenerating, wrinkled anterior lens capsule. Macrophages migrate to engulf these foreign proteins. Both the proteins and protein-laden macrophages physically clog the trabecular meshwork, causing a rapid, severe rise in IOP in a deep-chambered, quiet eye.'),
    (v_case_id, 'What is the primary surgical challenge encountered during the extraction of a Morgagnian cataract?', '["Finding a specialized IOL designed to fit in a liquefied capsule", "Fragility of the corneal epithelium under standard ultrasound energy", "Creating a continuous curvilinear capsulorhexis in a highly pressurized capsular bag with poor visualization of the capsule", "Severe intraoperative miosis that does not respond to epinephrine", "An increased risk of severe retrobulbar hemorrhage during anesthesia"]'::jsonb, 2, 'The primary surgical challenge is **creating a safe capsulorhexis**. The liquefied cortex creates a **highly pressurized capsular bag**. When the needle or forceps punctures the anterior capsule, the pressurized milky fluid immediately escapes, obscuring visualization and causing the capsular tear to rapidly run out to the equator (the **''Argentinian flag sign''**). A trypan blue dye stain and venting of the liquid cortex are required to safely complete the capsulorhexis.');

    ---------------------------------------------------------------------------
    -- CASE 17: The Superotemporal Subluxation - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Superotemporal Subluxation - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Superotemporal Subluxation - Clinical Presentation (V2)', 'A 15-year-old tall, thin female with a history of joint hypermobility, mild scoliosis, and a pectus excavatum deformity presents for a comprehensive ophthalmic evaluation. She complains of fluctuating, blurry vision in both eyes that has worsened over the past 5 years. She reports seeing double with either eye individually (monocular diplopia) at times.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 65 bpm | BP: 110/70 mmHg
*   **Visual Acuity:** Bilateral 20/80 (uncorrected); pinhole corrects to 20/30
*   **Ocular Examination (OU):** The anterior chambers are deep. Slit-lamp biomicroscopy after pupillary dilation reveals bilateral, symmetrical displacement and **subluxation of the crystalline lenses in a superotemporal direction**. Stretched, intact ciliary zonular fibers are clearly visible in the lower-nasal pupillary aperture. Tremulousness of the iris (iridodonesis) is present upon rapid eye movements.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 15-year-old tall, thin female with a history of joint hypermobility, mild scoliosis, and a pectus excavatum deformity presents for a comprehensive ophthalmic evaluation. She complains of fluctuating, blurry vision in both eyes that has worsened over the past 5 years. She reports seeing double with either eye individually (monocular diplopia) at times.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 65 bpm | BP: 110/70 mmHg
*   **Visual Acuity:** Bilateral 20/80 (uncorrected); pinhole corrects to 20/30
*   **Ocular Examination (OU):** The anterior chambers are deep. Slit-lamp biomicroscopy after pupillary dilation reveals bilateral, symmetrical displacement and **subluxation of the crystalline lenses in a superotemporal direction**. Stretched, intact ciliary zonular fibers are clearly visible in the lower-nasal pupillary aperture. Tremulousness of the iris (iridodonesis) is present upon rapid eye movements.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely underlying diagnosis, and in what direction is the lens classically displaced?', '["Marfan syndrome; superotemporal displacement of the lens", "Homocystinuria; inferonasal displacement of the lens", "Weill-Marchesani syndrome; symmetrical inferior displacement", "Traumatic zonular dialysis; random displacement based on trauma force", "Sulfite oxidase deficiency; progressive nasal displacement"]'::jsonb, 0, 'This patient has **Marfan syndrome**, an autosomal dominant connective tissue disorder. The classic ocular manifestation is **ectopia lentis (lens subluxation)**, which occurs bilaterally and symmetrically in up to 80% of patients. In Marfan syndrome, the lens classically displaces in a **superotemporal direction**, with ciliary zonules remaining stretched but largely intact.'),
    (v_case_id, 'Which genetic mutation is responsible for the systemic and ocular manifestations of this patient''s syndrome?', '["ELN gene on chromosome 7, encoding elastin", "FBN1 gene on chromosome 15, encoding fibrillin-1", "TGFBR1 gene on chromosome 9, encoding transforming factor receptor", "CBS gene on chromosome 21, encoding cystathionine beta-synthase", "COL1A1 gene on chromosome 17, encoding type I collagen"]'::jsonb, 1, 'Marfan syndrome is caused by mutations in the **FBN1 gene on chromosome 15q21**, which encodes **fibrillin-1**, a major glycoprotein component of extracellular microfibrils. Fibrillin-1 is highly abundant in the **ciliary zonules** (the suspension cords of the lens), as well as the aortic media and skeletal system, explaining the classic multi-system clinical features.'),
    (v_case_id, 'Which clinical feature helps differentiate the ectopia lentis of Homocystinuria from that of Marfan Syndrome?', '["In Homocystinuria, patients are extremely short in stature with stiff joints and small hands", "In Homocystinuria, the lens never subluxates but undergoes rapid calcification", "In Homocystinuria, the lens is displaced superotemporally and the zonules are completely intact", "In Homocystinuria, lens subluxation is classically inferonasal, the zonules are completely broken, and patients have intellectual disability and thromboembolic risk", "Homocystinuria is inherited in an autosomal dominant pattern with normal life expectancy"]'::jsonb, 3, '**Homocystinuria** (an autosomal recessive metabolic disorder) is differentiated by: (1) **inferonasal displacement** of the lens, (2) **complete disintegration and breakdown of the ciliary zonules** (which are composed of cysteine-rich fibers damaged by homocysteine), and (3) systemic features like **intellectual disability, skeletal deformities, and a high risk of life-threatening thromboembolism**.');

    ---------------------------------------------------------------------------
    -- CASE 18: The 'Second Cataract' - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The ''Second Cataract'' - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The ''Second Cataract'' - Clinical Presentation (V2)', 'A 66-year-old male presents complaining that the cataract in his left eye has ''grown back.'' He underwent highly successful, uncomplicated cataract extraction with intraocular lens (IOL) implantation in that eye 18 months ago, achieving 20/20 vision postoperatively. However, over the past 4 months, his vision has become progressively blurry and hazy, accompanied by significant glare when looking at bright lights.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 70 bpm | BP: 128/78 mmHg
*   **Visual Acuity:** OS: 20/60 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior chamber is quiet. A three-piece monofocal acrylic intraocular lens is perfectly centered within the capsular bag. However, the posterior capsule behind the IOL appears significantly thickened, hazy, and translucent, showing multiple small, vesicular, pearl-like vacuolated cells growing across the central visual axis (Elschnig''s pearls).', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 66-year-old male presents complaining that the cataract in his left eye has ''grown back.'' He underwent highly successful, uncomplicated cataract extraction with intraocular lens (IOL) implantation in that eye 18 months ago, achieving 20/20 vision postoperatively. However, over the past 4 months, his vision has become progressively blurry and hazy, accompanied by significant glare when looking at bright lights.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 70 bpm | BP: 128/78 mmHg
*   **Visual Acuity:** OS: 20/60 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior chamber is quiet. A three-piece monofocal acrylic intraocular lens is perfectly centered within the capsular bag. However, the posterior capsule behind the IOL appears significantly thickened, hazy, and translucent, showing multiple small, vesicular, pearl-like vacuolated cells growing across the central visual axis (Elschnig''s pearls).', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the gold-standard treatment?', '["Cystoid macular edema; topical non-steroidal anti-inflammatory drops", "Posterior capsular opacification (PCO); Nd:YAG laser posterior capsulotomy", "Corneal endothelial decompensation; Descemet''s stripping endothelial keratoplasty", "Recurrent nuclear cataract; repeat surgical cataract extraction", "Neovascularization of the posterior capsule; intravitreal anti-VEGF injection"]'::jsonb, 1, 'This is **Posterior Capsular Opacification (PCO)**, the most common late complication of modern cataract surgery (often called a **''second cataract''** by patients). The gold-standard treatment is an outpatient **Nd:YAG laser posterior capsulotomy**, which uses a specialized laser to safely create a small circular opening in the hazy posterior capsule, instantly restoring the clear optical path.'),
    (v_case_id, 'Which cellular mechanism is primarily responsible for the development of PCO?', '["Precipitation of systemic calcium salts onto the surface of the acrylic IOL", "Proliferation, migration, and myofibroblastic transdifferentiation of residual lens epithelial cells on the capsular bag", "Infiltration of the subretinal space by corneal endothelial cells", "Slow, localized vitreous degeneration and condensation behind the lens", "Deposition of chronic inflammatory cells and macrophages on the posterior lens capsule"]'::jsonb, 1, 'PCO is caused by the **proliferation, migration, and myofibroblastic transdifferentiation of residual lens epithelial cells (LECs)**. During cataract surgery, some LECs are left behind in the equatorial region of the capsular bag. Over time, these cells migrate across the posterior capsule, forming **Elschnig''s pearls** (vacuolated cells) or causing capsular wrinkling and fibrosis, which scatters light.'),
    (v_case_id, 'Which of the following is a potential, rare complication of the laser treatment used to manage PCO?', '["Corneal endothelial cell loss and corneal melting", "Rhegmatogenous retinal detachment and IOL damage/pitting", "Acute, synechial angle-closure glaucoma", "Ischemia and atrophy of the optic nerve head", "Neovascularization of the anterior chamber angle"]'::jsonb, 1, 'While Nd:YAG laser capsulotomy is highly safe, rare complications include: (1) **rhegmatogenous retinal detachment** (due to shockwaves transmitted to the vitreous cavity, especially in high myopes), (2) **transient intraocular pressure spikes**, (3) **IOL damage or pitting** if the laser is misfocused, and (4) **cystoid macular edema** (Irvine-Gass syndrome).');

    ---------------------------------------------------------------------------
    -- CASE 19: The Billowing Iris - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Billowing Iris - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Billowing Iris - Clinical Presentation (V2)', 'A 76-year-old male with a history of benign prostatic hyperplasia (BPH) presenting with a progressive nuclear sclerotic cataract is scheduled for routine phacoemulsification. During his preoperative assessment, the surgeon reviews his current medications, which include tamsulosin 0.4 mg daily. Preoperative pupil dilation is achieved but appears slightly sluggish.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 68 bpm | BP: 130/82 mmHg
*   **Ocular Examination (OU):** The anterior segments are quiet. Deep anterior chambers. Gonioscopy shows open angles (Grade 4). Lenses show 3+ nuclear sclerosis bilaterally. Retinal examination is normal. During the initial steps of cataract surgery, immediately after making the corneal incision, the iris appears highly flaccid, billows in response to irrigation fluid, and repeatedly prolapses towards the surgical wound. The pupil, which was 7.5 mm, progressively constricts to 4.0 mm despite standard epinephrine in the irrigating bottle.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 76-year-old male with a history of benign prostatic hyperplasia (BPH) presenting with a progressive nuclear sclerotic cataract is scheduled for routine phacoemulsification. During his preoperative assessment, the surgeon reviews his current medications, which include tamsulosin 0.4 mg daily. Preoperative pupil dilation is achieved but appears slightly sluggish.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 68 bpm | BP: 130/82 mmHg
*   **Ocular Examination (OU):** The anterior segments are quiet. Deep anterior chambers. Gonioscopy shows open angles (Grade 4). Lenses show 3+ nuclear sclerosis bilaterally. Retinal examination is normal. During the initial steps of cataract surgery, immediately after making the corneal incision, the iris appears highly flaccid, billows in response to irrigation fluid, and repeatedly prolapses towards the surgical wound. The pupil, which was 7.5 mm, progressively constricts to 4.0 mm despite standard epinephrine in the irrigating bottle.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis, and which class of medications is responsible for this condition?', '["Congenital iris hypoplasia; systemic anticholinergic therapy", "Uveitic pupillary block; chronic topical corticosteroid use", "Pseudoexfoliative iridopathy; calcium channel blockers", "Pigment dispersion syndrome; systemic beta-blockers", "Intraoperative Floppy Iris Syndrome (IFIS); alpha-1A adrenergic receptor antagonists (e.g., tamsulosin)"]'::jsonb, 4, 'This is **Intraoperative Floppy Iris Syndrome (IFIS)**. It is caused by **alpha-1A adrenergic receptor antagonists**, most notably **tamsulosin (Flomax)**, which is widely prescribed for benign prostatic hyperplasia (BPH). The drug blocks the alpha-1A receptors in the iris dilator muscle, leading to muscle flaccidity, billowing, and intraoperative miosis.'),
    (v_case_id, 'What is the classic triad of signs that defines Intraoperative Floppy Iris Syndrome?', '["Flaccid iris stroma that billows with fluid currents, progressive intraoperative miosis, and a propensity for the iris to prolapse through corneal incisions", "Heavily pigmented trabecular meshwork, Krukenberg spindle, and mid-peripheral spoke-like iris defects", "Shallow anterior chamber, rock-hard globe, and steamy corneal edema", "Wrinkled anterior lens capsule, Elschnig''s pearls, and zonular dialysis", "Posterior synechiae, keratic precipitates, and cystoid macular edema"]'::jsonb, 0, 'The **classic triad of IFIS** consists of: (1) **a flaccid iris stroma** that billows and waves in response to normal intraoperative irrigation fluid currents, (2) **progressive intraoperative pupillary constriction (miosis)**, and (3) **a strong propensity for the iris tissue to prolapse** and escape through the corneal incisions.'),
    (v_case_id, 'Which of the following is the most appropriate management strategy for a patient with known IFIS undergoing cataract surgery?', '["Using pupil expansion rings (e.g. Malyugin ring), iris hooks, or intraoperative intracameral phenylephrine/epinephrine", "Performing an immediate surgical peripheral iridectomy before removing the cataract", "Increasing the ultrasound phacoemulsification power to rapidly emulsify the lens", "Postponing the surgery and switching the patient to oral finasteride for 5 years", "Stopping tamsulosin 24 hours prior to surgery to fully reverse the iris muscle atrophy"]'::jsonb, 0, 'Management of IFIS includes **pupil expansion rings (e.g. Malyugin ring)**, iris hooks, cohesive viscoelastics, or **intraoperative intracameral injection of alpha-agonists (phenylephrine or epinephrine)**. Stopping tamsulosin is generally **unsuccessful at reversing the syndrome**, as the drug causes long-lasting or permanent structural changes/atrophy of the iris dilator muscle; thus, the surgeon must prepare for IFIS even if the patient stopped the drug months ago.');

    ---------------------------------------------------------------------------
    -- CASE 20: The Tremulous Lens - Clinical Presentation (V2)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tremulous Lens - Clinical Presentation (V2)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tremulous Lens - Clinical Presentation (V2)', 'A 43-year-old male presents with fluctuating, blurry vision and double vision in his left eye.  He reports that he was struck in that eye by the fist of an assailant during a physical altercation 2 weeks ago.  He notes that when he moves his eye quickly, his vision seems to ''wobble'' and shake.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 74 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/120 (pinholes to 20/40); contralateral eye: 20/20
*   **Ocular Examination (OS):** The cornea is clear. Slit-lamp biomicroscopy reveals a highly **tremulous iris (iridodonesis)** and a **tremulous lens (phacodonesis)** upon eye movement. With a dilated pupil, the lens is seen to be subluxated inferiorly, exposing a 120-degree sector of **torn ciliary zonules (zonular dialysis)** superiorly. A small amount of vitreous gel is visible prolapsing into the anterior chamber around the superior edge of the lens. The intraocular pressure is 18 mmHg.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 43-year-old male presents with fluctuating, blurry vision and double vision in his left eye.  He reports that he was struck in that eye by the fist of an assailant during a physical altercation 2 weeks ago.  He notes that when he moves his eye quickly, his vision seems to ''wobble'' and shake.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 74 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/120 (pinholes to 20/40); contralateral eye: 20/20
*   **Ocular Examination (OS):** The cornea is clear. Slit-lamp biomicroscopy reveals a highly **tremulous iris (iridodonesis)** and a **tremulous lens (phacodonesis)** upon eye movement. With a dilated pupil, the lens is seen to be subluxated inferiorly, exposing a 120-degree sector of **torn ciliary zonules (zonular dialysis)** superiorly. A small amount of vitreous gel is visible prolapsing into the anterior chamber around the superior edge of the lens. The intraocular pressure is 18 mmHg.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis, and what do the terms ''iridodonesis'' and ''phacodonesis'' represent?', '["Pseudoexfoliation syndrome; iridodonesis is iris atrophy, phacodonesis is lens displacement", "Anterior uveitis; iridodonesis is inflammatory cells, phacodonesis is lens proteins", "Acute angle-closure glaucoma; iridodonesis is fixed pupil, phacodonesis is lens swelling", "Pigmentary glaucoma; iridodonesis is iris transillumination, phacodonesis is pigment in the lens", "Lens subluxation with traumatic zonular dialysis; iridodonesis is trembling of the iris, phacodonesis is trembling of the lens"]'::jsonb, 4, 'This patient has **lens subluxation with traumatic zonular dialysis**. **Iridodonesis** (tremble of the iris) and **phacodonesis** (tremble of the lens) are classic signs of zonular weakness or tearing. When the eye moves, the iris and lens lack proper structural support and oscillate/wobble, which is highly diagnostic of ciliary zonular damage.'),
    (v_case_id, 'What is the primary surgical device used during cataract extraction to support the remaining capsular bag in a patient with moderate zonular dialysis?', '["Nd:YAG laser capsulotome", "Malyugin Pupil Expansion Ring", "Scleral-fixated iris hook", "Capsular Tension Ring (CTR)", "Ahmed Glaucoma Valve"]'::jsonb, 3, 'For moderate zonular dialysis (<120-180 degrees), a **Capsular Tension Ring (CTR)** is inserted into the capsular bag. The CTR is a flexible PMMA ring that distributes the mechanical forces of the remaining intact zonules to the weakened areas, stabilizing the capsular bag, preventing vitreous prolapse, and allowing the safe implantation of a standard IOL.'),
    (v_case_id, 'Which of the following is the most appropriate surgical management for a patient with severe, progressive lens subluxation (>180 degrees of zonular dialysis) and vitreous in the anterior chamber?', '["Surgical trabeculectomy with mitomycin C while leaving the subluxated lens in place", "Pars plana lensectomy and anterior vitrectomy, followed by implantation of a scleral-fixated or iris-claw IOL", "Bilateral laser peripheral iridotomy and lifelong topical beta-blockers", "Pressure patching the eye and scheduling a follow-up in 6 months", "Standard phacoemulsification with a standard CTR and standard bag-IOL placement"]'::jsonb, 1, 'In cases of **severe lens subluxation (>180 degrees of zonular dialysis)** or when the lens is extremely unstable and vitreous is in the anterior chamber, standard phacoemulsification within the bag is highly dangerous. The recommended approach is a **lensectomy (often via pars plana) combined with an anterior vitrectomy** (to clear the prolapsed vitreous), followed by placement of a **scleral-fixated intraocular lens** (e.g. Yamane technique) or an **iris-claw/anterior chamber IOL**.');

    ---------------------------------------------------------------------------
    -- CASE 21: Case Study: The Myopic Shift of Age (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Myopic Shift of Age (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Myopic Shift of Age (V3)', 'A 75-year-old male presents with slowly progressive, painless blurring of vision in both eyes over the past 2 years. He reports having difficulty reading distance street signs and highway markers. Interestingly, he notes a surprising improvement in his near vision, allowing his to read the newspaper without reading glasses for the first time in a decade.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 71 bpm | BP: 118/83 mmHg
*   **Visual Acuity:** OS: 20/70 (no improvement with pinhole); contralateral eye: 20/25
*   **Ocular Examination (OS):** The anterior chamber is deep and quiet. Slit-lamp biomicroscopy of the lens reveals significant yellow-to-amber discoloration and moderate compaction of the lens nucleus. The contralateral lens shows similar but milder changes. Dilated fundus exam reveals normal optic discs with a cup-to-disc ratio of 0.3 OU, and a normal macula.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 75-year-old male presents with slowly progressive, painless blurring of vision in both eyes over the past 2 years. He reports having difficulty reading distance street signs and highway markers. Interestingly, he notes a surprising improvement in his near vision, allowing his to read the newspaper without reading glasses for the first time in a decade.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 71 bpm | BP: 118/83 mmHg
*   **Visual Acuity:** OS: 20/70 (no improvement with pinhole); contralateral eye: 20/25
*   **Ocular Examination (OS):** The anterior chamber is deep and quiet. Slit-lamp biomicroscopy of the lens reveals significant yellow-to-amber discoloration and moderate compaction of the lens nucleus. The contralateral lens shows similar but milder changes. Dilated fundus exam reveals normal optic discs with a cup-to-disc ratio of 0.3 OU, and a normal macula.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following represents the primary mechanism behind the patient''s temporary improvement in near vision?', '["Increased refractive power of the lens due to increased density and nuclear compaction, causing a myopic shift", "Spontaneous flattening of the cornea leading to decreased hyperopic refractive error", "Upregulation of ciliary muscle contractility compensating for presbyopia", "Resolution of underlying subclinical macular edema", "Regeneration of accommodation capacity in the crystalline lens fibers"]'::jsonb, 0, 'This patient has a **nuclear sclerotic cataract**, which characteristically causes a **myopic shift** (often referred to as **''second sight''**). The gradual compaction and sclerosis of the lens nucleus increase its refractive index, shifting the patient''s focal point closer. This allows presbyopic patients to temporarily read near print without reading glasses, though at the expense of distance vision.'),
    (v_case_id, 'Which of the following is the primary biochemical change associated with the development of nuclear sclerotic cataracts?', '["Hydration of lens cortical fibers due to osmotic swelling", "Deposition of systemic calcium salts within the lens stroma", "Autoimmune degradation of the lens capsule matrix", "Proliferation of anterior lens epithelial cells on the capsular bag", "Aggregation and insolubilization of lens crystallin proteins, along with accumulation of urochrome pigment"]'::jsonb, 4, 'Nuclear sclerotic cataracts are characterized by **aggregation and insolubilization of lens crystallin proteins**, along with the **accumulation of urochrome pigment** (which causes the yellow/brown coloration). This pigment filters out blue light and contributes to decreased color perception and contrast sensitivity.'),
    (v_case_id, 'Which of the following is the most appropriate next step in the management of this patient?', '["Performing urgent surgical trabeculectomy to prevent secondary glaucoma", "Initiation of systemic high-dose vitamin A and lutein supplementation", "Immediate referral for YAG laser capsulotomy to clear the visual axis", "Prescribing daily topical non-steroidal anti-inflammatory drops to halt cataract progression", "Cataract extraction and intraocular lens (IOL) implantation if the vision impairment interferes with activities of daily living"]'::jsonb, 4, 'The definitive treatment for cataracts is **cataract extraction and intraocular lens (IOL) implantation**. The indication for surgery is functional visual impairment that interferes with the patient''s activities of daily living (e.g. driving, reading). There are no approved pharmacologic agents to halt or reverse cataract formation.');

    ---------------------------------------------------------------------------
    -- CASE 22: Case Study: The Glare of Headlights (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Glare of Headlights (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Glare of Headlights (V3)', 'A 74-year-old female presents complaining of progressive difficulty driving at night. She reports experiencing debilitating glare and starbursts from the headlights of oncoming cars, which makes night driving extremely stressful. Her distance vision has also become progressively blurry over the past 4 years.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 81 bpm | BP: 126/87 mmHg
*   **Visual Acuity:** OD: 20/50 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OD):** Slit-lamp biomicroscopy reveals white, wedge-shaped opacities extending from the peripheral lens cortex towards the center in a spoke-like pattern, particularly in the nasal and inferior quadrants. The lens nucleus is relatively clear. Fundus examination is normal with clear visualization of the retina.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 74-year-old female presents complaining of progressive difficulty driving at night. She reports experiencing debilitating glare and starbursts from the headlights of oncoming cars, which makes night driving extremely stressful. Her distance vision has also become progressively blurry over the past 4 years.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 81 bpm | BP: 126/87 mmHg
*   **Visual Acuity:** OD: 20/50 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OD):** Slit-lamp biomicroscopy reveals white, wedge-shaped opacities extending from the peripheral lens cortex towards the center in a spoke-like pattern, particularly in the nasal and inferior quadrants. The lens nucleus is relatively clear. Fundus examination is normal with clear visualization of the retina.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following slit-lamp findings is most pathognomonic for a cortical cataract?', '["Golden-brown discoloration of the central lens nucleus", "A granular, plaque-like opacity in the central posterior subcapsular area", "Wedge-shaped, spoke-like opacities starting in the peripheral cortex", "Multiple small, hyper-pigmented spots on the anterior lens capsule", "A subluxated lens showing stretched zonular fibers"]'::jsonb, 2, '**Cortical cataracts** classically present as **wedge-shaped, spoke-like opacities** that start in the peripheral cortex and progress toward the center of the lens. They are best visualized with retroillumination, where they appear as dark silhouettes against the red reflex.'),
    (v_case_id, 'What is the primary underlying pathophysiological process driving cortical cataract formation?', '["Deposition of blood-derived lipids in the peripheral lens stroma", "Hydration and swelling of lens cortical fibers, leading to vacuole formation and clefting along suture lines", "Proliferation and migration of equatorial lens epithelial cells to the posterior pole", "Direct chemical oxidation of central nuclear crystallins by free radicals", "Primary loss of ciliary body perfusion leading to lens ischemia"]'::jsonb, 1, 'Cortical cataracts are driven by **hydration and swelling of lens cortical fibers**. This occurs due to disruption of the lens cell membrane integrity and the activity of the Na+/K+ ATPase pump. Water enters the lens, causing vacuole formation and subsequent **clefting along the natural lens suture lines**, presenting as the classic cortical spokes.'),
    (v_case_id, 'Which visual symptom is most specifically associated with cortical cataracts compared to nuclear sclerotic cataracts?', '["Surprising improvement in near vision (second sight)", "Severe glare, starbursts, and monocular diplopia due to irregular light scattering", "A central gray scotoma with distorted lines", "Severe, throbbing ocular pain and redness", "Fluctuating visual acuity related to systemic blood glucose levels"]'::jsonb, 1, 'Cortical cataracts are highly associated with **significant glare, starbursts, and halos** (especially at night from headlights) due to the irregular refraction and scattering of light as it passes through the peripheral cortical opacities. They can also cause **monocular diplopia** or polyopia due to the split-refractive properties of the hydrated lens clefts.');

    ---------------------------------------------------------------------------
    -- CASE 23: Case Study: The Steroid-Induced Plaque (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Steroid-Induced Plaque (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Steroid-Induced Plaque (V3)', 'A 56-year-old male with a history of severe asthma requiring frequent courses of systemic corticosteroids and daily inhaled fluticasone presents with a rapid, painless decrease in vision in his left eye over the past 5 months. He reports that his near vision is particularly severely affected, making it nearly impossible to read books or look at his phone.  He also complains of disabling glare in bright sunlight.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 81 bpm | BP: 118/77 mmHg
*   **Visual Acuity:** OS: 20/100 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OS):** Anterior chamber is deep and quiet. Slit-lamp exam of the lens reveals a dense, granular, plaque-like opacity located on the posterior surface of the lens, directly in the visual axis. The lens nucleus and cortex are clear. The intraocular pressure is 15 mmHg OU. Dilated fundus examination is normal.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 56-year-old male with a history of severe asthma requiring frequent courses of systemic corticosteroids and daily inhaled fluticasone presents with a rapid, painless decrease in vision in his left eye over the past 5 months. He reports that his near vision is particularly severely affected, making it nearly impossible to read books or look at his phone.  He also complains of disabling glare in bright sunlight.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 81 bpm | BP: 118/77 mmHg
*   **Visual Acuity:** OS: 20/100 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OS):** Anterior chamber is deep and quiet. Slit-lamp exam of the lens reveals a dense, granular, plaque-like opacity located on the posterior surface of the lens, directly in the visual axis. The lens nucleus and cortex are clear. The intraocular pressure is 15 mmHg OU. Dilated fundus examination is normal.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Nuclear sclerotic cataract", "Posterior subcapsular cataract (PSC)", "Traumatic cataract", "Cortical cataract", "Posterior capsular opacification (PCO)"]'::jsonb, 1, 'This patient has a **Posterior Subcapsular Cataract (PSC)**. Key features include the **plaque-like, granular opacity** on the posterior surface of the lens, a history of **corticosteroid use**, a **relatively young age**, and **disproportionately severe loss of near vision** and glare in bright conditions because the opacity is located directly in the nodal point of the eye.'),
    (v_case_id, 'What is the cellular origin of a posterior subcapsular cataract?', '["Abnormal migration and swelling of lens epithelial cells from the equator to the posterior pole, forming Wedl (bladder) cells", "Deposition of macrophages that have engulfed leaked lens proteins", "Proliferation of iris pigment epithelial cells onto the anterior lens capsule", "Necrosis of the central lens fiber cells due to chronic ischemia", "Myofibroblastic transdifferentiation of keratocytes in the corneal stroma"]'::jsonb, 0, 'PSCs arise from the **abnormal migration and swelling of lens epithelial cells**. Normally, lens epithelial cells are located on the anterior surface and migrate to the equator to differentiate into lens fibers. In PSC, these cells aberrantly migrate posteriorly to the posterior pole, where they swell and become large, nucleated, vacuolated cells known as **Wedl cells** or **bladder cells**, forming the posterior plaque.'),
    (v_case_id, 'Why does a posterior subcapsular cataract affect near vision more severely than distance vision?', '["Accommodative pupillary constriction (miosis) focuses light directly through the central posterior opacity", "Corticosteroids selectively damage the macular photoreceptors responsible for near vision", "The lens becomes extremely rigid and prevents accommodation completely", "The posterior capsule is physically connected to the ciliary zonules", "Near vision requires a wider pupil, which exposes the peripheral cortical clefts"]'::jsonb, 0, 'PSC affects **near vision more severely** because during near vision, the accommodation reflex triggers **pupillary constriction (miosis)**. This constricts the light path, forcing light to pass directly through the **small, central, posterior subcapsular plaque** located at the nodal point of the eye. In contrast, in dimmer light or distance vision, a slightly wider pupil allows light to pass around the central opacity, resulting in better distance acuity.');

    ---------------------------------------------------------------------------
    -- CASE 24: Case Study: The Absent Red Reflex (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Absent Red Reflex (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Absent Red Reflex (V3)', 'A 0-month-old infant is brought to the pediatric ophthalmology clinic by her parents who noticed an abnormal white appearance in the baby''s left pupil on a family photograph. The mother notes the baby does not seem to track toys or look at her face as well when the right eye is covered.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Central, steady, and maintained in the right eye; poor fixation and tracking in the left eye.
*   **Ocular Examination:** The right eye shows a normal, bright red reflex. The left eye has an absent red reflex, replaced by a dense, white, homogeneous opacity in the center of the pupil (leukocoria). Handheld slit-lamp exam reveals a dense, central nuclear lens opacity. The cornea is clear and corneal diameters are symmetric. No signs of intraocular inflammation or retinoblastoma are noted on B-scan ultrasound.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 0-month-old infant is brought to the pediatric ophthalmology clinic by her parents who noticed an abnormal white appearance in the baby''s left pupil on a family photograph. The mother notes the baby does not seem to track toys or look at her face as well when the right eye is covered.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Central, steady, and maintained in the right eye; poor fixation and tracking in the left eye.
*   **Ocular Examination:** The right eye shows a normal, bright red reflex. The left eye has an absent red reflex, replaced by a dense, white, homogeneous opacity in the center of the pupil (leukocoria). Handheld slit-lamp exam reveals a dense, central nuclear lens opacity. The cornea is clear and corneal diameters are symmetric. No signs of intraocular inflammation or retinoblastoma are noted on B-scan ultrasound.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most critical management priority for a dense, unilateral congenital cataract?', '["Fitting with custom glasses and scheduling surgery at school age", "Initiation of daily topical corticosteroid drops to clear the lens opacity", "Urgent surgical cataract extraction within the first 6 to 8 weeks of life to prevent irreversible deprivation amblyopia", "Watchful waiting and visual stimulation therapy until the child is at least 5 years old", "Immediate systemic antiviral therapy for suspected congenital CMV"]'::jsonb, 2, 'A dense, unilateral congenital cataract is a **visual emergency**. It must be treated with **urgent surgical extraction (lensectomy) within the first 6 to 8 weeks of life**. Delaying surgery beyond the critical period of visual development leads to permanent, irreversible **deprivation amblyopia**, as the visual cortex fails to develop proper synaptic connections with the affected eye.'),
    (v_case_id, 'Which congenital infection is most classically associated with congenital cataracts, microphthalmia, and sensorineural hearing loss?', '["Congenital Toxoplasmosis", "Congenital Herpes Simplex Virus", "Congenital Rubella Syndrome", "Congenital Syphilis", "Congenital Cytomegalovirus"]'::jsonb, 2, '**Congenital Rubella Syndrome** is classically associated with the triad of **cataracts** (often bilateral), **microphthalmia/pigmentary retinopathy**, **sensorineural hearing loss**, and **cardiac defects** (patent ductus arteriosus). The rubella virus directly infects the developing lens vesicle in utero before the capsule forms, leading to chronic replication within the lens fibers.'),
    (v_case_id, 'Following congenital cataract surgery in an infant, what is the primary method of visual rehabilitation to prevent amblyopia?', '["Implantation of a standard adult monofocal intraocular lens without patching", "Fitting with a high-power contact lens (aphakic contact lens) and patching the contralateral eye (occlusion therapy)", "Performing daily laser therapy to stimulate the macula", "There is no effective visual rehabilitation method for aphakic infants", "Prescribing standard bifocal glasses and hoping the eyes self-correct"]'::jsonb, 1, 'Visual rehabilitation in an aphakic infant is crucial. Because the infant''s eye is small and rapidly growing, primary IOL implantation is highly challenging and risky. Therefore, infants are rehabilitated with a **high-power aphakic contact lens** (or aphakic glasses for bilateral cases) to correct the severe refractive error, combined with **occlusion therapy (patching of the normal eye)** to force the brain to use the surgical eye and prevent amblyopia.');

    ---------------------------------------------------------------------------
    -- CASE 25: Case Study: The Blunt Rosette (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Blunt Rosette (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Blunt Rosette (V3)', 'A 26-year-old female presents with a 3-month history of progressive visual blur in her left eye. Upon questioning, she recalls being struck in that eye by a tennis ball during a match approximately 8 months ago. She experienced temporary pain and bruising but did not seek medical attention at the time.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 80 bpm | BP: 133/78 mmHg
*   **Visual Acuity:** OS: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior chamber is deep and quiet. Gonioscopy shows 15% angle recession inferiorly. Slit-lamp exam of the lens reveals a classic rosette-shaped or star-shaped cortical opacity located in the posterior subcapsular region. The ciliary zonules appear intact, and there is no lens subluxation or phacodonesis. The intraocular pressure is 14 mmHg OU.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 26-year-old female presents with a 3-month history of progressive visual blur in her left eye. Upon questioning, she recalls being struck in that eye by a tennis ball during a match approximately 8 months ago. She experienced temporary pain and bruising but did not seek medical attention at the time.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 80 bpm | BP: 133/78 mmHg
*   **Visual Acuity:** OS: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior chamber is deep and quiet. Gonioscopy shows 15% angle recession inferiorly. Slit-lamp exam of the lens reveals a classic rosette-shaped or star-shaped cortical opacity located in the posterior subcapsular region. The ciliary zonules appear intact, and there is no lens subluxation or phacodonesis. The intraocular pressure is 14 mmHg OU.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which classic morphology is most characteristic of a cataract caused by blunt, non-penetrating ocular trauma?', '["Wedge-shaped, spoke-like peripheral clefts", "Amber-colored central oil-droplet opacity", "Dense, golden-brown nuclear compaction", "White, flaky, dandruff-like deposits on the anterior capsule", "Rosette-shaped or stellate-shaped cortical opacity"]'::jsonb, 4, 'Blunt, non-penetrating ocular trauma characteristically causes a **rosette-shaped or stellate-shaped cortical opacity**, typically located in the posterior or anterior subcapsular cortex. The concussive wave transmission through the eye disrupts the lens fibers, leading to fluid accumulation along the suture lines in this unique flower-like pattern.'),
    (v_case_id, 'What is the primary pathophysiology behind traumatic cataract formation after blunt trauma?', '["Direct chemical necrosis of lens crystallins by inflammatory cytokines", "Secondary calcification of the posterior lens capsule due to intraocular hemorrhage", "Disruption of the lens capsule or ciliary zonules, allowing aqueous humor to enter and hydrate the lens fibers", "A chronic, low-grade bacterial infection of the lens cortex", "Localized ischemia of the ciliary body processes that supply the lens"]'::jsonb, 2, 'Blunt trauma causes **micro-ruptures or increased permeability of the lens capsule** (or direct injury to the subcapsular lens fibers). This allows **aqueous humor to enter and hydrate the lens fibers**, leading to localized opacification and swelling. Over time, this focal hydration spreads, often resulting in a mature, completely opaque cataract.'),
    (v_case_id, 'What other clinical finding must be ruled out in a patient with a traumatic cataract before planning surgery?', '["A contralateral optic nerve Drance hemorrhage", "Congenital dacryostenosis and tear duct block", "Pseudoexfoliative deposits on the corneal endothelium", "Zonular dialysis, angle recession, and secondary glaucoma", "An underlying mutation in the fibrillin-1 gene"]'::jsonb, 3, 'Prior blunt trauma carries a high risk of **zonular dialysis** (weakness/tearing of the lens support cords), **angle recession** (tearing of the iris insertion, which can lead to late secondary glaucoma), and **vitreous prolapse**. The surgeon must carefully evaluate for iris and lens tremulousness (iridodonesis/phacodonesis) and angle structure, as zonular weakness significantly complicates cataract surgery.');

    ---------------------------------------------------------------------------
    -- CASE 26: Case Study: The Liquefied Cortex (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Liquefied Cortex (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Liquefied Cortex (V3)', 'A 81-year-old female from an underserved rural community presents with profound, painless vision loss in her right eye. She reports that the eye has been virtually blind for over 3 years, but she did not seek treatment due to lack of local services and fear of surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 72 bpm | BP: 125/83 mmHg
*   **Visual Acuity:** OD: Hand Motion (good light projection); contralateral eye: 20/40
*   **Ocular Examination (OD):** Anterior chamber is deep. Slit-lamp biomicroscopy of the lens reveals a completely white, opaque lens. The lens cortex has completely liquefied into a milky white fluid. The dense, brown, sclerotic lens nucleus is clearly visible, having subsided and sunk to the bottom of the capsular bag. The anterior lens capsule appears wrinkled and thickened. There is no active inflammation or elevated IOP today.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 81-year-old female from an underserved rural community presents with profound, painless vision loss in her right eye. She reports that the eye has been virtually blind for over 3 years, but she did not seek treatment due to lack of local services and fear of surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 72 bpm | BP: 125/83 mmHg
*   **Visual Acuity:** OD: Hand Motion (good light projection); contralateral eye: 20/40
*   **Ocular Examination (OD):** Anterior chamber is deep. Slit-lamp biomicroscopy of the lens reveals a completely white, opaque lens. The lens cortex has completely liquefied into a milky white fluid. The dense, brown, sclerotic lens nucleus is clearly visible, having subsided and sunk to the bottom of the capsular bag. The anterior lens capsule appears wrinkled and thickened. There is no active inflammation or elevated IOP today.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis for this specific type of hypermature cataract?', '["Phacolytic cataract", "Nuclear sclerotic cataract", "Posterior subcapsular cataract", "Morgagnian cataract", "Cortical cataract"]'::jsonb, 3, 'This is a **Morgagnian cataract**, which is a specific form of **hypermature cataract**. In this advanced stage, the lens cortex undergoes enzymatic degeneration and **completely liquefies into a milky fluid**. Lacking support, the dense, dehydrated, **sclerotic nucleus sinks** to the bottom of the capsular bag under the influence of gravity.'),
    (v_case_id, 'Which of the following represents a serious, potentially blinding ocular emergency associated with hypermature cataracts?', '["Tractional retinal detachment due to vitreal-capsular bands", "Neovascular glaucoma driven by chronic lens ischemia", "Phacoanaphylactic endophthalmitis, a direct autoimmune response to a ruptured lens capsule", "Phacolytic glaucoma, caused by the leakage of high-molecular-weight lens proteins through the intact capsule", "Acute primary angle-closure glaucoma due to pupillary block"]'::jsonb, 3, 'Hypermature cataracts carry a high risk of **phacolytic glaucoma**. As the cortex liquefies, **high-molecular-weight lens proteins leak** through microscopic pores in the degenerating, wrinkled anterior lens capsule. Macrophages migrate to engulf these foreign proteins. Both the proteins and protein-laden macrophages physically clog the trabecular meshwork, causing a rapid, severe rise in IOP in a deep-chambered, quiet eye.'),
    (v_case_id, 'What is the primary surgical challenge encountered during the extraction of a Morgagnian cataract?', '["An increased risk of severe retrobulbar hemorrhage during anesthesia", "Creating a continuous curvilinear capsulorhexis in a highly pressurized capsular bag with poor visualization of the capsule", "Severe intraoperative miosis that does not respond to epinephrine", "Finding a specialized IOL designed to fit in a liquefied capsule", "Fragility of the corneal epithelium under standard ultrasound energy"]'::jsonb, 1, 'The primary surgical challenge is **creating a safe capsulorhexis**. The liquefied cortex creates a **highly pressurized capsular bag**. When the needle or forceps punctures the anterior capsule, the pressurized milky fluid immediately escapes, obscuring visualization and causing the capsular tear to rapidly run out to the equator (the **''Argentinian flag sign''**). A trypan blue dye stain and venting of the liquid cortex are required to safely complete the capsulorhexis.');

    ---------------------------------------------------------------------------
    -- CASE 27: Case Study: The Superotemporal Subluxation (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Superotemporal Subluxation (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Superotemporal Subluxation (V3)', 'A 18-year-old tall, thin male with a history of joint hypermobility, mild scoliosis, and a pectus excavatum deformity presents for a comprehensive ophthalmic evaluation. He complains of fluctuating, blurry vision in both eyes that has worsened over the past 4 years. He reports seeing double with either eye individually (monocular diplopia) at times.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 65 bpm | BP: 110/70 mmHg
*   **Visual Acuity:** Bilateral 20/80 (uncorrected); pinhole corrects to 20/30
*   **Ocular Examination (OU):** The anterior chambers are deep. Slit-lamp biomicroscopy after pupillary dilation reveals bilateral, symmetrical displacement and **subluxation of the crystalline lenses in a superotemporal direction**. Stretched, intact ciliary zonular fibers are clearly visible in the lower-nasal pupillary aperture. Tremulousness of the iris (iridodonesis) is present upon rapid eye movements.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 18-year-old tall, thin male with a history of joint hypermobility, mild scoliosis, and a pectus excavatum deformity presents for a comprehensive ophthalmic evaluation. He complains of fluctuating, blurry vision in both eyes that has worsened over the past 4 years. He reports seeing double with either eye individually (monocular diplopia) at times.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 65 bpm | BP: 110/70 mmHg
*   **Visual Acuity:** Bilateral 20/80 (uncorrected); pinhole corrects to 20/30
*   **Ocular Examination (OU):** The anterior chambers are deep. Slit-lamp biomicroscopy after pupillary dilation reveals bilateral, symmetrical displacement and **subluxation of the crystalline lenses in a superotemporal direction**. Stretched, intact ciliary zonular fibers are clearly visible in the lower-nasal pupillary aperture. Tremulousness of the iris (iridodonesis) is present upon rapid eye movements.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely underlying diagnosis, and in what direction is the lens classically displaced?', '["Weill-Marchesani syndrome; symmetrical inferior displacement", "Sulfite oxidase deficiency; progressive nasal displacement", "Homocystinuria; inferonasal displacement of the lens", "Marfan syndrome; superotemporal displacement of the lens", "Traumatic zonular dialysis; random displacement based on trauma force"]'::jsonb, 3, 'This patient has **Marfan syndrome**, an autosomal dominant connective tissue disorder. The classic ocular manifestation is **ectopia lentis (lens subluxation)**, which occurs bilaterally and symmetrically in up to 80% of patients. In Marfan syndrome, the lens classically displaces in a **superotemporal direction**, with ciliary zonules remaining stretched but largely intact.'),
    (v_case_id, 'Which genetic mutation is responsible for the systemic and ocular manifestations of this patient''s syndrome?', '["CBS gene on chromosome 21, encoding cystathionine beta-synthase", "FBN1 gene on chromosome 15, encoding fibrillin-1", "TGFBR1 gene on chromosome 9, encoding transforming factor receptor", "ELN gene on chromosome 7, encoding elastin", "COL1A1 gene on chromosome 17, encoding type I collagen"]'::jsonb, 1, 'Marfan syndrome is caused by mutations in the **FBN1 gene on chromosome 15q21**, which encodes **fibrillin-1**, a major glycoprotein component of extracellular microfibrils. Fibrillin-1 is highly abundant in the **ciliary zonules** (the suspension cords of the lens), as well as the aortic media and skeletal system, explaining the classic multi-system clinical features.'),
    (v_case_id, 'Which clinical feature helps differentiate the ectopia lentis of Homocystinuria from that of Marfan Syndrome?', '["In Homocystinuria, the lens is displaced superotemporally and the zonules are completely intact", "In Homocystinuria, the lens never subluxates but undergoes rapid calcification", "Homocystinuria is inherited in an autosomal dominant pattern with normal life expectancy", "In Homocystinuria, lens subluxation is classically inferonasal, the zonules are completely broken, and patients have intellectual disability and thromboembolic risk", "In Homocystinuria, patients are extremely short in stature with stiff joints and small hands"]'::jsonb, 3, '**Homocystinuria** (an autosomal recessive metabolic disorder) is differentiated by: (1) **inferonasal displacement** of the lens, (2) **complete disintegration and breakdown of the ciliary zonules** (which are composed of cysteine-rich fibers damaged by homocysteine), and (3) systemic features like **intellectual disability, skeletal deformities, and a high risk of life-threatening thromboembolism**.');

    ---------------------------------------------------------------------------
    -- CASE 28: Case Study: The 'Second Cataract' (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The ''Second Cataract'' (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The ''Second Cataract'' (V3)', 'A 64-year-old male presents complaining that the cataract in his right eye has ''grown back.'' He underwent highly successful, uncomplicated cataract extraction with intraocular lens (IOL) implantation in that eye 18 months ago, achieving 20/20 vision postoperatively. However, over the past 4 months, his vision has become progressively blurry and hazy, accompanied by significant glare when looking at bright lights.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 70 bpm | BP: 128/78 mmHg
*   **Visual Acuity:** OD: 20/60 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior chamber is quiet. A three-piece monofocal acrylic intraocular lens is perfectly centered within the capsular bag. However, the posterior capsule behind the IOL appears significantly thickened, hazy, and translucent, showing multiple small, vesicular, pearl-like vacuolated cells growing across the central visual axis (Elschnig''s pearls).', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 64-year-old male presents complaining that the cataract in his right eye has ''grown back.'' He underwent highly successful, uncomplicated cataract extraction with intraocular lens (IOL) implantation in that eye 18 months ago, achieving 20/20 vision postoperatively. However, over the past 4 months, his vision has become progressively blurry and hazy, accompanied by significant glare when looking at bright lights.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 70 bpm | BP: 128/78 mmHg
*   **Visual Acuity:** OD: 20/60 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior chamber is quiet. A three-piece monofocal acrylic intraocular lens is perfectly centered within the capsular bag. However, the posterior capsule behind the IOL appears significantly thickened, hazy, and translucent, showing multiple small, vesicular, pearl-like vacuolated cells growing across the central visual axis (Elschnig''s pearls).', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the gold-standard treatment?', '["Posterior capsular opacification (PCO); Nd:YAG laser posterior capsulotomy", "Recurrent nuclear cataract; repeat surgical cataract extraction", "Corneal endothelial decompensation; Descemet''s stripping endothelial keratoplasty", "Cystoid macular edema; topical non-steroidal anti-inflammatory drops", "Neovascularization of the posterior capsule; intravitreal anti-VEGF injection"]'::jsonb, 0, 'This is **Posterior Capsular Opacification (PCO)**, the most common late complication of modern cataract surgery (often called a **''second cataract''** by patients). The gold-standard treatment is an outpatient **Nd:YAG laser posterior capsulotomy**, which uses a specialized laser to safely create a small circular opening in the hazy posterior capsule, instantly restoring the clear optical path.'),
    (v_case_id, 'Which cellular mechanism is primarily responsible for the development of PCO?', '["Infiltration of the subretinal space by corneal endothelial cells", "Proliferation, migration, and myofibroblastic transdifferentiation of residual lens epithelial cells on the capsular bag", "Precipitation of systemic calcium salts onto the surface of the acrylic IOL", "Deposition of chronic inflammatory cells and macrophages on the posterior lens capsule", "Slow, localized vitreous degeneration and condensation behind the lens"]'::jsonb, 1, 'PCO is caused by the **proliferation, migration, and myofibroblastic transdifferentiation of residual lens epithelial cells (LECs)**. During cataract surgery, some LECs are left behind in the equatorial region of the capsular bag. Over time, these cells migrate across the posterior capsule, forming **Elschnig''s pearls** (vacuolated cells) or causing capsular wrinkling and fibrosis, which scatters light.'),
    (v_case_id, 'Which of the following is a potential, rare complication of the laser treatment used to manage PCO?', '["Ischemia and atrophy of the optic nerve head", "Neovascularization of the anterior chamber angle", "Corneal endothelial cell loss and corneal melting", "Rhegmatogenous retinal detachment and IOL damage/pitting", "Acute, synechial angle-closure glaucoma"]'::jsonb, 3, 'While Nd:YAG laser capsulotomy is highly safe, rare complications include: (1) **rhegmatogenous retinal detachment** (due to shockwaves transmitted to the vitreous cavity, especially in high myopes), (2) **transient intraocular pressure spikes**, (3) **IOL damage or pitting** if the laser is misfocused, and (4) **cystoid macular edema** (Irvine-Gass syndrome).');

    ---------------------------------------------------------------------------
    -- CASE 29: Case Study: The Billowing Iris (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Billowing Iris (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Billowing Iris (V3)', 'A 74-year-old male with a history of benign prostatic hyperplasia (BPH) presenting with a progressive nuclear sclerotic cataract is scheduled for routine phacoemulsification. During his preoperative assessment, the surgeon reviews his current medications, which include tamsulosin 0.4 mg daily. Preoperative pupil dilation is achieved but appears slightly sluggish.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 68 bpm | BP: 130/82 mmHg
*   **Ocular Examination (OU):** The anterior segments are quiet. Deep anterior chambers. Gonioscopy shows open angles (Grade 4). Lenses show 3+ nuclear sclerosis bilaterally. Retinal examination is normal. During the initial steps of cataract surgery, immediately after making the corneal incision, the iris appears highly flaccid, billows in response to irrigation fluid, and repeatedly prolapses towards the surgical wound. The pupil, which was 7.5 mm, progressively constricts to 4.0 mm despite standard epinephrine in the irrigating bottle.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 74-year-old male with a history of benign prostatic hyperplasia (BPH) presenting with a progressive nuclear sclerotic cataract is scheduled for routine phacoemulsification. During his preoperative assessment, the surgeon reviews his current medications, which include tamsulosin 0.4 mg daily. Preoperative pupil dilation is achieved but appears slightly sluggish.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 68 bpm | BP: 130/82 mmHg
*   **Ocular Examination (OU):** The anterior segments are quiet. Deep anterior chambers. Gonioscopy shows open angles (Grade 4). Lenses show 3+ nuclear sclerosis bilaterally. Retinal examination is normal. During the initial steps of cataract surgery, immediately after making the corneal incision, the iris appears highly flaccid, billows in response to irrigation fluid, and repeatedly prolapses towards the surgical wound. The pupil, which was 7.5 mm, progressively constricts to 4.0 mm despite standard epinephrine in the irrigating bottle.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis, and which class of medications is responsible for this condition?', '["Pigment dispersion syndrome; systemic beta-blockers", "Congenital iris hypoplasia; systemic anticholinergic therapy", "Uveitic pupillary block; chronic topical corticosteroid use", "Pseudoexfoliative iridopathy; calcium channel blockers", "Intraoperative Floppy Iris Syndrome (IFIS); alpha-1A adrenergic receptor antagonists (e.g., tamsulosin)"]'::jsonb, 4, 'This is **Intraoperative Floppy Iris Syndrome (IFIS)**. It is caused by **alpha-1A adrenergic receptor antagonists**, most notably **tamsulosin (Flomax)**, which is widely prescribed for benign prostatic hyperplasia (BPH). The drug blocks the alpha-1A receptors in the iris dilator muscle, leading to muscle flaccidity, billowing, and intraoperative miosis.'),
    (v_case_id, 'What is the classic triad of signs that defines Intraoperative Floppy Iris Syndrome?', '["Flaccid iris stroma that billows with fluid currents, progressive intraoperative miosis, and a propensity for the iris to prolapse through corneal incisions", "Shallow anterior chamber, rock-hard globe, and steamy corneal edema", "Wrinkled anterior lens capsule, Elschnig''s pearls, and zonular dialysis", "Posterior synechiae, keratic precipitates, and cystoid macular edema", "Heavily pigmented trabecular meshwork, Krukenberg spindle, and mid-peripheral spoke-like iris defects"]'::jsonb, 0, 'The **classic triad of IFIS** consists of: (1) **a flaccid iris stroma** that billows and waves in response to normal intraoperative irrigation fluid currents, (2) **progressive intraoperative pupillary constriction (miosis)**, and (3) **a strong propensity for the iris tissue to prolapse** and escape through the corneal incisions.'),
    (v_case_id, 'Which of the following is the most appropriate management strategy for a patient with known IFIS undergoing cataract surgery?', '["Stopping tamsulosin 24 hours prior to surgery to fully reverse the iris muscle atrophy", "Increasing the ultrasound phacoemulsification power to rapidly emulsify the lens", "Performing an immediate surgical peripheral iridectomy before removing the cataract", "Using pupil expansion rings (e.g. Malyugin ring), iris hooks, or intraoperative intracameral phenylephrine/epinephrine", "Postponing the surgery and switching the patient to oral finasteride for 5 years"]'::jsonb, 3, 'Management of IFIS includes **pupil expansion rings (e.g. Malyugin ring)**, iris hooks, cohesive viscoelastics, or **intraoperative intracameral injection of alpha-agonists (phenylephrine or epinephrine)**. Stopping tamsulosin is generally **unsuccessful at reversing the syndrome**, as the drug causes long-lasting or permanent structural changes/atrophy of the iris dilator muscle; thus, the surgeon must prepare for IFIS even if the patient stopped the drug months ago.');

    ---------------------------------------------------------------------------
    -- CASE 30: Case Study: The Tremulous Lens (V3)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Case Study: The Tremulous Lens (V3)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Case Study: The Tremulous Lens (V3)', 'A 30-year-old male presents with fluctuating, blurry vision and double vision in his left eye.  He reports that he was struck in that eye by the fist of an assailant during a physical altercation 2 weeks ago.  He notes that when he moves his eye quickly, his vision seems to ''wobble'' and shake.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 74 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/120 (pinholes to 20/40); contralateral eye: 20/20
*   **Ocular Examination (OS):** The cornea is clear. Slit-lamp biomicroscopy reveals a highly **tremulous iris (iridodonesis)** and a **tremulous lens (phacodonesis)** upon eye movement. With a dilated pupil, the lens is seen to be subluxated inferiorly, exposing a 120-degree sector of **torn ciliary zonules (zonular dialysis)** superiorly. A small amount of vitreous gel is visible prolapsing into the anterior chamber around the superior edge of the lens. The intraocular pressure is 18 mmHg.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 30-year-old male presents with fluctuating, blurry vision and double vision in his left eye.  He reports that he was struck in that eye by the fist of an assailant during a physical altercation 2 weeks ago.  He notes that when he moves his eye quickly, his vision seems to ''wobble'' and shake.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 74 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/120 (pinholes to 20/40); contralateral eye: 20/20
*   **Ocular Examination (OS):** The cornea is clear. Slit-lamp biomicroscopy reveals a highly **tremulous iris (iridodonesis)** and a **tremulous lens (phacodonesis)** upon eye movement. With a dilated pupil, the lens is seen to be subluxated inferiorly, exposing a 120-degree sector of **torn ciliary zonules (zonular dialysis)** superiorly. A small amount of vitreous gel is visible prolapsing into the anterior chamber around the superior edge of the lens. The intraocular pressure is 18 mmHg.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis, and what do the terms ''iridodonesis'' and ''phacodonesis'' represent?', '["Lens subluxation with traumatic zonular dialysis; iridodonesis is trembling of the iris, phacodonesis is trembling of the lens", "Pigmentary glaucoma; iridodonesis is iris transillumination, phacodonesis is pigment in the lens", "Acute angle-closure glaucoma; iridodonesis is fixed pupil, phacodonesis is lens swelling", "Anterior uveitis; iridodonesis is inflammatory cells, phacodonesis is lens proteins", "Pseudoexfoliation syndrome; iridodonesis is iris atrophy, phacodonesis is lens displacement"]'::jsonb, 0, 'This patient has **lens subluxation with traumatic zonular dialysis**. **Iridodonesis** (tremble of the iris) and **phacodonesis** (tremble of the lens) are classic signs of zonular weakness or tearing. When the eye moves, the iris and lens lack proper structural support and oscillate/wobble, which is highly diagnostic of ciliary zonular damage.'),
    (v_case_id, 'What is the primary surgical device used during cataract extraction to support the remaining capsular bag in a patient with moderate zonular dialysis?', '["Nd:YAG laser capsulotome", "Scleral-fixated iris hook", "Ahmed Glaucoma Valve", "Capsular Tension Ring (CTR)", "Malyugin Pupil Expansion Ring"]'::jsonb, 3, 'For moderate zonular dialysis (<120-180 degrees), a **Capsular Tension Ring (CTR)** is inserted into the capsular bag. The CTR is a flexible PMMA ring that distributes the mechanical forces of the remaining intact zonules to the weakened areas, stabilizing the capsular bag, preventing vitreous prolapse, and allowing the safe implantation of a standard IOL.'),
    (v_case_id, 'Which of the following is the most appropriate surgical management for a patient with severe, progressive lens subluxation (>180 degrees of zonular dialysis) and vitreous in the anterior chamber?', '["Bilateral laser peripheral iridotomy and lifelong topical beta-blockers", "Pars plana lensectomy and anterior vitrectomy, followed by implantation of a scleral-fixated or iris-claw IOL", "Pressure patching the eye and scheduling a follow-up in 6 months", "Standard phacoemulsification with a standard CTR and standard bag-IOL placement", "Surgical trabeculectomy with mitomycin C while leaving the subluxated lens in place"]'::jsonb, 1, 'In cases of **severe lens subluxation (>180 degrees of zonular dialysis)** or when the lens is extremely unstable and vitreous is in the anterior chamber, standard phacoemulsification within the bag is highly dangerous. The recommended approach is a **lensectomy (often via pars plana) combined with an anterior vitrectomy** (to clear the prolapsed vitreous), followed by placement of a **scleral-fixated intraocular lens** (e.g. Yamane technique) or an **iris-claw/anterior chamber IOL**.');

    ---------------------------------------------------------------------------
    -- CASE 31: The Myopic Shift of Age - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Myopic Shift of Age - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Myopic Shift of Age - Case Analysis (V4)', 'A 78-year-old female presents with slowly progressive, painless blurring of vision in both eyes over the past 3 years. She reports having difficulty reading distance street signs and highway markers. Interestingly, she notes a surprising improvement in her near vision, allowing her to read the newspaper without reading glasses for the first time in a decade.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 78 bpm | BP: 129/83 mmHg
*   **Visual Acuity:** OS: 20/70 (no improvement with pinhole); contralateral eye: 20/25
*   **Ocular Examination (OS):** The anterior chamber is deep and quiet. Slit-lamp biomicroscopy of the lens reveals significant yellow-to-amber discoloration and moderate compaction of the lens nucleus. The contralateral lens shows similar but milder changes. Dilated fundus exam reveals normal optic discs with a cup-to-disc ratio of 0.3 OU, and a normal macula.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 78-year-old female presents with slowly progressive, painless blurring of vision in both eyes over the past 3 years. She reports having difficulty reading distance street signs and highway markers. Interestingly, she notes a surprising improvement in her near vision, allowing her to read the newspaper without reading glasses for the first time in a decade.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 78 bpm | BP: 129/83 mmHg
*   **Visual Acuity:** OS: 20/70 (no improvement with pinhole); contralateral eye: 20/25
*   **Ocular Examination (OS):** The anterior chamber is deep and quiet. Slit-lamp biomicroscopy of the lens reveals significant yellow-to-amber discoloration and moderate compaction of the lens nucleus. The contralateral lens shows similar but milder changes. Dilated fundus exam reveals normal optic discs with a cup-to-disc ratio of 0.3 OU, and a normal macula.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following represents the primary mechanism behind the patient''s temporary improvement in near vision?', '["Upregulation of ciliary muscle contractility compensating for presbyopia", "Increased refractive power of the lens due to increased density and nuclear compaction, causing a myopic shift", "Regeneration of accommodation capacity in the crystalline lens fibers", "Resolution of underlying subclinical macular edema", "Spontaneous flattening of the cornea leading to decreased hyperopic refractive error"]'::jsonb, 1, 'This patient has a **nuclear sclerotic cataract**, which characteristically causes a **myopic shift** (often referred to as **''second sight''**). The gradual compaction and sclerosis of the lens nucleus increase its refractive index, shifting the patient''s focal point closer. This allows presbyopic patients to temporarily read near print without reading glasses, though at the expense of distance vision.'),
    (v_case_id, 'Which of the following is the primary biochemical change associated with the development of nuclear sclerotic cataracts?', '["Proliferation of anterior lens epithelial cells on the capsular bag", "Hydration of lens cortical fibers due to osmotic swelling", "Deposition of systemic calcium salts within the lens stroma", "Aggregation and insolubilization of lens crystallin proteins, along with accumulation of urochrome pigment", "Autoimmune degradation of the lens capsule matrix"]'::jsonb, 3, 'Nuclear sclerotic cataracts are characterized by **aggregation and insolubilization of lens crystallin proteins**, along with the **accumulation of urochrome pigment** (which causes the yellow/brown coloration). This pigment filters out blue light and contributes to decreased color perception and contrast sensitivity.'),
    (v_case_id, 'Which of the following is the most appropriate next step in the management of this patient?', '["Initiation of systemic high-dose vitamin A and lutein supplementation", "Immediate referral for YAG laser capsulotomy to clear the visual axis", "Performing urgent surgical trabeculectomy to prevent secondary glaucoma", "Cataract extraction and intraocular lens (IOL) implantation if the vision impairment interferes with activities of daily living", "Prescribing daily topical non-steroidal anti-inflammatory drops to halt cataract progression"]'::jsonb, 3, 'The definitive treatment for cataracts is **cataract extraction and intraocular lens (IOL) implantation**. The indication for surgery is functional visual impairment that interferes with the patient''s activities of daily living (e.g. driving, reading). There are no approved pharmacologic agents to halt or reverse cataract formation.');

    ---------------------------------------------------------------------------
    -- CASE 32: The Glare of Headlights - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Glare of Headlights - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Glare of Headlights - Case Analysis (V4)', 'A 69-year-old male presents complaining of progressive difficulty driving at night. He reports experiencing debilitating glare and starbursts from the headlights of oncoming cars, which makes night driving extremely stressful. His distance vision has also become progressively blurry over the past 2 years.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 76 bpm | BP: 119/87 mmHg
*   **Visual Acuity:** OS: 20/50 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OS):** Slit-lamp biomicroscopy reveals white, wedge-shaped opacities extending from the peripheral lens cortex towards the center in a spoke-like pattern, particularly in the nasal and inferior quadrants. The lens nucleus is relatively clear. Fundus examination is normal with clear visualization of the retina.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 69-year-old male presents complaining of progressive difficulty driving at night. He reports experiencing debilitating glare and starbursts from the headlights of oncoming cars, which makes night driving extremely stressful. His distance vision has also become progressively blurry over the past 2 years.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 76 bpm | BP: 119/87 mmHg
*   **Visual Acuity:** OS: 20/50 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OS):** Slit-lamp biomicroscopy reveals white, wedge-shaped opacities extending from the peripheral lens cortex towards the center in a spoke-like pattern, particularly in the nasal and inferior quadrants. The lens nucleus is relatively clear. Fundus examination is normal with clear visualization of the retina.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following slit-lamp findings is most pathognomonic for a cortical cataract?', '["Wedge-shaped, spoke-like opacities starting in the peripheral cortex", "A subluxated lens showing stretched zonular fibers", "A granular, plaque-like opacity in the central posterior subcapsular area", "Golden-brown discoloration of the central lens nucleus", "Multiple small, hyper-pigmented spots on the anterior lens capsule"]'::jsonb, 0, '**Cortical cataracts** classically present as **wedge-shaped, spoke-like opacities** that start in the peripheral cortex and progress toward the center of the lens. They are best visualized with retroillumination, where they appear as dark silhouettes against the red reflex.'),
    (v_case_id, 'What is the primary underlying pathophysiological process driving cortical cataract formation?', '["Hydration and swelling of lens cortical fibers, leading to vacuole formation and clefting along suture lines", "Primary loss of ciliary body perfusion leading to lens ischemia", "Deposition of blood-derived lipids in the peripheral lens stroma", "Direct chemical oxidation of central nuclear crystallins by free radicals", "Proliferation and migration of equatorial lens epithelial cells to the posterior pole"]'::jsonb, 0, 'Cortical cataracts are driven by **hydration and swelling of lens cortical fibers**. This occurs due to disruption of the lens cell membrane integrity and the activity of the Na+/K+ ATPase pump. Water enters the lens, causing vacuole formation and subsequent **clefting along the natural lens suture lines**, presenting as the classic cortical spokes.'),
    (v_case_id, 'Which visual symptom is most specifically associated with cortical cataracts compared to nuclear sclerotic cataracts?', '["Fluctuating visual acuity related to systemic blood glucose levels", "A central gray scotoma with distorted lines", "Severe glare, starbursts, and monocular diplopia due to irregular light scattering", "Surprising improvement in near vision (second sight)", "Severe, throbbing ocular pain and redness"]'::jsonb, 2, 'Cortical cataracts are highly associated with **significant glare, starbursts, and halos** (especially at night from headlights) due to the irregular refraction and scattering of light as it passes through the peripheral cortical opacities. They can also cause **monocular diplopia** or polyopia due to the split-refractive properties of the hydrated lens clefts.');

    ---------------------------------------------------------------------------
    -- CASE 33: The Steroid-Induced Plaque - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Steroid-Induced Plaque - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Steroid-Induced Plaque - Case Analysis (V4)', 'A 36-year-old female with a history of severe asthma requiring frequent courses of systemic corticosteroids and daily inhaled fluticasone presents with a rapid, painless decrease in vision in her left eye over the past 3 months. She reports that her near vision is particularly severely affected, making it nearly impossible to read books or look at her phone.  She also complains of disabling glare in bright sunlight.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 68 bpm | BP: 123/81 mmHg
*   **Visual Acuity:** OS: 20/100 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OS):** Anterior chamber is deep and quiet. Slit-lamp exam of the lens reveals a dense, granular, plaque-like opacity located on the posterior surface of the lens, directly in the visual axis. The lens nucleus and cortex are clear. The intraocular pressure is 15 mmHg OU. Dilated fundus examination is normal.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 36-year-old female with a history of severe asthma requiring frequent courses of systemic corticosteroids and daily inhaled fluticasone presents with a rapid, painless decrease in vision in her left eye over the past 3 months. She reports that her near vision is particularly severely affected, making it nearly impossible to read books or look at her phone.  She also complains of disabling glare in bright sunlight.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 68 bpm | BP: 123/81 mmHg
*   **Visual Acuity:** OS: 20/100 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OS):** Anterior chamber is deep and quiet. Slit-lamp exam of the lens reveals a dense, granular, plaque-like opacity located on the posterior surface of the lens, directly in the visual axis. The lens nucleus and cortex are clear. The intraocular pressure is 15 mmHg OU. Dilated fundus examination is normal.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Traumatic cataract", "Nuclear sclerotic cataract", "Cortical cataract", "Posterior capsular opacification (PCO)", "Posterior subcapsular cataract (PSC)"]'::jsonb, 4, 'This patient has a **Posterior Subcapsular Cataract (PSC)**. Key features include the **plaque-like, granular opacity** on the posterior surface of the lens, a history of **corticosteroid use**, a **relatively young age**, and **disproportionately severe loss of near vision** and glare in bright conditions because the opacity is located directly in the nodal point of the eye.'),
    (v_case_id, 'What is the cellular origin of a posterior subcapsular cataract?', '["Necrosis of the central lens fiber cells due to chronic ischemia", "Myofibroblastic transdifferentiation of keratocytes in the corneal stroma", "Deposition of macrophages that have engulfed leaked lens proteins", "Abnormal migration and swelling of lens epithelial cells from the equator to the posterior pole, forming Wedl (bladder) cells", "Proliferation of iris pigment epithelial cells onto the anterior lens capsule"]'::jsonb, 3, 'PSCs arise from the **abnormal migration and swelling of lens epithelial cells**. Normally, lens epithelial cells are located on the anterior surface and migrate to the equator to differentiate into lens fibers. In PSC, these cells aberrantly migrate posteriorly to the posterior pole, where they swell and become large, nucleated, vacuolated cells known as **Wedl cells** or **bladder cells**, forming the posterior plaque.'),
    (v_case_id, 'Why does a posterior subcapsular cataract affect near vision more severely than distance vision?', '["The lens becomes extremely rigid and prevents accommodation completely", "Near vision requires a wider pupil, which exposes the peripheral cortical clefts", "Accommodative pupillary constriction (miosis) focuses light directly through the central posterior opacity", "Corticosteroids selectively damage the macular photoreceptors responsible for near vision", "The posterior capsule is physically connected to the ciliary zonules"]'::jsonb, 2, 'PSC affects **near vision more severely** because during near vision, the accommodation reflex triggers **pupillary constriction (miosis)**. This constricts the light path, forcing light to pass directly through the **small, central, posterior subcapsular plaque** located at the nodal point of the eye. In contrast, in dimmer light or distance vision, a slightly wider pupil allows light to pass around the central opacity, resulting in better distance acuity.');

    ---------------------------------------------------------------------------
    -- CASE 34: The Absent Red Reflex - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Absent Red Reflex - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Absent Red Reflex - Case Analysis (V4)', 'A 0-month-old infant is brought to the pediatric ophthalmology clinic by his parents who noticed an abnormal white appearance in the baby''s left pupil on a family photograph. The mother notes the baby does not seem to track toys or look at his face as well when the right eye is covered.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Central, steady, and maintained in the right eye; poor fixation and tracking in the left eye.
*   **Ocular Examination:** The right eye shows a normal, bright red reflex. The left eye has an absent red reflex, replaced by a dense, white, homogeneous opacity in the center of the pupil (leukocoria). Handheld slit-lamp exam reveals a dense, central nuclear lens opacity. The cornea is clear and corneal diameters are symmetric. No signs of intraocular inflammation or retinoblastoma are noted on B-scan ultrasound.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 0-month-old infant is brought to the pediatric ophthalmology clinic by his parents who noticed an abnormal white appearance in the baby''s left pupil on a family photograph. The mother notes the baby does not seem to track toys or look at his face as well when the right eye is covered.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Central, steady, and maintained in the right eye; poor fixation and tracking in the left eye.
*   **Ocular Examination:** The right eye shows a normal, bright red reflex. The left eye has an absent red reflex, replaced by a dense, white, homogeneous opacity in the center of the pupil (leukocoria). Handheld slit-lamp exam reveals a dense, central nuclear lens opacity. The cornea is clear and corneal diameters are symmetric. No signs of intraocular inflammation or retinoblastoma are noted on B-scan ultrasound.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most critical management priority for a dense, unilateral congenital cataract?', '["Watchful waiting and visual stimulation therapy until the child is at least 5 years old", "Initiation of daily topical corticosteroid drops to clear the lens opacity", "Urgent surgical cataract extraction within the first 6 to 8 weeks of life to prevent irreversible deprivation amblyopia", "Immediate systemic antiviral therapy for suspected congenital CMV", "Fitting with custom glasses and scheduling surgery at school age"]'::jsonb, 2, 'A dense, unilateral congenital cataract is a **visual emergency**. It must be treated with **urgent surgical extraction (lensectomy) within the first 6 to 8 weeks of life**. Delaying surgery beyond the critical period of visual development leads to permanent, irreversible **deprivation amblyopia**, as the visual cortex fails to develop proper synaptic connections with the affected eye.'),
    (v_case_id, 'Which congenital infection is most classically associated with congenital cataracts, microphthalmia, and sensorineural hearing loss?', '["Congenital Rubella Syndrome", "Congenital Syphilis", "Congenital Cytomegalovirus", "Congenital Herpes Simplex Virus", "Congenital Toxoplasmosis"]'::jsonb, 0, '**Congenital Rubella Syndrome** is classically associated with the triad of **cataracts** (often bilateral), **microphthalmia/pigmentary retinopathy**, **sensorineural hearing loss**, and **cardiac defects** (patent ductus arteriosus). The rubella virus directly infects the developing lens vesicle in utero before the capsule forms, leading to chronic replication within the lens fibers.'),
    (v_case_id, 'Following congenital cataract surgery in an infant, what is the primary method of visual rehabilitation to prevent amblyopia?', '["Implantation of a standard adult monofocal intraocular lens without patching", "There is no effective visual rehabilitation method for aphakic infants", "Fitting with a high-power contact lens (aphakic contact lens) and patching the contralateral eye (occlusion therapy)", "Performing daily laser therapy to stimulate the macula", "Prescribing standard bifocal glasses and hoping the eyes self-correct"]'::jsonb, 2, 'Visual rehabilitation in an aphakic infant is crucial. Because the infant''s eye is small and rapidly growing, primary IOL implantation is highly challenging and risky. Therefore, infants are rehabilitated with a **high-power aphakic contact lens** (or aphakic glasses for bilateral cases) to correct the severe refractive error, combined with **occlusion therapy (patching of the normal eye)** to force the brain to use the surgical eye and prevent amblyopia.');

    ---------------------------------------------------------------------------
    -- CASE 35: The Blunt Rosette - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blunt Rosette - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blunt Rosette - Case Analysis (V4)', 'A 24-year-old male presents with a 3-month history of progressive visual blur in his left eye. Upon questioning, he recalls being struck in that eye by a tennis ball during a match approximately 8 months ago. He experienced temporary pain and bruising but did not seek medical attention at the time.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 78 bpm | BP: 137/85 mmHg
*   **Visual Acuity:** OS: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior chamber is deep and quiet. Gonioscopy shows 15% angle recession inferiorly. Slit-lamp exam of the lens reveals a classic rosette-shaped or star-shaped cortical opacity located in the posterior subcapsular region. The ciliary zonules appear intact, and there is no lens subluxation or phacodonesis. The intraocular pressure is 14 mmHg OU.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old male presents with a 3-month history of progressive visual blur in his left eye. Upon questioning, he recalls being struck in that eye by a tennis ball during a match approximately 8 months ago. He experienced temporary pain and bruising but did not seek medical attention at the time.

**Physical Examination:**
*   **Vitals:** Temp: 98.2°F | HR: 78 bpm | BP: 137/85 mmHg
*   **Visual Acuity:** OS: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior chamber is deep and quiet. Gonioscopy shows 15% angle recession inferiorly. Slit-lamp exam of the lens reveals a classic rosette-shaped or star-shaped cortical opacity located in the posterior subcapsular region. The ciliary zonules appear intact, and there is no lens subluxation or phacodonesis. The intraocular pressure is 14 mmHg OU.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which classic morphology is most characteristic of a cataract caused by blunt, non-penetrating ocular trauma?', '["Amber-colored central oil-droplet opacity", "Dense, golden-brown nuclear compaction", "White, flaky, dandruff-like deposits on the anterior capsule", "Rosette-shaped or stellate-shaped cortical opacity", "Wedge-shaped, spoke-like peripheral clefts"]'::jsonb, 3, 'Blunt, non-penetrating ocular trauma characteristically causes a **rosette-shaped or stellate-shaped cortical opacity**, typically located in the posterior or anterior subcapsular cortex. The concussive wave transmission through the eye disrupts the lens fibers, leading to fluid accumulation along the suture lines in this unique flower-like pattern.'),
    (v_case_id, 'What is the primary pathophysiology behind traumatic cataract formation after blunt trauma?', '["Localized ischemia of the ciliary body processes that supply the lens", "Secondary calcification of the posterior lens capsule due to intraocular hemorrhage", "Disruption of the lens capsule or ciliary zonules, allowing aqueous humor to enter and hydrate the lens fibers", "Direct chemical necrosis of lens crystallins by inflammatory cytokines", "A chronic, low-grade bacterial infection of the lens cortex"]'::jsonb, 2, 'Blunt trauma causes **micro-ruptures or increased permeability of the lens capsule** (or direct injury to the subcapsular lens fibers). This allows **aqueous humor to enter and hydrate the lens fibers**, leading to localized opacification and swelling. Over time, this focal hydration spreads, often resulting in a mature, completely opaque cataract.'),
    (v_case_id, 'What other clinical finding must be ruled out in a patient with a traumatic cataract before planning surgery?', '["A contralateral optic nerve Drance hemorrhage", "Pseudoexfoliative deposits on the corneal endothelium", "An underlying mutation in the fibrillin-1 gene", "Zonular dialysis, angle recession, and secondary glaucoma", "Congenital dacryostenosis and tear duct block"]'::jsonb, 3, 'Prior blunt trauma carries a high risk of **zonular dialysis** (weakness/tearing of the lens support cords), **angle recession** (tearing of the iris insertion, which can lead to late secondary glaucoma), and **vitreous prolapse**. The surgeon must carefully evaluate for iris and lens tremulousness (iridodonesis/phacodonesis) and angle structure, as zonular weakness significantly complicates cataract surgery.');

    ---------------------------------------------------------------------------
    -- CASE 36: The Liquefied Cortex - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Liquefied Cortex - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Liquefied Cortex - Case Analysis (V4)', 'A 86-year-old male from an underserved rural community presents with profound, painless vision loss in his left eye. He reports that the eye has been virtually blind for over 4 years, but he did not seek treatment due to lack of local services and fear of surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 71 bpm | BP: 119/78 mmHg
*   **Visual Acuity:** OS: Hand Motion (good light projection); contralateral eye: 20/40
*   **Ocular Examination (OS):** Anterior chamber is deep. Slit-lamp biomicroscopy of the lens reveals a completely white, opaque lens. The lens cortex has completely liquefied into a milky white fluid. The dense, brown, sclerotic lens nucleus is clearly visible, having subsided and sunk to the bottom of the capsular bag. The anterior lens capsule appears wrinkled and thickened. There is no active inflammation or elevated IOP today.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 86-year-old male from an underserved rural community presents with profound, painless vision loss in his left eye. He reports that the eye has been virtually blind for over 4 years, but he did not seek treatment due to lack of local services and fear of surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 71 bpm | BP: 119/78 mmHg
*   **Visual Acuity:** OS: Hand Motion (good light projection); contralateral eye: 20/40
*   **Ocular Examination (OS):** Anterior chamber is deep. Slit-lamp biomicroscopy of the lens reveals a completely white, opaque lens. The lens cortex has completely liquefied into a milky white fluid. The dense, brown, sclerotic lens nucleus is clearly visible, having subsided and sunk to the bottom of the capsular bag. The anterior lens capsule appears wrinkled and thickened. There is no active inflammation or elevated IOP today.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis for this specific type of hypermature cataract?', '["Posterior subcapsular cataract", "Morgagnian cataract", "Nuclear sclerotic cataract", "Phacolytic cataract", "Cortical cataract"]'::jsonb, 1, 'This is a **Morgagnian cataract**, which is a specific form of **hypermature cataract**. In this advanced stage, the lens cortex undergoes enzymatic degeneration and **completely liquefies into a milky fluid**. Lacking support, the dense, dehydrated, **sclerotic nucleus sinks** to the bottom of the capsular bag under the influence of gravity.'),
    (v_case_id, 'Which of the following represents a serious, potentially blinding ocular emergency associated with hypermature cataracts?', '["Acute primary angle-closure glaucoma due to pupillary block", "Phacoanaphylactic endophthalmitis, a direct autoimmune response to a ruptured lens capsule", "Tractional retinal detachment due to vitreal-capsular bands", "Phacolytic glaucoma, caused by the leakage of high-molecular-weight lens proteins through the intact capsule", "Neovascular glaucoma driven by chronic lens ischemia"]'::jsonb, 3, 'Hypermature cataracts carry a high risk of **phacolytic glaucoma**. As the cortex liquefies, **high-molecular-weight lens proteins leak** through microscopic pores in the degenerating, wrinkled anterior lens capsule. Macrophages migrate to engulf these foreign proteins. Both the proteins and protein-laden macrophages physically clog the trabecular meshwork, causing a rapid, severe rise in IOP in a deep-chambered, quiet eye.'),
    (v_case_id, 'What is the primary surgical challenge encountered during the extraction of a Morgagnian cataract?', '["Severe intraoperative miosis that does not respond to epinephrine", "An increased risk of severe retrobulbar hemorrhage during anesthesia", "Creating a continuous curvilinear capsulorhexis in a highly pressurized capsular bag with poor visualization of the capsule", "Fragility of the corneal epithelium under standard ultrasound energy", "Finding a specialized IOL designed to fit in a liquefied capsule"]'::jsonb, 2, 'The primary surgical challenge is **creating a safe capsulorhexis**. The liquefied cortex creates a **highly pressurized capsular bag**. When the needle or forceps punctures the anterior capsule, the pressurized milky fluid immediately escapes, obscuring visualization and causing the capsular tear to rapidly run out to the equator (the **''Argentinian flag sign''**). A trypan blue dye stain and venting of the liquid cortex are required to safely complete the capsulorhexis.');

    ---------------------------------------------------------------------------
    -- CASE 37: The Superotemporal Subluxation - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Superotemporal Subluxation - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Superotemporal Subluxation - Case Analysis (V4)', 'A 12-year-old tall, thin female with a history of joint hypermobility, mild scoliosis, and a pectus excavatum deformity presents for a comprehensive ophthalmic evaluation. She complains of fluctuating, blurry vision in both eyes that has worsened over the past 4 years. She reports seeing double with either eye individually (monocular diplopia) at times.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 65 bpm | BP: 110/70 mmHg
*   **Visual Acuity:** Bilateral 20/80 (uncorrected); pinhole corrects to 20/30
*   **Ocular Examination (OU):** The anterior chambers are deep. Slit-lamp biomicroscopy after pupillary dilation reveals bilateral, symmetrical displacement and **subluxation of the crystalline lenses in a superotemporal direction**. Stretched, intact ciliary zonular fibers are clearly visible in the lower-nasal pupillary aperture. Tremulousness of the iris (iridodonesis) is present upon rapid eye movements.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 12-year-old tall, thin female with a history of joint hypermobility, mild scoliosis, and a pectus excavatum deformity presents for a comprehensive ophthalmic evaluation. She complains of fluctuating, blurry vision in both eyes that has worsened over the past 4 years. She reports seeing double with either eye individually (monocular diplopia) at times.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 65 bpm | BP: 110/70 mmHg
*   **Visual Acuity:** Bilateral 20/80 (uncorrected); pinhole corrects to 20/30
*   **Ocular Examination (OU):** The anterior chambers are deep. Slit-lamp biomicroscopy after pupillary dilation reveals bilateral, symmetrical displacement and **subluxation of the crystalline lenses in a superotemporal direction**. Stretched, intact ciliary zonular fibers are clearly visible in the lower-nasal pupillary aperture. Tremulousness of the iris (iridodonesis) is present upon rapid eye movements.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely underlying diagnosis, and in what direction is the lens classically displaced?', '["Marfan syndrome; superotemporal displacement of the lens", "Weill-Marchesani syndrome; symmetrical inferior displacement", "Sulfite oxidase deficiency; progressive nasal displacement", "Homocystinuria; inferonasal displacement of the lens", "Traumatic zonular dialysis; random displacement based on trauma force"]'::jsonb, 0, 'This patient has **Marfan syndrome**, an autosomal dominant connective tissue disorder. The classic ocular manifestation is **ectopia lentis (lens subluxation)**, which occurs bilaterally and symmetrically in up to 80% of patients. In Marfan syndrome, the lens classically displaces in a **superotemporal direction**, with ciliary zonules remaining stretched but largely intact.'),
    (v_case_id, 'Which genetic mutation is responsible for the systemic and ocular manifestations of this patient''s syndrome?', '["ELN gene on chromosome 7, encoding elastin", "COL1A1 gene on chromosome 17, encoding type I collagen", "CBS gene on chromosome 21, encoding cystathionine beta-synthase", "TGFBR1 gene on chromosome 9, encoding transforming factor receptor", "FBN1 gene on chromosome 15, encoding fibrillin-1"]'::jsonb, 4, 'Marfan syndrome is caused by mutations in the **FBN1 gene on chromosome 15q21**, which encodes **fibrillin-1**, a major glycoprotein component of extracellular microfibrils. Fibrillin-1 is highly abundant in the **ciliary zonules** (the suspension cords of the lens), as well as the aortic media and skeletal system, explaining the classic multi-system clinical features.'),
    (v_case_id, 'Which clinical feature helps differentiate the ectopia lentis of Homocystinuria from that of Marfan Syndrome?', '["Homocystinuria is inherited in an autosomal dominant pattern with normal life expectancy", "In Homocystinuria, the lens is displaced superotemporally and the zonules are completely intact", "In Homocystinuria, lens subluxation is classically inferonasal, the zonules are completely broken, and patients have intellectual disability and thromboembolic risk", "In Homocystinuria, patients are extremely short in stature with stiff joints and small hands", "In Homocystinuria, the lens never subluxates but undergoes rapid calcification"]'::jsonb, 2, '**Homocystinuria** (an autosomal recessive metabolic disorder) is differentiated by: (1) **inferonasal displacement** of the lens, (2) **complete disintegration and breakdown of the ciliary zonules** (which are composed of cysteine-rich fibers damaged by homocysteine), and (3) systemic features like **intellectual disability, skeletal deformities, and a high risk of life-threatening thromboembolism**.');

    ---------------------------------------------------------------------------
    -- CASE 38: The 'Second Cataract' - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The ''Second Cataract'' - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The ''Second Cataract'' - Case Analysis (V4)', 'A 69-year-old female presents complaining that the cataract in her left eye has ''grown back.'' She underwent highly successful, uncomplicated cataract extraction with intraocular lens (IOL) implantation in that eye 18 months ago, achieving 20/20 vision postoperatively. However, over the past 3 months, her vision has become progressively blurry and hazy, accompanied by significant glare when looking at bright lights.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 70 bpm | BP: 128/78 mmHg
*   **Visual Acuity:** OS: 20/60 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior chamber is quiet. A three-piece monofocal acrylic intraocular lens is perfectly centered within the capsular bag. However, the posterior capsule behind the IOL appears significantly thickened, hazy, and translucent, showing multiple small, vesicular, pearl-like vacuolated cells growing across the central visual axis (Elschnig''s pearls).', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 69-year-old female presents complaining that the cataract in her left eye has ''grown back.'' She underwent highly successful, uncomplicated cataract extraction with intraocular lens (IOL) implantation in that eye 18 months ago, achieving 20/20 vision postoperatively. However, over the past 3 months, her vision has become progressively blurry and hazy, accompanied by significant glare when looking at bright lights.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 70 bpm | BP: 128/78 mmHg
*   **Visual Acuity:** OS: 20/60 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior chamber is quiet. A three-piece monofocal acrylic intraocular lens is perfectly centered within the capsular bag. However, the posterior capsule behind the IOL appears significantly thickened, hazy, and translucent, showing multiple small, vesicular, pearl-like vacuolated cells growing across the central visual axis (Elschnig''s pearls).', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the gold-standard treatment?', '["Posterior capsular opacification (PCO); Nd:YAG laser posterior capsulotomy", "Recurrent nuclear cataract; repeat surgical cataract extraction", "Corneal endothelial decompensation; Descemet''s stripping endothelial keratoplasty", "Neovascularization of the posterior capsule; intravitreal anti-VEGF injection", "Cystoid macular edema; topical non-steroidal anti-inflammatory drops"]'::jsonb, 0, 'This is **Posterior Capsular Opacification (PCO)**, the most common late complication of modern cataract surgery (often called a **''second cataract''** by patients). The gold-standard treatment is an outpatient **Nd:YAG laser posterior capsulotomy**, which uses a specialized laser to safely create a small circular opening in the hazy posterior capsule, instantly restoring the clear optical path.'),
    (v_case_id, 'Which cellular mechanism is primarily responsible for the development of PCO?', '["Proliferation, migration, and myofibroblastic transdifferentiation of residual lens epithelial cells on the capsular bag", "Slow, localized vitreous degeneration and condensation behind the lens", "Precipitation of systemic calcium salts onto the surface of the acrylic IOL", "Infiltration of the subretinal space by corneal endothelial cells", "Deposition of chronic inflammatory cells and macrophages on the posterior lens capsule"]'::jsonb, 0, 'PCO is caused by the **proliferation, migration, and myofibroblastic transdifferentiation of residual lens epithelial cells (LECs)**. During cataract surgery, some LECs are left behind in the equatorial region of the capsular bag. Over time, these cells migrate across the posterior capsule, forming **Elschnig''s pearls** (vacuolated cells) or causing capsular wrinkling and fibrosis, which scatters light.'),
    (v_case_id, 'Which of the following is a potential, rare complication of the laser treatment used to manage PCO?', '["Neovascularization of the anterior chamber angle", "Rhegmatogenous retinal detachment and IOL damage/pitting", "Ischemia and atrophy of the optic nerve head", "Corneal endothelial cell loss and corneal melting", "Acute, synechial angle-closure glaucoma"]'::jsonb, 1, 'While Nd:YAG laser capsulotomy is highly safe, rare complications include: (1) **rhegmatogenous retinal detachment** (due to shockwaves transmitted to the vitreous cavity, especially in high myopes), (2) **transient intraocular pressure spikes**, (3) **IOL damage or pitting** if the laser is misfocused, and (4) **cystoid macular edema** (Irvine-Gass syndrome).');

    ---------------------------------------------------------------------------
    -- CASE 39: The Billowing Iris - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Billowing Iris - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Billowing Iris - Case Analysis (V4)', 'A 71-year-old male with a history of benign prostatic hyperplasia (BPH) presenting with a progressive nuclear sclerotic cataract is scheduled for routine phacoemulsification. During his preoperative assessment, the surgeon reviews his current medications, which include tamsulosin 0.4 mg daily. Preoperative pupil dilation is achieved but appears slightly sluggish.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 68 bpm | BP: 130/82 mmHg
*   **Ocular Examination (OU):** The anterior segments are quiet. Deep anterior chambers. Gonioscopy shows open angles (Grade 4). Lenses show 3+ nuclear sclerosis bilaterally. Retinal examination is normal. During the initial steps of cataract surgery, immediately after making the corneal incision, the iris appears highly flaccid, billows in response to irrigation fluid, and repeatedly prolapses towards the surgical wound. The pupil, which was 7.5 mm, progressively constricts to 4.0 mm despite standard epinephrine in the irrigating bottle.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 71-year-old male with a history of benign prostatic hyperplasia (BPH) presenting with a progressive nuclear sclerotic cataract is scheduled for routine phacoemulsification. During his preoperative assessment, the surgeon reviews his current medications, which include tamsulosin 0.4 mg daily. Preoperative pupil dilation is achieved but appears slightly sluggish.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 68 bpm | BP: 130/82 mmHg
*   **Ocular Examination (OU):** The anterior segments are quiet. Deep anterior chambers. Gonioscopy shows open angles (Grade 4). Lenses show 3+ nuclear sclerosis bilaterally. Retinal examination is normal. During the initial steps of cataract surgery, immediately after making the corneal incision, the iris appears highly flaccid, billows in response to irrigation fluid, and repeatedly prolapses towards the surgical wound. The pupil, which was 7.5 mm, progressively constricts to 4.0 mm despite standard epinephrine in the irrigating bottle.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis, and which class of medications is responsible for this condition?', '["Pigment dispersion syndrome; systemic beta-blockers", "Uveitic pupillary block; chronic topical corticosteroid use", "Intraoperative Floppy Iris Syndrome (IFIS); alpha-1A adrenergic receptor antagonists (e.g., tamsulosin)", "Congenital iris hypoplasia; systemic anticholinergic therapy", "Pseudoexfoliative iridopathy; calcium channel blockers"]'::jsonb, 2, 'This is **Intraoperative Floppy Iris Syndrome (IFIS)**. It is caused by **alpha-1A adrenergic receptor antagonists**, most notably **tamsulosin (Flomax)**, which is widely prescribed for benign prostatic hyperplasia (BPH). The drug blocks the alpha-1A receptors in the iris dilator muscle, leading to muscle flaccidity, billowing, and intraoperative miosis.'),
    (v_case_id, 'What is the classic triad of signs that defines Intraoperative Floppy Iris Syndrome?', '["Heavily pigmented trabecular meshwork, Krukenberg spindle, and mid-peripheral spoke-like iris defects", "Shallow anterior chamber, rock-hard globe, and steamy corneal edema", "Flaccid iris stroma that billows with fluid currents, progressive intraoperative miosis, and a propensity for the iris to prolapse through corneal incisions", "Posterior synechiae, keratic precipitates, and cystoid macular edema", "Wrinkled anterior lens capsule, Elschnig''s pearls, and zonular dialysis"]'::jsonb, 2, 'The **classic triad of IFIS** consists of: (1) **a flaccid iris stroma** that billows and waves in response to normal intraoperative irrigation fluid currents, (2) **progressive intraoperative pupillary constriction (miosis)**, and (3) **a strong propensity for the iris tissue to prolapse** and escape through the corneal incisions.'),
    (v_case_id, 'Which of the following is the most appropriate management strategy for a patient with known IFIS undergoing cataract surgery?', '["Performing an immediate surgical peripheral iridectomy before removing the cataract", "Using pupil expansion rings (e.g. Malyugin ring), iris hooks, or intraoperative intracameral phenylephrine/epinephrine", "Stopping tamsulosin 24 hours prior to surgery to fully reverse the iris muscle atrophy", "Postponing the surgery and switching the patient to oral finasteride for 5 years", "Increasing the ultrasound phacoemulsification power to rapidly emulsify the lens"]'::jsonb, 1, 'Management of IFIS includes **pupil expansion rings (e.g. Malyugin ring)**, iris hooks, cohesive viscoelastics, or **intraoperative intracameral injection of alpha-agonists (phenylephrine or epinephrine)**. Stopping tamsulosin is generally **unsuccessful at reversing the syndrome**, as the drug causes long-lasting or permanent structural changes/atrophy of the iris dilator muscle; thus, the surgeon must prepare for IFIS even if the patient stopped the drug months ago.');

    ---------------------------------------------------------------------------
    -- CASE 40: The Tremulous Lens - Case Analysis (V4)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tremulous Lens - Case Analysis (V4)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tremulous Lens - Case Analysis (V4)', 'A 26-year-old female presents with fluctuating, blurry vision and double vision in her left eye.  She reports that she was struck in that eye by the fist of an assailant during a physical altercation 2 weeks ago.  She notes that when she moves her eye quickly, her vision seems to ''wobble'' and shake.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 74 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/120 (pinholes to 20/40); contralateral eye: 20/20
*   **Ocular Examination (OS):** The cornea is clear. Slit-lamp biomicroscopy reveals a highly **tremulous iris (iridodonesis)** and a **tremulous lens (phacodonesis)** upon eye movement. With a dilated pupil, the lens is seen to be subluxated inferiorly, exposing a 120-degree sector of **torn ciliary zonules (zonular dialysis)** superiorly. A small amount of vitreous gel is visible prolapsing into the anterior chamber around the superior edge of the lens. The intraocular pressure is 18 mmHg.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 26-year-old female presents with fluctuating, blurry vision and double vision in her left eye.  She reports that she was struck in that eye by the fist of an assailant during a physical altercation 2 weeks ago.  She notes that when she moves her eye quickly, her vision seems to ''wobble'' and shake.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 74 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/120 (pinholes to 20/40); contralateral eye: 20/20
*   **Ocular Examination (OS):** The cornea is clear. Slit-lamp biomicroscopy reveals a highly **tremulous iris (iridodonesis)** and a **tremulous lens (phacodonesis)** upon eye movement. With a dilated pupil, the lens is seen to be subluxated inferiorly, exposing a 120-degree sector of **torn ciliary zonules (zonular dialysis)** superiorly. A small amount of vitreous gel is visible prolapsing into the anterior chamber around the superior edge of the lens. The intraocular pressure is 18 mmHg.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis, and what do the terms ''iridodonesis'' and ''phacodonesis'' represent?', '["Anterior uveitis; iridodonesis is inflammatory cells, phacodonesis is lens proteins", "Pseudoexfoliation syndrome; iridodonesis is iris atrophy, phacodonesis is lens displacement", "Acute angle-closure glaucoma; iridodonesis is fixed pupil, phacodonesis is lens swelling", "Lens subluxation with traumatic zonular dialysis; iridodonesis is trembling of the iris, phacodonesis is trembling of the lens", "Pigmentary glaucoma; iridodonesis is iris transillumination, phacodonesis is pigment in the lens"]'::jsonb, 3, 'This patient has **lens subluxation with traumatic zonular dialysis**. **Iridodonesis** (tremble of the iris) and **phacodonesis** (tremble of the lens) are classic signs of zonular weakness or tearing. When the eye moves, the iris and lens lack proper structural support and oscillate/wobble, which is highly diagnostic of ciliary zonular damage.'),
    (v_case_id, 'What is the primary surgical device used during cataract extraction to support the remaining capsular bag in a patient with moderate zonular dialysis?', '["Scleral-fixated iris hook", "Malyugin Pupil Expansion Ring", "Nd:YAG laser capsulotome", "Capsular Tension Ring (CTR)", "Ahmed Glaucoma Valve"]'::jsonb, 3, 'For moderate zonular dialysis (<120-180 degrees), a **Capsular Tension Ring (CTR)** is inserted into the capsular bag. The CTR is a flexible PMMA ring that distributes the mechanical forces of the remaining intact zonules to the weakened areas, stabilizing the capsular bag, preventing vitreous prolapse, and allowing the safe implantation of a standard IOL.'),
    (v_case_id, 'Which of the following is the most appropriate surgical management for a patient with severe, progressive lens subluxation (>180 degrees of zonular dialysis) and vitreous in the anterior chamber?', '["Pressure patching the eye and scheduling a follow-up in 6 months", "Surgical trabeculectomy with mitomycin C while leaving the subluxated lens in place", "Standard phacoemulsification with a standard CTR and standard bag-IOL placement", "Bilateral laser peripheral iridotomy and lifelong topical beta-blockers", "Pars plana lensectomy and anterior vitrectomy, followed by implantation of a scleral-fixated or iris-claw IOL"]'::jsonb, 4, 'In cases of **severe lens subluxation (>180 degrees of zonular dialysis)** or when the lens is extremely unstable and vitreous is in the anterior chamber, standard phacoemulsification within the bag is highly dangerous. The recommended approach is a **lensectomy (often via pars plana) combined with an anterior vitrectomy** (to clear the prolapsed vitreous), followed by placement of a **scleral-fixated intraocular lens** (e.g. Yamane technique) or an **iris-claw/anterior chamber IOL**.');

    ---------------------------------------------------------------------------
    -- CASE 41: Vignette: The Myopic Shift of Age (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Myopic Shift of Age (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Myopic Shift of Age (V5)', 'A 70-year-old male presents with slowly progressive, painless blurring of vision in both eyes over the past 2 years. He reports having difficulty reading distance street signs and highway markers. Interestingly, he notes a surprising improvement in his near vision, allowing his to read the newspaper without reading glasses for the first time in a decade.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 77 bpm | BP: 137/88 mmHg
*   **Visual Acuity:** OD: 20/70 (no improvement with pinhole); contralateral eye: 20/25
*   **Ocular Examination (OD):** The anterior chamber is deep and quiet. Slit-lamp biomicroscopy of the lens reveals significant yellow-to-amber discoloration and moderate compaction of the lens nucleus. The contralateral lens shows similar but milder changes. Dilated fundus exam reveals normal optic discs with a cup-to-disc ratio of 0.3 OU, and a normal macula.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 70-year-old male presents with slowly progressive, painless blurring of vision in both eyes over the past 2 years. He reports having difficulty reading distance street signs and highway markers. Interestingly, he notes a surprising improvement in his near vision, allowing his to read the newspaper without reading glasses for the first time in a decade.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 77 bpm | BP: 137/88 mmHg
*   **Visual Acuity:** OD: 20/70 (no improvement with pinhole); contralateral eye: 20/25
*   **Ocular Examination (OD):** The anterior chamber is deep and quiet. Slit-lamp biomicroscopy of the lens reveals significant yellow-to-amber discoloration and moderate compaction of the lens nucleus. The contralateral lens shows similar but milder changes. Dilated fundus exam reveals normal optic discs with a cup-to-disc ratio of 0.3 OU, and a normal macula.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following represents the primary mechanism behind the patient''s temporary improvement in near vision?', '["Spontaneous flattening of the cornea leading to decreased hyperopic refractive error", "Regeneration of accommodation capacity in the crystalline lens fibers", "Resolution of underlying subclinical macular edema", "Upregulation of ciliary muscle contractility compensating for presbyopia", "Increased refractive power of the lens due to increased density and nuclear compaction, causing a myopic shift"]'::jsonb, 4, 'This patient has a **nuclear sclerotic cataract**, which characteristically causes a **myopic shift** (often referred to as **''second sight''**). The gradual compaction and sclerosis of the lens nucleus increase its refractive index, shifting the patient''s focal point closer. This allows presbyopic patients to temporarily read near print without reading glasses, though at the expense of distance vision.'),
    (v_case_id, 'Which of the following is the primary biochemical change associated with the development of nuclear sclerotic cataracts?', '["Hydration of lens cortical fibers due to osmotic swelling", "Autoimmune degradation of the lens capsule matrix", "Proliferation of anterior lens epithelial cells on the capsular bag", "Deposition of systemic calcium salts within the lens stroma", "Aggregation and insolubilization of lens crystallin proteins, along with accumulation of urochrome pigment"]'::jsonb, 4, 'Nuclear sclerotic cataracts are characterized by **aggregation and insolubilization of lens crystallin proteins**, along with the **accumulation of urochrome pigment** (which causes the yellow/brown coloration). This pigment filters out blue light and contributes to decreased color perception and contrast sensitivity.'),
    (v_case_id, 'Which of the following is the most appropriate next step in the management of this patient?', '["Immediate referral for YAG laser capsulotomy to clear the visual axis", "Performing urgent surgical trabeculectomy to prevent secondary glaucoma", "Cataract extraction and intraocular lens (IOL) implantation if the vision impairment interferes with activities of daily living", "Prescribing daily topical non-steroidal anti-inflammatory drops to halt cataract progression", "Initiation of systemic high-dose vitamin A and lutein supplementation"]'::jsonb, 2, 'The definitive treatment for cataracts is **cataract extraction and intraocular lens (IOL) implantation**. The indication for surgery is functional visual impairment that interferes with the patient''s activities of daily living (e.g. driving, reading). There are no approved pharmacologic agents to halt or reverse cataract formation.');

    ---------------------------------------------------------------------------
    -- CASE 42: Vignette: The Glare of Headlights (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Glare of Headlights (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Glare of Headlights (V5)', 'A 76-year-old male presents complaining of progressive difficulty driving at night. He reports experiencing debilitating glare and starbursts from the headlights of oncoming cars, which makes night driving extremely stressful. His distance vision has also become progressively blurry over the past 3 years.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 72 bpm | BP: 118/88 mmHg
*   **Visual Acuity:** OS: 20/50 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OS):** Slit-lamp biomicroscopy reveals white, wedge-shaped opacities extending from the peripheral lens cortex towards the center in a spoke-like pattern, particularly in the nasal and inferior quadrants. The lens nucleus is relatively clear. Fundus examination is normal with clear visualization of the retina.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 76-year-old male presents complaining of progressive difficulty driving at night. He reports experiencing debilitating glare and starbursts from the headlights of oncoming cars, which makes night driving extremely stressful. His distance vision has also become progressively blurry over the past 3 years.

**Physical Examination:**
*   **Vitals:** Temp: 98.7°F | HR: 72 bpm | BP: 118/88 mmHg
*   **Visual Acuity:** OS: 20/50 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OS):** Slit-lamp biomicroscopy reveals white, wedge-shaped opacities extending from the peripheral lens cortex towards the center in a spoke-like pattern, particularly in the nasal and inferior quadrants. The lens nucleus is relatively clear. Fundus examination is normal with clear visualization of the retina.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following slit-lamp findings is most pathognomonic for a cortical cataract?', '["Multiple small, hyper-pigmented spots on the anterior lens capsule", "A granular, plaque-like opacity in the central posterior subcapsular area", "Golden-brown discoloration of the central lens nucleus", "Wedge-shaped, spoke-like opacities starting in the peripheral cortex", "A subluxated lens showing stretched zonular fibers"]'::jsonb, 3, '**Cortical cataracts** classically present as **wedge-shaped, spoke-like opacities** that start in the peripheral cortex and progress toward the center of the lens. They are best visualized with retroillumination, where they appear as dark silhouettes against the red reflex.'),
    (v_case_id, 'What is the primary underlying pathophysiological process driving cortical cataract formation?', '["Deposition of blood-derived lipids in the peripheral lens stroma", "Direct chemical oxidation of central nuclear crystallins by free radicals", "Proliferation and migration of equatorial lens epithelial cells to the posterior pole", "Primary loss of ciliary body perfusion leading to lens ischemia", "Hydration and swelling of lens cortical fibers, leading to vacuole formation and clefting along suture lines"]'::jsonb, 4, 'Cortical cataracts are driven by **hydration and swelling of lens cortical fibers**. This occurs due to disruption of the lens cell membrane integrity and the activity of the Na+/K+ ATPase pump. Water enters the lens, causing vacuole formation and subsequent **clefting along the natural lens suture lines**, presenting as the classic cortical spokes.'),
    (v_case_id, 'Which visual symptom is most specifically associated with cortical cataracts compared to nuclear sclerotic cataracts?', '["Surprising improvement in near vision (second sight)", "Fluctuating visual acuity related to systemic blood glucose levels", "Severe, throbbing ocular pain and redness", "A central gray scotoma with distorted lines", "Severe glare, starbursts, and monocular diplopia due to irregular light scattering"]'::jsonb, 4, 'Cortical cataracts are highly associated with **significant glare, starbursts, and halos** (especially at night from headlights) due to the irregular refraction and scattering of light as it passes through the peripheral cortical opacities. They can also cause **monocular diplopia** or polyopia due to the split-refractive properties of the hydrated lens clefts.');

    ---------------------------------------------------------------------------
    -- CASE 43: Vignette: The Steroid-Induced Plaque (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Steroid-Induced Plaque (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Steroid-Induced Plaque (V5)', 'A 41-year-old male with a history of severe asthma requiring frequent courses of systemic corticosteroids and daily inhaled fluticasone presents with a rapid, painless decrease in vision in his right eye over the past 2 months. He reports that his near vision is particularly severely affected, making it nearly impossible to read books or look at his phone.  He also complains of disabling glare in bright sunlight.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 85 bpm | BP: 125/87 mmHg
*   **Visual Acuity:** OD: 20/100 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OD):** Anterior chamber is deep and quiet. Slit-lamp exam of the lens reveals a dense, granular, plaque-like opacity located on the posterior surface of the lens, directly in the visual axis. The lens nucleus and cortex are clear. The intraocular pressure is 15 mmHg OU. Dilated fundus examination is normal.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 41-year-old male with a history of severe asthma requiring frequent courses of systemic corticosteroids and daily inhaled fluticasone presents with a rapid, painless decrease in vision in his right eye over the past 2 months. He reports that his near vision is particularly severely affected, making it nearly impossible to read books or look at his phone.  He also complains of disabling glare in bright sunlight.

**Physical Examination:**
*   **Vitals:** Temp: 98.3°F | HR: 85 bpm | BP: 125/87 mmHg
*   **Visual Acuity:** OD: 20/100 (no improvement with pinhole); contralateral eye: 20/30
*   **Ocular Examination (OD):** Anterior chamber is deep and quiet. Slit-lamp exam of the lens reveals a dense, granular, plaque-like opacity located on the posterior surface of the lens, directly in the visual axis. The lens nucleus and cortex are clear. The intraocular pressure is 15 mmHg OU. Dilated fundus examination is normal.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Posterior capsular opacification (PCO)", "Posterior subcapsular cataract (PSC)", "Nuclear sclerotic cataract", "Traumatic cataract", "Cortical cataract"]'::jsonb, 1, 'This patient has a **Posterior Subcapsular Cataract (PSC)**. Key features include the **plaque-like, granular opacity** on the posterior surface of the lens, a history of **corticosteroid use**, a **relatively young age**, and **disproportionately severe loss of near vision** and glare in bright conditions because the opacity is located directly in the nodal point of the eye.'),
    (v_case_id, 'What is the cellular origin of a posterior subcapsular cataract?', '["Proliferation of iris pigment epithelial cells onto the anterior lens capsule", "Myofibroblastic transdifferentiation of keratocytes in the corneal stroma", "Abnormal migration and swelling of lens epithelial cells from the equator to the posterior pole, forming Wedl (bladder) cells", "Necrosis of the central lens fiber cells due to chronic ischemia", "Deposition of macrophages that have engulfed leaked lens proteins"]'::jsonb, 2, 'PSCs arise from the **abnormal migration and swelling of lens epithelial cells**. Normally, lens epithelial cells are located on the anterior surface and migrate to the equator to differentiate into lens fibers. In PSC, these cells aberrantly migrate posteriorly to the posterior pole, where they swell and become large, nucleated, vacuolated cells known as **Wedl cells** or **bladder cells**, forming the posterior plaque.'),
    (v_case_id, 'Why does a posterior subcapsular cataract affect near vision more severely than distance vision?', '["Accommodative pupillary constriction (miosis) focuses light directly through the central posterior opacity", "The lens becomes extremely rigid and prevents accommodation completely", "The posterior capsule is physically connected to the ciliary zonules", "Corticosteroids selectively damage the macular photoreceptors responsible for near vision", "Near vision requires a wider pupil, which exposes the peripheral cortical clefts"]'::jsonb, 0, 'PSC affects **near vision more severely** because during near vision, the accommodation reflex triggers **pupillary constriction (miosis)**. This constricts the light path, forcing light to pass directly through the **small, central, posterior subcapsular plaque** located at the nodal point of the eye. In contrast, in dimmer light or distance vision, a slightly wider pupil allows light to pass around the central opacity, resulting in better distance acuity.');

    ---------------------------------------------------------------------------
    -- CASE 44: Vignette: The Absent Red Reflex (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Absent Red Reflex (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Absent Red Reflex (V5)', 'A 0-month-old infant is brought to the pediatric ophthalmology clinic by her parents who noticed an abnormal white appearance in the baby''s left pupil on a family photograph. The mother notes the baby does not seem to track toys or look at her face as well when the right eye is covered.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Central, steady, and maintained in the right eye; poor fixation and tracking in the left eye.
*   **Ocular Examination:** The right eye shows a normal, bright red reflex. The left eye has an absent red reflex, replaced by a dense, white, homogeneous opacity in the center of the pupil (leukocoria). Handheld slit-lamp exam reveals a dense, central nuclear lens opacity. The cornea is clear and corneal diameters are symmetric. No signs of intraocular inflammation or retinoblastoma are noted on B-scan ultrasound.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 0-month-old infant is brought to the pediatric ophthalmology clinic by her parents who noticed an abnormal white appearance in the baby''s left pupil on a family photograph. The mother notes the baby does not seem to track toys or look at her face as well when the right eye is covered.

**Physical Examination:**
*   **Vitals:** Stable infant.
*   **Visual Acuity:** Central, steady, and maintained in the right eye; poor fixation and tracking in the left eye.
*   **Ocular Examination:** The right eye shows a normal, bright red reflex. The left eye has an absent red reflex, replaced by a dense, white, homogeneous opacity in the center of the pupil (leukocoria). Handheld slit-lamp exam reveals a dense, central nuclear lens opacity. The cornea is clear and corneal diameters are symmetric. No signs of intraocular inflammation or retinoblastoma are noted on B-scan ultrasound.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most critical management priority for a dense, unilateral congenital cataract?', '["Initiation of daily topical corticosteroid drops to clear the lens opacity", "Fitting with custom glasses and scheduling surgery at school age", "Watchful waiting and visual stimulation therapy until the child is at least 5 years old", "Urgent surgical cataract extraction within the first 6 to 8 weeks of life to prevent irreversible deprivation amblyopia", "Immediate systemic antiviral therapy for suspected congenital CMV"]'::jsonb, 3, 'A dense, unilateral congenital cataract is a **visual emergency**. It must be treated with **urgent surgical extraction (lensectomy) within the first 6 to 8 weeks of life**. Delaying surgery beyond the critical period of visual development leads to permanent, irreversible **deprivation amblyopia**, as the visual cortex fails to develop proper synaptic connections with the affected eye.'),
    (v_case_id, 'Which congenital infection is most classically associated with congenital cataracts, microphthalmia, and sensorineural hearing loss?', '["Congenital Syphilis", "Congenital Toxoplasmosis", "Congenital Herpes Simplex Virus", "Congenital Cytomegalovirus", "Congenital Rubella Syndrome"]'::jsonb, 4, '**Congenital Rubella Syndrome** is classically associated with the triad of **cataracts** (often bilateral), **microphthalmia/pigmentary retinopathy**, **sensorineural hearing loss**, and **cardiac defects** (patent ductus arteriosus). The rubella virus directly infects the developing lens vesicle in utero before the capsule forms, leading to chronic replication within the lens fibers.'),
    (v_case_id, 'Following congenital cataract surgery in an infant, what is the primary method of visual rehabilitation to prevent amblyopia?', '["There is no effective visual rehabilitation method for aphakic infants", "Fitting with a high-power contact lens (aphakic contact lens) and patching the contralateral eye (occlusion therapy)", "Implantation of a standard adult monofocal intraocular lens without patching", "Performing daily laser therapy to stimulate the macula", "Prescribing standard bifocal glasses and hoping the eyes self-correct"]'::jsonb, 1, 'Visual rehabilitation in an aphakic infant is crucial. Because the infant''s eye is small and rapidly growing, primary IOL implantation is highly challenging and risky. Therefore, infants are rehabilitated with a **high-power aphakic contact lens** (or aphakic glasses for bilateral cases) to correct the severe refractive error, combined with **occlusion therapy (patching of the normal eye)** to force the brain to use the surgical eye and prevent amblyopia.');

    ---------------------------------------------------------------------------
    -- CASE 45: Vignette: The Blunt Rosette (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Blunt Rosette (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Blunt Rosette (V5)', 'A 22-year-old female presents with a 3-month history of progressive visual blur in her left eye. Upon questioning, she recalls being struck in that eye by a tennis ball during a match approximately 8 months ago. She experienced temporary pain and bruising but did not seek medical attention at the time.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 80 bpm | BP: 120/86 mmHg
*   **Visual Acuity:** OS: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior chamber is deep and quiet. Gonioscopy shows 15% angle recession inferiorly. Slit-lamp exam of the lens reveals a classic rosette-shaped or star-shaped cortical opacity located in the posterior subcapsular region. The ciliary zonules appear intact, and there is no lens subluxation or phacodonesis. The intraocular pressure is 14 mmHg OU.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 22-year-old female presents with a 3-month history of progressive visual blur in her left eye. Upon questioning, she recalls being struck in that eye by a tennis ball during a match approximately 8 months ago. She experienced temporary pain and bruising but did not seek medical attention at the time.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F | HR: 80 bpm | BP: 120/86 mmHg
*   **Visual Acuity:** OS: 20/80 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OS):** Anterior chamber is deep and quiet. Gonioscopy shows 15% angle recession inferiorly. Slit-lamp exam of the lens reveals a classic rosette-shaped or star-shaped cortical opacity located in the posterior subcapsular region. The ciliary zonules appear intact, and there is no lens subluxation or phacodonesis. The intraocular pressure is 14 mmHg OU.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which classic morphology is most characteristic of a cataract caused by blunt, non-penetrating ocular trauma?', '["Wedge-shaped, spoke-like peripheral clefts", "Rosette-shaped or stellate-shaped cortical opacity", "Amber-colored central oil-droplet opacity", "Dense, golden-brown nuclear compaction", "White, flaky, dandruff-like deposits on the anterior capsule"]'::jsonb, 1, 'Blunt, non-penetrating ocular trauma characteristically causes a **rosette-shaped or stellate-shaped cortical opacity**, typically located in the posterior or anterior subcapsular cortex. The concussive wave transmission through the eye disrupts the lens fibers, leading to fluid accumulation along the suture lines in this unique flower-like pattern.'),
    (v_case_id, 'What is the primary pathophysiology behind traumatic cataract formation after blunt trauma?', '["Secondary calcification of the posterior lens capsule due to intraocular hemorrhage", "A chronic, low-grade bacterial infection of the lens cortex", "Direct chemical necrosis of lens crystallins by inflammatory cytokines", "Disruption of the lens capsule or ciliary zonules, allowing aqueous humor to enter and hydrate the lens fibers", "Localized ischemia of the ciliary body processes that supply the lens"]'::jsonb, 3, 'Blunt trauma causes **micro-ruptures or increased permeability of the lens capsule** (or direct injury to the subcapsular lens fibers). This allows **aqueous humor to enter and hydrate the lens fibers**, leading to localized opacification and swelling. Over time, this focal hydration spreads, often resulting in a mature, completely opaque cataract.'),
    (v_case_id, 'What other clinical finding must be ruled out in a patient with a traumatic cataract before planning surgery?', '["Zonular dialysis, angle recession, and secondary glaucoma", "An underlying mutation in the fibrillin-1 gene", "Congenital dacryostenosis and tear duct block", "A contralateral optic nerve Drance hemorrhage", "Pseudoexfoliative deposits on the corneal endothelium"]'::jsonb, 0, 'Prior blunt trauma carries a high risk of **zonular dialysis** (weakness/tearing of the lens support cords), **angle recession** (tearing of the iris insertion, which can lead to late secondary glaucoma), and **vitreous prolapse**. The surgeon must carefully evaluate for iris and lens tremulousness (iridodonesis/phacodonesis) and angle structure, as zonular weakness significantly complicates cataract surgery.');

    ---------------------------------------------------------------------------
    -- CASE 46: Vignette: The Liquefied Cortex (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Liquefied Cortex (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Liquefied Cortex (V5)', 'A 79-year-old female from an underserved rural community presents with profound, painless vision loss in her right eye. She reports that the eye has been virtually blind for over 5 years, but she did not seek treatment due to lack of local services and fear of surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.9°F | HR: 80 bpm | BP: 117/80 mmHg
*   **Visual Acuity:** OD: Hand Motion (good light projection); contralateral eye: 20/40
*   **Ocular Examination (OD):** Anterior chamber is deep. Slit-lamp biomicroscopy of the lens reveals a completely white, opaque lens. The lens cortex has completely liquefied into a milky white fluid. The dense, brown, sclerotic lens nucleus is clearly visible, having subsided and sunk to the bottom of the capsular bag. The anterior lens capsule appears wrinkled and thickened. There is no active inflammation or elevated IOP today.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 79-year-old female from an underserved rural community presents with profound, painless vision loss in her right eye. She reports that the eye has been virtually blind for over 5 years, but she did not seek treatment due to lack of local services and fear of surgery.

**Physical Examination:**
*   **Vitals:** Temp: 98.9°F | HR: 80 bpm | BP: 117/80 mmHg
*   **Visual Acuity:** OD: Hand Motion (good light projection); contralateral eye: 20/40
*   **Ocular Examination (OD):** Anterior chamber is deep. Slit-lamp biomicroscopy of the lens reveals a completely white, opaque lens. The lens cortex has completely liquefied into a milky white fluid. The dense, brown, sclerotic lens nucleus is clearly visible, having subsided and sunk to the bottom of the capsular bag. The anterior lens capsule appears wrinkled and thickened. There is no active inflammation or elevated IOP today.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis for this specific type of hypermature cataract?', '["Phacolytic cataract", "Nuclear sclerotic cataract", "Posterior subcapsular cataract", "Morgagnian cataract", "Cortical cataract"]'::jsonb, 3, 'This is a **Morgagnian cataract**, which is a specific form of **hypermature cataract**. In this advanced stage, the lens cortex undergoes enzymatic degeneration and **completely liquefies into a milky fluid**. Lacking support, the dense, dehydrated, **sclerotic nucleus sinks** to the bottom of the capsular bag under the influence of gravity.'),
    (v_case_id, 'Which of the following represents a serious, potentially blinding ocular emergency associated with hypermature cataracts?', '["Neovascular glaucoma driven by chronic lens ischemia", "Tractional retinal detachment due to vitreal-capsular bands", "Phacoanaphylactic endophthalmitis, a direct autoimmune response to a ruptured lens capsule", "Phacolytic glaucoma, caused by the leakage of high-molecular-weight lens proteins through the intact capsule", "Acute primary angle-closure glaucoma due to pupillary block"]'::jsonb, 3, 'Hypermature cataracts carry a high risk of **phacolytic glaucoma**. As the cortex liquefies, **high-molecular-weight lens proteins leak** through microscopic pores in the degenerating, wrinkled anterior lens capsule. Macrophages migrate to engulf these foreign proteins. Both the proteins and protein-laden macrophages physically clog the trabecular meshwork, causing a rapid, severe rise in IOP in a deep-chambered, quiet eye.'),
    (v_case_id, 'What is the primary surgical challenge encountered during the extraction of a Morgagnian cataract?', '["Fragility of the corneal epithelium under standard ultrasound energy", "Finding a specialized IOL designed to fit in a liquefied capsule", "Creating a continuous curvilinear capsulorhexis in a highly pressurized capsular bag with poor visualization of the capsule", "Severe intraoperative miosis that does not respond to epinephrine", "An increased risk of severe retrobulbar hemorrhage during anesthesia"]'::jsonb, 2, 'The primary surgical challenge is **creating a safe capsulorhexis**. The liquefied cortex creates a **highly pressurized capsular bag**. When the needle or forceps punctures the anterior capsule, the pressurized milky fluid immediately escapes, obscuring visualization and causing the capsular tear to rapidly run out to the equator (the **''Argentinian flag sign''**). A trypan blue dye stain and venting of the liquid cortex are required to safely complete the capsulorhexis.');

    ---------------------------------------------------------------------------
    -- CASE 47: Vignette: The Superotemporal Subluxation (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Superotemporal Subluxation (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Superotemporal Subluxation (V5)', 'A 17-year-old tall, thin male with a history of joint hypermobility, mild scoliosis, and a pectus excavatum deformity presents for a comprehensive ophthalmic evaluation. He complains of fluctuating, blurry vision in both eyes that has worsened over the past 2 years. He reports seeing double with either eye individually (monocular diplopia) at times.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 65 bpm | BP: 110/70 mmHg
*   **Visual Acuity:** Bilateral 20/80 (uncorrected); pinhole corrects to 20/30
*   **Ocular Examination (OU):** The anterior chambers are deep. Slit-lamp biomicroscopy after pupillary dilation reveals bilateral, symmetrical displacement and **subluxation of the crystalline lenses in a superotemporal direction**. Stretched, intact ciliary zonular fibers are clearly visible in the lower-nasal pupillary aperture. Tremulousness of the iris (iridodonesis) is present upon rapid eye movements.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 17-year-old tall, thin male with a history of joint hypermobility, mild scoliosis, and a pectus excavatum deformity presents for a comprehensive ophthalmic evaluation. He complains of fluctuating, blurry vision in both eyes that has worsened over the past 2 years. He reports seeing double with either eye individually (monocular diplopia) at times.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 65 bpm | BP: 110/70 mmHg
*   **Visual Acuity:** Bilateral 20/80 (uncorrected); pinhole corrects to 20/30
*   **Ocular Examination (OU):** The anterior chambers are deep. Slit-lamp biomicroscopy after pupillary dilation reveals bilateral, symmetrical displacement and **subluxation of the crystalline lenses in a superotemporal direction**. Stretched, intact ciliary zonular fibers are clearly visible in the lower-nasal pupillary aperture. Tremulousness of the iris (iridodonesis) is present upon rapid eye movements.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely underlying diagnosis, and in what direction is the lens classically displaced?', '["Marfan syndrome; superotemporal displacement of the lens", "Homocystinuria; inferonasal displacement of the lens", "Sulfite oxidase deficiency; progressive nasal displacement", "Traumatic zonular dialysis; random displacement based on trauma force", "Weill-Marchesani syndrome; symmetrical inferior displacement"]'::jsonb, 0, 'This patient has **Marfan syndrome**, an autosomal dominant connective tissue disorder. The classic ocular manifestation is **ectopia lentis (lens subluxation)**, which occurs bilaterally and symmetrically in up to 80% of patients. In Marfan syndrome, the lens classically displaces in a **superotemporal direction**, with ciliary zonules remaining stretched but largely intact.'),
    (v_case_id, 'Which genetic mutation is responsible for the systemic and ocular manifestations of this patient''s syndrome?', '["CBS gene on chromosome 21, encoding cystathionine beta-synthase", "TGFBR1 gene on chromosome 9, encoding transforming factor receptor", "FBN1 gene on chromosome 15, encoding fibrillin-1", "COL1A1 gene on chromosome 17, encoding type I collagen", "ELN gene on chromosome 7, encoding elastin"]'::jsonb, 2, 'Marfan syndrome is caused by mutations in the **FBN1 gene on chromosome 15q21**, which encodes **fibrillin-1**, a major glycoprotein component of extracellular microfibrils. Fibrillin-1 is highly abundant in the **ciliary zonules** (the suspension cords of the lens), as well as the aortic media and skeletal system, explaining the classic multi-system clinical features.'),
    (v_case_id, 'Which clinical feature helps differentiate the ectopia lentis of Homocystinuria from that of Marfan Syndrome?', '["In Homocystinuria, the lens never subluxates but undergoes rapid calcification", "In Homocystinuria, the lens is displaced superotemporally and the zonules are completely intact", "In Homocystinuria, lens subluxation is classically inferonasal, the zonules are completely broken, and patients have intellectual disability and thromboembolic risk", "In Homocystinuria, patients are extremely short in stature with stiff joints and small hands", "Homocystinuria is inherited in an autosomal dominant pattern with normal life expectancy"]'::jsonb, 2, '**Homocystinuria** (an autosomal recessive metabolic disorder) is differentiated by: (1) **inferonasal displacement** of the lens, (2) **complete disintegration and breakdown of the ciliary zonules** (which are composed of cysteine-rich fibers damaged by homocysteine), and (3) systemic features like **intellectual disability, skeletal deformities, and a high risk of life-threatening thromboembolism**.');

    ---------------------------------------------------------------------------
    -- CASE 48: Vignette: The 'Second Cataract' (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The ''Second Cataract'' (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The ''Second Cataract'' (V5)', 'A 71-year-old female presents complaining that the cataract in her right eye has ''grown back.'' She underwent highly successful, uncomplicated cataract extraction with intraocular lens (IOL) implantation in that eye 18 months ago, achieving 20/20 vision postoperatively. However, over the past 2 months, her vision has become progressively blurry and hazy, accompanied by significant glare when looking at bright lights.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 70 bpm | BP: 128/78 mmHg
*   **Visual Acuity:** OD: 20/60 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior chamber is quiet. A three-piece monofocal acrylic intraocular lens is perfectly centered within the capsular bag. However, the posterior capsule behind the IOL appears significantly thickened, hazy, and translucent, showing multiple small, vesicular, pearl-like vacuolated cells growing across the central visual axis (Elschnig''s pearls).', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 71-year-old female presents complaining that the cataract in her right eye has ''grown back.'' She underwent highly successful, uncomplicated cataract extraction with intraocular lens (IOL) implantation in that eye 18 months ago, achieving 20/20 vision postoperatively. However, over the past 2 months, her vision has become progressively blurry and hazy, accompanied by significant glare when looking at bright lights.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 70 bpm | BP: 128/78 mmHg
*   **Visual Acuity:** OD: 20/60 (no improvement with pinhole); contralateral eye: 20/20
*   **Ocular Examination (OD):** Anterior chamber is quiet. A three-piece monofocal acrylic intraocular lens is perfectly centered within the capsular bag. However, the posterior capsule behind the IOL appears significantly thickened, hazy, and translucent, showing multiple small, vesicular, pearl-like vacuolated cells growing across the central visual axis (Elschnig''s pearls).', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis, and what is the gold-standard treatment?', '["Posterior capsular opacification (PCO); Nd:YAG laser posterior capsulotomy", "Corneal endothelial decompensation; Descemet''s stripping endothelial keratoplasty", "Cystoid macular edema; topical non-steroidal anti-inflammatory drops", "Neovascularization of the posterior capsule; intravitreal anti-VEGF injection", "Recurrent nuclear cataract; repeat surgical cataract extraction"]'::jsonb, 0, 'This is **Posterior Capsular Opacification (PCO)**, the most common late complication of modern cataract surgery (often called a **''second cataract''** by patients). The gold-standard treatment is an outpatient **Nd:YAG laser posterior capsulotomy**, which uses a specialized laser to safely create a small circular opening in the hazy posterior capsule, instantly restoring the clear optical path.'),
    (v_case_id, 'Which cellular mechanism is primarily responsible for the development of PCO?', '["Slow, localized vitreous degeneration and condensation behind the lens", "Deposition of chronic inflammatory cells and macrophages on the posterior lens capsule", "Proliferation, migration, and myofibroblastic transdifferentiation of residual lens epithelial cells on the capsular bag", "Infiltration of the subretinal space by corneal endothelial cells", "Precipitation of systemic calcium salts onto the surface of the acrylic IOL"]'::jsonb, 2, 'PCO is caused by the **proliferation, migration, and myofibroblastic transdifferentiation of residual lens epithelial cells (LECs)**. During cataract surgery, some LECs are left behind in the equatorial region of the capsular bag. Over time, these cells migrate across the posterior capsule, forming **Elschnig''s pearls** (vacuolated cells) or causing capsular wrinkling and fibrosis, which scatters light.'),
    (v_case_id, 'Which of the following is a potential, rare complication of the laser treatment used to manage PCO?', '["Acute, synechial angle-closure glaucoma", "Ischemia and atrophy of the optic nerve head", "Rhegmatogenous retinal detachment and IOL damage/pitting", "Neovascularization of the anterior chamber angle", "Corneal endothelial cell loss and corneal melting"]'::jsonb, 2, 'While Nd:YAG laser capsulotomy is highly safe, rare complications include: (1) **rhegmatogenous retinal detachment** (due to shockwaves transmitted to the vitreous cavity, especially in high myopes), (2) **transient intraocular pressure spikes**, (3) **IOL damage or pitting** if the laser is misfocused, and (4) **cystoid macular edema** (Irvine-Gass syndrome).');

    ---------------------------------------------------------------------------
    -- CASE 49: Vignette: The Billowing Iris (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Billowing Iris (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Billowing Iris (V5)', 'A 69-year-old male with a history of benign prostatic hyperplasia (BPH) presenting with a progressive nuclear sclerotic cataract is scheduled for routine phacoemulsification. During his preoperative assessment, the surgeon reviews his current medications, which include tamsulosin 0.4 mg daily. Preoperative pupil dilation is achieved but appears slightly sluggish.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 68 bpm | BP: 130/82 mmHg
*   **Ocular Examination (OU):** The anterior segments are quiet. Deep anterior chambers. Gonioscopy shows open angles (Grade 4). Lenses show 3+ nuclear sclerosis bilaterally. Retinal examination is normal. During the initial steps of cataract surgery, immediately after making the corneal incision, the iris appears highly flaccid, billows in response to irrigation fluid, and repeatedly prolapses towards the surgical wound. The pupil, which was 7.5 mm, progressively constricts to 4.0 mm despite standard epinephrine in the irrigating bottle.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 69-year-old male with a history of benign prostatic hyperplasia (BPH) presenting with a progressive nuclear sclerotic cataract is scheduled for routine phacoemulsification. During his preoperative assessment, the surgeon reviews his current medications, which include tamsulosin 0.4 mg daily. Preoperative pupil dilation is achieved but appears slightly sluggish.

**Physical Examination:**
*   **Vitals:** Temp: 98.4°F | HR: 68 bpm | BP: 130/82 mmHg
*   **Ocular Examination (OU):** The anterior segments are quiet. Deep anterior chambers. Gonioscopy shows open angles (Grade 4). Lenses show 3+ nuclear sclerosis bilaterally. Retinal examination is normal. During the initial steps of cataract surgery, immediately after making the corneal incision, the iris appears highly flaccid, billows in response to irrigation fluid, and repeatedly prolapses towards the surgical wound. The pupil, which was 7.5 mm, progressively constricts to 4.0 mm despite standard epinephrine in the irrigating bottle.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis, and which class of medications is responsible for this condition?', '["Congenital iris hypoplasia; systemic anticholinergic therapy", "Uveitic pupillary block; chronic topical corticosteroid use", "Pseudoexfoliative iridopathy; calcium channel blockers", "Intraoperative Floppy Iris Syndrome (IFIS); alpha-1A adrenergic receptor antagonists (e.g., tamsulosin)", "Pigment dispersion syndrome; systemic beta-blockers"]'::jsonb, 3, 'This is **Intraoperative Floppy Iris Syndrome (IFIS)**. It is caused by **alpha-1A adrenergic receptor antagonists**, most notably **tamsulosin (Flomax)**, which is widely prescribed for benign prostatic hyperplasia (BPH). The drug blocks the alpha-1A receptors in the iris dilator muscle, leading to muscle flaccidity, billowing, and intraoperative miosis.'),
    (v_case_id, 'What is the classic triad of signs that defines Intraoperative Floppy Iris Syndrome?', '["Flaccid iris stroma that billows with fluid currents, progressive intraoperative miosis, and a propensity for the iris to prolapse through corneal incisions", "Shallow anterior chamber, rock-hard globe, and steamy corneal edema", "Posterior synechiae, keratic precipitates, and cystoid macular edema", "Wrinkled anterior lens capsule, Elschnig''s pearls, and zonular dialysis", "Heavily pigmented trabecular meshwork, Krukenberg spindle, and mid-peripheral spoke-like iris defects"]'::jsonb, 0, 'The **classic triad of IFIS** consists of: (1) **a flaccid iris stroma** that billows and waves in response to normal intraoperative irrigation fluid currents, (2) **progressive intraoperative pupillary constriction (miosis)**, and (3) **a strong propensity for the iris tissue to prolapse** and escape through the corneal incisions.'),
    (v_case_id, 'Which of the following is the most appropriate management strategy for a patient with known IFIS undergoing cataract surgery?', '["Performing an immediate surgical peripheral iridectomy before removing the cataract", "Stopping tamsulosin 24 hours prior to surgery to fully reverse the iris muscle atrophy", "Increasing the ultrasound phacoemulsification power to rapidly emulsify the lens", "Postponing the surgery and switching the patient to oral finasteride for 5 years", "Using pupil expansion rings (e.g. Malyugin ring), iris hooks, or intraoperative intracameral phenylephrine/epinephrine"]'::jsonb, 4, 'Management of IFIS includes **pupil expansion rings (e.g. Malyugin ring)**, iris hooks, cohesive viscoelastics, or **intraoperative intracameral injection of alpha-agonists (phenylephrine or epinephrine)**. Stopping tamsulosin is generally **unsuccessful at reversing the syndrome**, as the drug causes long-lasting or permanent structural changes/atrophy of the iris dilator muscle; thus, the surgeon must prepare for IFIS even if the patient stopped the drug months ago.');

    ---------------------------------------------------------------------------
    -- CASE 50: Vignette: The Tremulous Lens (V5)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Vignette: The Tremulous Lens (V5)' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Vignette: The Tremulous Lens (V5)', 'A 23-year-old male presents with fluctuating, blurry vision and double vision in his left eye.  He reports that he was struck in that eye by the fist of an assailant during a physical altercation 2 weeks ago.  He notes that when he moves his eye quickly, his vision seems to ''wobble'' and shake.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 74 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/120 (pinholes to 20/40); contralateral eye: 20/20
*   **Ocular Examination (OS):** The cornea is clear. Slit-lamp biomicroscopy reveals a highly **tremulous iris (iridodonesis)** and a **tremulous lens (phacodonesis)** upon eye movement. With a dilated pupil, the lens is seen to be subluxated inferiorly, exposing a 120-degree sector of **torn ciliary zonules (zonular dialysis)** superiorly. A small amount of vitreous gel is visible prolapsing into the anterior chamber around the superior edge of the lens. The intraocular pressure is 18 mmHg.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 23-year-old male presents with fluctuating, blurry vision and double vision in his left eye.  He reports that he was struck in that eye by the fist of an assailant during a physical altercation 2 weeks ago.  He notes that when he moves his eye quickly, his vision seems to ''wobble'' and shake.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F | HR: 74 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OS: 20/120 (pinholes to 20/40); contralateral eye: 20/20
*   **Ocular Examination (OS):** The cornea is clear. Slit-lamp biomicroscopy reveals a highly **tremulous iris (iridodonesis)** and a **tremulous lens (phacodonesis)** upon eye movement. With a dilated pupil, the lens is seen to be subluxated inferiorly, exposing a 120-degree sector of **torn ciliary zonules (zonular dialysis)** superiorly. A small amount of vitreous gel is visible prolapsing into the anterior chamber around the superior edge of the lens. The intraocular pressure is 18 mmHg.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis, and what do the terms ''iridodonesis'' and ''phacodonesis'' represent?', '["Pseudoexfoliation syndrome; iridodonesis is iris atrophy, phacodonesis is lens displacement", "Lens subluxation with traumatic zonular dialysis; iridodonesis is trembling of the iris, phacodonesis is trembling of the lens", "Acute angle-closure glaucoma; iridodonesis is fixed pupil, phacodonesis is lens swelling", "Pigmentary glaucoma; iridodonesis is iris transillumination, phacodonesis is pigment in the lens", "Anterior uveitis; iridodonesis is inflammatory cells, phacodonesis is lens proteins"]'::jsonb, 1, 'This patient has **lens subluxation with traumatic zonular dialysis**. **Iridodonesis** (tremble of the iris) and **phacodonesis** (tremble of the lens) are classic signs of zonular weakness or tearing. When the eye moves, the iris and lens lack proper structural support and oscillate/wobble, which is highly diagnostic of ciliary zonular damage.'),
    (v_case_id, 'What is the primary surgical device used during cataract extraction to support the remaining capsular bag in a patient with moderate zonular dialysis?', '["Nd:YAG laser capsulotome", "Scleral-fixated iris hook", "Malyugin Pupil Expansion Ring", "Capsular Tension Ring (CTR)", "Ahmed Glaucoma Valve"]'::jsonb, 3, 'For moderate zonular dialysis (<120-180 degrees), a **Capsular Tension Ring (CTR)** is inserted into the capsular bag. The CTR is a flexible PMMA ring that distributes the mechanical forces of the remaining intact zonules to the weakened areas, stabilizing the capsular bag, preventing vitreous prolapse, and allowing the safe implantation of a standard IOL.'),
    (v_case_id, 'Which of the following is the most appropriate surgical management for a patient with severe, progressive lens subluxation (>180 degrees of zonular dialysis) and vitreous in the anterior chamber?', '["Pars plana lensectomy and anterior vitrectomy, followed by implantation of a scleral-fixated or iris-claw IOL", "Standard phacoemulsification with a standard CTR and standard bag-IOL placement", "Bilateral laser peripheral iridotomy and lifelong topical beta-blockers", "Pressure patching the eye and scheduling a follow-up in 6 months", "Surgical trabeculectomy with mitomycin C while leaving the subluxated lens in place"]'::jsonb, 0, 'In cases of **severe lens subluxation (>180 degrees of zonular dialysis)** or when the lens is extremely unstable and vitreous is in the anterior chamber, standard phacoemulsification within the bag is highly dangerous. The recommended approach is a **lensectomy (often via pars plana) combined with an anterior vitrectomy** (to clear the prolapsed vitreous), followed by placement of a **scleral-fixated intraocular lens** (e.g. Yamane technique) or an **iris-claw/anterior chamber IOL**.');

END $$;
COMMIT;
