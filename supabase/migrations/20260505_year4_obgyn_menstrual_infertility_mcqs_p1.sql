BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-menstrual-infertility' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-menstrual-infertility not found.';
    END IF;

    -- Batch 1: 1-60 (AUB Classification and Workup)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '1: What is the FIGO system for classifying causes of AUB in non-pregnant women?', '["TNM", "PALM-COEIN", "Gleason", "None"]', 1, 'Standardized nomenclature for structural and non-structural causes. (ACOG)'),
    (v_topic_id, '2: In "PALM-COEIN", what does the "P" stand for?', '["Pregnancy", "Polyp", "Pain", "Puberty"]', 1, 'Endometrial or cervical polyps are common structural causes of AUB. (Williams Gynecology)'),
    (v_topic_id, '3: In "PALM-COEIN", the "A" stands for:', '["Anemia", "Adenomyosis", "Atrophy", "None"]', 1, 'Invasion of endometrial glands into the myometrium. (Beckmann)'),
    (v_topic_id, '4: In "PALM-COEIN", the "L" stands for:', '["Lichen", "Leiomyoma (Fibroids)", "Lupus", "None"]', 1, 'The most common benign tumors of the uterus. (ACOG)'),
    (v_topic_id, '5: In "PALM-COEIN", the "M" stands for:', '["Menopause", "Malignancy and Hyperplasia", "Miscarriage", "None"]', 1, 'Must always be ruled out in high-risk groups (e.g., postmenopausal). (Williams)'),
    (v_topic_id, '6: In "PALM-COEIN", the "C" (Non-structural) stands for:', '["Cushing", "Coagulopathy", "Cervicitis", "None"]', 1, 'Includes conditions like von Willebrand disease. (ACOG)'),
    (v_topic_id, '7: In "PALM-COEIN", the "O" stands for:', '["Obesity", "Ovulatory Dysfunction", "Ovarian cyst", "None"]', 1, 'Common in PCOS, thyroid disease, and adolescence. (Beckmann)'),
    (v_topic_id, '8: In "PALM-COEIN", the "E" stands for:', '["Estrogen", "Endometrial (primary dysfunction of the endometrium)", "Ectopic", "None"]', 1, 'Includes issues with local hemostasis. (Williams)'),
    (v_topic_id, '9: In "PALM-COEIN", the "I" stands for:', '["Infection", "Iatrogenic", "Idiopathic", "None"]', 1, 'Includes medication effects (e.g., anticoagulants, IUDs). (ACOG)'),
    (v_topic_id, '10: What is the definition of "Normal" menstrual cycle length?', '["14 days", "21 to 35 days", "28 days exactly", "None"]', 1, 'Variation outside this range warrants evaluation. (Beckmann)'),
    (v_topic_id, '11: "Menorrhagia" (Heavy Menstrual Bleeding) is defined as > _____ mL of blood loss per cycle.', '["20", "50", "80", "200"]', 2, 'Though clinical impact on the patient is now the primary metric. (ACOG)'),
    (v_topic_id, '12: "Metrorrhagia" refers to:', '["Heavy bleeding", "Bleeding between periods (Intermenstrual bleeding)", "No periods", "None"]', 1, 'Often associated with polyps or cancer. (Williams)'),
    (v_topic_id, '13: What is the "First-line" imaging for any woman with AUB?', '["CT scan", "Transvaginal Ultrasound (TVUS)", "MRI", "Hysteroscopy"]', 1, 'To assess endometrial thickness and uterine structure. (ACOG)'),
    (v_topic_id, '14: At what endometrial thickness (in mm) is a biopsy MANDATORY in a postmenopausal woman with bleeding?', '["1", "4", "10", "15"]', 1, 'Endometrium > 4mm in a postmenopausal bleeder is highly suspicious. (ACOG)'),
    (v_topic_id, '15: "Endometrial Biopsy" (EMB) is the gold standard for ruling out:', '["Fibroids", "Endometrial Hyperplasia and Carcinoma", "PID", "None"]', 1, 'Performed in the office with a Pipelle. (Beckmann)'),
    (v_topic_id, '16: "Saline Infusion Sonohysterography" (SIS) is superior to TVUS for detecting:', '["Ovarian cysts", "Intracavitary lesions (Polyps and Submucosal Fibroids)", "Adenomyosis", "None"]', 1, 'Fluid distends the cavity to provide better contrast. (Williams)'),
    (v_topic_id, '17: "Dilation and Curettage" (D&C) is both diagnostic and:', '["A permanent cure", "Therapeutic (can acutely stop heavy bleeding)", "A cause of cancer", "None"]', 1, 'Often done if EMB is non-diagnostic or bleeding is severe. (Beckmann)'),
    (v_topic_id, '18: "Amenorrhea" - Primary is absence of menses by age _____ with normal growth.', '["12", "15", "18", "None"]', 1, 'Or age 13 if no secondary sexual characteristics. (ACOG)'),
    (v_topic_id, '19: Most common cause of "Secondary Amenorrhea"?', '["PCOS", "Pregnancy", "Thyroid disease", "Menopause"]', 1, 'Always the first test to perform! (ACOG)'),
    (v_topic_id, '20: "Progesterone Challenge Test" - Bleeding after stopping the med suggests:', '["Anovulation (adequate estrogen but no progesterone)", "Uterine scarring", "No estrogen", "None"]', 0, 'Confirms the outflow tract is patent and the lining is primed. (Williams)'),
    (v_topic_id, '21: No bleeding after "Progesterone Challenge" AND subsequent "Estrogen/Progestin" challenge suggests:', '["PCOS", "Outflow tract obstruction (e.g., Asherman Syndrome or Cervical Stenosis)", "Pregnancy", "None"]', 1, 'The lining cannot bleed even with hormones. (Beckmann)'),
    (v_topic_id, '22: "Infertility" is defined as the inability to conceive after _____ of unprotected intercourse.', '["3 months", "6 months", "12 months (or 6 months if age > 35)", "2 years"]', 2, 'Standard clinical threshold for workup. (ACOG)'),
    (v_topic_id, '23: "Primary Infertility" means:', '["Never pregnant", "Pregnant once before", "Twins", "None"]', 0, 'Never achieved a clinical pregnancy. (Williams)'),
    (v_topic_id, '24: "Secondary Infertility" means:', '["Never pregnant", "Previous clinical pregnancy achieved, regardless of outcome", "Always twins", "None"]', 1, 'Patient has been pregnant before. (Beckmann)'),
    (v_topic_id, '25: What percentage of infertility cases are due to a "Male Factor"?', '["1%", "10%", "30-40%", "90%"]', 2, 'Workup must always include the male partner. (ACOG)'),
    (v_topic_id, '26: Most common cause of female factor infertility?', '["Tubal disease", "Ovulatory Dysfunction", "Endometriosis", "Uterine anomalies"]', 1, 'Usually due to PCOS or diminished ovarian reserve. (Beckmann)'),
    (v_topic_id, '27: "Hysterosalpingogram" (HSG) is the primary test to evaluate:', '["Ovulation", "Tubal Patency and Uterine Cavity", "Sperm count", "None"]', 1, 'Radiopaque dye is injected into the uterus. (Williams)'),
    (v_topic_id, '28: "Day 3 FSH" and "Anti-Mullerian Hormone" (AMH) are markers of:', '["Pregnancy", "Ovarian Reserve", "Ovulation", "None"]', 1, 'High FSH or low AMH suggests diminished reserve. (ACOG)'),
    (v_topic_id, '29: "Mid-luteal Progesterone" level (Day 21) > _____ ng/mL confirms ovulation.', '["1", "3", "10", "None"]', 1, 'Indicates a functional corpus luteum. (Beckmann)'),
    (v_topic_id, '30: First-line treatment for anovulatory infertility in PCOS (ACOG)?', '["Clomiphene", "Letrozole", "Metformin", "IVF"]', 1, 'Letrozole is superior to Clomiphene for live birth in PCOS. (ACOG)'),
    (v_topic_id, '31: "Clomiphene Citrate" (Clomid) works by:', '["Increasing LH directly", "Blocking estrogen receptors in the hypothalamus, increasing GnRH/FSH/LH", "Removing cysts", "None"]', 1, 'Tricks the brain into thinking estrogen is low. (Williams)'),
    (v_topic_id, '32: Major risk of "Ovulation Induction" (Clomid/Letrozole)?', '["Cancer", "Multiple Gestation (Twins/Triplets)", "Weight loss", "None"]', 1, 'Requires careful monitoring. (ACOG)'),
    (v_topic_id, '33: "Intrauterine Insemination" (IUI) involves:', '["Mixing eggs and sperm in a dish", "Placing washed sperm directly into the uterus", "Surgery", "None"]', 1, 'Bypasses cervical factors and improves timing. (Beckmann)'),
    (v_topic_id, '34: "In Vitro Fertilization" (IVF) is the primary treatment for:', '["Bilateral Tubal Occlusion", "Severe male factor", "Failed conservative therapy", "All of the above"]', 3, 'Highest success rates per cycle. (ACOG)'),
    (v_topic_id, '35: "Ovarian Hyperstimulation Syndrome" (OHSS) is a complication of:', '["IUDs", "IVF (gonadotropin stimulation)", "OCPs", "None"]', 1, 'Presents with ascites, electrolyte imbalance, and enlarged ovaries. (Williams)'),
    (v_topic_id, '36: "Polycystic Ovary Syndrome" (PCOS) - What happens to "Androgens"?', '["Lowered", "Elevated (Hyperandrogenism)", "Normal", "None"]', 1, 'Key diagnostic component. (ACOG)'),
    (v_topic_id, '37: "Secondary Dysmenorrhea" in a 40-year-old with a large, irregular uterus. Diagnosis?', '["Endometriosis", "Uterine Leiomyomas (Fibroids)", "PCOS", "None"]', 1, 'Standard clinical association. (Beckmann)'),
    (v_topic_id, '38: "Endometriosis" causes infertility primarily through:', '["No eggs", "Pelvic adhesions and inflammatory environment", "Weight gain", "None"]', 1, 'Distorts tubal-ovarian relationship. (ACOG)'),
    (v_topic_id, '39: "Semen Analysis" - Normal "Concentration" should be > _____ million/mL.', '["1", "5", "15", "100"]', 2, 'WHO 5th edition criteria. (WHO)'),
    (v_topic_id, '40: "Semen Analysis" - Normal "Morphology" (Kruger strict) should be > _____ % normal forms.', '["4", "20", "50", "80"]', 0, 'Shape of the sperm is critical for fertilization. (Beckmann)'),
    (v_topic_id, '41: "Dysfunctional Uterine Bleeding" (DUB) is now more accurately called:', '["Normal bleeding", "AUB-O (Ovulatory dysfunction)", "Infection", "None"]', 1, 'Legacy term for bleeding with no structural cause. (ACOG)'),
    (v_topic_id, '42: "AUB-M" (Malignancy) - What is the most important risk factor for endometrial cancer in a young woman?', '["Smoking", "Obesity (due to peripheral estrogen conversion)", "Exercise", "None"]', 1, 'Adipose tissue converts androgens to estrone. (Williams)'),
    (v_topic_id, '43: "AUB-P" (Polyp) - Can they be seen on a regular PAP smear?', '["Always", "No, they are usually intrauterine or endocervical and require imaging/hysteroscopy", "Yes", "None"]', 1, 'Standard diagnostic limitation. (Beckmann)'),
    (v_topic_id, '44: "Premature Ovarian Insufficiency" (POI) - Diagnosis confirmed by FSH > _____ IU/L on two occasions.', '["10", "40", "5", "None"]', 1, 'In a woman under age 40. (ACOG)'),
    (v_topic_id, '45: "Sheehan Syndrome" - Pituitary failure following:', '["High BP", "Postpartum Hemorrhage (hypovolemic shock causing necrosis)", "Infection", "None"]', 1, 'Classic board association. (Williams)'),
    (v_topic_id, '46: "Asherman Syndrome" - Diagnosis is best made by:', '["Ultrasound", "Hysteroscopy or HSG", "Blood test", "None"]', 1, 'Shows intrauterine adhesions. (ACOG)'),
    (v_topic_id, '47: "Hypogonadotropic Hypogonadism" is characterized by:', '["Low FSH and Low Estrogen", "High FSH and Low Estrogen", "High FSH and High Estrogen", "None"]', 0, 'Central cause (Hypothalamus/Pituitary failure). (Beckmann)'),
    (v_topic_id, '48: "Hypergonadotropic Hypogonadism" is characterized by:', '["Low FSH", "High FSH and Low Estrogen", "Normal FSH", "None"]', 1, 'Primary Ovarian Failure. (Williams)'),
    (v_topic_id, '49: "Turner Syndrome" (45, X) - Primary clinical feature?', '["Tall stature", "Short stature, webbed neck, and streak ovaries", "Obesity", "None"]', 1, 'Causes primary amenorrhea. (ACOG)'),
    (v_topic_id, '50: "Androgen Insensitivity Syndrome" (AIS) - Karyotype?', '["46, XX", "46, XY", "47, XXY", "None"]', 1, 'Genetically male but phenotypically female. (Beckmann)'),
    (v_topic_id, '51: "AUB-C" (Coagulopathy) - Most common inherited bleeding disorder?', '["Hemophilia A", "von Willebrand Disease", "Protein C deficiency", "None"]', 1, 'Commonly presents as heavy menstrual bleeding starting at menarche. (ACOG)'),
    (v_topic_id, '52: "Acute AUB" - If a patient is hemodynamically unstable from bleeding, first step?', '["Oral meds", "IV fluids, blood products, and potentially IV Estrogen or emergency D&C", "Wait", "None"]', 1, 'Emergency stabilization. (Williams)'),
    (v_topic_id, '53: "Tranexamic Acid" (Lysteda) works by:', '["Killing glands", "Antifibrinolytic (stabilizes clots)", "Increasing estrogen", "None"]', 1, 'Non-hormonal option for HMB. (ACOG)'),
    (v_topic_id, '54: "Endometrial Ablation" is contraindicated in women who:', '["Are obese", "Desire future pregnancy", "Have a history of C-section", "None"]', 1, 'Causes severe pregnancy complications. (Beckmann)'),
    (v_topic_id, '55: "Infertility" - "Basal Body Temperature" (BBT) charts measure:', '["Estrogen", "Progesterone-induced rise in temperature after ovulation", "LH surge", "None"]', 1, 'Retrospective marker of ovulation. (Williams)'),
    (v_topic_id, '56: "Ovulation Predictor Kits" (OPKs) detect which hormone in urine?', '["Estrogen", "LH (Luteinizing Hormone)", "FSH", "hCG"]', 1, 'Predicts ovulation within 24-36 hours. (ACOG)'),
    (v_topic_id, '57: "Infertility" - "Post-coital Test" (PCT) is:', '["Standard of care", "Historical; no longer recommended due to poor reliability", "Always used", "None"]', 1, 'Check for sperm-mucus interaction. (Beckmann)'),
    (v_topic_id, '58: "Unexplained Infertility" - Occurs in what percentage of couples?', '["0%", "10-25%", "50%", "None"]', 1, 'Standard workup yields no clear cause. (ACOG)'),
    (v_topic_id, '59: "Sperm Washing" is done for IUI to remove _____ which cause uterine cramping.', '["Sperm", "Prostaglandins", "Water", "None"]', 1, 'Ensures a safer and more effective procedure. (Williams)'),
    (v_topic_id, '60: "Varicocele" - A common cause of _____ factor infertility.', '["Female", "Male (due to increased scrotal temperature)", "Both", "None"]', 1, 'Surgical repair may improve semen parameters. (ACOG)');

    RAISE NOTICE 'SUCCESS: Batch 1 (1-60) MCQs for Menstrual Disorders & Infertility registered.';
END $$;
COMMIT;
