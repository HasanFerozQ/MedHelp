BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-menstrual-infertility' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-menstrual-infertility not found.';
    END IF;

    -- Batch 6: 301-335 (Final Review and Comprehensive Board Questions)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '301: A 14-year-old has never had a period. She has normal breasts but no uterus on ultrasound. FSH is normal. Diagnosis?', '["Turner Syndrome", "Mullerian Agenesis (MRKH)", "AIS", "None"]', 1, 'Normal FSH and breast development indicate a functional HPO axis. (ACOG)'),
    (v_topic_id, '302: A 45-year-old with heavy periods has a "boggy" symmetrically enlarged uterus. Most likely diagnosis?', '["Fibroids", "Adenomyosis", "Endometrial cancer", "None"]', 1, 'Standard clinical vignette. (Beckmann)'),
    (v_topic_id, '303: In "PCOS," what is the primary reason for "hirsutism"?', '["High Estrogen", "Increased free testosterone due to low SHBG", "Thyroid failure", "None"]', 1, 'Driven by insulin-induced SHBG suppression. (ACOG)'),
    (v_topic_id, '304: A 32-year-old cannot conceive after 1 year. Her periods are regular. HSG shows bilateral tubal blockage. Diagnosis?', '["PCOS", "Tubal Factor Infertility", "Male factor", "None"]', 1, 'Likely sequela of previous PID. (Williams Gynecology)'),
    (v_topic_id, '305: What is the "First-line" treatment for "Primary Dysmenorrhea" in an adolescent?', '["Opioids", "NSAIDs or COCs", "Surgery", "None"]', 1, 'Prostaglandin inhibition is key. (ACOG)'),
    (v_topic_id, '306: "AUB-L" - A "Pedunculated" subserosal fibroid (FIGO Type 7) is most likely to cause:', '["Heavy bleeding", "Torsion and acute pelvic pain", "Infertility", "None"]', 1, 'Attached to the uterus by a narrow stalk. (Beckmann)'),
    (v_topic_id, '307: "Infertility" - "Male Factor" - "Semen Analysis" shows 100% non-motile sperm. Next step?', '["IVF", "Vitality staining (to see if they are alive)", "Surgery", "None"]', 1, 'Distinguish necrozoospermia from ciliary defects. (WHO)'),
    (v_topic_id, '308: A woman with "Endometrial Hyperplasia" WITHOUT atypia wants a non-surgical option. Best choice?', '["OCPs", "LNG-IUD or high-dose oral progestins", "Ablation", "None"]', 1, 'Highly effective at reversing simple hyperplasia. (ACOG)'),
    (v_topic_id, '309: "Amenorrhea" - "Progesterone Challenge" results in bleeding. This confirms the patient is in a/an _____ state.', '["Estrogen-deficient", "Estrogen-sufficient but anovulatory", "Menopausal", "None"]', 1, 'The lining was primed and then shed when the progestin was removed. (Beckmann)'),
    (v_topic_id, '310: "PCOS" - What is the "Rotterdam Criteria"?', '["Only ultrasound", "2 out of 3: Oligo/Anovulation, Hyperandrogenism, and PCO on ultrasound", "Weight only", "None"]', 1, 'The standard international diagnostic consensus. (ACOG)'),
    (v_topic_id, '311: "AUB" - A postmenopausal woman has a 10mm endometrial lining on US. Next step?', '["Observe", "Endometrial Biopsy", "OCPs", "None"]', 1, 'Thickness > 4mm in this group requires tissue diagnosis. (ACOG)'),
    (v_topic_id, '312: "Infertility" - "AMH" (Anti-Mullerian Hormone) is produced by:', '["Pituitary", "Granulosa cells of pre-antral and small antral follicles", "Adrenals", "None"]', 1, 'Reflects the size of the primordial follicle pool. (Williams)'),
    (v_topic_id, '313: "Hirsutism" - "DHEAS" level > 700 mcg/dL. Management?', '["OCPs", "Adrenal imaging (CT/MRI) to rule out an adrenal tumor", "Metformin", "None"]', 1, 'Suspicious for a virilizing adrenal cortical carcinoma. (ACOG)'),
    (v_topic_id, '314: "Amenorrhea" - "Sheehan Syndrome" - Why is the "Pituitary" susceptible to necrosis during hemorrhage?', '["It is small", "It doubles in size during pregnancy and its blood supply is low-pressure (portal)", "None", "Infection"]', 1, 'Classic anatomy/pathology board fact. (Beckmann)'),
    (v_topic_id, '315: "AUB-P" - "Endometrial polyps" are most common in women taking which medication?', '["Aspirin", "Tamoxifen", "Warfarin", "None"]', 1, 'Tamoxifen has pro-estrogenic effects on the uterus. (ACOG)'),
    (v_topic_id, '316: "Infertility" - "IUI" vs "IVF" - Which has the higher "Twin" rate per successful pregnancy?', '["IVF (if single embryo transfer is used)", "IUI (due to lack of control over how many eggs ovulate)", "Same", "None"]', 1, 'Paradoxically, modern IVF is safer for preventing multiples than IUI. (ASRM)'),
    (v_topic_id, '317: "PCOS" - "Letrozole" works as a/an _____ inhibitor.', '["5-alpha reductase", "Aromatase", "Estrogen", "None"]', 1, 'Lowers systemic estrogen to increase FSH. (ACOG)'),
    (v_topic_id, '318: "Amenorrhea" - "Pregnancy" - What hormone maintains the corpus luteum in early pregnancy?', '["Estrogen", "hCG", "Progesterone", "None"]', 1, 'Mimics LH to keep the CL functioning until the placenta takes over. (Williams)'),
    (v_topic_id, '319: "Hirsutism" - "Spironolactone" - Why is it often combined with OCPs?', '["Weight loss", "Synergistic effect and prevents pregnancy (teratogenicity of spiro)", "None", "Taste"]', 1, 'Standard treatment strategy. (ACOG)'),
    (v_topic_id, '320: "Infertility" - "Day 3 FSH" > _____ IU/L is a poor prognostic sign for IVF success.', '["2", "10-15", "50", "None"]', 1, 'Indicates a high signal needed to stimulate the ovary. (Beckmann)'),
    (v_topic_id, '321: "AUB" - "Submucosal" fibroids are best removed via:', '["Laparoscopy", "Hysteroscopy (Myomectomy)", "Vaginal surgery", "None"]', 1, 'Allows direct visualization and resection from inside the cavity. (ACOG)'),
    (v_topic_id, '322: "Amenorrhea" - "Asherman Syndrome" - What is the most common predisposing event?', '["C-section", "D&C for retained products of conception or postpartum hemorrhage", "None", "PID"]', 1, 'Leading to mechanical trauma and adhesion. (Williams)'),
    (v_topic_id, '323: "Infertility" - "ICSI" - Is there a risk of transmitting genetic defects to male offspring?', '["No", "Yes, specifically Y-chromosome microdeletions if present in the father", "None", "Only in females"]', 1, 'Counseling is required. (ASRM)'),
    (v_topic_id, '324: "AUB" - "FIGO Classification" - What does "M" stand for?', '["Menopause", "Malignancy and Hyperplasia", "Miscarriage", "None"]', 1, 'Standard FIGO nomenclature. (ACOG)'),
    (v_topic_id, '325: "Hirsutism" - "Total Testosterone" < 200 ng/dL in a PCOS patient?', '["Wait", "Normal for PCOS (malignancy usually > 200)", "Surgery", "None"]', 1, 'Important diagnostic threshold for ruling out tumor. (ACOG)'),
    (v_topic_id, '326: "Amenorrhea" - "Imperforate Hymen" - Management?', '["OCPs", "Cruciate incision to allow drainage", "Hysterectomy", "None"]', 1, 'Simple surgical fix. (Beckmann)'),
    (v_topic_id, '327: "Infertility" - "Clomiphene" - If a patient does not ovulate on 50mg, what is the next step?', '["Stop", "Increase to 100mg (up to 150mg)", "IVF", "None"]', 1, 'Step-wise escalation. (Beckmann)'),
    (v_topic_id, '328: "AUB" - "Acute" stabilization - "IV Estrogen" dose?', '["25 mg", "100 mg", "1 mg", "None"]', 0, 'High-yield emergency dose. (ACOG)'),
    (v_topic_id, '329: "Hirsutism" - "5-alpha reductase" inhibitors (e.g. Finasteride) treat _____ hair.', '["Terminal", "Only NEW terminal hair growth (don''t remove old ones)", "Vellus", "None"]', 1, 'Requires adjuncts like laser for existing hair. (Williams)'),
    (v_topic_id, '330: "Infertility" - "AMH" - Does it change significantly during the menstrual cycle?', '["Yes", "No (unlike FSH, it can be tested any day of the cycle)", "Only mid-cycle", "None"]', 1, 'Highly convenient for clinical workup. (Beckmann)'),
    (v_topic_id, '331: "Amenorrhea" - "Anorexia" - Most dangerous long-term complication?', '["Acne", "Osteoporosis and increased fracture risk", "Infertility", "None"]', 1, 'Due to prolonged hypoestrogenism. (ACOG)'),
    (v_topic_id, '332: "AUB-A" - "Adenomyosis" - Only "Definitive" treatment?', '["Pills", "Hysterectomy", "Ablation", "None"]', 1, 'As the disease is deep within the myometrium. (Williams)'),
    (v_topic_id, '333: "Infertility" - "Semen Analysis" - "Leukocytospermia" (> 1 million WBCs/mL) suggests:', '["Normal", "Infection (Prostatitis or Urethritis)", "Cancer", "None"]', 1, 'Warrants cultures and antibiotics. (WHO)'),
    (v_topic_id, '334: "Amenorrhea" - "POI" - What "Karyotype" should be checked in all women < 30 with high FSH?', '["46, XX", "Karyotype to rule out Y-chromosome material (risk of gonadoblastoma)", "None", "45, X"]', 1, 'Standard safety precaution. (ACOG)'),
    (v_topic_id, '335: "Menstrual Disorders" - What is the "Gold Standard" for diagnosing AUB causes?', '["Ultrasound", "Hysteroscopy with directed biopsy", "CT scan", "None"]', 1, 'Combines visualization and pathology. (ACOG)');

    RAISE NOTICE 'SUCCESS: Final Batch 6 (301-335) MCQs for Menstrual Disorders & Infertility registered.';
    RAISE NOTICE 'TOTAL MCQS FOR THIS TOPIC: 335';
END $$;
COMMIT;
