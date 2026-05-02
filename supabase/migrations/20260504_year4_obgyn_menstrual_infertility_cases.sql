BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Menstrual disorders & infertility
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-menstrual-infertility' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "obgyn-menstrual-infertility" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Normal Menstrual Cycle Phases (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Ovarian Cycle' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Ovarian Cycle', 'A student is reviewing the hormonal shifts that occur during a 28-day menstrual cycle.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A student is reviewing the hormonal shifts that occur during a 28-day menstrual cycle.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which hormone is dominant during the FOLLICULAR phase and stimulates endometrial growth?', '["Progesterone", "Estrogen (Estradiol)", "LH", "FSH"]', 1, 'Estrogen drives the proliferative (follicular) phase of the cycle.'),
    (v_case_id, 'Which hormone triggers ovulation?', '["FSH surge", "LH surge", "Progesterone drop", "Estrogen drop"]', 1, 'A massive surge in LH, triggered by high estrogen levels, causes the release of the egg.'),
    (v_case_id, 'Which hormone is produced by the corpus luteum during the LUTEAL phase?', '["Estrogen only", "Progesterone", "hCG", "None"]', 1, 'The corpus luteum secretes progesterone to stabilize the endometrium for potential implantation.');

    ---------------------------------------------------------------------------
    -- CASE 02: Primary Amenorrhea - Turner Syndrome (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Delayed Puberty' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Delayed Puberty', 'A 15-year-old girl has no breast development and has not started her periods. She is in the 5th percentile for height and has a webbed neck.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A 15-year-old girl has no breast development and has not started her periods. She is in the 5th percentile for height and has a webbed neck.', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["PCOS", "Turner Syndrome (45,X)", "Mullerian Agenesis", "AIS"]', 1, 'Short stature and webbed neck are classic for Turner Syndrome.'),
    (v_case_id, 'What would you expect her FSH level to be?', '["Low", "High (Hypergonadotropic hypogonadism)", "Normal", "Undetectable"]', 1, 'Ovarian failure (streak ovaries) leads to a loss of negative feedback, causing very high FSH.'),
    (v_case_id, 'What is a critical screening test for a patient with Turner Syndrome?', '["Echocardiogram (to check for bicuspid aortic valve/coarctation)", "Brain MRI", "Skin biopsy", "None"]', 0, 'Cardiac anomalies are common and life-threatening in Turner patients.');

    ---------------------------------------------------------------------------
    -- CASE 03: Primary Amenorrhea - MRKH (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Agenesis of the Uterus' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Agenesis of the Uterus', 'A 16-year-old has normal breast development and pubic hair but has never had a period. On exam, she has a blind-ending vagina and no palpable uterus.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Agenesis of the Uterus', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Turner Syndrome", "Mullerian Agenesis (MRKH)", "Androgen Insensitivity", "AIS"]', 1, 'MRKH involves normal hormonal development (ovaries present) but failure of the Mullerian structures to form.'),
    (v_case_id, 'What is her expected Karyotype?', '["45,X", "46,XX", "46,XY", "47,XXY"]', 1, 'MRKH patients are genetically female with normal ovarian function.'),
    (v_case_id, 'Which other organ system should be screened in MRKH patients?', '["Renal (kidney anomalies are seen in 30-40%)", "Cardiac", "Liver", "None"]', 0, 'Renal ultrasounds are mandatory to rule out ectopic or absent kidneys.');

    ---------------------------------------------------------------------------
    -- CASE 04: Androgen Insensitivity Syndrome - AIS (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Phenotypic Female, Genotypic Male' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Phenotypic Female, Genotypic Male', 'A 17-year-old phenotypic female presents with primary amenorrhea. She has large breasts but very sparse pubic and axillary hair.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Phenotypic Female, Genotypic Male', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["MRKH", "Androgen Insensitivity Syndrome (AIS)", "Kallmann Syndrome", "PCOS"]', 1, 'AIS patients have testes and high testosterone but the body does not respond to it. Sparse hair is a key finding.'),
    (v_case_id, 'What is her Karyotype?', '["46,XX", "46,XY", "45,X", "None"]', 1, 'AIS patients are genetically male.'),
    (v_case_id, 'What is the recommended management for the undescended testes in AIS?', '["Leave them forever", "Gonadectomy after puberty (due to malignancy risk)", "Immediate removal in childhood", "None"]', 1, 'Testes are left until after puberty to allow for natural breast development via peripheral conversion of androgens.');

    ---------------------------------------------------------------------------
    -- CASE 05: Imperforate Hymen (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Cyclic Pain, No Blood' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Cyclic Pain, No Blood', 'A 13-year-old girl reports monthly severe pelvic pain for the last 6 months but has not yet had a period. On exam, a bulging, bluish membrane is seen at the vaginal introitus.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Cyclic Pain, No Blood', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Endometriosis", "Imperforate Hymen", "AIS", "Pregnancy"]', 1, 'The bulging bluish membrane is the hymen with trapped blood (hematocolpos) behind it.'),
    (v_case_id, 'What is the treatment?', '["OCPs", "Surgical incision (Hymenotomy)", "Hysterectomy", "Antibiotics"]', 1, 'Incision and drainage is the definitive treatment.'),
    (v_case_id, 'Is this a hormonal problem or an anatomic problem?', '["Hormonal", "Anatomic"]', 1, 'The HPO axis is functioning normally; the issue is an outflow tract obstruction.');

    ---------------------------------------------------------------------------
    -- CASE 06: Secondary Amenorrhea - Initial Step (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Loss of Menses' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Loss of Menses', 'A 29-year-old woman with previously regular periods has not had one for 4 months.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sudden Loss of Menses', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the absolute first test to order?', '["FSH", "Pregnancy test (hCG)", "Prolactin", "TSH"]', 1, 'Pregnancy is the most common cause of secondary amenorrhea.'),
    (v_case_id, 'If hCG is negative, what are the standard \"first-tier\" hormonal tests?', '["FSH, Prolactin, and TSH", "Insulin", "Cortisol", "Growth hormone"]', 0, 'These rule out the most common endocrine causes (ovarian failure, prolactinoma, thyroid disease).'),
    (v_case_id, 'Definition: Secondary amenorrhea is the absence of menses for ___ months in a woman with previously regular cycles.', '["1 month", "3 months", "6 months", "1 year"]', 1, 'The threshold is 3 months for regular cycles and 6 months for irregular ones.');

    ---------------------------------------------------------------------------
    -- CASE 07: Hyperprolactinemia (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Amenorrhea and Galactorrhea' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Amenorrhea and Galactorrhea', 'A woman reports no periods and milky discharge from both nipples. Her prolactin level is 150 ng/mL (High).', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Amenorrhea and Galactorrhea', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does high prolactin cause amenorrhea?', '["It kills the eggs", "It suppresses GnRH secretion from the hypothalamus", "It blocks the uterus", "None"]', 1, 'Hyperprolactinemia leads to hypogonadotropic hypogonadism.'),
    (v_case_id, 'What is the first-line medical treatment for a prolactinoma?', '["Surgery", "Dopamine agonists (Cabergoline or Bromocriptine)", "Radiation", "Estrogen"]', 1, 'Dopamine inhibits prolactin; agonists effectively shrink the tumor.'),
    (v_case_id, 'Which imaging study is used to visualize the pituitary?', '["CT scan", "MRI of the Brain/Sella Turcica", "Ultrasound", "X-ray"]', 1, 'MRI is the gold standard for pituitary lesions.');

    ---------------------------------------------------------------------------
    -- CASE 08: PCOS - Anovulatory Bleeding (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Irregular and Heavy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Irregular and Heavy', 'A patient with PCOS has periods every 2-4 months that are extremely heavy and last for 10 days.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Irregular and Heavy', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of this bleeding?', '["Structural lesion", "Chronic anovulation leading to unopposed estrogen and breakthrough bleeding", "Infection", "None"]', 1, 'Without ovulation, there is no progesterone to stabilize the lining.'),
    (v_case_id, 'What is the long-term risk of this pattern?', '["Ovarian cancer", "Endometrial hyperplasia and adenocarcinoma", "Infertility only", "None"]', 1, 'Unopposed estrogen is a major risk factor for endometrial cancer.'),
    (v_case_id, 'What is the best way to protect her endometrium?', '["Combined Oral Contraceptives or a Progestin IUD", "Aspirin", "Antibiotics", "None"]', 0, 'Providing progesterone (either systemically or locally) prevents hyperplasia.');

    ---------------------------------------------------------------------------
    -- CASE 09: Asherman Syndrome (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Post-D&C Amenorrhea' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Post-D&C Amenorrhea', 'A woman has not had a period since she had a dilation and curettage (D&C) for retained placenta after her last birth.', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Post-D&C Amenorrhea', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["PCOS", "Asherman Syndrome (Intrauterine adhesions)", "POI", "Menopause"]', 1, 'Scarring of the uterine cavity prevents the endometrium from building up.'),
    (v_case_id, 'What test can diagnose Asherman syndrome?', '["FSH level", "Hysterosalpingogram (HSG) or Saline Sonogram showing filling defects", "Pap smear", "None"]', 1, 'Imaging shows the irregular scarring within the cavity.'),
    (v_case_id, 'What is the treatment?', '["OCPs", "Hysteroscopic lysis of adhesions", "Hysterectomy", "None"]', 1, 'Surgically removing the scars can restore menses and fertility.');

    ---------------------------------------------------------------------------
    -- CASE 10: Sheehan Syndrome (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Postpartum Pituitary Necrosis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Postpartum Pituitary Necrosis', 'Following a severe postpartum hemorrhage requiring a massive transfusion, a patient is unable to breastfeed and her periods do not return.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Postpartum Pituitary Necrosis', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Asherman Syndrome", "Sheehan Syndrome", "PCOS", "Hypothyroidism"]', 1, 'Ischemic necrosis of the anterior pituitary following severe blood loss.'),
    (v_case_id, 'Why is she unable to breastfeed?', '["She is tired", "Loss of Prolactin secretion from the anterior pituitary", "No milk", "None"]', 1, 'Inability to lactate is often the first clinical sign.'),
    (v_case_id, 'Which other hormones might be low in Sheehan syndrome?', '["FSH/LH, TSH, and ACTH", "Only Estrogen", "Only Progesterone", "None"]', 0, 'Sheehan can lead to panhypopituitarism.');

    ---------------------------------------------------------------------------
    -- CASE 11: Kallmann Syndrome (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Anosmia and Amenorrhea' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Anosmia and Amenorrhea', 'A girl with delayed puberty and primary amenorrhea mentions she has never been able to smell anything.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Anosmia and Amenorrhea', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Turner Syndrome", "Kallmann Syndrome", "MRKH", "AIS"]', 1, 'Kallmann syndrome is defined by hypogonadotropic hypogonadism AND anosmia (loss of smell).'),
    (v_case_id, 'What is the pathophysiological defect?', '["Ovarian failure", "Failure of GnRH-producing neurons to migrate to the hypothalamus", "Uterine scar", "None"]', 1, 'The neurons fail to migrate alongside the olfactory nerves.'),
    (v_case_id, 'What are her FSH and LH levels?', '["High", "Low or undetectable", "Normal", "None"]', 1, 'Since there is no GnRH, the pituitary is not stimulated to make FSH/LH.');

    ---------------------------------------------------------------------------
    -- CASE 12: Progestin Withdrawal Test (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Challenging the Endometrium' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Challenging the Endometrium', 'A patient with secondary amenorrhea is given 10 days of Medroxyprogesterone and experiences a bleed 3 days after stopping.', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Challenging the Endometrium', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does a POSITIVE withdrawal bleed confirm?', '["The patient is pregnant", "The patient has adequate endogenous estrogen and an intact outflow tract", "She has ovarian failure", "None"]', 1, 'It proves the uterus can bleed if given progesterone (likely anovulation).'),
    (v_case_id, 'If she did NOT bleed after the challenge, what is the next logical step?', '["Brain MRI", "Estrogen + Progesterone challenge (to rule out outflow tract or uterine problems)", "Give up", "None"]', 1, 'If she doesn''t bleed with P alone, she either lacks E or has a scarred uterus/blocked tract.'),
    (v_case_id, 'Which condition typically has a POSITIVE withdrawal bleed?', '["Asherman Syndrome", "PCOS", "Turner Syndrome", "Sheehan Syndrome"]', 1, 'PCOS patients have high estrogen but no progesterone.');

    ---------------------------------------------------------------------------
    -- CASE 13: AUB-O (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Anovulatory Dysfunction' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Anovulatory Dysfunction', 'An obese 15-year-old girl has irregular periods and occasionally has such heavy bleeding she becomes anemic.', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Anovulatory Dysfunction', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the category of AUB?', '["AUB-L", "AUB-O", "AUB-M", "AUB-P"]', 1, 'Anovulatory bleeding (O) is the most common cause of AUB in adolescents.'),
    (v_case_id, 'What is the physiological cause in a teen?', '["Cancer", "Immature HPO axis", "Early menopause", "None"]', 1, 'It takes a few years after menarche for the axis to mature and produce regular cycles.'),
    (v_case_id, 'What is the first-line treatment for a hemodynamically stable teen with AUB-O?', '["Hysterectomy", "Combined Oral Contraceptives (OCPs)", "Aspirin", "Surgery"]', 1, 'OCPs regulate the cycle and stabilize the lining.');

    ---------------------------------------------------------------------------
    -- CASE 14: Endometrial Biopsy - EMB (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'When to Biopsy' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'When to Biopsy', 'A 48-year-old woman presents with new-onset irregular, heavy periods.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'When to Biopsy', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most important next step?', '["OCPs", "Endometrial Biopsy", "Ultrasound only", "None"]', 1, 'In women > 45 with AUB, malignancy must be ruled out.'),
    (v_case_id, 'A woman < 45 should receive an EMB if she has AUB and:', '["Obesity, PCOS, or other risk factors for chronic unopposed estrogen", "A headache", "A child", "None"]', 0, 'Risk factors for hyperplasia warrant a biopsy regardless of age.'),
    (v_case_id, 'What is the purpose of the EMB?', '["To stop the bleeding", "To rule out endometrial hyperplasia or carcinoma", "To check for twins", "None"]', 1, 'It is a diagnostic screening tool.');

    ---------------------------------------------------------------------------
    -- CASE 15: Infertility - Female Workup (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Infertility Algorithm' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Infertility Algorithm', 'A couple presents for infertility evaluation.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Infertility Algorithm', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the FIRST test for the female partner to confirm ovulation?', '["MRI", "Mid-luteal (Day 21) Progesterone level", "hCG", "None"]', 1, 'A level > 3 ng/mL confirms that ovulation has occurred.'),
    (v_case_id, 'Which test evaluates for tubal patency?', '["Pap smear", "Hysterosalpingogram (HSG)", "Breast exam", "None"]', 1, 'HSG is the standard test for tubal and uterine cavity issues.'),
    (v_case_id, 'What is the most common cause of female factor infertility?', '["Blocked tubes", "Ovulatory dysfunction (e.g., PCOS)", "Endometriosis", "Uterine polyps"]', 1, 'Anovulation is the leading cause.');

    ---------------------------------------------------------------------------
    -- CASE 16: Male Factor Infertility (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Male Side' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Male Side', 'A couple is being evaluated; the male partner has a low sperm count.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Male Side', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common identifiable cause of male infertility?', '["Infection", "Varicocele", "Steroids", "Smoking"]', 1, 'Varicoceles increase scrotal temperature and impair sperm production.'),
    (v_case_id, 'Which parameter in a semen analysis measures how well sperm swim?', '["Concentration", "Motility", "Morphology", "Volume"]', 1, 'Motility is crucial for sperm to reach the egg.'),
    (v_case_id, 'What is \"ICSI\" (Intracytoplasmic Sperm Injection)?', '["A pill", "A technique during IVF where a single sperm is injected directly into an egg", "A surgery", "None"]', 1, 'ICSI is used for severe male factor infertility.');

    ---------------------------------------------------------------------------
    -- CASE 17: Clomiphene Citrate (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Inducing Ovulation' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Inducing Ovulation', 'A woman with anovulation is starting Clomiphene (Clomid).', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Inducing Ovulation', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does Clomiphene work?', '["It is a progestin", "It is a SERM that blocks estrogen receptors in the hypothalamus, tricking the brain into making more FSH", "It kills eggs", "None"]', 1, 'By blocking the \"off\" signal, the brain thinks estrogen is low and pumps more FSH.'),
    (v_case_id, 'What is the most common significant risk associated with Clomiphene?', '["Cancer", "Multiple gestation (twins)", "Liver failure", "None"]', 1, 'There is an approx. 8-10% risk of twins.'),
    (v_case_id, 'What is the first-line medication for ovulation induction in PCOS specifically?', '["Clomiphene", "Letrozole", "Metformin", "None"]', 1, 'Letrozole (an aromatase inhibitor) has higher live birth rates in PCOS patients.');

    ---------------------------------------------------------------------------
    -- CASE 18: OHSS - Ovarian Hyperstimulation (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'IVF Complications' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'IVF Complications', 'A woman undergoing IVF for egg retrieval develops abdominal distension, weight gain, and ascites after her hCG trigger shot.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'IVF Complications', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Pneumonia", "Ovarian Hyperstimulation Syndrome (OHSS)", "Bowel obstruction", "None"]', 1, 'OHSS involves massive fluid shifts out of the vascular space due to high VEGF levels.'),
    (v_case_id, 'What is a dangerous complication of severe OHSS?', '["Thromboembolism, Renal failure, and pleural effusions", "Weight loss", "Hyperthyroidism", "None"]', 0, 'Hemoconcentration increases the risk of blood clots.'),
    (v_case_id, 'What is the initial management of mild-moderate OHSS?', '["Emergency surgery", "Fluid management, electrolyte monitoring, and serial weights", "Hysterectomy", "None"]', 1, 'Most cases are self-limited but require close outpatient monitoring.');

    ---------------------------------------------------------------------------
    -- CASE 19: Normal Puberty Stages (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pubertal Sequence' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pubertal Sequence', 'A mother asks about the normal order of development for her 9-year-old daughter.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pubertal Sequence', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is usually the FIRST sign of puberty in girls?', '["Menarche", "Thelarche (breast budding)", "Pubarche (hair)", "Growth spurt"]', 1, 'Breast development is typically the initial sign.'),
    (v_case_id, 'How long after thelarche does menarche typically occur?', '["6 months", "2 to 2.5 years", "5 years", "Immediately"]', 1, 'There is a predictable gap between breast development and the first period.'),
    (v_case_id, 'What is the average age of menarche?', '["10", "12 to 13", "15", "None"]', 1, '12.4 years is the mean in the US.');

    ---------------------------------------------------------------------------
    -- CASE 20: Precocious Puberty (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Early Development' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Early Development', 'A 6-year-old girl has breast development and a fast growth rate. Her bone age is 9 years.', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Early Development', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of precocious puberty in girls?', '["Puberty before age 10", "Puberty before age 8", "Puberty before age 6", "None"]', 1, 'Evaluation is indicated for development before age 8.'),
    (v_case_id, 'What is \"Central\" precocious puberty?', '["Early hormone release from an ovarian tumor", "Early activation of the HPO axis (GnRH dependent)", "Skin problem", "None"]', 1, 'Central means the brain is starting the process too early.'),
    (v_case_id, 'What is a common treatment for Central precocious puberty?', '["OCPs", "GnRH agonists (to desensitize the pituitary and stop the early signal)", "Surgery", "None"]', 1, 'Continuous GnRH suppresses the axis and allows for normal height achievement.');

    ---------------------------------------------------------------------------
    -- CASE 21: Hypothalamic Amenorrhea (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Athlete Triad' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Athlete Triad', 'A 19-year-old college cross-country runner has not had a period for 1 year. She is very thin and has a high-intensity training schedule.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Athlete Triad', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the components of the Female Athlete Triad?', '["Amenorrhea, PCOS, and weight gain", "Amenorrhea, low energy availability (with/without eating disorder), and low bone mineral density (osteoporosis)", "Pain, bleeding, and twins", "None"]', 1, 'High stress/low energy causes the hypothalamus to shut down.'),
    (v_case_id, 'What would her FSH and LH levels look like?', '["High", "Low or normal (Hypogonadotropic hypogonadism)", "Fluctuating", "None"]', 1, 'The brain is not sending the signal (GnRH) to the pituitary.'),
    (v_case_id, 'What is the primary treatment?', '["OCPs only", "Nutritional rehabilitation and decreasing exercise intensity", "Surgery", "None"]', 1, 'Restoring energy balance is the key to restarting the cycle.');

    ---------------------------------------------------------------------------
    -- CASE 22: Thyroid and Menses (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Thyroid Dysfunction' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Thyroid Dysfunction', 'A woman with weight gain, cold intolerance, and constipation reports her periods have stopped.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Thyroid Dysfunction', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does HYPOthyroidism cause amenorrhea?', '["High TRH stimulates prolactin secretion, which suppresses GnRH", "It kills the eggs", "No effect", "None"]', 0, 'Thyrotropin-releasing hormone (TRH) also acts on the pituitary to release prolactin.'),
    (v_case_id, 'What test is most sensitive for diagnosing primary hypothyroidism?', '["T4", "TSH", "T3", "None"]', 1, 'TSH will be elevated in primary thyroid failure.'),
    (v_case_id, 'Will her periods return if the thyroid is treated?', '["No", "Yes, in most cases", "Only with surgery", "None"]', 1, 'Correcting the metabolic state usually restores regular cycles.');

    ---------------------------------------------------------------------------
    -- CASE 23: Endometrial Hyperplasia (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Lining Overgrowth' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Lining Overgrowth', 'A biopsy of a 50-year-old with AUB shows \"Atypical Endometrial Hyperplasia\".', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Lining Overgrowth', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the risk of progression to cancer for atypical hyperplasia?', '["1%", "Approx. 25-30%", "100%", "None"]', 1, 'Atypical hyperplasia is a significant precancerous lesion.'),
    (v_case_id, 'What is the standard treatment for a woman with ATYPICAL hyperplasia who has completed childbearing?', '["OCPs", "Hysterectomy", "Aspirin", "Wait and see"]', 1, 'Due to the high risk of concurrent or future cancer, surgery is recommended.'),
    (v_case_id, 'How can hyperplasia WITHOUT atypia be treated?', '["Only surgery", "High-dose progestins (Pills or IUD) and repeat biopsy", "OCPs only", "None"]', 1, 'Progestins can reverse simple hyperplasia.');

    ---------------------------------------------------------------------------
    -- CASE 24: Premature Ovarian Insufficiency - POI (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Ovarian Failure < 40' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Ovarian Failure < 40', 'A 33-year-old has not had a period for 6 months. Her FSH is high (60 IU/L).', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Ovarian Failure < 40', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["PCOS", "Premature Ovarian Insufficiency (POI)", "Menopause", "Hypothyroidism"]', 1, 'Loss of ovarian function before age 40.'),
    (v_case_id, 'What is the risk of NOT treating POI with hormones?', '["Early osteoporosis and cardiovascular disease", "Twins", "Skin rashes", "None"]', 0, 'Young women need estrogen for bone and heart health until the normal age of menopause.'),
    (v_case_id, 'Does POI mean she has a 0% chance of pregnancy?', '["Yes", "No, about 5-10% of women with POI may spontaneously conceive due to intermittent ovarian activity", "Only with surgery", "None"]', 1, 'It is not as absolute as menopause but suggests very low fertility.');

    ---------------------------------------------------------------------------
    -- CASE 25: PALM-COEIN Review (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'AUB Systematics' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'AUB Systematics', 'A physician is documenting the cause of a patient''s bleeding using the standard FIGO system.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'AUB Systematics', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which letters in PALM-COEIN represent STRUCTURAL causes?', '["PALM (Polyp, Adenomyosis, Leiomyoma, Malignancy)", "COEIN", "None", "All"]', 0, 'PALM causes are visible on imaging or pathology.'),
    (v_case_id, 'What does the \"C\" stand for?', '["Cancer", "Coagulopathy", "Cervix", "None"]', 1, 'Inherited bleeding disorders are part of the AUB evaluation.'),
    (v_case_id, 'What does the \"I\" stand for?', '["Infection", "Iatrogenic (e.g., IUD, medications)", "Insulin", "None"]', 1, 'Medical interventions can cause abnormal bleeding.');

    ---------------------------------------------------------------------------
    -- CASE 26: Infertility - Tubal Factor (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Post-PID Infertility' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Post-PID Infertility', 'A woman with a history of Chlamydia infection has been unable to conceive.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Post-PID Infertility', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does Chlamydia cause infertility?', '["Kills eggs", "Causes tubal scarring and blockage (hydrosalpinx)", "No effect", "None"]', 1, 'Pelvic Inflammatory Disease is a major risk factor for tubal factor infertility.'),
    (v_case_id, 'What is the risk of ectopic pregnancy in a woman with tubal damage?', '["Lower", "Significantly higher", "No change", "None"]', 1, 'Scarring slows egg transport, increasing the chance of implantation in the tube.'),
    (v_case_id, 'Can tubal infertility be bypassed?', '["No", "Yes, with In Vitro Fertilization (IVF)", "Only with vitamins", "None"]', 1, 'IVF places the embryo directly into the uterus, bypassing the tubes.');

    ---------------------------------------------------------------------------
    -- CASE 27: Semen Analysis Interpretation (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Reading the Report' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Reading the Report', 'A man''s semen analysis shows a count of 5 million/mL (Low).', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Reading the Report', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the normal threshold for sperm concentration?', '["1 million/mL", "15-20 million/mL", "100 million/mL", "None"]', 1, '5 million is significantly below the normal range.'),
    (v_case_id, 'What is \"Morphology\" in a semen analysis?', '["Swimming speed", "The shape of the sperm", "The volume", "None"]', 1, 'Abnormal shapes (e.g., double heads) can impair function.'),
    (v_case_id, 'What should the male partner avoid when trying to conceive?', '["Exercise", "Hot tubs, excessive heat, smoking, and testosterone supplements", "Water", "None"]', 1, 'These factors impair spermatogenesis.');

    ---------------------------------------------------------------------------
    -- CASE 28: AUB-L - Fibroids and Fertility (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Myomas and Miscarriage' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Myomas and Miscarriage', 'A woman has multiple fibroids and has had two first-trimester miscarriages.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Myomas and Miscarriage', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which type of fibroid is MOST likely to interfere with implantation?', '["Subserosal", "Submucosal (distorting the cavity)", "Intramural (small)", "Pedunculated"]', 1, 'Submucosal fibroids act as a mechanical barrier to proper implantation.'),
    (v_case_id, 'What procedure can remove submucosal fibroids without a large incision?', '["Hysteroscopic Myomectomy", "Open Hysterectomy", "UAE", "None"]', 0, 'Hysteroscopy allows for removal via the cervix.'),
    (v_case_id, 'Does every fibroid need to be removed before pregnancy?', '["Yes", "No, only those distorting the endometrial cavity or causing significant symptoms", "Never", "None"]', 1, 'Most women with fibroids have normal pregnancies.');

    ---------------------------------------------------------------------------
    -- CASE 29: Infertility - Ovarian Reserve (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Diminishing Reserve' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Diminishing Reserve', 'A 42-year-old is worried her \"biological clock\" has run out.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Diminishing Reserve', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the best hormonal marker of current egg quantity?', '["AMH (Anti-Mullerian Hormone)", "Estrogen", "Progesterone", "hCG"]', 0, 'AMH levels reflect the size of the primordial follicle pool.'),
    (v_case_id, 'At what age does fertility begin to decline significantly?', '["30", "32, with a more rapid decline after 37", "45", "None"]', 1, 'Age is the single most important predictor of fertility success.'),
    (v_case_id, 'If a 42-year-old cannot conceive with her own eggs, what is a highly successful option?', '["Give up", "Donor Egg IVF", "More vitamins", "None"]', 1, 'Donor eggs from a younger woman provide high success rates regardless of the recipient''s age.');

    ---------------------------------------------------------------------------
    -- CASE 30: Menstrual Cycle Length (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Defining Normal Cycles' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Defining Normal Cycles', 'A patient asks if her 24-day cycle is normal.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Defining Normal Cycles', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the normal range for menstrual cycle length?', '["28 days exactly", "21 to 35 days", "15 to 45 days", "None"]', 1, 'Standard variation exists between women.'),
    (v_case_id, 'What is the typical duration of menstrual flow?', '["1 day", "3 to 7 days", "10 days", "None"]', 1, 'Flow lasting > 8 days is considered abnormal.'),
    (v_case_id, 'Which phase of the cycle is the most CONSTANT in length (14 days)?', '["Follicular phase", "Luteal phase", "Ovulation", "None"]', 1, 'The life of the corpus luteum is predictable; the follicular phase varies.');

    ---------------------------------------------------------------------------
    -- CASE 31: Primary Amenorrhea - Kallmann Syndrome details (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Brain and Puberty' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Brain and Puberty', 'A patient with Kallmann syndrome wants to know why she can''t smell.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Brain and Puberty', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which cranial nerve is involved in the embryological migration of GnRH neurons?', '["CN II", "CN I (Olfactory Nerve)", "CN V", "None"]', 1, 'The neurons use the olfactory tract as a guide.'),
    (v_case_id, 'What is the medical term for the loss of smell?', '["Aphasia", "Anosmia", "Ataxia", "None"]', 1, 'Anosmia is the pathognomonic finding.'),
    (v_case_id, 'Can a woman with Kallmann syndrome become pregnant?', '["No", "Yes, with exogenous gonadotropins (FSH/LH) to stimulate the ovaries", "Only with surgery", "None"]', 1, 'Her ovaries are normal; they just need the signal from the outside.');

    ---------------------------------------------------------------------------
    -- CASE 32: Abnormal Uterine Bleeding - AUB-P (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Spotting Between Periods' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Spotting Between Periods', 'A 35-year-old woman reports light spotting in the middle of her cycle, despite regular menses.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Spotting Between Periods', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a likely cause of intermenstrual spotting?', '["PCOS", "Endometrial Polyps", "Cancer", "Pregnancy"]', 1, 'Polyps (P) often cause intermenstrual bleeding.'),
    (v_case_id, 'What imaging study is best for visualizing a small polyp?', '["CT", "Saline Infusion Sonohysterography (SIS)", "Plain film", "None"]', 1, 'Saline distends the cavity to highlight the growth.'),
    (v_case_id, 'What is the treatment for a symptomatic polyp?', '["Wait", "Hysteroscopic Polypectomy", "OCPs", "None"]', 1, 'Removal is the standard management.');

    ---------------------------------------------------------------------------
    -- CASE 33: AUB-C - Coagulopathy (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bruising and Bleeding' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bruising and Bleeding', 'A teen with heavy menarcheal bleeding also reports frequent nosebleeds and easy bruising.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bruising and Bleeding', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What diagnosis should be considered?', '["PCOS", "Von Willebrand Disease (vWD)", "Fibroids", "None"]', 1, 'vWD is the most common inherited bleeding disorder causing AUB.'),
    (v_case_id, 'What is the first-line treatment for heavy bleeding in vWD?', '["Aspirin", "Desmopressin (DDAVP) or Combined Hormonal Contraceptives", "Hysterectomy", "None"]', 1, 'DDAVP releases stored vWF factor.'),
    (v_case_id, 'Is AUB-C common in adolescents?', '["No", "Yes, up to 20% of teens presenting for heavy AUB have an underlying coagulopathy", "Only in men", "None"]', 1, 'Screening is important in this age group.');

    ---------------------------------------------------------------------------
    -- CASE 34: Infertility - Cervical Factor (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hostile Mucus' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hostile Mucus', 'A patient had a LEEP procedure (cervical surgery) and now has very little cervical mucus.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hostile Mucus', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How can cervical surgery affect fertility?', '["Kills eggs", "Removal of mucus-producing glands can lead to \"hostile\" or insufficient mucus for sperm transport", "No effect", "None"]', 1, 'Cervical stenosis or loss of glands can impair sperm entry.'),
    (v_case_id, 'What fertility treatment bypasses the cervix entirely?', '["OCPs", "Intrauterine Insemination (IUI)", "IVF", "None"]', 1, 'IUI washes and concentrates sperm, then places it directly into the uterus.'),
    (v_case_id, 'What is \"Spinnbarkeit\"?', '["A type of test", "The stretchability of fertile cervical mucus", "A hormone", "None"]', 1, 'Fertile mucus is thin, clear, and stretchy.');

    ---------------------------------------------------------------------------
    -- CASE 35: Infertility - Endometriosis (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pelvic Adhesions' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pelvic Adhesions', 'A woman with severe dysmenorrhea is struggling to conceive.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pelvic Adhesions', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does endometriosis cause infertility?', '["Blocked tubes and pelvic inflammation that is toxic to sperm/egg", "It kills the brain", "No effect", "None"]', 0, 'Both mechanical distortion and chemical inflammation play a role.'),
    (v_case_id, 'Does treating endometriosis PAIN with OCPs improve fertility?', '["Yes", "No, medical suppression does not help fertility; surgery or ART is required", "Only if taken for 10 years", "None"]', 1, 'Suppression doesn''t clear the disease for conception.'),
    (v_case_id, 'What is the definitive way to diagnose endometriosis in an infertility workup?', '["Ultrasound", "Laparoscopy", "Pap smear", "None"]', 1, 'Visual confirmation and biopsy are the gold standard.');

    ---------------------------------------------------------------------------
    -- CASE 36: AUB - Endometrial Polyps (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Fleshy Growth' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Fleshy Growth', 'A pathologist examines a growth removed from the uterine cavity.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Fleshy Growth', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the histologic composition of an endometrial polyp?', '["Muscle only", "Endometrial glands and stroma surrounding a central vascular stalk", "Cancer cells", "None"]', 1, 'The vascular core is what causes the bleeding.'),
    (v_case_id, 'Are polyps usually malignant?', '["Yes", "No, the vast majority are benign, but malignancy risk increases after menopause", "Always", "None"]', 1, 'Prevalence of malignancy in polyps is < 1% in premenopausal women but higher in postmenopausal women.'),
    (v_case_id, 'What is the treatment of choice for a large symptomatic polyp?', '["Aspirin", "Hysteroscopic resection", "Wait", "None"]', 1, 'Direct visualization and removal is best.');

    ---------------------------------------------------------------------------
    -- CASE 37: Secondary Amenorrhea - Weight Loss (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Weight Loss Amenorrhea' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Weight Loss Amenorrhea', 'A patient loses 30 lbs in 2 months on a crash diet and stops having periods.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Weight Loss Amenorrhea', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the physiological cause?', '["Hypothalamic suppression (functional hypothalamic amenorrhea)", "Pituitary death", "Ovarian cancer", "None"]', 0, 'The body enters a \"starvation mode\" and shuts down non-essential systems like reproduction.'),
    (v_case_id, 'Which hormone level is typically LOW in this condition?', '["FSH", "Leptin", "Estradiol", "All of the above"]', 3, 'Low body fat leads to low leptin, which signals the hypothalamus to stop GnRH.'),
    (v_case_id, 'Will her periods return?', '["No", "Yes, with weight gain and stress reduction", "Only with surgery", "None"]', 1, 'Restoring nutritional balance usually restarts the cycle.');

    ---------------------------------------------------------------------------
    -- CASE 38: Infertility - HSG Interpretation (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Spillage and Blockage' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Spillage and Blockage', 'A radiologist interprets an HSG showing dye filling the uterus and right tube but no spillage into the pelvis.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Spillage and Blockage', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the lack of spillage indicate?', '["Normal findings", "Tubal occlusion/blockage", "A hole in the uterus", "None"]', 1, 'Dye must leak out the end of the tube to confirm it is open.'),
    (v_case_id, 'If BOTH tubes are blocked, what is the best fertility treatment?', '["OCPs", "IVF", "IUI", "None"]', 1, 'IVF bypasses the tubes entirely.'),
    (v_case_id, 'Can HSG sometimes have a therapeutic effect?', '["No", "Yes, flushing the tubes can sometimes clear debris and improve fertility in the short term", "Only in men", "None"]', 1, 'Pregnancy rates slightly increase in the months following an HSG.');

    ---------------------------------------------------------------------------
    -- CASE 39: Menarche and Growth (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Height and Periods' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Height and Periods', 'A 12-year-old girl is worried she will stop growing after she gets her period.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Height and Periods', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is it true that growth slows after menarche?', '["Yes, estrogen causes closure of the epiphyseal plates, and most girls gain only ~2-3 more inches after menarche", "No, they keep growing for 10 years", "They grow faster", "None"]', 0, 'Menarche is a late sign of puberty; the growth spurt happens BEFORE menses.'),
    (v_case_id, 'What hormone is responsible for bone maturation and plate closure?', '["Growth Hormone", "Estrogen", "Thyroid", "None"]', 1, 'Estrogen is the final signal for growth to end.'),
    (v_case_id, 'At what Tanner Stage does the peak height velocity (growth spurt) occur?', '["Tanner 1", "Tanner 2-3", "Tanner 5", "None"]', 1, 'The spurt happens in early-to-mid puberty.');

    ---------------------------------------------------------------------------
    -- CASE 40: AUB - Endometrial Atrophy (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bleeding in the Elderly' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bleeding in the Elderly', 'A 70-year-old woman has light spotting. Her endometrial biopsy is negative for cancer.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bleeding in the Elderly', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of postmenopausal bleeding overall?', '["Cancer", "Atrophy of the endometrium or vagina", "Fibroids", "None"]', 1, 'While cancer must be ruled out, atrophy is the most frequent benign cause.'),
    (v_case_id, 'Why does atrophy cause bleeding?', '["The lining is too thick", "The lining is so thin that the superficial vessels become friable and break", "Infection", "None"]', 1, 'Fragile vessels bleed easily.'),
    (v_case_id, 'If an ultrasound shows an endometrial stripe of 3 mm in a postmenopausal woman, what is the significance?', '["High risk of cancer", "Low risk of cancer (threshold is typically > 4-5 mm)", "Emergency", "None"]', 1, 'A thin stripe is reassuring in postmenopausal bleeding.');

    ---------------------------------------------------------------------------
    -- CASE 41: Infertility - Ovarian Reserve testing (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Day 3 FSH' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Day 3 FSH', 'A woman is getting her \"fertility hormones\" checked on the third day of her period.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Day 3 FSH', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is FSH checked on Day 3?', '["It is the highest then", "It represents the baseline state of the ovarian reserve", "It is for pregnancy", "None"]', 1, 'A low baseline FSH indicates a responsive ovary.'),
    (v_case_id, 'What is a \"poor\" Day 3 FSH level?', '["< 5", "> 10-15 IU/L (suggesting diminished reserve)", "0", "None"]', 1, 'High FSH means the brain is shouting at the ovaries because they aren''t responding.'),
    (v_case_id, 'What other hormone is usually checked with FSH to ensure the reading is valid?', '["Estradiol (must be low for FSH to be accurate)", "Progesterone", "hCG", "None"]', 0, 'If Estrogen is high, it can falsely suppress FSH.');

    ---------------------------------------------------------------------------
    -- CASE 42: Dysfunctional Uterine Bleeding (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'AUB-O Management' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'AUB-O Management', 'A woman with irregular bleeding is started on Medroxyprogesterone (Provera) for 10-12 days each month.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'AUB-O Management', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does cyclic progestin help AUB-O?', '["It stops ovulation", "It stabilizes the lining and allows for a predictable withdrawal bleed", "It kills fibroids", "None"]', 1, 'Cyclic progestin prevents the build-up of the lining in anovulatory women.'),
    (v_case_id, 'Does cyclic progestin provide reliable contraception?', '["Yes", "No", "Only in teens", "None"]', 1, 'It regulates the period but does not consistently prevent pregnancy like an OCP.'),
    (v_case_id, 'Which LARC is excellent for long-term AUB-O management?', '["Copper IUD", "Levonorgestrel IUD (Mirena)", "Nexplanon", "None"]', 1, 'Mirena provides local progesterone and reduces cancer risk.');

    ---------------------------------------------------------------------------
    -- CASE 43: IVF - The Trigger Shot (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Final Oocyte Maturation' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Final Oocyte Maturation', 'A woman in an IVF cycle is told to take her \"trigger shot\" at exactly 10 PM.', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Final Oocyte Maturation', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What hormone is typically used as the \"trigger\" to mimic the LH surge?', '["FSH", "hCG (human Chorionic Gonadotropin)", "Estrogen", "None"]', 1, 'hCG binds to the LH receptor and triggers the final maturation of the eggs.'),
    (v_case_id, 'How many hours after the trigger shot is egg retrieval performed?', '["1 hour", "34 to 36 hours", "1 week", "None"]', 1, 'Timing is critical to catch the eggs just before they are spontaneously ovulated.'),
    (v_case_id, 'What is the goal of the trigger shot?', '["To make eggs bigger", "To restart meiosis and allow for egg release/retrieval", "To stop bleeding", "None"]', 1, 'It completes the maturation process.');

    ---------------------------------------------------------------------------
    -- CASE 44: Infertility - Semen Analysis and Fever (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Illness and Sperm' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Illness and Sperm', 'A man has a zero sperm count (azoospermia) 2 weeks after having a severe case of the flu with a 104F fever.', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Illness and Sperm', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Is this likely a permanent state?', '["Yes", "No, high fevers can temporarily shut down sperm production", "Only with surgery", "None"]', 1, 'Spermatogenesis is highly temperature-sensitive.'),
    (v_case_id, 'When should the test be repeated?', '["Tomorrow", "In 2.5 to 3 months (70-90 days)", "Next year", "None"]', 1, 'A full cycle of sperm production must be completed to see the recovery.'),
    (v_case_id, 'Which condition is the most common anatomical cause of scrotal heat?', '["Hydrocele", "Varicocele", "Cyst", "None"]', 1, 'Dilated veins act as a heat exchanger.');

    ---------------------------------------------------------------------------
    -- CASE 45: Delayed Puberty Definition (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Waiting for Puberty' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Waiting for Puberty', 'A 14-year-old girl has no breast development.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Waiting for Puberty', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of delayed puberty regarding BREAST development?', '["No breasts by age 10", "No breasts by age 13", "No breasts by age 16", "None"]', 1, 'Absence of secondary sex characteristics by age 13 warrants evaluation.'),
    (v_case_id, 'What is the definition of delayed puberty regarding MENARCHE?', '["No period by 13", "No period by 15 (if breasts are present) OR within 3 years of thelarche", "No period by 18", "None"]', 1, 'Criteria vary based on whether other signs of development are present.'),
    (v_case_id, 'What is the most common cause of delayed puberty?', '["Brain tumor", "Constitutional Delay (Late bloomers)", "Turner Syndrome", "None"]', 1, 'Often there is a family history of late puberty.');

    ---------------------------------------------------------------------------
    -- CASE 46: Infertility - Unexplained (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Normal Tests, No Baby' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Normal Tests, No Baby', 'A couple has normal semen analysis, patent tubes, and confirmed ovulation but still cannot conceive after 1 year.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Normal Tests, No Baby', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this diagnosis called?', '["Idiopathic Infertility", "Unexplained Infertility", "Sterility", "None"]', 1, 'Up to 15-30% of couples will have entirely normal basic workups.'),
    (v_case_id, 'What is the empirical first-line treatment for unexplained infertility?', '["IVF immediately", "Clomiphene/Letrozole + Intrauterine Insemination (IUI)", "OCPs", "Surgery"]', 1, 'Superovulation with IUI increases the chances of sperm-egg meeting.'),
    (v_case_id, 'Is IVF effective for unexplained infertility?', '["No", "Yes, it is often the final and most successful option", "Only in men", "None"]', 1, 'IVF addresses sub-clinical issues like fertilization failure.');

    ---------------------------------------------------------------------------
    -- CASE 47: AUB - Malignancy Risk Factors (Blueprints)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Bleeding and BMI' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Bleeding and BMI', 'A 42-year-old woman with a BMI of 40 has heavy periods.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Bleeding and BMI', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why does obesity increase the risk of endometrial cancer?', '["It makes the uterus big", "Adipose tissue contains aromatase, which converts androgens to estrogen (Estrone), leading to unopposed estrogen exposure", "No effect", "None"]', 1, 'Peripheral conversion is a major source of excess estrogen.'),
    (v_case_id, 'Should this patient get an EMB even though she is < 45?', '["No", "Yes, due to her obesity and likely chronic anovulation", "Only if she has a fever", "None"]', 1, 'The threshold for biopsy is lowered in high-risk patients.'),
    (v_case_id, 'What is \"AUB-M\"?', '["Bleeding from muscle", "Bleeding due to Malignancy or Hyperplasia", "Bleeding from meds", "None"]', 1, 'The FIGO category for precancerous/cancerous lesions.');

    ---------------------------------------------------------------------------
    -- CASE 48: Secondary Amenorrhea - Sheehan vs Asherman (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Distinguishing Postpartum Amenorrhea' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Distinguishing Postpartum Amenorrhea', 'A physician is comparing two patients who have no periods after childbirth.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Distinguishing Postpartum Amenorrhea', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which condition will show a LOW FSH?', '["Asherman", "Sheehan Syndrome (pituitary failure)", "Turner", "None"]', 1, 'Sheehan is a central failure; the pituitary is dead.'),
    (v_case_id, 'Which condition will have NORMAL FSH and a negative progestin challenge?', '["Sheehan", "Asherman Syndrome", "PCOS", "None"]', 1, 'In Asherman, the hormones are normal but the uterus is scarred shut.'),
    (v_case_id, 'Which condition is related to hemorrhage?', '["Both", "Sheehan (due to infarct)", "Asherman (due to aggressive D&C for hemorrhage)", "None"]', 0, 'Both often occur after complicated deliveries.');

    ---------------------------------------------------------------------------
    -- CASE 49: Infertility - Cervical Stenosis (Beckmann)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Blocked Entrance' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Blocked Entrance', 'A woman who had multiple cone biopsies for dysplasia cannot conceive and reports her periods have become very light and painful.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Blocked Entrance', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["PCOS", "Cervical Stenosis", "Fibroids", "None"]', 1, 'Scarring of the cervix after surgery can prevent sperm entry.'),
    (v_case_id, 'What is the treatment for stenosis in someone wanting to conceive?', '["Hysterectomy", "Dilation of the cervix", "OCPs", "None"]', 1, 'Opening the canal can restore the outflow and inflow path.'),
    (v_case_id, 'Can this cause retrograde menstruation?', '["No", "Yes, if the blood can''t get out, it can be forced back through the tubes", "Only in teens", "None"]', 1, 'Obstruction is a risk factor for endometriosis.');

    ---------------------------------------------------------------------------
    -- CASE 50: Infertility - The Semen Analysis (Williams)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Basic Male Workup' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Basic Male Workup', 'A husband is nervous about his fertility test.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Basic Male Workup', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How many days of abstinence are recommended before a semen analysis?', '["0", "2 to 5 days", "1 month", "None"]', 1, 'Too short or too long a period of abstinence can skew the results.'),
    (v_case_id, 'Is a single semen analysis sufficient to diagnose male infertility?', '["Yes", "No, at least two samples are needed to account for variability", "Only if it is zero", "None"]', 1, 'Clinical decisions should be based on consistent findings.'),
    (v_case_id, 'What is the FIRST thing you should check in an infertility workup?', '["Laparoscopy on the wife", "Semen analysis on the husband", "Brain MRI", "None"]', 1, 'Always start with the least invasive and most informative tests.');

    RAISE NOTICE 'SUCCESS: 50 Menstrual Disorders & Infertility Case Blocks registered.';
END $$;

COMMIT;
