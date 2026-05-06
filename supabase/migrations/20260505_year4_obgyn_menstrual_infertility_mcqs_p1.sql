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

    -- Batch 1: 1-60 (AUB Classification and Workup)
    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('1: What is the FIGO system for classifying causes of AUB in non-pregnant women?', '["TNM", "PALM-COEIN", "Gleason", "None"]', 1, 'Standardized nomenclature for structural and non-structural causes. (ACOG)'),
    ('2: In "PALM-COEIN", what does the "P" stand for?', '["Pregnancy", "Polyp", "Pain", "Puberty"]', 1, 'Endometrial or cervical polyps are common structural causes of AUB. (Williams Gynecology)'),
    ('3: In "PALM-COEIN", the "A" stands for:', '["Anemia", "Adenomyosis", "Atrophy", "None"]', 1, 'Invasion of endometrial glands into the myometrium. (Beckmann)'),
    ('4: In "PALM-COEIN", the "L" stands for:', '["Lichen", "Leiomyoma (Fibroids)", "Lupus", "None"]', 1, 'The most common benign tumors of the uterus. (ACOG)'),
    ('5: In "PALM-COEIN", the "M" stands for:', '["Menopause", "Malignancy and Hyperplasia", "Miscarriage", "None"]', 1, 'Must always be ruled out in high-risk groups (e.g., postmenopausal). (Williams)'),
    ('6: In "PALM-COEIN", the "C" (Non-structural) stands for:', '["Cushing", "Coagulopathy", "Cervicitis", "None"]', 1, 'Includes conditions like von Willebrand disease. (ACOG)'),
    ('7: In "PALM-COEIN", the "O" stands for:', '["Obesity", "Ovulatory Dysfunction", "Ovarian cyst", "None"]', 1, 'Common in PCOS, thyroid disease, and adolescence. (Beckmann)'),
    ('8: In "PALM-COEIN", the "E" stands for:', '["Estrogen", "Endometrial (primary dysfunction of the endometrium)", "Ectopic", "None"]', 1, 'Includes issues with local hemostasis. (Williams)'),
    ('9: In "PALM-COEIN", the "I" stands for:', '["Infection", "Iatrogenic", "Idiopathic", "None"]', 1, 'Includes medication effects (e.g., anticoagulants, IUDs). (ACOG)'),
    ('10: What is the definition of "Normal" menstrual cycle length?', '["14 days", "21 to 35 days", "28 days exactly", "None"]', 1, 'Variation outside this range warrants evaluation. (Beckmann)'),
    ('11: "Menorrhagia" (Heavy Menstrual Bleeding) is defined as > _____ mL of blood loss per cycle.', '["20", "50", "80", "200"]', 2, 'Though clinical impact on the patient is now the primary metric. (ACOG)'),
    ('12: "Metrorrhagia" refers to:', '["Heavy bleeding", "Bleeding between periods (Intermenstrual bleeding)", "No periods", "None"]', 1, 'Often associated with polyps or cancer. (Williams)'),
    ('13: What is the "First-line" imaging for any woman with AUB?', '["CT scan", "Transvaginal Ultrasound (TVUS)", "MRI", "Hysteroscopy"]', 1, 'To assess endometrial thickness and uterine structure. (ACOG)'),
    ('14: At what endometrial thickness (in mm) is a biopsy MANDATORY in a postmenopausal woman with bleeding?', '["1", "4", "10", "15"]', 1, 'Endometrium > 4mm in a postmenopausal bleeder is highly suspicious. (ACOG)'),
    ('15: "Endometrial Biopsy" (EMB) is the gold standard for ruling out:', '["Fibroids", "Endometrial Hyperplasia and Carcinoma", "PID", "None"]', 1, 'Performed in the office with a Pipelle. (Beckmann)'),
    ('16: "Saline Infusion Sonohysterography" (SIS) is superior to TVUS for detecting:', '["Ovarian cysts", "Intracavitary lesions (Polyps and Submucosal Fibroids)", "Adenomyosis", "None"]', 1, 'Fluid distends the cavity to provide better contrast. (Williams)'),
    ('17: "Dilation and Curettage" (D&C) is both diagnostic and:', '["A permanent cure", "Therapeutic (can acutely stop heavy bleeding)", "A cause of cancer", "None"]', 1, 'Often done if EMB is non-diagnostic or bleeding is severe. (Beckmann)'),
    ('18: "Amenorrhea" - Primary is absence of menses by age _____ with normal growth.', '["12", "15", "18", "None"]', 1, 'Or age 13 if no secondary sexual characteristics. (ACOG)'),
    ('19: Most common cause of "Secondary Amenorrhea"?', '["PCOS", "Pregnancy", "Thyroid disease", "Menopause"]', 1, 'Always the first test to perform! (ACOG)'),
    ('20: "Progesterone Challenge Test" - Bleeding after stopping the med suggests:', '["Anovulation (adequate estrogen but no progesterone)", "Uterine scarring", "No estrogen", "None"]', 0, 'Confirms the outflow tract is patent and the lining is primed. (Williams)'),
    ('21: No bleeding after "Progesterone Challenge" AND subsequent "Estrogen/Progestin" challenge suggests:', '["PCOS", "Outflow tract obstruction (e.g., Asherman Syndrome or Cervical Stenosis)", "Pregnancy", "None"]', 1, 'The lining cannot bleed even with hormones. (Beckmann)'),
    ('22: "Infertility" is defined as the inability to conceive after _____ of unprotected intercourse.', '["3 months", "6 months", "12 months (or 6 months if age > 35)", "2 years"]', 2, 'Standard clinical threshold for workup. (ACOG)'),
    ('23: "Primary Infertility" means:', '["Never pregnant", "Pregnant once before", "Twins", "None"]', 0, 'Never achieved a clinical pregnancy. (Williams)'),
    ('24: "Secondary Infertility" means:', '["Never pregnant", "Previous clinical pregnancy achieved, regardless of outcome", "Always twins", "None"]', 1, 'Patient has been pregnant before. (Beckmann)'),
    ('25: What percentage of infertility cases are due to a "Male Factor"?', '["1%", "10%", "30-40%", "90%"]', 2, 'Workup must always include the male partner. (ACOG)'),
    ('26: Most common cause of female factor infertility?', '["Tubal disease", "Ovulatory Dysfunction", "Endometriosis", "Uterine anomalies"]', 1, 'Usually due to PCOS or diminished ovarian reserve. (Beckmann)'),
    ('27: "Hysterosalpingogram" (HSG) is the primary test to evaluate:', '["Ovulation", "Tubal Patency and Uterine Cavity", "Sperm count", "None"]', 1, 'Radiopaque dye is injected into the uterus. (Williams)'),
    ('28: "Day 3 FSH" and "Anti-Mullerian Hormone" (AMH) are markers of:', '["Pregnancy", "Ovarian Reserve", "Ovulation", "None"]', 1, 'High FSH or low AMH suggests diminished reserve. (ACOG)'),
    ('29: "Mid-luteal Progesterone" level (Day 21) > _____ ng/mL confirms ovulation.', '["1", "3", "10", "None"]', 1, 'Indicates a functional corpus luteum. (Beckmann)'),
    ('30: First-line treatment for anovulatory infertility in PCOS (ACOG)?', '["Clomiphene", "Letrozole", "Metformin", "IVF"]', 1, 'Letrozole is superior to Clomiphene for live birth in PCOS. (ACOG)'),
    ('31: "Clomiphene Citrate" (Clomid) works by:', '["Increasing LH directly", "Blocking estrogen receptors in the hypothalamus, increasing GnRH/FSH/LH", "Removing cysts", "None"]', 1, 'Tricks the brain into thinking estrogen is low. (Williams)'),
    ('32: Major risk of "Ovulation Induction" (Clomid/Letrozole)?', '["Cancer", "Multiple Gestation (Twins/Triplets)", "Weight loss", "None"]', 1, 'Requires careful monitoring. (ACOG)'),
    ('33: "Intrauterine Insemination" (IUI) involves:', '["Mixing eggs and sperm in a dish", "Placing washed sperm directly into the uterus", "Surgery", "None"]', 1, 'Bypasses cervical factors and improves timing. (Beckmann)'),
    ('34: "In Vitro Fertilization" (IVF) is the primary treatment for:', '["Bilateral Tubal Occlusion", "Severe male factor", "Failed conservative therapy", "All of the above"]', 3, 'Highest success rates per cycle. (ACOG)'),
    ('35: "Ovarian Hyperstimulation Syndrome" (OHSS) is a complication of:', '["IUDs", "IVF (gonadotropin stimulation)", "OCPs", "None"]', 1, 'Presents with ascites, electrolyte imbalance, and enlarged ovaries. (Williams)'),
    ('36: "Polycystic Ovary Syndrome" (PCOS) - What happens to "Androgens"?', '["Lowered", "Elevated (Hyperandrogenism)", "Normal", "None"]', 1, 'Key diagnostic component. (ACOG)'),
    ('37: "Secondary Dysmenorrhea" in a 40-year-old with a large, irregular uterus. Diagnosis?', '["Endometriosis", "Uterine Leiomyomas (Fibroids)", "PCOS", "None"]', 1, 'Standard clinical association. (Beckmann)'),
    ('38: "Endometriosis" causes infertility primarily through:', '["No eggs", "Pelvic adhesions and inflammatory environment", "Weight gain", "None"]', 1, 'Distorts tubal-ovarian relationship. (ACOG)'),
    ('39: "Semen Analysis" - Normal "Concentration" should be > _____ million/mL.', '["1", "5", "15", "100"]', 2, 'WHO 5th edition criteria. (WHO)'),
    ('40: "Semen Analysis" - Normal "Morphology" (Kruger strict) should be > _____ % normal forms.', '["4", "20", "50", "80"]', 0, 'Shape of the sperm is critical for fertilization. (Beckmann)'),
    ('41: "Dysfunctional Uterine Bleeding" (DUB) is now more accurately called:', '["Normal bleeding", "AUB-O (Ovulatory dysfunction)", "Infection", "None"]', 1, 'Legacy term for bleeding with no structural cause. (ACOG)'),
    ('42: "AUB-M" (Malignancy) - What is the most important risk factor for endometrial cancer in a young woman?', '["Smoking", "Obesity (due to peripheral estrogen conversion)", "Exercise", "None"]', 1, 'Adipose tissue converts androgens to estrone. (Williams)'),
    ('43: "AUB-P" (Polyp) - Can they be seen on a regular PAP smear?', '["Always", "No, they are usually intrauterine or endocervical and require imaging/hysteroscopy", "Yes", "None"]', 1, 'Standard diagnostic limitation. (Beckmann)'),
    ('44: "Premature Ovarian Insufficiency" (POI) - Diagnosis confirmed by FSH > _____ IU/L on two occasions.', '["10", "40", "5", "None"]', 1, 'In a woman under age 40. (ACOG)'),
    ('45: "Sheehan Syndrome" - Pituitary failure following:', '["High BP", "Postpartum Hemorrhage (hypovolemic shock causing necrosis)", "Infection", "None"]', 1, 'Classic board association. (Williams)'),
    ('46: "Asherman Syndrome" - Diagnosis is best made by:', '["Ultrasound", "Hysteroscopy or HSG", "Blood test", "None"]', 1, 'Shows intrauterine adhesions. (ACOG)'),
    ('47: "Hypogonadotropic Hypogonadism" is characterized by:', '["Low FSH and Low Estrogen", "High FSH and Low Estrogen", "High FSH and High Estrogen", "None"]', 0, 'Central cause (Hypothalamus/Pituitary failure). (Beckmann)'),
    ('48: "Hypergonadotropic Hypogonadism" is characterized by:', '["Low FSH", "High FSH and Low Estrogen", "Normal FSH", "None"]', 1, 'Primary Ovarian Failure. (Williams)'),
    ('49: "Turner Syndrome" (45, X) - Primary clinical feature?', '["Tall stature", "Short stature, webbed neck, and streak ovaries", "Obesity", "None"]', 1, 'Causes primary amenorrhea. (ACOG)'),
    ('50: "Androgen Insensitivity Syndrome" (AIS) - Karyotype?', '["46, XX", "46, XY", "47, XXY", "None"]', 1, 'Genetically male but phenotypically female. (Beckmann)'),
    ('51: "AUB-C" (Coagulopathy) - Most common inherited bleeding disorder?', '["Hemophilia A", "von Willebrand Disease", "Protein C deficiency", "None"]', 1, 'Commonly presents as heavy menstrual bleeding starting at menarche. (ACOG)'),
    ('52: "Acute AUB" - If a patient is hemodynamically unstable from bleeding, first step?', '["Oral meds", "IV fluids, blood products, and potentially IV Estrogen or emergency D&C", "Wait", "None"]', 1, 'Emergency stabilization. (Williams)'),
    ('53: "Tranexamic Acid" (Lysteda) works by:', '["Killing glands", "Antifibrinolytic (stabilizes clots)", "Increasing estrogen", "None"]', 1, 'Non-hormonal option for HMB. (ACOG)'),
    ('54: "Endometrial Ablation" is contraindicated in women who:', '["Are obese", "Desire future pregnancy", "Have a history of C-section", "None"]', 1, 'Causes severe pregnancy complications. (Beckmann)'),
    ('55: "Infertility" - "Basal Body Temperature" (BBT) charts measure:', '["Estrogen", "Progesterone-induced rise in temperature after ovulation", "LH surge", "None"]', 1, 'Retrospective marker of ovulation. (Williams)'),
    ('56: "Ovulation Predictor Kits" (OPKs) detect which hormone in urine?', '["Estrogen", "LH (Luteinizing Hormone)", "FSH", "hCG"]', 1, 'Predicts ovulation within 24-36 hours. (ACOG)'),
    ('57: "Infertility" - "Post-coital Test" (PCT) is:', '["Standard of care", "Historical; no longer recommended due to poor reliability", "Always used", "None"]', 1, 'Check for sperm-mucus interaction. (Beckmann)'),
    ('58: "Unexplained Infertility" - Occurs in what percentage of couples?', '["0%", "10-25%", "50%", "None"]', 1, 'Standard workup yields no clear cause. (ACOG)'),
    ('59: "Sperm Washing" is done for IUI to remove _____ which cause uterine cramping.', '["Sperm", "Prostaglandins", "Water", "None"]', 1, 'Ensures a safer and more effective procedure. (Williams)'),
    ('60: "Varicocele" - A common cause of _____ factor infertility.', '["Female", "Male (due to increased scrotal temperature)", "Both", "None"]', 1, 'Surgical repair may improve semen parameters. (ACOG)');

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation)
    SELECT v_topic_id, question, options, correct_index, explanation
    FROM stage_mcqs s
    WHERE NOT EXISTS (
        SELECT 1 FROM mcqs m 
        WHERE m.topic_id = v_topic_id 
        AND m.question = s.question
    );

    DROP TABLE stage_mcqs;

    RAISE NOTICE 'SUCCESS: Batch 1 (1-60) MCQs for Menstrual Disorders & Infertility registered.';
END $$;
COMMIT;
