BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-basics' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-basics not found.';
    END IF;

    -- Batch 6: 301-335 (Ethics, Legal, and Final Basics Review)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '301: In "Obstetric Ethics," the fetus is generally considered a "patient" when it is:', '["Conceived", "Viable (capable of independent life outside the womb)", "Born", "12 weeks old"]', 1, 'The ethical obligation to the fetus increases as it approaches viability. (ACOG)'),
    (v_topic_id, '302: If a pregnant woman refuses a life-saving C-section for herself and the fetus, the physician should:', '["Perform it anyway", "Respect the mother''s autonomy if she has decision-making capacity", "Get a court order immediately", "Sedate her and proceed"]', 1, 'Maternal autonomy generally prevails; forced obstetric procedures are ethically and legally problematic. (ACOG)'),
    (v_topic_id, '303: "Informed Consent" for a procedure requires a discussion of the nature of the procedure, risks, benefits, and:', '["The cost", "Reasonable alternatives", "The surgeon''s hobbies", "The hospital rating"]', 1, 'Alternatives must always be presented. (Beckmann)'),
    (v_topic_id, '304: Can a minor (under 18) consent to "Prenatal Care" or "Contraception" without parental permission in many US states?', '["No, never", "Yes, in most states, these are considered \"protected\" services", "Only if she is married", "Only in emergencies"]', 1, 'Varies by state, but reproductive health is often an exception to parental consent. (Guttmacher/ACOG)'),
    (v_topic_id, '305: "Confidentiality" in adolescent reproductive health care can be breached if:', '["The parent asks", "There is a suspicion of child abuse or harm to self/others", "The patient is not paying", "The doctor disagrees with the patient''s choice"]', 1, 'Mandatory reporting laws override confidentiality. (Beckmann)'),
    (v_topic_id, '306: A "Maternal Mortality" rate is calculated as the number of deaths per _____ live births.', '["1,000", "10,000", "100,000", "1,000,000"]', 2, 'Standard international metric. (WHO)'),
    (v_topic_id, '307: What is the leading cause of maternal death WORLDWIDE?', '["Infection", "Hemorrhage", "Hypertension", "Obstructed labor"]', 1, 'Postpartum hemorrhage remains the #1 killer globally. (WHO)'),
    (v_topic_id, '308: In the United States, what is the #1 cause of "Injury-related" maternal death?', '["Car accidents", "Intimate Partner Violence / Homicide", "Falls", "Suicide"]', 1, 'Homicide is a leading cause of death for pregnant women in many US studies. (ACOG)'),
    (v_topic_id, '309: "Amniotic Fluid Embolism" is characterized by sudden cardiovascular collapse, DIC, and:', '["Fever", "Seizures and hypoxia", "Rash", "High blood pressure"]', 1, 'A rare but catastrophic event. (Williams)'),
    (v_topic_id, '310: The most common cause of "Delayed" (Secondary) Postpartum Hemorrhage (24h to 12 weeks)?', '["Atony", "Retained products of conception (RPOC)", "Lacerations", "Coagulopathy"]', 1, 'Subinvolution of the placental site or retained tissue. (Beckmann)'),
    (v_topic_id, '311: Which "Pelvic Floor" muscle is most commonly injured during vaginal delivery?', '["Piriformis", "Levator Ani (especially Pubococcygeus)", "Obturator internus", "Gluteus maximus"]', 1, 'Injury leads to pelvic organ prolapse. (Williams)'),
    (v_topic_id, '312: "Stress Urinary Incontinence" is leakage of urine with:', '["An urge to go", "Coughing, sneezing, or laughing", "At night only", "Continuous dripping"]', 1, 'Due to urethral hypermobility or sphincter weakness. (Beckmann)'),
    (v_topic_id, '313: "Urge Incontinence" is caused by:', '["Weak muscles", "Detrusor overactivity (overactive bladder)", "Blocked urethra", "Fistula"]', 1, 'Sudden, strong need to void. (Williams)'),
    (v_topic_id, '314: "Pelvic Organ Prolapse" (POP) is staged using which system?', '["TNM", "POPQ (Pelvic Organ Prolapse Quantification)", "Bishop score", "Apgar"]', 1, 'Objective measurements of vaginal landmarks. (ACOG)'),
    (v_topic_id, '315: A "Cystocele" is the herniation of the _____ into the vagina.', '["Rectum", "Bladder", "Small bowel", "Urethra"]', 1, 'Anterior compartment defect. (Beckmann)'),
    (v_topic_id, '316: A "Pessary" is used to treat:', '["Infection", "Pelvic Organ Prolapse and Stress Incontinence", "Fibroids", "Cancer"]', 1, 'A removable device that provides support. (ACOG)'),
    (v_topic_id, '317: "Chronic Pelvic Pain" is defined as non-cyclic pain lasting at least:', '["1 month", "3 months", "6 months", "1 year"]', 2, 'Significant impact on quality of life. (ACOG)'),
    (v_topic_id, '318: Which of the following is a "Benign" ovarian cyst common in reproductive-age women?', '["Follicular cyst", "Serous cystadenocarcinoma", "Krukenberg tumor", "Clear cell tumor"]', 0, 'Functional cysts related to the menstrual cycle. (Williams)'),
    (v_topic_id, '319: A "Dermoid Cyst" (Mature Cystic Teratoma) often contains:', '["Clear fluid only", "Blood", "Hair, teeth, and sebum", "Cancer cells only"]', 2, 'Germ cell tumor; risk of ovarian torsion. (Beckmann)'),
    (v_topic_id, '320: Sudden onset of severe unilateral pelvic pain with a known adnexal mass suggests:', '["PID", "Ovarian Torsion", "Ruptured ectopic", "Appendicitis"]', 1, 'Surgical emergency; necessitates detorsion or oophorectomy. (ACOG)'),
    (v_topic_id, '321: What is the #1 risk factor for Ovarian Cancer?', '["Smoking", "Obesity", "Family history (BRCA)", "Early childbearing"]', 2, 'Most ovarian cancer is sporadic, but family history is the strongest risk. (Williams)'),
    (v_topic_id, '322: "CA-125" is a tumor marker used primarily for:', '["Screening the general population for ovarian cancer", "Monitoring response to treatment in known ovarian cancer", "Diagnosing cervical cancer", "Checking for pregnancy"]', 1, 'Low specificity makes it poor for screening average-risk women. (ACOG)'),
    (v_topic_id, '323: "Vulvar Cancer" is most commonly which histological type?', '["Adenocarcinoma", "Squamous Cell Carcinoma", "Melanoma", "Sarcoma"]', 1, 'Often associated with HPV or lichen sclerosus. (Beckmann)'),
    (v_topic_id, '324: "Lichen Sclerosus" of the vulva is characterized by:', '["Thick, leathery skin", "Thin, white, \"parchment-like\" skin with itching", "Vesicles", "Red plaques"]', 1, 'Risk of progression to SCC; treated with high-potency steroids. (ACOG)'),
    (v_topic_id, '325: Which of the following is a risk factor for Endometrial Cancer?', '["Unopposed estrogen", "Tamoxifen use", "Lynch Syndrome", "All of the above"]', 3, 'Anything that increases estrogen exposure. (Williams)'),
    (v_topic_id, '326: Combined Oral Contraceptives (COCs) _____ the risk of Endometrial cancer.', '["Increase", "Decrease", "Have no effect on", "Only increase in smokers"]', 1, 'Protective effect due to the progestin component. (Beckmann)'),
    (v_topic_id, '327: "Post-coital bleeding" (bleeding after sex) is a classic symptom of:', '["Endometrial cancer", "Cervical cancer", "Ovarian cancer", "Yeast infection"]', 1, 'Must visualize the cervix and perform a Pap/biopsy. (Williams)'),
    (v_topic_id, '328: A woman has an ASC-US Pap result. What is the next step if she is > 25?', '["Immediate LEEP", "Reflex HPV testing", "Hysterectomy", "Repeat in 3 years"]', 1, 'Atypical Squamous Cells of Undetermined Significance. (ACOG)'),
    (v_topic_id, '329: "Colposcopy" is a procedure to:', '["Remove the uterus", "Magnify and visualize the cervix with acetic acid to identify abnormal areas", "Screen for colon cancer", "Deliver a baby"]', 1, 'Used to guide biopsies after abnormal Pap. (Beckmann)'),
    (v_topic_id, '330: "Acetowhite" changes during colposcopy indicate:', '["Normal tissue", "Areas of high nuclear density (possible dysplasia/HPV)", "Infection", "Healing"]', 1, 'Dysplastic cells take up the vinegar and turn white. (Williams)'),
    (v_topic_id, '331: "Infertility" is defined as the inability to conceive after _____ of unprotected intercourse.', '["3 months", "6 months", "1 year (or 6 months if age > 35)", "2 years"]', 2, 'Standard clinical definition. (ACOG)'),
    (v_topic_id, '332: What is the #1 cause of "Female Factor" infertility?', '["Uterine fibroids", "Ovulatory dysfunction (e.g., PCOS)", "Tubal factor", "Cervical mucus"]', 1, 'Anovulation is very common. (Beckmann)'),
    (v_topic_id, '333: A "Hysterosalpingogram" (HSG) is an X-ray test used to check:', '["Ovarian reserve", "Tubal patency and uterine cavity contour", "Blood flow", "Fetal heart rate"]', 1, 'Involves injecting dye into the uterus. (ACOG)'),
    (v_topic_id, '334: "Clomiphene Citrate" (Clomid) is used to:', '["Stop bleeding", "Induce ovulation by blocking estrogen receptors at the hypothalamus", "Treat infection", "Prevent miscarriage"]', 1, 'A Selective Estrogen Receptor Modulator (SERM). (Williams)'),
    (v_topic_id, '335: "Ovarian Hyperstimulation Syndrome" (OHSS) is a complication of:', '["The Pill", "Injectable gonadotropins used in IVF", "Menopause", "Pregnancy"]', 1, 'Can lead to massive fluid shifts and renal failure. (Beckmann)');

    RAISE NOTICE 'SUCCESS: Final Batch 6 (301-335) MCQs for OB/GYN Basics registered.';
    RAISE NOTICE 'TOTAL MCQS FOR THIS TOPIC: 335';
END $$;
COMMIT;
