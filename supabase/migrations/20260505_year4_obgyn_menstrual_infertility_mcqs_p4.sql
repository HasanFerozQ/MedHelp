BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-menstrual-infertility' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-menstrual-infertility not found.';
    END IF;

    -- Use a temporary table to stage insertions and prevent duplicates without a global constraint
    CREATE TEMP TABLE stage_mcqs (question TEXT, options JSONB, correct_index INT, explanation TEXT);

    -- Batch 4: 181-240 (Hirsutism, Galactorrhea, and Advanced Infertility)
    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('181: "Hirsutism" - "DHEAS" is a marker specifically for _____ androgen production.', '["Ovarian", "Adrenal", "Liver", "None"]', 1, 'Androstenedione is produced by both; DHEAS is mostly adrenal. (Williams Gynecology)'),
    ('182: A patient has "Rapid onset" virilization and a "total testosterone" of 250 ng/dL. First step?', '["OCPs", "Pelvic imaging (to look for an ovarian tumor)", "Metformin", "None"]', 1, 'Highly suspicious for a Sertoli-Leydig tumor. (ACOG)'),
    ('183: "Congenital Adrenal Hyperplasia" (CAH) - "17-hydroxyprogesterone" (17-OHP) > _____ ng/dL is diagnostic of the late-onset form.', '["50", "200", "800", "None"]', 2, 'Levels between 200 and 800 require an ACTH stimulation test. (Beckmann)'),
    ('184: "Hirsutism" - "Spironolactone" should be used for at least _____ months to see clinical improvement.', '["1", "6 (due to the hair growth cycle)", "24", "None"]', 1, 'Standard of care for patient counseling. (ACOG)'),
    ('185: "Galactorrhea" is defined as:', '["Pus from the breast", "Non-puerperal (not related to pregnancy) milky nipple discharge", "Bleeding", "None"]', 1, 'Can be unilateral or bilateral. (Beckmann)'),
    ('186: Most common "medication" class to cause galactorrhea?', '["Antibiotics", "Antipsychotics (Dopamine antagonists)", "NSAIDs", "None"]', 1, 'Dopamine normally inhibits prolactin; blocking it leads to high prolactin. (Williams)'),
    ('187: "Secondary Amenorrhea" - "Asherman Syndrome" - Does the patient have a "progesterone withdrawal" bleed?', '["Yes", "No (the uterus is scarred and cannot bleed)", "Only in GDM", "None"]', 1, 'Core clinical finding. (ACOG)'),
    ('188: "Infertility" - "Diminished Ovarian Reserve" (DOR) - Is pregnancy possible with own eggs?', '["No", "Yes, but success rates are lower and the risk of chromosomal abnormalities is higher", "Always", "None"]', 1, 'Counseling on donor eggs may be needed. (Beckmann)'),
    ('189: "Infertility" - "Donor Oocytes" (Eggs) are the gold standard for women with:', '["PCOS", "Premature Ovarian Insufficiency or Advanced Maternal Age (> 42)", "Fibroids", "None"]', 1, 'Oocyte quality is the main limiting factor. (ACOG)'),
    ('190: "Surrogacy" (Gestational Carrier) is recommended for women with:', '["Endometriosis", "Uterine absence (MRKH) or severe uterine scarring", "Obesity", "None"]', 1, 'Another woman carries the pregnancy. (Williams)'),
    ('191: "IVF" - "PGT-A" (Pre-implantation Genetic Testing for Aneuploidy) involves:', '["Mixing eggs", "Biopsy of the embryo (blastocyst) to check for chromosomal number before transfer", "None", "Surgery"]', 1, 'Goal is to transfer a chromosomally normal (euploid) embryo. (ACOG)'),
    ('192: "Infertility" - "Male" - "Varicocele" repair improves:', '["Sperm motility and count", "Only volume", "None", "Height"]', 0, 'By reducing thermal stress on the testes. (Williams)'),
    ('193: "Primary Amenorrhea" - "Swyer Syndrome" - Do they have functional "Breasts"?', '["Yes", "No (streak gonads produce no estrogen, so breasts do not develop without HRT)", "Only a little", "None"]', 1, 'Differentiation from AIS (where breasts develop from aromitzed androgens). (Beckmann)'),
    ('194: "AUB" - "Hysterectomy" - "Vaginal" approach is preferred when:', '["The uterus is huge", "The uterus is mobile and not too large; has fewer complications and faster recovery", "Always", "None"]', 1, 'ACOG recommendation. (ACOG)'),
    ('195: "AUB" - "Uterine Artery Embolization" (UAE) - Common post-procedure symptom?', '["Cancer", "Post-embolization syndrome (pain, low-grade fever, nausea)", "Infection", "None"]', 1, 'Expected inflammatory response to tissue infarction. (Beckmann)'),
    ('196: "PCOS" - Does "Weight Loss" decrease "hirsutism"?', '["No", "Yes, by improving insulin sensitivity and lowering free androgens", "Only in men", "None"]', 1, 'Fundamental lifestyle management. (ACOG)'),
    ('197: "Galactorrhea" - If prolactin is high and MRI is normal. Diagnosis?', '["Cancer", "Idiopathic Hyperprolactinemia", "PCOS", "None"]', 1, 'Treat with dopamine agonists if symptomatic or desiring pregnancy. (Beckmann)'),
    ('198: "Amenorrhea" - "Exercise-induced" amenorrhea is characterized by _____ levels of FSH.', '["High", "Low or \"Inappropriately normal\"", "Zero", "None"]', 1, 'Reflects hypothalamic dysfunction. (Williams)'),
    ('199: "Infertility" - "Endometrial Biopsy" for "luteal phase defect" (LPD) is:', '["Standard of care", "Historical; no longer recommended for routine infertility workup", "Always used", "None"]', 1, 'Replaced by more reliable markers. (ACOG)'),
    ('200: "Infertility" - "Hysteroscopy" - Can it be used to remove "septums"?', '["No", "Yes, hysteroscopic metroplasty is the treatment of choice for a uterine septum", "Only if parous", "None"]', 1, 'Improves pregnancy outcomes. (Beckmann)'),
    ('201: "Hirsutism" - Does "Laser" treatment work better on "white" or "dark" hair?', '["White", "Dark (melanin in the hair follicle is the target)", "Red", "None"]', 1, 'Safety point for patient counseling. (Williams)'),
    ('202: "Galactorrhea" - Is "Hypothyroidism" a known cause?', '["No", "Yes, high TRH stimulates prolactin release", "Only in smokers", "None"]', 1, 'Rule out by checking TSH. (ACOG)'),
    ('203: "AUB" - "Endometrial Ablation" failure rate is higher in women < _____ years old.', '["25", "40", "50", "None"]', 1, 'Due to longer time until menopause and regenerative capacity of the lining. (Beckmann)'),
    ('204: "Infertility" - "Male" - "Semen Analysis" - Low "Motility" is called:', '["Azoospermia", "Asthenozoospermia", "Oligospermia", "None"]', 1, 'Standard terminology. (WHO)'),
    ('205: "Infertility" - "Male" - Low "Count" is called:', '["Normal", "Oligozoospermia", "Azoospermia", "None"]', 1, 'Standard terminology. (WHO)'),
    ('206: "AUB" - "Cervical" polyp - Management?', '["Ignore", "Simple office excision (twisting the stalk)", "Surgery", "None"]', 1, 'Usually benign and easily removed. (ACOG)'),
    ('207: "Hirsutism" - "Cyproterone Acetate" is an anti-androgen used more commonly in:', '["The US", "Europe and Canada", "None", "Asia only"]', 1, 'Not FDA-approved in the US. (Williams)'),
    ('208: "Galactorrhea" - "Macroprolactinoma" can cause visual field defects. Which type?', '["Blindness", "Bitemporal Hemianopsia (due to compression of the optic chiasm)", "Central loss", "None"]', 1, 'Classic neuro-ophthalmology finding. (Beckmann)'),
    ('209: "AUB" - "Tranexamic acid" (TXA) - Risk of "thrombosis"?', '["Very high", "Theoretically increased but data shows it is safe in most patients", "None", "Cancer"]', 1, 'Contraindicated in women with active VTE. (ACOG)'),
    ('210: "Infertility" - "Egg Freezing" (Oocyte Cryopreservation) - Preferred method today?', '["Slow freezing", "Vitrification (flash-freezing)", "Ice", "None"]', 1, 'Prevents ice crystal formation in the egg. (Williams)'),
    ('211: "AUB-O" - Can it cause "Iron Deficiency Anemia"?', '["No", "Yes, chronic heavy anovulatory bleeding is a major cause of anemia", "Only in men", "None"]', 1, 'Important to check CBC and Ferritin. (ACOG)'),
    ('212: "Infertility" - "Male" - "Klinefelter Syndrome" (47, XXY) presents with:', '["Tall stature and small, firm testes (non-obstructive azoospermia)", "Short stature", "High testosterone", "None"]', 0, 'Most common genetic cause of male infertility. (Beckmann)'),
    ('213: "Hirsutism" - "Idiopathic hirsutism" is characterized by:', '["High testosterone", "Normal androgen levels but increased skin sensitivity/activity", "Infection", "None"]', 1, 'Often has a strong familial component. (Williams)'),
    ('214: "AUB" - "Progesterone" therapy for "Endometrial Hyperplasia" - How often should a repeat EMB be done?', '["Every week", "Every 3-6 months until resolved", "Never", "None"]', 1, 'Standard surveillance protocol. (ACOG)'),
    ('215: "Infertility" - "Intrauterine Adhesions" - Can they be prevented after D&C?', '["Always", "No, but minimizing trauma and potentially using intrauterine barriers or estrogen can help", "Only if nulliparous", "None"]', 1, 'High recurrence risk. (Beckmann)'),
    ('216: "Galactorrhea" - "Cabergoline" vs "Bromocriptine": Which has fewer side effects?', '["Bromocriptine", "Cabergoline (longer half-life and better tolerated)", "Same", "None"]', 1, 'Standard preference in many clinics. (ACOG)'),
    ('217: "AUB" - "Endometrial Hyperplasia" - If it fails medical therapy, next step?', '["Repeat EMB", "Hysterectomy", "Observe", "None"]', 1, 'Standard surgical management. (Williams)'),
    ('218: "Infertility" - "Male" - "Cystic Fibrosis" and infertility?', '["No link", "CBAVD (Congenital Bilateral Absence of the Vas Deferens) is common", "Cancer", "None"]', 1, 'Sperm are produced but cannot be ejaculated. (ACOG)'),
    ('219: "Amenorrhea" - "Fragile X" premutation - Association?', '["Fibroids", "Premature Ovarian Insufficiency (POI)", "Twins", "None"]', 1, 'Important genetic screening for POI. (Beckmann)'),
    ('220: "AUB" - "Mirena" IUD - Effect on "Dysmenorrhea"?', '["Makes it worse", "Significantly reduces menstrual pain", "No effect", "None"]', 1, 'Dual benefit for HMB and pain. (ACOG)'),
    ('221: "Infertility" - "Tubal Factor" - If one tube is blocked and the other is open, what is the best next step?', '["IVF immediately", "Expectant management or controlled ovarian stimulation (IUI)", "Surgery", "None"]', 1, 'Pregnancy is still possible naturally. (Beckmann)'),
    ('222: "Hirsutism" - "Finasteride" and male fetuses?', '["Protects them", "Causes feminization (must use strict contraception)", "No effect", "None"]', 1, 'Important safety counseling. (Williams)'),
    ('223: "Infertility" - "Male" - "Semen Analysis" - Sample should be obtained after _____ days of abstinence.', '["0", "2 to 7", "30", "None"]', 1, 'Standard collection protocol. (WHO)'),
    ('224: "AUB" - "D&C" - Is it a "Permanent" solution for heavy bleeding?', '["Yes", "No, it is temporary (effects last only 1-2 cycles)", "Only if parous", "None"]', 1, 'Often used as a bridge to other therapy or diagnosis. (ACOG)'),
    ('225: "Galactorrhea" - "Nipple Stimulation" - Can it cause it?', '["No", "Yes, through the suckling reflex mechanism", "Only in men", "None"]', 1, 'Important history to take. (Beckmann)'),
    ('226: "PCOS" - Does it increase the risk of "Miscarriage"?', '["No", "Some data suggests a higher risk, potentially due to hormonal factors or obesity", "Maybe", "None"]', 1, 'Controversial but often cited. (ACOG)'),
    ('227: "AUB" - "Endometrial thickness" on US is MOST reliable during which phase of the cycle?', '["Luteal", "Early follicular (immediately after menses)", "Mid-cycle", "None"]', 1, 'When the lining should be thinnest. (Williams)'),
    ('228: "Infertility" - "IUI" - If the male partner has very low count (< 5 million), is IUI effective?', '["Yes", "Rarely; IVF/ICSI is usually recommended", "Always", "None"]', 1, 'Success drops significantly with very low total motile count. (Beckmann)'),
    ('229: "Hirsutism" - "Laser" - "Fitzpatrick Skin Type" IV-VI (darker skin) requires:', '["No laser", "Specific lasers (e.g. Nd:YAG) to avoid burning the skin", "Surgery", "None"]', 1, 'Targeting hair without damaging skin pigment. (Williams)'),
    ('230: "Galactorrhea" - If TRH is high, it _____ prolactin.', '["Increases", "Decreases", "Stays same", "None"]', 0, 'Mechanism of hypothyroidism-induced hyperprolactinemia. (ACOG)'),
    ('231: "Amenorrhea" - "Pseudo-amenorrhea" refers to:', '["Pregnancy", "Anatomic obstruction where menses occur but cannot exit (e.g. Imperforate hymen)", "PCOS", "None"]', 1, 'Standard terminology. (Beckmann)'),
    ('232: "AUB" - "Leiomyoma" - "Myomectomy" - Can it be done during pregnancy?', '["No (risk of severe hemorrhage)", "Yes, if they hurt", "Only if parous", "None"]', 0, 'Strongly avoided until postpartum. (Williams)'),
    ('233: "Infertility" - "Male" - "Sperm" maturation takes how many days?', '["7", "30", "72-74", "None"]', 2, 'Reason for repeating analysis after 2-3 months. (WHO)'),
    ('234: "PCOS" - "Letrozole" vs "Clomiphene" - Which has a LOWER multiple pregnancy rate?', '["Clomiphene", "Letrozole (due to \"mono-ovulation\" tendency)", "Same", "None"]', 1, 'Another benefit of Letrozole. (ACOG)'),
    ('235: "Hirsutism" - "Terminal" hair is dependent on _____?', '["Estrogen", "Androgens", "Thyroid", "None"]', 1, 'Vellus to terminal conversion. (Beckmann)'),
    ('236: "Galactorrhea" - "Amniotic fluid" comparison?', '["Same", "No (galactorrhea is milky, not clear fluid)", "Only in GDM", "None"]', 1, 'Physical character is key. (Williams)'),
    ('237: "AUB" - "Endometrial Hyperplasia" - "Simple" has _____ risk of cancer.', '["< 1%", "10%", "50%", "None"]', 0, 'Low progression risk. (ACOG)'),
    ('238: "Infertility" - "Male" - "Obesity" and sperm?', '["No effect", "Worsens parameters due to peripheral estrogen and scrotal heat", "Improves them", "None"]', 1, 'Lifestyle factor to address. (WHO)'),
    ('239: "Amenorrhea" - "Kallmann" - Why is it more common in males?', '["Hormones", "X-linked inheritance", "None", "Obesity"]', 1, 'Classic genetic transmission. (Beckmann)'),
    ('240: "AUB" - "Fibroids" - Most common "secondary" symptom?', '["Weight loss", "Bulk symptoms (pelvic pressure/frequency)", "Fever", "None"]', 1, 'Related to the size of the mass. (ACOG)');

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation)
    SELECT v_topic_id, question, options, correct_index, explanation
    FROM stage_mcqs s
    WHERE NOT EXISTS (
        SELECT 1 FROM mcqs m 
        WHERE m.topic_id = v_topic_id 
        AND m.question = s.question
    );

    DROP TABLE stage_mcqs;

    RAISE NOTICE 'SUCCESS: Batch 4 (181-240) MCQs for Menstrual Disorders & Infertility registered.';
END $$;
COMMIT;
