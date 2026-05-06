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

    -- Batch 3: 121-180 (Infertility Workup, Endometriosis, PCOS, and ART)
    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('121: "Infertility" is formally defined as the failure to conceive after _____ of unprotected, regular intercourse in women under age 35.', '["6 months", "12 months", "18 months", "24 months"]', 1, 'In women >35, the timeframe is reduced to 6 months to expedite workup. (ACOG)'),
    ('122: In a 38-year-old woman presenting with infertility for 7 months, what is the initial appropriate step?', '["Reassure and wait 5 more months", "Begin infertility workup immediately", "Proceed directly to IVF", "Start Clomiphene"]', 1, 'Because she is >35 and has tried for >6 months. (ACOG)'),
    ('123: What is the most common cause of "Male Factor" infertility?', '["Klinefelter syndrome", "Idiopathic (unexplained)", "Varicocele", "Cystic Fibrosis"]', 2, 'Varicocele is the most common identifiable/correctable cause. (WHO)'),
    ('124: Which parameter is NOT routinely evaluated on a standard basic Semen Analysis?', '["Concentration (Count)", "Motility", "Morphology", "DNA Fragmentation"]', 3, 'DNA fragmentation is an advanced test, not part of the initial screening. (WHO)'),
    ('125: According to WHO criteria, normal sperm motility requires at least what percentage of sperm to be progressively motile?', '["10%", "32%", "50%", "75%"]', 1, 'Standard WHO lower reference limit. (WHO)'),
    ('126: "Azoospermia" means:', '["Low sperm count", "Poor sperm motility", "No sperm present in the ejaculate", "Abnormal sperm shape"]', 2, 'Requires differentiation between obstructive and non-obstructive causes. (Beckmann)'),
    ('127: A patient with congenital bilateral absence of the vas deferens (CBAVD) most likely has mutations in which gene?', '["BRCA1", "CFTR", "FMR1", "SRY"]', 1, 'CBAVD is a mild phenotypic variant of Cystic Fibrosis. (Williams)'),
    ('128: What is the most common cause of "Ovulatory Dysfunction" leading to female infertility?', '["Premature Ovarian Insufficiency (POI)", "Polycystic Ovary Syndrome (PCOS)", "Hypothalamic amenorrhea", "Hyperprolactinemia"]', 1, 'PCOS accounts for the vast majority of anovulatory infertility. (ACOG)'),
    ('129: Which of the following best assesses "Ovarian Reserve"?', '["Day 3 FSH, Day 3 Estradiol, and AMH (Anti-Mullerian Hormone)", "Day 21 Progesterone", "Endometrial biopsy", "Prolactin level"]', 0, 'AMH is now widely used as it can be drawn on any day of the cycle. (Beckmann)'),
    ('130: An elevated Day 3 FSH level (>10-15 mIU/mL) indicates:', '["PCOS", "Diminished Ovarian Reserve (DOR)", "Normal ovulation", "Pregnancy"]', 1, 'Indicates the pituitary is working harder to stimulate the ovaries. (Williams)'),
    ('131: "AMH" is produced by:', '["The pituitary gland", "The corpus luteum", "Granulosa cells of preantral and small antral follicles", "The endometrium"]', 2, 'AMH levels correlate directly with the size of the primordial follicle pool. (ACOG)'),
    ('132: What is the standard diagnostic test to evaluate "Tubal Patency" in an infertility workup?', '["Pelvic Ultrasound", "Hysterosalpingogram (HSG)", "MRI pelvis", "Endometrial biopsy"]', 1, 'HSG outlines the uterine cavity and fallopian tubes using contrast. (Beckmann)'),
    ('133: If an HSG shows "Bilateral proximal tubal occlusion," what is a potential non-pathologic cause?', '["Endometriosis", "Tubal spasm during the procedure", "Prior appendicitis", "PID"]', 1, 'Spasm at the cornua can mimic true occlusion. (Williams)'),
    ('134: Which STI is the leading infectious cause of tubal factor infertility?', '["Syphilis", "Herpes Simplex Virus", "Chlamydia trachomatis", "HPV"]', 2, 'Often asymptomatic but causes severe tubal scarring. (ACOG)'),
    ('135: The primary mechanism by which "Endometriosis" causes infertility in advanced stages is:', '["Ovulatory dysfunction", "Distortion of pelvic anatomy and tubal adhesions", "Cervical factor", "Hypothyroidism"]', 1, 'Anatomic distortion prevents ovum pickup. (Beckmann)'),
    ('136: A "Chocolate cyst" on ultrasound is pathognomonic for:', '["PCOS", "Endometrioma", "Dermoid cyst", "Corpus luteum"]', 1, 'A cyst containing old, thick, brown blood from endometriosis. (Williams)'),
    ('137: First-line medical treatment to induce ovulation in a patient with PCOS who desires pregnancy is:', '["Letrozole or Clomiphene Citrate", "IVF", "Spironolactone", "Oral Contraceptives"]', 0, 'Letrozole (aromatase inhibitor) is now favored for PCOS over Clomiphene. (ACOG)'),
    ('138: How does "Letrozole" work to induce ovulation?', '["It directly stimulates the ovary", "It inhibits aromatase, lowering systemic estrogen, which reduces negative feedback and increases FSH release", "It acts as an LH analog", "None"]', 1, 'Increases endogenous FSH drive. (Beckmann)'),
    ('139: "Clomiphene Citrate" induces ovulation by:', '["Acting as a Selective Estrogen Receptor Modulator (SERM) that blocks estrogen receptors in the hypothalamus", "Directly stimulating follicles", "Decreasing FSH", "Increasing prolactin"]', 0, 'The hypothalamus "perceives" low estrogen and releases more GnRH. (Williams)'),
    ('140: What is a classic visual side effect associated with Clomiphene use?', '["Blindness", "Scintillating scotomas / visual flashes (requires stopping the drug)", "Cataracts", "Glaucoma"]', 1, 'A known adverse effect that warrants discontinuation. (ACOG)'),
    ('141: What is the risk of "Multiple Gestation" with Clomiphene?', '["< 1%", "~8-10% (mostly twins)", "> 50%", "0%"]', 1, 'Patients must be counseled about the risk of twins. (Beckmann)'),
    ('142: "Intrauterine Insemination" (IUI) is most appropriate for which indication?', '["Bilateral tubal blockage", "Severe male factor (azoospermia)", "Mild male factor or unexplained infertility", "Uterine agenesis"]', 2, 'Bypasses the cervix and places washed sperm high in the uterus. (ACOG)'),
    ('143: "IVF" (In Vitro Fertilization) is the mandatory first-line treatment for which condition?', '["PCOS", "Bilateral tubal factor infertility", "Mild endometriosis", "Unexplained infertility"]', 1, 'Since the tubes are blocked, fertilization must happen in the lab. (Williams)'),
    ('144: "ICSI" (Intracytoplasmic Sperm Injection) is primarily indicated for:', '["Tubal factor", "PCOS", "Severe male factor infertility", "Endometriosis"]', 2, 'A single sperm is directly injected into the oocyte. (Beckmann)'),
    ('145: What is the most severe, life-threatening complication of ovulation induction (especially with injectable gonadotropins)?', '["PCOS", "Ovarian Hyperstimulation Syndrome (OHSS)", "Ovarian cancer", "Ectopic pregnancy"]', 1, 'Characterized by massive ovarian enlargement and fluid shifts (ascites, pleural effusion). (ACOG)'),
    ('146: OHSS is driven by the overexpression of which vascular mediator?', '["VEGF (Vascular Endothelial Growth Factor)", "Prostaglandins", "TNF-alpha", "Interleukin-1"]', 0, 'Leads to massive capillary leak. (Williams)'),
    ('147: To prevent OHSS in a high-risk IVF patient, the provider might trigger ovulation with _____ instead of hCG.', '["Progesterone", "A GnRH agonist (e.g., Leuprolide)", "Estrogen", "Clomiphene"]', 1, 'GnRH agonist trigger significantly reduces OHSS risk. (Beckmann)'),
    ('148: Preimplantation Genetic Testing (PGT) during IVF can be used to screen for:', '["Aneuploidy (e.g., Down syndrome)", "Single gene disorders (e.g., Cystic Fibrosis)", "Structural chromosomal rearrangements", "All of the above"]', 3, 'Allows transfer of euploid/unaffected embryos. (ACOG)'),
    ('149: "Unexplained Infertility" is diagnosed when:', '["Semen analysis is normal", "Ovulation is normal", "Tubes are patent", "All of the above are true but the couple cannot conceive"]', 3, 'A diagnosis of exclusion. (Beckmann)'),
    ('150: The standard initial treatment for "Unexplained Infertility" is:', '["Immediate IVF", "Clomiphene/Letrozole combined with IUI", "Tubal surgery", "Adoption"]', 1, 'Empiric treatment to increase the number of targets (eggs) and bullets (sperm). (ACOG)'),
    ('151: "Hypothalamic Amenorrhea" is characterized by:', '["High FSH, Low Estrogen", "Low/Normal FSH, Low Estrogen", "High LH, High Androgens", "High Prolactin"]', 1, 'The hypothalamus fails to release GnRH (e.g., due to stress, anorexia, exercise). (Williams)'),
    ('152: Which medication can induce ovulation in Hypothalamic Amenorrhea by acting directly as an FSH/LH substitute?', '["Clomiphene", "Letrozole", "Exogenous Gonadotropins (hMG / FSH)", "Metformin"]', 2, 'Because the hypothalamus is shut down, oral meds (Clomiphene/Letrozole) often don''t work. (Beckmann)'),
    ('153: A woman with recurrent early miscarriages (Recurrent Pregnancy Loss) should be screened for which autoimmune condition?', '["Rheumatoid Arthritis", "Antiphospholipid Syndrome (APS)", "Multiple Sclerosis", "Type 1 Diabetes"]', 1, 'APS causes placental thrombosis. (ACOG)'),
    ('154: The classic treatment for Antiphospholipid Syndrome in pregnancy is:', '["High dose steroids", "Low-dose aspirin and prophylactic Heparin/LMWH", "Methotrexate", "Warfarin"]', 1, 'Improves live birth rates significantly. (Williams)'),
    ('155: A "Septate Uterus" is associated with an increased risk of:', '["Infertility (failure to conceive)", "Recurrent first-trimester miscarriage", "PCOS", "Ectopic pregnancy"]', 1, 'The septum has poor blood supply, leading to implantation failure/miscarriage. (Beckmann)'),
    ('156: How is a "Septate Uterus" treated to improve pregnancy outcomes?', '["Hysteroscopic resection of the septum", "Abdominal surgery (laparotomy)", "OCPs", "IVF"]', 0, 'A simple outpatient hysteroscopic procedure. (ACOG)'),
    ('157: "Asherman Syndrome" causes secondary amenorrhea due to:', '["Pituitary failure", "Intrauterine adhesions (synechiae) destroying the basal endometrium", "Ovarian failure", "Cervical stenosis"]', 1, 'Usually following a D&C for postpartum hemorrhage or retained products. (Williams)'),
    ('158: Diagnosis of Asherman Syndrome is best confirmed by:', '["Ultrasound", "Hysteroscopy", "MRI", "CT scan"]', 1, 'Allows direct visualization and concurrent lysis of adhesions. (Beckmann)'),
    ('159: "Cervical Factor" infertility can be caused by:', '["Prior cervical conization/LEEP destroying mucus glands", "Endometriosis", "PCOS", "Fibroids"]', 0, 'Lack of estrogenic mucus prevents sperm survival. (Williams)'),
    ('160: What is the treatment for isolated "Cervical Factor" infertility?', '["IVF", "Intrauterine Insemination (IUI)", "Clomiphene", "Surgery"]', 1, 'IUI bypasses the cervical mucus entirely. (Beckmann)'),
    ('161: "Submucosal Fibroids" (FIGO Type 0, 1, 2) can cause infertility by:', '["Blocking ovulation", "Distorting the uterine cavity and interfering with implantation", "Killing sperm", "Lowering estrogen"]', 1, 'They protrude into the cavity. (ACOG)'),
    ('162: What is the preferred treatment for a symptomatic submucosal fibroid in a patient desiring future fertility?', '["Hysterectomy", "Uterine Artery Embolization (UAE)", "Hysteroscopic Myomectomy", "Ablation"]', 2, 'UAE is generally avoided in patients desiring future pregnancy. (ACOG)'),
    ('163: "Luteal Phase Defect" refers to:', '["Excessive estrogen", "Inadequate progesterone production by the corpus luteum", "High FSH", "Failure to ovulate"]', 1, 'Leads to poor endometrial preparation for implantation. (Williams)'),
    ('164: "Hyperprolactinemia" causes infertility by:', '["Destroying the ovaries", "Inhibiting GnRH pulsatility, leading to anovulation", "Blocking the fallopian tubes", "Causing fibroids"]', 1, 'Treated with Dopamine Agonists (Bromocriptine/Cabergoline). (Beckmann)'),
    ('165: A patient has milky nipple discharge, amenorrhea, and a negative pregnancy test. Prolactin is 150 ng/mL. Next step?', '["Breast biopsy", "MRI of the Brain (Pituitary)", "Ovarian ultrasound", "Reassurance"]', 1, 'Rule out a prolactinoma. (ACOG)'),
    ('166: "Sheehan Syndrome" is a cause of secondary amenorrhea due to:', '["Postpartum hemorrhage leading to pituitary necrosis", "Genetic defect", "Autoimmune destruction", "Tumor"]', 0, 'Patient presents with failure to lactate and amenorrhea after a severe PPH. (Williams)'),
    ('167: A patient with severe, uncontrolled Hypothyroidism can present with:', '["PCOS", "Amenorrhea/Oligo-ovulation and elevated Prolactin", "Ovarian failure", "Turner syndrome"]', 1, 'High TRH stimulates both TSH and Prolactin. (Beckmann)'),
    ('168: "Premature Ovarian Insufficiency" (POI) is defined as menopause before age:', '["30", "35", "40", "45"]', 2, 'Characterized by amenorrhea, estrogen deficiency, and FSH in the menopausal range. (ACOG)'),
    ('169: Women with Fragile X premutation (FMR1) are at increased risk for:', '["PCOS", "Endometriosis", "Premature Ovarian Insufficiency (POI)", "Fibroids"]', 2, 'A known genetic link to POI. (Williams)'),
    ('170: Treatment for POI in a 32-year-old woman should include:', '["Clomiphene", "Hormone Replacement Therapy (Estrogen + Progestin) to protect bones and heart", "Testosterone", "Nothing"]', 1, 'HRT is recommended until the natural age of menopause (~50). (ACOG)'),
    ('171: If a woman with complete POI desires pregnancy, what is her best option?', '["Clomiphene", "Letrozole", "IVF with Donor Oocyte", "IUI"]', 2, 'Her own oocytes are depleted, so she needs a donor egg. (Beckmann)'),
    ('172: "Primary Amenorrhea" is defined as the absence of menses by age _____ with NO secondary sexual characteristics.', '["11", "13", "15", "16"]', 1, 'Requires evaluation for delayed puberty. (ACOG)'),
    ('173: "Primary Amenorrhea" is defined as the absence of menses by age _____ IF secondary sexual characteristics ARE present.', '["13", "15", "18", "21"]', 1, 'If breasts are present, she has estrogen, so wait until 15. (ACOG)'),
    ('174: A 15-year-old with primary amenorrhea, absent breasts, and a webbed neck. Diagnosis?', '["PCOS", "Turner Syndrome (45,X)", "AIS", "MRKH"]', 1, 'Streak ovaries fail to produce estrogen. (Beckmann)'),
    ('175: A 16-year-old with primary amenorrhea, normal breasts, absent uterus, and absent axillary/pubic hair. Karyotype is 46,XY. Diagnosis?', '["Turner Syndrome", "Mullerian Agenesis (MRKH)", "Complete Androgen Insensitivity Syndrome (AIS)", "PCOS"]', 2, 'Receptors don''t respond to testosterone; estrogen comes from aromatized testosterone. (Williams)'),
    ('176: In Complete Androgen Insensitivity Syndrome (AIS), what must be done with the gonads (testes)?', '["Leave them forever", "Surgical removal (gonadectomy) after puberty to prevent malignancy", "Remove immediately at birth", "Radiation"]', 1, 'High risk of germ cell tumors; delayed until after puberty to allow breast development. (ACOG)'),
    ('177: A patient has secondary amenorrhea. A "Progestin Challenge Test" results in NO withdrawal bleeding. This indicates:', '["PCOS", "Low estrogen state or outflow tract obstruction", "Normal ovulation", "Pregnancy"]', 1, 'The endometrium was not primed by estrogen, or blood cannot exit (e.g., Asherman). (Beckmann)'),
    ('178: A patient with secondary amenorrhea takes a combined Estrogen-Progestin cycle and still has NO withdrawal bleeding. This confirms:', '["PCOS", "Outflow tract obstruction (e.g., Asherman Syndrome)", "Hypothalamic failure", "Ovarian failure"]', 1, 'Even with hormones, the lining cannot shed. (Williams)'),
    ('179: "Kallmann Syndrome" causes primary amenorrhea due to:', '["Ovarian failure", "Defective GnRH migration and Anosmia (lack of smell)", "Uterine absence", "Enzyme deficiency"]', 1, 'A classic board scenario linking anosmia and amenorrhea. (Beckmann)'),
    ('180: "Oocyte Cryopreservation" (Egg freezing) is recommended for fertility preservation in women facing:', '["Divorce", "Gonadotoxic therapies (e.g., Chemotherapy/Radiation)", "Stress", "PCOS"]', 1, 'A critical medical indication for ART. (ASRM)');

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation)
    SELECT v_topic_id, question, options, correct_index, explanation
    FROM stage_mcqs s
    WHERE NOT EXISTS (
        SELECT 1 FROM mcqs m 
        WHERE m.topic_id = v_topic_id 
        AND m.question = s.question
    );

    DROP TABLE stage_mcqs;

    RAISE NOTICE 'SUCCESS: Batch 3 (121-180) MCQs for Menstrual Disorders & Infertility registered.';
END $$;
COMMIT;
