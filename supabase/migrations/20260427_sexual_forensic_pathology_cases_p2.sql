-- Migration: Sexual & Forensic Pathology Cases Part 2 (11-20)
-- Goal: Cover Male Genital Tract and Breast Pathology
-- Sources: Pathoma, Robbins, Goljan

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'sexual-forensic-pathology' LIMIT 1;

    -- DELETE existing cases for this range to prevent duplicates on re-run
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 11 AND 20);
    DELETE FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 11 AND 20;

    -- CASE 11: Benign Prostatic Hyperplasia (BPH)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Difficulty Urinating', 'A 70-year-old man presents with urinary frequency, urgency, and a weak stream. Digital rectal exam (DRE) reveals a smooth, firm, enlarged prostate.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which part of the prostate is primarily affected in BPH?', '["Peripheral zone", "Central zone", "Transitional (periurethral) zone", "Anterior fibromuscular stroma"]', 2, 'BPH typically involves the transitional zone, which surrounds the urethra, explaining the obstructive symptoms.'),
    (v_case_id, 'What hormone is the primary driver of prostatic hyperplasia?', '["Testosterone", "Dihydrotestosterone (DHT)", "Estrogen", "Prolactin"]', 1, 'DHT, converted from testosterone by 5-alpha-reductase, is the most potent androgen in the prostate and drives hyperplasia.'),
    (v_case_id, 'Does BPH increase the risk of prostate cancer?', '["Yes, significantly", "No", "Only if PSA is > 10", "Only in smokers"]', 1, 'BPH is a benign process and is NOT considered a precursor to prostate adenocarcinoma.');

    -- CASE 12: Prostate Adenocarcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Low Back Pain', 'An 80-year-old man presents with progressive low back pain. DRE reveals a hard, nodular prostate. Imaging shows several osteoblastic lesions in the lumbar vertebrae.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Where does prostate adenocarcinoma typically arise?', '["Transitional zone", "Central zone", "Peripheral zone", "Periurethral glands"]', 2, 'Prostate cancer usually arises in the peripheral zone (posteriorly), which is why it can be felt on DRE but often lacks early obstructive symptoms.'),
    (v_case_id, 'What is the characteristic appearance of metastatic prostate cancer in the bone?', '["Osteolytic (punched-out) lesions", "Osteoblastic (sclerotic) lesions", "Soap-bubble appearance", "Onion-skin appearance"]', 1, 'Prostate cancer classically causes osteoblastic (bone-forming) metastases, appearing as dense white spots on X-ray.'),
    (v_case_id, 'What grading system is used to determine the prognosis of this cancer?', '["TNM staging", "Gleason Score", "FIGO stage", "Breslow thickness"]', 1, 'The Gleason system grades the architectural patterns of the tumor cells; a higher score indicates a more aggressive tumor.');

    -- CASE 13: Testicular Seminoma
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Painless Testicular Mass', 'A 30-year-old man presents with a painless, heavy mass in his right scrotum. Ultrasound confirms a solid intratesticular tumor. Serum markers show a mildly elevated hCG but normal AFP.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Yolk Sac Tumor", "Seminoma", "Choriocarcinoma", "Embryonal Carcinoma"]', 1, 'Seminoma is the most common germ cell tumor in men and typically presents as a painless mass in young adults.'),
    (v_case_id, 'What is the characteristic histological appearance of this tumor?', '["Large cells with clear cytoplasm and central nuclei (fried-egg appearance)", "Schiller-Duval bodies", "Slit-like vascular spaces", "Primitive glands"]', 0, 'Seminomas are composed of large, uniform cells with clear cytoplasm and distinct cell membranes, separated by fibrous septa containing lymphocytes.'),
    (v_case_id, 'Which of the following is true regarding tumor markers in Seminoma?', '["AFP is always high", "hCG is never elevated", "AFP is NEVER elevated", "LDH is the only marker used"]', 2, 'By definition, a pure seminoma will NOT produce AFP. If AFP is elevated, a non-seminomatous component must be present.');

    -- CASE 14: Yolk Sac Tumor (Male)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Scrotal Mass in a Toddler', 'A 2-year-old boy is brought to the clinic for a large scrotum. Physical exam reveals a firm, non-tender testicular mass. Serum AFP is markedly elevated.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Seminoma", "Yolk Sac (Endodermal Sinus) Tumor", "Leydig Cell Tumor", "Teratoma"]', 1, 'Yolk sac tumor is the most common testicular tumor in infants and young children (up to age 3).'),
    (v_case_id, 'What is the characteristic histological structure seen in this tumor?', '["Call-Exner bodies", "Schiller-Duval bodies", "Reinke crystals", "Psammoma bodies"]', 1, 'Schiller-Duval bodies resemble primitive glomeruli and are pathognomonic for yolk sac tumors.'),
    (v_case_id, 'Which tumor marker is characteristically elevated?', '["hCG", "Alpha-fetoprotein (AFP)", "CA-125", "PSA"]', 1, 'AFP is the hallmark marker for yolk sac tumors.');

    -- CASE 15: Cryptorchidism and Torsion
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Sudden Scrotal Pain', 'A 14-year-old boy presents with sudden, excruciating left-sided scrotal pain and nausea. On exam, the left testis is high-riding and the cremasteric reflex is absent.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Epididymitis", "Testicular Torsion", "Hydrocele", "Spermatocele"]', 1, 'Sudden pain and an absent cremasteric reflex in an adolescent are classic for torsion.'),
    (v_case_id, 'What is the pathophysiological mechanism of the injury in torsion?', '["Arterial occlusion followed by venous congestion", "Venous obstruction leading to hemorrhagic infarction", "Nerve compression", "Infection"]', 1, 'Torsion first obstructs the thin-walled veins. Blood continues to flow in via the arteries but cannot leave, leading to congestion and subsequent hemorrhagic infarction.'),
    (v_case_id, 'Separately, a patient with cryptorchidism (undescended testis) is at an increased risk for which of the following?', '["Infertility and Testicular Cancer", "Hydrocele", "Prostate cancer", "Kidney stones"]', 0, 'Cryptorchidism significantly increases the risk of germ cell tumors (especially seminoma) and infertility, even if surgically corrected.');

    -- CASE 16: Fibroadenoma of the Breast
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Mobile Lump', 'A 22-year-old woman presents with a firm, painless, highly mobile "marble-like" lump in her left breast. It does not change with her menstrual cycle.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Invasive Ductal Carcinoma", "Fibroadenoma", "Phyllodes Tumor", "Breast Cyst"]', 1, 'Fibroadenoma is the most common benign breast tumor in young women and is characterized by its high mobility.'),
    (v_case_id, 'Which part of the breast tissue proliferates in a fibroadenoma?', '["Glandular tissue only", "Fibrous stroma only", "Both fibrous stroma and glandular tissue", "Fatty tissue"]', 2, 'Fibroadenomas are biphasic tumors consisting of both proliferating stroma and epithelium-lined glands.'),
    (v_case_id, 'Does a simple fibroadenoma increase the risk of breast cancer?', '["Yes, 10x risk", "No increased risk", "Only if it is > 5cm", "Only in postmenopausal women"]', 1, 'A simple fibroadenoma is not considered a precursor to cancer and does not significantly increase cancer risk.');

    -- CASE 17: Fibrocystic Changes (Breast)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Lumpy Breasts', 'A 35-year-old woman presents with bilateral, "lumpy" breasts that become painful and more swollen just before her period.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for this non-neoplastic condition?', '["Mastitis", "Fibrocystic Changes", "Fat Necrosis", "Ductal Carcinoma In Situ"]', 1, 'Fibrocystic changes are common in premenopausal women and are often driven by hormonal fluctuations.'),
    (v_case_id, 'Which feature of fibrocystic changes carries the highest risk of progression to invasive carcinoma?', '["Simple cysts", "Fibrosis", "Atypical Hyperplasia", "Apocrine metaplasia"]', 2, 'Atypical ductal or lobular hyperplasia increases the risk of cancer by about 4-5 fold.'),
    (v_case_id, 'What is "Sclerosing Adenosis"?', '["A type of breast cancer", "Increased number of acini and stromal fibrosis (may have calcifications)", "Metaplasia of the nipple", "A bacterial infection of the breast"]', 1, 'Sclerosing adenosis is a common fibrocystic change characterized by acinar proliferation and stromal fibrosis, which can sometimes mimic cancer on mammography.');

    -- CASE 18: Invasive Ductal Carcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Nipple Retraction', 'A 55-year-old woman presents with a hard, fixed, painless lump in the upper outer quadrant of her right breast. On exam, the nipple is retracted and the skin looks like an "orange peel" (peau d''orange).', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Invasive Ductal Carcinoma (IDC)", "Lobular Carcinoma", "Medullary Carcinoma", "Inflammatory Breast Cancer"]', 0, 'IDC is the most common type of breast cancer. Peau d''orange is caused by tumor involvement of dermal lymphatics.'),
    (v_case_id, 'What causes the "nipple retraction" seen in this case?', '["Hormonal changes", "Invasion of the suspensory (Cooper''s) ligaments", "Accumulation of fat", "Infection"]', 1, 'Infiltration and shortening of Cooper''s ligaments by the tumor leads to skin dimpling or nipple retraction.'),
    (v_case_id, 'Which molecular subtype of breast cancer has the worst prognosis?', '["Luminal A (ER+/PR+)", "Luminal B", "HER2-enriched", "Triple Negative (ER-, PR-, HER2-)"]', 3, 'Triple negative cancers lack targeted therapy options and tend to be more aggressive, especially in younger women and those with BRCA1 mutations.');

    -- CASE 19: Paget Disease of the Nipple
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Itchy Nipple', 'A 60-year-old woman presents with a scaly, itchy, eczema-like rash on her nipple and areola that has not responded to topical steroids.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Contact dermatitis", "Paget Disease of the Nipple", "Nipple eversion", "Mammary duct ectasia"]', 1, 'Paget disease of the nipple presents as an eczematous lesion and almost always indicates an underlying ductal carcinoma (either DCIS or invasive).'),
    (v_case_id, 'What are "Paget cells" histologically?', '["Squamous cells", "Large cells with clear cytoplasm (mucinous) within the epidermis", "Lymphocytes", "Melanocytes"]', 1, 'Paget cells are malignant glandular cells that have migrated from the ducts into the epidermis of the nipple.'),
    (v_case_id, 'How do you distinguish Paget disease from melanoma of the nipple?', '["Paget cells are PAS positive (contain mucin); Melanoma is S100 positive", "There is no way to distinguish them", "Melanoma is always painful", "Paget cells are always pigmented"]', 0, 'Paget cells contain mucin (PAS+) because they are glandular in origin; melanoma cells are S100 positive and do not contain mucin.');

    -- CASE 20: Fat Necrosis of the Breast
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Lump After Seatbelt Injury', 'A 40-year-old woman presents with a firm, painless lump in her breast. She remembers a minor car accident two weeks ago where the seatbelt tightened across her chest.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Invasive Ductal Carcinoma", "Fat Necrosis", "Fibroadenoma", "Breast Abscess"]', 1, 'Fat necrosis is a benign condition often following trauma, appearing as a hard mass that can mimic cancer on physical exam.'),
    (v_case_id, 'What is the characteristic histological finding in fat necrosis?', '["Malignant spindles", "Necrotic fat cells surrounded by lipid-laden macrophages (foamy cells) and giant cells", "Blue-domed cysts", "Ductal hyperplasia"]', 1, 'The tissue shows saponification (calcium soaps), chronic inflammation, and macrophages clearing the oily debris.'),
    (v_case_id, 'How does this appear on a mammogram?', '["Clear cyst", "Stellate mass with or without eggshell calcifications", "Diffuse opacity", "Normal appearance"]', 1, 'Fat necrosis can appear as an irregular mass or "calcified oil cysts" on imaging, necessitating biopsy to rule out malignancy.');

    RAISE NOTICE 'SUCCESS: Sexual & Forensic Pathology Cases Part 2 (11-20) registered.';
END $$;

COMMIT;
