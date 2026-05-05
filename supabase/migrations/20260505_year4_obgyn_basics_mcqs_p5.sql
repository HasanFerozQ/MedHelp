BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-basics' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-basics not found.';
    END IF;

    -- Batch 5: 241-300 (Gyn Screening, Vaccines, and Menopause Basics)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '241: According to ACOG, at what age should "Cervical Cancer Screening" (Pap smear) begin for most women?', '["At the start of sexual activity", "Age 18", "Age 21", "Age 25"]', 2, 'Screening starts at 21 regardless of sexual history (due to high rates of transient HPV). (ACOG)'),
    (v_topic_id, '242: For women aged 21-29, what is the recommended frequency of Pap smear screening?', '["Every year", "Every 2 years", "Every 3 years", "Every 5 years"]', 2, 'Cytology alone every 3 years. (ACOG)'),
    (v_topic_id, '243: For women aged 30-65, what is the "preferred" method of cervical cancer screening?', '["Pap smear every year", "Co-testing (Pap + HPV test) every 5 years", "HPV test alone every year", "No screening needed"]', 1, 'Co-testing every 5 years or cytology alone every 3 years. (ACOG)'),
    (v_topic_id, '244: When can cervical cancer screening typically be DISCONTINUED?', '["Age 50", "Age 65 (if previous screenings were negative)", "After menopause", "Never"]', 1, 'Discontinue after age 65 if there is a 10-year history of adequate negative screening. (ACOG)'),
    (v_topic_id, '245: A woman who has had a "Total Hysterectomy" (including cervix) for BENIGN reasons and has no history of high-grade CIN:', '["Needs a Pap every 3 years", "Can discontinue Pap screening", "Needs a Pap every year", "Needs HPV testing only"]', 1, 'No cervix = no cervical cancer risk. (Beckmann)'),
    (v_topic_id, '246: The "HPV Vaccine" (Gardasil 9) protects against which two high-risk types that cause ~70% of cervical cancers?', '["6 and 11", "16 and 18", "1 and 2", "31 and 33"]', 1, 'Types 16 and 18 are the most oncogenic. (Williams)'),
    (v_topic_id, '247: The "HPV Vaccine" protects against which two types that cause ~90% of genital warts?', '["16 and 18", "6 and 11", "31 and 45", "52 and 58"]', 1, 'Types 6 and 11 cause condyloma acuminata. (Beckmann)'),
    (v_topic_id, '248: What is the target age group for routine HPV vaccination according to the CDC?', '["Age 9-12", "Age 18-21", "Age 25-30", "Any age after sex"]', 0, 'Recommended at 11 or 12 years; can be started as early as age 9. (CDC)'),
    (v_topic_id, '249: Can the HPV vaccine be given to adults up to age 45?', '["No", "Yes, using shared clinical decision-making", "Only to men", "Only to women with HPV"]', 1, 'FDA approved up to age 45, though benefit is lower if already exposed. (ACOG/CDC)'),
    (v_topic_id, '250: Screening "Mammography" for breast cancer in average-risk women is generally recommended to start at what age?', '["Age 30", "Age 40-50 (depending on guideline)", "After the first baby", "Only if a lump is felt"]', 1, 'ACOG recommends offering at 40; ACS recommends 45. (ACOG)'),
    (v_topic_id, '251: Does ACOG recommend routine "Clinical Breast Exams" (CBE) for asymptomatic, average-risk women?', '["Yes, every year", "No, it is no longer recommended", "Only for women over 50", "Only for women with implants"]', 1, 'Breast self-awareness is encouraged over formal CBE in average-risk women. (ACOG)'),
    (v_topic_id, '252: "BRCA1 and BRCA2" mutations significantly increase the risk of which two cancers?', '["Breast and Colon", "Breast and Ovarian", "Endometrial and Ovarian", "Lung and Breast"]', 1, 'Autosomal dominant inheritance. (Williams)'),
    (v_topic_id, '253: Screening for "Osteoporosis" with a DXA scan should begin at what age for all women?', '["Age 50", "Age 65", "At menopause", "Age 75"]', 1, 'Earlier screening if the patient has risk factors (e.g., smoking, low weight, steroid use). (USPSTF)'),
    (v_topic_id, '254: A T-score of _____ on a DXA scan is diagnostic of Osteoporosis.', '["0", "-1.0 to -2.5", "<= -2.5", "> +1.0"]', 2, 'Osteopenia is -1.0 to -2.5. (Beckmann)'),
    (v_topic_id, '255: "Menopause" is clinically defined as:', '["Hot flashes", "The first missed period", "12 consecutive months of amenorrhea", "Age 50"]', 2, 'Retrospective diagnosis. (Williams)'),
    (v_topic_id, '256: What is the average age of menopause in the United States?', '["45", "51", "55", "60"]', 1, 'Range is typically 45-55. (Beckmann)'),
    (v_topic_id, '257: "Premature Ovarian Insufficiency" (POI) is menopause occurring before age:', '["35", "40", "45", "50"]', 1, 'Requires evaluation for genetic or autoimmune causes. (ACOG)'),
    (v_topic_id, '258: What is the primary hormonal change in menopause?', '["Increased Estrogen", "Decreased FSH", "Decreased Estrogen and significantly elevated FSH", "Increased Progesterone"]', 2, 'Lack of follicular feedback (inhibin/estrogen) leads to high FSH. (Williams)'),
    (v_topic_id, '259: The most common symptom of the "Menopausal Transition" (Perimenopause) is:', '["Weight loss", "Hot flashes (vasomotor symptoms)", "Increased libido", "Better sleep"]', 1, 'Due to fluctuating estrogen levels. (Beckmann)'),
    (v_topic_id, '260: "Hormone Replacement Therapy" (HRT) is the most effective treatment for hot flashes. If a woman has an INTACT UTERUS, she must receive:', '["Estrogen only", "Estrogen and Progestin", "Progesterone only", "Testosterone"]', 1, 'Progestin is required to prevent "unopposed estrogen" induced endometrial hyperplasia/cancer. (ACOG)'),
    (v_topic_id, '261: If a woman has had a "Hysterectomy," which type of HRT is appropriate?', '["Estrogen and Progestin", "Estrogen only (Unopposed)", "Testosterone", "None"]', 1, 'No uterus = no risk of endometrial cancer. (Beckmann)'),
    (v_topic_id, '262: HRT is indicated for:', '["Prevention of heart disease", "Management of severe vasomotor symptoms (hot flashes)", "Treatment of dementia", "Routine use in all postmenopausal women"]', 1, 'Use the lowest dose for the shortest time needed. (ACOG/NAMS)'),
    (v_topic_id, '263: A localized treatment for "Vulvovaginal Atrophy" (dryness/pain with sex) in a woman with no other symptoms is:', '["Oral Estrogen", "Vaginal Estrogen (cream, ring, or tablet)", "Antidepressants", "Antibiotics"]', 1, 'Low-dose local estrogen has minimal systemic absorption. (ACOG)'),
    (v_topic_id, '264: Which non-hormonal medication is FDA-approved for the treatment of hot flashes?', '["Ibuprofen", "Paroxetine (SSRI)", "Vitamin E", "Lisinopril"]', 1, 'Low-dose paroxetine (Brisdelle) is an option. (ACOG)'),
    (v_topic_id, '265: Postmenopausal bleeding (PMB) is _____ until proven otherwise.', '["Normal", "Endometrial Cancer", "Atrophy", "A sign of infection"]', 1, 'Must be evaluated with ultrasound or endometrial biopsy. (Williams)'),
    (v_topic_id, '266: What is the most common cause of postmenopausal bleeding?', '["Endometrial cancer", "Atrophy of the endometrium or vagina", "Polyps", "Fibroids"]', 1, 'Atrophy is the #1 cause, but cancer must be ruled out. (Beckmann)'),
    (v_topic_id, '267: An endometrial thickness of _____ on ultrasound in a postmenopausal woman is considered "low risk" for cancer.', '["< 4 mm", "> 10 mm", "Anything is risky", "5-8 mm"]', 0, 'Has a high negative predictive value. (ACOG)'),
    (v_topic_id, '268: "Lynch Syndrome" increases the risk of Colon cancer and which gynecologic cancer?', '["Ovarian", "Endometrial", "Cervical", "Vaginal"]', 1, 'Hereditary Non-Polyposis Colorectal Cancer (HNPCC). (Williams)'),
    (v_topic_id, '269: Screening for "Chlamydia and Gonorrhea" is recommended annually for all sexually active women until age:', '["21", "25", "35", "Menopause"]', 1, 'Prevalence is highest in women under 25. (CDC/USPSTF)'),
    (v_topic_id, '270: "Intimate Partner Violence" (IPV) screening should be performed:', '["Only if bruises are seen", "At every prenatal visit and routine Gyn visit", "Only if the patient mentions it", "Never"]', 1, 'Universal screening is standard of care. (ACOG)'),
    (v_topic_id, '271: The "Zoster" vaccine (Shingrix) is recommended for adults starting at age:', '["50", "65", "18", "After shingles"]', 0, 'Regardless of previous history of shingles or the old Zostavax. (CDC)'),
    (v_topic_id, '272: Which vaccine is CONTRAINDICATED in pregnancy because it is a live-attenuated vaccine?', '["Influenza (inactivated)", "Tdap", "MMR (Measles, Mumps, Rubella)", "Hepatitis B"]', 2, 'Give MMR postpartum if needed. (ACOG)'),
    (v_topic_id, '273: "Primary Amenorrhea" is defined as the absence of menarche by age _____ if there are secondary sex characteristics.', '["13", "15", "18", "21"]', 1, 'By 13 if NO secondary sex characteristics. (ACOG)'),
    (v_topic_id, '274: The first sign of "Puberty" in girls is usually:', '["Menarche", "Thelarche (breast development)", "Adrenarche (hair growth)", "Growth spurt"]', 1, 'Thelarche -> Adrenarche -> Growth -> Menarche. (Beckmann)'),
    (v_topic_id, '275: "Turner Syndrome" (45,X) is characterized by:', '["Short stature, webbed neck, and streaked ovaries", "Tall stature and large ears", "Excessive facial hair", "Normal fertility"]', 0, 'Most common cause of hypergonadotropic hypogonadism. (Williams)'),
    (v_topic_id, '276: A 17-year-old with primary amenorrhea, 46,XY karyotype, and minimal pubic hair likely has:', '["Turner Syndrome", "Androgen Insensitivity Syndrome", "PCOS", "Pregnancy"]', 1, 'Defect in androgen receptor; testes are present but hidden. (Beckmann)'),
    (v_topic_id, '277: "Asherman Syndrome" is secondary amenorrhea caused by:', '["Pituitary tumor", "Intrauterine adhesions (scarring)", "Ovarian failure", "Stress"]', 1, 'Often follows aggressive D&C. (Williams)'),
    (v_topic_id, '278: What is the most common cause of "Secondary Amenorrhea"?', '["Pituitary adenoma", "PCOS", "Pregnancy", "Anorexia"]', 2, 'Always check a UPT first! (ACOG)'),
    (v_topic_id, '279: "Polycystic Ovary Syndrome" (PCOS) requires at least 2 of the 3 "Rotterdam Criteria": Ovulatory dysfunction, Hyperandrogenism, and:', '["Obesity", "Polycystic ovaries on ultrasound", "Diabetes", "Hirsutism"]', 1, 'Obesity is common but not a criteria. (Williams)'),
    (v_topic_id, '280: PCOS is associated with a long-term increased risk of:', '["Endometrial cancer (due to chronic anovulation)", "Cervical cancer", "Breast cancer", "Hepatitis"]', 0, 'Unopposed estrogen leads to endometrial hyperplasia. (Beckmann)'),
    (v_topic_id, '281: "Dysmenorrhea" refers to:', '["Heavy bleeding", "Painful menstruation", "Irregular cycles", "Absence of periods"]', 1, 'Primary (no pathology) or Secondary (e.g., endometriosis). (Williams)'),
    (v_topic_id, '282: First-line treatment for "Primary Dysmenorrhea"?', '["Opioids", "NSAIDs", "Hysterectomy", "Antibiotics"]', 1, 'NSAIDs block prostaglandins (PGF2-alpha). (ACOG)'),
    (v_topic_id, '283: "Endometriosis" is defined by:', '["Infection of the uterus", "Endometrial glands and stroma outside the uterine cavity", "A large uterus", "Cancer"]', 1, 'Common cause of secondary dysmenorrhea and infertility. (Beckmann)'),
    (v_topic_id, '284: The "Classic Triad" of endometriosis is Dysmenorrhea, Dyspareunia (pain with sex), and:', '["Menorrhagia", "Dyschezia (pain with bowel movements)", "Fever", "Weight loss"]', 1, 'Symptoms often cycle with menses. (Williams)'),
    (v_topic_id, '285: A definitive diagnosis of Endometriosis requires:', '["Ultrasound", "Laparoscopy with biopsy", "Blood test", "Speculum exam"]', 1, 'Direct visualization is the gold standard. (ACOG)'),
    (v_topic_id, '286: "Adenomyosis" is:', '["Endometriosis of the ovary", "Endometrial tissue within the myometrium of the uterus", "Uterine fibroids", "Cervical polyps"]', 1, 'Results in a "boggy," symmetrically enlarged uterus. (Beckmann)'),
    (v_topic_id, '287: "Leiomyomas" (Fibroids) are:', '["Cancerous tumors", "Benign smooth muscle tumors of the uterus", "Ovarian cysts", "Infections"]', 1, 'Most common pelvic tumor in women. (Williams)'),
    (v_topic_id, '288: The most common symptom of uterine fibroids is:', '["Pain", "Heavy Menstrual Bleeding (Menorrhagia)", "Infertility", "Weight gain"]', 1, 'Submucosal fibroids are most likely to cause bleeding. (Beckmann)'),
    (v_topic_id, '289: Which race has the highest prevalence of uterine fibroids?', '["Caucasian", "African American", "Asian", "Hispanic"]', 1, 'Fibroids tend to occur earlier and be larger. (Williams)'),
    (v_topic_id, '290: "Vulvovaginal Candidiasis" (Yeast infection) is characterized by:', '["Fishy odor", "Thick, white, \"cottage cheese\" discharge and itching", "Green, frothy discharge", "Bloody discharge"]', 1, 'Normal pH (< 4.5). (Beckmann)'),
    (v_topic_id, '291: "Bacterial Vaginosis" (BV) is diagnosed using the "Amsel Criteria," which includes a fishy odor and:', '["Clue cells on saline microscopy", "Hyphae on KOH prep", "Trichomonads", "White blood cells"]', 0, 'BV is an overgrowth of Gardnerella and anaerobes. (CDC)'),
    (v_topic_id, '292: The "Whiff Test" for BV involves adding _____ to vaginal discharge.', '["Water", "KOH (Potassium Hydroxide)", "Saline", "Vinegar"]', 1, 'Releases amines, creating the fishy odor. (Williams)'),
    (v_topic_id, '293: "Trichomoniasis" is a protozoal infection characterized by a "strawberry cervix" and:', '["Clue cells", "Motile trichomonads on wet mount", "Cottage cheese discharge", "No symptoms"]', 1, 'Sexually transmitted; requires treatment of partners. (CDC)'),
    (v_topic_id, '294: Treatment for both BV and Trichomoniasis usually involves:', '["Fluconazole", "Metronidazole", "Azithromycin", "Ceftriaxone"]', 1, 'Metronidazole (Flagyl). (CDC)'),
    (v_topic_id, '295: "Pelvic Inflammatory Disease" (PID) is an ascending infection most commonly caused by:', '["Yeast", "E. coli", "Neisseria gonorrhoeae and Chlamydia trachomatis", "Staph aureus"]', 2, 'Can lead to infertility and tubal scarring. (CDC)'),
    (v_topic_id, '296: "Chandelier Sign" on physical exam refers to:', '["Bright lights", "Extreme cervical motion tenderness (CMT)", "Uterine prolapse", "Breast pain"]', 1, 'Classic finding in acute PID. (Beckmann)'),
    (v_topic_id, '297: Long-term complications of PID include chronic pelvic pain and:', '["Ectopic pregnancy and infertility", "Diabetes", "Heart disease", "Brain fog"]', 0, 'Due to tubal damage/adhesions. (Williams)'),
    (v_topic_id, '298: "Fitz-Hugh-Curtis Syndrome" is PID associated with:', '["Liver capsule inflammation/adhesions (\"violin strings\")", "Kidney failure", "Lung infection", "Brain abscess"]', 0, 'Right upper quadrant pain. (Beckmann)'),
    (v_topic_id, '299: Treatment for uncomplicated PID (outpatient)?', '["Ceftriaxone (IM) + Doxycycline (Oral) +/- Metronidazole", "Penicillin only", "Ciprofloxacin only", "Surgery"]', 0, 'Provides broad coverage. (CDC)'),
    (v_topic_id, '300: "Syphilis" is caused by:', '["Haemophilus ducreyi", "Treponema pallidum", "Chlamydia", "HPV"]', 1, 'Primary syphilis presents with a painless chancre. (CDC)');

    RAISE NOTICE 'SUCCESS: Batch 5 (241-300) MCQs for OB/GYN Basics registered.';
END $$;
COMMIT;
