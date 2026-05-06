BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-benign-gynecology' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-benign-gynecology not found.';
    END IF;

    -- Batch 4: 183-240 (Clinical Vignettes & Advanced Concepts)
    -- Use a temporary table to stage insertions and prevent duplicates
    CREATE TEMP TABLE stage_mcqs (question TEXT, options JSONB, correct_index INT, explanation TEXT);

    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('183: A 42-year-old G3P3 woman has severe HMB and dysmenorrhea. Exam: soft, globular, 12-week size uterus. Ultrasound: heterogeneous myometrium with subendometrial cysts. Next best step?', '["Myomectomy", "Hysterectomy (if fertility is not desired)", "Endometrial Biopsy", "Wait 6 months"]', 1, 'Classic presentation of adenomyosis; Hysterectomy is definitive for symptoms. (Beckmann; Williams)'),
    
    ('184: A 29-year-old with infertility has a 3 cm submucosal fibroid (Type 0). What is the mechanism of her infertility?', '["Blocked fallopian tubes", "Impairment of embryo implantation due to architectural distortion and local inflammatory changes", "Lack of ovulation", "None"]', 1, 'Submucosal fibroids act like an IUD. (ACOG; Williams)'),
    
    ('185: A 31-year-old G0 has chronic pelvic pain, dyspareunia, and dyschezia. Laparoscopy shows black "powder-burn" lesions. What is the most likely additional finding?', '["Symmetrically enlarged uterus", "Uterosacral ligament nodularity", "Polyuria", "None"]', 1, 'Characteristic of endometriosis involvement in the posterior cul-de-sac. (Blueprints; Beckmann)'),
    
    ('186: A 24-year-old with PCOS has severe acne and hirsutism. She is started on OCPs and Spironolactone. Why MUST she use reliable contraception?', '["Spironolactone is an anti-androgen that can feminize a male fetus", "OCPs increase the risk of twins", "Spironolactone causes twins", "None"]', 0, 'Category X effect on male external genitalia. (ACOG; Williams)'),
    
    ('187: A 48-year-old woman with large fibroids has an "FSH" level of 45 IU/L. What does this indicate regarding her fibroids?', '["They will grow rapidly", "They will likely shrink in the near future due to entering menopause", "She has PCOS", "None"]', 1, 'High FSH indicates menopause; the lack of estrogen leads to fibroid regression. (Beckmann; Williams)'),
    
    ('188: A woman with endometriosis undergoing laparoscopy is found to have "dense adhesions" between the rectum and the posterior uterus. What is the ASRM Stage?', '["Stage I", "Stage II", "Stage III or IV", "Stage 0"]', 2, 'Adhesions and deep infiltration signify higher stages (III-IV). (Williams)'),
    
    ('189: A woman with PCOS has a 2-hour OGTT result of 185 mg/dL. Diagnosis?', '["Normal", "Impaired Glucose Tolerance (Prediabetes)", "Diabetes Mellitus", "Insulin Resistance only"]', 1, '140-199 mg/dL on 2h OGTT is prediabetes. (ADA; Williams)'),
    
    ('190: A 35-year-old G0 woman with PCOS and a BMI of 34 wants to conceive. She has failed weight loss. What is the best next step?', '["Metformin", "Letrozole", "IVF", "Hysterectomy"]', 1, 'Letrozole is the first-line medication for ovulation induction in PCOS. (ACOG; Williams)'),
    
    ('191: A woman with fibroids has sudden onset of sharp pain and a 5 cm pedunculated subserosal mass. Ultrasound shows "decreased blood flow" to the mass. Diagnosis?', '["Red degeneration", "Torsion of a pedunculated fibroid", "Ruptured cyst", "Cancer"]', 1, 'Torsion is a surgical emergency. (Beckmann; Williams)'),
    
    ('192: A 33-year-old with endometriosis has an "endometrioma" that is 6 cm. She wants to preserve the ovary. Best surgery?', '["Cyst aspiration", "Laparoscopic cystectomy", "Oophorectomy", "Ablation"]', 1, 'Excision of the cyst wall (cystectomy) reduces recurrence risk. (ACOG; Williams)'),
    
    ('193: A 28-year-old with PCOS has an "LH/FSH ratio" of 3:1. This finding is:', '["Required for diagnosis", "Classic but not required for diagnosis", "Diagnostic of an adrenal tumor", "None"]', 1, 'Common endocrine finding but not part of the Rotterdam criteria. (Beckmann; Williams)'),
    
    ('194: "Uterine Artery Embolization" (UAE) is most effective for which type of fibroid symptom?', '["Infertility", "Heavy Menstrual Bleeding (HMB)", "Pelvic Pain", "None"]', 1, 'Excellent for reducing flow and bulk symptoms. (Blueprints; ACOG)'),
    
    ('195: A woman with endometriosis has "hematuria" during her periods. Cystoscopy shows "bluish lesions" on the bladder mucosa. This is:', '["Bladder cancer", "Vesical (bladder) endometriosis", "UTI", "None"]', 1, 'Infiltration of the bladder wall. (Williams)'),
    
    ('196: A woman with PCOS and "Acanthosis Nigricans" is at highest risk for:', '["Breast cancer", "Type 2 Diabetes Mellitus", "Hypothyroidism", "None"]', 1, 'Acanthosis is a clinical marker of severe insulin resistance. (Beckmann; Williams)'),
    
    ('197: A 46-year-old with fibroids has an EMB showing "Complex Hyperplasia with Atypia." What is the recommended treatment?', '["OCPs", "Hysterectomy", "Provera", "Myomectomy"]', 1, 'Atypical hyperplasia is a precursor to cancer; surgery is indicated. (ACOG; Williams)'),
    
    ('198: "Intravenous Leiomyomatosis" is a rare condition where:', '["Fibroids grow in the liver", "Benign smooth muscle grows into the uterine and pelvic veins, potentially reaching the heart", "Fibroids cause sepsis", "None"]', 1, 'Requires extensive vascular surgery. (Williams; Comprehensive Gynecology)'),
    
    ('199: "Diffuse Leiomyomatosis" refers to:', '["A single large fibroid", "The entire myometrium being replaced by innumerable small, confluent fibroids", "Endometriosis", "None"]', 1, 'Causes extreme uterine enlargement. (Williams)'),
    
    ('200: A woman with endometriosis has "sciatic" pain during her period. Likely cause?', '["Herniated disc", "Endometriosis involving the sciatic nerve or pelvic sidewall near the nerve", "Anxiety", "None"]', 1, 'Cyclic nerve-related pain. (Williams)'),
    
    ('201: A 19-year-old with PCOS has an "SHBG" level that is low. What is the consequence?', '["Higher total testosterone", "Higher FREE (active) testosterone", "Low LH", "None"]', 1, 'Less binding capacity means more active hormone. (Beckmann; Williams)'),
    
    ('202: Which fibroid procedure has the highest risk of "intra-abdominal adhesions"?', '["Hysteroscopy", "Laparotomy (Open Myomectomy)", "UAE", "Ablation"]', 1, 'Open surgery is more likely to cause peritoneal adhesions. (Beckmann; Blueprints)'),
    
    ('203: "Endometriotic" implants on the "Ureter" can cause:', '["UTI", "Silent hydronephrosis and eventual renal failure", "Blood in urine", "None"]', 1, 'Obstruction may be asymptomatic until severe. (Williams; ACOG)'),
    
    ('204: A 25-year-old G0 with PCOS is not getting periods. Why is she given "Provera" every 3 months?', '["To help her get pregnant", "To induce \"withdrawal bleeding\" and protect against endometrial cancer", "To treat acne", "None"]', 1, 'Ensures the lining is shed. (ACOG; Beckmann)'),
    
    ('205: A 38-year-old with a "boggy, tender uterus" and HMB fails Mirena IUD. MRI shows "junctional zone of 15 mm." Diagnosis?', '["Fibroids", "Adenomyosis", "Endometrial polyp", "Cervicitis"]', 1, 'Characteristic MRI finding for adenomyosis. (Williams; Comprehensive Gynecology)'),
    
    ('206: A woman with endometriosis has "umbilical" pain and a "purple nodule" that bleeds with menses. Diagnosis?', '["Umbilical hernia", "Umbilical Endometriosis (Villar''s nodule)", "Omphalitis", "None"]', 1, 'Cyclic bleeding from the navel. (Williams)'),
    
    ('207: "Metabolic Syndrome" in PCOS includes all of the following EXCEPT:', '["Abdominal obesity", "Hypertension", "Low HDL", "Hyperthyroidism"]', 3, 'Thyroid status is not part of Metabolic Syndrome criteria. (Williams; ACOG)'),
    
    ('208: "Leuprolide" (GnRH agonist) treatment initially causes a "flare" in symptoms. Why?', '["It is working", "Initial surge in FSH and LH before downregulation of receptors occurs", "Infection", "None"]', 1, 'Symptoms may worsen for the first 1-2 weeks. (Beckmann; Williams)'),
    
    ('209: What is the risk of "malignant change" in an endometrioma?', '["0%", "Low (~1%), primarily to Clear Cell or Endometrioid carcinoma", "50%", "None"]', 1, 'Endometriosis is a recognized risk factor for certain ovarian cancers. (Williams; ACOG)'),
    
    ('210: "Hysterectomy" for fibroids: Which type involves removing the cervix?', '["Supracervical Hysterectomy", "Total Hysterectomy", "Radical Hysterectomy", "None"]', 1, 'Total Hysterectomy = Uterus + Cervix. (Beckmann)'),
    
    ('211: A woman with "adenomyosis" and "fibroids" is most likely to complain of:', '["Severe pain AND heavy bleeding", "Only pain", "Only bleeding", "None"]', 0, 'Symptoms overlap and are often additive. (Williams)'),
    
    ('212: A woman with PCOS has "Alopecia." This is usually:', '["Patchy (Alopecia areata)", "Male-pattern thinning (Androgenic alopecia)", "Total hair loss", "None"]', 1, 'Thinning at the crown/temples. (Beckmann; Williams)'),
    
    ('213: Does "endometriosis" cause a fever?', '["Always", "Usually no; if fever is present, consider PID or a ruptured infected cyst", "Only during menses", "None"]', 1, 'Endometriosis is inflammatory but not typically infectious. (Beckmann)'),
    
    ('214: A 32-year-old has "dyschezia." What finding on physical exam is most suggestive of rectovaginal endometriosis?', '["Firm nodularity in the posterior vaginal fornix", "Soft cervix", "Small uterus", "None"]', 0, 'Palpable implants in the septum. (Williams; Beckmann)'),
    
    ('215: In a patient with PCOS, "Hirsutism" usually appears:', '["In the axilla only", "On the chin, upper lip, chest, and lower abdomen", "On the legs only", "None"]', 1, 'Follows male-pattern distribution. (Beckmann)'),
    
    ('216: Which of the following is a "Uterine-sparing" non-surgical treatment for fibroids?', '["UAE", "MRgFUS", "GnRH agonists", "All of the above"]', 3, 'These avoid major abdominal surgery. (ACOG; Williams)'),
    
    ('217: "Culdotomy" or "Colpotomy" is an incision made in:', '["The abdomen", "The posterior vaginal fornix into the Pouch of Douglas", "The cervix", "None"]', 1, 'Used to access the pelvis for surgery or to remove specimens. (Beckmann)'),
    
    ('218: A woman with "endometriosis" has failed all medical therapies and both ovaries have been removed. She has a high risk of:', '["Pregnancy", "Surgical Menopause and Osteoporosis", "Fibroids", "None"]', 1, 'Requires HRT discussion. (Beckmann; ACOG)'),
    
    ('219: What is the risk of "Recurrence" of fibroids after a myomectomy?', '["0%", "~15-30% within 5 years", "100%", "None"]', 1, 'The uterus remains, so new fibroids can develop. (Williams; Blueprints)'),
    
    ('220: A woman with PCOS has a "high waist-to-hip ratio" (> 0.85). This indicates:', '["Increased risk of metabolic complications", "Normal finding", "High fertility", "None"]', 0, 'Central/android obesity is a major risk marker. (ACOG; Williams)'),
    
    ('221: Which "Surgical" treatment for endometriosis is most likely to reduce the "ovarian reserve"?', '["Ablation of superficial spots", "Aggressive cystectomy of an endometrioma", "Hysterectomy", "None"]', 1, 'Removing the cyst wall can inadvertently remove healthy primordial follicles. (ACOG; Williams)'),
    
    ('222: "Submucosal" fibroids are graded by FIGO. A "Type 2" fibroid is:', '["Entirely within the cavity", "> 50% intramural", "< 50% intramural", "None"]', 1, 'The deeper the intramural portion, the harder it is to remove hysteroscopically. (Comprehensive Gynecology)'),
    
    ('223: A woman with "endometriosis" has a "rectovaginal" nodule. This can mimic:', '["Hemorrhoids", "Rectal cancer", "Fibroids", "None"]', 1, 'Must be differentiated from primary bowel malignancy. (Williams)'),
    
    ('224: "Polycystic" ovaries in PCOS are caused by a lack of:', '["Estrogen", "Cyclic progesterone and organized follicular development", "LH", "None"]', 1, 'The high LH/low FSH environment prevents a dominant follicle from being selected. (Williams; Beckmann)'),
    
    ('225: A 31-year-old with HMB has a 4 cm "intramural" fibroid. She does NOT want surgery. Best medical option to STOP bleeding?', '["GnRH agonist", "LNG-IUD (Mirena)", "OCPs", "None"]', 1, 'LNG-IUD is first-line for non-distorting fibroids. (ACOG; Beckmann)'),
    
    ('226: "Secondary" amenorrhea in a woman with PCOS is often preceded by:', '["Regular cycles", "Oligomenorrhea and gradually lengthening cycles", "Menorrhagia", "None"]', 1, 'Classic pattern of worsening anovulation. (Beckmann)'),
    
    ('227: Can "adenomyosis" cause infertility?', '["No", "Yes, by affecting uterine contractility and implantation, though data is less robust than for fibroids", "Only in women over 50", "None"]', 1, 'Growing area of research in reproductive medicine. (Williams; ACOG)'),
    
    ('228: "Endometriotic" implants on the "Appendix" can mimic:', '["UTI", "Acute Appendicitis", "IBD", "None"]', 1, 'Can cause inflammation and perforation. (Williams)'),
    
    ('229: What is the "1% rule" in myomectomy?', '["The risk of death", "The risk of unexpected leiomyosarcoma (actually ~1 in 350 to 1 in 500)", "The risk of infection", "None"]', 1, 'Recent data suggests the risk is lower than 1%, but significant. (ACOG)'),
    
    ('230: In PCOS, the "Insulin resistance" is primarily:', '["Type 1", "Post-receptor defect in insulin signaling", "Lack of insulin", "None"]', 1, 'Leads to compensatory hyperinsulinemia. (Williams; Comprehensive Gynecology)'),
    
    ('231: "Hematosalpinx" associated with endometriosis is often due to:', '["Infection", "Bleeding from tubal implants or retrograde flow", "Ectopic pregnancy", "None"]', 1, 'Presence of blood in the fallopian tube. (Williams)'),
    
    ('232: A woman with "fibroids" undergoes "myomectomy." She is at increased risk for which pregnancy complication?', '["Gestational Diabetes", "Placental abruption or uterine rupture (if transmural)", "Preeclampsia", "None"]', 1, 'Uterine scarring is a major risk factor. (Williams; ACOG)'),
    
    ('233: A woman with PCOS has "Sleep Apnea." This is primarily linked to:', '["Hormones", "Obesity and androgens", "Anxiety", "None"]', 1, 'PCOS patients have higher rates of OSA than BMI-matched controls. (ACOG; Williams)'),
    
    ('234: "Retrograde Menstruation" occurs in what percentage of women?', '["1%", "10%", "~90%", "100%"]', 2, 'Suggests that immune/local factors are what lead to the DEVELOPMENT of endometriosis in some but not all. (Williams; Beckmann)'),
    
    ('235: A 37-year-old with HMB has an EMB showing "Secretory" endometrium. What does this indicate?', '["She is anovulatory", "She has ovulated recently", "She has cancer", "None"]', 1, 'Secretory changes are induced by progesterone. (Beckmann)'),
    
    ('236: "Fibroid" growth during pregnancy is:', '["Guaranteed", "Unpredictable; ~20-30% grow, while others remain stable or even shrink", "Always fatal", "None"]', 1, 'The effect of pregnancy on fibroids is variable. (Williams)'),
    
    ('237: "Endometriosis" is found in what percentage of women with chronic pelvic pain?', '["10%", "30-50%", "80%", "100%"]', 1, 'One of the leading causes of CPP. (Beckmann; ACOG)'),
    
    ('238: In PCOS, what happens to "Progesterone" levels?', '["They are chronically high", "They are chronically low due to lack of a corpus luteum", "They are normal", "None"]', 1, 'Anovulation means no progesterone is produced. (Beckmann; Williams)'),
    
    ('239: A woman with "fibroids" has "varicose veins" in the legs. Likely cause?', '["Heart failure", "Large uterus compressing the pelvic veins and impairing venous return", "Diabetes", "None"]', 1, 'Mechanical obstruction of the vena cava or iliac veins. (Williams)'),
    
    ('240: "Endometrioma" rupture can look exactly like:', '["Appendicitis", "Ruptured ectopic pregnancy or Pelvic Inflammatory Disease", "A cold", "None"]', 1, 'Requires acute surgical evaluation. (Beckmann; Williams)');

    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation)
    SELECT v_topic_id, question, options, correct_index, explanation
    FROM stage_mcqs s
    WHERE NOT EXISTS (
        SELECT 1 FROM mcqs m 
        WHERE m.topic_id = v_topic_id 
        AND m.question = s.question
    );

    DROP TABLE stage_mcqs;
END $$;
COMMIT;
