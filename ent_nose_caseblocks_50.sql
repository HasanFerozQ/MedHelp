-- ENT (Otolaryngology): Nose — sinusitis, epistaxis, allergic rhinitis
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: ent-nose
-- Sourced/Inspired by: Cummings, Scott-Brown, Bailey, Lalwani

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ent-nose' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'ent-nose';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Acute Rhinosinusitis (Viral vs Bacterial)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Lingering Cold' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Lingering Cold', 'A 28-year-old female presents with 11 days of facial pressure, nasal congestion, and yellow nasal discharge. She initially felt better on day 5, but her symptoms returned with greater severity on day 8 ("double sickening").

Vitals: Temp 100.2°F, HR 88 bpm.
Physical Examination: Tenderness over the maxillary sinuses. Anterior rhinoscopy shows purulent discharge in the middle meatus.
Laboratory Results: Normal WBC.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Acute Rhinosinusitis; >10 days of symptoms or "double sickening" suggesting bacterial etiology.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of acute rhinosinusitis?', '["Viruses (Rhinovirus, Influenza)", "Streptococcus pneumoniae", "Staphylococcus aureus", "Fungi"]', 0, 'The vast majority of acute rhinosinusitis cases are viral. Bacterial infection is suspected if symptoms last >10 days, are severe, or follow a "double sickening" pattern.'),
    (v_case_id, 'Which of the following is a "major" symptom of rhinosinusitis according to clinical guidelines?', '["Facial pain/pressure", "Headache", "Ear pain", "Cough"]', 0, 'Major symptoms include facial pain/pressure, nasal obstruction, purulent discharge, and hyposmia/anosmia.'),
    (v_case_id, 'What is the first-line antibiotic for Acute Bacterial Rhinosinusitis (ABRS)?', '["Amoxicillin-Clavulanate", "Azithromycin", "Ciprofloxacin", "Clindamycin"]', 0, 'Amoxicillin-Clavulanate is now preferred over Amoxicillin alone to cover beta-lactamase producing H. influenzae and M. catarrhalis.');

    ---------------------------------------------------------------------------
    -- CASE 02: Chronic Rhinosinusitis without Polyps (CRSsNP)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Constant Clog' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Constant Clog', 'A 45-year-old male complains of bilateral nasal obstruction, facial pressure, and post-nasal drip that has persisted for 5 months. He has failed multiple courses of antibiotics.

Vitals: Stable.
Physical Examination: Nasal endoscopy shows mucosal edema and purulent drainage in the middle meatus. No polyps are seen.
Laboratory Results: CT of the paranasal sinuses shows opacification of the ethmoid and maxillary sinuses with osteomeatal complex (OMC) obstruction.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Chronic Rhinosinusitis (>12 weeks); OMC obstruction on CT.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the minimum duration of symptoms required to diagnose Chronic Rhinosinusitis (CRS)?', '["4 weeks", "8 weeks", "12 weeks", "6 months"]', 2, 'CRS is defined by at least 12 weeks of symptoms plus objective evidence of inflammation (endoscopy or CT).'),
    (v_case_id, 'What is the "Osteomeatal Complex" (OMC)?', '["A bone in the nose", "The functional unit where the frontal, ethmoid, and maxillary sinuses drain into the middle meatus", "A nerve plexus", "None"]', 1, 'Obstruction of the OMC is a key factor in the development of CRS.'),
    (v_case_id, 'Medical management for CRS typically includes:', '["Daily saline irrigations and topical nasal steroids", "Long-term IV antibiotics", "Antihistamines only", "None"]', 0, 'Saline and topical steroids are the cornerstones of CRS therapy to reduce mucosal inflammation.');

    ---------------------------------------------------------------------------
    -- CASE 03: Chronic Rhinosinusitis with Polyps (CRSwNP)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Nasal Grapes' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Nasal Grapes', 'A 38-year-old female presents with severe nasal obstruction and a complete loss of smell (anosmia). She also has a history of adult-onset asthma.

Vitals: Stable.
Physical Examination: Nasal endoscopy reveals multiple translucent, grayish-white, grape-like masses originating from the middle meatus and filling the nasal cavity bilaterally.
Laboratory Results: CT shows pan-sinus opacification and expansion of the ethmoid sinuses.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'CRSwNP; anosmia and adult-onset asthma.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "Samter''s Triad" (Aspirin-Exacerbated Respiratory Disease)?', '["Sinusitis, Fever, Rash", "Nasal polyps, Asthma, and Aspirin sensitivity", "Epistaxis, Polyps, Anosmia", "None"]', 1, 'These patients often have severe, recurrent polyposis and aggressive asthma.'),
    (v_case_id, 'Which type of cell is typically dominant in the inflammatory infiltrate of nasal polyps in Western countries?', '["Neutrophils", "Eosinophils", "Lymphocytes", "Macrophages"]', 1, 'Nasal polyps are generally characterized by a Th2-mediated eosinophilic inflammation.'),
    (v_case_id, 'If polyps are seen in a young child, which condition must be ruled out?', '["Allergies", "Cystic Fibrosis", "Diabetes", "Common cold"]', 1, 'Nasal polyps in children are rare and highly suggestive of Cystic Fibrosis.');

    ---------------------------------------------------------------------------
    -- CASE 04: Acute Invasive Fungal Sinusitis (Mucormycosis)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Black Eschar' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Black Eschar', 'A 50-year-old male with poorly controlled diabetes and ketoacidosis (DKA) presents with sudden onset of facial pain, swelling, and vision changes.

Vitals: Temp 102.1°F, BP 110/70.
Physical Examination: Proptosis (bulging eye) and ophthalmoplegia (restricted eye movement) on the left side. Endoscopy shows a dry, black eschar on the left middle turbinate.
Laboratory Results: Blood glucose 450 mg/dL, positive ketones in urine.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Acute Invasive Fungal Sinusitis in DKA; black eschar and orbital involvement.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the hallmark endoscopic finding in Acute Invasive Fungal Sinusitis?', '["Pus", "Nasal polyps", "Necrosis/Black eschar due to vascular invasion", "Yellow crusts"]', 2, 'The fungus (Mucor or Aspergillus) invades blood vessels, causing thrombosis and tissue necrosis.'),
    (v_case_id, 'What is the first step in the management of this patient?', '["Oral antibiotics", "Urgent surgical debridement and systemic Amphotericin B", "Wait for culture results", "None"]', 1, 'This is a surgical emergency with high mortality; immediate debridement is essential.'),
    (v_case_id, 'Which patients are at highest risk for invasive fungal sinusitis?', '["Healthy athletes", "Immunocompromised patients (Neutropenia, uncontrolled Diabetes, Transplant recipients)", "Allergic individuals", "None"]', 1, 'The fungus takes advantage of weakened immune defenses or acidic environments (like DKA).');

    ---------------------------------------------------------------------------
    -- CASE 05: Allergic Fungal Rhinosinusitis (AFRS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Peanut Butter Mucus' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Peanut Butter Mucus', 'A 24-year-old male with a history of severe allergies presents with worsening unilateral nasal obstruction and proptosis.

Vitals: Stable.
Physical Examination: Thick, "peanut butter-like" material is suctioned from the nasal cavity.
Laboratory Results: CT shows heterogeneous opacification with "hyperdense" signals. Total IgE is markedly elevated. Pathology shows "allergic mucin" with Charcot-Leyden crystals and rare fungal hyphae.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'AFRS; hyperdense CT signals, allergic mucin with fungal hyphae.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the pathophysiology of AFRS?', '["Invasive fungal infection", "Type I and Type III hypersensitivity response to non-invasive fungal elements", "Bacterial superinfection", "None"]', 1, 'It is an allergic reaction to fungi, not an infection of the tissue itself.'),
    (v_case_id, 'What is the classic CT appearance of AFRS?', '["Complete opacification", "Heterogeneous densities with \"hyperdense\" (bright) areas due to heavy metal ions produced by fungi", "Normal", "None"]', 1, 'These hyperdense signals are very characteristic of AFRS.'),
    (v_case_id, 'Treatment for AFRS often includes:', '["Long-term IV antifungal therapy", "Surgical removal of all mucin and polyps, followed by topical/systemic steroids", "Antibiotics only", "None"]', 1, 'Surgery to "clear the allergen" is necessary, combined with aggressive medical management.');

    ---------------------------------------------------------------------------
    -- CASE 06: Orbital Cellulitis (Chandler Stage II/III)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Swollen Eye' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Swollen Eye', 'A 9-year-old male with a 1-week history of sinusitis develops swelling and redness of the left eyelid.

Vitals: Temp 101.5°F.
Physical Examination: Left eyelid is swollen and red (proptosis). He has pain with eye movement, but his vision and pupillary response are normal.
Laboratory Results: CT shows a subperiosteal abscess (SPA) along the medial orbital wall.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Orbital Cellulitis/Subperiosteal Abscess; complication of ethmoid sinusitis.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which sinus is most commonly associated with orbital complications?', '["Maxillary", "Ethmoid (via the lamina papyracea)", "Frontal", "Sphenoid"]', 1, 'The thin bone separating the ethmoids from the orbit (lamina papyracea) allows for easy spread of infection.'),
    (v_case_id, 'How do you distinguish pre-septal from orbital cellulitis?', '["Pre-septal has no fever", "Orbital cellulitis involves pain with eye movement, proptosis, or vision changes", "Pre-septal involves the eyeball", "None"]', 1, 'Pre-septal involves only the skin of the eyelid.'),
    (v_case_id, 'What is the next step for a large subperiosteal abscess with vision changes?', '["Observation", "Urgent surgical drainage (Endoscopic or External)", "Oral antibiotics", "None"]', 1, 'Pressure on the optic nerve or its blood supply is a surgical emergency.');

    ---------------------------------------------------------------------------
    -- CASE 07: Pott''s Puffy Tumor
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Forehead Lump' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Forehead Lump', 'A 16-year-old male presents with a tender, fluctuant swelling on his forehead following a recent bout of frontal sinusitis.

Vitals: Temp 101.8°F.
Physical Examination: Swelling over the frontal bone. Tenderness and erythema.
Laboratory Results: CT shows frontal bone osteomyelitis with a subperiosteal abscess.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pott''s Puffy Tumor; frontal bone osteomyelitis.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "Pott''s Puffy Tumor"?', '["A malignant brain tumor", "Frontal bone osteomyelitis with associated subperiosteal abscess", "A type of skin cyst", "None"]', 1, 'It is a complication of frontal sinusitis, often spreading via diploic veins.'),
    (v_case_id, 'What is a major intracranial risk associated with Pott''s Puffy Tumor?', '["Hearing loss", "Epidural or subdural empyema", "Vision loss", "None"]', 1, 'Infection can easily spread through the posterior wall of the frontal sinus into the brain.'),
    (v_case_id, 'Management of Pott''s Puffy Tumor involves:', '["Oral antibiotics only", "Surgical debridement and long-term IV antibiotics", "Radiation", "None"]', 1, 'Infected bone and abscess must be addressed surgically.');

    ---------------------------------------------------------------------------
    -- CASE 08: Cavernous Sinus Thrombosis (CST)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Symmetrical Eye Crisis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Symmetrical Eye Crisis', 'A patient with severe sphenoid sinusitis develops rapid-onset bilateral eye swelling, proptosis, and high fever.

Vitals: Temp 104.2°F, HR 120 bpm.
Physical Examination: Bilateral chemosis (swelling of the conjunctiva) and paralysis of cranial nerves III, IV, and VI.
Laboratory Results: MRI/MRV confirms thrombosis of the cavernous sinus.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Cavernous Sinus Thrombosis; bilateral orbital symptoms and multiple CN palsies.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which cranial nerves pass through the cavernous sinus?', '["I, II, III", "III, IV, V (V1/V2), and VI", "VII, VIII, IX", "X, XI, XII"]', 1, 'Involvement of these nerves leads to complex ophthalmoplegia and facial numbness.'),
    (v_case_id, 'What is the hallmark of CST compared to orbital cellulitis?', '["Fever", "Rapid progression to bilateral involvement", "Eye pain", "None"]', 1, 'Orbital cellulitis is typically unilateral; CST often spreads to the contralateral side via intercavernous sinuses.'),
    (v_case_id, 'Besides IV antibiotics, what else is often used in the management of CST?', '["Anticoagulation (e.g., Heparin)", "Surgery only", "Aspirin", "None"]', 0, 'Anticoagulation may help prevent further thrombus propagation.');

    ---------------------------------------------------------------------------
    -- CASE 09: Sinonasal Inverted Papilloma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Unilateral Growth' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Unilateral Growth', 'A 55-year-old male presents with progressive unilateral nasal obstruction and occasional epistaxis for 1 year.

Vitals: Stable.
Physical Examination: Nasal endoscopy reveals a fleshy, cauliflower-like mass originating from the lateral nasal wall on the right side.
Laboratory Results: Biopsy shows an inverted papilloma.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Inverted Papilloma; unilateral fleshy mass, risk of SCC.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is unique about the growth pattern of "Inverted Papilloma"?', '["It grows outward", "The surface epithelium grows inward into the underlying stroma", "It is always malignant", "None"]', 1, 'This "inverted" pattern is the characteristic histologic finding.'),
    (v_case_id, 'What is the primary concern with Inverted Papilloma?', '["It causes allergies", "High rate of recurrence and 5-10% risk of associated Squamous Cell Carcinoma", "It is contagious", "None"]', 1, 'Complete surgical excision is required because of these risks.'),
    (v_case_id, 'Where do most inverted papillomas originate?', '["The septum", "The lateral nasal wall (near the middle turbinate/ethmoids)", "The floor of the nose", "None"]', 1, 'They typically arise from the lateral wall or within the sinuses.');

    ---------------------------------------------------------------------------
    -- CASE 10: Antrochoanal Polyp
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Choanal Obstruction' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Choanal Obstruction', 'A 15-year-old boy has significant difficulty breathing through his right nostril. He feels a mass "moving" when he swallows.

Vitals: Stable.
Physical Examination: Endoscopy shows a single large polypoid mass extending from the middle meatus back into the nasopharynx (choana).
Laboratory Results: CT shows opacification of the right maxillary sinus and a mass extending through a widened accessory ostium into the nasopharynx.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Antrochoanal Polyp; unilateral, originating from maxillary sinus.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is an "Antrochoanal Polyp"?', '["A polyp in the brain", "A single polyp that arises from the maxillary sinus antrum and extends into the choana", "A type of cancer", "None"]', 1, 'Unlike inflammatory polyps, these are typically unilateral and solitary.'),
    (v_case_id, 'What is the standard treatment for an Antrochoanal Polyp?', '["Nasal sprays", "Endoscopic surgical excision including the attachment in the maxillary sinus", "Antibiotics", "None"]', 1, 'Simple removal of the nasal portion often leads to recurrence; the "root" in the sinus must be addressed.'),
    (v_case_id, 'True or False: Antrochoanal polyps are usually associated with allergies.', '["True", "False"]', 1, 'Unlike bilateral polyposis, these are usually not related to atopy.');

    ---------------------------------------------------------------------------
    -- CASE 11: Isolated Sphenoid Sinusitis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Deep Headache' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Deep Headache', 'A 50-year-old female complains of a deep-seated "vertex" headache that is not relieved by common analgesics. She has no nasal discharge or congestion.

Vitals: Stable.
Physical Examination: Nasal endoscopy is surprisingly normal.
Laboratory Results: CT scan shows complete opacification of the sphenoid sinus.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Isolated Sphenoid Sinusitis; vertex headache, normal endoscopy.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where is the headache typically localized in sphenoid sinusitis?', '["Forehead", "Cheeks", "Vertex (top of the head) or behind the eyes", "Teeth"]', 2, 'The location of the sphenoid sinus deep in the skull base leads to vertex or retro-orbital pain.'),
    (v_case_id, 'Why is isolated sphenoid sinusitis potentially dangerous?', '["It causes hearing loss", "Proximity to the optic nerve, cavernous sinus, and carotid artery", "It leads to tooth decay", "None"]', 1, 'Infection or inflammation can spread to these critical structures.'),
    (v_case_id, 'If medical therapy fails, which surgical procedure is performed?', '["Septoplasty", "Sphenoidotomy", "Tonsillectomy", "None"]', 1, 'Opening and draining the sphenoid sinus is the definitive treatment.');

    ---------------------------------------------------------------------------
    -- CASE 12: Silent Sinus Syndrome
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sunken Eye' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sunken Eye', 'A 35-year-old male presents with a "sunken" appearance of his left eye. He has no history of trauma or sinus pain.

Vitals: Stable.
Physical Examination: Enophthalmos (sunken eye) and hypoglobus (downward displacement of the eye) on the left side.
Laboratory Results: CT shows a collapsed left maxillary sinus with "implosion" of the orbital floor into the sinus cavity.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Silent Sinus Syndrome; enophthalmos due to maxillary sinus collapse.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the hypothesized mechanism of Silent Sinus Syndrome?', '["Active infection", "Chronic negative pressure in the maxillary sinus due to ostial obstruction, leading to bone remodeling and collapse", "Tumor", "None"]', 1, 'The "silent" nature refers to the lack of typical sinusitis symptoms.'),
    (v_case_id, 'What is the classic CT finding?', '["Thickened bone", "Maxillary sinus hypoplasia with downward bowing of the orbital floor", "Polyp", "None"]', 1, 'The orbital floor collapses due to the vacuum effect in the sinus.'),
    (v_case_id, 'Treatment for Silent Sinus Syndrome involves:', '["Antibiotics only", "Functional Endoscopic Sinus Surgery (FESS) to ventilate the sinus, often followed by orbital floor repair", "Eye drops", "None"]', 1, 'Opening the sinus halts the negative pressure; the orbit may require reconstruction if displacement is significant.');

    ---------------------------------------------------------------------------
    -- CASE 13: Rhinitis Medicamentosa
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Afrin Addiction' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Afrin Addiction', 'A 30-year-old male presents with severe nasal congestion that only improves for 1 hour after using an over-the-counter nasal spray. He has been using the spray 6 times a day for 3 months.

Vitals: Stable.
Physical Examination: Nasal mucosa is extremely beefy, red, and swollen.
Laboratory Results: Normal.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Rhinitis Medicamentosa; rebound congestion from topical decongestant overuse.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the cause of Rhinitis Medicamentosa?', '["Allergies", "Overuse of topical vasoconstrictors (e.g., Oxymetazoline/Afrin)", "Bacterial infection", "None"]', 1, 'Downregulation of alpha-adrenergic receptors leads to rebound vasodilation.'),
    (v_case_id, 'What is the maximum recommended duration for using topical nasal decongestants?', '["1 day", "3-5 days", "2 weeks", "1 month"]', 1, 'Prolonged use beyond 5 days carries a high risk of rebound congestion.'),
    (v_case_id, 'What is the treatment for Rhinitis Medicamentosa?', '["More Afrin", "Discontinuation of the spray and starting topical nasal steroids", "Surgery", "None"]', 1, 'A "weaning" approach or starting steroids helps manage the transition period.');

    ---------------------------------------------------------------------------
    -- CASE 14: Anterior Epistaxis (Kiesselbach''s Plexus)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Nose Picker' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Nose Picker', 'A 7-year-old male presents with recurrent episodes of bleeding from the right nostril, usually after waking up. His mother admits he often picks his nose.

Vitals: Stable.
Physical Examination: A prominent, superficial vessel is seen on the anterior right nasal septum. No active bleeding.
Laboratory Results: Normal CBC and coagulation studies.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Anterior Epistaxis; Kiesselbach''s plexus vessel irritation.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where is the most common site for anterior epistaxis?', '["Middle meatus", "Kiesselbach''s plexus (Little''s area) on the anterior septum", "Woodruff''s plexus", "None"]', 1, 'This area has a rich anastomosis of five different arteries.'),
    (v_case_id, 'Which of the following arteries is NOT part of Kiesselbach''s plexus?', '["Superior labial", "Sphenopalatine", "Anterior ethmoid", "Internal carotid artery (directly)"]', 3, 'The plexus is fed by branches of the sphenopalatine, ethmoids, superior labial, and greater palatine arteries.'),
    (v_case_id, 'First-line treatment for a visible bleeding vessel in anterior epistaxis:', '["Intubation", "Silver nitrate cautery or topical vasoconstrictors", "Posterior packing", "Surgery"]', 1, 'Cautery is highly effective for localized anterior bleeding.');

    ---------------------------------------------------------------------------
    -- CASE 15: Posterior Epistaxis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Unstoppable Bleed' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Unstoppable Bleed', 'A 72-year-old male with hypertension presents with severe bleeding from both nostrils and down the back of his throat. He is spitting up large amounts of blood. Pressure applied to the nose has failed to stop it.

Vitals: BP 190/110, HR 105 bpm.
Physical Examination: Active bleeding is seen coming from the posterior nasal cavity. Anterior cautery is unsuccessful.
Laboratory Results: Hemoglobin 10.5 (baseline 13).', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Posterior Epistaxis; severe bleeding, Woodruff''s plexus involvement.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where is the most common site for posterior epistaxis?', '["Kiesselbach''s", "Woodruff''s plexus (posterior to the inferior turbinate)", "Frontal sinus", "None"]', 1, 'Posterior bleeds are usually arterial (Sphenopalatine artery) and more difficult to control.'),
    (v_case_id, 'Why is posterior packing associated with more complications than anterior packing?', '["It is more comfortable", "Risk of hypoxia, myocardial infarction, and \"nasopulmonary reflex\"", "It is cheaper", "None"]', 1, 'Posterior packing is distressing and requires close monitoring, often in the ICU.'),
    (v_case_id, 'If packing fails to control a posterior bleed, what is the next surgical step?', '["Tonsillectomy", "Sphenopalatine Artery (SPA) Ligation", "Septoplasty", "None"]', 1, 'SPA ligation via an endoscopic approach is the gold standard for refractory posterior epistaxis.');

    ---------------------------------------------------------------------------
    -- CASE 16: Juvenile Nasopharyngeal Angiofibroma (JNA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Teenage Bleeder' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Teenage Bleeder', 'A 14-year-old male presents with recurrent, massive episodes of epistaxis from the left nostril and progressive nasal obstruction.

Vitals: Stable.
Physical Examination: A reddish-purple, fleshy mass is seen in the left nasal cavity and nasopharynx.
Laboratory Results: CT shows a mass in the pterygopalatine fossa with "Holman-Miller sign" (anterior bowing of the posterior maxillary wall).', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'JNA; adolescent male, massive epistaxis, Holman-Miller sign.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'JNA is most commonly found in which demographic?', '["Elderly women", "Adolescent males", "Infants", "None"]', 1, 'It is a testosterone-dependent, benign but locally aggressive vascular tumor.'),
    (v_case_id, 'Why is biopsy of a suspected JNA contraindicated in the office?', '["It is too painful", "Risk of catastrophic, life-threatening hemorrhage", "It is not needed for diagnosis", "None"]', 1, 'The tumor is extremely vascular and lacks a true capsule.'),
    (v_case_id, 'What is the Holman-Miller sign?', '["A type of rash", "Anterior bowing of the posterior wall of the maxillary sinus on imaging", "Loss of hearing", "None"]', 1, 'This indicates the tumor is originating from or involving the pterygopalatine fossa.');

    ---------------------------------------------------------------------------
    -- CASE 17: Hereditary Hemorrhagic Telangiectasia (HHT)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Red Spots' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Red Spots', 'A 40-year-old male presents with lifelong recurrent epistaxis. His father also had severe nosebleeds.

Vitals: Stable.
Physical Examination: Multiple small, red, blanching telangiectasias are seen on the nasal mucosa, lips, and tongue.
Laboratory Results: Hemoglobin 9.0 (Chronic iron deficiency anemia).', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'HHT (Osler-Weber-Rendu); telangiectasias and recurrent epistaxis.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the inheritance pattern of HHT?', '["Autosomal dominant", "Autosomal recessive", "X-linked", "None"]', 0, 'HHT is an autosomal dominant disorder of blood vessel formation.'),
    (v_case_id, 'Patients with HHT are at risk for Arteriovenous Malformations (AVMs) in which organs?', '["Lungs, Brain, and Liver", "Skin only", "Muscles", "None"]', 0, 'Visceral AVMs are a major cause of morbidity and mortality in HHT.'),
    (v_case_id, 'What is "Young''s Procedure" used for in severe HHT epistaxis?', '["Removing the nose", "Surgical closure of the nostrils (septectomy/closure) to prevent air-induced trauma", "Cautery", "None"]', 1, 'Closing the nostrils prevents the dry air from irritating the fragile telangiectasias.');

    ---------------------------------------------------------------------------
    -- CASE 18: Allergic Rhinitis (Intermittent)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Spring Sneezer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Spring Sneezer', 'A 19-year-old college student complains of paroxysms of sneezing, itchy eyes, and clear runny nose every spring.

Vitals: Stable.
Physical Examination: Pale, bluish/boggy turbinates and "allergic shiners" (infraorbital darkening). A transverse crease is seen on the lower nose (allergic salute).
Laboratory Results: Eosinophils on nasal smear.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Allergic Rhinitis; boggy turbinates, allergic shiners.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the pathophysiology of Allergic Rhinitis?', '["IgG-mediated", "IgE-mediated (Type I) hypersensitivity to inhaled allergens", "Bacterial", "None"]', 1, 'Sensitization to allergens leads to mast cell degranulation upon re-exposure.'),
    (v_case_id, 'What is the first-line medical therapy for moderate-to-severe allergic rhinitis?', '["Oral antihistamines", "Intranasal corticosteroids (e.g., Fluticasone)", "Antibiotics", "Nasal decongestants"]', 1, 'Topical steroids are the most effective treatment for the "congestion" component.'),
    (v_case_id, 'What is the "Allergic Salute"?', '["A type of wave", "Frequent upward rubbing of the nose due to itching, causing a transverse crease", "Sneezing", "None"]', 1, 'This is a classic physical sign in pediatric allergy patients.');

    ---------------------------------------------------------------------------
    -- CASE 19: Vasomotor Rhinitis (Non-allergic)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Temperature Trigger' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Temperature Trigger', 'A 50-year-old female complains of a sudden runny nose whenever she eats spicy food or moves from a warm room to cold air. Allergy testing is negative.

Vitals: Stable.
Physical Examination: Nasal mucosa appears normal or mildly congested.
Laboratory Results: Negative skin prick testing for allergens.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Vasomotor Rhinitis; hyper-responsiveness to non-allergic triggers.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is Vasomotor Rhinitis?', '["An allergy to water", "Non-allergic, non-infectious nasal hyper-responsiveness to environmental triggers", "A cold", "None"]', 1, 'Triggers include temperature changes, strong odors, and spicy foods.'),
    (v_case_id, 'Which medication is particularly effective for the profuse rhinorrhea (runny nose) seen in vasomotor rhinitis?', '["Topical Ipratropium bromide", "Oral Prednisone", "Aspirin", "None"]', 0, 'Ipratropium is an anticholinergic that specifically blocks the watery discharge.'),
    (v_case_id, 'How does the nasal mucosa in vasomotor rhinitis typically differ from allergic rhinitis?', '["It is more pale", "It is usually more erythematous (red) or normal, rather than pale/boggy", "It is black", "None"]', 1, 'The appearance is less "allergic" and more "reactive."');

    ---------------------------------------------------------------------------
    -- CASE 20: Septal Hematoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Purple Bulge' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Purple Bulge', 'A 10-year-old boy fell and hit his nose on the playground 2 hours ago. He now has complete nasal obstruction.

Vitals: Stable.
Physical Examination: A symmetric, fluctuant, purple/red bulge is seen on both sides of the anterior septum.
Laboratory Results: Normal.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Septal Hematoma; medical emergency to prevent saddle nose deformity.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate management for a septal hematoma?', '["Observation and ice", "Urgent incision and drainage (I\u0026D) followed by nasal packing", "Antibiotics only", "X-ray"]', 1, 'Pressure from the hematoma causes ischemic necrosis of the septal cartilage within hours.'),
    (v_case_id, 'What is a "Saddle Nose Deformity"?', '["A large nose", "Collapse of the nasal bridge due to septal cartilage loss", "A broken nose", "None"]', 1, 'This is the permanent cosmetic result of an untreated septal hematoma or abscess.'),
    (v_case_id, 'Why are children at higher risk for septal hematoma after minor trauma?', '["They have more blood vessels", "The septal cartilage is thicker and more easily sheared from the perichondrium", "They pick their noses", "None"]', 1, 'Pediatric nasal trauma should always be screened for hematoma.');

    ---------------------------------------------------------------------------
    -- CASE 21: Septal Perforation (Wegener''s / GPA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Whistling Nose' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Whistling Nose', 'A 45-year-old male complains of a "whistling" sound when he breathes through his nose. He also has persistent bloody crusting and joint pain.

Vitals: Stable.
Physical Examination: A 1 cm through-and-through hole is seen in the cartilaginous septum.
Laboratory Results: Positive c-ANCA (PR3-ANCA). Urinalysis shows hematuria.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Septal Perforation due to Granulomatosis with Polyangiitis (GPA).', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are common causes of septal perforation?', '["Cocaine abuse", "Previous nasal surgery", "Autoimmune diseases (e.g., GPA)", "All of the above"]', 3, 'Chronic irritation or vasculitis leads to cartilage death.'),
    (v_case_id, 'Why does a small perforation often "whistle"?', '["Turbulent airflow through the small defect", "Vibrating nose hairs", "It is a sign of infection", "None"]', 0, 'Larger perforations tend to cause crusting and obstruction rather than whistling.'),
    (v_case_id, 'What is the classic laboratory marker for Wegener''s (GPA)?', '["p-ANCA", "c-ANCA (Anti-PR3)", "ANA", "None"]', 1, 'GPA frequently presents with upper and lower respiratory tract involvement plus glomerulonephritis.');

    ---------------------------------------------------------------------------
    -- CASE 22: Nasal Bone Fracture
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bar Fight' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bar Fight', 'A 22-year-old male was punched in the nose. He has a crooked nose and a nosebleed.

Vitals: Stable.
Physical Examination: The nose is deviated to the right. There is crepitus (crunching sensation) on palpation. No septal hematoma is seen.
Laboratory Results: X-ray (optional) shows a fracture of the nasal bones.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Nasal bone fracture; deviation and crepitus.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common facial bone fracture?', '["Mandible", "Nasal bone", "Zygoma", "Orbital floor"]', 1, 'The nasal bones are thin and prominent, making them highly susceptible to trauma.'),
    (v_case_id, 'When is the ideal time to perform a "closed reduction" of a nasal fracture?', '["Immediately (before swelling) or after 5-7 days (after swelling subsides)", "Exactly 2 days later", "Never", "None"]', 0, 'Swelling can obscure the deformity, making accurate reduction difficult between days 2-5.'),
    (v_case_id, 'What must be ruled out in EVERY case of nasal trauma?', '["Broken teeth", "Septal hematoma", "Concussion", "None"]', 1, 'Septal hematoma is a critical miss that leads to saddle nose deformity.');

    ---------------------------------------------------------------------------
    -- CASE 23: CSF Rhinorrhea (Traumatic)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Salty Drip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Salty Drip', 'A 30-year-old male was in a car accident with head trauma. He now has clear, watery fluid dripping from his left nostril, especially when he leans forward. He says it tastes "salty."

Vitals: Stable.
Physical Examination: Clear fluid from the nose. "Halo sign" seen on gauze.
Laboratory Results: Fluid tests positive for Beta-2 Transferrin.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Traumatic CSF Rhinorrhea; salty taste and Beta-2 Transferrin positive.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Halo Sign"?', '["A golden ring around the head", "CSF forms a clear ring around a central drop of blood on gauze", "A type of headache", "None"]', 1, 'This is a bedside test for CSF leakage when mixed with blood.'),
    (v_case_id, 'What is the gold standard lab test to confirm CSF rhinorrhea?', '["Glucose test strips", "Beta-2 Transferrin", "Culture", "None"]', 1, 'Beta-2 transferrin is found only in CSF, perilymph, and vitreous humor.'),
    (v_case_id, 'Initial conservative management for traumatic CSF leak includes:', '["Heavy exercise", "Bed rest with head elevation and avoidance of straining (stool softeners)", "Antibiotics only", "None"]', 1, 'Most traumatic leaks heal spontaneously with reduced intracranial pressure.');

    ---------------------------------------------------------------------------
    -- CASE 24: Nasal Foreign Body (Button Battery)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Emergency Toy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Emergency Toy', 'A 3-year-old girl is brought in because she pushed a "shiny silver circle" into her nose 1 hour ago.

Vitals: Stable.
Physical Examination: A metallic disk is seen in the left nostril.
Laboratory Results: X-ray shows a "double contour" or "step-off" appearance on the lateral view.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Nasal Foreign Body (Button Battery); risk of liquefactive necrosis.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is a button battery in the nose a true emergency?', '["It is a choking hazard", "It causes rapid liquefactive necrosis and septal perforation due to electrical current and leakage", "It is expensive", "None"]', 1, 'Damage can occur within 2-4 hours.'),
    (v_case_id, 'What should be AVOIDED when trying to remove a button battery?', '["Forceps", "Irrigation (water can accelerate the reaction)", "Suction", "None"]', 1, 'Water reacts with the battery, worsening the chemical burn.'),
    (v_case_id, 'What is the "Double Contour" sign on X-ray?', '["A sign of two batteries", "The characteristic appearance of a button battery (vs. a coin)", "A broken bone", "None"]', 1, 'This sign helps differentiate a battery from a simple coin.');

    ---------------------------------------------------------------------------
    -- CASE 25: Unilateral Foul Discharge (Foreign Body)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Smelly Sneeze' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Smelly Sneeze', 'A 4-year-old male is brought in for a "foul smell" coming from his nose and unilateral thick yellow drainage for 3 days.

Vitals: Stable.
Physical Examination: Foul-smelling, purulent discharge from the right nostril. After suctioning, a small green foam sponge is found.
Laboratory Results: Normal.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Unilateral foul nasal discharge; pathognomonic for foreign body in children.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In a child, unilateral foul-smelling nasal discharge is ______ until proven otherwise.', '["Sinusitis", "Allergies", "A nasal foreign body", "A tumor"]', 2, 'This is a classic "must-know" presentation for medical students.'),
    (v_case_id, 'What is the "Mother''s Kiss" technique for foreign body removal?', '["A type of CPR", "The mother blows into the child''s mouth while occluding the healthy nostril to \"pop\" out the object", "A kiss on the cheek", "None"]', 1, 'This is a safe and often effective first attempt at removal.'),
    (v_case_id, 'What is a "Rhinolith"?', '["A nose bone", "A chronic nasal foreign body that has become calcified over time", "A type of polyp", "None"]', 1, 'Long-standing foreign bodies can act as a nidus for calcium and magnesium salt deposition.');

    ---------------------------------------------------------------------------
    -- CASE 26: Deviated Nasal Septum (DNS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blocked Side' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blocked Side', 'A 42-year-old male presents with lifelong difficulty breathing through his left nostril. He has a history of a childhood injury to the nose.

Vitals: Stable.
Physical Examination: Anterior rhinoscopy shows the nasal septum markedly bowed to the left, contacting the left inferior turbinate. The right nasal cavity shows compensatory hypertrophy of the right inferior turbinate.
Laboratory Results: Normal.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Deviated Nasal Septum; unilateral obstruction, turbinate hypertrophy.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "Compensatory Turbinate Hypertrophy"?', '["The turbinate on the blocked side gets bigger", "The turbinate on the wide/patent side enlarges to regulate airflow and protect the mucosa", "A type of tumor", "None"]', 1, 'The body attempts to narrow the excessively wide side to maintain humidification and airflow resistance.'),
    (v_case_id, 'What is the definitive surgical treatment for a symptomatic deviated septum?', '["Tonsillectomy", "Septoplasty", "Rhinoplasty only", "None"]', 1, 'Septoplasty involves straightening the cartilaginous and bony septum.'),
    (v_case_id, 'True or False: Most adults have some degree of septal deviation, but it is only treated if it causes symptoms.', '["True", "False"]', 0, 'Asymptomatic DNS is a common finding and does not require intervention.');

    ---------------------------------------------------------------------------
    -- CASE 27: Nasal Valve Collapse
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Collapsing Wing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Collapsing Wing', 'A 55-year-old female complains of nasal obstruction that worsens when she breathes in deeply. She finds that pulling her cheek laterally (away from the nose) improves her breathing significantly.

Vitals: Stable.
Physical Examination: Upon inspiration, the lateral nasal wall (alar cartilage) is seen to cave inward. "Cottle Maneuver" (pulling the cheek) is positive.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Nasal Valve Collapse; Cottle maneuver positive.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Nasal Valve"?', '["A muscle", "The narrowest part of the nasal airway, bounded by the septum and the lower border of the upper lateral cartilage", "A valve in the heart", "None"]', 1, 'It is the primary site of resistance in the nasal airway.'),
    (v_case_id, 'What is a positive Cottle maneuver?', '["The patient sneezes", "Manual lateral distraction of the cheek improves nasal airflow", "The patient loses their voice", "None"]', 1, 'A positive test suggests that the nasal valve is the site of obstruction.'),
    (v_case_id, 'Nasal valve collapse is often a complication of which previous surgery?', '["Appendectomy", "Over-aggressive Rhinoplasty (removing too much cartilage support)", "Tonsillectomy", "None"]', 1, 'Weakening of the structural support of the alar sidewalls can lead to dynamic collapse.');

    ---------------------------------------------------------------------------
    -- CASE 28: Rhinophyma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bulbous Nose' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bulbous Nose', 'A 65-year-old male presents with a large, lumpy, red nose that has slowly grown over several years. He is embarrassed by his appearance.

Vitals: Stable.
Physical Examination: The distal nose is bulbous, thickened, and erythematous with prominent sebaceous pores and telangiectasias.
Laboratory Results: Normal.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Rhinophyma; end-stage rosacea.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Rhinophyma is considered the end-stage of which skin condition?', '["Acne", "Rosacea", "Psoriasis", "Eczema"]', 1, 'Specifically, it is the phymatous subtype of rosacea.'),
    (v_case_id, 'What is the histological hallmark of rhinophyma?', '["Skin cancer", "Hypertrophy of sebaceous glands and fibrous tissue", "Infection", "None"]', 1, 'The thickening is due to glandular and soft tissue hyperplasia.'),
    (v_case_id, 'True or False: Rhinophyma is strongly associated with alcoholism ("Rum Blossom").', '["True", "False"]', 1, 'This is a common myth; while alcohol can cause flushing, it is not the cause of rhinophyma.');

    ---------------------------------------------------------------------------
    -- CASE 29: Choanal Atresia (Neonate)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blue Baby' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blue Baby', 'A newborn infant develops cyanosis (blue color) immediately after birth while resting. The cyanosis disappears completely when the baby cries.

Vitals: SpO2 85% at rest, 98% when crying.
Physical Examination: A small catheter cannot be passed through either nostril into the nasopharynx.
Laboratory Results: CT shows bony/membranous obstruction at the posterior choanae.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bilateral Choanal Atresia; cyclical cyanosis relieved by crying.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why does the cyanosis disappear when the baby cries?', '["Crying improves lung function", "Neonates are obligate nasal breathers; crying allows them to breathe through their mouth", "Crying increases heart rate", "None"]', 1, 'At rest, their mouth is closed and the nose is blocked; crying opens the oral airway.'),
    (v_case_id, 'What is the immediate emergency management for bilateral choanal atresia?', '["Immediate surgery", "Placement of an oral airway or McGovern nipple", "Oxygen via nasal cannula", "None"]', 1, 'Establishing an oral airway is the priority until surgical repair can be performed.'),
    (v_case_id, 'Choanal atresia is a key component of which syndrome?', '["Down Syndrome", "CHARGE Syndrome", "DiGeorge Syndrome", "None"]', 1, 'CHARGE: Coloboma, Heart defects, Atresia choanae, Retarded growth, Genitourinary anomalies, Ear anomalies.');

    ---------------------------------------------------------------------------
    -- CASE 30: Nasopharyngeal Carcinoma (NPC)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Silent Neck Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Silent Neck Mass', 'A 45-year-old male of Southern Chinese descent presents with a painless lump in his neck and persistent "clogging" of his right ear.

Vitals: Stable.
Physical Examination: A firm, non-tender Level II neck mass on the right. Otoscopy shows a serous effusion (fluid) in the right middle ear.
Laboratory Results: Nasopharyngeal biopsy shows undifferentiated carcinoma. EBV titers are elevated.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'NPC; neck mass, unilateral OME, EBV association.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which virus is strongly associated with Nasopharyngeal Carcinoma?', '["HPV", "EBV (Epstein-Barr Virus)", "HIV", "Hepatitis B"]', 1, 'EBV is linked particularly to the WHO Type III (undifferentiated) variant.'),
    (v_case_id, 'In an adult with unilateral serous otitis media (OME), what must you always examine?', '["The tonsils", "The nasopharynx (to rule out a tumor obstructing the Eustachian tube)", "The lungs", "None"]', 1, 'Unilateral OME in an adult is a red flag for NPC until proven otherwise.'),
    (v_case_id, 'What is the primary treatment for NPC?', '["Surgery", "Radiotherapy and Chemotherapy", "Antibiotics", "None"]', 1, 'Because of its location and radiosensitivity, radiotherapy is the mainstay of treatment.');

    ---------------------------------------------------------------------------
    -- CASE 31: Olfactory Neuroblastoma (Esthesioneuroblastoma)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Loss of Smell' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Loss of Smell', 'A 50-year-old female presents with progressive loss of smell and unilateral nasal obstruction.

Vitals: Stable.
Physical Examination: A reddish-gray mass is seen high in the nasal vault, originating from the roof of the nose.
Laboratory Results: Pathology shows small round blue cells and "Homer Wright rosettes."', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Olfactory Neuroblastoma; origin from cribriform plate, Homer Wright rosettes.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'From which tissue does an olfactory neuroblastoma arise?', '["Nasal mucosa", "Olfactory epithelium (near the cribriform plate)", "Muscle", "None"]', 1, 'It originates from the specialized sensory cells of the olfactory system.'),
    (v_case_id, 'What is a "Homer Wright Rosette"?', '["A type of flower", "A cluster of tumor cells around a central fibrillar area, seen in neurogenic tumors", "A skin rash", "None"]', 1, 'This is a classic histological feature of neuroblastoma.'),
    (v_case_id, 'What is the Kadish staging system used for?', '["Nasal fractures", "Esthesioneuroblastoma", "Sinusitis", "None"]', 1, 'It stages the tumor based on extension into the nasal cavity, sinuses, and intracranial space.');

    ---------------------------------------------------------------------------
    -- CASE 32: Sinonasal Squamous Cell Carcinoma (SCC)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Erosion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Erosion', 'A 60-year-old male smoker with a history of occupational exposure to wood dust presents with facial pain, unilateral nasal discharge, and a loose upper tooth.

Vitals: Stable.
Physical Examination: Bulging of the cheek and hard palate. Ulcerative mass in the nasal cavity.
Laboratory Results: CT shows an opacified maxillary sinus with destruction of the bony walls.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sinonasal SCC; bone destruction, occupational risks.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common malignancy of the paranasal sinuses?', '["Adenocarcinoma", "Squamous Cell Carcinoma", "Melanoma", "Lymphoma"]', 1, 'SCC accounts for the majority of sinonasal malignancies.'),
    (v_case_id, 'Which occupational exposure is specifically linked to sinonasal Adenocarcinoma?', '["Asbestos", "Hardwood dust", "Nickel", "None"]', 1, 'Woodworkers have a significantly higher risk of developing adenocarcinoma in the ethmoid sinuses.'),
    (v_case_id, 'A "loose tooth" in an adult without periodontal disease should raise suspicion for:', '["Vitamin C deficiency", "Maxillary sinus malignancy eroding the alveolar ridge", "Old age", "None"]', 1, 'Tumors can erode through the sinus floor into the dental roots.');

    ---------------------------------------------------------------------------
    -- CASE 33: Cocaine-Induced Midline Destructive Lesion (CIMDL)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Collapsed Septum' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Collapsed Septum', 'A 30-year-old female presents with severe nasal crusting, frequent nosebleeds, and a "sunken" nasal bridge.

Vitals: Stable.
Physical Examination: Total absence of the nasal septum and destruction of the inferior turbinates.
Laboratory Results: Urine toxicology positive for cocaine. c-ANCA is negative.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'CIMDL; total septal destruction from chronic cocaine use.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does cocaine cause septal destruction?', '["Direct toxic effect", "Intense vasoconstriction leading to chronic ischemia and cartilage necrosis", "Infection", "None"]', 1, ' Cartilage depends on the perichondrium for blood supply; vasoconstriction cuts this off.'),
    (v_case_id, 'Which condition can mimic CIMDL and must be ruled out?', '["Allergies", "Granulomatosis with Polyangiitis (GPA/Wegener''s)", "Common cold", "None"]', 1, 'Both cause midline destruction, but cocaine use and ANCA status help differentiate them.'),
    (v_case_id, 'True or False: Surgical repair of a cocaine-induced perforation should only be attempted after the patient has been clean for at least 6-12 months.', '["True", "False"]', 0, 'Active use will cause any surgical repair to fail immediately.');

    ---------------------------------------------------------------------------
    -- CASE 34: Rhinoscleroma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Woody Nose' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Woody Nose', 'A patient from Central America presents with painless, firm nasal masses that have led to complete nasal obstruction.

Vitals: Stable.
Physical Examination: Firm, non-ulcerated, "woody" masses in the nose and nasopharynx.
Laboratory Results: Biopsy shows "Mikulicz cells" (foamy macrophages containing bacteria).', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Rhinoscleroma; Mikulicz cells, Klebsiella rhinoscleromatis.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative organism of Rhinoscleroma?', '["Streptococcus", "Klebsiella rhinoscleromatis", "Staphylococcus", "Fungus"]', 1, 'It is a chronic granulomatous infection.'),
    (v_case_id, 'What are "Mikulicz cells"?', '["Cancer cells", "Large foamy macrophages containing the causative bacilli", "Nerve cells", "None"]', 1, 'These are the diagnostic pathognomonic histological feature.'),
    (v_case_id, 'Treatment for Rhinoscleroma involves:', '["Immediate surgery", "Long-term antibiotics (e.g., Tetracycline or Ciprofloxacin)", "Steroids only", "None"]', 1, 'Antibiotics are needed to eradicate the organism, though surgery may be needed later for scarring.');

    ---------------------------------------------------------------------------
    -- CASE 35: Rhinosporidiosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Strawberry Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Strawberry Mass', 'A patient from South Asia presents with a friable, "strawberry-like" mass hanging from the nasal septum. He frequently bathes in stagnant pond water.

Vitals: Stable.
Physical Examination: A pedunculated, friable, reddish mass with white spots on the surface.
Laboratory Results: Biopsy shows large sporangia containing thousands of spores.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Rhinosporidiosis; strawberry mass, aquatic exposure.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative agent of Rhinosporidiosis?', '["Rhinosporidium seeberi (an aquatic protist)", "A virus", "A bacteria", "None"]', 0, 'It is traditionally associated with exposure to stagnant water.'),
    (v_case_id, 'What is the characteristic histological finding?', '["Foamy cells", "Large sporangia (up to 300 microns) containing endospores", "Granulomas", "None"]', 1, 'The sporangia are easily visible even at low magnification.'),
    (v_case_id, 'What is the treatment of choice for rhinosporidiosis?', '["Antibiotics", "Surgical excision and cautery of the base", "Antifungals", "None"]', 1, 'Medical therapy is generally ineffective; wide surgical removal is needed.');

    ---------------------------------------------------------------------------
    -- CASE 36: Nasal Dermoid Cyst
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pitted Nose' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pitted Nose', 'A 2-year-old child is noted to have a small pit on the bridge of the nose. Occasionally, a hair is seen sticking out of the pit.

Vitals: Stable.
Physical Examination: A midline pit on the nasal dorsum with a sebaceous-like discharge.
Laboratory Results: Imaging is needed to rule out intracranial extension through the foramen cecum.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Nasal Dermoid; midline pit, risk of intracranial extension.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a Nasal Dermoid Cyst?', '["A skin infection", "A congenital midline lesion containing both ectodermal and mesodermal elements (hair follicles, glands)", "A type of polyp", "None"]', 1, 'It is the most common congenital midline nasal mass.'),
    (v_case_id, 'Why is imaging (CT/MRI) mandatory before biopsying or removing a midline nasal mass?', '["To check for sinus infection", "To rule out intracranial extension/connection to the brain", "To see the bone", "None"]', 1, 'Biopsying a lesion with intracranial connection can lead to a CSF leak or meningitis.'),
    (v_case_id, 'What is the path of possible intracranial extension for nasal dermoids?', '["Through the eye", "Through the foramen cecum near the crista galli", "Through the ear", "None"]', 1, 'This embryological path connects the nasal prenasal space to the dura.');

    ---------------------------------------------------------------------------
    -- CASE 37: Encephalocele (Nasal)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pulsatile Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pulsatile Mass', 'An infant is born with a bluish, soft mass at the bridge of the nose that pulsates when the baby cries.

Vitals: Stable.
Physical Examination: Soft, compressible midline mass. Positive Furstenberg sign.
Laboratory Results: MRI shows herniation of brain tissue and meninges through a skull base defect.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Nasal Encephalocele; herniation of brain tissue, Furstenberg sign.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is an Encephalocele?', '["A tumor", "Herniation of cranial contents (meninges +/- brain) through a defect in the skull", "A cyst", "None"]', 1, 'Nasal encephaloceles can be sincipital (external) or basal (internal).'),
    (v_case_id, 'What is a positive "Furstenberg Sign"?', '["The patient coughs", "Expansion or pulsation of the nasal mass with compression of the internal jugular veins", "The mass disappears", "None"]', 1, 'Compression of the IJV increases intracranial pressure, which is transmitted to the mass if a connection exists.'),
    (v_case_id, 'True or False: Nasal polyps in an infant should always be considered an encephalocele until proven otherwise.', '["True", "False"]', 0, 'True nasal polyps are extremely rare in infants; a mass should be assumed to have an intracranial connection.');

    ---------------------------------------------------------------------------
    -- CASE 38: Nasal Glioma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Non-Pulsatile Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Non-Pulsatile Mass', 'A child presents with a firm, reddish midline nasal mass. It does not pulsate or enlarge when the child cries.

Vitals: Stable.
Physical Examination: Firm, non-compressible mass. Negative Furstenberg sign.
Laboratory Results: Imaging shows sequestered glial tissue with no current intracranial connection.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Nasal Glioma; sequestered glial tissue, no CSF connection.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a Nasal Glioma?', '["A malignant brain tumor", "Sequestered glial tissue that has lost its intracranial connection during development", "A skin tag", "None"]', 1, 'Unlike an encephalocele, it does not typically contain a fluid-filled space connected to the subarachnoid space.'),
    (v_case_id, 'Where are nasal gliomas most commonly located?', '["Inside the nose", "Extranasal (at the bridge of the nose)", "In the ear", "None"]', 1, 'About 60% are extranasal, 30% are intranasal, and 10% are both.'),
    (v_case_id, 'What is the treatment for a nasal glioma?', '["Observation", "Surgical excision", "Radiotherapy", "None"]', 1, 'Excision is needed for diagnosis and to prevent local deformity.');

    ---------------------------------------------------------------------------
    -- CASE 39: Nasal Sarcoidosis
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Lupus Pernio' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Lupus Pernio', 'A 40-year-old African American female presents with purple, indurated skin lesions on her nose and cheeks. She also has a persistent dry cough.

Vitals: Stable.
Physical Examination: Purple-red "lupus pernio" of the nose. Nasal endoscopy shows "strawberry" mucosal punctate nodules.
Laboratory Results: Elevated serum ACE level. Biopsy shows non-caseating granulomas.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Nasal Sarcoidosis; lupus pernio, non-caseating granulomas.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "Lupus Pernio"?', '["A type of systemic lupus", "A characteristic skin finding of sarcoidosis involving purple discoloration of the nose and face", "A fungal infection", "None"]', 1, 'It is often associated with more severe, chronic systemic disease.'),
    (v_case_id, 'What is the classic histological finding in sarcoidosis?', '["Caseating granulomas", "Non-caseating granulomas", "Abscess", "None"]', 1, 'This distinguishes it from tuberculosis (which is caseating).'),
    (v_case_id, 'Which serum marker is often elevated in active sarcoidosis?', '["PSA", "ACE (Angiotensin-Converting Enzyme)", "AFP", "None"]', 1, 'While not perfectly specific, it is a helpful marker for disease activity.');

    ---------------------------------------------------------------------------
    -- CASE 40: Empty Nose Syndrome (ENS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Paradoxical Block' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Paradoxical Block', 'A 45-year-old male who had a "total turbinate removal" 2 years ago complains of a constant sensation of nasal suffocation, even though he can see that his nose is wide open.

Vitals: Stable.
Physical Examination: Nasal cavity is extremely patent (wide open) with near-total absence of the inferior turbinates.
Laboratory Results: Normal.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Empty Nose Syndrome; iatrogenic sensation of suffocation despite wide airway.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is Empty Nose Syndrome?', '["A broken nose", "A paradoxical sensation of nasal obstruction in a widely patent nasal cavity, usually following aggressive turbinate surgery", "An allergy", "None"]', 1, 'Loss of turbinate tissue leads to loss of sensory feedback and improper airflow dynamics.'),
    (v_case_id, 'What is the primary function of the inferior turbinates?', '["To smell", "To humidify, warm, and filter inspired air, and provide sensory feedback of airflow", "To hold up the nose", "None"]', 1, 'Without them, the air is cold, dry, and not "felt" by the patient.'),
    (v_case_id, 'What is a common psychological symptom associated with ENS?', '["Extreme happiness", "Significant anxiety, depression, and a sensation of \"not being able to breathe\"", "Memory loss", "None"]', 1, 'The mismatch between reality (wide airway) and sensation (suffocation) is extremely distressing.');

    ---------------------------------------------------------------------------
    -- CASE 41: Acute Sphenoid Sinusitis (Complicated)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Vision Loss' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Vision Loss', 'A patient with known sphenoid sinusitis presents with sudden loss of vision in the right eye and severe retro-orbital pain.

Vitals: Stable.
Physical Examination: Afferent pupillary defect (Marcus Gunn pupil) in the right eye. Decreased visual acuity.
Laboratory Results: CT shows sphenoid sinus opacification with erosion of the optic canal.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Complicated Sphenoid Sinusitis; optic nerve involvement.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which structure is at greatest risk in isolated sphenoid sinusitis?', '["The tongue", "The optic nerve (CN II)", "The inner ear", "None"]', 1, 'The optic nerve runs in very close proximity to the lateral wall of the sphenoid sinus.'),
    (v_case_id, 'What is the "Marcus Gunn" pupil indicating?', '["Glaucoma", "An afferent pupillary defect, often due to optic nerve compression or damage", "Cataracts", "None"]', 1, 'This is a sign of serious optic nerve dysfunction.'),
    (v_case_id, 'Management of acute vision loss in sphenoiditis is:', '["Oral antibiotics", "Urgent surgical decompression and drainage", "Wait for MRI", "None"]', 1, 'Decompression is necessary to save the vision.');

    ---------------------------------------------------------------------------
    -- CASE 42: SPA Ligation (Epistaxis Management)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Failed Packing' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Failed Packing', 'A patient with a posterior nosebleed continues to bleed despite a well-placed posterior balloon pack.

Vitals: BP 150/90, HR 95.
Physical Examination: Active bleeding around the posterior pack.
Laboratory Results: Normal coags.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Refractory Epistaxis; indication for SPA ligation.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Gold Standard" surgical treatment for refractory posterior epistaxis?', '["Carotid artery ligation", "Endoscopic Sphenopalatine Artery (SPA) ligation", "Tonsillectomy", "None"]', 1, 'SPA ligation is highly successful and has fewer complications than packing.'),
    (v_case_id, 'Where is the sphenopalatine artery found during surgery?', '["The floor of the nose", "Exiting the sphenopalatine foramen just posterior to the crista ethmoidalis", "The septum", "None"]', 1, 'The crista ethmoidalis is a key landmark for finding the artery.'),
    (v_case_id, 'What is a possible complication of SPA ligation?', '["Nasal dryness/crusting", "Hearing loss", "Blindness", "None"]', 0, 'Reducing the blood supply to the mucosa can cause temporary dryness.');

    ---------------------------------------------------------------------------
    -- CASE 43: Allergic Rhinitis (Persistent)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Year-Round Sneezer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Year-Round Sneezer', 'A 25-year-old female complains of nasal congestion and sneezing every day of the year. She has two cats at home.

Vitals: Stable.
Physical Examination: Boggy, pale turbinates. No polyps.
Laboratory Results: Positive skin test for cat dander and dust mites.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Persistent Allergic Rhinitis; environmental triggers.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "Persistent" Allergic Rhinitis defined as?', '["Symptoms >4 days per week and >4 weeks per year", "Symptoms every day for a week", "Allergies to everything", "None"]', 0, 'This classification (ARIA) helps guide treatment intensity.'),
    (v_case_id, 'What is the most effective long-term treatment for persistent allergic rhinitis?', '["Oral decongestants", "Intranasal corticosteroids (e.g., Mometasone)", "Antibiotics", "None"]', 1, 'Topical steroids are superior for controlling the underlying inflammation.'),
    (v_case_id, 'What is the mechanism of allergen immunotherapy (allergy shots)?', '["It kills the allergen", "It shifts the immune response from Th2 (IgE) to Th1 (IgG)", "It is a placebo", "None"]', 1, 'Immunotherapy helps the body develop "tolerance" to the allergen.');

    ---------------------------------------------------------------------------
    -- CASE 44: NARES (Non-Allergic Rhinitis with Eosinophilia)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The False Allergy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The False Allergy', 'A patient presents with symptoms identical to allergic rhinitis, but skin tests and IgE levels are completely normal.

Vitals: Stable.
Physical Examination: Pale, boggy turbinates.
Laboratory Results: Nasal smear shows >20% eosinophils. Negative allergy tests.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'NARES; eosinophilic rhinitis without systemic allergy.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is NARES diagnosed?', '["Symptoms of rhinitis + Nasal eosinophilia (>10-20%) + Negative allergy tests", "Blood test only", "CT scan", "None"]', 0, 'It represents a localized eosinophilic inflammatory process.'),
    (v_case_id, 'True or False: NARES patients respond well to intranasal corticosteroids.', '["True", "False"]', 0, 'Like allergic rhinitis, NARES is an inflammatory condition that responds to steroids.'),
    (v_case_id, 'NARES is sometimes considered a precursor to which condition?', '["Sinus cancer", "Nasal polyposis and Samter''s triad", "Hearing loss", "None"]', 1, 'The persistent eosinophilic inflammation may eventually lead to polyp formation.');

    ---------------------------------------------------------------------------
    -- CASE 45: Nasal Bone Fracture (Complicated)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Comminuted Fracture' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Comminuted Fracture', 'A 30-year-old male presents after a high-velocity impact to the face. The nose is severely flattened and unstable.

Vitals: Stable.
Physical Examination: "Telescoping" of the nasal bones. Telecanthus (widening of the distance between the eyes).
Laboratory Results: CT shows fractures of the nasal bones, septum, and the lacrimal/ethmoid bones.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Complex Nasal/NOE Fracture; telescoping and telecanthus.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a Naso-Orbito-Ethmoid (NOE) fracture?', '["A simple broken nose", "A complex fracture involving the nasal bones, ethmoids, and the medial orbital wall", "A jaw fracture", "None"]', 1, 'These often involve the medial canthal tendon attachment.'),
    (v_case_id, 'What is "Telecanthus"?', '["Long distance between the pupils", "Increased distance between the inner corners of the eyes (medial canthi)", "Large eyes", "None"]', 1, 'This suggests displacement of the medial canthal tendon, often seen in NOE fractures.'),
    (v_case_id, 'Management of a severe NOE fracture usually requires:', '["A nose cast only", "Open reduction and internal fixation (ORIF) with plates and screws", "Wait and see", "None"]', 1, 'Structural stability must be restored surgically.');

    ---------------------------------------------------------------------------
    -- CASE 46: Septal Perforation (Occupational)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Chrome Worker' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Chrome Worker', 'A 50-year-old male works in a chrome plating factory. He presents with nasal crusting and a hole in his septum.

Vitals: Stable.
Physical Examination: 5 mm perforation in the cartilaginous septum.
Laboratory Results: Normal ANCA.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Occupational Septal Perforation; Chrome/Chromic acid exposure.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which heavy metal exposure is classically linked to septal perforation?', '["Lead", "Chromium (Chromic acid)", "Mercury", "None"]', 1, 'Inhaled chromic acid fumes are highly corrosive to the septal mucosa.'),
    (v_case_id, 'What is the most common symptom of a small septal perforation?', '["Loss of smell", "Whistling during inspiration", "Total obstruction", "None"]', 1, 'Small defects create turbulent airflow that produces a whistling sound.'),
    (v_case_id, 'A "Septal Button" is used for:', '["Fixing a broken nose", "Non-surgical closure of a septal perforation using a silicone plug", "Stopping a nosebleed", "None"]', 1, 'It is an option for patients who are not candidates for or do not want surgery.');

    ---------------------------------------------------------------------------
    -- CASE 47: Rhinosinusitis (Dentogenic)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tooth-Origin Sinusitis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tooth-Origin Sinusitis', 'A 38-year-old female presents with foul-smelling unilateral nasal discharge. She recently had a root canal on her upper right molar.

Vitals: Stable.
Physical Examination: Purulent discharge from the right middle meatus. Foul odor noted.
Laboratory Results: CT shows right maxillary sinusitis and a periapical abscess around the molar root.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Odontogenic Sinusitis; foul odor, dental origin.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a common clue that sinusitis is "odontogenic" (from a tooth)?', '["Bilateral symptoms", "Foul/cadaveric odor and unilateral maxillary involvement", "High fever", "None"]', 1, 'Anaerobic bacteria from dental infections produce a very characteristic foul smell.'),
    (v_case_id, 'Which upper teeth are most likely to cause sinusitis?', '["Incisors", "Molars and Premolars (whose roots are close to the maxillary sinus floor)", "Canines", "None"]', 1, 'The 1st and 2nd molars are the most frequent culprits.'),
    (v_case_id, 'Successful treatment of odontogenic sinusitis REQUIRES:', '["Double dose antibiotics", "Addressing both the sinus infection and the underlying dental pathology (e.g., extraction or root canal)", "Surgery only", "None"]', 1, 'The sinus will not clear if the tooth remains a source of infection.');

    ---------------------------------------------------------------------------
    -- CASE 48: Nasal Foreign Body (Living)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Moving Guest' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Moving Guest', 'A 12-year-old boy feels "something moving" in his nose after swimming in a river in a tropical area.

Vitals: Stable.
Physical Examination: Endoscopy reveals a leech attached to the nasal mucosa.
Laboratory Results: Normal.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Living Nasal Foreign Body (Leech); specialized removal.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the danger of a leech in the nose?', '["It causes cancer", "Epistaxis, anemia (if long-standing), and the risk of the leech migrating to the airway", "It is just gross", "None"]', 1, 'Leeches can cause significant bleeding due to anticoagulants they secrete.'),
    (v_case_id, 'How do you remove a leech from the nasal cavity?', '["Pull it hard", "Apply saline or vinegar to make it release its grip, or use specialized forceps", "Wait for it to leave", "None"]', 1, 'Forcing it off can leave the mouthparts behind, leading to infection.'),
    (v_case_id, 'Nasal Myiasis refers to:', '["Leeches", "Infestation by fly larvae (maggots)", "Fungus", "None"]', 1, 'This is often seen in debilitated patients with poor hygiene or atrophic rhinitis.');

    ---------------------------------------------------------------------------
    -- CASE 49: Juvenile Nasopharyngeal Angiofibroma (Management)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pre-Op Embolization' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pre-Op Embolization', 'A 15-year-old male is scheduled for surgery to remove a JNA.

Vitals: Stable.
Physical Examination: Typical nasopharyngeal mass.
Laboratory Results: Angiography shows the primary blood supply is from the Internal Maxillary Artery.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'JNA Management; preoperative embolization.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the standard preoperative procedure for JNA to reduce blood loss?', '["Radiation", "Preoperative embolization of the feeding vessels (e.g., IMA)", "Aspirin", "None"]', 1, 'Embolization 24-48 hours before surgery significantly reduces the risk of massive hemorrhage.'),
    (v_case_id, 'What is the primary feeding vessel for most JNAs?', '["Internal Carotid Artery", "Internal Maxillary Artery (IMA)", "Facial Artery", "None"]', 1, 'The IMA, a branch of the External Carotid, is the most common feeder.'),
    (v_case_id, 'True or False: Recurrence is common in JNAs and may require follow-up imaging for years.', '["True", "False"]', 0, 'Because they are aggressive and often involve the skull base, recurrence is a significant risk.');

    ---------------------------------------------------------------------------
    -- CASE 50: Rhinophyma (Surgical Management)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Resculpted Nose' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Resculpted Nose', 'A 70-year-old male with severe rhinophyma undergoes a procedure to "shave down" the lumpy tissue.

Vitals: Stable.
Physical Examination: Post-operative: The nose is raw but has a much more normal contour.
Laboratory Results: Normal.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Rhinophyma Management; surgical decortication.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the surgical goal in treating rhinophyma?', '["Total nose removal", "Decortication (shaving down) of the hypertrophic sebaceous and fibrous tissue while preserving the underlying cartilaginous framework", "A nose job", "None"]', 1, 'The goal is to restore a more normal aesthetic appearance.'),
    (v_case_id, 'Which tool is commonly used for rhinophyma decortication?', '["Laser (CO2), dermabrader, or \"cold\" scalpel", "A hammer", "Forceps only", "None"]', 0, 'The CO2 laser is particularly good for its ability to cut and cauterize simultaneously.'),
    (v_case_id, 'Why does the nose heal after such a "raw" shaving procedure?', '["It doesn''t", "Re-epithelialization occurs from the deep sebaceous gland remnants and hair follicles", "It needs a skin graft", "None"]', 1, 'The numerous deep glands act as a reservoir of epithelial cells for healing.');

END $$;

COMMIT;
