-- ENT (Otolaryngology): Head & Neck Tumors
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: ent-head-neck-tumors
-- Sourced/Inspired by: Cummings, Scott-Brown, Bailey, Lalwani

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ent-head-neck-tumors' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'ent-head-neck-tumors';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Leukoplakia (Premalignant)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The White Patch' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The White Patch', 'A 55-year-old male smoker with a 30-pack-year history presents with a painless white patch on the lateral aspect of his tongue that he noticed 2 months ago. He has tried brushing it off without success.

Vitals: Stable.
Physical Examination: A 1.5 cm adherent, thick white plaque on the right lateral tongue. It cannot be scraped off with a tongue depressor. No cervical lymphadenopathy.
Laboratory Results: Biopsy shows hyperkeratosis with moderate dysplasia.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Leukoplakia; adherent white plaque, pre-malignant.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of oral leukoplakia?', '["A fungal infection of the tongue", "A white patch or plaque that cannot be scraped off and cannot be characterized clinically or pathologically as any other disease", "A cancerous tumor", "None"]', 1, 'It is a diagnosis of exclusion and a clinical description, not a specific histopathologic diagnosis.'),
    (v_case_id, 'How does leukoplakia differ clinically from oral candidiasis (thrush)?', '["Thrush is painless", "Candidiasis can typically be scraped off, revealing an erythematous, bleeding base; leukoplakia cannot be scraped off", "They look identical", "None"]', 1, 'The "scrape test" is a classic bedside distinguishing feature.'),
    (v_case_id, 'What is the primary risk of untreated dysplastic leukoplakia?', '["Tooth loss", "Transformation into squamous cell carcinoma (SCC)", "Bleeding", "None"]', 1, 'Dysplasia indicates a significant risk of malignant transformation.');

    ---------------------------------------------------------------------------
    -- CASE 02: Erythroplakia
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Red Patch' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Red Patch', 'A 60-year-old male with a history of heavy alcohol and tobacco use presents with a painless red patch on the floor of his mouth.

Vitals: Stable.
Physical Examination: A 1 cm velvety, erythematous lesion on the right floor of mouth. No induration or ulceration. No neck masses.
Laboratory Results: Incisional biopsy shows severe dysplasia/carcinoma in situ.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Erythroplakia; red velvety plaque, high risk of malignancy.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which carries a higher risk of harboring malignancy or severe dysplasia: leukoplakia or erythroplakia?', '["Leukoplakia", "Erythroplakia", "They are equal", "None"]', 1, 'Erythroplakia has a much higher rate of malignant transformation (up to 90% show severe dysplasia or SCC at biopsy) compared to leukoplakia.'),
    (v_case_id, 'What makes the lesion appear red (erythematous)?', '["Infection", "Decreased keratinization and an increase in vascularity in the subepithelial connective tissue", "Bleeding", "None"]', 1, 'The thinning of the epithelium allows the underlying vasculature to show through.'),
    (v_case_id, 'What is the most common site for oral cavity SCC to develop?', '["Hard palate", "The \"horseshoe\" area (floor of mouth, ventrolateral tongue, and retromolar trigone)", "Gingiva", "None"]', 1, 'Carcinogens pool in the dependent areas of the mouth.');

    ---------------------------------------------------------------------------
    -- CASE 03: Oral Cavity SCC (Tongue)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Non-Healing Ulcer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Non-Healing Ulcer', 'A 65-year-old male presents with a painful ulcer on his tongue that has not healed for 3 months. He reports a 40-pack-year smoking history.

Vitals: Normal.
Physical Examination: A 2 cm indurated, ulcerated mass with raised, rolled borders on the left lateral border of the oral tongue. A 1.5 cm firm, mobile lymph node is palpable in the left level II neck region.
Laboratory Results: Biopsy of the lesion confirms invasive Squamous Cell Carcinoma (SCC).', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Oral Cavity SCC; non-healing tongue ulcer, level II node.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What clinical feature of this ulcer strongly suggests malignancy?', '["Presence of pain", "The indurated (firm) base with raised, rolled borders and lack of healing after several weeks", "Location on the tongue", "None"]', 1, 'Induration represents deep tissue invasion by the tumor.'),
    (v_case_id, 'What is the primary lymphatic drainage for the lateral oral tongue?', '["Level V nodes", "Submandibular (Level I) and upper jugular (Level II) lymph nodes", "Preauricular nodes", "None"]', 1, 'Tumors of the oral tongue frequently metastasize to levels I, II, and III.'),
    (v_case_id, 'What is the primary treatment modality for early-stage (T1/T2) oral cavity SCC?', '["Systemic chemotherapy alone", "Surgical resection (with clear margins) and consideration of neck dissection", "Radiation alone", "None"]', 1, 'Surgery is preferred for oral cavity tumors to avoid the long-term morbidity of radiation to the mouth (osteoradionecrosis, severe xerostomia).');

    ---------------------------------------------------------------------------
    -- CASE 04: HPV-Positive Oropharyngeal SCC (Tonsil)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Asymptomatic Neck Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Asymptomatic Neck Mass', 'A 45-year-old healthy, non-smoking male presents with a painless lump on the right side of his neck present for 2 months. He has no throat pain or dysphagia.

Vitals: Stable.
Physical Examination: A 3 cm cystic, firm mass in the right level II neck region. Oropharyngeal exam shows subtle asymmetry of the right palatine tonsil.
Laboratory Results: Fine needle aspiration (FNA) of the neck mass shows squamous cell carcinoma. Immunohistochemistry on the biopsy of the tonsil is p16-positive.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'HPV+ Oropharyngeal SCC; cystic neck mass, p16-positive.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why does a cystic neck mass in an adult male represent SCC until proven otherwise?', '["Because SCC always forms cysts", "Cystic metastasis from HPV+ oropharyngeal cancer (tonsil/base of tongue) is common and frequently misdiagnosed initially as a branchial cleft cyst", "It is usually a benign cyst", "None"]', 1, 'A new "branchial cleft cyst" in an adult >40 should raise high suspicion for HPV+ metastatic SCC.'),
    (v_case_id, 'What does p16 positivity indicate in this tumor?', '["P53 mutation", "It is a surrogate marker for high-risk Human Papillomavirus (HPV) infection, primarily HPV-16", "Tobacco etiology", "None"]', 1, 'HPV viral oncoprotein E7 degrades Rb, leading to compensatory overexpression of p16.'),
    (v_case_id, 'How does the prognosis of HPV-positive oropharyngeal SCC compare to HPV-negative (smoking-related) SCC?', '["Worse prognosis", "Significantly better prognosis and response to treatment (radiation/chemotherapy)", "The same", "None"]', 1, 'Despite often presenting with advanced nodal disease, HPV+ tumors are highly radiosensitive and have higher cure rates.');

    ---------------------------------------------------------------------------
    -- CASE 05: Glottic Carcinoma (T1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hoarse Smoker' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hoarse Smoker', 'A 62-year-old male with a 50-pack-year smoking history presents with persistent hoarseness for 3 months. He has no pain, dysphagia, or airway compromise.

Vitals: Normal.
Physical Examination: No palpable neck masses. Flexible fiberoptic laryngoscopy reveals a rough, white/pink exophytic lesion confined to the middle third of the right true vocal cord. Both vocal cords are fully mobile.
Laboratory Results: Biopsy shows well-differentiated squamous cell carcinoma.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'T1 Glottic SCC; hoarseness, normal mobility.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why do glottic cancers typically present early?', '["They grow rapidly", "They cause immediate hoarseness due to disruption of vocal cord vibration", "They cause pain", "None"]', 1, 'Even very small lesions on the true vocal cord affect phonation, prompting patients to seek evaluation.'),
    (v_case_id, 'What is the rate of lymph node metastasis for T1 glottic cancer?', '["50%", "Extremely low (<1-2%) because the true vocal cords lack a rich lymphatic drainage system", "25%", "None"]', 1, 'The glottis is a "watershed" area devoid of significant lymphatics, unlike the supraglottis or subglottis.'),
    (v_case_id, 'What are the two standard curative options for a T1 glottic cancer?', '["Chemotherapy and Observation", "Single-modality treatment: either primary radiation therapy OR endoscopic laser excision", "Total laryngectomy", "None"]', 1, 'Both options offer cure rates >90% for T1 lesions. The choice depends on patient preference, anatomy, and voice requirements.');

    ---------------------------------------------------------------------------
    -- CASE 06: Supraglottic Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Referred Otalgia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Referred Otalgia', 'A 58-year-old alcoholic and heavy smoker presents with a "lump in his throat," worsening dysphagia to solids, and severe left ear pain for 2 months. His voice is muffled ("hot potato" quality) but not truly hoarse.

Vitals: Normal, but noting a 10 lb weight loss.
Physical Examination: Otoscopy of the left ear is completely normal. Neck exam reveals bilateral firm, mobile lymph nodes in level II/III. Laryngoscopy shows a large, ulcerated mass on the laryngeal surface of the epiglottis.
Laboratory Results: Biopsy confirms SCC.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Supraglottic SCC; referred otalgia, bilateral neck nodes.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is the patient experiencing left ear pain despite a normal ear exam?', '["Otitis externa", "Referred pain via the Vagus nerve (CN X, Arnold''s branch) or Glossopharyngeal nerve (CN IX, Jacobson''s nerve) from the supraglottic lesion", "Tympanic membrane rupture", "None"]', 1, 'Unexplained ear pain in a high-risk patient is a major red flag for upper aerodigestive tract malignancy.'),
    (v_case_id, 'Why do supraglottic cancers often present at a more advanced stage than glottic cancers?', '["They grow faster", "The supraglottis is relatively \"silent\" (does not affect voice early) and has a rich lymphatic network leading to early bilateral nodal metastasis", "They are painless", "None"]', 1, 'Bilateral neck metastasis is present in up to 40% of supraglottic cancers at diagnosis.'),
    (v_case_id, 'The "hot potato" voice suggests tumor involvement or swelling where?', '["The true vocal cords", "The base of tongue or epiglottis, creating resonance changes in the pharynx", "The nasopharynx", "None"]', 1, 'This muffled voice quality indicates an obstructive lesion above the glottis.');

    ---------------------------------------------------------------------------
    -- CASE 07: Subglottic Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Stridor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Stridor', 'A 66-year-old female smoker presents to the ED with progressively worsening breathing, culminating in biphasic stridor. She reports a mild, progressive hoarseness over the last 6 months that she ignored.

Vitals: RR 28/min, O2 sat 92% on room air.
Physical Examination: Patient is using accessory muscles to breathe. Biphasic stridor is audible. Flexible laryngoscopy shows bilateral vocal cord paralysis and a mass extending subglottically.
Laboratory Results: CT neck shows a tumor involving the subglottis and eroding through the cricoid cartilage into the trachea.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Subglottic SCC; stridor, airway compromise.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most emergent first step in management?', '["Biopsy the mass", "Secure the airway, typically with an awake tracheostomy or rigid bronchoscopy", "Give antibiotics", "None"]', 1, 'In impending airway obstruction from a laryngeal tumor, securing the airway via tracheostomy under local anesthesia is paramount.'),
    (v_case_id, 'Why are primary subglottic cancers rare and insidious?', '["They are benign", "They are uncommon (1-5% of laryngeal cancers) and grow in a silent area until they cause airway obstruction or invade the vocal cords from below", "They only occur in children", "None"]', 1, 'They often present late with stridor or invasion of the recurrent laryngeal nerve causing vocal cord paralysis.'),
    (v_case_id, 'What are the primary lymph node basins for subglottic tumors?', '["Levels I and II", "Paratracheal, pretracheal (Delphian node), and level VI nodes", "Level V", "None"]', 1, 'Subglottic tumors drain inferiorly to the central compartment of the neck and superior mediastinum.');

    ---------------------------------------------------------------------------
    -- CASE 08: Paranasal Sinus Malignancy (Maxillary SCC)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Loose Teeth' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Loose Teeth', 'A 70-year-old male presents with right-sided facial numbness, unilateral nasal obstruction, and recently noticing that his right upper molar teeth have become loose. He worked in woodworking and furniture manufacturing for 40 years.

Vitals: Stable.
Physical Examination: Hypoesthesia over the right cheek (V2 distribution). A fleshy mass is seen in the right middle meatus. Hard palate shows a bulging, ulcerated mass.
Laboratory Results: CT Sinus shows opacification of the right maxillary sinus with bony destruction of the floor of the orbit and the hard palate.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Maxillary Sinus SCC; facial numbness, loose teeth, woodworker.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the significance of the patient''s occupational history (woodworking)?', '["It causes allergies", "Exposure to hardwood dust is a classic risk factor for sinonasal adenocarcinomas and SCC", "It is irrelevant", "None"]', 1, 'Leather tanning and nickel refining are other classic occupational risk factors for sinonasal malignancies.'),
    (v_case_id, 'Why is the patient experiencing cheek numbness?', '["Dental infection", "Tumor invasion of the infraorbital nerve (a branch of V2/Maxillary nerve) as it traverses the roof of the maxillary sinus", "Stroke", "None"]', 1, 'Cranial neuropathy in the setting of chronic sinus symptoms strongly suggests a malignancy.'),
    (v_case_id, 'Why did his teeth become loose?', '["Periodontal disease", "The tumor eroded through the floor of the maxillary sinus into the alveolar ridge (dental roots)", "Aging", "None"]', 1, 'Maxillary sinus tumors often present with dental symptoms leading to delayed diagnosis after futile tooth extractions.');

    ---------------------------------------------------------------------------
    -- CASE 09: Esthesioneuroblastoma (Olfactory Neuroblastoma)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bleeding Nose Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bleeding Nose Mass', 'A 45-year-old female presents with unilateral left-sided nasal obstruction, recurrent epistaxis, and loss of smell (anosmia) over the last 8 months.

Vitals: Stable.
Physical Examination: Endoscopy reveals a reddish-grey, highly vascular mass high in the nasal vault near the cribriform plate.
Laboratory Results: MRI shows a "dumbbell-shaped" mass extending from the superior nasal cavity, through the cribriform plate, into the anterior cranial fossa. Biopsy shows small round blue cells forming Homer Wright rosettes.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Esthesioneuroblastoma; anosmia, cribriform mass, Homer Wright rosettes.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is an Esthesioneuroblastoma?', '["A benign polyp", "A rare malignant tumor arising from the olfactory epithelium in the superior nasal vault", "A type of meningioma", "None"]', 1, 'It arises specifically from the olfactory neuroepithelium.'),
    (v_case_id, 'What is the classic radiographic appearance of this tumor?', '["A cyst", "A \"dumbbell\" shaped lesion extending through the cribriform plate", "Complete sinus opacification", "None"]', 1, 'The tumor commonly invades the anterior cranial fossa.'),
    (v_case_id, 'What histological feature is classic for this tumor?', '["Keratin pearls", "Small round blue cells with Homer Wright rosettes (neuroendocrine differentiation)", "Glandular formation", "None"]', 1, 'Immunohistochemistry is typically positive for NSE, Synaptophysin, and Chromogranin.');

    ---------------------------------------------------------------------------
    -- CASE 10: Juvenile Nasopharyngeal Angiofibroma (JNA)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bleeding Teenager' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bleeding Teenager', 'A 15-year-old adolescent male presents with severe, recurrent unilateral epistaxis and progressive left-sided nasal obstruction.

Vitals: BP 110/70, HR 95 bpm.
Physical Examination: A smooth, reddish, lobulated mass is seen filling the nasopharynx and extending into the left nasal cavity.
Laboratory Results: CT scan with contrast shows an intensely enhancing mass centered at the sphenopalatine foramen, causing bowing of the posterior maxillary wall (Holman-Miller sign).', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'JNA; adolescent male, severe epistaxis, Holman-Miller sign.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Who is classically affected by Juvenile Nasopharyngeal Angiofibroma?', '["Elderly females", "Almost exclusively adolescent males", "Toddlers", "None"]', 1, 'It is considered an androgen-dependent benign but locally aggressive tumor.'),
    (v_case_id, 'Why is a biopsy of this lesion strictly CONTRAINDICATED in the clinic?', '["It causes pain", "The tumor is extremely vascular and lacks a muscular coat on its vessels, leading to massive, life-threatening hemorrhage", "It spreads the tumor", "None"]', 1, 'Diagnosis is made via imaging (CT/MRI/Angiography), not biopsy.'),
    (v_case_id, 'What is an essential step prior to surgical resection of a JNA?', '["Radiation therapy", "Pre-operative angiography and embolization of the feeding vessels (usually internal maxillary artery)", "Chemotherapy", "None"]', 1, 'Embolization 24-48 hours prior to surgery significantly reduces intraoperative blood loss.');

    ---------------------------------------------------------------------------
    -- CASE 11: Nasopharyngeal Carcinoma (NPC)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blocked Ear and Neck Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blocked Ear and Neck Mass', 'A 50-year-old male immigrant from Southern China presents with a painless lump in his right neck and a feeling of "fullness" in his right ear for 3 months.

Vitals: Stable.
Physical Examination: Right level V cervical lymphadenopathy. Otoscopy shows a unilateral right middle ear effusion (amber fluid behind TM). Nasopharyngeal endoscopy reveals an exophytic mass in the fossa of Rosenmüller.
Laboratory Results: Biopsy shows undifferentiated non-keratinizing squamous cell carcinoma. EBV titers (IgA anti-VCA) are elevated.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Nasopharyngeal Carcinoma (NPC); Southern Chinese male, EBV, unilateral effusion.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why did the patient develop a unilateral middle ear effusion?', '["An allergy", "The nasopharyngeal tumor obstructs the Eustachian tube orifice", "A primary ear infection", "None"]', 1, 'Adult onset of unilateral serous otitis media is a classic red flag for a nasopharyngeal mass.'),
    (v_case_id, 'What is the strong viral association with this specific type of head and neck cancer?', '["HPV", "Epstein-Barr Virus (EBV)", "HIV", "None"]', 1, 'NPC is strongly associated with EBV, particularly in endemic regions like Southeast Asia and Southern China.'),
    (v_case_id, 'What is the primary treatment modality for Nasopharyngeal Carcinoma?', '["Surgery", "Radiation therapy (with concurrent chemotherapy for advanced stages)", "Immunotherapy only", "None"]', 1, 'NPC is highly radiosensitive, and the anatomy of the nasopharynx makes primary surgical resection extremely difficult and morbid.');

    ---------------------------------------------------------------------------
    -- CASE 12: Inverted Papilloma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Lateral Wall Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Lateral Wall Mass', 'A 55-year-old male presents with unilateral left nasal obstruction and recurrent sinusitis.

Vitals: Stable.
Physical Examination: A fleshy, polypoid mass is seen arising from the left lateral nasal wall. It looks firmer and more opaque than a typical allergic inflammatory nasal polyp.
Laboratory Results: Biopsy shows hyperplastic epithelium growing inward (invaginating) into the underlying stroma. No malignancy is seen on the superficial biopsy.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Inverted Papilloma; unilateral polypoid mass, risk of SCC.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is an Inverted Papilloma?', '["A cancerous tumor", "A benign but locally aggressive sinonasal tumor where the epithelium inverts into the stroma", "An allergic polyp", "None"]', 1, 'Unlike inflammatory polyps which are bilateral and smooth, inverted papillomas are typically unilateral and arising from the lateral nasal wall.'),
    (v_case_id, 'Why must an Inverted Papilloma be completely surgically excised with clear margins?', '["It causes severe pain", "It has a 10% rate of malignant transformation to Squamous Cell Carcinoma and a high recurrence rate if incompletely resected", "It is contagious", "None"]', 1, 'Complete surgical excision (often endoscopic medial maxillectomy) is required due to the malignancy risk.'),
    (v_case_id, 'What virus is often implicated in the pathogenesis of Inverted Papilloma?', '["EBV", "HPV (specifically types 6, 11, 16, 18)", "HSV", "None"]', 1, 'HPV infection is thought to play a role in its development and malignant transformation.');

    ---------------------------------------------------------------------------
    -- CASE 13: Pleomorphic Adenoma (Benign Mixed Tumor)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Slow Growing Cheek Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Slow Growing Cheek Mass', 'A 45-year-old female presents with a painless, slowly enlarging lump in front of her left ear that she has noticed over the past 2 years.

Vitals: Stable.
Physical Examination: A 3 cm firm, non-tender, mobile mass in the tail of the left parotid gland. Facial nerve function is completely normal (House-Brackmann Grade I).
Laboratory Results: Fine needle aspiration (FNA) shows a mixture of epithelial cells and chondromyxoid (cartilage-like) stroma.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pleomorphic Adenoma; slow growing parotid mass, mixed cells.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common tumor of the parotid gland?', '["Warthin''s tumor", "Pleomorphic adenoma (Benign Mixed Tumor)", "Mucoepidermoid carcinoma", "None"]', 1, 'It accounts for approximately 80% of all parotid tumors.'),
    (v_case_id, 'Why is a formal superficial parotidectomy preferred over simple "enucleation" (shelling out) of the tumor?', '["It is faster", "The tumor has microscopic pseudopod extensions; enucleation leaves these behind, leading to a high rate of recurrence", "It improves facial nerve function", "None"]', 1, 'Recurrent pleomorphic adenoma is multifocal and extremely difficult to treat.'),
    (v_case_id, 'What is the risk of leaving a pleomorphic adenoma untreated for decades?', '["Facial paralysis", "Malignant transformation into Carcinoma ex Pleomorphic Adenoma", "It will disappear", "None"]', 1, 'The risk of malignant transformation increases by about 1-1.5% per year the tumor is present.');

    ---------------------------------------------------------------------------
    -- CASE 14: Warthin Tumor (Papillary Cystadenoma Lymphomatosum)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bilateral Smoker Masses' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bilateral Smoker Masses', 'A 65-year-old male with a heavy smoking history presents with a "doughy," slightly cystic mass at the angle of the jaw on the right. He mentions he had a similar, smaller lump on the left side removed years ago.

Vitals: Stable.
Physical Examination: A 4 cm soft, cystic-feeling mass in the tail of the right parotid. Normal facial nerve.
Laboratory Results: FNA shows oncocytic epithelial cells and dense lymphoid tissue. Tc-99m scan shows the mass "lights up" (hot nodule).', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Warthin Tumor; older male smoker, bilateral, hot on Tc-99m.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a strong clinical risk factor for Warthin tumor?', '["Alcohol use", "Smoking (patients are almost exclusively smokers)", "Prior radiation", "None"]', 1, 'Smoking increases the risk of Warthin tumor by 8-fold.'),
    (v_case_id, 'What unique clinical feature is common with Warthin tumors compared to other parotid neoplasms?', '["They are very painful", "They are frequently bilateral (in 10-15% of cases) and multicentric", "They always cause facial paralysis", "None"]', 1, 'Warthin tumor is the most common bilateral parotid tumor.'),
    (v_case_id, 'What is the characteristic histological finding?', '["Chondromyxoid stroma", "A double layer of eosinophilic oncocytic cells forming cystic spaces, surrounded by a dense lymphoid stroma", "Swiss-cheese pattern", "None"]', 1, 'This unique histology gives it the formal name "Papillary Cystadenoma Lymphomatosum."');

    ---------------------------------------------------------------------------
    -- CASE 15: Mucoepidermoid Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pediatric Parotid Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pediatric Parotid Mass', 'A 12-year-old girl is brought in by her parents for a firm, painless lump in her right cheek that has grown steadily over 3 months. She has a history of prior neck radiation for childhood lymphoma.

Vitals: Stable.
Physical Examination: A 2.5 cm hard, fixed mass in the right parotid gland. No facial weakness.
Laboratory Results: FNA suggests a malignant neoplasm with a mix of mucin-producing cells and epidermoid cells.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Mucoepidermoid Carcinoma; most common malignant salivary tumor in children.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common MALIGNANT salivary gland tumor in both adults and children?', '["Adenoid Cystic Carcinoma", "Mucoepidermoid Carcinoma", "Squamous Cell Carcinoma", "None"]', 1, 'MEC accounts for about 30% of all salivary malignancies.'),
    (v_case_id, 'What factor most strongly dictates the prognosis and treatment of Mucoepidermoid Carcinoma?', '["Tumor size only", "Histologic Grade (Low, Intermediate, or High grade) based on the ratio of mucinous to epidermoid cells and mitotic rate", "Patient age", "None"]', 1, 'Low-grade MEC is usually cured by surgery alone; high-grade MEC acts like SCC and requires aggressive surgery and radiation.'),
    (v_case_id, 'A history of what prior exposure is a known risk factor for salivary gland malignancies?', '["Smoking", "Prior head and neck radiation therapy", "Alcohol", "None"]', 1, 'Radiation exposure significantly increases the risk of salivary malignancies years later.');

    ---------------------------------------------------------------------------
    -- CASE 16: Adenoid Cystic Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Painful Submandibular Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Painful Submandibular Mass', 'A 55-year-old female presents with a hard mass under her left jaw that is uniquely painful. She reports recent onset of numbness on the left side of her lower lip.

Vitals: Stable.
Physical Examination: A 3 cm hard, fixed mass in the left submandibular gland. Hypoesthesia in the distribution of the left mental nerve (V3 branch).
Laboratory Results: FNA shows basaloid cells in a "Swiss cheese" or cribriform pattern.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Adenoid Cystic Carcinoma; submandibular, perineural invasion, pain.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most defining pathophysiologic feature of Adenoid Cystic Carcinoma?', '["It forms cysts", "A striking propensity for Perineural Invasion (spreading along nerve sheaths), causing pain and nerve deficits", "It is always benign", "None"]', 1, 'Tumor cells travel long distances along cranial nerves, often beyond the main tumor mass.'),
    (v_case_id, 'What is the most common site for Adenoid Cystic Carcinoma?', '["Parotid gland", "Submandibular gland and minor salivary glands (e.g., palate)", "Thyroid gland", "None"]', 1, 'While MEC is the most common malignancy in the parotid, ACC is the most common malignancy of the submandibular and minor salivary glands.'),
    (v_case_id, 'What is characteristic of the long-term clinical behavior of ACC?', '["It kills rapidly within months", "It has an indolent but relentless course, with a high rate of late distant metastases (especially to the lungs) occurring 10-20 years later", "It is easily cured", "None"]', 1, '5-year survival is good, but 20-year survival is poor due to late metastatic disease.');

    ---------------------------------------------------------------------------
    -- CASE 17: Acinic Cell Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Low-Grade Parotid Malignancy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Low-Grade Parotid Malignancy', 'A 48-year-old female presents with a slowly growing, painless mass in the right parotid gland over the last year.

Vitals: Stable.
Physical Examination: 2 cm firm mass in the superficial lobe of the parotid. Facial nerve is intact.
Laboratory Results: Parotidectomy is performed. Pathology reveals cells with basophilic zymogen granules, resembling normal serous acinar cells. It is classified as Acinic Cell Carcinoma.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Acinic Cell Carcinoma; low-grade, zymogen granules.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the typical clinical behavior of Acinic Cell Carcinoma?', '["Highly aggressive with early metastasis", "It is generally considered a low-grade malignancy with a good prognosis if completely resected", "It always involves the facial nerve", "None"]', 1, 'It is the second most common salivary malignancy in children and overall has a favorable outcome.'),
    (v_case_id, 'What cellular feature is diagnostic of Acinic Cell Carcinoma?', '["Oncocytic cells", "The presence of basophilic zymogen granules within the cytoplasm", "Keratin pearls", "None"]', 1, 'The cells are attempting to mimic the serous acinar cells of the normal salivary gland.'),
    (v_case_id, 'In which gland does Acinic Cell Carcinoma almost exclusively occur?', '["Sublingual gland", "Parotid gland (80-90% of cases)", "Minor salivary glands", "None"]', 1, 'Because the parotid is the only purely serous salivary gland, acinic cell tumors predominantly arise there.');

    ---------------------------------------------------------------------------
    -- CASE 18: Papillary Thyroid Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Palpable Nodule' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Palpable Nodule', 'A 35-year-old female notices a painless lump in the lower anterior neck while looking in the mirror. She has no dysphagia, voice changes, or symptoms of hyperthyroidism.

Vitals: Normal.
Physical Examination: A 1.5 cm firm, mobile nodule in the right lobe of the thyroid gland. A palpable lymph node is felt in the right central neck.
Laboratory Results: TSH is normal. Ultrasound shows a solid, hypoechoic nodule with microcalcifications. FNA reveals cells with "Orphan Annie eye" nuclei.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Papillary Thyroid Carcinoma; most common, Orphan Annie eyes.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common type of thyroid malignancy?', '["Follicular Carcinoma", "Papillary Thyroid Carcinoma (accounts for ~80%)", "Medullary Carcinoma", "None"]', 1, 'Papillary carcinoma is the most common and generally has an excellent prognosis.'),
    (v_case_id, 'What are the classic histological features of Papillary Thyroid Carcinoma?', '["Amyloid stroma", "Optically clear nuclei (Orphan Annie eyes), nuclear grooves, and Psammoma bodies (calcifications)", "Sheets of anaplastic cells", "None"]', 1, 'The diagnosis is based entirely on these specific nuclear features, not architectural growth patterns.'),
    (v_case_id, 'How does Papillary Thyroid Carcinoma primarily spread?', '["Hematogenously to the lungs", "Lymphatically to regional cervical lymph nodes (central and lateral neck)", "Directly into the trachea", "None"]', 1, 'Nodal metastases are very common (up to 50%) but do not significantly worsen survival in young patients.');

    ---------------------------------------------------------------------------
    -- CASE 19: Follicular Thyroid Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Indeterminate Nodule' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Indeterminate Nodule', 'A 45-year-old female undergoes FNA of a 3 cm thyroid nodule. The cytology report returns as "Follicular Neoplasm." She undergoes a diagnostic diagnostic thyroid lobectomy.

Vitals: Stable.
Physical Examination: 3 cm firm nodule left thyroid.
Laboratory Results: Final surgical pathology of the resected lobe reveals a follicular tumor with evidence of capsule and vascular invasion.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Follicular Thyroid Carcinoma; requires capsular/vascular invasion for diagnosis.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why can''t Follicular Carcinoma be diagnosed definitively by Fine Needle Aspiration (FNA)?', '["The cells are too small", "FNA only shows cells; the distinction between a benign follicular adenoma and malignant carcinoma requires seeing capsular or vascular invasion, which requires the whole surgical specimen", "It doesn''t yield enough cells", "None"]', 1, 'This is why FNA results often return as "indeterminate" or "follicular neoplasm," necessitating a diagnostic lobectomy.'),
    (v_case_id, 'Unlike Papillary carcinoma, how does Follicular Carcinoma primarily metastasize?', '["Lymphatically to neck nodes", "Hematogenously (bloodstream) to distant sites like bone and lungs", "Direct extension", "None"]', 1, 'Because it invades blood vessels, distant hematogenous spread is more common than nodal spread.'),
    (v_case_id, 'If a patient is diagnosed with Follicular Carcinoma after a lobectomy, what is the usual next step if the tumor is large or widely invasive?', '["Radiation therapy", "Completion thyroidectomy (removing the rest of the gland) followed by radioactive iodine (RAI) ablation", "Observation", "None"]', 1, 'Total thyroidectomy is required to allow for effective RAI treatment of metastases and use of thyroglobulin as a tumor marker.');

    ---------------------------------------------------------------------------
    -- CASE 20: Medullary Thyroid Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Genetic Thyroid Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Genetic Thyroid Mass', 'A 28-year-old male presents with a thyroid nodule and severe, episodic diarrhea. Family history is significant for his mother having thyroid cancer and bilateral adrenal tumors.

Vitals: BP 160/100, HR 105 bpm.
Physical Examination: Bilateral firm thyroid nodules.
Laboratory Results: Serum calcitonin is >1000 pg/mL. FNA shows spindle cells in an amyloid stroma.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Medullary Thyroid Carcinoma; MEN2, calcitonin, amyloid stroma.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'From which cells does Medullary Thyroid Carcinoma originate?', '["Follicular cells", "Parafollicular C-cells (neuroendocrine cells that secrete calcitonin)", "Lymphocytes", "None"]', 1, 'Because it does not arise from follicular cells, it does not take up radioactive iodine.'),
    (v_case_id, 'What syndrome must this patient be evaluated for given his family history?', '["MEN 1", "MEN 2A or 2B (Multiple Endocrine Neoplasia)", "FAP", "None"]', 1, 'His history of adrenal tumors (pheochromocytoma) in the family strongly suggests MEN 2, caused by a RET proto-oncogene mutation.'),
    (v_case_id, 'What critical test must be performed before taking this patient to surgery for a thyroidectomy?', '["Chest X-ray", "Plasma free metanephrines to rule out a pheochromocytoma", "Brain MRI", "None"]', 1, 'Operating on a patient with an undiagnosed, untreated pheochromocytoma can cause a fatal intraoperative hypertensive crisis.');

    ---------------------------------------------------------------------------
    -- CASE 21: Anaplastic Thyroid Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rapidly Expanding Neck' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rapidly Expanding Neck', 'A 75-year-old female presents with a rapidly enlarging anterior neck mass over the last 3 weeks, accompanied by severe dysphagia, hoarseness, and dyspnea.

Vitals: Stable but in mild respiratory distress.
Physical Examination: A massive, hard, fixed mass completely infiltrating the anterior neck. Right vocal cord is paralyzed.
Laboratory Results: FNA shows bizarre, undifferentiated, highly pleomorphic giant and spindle cells with numerous mitoses.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Anaplastic Thyroid Carcinoma; elderly, rapid growth, lethal.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the typical prognosis for Anaplastic Thyroid Carcinoma?', '["Excellent with surgery", "Dismal; it is one of the most aggressive and lethal human malignancies, with a median survival of mere months", "Good with chemotherapy", "None"]', 1, 'It rapidly invades local neck structures (trachea, esophagus) causing death by airway obstruction or distant metastasis.'),
    (v_case_id, 'What is the role of surgery in Anaplastic Thyroid Carcinoma?', '["Curative total resection", "Primarily palliative (e.g., securing the airway with tracheostomy) or limited debulking; complete resection is rarely possible", "It is contraindicated", "None"]', 1, 'The disease is almost always widely invasive and unresectable at the time of presentation.'),
    (v_case_id, 'Anaplastic carcinoma often arises from the dedifferentiation of which pre-existing tumor?', '["Medullary carcinoma", "A long-standing well-differentiated papillary or follicular carcinoma, or a long-standing goiter", "Lymphoma", "None"]', 1, 'Many patients have a history of an untreated long-standing goiter or well-differentiated tumor.');

    ---------------------------------------------------------------------------
    -- CASE 22: Parathyroid Adenoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Calcium Stones' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Calcium Stones', 'A 60-year-old female presents with recurrent kidney stones, bone pain, constipation, and fatigue ("stones, bones, groans, and psychiatric overtones").

Vitals: BP 140/90.
Physical Examination: No palpable neck masses.
Laboratory Results: Serum Calcium is 11.8 mg/dL (High). Intact PTH is 150 pg/mL (High). Sestamibi scan shows intense, retained focal uptake posterior to the lower pole of the left thyroid lobe.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Parathyroid Adenoma; primary hyperparathyroidism, elevated Ca and PTH.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of primary hyperparathyroidism?', '["Four-gland hyperplasia", "A single benign parathyroid adenoma (approx. 85% of cases)", "Parathyroid carcinoma", "None"]', 1, 'Hyperplasia accounts for ~15%, often associated with MEN syndromes.'),
    (v_case_id, 'What imaging modality is highly specific for localizing a parathyroid adenoma preoperatively?', '["CT scan without contrast", "Tc-99m Sestamibi scan (often combined with SPECT/CT)", "X-ray", "None"]', 1, 'Sestamibi is absorbed by both thyroid and parathyroid tissue, but "washes out" quickly from the thyroid, leaving a "hot spot" in the parathyroid adenoma.'),
    (v_case_id, 'How can the surgeon confirm complete removal of the hyperfunctioning adenoma while the patient is still on the operating table?', '["By looking at the tumor", "By measuring Intraoperative Rapid PTH levels (PTH drops by >50% within 10-15 minutes of adenoma excision due to its short half-life)", "Waiting for pathology", "None"]', 1, 'The half-life of PTH is only a few minutes, allowing real-time confirmation of surgical cure.');

    ---------------------------------------------------------------------------
    -- CASE 23: Carotid Body Tumor (Chemodectoma)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pulsatile Neck Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pulsatile Neck Mass', 'A 45-year-old male living in Denver (high altitude) presents with a slow-growing, painless, pulsatile mass in the lateral neck just below the angle of the mandible.

Vitals: Normal.
Physical Examination: A 4 cm firm, pulsatile mass located at the anterior border of the SCM at the level of the hyoid. The mass can be moved horizontally but is restricted vertically (Fontaine''s sign).
Laboratory Results: MRI shows a highly vascular mass splaying the internal and external carotid arteries ("lyre sign").', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Carotid Body Tumor; pulsatile, Fontaine sign, lyre sign on imaging.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a Carotid Body Tumor?', '["A cancerous lymph node", "A paraganglioma (neuroendocrine tumor) arising from the chemoreceptor cells at the carotid bifurcation", "A type of aneurysm", "None"]', 1, 'They are usually benign but locally aggressive and highly vascular.'),
    (v_case_id, 'What explains "Fontaine''s Sign" (lateral mobility but vertical fixation)?', '["It is attached to the spine", "The tumor is tethered to the carotid bifurcation, restricting up-and-down movement", "It is a muscle spasm", "None"]', 1, 'This is a classic physical exam finding for carotid body tumors.'),
    (v_case_id, 'Why are Carotid Body Tumors more common in people living at high altitudes?', '["Genetic drift", "Chronic hypoxia causes chronic stimulation and hyperplasia of the chemoreceptor cells (carotid body), increasing tumor risk", "Cold weather", "None"]', 1, 'Patients with chronic COPD or cyanotic heart disease are also at higher risk.');

    ---------------------------------------------------------------------------
    -- CASE 24: Glomus Jugulare
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Throbbing Ear' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Throbbing Ear', 'A 50-year-old female presents with pulsatile tinnitus (hearing her heartbeat in her ear) and progressive hearing loss in the right ear. She also notes recent hoarseness and difficulty swallowing.

Vitals: Stable.
Physical Examination: Otoscopy shows a reddish, pulsatile mass rising from the floor of the middle ear behind an intact eardrum ("rising sun" sign). Cranial nerves IX, X, and XI are weak.
Laboratory Results: MRI shows a "salt-and-pepper" appearance at the jugular foramen.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Glomus Jugulare; pulsatile tinnitus, salt-and-pepper MRI, CN deficits.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a Glomus Jugulare?', '["A middle ear infection", "A paraganglioma arising from the jugular bulb in the jugular foramen", "A brain tumor", "None"]', 1, 'It is the most common tumor of the middle ear/jugular foramen region.'),
    (v_case_id, 'What causes the "Salt-and-Pepper" appearance on MRI?', '["Calcifications", "The highly vascular nature of the tumor: \"salt\" represents hemorrhage/mucin, \"pepper\" represents flow voids from fast-flowing blood vessels", "Air pockets", "None"]', 1, 'This is the pathognomonic MRI finding for paragangliomas.'),
    (v_case_id, 'Which syndrome is caused by tumor compression in the jugular foramen?', '["Horner''s Syndrome", "Vernet''s Syndrome (Jugular Foramen Syndrome), involving CN IX, X, and XI", "Frey''s Syndrome", "None"]', 1, 'Patients present with dysphagia, hoarseness, and shoulder weakness.');

    ---------------------------------------------------------------------------
    -- CASE 25: Olfactory Neuroblastoma (Esthesioneuroblastoma)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Loss of Smell' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Loss of Smell', 'A 45-year-old man presents with a 6-month history of right-sided nasal obstruction, epistaxis, and anosmia. 

Vitals: Stable.
Physical Examination: Anterior rhinoscopy reveals a red-brown polypoid mass in the superior meatus.
Laboratory Results: CT shows a mass eroding the cribriform plate. Biopsy shows small round blue cells forming Homer-Wright rosettes. Positive for synaptophysin and chromogranin.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Esthesioneuroblastoma; neuroendocrine marker positive, cribriform erosion.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'From what tissue does an Esthesioneuroblastoma arise?', '["Squamous mucosa", "Olfactory neuroepithelium high in the nasal vault", "Nasal cartilage", "None"]', 1, 'This explains the classic symptom of anosmia (loss of smell).'),
    (v_case_id, 'What is the standard surgical approach for a tumor that erodes through the cribriform plate?', '["Simple polypectomy", "Craniofacial resection (often combined endoscopic and neurosurgical approach) to remove the tumor from both the nasal cavity and anterior cranial fossa", "Radiation only", "None"]', 1, 'Clear margins are required in both compartments.'),
    (v_case_id, 'What histological classification scheme is used for Esthesioneuroblastoma?', '["Gleason score", "Hyams grading system (Grades I-IV based on pleomorphism, mitoses, necrosis, and rosettes)", "Breslow depth", "None"]', 1, 'Higher Hyams grades correlate with more aggressive behavior and poorer prognosis.');

    ---------------------------------------------------------------------------
    -- CASE 25: Squamous Cell Carcinoma of the Lip
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sun-Damaged Lip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sun-Damaged Lip', 'A 60-year-old farmer presents with a non-healing, crusting ulcer on his lower lip that has been present for 6 months. He has a fair complexion and significant sun damage on his face.

Vitals: Stable.
Physical Examination: A 1.5 cm indurated, crusted ulcer on the vermilion border of the lower lip. No palpable cervical lymph nodes.
Laboratory Results: Wedge biopsy of the lip lesion shows well-differentiated Squamous Cell Carcinoma.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Lip SCC; sun exposure, lower lip predilection.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which lip is most commonly affected by SCC and why?', '["Upper lip due to smoking", "Lower lip (90% of cases) because it receives maximum direct ultraviolet (sun) exposure", "Both equally", "None"]', 1, 'Chronic sun exposure (actinic cheilitis) is the major risk factor for lip SCC.'),
    (v_case_id, 'What is the typical lymphatic drainage of the central lower lip?', '["Submandibular nodes (Level IB)", "Submental nodes (Level IA)", "Preauricular nodes", "None"]', 1, 'The central lower lip drains to the submental nodes, while the lateral lower lip drains to the submandibular nodes.'),
    (v_case_id, 'What is the primary treatment for early-stage lip SCC?', '["Chemotherapy", "Surgical excision with primary closure or local flap reconstruction (e.g., Abbe-Estlander flap for large defects)", "Observation", "None"]', 1, 'Surgery is preferred; radiation is an alternative but can cause significant cosmetic and functional issues around the mouth.');

    ---------------------------------------------------------------------------
    -- CASE 26: Verrucous Carcinoma (Ackerman''s Tumor)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Snuff Dipper' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Snuff Dipper', 'A 70-year-old male with a 40-year history of chewing tobacco (snuff) presents with a large, painless, warty growth on his buccal mucosa.

Vitals: Stable.
Physical Examination: A broad-based, exophytic, "cauliflower-like" white/pink mass on the left inner cheek (buccal mucosa).
Laboratory Results: Superficial biopsies have repeatedly shown only "hyperkeratosis." A deep incisional biopsy finally shows well-differentiated SCC with "pushing" rather than infiltrating margins.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Verrucous Carcinoma; chewing tobacco, warty growth, pushing margins.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is Verrucous Carcinoma?', '["A highly aggressive sarcoma", "A low-grade variant of SCC associated with smokeless tobacco use, characterized by exophytic growth and low metastatic potential", "A benign wart", "None"]', 1, 'It rarely metastasizes to lymph nodes but can be locally destructive.'),
    (v_case_id, 'Why are superficial biopsies of Verrucous Carcinoma notoriously misleading?', '["They cause bleeding", "The tumor is very well-differentiated on the surface; the malignant nature (pushing borders) is only seen at the deep invasive front", "The tissue is too hard", "None"]', 1, 'A deep incisional biopsy is required for accurate diagnosis.'),
    (v_case_id, 'Why is radiation therapy generally avoided for Verrucous Carcinoma?', '["It is too expensive", "Historically, there is a theoretical risk of causing \"anaplastic transformation\" (making the tumor highly aggressive), though surgery remains the gold standard regardless", "It works too well", "None"]', 1, 'Surgical excision is the treatment of choice with excellent cure rates.');

    ---------------------------------------------------------------------------
    -- CASE 27: Floor of Mouth SCC
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fixed Tongue' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fixed Tongue', 'A 60-year-old heavy drinker and smoker presents with pain under his tongue and difficulty articulating words (dysarthria).

Vitals: Stable.
Physical Examination: A 3 cm ulcerated, hard mass in the anterior floor of mouth. The ventral surface of the tongue is tethered to the mass, limiting tongue mobility. Bilateral submandibular adenopathy is present.
Laboratory Results: CT neck shows the tumor invading the intrinsic muscles of the tongue and the lingual cortex of the mandible.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Floor of Mouth SCC; mandibular invasion, bilateral drainage.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why do floor of mouth tumors frequently present with bilateral lymph node metastases?', '["They grow very fast", "The floor of the mouth has rich, crossing lymphatic networks that drain bilaterally to the submandibular (Level I) and jugular (Levels II, III) nodes", "They are always large", "None"]', 1, 'Midline or near-midline tumors require bilateral neck treatment.'),
    (v_case_id, 'If the tumor has invaded the mandible bone cortex, what surgical procedure is required?', '["Dental extraction", "Marginal or Segmental Mandibulectomy (removal of part of the jaw bone)", "Tonsillectomy", "None"]', 1, 'Bone invasion changes the staging (T4) and requires bone resection to achieve clear margins.'),
    (v_case_id, 'What structure is at high risk of involvement by a floor of mouth tumor, potentially causing submandibular gland swelling?', '["Wharton''s Duct (submandibular duct)", "Stensen''s Duct", "Eustachian Tube", "None"]', 1, 'Obstruction of Wharton''s duct by the tumor leads to obstructive sialadenitis of the submandibular gland.');

    ---------------------------------------------------------------------------
    -- CASE 28: Sublingual Gland Malignancy
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hard Floor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hard Floor', 'A 50-year-old female presents with a painless, hard lump in the floor of her mouth, just lateral to the midline. She thought it was a salivary stone, but it has not resolved.

Vitals: Stable.
Physical Examination: A 2 cm firm, fixed, submucosal mass in the left floor of the mouth (sublingual space). Overlying mucosa is intact.
Laboratory Results: Transoral incisional biopsy confirms Adenoid Cystic Carcinoma.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sublingual Gland Tumor; high rate of malignancy, ACC.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Rule of 80s" (or inverse rule) regarding salivary gland tumors?', '["80% of all tumors are in the parotid; 80% of parotid tumors are benign. Conversely, sublingual tumors are rare, but 80% of them are malignant.", "All salivary tumors are 80% malignant", "80% of tumors are in the submandibular gland", "None"]', 1, 'The smaller the salivary gland, the higher the likelihood that a tumor within it is malignant.'),
    (v_case_id, 'What nerve is at greatest risk during surgical excision of a sublingual gland tumor?', '["Facial nerve", "Lingual nerve (provides sensation to the anterior 2/3 of the tongue)", "Vagus nerve", "None"]', 1, 'The lingual nerve loops directly under Wharton''s duct in the sublingual space.'),
    (v_case_id, 'Given the diagnosis of Adenoid Cystic Carcinoma, what postoperative therapy is almost always indicated?', '["Chemotherapy only", "Postoperative Radiation Therapy (PORT) to the primary site and nerve pathways", "No further therapy", "None"]', 1, 'Due to its high propensity for perineural invasion and local recurrence, PORT is standard of care.');

    ---------------------------------------------------------------------------
    -- CASE 29: Lymphoma of Waldeyer''s Ring (Tonsil)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Massive Tonsil' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Massive Tonsil', 'A 65-year-old male presents with rapidly progressive unilateral left tonsillar enlargement, muffled voice, and night sweats over 3 weeks.

Vitals: Temp 99.5°F.
Physical Examination: Left tonsil is massive (Grade 4), pushing the uvula across the midline. It is smooth and non-ulcerated. Right tonsil is Grade 1. Massive, rubbery lymphadenopathy in the left neck.
Laboratory Results: Tonsillectomy is performed for tissue diagnosis. Pathology shows sheets of large B-cells replacing normal architecture. Diagnosis: Diffuse Large B-Cell Lymphoma (DLBCL).', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Non-Hodgkin Lymphoma; unilateral tonsil hypertrophy, Waldeyer''s ring.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Rapid unilateral tonsil hypertrophy in an adult is highly suspicious for:', '["Tonsillitis", "Malignancy (SCC or Lymphoma)", "Allergy", "None"]', 1, 'While SCC is usually ulcerated and painful, lymphoma in the tonsil often presents as massive, smooth, painless enlargement.'),
    (v_case_id, 'What is Waldeyer''s Ring?', '["A cartilage ring in the trachea", "The ring of lymphoid tissue in the pharynx: Palatine tonsils, Pharyngeal tonsil (adenoids), Lingual tonsils, and Tubal tonsils", "A vocal cord structure", "None"]', 1, 'This is a common extranodal site for Non-Hodgkin Lymphoma in the head and neck.'),
    (v_case_id, 'What is the primary treatment for DLBCL of the tonsil?', '["Radical neck dissection", "Systemic Chemotherapy (e.g., R-CHOP) with or without radiation; surgery is only for biopsy", "Observation", "None"]', 1, 'Lymphoma is treated medically; surgical resection does not improve survival and adds unnecessary morbidity.');

    ---------------------------------------------------------------------------
    -- CASE 30: Unknown Primary SCC (CUP)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Mystery Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Mystery Mass', 'A 55-year-old male smoker presents with a 4 cm hard, painless mass in the right mid-jugular region (Level III). He has no throat symptoms, mouth sores, or hoarseness.

Vitals: Stable.
Physical Examination: 4 cm firm mass right neck. Complete head and neck mucosal exam (including fiberoptic laryngoscopy) reveals absolutely no visible lesions.
Laboratory Results: FNA of the neck mass shows metastatic Squamous Cell Carcinoma. PET/CT scan shows intense uptake in the neck node but no obvious primary site.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Carcinoma of Unknown Primary (CUP); metastatic neck SCC, hidden primary.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely source of a metastatic SCC in a cervical lymph node when no primary is obvious?', '["The lungs", "The mucosal surfaces of the upper aerodigestive tract (Waldeyer''s ring, base of tongue, tonsils, pyriform sinus)", "The brain", "None"]', 1, 'Small, hidden ("occult") tumors in the tonsillar crypts or base of tongue are the most common culprits.'),
    (v_case_id, 'What is the essential next diagnostic step for this patient?', '["Observation", "Panendoscopy (Direct Laryngoscopy, Esophagoscopy, Bronchoscopy) with directed biopsies and bilateral tonsillectomy", "Immediate radical neck dissection", "None"]', 1, 'A thorough operative search under general anesthesia is required to find the hidden primary.'),
    (v_case_id, 'If the tumor is tested and found to be p16-positive, where is the primary tumor almost certainly located?', '["The larynx", "The Oropharynx (Tonsil or Base of Tongue)", "The oral cavity", "None"]', 1, 'p16 positivity (HPV-driven) strongly localizes the occult primary to the lymphoid tissue of the oropharynx.');

    ---------------------------------------------------------------------------
    -- CASE 31: Cutaneous SCC of the Ear
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Crusting Ear' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Crusting Ear', 'A 75-year-old male with a history of extensive sun exposure presents with a crusted, bleeding lesion on the superior helix of his right ear that has been growing for a year.

Vitals: Stable.
Physical Examination: A 2 cm ulcerated, hyperkeratotic plaque firmly attached to the underlying cartilage of the ear helix. No neck masses.
Laboratory Results: Punch biopsy confirms invasive Squamous Cell Carcinoma.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Cutaneous SCC; ear helix, cartilage involvement.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is cutaneous SCC of the ear considered higher risk than SCC on other sun-exposed areas like the forearm?', '["It is not", "High risk of early local cartilage invasion, perineural invasion, and a higher rate of metastasis to parotid/cervical lymph nodes (up to 10-15%)", "It is harder to see", "None"]', 1, 'The thin skin over the cartilage allows for rapid deep invasion and lymphatic spread.'),
    (v_case_id, 'What is the primary lymphatic drainage basin for a tumor on the anterior ear/helix?', '["Submandibular nodes", "The Parotid lymph nodes and upper jugular (Level II) nodes", "Supraclavicular nodes", "None"]', 1, 'Metastatic spread from the anterior scalp/ear typically goes to the parotid gland first.'),
    (v_case_id, 'What surgical margin is generally required for high-risk cutaneous SCC of the ear?', '["1 mm", "At least 4-6 mm, often requiring wedge excision of the cartilage or Mohs micrographic surgery", "No margins needed", "None"]', 1, 'Adequate deep and peripheral margins are critical to prevent recurrence.');

    ---------------------------------------------------------------------------
    -- CASE 32: Basal Cell Carcinoma (Nodular)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pearly Papule' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pearly Papule', 'A 65-year-old female presents with a small, slow-growing bump on her nose. She states it occasionally bleeds when she washes her face.

Vitals: Stable.
Physical Examination: A 6 mm pearly, translucent papule with central ulceration and visible arborizing telangiectasias (tiny blood vessels) on the right nasal ala.
Laboratory Results: Biopsy shows nests of basaloid cells with peripheral palisading.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Nodular BCC; pearly papule, telangiectasias, sun-exposed face.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common malignancy in humans?', '["Melanoma", "Basal Cell Carcinoma (BCC), typically found on the sun-exposed head and neck", "SCC", "None"]', 1, 'BCC accounts for the vast majority of all skin cancers.'),
    (v_case_id, 'What is the clinical hallmark of Nodular BCC?', '["A black mole", "A \"pearly\" or translucent papule with rolled borders and telangiectasias", "A red, scaly patch", "None"]', 1, 'This classic appearance often makes clinical diagnosis highly accurate.'),
    (v_case_id, 'What is the metastatic potential of Basal Cell Carcinoma?', '["Extremely high", "Extremely low (<0.1%); however, it is locally destructive (\"rodent ulcer\") if left untreated", "50%", "None"]', 1, 'While it rarely kills via metastasis, it can cause severe disfigurement by invading local structures like the eye, nose, or brain.');

    ---------------------------------------------------------------------------
    -- CASE 33: Head & Neck Melanoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Changing Mole' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Changing Mole', 'A 50-year-old male presents because his wife noticed a mole on his left cheek has changed color and shape over the last 3 months.

Vitals: Stable.
Physical Examination: A 1.2 cm asymmetric, irregularly bordered macule on the left cheek with varying shades of brown, black, and blue.
Laboratory Results: Excisional biopsy reveals Malignant Melanoma with a Breslow thickness of 1.5 mm. No ulceration.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Melanoma; ABCDE criteria, Breslow thickness dictates margins.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What dictates the required surgical margin for excising a melanoma?', '["The diameter of the lesion (A-B-C-D)", "The Breslow Depth (thickness of the tumor in millimeters from the granular layer to the deepest tumor cell)", "The patient''s age", "None"]', 1, 'Breslow depth is the single most important prognostic factor and guides surgical margins.'),
    (v_case_id, 'For a 1.5 mm thick melanoma on the cheek, what is the appropriate surgical margin?', '["0.5 cm", "1 to 2 cm (typically 1 cm for 1-2mm depth, or up to 2cm depending on location)", "5 cm", "None"]', 1, 'Strict margins are required to prevent local recurrence.'),
    (v_case_id, 'What additional staging procedure is indicated for a melanoma of 1.5 mm depth?', '["Whole brain radiation", "Sentinel Lymph Node Biopsy (SLNB) to check for occult regional micrometastasis", "Nothing", "None"]', 1, 'SLNB is generally indicated for melanomas >0.8 mm thick or those with high-risk features (ulceration, high mitosis).');

    ---------------------------------------------------------------------------
    -- CASE 34: Laryngeal Chondrosarcoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Hard Larynx' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Hard Larynx', 'A 65-year-old male presents with a long history of slowly progressive hoarseness and a hard mass on the outside of his "Adam''s apple."

Vitals: Stable.
Physical Examination: A hard, non-tender mass is palpable over the cricoid cartilage. Laryngoscopy shows a smooth, submucosal bulge in the subglottis covered by normal-appearing mucosa.
Laboratory Results: CT neck shows a mass arising from the cricoid cartilage with "popcorn" calcifications. Biopsy confirms low-grade Chondrosarcoma.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Chondrosarcoma of Larynx; cricoid cartilage, popcorn calcifications.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common site for a chondrosarcoma of the larynx?', '["The epiglottis", "The cricoid cartilage (usually the posterior lamina)", "The true vocal cords", "None"]', 1, 'It typically arises from the hyaline cartilage of the cricoid.'),
    (v_case_id, 'How does the clinical presentation differ from classic SCC of the larynx?', '["It bleeds profusely", "It presents as a slow-growing, submucosal mass with intact mucosa, whereas SCC is typically ulcerated and exophytic", "It causes immediate airway collapse", "None"]', 1, 'Because it arises from the cartilage, the overlying mucosa is initially spared.'),
    (v_case_id, 'What is the standard treatment for a low-grade laryngeal chondrosarcoma?', '["Radiation therapy", "Surgical excision with preservation of laryngeal function if possible (e.g., partial laryngectomy or cricoid resection)", "Chemotherapy", "None"]', 1, 'Chondrosarcomas are highly radioresistant; surgical removal is the only effective treatment.');

    ---------------------------------------------------------------------------
    -- CASE 35: Schwannoma (Neurilemmoma) of the Neck
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Shocking Neck Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Shocking Neck Mass', 'A 40-year-old female presents with a slow-growing, painless lump in her right lateral neck. Palpation of the mass elicits a "shooting" electrical sensation down her arm.

Vitals: Stable.
Physical Examination: A 3 cm firm, oval mass in the right level III/IV neck. It is mobile side-to-side, but not up-and-down.
Laboratory Results: MRI shows a well-circumscribed mass along the path of the brachial plexus. Histology shows alternating Antoni A (dense, Verocay bodies) and Antoni B (loose, myxoid) areas.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Schwannoma; nerve sheath tumor, Antoni A/B, Tinel''s sign.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a Schwannoma?', '["A malignant muscle tumor", "A benign nerve sheath tumor arising from Schwann cells, which myelinate peripheral nerves", "A lymph node", "None"]', 1, 'They are typically encapsulated and can often be dissected free from the underlying nerve fibers.'),
    (v_case_id, 'What is the clinical phenomenon where tapping the mass causes shooting pain?', '["Trousseau''s sign", "Tinel''s sign, indicating irritation of the involved nerve", "Chvostek''s sign", "None"]', 1, 'This strongly suggests a neurogenic origin for the mass.'),
    (v_case_id, 'What are the classic histological findings of a Schwannoma?', '["Keratin pearls", "Alternating dense hypercellular areas (Antoni A) with palisading nuclei (Verocay bodies) and loose hypocellular areas (Antoni B)", "Orphan Annie eyes", "None"]', 1, 'These features are pathognomonic for a schwannoma.');

    ---------------------------------------------------------------------------
    -- CASE 36: Sialadenosis (Sialosis)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Chipmunk Cheeks' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Chipmunk Cheeks', 'A 28-year-old female with a history of anorexia nervosa and bulimia presents with painless, bilateral swelling of her cheeks. She has no fever or dry mouth.

Vitals: BMI 17.
Physical Examination: Bilateral, diffuse, non-tender enlargement of the parotid glands. Saliva flows clearly from Stensen''s ducts on massage.
Laboratory Results: Normal WBC. Amylase is mildly elevated. Fine needle aspiration shows normal, enlarged acinar cells with no inflammation.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sialadenosis; bulimia/alcoholism, bilateral painless parotid swelling.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is Sialadenosis?', '["A bacterial infection of the parotid", "A non-neoplastic, non-inflammatory, bilateral enlargement of the salivary glands (usually parotid) due to acinar hypertrophy", "A cancerous tumor", "None"]', 1, 'It is an autonomic neuropathy affecting the salivary glands.'),
    (v_case_id, 'What are the classic systemic conditions associated with Sialadenosis?', '["Hypertension and asthma", "Eating disorders (bulimia, anorexia), chronic alcoholism, diabetes mellitus, and malnutrition", "Autoimmune disease", "None"]', 1, 'Treatment involves addressing the underlying systemic condition, not surgery.'),
    (v_case_id, 'How does Sialadenosis differ from Sjogren''s syndrome clinically?', '["Sjogren''s is painless", "Sialadenosis patients typically have normal salivary flow and NO sicca symptoms (dry eyes/dry mouth), whereas Sjogren''s is defined by severe dryness", "They are identical", "None"]', 1, 'Sjogren''s involves autoimmune destruction of the gland, while sialadenosis is just cellular hypertrophy.');

    ---------------------------------------------------------------------------
    -- CASE 37: Sjogren''s Syndrome & Lymphoma Risk
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Dry Mouth Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Dry Mouth Mass', 'A 55-year-old female with a long history of primary Sjogren''s syndrome (severe dry mouth and dry eyes) presents with a rapidly enlarging, firm, painless mass in her left parotid gland.

Vitals: Stable.
Physical Examination: Left parotid is diffusely enlarged and hard. She has rampant dental caries.
Laboratory Results: SS-A (Ro) and SS-B (La) antibodies are positive. Core biopsy of the new mass reveals MALT (Mucosa-Associated Lymphoid Tissue) Lymphoma.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sjogren''s Syndrome; high risk of MALT lymphoma in parotid.', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Patients with Sjogren''s syndrome are at a significantly increased risk (up to 44 times) of developing which malignancy?', '["Squamous cell carcinoma", "Non-Hodgkin Lymphoma (specifically MALT lymphoma or diffuse large B-cell lymphoma) within the salivary glands", "Thyroid cancer", "None"]', 1, 'A sudden, unilateral, or rapid enlargement of a gland in a Sjogren''s patient must be biopsied to rule out lymphoma.'),
    (v_case_id, 'What is the underlying pathophysiology of Sjogren''s syndrome?', '["Viral infection", "Autoimmune lymphocytic infiltration and destruction of the exocrine glands (salivary and lacrimal)", "Radiation damage", "None"]', 1, 'This leads to the classic "sicca" complex: xerostomia (dry mouth) and keratoconjunctivitis sicca (dry eyes).'),
    (v_case_id, 'How is the diagnosis of Sjogren''s syndrome often confirmed pathologically?', '["Parotid biopsy", "Minor salivary gland biopsy of the inner lip showing focal lymphocytic sialadenitis", "Blood culture", "None"]', 1, 'A lip biopsy is a low-morbidity procedure that provides definitive tissue diagnosis.');

    ---------------------------------------------------------------------------
    -- CASE 38: Ameloblastoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Swollen Jaw' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Swollen Jaw', 'A 35-year-old male presents with painless swelling of his left lower jaw that has been slowly increasing over a year. He has no numbness.

Vitals: Stable.
Physical Examination: A hard, bony expansion of the left posterior mandible. Teeth in the area are displaced but vital.
Laboratory Results: Panoramic X-ray (Panorex) shows a large, multilocular, radiolucent "soap bubble" lesion in the posterior mandible. Biopsy shows islands of odontogenic epithelium with peripheral palisading and reverse nuclear polarity.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Ameloblastoma; benign but aggressive jaw tumor, soap bubble X-ray.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is an Ameloblastoma?', '["A malignant bone cancer", "A benign but locally aggressive odontogenic tumor arising from enamel-forming epithelium", "A dental abscess", "None"]', 1, 'It is the most common clinically significant odontogenic tumor.'),
    (v_case_id, 'What is the classic radiographic appearance of an ameloblastoma?', '["Sunburst pattern", "A multilocular radiolucency often described as a \"soap bubble\" or \"honeycomb\" pattern", "Solid calcification", "None"]', 1, 'It causes massive expansion and thinning of the cortical bone.'),
    (v_case_id, 'What is the standard treatment for a solid/multicystic ameloblastoma?', '["Simple curettage (scraping)", "En bloc surgical resection with 1-1.5 cm bony margins to prevent recurrence", "Radiation", "None"]', 1, 'If treated with simple curettage (scraping), recurrence rates approach 50-90%. Wide resection is required.');

    ---------------------------------------------------------------------------
    -- CASE 39: Odontogenic Keratocyst (OKC)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Jaw Cyst' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Jaw Cyst', 'A 20-year-old male is found to have a large radiolucency in his right mandible on a routine dental X-ray. He is completely asymptomatic.

Vitals: Stable.
Physical Examination: No clinical swelling, teeth are normal.
Laboratory Results: X-ray shows a unilocular radiolucency associated with an impacted wisdom tooth. Biopsy of the cyst lining shows a thin layer of parakeratinized stratified squamous epithelium with a corrugated surface.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Odontogenic Keratocyst (OKC); high recurrence, Gorlin syndrome.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is an Odontogenic Keratocyst (OKC) clinically significant compared to a simple dental cyst?', '["It causes immediate bone fracture", "It has a high recurrence rate (up to 30%) and aggressive growth potential along the medullary cavity of the bone", "It is always malignant", "None"]', 1, 'Because of its recurrence rate, treatment often involves aggressive curettage and application of a chemical fixative (Carnoy''s solution).'),
    (v_case_id, 'The presence of multiple OKCs in a young patient should raise strong suspicion for which genetic syndrome?', '["Down Syndrome", "Gorlin Syndrome (Nevoid Basal Cell Carcinoma Syndrome)", "MEN 2", "None"]', 1, 'Gorlin syndrome (PTCH1 mutation) includes multiple OKCs, multiple basal cell carcinomas, palmar/plantar pits, and calcified falx cerebri.'),
    (v_case_id, 'How does an OKC typically grow in the mandible?', '["It immediately expands the bone outward", "It tends to grow anteroposteriorly along the medullary cavity without causing obvious cortical expansion until it is very large", "It only grows upward into the mouth", "None"]', 1, 'This is why they are often large but asymptomatic when discovered on X-ray.');

    ---------------------------------------------------------------------------
    -- CASE 40: Branchial Cleft Cyst vs. Metastatic SCC
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cystic Mass in an Adult' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cystic Mass in an Adult', 'A 55-year-old male with a history of smoking presents with a painless, 4 cm cystic mass in the upper lateral neck (Level II), anterior to the sternocleidomastoid muscle.

Vitals: Stable.
Physical Examination: Soft, fluctuant mass in the right neck. An initial outside physician diagnosed it as a "Branchial Cleft Cyst" and drained it, but it returned immediately.
Laboratory Results: Repeat FNA of the cyst wall (not just the fluid) reveals squamous cell carcinoma.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Metastatic SCC presenting as a cyst; adult "branchial cleft cyst" rule.', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the cardinal rule regarding a newly diagnosed "branchial cleft cyst" in an adult over age 40?', '["It requires immediate antibiotics", "It must be considered a cystic metastasis from a mucosal Squamous Cell Carcinoma (often HPV+ tonsil/base of tongue) until proven otherwise", "It is always benign", "None"]', 1, 'True branchial cleft cysts present in childhood or early adulthood; new cystic masses in older adults are highly suspicious for malignancy.'),
    (v_case_id, 'Why is simple incision and drainage (I&D) of an undiagnosed lateral neck cyst in an adult contraindicated?', '["It won''t work", "It risks seeding tumor cells into the skin and complicating future curative surgical neck dissection", "It causes bleeding", "None"]', 1, 'FNA is the appropriate diagnostic step; I&D or open biopsy of a neck mass should be avoided until a primary tumor is ruled out.'),
    (v_case_id, 'If the FNA shows SCC, what is the most appropriate next step in management?', '["Remove the cyst", "Panendoscopy with directed biopsies of the nasopharynx, tonsils, base of tongue, and pyriform sinuses, often including a tonsillectomy", "Give antibiotics", "None"]', 1, 'The primary goal is to find the hidden mucosal primary tumor before treating the neck.');

    ---------------------------------------------------------------------------
    -- CASE 41: Minor Salivary Gland Tumors (Hard Palate)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Palate Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Palate Mass', 'A 45-year-old male presents with a painless, smooth bulge on the roof of his mouth that has been growing slowly over a year. He wears upper dentures, which no longer fit.

Vitals: Stable.
Physical Examination: A 2 cm firm, submucosal, non-ulcerated mass on the right posterior hard palate.
Laboratory Results: Incisional biopsy shows Pleomorphic Adenoma of a minor salivary gland.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Minor Salivary Gland Tumor; hard palate is most common site.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where are minor salivary glands located in the head and neck?', '["Only in the cheek", "Scattered throughout the oral cavity, pharynx, larynx, and sinonasal tract; the hard and soft palate is the most common site", "In the ear", "None"]', 1, 'There are hundreds of minor salivary glands distributed in the upper aerodigestive tract mucosa.'),
    (v_case_id, 'What is the most common benign tumor of the minor salivary glands?', '["Lipoma", "Pleomorphic Adenoma", "Warthin tumor", "None"]', 1, 'Just like in the major glands, pleomorphic adenoma is the most common benign neoplasm.'),
    (v_case_id, 'If a tumor on the hard palate is malignant, what is the most likely histology?', '["Squamous cell carcinoma", "Adenoid Cystic Carcinoma or Mucoepidermoid Carcinoma", "Melanoma", "None"]', 1, 'Salivary malignancies are far more common than SCC on the hard palate (unlike the floor of mouth or tongue).');

    ---------------------------------------------------------------------------
    -- CASE 42: Esthesioneuroblastoma (Recap/Variant Presentation)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Red Nasal Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Red Nasal Mass', 'A 50-year-old female presents with anosmia, epistaxis, and a red mass in the high nasal vault.

Vitals: Stable.
Physical Examination: Friable mass in the superior meatus.
Laboratory Results: Positive for NSE, S-100, and chromogranin. Diagnosis: Olfactory Neuroblastoma.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Esthesioneuroblastoma; recap of immunohistochemistry.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What immunohistochemical markers are positive in Esthesioneuroblastoma?', '["Keratin only", "Synaptophysin, Chromogranin, NSE, and S-100 (neuroendocrine markers)", "CD20", "None"]', 1, 'These markers confirm the tumor''s neural crest / neuroendocrine origin.'),
    (v_case_id, 'Which anatomical structure must be resected to achieve a cure?', '["The entire nose", "The cribriform plate and olfactory bulbs via a craniofacial approach", "The hard palate", "None"]', 1, 'En bloc resection of the anterior cranial base is the standard of care.'),
    (v_case_id, 'What is a common late complication or recurrence site for this tumor?', '["Liver", "Cervical lymph nodes (metastasis can occur years later)", "Bones", "None"]', 1, 'Long-term surveillance is required due to the risk of delayed cervical nodal metastasis.');

    ---------------------------------------------------------------------------
    -- CASE 43: Head and Neck Osteosarcoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rapid Jaw Expansion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rapid Jaw Expansion', 'A 25-year-old male presents with rapid, painful swelling of his right lower jaw, loosening of his teeth, and numbness of his lower lip.

Vitals: Stable.
Physical Examination: A hard, tender expansion of the right mandible body.
Laboratory Results: X-ray shows a destructive radiolucent and radiopaque lesion with a "sunburst" pattern of periosteal reaction. Biopsy shows malignant mesenchymal cells producing osteoid.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Osteosarcoma of Jaw; rapid growth, sunburst X-ray, osteoid.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnostic histopathologic feature of Osteosarcoma?', '["Cartilage formation", "The production of malignant osteoid (unmineralized bone matrix) by the tumor cells", "Amyloid", "None"]', 1, 'This differentiates it from fibrosarcoma or chondrosarcoma.'),
    (v_case_id, 'What is the classic radiographic sign associated with osteosarcoma?', '["Soap bubble", "A \"sunburst\" or \"sunray\" appearance due to aggressive periosteal reaction and bone formation perpendicular to the cortex", "Punched-out lesions", "None"]', 1, 'Codman''s triangle (elevation of the periosteum) is also frequently seen.'),
    (v_case_id, 'How does the prognosis of jaw osteosarcoma compare to osteosarcoma of the long bones (e.g., femur)?', '["Worse", "Generally better, as they tend to metastasize later and less frequently than long bone osteosarcomas", "The same", "None"]', 1, 'Treatment is primarily wide surgical resection, often combined with chemotherapy.');

    ---------------------------------------------------------------------------
    -- CASE 44: Fibrous Dysplasia
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Asymmetric Face' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Asymmetric Face', 'A 16-year-old girl presents with slow, painless enlargement of her right cheek bone (maxilla) over several years, leading to facial asymmetry.

Vitals: Normal.
Physical Examination: Diffuse, hard, painless expansion of the right maxilla. Teeth are displaced but not loose.
Laboratory Results: CT scan shows a characteristic "ground-glass" appearance of the expanded bone blending into normal bone. Biopsy shows fibrous stroma with irregular, "Chinese character" shaped bone trabeculae.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Fibrous Dysplasia; ground-glass CT, Chinese character bone, McCune-Albright.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is Fibrous Dysplasia?', '["A malignant bone cancer", "A benign developmental condition where normal bone is replaced by cellular fibrous connective tissue and irregular bone trabeculae", "An infection", "None"]', 1, 'It is caused by a post-zygotic mutation in the GNAS1 gene.'),
    (v_case_id, 'What is the classic radiographic appearance of Fibrous Dysplasia?', '["Sunburst pattern", "A \"ground-glass\" or frosted glass appearance on CT, with poorly defined margins blending into normal bone", "Punched out radiolucencies", "None"]', 1, 'This appearance is due to the fine, irregular woven bone network within the fibrous stroma.'),
    (v_case_id, 'If a patient has polyostotic fibrous dysplasia, café-au-lait skin macules, and precocious puberty, what syndrome is present?', '["Gorlin Syndrome", "McCune-Albright Syndrome", "MEN 1", "None"]', 1, 'This is a classic triad for this rare genetic disorder.');

    ---------------------------------------------------------------------------
    -- CASE 45: Infantile Hemangioma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Growing Strawberry' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Growing Strawberry', 'A 3-month-old infant is brought in by her parents. They note a red, raised mark on her cheek that was barely visible at birth but has grown rapidly over the last 2 months.

Vitals: Normal.
Physical Examination: A bright red, bosselated, compressible mass ("strawberry") on the left cheek.
Laboratory Results: Clinical diagnosis is sufficient. MRI (if done) would show a well-defined, intensely enhancing solid mass.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Infantile Hemangioma; rapid growth phase, spontaneous involution.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the natural history of an Infantile Hemangioma?', '["Grows forever", "Absent at birth, rapid proliferation during the first year of life, followed by slow, spontaneous involution over years (up to age 5-10)", "Present fully formed at birth", "None"]', 1, 'This predictable life cycle distinguishes it from congenital hemangiomas and vascular malformations.'),
    (v_case_id, 'When is medical treatment indicated for a hemangioma?', '["Always", "When it causes functional impairment (e.g., blocking vision, airway obstruction) or severe cosmetic disfigurement (ulceration)", "Never", "None"]', 1, 'Most uncomplicated hemangiomas are simply observed due to their natural tendency to shrink.'),
    (v_case_id, 'What is the current first-line medical therapy for a problematic, proliferating infantile hemangioma?', '["Surgical excision", "Oral Propranolol (a non-selective beta-blocker)", "Steroids", "None"]', 1, 'Propranolol causes rapid vasoconstriction and promotes early involution of the tumor.');

    ---------------------------------------------------------------------------
    -- CASE 46: Lymphatic Malformation (Cystic Hygroma)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Transilluminating Neck Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Transilluminating Neck Mass', 'A 2-year-old child presents with a large, soft, painless mass in the left posterior triangle of the neck, noticed shortly after a recent upper respiratory infection.

Vitals: Stable.
Physical Examination: A 5 cm soft, doughy, compressible mass in the left supraclavicular/posterior triangle region. It brilliantly transilluminates when a light is placed against it.
Laboratory Results: Ultrasound shows a large, multiloculated cystic structure with thin septations. No solid components.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Lymphatic Malformation (Cystic Hygroma); transilluminates, pediatric.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a Cystic Hygroma?', '["A cancerous tumor", "A macrocystic lymphatic malformation caused by failure of the lymphatic channels to connect to the venous system during embryogenesis", "A swollen lymph node", "None"]', 1, 'They are most commonly found in the posterior triangle of the neck.'),
    (v_case_id, 'What physical exam finding helps distinguish a cystic hygroma from a solid neck mass?', '["It is red", "Brilliant transillumination with a penlight", "It is rock hard", "None"]', 1, 'Because it is filled with clear lymphatic fluid (chyle), light passes through it easily.'),
    (v_case_id, 'What are the main treatment options for a symptomatic macrocystic lymphatic malformation?', '["Antibiotics", "Surgical excision or Sclerotherapy (injection of an irritating substance like OK-432 or Bleomycin to collapse the cysts)", "Radiation", "None"]', 1, 'Sclerotherapy is highly effective for large, macrocystic lesions and avoids surgical scarring.');

    ---------------------------------------------------------------------------
    -- CASE 47: Thyroglossal Duct Cyst (TGDC) Carcinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Malignant Midline Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Malignant Midline Mass', 'A 40-year-old female undergoes a Sistrunk procedure for what was clinically diagnosed as a benign Thyroglossal Duct Cyst (a midline mass that elevated with swallowing).

Vitals: Stable.
Physical Examination: Post-operative review.
Laboratory Results: The pathology report on the excised cyst reveals a 1 cm focus of Papillary Thyroid Carcinoma arising within the wall of the thyroglossal duct cyst.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'TGDC Carcinoma; papillary thyroid cancer in a midline cyst.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why can thyroid cancer occur in a Thyroglossal Duct Cyst?', '["Metastasis from the lungs", "The cyst is a remnant of the tract left behind when the thyroid gland descended from the foramen cecum; therefore, it contains ectopic thyroid tissue", "It is a coincidence", "None"]', 1, 'Ectopic thyroid tissue within the cyst wall can undergo malignant transformation (about 1% of TGDCs).'),
    (v_case_id, 'What is the most common type of malignancy found in a TGDC?', '["Squamous cell carcinoma", "Papillary Thyroid Carcinoma (approx. 80-90% of cases)", "Medullary Carcinoma", "None"]', 1, 'Since it arises from follicular cells, papillary carcinoma is the most common.'),
    (v_case_id, 'If a patient is diagnosed with TGDC carcinoma after a Sistrunk procedure, what is typically the next step?', '["Chemotherapy", "A formal ultrasound of the main thyroid gland in the lower neck; if the gland is normal, the Sistrunk procedure alone is often sufficient for small tumors", "Immediate neck dissection", "None"]', 1, 'Total thyroidectomy is only indicated if the main thyroid gland has suspicious nodules or if the tumor is large/aggressive.');

    ---------------------------------------------------------------------------
    -- CASE 48: Extramedullary Plasmacytoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Nasal Mass and Protein' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Nasal Mass and Protein', 'A 60-year-old male presents with unilateral nasal obstruction and epistaxis.

Vitals: Stable.
Physical Examination: A fleshy, smooth mass in the nasal cavity.
Laboratory Results: Biopsy shows a dense infiltrate of atypical plasma cells. Serum protein electrophoresis (SPEP) shows a monoclonal spike (M-spike). Bone marrow biopsy is normal. Skeletal survey shows no lytic bone lesions.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Extramedullary Plasmacytoma; localized plasma cell tumor, upper airway.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is an Extramedullary Plasmacytoma?', '["A benign polyp", "A localized proliferation of neoplastic monoclonal plasma cells outside of the bone marrow", "A sinus infection", "None"]', 1, 'The upper aerodigestive tract (sinonasal cavity, nasopharynx) is the most common site.'),
    (v_case_id, 'How does this differ from Multiple Myeloma?', '["It is the same thing", "Multiple myeloma is a systemic disease with bone marrow involvement and lytic bone lesions; EMP is localized without systemic marrow involvement", "EMP is always fatal", "None"]', 1, 'Patients with EMP must be closely monitored because 10-30% eventually progress to Multiple Myeloma.'),
    (v_case_id, 'What is the primary treatment for an isolated Extramedullary Plasmacytoma of the head and neck?', '["Systemic chemotherapy", "Radiation therapy (plasma cells are highly radiosensitive)", "Observation", "None"]', 1, 'Radiation therapy provides excellent local control and high cure rates for isolated lesions.');

    ---------------------------------------------------------------------------
    -- CASE 49: Rhabdomyosarcoma (Pediatric)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Child''s Ear Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Child''s Ear Mass', 'A 5-year-old boy is brought in with a rapidly enlarging mass behind his right ear, facial weakness, and bloody discharge from the ear canal.

Vitals: Stable.
Physical Examination: A polypoid, fleshy mass filling the external auditory canal. Right-sided facial nerve palsy (House-Brackmann Grade IV).
Laboratory Results: Biopsy shows small, round, blue cells with positive immunohistochemistry for desmin and myogenin.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Rhabdomyosarcoma; pediatric sarcoma, ear/parameningeal site, desmin positive.', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common soft tissue sarcoma in children?', '["Osteosarcoma", "Rhabdomyosarcoma", "Liposarcoma", "None"]', 1, 'Approximately 35-40% of pediatric rhabdomyosarcomas occur in the head and neck.'),
    (v_case_id, 'What is the significance of the immunohistochemical markers desmin and myogenin?', '["They indicate nerve tissue", "They confirm the tumor is of skeletal muscle origin (myogenic differentiation)", "They indicate a benign tumor", "None"]', 1, 'These markers differentiate it from other "small round blue cell tumors" of childhood (like neuroblastoma or Ewing sarcoma).'),
    (v_case_id, 'Why are parameningeal locations (like the middle ear, nasopharynx, and paranasal sinuses) high risk?', '["They are hard to see", "Because the tumor can rapidly invade through the skull base into the central nervous system (meninges and brain)", "They bleed easily", "None"]', 1, 'Parameningeal tumors require aggressive multimodality therapy (Chemotherapy + Radiation) to prevent CNS spread.');

    ---------------------------------------------------------------------------
    -- CASE 50: Non-Melanoma Skin Cancer (Summary)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Scalp Lesions' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Scalp Lesions', 'A 72-year-old bald male presents with two distinct lesions on his sun-exposed scalp. Lesion A is a pearly nodule with telangiectasias. Lesion B is a rough, scaly, erythematous patch.

Vitals: Stable.
Physical Examination: 
Lesion A: 5mm nodule, rolled borders.
Lesion B: 1cm hyperkeratotic plaque, tender to palpation.
Laboratory Results: Biopsy of A shows Basal Cell Carcinoma. Biopsy of B shows Actinic Keratosis.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'NMSC Summary; BCC vs Actinic Keratosis (pre-SCC).', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the relationship between Actinic Keratosis (Lesion B) and skin cancer?', '["It is a form of melanoma", "Actinic Keratosis is a premalignant lesion that can progress to invasive Squamous Cell Carcinoma (SCC)", "It is a benign freckle", "None"]', 1, 'Treating AKs (e.g., with cryotherapy or topical 5-FU) prevents the development of SCC.'),
    (v_case_id, 'Which skin cancer (BCC or SCC) has a higher propensity to metastasize to regional lymph nodes?', '["BCC", "Squamous Cell Carcinoma (SCC)", "They are equal", "None"]', 1, 'While BCC is locally destructive, SCC has a much higher rate of metastasis, particularly on the scalp, ears, and lips.'),
    (v_case_id, 'What is Mohs Micrographic Surgery?', '["A type of chemotherapy", "A specialized surgical technique that provides 100% margin evaluation while sparing healthy tissue, ideal for high-risk facial skin cancers", "A radiation treatment", "None"]', 1, 'Mohs surgery offers the highest cure rates for NMSC while maximizing cosmetic preservation on the face.');

END $$;
COMMIT;

