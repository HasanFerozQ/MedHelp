-- Orthopedics: Bone & soft tissue tumors
-- US MD/MBBS (4th Year) clinical case blocks
-- Target platform: Supabase (Postgres)
-- Topic Slug: ortho-bone-tumors

BEGIN;

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'ortho-bone-tumors' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic slug % not found.', 'ortho-bone-tumors';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Biopsy Principles
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Biopsy Track' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Biopsy Track', 'A surgeon is planning a biopsy for a suspected distal femur osteosarcoma.

Vitals: N/A.
Physical Examination: N/A.
Laboratory Results: N/A.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Principles of biopsy for suspected musculoskeletal malignancy.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most important principle regarding the incision for a musculoskeletal biopsy?', '["It should be transverse", "It should be longitudinal and placed such that it can be entirely excised during the definitive limb-salvage procedure", "It should be as small as possible", "None"]', 1, 'Transverse incisions contaminate multiple compartments and may preclude limb salvage.'),
    (v_case_id, 'Why should the biopsy track be excised during the final surgery?', '["To prevent \"seeding\" or local recurrence of the tumor along the track", "To make the scar look better", "It is not necessary", "None"]', 0, 'Tumor cells can contaminate the needle or surgical track.'),
    (v_case_id, 'True or False: A Core Needle Biopsy (CNB) is generally preferred over a Fine Needle Aspiration (FNA) for primary bone tumors.', '["True", "False"]', 0, 'CNB provides tissue architecture, which is crucial for diagnosing sarcomas; FNA is better for metastatic disease or nodes.');

    ---------------------------------------------------------------------------
    -- CASE 02: Enneking Staging System (Bone)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Staging the Sarcoma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Staging the Sarcoma', 'A patient has a high-grade Osteosarcoma that is confined to the medullary canal (intracompartmental) with no metastases.

Vitals: Stable.
Physical Examination: N/A.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Application of the Enneking Staging system for bone tumors.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the Enneking stage for a high-grade, intracompartmental bone tumor without metastases?', '["Stage IA", "Stage IB", "Stage IIA", "Stage IIB"]', 2, 'Enneking stages: I = Low grade, II = High grade, III = Metastatic. A = Intracompartmental, B = Extracompartmental.'),
    (v_case_id, 'In the Enneking system, what does "Grade" primarily refer to?', '["The size of the tumor", "The histological malignancy (mitotic rate, atypia, etc.)", "The age of the patient", "None"]', 1, 'Grade is based on histology and biology.'),
    (v_case_id, 'True or False: A "skip lesion" within the same bone is considered extracompartmental (Stage B).', '["True", "False"]', 1, 'A skip lesion in the same bone is still Stage IIA (intracompartmental) by some definitions, but it is a poor prognostic sign.');

    ---------------------------------------------------------------------------
    -- CASE 03: Osteoid Osteoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Night Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Night Pain', 'A 14-year-old boy presents with aching pain in his proximal femur that is worse at night. The pain is completely relieved by Aspirin.

Vitals: Stable.
Physical Examination: No mass palpable. Full range of motion.
Laboratory Results: X-rays show a small (0.8cm) radiolucent "nidus" surrounded by significant reactive sclerosis.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 14-year-old with classic Osteoid Osteoma; aspirin-responsive night pain.', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Osteosarcoma", "Osteoid Osteoma", "Ewing Sarcoma", "Osteochondroma"]', 1, 'Night pain relieved by NSAIDs/Aspirin is classic for Osteoid Osteoma.'),
    (v_case_id, 'What is the "Nidus" in this condition?', '["The center of the tumor, which produces high levels of Prostaglandins", "A type of fracture", "The healthy bone", "None"]', 0, 'High prostaglandin levels cause the intense pain and reactive bone formation.'),
    (v_case_id, 'What is a common modern treatment for symptomatic Osteoid Osteoma that fails NSAID therapy?', '["Chemotherapy", "Radiofrequency Ablation (RFA)", "Amputation", "None"]', 1, 'RFA is highly effective and minimally invasive.');

    ---------------------------------------------------------------------------
    -- CASE 04: Osteoblastoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Larger Nidus' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Larger Nidus', 'A 20-year-old male presents with chronic back pain. Imaging shows a 3cm lytic lesion in the posterior elements of the T12 vertebra. The pain is NOT relieved by aspirin.

Vitals: Stable.
Physical Examination: Tenderness over the T12 spinous process.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 20-year-old with Osteoblastoma of the spine.', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is Osteoblastoma typically distinguished from Osteoid Osteoma?', '["By the patient''s age", "By size (Osteoblastoma is typically > 2cm) and lack of response to aspirin", "By the color of the bone", "None"]', 1, 'Osteoblastomas are histologically similar but larger and more aggressive than Osteoid Osteomas.'),
    (v_case_id, 'Where is the most common location for Osteoblastoma?', '["The skull", "The spine (posterior elements)", "The ribs", "None"]', 1, 'About 40% occur in the spine.'),
    (v_case_id, 'True or False: Osteoblastoma is a malignant tumor.', '["True", "False"]', 1, 'It is benign, though it can be "locally aggressive."');

    ---------------------------------------------------------------------------
    -- CASE 05: Osteochondroma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bony Bump' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bony Bump', 'A 12-year-old presents with a hard, painless bump near his knee.

Vitals: Stable.
Physical Examination: A firm, immobile mass is palpable on the distal femur, pointing away from the joint.
Laboratory Results: X-rays show a pedunculated bony outgrowth with cortex and medulla that are continuous with the parent bone.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 12-year-old with a pedunculated Osteochondroma.', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the hallmark radiographic feature of an Osteochondroma?', '["A sunburst pattern", "Marrow and cortical continuity with the host bone", "A soap bubble appearance", "None"]', 1, 'This continuity is diagnostic.'),
    (v_case_id, 'Which gene mutations are associated with Multiple Hereditary Exostoses (MHE)?', '["EXT1 and EXT2", "RB1", "P53", "None"]', 0, 'EXT genes are involved in heparan sulfate synthesis.'),
    (v_case_id, 'What is the most concerning sign of malignant transformation of an osteochondroma in an adult?', '["The mass gets smaller", "A cartilage cap thickness > 1-2 cm and new pain after skeletal maturity", "The bone gets harder", "None"]', 1, 'Increasing thickness of the cartilage cap suggests transformation to chondrosarcoma.');

    ---------------------------------------------------------------------------
    -- CASE 06: Enchondroma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cartilage in the Hand' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cartilage in the Hand', 'A 35-year-old female presents with a pathological fracture of her proximal phalanx after a minor injury.

Vitals: Stable.
Physical Examination: Swelling and deformity of the finger.
Laboratory Results: X-rays show a well-circumscribed, lytic lesion in the phalanx with "popcorn" calcifications.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 35-year-old with an Enchondroma in the hand presenting as a fracture.', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common primary bone tumor of the hand?', '["Osteosarcoma", "Enchondroma", "GCT", "None"]', 1, 'Enchondromas are extremely common in the small bones of the hands and feet.'),
    (v_case_id, 'What is "Ollier''s Disease"?', '["A type of infection", "Multiple enchondromatosis", "A skin rash", "None"]', 1, 'Ollier''s is non-hereditary and involves multiple enchondromas.'),
    (v_case_id, 'What defines "Maffucci Syndrome"?', '["Multiple enchondromas plus soft tissue hemangiomas", "Multiple fractures", "Blindness", "None"]', 0, 'Maffucci carries a higher risk of visceral malignancies (e.g., GI, brain).');

    ---------------------------------------------------------------------------
    -- CASE 07: Non-Ossifying Fibroma (NOF)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Incidental Finding' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Incidental Finding', 'An 8-year-old boy has an X-ray after a minor ankle sprain. An incidental lesion is found in the distal tibial metaphysis.

Vitals: Stable.
Physical Examination: No tenderness over the lesion.
Laboratory Results: X-rays show a "bubbly," eccentric, radiolucent lesion with a thin sclerotic rim, located in the cortex.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An incidental NOF in an 8-year-old.', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate management for this asymptomatic NOF?', '["Immediate surgery", "Biopsy", "Observation (most resolve spontaneously with age)", "Chemotherapy"]', 2, 'NOFs are extremely common "don''t touch" lesions that usually ossify by adulthood.'),
    (v_case_id, 'What is the difference between a Fibrous Cortical Defect and a Non-Ossifying Fibroma?', '["They are the same thing, but NOF is larger (> 3cm)", "One is in the lung", "One is malignant", "None"]', 0, 'Size is the only real difference.'),
    (v_case_id, 'Multiple NOFs associated with cafe-au-lait spots is known as:', '["Jaffe-Campanacci Syndrome", "Neurofibromatosis", "McCune-Albright", "None"]', 0, 'This is a rare association to keep in mind.');

    ---------------------------------------------------------------------------
    -- CASE 08: Chondromyxoid Fibroma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rare Cartilage Tumor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rare Cartilage Tumor', 'A 25-year-old presents with chronic pain in the proximal tibia.

Vitals: Stable.
Laboratory Results: X-rays show an eccentric, lytic lesion in the metaphysis with a "scalloped" sclerotic border.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 25-year-old with Chondromyxoid Fibroma.', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'True or False: Chondromyxoid fibroma is the rarest of the benign cartilage tumors.', '["True", "False"]', 0, 'It is very rare compared to enchondromas and osteochondromas.'),
    (v_case_id, 'What is the recommended treatment for symptomatic Chondromyxoid Fibroma?', '["Observation", "Curettage and bone grafting", "Amputation", "Radiation"]', 1, 'Surgery is indicated because it is often painful and locally progressive.'),
    (v_case_id, 'True or False: It is often confused histologically with Chondrosarcoma.', '["True", "False"]', 0, 'The hypercellularity can mimic malignancy, requiring an experienced pathologist.');

    ---------------------------------------------------------------------------
    -- CASE 09: Periosteal Chondroma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Surface Cartilage' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Surface Cartilage', 'A 15-year-old has a mass on the surface of the proximal humerus.

Vitals: Stable.
Laboratory Results: X-rays show a small "saucer-like" erosion of the outer cortex with a thin rim of reactive bone.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Periosteal chondroma in a 15-year-old.', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where is a Periosteal Chondroma located?', '["Inside the marrow", "On the surface of the bone, beneath the periosteum", "In the joint", "None"]', 1, 'It sits on the cortex, often causing a shallow indentation.'),
    (v_case_id, 'What is the characteristic size of a periosteal chondroma?', '["Usually < 3cm", "Always > 10cm", "The size of a football", "None"]', 0, 'They are typically small surface lesions.'),
    (v_case_id, 'True or False: It is most commonly found in the humerus.', '["True", "False"]', 0, 'The proximal humerus is a classic location.');

    ---------------------------------------------------------------------------
    -- CASE 10: Simple Bone Cyst (UBC)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fallen Leaf' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fallen Leaf', 'A 10-year-old presents with sudden arm pain after throwing a baseball.

Vitals: Stable.
Physical Examination: Deformity and tenderness of the humerus.
Laboratory Results: X-rays show a pathological fracture through a centrally located, lytic, expanded lesion in the proximal humerus. A small fragment of bone has settled at the bottom of the cyst.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 10-year-old with a UBC and a pathological fracture.', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Fallen Leaf" sign?', '["A sign of autumn", "A pathognomonic sign for UBC where a cortical fragment falls to the bottom of the fluid-filled cyst", "A type of skin rash", "None"]', 1, 'This sign confirms the lesion is cystic and fluid-filled.'),
    (v_case_id, 'What is the common first-line treatment for an active UBC in a weight-bearing bone?', '["Amputation", "Curettage or steroid/bone marrow injections", "Radiation", "None"]', 1, 'Injecting the cyst can stimulate healing.'),
    (v_case_id, 'True or False: UBCs usually "migrate" away from the growth plate as the bone grows.', '["True", "False"]', 0, '"Active" cysts are adjacent to the physis; "latent" cysts have been separated by growth.');
    ---------------------------------------------------------------------------
    -- CASE 11: Giant Cell Tumor of Bone (GCT)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Soap Bubble Joint' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Soap Bubble Joint', 'A 28-year-old female presents with progressive knee pain.

Vitals: Stable.
Physical Examination: Decreased range of motion and local tenderness over the distal femur.
Laboratory Results: X-rays show a lytic, "soap bubble" lesion in the epiphysis of the distal femur, extending to the subchondral bone.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 28-year-old with a GCT of the distal femur.', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic location of a Giant Cell Tumor (GCT)?', '["Diaphysis", "Metaphysis", "Epiphysis (extending to the subchondral bone)", "None"]', 2, 'GCT is one of the few tumors that starts in or extends into the epiphysis after skeletal maturity.'),
    (v_case_id, 'What is the standard surgical treatment for a GCT?', '["Amputation", "Intralesional curettage with use of an adjuvant (like phenol, liquid nitrogen, or high-speed burr) and cement", "Radiation alone", "None"]', 1, 'Curettage is standard; adjuvants help reduce the high recurrence rate.'),
    (v_case_id, 'Which monoclonal antibody is used to treat unresectable or metastatic GCT?', '["Trastuzumab", "Denosumab (RANK-L inhibitor)", "Rituximab", "None"]', 1, 'Denosumab targets the RANK-L pathway, which is highly active in the giant cells of GCT.');

    ---------------------------------------------------------------------------
    -- CASE 12: Aneurysmal Bone Cyst (ABC)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Blood and Bubbles' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Blood and Bubbles', 'A 15-year-old presents with a rapidly enlarging, painful mass in his proximal humerus.

Vitals: Stable.
Laboratory Results: X-rays show an expansile, "bubbly" lytic lesion. MRI shows multiple internal septations with "fluid-fluid levels."', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 15-year-old with an expansile ABC; fluid-fluid levels on MRI.', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What causes the "fluid-fluid levels" seen on MRI in an ABC?', '["Bone and fat", "Layering of blood products of different densities within the cystic spaces", "Water and oil", "None"]', 1, 'This is a classic finding in ABC, though it can also be seen in GCT or Telangiectatic Osteosarcoma.'),
    (v_case_id, 'True or False: ABCs can occur as a "secondary" lesion alongside other tumors like GCT or Osteoblastoma.', '["True", "False"]', 0, 'Secondary ABCs are common and require finding the underlying "primary" tumor.'),
    (v_case_id, 'The USP6 translocation is diagnostic for:', '["Primary ABC", "Osteosarcoma", "Ewing Sarcoma", "None"]', 0, 'USP6 rearrangements are found in most primary ABCs.');

    ---------------------------------------------------------------------------
    -- CASE 13: Fibrous Dysplasia
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Ground Glass Bone' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Ground Glass Bone', 'A 20-year-old presents with bowing of his femur.

Vitals: Stable.
Physical Examination: "Shepherd''s crook" deformity of the proximal femur.
Laboratory Results: X-rays show a lytic lesion with a "ground-glass" matrix and no periosteal reaction.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Fibrous Dysplasia; Shepherd''s crook deformity and ground-glass appearance.', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What gene mutation is responsible for Fibrous Dysplasia?', '["GNAS", "EXT1", "RB1", "P53"]', 0, 'A post-zygotic mutation in GNAS leads to overactive G-protein signaling.'),
    (v_case_id, 'What is "McCune-Albright Syndrome"?', '["Bowed legs only", "Polyostotic fibrous dysplasia, cafe-au-lait spots (Coast of Maine), and precocious puberty", "Multiple fractures", "None"]', 1, 'This is the classic triad of McCune-Albright.'),
    (v_case_id, 'What is the characteristic histological finding in Fibrous Dysplasia?', '["\"Chinese characters\" (irregular trabeculae of woven bone without osteoblastic rimming)", "Large giant cells", "Small blue cells", "None"]', 0, 'The absence of osteoblastic rimming is key to differentiating it from osteoblastoma.');

    ---------------------------------------------------------------------------
    -- CASE 14: Eosinophilic Granuloma (LCH)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Punched-Out Skull' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Punched-Out Skull', 'A 6-year-old boy presents with a tender bump on his skull and a limp.

Vitals: Stable.
Laboratory Results: X-rays show "punched-out" lytic lesions in the skull and a "vertebra plana" (complete collapse) of the T6 vertebral body.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Langerhans Cell Histiocytosis (EG); vertebra plana and skull lesions.', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic cell found in this condition?', '["Giant cell", "Langerhans cell (with Birbeck granules on EM)", "Osteoblast", "None"]', 1, 'Langerhans cells are specialized dendritic cells.'),
    (v_case_id, 'True or False: Eosinophilic granuloma is the most common cause of "Vertebra Plana" in children.', '["True", "False"]', 0, 'Complete flattening of a vertebral body is very suggestive of EG.'),
    (v_case_id, 'Treatment for a single, asymptomatic bone lesion of EG is often:', '["Chemotherapy", "Observation or low-dose radiation/corticosteroid injection", "Amputation", "None"]', 1, 'Many single lesions are self-limiting.');

    ---------------------------------------------------------------------------
    -- CASE 15: Paget''s Disease of Bone
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Enlarging Hat' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Enlarging Hat', 'An 80-year-old male complains that his hat no longer fits and he is going deaf.

Vitals: Stable.
Physical Examination: Bowing of the tibiae.
Laboratory Results: Significantly elevated Alkaline Phosphatase (ALP) with normal Calcium and Phosphate.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Paget''s disease; skull enlargement and high ALP.', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary cellular defect in Paget''s disease?', '["Overactive osteoblasts", "Overactive and disordered osteoclasts", "Missing cartilage", "None"]', 1, 'The disease starts with an intense resorptive phase followed by disorganized bone formation.'),
    (v_case_id, 'What is the most dreaded oncologic complication of Paget''s disease?', '["Infection", "Transformation to Paget''s Sarcoma (high-grade osteosarcoma)", "Kidney stones", "None"]', 1, 'This occurs in <1% of cases but has an extremely poor prognosis.'),
    (v_case_id, 'First-line medical treatment for symptomatic Paget''s disease:', '["Antibiotics", "Bisphosphonates (e.g., Zoledronic acid)", "Vitamin C", "None"]', 1, 'Bisphosphonates inhibit the overactive osteoclasts.');

    ---------------------------------------------------------------------------
    -- CASE 16: Brown Tumor (Hyperparathyroidism)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bones, Stones, and Moans' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bones, Stones, and Moans', 'A 50-year-old female presents with multiple lytic bone lesions and abdominal pain.

Vitals: Stable.
Laboratory Results: Hypercalcemia, hypophosphatemia, and elevated PTH.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Brown tumors secondary to Hyperparathyroidism.', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a "Brown Tumor"?', '["A type of melanoma", "A reactive bone lesion (osteitis fibrosa cystica) caused by excessive PTH-driven osteoclast activity", "A bruise", "None"]', 1, 'The "brown" color comes from hemosiderin deposition.'),
    (v_case_id, 'True or False: Brown tumors should be treated with immediate surgery and bone grafting.', '["True", "False"]', 1, 'The primary treatment is correcting the underlying hyperparathyroidism; the bone lesions often heal once PTH levels normalize.'),
    (v_case_id, 'What is the most common cause of Primary Hyperparathyroidism?', '["Thyroid cancer", "Parathyroid Adenoma", "Kidney failure", "None"]', 1, 'A single adenoma is the most common cause.');

    ---------------------------------------------------------------------------
    -- CASE 17: Hemangioma of Bone
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Corduroy Spine' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Corduroy Spine', 'An incidental finding on a spine MRI for low back pain shows a lesion in the L3 vertebral body.

Vitals: Stable.
Laboratory Results: X-rays show prominent vertical trabeculae in the vertebral body (Corduroy cloth appearance). MRI shows high signal on both T1 and T2 (fat content).', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Incidental vertebral hemangioma.', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common benign tumor of the spine?', '["Osteoblastoma", "Hemangioma", "GCT", "None"]', 1, 'Vertebral hemangiomas are found in up to 10% of autopsies.'),
    (v_case_id, 'True or False: Most vertebral hemangiomas require surgical resection.', '["True", "False"]', 1, 'The vast majority are asymptomatic and require no treatment.'),
    (v_case_id, 'What is the "Polka Dot" sign on CT?', '["The cross-sectional appearance of the prominent vertical trabeculae in a vertebral hemangioma", "A sign of measles", "A type of fracture", "None"]', 0, 'Vertical trabeculae appear as dots on axial CT slices.');

    ---------------------------------------------------------------------------
    -- CASE 18: Adamantinoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tibial Bubbly Tumor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tibial Bubbly Tumor', 'A 25-year-old presents with a slow-growing, painful mass on his mid-tibia.

Vitals: Stable.
Laboratory Results: X-rays show multiple "soap-bubble" lytic lesions in the anterior cortex of the tibial diaphysis.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Adamantinoma of the tibia.', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where is Adamantinoma almost exclusively found?', '["The humerus", "The tibia diaphysis", "The ribs", "None"]', 1, 'Over 85% occur in the tibia.'),
    (v_case_id, 'True or False: Adamantinoma is a malignant tumor with the potential for metastasis.', '["True", "False"]', 0, 'It is a low-grade malignancy that can metastasize to the lungs or lymph nodes.'),
    (v_case_id, 'What benign condition is histologically and radiographically related to Adamantinoma?', '["Osteoid Osteoma", "Osteofibrous Dysplasia", "NOF", "None"]', 1, 'Osteofibrous dysplasia is considered a precursor or "benign version" of adamantinoma.');

    ---------------------------------------------------------------------------
    -- CASE 19: Osteofibrous Dysplasia
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bubbly Tibia in a Child' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bubbly Tibia in a Child', 'A 5-year-old presents with anterior bowing of the tibia.

Vitals: Stable.
Laboratory Results: X-rays show bubbly lesions in the anterior tibial cortex.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Osteofibrous dysplasia in a 5-year-old.', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does Osteofibrous Dysplasia (OFD) typically differ from Adamantinoma?', '["OFD occurs in younger children (< 10) and is benign", "OFD is in the arm", "OFD is malignant", "None"]', 0, 'Age is a key differentiator, though biopsy is often needed.'),
    (v_case_id, 'What is the characteristic histological feature that differentiates OFD from Fibrous Dysplasia?', '["Chinese characters", "Prominent osteoblastic rimming around the bony trabeculae", "Giant cells", "None"]', 1, 'Fibrous Dysplasia lacks osteoblastic rimming; OFD has it.'),
    (v_case_id, 'Management of asymptomatic OFD is:', '["Immediate surgery", "Observation until skeletal maturity (many stabilize)", "Chemotherapy", "None"]', 1, 'Surgery is avoided in young children due to high recurrence rates.');

    ---------------------------------------------------------------------------
    -- CASE 20: Hemangioendothelioma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Multiple Vascular Lesions' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Multiple Vascular Lesions', 'A 40-year-old presents with multiple lytic lesions in the bones of her foot and ankle.

Vitals: Stable.
Laboratory Results: X-rays show multiple, well-defined lytic lesions. Biopsy shows vascular channels lined by "epithelioid" endothelial cells.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Epithelioid Hemangioendothelioma; multiple vascular bone lesions.', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "Epithelioid Hemangioendothelioma" (EHE)?', '["A type of skin cancer", "An intermediate-grade vascular tumor that often presents with \"multifocal\" involvement of a single limb", "A type of fracture", "None"]', 1, 'Multifocality is a classic feature of vascular bone tumors.'),
    (v_case_id, 'True or False: Vascular bone tumors can be highly aggressive (Angiosarcoma) or low-grade (Hemangioma).', '["True", "False"]', 0, 'There is a broad spectrum of vascular bone oncology.'),
    (v_case_id, 'The characteristic marker for endothelial cells is:', '["ALP", "CD31 / CD34 / ERG", "S100", "None"]', 1, 'These immunohistochemical stains confirm the vascular origin.');

    ---------------------------------------------------------------------------
    -- CASE 21: Conventional Osteosarcoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sunburst Tumor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sunburst Tumor', 'A 16-year-old male presents with dull, progressive pain in his distal femur for 2 months.

Vitals: Stable.
Physical Examination: Firm, tender mass over the distal femur.
Laboratory Results: X-rays show a large, ill-defined lytic and blastic lesion in the metaphysis with "sunburst" periosteal reaction and a "Codman''s triangle" (elevation of the periosteum). ALP and LDH are elevated.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 16-year-old with conventional Osteosarcoma; Codman''s triangle and sunburst pattern.', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic histological finding in Osteosarcoma?', '["Small blue cells", "Direct production of osteoid (immature bone) by malignant spindle cells", "Large giant cells", "None"]', 1, 'Malignant osteoid is the defining feature.'),
    (v_case_id, 'What is the standard treatment protocol for non-metastatic conventional osteosarcoma?', '["Surgery alone", "Neoadjuvant chemotherapy, followed by wide surgical resection (limb salvage), and then adjuvant chemotherapy", "Radiation alone", "None"]', 1, 'Chemotherapy has drastically improved survival rates from <20% to >70%.'),
    (v_case_id, 'Where is the most common site for distant metastasis in Osteosarcoma?', '["Brain", "Lungs", "Liver", "Skin"]', 1, 'Lung metastasis is the primary cause of death; chest CT is a mandatory part of staging.');

    ---------------------------------------------------------------------------
    -- CASE 22: Parosteal Osteosarcoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Low-Grade Surface Tumor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Low-Grade Surface Tumor', 'A 30-year-old female presents with a painless mass on the back of her knee.

Vitals: Stable.
Laboratory Results: X-rays show a heavily ossified, lobulated mass attached to the posterior cortex of the distal femur. Biopsy shows a low-grade spindle cell lesion.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Parosteal Osteosarcoma; low-grade surface tumor.', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is "Parosteal" Osteosarcoma?', '["A tumor inside the marrow", "A low-grade, surface osteosarcoma that typically occurs on the posterior distal femur", "A tumor of the skin", "None"]', 1, 'It has a much better prognosis than conventional osteosarcoma.'),
    (v_case_id, 'The characteristic genetic finding in Parosteal Osteosarcoma is:', '["MDM2 and CDK4 amplification", "11;22 translocation", "RB1 mutation", "None"]', 0, 'MDM2 amplification is a hallmark of this and low-grade liposarcoma.'),
    (v_case_id, 'Treatment for Parosteal Osteosarcoma is usually:', '["Wide surgical resection alone (chemotherapy is rarely needed)", "Amputation", "Radiation", "None"]', 0, 'Since it is low-grade and rarely metastasizes, wide resection is often curative.');

    ---------------------------------------------------------------------------
    -- CASE 23: Periosteal Osteosarcoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Intermediate Surface Tumor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Intermediate Surface Tumor', 'An 18-year-old presents with a mass on his proximal tibia.

Vitals: Stable.
Laboratory Results: X-rays show a surface lesion with "hair-on-end" periosteal reaction and a predominantly cartilaginous matrix.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Periosteal Osteosarcoma; intermediate-grade surface tumor.', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does Periosteal Osteosarcoma differ from Parosteal?', '["It is lower grade", "It is intermediate grade, typically has a cartilaginous matrix, and is more aggressive than parosteal", "It occurs in older adults", "None"]', 1, 'Periosteal is "in between" conventional and parosteal in terms of behavior.'),
    (v_case_id, 'True or False: Periosteal osteosarcoma typically does NOT involve the medullary canal.', '["True", "False"]', 0, 'It is primarily a surface-based lesion.'),
    (v_case_id, 'The matrix of a Periosteal Osteosarcoma is often:', '["Purely bone", "Predominantly chondroid (cartilage-like)", "Purely fat", "None"]', 1, 'Chondroid matrix is characteristic of this subtype.');

    ---------------------------------------------------------------------------
    -- CASE 24: Telangiectatic Osteosarcoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Cystic Malignancy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Cystic Malignancy', 'A 14-year-old presents with a "pathological fracture" through what looks like an ABC on initial X-ray.

Vitals: Stable.
Laboratory Results: MRI shows large fluid-filled spaces. Biopsy shows highly pleomorphic, malignant cells within the septations between the blood-filled spaces.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Telangiectatic Osteosarcoma mimicking an ABC.', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Telangiectatic Osteosarcoma is most commonly confused with:', '["Osteoid Osteoma", "Aneurysmal Bone Cyst (ABC)", "Infection", "None"]', 1, 'Both have fluid-fluid levels, but telangiectatic OS has malignant cells and a much worse prognosis.'),
    (v_case_id, 'True or False: Telangiectatic Osteosarcoma is a low-grade tumor.', '["True", "False"]', 1, 'It is a high-grade, aggressive malignancy.'),
    (v_case_id, 'X-ray findings often show:', '["Heavy ossification", "Lytic, destructive lesion with minimal bone formation", "A soap bubble", "None"]', 1, 'It looks much "emptier" than conventional osteosarcoma.');

    ---------------------------------------------------------------------------
    -- CASE 25: Ewing Sarcoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Onion Skin Tumor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Onion Skin Tumor', 'An 8-year-old boy presents with pain, swelling, and a low-grade fever.

Vitals: Temp 100.5 F.
Physical Examination: Tender, warm mass over the mid-diaphysis of the femur.
Laboratory Results: X-rays show a lytic lesion with "onion-skin" periosteal reaction. Biopsy shows "small blue round cells" that are CD99 positive.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'An 8-year-old with Ewing Sarcoma; small blue cells and onion-skinning.', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic chromosomal translocation in Ewing Sarcoma?', '["t(11;22) (EWS-FLI1)", "t(X;18)", "t(9;22)", "None"]', 0, 't(11;22) is found in >85% of cases.'),
    (v_case_id, 'Which immunohistochemical marker is highly sensitive for Ewing Sarcoma?', '["S100", "CD99 (MIC2)", "Cytokeratin", "None"]', 1, 'CD99 is a membrane marker found in almost all Ewing cases.'),
    (v_case_id, 'True or False: Ewing Sarcoma is highly sensitive to radiation therapy.', '["True", "False"]', 0, 'Unlike Osteosarcoma, Ewing is very radiosensitive, though surgery is still preferred for local control when possible.');

    ---------------------------------------------------------------------------
    -- CASE 26: Chondrosarcoma (Conventional)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Malignant Cartilage' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Malignant Cartilage', 'A 55-year-old male presents with deep, aching shoulder pain.

Vitals: Stable.
Laboratory Results: X-rays show a large, lytic lesion in the proximal humerus with "popcorn" or "ring-and-arc" calcifications and endosteal scalloping > 2/3 of the cortical thickness.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 55-year-old with conventional Chondrosarcoma; ring-and-arc calcification.', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is low-grade Chondrosarcoma primarily treated?', '["Chemotherapy", "Radiation", "Wide surgical resection", "None"]', 2, 'Chondrosarcomas are generally resistant to chemotherapy and radiation.'),
    (v_case_id, 'What radiographic sign helps distinguish Chondrosarcoma from Enchondroma?', '["Popcorn calcification", "Deep endosteal scalloping and cortical destruction", "A small nidus", "None"]', 1, 'Endosteal scalloping > 50% of cortical thickness is highly suspicious for malignancy.'),
    (v_case_id, 'True or False: Primary chondrosarcoma is more common in the axial skeleton (pelvis, ribs, shoulder) than the distal extremities.', '["True", "False"]', 0, 'The pelvis is a very common and difficult site for management.');

    ---------------------------------------------------------------------------
    -- CASE 27: Dedifferentiated Chondrosarcoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Biphasic Malignancy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Biphasic Malignancy', 'A 60-year-old with a known low-grade chondrosarcoma presents with sudden, rapidly worsening pain and a large soft tissue mass.

Vitals: Stable.
Laboratory Results: Biopsy shows a "biphasic" pattern: a low-grade cartilaginous tumor adjacent to a high-grade spindle cell sarcoma (like MFH or Osteosarcoma).', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Dedifferentiated Chondrosarcoma; high-grade transformation.', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the prognosis for Dedifferentiated Chondrosarcoma?', '["Excellent", "Extremely poor (typically < 10% survival at 5 years)", "Fair", "None"]', 1, 'It is one of the most aggressive and lethal bone tumors.'),
    (v_case_id, 'A "dimorphic" appearance on X-ray (low-grade calcified area next to a purely lytic aggressive area) is suggestive of:', '["Infection", "Dedifferentiated Chondrosarcoma", "GCT", "None"]', 1, 'The radiographic contrast between the two components is characteristic.'),
    (v_case_id, 'True or False: The high-grade component of a dedifferentiated chondrosarcoma may respond to chemotherapy.', '["True", "False"]', 0, 'While the cartilage part is resistant, the high-grade part might respond, though overall outcomes remain poor.');

    ---------------------------------------------------------------------------
    -- CASE 28: Clear Cell Chondrosarcoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Epiphyseal Malignancy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Epiphyseal Malignancy', 'A 45-year-old presents with chronic hip pain.

Vitals: Stable.
Laboratory Results: X-rays show a lytic lesion in the femoral head (epiphysis). Biopsy shows cells with clear cytoplasm and a cartilaginous matrix.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Clear cell chondrosarcoma in the epiphysis.', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic location for Clear Cell Chondrosarcoma?', '["Diaphysis", "Metaphysis", "Epiphysis", "None"]', 2, 'It is one of the rare tumors that prefers the epiphysis (along with GCT and Chondroblastoma).'),
    (v_case_id, 'How does its clinical course compare to conventional chondrosarcoma?', '["It is more aggressive", "It is generally slow-growing but locally destructive", "It never metastasizes", "None"]', 1, 'It is considered a low-grade malignancy.'),
    (v_case_id, 'True or False: It is often misdiagnosed as Chondroblastoma on initial imaging.', '["True", "False"]', 0, 'Both are epiphyseal; age (older for Clear Cell) helps differentiate.');

    ---------------------------------------------------------------------------
    -- CASE 29: Chordoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Midline Tumor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Midline Tumor', 'A 60-year-old male presents with constipation and urinary retention.

Vitals: Stable.
Physical Examination: A mass is palpable on digital rectal exam.
Laboratory Results: Imaging shows a large, destructive midline lesion in the sacrum. Biopsy shows "Physaliphorous" cells (large, vacuolated cells).', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sacral Chordoma; physaliphorous cells and midline location.', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the embryological origin of Chordoma?', '["Neural crest", "Notochord remnants", "Mesoderm", "None"]', 1, 'Chordomas arise from remnants of the primitive notochord.'),
    (v_case_id, 'What are the two most common locations for Chordoma?', '["Femur and Tibia", "Sacrum and Clivus (skull base)", "Pelvis and Ribs", "None"]', 1, 'They are almost always found in the midline of the axial skeleton.'),
    (v_case_id, 'Which immunohistochemical marker is characteristic for Chordoma?', '["S100", "Brachyury", "CD99", "None"]', 1, 'Brachyury is a transcription factor essential for notochord development and a specific marker for chordoma.');

    ---------------------------------------------------------------------------
    -- CASE 30: Multiple Myeloma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bence-Jones Bone' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bence-Jones Bone', 'A 65-year-old presents with back pain and fatigue.

Vitals: Stable.
Laboratory Results: Anemia, Hypercalcemia, and "punched-out" lytic lesions on a skeletal survey. Serum Protein Electrophoresis (SPEP) shows an "M-spike."', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Multiple Myeloma; M-spike and punched-out lesions.', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common primary malignancy of bone in adults?', '["Osteosarcoma", "Multiple Myeloma", "Chondrosarcoma", "None"]', 1, 'Myeloma is a plasma cell dyscrasia that presents primarily in the bone.'),
    (v_case_id, 'Why are "Cold" bone scans common in Multiple Myeloma?', '["The tumor is cold", "There is minimal osteoblastic activity (the lesions are purely lytic)", "The scan is broken", "None"]', 1, 'Bone scans (technetium-99m) rely on osteoblastic turnover; skeletal survey (X-rays) or CT/PET are better for Myeloma.'),
    (v_case_id, 'What is a "Plasmacytoma"?', '["A type of infection", "A single (solitary) lesion of malignant plasma cells", "A blood clot", "None"]', 1, 'A solitary plasmacytoma can eventually progress to systemic Multiple Myeloma.');
    ---------------------------------------------------------------------------
    -- CASE 31: Metastatic Bone Disease (MBD)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Weakened Bone' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Weakened Bone', 'A 70-year-old male with a history of prostate cancer presents with severe pain in his mid-femur.

Vitals: Stable.
Laboratory Results: X-rays show an "osteoblastic" lesion in the femoral diaphysis. CT of the chest/abdomen shows multiple other bone lesions.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Metastatic prostate cancer to the femur.', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which primary cancers are most likely to cause OSTEOBLASTIC metastases?', '["Lung and Thyroid", "Prostate and Breast", "Renal and GI", "None"]', 1, 'Prostate is classic for blastic lesions; Breast can be mixed.'),
    (v_case_id, 'Which primary cancer is most likely to cause "purely lytic" metastases that are highly vascular?', '["Prostate", "Renal Cell Carcinoma (RCC)", "Lung", "None"]', 1, 'RCC and Thyroid metastases are notoriously vascular and often require pre-operative embolization before surgery.'),
    (v_case_id, 'True or False: Bone is the third most common site of metastasis after the lung and liver.', '["True", "False"]', 0, 'Bone is a very frequent site for cancer spread.');

    ---------------------------------------------------------------------------
    -- CASE 32: Mirels'' Criteria
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Predicting the Break' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Predicting the Break', 'A patient with metastatic lung cancer has a lytic lesion in the peritrochanteric region of the femur that is 2.5cm in size (roughly 1/2 of the cortex width) and causes functional pain.

Vitals: Stable.
Laboratory Results: N/A.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Using Mirels'' criteria to assess fracture risk in metastatic disease.', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Mirels'' Score" threshold at which prophylactic internal fixation is generally recommended?', '["7", "9 or greater", "12", "None"]', 1, 'A score of 9 or higher indicates a >33% risk of pathological fracture.'),
    (v_case_id, 'Which of the following is NOT a component of the Mirels'' score?', '["Site (Upper vs Lower limb)", "Size of lesion", "Type of lesion (Blastic vs Lytic)", "Patient age"]', 3, 'Components are: Site, Size, Nature (Lytic/Blastic), and Pain level.'),
    (v_case_id, 'Which lesion type receives a higher score (more risky) in Mirels'' criteria?', '["Blastic", "Lytic", "Mixed", "None"]', 1, 'Lytic lesions are more likely to fail mechanically than blastic ones.');

    ---------------------------------------------------------------------------
    -- CASE 33: Prophylactic Fixation
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Surgery Before the Fracture' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Surgery Before the Fracture', 'A surgeon is deciding between prophylactic fixation and observation for a patient with a femoral metastasis.

Vitals: N/A.
Laboratory Results: Mirels'' score is 10.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Rationale for prophylactic fixation in metastatic bone disease.', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the main advantage of prophylactic fixation over waiting for a fracture to occur?', '["Easier surgery, faster recovery, better pain control, and reduced risk of fat embolism", "It is cheaper", "There is no advantage", "None"]', 0, 'Fixing a bone before it breaks is technically simpler and allows for immediate weight-bearing.'),
    (v_case_id, 'What is the most common device used for prophylactic fixation of a long bone shaft metastasis?', '["A simple plate", "An intramedullary (IM) nail", "A cast", "None"]', 1, 'Nails provide stable load-sharing and protect the entire length of the bone.'),
    (v_case_id, 'True or False: Radiation therapy should always be given after surgical fixation of a metastatic lesion.', '["True", "False"]', 0, 'Post-op radiation helps prevent tumor progression and hardware failure.');

    ---------------------------------------------------------------------------
    -- CASE 34: Soft Tissue Sarcoma Basics
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Deep Lump' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Deep Lump', 'A 50-year-old male presents with a painless, 10cm mass deep in his thigh. It has been growing for 3 months.

Vitals: Stable.
Physical Examination: Firm, non-tender mass, deep to the fascia. No skin changes.
Laboratory Results: MRI shows a heterogeneous mass within the quadriceps compartment.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Clinical presentation and initial workup of a suspected soft tissue sarcoma.', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the classic "Red Flags" for a soft tissue mass that should prompt a workup for sarcoma?', '["Size > 5cm, deep to fascia, increasing in size, and painful", "Size < 2cm", "A soft, mobile lump in the skin", "None"]', 0, 'Any large or deep mass should be treated as a sarcoma until proven otherwise.'),
    (v_case_id, 'What is the most important imaging study for evaluating a soft tissue mass?', '["Ultrasound", "MRI with and without contrast", "Bone scan", "None"]', 1, 'MRI provides the best detail for tumor margins and relationship to nerves/vessels.'),
    (v_case_id, 'True or False: A simple "excisional" biopsy (shelling it out) is appropriate for a 10cm deep thigh mass.', '["True", "False"]', 1, 'Excisional biopsy of a large sarcoma contaminates the entire area; a core needle or incisional biopsy is mandatory first.');

    ---------------------------------------------------------------------------
    -- CASE 35: Liposarcoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fatty Malignancy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fatty Malignancy', 'A 65-year-old presents with a very large, painless mass in his retroperitoneum. Biopsy shows a "well-differentiated" fatty tumor.

Vitals: Stable.
Laboratory Results: Imaging shows a huge fat-containing mass with some internal septations.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Well-differentiated Liposarcoma.', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common soft tissue sarcoma in adults?', '["Synovial Sarcoma", "Liposarcoma", "Rhabdomyosarcoma", "None"]', 1, 'Liposarcomas are common, especially in the extremities and retroperitoneum.'),
    (v_case_id, 'What is the characteristic genetic finding in Well-Differentiated Liposarcoma?', '["t(11;22)", "Amplification of MDM2 and CDK4", "t(X;18)", "None"]', 1, 'This is diagnostic and helps differentiate it from a simple lipoma.'),
    (v_case_id, 'True or False: Well-differentiated liposarcoma frequently metastasizes to the lungs.', '["True", "False"]', 1, 'Well-differentiated variants have almost zero metastatic potential unless they "dedifferentiate" into a higher-grade sarcoma.');

    ---------------------------------------------------------------------------
    -- CASE 36: Synovial Sarcoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Young Adult Sarcoma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Young Adult Sarcoma', 'A 25-year-old female presents with a small, painful mass near her ankle. She was told it was a "ganglion cyst" 6 months ago.

Vitals: Stable.
Laboratory Results: X-rays show some faint "speckled" calcification within the mass. Biopsy shows a biphasic tumor (epithelial and spindle cells).', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Synovial Sarcoma in a 25-year-old.', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic chromosomal translocation in Synovial Sarcoma?', '["t(11;22)", "t(X;18) (SYT-SSX)", "t(12;16)", "None"]', 1, 'This is a highly specific translocation for synovial sarcoma.'),
    (v_case_id, 'True or False: Synovial sarcoma arises from the synovial lining of joints.', '["True", "False"]', 1, 'Despite the name, it arises from mesenchymal cells and is rarely found INSIDE a joint; it is usually "para-articular."'),
    (v_case_id, 'Which sarcoma is most likely to metastasize to lymph nodes?', '["Osteosarcoma", "Synovial Sarcoma (and Clear Cell Sarcoma, Rhabdomyosarcoma)", "Ewing Sarcoma", "None"]', 1, 'While most sarcomas spread via the blood, a few (like Synovial) have a higher rate of nodal spread.');

    ---------------------------------------------------------------------------
    -- CASE 37: Undifferentiated Pleomorphic Sarcoma (UPS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The High-Grade Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The High-Grade Mass', 'A 75-year-old male presents with a large, rapidly growing mass in his thigh.

Vitals: Stable.
Laboratory Results: Biopsy shows highly pleomorphic spindle cells with no specific line of differentiation.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Undifferentiated Pleomorphic Sarcoma (formerly MFH).', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What was this tumor formerly known as?', '["Liposarcoma", "Malignant Fibrous Histiocytoma (MFH)", "Chordoma", "None"]', 1, 'UPS is now the preferred term for this "wastebasket" category of high-grade pleomorphic sarcomas.'),
    (v_case_id, 'In an elderly patient with a new, large, high-grade thigh mass, what is the most common diagnosis?', '["Synovial Sarcoma", "UPS / MFH", "Ewing Sarcoma", "None"]', 1, 'UPS is the most common soft tissue sarcoma in the elderly.'),
    (v_case_id, 'The standard of care for a large, high-grade extremity UPS is:', '["Radiation alone", "Pre-operative radiation followed by wide surgical resection", "Amputation only", "None"]', 1, 'Combined modality treatment (radiation + surgery) provides the best local control.');

    ---------------------------------------------------------------------------
    -- CASE 38: Rhabdomyosarcoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pediatric Soft Tissue Sarcoma' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pediatric Soft Tissue Sarcoma', 'A 4-year-old child presents with a mass in his arm. Biopsy shows small blue round cells that stain positive for Desmin and Myogenin.

Vitals: Stable.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pediatric Rhabdomyosarcoma.', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common soft tissue sarcoma in children?', '["Liposarcoma", "Rhabdomyosarcoma", "Synovial Sarcoma", "None"]', 1, 'It arises from skeletal muscle lineage.'),
    (v_case_id, 'Which subtype of Rhabdomyosarcoma has the worst prognosis?', '["Embryonal", "Alveolar (associated with t(2;13))", "Pleomorphic", "None"]', 1, 'Alveolar variants are more aggressive.'),
    (v_case_id, 'True or False: Rhabdomyosarcoma is treated primarily with multi-agent chemotherapy.', '["True", "False"]', 0, 'Chemotherapy is the cornerstone of treatment for this systemic disease.');

    ---------------------------------------------------------------------------
    -- CASE 39: Fibrosarcoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Herringbone Pattern' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Herringbone Pattern', 'A 40-year-old presents with a deep mass. Biopsy shows monomorphic spindle cells arranged in an intersecting "herringbone" or "zig-zag" pattern.

Vitals: Stable.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Fibrosarcoma; herringbone pattern.', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic histological pattern for Fibrosarcoma?', '["Chinese characters", "Herringbone pattern", "Whirls", "None"]', 1, 'This is a high-yield buzzword.'),
    (v_case_id, 'Fibrosarcoma is a diagnosis of:', '["First choice", "Exclusion (once other spindle cell sarcomas are ruled out)", "Bone marrow", "None"]', 1, 'Modern IHC has reclassified many "fibrosarcomas" as other entities.'),
    (v_case_id, 'True or False: Congenital fibrosarcoma in infants has a very GOOD prognosis.', '["True", "False"]', 0, 'The infantile version is distinct and much less aggressive than the adult version.');

    ---------------------------------------------------------------------------
    -- CASE 40: Myxofibrosarcoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tail Sign' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tail Sign', 'An elderly patient has a large, multinodular mass in the subcutaneous tissue of the leg. MRI shows infiltrative "tails" extending along the fascial planes.

Vitals: Stable.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Myxofibrosarcoma; infiltrative growth and "tail sign."', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is characteristic about the growth pattern of Myxofibrosarcoma?', '["It is perfectly round", "Highly infiltrative growth along fascia (the \"tail sign\") which leads to high local recurrence rates", "It is very small", "None"]', 1, 'This infiltrative nature makes achieving clear margins very difficult.'),
    (v_case_id, 'True or False: Myxofibrosarcoma was formerly called myxoid MFH.', '["True", "False"]', 0, 'It is now recognized as a distinct entity.'),
    (v_case_id, 'What is the most common location for myxofibrosarcoma?', '["Internal organs", "Subcutaneous tissues of the extremities in elderly patients", "The brain", "None"]', 1, 'It is often more superficial than other sarcomas but still very aggressive.');
    ---------------------------------------------------------------------------
    -- CASE 41: Lipoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Simple Lump' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Simple Lump', 'A 45-year-old female presents with a soft, painless lump on her forearm that has been present for years.

Vitals: Stable.
Physical Examination: Soft, mobile, non-tender subcutaneous mass. It is not deep to the fascia.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 45-year-old with a classic subcutaneous lipoma.', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common benign soft tissue tumor in adults?', '["Hemangioma", "Lipoma", "Neurofibroma", "None"]', 1, 'Lipomas are extremely common and usually asymptomatic.'),
    (v_case_id, 'True or False: Most lipomas require surgical excision.', '["True", "False"]', 1, 'Observation is appropriate unless they are painful, growing rapidly, or causing functional issues.'),
    (v_case_id, 'What is the characteristic MRI finding of a lipoma?', '["High signal on T1 and T2, suppressed on fat-saturation sequences (identical to subcutaneous fat)", "Low signal on T1", "Bright on contrast", "None"]', 0, 'Signal intensity identical to normal fat is diagnostic.');

    ---------------------------------------------------------------------------
    -- CASE 42: Soft Tissue Hemangioma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Vascular Mass' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Vascular Mass', 'A 20-year-old has a soft mass in his calf that swells with activity.

Vitals: Stable.
Laboratory Results: X-rays show multiple small, round, calcified densities (phleboliths) within the soft tissues of the calf.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Soft tissue hemangioma; presence of phleboliths.', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are "Phleboliths"?', '["Bone fragments", "Small, calcified thrombi within a vascular malformation or hemangioma", "Kidney stones", "None"]', 1, 'Phleboliths are a highly characteristic radiographic sign of vascular lesions.'),
    (v_case_id, 'Which MRI sequence is best for identifying the "bag of worms" appearance of a vascular lesion?', '["T1", "T2 (shows high signal fluid in vessels)", "Bone scan", "None"]', 1, 'T2-weighted images show the bright vascular channels.'),
    (v_case_id, 'True or False: Intramuscular hemangiomas can cause localized muscle pain and atrophy.', '["True", "False"]', 0, 'Symptomatic lesions may require embolization or surgical excision.');

    ---------------------------------------------------------------------------
    -- CASE 43: Tenosynovial Giant Cell Tumor (PVNS)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rusty Joint' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rusty Joint', 'A 30-year-old male presents with recurrent, painless swelling of his knee and "bloody" fluid on aspiration.

Vitals: Stable.
Laboratory Results: MRI shows massive synovial thickening with "blooming" on gradient-echo sequences (due to hemosiderin).', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pigmented Villonodular Synovitis (PVNS) of the knee.', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic histological finding in PVNS?', '["Malignant spindle cells", "Hemosiderin-laden macrophages and multinucleated giant cells", "Small blue cells", "None"]', 1, 'The deposition of iron (hemosiderin) gives the synovium a "rusty" brown appearance.'),
    (v_case_id, 'What is the difference between "Localized" and "Diffuse" TGCT?', '["One is in the bone", "Localized (nodular) is typically in the hand; Diffuse (PVNS) involves the whole joint synovium", "One is malignant", "None"]', 1, 'Diffuse type has a much higher recurrence rate after synovectomy.'),
    (v_case_id, 'The overexpression of which cytokine drives the proliferation of cells in TGCT?', '["IL-6", "CSF-1 (Colony Stimulating Factor 1)", "TNF-alpha", "None"]', 1, 'A translocation t(1;2) leads to CSF-1 overexpression; CSF-1 inhibitors (like Pexidartinib) are now used for treatment.');

    ---------------------------------------------------------------------------
    -- CASE 44: Desmoid Tumor (Aggressive Fibromatosis)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fibrous Infiltrator' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fibrous Infiltrator', 'A 35-year-old female presents with a firm, infiltrative mass in her abdominal wall after a C-section.

Vitals: Stable.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Desmoid tumor of the abdominal wall.', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a "Desmoid Tumor"?', '["A type of skin cancer", "A benign but locally aggressive fibroblastic tumor that does NOT metastasize", "A highly malignant sarcoma", "None"]', 1, 'Despite being "benign," they can be very difficult to control locally.'),
    (v_case_id, 'What genetic pathway is commonly involved in Desmoid tumors?', '["Wnt / Beta-catenin pathway (APC gene mutations)", "t(11;22)", "RB1", "None"]', 0, 'Beta-catenin accumulation in the nucleus is a diagnostic hallmark.'),
    (v_case_id, 'True or False: Desmoid tumors are associated with Gardner Syndrome.', '["True", "False"]', 0, 'Gardner syndrome (a variant of FAP) includes desmoid tumors, osteomas, and colonic polyps.');

    ---------------------------------------------------------------------------
    -- CASE 45: Myositis Ossificans
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Post-Traumatic Bone' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Post-Traumatic Bone', 'A 22-year-old athlete presents with a painful mass in his quadriceps 4 weeks after a severe "thigh contusion."

Vitals: Stable.
Laboratory Results: X-rays show a soft tissue mass with peripheral calcification.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Myositis ossificans following muscle trauma.', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the "Zonation Phenomenon" in Myositis Ossificans?', '["The tumor gets darker", "Maturation of bone from the periphery (mature bone) to the center (immature bone)", "The bone disappears", "None"]', 1, 'This is the OPPOSITE of Osteosarcoma, where the center is typically more mature/calcified.'),
    (v_case_id, 'Why is it important to wait before surgically excising Myositis Ossificans?', '["To prevent infection", "To allow the bone to \"mature\" and stabilize, which reduces the risk of recurrence", "It is not necessary to wait", "None"]', 1, 'Excision during the active phase leads to very high recurrence rates.'),
    (v_case_id, 'True or False: Myositis Ossificans is a malignant condition.', '["True", "False"]', 1, 'It is purely reactive and benign, though it can mimic a sarcoma on biopsy if the zonation is not recognized.');

    ---------------------------------------------------------------------------
    -- CASE 46: Schwannoma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Eccentric Nerve Tumor' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Eccentric Nerve Tumor', 'A 40-year-old presents with a mass in his arm that causes "electric shocks" when tapped (Tinel''s sign).

Vitals: Stable.
Laboratory Results: MRI shows a well-defined mass eccentric to the nerve. Biopsy shows Antoni A and Antoni B patterns.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Schwannoma of the median nerve.', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does a Schwannoma differ from a Neurofibroma in terms of relationship to the nerve?', '["Schwannomas are eccentric and can be \"shelled out\"; Neurofibromas are intrinsic and involve the whole nerve", "They are the same", "One is in the bone", "None"]', 0, 'This is a key surgical distinction.'),
    (v_case_id, 'What are "Verocay Bodies"?', '["A type of white blood cell", "Palisading nuclei found in the Antoni A (cellular) areas of a Schwannoma", "A type of fracture", "None"]', 1, 'Verocay bodies are a classic histological feature.'),
    (v_case_id, 'True or False: Schwannomas are S100 positive.', '["True", "False"]', 0, 'S100 is a marker for nerve sheath tumors.');

    ---------------------------------------------------------------------------
    -- CASE 47: Neurofibroma (NF1)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bag of Worms' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bag of Worms', 'A 15-year-old with multiple cafe-au-lait spots and Lisch nodules presents with a large, diffuse mass on his leg that feels like a "bag of worms."

Vitals: Stable.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Plexiform neurofibroma in a patient with NF1.', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a "Plexiform" Neurofibroma?', '["A simple skin bump", "A diffuse, infiltrative nerve sheath tumor that is pathognomonic for Neurofibromatosis Type 1 (NF1)", "A malignant tumor", "None"]', 1, 'Plexiform variants carry a 10% lifetime risk of transformation to MPNST.'),
    (v_case_id, 'What is "MPNST"?', '["A type of nerve block", "Malignant Peripheral Nerve Sheath Tumor", "A benign cyst", "None"]', 1, 'MPNST is a highly aggressive sarcoma that often arises from a pre-existing neurofibroma in NF1 patients.'),
    (v_case_id, 'True or False: NF1 is an autosomal dominant disorder.', '["True", "False"]', 0, 'It is caused by a mutation in the NF1 gene (Neurofibromin).');

    ---------------------------------------------------------------------------
    -- CASE 48: Glomus Tumor
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sensitive Fingertip' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sensitive Fingertip', 'A 30-year-old female presents with severe, pinpoint pain under her fingernail that is worsened by cold temperatures.

Vitals: Stable.
Physical Examination: Pinpoint tenderness (Love''s sign) and a small bluish discoloration under the nail.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Subungual glomus tumor; cold sensitivity.', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a "Glomus Tumor"?', '["A type of fungus", "A benign vascular tumor arising from the glomus body (a neuromyoarterial apparatus involved in temperature regulation)", "A bone cyst", "None"]', 1, 'Their origin in temperature-regulating bodies explains the cold sensitivity.'),
    (v_case_id, 'Where is the most common location for a glomus tumor?', '["The hip", "The subungual region (under the nail)", "The spine", "None"]', 1, 'Finger tips are the classic location.'),
    (v_case_id, 'Treatment for a symptomatic glomus tumor is:', '["Antibiotics", "Surgical excision", "Observation", "None"]', 1, 'Simple excision is usually curative and provides immediate pain relief.');

    ---------------------------------------------------------------------------
    -- CASE 49: Morton''s Neuroma
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Burning Foot' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Burning Foot', 'A 45-year-old female complains of burning pain in her foot that feels like "walking on a marble."

Vitals: Stable.
Physical Examination: Tenderness between the 3rd and 4th metatarsal heads. Squeezing the foot causes a "click" (Mulder''s click).', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Morton''s Neuroma (interdigital neuroma).', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is Morton''s Neuroma a true tumor?', '["Yes", "No, it is a reactive perineural fibrosis of the common digital nerve", "It is malignant", "None"]', 1, 'It is a reactive condition, not a neoplasm.'),
    (v_case_id, 'Where is it most commonly located?', '["Between the 1st and 2nd metatarsals", "Between the 3rd and 4th metatarsals", "In the heel", "None"]', 1, 'The 3rd webspace is the most common site.'),
    (v_case_id, 'Initial treatment for Morton''s neuroma:', '["Amputation", "Wide-toe box shoes, metatarsal pads, and potentially corticosteroid injections", "Immediate surgery", "None"]', 1, 'Conservative measures are successful in many patients.');

    ---------------------------------------------------------------------------
    -- CASE 50: Limb Salvage Principles
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Saving the Limb' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Saving the Limb', 'A surgeon is discussing limb salvage vs. amputation for a patient with a large sarcoma.

Vitals: N/A.
Physical Examination: N/A.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Principles of limb salvage surgery in orthopedic oncology.', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary requirement for attempting limb salvage surgery?', '["The patient wants it", "The ability to achieve wide surgical margins and maintain a functional limb", "The tumor is small", "None"]', 1, 'If a wide margin cannot be achieved, amputation may be oncologically safer.'),
    (v_case_id, 'True or False: Recent studies show that limb salvage and amputation have similar long-term survival rates for most sarcomas.', '["True", "False"]', 0, 'Limb salvage is the standard of care in over 90% of cases today due to advances in imaging, chemo, and reconstruction.'),
    (v_case_id, 'What is a "Van Nes Rotationplasty"?', '["A type of hip replacement", "A specialized limb salvage procedure where the ankle joint is used to replace the knee joint", "A type of cast", "None"]', 1, 'The leg is rotated 180 degrees so the ankle functions as a knee, providing a highly functional stump for prosthesis.');

END $$;

COMMIT;
