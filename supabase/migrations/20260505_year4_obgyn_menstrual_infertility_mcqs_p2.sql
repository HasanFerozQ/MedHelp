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

    -- Batch 2: 61-120 (Amenorrhea and Endocrine Disorders)
    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('61: "Primary Amenorrhea" - Absence of menses by age _____ if NO secondary sexual characteristics.', '["12", "13", "15", "16"]', 1, 'Reflects a more urgent need for endocrine evaluation. (ACOG)'),
    ('62: "Secondary Amenorrhea" - Absence of menses for _____ months in a woman with previously irregular cycles.', '["1", "3", "6", "12"]', 2, 'Or 3 months in regular cycles. (ACOG)'),
    ('63: "Hyperprolactinemia" - Most common pituitary cause of amenorrhea. Mechanism?', '["Increasing GnRH", "Inhibiting GnRH pulsatility", "Directly killing the ovary", "None"]', 1, 'Leads to hypogonadotropic hypogonadism. (Williams Gynecology)'),
    ('64: "Prolactinoma" - "Microadenoma" is defined as a tumor < _____ mm.', '["1", "5", "10", "20"]', 2, 'Macro is > 10 mm. (Beckmann)'),
    ('65: First-line medical treatment for Prolactinoma?', '["Surgery", "Dopamine Agonists (e.g., Bromocriptine or Cabergoline)", "Estrogen", "None"]', 1, 'Highly effective at shrinking the tumor and restoring menses. (ACOG)'),
    ('66: A 16-year-old with primary amenorrhea, normal height, but no breasts and an FSH of 100. Diagnosis?', '["PCOS", "Premature Ovarian Insufficiency / Gonadal Dysgenesis", "Pregnancy", "None"]', 1, 'High FSH indicates primary ovarian failure. (Williams)'),
    ('67: "Savage Syndrome" (Resistant Ovary Syndrome) is characterized by:', '["No ovaries", "Ovaries with many follicles that fail to respond to FSH", "High LH only", "None"]', 1, 'A rare cause of hypergonadotropic hypogonadism. (Beckmann)'),
    ('68: "Hypothalamic Amenorrhea" is often seen in:', '["Obese women", "Athletes, patients with eating disorders, or high stress", "Smokers", "None"]', 1, 'Due to "functional" GnRH deficiency. (ACOG)'),
    ('69: "Female Athlete Triad" components?', '["Amenorrhea, Bone loss (Osteoporosis), and Low energy availability", "Pain, Fever, Rash", "None", "Obesity"]', 0, 'Requires multidisciplinary management. (Williams)'),
    ('70: Treatment for Hypothalamic Amenorrhea in an athlete?', '["OCPs only", "Lifestyle modification (weight gain/reduced exercise) and potentially HRT for bone protection", "None", "Surgery"]', 1, 'Address the root cause. (Beckmann)'),
    ('71: "Asherman Syndrome" - HSG shows multiple _____.', '["Cysts", "Filling defects (synechiae)", "Spots", "None"]', 1, 'Standard diagnostic finding. (ACOG)'),
    ('72: "Cervical Stenosis" following a LEEP procedure can cause:', '["Heavy bleeding", "Amenorrhea and cyclic pelvic pain (hematometra)", "Cancer", "None"]', 1, 'Trapped menstrual blood. (Williams)'),
    ('73: "Kallmann Syndrome" - Karyotype is usually:', '["45, X", "46, XX", "47, XXX", "None"]', 1, 'But they have no GnRH and no sense of smell. (Beckmann)'),
    ('74: "Swyer Syndrome" (46, XY) - Why must the gonads be removed?', '["They hurt", "High risk of malignant transformation (Gonadoblastoma/Dysgerminoma)", "Infertility", "None"]', 1, 'Gonadectomy after puberty. (Williams)'),
    ('75: "McCune-Albright Syndrome" - Precocious puberty is caused by _____ activation.', '["GnRH", "Autonomous G-protein signaling in the ovary", "Thyroid", "None"]', 1, 'Leads to early estrogen production. (Beckmann)'),
    ('76: "Polycystic Ovary Syndrome" (PCOS) - What is the "unopposed" hormone that increases endometrial cancer risk?', '["Progesterone", "Estrogen (specifically Estrone)", "Testosterone", "None"]', 1, 'Chronic anovulation = no progesterone to balance estrogen. (ACOG)'),
    ('77: "Metformin" in PCOS primarily target:', '["Hair", "Insulin Resistance", "Cysts", "None"]', 1, 'Improves metabolic profile and may help restore ovulation. (Beckmann)'),
    ('78: "Hirsutism" - "5-alpha reductase" converts testosterone to:', '["Estrogen", "Dihydrotestosterone (DHT)", "Progesterone", "None"]', 1, 'DHT is the more potent androgen at the hair follicle. (Williams)'),
    ('79: "Finasteride" mechanism?', '["Androgen blocker", "5-alpha reductase inhibitor", "Aromatase inhibitor", "None"]', 1, 'Used off-label for severe hirsutism. (ACOG)'),
    ('80: "Acanthosis Nigricans" in a PCOS patient should prompt which test?', '["Biopsy", "Oral Glucose Tolerance Test (OGTT)", "Pap smear", "None"]', 1, 'Sign of significant insulin resistance. (Beckmann)'),
    ('81: "Anorexia Nervosa" - Amenorrhea is caused by a/an _____ level of Leptin.', '["High", "Low", "Normal", "None"]', 1, 'Leptin is needed for GnRH pulsatility. (Williams)'),
    ('82: "Congenital Adrenal Hyperplasia" (CAH) - Deficiency of which enzyme?', '["Aromatase", "21-hydroxylase", "Insulin", "None"]', 1, 'Leads to shunting of precursors to androgens. (Williams)'),
    ('83: "Late-onset CAH" - Typical presentation?', '["Ambigious genitalia at birth", "Hirsutism and irregular menses in adolescence/adulthood (mimics PCOS)", "Fever", "None"]', 1, 'Standard differential for PCOS. (ACOG)'),
    ('84: "Sertoli-Leydig Cell Tumor" - Hallmark finding?', '["Chronic acne", "Rapidly progressive virilization (e.g., clitoromegaly, voice deepening)", "Pain", "None"]', 1, 'Secretes extremely high levels of testosterone. (Williams)'),
    ('85: "Hyperprolactinemia" - If TSH is high, what is the cause?', '["Cancer", "Primary Hypothyroidism (TRH stimulates prolactin)", "PCOS", "None"]', 1, 'Always check TSH in the workup of high prolactin. (Beckmann)'),
    ('86: "Prolactinoma" and Pregnancy: Should Bromocriptine be continued?', '["Yes", "Usually stopped once pregnancy is confirmed (unless it''s a macroadenoma)", "None", "No"]', 1, 'Low risk of growth during pregnancy for microadenomas. (ACOG)'),
    ('87: "Primary Amenorrhea" - "Mullerian Agenesis" - Do they have normal "Pubic Hair"?', '["No", "Yes (adrenarche is normal)", "Only a little", "None"]', 1, 'Contrasts with AIS where hair is scant/absent. (Beckmann)'),
    ('88: "Androgen Insensitivity" (AIS) - Why is pubic hair scant?', '["Low testosterone", "Androgen receptors are non-functional", "High estrogen", "None"]', 1, 'Core pathophysiology. (Williams)'),
    ('89: "Turner Syndrome" - What happens to the "Streak Ovaries" after age 30?', '["They grow", "They have a high risk of \"Premature Ovarian Failure\" and usually don''t function from puberty", "None", "They disappear"]', 1, 'Most require HRT for puberty and bone health. (ACOG)'),
    ('90: "Amenorrhea" - "Progesterone Withdrawal" - If it occurs, you have ruled out:', '["Pregnancy", "Asherman syndrome and lack of estrogen", "Cancer", "None"]', 1, 'Indicates a functional axis up to the point of ovulation. (Beckmann)'),
    ('91: "Primary Amenorrhea" - First test after ruling out pregnancy?', '["CT", "Physical exam for secondary sexual characteristics (Breasts)", "Surgery", "None"]', 1, 'Determines the next step in the algorithm (FSH vs Anatomy). (ACOG)'),
    ('92: "Hirsutism" - "Ferriman-Gallwey" score > _____ is considered abnormal.', '["2", "8", "15", "None"]', 1, 'Standardized assessment tool. (Williams)'),
    ('93: "PCOS" - Does "Metformin" induce ovulation as well as Letrozole?', '["Yes", "No, it is less effective and not first-line for fertility", "Only in smokers", "None"]', 1, 'Current evidence favors Letrozole. (ACOG)'),
    ('94: "AUB" - A 55-year-old on "Tamoxifen" for breast cancer has spotting. Next step?', '["OCPs", "Endometrial Biopsy (Tamoxifen increases endometrial cancer risk)", "Observe", "None"]', 1, 'Crucial monitoring for breast cancer survivors. (Williams)'),
    ('95: "Dysmenorrhea" - "Primary" usually begins _____ years after menarche.', '["0", "1-2 (once ovulatory cycles are established)", "10", "None"]', 1, 'Core clinical history. (Beckmann)'),
    ('96: "NSAIDs" for dysmenorrhea should be started:', '["After pain is severe", "1-2 days before menses or at the first sign of bleeding", "Only if it fails", "None"]', 1, 'More effective if prostaglandins are inhibited early. (ACOG)'),
    ('97: "Endometrial Polyp" - Most common presenting symptom?', '["Pain", "Intermenstrual bleeding (Metrorrhagia)", "Amenorrhea", "None"]', 1, 'Small fleshy growth in the cavity. (Williams)'),
    ('98: "Adenomyosis" - Typical age?', '["Teens", "Parous women in their 40s", "Postmenopausal", "None"]', 1, 'Often found incidentally in hysterectomy specimens. (Beckmann)'),
    ('99: "Infertility" - "Clomiphene" - Most common side effect?', '["Weight gain", "Hot flashes (anti-estrogenic effect)", "Rash", "None"]', 1, 'Due to blocking receptors in the brain. (ACOG)'),
    ('100: "Infertility" - "Letrozole" - Does it have the same "Hot Flash" risk as Clomid?', '["Yes", "Lower (due to different mechanism of action)", "Higher", "None"]', 1, 'Often better tolerated by patients. (Williams)'),
    ('101: "Secondary Amenorrhea" - "Post-pill amenorrhea" definition?', '["No menses for 1 month", "Failure to resume menses within 3-6 months after stopping OCPs", "None", "Permanent"]', 1, 'Warrants workup if menses do not return. (Beckmann)'),
    ('102: "Amenorrhea" - "FSH" level in PCOS?', '["Very high", "Normal or Low (Classic increased LH:FSH ratio)", "Zero", "None"]', 1, 'Important hormonal pattern. (ACOG)'),
    ('103: "Endometriosis" and "CA-125"?', '["Screening test", "May be elevated but lacks specificity", "Diagnostic", "None"]', 1, 'Not for routine diagnosis. (Williams)'),
    ('104: "Infertility" - "HSG" - If both tubes are "dilated" and "blocked" at the distal end, it is called:', '["Normal", "Hydrosalpinx", "Fibroids", "None"]', 1, 'Often a sequela of PID. (Beckmann)'),
    ('105: "Hydrosalpinx" - Effect on IVF success?', '["No effect", "Decreases success by 50% (toxic fluid flows into the uterus); should be removed before IVF", "Increases it", "None"]', 1, 'Important pre-IVF surgical step. (ACOG)'),
    ('106: "Male Infertility" - "Azoospermia" means:', '["Low count", "Zero sperm in the ejaculate", "Slow sperm", "None"]', 1, 'Can be obstructive or non-obstructive. (WHO)'),
    ('107: "ICSI" (Intracytoplasmic Sperm Injection) involves:', '["Mixing in a dish", "Injecting a single sperm directly into an egg", "IUI", "None"]', 1, 'Revolutionized treatment for severe male factor. (Williams)'),
    ('108: "Infertility" - "Laparoscopy" is used to diagnose:', '["PCOS", "Endometriosis and Pelvic Adhesions", "Fibroids only", "None"]', 1, 'Direct visualization. (ACOG)'),
    ('109: "AUB" - "GNRH Agonists" are used to:', '["Cure polyps", "Temporarily stop bleeding/shrink fibroids before surgery", "Help pregnancy", "None"]', 1, 'Creates a hypoestrogenic state. (Beckmann)'),
    ('110: "Endometrial Hyperplasia" - "Complex Atypia" (EIN) has a _____ % risk of concurrent cancer.', '["1%", "10%", "Up to 30-40%", "100%"]', 2, 'Why hysterectomy is the standard of care. (ACOG)'),
    ('111: "PCOS" - Does it increase the risk of "Breast Cancer"?', '["Yes, significantly", "Potentially slightly due to increased estrogen/obesity, but not as strong as endometrial", "No", "None"]', 1, 'Data is less definitive than for endometrium. (Williams)'),
    ('112: "Hirsutism" - "Spironolactone" should NEVER be used in a patient who is:', '["Obese", "Pregnant or at risk for pregnancy (teratogenic)", "Tall", "None"]', 1, 'Important safety point. (Beckmann)'),
    ('113: "Primary Amenorrhea" - "Streak Ovaries" are a classic feature of:', '["AIS", "Turner Syndrome", "Mullerian agenesis", "None"]', 1, 'Core board fact. (ACOG)'),
    ('114: "Turner Syndrome" - What "Cardiovascular" anomaly is common?', '["ASD", "Coarctation of the aorta or Bicuspid aortic valve", "None", "VSD"]', 1, 'Requires screening with echo/MRI. (Williams)'),
    ('115: "Amenorrhea" - "TSH" and "Prolactin" are:', '["Last tests done", "Part of the standard initial laboratory evaluation", "Useless", "None"]', 1, 'Rule out common systemic causes early. (Beckmann)'),
    ('116: "AUB" - "Progestin" treatment works by:', '["Removing tissue", "Stabilizing the endometrium and counteracting estrogen-induced proliferation", "None", "Surgery"]', 1, 'Standard medical management. (ACOG)'),
    ('117: "Infertility" - "Weight" - BMI < _____ can cause anovulation.', '["18.5", "25", "30", "None"]', 0, 'Low body fat disrupts GnRH. (Williams)'),
    ('118: "Semen Analysis" - If abnormal, what is the next step?', '["Ignore", "Repeat in 2-4 weeks (sperm takes ~72 days to mature)", "Immediate surgery", "None"]', 1, 'Need to confirm persistence before labeling as a factor. (ACOG)'),
    ('119: "Infertility" - "Cervical Mucus" should be _____ and _____ during the fertile window.', '["Thick/Cloudy", "Thin/Clear and \"Stretchy\" (Spinnbarkeit)", "Dry", "None"]', 1, 'Facilitates sperm passage. (Beckmann)'),
    ('120: "AUB" - "Fibroids" - Which location is MOST likely to cause infertility?', '["Subserosal", "Submucosal (due to cavity distortion)", "Intramural", "None"]', 1, 'Directly affects implantation. (ACOG)');

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation)
    SELECT v_topic_id, question, options, correct_index, explanation
    FROM stage_mcqs s
    WHERE NOT EXISTS (
        SELECT 1 FROM mcqs m 
        WHERE m.topic_id = v_topic_id 
        AND m.question = s.question
    );

    DROP TABLE stage_mcqs;

    RAISE NOTICE 'SUCCESS: Batch 2 (61-120) MCQs for Menstrual Disorders & Infertility registered.';
END $$;
COMMIT;
