-- Ophthalmology: Red Eye — conjunctivitis, uveitis, keratitis
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: optho-red-eye

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'optho-red-eye' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'optho-red-eye';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: The Contact Lens Wearer with a White Infiltrate
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Contact Lens Wearer with a White Infiltrate' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Contact Lens Wearer with a White Infiltrate', 'A 24-year-old female medical student presents to the ophthalmology clinic with severe pain, redness, photophobia, and purulent discharge in her right eye for the past 24 hours. She admits to sleeping in her extended-wear soft contact lenses for the past week due to exam preparation.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F (37.0°C) | HR: 72 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OD: 20/200 (pinholes to 20/100); OS: 20/20
*   **Ocular Examination (OD):** Significant lid edema and conjunctival injection with ciliary flush. Slit-lamp examination reveals a 2.5 mm round, dense, white-gray stromal infiltrate/ulcer with epithelial loss in the central cornea. A 1.0 mm sterile hypopyon is visible in the anterior chamber. OS exam is unremarkable.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old female medical student presents to the ophthalmology clinic with severe pain, redness, photophobia, and purulent discharge in her right eye for the past 24 hours. She admits to sleeping in her extended-wear soft contact lenses for the past week due to exam preparation.

**Physical Examination:**
*   **Vitals:** Temp: 98.6°F (37.0°C) | HR: 72 bpm | BP: 120/80 mmHg
*   **Visual Acuity:** OD: 20/200 (pinholes to 20/100); OS: 20/20
*   **Ocular Examination (OD):** Significant lid edema and conjunctival injection with ciliary flush. Slit-lamp examination reveals a 2.5 mm round, dense, white-gray stromal infiltrate/ulcer with epithelial loss in the central cornea. A 1.0 mm sterile hypopyon is visible in the anterior chamber. OS exam is unremarkable.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate next step in the management of this patient''s condition?', '["Immediate corneal scraping for culture followed by hourly fortified topical tobramycin and cefazolin.", "Application of a tight pressure patch and scheduling a follow-up in 48 hours.", "Initiation of topical prednisolone acetate 1% drops every 2 hours.", "Application of topical acyclovir 3% ointment 5 times daily.", "Prescribing oral ciprofloxacin 750 mg twice daily."]'::jsonb, 0, 'This patient presents with a classic bacterial corneal ulcer (keratitis), highly suspicious for *Pseudomonas aeruginosa* given her history of contact lens overwear. A central corneal ulcer with a hypopyon is an ocular emergency. The standard of care is immediate corneal scraping for Gram stain and culture/sensitivities, followed immediately by empiric, hourly broad-spectrum topical antibiotics (either fortified tobramycin/cefazolin or monotherapy with a fourth-generation fluoroquinolone like moxifloxacin). 
*   **B (Pressure patch)** is absolutely contraindicated in contact lens-related keratitis because it traps pathogens (especially *Pseudomonas*) against the cornea, leading to rapid corneal melting and perforation.
*   **C (Topical steroids)** are contraindicated in the acute phase of active bacterial keratitis as they inhibit host immunity and delay epithelialization; they are only considered later to reduce scarring once the infection is sterilized.
*   **D (Topical acyclovir)** is used for herpes simplex virus (HSV) epithelial keratitis, which presents with dendritic ulcers, not a dense stromal ulcer with a hypopyon.
*   **E (Oral ciprofloxacin)** does not reach therapeutic concentrations in the avascular cornea; topical administration is required.'),
    (v_case_id, 'Which characteristic of the most likely pathogen responsible for this patient''s condition allows it to cause rapid corneal destruction?', '["Production of collagenase and proteases that cause stromal necrosis.", "Ability to replicate intracellularly within corneal epithelial cells.", "Formation of multinucleated giant cells that disrupt Descemet''s membrane.", "Secretion of IgA proteases that cleave mucosal antibodies.", "Release of dermatonecrotic exotoxins that damage the nasociliary nerve."]'::jsonb, 0, '*Pseudomonas aeruginosa* is the most common pathogen in contact lens-associated keratitis. It produces proteolytic enzymes, including collagenase and elastase, which can liquefy the corneal stroma (corneal melting) within 24 to 48 hours, leading to corneal perforation.
*   **B (Intracellular replication)** is characteristic of viral pathogens like HSV or bacteria like *Chlamydia*, not *Pseudomonas*.
*   **C (Multinucleated giant cells)** are associated with viral infections (e.g., HSV/VZV) on Tzanck smear, not bacterial keratitis.
*   **D (IgA proteases)** are virulence factors for *Streptococcus pneumoniae* and *Neisseria* species, but do not drive the rapid stromal necrosis characteristic of *Pseudomonas*.
*   **E (Nasociliary nerve damage)** is a feature of Herpes Zoster Ophthalmicus (VZV), not acute bacterial keratitis.');

    ---------------------------------------------------------------------------
    -- CASE 02: The Chronic Red Eye with Dendritic Branching
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Chronic Red Eye with Dendritic Branching' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Chronic Red Eye with Dendritic Branching', 'A 34-year-old male presents with a 3-day history of irritation, redness, photophobia, and a "gritty" foreign body sensation in his left eye. He reports having similar, milder episodes in the same eye over the last few years, usually resolving spontaneously. He denies contact lens wear.

**Physical Examination:**
*   **Vitals:** Temp: 98.9°F (37.2°C) | HR: 68 bpm | BP: 118/76 mmHg
*   **Visual Acuity:** OS: 20/40 (uncorrected); OD: 20/20
*   **Ocular Examination (OS):** Conjunctival injection concentrated around the limbus (ciliary flush). Corneal sensation is significantly decreased in the left eye compared to the right. Fluorescein staining reveals a branching, dendritic epithelial lesion with terminal bulbs in the central cornea. No stromal edema or anterior chamber cell/flare is noted.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 34-year-old male presents with a 3-day history of irritation, redness, photophobia, and a "gritty" foreign body sensation in his left eye. He reports having similar, milder episodes in the same eye over the last few years, usually resolving spontaneously. He denies contact lens wear.

**Physical Examination:**
*   **Vitals:** Temp: 98.9°F (37.2°C) | HR: 68 bpm | BP: 118/76 mmHg
*   **Visual Acuity:** OS: 20/40 (uncorrected); OD: 20/20
*   **Ocular Examination (OS):** Conjunctival injection concentrated around the limbus (ciliary flush). Corneal sensation is significantly decreased in the left eye compared to the right. Fluorescein staining reveals a branching, dendritic epithelial lesion with terminal bulbs in the central cornea. No stromal edema or anterior chamber cell/flare is noted.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate treatment for this patient''s current condition?', '["Topical ganciclovir 0.15% gel 5 times daily.", "Topical prednisolone acetate 1% drops every 2 hours.", "Topical ketorolac 0.5% drops 4 times daily.", "Oral acyclovir 800 mg 5 times daily for 14 days.", "Topical tobramycin 0.3% drops 4 times daily."]'::jsonb, 0, 'The clinical presentation of a branching dendritic ulcer with terminal bulbs and decreased corneal sensation is diagnostic of Herpes Simplex Virus (HSV) epithelial keratitis. Initial treatment requires topical antivirals (e.g., ganciclovir 0.15% gel or trifluridine 1% drops) or oral acyclovir (400 mg 5 times daily). Topical ganciclovir is highly effective and has less corneal toxicity than trifluridine.
*   **B (Topical steroids)** are strictly contraindicated in active HSV epithelial keratitis. Steroids promote viral replication, which can turn a simple dendritic ulcer into a massive, geographic ulcer, risking corneal perforation.
*   **C (Topical ketorolac)** is a topical NSAID; it does not treat the underlying viral infection and can cause corneal melting with prolonged use.
*   **D (Oral acyclovir 800 mg 5 times daily)** is the dosage for Herpes Zoster Ophthalmicus (HZO); for HSV epithelial keratitis, the standard oral dose is 400 mg 5 times daily (or valacyclovir 500 mg 3 times daily) if oral therapy is preferred over topical.
*   **E (Topical tobramycin)** is an antibacterial agent and has no activity against HSV.'),
    (v_case_id, 'The recurrence of this patient''s ocular symptoms is mediated by viral latency in which of the following structures?', '["Trigeminal ganglion.", "Ciliary ganglion.", "Superior cervical ganglion.", "Edinger-Westphal nucleus.", "Geniculate ganglion."]'::jsonb, 0, 'HSV-1 remains latent in the sensory neurons of the trigeminal (CN V) ganglion. Upon reactivation (triggered by stress, UV light, fever, or immunosuppression), the virus travels anterogradely along the ophthalmic division (V1) of the trigeminal nerve to the cornea, causing recurrent epithelial keratitis.
*   **B (Ciliary ganglion)** contains parasympathetic postganglionic cell bodies supplying the sphincter pupillae and ciliary muscle; it is not a site of HSV latency.
*   **C (Superior cervical ganglion)** contains sympathetic postganglionic cell bodies; it is not involved in HSV latency.
*   **D (Edinger-Westphal nucleus)** is the parasympathetic preganglionic nucleus of CN III in the midbrain, not a peripheral sensory ganglion.
*   **E (Geniculate ganglion)** is the sensory ganglion of the facial nerve (CN VII), associated with HSV/VZV reactivation in Ramsay Hunt syndrome (herpes zoster oticus), not corneal keratitis.');

    ---------------------------------------------------------------------------
    -- CASE 03: The Photophobic Patient with Disc-Shaped Corneal Edema
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Photophobic Patient with Disc-Shaped Corneal Edema' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Photophobic Patient with Disc-Shaped Corneal Edema', 'A 45-year-old female presents with pain, blurred vision, and extreme photophobia in her left eye for 5 days. She has a history of cold sores and remembers having a "scratched cornea" in the same eye 2 years ago that was treated with drops.

**Physical Examination:**
*   **Visual Acuity:** OS: 20/80; OD: 20/20
*   **Ocular Examination (OS):** Mild conjunctival injection with ciliary flush. Slit-lamp exam reveals a round, disc-shaped zone of central corneal stromal edema with overlying intact epithelium (no fluorescein uptake). Fine, keratic precipitates (KPs) are present on the corneal endothelium directly behind the area of edema. The anterior chamber shows 1+ cell and flare. Corneal sensation is reduced.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old female presents with pain, blurred vision, and extreme photophobia in her left eye for 5 days. She has a history of cold sores and remembers having a "scratched cornea" in the same eye 2 years ago that was treated with drops.

**Physical Examination:**
*   **Visual Acuity:** OS: 20/80; OD: 20/20
*   **Ocular Examination (OS):** Mild conjunctival injection with ciliary flush. Slit-lamp exam reveals a round, disc-shaped zone of central corneal stromal edema with overlying intact epithelium (no fluorescein uptake). Fine, keratic precipitates (KPs) are present on the corneal endothelium directly behind the area of edema. The anterior chamber shows 1+ cell and flare. Corneal sensation is reduced.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate management strategy for this patient?', '["Combined topical prednisolone acetate 1% and topical ganciclovir 0.15% gel.", "Topical moxifloxacin 0.5% drops hourly.", "Topical ganciclovir 0.15% gel alone.", "Debridement of the corneal epithelium followed by a pressure patch.", "Systemic intravenous acyclovir administration."]'::jsonb, 0, 'This patient has HSV stromal keratitis (specifically disciform keratitis), which is an immune-mediated (hypersensitivity) reaction to viral antigen in the corneal stroma, rather than active viral replication. Unlike HSV epithelial keratitis, the treatment of stromal keratitis requires topical corticosteroids (prednisolone acetate 1%) to suppress the inflammatory response and prevent permanent scarring. However, to prevent a reactivation of epithelial disease by the steroid, concurrent antiviral cover (topical ganciclovir or oral acyclovir) is mandatory.
*   **B (Topical moxifloxacin)** is for bacterial keratitis, which presents with stromal infiltrates and epithelial defects, not disciform edema with an intact epithelium.
*   **C (Topical ganciclovir alone)** is insufficient because the stromal edema and inflammation are immune-mediated and will not resolve without corticosteroids; untreated stromal keratitis leads to vascularization and scarring.
*   **D (Epithelial debridement)** is sometimes used for active HSV epithelial dendritic ulcers to reduce viral load, but is contraindicated here where the epithelium is intact and the disease is deep in the stroma.
*   **E (IV acyclovir)** is reserved for severe systemic HSV infections (e.g., encephalitis or neonatal HSV), not isolated stromal keratitis.'),
    (v_case_id, 'What is the most common long-term vision-threatening complication of chronic recurrences of this patient''s disease?', '["Corneal scarring and neovascularization.", "Rhegmatogenous retinal detachment.", "Tractional retinal detachment.", "Closed-angle glaucoma.", "Sympathetic ophthalmia."]'::jsonb, 0, 'Recurrent episodes of HSV stromal keratitis lead to progressive corneal scarring, lipid deposition, and corneal neovascularization. This destroys the transparency of the cornea, leading to permanent visual loss that may eventually require a penetrating keratoplasty (corneal transplant).
*   **B & C (Retinal detachments)** are complications of posterior segment disease (e.g., CMV retinitis, acute retinal necrosis), not anterior corneal disease.
*   **D (Closed-angle glaucoma)** can occur if posterior synechiae cause pupillary block, but it is not the most common complication of recurrent HSV stromal keratitis.
*   **E (Sympathetic ophthalmia)** is a bilateral granulomatous panuveitis following penetrating ocular trauma or intraocular surgery, not recurrent viral keratitis.');

    ---------------------------------------------------------------------------
    -- CASE 04: Forehead Rash and a Painful Red Eye
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Forehead Rash and a Painful Red Eye' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Forehead Rash and a Painful Red Eye', 'A 68-year-old male presents with severe pain, redness, and tearing in his right eye for 2 days. For the past week, he has experienced a tingling sensation and a painful vesicular rash on his right forehead and upper eyelid.

**Physical Examination:**
*   **Vitals:** Temp: 99.1°F (37.3°C) | HR: 80 bpm | BP: 134/86 mmHg
*   **Physical:** A vesicular dermatomal rash in various stages of crusting is noted on the right side of the forehead, extending down to the tip of the nose.
*   **Visual Acuity:** OD: 20/50; OS: 20/20
*   **Ocular Examination (OD):** Moderate conjunctival injection. Slit-lamp exam reveals multiple elevated, mucous-like pseudodendrites on the corneal epithelium that stain poorly with fluorescein and lack terminal bulbs. There is 2+ cell and flare in the anterior chamber.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 68-year-old male presents with severe pain, redness, and tearing in his right eye for 2 days. For the past week, he has experienced a tingling sensation and a painful vesicular rash on his right forehead and upper eyelid.

**Physical Examination:**
*   **Vitals:** Temp: 99.1°F (37.3°C) | HR: 80 bpm | BP: 134/86 mmHg
*   **Physical:** A vesicular dermatomal rash in various stages of crusting is noted on the right side of the forehead, extending down to the tip of the nose.
*   **Visual Acuity:** OD: 20/50; OS: 20/20
*   **Ocular Examination (OD):** Moderate conjunctival injection. Slit-lamp exam reveals multiple elevated, mucous-like pseudodendrites on the corneal epithelium that stain poorly with fluorescein and lack terminal bulbs. There is 2+ cell and flare in the anterior chamber.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate initial systemic therapy for this patient?', '["Oral valacyclovir 1000 mg three times daily for 7 days.", "Oral acyclovir 400 mg twice daily for 1 year.", "Oral prednisone 60 mg daily tapered over 2 weeks.", "Topical trifluridine 1% drops 9 times daily.", "Intravenous acyclovir 10 mg/kg every 8 hours."]'::jsonb, 0, 'This patient has Herpes Zoster Ophthalmicus (HZO), which is the reactivation of Varicella Zoster Virus (VZV) in the ophthalmic branch (V1) of the trigeminal nerve. The presence of the rash at the tip of the nose (Hutchinson’s sign) indicates involvement of the nasociliary nerve, which directly innervates the ocular structures and correlates with a high risk of ocular disease (keratitis, uveitis). Treatment consists of oral antivirals initiated within 72 hours of rash onset to reduce the severity of HZO and post-herpetic neuralgia. The standard dosage for VZV is oral valacyclovir 1000 mg three times daily (or oral acyclovir 800 mg 5 times daily) for 7 days.
*   **B (Oral acyclovir 400 mg twice daily)** is a suppressive dose used to prevent recurrences of HSV, not treatment for acute HZO.
*   **C (Oral prednisone alone)** does not treat the active viral infection and can promote viral replication; systemic steroids are sometimes used as an adjunct for severe post-herpetic neuralgia in the elderly, but never as monotherapy.
*   **D (Topical trifluridine)** is used for HSV epithelial keratitis, but VZV corneal lesions are pseudodendrites (which are plaques of cells rather than true ulcers) and do not respond well to topical antivirals; treatment is systemic.
*   **E (IV acyclovir)** is reserved for immunocompromised patients or those with disseminated shingles.'),
    (v_case_id, 'The vesicular rash on the tip of this patient''s nose indicates involvement of which specific nerve?', '["Nasociliary nerve.", "Frontal nerve.", "Lacrimal nerve.", "Infraorbital nerve.", "Facial nerve."]'::jsonb, 0, 'The tip of the nose is innervated by the external nasal branch of the nasociliary nerve, which is a branch of the ophthalmic division of the trigeminal nerve (V1). Because the nasociliary nerve also provides sensory innervation to the cornea, ciliary body, and iris, the presence of vesicles on the tip of the nose (Hutchinson''s sign) strongly predicts intraocular inflammation (such as keratitis and iridocyclitis).
*   **B (Frontal nerve)** supplies the forehead and upper eyelid; its involvement causes rash there but does not predict ocular involvement as strongly as the nasociliary nerve.
*   **C (Lacrimal nerve)** innervates the lacrimal gland and lateral conjunctiva.
*   **D (Infraorbital nerve)** is a branch of V2 (maxillary division); it supplies the lower eyelid and cheek, not the forehead or nose tip.
*   **E (Facial nerve)** is CN VII, which provides motor innervation to the muscles of facial expression, not sensory innervation to the skin of the forehead or nose.');

    ---------------------------------------------------------------------------
    -- CASE 05: The Contact Lens Wearer with Excruciating Pain
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Contact Lens Wearer with Excruciating Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Contact Lens Wearer with Excruciating Pain', 'A 22-year-old male college student presents with severe, boring pain, redness, and photophobia in his left eye for 2 weeks. He states the pain is so intense it keeps him awake at night and is completely out of proportion to what he sees in the mirror. He uses monthly disposable contact lenses and admits to rinsing them in tap water when he ran out of sterile solution. He has been using topical moxifloxacin drops prescribed at an urgent care clinic for 10 days without relief.

**Physical Examination:**
*   **Visual Acuity:** OS: 20/100; OD: 20/20
*   **Ocular Examination (OS):** Conjunctival and episcleral injection. Slit-lamp exam reveals a ring-shaped corneal stromal infiltrate in the mid-periphery. There is moderate corneal perineural infiltration (radial keratoneuritis). Overlying epithelial staining is diffuse but patchy.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 22-year-old male college student presents with severe, boring pain, redness, and photophobia in his left eye for 2 weeks. He states the pain is so intense it keeps him awake at night and is completely out of proportion to what he sees in the mirror. He uses monthly disposable contact lenses and admits to rinsing them in tap water when he ran out of sterile solution. He has been using topical moxifloxacin drops prescribed at an urgent care clinic for 10 days without relief.

**Physical Examination:**
*   **Visual Acuity:** OS: 20/100; OD: 20/20
*   **Ocular Examination (OS):** Conjunctival and episcleral injection. Slit-lamp exam reveals a ring-shaped corneal stromal infiltrate in the mid-periphery. There is moderate corneal perineural infiltration (radial keratoneuritis). Overlying epithelial staining is diffuse but patchy.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate next step in the diagnosis and management of this patient''s condition?', '["Perform corneal scraping for culture on non-nutrient agar with an *Escherichia coli* overlay, and initiate topical chlorhexidine 0.02% and propamidine isethionate 0.1%.", "Obtain a viral culture for HSV and initiate topical ganciclovir 0.15% gel.", "Increase the frequency of topical moxifloxacin to every 15 minutes.", "Initiate topical prednisolone acetate 1% every hour to reduce the corneal ring inflammation.", "Apply a bandage contact lens and start topical tobramycin drops."]'::jsonb, 0, 'This clinical picture is classic for *Acanthamoeba* keratitis: a contact lens wearer with poor hygiene (tap water exposure), severe pain out of proportion to clinical signs, radial keratoneuritis (corneal perineural infiltrates), a ring-shaped infiltrate (often a later sign), and lack of response to standard antibacterial therapy. Diagnosis is confirmed by corneal scraping and culture on non-nutrient agar seeded with *E. coli* (which the amoebae feed on) or by confocal microscopy. First-line medical treatment involves topical cysticidal agents, typically a combination of a biguanide (chlorhexidine 0.02% or polyhexamethylene biguanide [PHMB] 0.02%) and a diamidine (propamidine isethionate 0.1% [Brolene]).
*   **B (HSV)** can cause dendritic keratitis and decreased sensation, but does not present with this level of pain, radial keratoneuritis, or a history of tap-water contact lens rinsing.
*   **C (Fluoroquinolones)** are antibacterial and are ineffective against *Acanthamoeba*.
*   **D (Topical steroids)** are controversial and generally avoided in the early phase of *Acanthamoeba* keratitis because they inhibit the host immune response and cause trophozoites to encyst, making the infection harder to eradicate.
*   **E (Bandage lens + tobramycin)** will worsen the infection by trapping the amoebae and providing no effective treatment.'),
    (v_case_id, 'Which of the following forms of the causative organism is highly resistant to standard medical therapy and responsible for chronic recurrence?', '["Cyst.", "Trophozoite.", "Endospore.", "Tachyzoite.", "Bradyzoite."]'::jsonb, 0, '*Acanthamoeba* exists in two life stages: the active, replicating trophozoite and the dormant, double-walled cyst. The cyst form is highly resistant to desiccation, temperature changes, and most antimicrobials. When exposed to drugs, the organism encysts and can remain dormant in the corneal stroma for months, leading to treatment failure and late recurrences when it excysts back into trophozoites.
*   **B (Trophozoite)** is the active, pathogenic form that is susceptible to anti-amoebic agents.
*   **C (Endospore)** is a bacterial survival structure (e.g., in *Bacillus* or *Clostridium*), not protozoan.
*   **D & E (Tachyzoite & Bradyzoite)** are life stages of *Toxoplasma gondii*, which causes retinochoroiditis, not corneal keratitis.');

    ---------------------------------------------------------------------------
    -- CASE 06: Corneal Injury in a Landscaper
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Corneal Injury in a Landscaper' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Corneal Injury in a Landscaper', 'A 42-year-old male landscaper presents to the Emergency Department with a painful, red left eye for 4 days. He recalls being struck in the left eye by a small tree branch while cutting brush last week. He has been using over-the-counter lubricating eye drops without improvement.

**Physical Examination:**
*   **Visual Acuity:** OS: 20/70; OD: 20/20
*   **Ocular Examination (OS):** Conjunctival injection with ciliary flush. Slit-lamp exam of the cornea reveals a central infiltrate with feathery, indistinct borders and several small, independent "satellite" lesions in the surrounding stroma. An endothelial plaque is visible behind the main lesion. No hypopyon is present.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 42-year-old male landscaper presents to the Emergency Department with a painful, red left eye for 4 days. He recalls being struck in the left eye by a small tree branch while cutting brush last week. He has been using over-the-counter lubricating eye drops without improvement.

**Physical Examination:**
*   **Visual Acuity:** OS: 20/70; OD: 20/20
*   **Ocular Examination (OS):** Conjunctival injection with ciliary flush. Slit-lamp exam of the cornea reveals a central infiltrate with feathery, indistinct borders and several small, independent "satellite" lesions in the surrounding stroma. An endothelial plaque is visible behind the main lesion. No hypopyon is present.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate management for this patient?', '["Perform corneal scraping for Giemsa and Gomori methenamine silver (GMS) stains, and initiate topical natamycin 5% suspension.", "Initiate topical moxifloxacin 0.5% drops hourly.", "Initiate topical ganciclovir 0.15% gel 5 times daily.", "Apply topical dexamethasone 0.1% drops 4 times daily.", "Prescribe oral acyclovir 400 mg 5 times daily."]'::jsonb, 0, 'The clinical history of trauma involving vegetable matter (a tree branch) and slit-lamp findings of a corneal infiltrate with feathery borders and satellite lesions are highly characteristic of fungal keratitis (usually filamentous fungi like *Aspergillus* or *Fusarium*). Diagnosis is confirmed with corneal scraping for microscopy (Giemsa, KOH prep, Calcofluor white, or GMS stain) and culture on Sabouraud dextrose agar. Topical natamycin 5% suspension is the only FDA-approved topical formulation for filamentous fungal keratitis; amphotericin B 0.15% is preferred for yeast infections (like *Candida*).
*   **B (Moxifloxacin)** is an antibacterial; it will not treat a fungal infection and can lead to worsening of the disease.
*   **C & E (Ganciclovir & Acyclovir)** are antivirals and have no efficacy against fungi.
*   **D (Topical dexamethasone)** is contraindicated in active fungal keratitis as steroids promote fungal growth and increase the risk of corneal perforation.'),
    (v_case_id, 'Why are filamentous fungal corneal infections particularly dangerous to the intraocular structures?', '["They can penetrate an intact Descemet’s membrane into the anterior chamber.", "They release neurotoxins that paralyze the pupillary sphincter.", "They lead to systemic hematogenous dissemination to the brain.", "They cause occlusion of the central retinal artery.", "They selectively destroy the lacrimal gland, causing permanent dry eye."]'::jsonb, 0, 'Filamentous fungi (*Fusarium* and *Aspergillus*) have the ability to penetrate deep into the corneal stroma and pass through an intact Descemet’s membrane into the anterior chamber. This can lead to endophthalmitis, which is extremely difficult to treat and often requires surgical intervention (therapeutic penetrating keratoplasty or anterior chamber washout with intravitreal antifungals).
*   **B (Neurotoxins)** are not produced by these fungi.
*   **C (Hematogenous dissemination)** is not a typical feature of localized fungal keratitis in immunocompetent hosts.
*   **D (Central retinal artery occlusion)** is a posterior segment vascular event and not a complication of corneal fungal infections.
*   **E (Lacrimal gland destruction)** is not caused by fungal keratitis.');

    ---------------------------------------------------------------------------
    -- CASE 07: The Newborn with Swollen, Purulent Eyelids
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Newborn with Swollen, Purulent Eyelids' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Newborn with Swollen, Purulent Eyelids', 'A 3-day-old male infant is brought to the pediatric emergency room by his mother due to severe swelling and discharge from both eyes. The infant was born via vaginal delivery at home with no prenatal care. The mother reports that her own pregnancy was uneventful, but she has not had any regular health checkups.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F (37.1°C) | HR: 130 bpm | RR: 34/min
*   **Physical:** Bilateral, marked eyelid edema with thick, copious, purulent discharge streaming from both palpebral fissures.
*   **Ocular Examination:** Diffuse, severe conjunctival chemosis and injection. The corneas are clear, but the child is difficult to examine due to severe blepharospasm.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 3-day-old male infant is brought to the pediatric emergency room by his mother due to severe swelling and discharge from both eyes. The infant was born via vaginal delivery at home with no prenatal care. The mother reports that her own pregnancy was uneventful, but she has not had any regular health checkups.

**Physical Examination:**
*   **Vitals:** Temp: 98.8°F (37.1°C) | HR: 130 bpm | RR: 34/min
*   **Physical:** Bilateral, marked eyelid edema with thick, copious, purulent discharge streaming from both palpebral fissures.
*   **Ocular Examination:** Diffuse, severe conjunctival chemosis and injection. The corneas are clear, but the child is difficult to examine due to severe blepharospasm.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most urgent intervention for this infant?', '["Admission for intravenous ceftriaxone and frequent saline irrigation of both eyes.", "Administration of oral erythromycin suspension for 14 days.", "Prescription of topical erythromycin 0.5% ointment to be applied 4 times daily.", "Outpatient follow-up with topical tobramycin drops.", "Performance of a nasolacrimal duct probing."]'::jsonb, 0, 'This is a case of hyperacute ophthalmia neonatorum (neonatal conjunctivitis) occurring within the first 2-5 days of life, which is highly characteristic of *Neisseria gonorrhoeae*. Gonococcal conjunctivitis is a medical emergency because the bacterium can rapidly penetrate intact corneal epithelium, leading to corneal ulceration, perforation, and permanent blindness. The patient requires admission for systemic therapy (IV ceftriaxone 25-50 mg/kg, up to 125 mg) and frequent, hourly saline irrigation of the eyes to wash away the toxic purulent debris.
*   **B (Oral erythromycin)** is the treatment of choice for *Chlamydia trachomatis* conjunctivitis (which typically presents at 5-14 days of life), not *Neisseria gonorrhoeae*.
*   **C (Topical erythromycin ointment)** is used as prophylaxis at birth, but it is completely inadequate as monotherapy for active, established gonococcal conjunctivitis, which requires systemic antibiotics.
*   **D (Topical tobramycin)** does not provide adequate coverage for *Neisseria* and does not address the systemic nature of the infection.
*   **E (Nasolacrimal duct probing)** is a treatment for congenital nasolacrimal duct obstruction (dacryostenosis), which presents with tearing and mild matting, not hyperacute purulent conjunctivitis.'),
    (v_case_id, 'What is the mechanism by which the standard prophylaxis given at birth prevents this condition?', '["Topical erythromycin ointment has bactericidal activity against *Neisseria gonorrhoeae* on the ocular surface.", "Intramuscular phytonadione inhibits the replication of Gram-negative diplococci.", "Silver nitrate drops promote the production of secretory IgA in the neonate''s tears.", "Oral azithromycin clears maternal vaginal colonization prior to delivery.", "Topical povidone-iodine induces corneal epithelial shedding to clear viral particles."]'::jsonb, 0, 'Standard neonatal prophylaxis involves the application of topical erythromycin 0.5% ointment (or tetracycline/silver nitrate historically) within 1 hour of birth. Erythromycin is active against *Neisseria gonorrhoeae* and prevents the acquisition of gonococcal ophthalmia neonatorum during passage through the birth canal. Note that erythromycin prophylaxis does *not* reliably prevent neonatal chlamydial conjunctivitis.
*   **B (IM Vitamin K / phytonadione)** is given to prevent hemorrhagic disease of the newborn, not infections.
*   **C (Silver nitrate)** acts by direct chemical toxicity to bacteria, not by stimulating neonatal IgA production.
*   **D (Oral azithromycin)** is not a neonatal ocular prophylaxis.
*   **E (Povidone-iodine)** is an antiseptic occasionally used, but it does not act by inducing epithelial shedding.');

    ---------------------------------------------------------------------------
    -- CASE 08: The Infant with Mild Redness and Congestion
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Infant with Mild Redness and Congestion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Infant with Mild Redness and Congestion', 'A 10-day-old female infant is brought to the clinic with redness, swelling, and a watery, mucopurulent discharge from her left eye for 48 hours. The mother notes the baby has also had mild nasal congestion. The delivery was vaginal at a local hospital, and erythromycin ointment was applied to the eyes immediately after birth.

**Physical Examination:**
*   **Ocular Examination (OS):** Moderate eyelid swelling and palpebral conjunctival injection. The discharge is mucopurulent. Slit-lamp/loupe examination shows conjunctival follicular response is absent (which is normal in neonates, as they lack lymphoid tissue in the conjunctiva for the first month). The cornea is clear. OD is normal.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 10-day-old female infant is brought to the clinic with redness, swelling, and a watery, mucopurulent discharge from her left eye for 48 hours. The mother notes the baby has also had mild nasal congestion. The delivery was vaginal at a local hospital, and erythromycin ointment was applied to the eyes immediately after birth.

**Physical Examination:**
*   **Ocular Examination (OS):** Moderate eyelid swelling and palpebral conjunctival injection. The discharge is mucopurulent. Slit-lamp/loupe examination shows conjunctival follicular response is absent (which is normal in neonates, as they lack lymphoid tissue in the conjunctiva for the first month). The cornea is clear. OD is normal.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate treatment for this infant''s condition?', '["Oral erythromycin base 50 mg/kg/day divided into 4 doses for 14 days.", "Topical erythromycin 0.5% ointment applied 4 times daily for 10 days.", "Topical ganciclovir 0.15% gel 5 times daily.", "Intravenous acyclovir therapy for 14 days.", "Topical moxifloxacin 0.5% drops 4 times daily."]'::jsonb, 0, 'The onset of neonatal conjunctivitis at 10 days of life (range: 5-14 days) with mucopurulent discharge is highly suspicious for *Chlamydia trachomatis* (inclusion blennorrhea). Topical prophylaxis with erythromycin ointment at birth prevents gonococcal conjunctivitis but does not prevent chlamydial conjunctivitis. Active chlamydial conjunctivitis in neonates must be treated with systemic oral erythromycin (or azithromycin) to eradicate the nasopharyngeal colonization and prevent the development of chlamydial pneumonitis.
*   **B (Topical erythromycin alone)** has a high failure rate because it does not treat the systemic reservoir (nasopharynx), leaving the infant at risk for chlamydial pneumonia.
*   **C & D (Antivirals)** are used for neonatal HSV (which typically presents with vesicular skin lesions, microphthalmia, or keratitis around 1-2 weeks of life), not chlamydial conjunctivitis.
*   **E (Topical moxifloxacin)** does not address the risk of systemic chlamydial pneumonitis.'),
    (v_case_id, 'What potential systemic complication of the treatment must the parents be educated about?', '["Infantile hypertrophic pyloric stenosis.", "Grey baby syndrome.", "Acute kidney injury.", "Permanent tooth discoloration.", "Tendon rupture."]'::jsonb, 0, 'Oral erythromycin use in infants under 6 weeks of age is associated with an increased risk of infantile hypertrophic pyloric stenosis (IHPS). Parents must be instructed to monitor the baby for projectile vomiting and poor feeding. Despite this risk, oral erythromycin (or azithromycin) remains the standard of care for neonatal chlamydial conjunctivitis because the risk of untreated chlamydial pneumonitis is high.
*   **B (Grey baby syndrome)** is a complication of chloramphenicol toxicity in neonates due to immature glucuronidation.
*   **C (AKI)** is associated with aminoglycosides (e.g., gentamicin).
*   **D (Tooth discoloration)** is a complication of tetracyclines in children under 8 years of age.
*   **E (Tendon rupture)** is a risk associated with fluoroquinolones (e.g., ciprofloxacin), not macrolides.');

    ---------------------------------------------------------------------------
    -- CASE 09: The College Student with a Chronic Follicular Red Eye
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The College Student with a Chronic Follicular Red Eye' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The College Student with a Chronic Follicular Red Eye', 'A 19-year-old female college student presents with a 3-week history of redness, foreign body sensation, and watery discharge in her right eye. She has been treated with two courses of topical antibacterial drops (neomycin-polymyxin-gramicidin and tobramycin) by her university student health center without any improvement. She reports being sexually active with a new partner.

**Physical Examination:**
*   **Visual Acuity:** 20/20 in both eyes.
*   **Ocular Examination (OD):** Moderate bulbar conjunctival injection. Slit-lamp exam of the palpebral conjunctiva (especially the inferior tarsus) reveals large, fleshy, lymphoid follicles. A small, non-tender right preauricular lymph node is palpable. The cornea shows mild superior epithelial keratitis but no ulceration. OS exam is completely normal.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 19-year-old female college student presents with a 3-week history of redness, foreign body sensation, and watery discharge in her right eye. She has been treated with two courses of topical antibacterial drops (neomycin-polymyxin-gramicidin and tobramycin) by her university student health center without any improvement. She reports being sexually active with a new partner.

**Physical Examination:**
*   **Visual Acuity:** 20/20 in both eyes.
*   **Ocular Examination (OD):** Moderate bulbar conjunctival injection. Slit-lamp exam of the palpebral conjunctiva (especially the inferior tarsus) reveals large, fleshy, lymphoid follicles. A small, non-tender right preauricular lymph node is palpable. The cornea shows mild superior epithelial keratitis but no ulceration. OS exam is completely normal.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate management for this patient?', '["Prescribe a single oral dose of azithromycin 1 g, and treat her sexual partner.", "Initiate topical trifluridine 1% drops 9 times daily for 10 days.", "Perform a conjunctival biopsy to rule out lymphoma.", "Increase the frequency of topical antibacterial drops and add topical dexamethasone.", "Advise the patient to stop using cosmetics and apply warm compresses."]'::jsonb, 0, 'This patient presents with adult inclusion conjunctivitis, caused by *Chlamydia trachomatis* (serotypes D-K). It is a chronic follicular conjunctivitis that characteristically does not respond to standard topical antibacterial drops. The presence of unilateral follicular conjunctivitis, a preauricular node, and a history of a new sexual partner points to this sexually transmitted infection. The treatment of choice is oral azithromycin (1 g single dose) or oral doxycycline (100 mg twice daily for 7 days). It is vital to treat all sexual partners to prevent reinfection.
*   **B (Topical trifluridine)** is for HSV epithelial keratitis, which presents with dendrites, not chronic follicular conjunctivitis.
*   **C (Conjunctival biopsy)** is not indicated; the clinical picture of follicles in a young, sexually active patient is typical of chlamydial disease.
*   **D (Topical steroids)** will suppress the inflammation temporarily but will mask the infection and allow it to persist; standard topical antibacterials are ineffective against *Chlamydia*.
*   **E (Warm compresses/cosmetic cessation)** is for blepharitis or contact dermatitis, not inclusion conjunctivitis.'),
    (v_case_id, 'Which diagnostic test is considered the gold standard for confirming the diagnosis of this patient''s ocular infection?', '["Nucleic acid amplification test (NAAT) of conjunctival swabs.", "Viral culture of corneal scrapings.", "Polymerase chain reaction (PCR) for adenovirus.", "Bacterial culture on chocolate agar.", "Fungal culture on Sabouraud agar."]'::jsonb, 0, 'Nucleic Acid Amplification Tests (NAAT) have high sensitivity and specificity and are the diagnostic method of choice for *Chlamydia trachomatis* in both urogenital and ocular specimens. Conjunctival scraping/swabbing is performed to obtain epithelial cells (since *Chlamydia* is an obligate intracellular pathogen).
*   **B & C (Viral culture & Adenovirus PCR)** are for viral etiologies (HSV/Adenovirus), not *Chlamydia*.
*   **D (Chocolate agar)** is used to culture fastidious organisms like *Neisseria gonorrhoeae* or *Haemophilus influenzae*.
*   **E (Sabouraud agar)** is for fungal cultures.');

    ---------------------------------------------------------------------------
    -- CASE 10: Red Eyes, Sore Throat, and Fever
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Red Eyes, Sore Throat, and Fever' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Red Eyes, Sore Throat, and Fever', 'A 9-year-old male is brought to the clinic by his father due to bilateral red eyes, a sore throat, runny nose, and a subjective fever for 3 days. Several children at the patient''s summer camp have had similar symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 100.8°F (38.2°C) | HR: 96 bpm | BP: 105/68 mmHg
*   **Physical:** Mild pharyngeal erythema. Bilateral nontender preauricular lymphadenopathy is present.
*   **Visual Acuity:** 20/20 in both eyes.
*   **Ocular Examination:** Bilateral conjunctival injection with prominent follicular reaction in the inferior palpebral conjunctiva. Tearing is profuse and watery. The corneas are clear with no fluorescein staining.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 9-year-old male is brought to the clinic by his father due to bilateral red eyes, a sore throat, runny nose, and a subjective fever for 3 days. Several children at the patient''s summer camp have had similar symptoms.

**Physical Examination:**
*   **Vitals:** Temp: 100.8°F (38.2°C) | HR: 96 bpm | BP: 105/68 mmHg
*   **Physical:** Mild pharyngeal erythema. Bilateral nontender preauricular lymphadenopathy is present.
*   **Visual Acuity:** 20/20 in both eyes.
*   **Ocular Examination:** Bilateral conjunctival injection with prominent follicular reaction in the inferior palpebral conjunctiva. Tearing is profuse and watery. The corneas are clear with no fluorescein staining.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate management strategy for this child''s condition?', '["Supportive care with cool compresses and artificial tears; patient education on strict hand hygiene.", "Topical moxifloxacin 0.5% drops 4 times daily for 7 days.", "Topical ganciclovir 0.15% gel 5 times daily.", "Topical prednisolone acetate 1% drops every 2 hours.", "Oral acyclovir 400 mg three times daily."]'::jsonb, 0, 'This patient has pharyngoconjunctival fever (PCF), a classic clinical syndrome caused by Adenovirus (most commonly types 3, 4, and 7). PCF is characterized by the triad of fever, pharyngitis, and follicular conjunctivitis, often with preauricular lymphadenopathy. It is highly contagious and frequently spreads in summer camps, schools, and swimming pools. The disease is self-limiting (usually resolving in 10-14 days), and treatment is purely supportive (cool compresses, artificial tears, antihistamines). Strict hand hygiene and isolation from school/camp are essential to prevent transmission.
*   **B (Moxifloxacin)** is an antibacterial; adenoviral conjunctivitis is viral and does not require antibiotic therapy unless bacterial superinfection is suspected.
*   **C & E (Ganciclovir & Acyclovir)** are for herpesviruses (HSV/VZV) and have no clinical efficacy against adenovirus.
*   **D (Topical steroids)** are generally avoided in acute adenoviral conjunctivitis because they prolong viral shedding and can lead to corneal complications if used inappropriately.'),
    (v_case_id, 'What corneal finding can develop 1 to 2 weeks after the onset of this infection, representing an immune response rather than active viral replication?', '["Subepithelial infiltrates (SEIs).", "Dendritic corneal ulcers.", "Ring-shaped stromal infiltrates.", "Filamentary keratitis.", "Band keratopathy."]'::jsonb, 0, 'In adenoviral keratoconjunctivitis (especially Epidemic Keratoconjunctivitis [EKC], but also PCF), immune-mediated subepithelial infiltrates (SEIs) can develop in the cornea 1-2 weeks after the onset of symptoms. These infiltrates represent a lymphocytic response to viral antigens in the stroma and can cause blurred vision and glare. They may require topical steroids or cyclosporine if they significantly affect visual acuity.
*   **B (Dendritic ulcers)** are pathognomonic for HSV epithelial keratitis.
*   **C (Ring-shaped infiltrates)** are associated with *Acanthamoeba* or chronic bacterial keratitis.
*   **D (Filamentary keratitis)** occurs in severe dry eye, superior limbic keratoconjunctivitis, or corneal epitheliopathy.
*   **E (Band keratopathy)** is calcium deposition in Bowman''s membrane, seen in chronic uveitis (e.g., JIA).');

    ---------------------------------------------------------------------------
    -- CASE 11: The Rapidly Progressing Purulent Eye in an Adult
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rapidly Progressing Purulent Eye in an Adult' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rapidly Progressing Purulent Eye in an Adult', 'A 26-year-old male presents to the Emergency Department with hyperacute redness, swelling, and massive purulent discharge in his left eye that started yesterday and has rapidly progressed. He reports his eye is "pouring yellow pus."

**Physical Examination:**
*   **Visual Acuity:** OS: 20/40; OD: 20/20
*   **Ocular Examination (OS):** Severe eyelid edema, marked chemosis (conjunctival swelling), and injection. Thick, yellow-green purulent discharge is seen reaccumulating immediately after being wiped away. Slit-lamp exam shows the cornea is clear, but there is mild peripheral epithelial haziness. The anterior chamber is quiet.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 26-year-old male presents to the Emergency Department with hyperacute redness, swelling, and massive purulent discharge in his left eye that started yesterday and has rapidly progressed. He reports his eye is "pouring yellow pus."

**Physical Examination:**
*   **Visual Acuity:** OS: 20/40; OD: 20/20
*   **Ocular Examination (OS):** Severe eyelid edema, marked chemosis (conjunctival swelling), and injection. Thick, yellow-green purulent discharge is seen reaccumulating immediately after being wiped away. Slit-lamp exam shows the cornea is clear, but there is mild peripheral epithelial haziness. The anterior chamber is quiet.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate management for this patient?', '["Immediate conjunctival swab for Gram stain and culture on chocolate agar, administration of intramuscular ceftriaxone 1 g, and hourly topical ciprofloxacin drops.", "Prescription of oral azithromycin 1 g and reassurance that the condition is self-limiting.", "Initiation of topical prednisolone acetate 1% drops every hour to reduce chemosis.", "Application of a pressure patch and prescribing topical tobramycin ointment.", "Outpatient referral to ophthalmology in 1 week."]'::jsonb, 0, 'This is a classic presentation of hyperacute bacterial conjunctivitis, which is most commonly caused by *Neisseria gonorrhoeae* in adults. It is characterized by rapid progression (onset within 24 hours), severe chemosis, and copious, overflowing purulent discharge. Because *Neisseria* can penetrate intact corneal epithelium and cause rapid corneal perforation, it is an ocular emergency. Immediate management includes obtaining a Gram stain (which shows Gram-negative intracellular diplococci) and culture on chocolate/Thayer-Martin agar, administration of systemic ceftriaxone (1 g IM), and intensive topical fluoroquinolone drops (ciprofloxacin or moxifloxacin).
*   **B (Oral azithromycin 1 g alone)** is used to treat concurrent *Chlamydia* infection, but it is insufficient for gonococcal conjunctivitis, which requires ceftriaxone.
*   **C (Topical steroids)** are contraindicated in active, severe bacterial infections.
*   **D (Pressure patch)** is contraindicated in all purulent infections as it traps discharge and promotes corneal melting.
*   **E (Ophthalmology in 1 week)** is too late; corneal perforation can occur within 24-48 hours.'),
    (v_case_id, 'What unique biological feature of the likely causative pathogen allows it to infect the cornea without a prior epithelial defect?', '["Ability to bind to and penetrate intact mucosal and corneal epithelial cells.", "Secretion of exotoxins that digest the corneal basement membrane.", "Production of a polysaccharide capsule that resists phagocytosis.", "Spore-forming capability that allows survival in dry environments.", "Direct neurotropism along the ophthalmic branch of the trigeminal nerve."]'::jsonb, 0, '*Neisseria gonorrhoeae* (and *Corynebacterium diphtheriae*, *Haemophilus aegyptius*, and *Listeria monocytogenes*) has the rare ability to penetrate intact, healthy corneal epithelial cells. Most other bacteria (such as *Pseudomonas*, *Staphylococcus*, and *Streptococcus*) require a pre-existing epithelial defect (from trauma or contact lens wear) to cause keratitis.
*   **B (Exotoxins)** are not the primary mechanism of penetration for *Neisseria*.
*   **C (Polysaccharide capsule)** is a feature of *Streptococcus pneumoniae* and *Neisseria meningitidis*, but does not mediate direct epithelial penetration in the cornea for *N. gonorrhoeae*.
*   **D (Spore-forming)** is characteristic of *Bacillus* and *Clostridium*.
*   **E (Neurotropism)** is characteristic of Herpes Simplex Virus and Varicella Zoster Virus.');

    ---------------------------------------------------------------------------
    -- CASE 12: The Itchy-Eyed Child with Tarsal Cobblestones
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Itchy-Eyed Child with Tarsal Cobblestones' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Itchy-Eyed Child with Tarsal Cobblestones', 'An 8-year-old male is brought to the allergy clinic by his mother due to intense, bilateral eye itching, redness, and stringy mucus discharge for the past 2 weeks. The mother notes he has had similar symptoms every spring for the past three years. The child has a history of asthma and seasonal allergies.

**Physical Examination:**
*   **Visual Acuity:** 20/20 in both eyes.
*   **Ocular Examination (Bilateral):** Moderate conjunctival injection. Eversion of the upper eyelids reveals large, flat-topped, giant cobblestone-like papillae (each $> 1.0\text{ mm}$ in diameter) on the superior tarsal conjunctiva. A ropey, white mucus discharge is present. Slit-lamp exam of the limbus shows small, white, elevated dots (Horner-Trantas dots) at the superior limbus. The corneas are clear.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 8-year-old male is brought to the allergy clinic by his mother due to intense, bilateral eye itching, redness, and stringy mucus discharge for the past 2 weeks. The mother notes he has had similar symptoms every spring for the past three years. The child has a history of asthma and seasonal allergies.

**Physical Examination:**
*   **Visual Acuity:** 20/20 in both eyes.
*   **Ocular Examination (Bilateral):** Moderate conjunctival injection. Eversion of the upper eyelids reveals large, flat-topped, giant cobblestone-like papillae (each $> 1.0\text{ mm}$ in diameter) on the superior tarsal conjunctiva. A ropey, white mucus discharge is present. Slit-lamp exam of the limbus shows small, white, elevated dots (Horner-Trantas dots) at the superior limbus. The corneas are clear.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate long-term preventive therapy for this child''s ocular condition?', '["Topical mast cell stabilizer/antihistamine combination drops (e.g., olopatadine 0.2% daily).", "Long-term topical dexamethasone 0.1% drops daily.", "Topical moxifloxacin 0.5% drops 4 times daily.", "Oral acyclovir 200 mg daily.", "Bilateral tarsal conjunctival resection."]'::jsonb, 0, 'This child presents with Vernal Keratoconjunctivitis (VKC), a severe, recurrent bilateral allergic inflammation of the conjunctiva that typically affects young males in warm climates and has a seasonal pattern. Classic features include intense itching, cobblestone papillae on the superior tarsal conjunctiva, Horner-Trantas dots (clumps of eosinophils and epithelial cells) at the limbus, and stringy mucus discharge. First-line long-term management and prophylaxis involve dual-action topical mast cell stabilizer/antihistamine drops (e.g., olopatadine, alcaftadine, or ketotifen). Topical steroids are reserved for short-term "pulse" therapy during acute flare-ups due to their side-effect profile.
*   **B (Long-term topical steroids)** is incorrect because chronic topical steroid use carries a high risk of cataract formation, glaucoma (steroid-induced IOP elevation), and secondary infections.
*   **C (Topical moxifloxacin)** is an antibiotic and has no role in managing allergic eye disease.
*   **D (Oral acyclovir)** is an antiviral and is not used for VKC.
*   **E (Tarsal conjunctival resection)** is not indicated; the disease is medical, and surgical resection of conjunctiva leads to scarring and severe dry eye.'),
    (v_case_id, 'A serious corneal complication of this disease, caused by mechanical rubbing of the giant papillae against the corneal epithelium combined with inflammatory cytokines, is known as:', '["Shield ulcer.", "Dendritic ulcer.", "Ring infiltrate.", "Wessely ring.", "Mooren''s ulcer."]'::jsonb, 0, 'A shield ulcer is a sterile, oval-shaped epithelial defect in the superior cornea that can develop in patients with severe VKC. It is caused by the mechanical friction of the giant tarsal papillae scraping against the cornea, aggravated by the chemical toxic effects of mediators (such as major basic protein) released by eosinophils. It requires treatment with topical lubricants, topical steroids, and sometimes a bandage contact lens.
*   **B (Dendritic ulcer)** is caused by HSV.
*   **C (Ring infiltrate)** is seen in *Acanthamoeba* keratitis.
*   **D (Wessely ring)** is an immune ring of corneal precipitate composed of antigen-antibody complexes, often seen in association with foreign bodies or chronic keratitis.
*   **E (Mooren''s ulcer)** is an idiopathic, painful, progressive peripheral ulcerative keratitis of autoimmune origin, not related to VKC.');

    ---------------------------------------------------------------------------
    -- CASE 13: Eczema and Red, Scarred Eyes
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Eczema and Red, Scarred Eyes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Eczema and Red, Scarred Eyes', 'A 38-year-old male with a history of severe, lifelong atopic dermatitis, asthma, and multiple food allergies presents with chronic, bilateral red eyes, severe itching, burning, and photophobia for the past 6 months. He has noticed his vision has been gradually declining.

**Physical Examination:**
*   **Physical:** Severe, thickened, erythematous, flaky skin (atopic dermatitis) on the face, neck, and flexor surfaces of his arms. The eyelids are thickened, crusty, and show signs of chronic rubbing (lichenification).
*   **Visual Acuity:** 20/50 in both eyes.
*   **Ocular Examination (Bilateral):** Redness and scaling of the eyelid margins. The palpebral conjunctiva shows fine papillae on the inferior tarsus, along with subepithelial fibrosis and early symblepharon (adhesion of palpebral and bulbar conjunctiva). The corneas show 360-degree superficial neovascularization and punctate epithelial erosions.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 38-year-old male with a history of severe, lifelong atopic dermatitis, asthma, and multiple food allergies presents with chronic, bilateral red eyes, severe itching, burning, and photophobia for the past 6 months. He has noticed his vision has been gradually declining.

**Physical Examination:**
*   **Physical:** Severe, thickened, erythematous, flaky skin (atopic dermatitis) on the face, neck, and flexor surfaces of his arms. The eyelids are thickened, crusty, and show signs of chronic rubbing (lichenification).
*   **Visual Acuity:** 20/50 in both eyes.
*   **Ocular Examination (Bilateral):** Redness and scaling of the eyelid margins. The palpebral conjunctiva shows fine papillae on the inferior tarsus, along with subepithelial fibrosis and early symblepharon (adhesion of palpebral and bulbar conjunctiva). The corneas show 360-degree superficial neovascularization and punctate epithelial erosions.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Atopic Keratoconjunctivitis (AKC).", "Vernal Keratoconjunctivitis (VKC).", "Epidemic Keratoconjunctivitis (EKC).", "Ocular Cicatricial Pemphigoid (OCP).", "Giant Papillary Conjunctivitis (GPC)."]'::jsonb, 0, 'Atopic Keratoconjunctivitis (AKC) is a chronic, bilateral inflammatory disease of the conjunctiva and cornea that occurs in patients with atopic dermatitis. Unlike Vernal Keratoconjunctivitis (VKC), which primarily affects young boys and is seasonal, AKC occurs in adults, is year-round, and involves the inferior tarsal conjunctiva more than the superior. AKC can lead to serious conjunctival scarring (symblepharon), corneal neovascularization, and cataracts.
*   **B (VKC)** affects children, presents with superior tarsal giant cobblestone papillae, and rarely causes the chronic lid lichenification and inferior scarring seen in AKC.
*   **C (EKC)** is an acute, self-limiting adenoviral infection.
*   **D (OCP)** is a systemic autoimmune cicatrizing disease of the elderly that causes symblepharon but is not associated with severe atopic dermatitis.
*   **E (GPC)** is a mechanical allergy seen in contact lens wearers, characterized by giant papillae on the superior tarsal plate, without systemic skin disease.'),
    (v_case_id, 'Patients with this ocular condition are at a significantly increased risk for developing which of the following corneal pathologies?', '["Keratoconus.", "Fungal keratitis due to *Candida*.", "Acanthamoeba keratitis.", "Interstitial keratitis.", "Peripheral ulcerative keratitis."]'::jsonb, 0, 'Patients with AKC (and severe atopic disease in general) are at a highly increased risk of developing keratoconus. This is thought to be due to chronic, vigorous eye rubbing driven by intense ocular pruritus, which mechanically weakens the corneal stroma, leading to progressive thinning and ectasia (cone-like protrusion).
*   **B & C (Fungal/Acanthamoeba keratitis)** are associated with trauma/vegetative matter and contact lens wear, not specifically atopic disease.
*   **D (Interstitial keratitis)** is associated with congenital syphilis.
*   **E (Peripheral ulcerative keratitis)** is associated with collagen vascular diseases like Rheumatoid Arthritis or GPA.');

    ---------------------------------------------------------------------------
    -- CASE 14: The HLA-B27 Patient with Acute Eye Pain
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The HLA-B27 Patient with Acute Eye Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The HLA-B27 Patient with Acute Eye Pain', 'A 31-year-old male presents with a 2-day history of severe, deep ache, redness, and photophobia in his left eye. He has had lower back stiffness in the mornings that improves with exercise, but has never been formally diagnosed with a systemic condition.

**Physical Examination:**
*   **Visual Acuity:** OS: 20/50; OD: 20/20
*   **Ocular Examination (OS):** Significant conjunctival injection, primarily located in a ring around the limbus (ciliary flush). Slit-lamp exam of the left eye reveals 3+ cell and flare in the anterior chamber. There are multiple fine, white keratic precipitates (KPs) on the inferior corneal endothelium. The pupil of the left eye is slightly smaller than the right and is irregular. OD exam is normal.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 31-year-old male presents with a 2-day history of severe, deep ache, redness, and photophobia in his left eye. He has had lower back stiffness in the mornings that improves with exercise, but has never been formally diagnosed with a systemic condition.

**Physical Examination:**
*   **Visual Acuity:** OS: 20/50; OD: 20/20
*   **Ocular Examination (OS):** Significant conjunctival injection, primarily located in a ring around the limbus (ciliary flush). Slit-lamp exam of the left eye reveals 3+ cell and flare in the anterior chamber. There are multiple fine, white keratic precipitates (KPs) on the inferior corneal endothelium. The pupil of the left eye is slightly smaller than the right and is irregular. OD exam is normal.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate initial medical therapy for this patient''s left eye?', '["Topical prednisolone acetate 1% and topical homatropine 5% drops.", "Topical moxifloxacin 0.5% and topical ketorolac 0.5% drops.", "Topical pilocarpine 2% drops and oral acetazolamide.", "Immediate intravitreal injection of vancomycin and ceftazidime.", "Systemic oral acyclovir 800 mg 5 times daily."]'::jsonb, 0, 'This patient presents with acute, unilateral anterior uveitis (iritis), as evidenced by pain, photophobia, ciliary flush, anterior chamber cells/flare, and a miotic, irregular pupil (suggestive of early posterior synechiae). Given his history of morning back stiffness, this is highly likely HLA-B27-associated uveitis (e.g., Ankylosing Spondylitis). The mainstay of therapy is topical corticosteroids (prednisolone acetate 1%) to control the inflammation, combined with a topical cycloplegic/mydriatic agent (such as homatropine 5% or cyclopentolate 1%). The cycloplegic dilates the pupil to prevent and break posterior synechiae (adhesions of the iris to the lens) and paralyzes the ciliary muscle to relieve painful ciliary spasm.
*   **B (Moxifloxacin + Ketorolac)** is for bacterial corneal ulcers or post-op management; NSAIDs are insufficient for acute iritis, and antibiotics have no role.
*   **C (Pilocarpine)** is a miotic agent used in angle-closure glaucoma; it is contraindicated in uveitis because it constricts the pupil, increasing the contact between the iris and lens and promoting synechiae formation.
*   **D (Intravitreal antibiotics)** is the treatment for endophthalmitis (which presents with vitritis, hypopyon, and history of intraocular surgery/trauma), not sterile anterior uveitis.
*   **E (Oral acyclovir)** is for viral infections, which are not suggested by this presentation.'),
    (v_case_id, 'What is the primary anatomical target of the inflammatory process in this patient''s disease?', '["Iris and ciliary body.", "Corneal stroma.", "Trabecular meshwork.", "Choroid and retina.", "Sclera."]'::jsonb, 0, 'Anterior uveitis refers to inflammation of the anterior portion of the uveal tract, which consists of the iris (iritis) and the ciliary body (iridocyclitis). This leads to the release of inflammatory cells and proteins into the anterior chamber, seen on slit-lamp exam as cell and flare.
*   **B (Corneal stroma)** is the target in stromal keratitis.
*   **C (Trabecular meshwork)** can become clogged with inflammatory debris (leading to uveitic glaucoma), but it is not the primary site of inflammation.
*   **D (Choroid and retina)** are the targets in posterior uveitis or chorioretinitis.
*   **E (Sclera)** is inflamed in scleritis.');

    ---------------------------------------------------------------------------
    -- CASE 15: The Patient with Bilateral Mutton-Fat Keratic Precipitates
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Patient with Bilateral Mutton-Fat Keratic Precipitates' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Patient with Bilateral Mutton-Fat Keratic Precipitates', 'A 54-year-old African American female presents with bilateral blurred vision, mild eye discomfort, and floaters for the past month. She also reports a dry cough, mild shortness of breath, and painful red bumps on her shins.

**Physical Examination:**
*   **Physical:** Multiple tender, erythematous nodules on her shins (erythema nodosum). Bilateral salivary gland enlargement is noted.
*   **Visual Acuity:** OU: 20/40
*   **Ocular Examination (Bilateral):** Slit-lamp exam reveals large, greasy, "mutton-fat" keratic precipitates on the corneal endothelium. The anterior chamber shows 2+ cell and flare. Examination of the iris reveals small nodules along the pupillary border (Koeppe nodules) and on the iris stroma (Busacca nodules). Dilated fundus examination shows peripheral retinal periphlebitis ("candle-wax drippings").', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 54-year-old African American female presents with bilateral blurred vision, mild eye discomfort, and floaters for the past month. She also reports a dry cough, mild shortness of breath, and painful red bumps on her shins.

**Physical Examination:**
*   **Physical:** Multiple tender, erythematous nodules on her shins (erythema nodosum). Bilateral salivary gland enlargement is noted.
*   **Visual Acuity:** OU: 20/40
*   **Ocular Examination (Bilateral):** Slit-lamp exam reveals large, greasy, "mutton-fat" keratic precipitates on the corneal endothelium. The anterior chamber shows 2+ cell and flare. Examination of the iris reveals small nodules along the pupillary border (Koeppe nodules) and on the iris stroma (Busacca nodules). Dilated fundus examination shows peripheral retinal periphlebitis ("candle-wax drippings").', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what is the best initial systemic workup?', '["Sarcoidosis; Chest X-ray/CT and serum Angiotensin-Converting Enzyme (ACE) level.", "Ankylosing Spondylitis; Pelvic X-ray and HLA-B27 testing.", "Tuberculosis; Purified protein derivative (PPD) skin test and sputum culture.", "Syphilis; RPR/VDRL and FTA-ABS testing.", "Toxoplasmosis; Anti-toxoplasma IgG and IgM titers."]'::jsonb, 0, 'The clinical features of bilateral granulomatous anterior uveitis (marked by "mutton-fat" KPs and Koeppe/Busacca nodules), erythema nodosum, dry cough, and dyspnea in an African American female are highly suggestive of sarcoidosis. The ocular findings of retinal periphlebitis ("candle-wax drippings") are also classic. The initial workup should include a chest X-ray or chest CT (to look for bilateral hilar adenopathy) and serum ACE and lysozyme levels.
*   **B (Ankylosing Spondylitis)** causes acute, unilateral, non-granulomatous anterior uveitis (fine KPs, no iris nodules), and is associated with morning stiffness, not pulmonary symptoms or erythema nodosum.
*   **C (Tuberculosis)** can cause granulomatous uveitis, but erythema nodosum and bilateral hilar adenopathy in a young-to-middle-aged Black female is most classically sarcoidosis; both should be ruled out, but sarcoid is the primary suspect.
*   **D (Syphilis)** is a "great masquerader" and can cause granulomatous uveitis, but does not present with erythema nodosum and the pulmonary symptoms described.
*   **E (Toxoplasmosis)** typically causes posterior focal retinochoroiditis, not isolated bilateral granulomatous anterior uveitis with systemic findings of sarcoidosis.'),
    (v_case_id, 'What is the histopathological hallmark of the lesions driving this patient''s systemic and ocular disease?', '["Non-caseating granulomas.", "Caseating granulomas.", "Multinucleated giant cells with intracytoplasmic inclusions (Cowdry A).", "Neutrophilic infiltration with leukocytoclastic vasculitis.", "Amyloid deposition within the uveal stroma."]'::jsonb, 0, 'Sarcoidosis is a systemic disease characterized by the accumulation of T lymphocytes and mononuclear phagocytes, leading to the formation of non-caseating epithelioid granulomas in affected organs (including the lungs, lymph nodes, skin, and eyes).
*   **B (Caseating granulomas)** are the hallmark of Tuberculosis, not sarcoidosis.
*   **C (Cowdry A inclusions)** are associated with Herpes Simplex Virus.
*   **D (Leukocytoclastic vasculitis)** is seen in systemic vasculitides like Behcet''s or Granulomatosis with Polyangiitis.
*   **E (Amyloid deposition)** is not a feature of sarcoidosis.');

    ---------------------------------------------------------------------------
    -- CASE 16: The Silent Eye in a Child with Joint Pain
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Silent Eye in a Child with Joint Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Silent Eye in a Child with Joint Pain', 'A 6-year-old female is brought to the ophthalmologist for a routine screening exam. The child was diagnosed with oligoarticular Juvenile Idiopathic Arthritis (JIA) one year ago. Her parents report she has no eye complaints, no redness, and no visual difficulties.

**Physical Examination:**
*   **Visual Acuity:** OU: 20/25
*   **Ocular Examination (Bilateral):** The eyes are quiet and white (no conjunctival injection). Slit-lamp examination, however, reveals 1+ cells in the anterior chamber. There is early calcium deposition in a horizontal band across the interpalpebral zone of both corneas (band keratopathy). The pupils are round and reactive.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 6-year-old female is brought to the ophthalmologist for a routine screening exam. The child was diagnosed with oligoarticular Juvenile Idiopathic Arthritis (JIA) one year ago. Her parents report she has no eye complaints, no redness, and no visual difficulties.

**Physical Examination:**
*   **Visual Acuity:** OU: 20/25
*   **Ocular Examination (Bilateral):** The eyes are quiet and white (no conjunctival injection). Slit-lamp examination, however, reveals 1+ cells in the anterior chamber. There is early calcium deposition in a horizontal band across the interpalpebral zone of both corneas (band keratopathy). The pupils are round and reactive.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate next step in the management and screening of this patient?', '["Initiate topical prednisolone acetate 1% drops, and schedule follow-up slit-lamp exams every 3 months.", "Reassure the parents that since the eyes are white and she has no pain, no treatment is required.", "Perform bilateral corneal EDTA chelation immediately in the clinic.", "Recommend a referral to an orthopedic surgeon for joint injections.", "Initiate systemic methotrexate and discontinue all eye drops."]'::jsonb, 0, 'Oligoarticular JIA is strongly associated with chronic, bilateral, non-granulomatous anterior uveitis. Crucially, this uveitis is often "silent" or asymptomatic—there is no pain, photophobia, or redness ("white eye"). Because it is asymptomatic, children are at risk for late complications such as cataracts, glaucoma, and band keratopathy before the diagnosis is made. Strict screening protocols are required (slit-lamp exams every 3-4 months for high-risk patients: ANA-positive, young onset, oligoarticular). Treatment of active inflammation involves topical steroids (prednisolone acetate 1%) and cycloplegics, along with systemic immunosuppression if refractory.
*   **B (Reassurance)** is dangerous; chronic subclinical inflammation leads to permanent vision loss due to band keratopathy, cataracts, and secondary glaucoma.
*   **C (EDTA chelation)** is the treatment for band keratopathy when it becomes visually significant or symptomatic, but control of the active uveitis must be addressed first, and chelation is done under controlled settings, not immediately for asymptomatic early disease.
*   **D (Orthopedic referral)** does not address the active uveitis.
*   **E (Methotrexate)** is a steroid-sparing agent used for chronic control, but topical steroids are required for immediate control of active cells in the anterior chamber.'),
    (v_case_id, 'The horizontal corneal opacity observed in this child is caused by deposition of which substance in which layer of the cornea?', '["Calcium in Bowman''s layer.", "Cholesterol in the stroma.", "Copper in Descemet''s membrane.", "Iron in the epithelium.", "Urate in the endothelium."]'::jsonb, 0, 'Band keratopathy is characterized by the deposition of calcium phosphate crystals in the basement membrane of the epithelium and Bowman''s layer of the cornea. It classically occurs in chronic uveitis (especially JIA), chronic dry eye, or hypercalcemic states (e.g., hyperparathyroidism).
*   **B (Cholesterol)** is deposited in corneal arcus, which occurs in the peripheral stroma.
*   **C (Copper)** is deposited in Descemet''s membrane in Wilson''s disease (Kayser-Fleischer ring).
*   **D (Iron)** is deposited in epithelial lines (e.g., Hudson-Stahli line or Fleischer ring in keratoconus).
*   **E (Urate)** is not typically deposited in the corneal endothelium.');

    ---------------------------------------------------------------------------
    -- CASE 17: Unilateral Eye Color Change and Chronic Inflammation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Unilateral Eye Color Change and Chronic Inflammation' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Unilateral Eye Color Change and Chronic Inflammation', 'A 28-year-old female presents with a gradual, painless decline in vision in her left eye over the past year. She also notes that her left eye looks "lighter" in color than her right eye in photos. She has no pain, redness, or photophobia.

**Physical Examination:**
*   **Visual Acuity:** OS: 20/50; OD: 20/20
*   **Ocular Examination:**
    *   **Iris Color:** OD: Dark brown; OS: Light brown (heterochromia).
    *   **OS Slit-lamp:** Small, stellate keratic precipitates (KPs) distributed diffusely over the entire corneal endothelium (not just inferiorly). 0.5+ cell and flare in the anterior chamber. Early posterior subcapsular cataract is present. No posterior synechiae are seen. OD exam is normal.
    *   **Intraocular Pressure (IOP):** OD: 14 mmHg; OS: 23 mmHg (elevated).', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old female presents with a gradual, painless decline in vision in her left eye over the past year. She also notes that her left eye looks "lighter" in color than her right eye in photos. She has no pain, redness, or photophobia.

**Physical Examination:**
*   **Visual Acuity:** OS: 20/50; OD: 20/20
*   **Ocular Examination:**
    *   **Iris Color:** OD: Dark brown; OS: Light brown (heterochromia).
    *   **OS Slit-lamp:** Small, stellate keratic precipitates (KPs) distributed diffusely over the entire corneal endothelium (not just inferiorly). 0.5+ cell and flare in the anterior chamber. Early posterior subcapsular cataract is present. No posterior synechiae are seen. OD exam is normal.
    *   **Intraocular Pressure (IOP):** OD: 14 mmHg; OS: 23 mmHg (elevated).', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what is the recommended management strategy?', '["Fuchs Uveitis Syndrome (Fuchs Heterochromic Iridocyclitis); Cataract/glaucoma management and observation (avoid chronic topical steroids).", "Herpes Simplex anterior uveitis; Chronic topical trifluridine and prednisolone acetate 1%.", "Posner-Schlossman Syndrome; Immediate trabeculectomy.", "Melanoma of the iris; Enucleation of the left eye.", "Sympathetic ophthalmia; High-dose oral prednisone."]'::jsonb, 0, 'This is a classic presentation of Fuchs Uveitis Syndrome (Fuchs Heterochromic Iridocyclitis). Key diagnostic features include: unilateral chronic mild uveitis, heterochromia (the affected eye is typically hypochromic/lighter due to iris stromal atrophy), diffuse stellate KPs, lack of posterior synechiae, and a high association with cataract and glaucoma. Crucially, the mild anterior chamber inflammation in Fuchs does *not* respond to topical corticosteroids, and chronic steroid use will only accelerate cataract and glaucoma development. Thus, standard treatment is observation of the uveitis, and management of the secondary cataract and glaucoma when they become clinically significant.
*   **B (HSV uveitis)** presents with acute flares, focal KPs, iris transillumination defects, and responds well to topical steroids and oral acyclovir, but does not present with Fuchs'' characteristic diffuse stellate KPs and quiet, painless heterochromia.
*   **C (Posner-Schlossman)** is characterized by recurrent, acute, unilateral episodes of very high IOP and mild uveitis, not chronic heterochromia and cataract.
*   **D (Iris melanoma)** would present as a localized nodule or mass, not diffuse iris atrophy and chronic uveitis.
*   **E (Sympathetic ophthalmia)** is a bilateral granulomatous uveitis following trauma/surgery.'),
    (v_case_id, 'Slit-lamp examination of the iris in this patient''s left eye is likely to reveal which of the following signs?', '["Atrophy of the iris stroma with loss of normal iris crypts.", "Large Koeppe nodules at the pupillary border.", "Dense posterior synechiae sticking the iris to the lens.", "Neovascularization of the iris (rubeosis iridis) blocking the angle.", "Lisch nodules on the iris surface."]'::jsonb, 0, 'Fuchs Uveitis Syndrome causes chronic, progressive iris atrophy, which leads to the flattening of the anterior iris surface and the loss of the normal iris crypts, contributing to the change in eye color (heterochromia).
*   **B (Koeppe nodules)** are seen in granulomatous uveitis (e.g., sarcoidosis, TB), not Fuchs.
*   **C (Posterior synechiae)** are characteristically *absent* in Fuchs Uveitis Syndrome, despite the chronic nature of the inflammation.
*   **D (Rubeosis iridis)** is associated with retinal ischemia (e.g., diabetic retinopathy, CRVO), not Fuchs.
*   **E (Lisch nodules)** are melanocytic hamartomas seen in Neurofibromatosis Type 1, not inflammatory iris changes.');

    ---------------------------------------------------------------------------
    -- CASE 18: Bilateral Panuveitis After Trauma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bilateral Panuveitis After Trauma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bilateral Panuveitis After Trauma', 'A 45-year-old male presents with bilateral photophobia, pain, redness, and floaters for 3 days. He reports having a penetrating metal-on-metal injury to his right eye 6 weeks ago, which was surgically repaired at the time, leaving the right eye with no light perception (NLP).

**Physical Examination:**
*   **Visual Acuity:** OD: No Light Perception (NLP); OS: 20/60
*   **Ocular Examination (OS):** Significant conjunctival injection with ciliary flush. Slit-lamp exam of the left eye shows mutton-fat KPs, 3+ cells in the anterior chamber, and posterior synechiae. Dilated fundus examination shows vitritis (2+ cells) and multiple yellow-white lesions in the mid-peripheral choroid. OD exam shows severe phthisis bulbi (shrunken, disorganized eye).', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old male presents with bilateral photophobia, pain, redness, and floaters for 3 days. He reports having a penetrating metal-on-metal injury to his right eye 6 weeks ago, which was surgically repaired at the time, leaving the right eye with no light perception (NLP).

**Physical Examination:**
*   **Visual Acuity:** OD: No Light Perception (NLP); OS: 20/60
*   **Ocular Examination (OS):** Significant conjunctival injection with ciliary flush. Slit-lamp exam of the left eye shows mutton-fat KPs, 3+ cells in the anterior chamber, and posterior synechiae. Dilated fundus examination shows vitritis (2+ cells) and multiple yellow-white lesions in the mid-peripheral choroid. OD exam shows severe phthisis bulbi (shrunken, disorganized eye).', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what is the most appropriate management?', '["Sympathetic Ophthalmia; Aggressive systemic corticosteroids and immunosuppressive therapy.", "Endogenous bacterial endophthalmitis; Intravitreal antibiotics and vitrectomy.", "Vogt-Koyanagi-Harada (VKH) disease; Lumbar puncture followed by systemic steroids.", "Ocular histoplasmosis syndrome; Intravitreal anti-VEGF injections.", "Toxoplasmosis chorioretinitis; Triple therapy with pyrimethamine, sulfadiazine, and leucovorin."]'::jsonb, 0, 'This is a classic presentation of Sympathetic Ophthalmia, a rare, bilateral granulomatous panuveitis that occurs following penetrating ocular trauma (or intraocular surgery) to one eye (the "exciting" eye). The inflammation in the uninjured eye (the "sympathizing" eye) typically appears 2 weeks to several months after the trauma. It is an autoimmune response against sequestered ocular (uveal/retinal) antigens exposed during the initial injury. Treatment requires aggressive systemic corticosteroids and steroid-sparing immunosuppressants (e.g., cyclosporine, azathioprine) to protect the vision of the sympathizing eye.
*   **B (Endogenous endophthalmitis)** is a bacterial/fungal seeding of the eye, usually in patients with bacteremia, indwelling catheters, or IV drug use, presenting with rapid onset, vitritis, and hypopyon, not a delayed uveitis in the contralateral traumatized eye.
*   **C (VKH)** presents similarly with bilateral granulomatous uveitis and choroidal lesions, but is associated with systemic signs (meningismus, vitiligo, alopecia, dysacusis) and does *not* require a history of penetrating trauma.
*   **D (POHS)** is a non-inflammatory condition presenting with punched-out scars and peripapillary atrophy, without anterior chamber reaction or vitritis.
*   **E (Toxoplasmosis)** presents as a focal necrotizing retinochoroiditis, not a diffuse bilateral granulomatous panuveitis.'),
    (v_case_id, 'What surgical intervention, if performed early after the trauma, can prevent the development of this condition in the contralateral eye?', '["Enucleation of the traumatized (exciting) eye within 10-14 days of injury.", "Laser photocoagulation of the peripheral retina.", "Pars plana vitrectomy of the traumatized eye within 24 hours.", "Intravitreal steroid injection of the exciting eye immediately.", "Tarsorrhaphy of the uninjured eye."]'::jsonb, 0, 'Enucleation (surgical removal) of the severely traumatized, non-salvageable eye (with no visual potential, e.g., NLP) within 10 to 14 days of the initial injury is highly protective against the development of sympathetic ophthalmia in the contralateral eye. It prevents the sensitization of the immune system to the exposed uveal antigens. Once sympathetic ophthalmia has developed in the sympathizing eye, enucleation of the exciting eye is of controversial benefit and is generally avoided if there is any potential for vision in that eye.
*   **B (Laser photocoagulation)**, **C (Vitrectomy)**, and **D (Intravitreal steroids)** do not prevent the systemic autoimmune sensitization that leads to sympathetic ophthalmia.
*   **E (Tarsorrhaphy)** is for exposure keratitis, not uveitis prevention.');

    ---------------------------------------------------------------------------
    -- CASE 19: The Uveitis Patient with Neurological and Skin Symptoms
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Uveitis Patient with Neurological and Skin Symptoms' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Uveitis Patient with Neurological and Skin Symptoms', 'A 29-year-old female of Asian descent presents with bilateral blurry vision, headache, stiff neck, and sensitivity to light for 5 days. She also reports a "ringing in her ears" (tinnitus).

**Physical Examination:**
*   **Vitals:** Temp: 98.9°F (37.2°C) | HR: 76 bpm | BP: 120/75 mmHg
*   **Physical:** Mild patch of depigmented hair on her scalp (poliosis) and vitiligo on her hands. No focal neurological deficits are present.
*   **Visual Acuity:** OU: 20/80
*   **Ocular Examination (Bilateral):** Mutton-fat KPs, 2+ cell and flare in the anterior chamber, and vitritis. Dilated fundus examination reveals bilateral swelling of the optic disc and multifocal exudative (serous) retinal detachments.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 29-year-old female of Asian descent presents with bilateral blurry vision, headache, stiff neck, and sensitivity to light for 5 days. She also reports a "ringing in her ears" (tinnitus).

**Physical Examination:**
*   **Vitals:** Temp: 98.9°F (37.2°C) | HR: 76 bpm | BP: 120/75 mmHg
*   **Physical:** Mild patch of depigmented hair on her scalp (poliosis) and vitiligo on her hands. No focal neurological deficits are present.
*   **Visual Acuity:** OU: 20/80
*   **Ocular Examination (Bilateral):** Mutton-fat KPs, 2+ cell and flare in the anterior chamber, and vitritis. Dilated fundus examination reveals bilateral swelling of the optic disc and multifocal exudative (serous) retinal detachments.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Vogt-Koyanagi-Harada (VKH) disease.", "Sympathetic ophthalmia.", "Behcet''s disease.", "Sarcoidosis.", "Multiple sclerosis-associated intermediate uveitis."]'::jsonb, 0, 'Vogt-Koyanagi-Harada (VKH) disease is a systemic autoimmune disorder directed against melanocytes (pigment-producing cells). It classically presents in patients of pigmented races (Asian, Hispanic, Native American) with a combination of ocular, neurological, and cutaneous symptoms. The clinical course has four phases: prodromal (headache, meningismus, tinnitus, dysacusis), acute ophthalmic (bilateral granulomatous panuveitis with exudative retinal detachments and optic disc edema), convalescent (alopecia, poliosis, vitiligo, and "sunset glow" fundus), and chronic recurrent.
*   **B (Sympathetic ophthalmia)** is clinically identical to VKH in its ocular findings, but requires a history of penetrating ocular trauma/surgery, which this patient does not have.
*   **C (Behcet''s)** presents with non-granulomatous panuveitis, necrotizing vasculitis, shifting hypopyon, and painful oral/genital ulcers, without exudative retinal detachments or vitiligo.
*   **D (Sarcoidosis)** can cause granulomatous panuveitis, but is not associated with exudative retinal detachments, meningismus, or vitiligo/poliosis.
*   **E (Multiple sclerosis)** is associated with intermediate uveitis (pars planitis) and optic neuritis (unilateral, painful vision loss), not granulomatous panuveitis with exudative detachments.'),
    (v_case_id, 'The primary autoimmune target in this patient''s disease is located in which of the following cell types?', '["Melanocytes.", "Keratinocytes.", "Oligodendrocytes.", "Schwann cells.", "Photoreceptors."]'::jsonb, 0, 'VKH is a cell-mediated autoimmune response directed against melanin-associated antigens on melanocytes. This explains the involvement of the uvea (highly pigmented), the meninges (contains melanocytes), the inner ear (stria vascularis contains melanocytes), and the skin/hair (vitiligo/poliosis).
*   **B (Keratinocytes)**, **C (Oligodendrocytes)**, **D (Schwann cells)**, and **E (Photoreceptors)** are not the primary target of the autoimmune attack in VKH.');

    ---------------------------------------------------------------------------
    -- CASE 20: Punched-Out Lesions in a Patient from Ohio
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Punched-Out Lesions in a Patient from Ohio' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Punched-Out Lesions in a Patient from Ohio', 'A 32-year-old male from Ohio presents for a routine eye exam. He has no ocular complaints and his visual acuity is 20/20 in both eyes.

**Physical Examination:**
*   **Ocular Examination (Bilateral):**
    *   **Anterior Segment:** Completely quiet; no conjunctival injection, no cells or flare in the anterior chamber, no KPs.
    *   **Vitreous:** Clear; no cells.
    *   **Dilated Fundus Examination:**
        *   **Optic Disc:** Mild peripapillary atrophy (PPA) in both eyes.
        *   **Macula:** Clear in both eyes.
        *   **Periphery:** Multiple small, round, white-yellow "punched-out" chorioretinal scars (100–200 microns) in the mid-periphery of both eyes.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 32-year-old male from Ohio presents for a routine eye exam. He has no ocular complaints and his visual acuity is 20/20 in both eyes.

**Physical Examination:**
*   **Ocular Examination (Bilateral):**
    *   **Anterior Segment:** Completely quiet; no conjunctival injection, no cells or flare in the anterior chamber, no KPs.
    *   **Vitreous:** Clear; no cells.
    *   **Dilated Fundus Examination:**
        *   **Optic Disc:** Mild peripapillary atrophy (PPA) in both eyes.
        *   **Macula:** Clear in both eyes.
        *   **Periphery:** Multiple small, round, white-yellow "punched-out" chorioretinal scars (100–200 microns) in the mid-periphery of both eyes.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what is the appropriate management?', '["Presumed Ocular Histoplasmosis Syndrome (POHS); Observation only.", "Active ocular Toxoplasmosis; Triple therapy with pyrimethamine, sulfadiazine, and steroids.", "Ocular Tuberculosis; Sputum culture and initiation of RIPE therapy.", "Syphilitic chorioretinitis; Intravenous penicillin G for 14 days.", "Sarcoid panuveitis; Topical prednisolone acetate 1% drops."]'::jsonb, 0, 'This patient presents with the classic triad of Presumed Ocular Histoplasmosis Syndrome (POHS): peripapillary atrophy, punched-out peripheral chorioretinal scars ("histo spots"), and a history of living in an endemic area (Ohio-Mississippi River Valley). The third component of the triad is maculopathy (choroidal neovascularization), which is absent here. Crucially, POHS is a non-inflammatory condition of the vitreous and anterior segment (there is no vitritis, cell, or flare). Because this patient has no active choroidal neovascular membrane (CNVM) in the macula and is asymptomatic, no treatment is required.
*   **B (Toxoplasmosis)** causes active focal retinochoroiditis with vitritis ("headlight in the fog"), which is not present here.
*   **C & D (TB & Syphilis)** are infectious uveitis syndromes that present with active intraocular inflammation, vitritis, or anterior chamber cells.
*   **E (Sarcoidosis)** is an inflammatory panuveitis with cells, KPs, and vitritis, which are absent in this patient.'),
    (v_case_id, 'If this patient develops central vision loss in the future, it is most likely due to which of the following mechanisms?', '["Development of a choroidal neovascular membrane (CNVM) in the macula.", "Epiretinal membrane formation.", "Neovascular glaucoma.", "Vitreous hemorrhage from retinal neovascularization.", "Tractional retinal detachment."]'::jsonb, 0, 'The primary cause of vision loss in POHS is the development of a choroidal neovascular membrane (CNVM) adjacent to an old macular histoplasmosis scar. This membrane leaks fluid or blood under the retina, leading to metamorphopsia and central vision loss. Treatment of choice for active CNVM in POHS is intravitreal anti-VEGF injections.
*   **B (Epiretinal membrane)** is not a primary complication of POHS.
*   **C (Neovascular glaucoma)** is caused by anterior segment ischemia (e.g., CRVO, diabetes).
*   **D & E (Vitreous hemorrhage & Tractional detachment)** are complications of proliferative retinopathies (e.g., diabetes) or severe vitritis, not POHS.');

    ---------------------------------------------------------------------------
    -- CASE 21: The "Headlight in the Fog"
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The "Headlight in the Fog"' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The "Headlight in the Fog"', 'A 27-year-old male presents with unilateral painless blurred vision and floaters in his right eye for 1 week. He reports having a cat at home but denies any scratch injuries.

**Physical Examination:**
*   **Visual Acuity:** OD: 20/80; OS: 20/20
*   **Ocular Examination:**
    *   **Anterior Segment (OD):** 1+ cells in the anterior chamber, fine KPs.
    *   **Vitreous (OD):** Significant vitritis (3+ cells and haze).
    *   **Fundus (OD):** A focal, white, fluffy retinal lesion (approximately 2 disc diameters in size) is located adjacent to an old, pigmented, atrophic chorioretinal scar in the superior arcade. The view of the lesion is partially obscured by the overlying vitreous haze. OS fundus is normal.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 27-year-old male presents with unilateral painless blurred vision and floaters in his right eye for 1 week. He reports having a cat at home but denies any scratch injuries.

**Physical Examination:**
*   **Visual Acuity:** OD: 20/80; OS: 20/20
*   **Ocular Examination:**
    *   **Anterior Segment (OD):** 1+ cells in the anterior chamber, fine KPs.
    *   **Vitreous (OD):** Significant vitritis (3+ cells and haze).
    *   **Fundus (OD):** A focal, white, fluffy retinal lesion (approximately 2 disc diameters in size) is located adjacent to an old, pigmented, atrophic chorioretinal scar in the superior arcade. The view of the lesion is partially obscured by the overlying vitreous haze. OS fundus is normal.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what is the standard therapy?', '["Toxoplasmosis chorioretinitis; Pyrimethamine, sulfadiazine, folinic acid, and systemic corticosteroids.", "Cytomegalovirus (CMV) retinitis; Intravenous ganciclovir.", "Presumed Ocular Histoplasmosis Syndrome (POHS); Intravitreal anti-VEGF.", "Acute Retinal Necrosis (ARN); Intravenous acyclovir.", "Syphilitic neuroretinitis; Intravenous penicillin G."]'::jsonb, 0, 'This is a classic presentation of ocular toxoplasmosis, the most common cause of posterior uveitis/infectious retinochoroiditis in immunocompetent individuals. Key diagnostic features include unilateral focal necrotizing retinochoroiditis, which appears as a white, fluffy lesion adjacent to a pigmented, scarred old lesion (representing reactivation of congenital or acquired cysts). The severe vitritis directly overlying the active lesion gives the classic "headlight in the fog" appearance. Standard treatment is the "triple therapy" of pyrimethamine, sulfadiazine, and systemic corticosteroids (to reduce inflammatory damage to the retina), accompanied by folinic acid (leucovorin) to prevent pyrimethamine-induced bone marrow suppression.
*   **B (CMV retinitis)** occurs in immunocompromised individuals (CD4 $< 50$) and presents with minimal vitritis and a "pizza-pie" fundus (necrosis with hemorrhage), not a focal lesion next to a pigmented scar with severe vitritis.
*   **C (POHS)** is characterized by an absence of vitritis and has punched-out scars, not an active white retinal lesion with severe vitreous cells.
*   **D (ARN)** is a rapidly progressive herpesvirus retinitis causing extensive peripheral necrosis and vitritis, not a focal lesion adjacent to a scar.
*   **E (Syphilis)** is a possibility, but the specific combination of a focal white lesion adjacent to a pigmented scar with "headlight in the fog" is pathognomonic for toxoplasmosis.'),
    (v_case_id, 'What is the primary reason for administering folinic acid (leucovorin) in this patient''s treatment regimen?', '["To prevent pyrimethamine-induced myelosuppression (leukopenia and thrombocytopenia).", "To enhance the absorption of sulfadiazine in the gut.", "To reduce the incidence of corticosteroid-induced hyperglycemia.", "To prevent renal crystal deposition from sulfadiazine.", "To direct the drug specifically to the retina."]'::jsonb, 0, 'Pyrimethamine is a folic acid antagonist (dihydrofolate reductase inhibitor) that can cause bone marrow suppression, leading to leukopenia, thrombocytopenia, and anemia. Folinic acid (leucovorin) is administered to bypass this block in host cells, protecting the bone marrow, while the protozoan *Toxoplasma* cannot utilize exogenous folinic acid.
*   **B (Enhance absorption)** is incorrect; sulfadiazine absorption is not dependent on folinic acid.
*   **C (Reduce hyperglycemia)** is incorrect; leucovorin has no effect on steroid-induced glucose levels.
*   **D (Prevent renal crystals)** is achieved by maintaining high fluid intake and alkalinizing the urine, not by folinic acid.
*   **E (Direct drug to retina)** is incorrect.');

    ---------------------------------------------------------------------------
    -- CASE 22: Painless Vision Loss in a Patient with AIDS
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Painless Vision Loss in a Patient with AIDS' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Painless Vision Loss in a Patient with AIDS', 'A 35-year-old male with a history of HIV infection presents with progressive, painless vision loss and floaters in his left eye for 2 weeks. He has not been adherent to his Antiretroviral Therapy (ART).

**Physical Examination:**
*   **Laboratory:** CD4 count is 32 cells/µL.
*   **Visual Acuity:** OS: 20/100; OD: 20/20
*   **Ocular Examination (OS):** The eye is quiet and white (no conjunctival injection). Slit-lamp exam of the anterior chamber shows no cells or flare. The vitreous is clear (no vitritis). Dilated fundus examination reveals extensive, granular, yellow-white areas of retinal necrosis along the vascular arcades, with associated prominent intraretinal hemorrhages ("pizza-pie" or "scrambled eggs and ketchup" appearance).', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old male with a history of HIV infection presents with progressive, painless vision loss and floaters in his left eye for 2 weeks. He has not been adherent to his Antiretroviral Therapy (ART).

**Physical Examination:**
*   **Laboratory:** CD4 count is 32 cells/µL.
*   **Visual Acuity:** OS: 20/100; OD: 20/20
*   **Ocular Examination (OS):** The eye is quiet and white (no conjunctival injection). Slit-lamp exam of the anterior chamber shows no cells or flare. The vitreous is clear (no vitritis). Dilated fundus examination reveals extensive, granular, yellow-white areas of retinal necrosis along the vascular arcades, with associated prominent intraretinal hemorrhages ("pizza-pie" or "scrambled eggs and ketchup" appearance).', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what is the appropriate treatment?', '["Cytomegalovirus (CMV) retinitis; Oral valganciclovir or intravenous ganciclovir, and optimization of ART.", "Toxoplasmosis chorioretinitis; Oral pyrimethamine and sulfadiazine.", "Acute Retinal Necrosis (ARN); Intravenous acyclovir.", "Progressive Outer Retinal Necrosis (PORN); Intravenous foscarnet.", "Ocular Candidiasis; Intravitreal amphotericin B."]'::jsonb, 0, 'CMV retinitis is the most common opportunistic ocular infection in AIDS patients, typically occurring when the CD4 count drops below 50 cells/µL. It presents with painless vision loss or floaters. The classic fundus appearance is a "pizza-pie" or "ketchup and scrambled eggs" pattern, consisting of necrotizing viral retinitis with prominent hemorrhage. Because the patient is severely immunocompromised, there is a lack of inflammatory cells, resulting in a quiet anterior chamber and no vitritis (unlike toxoplasmosis or ARN). First-line treatment is oral valganciclovir or IV ganciclovir/foscarnet, along with initiation/optimization of ART.
*   **B (Toxoplasmosis)** presents with severe vitritis ("headlight in the fog"), which is absent in this patient due to a quiet vitreous.
*   **C (ARN)** is a herpesvirus retinitis that presents with severe vitritis, pain, and peripheral necrotic lesions in immunocompetent or mildly immunocompromised patients.
*   **D (PORN)** is also VZV-related and seen in AIDS, but presents with rapid, progressive, patchy outer retinal necrosis starting in the periphery, with *no* or minimal hemorrhage, and minimal vitritis.
*   **E (Ocular Candidiasis)** presents as fluffy white vitreous chorioretinal lesions, usually in IV drug users or patients with candidemia.'),
    (v_case_id, 'Four weeks after initiating ART, the patient returns with sudden, painful redness and blurred vision in his left eye. Slit-lamp exam now shows 3+ cell and flare in the anterior chamber and severe vitritis. His CD4 count has increased to 180 cells/µL. This reaction is most likely due to:', '["Immune Recovery Uveitis (IRU).", "CMV resistance to valganciclovir.", "Development of acute bacterial endophthalmitis.", "Reactivation of HSV epithelial keratitis.", "Progression to retinal detachment."]'::jsonb, 0, 'Immune Recovery Uveitis (IRU) is an inflammatory response that occurs in HIV patients with CMV retinitis after they begin Antiretroviral Therapy (ART) and experience a reconstitution of their immune system (typically an increase in CD4 count to $> 100$ cells/µL). The newly restored immune system mounts an inflammatory response against residual CMV antigens in the eye, presenting as a new onset of vitritis, anterior uveitis, papillitis, or macular edema.
*   **B (CMV resistance)** would present as progression of the necrotizing retinitis (expanding border of white necrosis), not a sudden onset of intraocular inflammation/vitritis in the setting of rising CD4 count.
*   **C (Bacterial endophthalmitis)** is unlikely without intraocular surgery or trauma.
*   **D (HSV keratitis)** presents with corneal dendrites, not vitritis and anterior uveitis in the setting of immune recovery.
*   **E (Retinal detachment)** is a mechanical complication of CMV retinitis due to thinning of the necrotic retina, but does not explain the sudden onset of 3+ cell and flare.');

    ---------------------------------------------------------------------------
    -- CASE 23: Rapidly Progressive Peripheral Retinal Necrosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Rapidly Progressive Peripheral Retinal Necrosis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Rapidly Progressive Peripheral Retinal Necrosis', 'A 58-year-old female presents with severe pain, redness, and rapid loss of vision in her right eye over the last 3 days. She has a history of shingles on her torso 3 months ago but is otherwise healthy.

**Physical Examination:**
*   **Visual Acuity:** OD: 20/400; OS: 20/20
*   **Ocular Examination (OD):** Moderate conjunctival and episcleral injection. Slit-lamp exam shows 2+ cells in the anterior chamber and 3+ cells in the vitreous (severe vitritis). Dilated fundus examination reveals patchy, confluent, yellowish-white areas of full-thickness retinal necrosis in the peripheral retina, showing rapid progression and occlusion of retinal vessels (periarteritis). OS exam is normal.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 58-year-old female presents with severe pain, redness, and rapid loss of vision in her right eye over the last 3 days. She has a history of shingles on her torso 3 months ago but is otherwise healthy.

**Physical Examination:**
*   **Visual Acuity:** OD: 20/400; OS: 20/20
*   **Ocular Examination (OD):** Moderate conjunctival and episcleral injection. Slit-lamp exam shows 2+ cells in the anterior chamber and 3+ cells in the vitreous (severe vitritis). Dilated fundus examination reveals patchy, confluent, yellowish-white areas of full-thickness retinal necrosis in the peripheral retina, showing rapid progression and occlusion of retinal vessels (periarteritis). OS exam is normal.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what is the immediate treatment?', '["Acute Retinal Necrosis (ARN); Hospitalization for intravenous acyclovir followed by oral valacyclovir, and urgent ophthalmology consultation.", "Cytomegalovirus (CMV) retinitis; Oral valganciclovir outpatient.", "Toxoplasmosis chorioretinitis; Oral pyrimethamine and sulfadiazine.", "Sympathetic ophthalmia; Intravenous methylprednisolone.", "Fungal endophthalmitis; Intravitreal amphotericin B."]'::jsonb, 0, 'Acute Retinal Necrosis (ARN) is a rapidly progressive, necrotizing retinitis caused by Herpes Simplex Virus (HSV) or Varicella Zoster Virus (VZV). It typically occurs in immunocompetent or mildly immunocompromised patients. The classic triad of ARN is: peripheral necrotizing retinitis with circumferential progression, occlusive vasculitis (affecting retinal arteries), and prominent vitreous/anterior segment inflammation (vitritis, uveitis). The treatment is an ocular emergency: hospitalization for IV acyclovir (10 mg/kg every 8 hours) or intravitreal foscarnet/ganciclovir, followed by long-term oral valacyclovir (2 g three times daily) to prevent involvement of the fellow eye. Systemic steroids are added 24-48 hours after initiating antiviral therapy to reduce the inflammatory vitritis.
*   **B (CMV retinitis)** occurs in severely immunocompromised patients (CD4 $< 50$), is painless, progresses slowly, has minimal vitritis, and does not cause the severe periarteritis and rapid peripheral necrosis of ARN.
*   **C (Toxoplasmosis)** presents as a focal chorioretinal lesion next to a scar, not rapid confluent peripheral necrosis.
*   **D (Sympathetic ophthalmia)** requires a history of penetrating trauma and presents with choroidal lesions, not full-thickness necrotizing retinitis.
*   **E (Fungal endophthalmitis)** is associated with IV drug use, indwelling lines, or systemic fungemia, presenting with fluffy vitreous balls, not rapid occlusive vasculitis and peripheral retinal necrosis.'),
    (v_case_id, 'What is the most common late mechanical complication of this disease, occurring in up to 75% of untreated cases?', '["Rhegmatogenous retinal detachment.", "Central retinal vein occlusion.", "Neovascular glaucoma.", "Tractional retinal detachment.", "Optic nerve sheath meningioma."]'::jsonb, 0, 'Rhegmatogenous retinal detachment (RRD) is a common late complication of ARN (occurring in 50-75% of cases), caused by the creation of multiple large retinal breaks at the junction between the necrotic and healthy retina as the vitreous contracts. Prophylactic barrier laser photocoagulation around the necrotic areas is often performed to prevent this.
*   **B & C (CRVO & Neovascular glaucoma)** are vascular/ischemic complications, but are not the most common mechanical complication.
*   **D (Tractional retinal detachment)** can occur but RRD due to multiple retinal holes is much more common.
*   **E (Optic nerve meningioma)** is a tumor and not related to viral retinitis.');

    ---------------------------------------------------------------------------
    -- CASE 24: Shifting Hypopyon and Oral Ulcers
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Shifting Hypopyon and Oral Ulcers' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Shifting Hypopyon and Oral Ulcers', 'A 28-year-old male of Mediterranean descent presents with painful redness, photophobia, and blurred vision in both eyes for 2 days. He reports having recurrent, painful sores in his mouth and on his scrotum for the past 2 years.

**Physical Examination:**
*   **Physical:** Multiple painful aphthous ulcers are present on his buccal mucosa and tongue. Two shallow, painful ulcers are visible on his scrotum.
*   **Ocular Examination (Bilateral):** Circumcorneal conjunctival injection. Slit-lamp examination reveals a mobile, shifting hypopyon (a layer of inflammatory cells in the anterior chamber that moves with head tilt). The anterior chamber shows 3+ cell and flare. Dilated fundus examination shows vitritis and sheathing of the retinal veins (phlebitis).', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old male of Mediterranean descent presents with painful redness, photophobia, and blurred vision in both eyes for 2 days. He reports having recurrent, painful sores in his mouth and on his scrotum for the past 2 years.

**Physical Examination:**
*   **Physical:** Multiple painful aphthous ulcers are present on his buccal mucosa and tongue. Two shallow, painful ulcers are visible on his scrotum.
*   **Ocular Examination (Bilateral):** Circumcorneal conjunctival injection. Slit-lamp examination reveals a mobile, shifting hypopyon (a layer of inflammatory cells in the anterior chamber that moves with head tilt). The anterior chamber shows 3+ cell and flare. Dilated fundus examination shows vitritis and sheathing of the retinal veins (phlebitis).', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Behcet''s disease.", "Reactive arthritis.", "Sarcoidosis.", "Systemic Lupus Erythematosus (SLE).", "Inflammatory Bowel Disease (IBD)-associated uveitis."]'::jsonb, 0, 'This is a classic presentation of Behcet''s disease, a systemic vasculitis characterized by the triad of recurrent aphthous oral ulcers, genital ulcers, and uveitis. The uveitis is typically bilateral, non-granulomatous, and can affect both the anterior and posterior segments (panuveitis). The presence of a transient, shifting hypopyon in a relatively quiet-appearing eye is highly characteristic. Retinal vasculitis (specifically phlebitis) and retinitis are common and can lead to permanent vision loss if untreated.
*   **B (Reactive arthritis)** causes HLA-B27 associated acute unilateral anterior uveitis, urethritis, and arthritis, but not recurrent genital ulcers (it can cause circinate balanitis, which is painless, and keratoderma blennorrhagica, which is scaly).
*   **C (Sarcoidosis)** causes granulomatous uveitis (mutton-fat KPs, iris nodules) and pulmonary disease, not recurrent painful genital ulcers.
*   **D (SLE)** can cause cotton wool spots and lupus retinopathy, but not recurrent hypopyon and oral/genital ulcers.
*   **E (IBD)** causes acute anterior uveitis, but is accompanied by GI symptoms (abdominal pain, bloody diarrhea).'),
    (v_case_id, 'Which of the following physical findings or tests is most useful in confirming the diagnosis of this patient''s condition?', '["Development of a sterile pustule 24–48 hours after a skin prick with a sterile needle.", "Detection of antineutrophil cytoplasmic antibodies (C-ANCA) in serum.", "Presence of rheumatoid factor and anti-CCP antibodies.", "Joint fluid analysis showing uric acid crystals.", "Elevated serum angiotensin-converting enzyme (ACE) levels."]'::jsonb, 0, 'The pathergy test is highly specific for Behcet''s disease. It involves pricking the skin of the forearm with a sterile needle; the development of a sterile pustule or papule at the site 24-48 hours later is a positive result.
*   **B (C-ANCA)** is associated with Granulomatosis with Polyangiitis (Wegener''s), which can cause scleritis and peripheral ulcerative keratitis, not Behcet''s.
*   **C (RF & anti-CCP)** are for Rheumatoid Arthritis.
*   **D (Uric acid crystals)** are diagnostic for Gout.
*   **E (ACE levels)** are elevated in Sarcoidosis.');

    ---------------------------------------------------------------------------
    -- CASE 25: Peripheral Corneal Thinning in a Rheumatoid Arthritis Patient
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Peripheral Corneal Thinning in a Rheumatoid Arthritis Patient' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Peripheral Corneal Thinning in a Rheumatoid Arthritis Patient', 'A 62-year-old female with a 20-year history of severe Rheumatoid Arthritis (RA) presents with severe, boring pain, redness, and photophobia in her right eye for 1 week. She reports the pain is worse in the early morning hours.

**Physical Examination:**
*   **Physical:** Severe deformities of the joints in both hands (ulnar deviation, boutonniere deformities).
*   **Visual Acuity:** OD: 20/60; OS: 20/20
*   **Ocular Examination (OD):** Deep episcleral injection that does not blanch with topical phenylephrine drops. Slit-lamp examination of the cornea reveals crescent-shaped thinning of the peripheral stroma at the limbus from the 10 o''clock to 2 o''clock positions, with an overlying epithelial defect. No infiltrates are present. The central cornea is of normal thickness.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 62-year-old female with a 20-year history of severe Rheumatoid Arthritis (RA) presents with severe, boring pain, redness, and photophobia in her right eye for 1 week. She reports the pain is worse in the early morning hours.

**Physical Examination:**
*   **Physical:** Severe deformities of the joints in both hands (ulnar deviation, boutonniere deformities).
*   **Visual Acuity:** OD: 20/60; OS: 20/20
*   **Ocular Examination (OD):** Deep episcleral injection that does not blanch with topical phenylephrine drops. Slit-lamp examination of the cornea reveals crescent-shaped thinning of the peripheral stroma at the limbus from the 10 o''clock to 2 o''clock positions, with an overlying epithelial defect. No infiltrates are present. The central cornea is of normal thickness.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what is the most appropriate management?', '["Peripheral Ulcerative Keratitis (PUK) associated with RA; Systemic immunosuppression (e.g., systemic corticosteroids and cyclophosphamide/rituximab) and avoidance of topical steroids.", "Marginal keratitis; Topical moxifloxacin and prednisolone acetate 1% drops.", "Exposure keratitis; Immediate lateral tarsorrhaphy.", "Bacterial corneal ulcer; Hourly topical fortified tobramycin.", "Mooren''s ulcer; Immediate corneal transplantation (penetrating keratoplasty)."]'::jsonb, 0, 'This is a classic presentation of Peripheral Ulcerative Keratitis (PUK) in a patient with severe, long-standing Rheumatoid Arthritis. PUK is characterized by crescent-shaped thinning and ulceration of the peripheral corneal stroma, often associated with scleritis (suggested here by deep episcleral injection that does not blanch with phenylephrine and boring pain). It represents a localized vasculitis of the anterior ciliary vessels. The treatment requires aggressive systemic immunosuppression (high-dose systemic steroids and steroid-sparing agents like cyclophosphamide or rituximab) because it is a manifestation of active systemic necrotizing vasculitis and carries a high risk of corneal perforation and cardiovascular mortality. Crucially, topical corticosteroids must be used with extreme caution or avoided entirely in PUK, as they inhibit stromal collagen synthesis and can rapidly accelerate corneal melting and perforation.
*   **B (Marginal keratitis)** is an immune reaction to Staphylococcal toxins on the lid margin, presenting with peripheral infiltrates with a clear space to the limbus, and is mild, responding to lid hygiene and low-dose topical steroid-antibiotic combinations.
*   **C (Exposure keratitis)** occurs due to incomplete eyelid closure (facial nerve palsy), affecting the inferior cornea, not the superior periphery with scleritis in an RA patient.
*   **D (Bacterial ulcer)** would present with a purulent stromal infiltrate, not sterile peripheral thinning.
*   **E (Mooren''s ulcer)** is also a PUK but is a diagnosis of exclusion in patients with *no* systemic autoimmune disease.'),
    (v_case_id, 'The stromal destruction in this patient''s corneal disease is primarily mediated by the activation of which of the following enzymes?', '["Matrix Metalloproteinases (MMPs), such as collagenase.", "Carbonic anhydrase.", "Angiotensin-converting enzyme.", "Lysozyme.", "Caspases."]'::jsonb, 0, 'PUK is driven by deposition of immune complexes in the limbal vascular arcade, which recruits inflammatory cells (neutrophils and macrophages). These cells release matrix metalloproteinases (MMPs), including collagenase and gelatinase, which digest the type I collagen of the corneal stroma, leading to rapid thinning and ulceration.
*   **B (Carbonic anhydrase)** is involved in aqueous humor production.
*   **C (ACE)** is involved in angiotensin conversion.
*   **D (Lysozyme)** is an antibacterial enzyme present in tears.
*   **E (Caspases)** are mediators of apoptosis, not extracellular matrix degradation.');

    ---------------------------------------------------------------------------
    -- CASE 26: The Patient with Acoustic Neuroma and a Chronic Epithelial Defect
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Patient with Acoustic Neuroma and a Chronic Epithelial Defect' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Patient with Acoustic Neuroma and a Chronic Epithelial Defect', 'A 52-year-old male presents with a persistent, painless "scratch" on his right eye for 3 weeks. He underwent surgical resection of a large acoustic neuroma (vestibular schwannoma) on the right side 2 months ago. He has no pain or photophobia but has noticed his vision has been fuzzy.

**Physical Examination:**
*   **Physical:** Right-sided facial weakness (CN VII palsy) and absent sensation on the right side of his face (CN V palsy).
*   **Visual Acuity:** OD: 20/50; OS: 20/20
*   **Ocular Examination (OD):** Mild conjunctival injection. Slit-lamp exam of the cornea reveals a large, oval-shaped epithelial defect in the central cornea with smooth, rolled, thickened margins. The underlying stroma is clear, with no infiltrate or edema. Fluorescein staining confirms the epithelial defect. Corneal sensation is completely absent in the right eye.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 52-year-old male presents with a persistent, painless "scratch" on his right eye for 3 weeks. He underwent surgical resection of a large acoustic neuroma (vestibular schwannoma) on the right side 2 months ago. He has no pain or photophobia but has noticed his vision has been fuzzy.

**Physical Examination:**
*   **Physical:** Right-sided facial weakness (CN VII palsy) and absent sensation on the right side of his face (CN V palsy).
*   **Visual Acuity:** OD: 20/50; OS: 20/20
*   **Ocular Examination (OD):** Mild conjunctival injection. Slit-lamp exam of the cornea reveals a large, oval-shaped epithelial defect in the central cornea with smooth, rolled, thickened margins. The underlying stroma is clear, with no infiltrate or edema. Fluorescein staining confirms the epithelial defect. Corneal sensation is completely absent in the right eye.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what is the most appropriate management?', '["Neurotrophic Keratitis; Preservative-free artificial tears, ointment at night, and consideration for topical cenegermin (recombinant human nerve growth factor).", "Exposure keratitis; Immediate pressure patching and topical ciprofloxacin.", "HSV epithelial keratitis; Topical trifluridine 9 times daily.", "Acanthamoeba keratitis; Topical chlorhexidine and propamidine.", "Thygeson''s Superficial Punctate Keratitis; Topical prednisolone acetate 1%."]'::jsonb, 0, 'This patient has neurotrophic keratitis, a degenerative corneal disease caused by a loss of corneal sensory innervation (cranial nerve V1). The resection of his acoustic neuroma damaged the trigeminal nerve, leading to complete corneal anesthesia. Sensory nerves release trophic factors (such as substance P and NGF) that are essential for corneal epithelial cell mitosis and healing. Without sensory input, the epithelium breaks down, leading to a persistent epithelial defect (PED) with classic smooth, rolled, non-healing borders. Treatment focuses on protecting the cornea with intensive lubrication (must be preservative-free, as preservatives are epitheliotoxic), bandage contact lenses, tarsorrhaphy, or cenegermin (a topical recombinant human NGF).
*   **B (Pressure patching)** is contraindicated in anesthetic corneas because it can cause mechanical erosion and silent infection.
*   **C (Topical trifluridine)** is extremely epitheliotoxic and will worsen a neurotrophic persistent epithelial defect.
*   **D (Acanthamoeba)** presents with severe pain, which is absent here.
*   **E (Thygeson''s)** presents with recurrent bilateral punctate lesions and is not associated with CN V palsy.'),
    (v_case_id, 'The loss of which of the following cranial nerves is responsible for the loss of corneal sensation in this patient?', '["Ophthalmic division of the Trigeminal nerve (CN V1).", "Maxillary division of the Trigeminal nerve (CN V2).", "Facial nerve (CN VII).", "Oculomotor nerve (CN III).", "Abducens nerve (CN VI)."]'::jsonb, 0, 'Sensory innervation of the cornea is supplied by the long ciliary nerves, which are branches of the nasociliary nerve, itself a branch of the ophthalmic division of the trigeminal nerve (CN V1). Damage to CN V1 leads to corneal anesthesia.
*   **B (CN V2)** supplies the mid-face and lower eyelid, not the cornea.
*   **C (CN VII)** provides motor innervation to the orbicularis oculi (responsible for eyelid closure). While CN VII damage causes exposure due to lagophthalmos, the loss of *sensation* is purely due to CN V1.
*   **D (CN III)** innervates the levator palpebrae superioris (opens the eyelid) and extraocular muscles.
*   **E (CN VI)** innervates the lateral rectus.');

    ---------------------------------------------------------------------------
    -- CASE 27: Bell's Palsy and a Dry, Irritated Eye
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bell''s Palsy and a Dry, Irritated Eye' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bell''s Palsy and a Dry, Irritated Eye', 'A 41-year-old female presents with redness, burning, and tearing in her right eye for 5 days. She was diagnosed with Bell''s Palsy on the right side last week.

**Physical Examination:**
*   **Physical:** Complete flatting of the right forehead furrow, inability to close the right eye, and drooping of the right corner of the mouth.
*   **Visual Acuity:** OD: 20/25; OS: 20/20
*   **Ocular Examination (OD):** The patient cannot fully close her right eye on command (lagophthalmos), leaving a 3 mm gap. When she attempts to close her eyes, the right globe rolls upward (normal Bell''s phenomenon). Slit-lamp exam of the right cornea reveals dense, punctate epithelial erosions (PEEs) in the inferior third of the cornea (interpalpebral zone) that stain with fluorescein. The superior cornea is clear.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 41-year-old female presents with redness, burning, and tearing in her right eye for 5 days. She was diagnosed with Bell''s Palsy on the right side last week.

**Physical Examination:**
*   **Physical:** Complete flatting of the right forehead furrow, inability to close the right eye, and drooping of the right corner of the mouth.
*   **Visual Acuity:** OD: 20/25; OS: 20/20
*   **Ocular Examination (OD):** The patient cannot fully close her right eye on command (lagophthalmos), leaving a 3 mm gap. When she attempts to close her eyes, the right globe rolls upward (normal Bell''s phenomenon). Slit-lamp exam of the right cornea reveals dense, punctate epithelial erosions (PEEs) in the inferior third of the cornea (interpalpebral zone) that stain with fluorescein. The superior cornea is clear.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate initial management to prevent corneal ulceration in this patient''s right eye?', '["Daytime lubrication with preservative-free artificial tears every 1-2 hours, thick lubricating ointment at night, and taping the eyelid closed at bedtime.", "Immediate surgical placement of a gold weight in the upper eyelid.", "Prescription of topical prednisolone acetate 1% drops 4 times daily.", "Application of a tight pressure patch during the day.", "Prophylactic oral acyclovir 400 mg twice daily."]'::jsonb, 0, 'This patient has exposure keratitis secondary to facial nerve (CN VII) palsy (Bell''s Palsy). CN VII innervates the orbicularis oculi muscle, which is responsible for closing the eyelids. The inability to close the eyelid (lagophthalmos) leads to rapid evaporation of the tear film and desiccation of the exposed inferior corneal epithelium, presenting as inferior punctate epithelial erosions. Initial management is nonsurgical: frequent daytime lubrication and ointment at night with eyelid taping to ensure closure during sleep.
*   **B (Gold weight)** is a surgical treatment for permanent facial nerve paralysis, but is not the first step for acute Bell''s palsy, which often resolves spontaneously.
*   **C (Topical steroids)** will not address the mechanical exposure and can increase the risk of infection if the epithelium is compromised.
*   **D (Pressure patch)** is avoided during active daytime hours because it can scratch the cornea if the eyelid opens under the patch.
*   **E (Oral acyclovir)** is not indicated unless there is a strong suspicion of Ramsay Hunt syndrome (HZO with facial palsy), which would present with ear vesicles.'),
    (v_case_id, 'The muscle responsible for closing the eyelids is innervated by cranial nerve ________, while the muscle responsible for opening the eyelids is innervated by cranial nerve ________.', '["VII; III", "III; VII", "V; VII", "VII; V", "V; III"]'::jsonb, 0, 'The orbicularis oculi muscle (closes the eyelids) is innervated by the facial nerve (CN VII). The levator palpebrae superioris muscle (opens the eyelids/elevates the upper lid) is innervated by the oculomotor nerve (CN III). Muller''s muscle (sympathetic innervation) also helps maintain eyelid elevation.
*   **B, C, D, & E** list incorrect cranial nerve pairings for these functions.');

    ---------------------------------------------------------------------------
    -- CASE 28: Theodore's SLK and Thyroid Dysfunction
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Theodore''s SLK and Thyroid Dysfunction' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Theodore''s SLK and Thyroid Dysfunction', 'A 42-year-old female presents with chronic irritation, burning, and a foreign body sensation in both eyes for the past 3 months. She also reports feeling hot all the time, having palpitations, and losing weight despite an increased appetite.

**Physical Examination:**
*   **Vitals:** HR: 104 bpm (tachycardia) | BP: 138/82 mmHg
*   **Physical:** Mild bilateral proptosis (prominent eyes) and a diffuse, non-tender enlargement of the thyroid gland.
*   **Ocular Examination (Bilateral):** Slit-lamp exam of the superior bulbar conjunctiva shows marked injection and chemosis. Eversion of the upper lid reveals fine papillary hypertrophy on the superior palpebral conjunctiva. The superior limbus is thickened, and the superior corneal epithelium shows punctate staining with several small adherent mucous filaments (filamentary keratitis). The inferior cornea and conjunctiva are normal.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 42-year-old female presents with chronic irritation, burning, and a foreign body sensation in both eyes for the past 3 months. She also reports feeling hot all the time, having palpitations, and losing weight despite an increased appetite.

**Physical Examination:**
*   **Vitals:** HR: 104 bpm (tachycardia) | BP: 138/82 mmHg
*   **Physical:** Mild bilateral proptosis (prominent eyes) and a diffuse, non-tender enlargement of the thyroid gland.
*   **Ocular Examination (Bilateral):** Slit-lamp exam of the superior bulbar conjunctiva shows marked injection and chemosis. Eversion of the upper lid reveals fine papillary hypertrophy on the superior palpebral conjunctiva. The superior limbus is thickened, and the superior corneal epithelium shows punctate staining with several small adherent mucous filaments (filamentary keratitis). The inferior cornea and conjunctiva are normal.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what systemic laboratory workup is indicated?', '["Superior Limbic Keratoconjunctivitis (SLK) of Theodore; Thyroid-Stimulating Hormone (TSH) and free T4 levels.", "Dry Eye Syndrome; Serum autoantibodies (SSA/SSB) for Sjogren''s.", "Vernal Keratoconjunctivitis; Serum IgE and eosinophil count.", "Trachoma; Chlamydia serology.", "Atopic Keratoconjunctivitis; Patch testing for contact allergens."]'::jsonb, 0, 'This is a classic presentation of Superior Limbic Keratoconjunctivitis (SLK) of Theodore. It is a chronic inflammatory disease of the superior bulbar conjunctiva, superior limbus, and superior cornea. Key clinical signs include superior bulbar conjunctival injection, superior limbal hypertrophy, and superior corneal filamentary keratitis. Crucially, up to 50% of patients with SLK have underlying thyroid dysfunction, most commonly hyperthyroidism (Graves'' disease), which is strongly suggested in this patient by palpitations, tachycardia, weight loss, and proptosis. The diagnostic workup must include TSH and free T4 levels.
*   **B (Dry Eye)** can cause filamentary keratitis, but it affects the interpalpebral zone, not the isolated superior bulbar conjunctiva and limbus.
*   **C (VKH)** causes giant papillae on the superior tarsus in young boys, not thyroid-related SLK.
*   **D (Trachoma)** causes superior tarsal scarring (Arlt''s line) and Herbert''s pits at the limbus, but is seen in endemic developing areas and is not associated with thyroid disease.
*   **E (AKC)** affects the inferior tarsus and lid margins in patients with eczema.'),
    (v_case_id, 'The primary mechanism driving the localized superior inflammation in this condition is thought to be:', '["Chronic mechanical friction between the upper eyelid and the superior bulbar conjunctiva.", "IgE-mediated type I hypersensitivity to airborne pollen.", "Direct bacterial infection of the superior limbal stem cells.", "Autoimmune destruction of the accessory lacrimal glands of Krause.", "Type IV delayed hypersensitivity to contact lens preservatives."]'::jsonb, 0, 'The pathogenesis of SLK is believed to be chronic mechanical friction between the upper eyelid and the superior bulbar conjunctiva. This friction is often exacerbated by tight upper eyelids or thyroid orbitopathy (proptosis), leading to redundancy and inflammation of the superior bulbar conjunctiva. Treatment options include lubrication, temporary occlusion of the superior punctum, application of silver nitrate 0.5-1.0% to the superior tarsus, or surgical resection of the redundant superior bulbar conjunctiva.
*   **B (Type I allergy)** drives seasonal conjunctivitis and VKC.
*   **C (Bacterial infection)** is incorrect; SLK is a sterile inflammatory disease.
*   **D (Accessory lacrimal gland destruction)** occurs in Sjogren''s syndrome.
*   **E (Type IV allergy)** is the mechanism for contact allergy or toxic conjunctivitis.');

    ---------------------------------------------------------------------------
    -- CASE 29: The Welder with Severe Photophobia
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Welder with Severe Photophobia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Welder with Severe Photophobia', 'A 29-year-old male welder is brought to the Emergency Department by his friend at 2:00 AM due to the sudden onset of excruciating pain, tearing, and inability to open both eyes. The patient states he was working on a project yesterday afternoon and forgot to wear his protective welding mask for about 30 minutes. The symptoms started about 6 hours after he finished working.

**Physical Examination:**
*   **Ocular Examination (Bilateral):** Severe blepharospasm and tearing. After instillation of one drop of topical proparacaine 0.5% in each eye, the patient is completely pain-free and able to open his eyes easily. Slit-lamp exam with fluorescein staining reveals diffuse, bilateral, tiny punctate epithelial erosions in the interpalpebral zone of both corneas. The anterior chambers are quiet, and the pupils are reactive.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 29-year-old male welder is brought to the Emergency Department by his friend at 2:00 AM due to the sudden onset of excruciating pain, tearing, and inability to open both eyes. The patient states he was working on a project yesterday afternoon and forgot to wear his protective welding mask for about 30 minutes. The symptoms started about 6 hours after he finished working.

**Physical Examination:**
*   **Ocular Examination (Bilateral):** Severe blepharospasm and tearing. After instillation of one drop of topical proparacaine 0.5% in each eye, the patient is completely pain-free and able to open his eyes easily. Slit-lamp exam with fluorescein staining reveals diffuse, bilateral, tiny punctate epithelial erosions in the interpalpebral zone of both corneas. The anterior chambers are quiet, and the pupils are reactive.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate management for this patient?', '["Prescribing topical antibiotic ointment (e.g., erythromycin), oral analgesics, and strictly instructing the patient NOT to use topical anesthetics at home.", "Giving the patient a bottle of proparacaine 0.5% drops to use at home for pain control.", "Initiating topical prednisolone acetate 1% drops every hour to reduce corneal inflammation.", "Referral for urgent bilateral corneal transplants.", "Placing a pressure patch on both eyes for 48 hours."]'::jsonb, 0, 'This is a classic case of photokeratitis (also known as welder''s flash or snow blindness), caused by exposure of the cornea to ultraviolet (UV) radiation (specifically UV-B). UV light damages the corneal epithelial cells, leading to desquamation and diffuse punctate epithelial erosions. The symptoms characteristically develop 6-12 hours after exposure. Treatment consists of topical antibiotic ointment to prevent secondary infection, oral analgesics, and supportive care (cold compresses). Crucially, topical anesthetics (e.g., proparacaine) must *never* be prescribed for home use. Chronic use of topical anesthetics is toxic to the corneal epithelium, inhibits healing, and can lead to severe corneal melting, ulceration, and permanent blindness.
*   **B (Home proparacaine)** is dangerous and contraindicated due to corneal toxicity and risk of silent melting.
*   **C (Topical steroids)** are not indicated for simple photokeratitis, as the epithelium heals rapidly (within 24-48 hours) without anti-inflammatory drops, and steroids can delay epithelial healing.
*   **D (Corneal transplant)** is not indicated; the stroma is undamaged, and the epithelium regenerates.
*   **E (Bilateral patching)** is avoided because it renders the patient functionally blind and does not accelerate healing compared to lubrication.'),
    (v_case_id, 'The corneal damage in this condition is primarily caused by which of the following cellular processes?', '["Ultraviolet-induced apoptosis of corneal epithelial cells.", "Thermal burning of the stromal collagen.", "Bacterial infiltration of the subepithelial space.", "Deposition of calcium crystals in Bowman''s membrane.", "Reactivation of latent herpesvirus in the cornea."]'::jsonb, 0, 'UV-B radiation is absorbed by the DNA of the corneal epithelial cells, leading to cellular damage and apoptosis. The dead epithelial cells desquamate, leaving multiple bare areas of stroma (punctate erosions) that expose corneal nerve endings, causing severe pain.
*   **B (Thermal burning)** is incorrect; UV photokeratitis is a photochemical injury, not a thermal burn (which would cause coagulation necrosis and stromal scarring).
*   **C (Bacterial infiltration)** is not the primary cause of photokeratitis, though secondary infection is a risk, which is why prophylactic topical antibiotics are used.
*   **D (Calcium deposition)** is the mechanism of band keratopathy.
*   **E (Viral reactivation)** is not the mechanism of UV photokeratitis.');

    ---------------------------------------------------------------------------
    -- CASE 30: The Prosthesis Wearer with Eyelid Discomfort
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Prosthesis Wearer with Eyelid Discomfort' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Prosthesis Wearer with Eyelid Discomfort', 'A 58-year-old female presents with mucous discharge, itching, and discomfort in her left socket. She has worn an ocular prosthesis in her left eye for 15 years following enucleation for choroidal melanoma. She reports that the prosthesis has been fitting poorly lately.

**Physical Examination:**
*   **Ocular Examination (OS):** Significant mucoid discharge in the conjunctival fornices. Eversion of the upper eyelid reveals giant papillae ($> 1.0\text{ mm}$ in diameter) on the superior palpebral conjunctiva, with central vascular cores. The underlying prosthesis is covered with a hazy film of proteinaceous deposits. The right eye is normal.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 58-year-old female presents with mucous discharge, itching, and discomfort in her left socket. She has worn an ocular prosthesis in her left eye for 15 years following enucleation for choroidal melanoma. She reports that the prosthesis has been fitting poorly lately.

**Physical Examination:**
*   **Ocular Examination (OS):** Significant mucoid discharge in the conjunctival fornices. Eversion of the upper eyelid reveals giant papillae ($> 1.0\text{ mm}$ in diameter) on the superior palpebral conjunctiva, with central vascular cores. The underlying prosthesis is covered with a hazy film of proteinaceous deposits. The right eye is normal.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what is the appropriate management?', '["Giant Papillary Conjunctivitis (GPC); Remove and clean the prosthesis, instruct the patient on daily cleaning, and prescribe topical mast cell stabilizers/antihistamine drops.", "Recurrent melanoma of the socket; Urgent biopsy of the conjunctival papillae.", "Trachoma; Oral azithromycin and SAFE protocol.", "Adult inclusion conjunctivitis; Oral doxycycline.", "Allergic conjunctivitis; Avoidance of cat dander and oral antihistamines."]'::jsonb, 0, 'Giant Papillary Conjunctivitis (GPC) is a non-infectious, inflammatory disease characterized by giant papillae on the superior tarsal conjunctiva. It is caused by chronic mechanical irritation of the conjunctiva, most commonly by contact lenses, but also by ocular prostheses, exposed sutures, or scleral buckles. Protein deposits on the surface of the foreign body act as antigens, driving a combined Type I and Type IV hypersensitivity reaction. Treatment involves removing and thoroughly cleaning/polishing the prosthesis (or changing the contact lens regimen), instructing the patient on proper hygiene, and using topical mast cell stabilizers/antihistamines.
*   **B (Melanoma recurrence)** would present as a dark, irregular nodular mass in the socket, not diffuse giant papillae with vascular cores on the everted tarsal conjunctiva.
*   **C (Trachoma)** causes tarsal scarring, not large papillae in a prosthesis wearer.
*   **D (Inclusion conjunctivitis)** is a chlamydial infection causing a follicular response, not giant mechanical papillae.
*   **E (Allergic conjunctivitis)** is bilateral and presents with diffuse chemosis and small papillae, not unilateral giant papillae localized to a socket with a prosthesis.'),
    (v_case_id, 'Biopsy of the giant papillae in this condition would most likely reveal which of the following histopathological features?', '["Epithelial hypertrophy with infiltration of eosinophils, mast cells, and plasma cells around a central vascular core.", "Subepithelial follicles containing germinal centers with proliferating B-lymphocytes.", "Granulomatous inflammation with multinucleated Langerhans giant cells.", "Intracellular Gram-negative diplococci within neutrophils.", "Large areas of coagulative necrosis of the conjunctival stroma."]'::jsonb, 0, 'Papillae are inflammatory elevations of the conjunctiva that contain a central vascular core (giving them a red center, unlike follicles which are avascular and pale). Histopathology shows infiltration of the epithelium and stroma by eosinophils, mast cells, lymphocytes, and plasma cells, representing a chronic inflammatory/allergic response.
*   **B (Follicles)** are lymphoid aggregates containing germinal centers of B-lymphocytes, characteristic of follicular conjunctivitis (e.g., viral, chlamydial, toxic), not GPC.
*   **C (Granulomatous inflammation)** is seen in sarcoidosis or TB.
*   **D (Gram-negative diplococci)** is characteristic of gonococcal conjunctivitis.
*   **E (Coagulative necrosis)** is seen in chemical burns or necrotizing infections.');

    ---------------------------------------------------------------------------
    -- CASE 31: Painful Eye and Shifting Hypopyon in a Mature Cataract
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Painful Eye and Shifting Hypopyon in a Mature Cataract' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Painful Eye and Shifting Hypopyon in a Mature Cataract', 'A 78-year-old male presents with severe pain, redness, and a sudden drop in vision in his left eye for 2 days. He has had a dense, untreated cataract in that eye for several years and was told he needed surgery, which he postponed.

**Physical Examination:**
*   **Visual Acuity:** OS: Light Perception (LP) only; OD: 20/40
*   **Ocular Examination (OS):** Moderate conjunctival injection with ciliary flush. Slit-lamp exam reveals a hypermature, wrinkled, white cataract. The anterior chamber is deep and shows 3+ cell and flare, with a 1.5 mm hypopyon. The corneal endothelium is covered with fine, white keratic precipitates.
*   **Intraocular Pressure (IOP):** OS: 38 mmHg (significantly elevated); OD: 16 mmHg', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 78-year-old male presents with severe pain, redness, and a sudden drop in vision in his left eye for 2 days. He has had a dense, untreated cataract in that eye for several years and was told he needed surgery, which he postponed.

**Physical Examination:**
*   **Visual Acuity:** OS: Light Perception (LP) only; OD: 20/40
*   **Ocular Examination (OS):** Moderate conjunctival injection with ciliary flush. Slit-lamp exam reveals a hypermature, wrinkled, white cataract. The anterior chamber is deep and shows 3+ cell and flare, with a 1.5 mm hypopyon. The corneal endothelium is covered with fine, white keratic precipitates.
*   **Intraocular Pressure (IOP):** OS: 38 mmHg (significantly elevated); OD: 16 mmHg', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what is the definitive treatment?', '["Phacolytic glaucoma/uveitis; Medical control of IOP followed by prompt cataract extraction.", "Phacoantigenic uveitis; Long-term topical corticosteroids and observation.", "Acute angle-closure glaucoma; Urgent laser peripheral iridotomy.", "Endogenous bacterial endophthalmitis; Intravitreal vancomycin.", "HLA-B27 associated anterior uveitis; Topical steroids and cycloplegics only."]'::jsonb, 0, 'Phacolytic glaucoma is a lens-induced open-angle glaucoma caused by the leakage of high-molecular-weight lens proteins through the intact capsule of a hypermature (or Morgagnian) cataract. These proteins are phagocytosed by macrophages, which then accumulate in and clog the trabecular meshwork, blocking aqueous outflow and causing a rapid elevation of IOP. The leakage of proteins also incites a secondary anterior uveitis, presenting with cell, flare, and a hypopyon. Definitive treatment is surgical removal of the leaky lens (cataract extraction) after medically lowering the IOP.
*   **B (Phacoantigenic uveitis)** is a granulomatous autoimmune reaction to lens proteins that occurs *after* the lens capsule has been ruptured (usually by trauma or surgery with retained lens fragments), not through an intact capsule of an unoperated cataract.
*   **C (Angle-closure glaucoma)** presents with a shallow anterior chamber, a mid-dilated non-reactive pupil, and corneal edema, not a deep chamber with a hypermature cataract and hypopyon.
*   **D (Endophthalmitis)** is a severe infection of the vitreous cavity, typically after recent surgery or trauma, not associated with a hypermature cataract in an unoperated eye.
*   **E (HLA-B27 uveitis)** does not present with a hypermature cataract leaking proteins and a secondary open-angle glaucoma of this type.'),
    (v_case_id, 'Which cell type is characteristically found in the aqueous humor of patients with this condition, blocking the trabecular meshwork?', '["Protein-laden macrophages.", "Neutrophils.", "Eosinophils.", "CD4+ T-lymphocytes.", "Epithelioid cells."]'::jsonb, 0, 'The hallmark of phacolytic glaucoma is the presence of large, protein-laden macrophages in the anterior chamber. These cells engulf the soluble lens proteins that have leaked into the aqueous humor and subsequently accumulate in the trabecular meshwork, obstructing drainage.
*   **B (Neutrophils)** are the dominant cell type in infectious purulent uveitis.
*   **C (Eosinophils)** are seen in allergic reactions.
*   **D (CD4+ T-lymphocytes)** are the primary drivers of autoimmune uveitis.
*   **E (Epithelioid cells)** are found in granulomatous uveitis.');

    ---------------------------------------------------------------------------
    -- CASE 32: Uveitis After Cataract Surgery
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Uveitis After Cataract Surgery' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Uveitis After Cataract Surgery', 'A 72-year-old female presents with pain, redness, and blurred vision in her right eye for 3 weeks. She underwent uncomplicated cataract surgery in that eye 2 months ago. Her vision was initially excellent but has gradually declined.

**Physical Examination:**
*   **Visual Acuity:** OD: 20/100; OS: 20/25
*   **Ocular Examination (OD):** Moderate ciliary injection. Slit-lamp exam reveals 2+ cells in the anterior chamber and granulomatous (mutton-fat) KPs on the corneal endothelium. Retained cortical lens fragments are visible in the inferior capsular bag. The vitreous is clear.
*   **Intraocular Pressure (OD):** 18 mmHg.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 72-year-old female presents with pain, redness, and blurred vision in her right eye for 3 weeks. She underwent uncomplicated cataract surgery in that eye 2 months ago. Her vision was initially excellent but has gradually declined.

**Physical Examination:**
*   **Visual Acuity:** OD: 20/100; OS: 20/25
*   **Ocular Examination (OD):** Moderate ciliary injection. Slit-lamp exam reveals 2+ cells in the anterior chamber and granulomatous (mutton-fat) KPs on the corneal endothelium. Retained cortical lens fragments are visible in the inferior capsular bag. The vitreous is clear.
*   **Intraocular Pressure (OD):** 18 mmHg.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Phacoantigenic (phacoanaphylactic) uveitis.", "Phacolytic uveitis.", "Acute post-operative endophthalmitis.", "Fuchs Uveitis Syndrome.", "Sympathetic ophthalmia."]'::jsonb, 0, 'Phacoantigenic uveitis is a granulomatous autoimmune reaction that develops when a patient becomes sensitized to their own lens proteins following the rupture of the lens capsule (which occurs during cataract surgery or trauma). It typically presents days to months after the procedure, often associated with retained lens fragments in the eye. The inflammation is characteristically granulomatous (mutton-fat KPs). Treatment involves surgical removal of all retained lens fragments and topical steroids/cycloplegics.
*   **B (Phacolytic uveitis)** occurs in unoperated eyes with hypermature cataracts where proteins leak through an *intact* capsule, not after surgical removal of the lens.
*   **C (Acute endophthalmitis)** occurs within the first week after surgery and is a hyperacute bacterial infection presenting with severe pain, hypopyon, and vitritis, not a gradual onset of granulomatous uveitis at 2 months.
*   **D (Fuchs Uveitis Syndrome)** is a chronic, non-granulomatous uveitis with heterochromia that is not triggered by cataract surgery.
*   **E (Sympathetic ophthalmia)** is a bilateral granulomatous uveitis following trauma/surgery, but affects both eyes, whereas this patient''s inflammation is strictly unilateral in the operated eye.'),
    (v_case_id, 'What is the underlying immunological mechanism of this patient''s disease?', '["Type III or Type IV hypersensitivity reaction to sequestered lens proteins.", "IgE-mediated Type I hypersensitivity to topical antibiotics.", "Direct bacterial infection of the iris stroma.", "Mechanical irritation of the ciliary body by the intraocular lens haptic.", "Toxic anterior segment syndrome (TASS) due to contaminated surgical instruments."]'::jsonb, 0, 'Phacoantigenic uveitis is an autoimmune response (traditionally classified as a Type III immune-complex or Type IV cell-mediated hypersensitivity) to lens proteins that were previously sequestered from the immune system within the lens capsule. Once the capsule is ruptured, these proteins are exposed to the immune system, leading to sensitization and granulomatous inflammation.
*   **B (Type I hypersensitivity)** is an acute allergic reaction (anaphylaxis).
*   **C (Bacterial infection)** is endophthalmitis.
*   **D (Mechanical irritation)** is Uveitis-Glaucoma-Hyphema (UGH) syndrome, caused by a malpositioned IOL rubbing the iris, not a granulomatous response to retained lens fragments.
*   **E (TASS)** is a sterile, acute inflammatory reaction occurring within 12-24 hours of surgery due to chemical toxins on surgical instruments, not a delayed granulomatous uveitis.');

    ---------------------------------------------------------------------------
    -- CASE 33: Paint Splashed in the Eye
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Paint Splashed in the Eye' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Paint Splashed in the Eye', 'A 34-year-old construction worker is brought to the Emergency Department by his co-workers after industrial-strength wet cement splashed into both of his eyes 20 minutes ago. He is in severe pain and reports his eyes are burning.

**Physical Examination:**
*   **Visual Acuity:** Unable to assess due to severe blepharospasm.
*   **Ocular Examination (Bilateral):** The eyelids are swollen, and there are remnants of gray cement paste in the conjunctival fornices. The conjunctiva is white and ischemic (bleached/limbal ischemia) for 180 degrees. The corneas are hazy, partially obscuring the view of the iris.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 34-year-old construction worker is brought to the Emergency Department by his co-workers after industrial-strength wet cement splashed into both of his eyes 20 minutes ago. He is in severe pain and reports his eyes are burning.

**Physical Examination:**
*   **Visual Acuity:** Unable to assess due to severe blepharospasm.
*   **Ocular Examination (Bilateral):** The eyelids are swollen, and there are remnants of gray cement paste in the conjunctival fornices. The conjunctiva is white and ischemic (bleached/limbal ischemia) for 180 degrees. The corneas are hazy, partially obscuring the view of the iris.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most urgent first step in the management of this patient?', '["Immediate, copious irrigation with sterile saline or tap water for at least 30 minutes, sweeping the fornices to remove cement particles, and checking the ocular pH.", "Instillation of topical prednisolone acetate 1% drops to reduce chemical inflammation.", "Application of topical erythromycin ointment and placing a pressure patch.", "Urgent surgical debridement of the conjunctiva.", "Obtaining a visual acuity measurement and performing a dilated fundus exam."]'::jsonb, 0, 'This is an ocular emergency: a chemical burn. Wet cement is highly alkaline (containing calcium oxide, which forms calcium hydroxide when mixed with tears). Alkali burns are more damaging than acid burns because they cause saponification of lipids in the cell membranes, allowing the chemical to penetrate rapidly and deeply into the corneal stroma and anterior chamber. The single most important factor in determining the visual outcome is the speed and duration of irrigation. Irrigation must be initiated immediately (using saline, Ringer''s lactate, or tap water) and continued for at least 30 minutes, or until the pH of the conjunctival fornix is neutralized to approximately 7.0–7.2 (tested with litmus paper 5-10 minutes after stopping irrigation). It is vital to sweep the fornices with a cotton-tipped applicator to remove any retained solid cement particles, which can continue to release alkali.
*   **B (Topical steroids)** are used later to control inflammation, but irrigation is the immediate priority.
*   **C (Pressure patch)** is not the initial step and will trap the chemical in the eye.
*   **D (Surgical debridement)** is only indicated after complete irrigation and stabilization.
*   **E (Visual acuity)** is the "rule" for eye exams, but chemical burns are the *one exception* where immediate treatment (irrigation) takes precedence over checking visual acuity.'),
    (v_case_id, 'Why are alkali chemical burns typically associated with a worse visual prognosis than acid burns?', '["Alkali substances cause saponification of membrane lipids, allowing rapid, deep penetration into the eye.", "Acid substances cause immediate pan-retinal necrosis.", "Alkali substances selectively destroy the optic nerve.", "Acid substances stimulate corneal vascularization more rapidly.", "Alkali substances prevent the regeneration of the sclera."]'::jsonb, 0, 'Alkali chemicals are lipophilic and cause saponification of membrane lipids, which liquefies the tissues (liquefactive necrosis) and allows the chemical to penetrate deep into the cornea and anterior chamber within minutes. Acids, on the other hand, cause coagulation of proteins (coagulative necrosis), which forms a barrier that limits further penetration of the acid into deeper structures.
*   **B (Pan-retinal necrosis)** is not a direct effect of acid burns, which damage the anterior segment.
*   **C (Optic nerve destruction)** and **E (Scleral regeneration)** are incorrect.
*   **D (Corneal vascularization)** is a late sequela of both, but is worse in alkali burns due to limbal stem cell deficiency.');

    ---------------------------------------------------------------------------
    -- CASE 34: Eyelid Adhesions and a Chronic Dry Eye
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Eyelid Adhesions and a Chronic Dry Eye' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Eyelid Adhesions and a Chronic Dry Eye', 'A 76-year-old male presents with severe, chronic dry eye, foreign body sensation, and pain in both eyes for the past year. He has tried numerous brands of artificial tears and ointments without relief.

**Physical Examination:**
*   **Ocular Examination (Bilateral):**
    *   **Eyelids:** Entropion (inward turning of the lid margin) and trichiasis (lashes rubbing against the cornea).
    *   **Conjunctiva:** Marked subepithelial fibrosis (white scarring bands) on the palpebral conjunctiva. There are several fibrous bands connecting the palpebral conjunctiva of the lower lid to the bulbar conjunctiva of the globe (symblepharon).
    *   **Cornea:** Diffuse punctate epithelial erosions and areas of fibrovascular pannus (neovascularization).', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 76-year-old male presents with severe, chronic dry eye, foreign body sensation, and pain in both eyes for the past year. He has tried numerous brands of artificial tears and ointments without relief.

**Physical Examination:**
*   **Ocular Examination (Bilateral):**
    *   **Eyelids:** Entropion (inward turning of the lid margin) and trichiasis (lashes rubbing against the cornea).
    *   **Conjunctiva:** Marked subepithelial fibrosis (white scarring bands) on the palpebral conjunctiva. There are several fibrous bands connecting the palpebral conjunctiva of the lower lid to the bulbar conjunctiva of the globe (symblepharon).
    *   **Cornea:** Diffuse punctate epithelial erosions and areas of fibrovascular pannus (neovascularization).', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and how is it confirmed?', '["Ocular Cicatricial Pemphigoid (OCP); Conjunctival biopsy with direct immunofluorescence (DIF).", "Stevens-Johnson Syndrome; Skin biopsy showing epidermal necrolysis.", "Trachoma; Conjunctival smear for Giemsa stain showing inclusion bodies.", "Sjogren''s Syndrome; Salivary gland biopsy.", "Graft-versus-Host Disease (GVHD); Bone marrow biopsy."]'::jsonb, 0, 'Ocular Cicatricial Pemphigoid (OCP) is a chronic, progressive, autoimmune cicatrizing conjunctivitis that typically affects elderly patients. It leads to conjunctival scarring, symblepharon, ankyloblepharon, entropion, trichiasis, and severe dry eye due to destruction of goblet cells and lacrimal ducts. Diagnosis is confirmed by a biopsy of the conjunctiva showing linear deposition of immunoglobulins (IgG, IgA, IgM, or C3) along the basement membrane zone on direct immunofluorescence (DIF).
*   **B (SJS)** is an acute, self-limiting drug-induced reaction causing mucosal sloughing, not a slowly progressive autoimmune scarring process in an elderly patient.
*   **C (Trachoma)** is an infectious cause of tarsal scarring but is rare in non-endemic areas and doesn''t present with linear basement membrane zone antibodies.
*   **D (Sjogren''s)** causes severe dry eye (keratoconjunctivitis sicca) but does *not* cause symblepharon and conjunctival cicatrization.
*   **E (GVHD)** occurs after allogeneic bone marrow transplantation, which is not mentioned in this patient''s history.'),
    (v_case_id, 'What is the standard systemic therapy required to halt the progression of this patient''s disease?', '["Systemic immunosuppressive therapy (e.g., dapsone, methotrexate, or cyclophosphamide).", "Chronic topical artificial tears and lubricants only.", "Topical moxifloxacin drops daily.", "Periodic surgical lysis of the symblepharon without systemic therapy.", "Oral acyclovir 400 mg twice daily."]'::jsonb, 0, 'OCP is a systemic autoimmune disease. Topical therapy (lubricants, steroids) is insufficient to stop the progressive scarring. Halt of disease progression requires systemic immunosuppression. Dapsone is often used for mild-to-moderate cases, while methotrexate, azathioprine, or cyclophosphamide are used for severe or rapidly progressive disease.
*   **B (Lubricants alone)** will not prevent progressive cicatrization and eventual blindness.
*   **C (Moxifloxacin)** is an antibiotic and has no role.
*   **D (Surgical lysis alone)** is contraindicated without systemic control, as surgery triggers a wound-healing response that accelerates scarring, leading to worse symblepharon.
*   **E (Oral acyclovir)** is an antiviral and is ineffective.');

    ---------------------------------------------------------------------------
    -- CASE 35: The Red-Eyed Patient with Severe, Boring Pain
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Red-Eyed Patient with Severe, Boring Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Red-Eyed Patient with Severe, Boring Pain', 'A 42-year-old female presents with severe, deep, boring pain in her left eye for 4 days. She describes the pain as a "constant ache" that radiates to her temple and jaw, and is so intense it wakes her up at night. She has a history of Systemic Lupus Erythematosus (SLE).

**Physical Examination:**
*   **Visual Acuity:** OS: 20/30; OD: 20/20
*   **Ocular Examination (OS):** The eye has a deep, bluish-red hue. There is intense, localized scleral and episcleral injection. Instillation of topical phenylephrine 2.5% drops does not blanch the deep vessels, and the redness remains unchanged. Slit-lamp exam shows the cornea is clear, and the anterior chamber is quiet. Gentle palpation of the globe through the eyelid causes severe pain.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 42-year-old female presents with severe, deep, boring pain in her left eye for 4 days. She describes the pain as a "constant ache" that radiates to her temple and jaw, and is so intense it wakes her up at night. She has a history of Systemic Lupus Erythematosus (SLE).

**Physical Examination:**
*   **Visual Acuity:** OS: 20/30; OD: 20/20
*   **Ocular Examination (OS):** The eye has a deep, bluish-red hue. There is intense, localized scleral and episcleral injection. Instillation of topical phenylephrine 2.5% drops does not blanch the deep vessels, and the redness remains unchanged. Slit-lamp exam shows the cornea is clear, and the anterior chamber is quiet. Gentle palpation of the globe through the eyelid causes severe pain.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Scleritis.", "Episcleritis.", "Anterior Uveitis.", "Conjunctivitis.", "Keratitis."]'::jsonb, 0, 'Scleritis is a severe, vision-threatening inflammatory disease of the sclera, often associated with systemic autoimmune diseases (like SLE, Rheumatoid Arthritis, or GPA). It presents with severe, boring pain that wakes the patient from sleep and radiates to the forehead/jaw, deep bluish-red injection, and tenderness to palpation. A key diagnostic test is the phenylephrine test: topical phenylephrine (2.5% or 10%) will blanch the superficial conjunctival and episcleral vessels (as in episcleritis), but will *not* blanch the deep scleral vessels in scleritis.
*   **B (Episcleritis)** is a benign, self-limiting inflammation of the superficial episcleral tissue. It causes mild discomfort (not severe boring pain), does not wake the patient, and the injection blanches completely with phenylephrine drops.
*   **C (Anterior Uveitis)** would present with cells and flare in the anterior chamber, which is quiet in this patient.
*   **D (Conjunctivitis)** is characterized by discharge, itching, and superficial injection that moves with a cotton swab, without severe boring pain or tenderness to palpation.
*   **E (Keratitis)** presents with corneal infiltrates or epithelial defects.'),
    (v_case_id, 'Which of the following is the most appropriate initial therapy for this patient''s condition?', '["Oral NSAIDs (e.g., indomethacin) or systemic corticosteroids, combined with systemic workup.", "Topical moxifloxacin drops 4 times daily.", "Topical artificial tears every 2 hours.", "Reassurance that the condition is self-limiting and will resolve in 1 week.", "Immediate laser photocoagulation of the sclera."]'::jsonb, 0, 'Scleritis is a systemic inflammatory disease and does not respond to topical therapy alone. Initial treatment for non-necrotizing anterior scleritis is oral NSAIDs (such as indomethacin 50 mg tid) or systemic corticosteroids (prednisone 1 mg/kg/day) if NSAIDs are ineffective or if the scleritis is necrotizing. A thorough systemic workup for underlying collagen vascular disease is mandatory.
*   **B (Moxifloxacin)** and **C (Artificial tears)** are ineffective.
*   **D (Reassurance)** is incorrect; untreated scleritis can progress to scleromalacia perforans (scleral thinning and perforation) or lead to permanent vision loss.
*   **E (Laser photocoagulation)** is not used on the sclera.');

    ---------------------------------------------------------------------------
    -- CASE 36: The Homeless Patient with Eyelid Scarring
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Homeless Patient with Eyelid Scarring' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Homeless Patient with Eyelid Scarring', 'A 58-year-old male who has been living in a shelter presents with chronic irritation, discharge, and progressive visual loss in both eyes. He grew up in an rural area of East Africa and moved to the US 10 years ago.

**Physical Examination:**
*   **Visual Acuity:** OU: 20/200 (uncorrected)
*   **Ocular Examination (Bilateral):**
    *   **Eyelids:** Severe cicatricial entropion (inward turning of the eyelids) with multiple eyelashes rubbing directly against the central cornea (trichiasis). Eversion of the upper eyelid reveals a horizontal band of white scar tissue (Arlt''s line) on the superior tarsal conjunctiva.
    *   **Cornea:** Significant central corneal scarring and opacification secondary to chronic mechanical irritation from trichiasis.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 58-year-old male who has been living in a shelter presents with chronic irritation, discharge, and progressive visual loss in both eyes. He grew up in an rural area of East Africa and moved to the US 10 years ago.

**Physical Examination:**
*   **Visual Acuity:** OU: 20/200 (uncorrected)
*   **Ocular Examination (Bilateral):**
    *   **Eyelids:** Severe cicatricial entropion (inward turning of the eyelids) with multiple eyelashes rubbing directly against the central cornea (trichiasis). Eversion of the upper eyelid reveals a horizontal band of white scar tissue (Arlt''s line) on the superior tarsal conjunctiva.
    *   **Cornea:** Significant central corneal scarring and opacification secondary to chronic mechanical irritation from trichiasis.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Trachoma (*Chlamydia trachomatis* serotypes A, B, Ba, C).", "Adult inclusion conjunctivitis (*Chlamydia trachomatis* serotypes D-K).", "Lymphogranuloma Venereum (LGV) (*Chlamydia trachomatis* serotypes L1-L3).", "Ocular Cicatricial Pemphigoid.", "Stevens-Johnson Syndrome."]'::jsonb, 0, 'This is a classic presentation of late-stage cicatricial trachoma. Trachoma, caused by *Chlamydia trachomatis* serotypes A, B, Ba, and C, is the leading infectious cause of blindness worldwide. Repeated childhood reinfections cause chronic follicular conjunctivitis, leading to tarsal conjunctival scarring (Arlt''s line). Over decades, this scarring causes the eyelid margin to turn inward (entropion), resulting in eyelashes rubbing against the cornea (trichiasis), which leads to corneal ulceration, scarring, and blindness.
*   **B (Adult inclusion conjunctivitis)** is caused by serotypes D-K, is a sexually transmitted disease, and presents as an acute/subacute follicular conjunctivitis that does *not* lead to the severe cicatricial entropion and Arlt''s line of trachoma.
*   **C (LGV)** causes severe systemic lymphadenopathy and proctitis, and can cause Parinaud oculoglandular syndrome, not chronic cicatricial trachoma.
*   **D (OCP)** is an autoimmune scarring disease of the elderly, not an infectious disease linked to childhood residence in an endemic rural region.
*   **E (SJS)** is an acute drug reaction.'),
    (v_case_id, 'The World Health Organization (WHO) recommends which of the following multi-pronged strategies for the control and elimination of this disease?', '["SAFE strategy (Surgery, Antibiotics, Facial cleanliness, Environmental improvement).", "DOTS strategy (Directly Observed Therapy, Short-course).", "GAVI alliance vaccination program.", "HAART therapy protocol.", "Vector control via larvicides."]'::jsonb, 0, 'The WHO recommends the **SAFE** strategy for trachoma elimination:
*   **S**urgery: For trichiasis to prevent corneal blindness.
*   **A**ntibiotics: Mass drug administration (oral azithromycin) to reduce the community reservoir of *Chlamydia*.
*   **F**acial cleanliness: Hygiene education to reduce transmission among children.
*   **E**nvironmental improvement: Access to water and sanitation to control disease spread.
*   **B (DOTS)** is for Tuberculosis.
*   **C (GAVI)** is for global vaccine access.
*   **D (HAART)** is for HIV.
*   **E (Vector control)** is for vector-borne diseases like malaria or filariasis.');

    ---------------------------------------------------------------------------
    -- CASE 37: The Child with a Nodule at the Limbus
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Child with a Nodule at the Limbus' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Child with a Nodule at the Limbus', 'A 10-year-old female is brought to the clinic due to redness, watering, and mild photophobia in her right eye for 5 days. Her family immigrated from an area with high rates of tuberculosis 6 months ago.

**Physical Examination:**
*   **Ocular Examination (OD):** Slit-lamp exam reveals a small, 1.5 mm, elevated, pinkish-white nodule surrounded by localized conjunctival injection at the limbus (the junction of the cornea and sclera) at the 4 o''clock position. The center of the nodule shows a tiny, superficial ulceration. The rest of the conjunctiva and cornea is normal. OS exam is normal.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 10-year-old female is brought to the clinic due to redness, watering, and mild photophobia in her right eye for 5 days. Her family immigrated from an area with high rates of tuberculosis 6 months ago.

**Physical Examination:**
*   **Ocular Examination (OD):** Slit-lamp exam reveals a small, 1.5 mm, elevated, pinkish-white nodule surrounded by localized conjunctival injection at the limbus (the junction of the cornea and sclera) at the 4 o''clock position. The center of the nodule shows a tiny, superficial ulceration. The rest of the conjunctiva and cornea is normal. OS exam is normal.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what is the underlying pathophysiology?', '["Phlyctenular keratoconjunctivitis; Delayed-type hypersensitivity (Type IV) reaction to bacterial proteins (e.g., *Staphylococcus* or *Mycobacterium tuberculosis*).", "Episcleritis; Idiopathic inflammation of the superficial episcleral tissue.", "Marginal keratitis; Type III immune-complex hypersensitivity to Staphylococcal exotoxins.", "Pingueculitis; UV-induced elastotic degeneration of the conjunctiva.", "Conjunctival phlyctenule; Direct bacterial infection of the limbal epithelium."]'::jsonb, 0, 'This is a classic presentation of phlyctenular keratoconjunctivitis. A phlyctenule is a localized, inflammatory nodule at the limbus or on the cornea, representing a Type IV (delayed-type) hypersensitivity reaction to a foreign bacterial antigen. Historically, it was most commonly associated with *Mycobacterium tuberculosis* (and still is in developing nations or recent immigrants). In developed nations, it is now most commonly an immune response to *Staphylococcus aureus* cell wall proteins associated with chronic blepharitis. Treatment involves topical steroid-antibiotic combinations and addressing the underlying cause (tuberculosis screening or blepharitis treatment).
*   **B (Episcleritis)** presents as a diffuse or sectoral flat area of redness, not a distinct ulcerated nodule at the limbus.
*   **C (Marginal keratitis)** presents as peripheral stromal infiltrates separated from the limbus by a clear zone of cornea, not an elevated nodule.
*   **D (Pingueculitis)** is inflammation of a pre-existing pinguecula (yellowish nasal/temporal bulbar conjunctival deposit), which does not ulcerate or relate to TB.
*   **E (Direct infection)** is incorrect; the phlyctenule is a sterile, immune-mediated nodule, not a site of active bacterial replication.'),
    (v_case_id, 'Given the patient''s immigration history, which of the following is the most important systemic diagnostic test to perform?', '["Interferon-gamma release assay (IGRA) or PPD skin test.", "Serum ANA and Rheumatoid Factor.", "Conjunctival scraping for Gram stain.", "Rapid Plasma Reagin (RPR) test.", "Chest MRI."]'::jsonb, 0, 'Because phlyctenulosis is a classic ocular manifestation of hypersensitivity to tuberculous proteins, any patient with this condition—especially those from endemic areas—must be screened for systemic tuberculosis using a PPD skin test or an interferon-gamma release assay (IGRA), along with a chest X-ray.
*   **B (ANA/RF)** are for autoimmune rheumatologic diseases, which do not cause phlyctenulosis.
*   **C (Conjunctival scraping)** is not useful because the phlyctenule is a sterile immunologic nodule.
*   **D (RPR)** is a screening test for syphilis.
*   **E (Chest MRI)** is not the standard screening test for pulmonary TB.');

    ---------------------------------------------------------------------------
    -- CASE 38: The Post-Transplant Patient with Severe Dry Eye
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Post-Transplant Patient with Severe Dry Eye' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Post-Transplant Patient with Severe Dry Eye', 'A 34-year-old male presents with severe, bilateral burning, redness, photophobia, and a feeling of "sand in his eyes" for the past month. He underwent an allogeneic bone marrow transplant 9 months ago for acute myeloid leukemia (AML) and has been experiencing chronic skin rash and dry mouth.

**Physical Examination:**
*   **Physical:** Dry mucous membranes. Scaly, hyperpigmented maculopapular rash on his trunk and limbs.
*   **Ocular Examination (Bilateral):** Severe conjunctival injection. Slit-lamp exam reveals a lack of tear meniscus at the lower lid margins. Corneal fluorescein staining shows confluent, dense punctate epithelial erosions in the interpalpebral zone. There are multiple mucous filaments adhering to the corneal surface.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 34-year-old male presents with severe, bilateral burning, redness, photophobia, and a feeling of "sand in his eyes" for the past month. He underwent an allogeneic bone marrow transplant 9 months ago for acute myeloid leukemia (AML) and has been experiencing chronic skin rash and dry mouth.

**Physical Examination:**
*   **Physical:** Dry mucous membranes. Scaly, hyperpigmented maculopapular rash on his trunk and limbs.
*   **Ocular Examination (Bilateral):** Severe conjunctival injection. Slit-lamp exam reveals a lack of tear meniscus at the lower lid margins. Corneal fluorescein staining shows confluent, dense punctate epithelial erosions in the interpalpebral zone. There are multiple mucous filaments adhering to the corneal surface.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Ocular Graft-versus-Host Disease (GVHD).", "Sjogren''s Syndrome.", "Atopic Keratoconjunctivitis.", "Stevens-Johnson Syndrome.", "Toxic epidermal necrolysis."]'::jsonb, 0, 'Ocular Graft-versus-Host Disease (GVHD) is a major complication of allogeneic bone marrow/hematopoietic stem cell transplantation, occurring in up to 40-60% of patients with chronic systemic GVHD. It is driven by donor T-lymphocytes attacking host tissues, including the lacrimal gland and conjunctiva. This leads to the destruction of the lacrimal gland (causing severe aqueous tear deficiency) and the loss of conjunctival goblet cells (causing mucin deficiency), presenting as severe dry eye, filamentary keratitis, and corneal epithelial breakdown.
*   **B (Sjogren''s)** presents similarly with dry eyes and dry mouth (sicca complex), but is an idiopathic autoimmune disease in patients without a history of bone marrow transplantation.
*   **C (AKC)** is associated with severe atopic dermatitis, not post-transplant complications.
*   **D & E (SJS/TEN)** are acute, life-threatening drug reactions causing epidermal necrolysis and acute mucosal sloughing, not a chronic dry eye syndrome appearing months after BMT.'),
    (v_case_id, 'Which of the following represents the most appropriate local therapy for this patient''s severe ocular symptoms?', '["Preservative-free artificial tears, topical cyclosporine 0.05% drops, and consideration of autologous serum tears or scleral contact lenses.", "High-frequency topical dexamethasone 0.1% drops as long-term monotherapy.", "Prophylactic topical moxifloxacin drops 4 times daily.", "Immediate bilateral punctual cauterization without medical therapy.", "Surgical scraping of the corneal filaments daily."]'::jsonb, 0, 'The management of ocular GVHD is supportive and anti-inflammatory. Preservative-free artificial tears provide lubrication. Topical cyclosporine (an immunosuppressant) reduces lacrimal gland inflammation to help restore tear production. Autologous serum tears contain growth factors and vitamins that promote corneal epithelial healing. Scleral contact lenses (e.g., PROSE) trap a reservoir of saline against the cornea, protecting it from desiccation and friction.
*   **B (Long-term dexamethasone monotherapy)** is avoided due to the risks of cataract, glaucoma, and corneal infection/melting in an compromised eye.
*   **C (Moxifloxacin)** is not indicated for non-infectious dry eye and can cause corneal toxicity.
*   **D (Punctual cauterization)** is a permanent occlusion method; temporary punctal plugs or medical therapy are tried first.
*   **E (Scraping filaments daily)** is painful and does not prevent them from reforming; filaments are treated with lubrication and mucolytics (topical acetylcysteine).');

    ---------------------------------------------------------------------------
    -- CASE 39: The Neonate with Blurry Corneas and Joint Contractions
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Neonate with Blurry Corneas and Joint Contractions' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Neonate with Blurry Corneas and Joint Contractions', 'A 7-day-old female infant is brought to the clinic with bilateral eye discharge, redness, and cloudy corneas. The mother reports she had a vesicular vaginal rash during the third trimester but was not treated.

**Physical Examination:**
*   **Physical:** A few small, vesicular skin lesions are noted on the infant''s scalp.
*   **Ocular Examination (Bilateral):** Eyelid edema and conjunctival injection. Slit-lamp exam reveals multiple dendritic-like epithelial defects on both corneas. The stroma is diffusely hazy.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 7-day-old female infant is brought to the clinic with bilateral eye discharge, redness, and cloudy corneas. The mother reports she had a vesicular vaginal rash during the third trimester but was not treated.

**Physical Examination:**
*   **Physical:** A few small, vesicular skin lesions are noted on the infant''s scalp.
*   **Ocular Examination (Bilateral):** Eyelid edema and conjunctival injection. Slit-lamp exam reveals multiple dendritic-like epithelial defects on both corneas. The stroma is diffusely hazy.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what is the standard treatment?', '["Neonatal Herpes Simplex Virus (HSV) keratitis; Hospitalization for intravenous acyclovir and topical ganciclovir 0.15% gel.", "Neonatal Chlamydial conjunctivitis; Oral erythromycin suspension.", "Neonatal Gonococcal conjunctivitis; Intramuscular ceftriaxone.", "Congenital Syphilis; Intravenous penicillin G.", "Chemical conjunctivitis; Saline irrigation."]'::jsonb, 0, 'This infant has neonatal Herpes Simplex Virus (HSV) keratitis, suggested by the onset at 7 days of life, vesicular scalp lesions, maternal history of vesicular vaginal rash (HSV-2), and bilateral corneal dendritic epithelial defects with stromal haze. Neonatal HSV is a life-threatening infection that can rapidly disseminate to the brain and other organs. Immediate hospitalization for intravenous acyclovir (20 mg/kg every 8 hours for 14-21 days) is mandatory, along with topical antiviral drops/gel (e.g., ganciclovir 0.15%) for the ocular disease.
*   **B (Chlamydia)** presents with mucopurulent conjunctivitis, not corneal dendrites and vesicular skin lesions.
*   **C (Gonococcus)** presents at day 2-5 with hyperacute purulent discharge, not dendrites.
*   **D (Syphilis)** causes interstitial keratitis later in childhood/adolescence, not neonatal dendritic keratitis.
*   **E (Chemical)** occurs within the first 24 hours of life due to silver nitrate drops, resolving spontaneously.'),
    (v_case_id, 'Most cases of neonatal HSV infection (approximately 85%) are acquired through which of the following routes?', '["Birth canal transmission during delivery (exposure to HSV-2).", "Transplacental transmission in utero.", "Postnatal transmission from close contact with cold sores (HSV-1).", "Nosocomial transmission in the newborn nursery.", "Insect vectors in the postpartum ward."]'::jsonb, 0, 'The vast majority of neonatal HSV infections are acquired during delivery through contact with infected maternal vaginal secretions containing HSV-2 (and occasionally HSV-1). Risk is highest during primary maternal infection, which is why active lesions at the time of labor are an indication for cesarean delivery.
*   **B (Transplacental)** is rare (congenital HSV triad: skin vesicles, eye chorioretinitis/microphthalmia, brain damage).
*   **C (Postnatal)** and **D (Nosocomial)** account for a minority of cases.
*   **E (Insect vectors)** is not a route of HSV transmission.');

    ---------------------------------------------------------------------------
    -- CASE 40: The Diabetic with a Red Eye and a Dilated Pupil
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Diabetic with a Red Eye and a Dilated Pupil' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Diabetic with a Red Eye and a Dilated Pupil', 'A 67-year-old male with a history of poorly controlled Type 2 Diabetes presents with sudden onset of redness, pain, and blurred vision in his right eye for 24 hours.

**Physical Examination:**
*   **Visual Acuity:** OD: 20/100; OS: 20/30
*   **Ocular Examination (OD):** Moderate conjunctival injection. The cornea is mildly hazy. Slit-lamp exam reveals 1+ cell and flare in the anterior chamber. The pupil is mid-dilated (5 mm) and non-reactive to light. Gonioscopy shows the anterior chamber angle is open. Dilated fundus examination shows proliferative diabetic retinopathy with extensive neovascularization of the disc (NVD).
*   **Intraocular Pressure (IOP):** OD: 42 mmHg (highly elevated); OS: 15 mmHg.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 67-year-old male with a history of poorly controlled Type 2 Diabetes presents with sudden onset of redness, pain, and blurred vision in his right eye for 24 hours.

**Physical Examination:**
*   **Visual Acuity:** OD: 20/100; OS: 20/30
*   **Ocular Examination (OD):** Moderate conjunctival injection. The cornea is mildly hazy. Slit-lamp exam reveals 1+ cell and flare in the anterior chamber. The pupil is mid-dilated (5 mm) and non-reactive to light. Gonioscopy shows the anterior chamber angle is open. Dilated fundus examination shows proliferative diabetic retinopathy with extensive neovascularization of the disc (NVD).
*   **Intraocular Pressure (IOP):** OD: 42 mmHg (highly elevated); OS: 15 mmHg.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Neovascular Glaucoma (NVG).", "Acute Angle-Closure Glaucoma (AACG).", "Fuchs Uveitis Syndrome.", "Bacterial Endophthalmitis.", "Phacolytic Glaucoma."]'::jsonb, 0, 'This is a case of Neovascular Glaucoma (NVG) in a patient with proliferative diabetic retinopathy. Retinal ischemia drives the release of Vascular Endothelial Growth Factor (VEGF), which diffuses into the anterior segment, causing the growth of new blood vessels on the iris (rubeosis iridis) and in the anterior chamber angle. Initially, this causes an open-angle glaucoma as the neovascular membrane covers the trabecular meshwork (as seen in this patient with an open angle). Over time, this fibrovascular membrane contracts, pulling the iris over the angle and causing secondary angle-closure glaucoma. The high IOP causes corneal haze and pain, mimicking acute angle closure.
*   **B (AACG)** presents with a closed angle on gonioscopy, a shallow anterior chamber, and is not driven by retinal neovascularization.
*   **C (Fuchs)** presents with heterochromia and diffuse stellate KPs, without high-stage proliferative diabetic retinopathy and acute rubeotic glaucoma.
*   **D (Endophthalmitis)** is a severe intraocular infection, typically post-surgical.
*   **E (Phacolytic)** is caused by a leaking hypermature cataract, not retinal ischemia.'),
    (v_case_id, 'What is the most appropriate definitive treatment to address the underlying cause of this patient''s elevated intraocular pressure?', '["Panretinal Photocoagulation (PRP) and intravitreal anti-VEGF injection.", "Immediate laser peripheral iridotomy.", "High-frequency topical prednisolone acetate 1% drops alone.", "Emergency trabeculectomy.", "Surgical removal of the lens (cataract extraction)."]'::jsonb, 0, 'The definitive treatment for neovascular glaucoma is to address the underlying retinal ischemia that is producing VEGF. This is achieved through Panretinal Photocoagulation (PRP) to ablate the ischemic peripheral retina, combined with intravitreal anti-VEGF injections (e.g., bevacizumab or ranibizumab) to rapidly shrink the new vessels on the iris and angle. Medical IOP-lowering drops are used as adjunctive therapy.
*   **B (Laser peripheral iridotomy)** is the treatment for pupillary-block angle-closure glaucoma, not neovascular glaucoma.
*   **C (Steroids alone)** will not address the ischemia or reduce the IOP.
*   **D (Trabeculectomy)** may be needed later if medical and laser therapy fail, but performing filtration surgery on a highly vascularized, active rubeotic eye carries a very high risk of intraocular hemorrhage (hyphema) and failure.
*   **E (Cataract extraction)** is not the treatment for NVG.');

    ---------------------------------------------------------------------------
    -- CASE 41: The Young Adult with Vertigo and Cloudy Eyes
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Young Adult with Vertigo and Cloudy Eyes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Young Adult with Vertigo and Cloudy Eyes', 'A 24-year-old female presents with bilateral painful red eyes, photophobia, and decreased vision for 3 days. She also reports experiencing episodes of severe dizziness (vertigo), ringing in her ears (tinnitus), and progressive hearing loss over the last week.

**Physical Examination:**
*   **Visual Acuity:** OU: 20/80
*   **Ocular Examination (Bilateral):** Moderate conjunctival injection. Slit-lamp exam reveals deep stromal infiltrates in both corneas, with vascularization (interstitial keratitis) but an intact epithelium. The anterior chambers show 1+ cell and flare.
*   **Audiology:** Sensorineural hearing loss in both ears.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old female presents with bilateral painful red eyes, photophobia, and decreased vision for 3 days. She also reports experiencing episodes of severe dizziness (vertigo), ringing in her ears (tinnitus), and progressive hearing loss over the last week.

**Physical Examination:**
*   **Visual Acuity:** OU: 20/80
*   **Ocular Examination (Bilateral):** Moderate conjunctival injection. Slit-lamp exam reveals deep stromal infiltrates in both corneas, with vascularization (interstitial keratitis) but an intact epithelium. The anterior chambers show 1+ cell and flare.
*   **Audiology:** Sensorineural hearing loss in both ears.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what life-threatening systemic complication must be ruled out?', '["Cogan''s Syndrome; Aortitis (leading to aortic insufficiency or dissection).", "Congenital Syphilis; Neurosyphilis.", "Vogt-Koyanagi-Harada disease; Meningitis.", "Multiple Sclerosis; Demyelinating plaques in the brainstem.", "Granulomatosis with Polyangiitis; Glomerulonephritis."]'::jsonb, 0, 'Cogan''s Syndrome is a rare, systemic autoimmune disease characterized by the combination of ocular inflammation (classically interstitial keratitis) and vestibuloauditory dysfunction (vertigo, tinnitus, sensorineural hearing loss, resembling Meniere''s disease). It primarily affects young adults. Crucially, up to 10% of patients develop systemic vasculitis, most commonly aortitis, which can lead to life-threatening aortic insufficiency, aneurysm, or dissection. A complete cardiovascular workup (echocardiogram, CT/MRI of the aorta) is essential.
*   **B (Congenital Syphilis)** causes interstitial keratitis and sensorineural hearing loss (Hutchinson''s triad), but typically presents in childhood/adolescence with dental anomalies (Hutchinson''s teeth) and is a chronic infectious disease, whereas Cogan''s is an acute autoimmune syndrome in young adults.
*   **C (VKH)** presents with panuveitis, exudative retinal detachments, meningismus, and hearing loss, not isolated interstitial keratitis.
*   **D (MS)** can cause internuclear ophthalmoplegia, optic neuritis, or intermediate uveitis, but not interstitial keratitis.
*   **E (GPA)** causes scleritis, PUK, and airway/renal disease, not interstitial keratitis and Meniere''s-like symptoms.'),
    (v_case_id, 'Which of the following represents the standard treatment for the active vestibuloauditory symptoms in this condition?', '["Systemic high-dose corticosteroids.", "Oral penicillin G.", "Intravenous acyclovir.", "Oral antihistamines and meclizine only.", "Surgical cochlear implantation immediately."]'::jsonb, 0, 'Systemic corticosteroids (e.g., prednisone 1-2 mg/kg/day) are the mainstay of treatment for the vestibuloauditory symptoms of Cogan''s syndrome. Early initiation of steroids is critical to prevent permanent sensorineural deafness. Topical steroids are used to treat the interstitial keratitis.
*   **B (Penicillin G)** is for syphilis; Cogan''s is autoimmune and does not respond to antibiotics.
*   **C (Acyclovir)** is an antiviral.
*   **D (Meclizine)** is for symptomatic relief of vertigo, but does not stop the inflammatory destruction of the inner ear.
*   **E (Cochlear implantation)** is reserved for patients who develop permanent, bilateral deafness after the acute inflammatory phase has resolved.');

    ---------------------------------------------------------------------------
    -- CASE 42: The Blepharitis Patient with Peripheral Infiltrates
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blepharitis Patient with Peripheral Infiltrates' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blepharitis Patient with Peripheral Infiltrates', 'A 28-year-old female presents with mild redness, irritation, and foreign body sensation in her right eye for 3 days. She has a history of chronic dandruff and oily skin.

**Physical Examination:**
*   **Ocular Examination (OD):**
    *   **Eyelids:** Erythematous lid margins with greasy scales and crusting (scurf) at the base of the eyelashes. The meibomian glands are capped with oil.
    *   **Conjunctiva:** Mild bulbar conjunctival injection.
    *   **Cornea:** Slit-lamp exam reveals two small, round, white subepithelial infiltrates in the peripheral stroma near the limbus at the 8 o''clock and 10 o''clock positions. Crucially, there is a 1.0 mm "clear zone" of normal cornea between the infiltrates and the limbus. There is no overlying epithelial defect (no fluorescein staining).', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old female presents with mild redness, irritation, and foreign body sensation in her right eye for 3 days. She has a history of chronic dandruff and oily skin.

**Physical Examination:**
*   **Ocular Examination (OD):**
    *   **Eyelids:** Erythematous lid margins with greasy scales and crusting (scurf) at the base of the eyelashes. The meibomian glands are capped with oil.
    *   **Conjunctiva:** Mild bulbar conjunctival injection.
    *   **Cornea:** Slit-lamp exam reveals two small, round, white subepithelial infiltrates in the peripheral stroma near the limbus at the 8 o''clock and 10 o''clock positions. Crucially, there is a 1.0 mm "clear zone" of normal cornea between the infiltrates and the limbus. There is no overlying epithelial defect (no fluorescein staining).', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Marginal Keratitis (Staphylococcal hypersensitivity).", "Bacterial corneal ulcer.", "HSV epithelial keratitis.", "Acanthamoeba keratitis.", "Peripheral Ulcerative Keratitis (PUK)."]'::jsonb, 0, 'This is a classic presentation of marginal keratitis (also known as Staphylococcal marginal infiltration). It is a sterile, immune-mediated reaction (Type III hypersensitivity) to Staphylococcal exotoxins and cell wall proteins deposited in the tear film, commonly associated with chronic Staphylococcal blepharitis. The classic presentation is peripheral corneal infiltrates separated from the limbus by a clear zone of cornea, with minimal pain (unlike infectious ulcers).
*   **B (Bacterial ulcer)** would present with moderate-to-severe pain, a central/paracentral infiltrate, and a overlying epithelial defect, not a sterile peripheral infiltrate with a clear zone.
*   **C (HSV)** presents with dendritic ulcers.
*   **D (Acanthamoeba)** presents with severe pain and a ring-shaped infiltrate.
*   **E (PUK)** is characterized by progressive corneal thinning and ulceration at the limbus without a clear zone, associated with systemic vasculitis.'),
    (v_case_id, 'Which of the following is the most appropriate treatment for this patient?', '["Lid hygiene (warm compresses and eyelid scrubs) combined with a topical steroid-antibiotic drops (e.g., tobramycin/dexamethasone).", "Hourly topical fortified tobramycin drops.", "Topical ganciclovir 0.15% gel 5 times daily.", "Immediate corneal scraping for culture.", "Systemic oral corticosteroids alone."]'::jsonb, 0, 'Because marginal keratitis is a sterile hypersensitivity reaction to bacterial toxins on the eyelids, management must address both the inflammation and the bacterial load on the lids. Treatment consists of lid hygiene (warm compresses, eyelid scrubs) and a combination topical steroid/antibiotic drop (e.g., TobraDex). The steroid treats the immune infiltration, and the antibiotic reduces the Staphylococcal population.
*   **B (Fortified tobramycin)** is for active bacterial keratitis, not sterile marginal keratitis.
*   **C (Ganciclovir)** is for HSV.
*   **D (Corneal scraping)** is not indicated because the infiltrates are sterile and peripheral with an intact epithelium.
*   **E (Systemic steroids)** are not required for this mild, localized disease.');

    ---------------------------------------------------------------------------
    -- CASE 43: Waxing and Waning Corneas Without Redness
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Waxing and Waning Corneas Without Redness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Waxing and Waning Corneas Without Redness', 'A 35-year-old male presents with recurrent episodes of irritation, photophobia, and foreign body sensation in both eyes off and on for the past two years. He notes that between episodes, his eyes feel completely normal. He denies any discharge or redness.

**Physical Examination:**
*   **Visual Acuity:** OU: 20/20
*   **Ocular Examination (Bilateral):** The conjunctiva is quiet and white (no injection). Slit-lamp exam of the cornea reveals multiple, small, elevated, whitish-gray epithelial lesions (punctate epithelial keratitis) in the central cornea. There is no stromal edema or infiltrates. Corneal sensation is normal. The eyes are otherwise completely quiet.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old male presents with recurrent episodes of irritation, photophobia, and foreign body sensation in both eyes off and on for the past two years. He notes that between episodes, his eyes feel completely normal. He denies any discharge or redness.

**Physical Examination:**
*   **Visual Acuity:** OU: 20/20
*   **Ocular Examination (Bilateral):** The conjunctiva is quiet and white (no injection). Slit-lamp exam of the cornea reveals multiple, small, elevated, whitish-gray epithelial lesions (punctate epithelial keratitis) in the central cornea. There is no stromal edema or infiltrates. Corneal sensation is normal. The eyes are otherwise completely quiet.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis?', '["Thygeson''s Superficial Punctate Keratitis (TSPK).", "Epidemic Keratoconjunctivitis (EKC).", "HSV epithelial keratitis.", "Dry Eye Syndrome.", "Photokeratitis."]'::jsonb, 0, 'Thygeson''s Superficial Punctate Keratitis (TSPK) is a chronic, recurrent bilateral corneal disease characterized by multiple elevated, granular epithelial lesions in a quiet, white eye. It typically affects young adults, presents with foreign body sensation, photophobia, and tearing, and has a classic waxing and waning course over years. The lack of conjunctival injection ("white eye") despite active corneal lesions is a hallmark. Treatment is low-dose topical steroids (e.g., fluorometholone or loteprednol) or topical cyclosporine, which yield rapid relief.
*   **B (EKC)** presents with severe conjunctival injection, chemosis, follicles, preauricular node, and watery discharge, not a white eye.
*   **C (HSV)** is unilateral, presents with dendritic ulcers, and is associated with decreased corneal sensation.
*   **D (Dry Eye)** causes inferior or interpalpebral punctate erosions (which are depressed defects, not elevated granular plaques) and is not characterized by this episodic central pattern.
*   **E (Photokeratitis)** is acute and follows UV exposure, resolving in 48 hours.'),
    (v_case_id, 'Which of the following classes of medication is considered the first-line steroid-sparing agent for long-term control of this recurrent condition?', '["Topical Cyclosporine (e.g., 0.05% or 0.1%).", "Topical Moxifloxacin.", "Topical Ketorolac.", "Oral Acyclovir.", "Topical Pilocarpine."]'::jsonb, 0, 'Topical cyclosporine is highly effective for the long-term management of TSPK and is used as a steroid-sparing agent to avoid the complications of chronic topical steroid use (glaucoma, cataracts).
*   **B (Moxifloxacin)**, **C (Ketorolac)**, **D (Acyclovir)**, and **E (Pilocarpine)** have no role in the management of TSPK.');

    ---------------------------------------------------------------------------
    -- CASE 44: Frothy Tears and Red Eyelids
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Frothy Tears and Red Eyelids' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Frothy Tears and Red Eyelids', 'A 52-year-old female presents with chronic, bilateral burning, redness, and a feeling of "dryness" in her eyes for the past 6 months. She reports that her eyes feel particularly irritated in the mornings, and she often wakes up with her eyelashes "matted" together.

**Physical Examination:**
*   **Ocular Examination (Bilateral):**
    *   **Eyelid Margins:** Thickened and erythematous (tylosis) with telangiectatic blood vessels. The meibomian gland orifices are plugged with yellow, dome-like lipid secretions. Pressure on the eyelid margin expresses thick, turbid oil (resembling toothpaste) rather than clear lipid.
    *   **Tear Film:** A frothy, foamy tear meniscus is present at the outer canthus.
    *   **Conjunctiva:** Mild injection of the bulbar conjunctiva.
    *   **Cornea:** Mild inferior punctate epithelial staining.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 52-year-old female presents with chronic, bilateral burning, redness, and a feeling of "dryness" in her eyes for the past 6 months. She reports that her eyes feel particularly irritated in the mornings, and she often wakes up with her eyelashes "matted" together.

**Physical Examination:**
*   **Ocular Examination (Bilateral):**
    *   **Eyelid Margins:** Thickened and erythematous (tylosis) with telangiectatic blood vessels. The meibomian gland orifices are plugged with yellow, dome-like lipid secretions. Pressure on the eyelid margin expresses thick, turbid oil (resembling toothpaste) rather than clear lipid.
    *   **Tear Film:** A frothy, foamy tear meniscus is present at the outer canthus.
    *   **Conjunctiva:** Mild injection of the bulbar conjunctiva.
    *   **Cornea:** Mild inferior punctate epithelial staining.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and which layer of the tear film is primarily affected?', '["Posterior Blepharitis (Meibomian Gland Dysfunction); Lipid layer.", "Anterior Blepharitis (Staphylococcal); Aqueous layer.", "Aqueous Tear Deficiency (Sjogren''s); Mucin layer.", "Superior Limbic Keratoconjunctivitis; Aqueous layer.", "Contact Dermatitis; Lipid layer."]'::jsonb, 0, 'This is a classic case of posterior blepharitis, also known as Meibomian Gland Dysfunction (MGD). The meibomian glands, located in the tarsal plates, secrete the lipid (oil) layer of the tear film, which prevents evaporation of the underlying aqueous layer. In MGD, the glands become obstructed, and the lipids are chemically altered by bacterial lipases (leading to the classic "toothpaste" expression and "frothy" tear film). The lack of a healthy lipid layer causes rapid tear evaporation (evaporative dry eye).
*   **B (Anterior blepharitis)** involves the base of the eyelashes (crusting/collarettes), not the meibomian glands.
*   **C (Aqueous Tear Deficiency)** affects the lacrimal gland (aqueous layer), not the meibomian glands.
*   **D (SLK)** is an inflammatory friction-related disease of the superior limbus.
*   **E (Contact dermatitis)** is an acute allergic reaction of the eyelid skin.'),
    (v_case_id, 'Which of the following represents the most appropriate initial therapy for this patient?', '["Warm compresses and eyelid hygiene (lid scrubs), combined with oral omega-3 fatty acids, and topical erythromycin ointment to the lid margins.", "High-frequency topical prednisolone acetate 1% drops daily.", "Hourly preservative-free artificial tears only.", "Urgent surgical excision of the meibomian glands.", "Oral acyclovir 400 mg twice daily."]'::jsonb, 0, 'First-line management of posterior blepharitis is conservative: warm compresses (to liquefy the clogged lipid) followed by eyelid massage/hygiene, oral omega-3 supplements to improve lipid quality, and topical antibiotic ointment (erythromycin or bacitracin) applied to the lid margin at bedtime to reduce the lipase-producing bacterial population. For refractory cases, oral doxycycline is used for its anti-inflammatory and lipid-modifying properties.
*   **B (Topical steroids)** are avoided for long-term management of blepharitis due to side effects.
*   **C (Tears alone)** do not address the underlying meibomian gland obstruction.
*   **D (Surgical excision)** is incorrect.
*   **E (Oral acyclovir)** is not indicated.');

    ---------------------------------------------------------------------------
    -- CASE 45: Crusting at the Base of the Lashes
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Crusting at the Base of the Lashes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Crusting at the Base of the Lashes', 'A 12-year-old male is brought to the clinic with bilateral itchy, red eyelid margins and "crusting" on his eyelashes for the past month.

**Physical Examination:**
*   **Ocular Examination (Bilateral):** Eyelid margins are red and swollen. Slit-lamp exam reveals hard, crusty scales (collarettes) encircling the base of the eyelashes like a ring. There are several areas of eyelash loss (madarosis) and white lashes (poliosis). The conjunctiva is mildly injected, but the cornea is clear.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 12-year-old male is brought to the clinic with bilateral itchy, red eyelid margins and "crusting" on his eyelashes for the past month.

**Physical Examination:**
*   **Ocular Examination (Bilateral):** Eyelid margins are red and swollen. Slit-lamp exam reveals hard, crusty scales (collarettes) encircling the base of the eyelashes like a ring. There are several areas of eyelash loss (madarosis) and white lashes (poliosis). The conjunctiva is mildly injected, but the cornea is clear.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what is the primary causative organism?', '["Anterior Staphylococcal Blepharitis; *Staphylococcus aureus*.", "Posterior Blepharitis; *Propionibacterium acnes*.", "Demodex Blepharitis; *Demodex folliculorum*.", "Seborrheic Blepharitis; *Malassezia furfur*.", "Phthiriasis Palpebrarum; *Pthirus pubis*."]'::jsonb, 0, 'This is a classic case of anterior Staphylococcal blepharitis. It is characterized by inflammation at the base of the eyelashes, presenting with hard scales called "collarettes" that encircle the lash follicle. Chronic infection can lead to lash loss (madarosis), whitening of the lashes (poliosis), and scarring. The primary causative organism is *Staphylococcus aureus* or *Staphylococcus epidermidis*.
*   **B (Posterior blepharitis)** involves the meibomian glands, not the lash follicles.
*   **C (Demodex)** presents with classic "cylindrical dandruff" (clear sleeves around the base of the lashes), not hard collarettes.
*   **D (Seborrheic blepharitis)** presents with greasy scales (scurf) on the lid margin and is associated with seborrheic dermatitis.
*   **E (Phthiriasis)** is infestation of the lashes by crab lice, presenting with visible nits and lice on the lashes.'),
    (v_case_id, 'The presence of "cylindrical dandruff" (sleeve-like collarettes) at the base of the lashes is pathognomonic for which type of blepharitis?', '["Demodex Blepharitis.", "Staphylococcal Blepharitis.", "Seborrheic Blepharitis.", "Parasitic Blepharitis.", "Meibomian Seborrhea."]'::jsonb, 0, 'Cylindrical dandruff (clear, waxy sleeves that wrap around the proximal lash shaft) is pathognomonic for *Demodex* blepharitis (caused by *Demodex folliculorum* mites). Treatment involves tea tree oil lid scrubs or topical ivermectin.
*   **B (Staphylococcal)** causes hard, crusty collarettes, not clear sleeves.
*   **C (Seborrheic)** causes greasy, scaly scurf.
*   **D (Parasitic / Lice)** causes nits and lice, not cylindrical dandruff.
*   **E (Meibomian seborrhea)** is a form of MGD with excess lipid secretion.');

    ---------------------------------------------------------------------------
    -- CASE 46: A Red Eye with a Shifting Hypopyon and Joint Pain
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'A Red Eye with a Shifting Hypopyon and Joint Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'A Red Eye with a Shifting Hypopyon and Joint Pain', 'A 24-year-old male presents with acute, painful redness and photophobia in his right eye for 3 days. He also reports experiencing pain and swelling in his left knee and right ankle, and pain during urination (dysuria) for the past 2 weeks.

**Physical Examination:**
*   **Visual Acuity:** OD: 20/60; OS: 20/20
*   **Ocular Examination (OD):** Moderate conjunctival injection with ciliary flush. Slit-lamp exam reveals 3+ cell and flare in the anterior chamber, and a 1.0 mm hypopyon that shifts with head movement. The pupil is small and sluggishly reactive. OS exam is normal.
*   **Joints:** Effusion and tenderness in the left knee.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 24-year-old male presents with acute, painful redness and photophobia in his right eye for 3 days. He also reports experiencing pain and swelling in his left knee and right ankle, and pain during urination (dysuria) for the past 2 weeks.

**Physical Examination:**
*   **Visual Acuity:** OD: 20/60; OS: 20/20
*   **Ocular Examination (OD):** Moderate conjunctival injection with ciliary flush. Slit-lamp exam reveals 3+ cell and flare in the anterior chamber, and a 1.0 mm hypopyon that shifts with head movement. The pupil is small and sluggishly reactive. OS exam is normal.
*   **Joints:** Effusion and tenderness in the left knee.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what systemic marker is most commonly positive in this patient?', '["Reactive Arthritis; HLA-B27.", "Rheumatoid Arthritis; Anti-CCP.", "Gout; Serum Uric Acid.", "Sarcoidosis; ACE.", "Gonococcal arthritis; Chocolate agar culture of urethral discharge."]'::jsonb, 0, 'This patient presents with the triad of urethritis (dysuria), arthritis (knee/ankle effusion), and acute anterior uveitis (suggested by pain, ciliary flush, cells, and hypopyon), which is classic for Reactive Arthritis (formerly Reiter''s syndrome—"can''t see, can''t pee, can''t climb a tree"). Reactive arthritis is strongly associated with the HLA-B27 class I major histocompatibility complex antigen.
*   **B (RA)** causes scleritis and PUK, not acute anterior uveitis with hypopyon in a young male.
*   **C (Gout)** causes monoarticular arthritis (typically first MTP joint), not uveitis.
*   **D (Sarcoidosis)** causes granulomatous uveitis, not urethritis.
*   **E (Gonococcal arthritis)** is a possibility, but the classic triad of urethritis, arthritis, and sterile anterior uveitis following a GI or chlamydial infection is reactive arthritis.'),
    (v_case_id, 'Which of the following represents the most appropriate initial therapy for the ocular disease in this patient?', '["Topical prednisolone acetate 1% and topical cyclopentolate 1% drops.", "Topical moxifloxacin 0.5% drops.", "Systemic intravenous ceftriaxone.", "Oral acyclovir 400 mg 5 times daily.", "Immediate surgical drainage of the hypopyon."]'::jsonb, 0, 'The uveitis in reactive arthritis is sterile and inflammatory. The initial treatment is standard for acute anterior uveitis: topical corticosteroids (prednisolone acetate 1%) to control inflammation, and a topical cycloplegic (cyclopentolate or homatropine) to dilate the pupil and reduce pain from ciliary spasm.
*   **B (Moxifloxacin)** has no role in sterile uveitis.
*   **C (Ceftriaxone)** is for active gonococcal infection, but reactive arthritis is a sterile post-infectious autoimmune syndrome (although the triggering infection, e.g., *Chlamydia*, is treated if still present,ceftriaxone does not treat the ocular uveitis).
*   **D (Acyclovir)** is an antiviral.
*   **E (Surgical drainage)** of a sterile uveitic hypopyon is contraindicated as it increases inflammation and is unnecessary; the hypopyon will resolve with topical steroids.');

    ---------------------------------------------------------------------------
    -- CASE 47: The Patient with a Red Eye and an Irregular Pupil
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Patient with a Red Eye and an Irregular Pupil' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Patient with a Red Eye and an Irregular Pupil', 'A 35-year-old female presents with pain, redness, and photophobia in her right eye for 4 days. She has a history of Ulcerative Colitis and is currently experiencing a flare of abdominal pain and bloody diarrhea.

**Physical Examination:**
*   **Visual Acuity:** OD: 20/40; OS: 20/20
*   **Ocular Examination (OD):** Circumcorneal injection (ciliary flush). The pupil is irregular (clover-leaf shaped) and miotic. Slit-lamp exam shows 2+ cells in the anterior chamber. There are multiple adhesions between the posterior iris and the anterior lens capsule (posterior synechiae). OS is normal.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old female presents with pain, redness, and photophobia in her right eye for 4 days. She has a history of Ulcerative Colitis and is currently experiencing a flare of abdominal pain and bloody diarrhea.

**Physical Examination:**
*   **Visual Acuity:** OD: 20/40; OS: 20/20
*   **Ocular Examination (OD):** Circumcorneal injection (ciliary flush). The pupil is irregular (clover-leaf shaped) and miotic. Slit-lamp exam shows 2+ cells in the anterior chamber. There are multiple adhesions between the posterior iris and the anterior lens capsule (posterior synechiae). OS is normal.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what is the mechanism of the pupil irregularity?', '["Acute anterior uveitis; Posterior synechiae binding the iris to the lens.", "Acute angle-closure glaucoma; Iris ischemia.", "Fuchs Uveitis Syndrome; Iris stroma atrophy.", "Adie''s tonic pupil; Ciliary ganglion dysfunction.", "Horner''s Syndrome; Sympathetic pathway interruption."]'::jsonb, 0, 'This patient has acute anterior uveitis associated with her Inflammatory Bowel Disease (Ulcerative Colitis). The irregular, clover-leaf shape of the pupil is caused by posterior synechiae, which are inflammatory adhesions between the posterior surface of the iris and the anterior capsule of the lens. These adhesions prevent normal pupillary dilation and constriction, leading to the irregular contour.
*   **B (Angle-closure)** causes a mid-dilated, vertically oval pupil, not an irregular miotic pupil with active cells in the chamber.
*   **C (Fuchs)** does *not* cause posterior synechiae.
*   **D (Adie''s)** causes a dilated, poorly reactive pupil due to parasympathetic denervation, without inflammation.
*   **E (Horner''s)** causes miosis and ptosis, but the pupil remains round and there is no ocular inflammation.'),
    (v_case_id, 'Which of the following drops is most appropriate to break the posterior synechiae and restore a round pupil in this patient?', '["Topical atropine 1% or phenylephrine 10% drops.", "Topical pilocarpine 2% drops.", "Topical timolol 0.5% drops.", "Topical ketorolac 0.5% drops.", "Topical latanoprost 0.005% drops."]'::jsonb, 0, 'To break posterior synechiae, strong pupillary dilation is required. This is achieved using a potent cycloplegic/mydriatic agent (like atropine 1%) or a strong alpha-1 agonist (phenylephrine 10% drops). Dilating the pupil pulls the iris away from the lens, breaking the adhesions.
*   **B (Pilocarpine)** constricts the pupil (miotic), which would increase iris-lens contact and worsen the posterior synechiae.
*   **C (Timolol)** and **E (Latanoprost)** are IOP-lowering drops and have no effect on pupillary dilation or breaking synechiae.
*   **D (Ketorolac)** is an NSAID and does not dilate the pupil.');

    ---------------------------------------------------------------------------
    -- CASE 48: The Toddler with Bilateral Red Eyes and Strawberry Tongue
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Toddler with Bilateral Red Eyes and Strawberry Tongue' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Toddler with Bilateral Red Eyes and Strawberry Tongue', 'A 3-year-old male is brought to the Emergency Department with a 6-day history of high fever (103.5°F/39.7°C), irritability, and bilateral red eyes.

**Physical Examination:**
*   **Vitals:** Temp: 103.2°F (39.6°C) | HR: 120 bpm | RR: 24/min
*   **Physical:** Bilateral, non-purulent conjunctival injection. Erythematous, cracked lips and a "strawberry tongue." Erythema and swelling of his hands and feet, and a polymorphous maculopapular rash on his torso. A single, enlarged cervical lymph node (2 cm) is palpable on the left.
*   **Ocular Examination (Bilateral):** Diffuse conjunctival injection, primarily affecting the bulbar conjunctiva, with sparing of the limbal area. There is no discharge or tearing. Slit-lamp exam shows a quiet anterior chamber.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 3-year-old male is brought to the Emergency Department with a 6-day history of high fever (103.5°F/39.7°C), irritability, and bilateral red eyes.

**Physical Examination:**
*   **Vitals:** Temp: 103.2°F (39.6°C) | HR: 120 bpm | RR: 24/min
*   **Physical:** Bilateral, non-purulent conjunctival injection. Erythematous, cracked lips and a "strawberry tongue." Erythema and swelling of his hands and feet, and a polymorphous maculopapular rash on his torso. A single, enlarged cervical lymph node (2 cm) is palpable on the left.
*   **Ocular Examination (Bilateral):** Diffuse conjunctival injection, primarily affecting the bulbar conjunctiva, with sparing of the limbal area. There is no discharge or tearing. Slit-lamp exam shows a quiet anterior chamber.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what is the first-line therapy?', '["Kawasaki Disease; Intravenous Immunoglobulin (IVIG) and high-dose oral aspirin.", "Adenoviral conjunctivitis; Supportive care only.", "Scarlet Fever; Oral penicillin.", "Measles (Rubeola); Supportive care and Vitamin A.", "Toxic Shock Syndrome; Intravenous clindamycin."]'::jsonb, 0, 'This child meets the diagnostic criteria for Kawasaki Disease (mucocutaneous lymph node syndrome): fever lasting $\ge 5$ days, plus at least 4 of the 5 criteria: (1) bilateral, non-exudative conjunctival injection (often sparing the limbus), (2) changes in oral mucous membranes (strawberry tongue, cracked red lips), (3) polymorphous rash, (4) changes in the extremities (erythema/edema of hands and feet), and (5) cervical lymphadenopathy. Ocular involvement is classically a bilateral, non-purulent conjunctivitis. First-line therapy is IVIG (2 g/kg over 10-12 hours) and high-dose oral aspirin (80-100 mg/kg/day) to prevent coronary artery aneurysms.
*   **B (Adenoviral PCF)** presents with fever, sore throat, and follicular conjunctivitis, but does not present with strawberry tongue, extremity changes, or rash.
*   **C (Scarlet fever)** presents with pharyngitis, strawberry tongue, and a sandpaper-like rash, but is not typically associated with high-dose steroid-resistant fever and bilateral conjunctival injection of this pattern.
*   **D (Measles)** presents with the 3 Cs (cough, coryza, conjunctivitis), Koplik spots, and a rash that starts on the face and spreads down, but does not have the extremity changes of Kawasaki.
*   **E (TSS)** presents with hypotension and multi-organ failure.'),
    (v_case_id, 'What is the most common intraocular inflammatory complication that can occur in the acute phase of this disease?', '["Mild anterior uveitis.", "Necrotizing scleritis.", "Retinal vasculitis.", "Corneal ulceration.", "Optic neuritis."]'::jsonb, 0, 'Although conjunctival injection is the most common ocular finding in Kawasaki disease, approximately 80% of patients can develop a mild, transient, bilateral non-granulomatous anterior uveitis during the acute phase. It is usually self-limiting and resolves without treatment, but may require low-dose topical steroids.
*   **B (Scleritis)**, **C (Retinal vasculitis)**, **D (Corneal ulceration)**, and **E (Optic neuritis)** are not typical complications of Kawasaki disease.');

    ---------------------------------------------------------------------------
    -- CASE 49: The Welder with a Deep Eye Injury
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Welder with a Deep Eye Injury' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Welder with a Deep Eye Injury', 'A 28-year-old male is brought to the clinic by his co-workers after a "flying piece of metal" hit his left eye while he was hammering steel without safety goggles. He reports immediate pain, redness, and a sudden drop in vision.

**Physical Examination:**
*   **Visual Acuity:** OS: 20/400; OD: 20/20
*   **Ocular Examination (OS):** Significant conjunctival injection with a localized subconjunctival hemorrhage. Slit-lamp exam reveals a tiny, self-sealing wound in the cornea at the 2 o''clock position. The anterior chamber is shallow compared to the right eye. The pupil is irregular and peak-shaped, pointing toward the corneal wound. There is a small hyphema (blood in the anterior chamber) measuring 1.0 mm.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old male is brought to the clinic by his co-workers after a "flying piece of metal" hit his left eye while he was hammering steel without safety goggles. He reports immediate pain, redness, and a sudden drop in vision.

**Physical Examination:**
*   **Visual Acuity:** OS: 20/400; OD: 20/20
*   **Ocular Examination (OS):** Significant conjunctival injection with a localized subconjunctival hemorrhage. Slit-lamp exam reveals a tiny, self-sealing wound in the cornea at the 2 o''clock position. The anterior chamber is shallow compared to the right eye. The pupil is irregular and peak-shaped, pointing toward the corneal wound. There is a small hyphema (blood in the anterior chamber) measuring 1.0 mm.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most appropriate next step in the management of this patient?', '["Place a rigid eye shield over the left eye, schedule an urgent CT scan of the orbit (no MRI), and consult ophthalmology immediately.", "Perform an immediate MRI of the brain and orbit to locate the metal fragment.", "Check intraocular pressure using a Goldmann applanation tonometer.", "Instill topical cyclopentolate drops and place a tight pressure patch.", "Irrigate the eye with saline for 30 minutes to wash out any foreign matter."]'::jsonb, 0, 'This patient has a ruptured globe/penetrating ocular injury with a retained intraocular foreign body (IOFB). Classic signs of a ruptured globe include: a history of metal-on-metal trauma, visual loss, a shallow anterior chamber, a peaked pupil (pointing to the site of perforation), and a hyphema. The initial management is to protect the eye from any external pressure (which could cause extrusion of intraocular contents) by placing a rigid metal eye shield (e.g., Fox shield). Do *not* patch, manipulate the eye, check IOP, or irrigate. Imaging is required to locate the foreign body: a CT of the orbit is the modality of choice. An MRI is strictly contraindicated because the foreign body is metallic and a magnetic field could move the fragment, causing catastrophic intraocular damage.
*   **B (MRI)** is contraindicated due to the metallic nature of the foreign body.
*   **C (IOP check)** is contraindicated because pressure on the globe can cause extrusion of intraocular tissues.
*   **D (Pressure patch)** is contraindicated for the same reason.
*   **E (Irrigation)** is contraindicated as it can introduce pathogens and wash out intraocular contents.'),
    (v_case_id, 'What is the primary long-term toxic complication of a retained iron-containing intraocular foreign body if it is not surgically removed?', '["Siderosis bulbi.", "Chalcosis.", "Argyrosis.", "Chrysiasis.", "Plumbism."]'::jsonb, 0, 'Siderosis bulbi is the term for the toxic degenerative changes that occur in the eye due to the dissociation and deposition of iron from a retained metallic foreign body. Iron ions are toxic to intraocular tissues, leading to iris heterochromia, pupillary dilation, cataract, pigmentary retinopathy, and progressive loss of vision.
*   **B (Chalcosis)** is the toxic effect of a retained copper foreign body.
*   **C (Argyrosis)** is silver deposition.
*   **D (Chrysiasis)** is gold deposition.
*   **E (Plumbism)** is systemic lead poisoning.');

    ---------------------------------------------------------------------------
    -- CASE 50: Painless Bilateral Blindness in an Elderly Patient
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Painless Bilateral Blindness in an Elderly Patient' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Painless Bilateral Blindness in an Elderly Patient', 'A 78-year-old female presents with chronic, progressive, painless loss of vision in both eyes over the past 5 years. She has no pain, redness, or discharge.

**Physical Examination:**
*   **Visual Acuity:** OU: Count Fingers (CF) at 3 feet.
*   **Ocular Examination (Bilateral):** The eyes are quiet and white. Slit-lamp exam reveals mature, dense, nuclear sclerotic cataracts (brownish lenses) in both eyes. The anterior chambers are deep, and there is no cell or flare. Optic nerve head evaluation shows a normal cup-to-disc ratio (0.3) in both eyes, and the macula/retina are normal for age.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 78-year-old female presents with chronic, progressive, painless loss of vision in both eyes over the past 5 years. She has no pain, redness, or discharge.

**Physical Examination:**
*   **Visual Acuity:** OU: Count Fingers (CF) at 3 feet.
*   **Ocular Examination (Bilateral):** The eyes are quiet and white. Slit-lamp exam reveals mature, dense, nuclear sclerotic cataracts (brownish lenses) in both eyes. The anterior chambers are deep, and there is no cell or flare. Optic nerve head evaluation shows a normal cup-to-disc ratio (0.3) in both eyes, and the macula/retina are normal for age.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is the most likely diagnosis, and what is the appropriate treatment?', '["Age-related cataracts; Elective cataract extraction with intraocular lens (IOL) implantation.", "Primary open-angle glaucoma; Topical timolol 0.5% drops.", "Dry macular degeneration; Daily AREDS 2 vitamins.", "Chronic anterior uveitis; Topical prednisolone acetate 1% drops.", "Exposure keratitis; Lateral tarsorrhaphy."]'::jsonb, 0, 'This is a classic case of bilateral age-related (senile) cataracts. Cataracts cause progressive, painless loss of vision, glare, and loss of contrast sensitivity. The slit-lamp exam reveals dense nuclear sclerosis, which accounts for the visual decline. The posterior segment (optic nerve and macula) is healthy. The definitive treatment is elective cataract extraction (phacoemulsification) followed by the implantation of a prosthetic intraocular lens (IOL).
*   **B (Glaucoma)** would present with optic nerve cupping and visual field deficits, which are not present here.
*   **C (AMD)** would show drusen or pigmentary changes in the macula, which is described as normal.
*   **D (Uveitis)** would present with cells and flare in the anterior chamber, which is quiet.
*   **E (Exposure keratitis)** presents with corneal staining, not clear corneas and cataracts.'),
    (v_case_id, 'The development of age-related cataracts is primarily driven by which of the following molecular mechanisms within the lens?', '["Oxidative damage leading to the aggregation of insoluble crystallin proteins.", "Glycosaminoglycan accumulation in the extracellular matrix.", "Bacterial colonization of the lens cortex.", "Immune-mediated destruction of the lens epithelium.", "Deposition of amyloid fibrils in the lens capsule."]'::jsonb, 0, 'The lens of the eye is composed of highly ordered proteins called crystallins, which maintain lens transparency. With age, cumulative oxidative stress, UV radiation, and enzymatic changes lead to the denaturation and cross-linking of these crystallin proteins into insoluble aggregates. These aggregates scatter light, leading to the loss of transparency (opacification/cataract).
*   **B (Glycosaminoglycans)**, **C (Bacterial colonization)**, **D (Immune-mediated)**, and **E (Amyloid)** are not the primary mechanisms of age-related nuclear cataracts.');

END $$;
COMMIT;
