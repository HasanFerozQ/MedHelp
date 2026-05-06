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

    -- Batch 5: 241-300 (Advanced AUB, RPL, and Infertility Ethics)
    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('241: "Recurrent Pregnancy Loss" (RPL) is now defined as _____ or more consecutive clinical pregnancy losses.', '["1", "2", "3", "5"]', 1, 'Updated ASRM criteria. (ASRM)'),
    ('242: Most common cause of RPL?', '["Uterine anomalies", "Parental chromosomal abnormalities (e.g., balanced translocations)", "Thyroid disease", "Infection"]', 1, 'Karyotyping of both parents is a key part of the workup. (ACOG)'),
    ('243: "Antiphospholipid Syndrome" (APS) - Associated with RPL?', '["No", "Yes (one of the few treatable causes)", "Only in GDM", "None"]', 1, 'Requires treatment with aspirin and heparin. (Williams)'),
    ('244: "Uterine Septum" - Is it a cause of RPL?', '["No", "Yes (most common structural cause of RPL)", "Only in twins", "None"]', 1, 'Poor vascularization of the septum leads to early loss. (Beckmann)'),
    ('245: "AUB" - "FIGO Classification" - What does "I" stand for?', '["Infection", "Iatrogenic", "Infertility", "None"]', 1, 'Includes medications and IUD effects. (ACOG)'),
    ('246: "AUB" - "FIGO Classification" - What does "N" stand for?', '["Normal", "Not otherwise classified (e.g., AVMs)", "None", "Neonatal"]', 1, 'Reserved for rare or poorly understood pathologies. (ACOG)'),
    ('247: "Secondary Amenorrhea" - "Premature Ovarian Insufficiency" (POI) - FSH level is usually > _____ IU/L.', '["5", "10", "40 (on two tests 4 weeks apart)", "100"]', 2, 'In a woman < 40 years old. (ACOG)'),
    ('248: "POI" - What is the risk of "Osteoporosis"?', '["None", "Significantly increased due to early hypoestrogenism", "Reduced", "None"]', 1, 'HRT is mandatory until age 50. (Williams)'),
    ('249: "Infertility" - "Surrogacy" - "Traditional" vs "Gestational"?', '["Traditional uses surrogate''s egg; Gestational uses intended parents'' embryo", "They are the same", "None", "Only for men"]', 0, 'Legal and ethical differences. (ASRM)'),
    ('250: "Infertility Ethics" - "Embryo Disposition": What happens to unused embryos?', '["Always destroyed", "Donated, discarded, or stored indefinitely based on parents'' wishes", "None", "Sold"]', 1, 'Requires careful legal documentation before IVF. (ASRM)'),
    ('251: "AUB" - "Acute" bleeding - "Dilation and Curettage" (D&C) is most useful when:', '["Medical therapy fails or patient is unstable", "Always first step", "None", "In teens"]', 0, 'Acutely removes the bleeding tissue. (Williams)'),
    ('252: "Hirsutism" - "Polycystic Ovary Syndrome" (PCOS) - Does "Metformin" treat hair growth?', '["Yes, first-line", "No (not effective for hirsutism compared to OCPs/Spironolactone)", "Only in smokers", "None"]', 1, 'Used for metabolic/ovulatory issues. (ACOG)'),
    ('253: "Amenorrhea" - "Galactorrhea" - If Prolactin is slightly high (25-50), what is the first step?', '["MRI", "Repeat fasting prolactin and rule out stimulation/medications", "Surgery", "None"]', 1, 'Prolactin is sensitive to stress/touch. (Beckmann)'),
    ('254: "Infertility" - "Male Factor" - "Sperm Concentration" < _____ million/mL is Oligozoospermia.', '["15", "50", "100", "None"]', 0, 'WHO criteria. (WHO)'),
    ('255: "Infertility" - "Male Factor" - "Retrograde Ejaculation" treatment?', '["Surgery", "Alkalinization of urine and retrieval of sperm from urine for IUI", "None", "Wait"]', 1, 'Allows for use of the sperm. (Williams)'),
    ('256: "AUB" - "Leiomyoma" - "Fibroid" shrinkage after menopause?', '["They grow", "They typically shrink", "No change", "None"]', 1, 'Due to loss of estrogen stimulation. (ACOG)'),
    ('257: "Amenorrhea" - "Asherman Syndrome" - Can it be cured?', '["Never", "Yes, with hysteroscopic adhesiolysis and hormonal therapy", "Only in teens", "None"]', 1, 'Success depends on the extent of scarring. (Beckmann)'),
    ('258: "Infertility" - "Donor Eggs" - Success rate is determined by the age of the _____?', '["Intended mother", "Donor", "Father", "None"]', 1, 'Egg age is the critical factor. (ASRM)'),
    ('259: "AUB" - "Uterine Artery Embolization" (UAE) - Risk of "Premature Ovarian Failure"?', '["0%", "Low but real (~1-5%), especially in women > 40", "100%", "None"]', 1, 'Nontarget embolization of the ovarian artery. (Williams)'),
    ('260: "Amenorrhea" - "Kallmann Syndrome" - Why is it associated with "Cleft Palate"?', '["None", "Shared developmental origins of GnRH neurons and facial structures", "Infection", "None"]', 1, 'Classic embryological link. (Beckmann)'),
    ('261: "AUB" - "Tranexamic Acid" - Can it be taken with OCPs?', '["Yes", "Cautiously, though FDA label suggests avoiding due to theoretical thrombosis risk", "No", "None"]', 1, 'Often avoided as a combination. (ACOG)'),
    ('262: "Infertility" - "Endometriosis" - Stage IV disease. Best approach for pregnancy?', '["IUI", "IVF (bypass the severe adhesions and tubal damage)", "OCPs", "None"]', 1, 'Surgery may also be needed for pain. (Beckmann)'),
    ('263: "Hirsutism" - "Sertoli-Leydig tumor" - Are they usually "Unilateral" or "Bilateral"?', '["Bilateral", "Unilateral (95%)", "None", "Multiple"]', 1, 'Standard pathological finding. (Williams)'),
    ('264: "AUB" - "Acute" bleeding in an adolescent. Most common cause after ruling out pregnancy?', '["Cancer", "Anovulation (AUB-O) or Coagulopathy (AUB-C)", "Fibroids", "None"]', 1, 'Immature axis or vWD. (ACOG)'),
    ('265: "Amenorrhea" - "Hyperprolactinemia" - Effect on "Bone"?', '["Strengthens", "Worsens bone density (due to low estrogen)", "None", "Infection"]', 1, 'Hypogonadism leads to bone loss. (Beckmann)'),
    ('266: "Infertility" - "Male Factor" - "Scrotal Ultrasound" is used to diagnose:', '["PCOS", "Varicocele and Testicular masses", "None", "IUD"]', 1, 'Part of the male workup. (WHO)'),
    ('267: "AUB" - "Adenomyosis" - Classic physical exam finding?', '["Small uterus", "Globular, symmetrically enlarged and \"boggy\" uterus", "None", "Hard mass"]', 1, 'Feels like a soft, diffuse enlargement compared to hard, lumpy fibroids. (Williams)'),
    ('268: "Amenorrhea" - "Turner Syndrome" - "Karyotype" for classical Turner?', '["46, XX", "45, X", "47, XXY", "None"]', 1, 'Only one X chromosome. (ACOG)'),
    ('269: "Infertility" - "Tubal Ligation" - Is it a risk factor for Ectopic pregnancy?', '["No", "Yes, if the ligation fails", "Only if parous", "None"]', 1, 'Partial re-canalization. (Williams)'),
    ('270: "AUB" - "Mirena" IUD - What happens to "Hemoglobin" levels?', '["Drop", "Typically increase as menstrual blood loss decreases", "None", "Zero"]', 1, 'Helps treat anemia. (Beckmann)'),
    ('271: "Hirsutism" - "Cushing Syndrome" - Screening test?', '["FSH", "24-hour urinary free cortisol or Dexamethasone suppression test", "Pap smear", "None"]', 1, 'Endocrine workup. (ACOG)'),
    ('272: "AUB" - "Endometrial Biopsy" - Sensitivity for detecting cancer?', '["10%", "50%", "> 90% (if the cancer is global)", "100%"]', 2, 'May miss focal lesions (why SIS/Hysteroscopy is needed if symptoms persist). (Williams)'),
    ('273: "Amenorrhea" - "Secondary" - FSH is high. Estrogen is low. Next test?', '["Karyotype (if < 30) or Fragile X testing", "Surgery", "OCPs", "None"]', 0, 'Workup for POI. (ACOG)'),
    ('274: "Infertility" - "IVF" - "Embryo Transfer" occurs on Day _____ or Day _____?', '["1 / 2", "3 or 5 (Blastocyst)", "10 / 14", "None"]', 1, 'Based on embryo development. (Beckmann)'),
    ('275: "AUB" - "Fibroids" - "Red Degeneration" management?', '["Surgery", "NSAIDs and observation (it is an aseptic infarction)", "Antibiotics", "None"]', 1, 'Usually resolves in a week. (Williams)'),
    ('276: "Amenorrhea" - "Prolactinoma" - "Visual fields": Which one is affected?', '["Central", "Bitemporal Hemianopsia", "None", "Color"]', 1, 'High-yield neuro finding. (Beckmann)'),
    ('277: "Infertility" - "PCOS" - Does "Metformin" reduce "OHSS" risk?', '["No", "Yes, in IVF patients with PCOS", "Only in smokers", "None"]', 1, 'Evidence-based benefit. (ACOG)'),
    ('278: "Hirsutism" - "Vellus" hair?', '["Thick", "Fine, soft, and unpigmented", "Long", "None"]', 1, 'Standard description. (Williams)'),
    ('279: "AUB" - "AUB-O" (Ovulatory) - Hallmark clinical feature?', '["Regular cycles", "Irregular, unpredictable, and often heavy bleeding", "No bleeding", "None"]', 1, 'Due to lack of cyclic progesterone. (ACOG)'),
    ('280: "Infertility" - "Surrogacy" - "Gestational Carrier" vs "Traditional": Which is more legally complex?', '["Gestational", "Traditional (as the carrier is the genetic mother)", "Same", "None"]', 1, 'Highly discouraged in many jurisdictions. (ASRM)'),
    ('281: "AUB" - "Endometrial Cancer" - Average age of diagnosis?', '["20", "40", "60 (Postmenopausal)", "None"]', 2, 'Mainly a disease of older women. (ACOG)'),
    ('282: "Amenorrhea" - "Kallmann" - Why "Anosmia"?', '["Infection", "Shared pathway of GnRH and olfactory nerve development", "None", "Surgery"]', 1, 'Congenital anomaly. (Beckmann)'),
    ('283: "Infertility" - "Male Factor" - "ICSI" - Can it be used with "testicular sperm" (TESE)?', '["No", "Yes, for obstructive azoospermia", "Only if parous", "None"]', 1, 'Sperm retrieved directly from the testis. (WHO)'),
    ('284: "AUB" - "Leiomyoma" - "Submucosal" (FIGO Type 0)?', '["Outside", "Completely within the uterine cavity", "Inside wall", "None"]', 1, 'Most likely to cause bleeding. (ACOG)'),
    ('285: "Amenorrhea" - "Post-pill" - Most common cause?', '["Cancer", "Resumption of underlying cycle irregularity that was masked by the pill", "IUD", "None"]', 1, 'Standard clinical explanation. (Beckmann)'),
    ('286: "Infertility" - "Endometrioma" removal - Effect on "AMH"?', '["Increases", "Decreases (can damage healthy ovarian tissue)", "None", "Zero"]', 1, 'Surgical risk to ovarian reserve. (ACOG)'),
    ('287: "Hirsutism" - "PCOS" - Does "Clomid" treat hair?', '["Yes", "No", "Only if smokers", "None"]', 1, 'Used for ovulation induction only. (Williams)'),
    ('288: "AUB" - "Endometrial thickness" > _____ mm in PREmenopausal woman warrants biopsy?', '["4", "15-20 (if persistent and symptomatic)", "1", "None"]', 1, 'Threshold is much higher than in postmenopausal women. (ACOG)'),
    ('289: "Amenorrhea" - "Primary" - If a uterus is PRESENT and FSH is LOW?', '["Turner", "Hypogonadotropic Hypogonadism (Central)", "AIS", "None"]', 1, 'Due to brain/pituitary failure. (Beckmann)'),
    ('290: "Infertility" - "Luteal Phase Defect" - Possible treatment?', '["Estrogen", "Progesterone supplementation in the luteal phase", "None", "Surgery"]', 1, 'To support the lining for implantation. (ACOG)'),
    ('291: "AUB" - "AUB-L" (Leiomyoma) - "FIGO Type 2"?', '["Outside", ">= 50% intramural", "Cavity only", "None"]', 1, 'Standard FIGO subtyping. (ACOG)'),
    ('292: "Amenorrhea" - "Asherman" - Success of surgery depends on _____?', '["Weight", "Extent of the adhesions (Stage)", "None", "Age"]', 1, 'Severe scarring has poor prognosis. (Williams)'),
    ('293: "Infertility" - "RPL" - "Progesterone" therapy in early pregnancy?', '["No benefit", "Proven benefit only in women with 3 or more previous losses and bleeding", "Always", "None"]', 1, 'Specific indication (PRISM trial). (ACOG)'),
    ('294: "Hirsutism" - "Spironolactone" - Why a "diuretic"?', '["None", "It was originally developed as a potassium-sparing diuretic", "Helps hair", "None"]', 1, 'Blocks aldosterone receptors. (Beckmann)'),
    ('295: "AUB" - "Acute" bleeding - "Dose" of IV Estrogen?', '["1 mg", "25 mg every 4-6 hours", "500 mg", "None"]', 1, 'Standard acute protocol. (Williams)'),
    ('296: "Amenorrhea" - "Prolactinoma" - "Wait and See" for a microadenoma?', '["Never", "Yes, if asymptomatic and not desiring pregnancy", "Only in cancer", "None"]', 1, 'Slow-growing lesions. (ACOG)'),
    ('297: "Infertility" - "PCOS" - Does "Metformin" reduce "Miscarriage"?', '["Yes", "No proven benefit based on large meta-analyses", "Only in GDM", "None"]', 1, 'Common practice but weak evidence. (ACOG)'),
    ('298: "Hirsutism" - "Vellus" to "Terminal" conversion is _____?', '["Reversible", "Irreversible (hair will stay terminal even if androgens drop; requires removal)", "Temporary", "None"]', 1, 'Why medical therapy stops new growth but doesn''t remove existing hair. (Williams)'),
    ('299: "AUB" - "AUB-O" - Can it lead to "Hemoperitoneum"?', '["No", "Rarely, if a corpus luteum ruptures after an ovulatory cycle", "Only in teens", "None"]', 1, 'Acute surgical abdomen. (Beckmann)'),
    ('300: "Infertility" - "Egg Freezing" - "Age" limit for best success?', '["21", "< 35", "50", "None"]', 1, 'Success drops significantly with eggs frozen after age 38. (ASRM)');

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation)
    SELECT v_topic_id, question, options, correct_index, explanation
    FROM stage_mcqs s
    WHERE NOT EXISTS (
        SELECT 1 FROM mcqs m 
        WHERE m.topic_id = v_topic_id 
        AND m.question = s.question
    );

    DROP TABLE stage_mcqs;

    RAISE NOTICE 'SUCCESS: Batch 5 (241-300) MCQs for Menstrual Disorders & Infertility registered.';
END $$;
COMMIT;
