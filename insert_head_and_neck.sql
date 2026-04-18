-- ==========================================
-- Insert 'HEAD & NECK' topic into Semester 1 (if doesn't exist)
-- ==========================================

DO $$
DECLARE
    v_topic_id UUID;
    v_semester_id INTEGER := 1;
BEGIN
    SELECT id INTO v_topic_id FROM public.topics WHERE title = 'HEAD & NECK' AND semester_id = v_semester_id;
    
    IF v_topic_id IS NULL THEN
        INSERT INTO public.topics (semester_id, title, "order")
        VALUES (v_semester_id, 'HEAD & NECK', 4)
        RETURNING id INTO v_topic_id;
    ELSE
        -- Specific logic to clear existing HEAD & NECK MCQs to avoid duplicates
        DELETE FROM public.mcqs WHERE topic_id = v_topic_id;
    END IF;
    
    -- Insert MCQs

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The cranial nerve responsible for smell is:', '["Optic", "Olfactory", "Oculomotor", "Trigeminal"]'::jsonb, 1, 'CN I carries olfactory sensation from nasal mucosa.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A fracture of the cribriform plate most directly affects:', '["Hearing", "Smell", "Vision", "Taste from posterior tongue"]'::jsonb, 1, 'Olfactory filaments pass through the cribriform plate.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The optic nerve is:', '["CN I", "CN II", "CN III", "CN IV"]'::jsonb, 1, 'CN II carries visual information from the retina.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The only cranial nerve emerging from the dorsal aspect of the brainstem is:', '["Oculomotor", "Trochlear", "Abducens", "Hypoglossal"]'::jsonb, 1, 'CN IV exits dorsally and supplies superior oblique.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The nerve that abducts the eye is:', '["Oculomotor", "Trochlear", "Abducens", "Facial"]'::jsonb, 2, 'CN VI supplies lateral rectus.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The muscle supplied by the trochlear nerve is:', '["Inferior oblique", "Lateral rectus", "Superior oblique", "Medial rectus"]'::jsonb, 2, 'CN IV innervates superior oblique.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The trigeminal nerve is primarily responsible for:', '["Facial expression", "Mastication and facial sensation", "Taste", "Swallowing"]'::jsonb, 1, 'CN V provides facial sensation and motor to muscles of mastication.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The mandibular division of trigeminal nerve is:', '["Pure sensory", "Pure motor", "Mixed", "Parasympathetic only"]'::jsonb, 2, 'V3 is mixed; V1 and V2 are sensory only.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The corneal reflex afferent limb is carried by:', '["CN II", "CN III", "CN V1", "CN VII"]'::jsonb, 2, 'Ophthalmic division senses corneal touch.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The corneal reflex efferent limb is carried by:', '["CN V3", "CN VI", "CN VII", "CN IX"]'::jsonb, 2, 'Facial nerve closes the eyelids via orbicularis oculi.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of facial nerve causes weakness of:', '["Muscles of mastication", "Muscles of facial expression", "Tongue muscles", "Pharyngeal muscles"]'::jsonb, 1, 'CN VII supplies muscles of facial expression.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Taste from the anterior two-thirds of the tongue is carried by:', '["Glossopharyngeal", "Chorda tympani", "Hypoglossal", "Lingual nerve only"]'::jsonb, 1, 'Chorda tympani carries taste fibers from anterior 2/3.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'General sensation from the anterior two-thirds of the tongue is carried by:', '["Glossopharyngeal", "Vagus", "Lingual nerve", "Hypoglossal"]'::jsonb, 2, 'Lingual nerve is a branch of V3.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Taste from the posterior one-third of the tongue is carried by:', '["Facial nerve", "Glossopharyngeal nerve", "Vagus nerve", "Hypoglossal nerve"]'::jsonb, 1, 'CN IX provides taste and general sensation to posterior 1/3.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The nerve to the muscles of tongue, except palatoglossus, is:', '["Glossopharyngeal", "Vagus", "Hypoglossal", "Lingual"]'::jsonb, 2, 'CN XII supplies intrinsic and extrinsic tongue muscles except palatoglossus.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'On protrusion, the tongue deviates toward the side of a lesion of:', '["Facial nerve", "Vagus nerve", "Hypoglossal nerve", "Glossopharyngeal nerve"]'::jsonb, 2, 'Genioglossus on the normal side pushes tongue toward lesioned side.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The afferent limb of the gag reflex is:', '["CN VII", "CN IX", "CN X", "CN XII"]'::jsonb, 1, 'Glossopharyngeal carries sensation from pharynx.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The efferent limb of the gag reflex is:', '["CN V", "CN VII", "CN X", "CN XII"]'::jsonb, 2, 'Vagus supplies pharyngeal muscles involved in the reflex.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The nerve most at risk during parotid gland surgery is:', '["Glossopharyngeal", "Facial", "Hypoglossal", "Lingual"]'::jsonb, 1, 'Facial nerve passes through the parotid gland.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The largest salivary gland is:', '["Sublingual", "Submandibular", "Parotid", "Lacrimal"]'::jsonb, 2, 'Parotid is the largest major salivary gland.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The parotid duct opens opposite which tooth?', '["Upper first molar", "Upper second molar", "Lower first molar", "Lower second molar"]'::jsonb, 1, 'Stensen duct opens opposite the upper second molar.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The submandibular duct opens at the:', '["Hard palate", "Vestibule opposite upper molar", "Sublingual papilla beside frenulum", "Posterior tongue"]'::jsonb, 2, 'Wharton duct opens on the floor of mouth.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The nerve looping under the submandibular duct is:', '["Facial nerve", "Lingual nerve", "Hypoglossal nerve", "Glossopharyngeal nerve"]'::jsonb, 1, 'Lingual nerve passes inferior then medial to the duct.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The main sensory nerve of the lower teeth is:', '["Lingual", "Inferior alveolar", "Buccal", "Great auricular"]'::jsonb, 1, 'Inferior alveolar nerve enters mandibular foramen.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The mental nerve is a branch of:', '["Facial nerve", "Lingual nerve", "Inferior alveolar nerve", "Glossopharyngeal nerve"]'::jsonb, 2, 'It exits through the mental foramen.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The pterion overlies which artery?', '["Facial artery", "Middle meningeal artery", "Internal carotid artery", "Superficial temporal artery"]'::jsonb, 1, 'Pterion fracture can cause epidural hematoma.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Epidural hematoma classically follows rupture of:', '["Bridging veins", "Middle meningeal artery", "Basilar artery", "Cavernous sinus"]'::jsonb, 1, 'Arterial bleed between skull and dura.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The middle meningeal artery enters skull through:', '["Foramen rotundum", "Foramen spinosum", "Foramen ovale", "Jugular foramen"]'::jsonb, 1, 'It enters via foramen spinosum.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The maxillary nerve passes through:', '["Foramen ovale", "Foramen spinosum", "Foramen rotundum", "Superior orbital fissure"]'::jsonb, 2, 'V2 exits middle cranial fossa via foramen rotundum.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The mandibular nerve passes through:', '["Foramen rotundum", "Foramen ovale", "Jugular foramen", "Hypoglossal canal"]'::jsonb, 1, 'V3 exits through foramen ovale.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The ophthalmic nerve enters the orbit via:', '["Inferior orbital fissure", "Superior orbital fissure", "Optic canal", "Foramen rotundum"]'::jsonb, 1, 'V1 enters orbit through superior orbital fissure.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The optic nerve passes through:', '["Optic canal", "Superior orbital fissure", "Foramen lacerum", "Inferior orbital fissure"]'::jsonb, 0, 'CN II and ophthalmic artery use optic canal.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of the recurrent laryngeal nerve causes:', '["Loss of taste", "Hoarseness", "Diplopia", "Facial paralysis"]'::jsonb, 1, 'It supplies most intrinsic laryngeal muscles.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The external branch of superior laryngeal nerve supplies:', '["Cricothyroid", "Posterior cricoarytenoid", "Lateral cricoarytenoid", "Thyroarytenoid"]'::jsonb, 0, 'Cricothyroid tenses vocal cords.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The only muscle that abducts the vocal cords is:', '["Cricothyroid", "Thyroarytenoid", "Posterior cricoarytenoid", "Lateral cricoarytenoid"]'::jsonb, 2, 'It opens the rima glottidis.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'All intrinsic muscles of larynx are supplied by recurrent laryngeal nerve except:', '["Arytenoid", "Thyroarytenoid", "Cricothyroid", "Posterior cricoarytenoid"]'::jsonb, 2, 'Cricothyroid is supplied by external laryngeal nerve.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The thyroid gland is supplied mainly by:', '["Facial and maxillary arteries", "Superior and inferior thyroid arteries", "Lingual and facial arteries", "Vertebral arteries"]'::jsonb, 1, 'Superior thyroid from ECA; inferior thyroid from thyrocervical trunk.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The nerve most vulnerable during ligation of inferior thyroid artery is:', '["External laryngeal nerve", "Recurrent laryngeal nerve", "Hypoglossal nerve", "Accessory nerve"]'::jsonb, 1, 'RLN is closely related to inferior thyroid artery.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The nerve most vulnerable near the superior thyroid artery is:', '["External laryngeal nerve", "Recurrent laryngeal nerve", "Lingual nerve", "Glossopharyngeal nerve"]'::jsonb, 0, 'External laryngeal nerve runs near superior thyroid vessels.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The carotid sheath contains all EXCEPT:', '["Common/internal carotid artery", "Internal jugular vein", "Vagus nerve", "Sympathetic trunk"]'::jsonb, 3, 'Sympathetic trunk lies posterior to the sheath.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The carotid sinus is a baroreceptor located at:', '["Origin of subclavian artery", "Bifurcation of common carotid artery", "Internal jugular vein", "External carotid artery branches"]'::jsonb, 1, 'It senses blood pressure changes.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The carotid body is a chemoreceptor located at:', '["Thyroid cartilage", "Carotid bifurcation", "Jugular foramen", "Base of tongue"]'::jsonb, 1, 'It senses O2, CO2, and pH changes.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Which nerve carries afferents from carotid sinus/body?', '["Facial", "Glossopharyngeal", "Vagus", "Hypoglossal"]'::jsonb, 1, 'Hering nerve is a branch of CN IX.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The sternocleidomastoid is supplied by:', '["CN VII", "CN IX", "CN XI", "CN XII"]'::jsonb, 2, 'Spinal accessory nerve supplies SCM and trapezius.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Injury to spinal accessory nerve in posterior triangle causes weakness of:', '["Mastication", "Shoulder shrug", "Eye closure", "Swallowing"]'::jsonb, 1, 'Trapezius is affected.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The posterior triangle of neck is bounded anteriorly by:', '["Trapezius", "Sternocleidomastoid", "Omohyoid", "Clavicle"]'::jsonb, 1, 'SCM forms the anterior border.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The anterior triangle of neck is bounded laterally by:', '["Trapezius", "Sternocleidomastoid", "Clavicle", "Midline"]'::jsonb, 1, 'SCM forms lateral boundary.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The common carotid artery bifurcates approximately at the level of:', '["C2", "C4", "C6", "T1"]'::jsonb, 1, 'Usually at upper border of thyroid cartilage.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The external carotid artery has branches in the neck, but the internal carotid artery:', '["Has many cervical branches", "Has no branches in the neck", "Ends in face", "Supplies thyroid"]'::jsonb, 1, 'ICA enters skull without cervical branches.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The facial artery can be palpated where it crosses:', '["Zygomatic arch", "Mandible anterior to masseter", "Angle of mandible posteriorly", "Hyoid bone"]'::jsonb, 1, 'Classic facial pulse point.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The scalp has five layers remembered by:', '["SALT", "SCALP", "PALMS", "FACES"]'::jsonb, 1, 'Skin, connective tissue, aponeurosis, loose areolar tissue, pericranium.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The “danger area” of the scalp is the:', '["Skin", "Dense connective tissue", "Loose areolar tissue", "Pericranium"]'::jsonb, 2, 'Infection can spread through emissary veins.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The facial vein communicates with cavernous sinus through:', '["External jugular vein", "Deep facial vein to pterygoid plexus", "Retromandibular vein only", "Superior thyroid vein"]'::jsonb, 1, 'This allows spread of facial infection intracranially.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The main muscle of mastication for elevation of mandible is:', '["Buccinator", "Masseter", "Platysma", "Orbicularis oris"]'::jsonb, 1, 'Masseter elevates the mandible powerfully.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The muscle that protrudes the mandible is mainly:', '["Temporalis", "Medial pterygoid", "Lateral pterygoid", "Buccinator"]'::jsonb, 2, 'Lateral pterygoid protracts mandible.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Muscles of mastication are supplied by:', '["Facial nerve", "Glossopharyngeal nerve", "Mandibular nerve", "Hypoglossal nerve"]'::jsonb, 2, 'Motor fibers of V3 supply them.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The temporomandibular joint is a:', '["Fibrous suture", "Hinge only", "Modified hinge synovial joint", "Ball-and-socket joint"]'::jsonb, 2, 'It allows hinge and gliding movements.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The paranasal sinus that drains into the middle meatus via hiatus semilunaris is:', '["Sphenoidal sinus", "Maxillary sinus", "Posterior ethmoidal sinus", "Frontal air cells only"]'::jsonb, 1, 'Maxillary sinus drainage is clinically important.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The paranasal sinus most commonly infected due to poor drainage is:', '["Frontal", "Ethmoidal", "Maxillary", "Sphenoidal"]'::jsonb, 2, 'Its opening is high on the medial wall.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The sphenoidal sinus opens into the:', '["Inferior meatus", "Middle meatus", "Superior meatus", "Sphenoethmoidal recess"]'::jsonb, 3, 'Sphenoid sinus drains into sphenoethmoidal recess.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The drainage of lacrimal sac enters the:', '["Middle meatus", "Superior meatus", "Inferior meatus", "Sphenoethmoidal recess"]'::jsonb, 2, 'Nasolacrimal duct opens into inferior meatus.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The main blood supply to nasal septum includes all EXCEPT:', '["Sphenopalatine artery", "Greater palatine artery", "Superior labial artery", "Middle meningeal artery directly only"]'::jsonb, 3, 'Kiesselbach area is fed by several arteries, not middle meningeal alone as direct main source.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Epistaxis most commonly arises from:', '["Little\u2019s area", "Cavernous sinus", "Maxillary sinus", "Frontal sinus"]'::jsonb, 0, 'Kiesselbach/Little’s area is a common bleeding site.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The palatine tonsil lies between:', '["Palatoglossal and palatopharyngeal arches", "Uvula and hard palate", "Superior and middle constrictors", "Tongue and epiglottis"]'::jsonb, 0, 'It sits in the tonsillar fossa.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'During tonsillectomy, the artery most often causing bleeding is:', '["Facial artery tonsillar branch", "Lingual artery", "Maxillary artery", "Vertebral artery"]'::jsonb, 0, 'Tonsillar branch of facial artery is important.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The palatine tonsil lymph drains mainly to:', '["Preauricular nodes", "Jugulodigastric node", "Submental nodes", "Occipital nodes"]'::jsonb, 1, 'Jugulodigastric node is the tonsillar node.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The tongue muscle supplied by vagus nerve is:', '["Genioglossus", "Styloglossus", "Hyoglossus", "Palatoglossus"]'::jsonb, 3, 'Palatoglossus is supplied by CN X via pharyngeal plexus.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The artery supplying the tongue is:', '["Facial artery", "Lingual artery", "Maxillary artery", "Ascending pharyngeal artery"]'::jsonb, 1, 'Lingual artery is a branch of external carotid.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Lymph from the tip of the tongue drains to:', '["Deep cervical nodes", "Submental nodes", "Parotid nodes", "Retropharyngeal nodes"]'::jsonb, 1, 'Tip drains to submental nodes.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The posterior one-third of tongue develops from:', '["First pharyngeal arch", "Second pharyngeal arch", "Third pharyngeal arch", "Fourth arch only"]'::jsonb, 2, 'CN IX supply reflects third arch origin.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The anterior two-thirds of tongue develops mainly from:', '["First pharyngeal arch", "Second pharyngeal arch", "Third arch", "Fourth arch"]'::jsonb, 0, 'First arch origin corresponds to V3 general sensation.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The palatine tonsil is derived from:', '["First pharyngeal pouch", "Second pharyngeal pouch", "Third pharyngeal pouch", "Fourth pharyngeal pouch"]'::jsonb, 1, 'Second pouch gives palatine tonsil epithelium.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The thymus develops from:', '["First pouch", "Second pouch", "Third pouch", "Fourth pouch"]'::jsonb, 2, 'Third pouch also contributes inferior parathyroids.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The superior parathyroid glands develop from:', '["Third pouch", "Fourth pouch", "First arch", "Neural crest only"]'::jsonb, 1, 'Superior parathyroids come from the fourth pouch.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The inferior parathyroid glands develop from:', '["Third pouch", "Fourth pouch", "Second pouch", "First pouch"]'::jsonb, 0, 'Inferior parathyroids descend with thymus from third pouch.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The stapes develops from which arch?', '["First arch", "Second arch", "Third arch", "Fourth arch"]'::jsonb, 1, 'Second arch derivatives include stapes, styloid, lesser horn.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The mandible develops mainly from:', '["First pharyngeal arch", "Second arch", "Third arch", "Fourth arch"]'::jsonb, 0, 'First arch gives maxilla and mandible derivatives.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The hyoid greater horn is derived mainly from:', '["First arch", "Second arch", "Third arch", "Fourth arch"]'::jsonb, 2, 'Third arch contributes greater horn and lower body.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The stylopharyngeus muscle is supplied by:', '["CN V", "CN VII", "CN IX", "CN X"]'::jsonb, 2, 'Only muscle supplied by glossopharyngeal nerve.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'All muscles of pharynx are supplied by vagus nerve except:', '["Stylopharyngeus", "Superior constrictor", "Middle constrictor", "Palatopharyngeus"]'::jsonb, 0, 'Stylopharyngeus is supplied by CN IX.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The auditory tube connects the middle ear to the:', '["Oropharynx", "Nasopharynx", "Laryngopharynx", "Nasal vestibule"]'::jsonb, 1, 'It equalizes pressure between middle ear and nasopharynx.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The ossicle attached to tympanic membrane is:', '["Incus", "Stapes", "Malleus", "Cochlea"]'::jsonb, 2, 'Handle of malleus attaches to tympanic membrane.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The chorda tympani passes through the middle ear and joins:', '["Glossopharyngeal nerve", "Lingual nerve", "Hypoglossal nerve", "Great auricular nerve"]'::jsonb, 1, 'It carries taste and parasympathetic fibers.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The nerve carrying parasympathetic fibers to parotid gland is:', '["Facial nerve via chorda tympani", "Glossopharyngeal nerve via lesser petrosal", "Vagus nerve", "Hypoglossal nerve"]'::jsonb, 1, 'CN IX fibers synapse in otic ganglion.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The auriculotemporal nerve carries postganglionic parasympathetic fibers to:', '["Sublingual gland", "Submandibular gland", "Parotid gland", "Lacrimal gland"]'::jsonb, 2, 'Postganglionic fibers from otic ganglion travel with auriculotemporal nerve.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The ganglion associated with submandibular gland secretion is:', '["Otic ganglion", "Ciliary ganglion", "Submandibular ganglion", "Pterygopalatine ganglion"]'::jsonb, 2, 'Chorda tympani synapses here.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The lacrimal gland receives parasympathetic secretomotor fibers from:', '["Pterygopalatine ganglion", "Otic ganglion", "Ciliary ganglion", "Submandibular ganglion"]'::jsonb, 0, 'Fibers originate from facial nerve via greater petrosal nerve.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The main artery of the face is:', '["Lingual artery", "Facial artery", "Maxillary artery only", "Ascending pharyngeal artery"]'::jsonb, 1, 'Facial artery is the principal artery of the face.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The maxillary artery is a terminal branch of:', '["Internal carotid artery", "Common carotid artery", "External carotid artery", "Vertebral artery"]'::jsonb, 2, 'ECA terminates as maxillary and superficial temporal.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The superficial temporal artery is a terminal branch of:', '["Internal carotid", "External carotid", "Vertebral", "Facial"]'::jsonb, 1, 'It is one of the two terminal branches of ECA.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion in superior orbital fissure may affect all EXCEPT:', '["CN III", "CN IV", "CN VI", "CN II"]'::jsonb, 3, 'CN II passes through optic canal, not superior orbital fissure.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The cavernous sinus contains all EXCEPT:', '["Internal carotid artery", "CN VI", "CN III", "CN XII"]'::jsonb, 3, 'Hypoglossal nerve does not pass through cavernous sinus.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The danger triangle of face is dangerous due to venous communication with:', '["Portal vein", "Cavernous sinus", "Vertebral vein", "External jugular vein only"]'::jsonb, 1, 'Facial veins communicate intracranially.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The vertebral artery enters the cervical transverse foramina at:', '["C1", "C4", "C6", "C7"]'::jsonb, 2, 'Usually enters at C6.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The nerve most commonly injured in carotid endarterectomy causing tongue weakness is:', '["Facial nerve", "Hypoglossal nerve", "Glossopharyngeal nerve", "Accessory nerve"]'::jsonb, 1, 'CN XII crosses carotid arteries in the neck.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The anterior belly of digastric is supplied by:', '["Facial nerve", "Mandibular nerve", "Hypoglossal nerve", "Glossopharyngeal nerve"]'::jsonb, 1, 'It is derived from first arch, supplied by mylohyoid nerve.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The posterior belly of digastric is supplied by:', '["Facial nerve", "Trigeminal nerve", "Vagus nerve", "Hypoglossal nerve"]'::jsonb, 0, 'Second arch derivative supplied by CN VII.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The muscle that elevates the hyoid and forms the floor of mouth is:', '["Sternohyoid", "Mylohyoid", "Thyrohyoid", "Omohyoid"]'::jsonb, 1, 'Mylohyoid forms muscular floor of mouth.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of sympathetic fibers to the eye causes:', '["Mydriasis", "Ptosis and miosis", "Exophthalmos", "Loss of accommodation only"]'::jsonb, 1, 'Horner syndrome causes ptosis, miosis, anhidrosis.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The cervical plexus is formed by ventral rami of:', '["C1\u2013C4", "C5\u2013C8", "T1\u2013T4", "C1\u2013T1"]'::jsonb, 0, 'Cervical plexus supplies cutaneous neck and some motor branches.');

END $$;