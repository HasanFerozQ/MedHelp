-- Migration: Sexual & Forensic Pathology Cases Part 1 (01-10)
-- Goal: Cover Female Genital Tract and Pregnancy Pathology
-- Sources: Pathoma, Robbins, Goljan

BEGIN;

-- 1. Ensure Topic "Sexual & Forensic Pathology" exists
INSERT INTO topics (title, slug, semester_id, year_id, "order", usmle_step)
VALUES ('Sexual & Forensic Pathology', 'sexual-forensic-pathology', 3, 2, 62, NULL)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'sexual-forensic-pathology' LIMIT 1;

    -- DELETE existing cases for this range to prevent duplicates on re-run
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 1 AND 10);
    DELETE FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 1 AND 10;

    -- CASE 01: Cervical Cancer (HPV)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Postcoital Bleeding', 'A 32-year-old woman presents with postcoital bleeding. She has not had a Pap smear in 10 years. Colposcopy reveals an exophytic mass on the cervix.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Endometrial Polyp", "Cervical Squamous Cell Carcinoma", "Leiomyoma", "Ectopic Pregnancy"]', 1, 'Cervical cancer classically presents as postcoital bleeding in women who have not had regular screening.'),
    (v_case_id, 'Which virus is most strongly associated with this condition?', '["HSV-2", "HPV 16", "EBV", "HIV"]', 1, 'High-risk HPV types (16, 18, 31, 33) are responsible for most cases of cervical carcinoma.'),
    (v_case_id, 'What is the primary mechanism of oncogenesis by this virus?', '["Activation of ras oncogene", "Inhibition of p53 and Rb via E6 and E7 proteins", "Chromosomal translocation", "Direct DNA damage"]', 1, 'HPV E6 protein targets p53 for degradation, and E7 protein inhibits Rb, leading to uncontrolled cell cycle progression.');

    -- CASE 02: Endometrial Hyperplasia/Carcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Postmenopausal Bleeding', 'A 60-year-old obese woman presents with vaginal bleeding. She has never been pregnant and has a history of polycystic ovary syndrome (PCOS).', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of postmenopausal bleeding that must be ruled out?', '["Atrophic vaginitis", "Endometrial hyperplasia/carcinoma", "Endometrial polyp", "Cervical cancer"]', 1, 'While atrophic vaginitis is common, endometrial hyperplasia or carcinoma must always be ruled out in the setting of postmenopausal bleeding.'),
    (v_case_id, 'What is the primary risk factor in this patient?', '["Progesterone excess", "Unopposed estrogen exposure", "Multiple sexual partners", "Early menopause"]', 1, 'Obesity, nulliparity, and PCOS all lead to high levels of estrogen without enough progesterone to "oppose" it, stimulating endometrial growth.'),
    (v_case_id, 'Which mutation is most commonly associated with the endometrioid type of this cancer?', '["TP53", "PTEN", "KRAS", "BRCA1"]', 1, 'PTEN mutations are found in 30-80% of endometrioid endometrial carcinomas.');

    -- CASE 03: Leiomyoma (Fibroids)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Heavy Menstrual Bleeding', 'A 35-year-old African American woman presents with heavy menstrual bleeding (menorrhagia) and pelvic pressure. On exam, her uterus is enlarged and irregular.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Leiomyoma", "Leiomyosarcoma", "Endometriosis", "Adenomyosis"]', 0, 'Leiomyomas (fibroids) are the most common benign tumor in females and are much more common in African Americans.'),
    (v_case_id, 'How do these tumors respond to estrogen?', '["They shrink during pregnancy", "They enlarge during pregnancy and shrink after menopause", "They are unrelated to hormones", "They disappear with OCP use"]', 1, 'Leiomyomas are estrogen-sensitive; they grow during pregnancy and typically regress after menopause.'),
    (v_case_id, 'What is the characteristic histological finding?', '["Whirled pattern of smooth muscle bundles", "Malignant pleomorphic spindles", "Endometrial glands in the myometrium", "Cystic spaces with chocolate fluid"]', 0, 'Leiomyomas show a classic whorled pattern of smooth muscle cells with no significant atypia or necrosis.');

    -- CASE 04: Endometriosis
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Dysmenorrhea and Infertility', 'A 28-year-old woman presents with severe pelvic pain during menstruation (dysmenorrhea) and difficulty conceiving for 2 years. Laparoscopy shows "powder-burn" lesions on the peritoneum.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Adenomyosis", "Endometriosis", "Pelvic Inflammatory Disease", "Polycystic Ovary Syndrome"]', 1, 'Endometriosis is the presence of endometrial glands and stroma outside the uterine cavity.'),
    (v_case_id, 'If this condition involves the ovary, what is the classic term for the resulting cyst?', '["Follicular cyst", "Corpus luteum cyst", "Chocolate cyst (Endometrioma)", "Dermoid cyst"]', 2, 'Cystic involvement of the ovary in endometriosis often results in a "chocolate cyst" filled with old, brown blood.'),
    (v_case_id, 'What is the most widely accepted theory for the pathogenesis of this condition?', '["Metaplastic theory", "Retrograde menstruation theory", "Vascular spread theory", "Stem cell theory"]', 1, 'The Sampson (Retrograde Menstruation) theory suggests that menstrual tissue flows back through the fallopian tubes into the peritoneal cavity.');

    -- CASE 05: Polycystic Ovary Syndrome (PCOS)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Hirsutism and Irregular Periods', 'A 22-year-old obese woman presents with irregular periods, acne, and excessive facial hair. Labs show an elevated LH:FSH ratio (>3).', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Cushing Syndrome", "PCOS (Stein-Leventhal Syndrome)", "Congenital Adrenal Hyperplasia", "Ovarian Sertoli-Leydig Cell Tumor"]', 1, 'PCOS presents with the triad of amenorrhea/oligomenorrhea, obesity, and hirsutism.'),
    (v_case_id, 'What is the underlying hormonal abnormality?', '["Estrogen deficiency", "Hyperinsulinemia leading to androgen excess", "Low LH", "High Progesterone"]', 1, 'Insulin resistance/hyperinsulinemia stimulates androgen production by the ovarian theca cells and decreases SHBG, leading to high free testosterone.'),
    (v_case_id, 'This patient is at an increased risk for which cancer?', '["Ovarian Serous Cystadenocarcinoma", "Endometrial Carcinoma", "Cervical Cancer", "Choriocarcinoma"]', 1, 'Chronic anovulation in PCOS leads to unopposed estrogen exposure, significantly increasing the risk of endometrial hyperplasia and carcinoma.');

    -- CASE 06: Ectopic Pregnancy
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Sudden Abdominal Pain', 'A 26-year-old woman with a history of PID presents with sudden, severe, one-sided lower abdominal pain and vaginal spotting. Her last period was 6 weeks ago.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most critical diagnosis to rule out?', '["Appendicitis", "Ruptured Ectopic Pregnancy", "Ovarian Torsion", "Spontaneous Abortion"]', 1, 'A ruptured ectopic pregnancy is a surgical emergency that can lead to fatal hemorrhage.'),
    (v_case_id, 'Where is the most common site for this condition?', '["Ovary", "Fallopian Tube (Ampulla)", "Cervix", "Peritoneal cavity"]', 1, 'The ampulla of the fallopian tube is the most common site for ectopic implantation.'),
    (v_case_id, 'What is the most common predisposing factor?', '["History of OCP use", "Scarring from Pelvic Inflammatory Disease (PID)", "Use of an IUD", "Advanced maternal age"]', 1, 'Scarring from previous PID (usually due to Chlamydia or Gonorrhea) slows the passage of the zygote through the tube.');

    -- CASE 07: Hydatidiform Mole
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Grape-like Masses', 'A 24-year-old woman presents in her first trimester with vaginal bleeding and severe nausea. Her uterus is much larger than expected for her gestational age, and her beta-hCG is 200,000 mIU/mL. Ultrasound shows a "snowstorm" pattern.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Normal Twin Pregnancy", "Complete Hydatidiform Mole", "Partial Hydatidiform Mole", "Choriocarcinoma"]', 1, 'A complete mole shows very high hCG, large uterus, and no fetal parts on ultrasound.'),
    (v_case_id, 'What is the typical genotype of a COMPLETE mole?', '["46, XX (all paternal DNA)", "69, XXY", "46, XY (normal)", "45, X"]', 0, 'A complete mole usually results from a single sperm fertilizing an empty egg, followed by duplication of the paternal chromosomes (46,XX).'),
    (v_case_id, 'Which of the following is true regarding a PARTIAL mole?', '["It contains fetal parts", "It is usually 46,XX", "It has a higher risk of choriocarcinoma than a complete mole", "It results in extremely high hCG levels"]', 0, 'Partial moles result from two sperm fertilizing a normal egg (69,XXX/XXY) and often contain fetal parts.');

    -- CASE 08: Preeclampsia/Eclampsia
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Hypertension and Proteinuria', 'A 32-year-old pregnant woman (34 weeks gestation) presents with a BP of 160/110 mmHg, headache, and 3+ proteinuria on dipstick.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Gestational Hypertension", "Preeclampsia", "Eclampsia", "HELLP Syndrome"]', 1, 'Preeclampsia is defined as hypertension + proteinuria (or end-organ damage) after 20 weeks gestation.'),
    (v_case_id, 'What symptom would change this diagnosis to ECLAMPSIA?', '["Seizures", "Jaundice", "Hemolysis", "Low platelets"]', 0, 'Eclampsia is preeclampsia plus the onset of seizures.'),
    (v_case_id, 'What is the definitive treatment for this condition?', '["Lisinopril", "Bed rest", "Delivery of the fetus and placenta", "Magnesium sulfate only"]', 2, 'Delivery is the only definitive cure for preeclampsia/eclampsia, as the pathology is rooted in placental ischemia.');

    -- CASE 09: Ovarian Teratoma
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Hair-Filled Cyst', 'A 22-year-old woman has an incidental finding of a 5 cm ovarian mass on ultrasound. During surgery, the cyst is found to contain hair, sebum, and teeth.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Serous Cystadenoma", "Mature Cystic Teratoma (Dermoid Cyst)", "Dysgerminoma", "Yolk Sac Tumor"]', 1, 'Mature cystic teratomas are germ cell tumors containing tissues from all three germ layers (skin, hair, teeth, etc.).'),
    (v_case_id, 'What is the most common MALIGNANT transformation seen in these benign tumors?', '["Melanoma", "Squamous cell carcinoma", "Adenocarcinoma", "Choriocarcinoma"]', 1, 'While mature teratomas are usually benign, rarely one of the tissue elements (most commonly the squamous epithelium) can undergo malignant transformation.'),
    (v_case_id, 'What is "Struma ovarii"?', '["A teratoma with bone", "A teratoma composed primarily of thyroid tissue", "A teratoma with neural tissue", "A malignant teratoma"]', 1, 'Struma ovarii is a specialized teratoma that contains primarily thyroid tissue and can even cause hyperthyroidism.');

    -- CASE 10: Placenta Previa/Abruption
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Third Trimester Bleeding', 'A 30-year-old woman in her third trimester presents with PAINFUL vaginal bleeding and a rigid, tender uterus.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Placenta Previa", "Placental Abruption", "Vasa Previa", "Bloody show"]', 1, 'Placental abruption (premature separation of the placenta) classically presents as painful bleeding and a tender uterus.'),
    (v_case_id, 'How does PLACENTA PREVIA differ in presentation?', '["It is more painful", "It presents as PAINLESS vaginal bleeding", "It occurs only in the first trimester", "It causes high fever"]', 1, 'Placenta previa (placenta covering the internal os) presents with painless bleeding.'),
    (v_case_id, 'What is a major life-threatening complication of placental abruption for the mother?', '["Hypertension", "Disseminated Intravascular Coagulation (DIC)", "Hyperthyroidism", "Diabetes"]', 1, 'Tissue factor release from the site of abruption can trigger DIC.');

    RAISE NOTICE 'SUCCESS: Sexual & Forensic Pathology Cases Part 1 (01-10) registered.';
END $$;

COMMIT;
