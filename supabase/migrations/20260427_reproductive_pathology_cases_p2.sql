-- Migration: Reproductive Pathology Cases Part 2 (11-20)
-- Goal: Cover Ovarian Tumors and Gestational Pathology
-- Sources: Pathoma, Robbins, Goljan

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'reproductive-pathology' LIMIT 1;

    -- DELETE existing cases for this range to prevent duplicates on re-run
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 11 AND 20);
    DELETE FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 11 AND 20;

    -- CASE 11: Polycystic Ovary Syndrome (PCOS)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Hirsutism and Obesity', 'A 22-year-old obese woman presents with irregular periods, acne, and excess facial hair. Labs show an LH:FSH ratio of 3:1 and increased fasting glucose.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic hormone ratio in PCOS?', '["LH:FSH > 3:1", "FSH:LH > 3:1", "Low LH, Low FSH", "High Progesterone"]', 0, 'In PCOS, the high LH:FSH ratio is a classic finding. High LH stimulates theca cells to produce excess androgens, while low FSH prevents follicle maturation.'),
    (v_case_id, 'The increased androgen levels are converted to what hormone in peripheral adipose tissue?', '["Testosterone", "Estrone", "Progesterone", "Cortisol"]', 1, 'Androstenedione is converted to estrone in fat cells. High estrone levels then provide negative feedback on FSH, worsening the cycle and increasing the risk of endometrial hyperplasia.'),
    (v_case_id, 'What common metabolic condition is associated with PCOS?', '["Type 1 Diabetes", "Insulin resistance / Type 2 Diabetes", "Hypothyroidism", "Addison disease"]', 1, 'Insulin resistance is a core feature of PCOS, leading to hyperinsulinemia which further stimulates theca cell androgen production.');

    -- CASE 12: Ovarian Surface Epithelial Tumors
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Abdominal Bloating and Ascites', 'A 60-year-old woman presents with abdominal fullness and increasing girth. Imaging reveals a large bilateral cystic ovarian mass with solid areas. Biopsy shows papillary structures and psammoma bodies.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Serous Cystadenocarcinoma", "Mucinous Cystadenoma", "Dysgerminoma", "Brenner Tumor"]', 0, 'Serous cystadenocarcinoma is the most common malignant ovarian tumor, often bilateral, and frequently contains psammoma bodies.'),
    (v_case_id, 'What serum marker is used to monitor progression and recurrence in surface epithelial tumors?', '["AFP", "hCG", "CA-125", "CEA"]', 2, 'CA-125 is a useful marker for monitoring treatment response and screening for recurrence in epithelial ovarian cancers.'),
    (v_case_id, 'Which gene mutation is associated with an increased risk of both breast and serous ovarian carcinoma?', '["p53", "BRCA1", "APC", "WT1"]', 1, 'BRCA1 (and BRCA2) mutations significantly increase the risk of serous carcinoma of the ovary and fallopian tube.');

    -- CASE 13: Ovarian Germ Cell Tumors (Cystic Teratoma)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Ovarian Mass with Teeth and Hair', 'An 18-year-old woman is found to have a 10 cm ovarian mass during a routine physical. Imaging shows calcifications. Surgery reveals a cyst containing hair, sebum, and a well-formed tooth.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Mature Cystic Teratoma", "Immature Teratoma", "Yolk Sac Tumor", "Dysgerminoma"]', 0, 'Mature cystic teratoma (dermoid cyst) is a benign germ cell tumor containing elements from all three germ layers.'),
    (v_case_id, 'What is "Struma ovarii"?', '["A teratoma composed primarily of neural tissue", "A teratoma composed primarily of thyroid tissue", "A teratoma with teeth only", "A malignant teratoma"]', 1, 'Struma ovarii is a specialized teratoma that contains mature thyroid tissue and can occasionally cause hyperthyroidism.'),
    (v_case_id, 'How can you distinguish a mature teratoma from an immature teratoma?', '["Size of the mass", "Presence of immature/embryonic tissue, especially neuroectoderm", "Presence of hair", "The age of the patient"]', 1, 'Immature teratomas contain embryonic-like tissue (usually neural) and are malignant, unlike the mature (benign) version.');

    -- CASE 14: Dysgerminoma vs Yolk Sac Tumor
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Young Girl with Ovarian Mass and High LDH', 'A 14-year-old girl presents with a large pelvic mass. Labs show a normal AFP and hCG, but a markedly elevated LDH. Biopsy shows large cells with clear cytoplasm and central nuclei ("fried-egg" appearance).', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Dysgerminoma", "Yolk Sac Tumor", "Choriocarcinoma", "Endometrial sinus tumor"]', 0, 'Dysgerminoma is the female equivalent of the testicular seminoma. It is the most common malignant germ cell tumor in young women and is often LDH+ but AFP/hCG negative.'),
    (v_case_id, 'What finding would you expect if the diagnosis were instead a Yolk Sac Tumor?', '["Psammoma bodies", "Schiller-Duval bodies and elevated AFP", "Call-Exner bodies", "Reinke crystals"]', 1, 'Yolk sac tumors (endodermal sinus tumors) are aggressive, show Schiller-Duval bodies (glomeruloid structures), and produce AFP.'),
    (v_case_id, 'Which of the following describes the histological appearance of a Dysgerminoma?', '["Large cells with clear cytoplasm and central nuclei divided by fibrous septa with lymphocytes", "Small, dark cells in a rosette pattern", "Hobnail cells", "Spindle cells"]', 0, 'The "fried-egg" appearance with lymphocytic infiltration of the fibrous septa is classic for dysgerminoma/seminoma.');

    -- CASE 15: Sex Cord-Stromal Tumors (Granulosa-Theca)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Precocious Puberty', 'A 6-year-old girl presents with early breast development and vaginal bleeding. Imaging shows a solid ovarian mass. Biopsy shows small, follicle-like structures filled with eosinophilic material (Call-Exner bodies).', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Sertoli-Leydig Cell Tumor", "Granulosa-Theca Cell Tumor", "Teratoma", "Fibroma"]', 1, 'Granulosa-theca cell tumors produce estrogen, which causes precocious puberty in young girls or postmenopausal bleeding in older women.'),
    (v_case_id, 'Which sex cord-stromal tumor is associated with Meigs Syndrome (ovarian mass, ascites, and pleural effusion)?', '["Granulosa Cell Tumor", "Thecoma", "Fibroma", "Sertoli Cell Tumor"]', 2, 'Meigs syndrome is characterized by the triad of a benign ovarian fibroma, ascites, and pleural effusion that resolves after tumor removal.'),
    (v_case_id, 'What is the likely finding in a Sertoli-Leydig cell tumor?', '["Estrogen excess and feminization", "Androgen excess and virilization (hirsutism, deepening voice)", "Progesterone excess", "No hormonal changes"]', 1, 'Sertoli-Leydig tumors produce androgens, leading to defeminization and masculinization.');

    -- CASE 16: Ectopic Pregnancy
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Sudden Abdominal Pain and Positive Pregnancy Test', 'A 28-year-old woman presents with sudden, severe right lower quadrant pain and fainting. Her last menstrual period was 7 weeks ago. Her urine hCG is positive. Exam shows adnexal tenderness and guarding.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Acute Appendicitis", "Ruptured Ectopic Pregnancy", "Ovarian Torsion", "Spontaneous Abortion"]', 1, 'The combination of positive pregnancy test, severe pelvic pain, and signs of shock suggests a ruptured ectopic pregnancy.'),
    (v_case_id, 'What is the most common site for an ectopic pregnancy?', '["Ovary", "Cervix", "Fallopian Tube (Ampulla)", "Abdominal cavity"]', 2, 'Approximately 95-98% of ectopic pregnancies occur in the fallopian tube, specifically the ampulla.'),
    (v_case_id, 'What is the most common RISK FACTOR for this condition?', '["Advanced maternal age", "Pelvic Inflammatory Disease (PID) / Salpingitis", "Use of oral contraceptives", "Multiple gestations"]', 1, 'PID leads to scarring of the fallopian tubes, which impairs the passage of the fertilized egg to the uterus.');

    -- CASE 17: Placenta Previa vs Abruption
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Third Trimester Bleeding', 'A woman in her 34th week of pregnancy presents with sudden onset of PAINLESS vaginal bleeding. She has had no prior complications.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Placental Abruption", "Placenta Previa", "Vasa Previa", "Placenta Accreta"]', 1, 'Placenta previa (implantation over the cervical os) classically presents as PAINLESS third-trimester bleeding.'),
    (v_case_id, 'How does Placental Abruption typically present?', '["Painless bleeding", "Painful bleeding and uterine tenderness in the third trimester", "No bleeding", "Slow leaking of fluid"]', 1, 'Abruption (premature separation of the placenta) involves painful bleeding and can lead to DIC or fetal distress.'),
    (v_case_id, 'What is Placenta Accreta?', '["Placenta implanted over the os", "Placenta attached directly to the myometrium due to a defective decidua", "Placenta separating too early", "Fetal vessels crossing the os"]', 1, 'Accreta involves abnormal adherence of the placenta to the myometrium, often leading to severe hemorrhage and difficulty removing the placenta after delivery.');

    -- CASE 18: Preeclampsia and HELLP Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'High Blood Pressure and Proteinuria', 'A 32-year-old woman in her 32nd week of pregnancy presents with a headache and swelling of her hands and feet. Her BP is 160/110 mmHg, and a urinalysis shows 3+ protein.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Gestational Hypertension", "Preeclampsia", "Eclampsia", "HELLP Syndrome"]', 1, 'Preeclampsia is defined by new-onset hypertension and proteinuria (or end-organ dysfunction) after 20 weeks of gestation.'),
    (v_case_id, 'When does preeclampsia become Eclampsia?', '["When BP exceeds 180/120", "With the onset of seizures", "When there is severe liver damage", "When the fetus dies"]', 1, 'Eclampsia is preeclampsia with the addition of generalized tonic-clonic seizures.'),
    (v_case_id, 'What does the "HELLP" in HELLP syndrome stand for?', '["Hyper-estrogenism, Elevated Liver enzymes, Low Platelets", "Hemolysis, Elevated Liver enzymes, Low Platelets", "Headache, Edema, Liver Labs, Proteinuria", "None of the above"]', 1, 'HELLP syndrome is a severe variant of preeclampsia involving Hemolysis, Elevated Liver enzymes, and Low Platelets.');

    -- CASE 19: Hydatidiform Mole (Complete vs Partial)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Large for Dates and Snowstorm Appearance', 'A 25-year-old woman presents with vaginal bleeding and severe nausea in her 12th week of pregnancy. Her uterus is the size of a 20-week gestation. Ultrasound shows a "snowstorm" appearance with no fetal parts. Her hCG is > 200,000 mIU/mL.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Complete Hydatidiform Mole", "Partial Hydatidiform Mole", "Choriocarcinoma", "Twin Pregnancy"]', 0, 'A complete mole features massively elevated hCG, larger-than-expected uterus, "grape-like" vesicles, and no fetal tissue.'),
    (v_case_id, 'What is the typical karyotype and origin of a Complete Mole?', '["46,XX (all paternal origin)", "69,XXX (triploid)", "46,XY (maternal origin)", "45,X"]', 0, 'Complete moles occur when an empty egg is fertilized by two sperm (or one that duplicates), resulting in a diploid 46,XX or 46,XY genome that is entirely paternal.'),
    (v_case_id, 'What is the characteristic karyotype of a Partial Mole?', '["46,XX", "69,XXX or 69,XXY (triploid)", "45,X", "47,XXY"]', 1, 'Partial moles result from two sperm fertilizing a normal egg, leading to 69 chromosomes and often containing some fetal parts.');

    -- CASE 20: Gestational Choriocarcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Persistent hCG and Lung Mass', 'A woman who had a complete molar pregnancy 6 months ago presents with shortness of breath and hemoptysis. Her hCG levels have started rising again. Chest X-ray shows multiple "cannonball" nodules.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Placental Site Trophoblastic Tumor", "Choriocarcinoma", "Recurrent Mole", "Lung Cancer"]', 1, 'Choriocarcinoma is a highly malignant trophoblastic tumor that frequently metastasizes to the lungs ("cannonball metastases").'),
    (v_case_id, 'Unlike other germ cell choriocarcinomas, gestational choriocarcinoma is known for which clinical feature?', '["It is resistant to treatment", "It is highly responsive to chemotherapy (Methotrexate)", "It does not produce hCG", "It only affects the liver"]', 1, 'Gestational choriocarcinoma is uniquely sensitive to chemotherapy and is often curable even when widely metastatic.'),
    (v_case_id, 'Histologically, choriocarcinoma is composed of which two cell types?', '["Syncytiotrophoblasts and Cytotrophoblasts", "Clear cells and Hobnail cells", "Fibroblasts and Lymphocytes", "Squamous and Glandular cells"]', 0, 'Choriocarcinoma is a proliferation of trophoblasts (syncytio- and cyto-) with NO villi.');

    RAISE NOTICE 'SUCCESS: Reproductive Pathology Cases Part 2 (11-20) registered.';
END $$;

COMMIT;
