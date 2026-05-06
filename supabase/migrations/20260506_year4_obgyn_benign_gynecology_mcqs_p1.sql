BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    -- Check if topic exists, otherwise create it
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-benign-gynecology' LIMIT 1;
    
    IF v_topic_id IS NULL THEN
    -- Batch 1: 1-60 (Leiomyomas, Adenomyosis, and General Benign Gynecology)
    -- Use a temporary table to stage insertions and prevent duplicates
    CREATE TEMP TABLE stage_mcqs (question TEXT, options JSONB, correct_index INT, explanation TEXT);

    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('1: What is the most common benign pelvic tumor in women?', '["Endometrioma", "Leiomyoma (Fibroid)", "Teratoma", "Adenomyoma"]', 1, 'Leiomyomas (fibroids) are the most common benign tumors of the female pelvis, occurring in up to 70-80% of women by age 50. (Beckmann; Williams)'),
    
    ('2: Which of the following is the MOST significant risk factor for the development of uterine leiomyomas?', '["Smoking", "Late menarche", "African American ethnicity", "Multiparity"]', 2, 'African American women have a 2-3 fold higher incidence and earlier age of onset compared to Caucasian women. (Comprehensive Gynecology; Blueprints)'),
    
    ('3: A 32-year-old G0 woman presents with heavy menstrual bleeding and "bulk symptoms." Ultrasound shows a 5 cm fibroid distorting the endometrial cavity. Which type is this?', '["Subserosal", "Intramural", "Submucosal", "Pedunculated"]', 2, 'Submucosal fibroids (FIGO type 0, 1, 2) are most closely associated with heavy menstrual bleeding (HMB) and infertility. (Beckmann; Williams)'),
    
    ('4: Which fibroid location is MOST likely to cause infertility by interfering with implantation?', '["Subserosal", "Intramural not distorting the cavity", "Submucosal", "Pedunculated subserosal"]', 2, 'Submucosal fibroids directly distort the endometrial cavity and are a proven cause of infertility and recurrent pregnancy loss. (Blueprints; ACOG)'),
    
    ('5: "Parasitic" leiomyomas are most commonly a result of:', '["Spontaneous mutation", "Metastasis from a sarcoma", "Iatrogenic seeding after morcellation or attachment to omentum", "Infection"]', 2, 'Parasitic fibroids occur when a pedunculated fibroid loses its uterine blood supply and attaches to another organ (like the omentum) or after laparoscopic morcellation. (Williams; Comprehensive Gynecology)'),
    
    ('6: A 45-year-old woman has multiple 2 cm asymptomatic fibroids. What is the BEST management?', '["Immediate Hysterectomy", "Myomectomy", "Expectant management (observation)", "GnRH agonists"]', 2, 'Asymptomatic fibroids do not require treatment regardless of size, provided they are not interfering with other organs. (Beckmann; ACOG)'),
    
    ('7: What is the definitive management for symptomatic leiomyomas in a woman who has completed childbearing?', '["Myomectomy", "Hysterectomy", "Uterine Artery Embolization (UAE)", "OCPs"]', 1, 'Hysterectomy is the only definitive treatment; other options have a risk of recurrence. (Blueprints; Williams)'),
    
    ('8: A 28-year-old G0 woman with symptomatic submucosal fibroids desires future pregnancy. Which procedure is MOST appropriate?', '["Total Abdominal Hysterectomy", "Hysteroscopic Myomectomy", "Uterine Artery Embolization", "Endometrial Ablation"]', 1, 'Hysteroscopic myomectomy is the procedure of choice for symptomatic FIGO type 0 or 1 submucosal fibroids in women desiring fertility. (Beckmann; ACOG)'),
    
    ('9: Which of the following is a relative CONTRAINDICATION for Uterine Artery Embolization (UAE)?', '["Desire for future pregnancy", "Heavy bleeding", "Previous surgery", "Multiple fibroids"]', 0, 'While not an absolute contraindication, UAE is generally discouraged in women desiring future pregnancy due to potential risks to placental blood flow. (Williams; Blueprints)'),
    
    ('10: A pregnant woman at 14 weeks presents with acute localized abdominal pain and low-grade fever. She has a known 6 cm subserosal fibroid. What is the likely cause?', '["Malignant degeneration", "Red degeneration (Carneous degeneration)", "Torsion", "Labor"]', 1, 'Red degeneration occurs when a fibroid outgrows its blood supply, typically during pregnancy, causing ischemia and pain. (Beckmann; Williams)'),
    
    ('11: Management of "Red Degeneration" of a fibroid in pregnancy includes:', '["Immediate Myomectomy", "Analgesics (NSAIDs/Narcotics) and observation", "Emergency C-section", "Termination of pregnancy"]', 1, 'Treatment is conservative; surgery is avoided during pregnancy due to high risk of bleeding and preterm labor. (Williams; Blueprints)'),
    
    ('12: What is the mechanism of action of GnRH agonists (e.g., Leuprolide) in treating fibroids?', '["Directly dissolves the tumor", "Induces a hypoestrogenic state by downregulating pituitary GnRH receptors", "Increases progesterone levels", "Causes necrosis"]', 1, 'Downregulation leads to decreased FSH/LH and subsequent estrogen suppression, which shrinks fibroids by ~35-50%. (Comprehensive Gynecology; Beckmann)'),
    
    ('13: Long-term use (> 6 months) of GnRH agonists is limited by which side effect?', '["Liver toxicity", "Bone mineral density loss", "Hair loss", "Renal failure"]', 1, 'Hypoestrogenism leads to bone loss and vasomotor symptoms (hot flashes). (Beckmann; ACOG)'),
    
    ('14: Which medication is often used as "add-back therapy" with GnRH agonists to reduce side effects?', '["Testosterone", "Low-dose progestin or estrogen-progestin", "Vitamin D only", "Thyroxine"]', 1, 'Add-back therapy prevents bone loss and hot flashes without stimulating fibroid regrowth. (Williams; Blueprints)'),
    
    ('15: A 52-year-old postmenopausal woman presents with a NEW, rapidly enlarging uterine mass and vaginal bleeding. What is the primary concern?', '["Benign fibroid growth", "Uterine Leiomyosarcoma", "Adenomyosis", "Endometrial atrophy"]', 1, 'New or rapidly growing uterine masses in postmenopausal women are highly suspicious for leiomyosarcoma. (Comprehensive Gynecology; Beckmann)'),
    
    ('16: Which of the following is TRUE regarding the conversion of leiomyomas to leiomyosarcomas?', '["It happens in 10% of cases", "Sarcomas arise de novo; malignant transformation of a pre-existing fibroid is extremely rare (< 0.3%)", "Pregnancy increases the risk", "None"]', 1, 'Leiomyosarcomas are generally considered independent malignancies rather than transformed fibroids. (Williams; ACOG)'),
    
    ('17: "Adenomyosis" is defined as:', '["Endometrial glands and stroma within the uterine myometrium", "Fibroid growth in the cervix", "Endometrium outside the uterus", "Infection of the muscle"]', 0, 'Ectopic endometrial tissue within the myometrium leads to uterine hypertrophy. (Beckmann; Williams)'),
    
    ('18: What is the classic physical exam finding for Adenomyosis?', '["Irregular, hard uterus", "Symmetrically enlarged, \"globular,\" and soft/boggy uterus", "Fixed retroverted uterus", "Small uterus"]', 1, 'A boggy, symmetrically enlarged, often tender uterus is characteristic of adenomyosis. (Blueprints; Beckmann)'),
    
    ('19: A 42-year-old woman with secondary dysmenorrhea and HMB has a globular, tender uterus. What is the BEST initial imaging modality?', '["CT Abdomen", "Pelvic Ultrasound", "MRI Pelvis", "Hysterosalpingogram"]', 1, 'Transvaginal ultrasound is the first-line imaging for evaluating uterine pathology. (Beckmann; ACOG)'),
    
    ('20: On pelvic MRI, adenomyosis is often characterized by a "junctional zone" thickness of:', '["< 5 mm", "5-8 mm", "> 12 mm", "0 mm"]', 2, 'A junctional zone thickness > 12 mm is highly suggestive of adenomyosis. (Comprehensive Gynecology; Williams)'),
    
    ('21: What is the definitive treatment for Adenomyosis?', '["Myomectomy", "GnRH agonists", "Hysterectomy", "Dilation and Curettage"]', 2, 'Unlike fibroids, adenomyosis is diffuse and cannot be surgically removed without removing the uterus. (Blueprints; Beckmann)'),
    
    ('22: Which hormonal treatment is highly effective in reducing bleeding and pain in Adenomyosis?', '["Levonorgestrel IUD (Mirena)", "Estrogen only", "Low-dose Aspirin", "None"]', 0, 'The LNG-IUD provides local progestin that thins the endometrium and reduces symptoms. (ACOG; Williams)'),
    
    ('23: Which FIGO classification (0-8) refers to a completely intramural fibroid?', '["Type 0", "Type 2", "Type 4", "Type 7"]', 2, 'Type 4 is intramural and does not distort the endometrium or reach the serosa. (Comprehensive Gynecology)'),
    
    ('24: A 38-year-old woman has a 10 cm subserosal fibroid causing hydronephrosis by compressing the ureter. Management?', '["OCPs", "Surgical removal (Myomectomy or Hysterectomy)", "Observe", "Antibiotics"]', 1, 'Bulk symptoms causing organ dysfunction (like ureteral compression) are an indication for surgery. (Beckmann; Williams)'),
    
    ('25: In a patient with large fibroids, why are GnRH agonists often used for 3 months PRIOR to surgery?', '["To cure the fibroids", "To reduce tumor volume and increase hemoglobin levels by stopping menses", "To prevent cancer", "To increase fertility"]', 1, 'Preoperative GnRH agonists make the surgery technically easier and improve the patient''s hematological status. (Blueprints; ACOG)'),
    
    ('26: Which of the following is a common symptom of "submucosal" leiomyomas?', '["Hirsutism", "Heavy menstrual bleeding (menorrhagia)", "Weight loss", "Urinary frequency"]', 1, 'Submucosal fibroids increase the surface area of the endometrium and interfere with contractility, leading to HMB. (Beckmann; Williams)'),
    
    ('27: "Intramural" leiomyomas are located:', '["Just beneath the serosa", "Within the muscular wall of the uterus", "Protruding into the cavity", "In the broad ligament"]', 1, 'The most common location overall. (Beckmann)'),
    
    ('28: What is the most common degenerative change in a fibroid (occurring in 65% of cases)?', '["Cystic", "Hyaline", "Calcific", "Fatty"]', 1, 'Hyaline degeneration occurs when the fibrous tissue is replaced by proteinaceous material. (Comprehensive Gynecology; Williams)'),
    
    ('29: "Calcific" degeneration of fibroids is most common in:', '["Teens", "Pregnant women", "Postmenopausal women", "Infants"]', 2, 'Commonly seen as "popcorn calcifications" on X-ray in older women. (Beckmann)'),
    
    ('30: Which surgical approach for myomectomy has the shortest recovery time?', '["Laparotomy (Open)", "Robotic/Laparoscopic Myomectomy", "Total Hysterectomy", "None"]', 1, 'Minimally invasive approaches reduce hospital stay and recovery time. (Blueprints; ACOG)'),
    
    ('31: A patient undergoes Uterine Artery Embolization. Which substance is typically used to occlude the vessels?', '["Alcohol", "Polyvinyl alcohol (PVA) particles or embospheres", "Glue", "Surgical clips"]', 1, 'Particles are injected to induce ischemia in the fibroid. (Williams)'),
    
    ('32: Post-UAE syndrome is characterized by:', '["High fever and sepsis", "Pain, low-grade fever, nausea, and malaise for several days", "Sudden death", "None"]', 1, 'Expected inflammatory response to tumor necrosis. (Beckmann)'),
    
    ('33: Endometrial ablation is a treatment option for HMB in women with fibroids, PROVIDED that:', '["The fibroids are > 10 cm", "The fibroids are small (< 3 cm) and NOT distorting the cavity significantly", "The patient wants more children", "None"]', 1, 'Cavity distortion significantly reduces the success of ablation. (ACOG; Williams)'),
    
    ('34: Which of the following is a symptom of a pedunculated subserosal fibroid that has undergone torsion?', '["Asymptomatic", "Acute, sharp pelvic pain and signs of peritonitis", "Heavy bleeding", "Infertility"]', 1, 'Torsion leads to infarction and acute surgical abdomen. (Beckmann)'),
    
    ('35: A 35-year-old woman has "adenomyoma." How does this differ from a "leiomyoma" on ultrasound?', '["It is more vascular", "It has ill-defined borders and blend with the myometrium, unlike the clear capsule of a fibroid", "It is always cystic", "None"]', 1, 'Adenomyosis lacks the distinct pseudo-capsule seen in leiomyomas. (Williams; Comprehensive Gynecology)'),
    
    ('36: What is the risk of "Uterine Rupture" in a subsequent pregnancy after a transmural myomectomy?', '["0%", "Low (~1-2%), but warrants consideration for elective C-section at 37-38 weeks", "50%", "100%"]', 1, 'If the uterine cavity was entered, a C-section is usually recommended. (Williams; ACOG)'),
    
    ('37: Which hormone is the PRIMARY driver of leiomyoma growth?', '["Progesterone", "Estrogen", "LH", "FSH"]', 1, 'Fibroids are estrogen-dependent and typically regress after menopause. (Beckmann; Williams)'),
    
    ('38: In addition to estrogen, which other hormone is increasingly recognized as a major promoter of fibroid proliferation?', '["Insulin", "Progesterone", "Cortisol", "Prolactin"]', 1, 'Progesterone and its receptors are critical for fibroid growth; hence, SPRMs are used as treatment. (Comprehensive Gynecology; Williams)'),
    
    ('39: "Mifepristone" and "Ulipristal acetate" are what type of drugs?', '["GnRH agonists", "Selective Progesterone Receptor Modulators (SPRMs)", "Estrogen blockers", "None"]', 1, 'Used to shrink fibroids and control bleeding by modulating progesterone action. (ACOG; Williams)'),
    
    ('40: A woman with fibroids has urinary frequency. This is most likely due to:', '["Submucosal fibroid", "Large anterior subserosal/intramural fibroid compressing the bladder", "Infection", "None"]', 1, 'Direct mechanical compression of the bladder. (Blueprints; Beckmann)'),
    
    ('41: Tranexamic acid (Lysteda) treats fibroid-related HMB by:', '["Shrinking the tumor", "Antifibrinolytic action (stabilizing clots in the endometrium)", "Blocking estrogen", "Inducing menopause"]', 1, 'Non-hormonal option taken only during menses. (Beckmann; ACOG)'),
    
    ('42: Which of the following is TRUE about fibroids and menopause?', '["They grow faster", "They typically shrink and symptoms improve due to lack of estrogen", "They always become cancerous", "None"]', 1, 'Postmenopausal growth is a red flag for malignancy. (Beckmann; Williams)'),
    
    ('43: FIGO Type 0 submucosal fibroid is:', '["Pedunculated and entirely within the endometrial cavity", "50% intramural", "In the cervix", "None"]', 0, 'Easiest type to remove hysteroscopically. (Williams)'),
    
    ('44: "Endometrial biopsy" is indicated in a 40-year-old woman with fibroids and HMB if:', '["She has a fever", "She has risk factors for hyperplasia/cancer (PCOS, obesity, or intermenstrual bleeding)", "She is thin", "None"]', 1, 'Must exclude malignancy before treating "benign" HMB. (ACOG; Williams)'),
    
    ('45: A 33-year-old with adenomyosis fails OCPs and IUD. She wants to avoid hysterectomy. What is a possible uterine-sparing surgical option (though less effective)?', '["Endometrial Ablation", "Adenomyomectomy (if focal)", "Uterine Artery Embolization", "All of the above"]', 3, 'While less definitive than hysterectomy, these may provide temporary relief. (Comprehensive Gynecology; Williams)'),
    
    ('46: In Adenomyosis, the ectopic glands are usually found at least _____ mm below the endo-myometrial junction.', '["1", "2.5 (or one low-power field)", "10", "20"]', 1, 'Standard pathological definition. (Williams)'),
    
    ('47: "Pelvic Pressure" and "Constipation" in a woman with a large posterior fibroid is caused by:', '["Hormonal imbalance", "Mechanical compression of the rectum", "Nerve damage", "None"]', 1, 'Classic bulk symptom. (Beckmann)'),
    
    ('48: Which diagnostic tool is BEST for distinguishing between a submucosal fibroid and an endometrial polyp?', '["CT scan", "Saline Infusion Sonohysterography (SIS)", "MRI", "Pap smear"]', 1, 'Fluid in the cavity provides excellent contrast for intrauterine lesions. (Blueprints; ACOG)'),
    
    ('49: What is the lifetime risk of a Caucasian woman developing fibroids?', '["20%", "40%", "~70%", "95%"]', 2, 'Very common benign finding. (Williams)'),
    
    ('50: "Hysteroscopic" morcellation is a technique used for:', '["Removal of subserosal fibroids", "Removal of submucosal fibroids and polyps under direct vision", "Hysterectomy", "None"]', 1, 'Minimally invasive intrauterine surgery. (Beckmann)'),
    
    ('51: A woman with fibroids has an "infarcted" fibroid on imaging. This is often associated with:', '["Severe pain", "Weight gain", "Pregnancy", "None"]', 0, 'Loss of blood supply leads to tissue death and pain. (Williams)'),
    
    ('52: "Diffuse uterine enlargement" on exam in a 45-year-old multiparous woman with dysmenorrhea is MOST suggestive of:', '["Fibroids", "Adenomyosis", "Endometrial cancer", "Pregnancy"]', 1, 'Classic triad: parous woman, dysmenorrhea, globular uterus. (Beckmann)'),
    
    ('53: The use of "power morcellation" is restricted by the FDA because:', '["It is too expensive", "It may inadvertently spread occult uterine sarcoma throughout the peritoneum", "It causes infection", "None"]', 1, 'Black box warning for laparoscopic fibroid surgery. (ACOG; Williams)'),
    
    ('54: In women with fibroids, "iron deficiency anemia" is primarily caused by:', '["Malabsorption", "Chronic heavy menstrual blood loss", "Hemolysis", "None"]', 1, 'Common indication for intervention. (Blueprints; Beckmann)'),
    
    ('55: "Myomectomy" is the surgical removal of:', '["The entire uterus", "Individual leiomyomas while preserving the uterus", "The ovaries", "None"]', 1, 'Preferred for women desiring fertility. (Beckmann)'),
    
    ('56: A patient with multiple fibroids wants a "non-surgical" permanent reduction in tumor size. What is a newer option using ultrasound?', '["MRI-guided Focused Ultrasound (MRgFUS)", "Cryotherapy", "Laser", "None"]', 0, 'Uses thermal energy to ablate the tumor. (Williams; ACOG)'),
    
    ('57: Which of the following is a risk factor for Adenomyosis?', '["Nulliparity", "Prior uterine surgery (e.g., C-section, D&C) and multiparity", "Young age", "Smoking"]', 1, 'Disruption of the endo-myometrial barrier. (Comprehensive Gynecology; Beckmann)'),
    
    ('58: A 30-year-old G0 has a 4 cm intramural fibroid and no symptoms. She is planning pregnancy. Recommended management?', '["Myomectomy before pregnancy", "Expectant management; proceed with pregnancy", "GnRH agonists", "IVF"]', 1, 'Intramural fibroids not distorting the cavity do not necessarily require pre-pregnancy removal. (ACOG; Williams)'),
    
    ('59: Which class of drugs can be used to treat HMB in fibroids by thinning the endometrium, but DOES NOT shrink the fibroid itself?', '["GnRH agonists", "Combined Oral Contraceptives (COCs)", "NSAIDs", "None"]', 1, 'Symptomatic control only. (Beckmann; Blueprints)'),
    
    ('60: "Cervical leiomyomas" comprise what percentage of all fibroids?', '["< 1%", "5-10%", "50%", "90%"]', 0, 'Most fibroids are in the uterine corpus. (Williams)'),
    
    ('61: "Menorrhagia" is technically defined as blood loss > _____ mL per cycle.', '["30", "50", "80", "200"]', 2, 'Though clinically we rely on the patient''s perception of \"heavy.\" (Beckmann)');

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
