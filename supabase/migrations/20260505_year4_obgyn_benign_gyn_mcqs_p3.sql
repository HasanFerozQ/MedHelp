BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-benign-gynecology' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-benign-gynecology not found.';
    END IF;

    -- Batch 3: 121-180 (PID, TOA, and Benign Ovarian Cysts)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '121: "Pelvic Inflammatory Disease" (PID) is an ascending infection of the upper female genital tract. Most common organisms?', '["E. coli", "Neisseria gonorrhoeae and Chlamydia trachomatis", "Group B Strep", "HSV"]', 1, 'Often polymicrobial, but these are the primary triggers. (ACOG)'),
    (v_topic_id, '122: Minimum clinical criteria for the diagnosis of PID (ACOG)?', '["Fever > 104", "Cervical Motion Tenderness (CMT), Uterine tenderness, or Adnexal tenderness", "High WBC", "Positive culture"]', 1, 'Only one needs to be present to justify empiric treatment. (ACOG)'),
    (v_topic_id, '123: "Chandelier Sign" refers to:', '["Extreme pain on cervical motion during exam", "Glowing skin", "Fever", "None"]', 0, 'Patient "jumps to the chandelier." (Beckmann)'),
    (v_topic_id, '124: "Fitz-Hugh-Curtis Syndrome" is a complication of PID involving:', '["Lung infection", "Perihepatitis (inflammation of the liver capsule) with \"violin-string\" adhesions", "Brain abscess", "None"]', 1, 'Presents with RUQ pain. (Williams)'),
    (v_topic_id, '125: First-line outpatient treatment for mild-to-moderate PID?', '["Ciprofloxacin", "Ceftriaxone (IM) + Doxycycline (oral) +/- Metronidazole", "Penicillin", "None"]', 1, 'CDC-recommended regimen. (CDC)'),
    (v_topic_id, '126: When should a patient with PID be HOSPITALIZED?', '["Pregnancy", "Failure to respond to oral therapy or severe illness (nausea/vomiting)", "Suspected Tubo-ovarian Abscess (TOA)", "All of the above"]', 3, 'Inpatient management requires IV antibiotics. (ACOG)'),
    (v_topic_id, '127: "Tubo-ovarian Abscess" (TOA) is characterized on ultrasound by:', '["A clear cyst", "A complex adnexal mass with thick walls and internal debris (inflammatory mass)", "A fibroid", "None"]', 1, 'Serious complication of PID. (Williams)'),
    (v_topic_id, '128: Initial management of a STABLE patient with a TOA?', '["Emergency surgery", "Broad-spectrum IV antibiotics", "Biopsy", "None"]', 1, '70-80% respond to antibiotics alone. (Beckmann)'),
    (v_topic_id, '129: Indication for surgery in TOA?', '["Rupture (emergency)", "Failure to respond to antibiotics within 48-72 hours", "Abscess > 10 cm", "All of the above"]', 3, 'Rupture can lead to life-threatening sepsis. (ACOG)'),
    (v_topic_id, '130: Long-term complications of PID include:', '["Infertility (tubal factor)", "Increased risk of Ectopic Pregnancy", "Chronic pelvic pain", "All of the above"]', 3, 'Scarring of the fallopian tubes. (Williams)'),
    (v_topic_id, '131: "Follicular Cyst" is a functional cyst that occurs when:', '["A follicle fails to rupture during ovulation", "The corpus luteum bleeds", "Cancer starts", "None"]', 0, 'Usually asymptomatic and < 5 cm. (Beckmann)'),
    (v_topic_id, '132: "Corpus Luteum Cyst" occurs:', '["Before ovulation", "After ovulation (persists and becomes enlarged/fluid-filled)", "In postmenopausal women", "None"]', 1, 'Can produce progesterone and delay menses. (Williams)'),
    (v_topic_id, '133: "Theca Lutein Cysts" are typically _____ and caused by high _____.', '["Unilateral / Estrogen", "Bilateral / hCG (e.g., Molar pregnancy, multiples)", "Small / Progesterone", "None"]', 1, 'Resolve once the hCG source is removed. (ACOG)'),
    (v_topic_id, '134: A "Hemorrhagic Cyst" classically presents with:', '["No symptoms", "Acute pelvic pain, often mid-cycle", "Weight gain", "None"]', 1, 'Rupture can cause peritoneal irritation. (Beckmann)'),
    (v_topic_id, '135: Management of a simple ovarian cyst < 5 cm in a premenopausal woman?', '["Immediate surgery", "Observation (repeat ultrasound in 6-8 weeks)", "Antibiotics", "None"]', 1, 'Most functional cysts resolve spontaneously. (ACOG)'),
    (v_topic_id, '136: "Ovarian Torsion" is an emergency caused by the ovary twisting on its:', '["Nerve", "Vascular pedicle (Infundibulopelvic and utero-ovarian ligaments)", "Tube only", "None"]', 1, 'Leads to ischemia and necrosis. (Williams)'),
    (v_topic_id, '137: Most common "mass" associated with torsion?', '["Cancer", "Mature Teratoma (Dermoid Cyst)", "Follicular cyst", "None"]', 1, 'The weight of the dermoid facilitates the twist. (Beckmann)'),
    (v_topic_id, '138: Classic presentation of Ovarian Torsion?', '["Gradual pain", "Sudden onset of severe, unilateral lower abdominal pain, often with nausea/vomiting", "Fever", "None"]', 1, 'Pain may be intermittent if the ovary is "twisting and untwisting." (ACOG)'),
    (v_topic_id, '139: "Doppler Ultrasound" in torsion:', '["Is 100% diagnostic", "May show decreased or absent blood flow, but normal flow does NOT rule out torsion", "Is useless", "None"]', 1, 'Clinical suspicion is primary. (Williams)'),
    (v_topic_id, '140: Surgical management of Ovarian Torsion?', '["Oophorectomy always", "Detorsion (untwisting) and assessment of viability; cystectomy if a mass is present", "Wait", "None"]', 1, 'Current preference is for ovarian conservation. (ACOG)'),
    (v_topic_id, '141: "Vulvar Vestibulitis" (Localized Provoked Vulvodynia) is characterized by:', '["Infection", "Severe pain on touch/entry at the vaginal vestibule", "A mass", "None"]', 1, 'Common cause of dyspareunia in young women. (Beckmann)'),
    (v_topic_id, '142: "Bartholin Gland Cyst" is located at which position on the vaginal clock?', '["12 o''clock", "4 or 8 o''clock", "6 o''clock", "None"]', 1, 'Due to obstruction of the gland duct. (Williams)'),
    (v_topic_id, '143: Management of a symptomatic Bartholin Cyst/Abscess?', '["Antibiotics only", "Incision and Drainage with \"Word Catheter\" placement or Marsupialization", "Wait", "None"]', 1, 'Catheter must stay for 4-6 weeks to allow the duct to epithelialize. (ACOG)'),
    (v_topic_id, '144: "Gartner Duct Cyst" is a vestigial remnant of the _____ duct.', '["Mullerian", "Wolffian (Mesonephric)", "Integumentary", "None"]', 1, 'Located on the lateral wall of the vagina. (Beckmann)'),
    (v_topic_id, '145: "Nabothian Cyst" is a benign finding on the:', '["Ovary", "Cervix", "Vulva", "Tube"]', 1, 'Mucous-filled cyst caused by blockage of an endocervical gland. (Williams)'),
    (v_topic_id, '146: "Chronic Pelvic Pain" (CPP) is pain lasting at least:', '["1 month", "6 months", "1 year", "None"]', 1, 'Can have multiple gynecological and non-gynecological causes. (ACOG)'),
    (v_topic_id, '147: "Pelvic Congestion Syndrome" is pain associated with:', '["Infection", "Dilated pelvic veins (similar to varicose veins)", "Fibroids", "None"]', 1, 'Pain typically worsens with standing and after intercourse. (Beckmann)'),
    (v_topic_id, '148: "Interstitial Cystitis" (Painful Bladder Syndrome) often mimics:', '["Endometriosis", "UTI but with negative cultures", "Fibroids", "None"]', 1, 'Presents with urinary frequency, urgency, and pelvic pain. (Williams)'),
    (v_topic_id, '149: "Hunner Lesions" (ulcers) on cystoscopy are diagnostic for:', '["Cancer", "Interstitial Cystitis", "PID", "None"]', 1, 'Specific finding in a subset of IC patients. (Beckmann)'),
    (v_topic_id, '150: "Vaginismus" is defined as:', '["Infection", "Involuntary contraction of the pelvic floor muscles interfering with penetration", "A mass", "None"]', 1, 'Treatment involves pelvic floor physical therapy and dilators. (ACOG)'),
    (v_topic_id, '151: "Leiomyoma" - Most common reason for surgery?', '["Pain", "Bulk symptoms (pressure) or Heavy Menstrual Bleeding", "Cancer risk", "None"]', 1, 'Standard surgical indications. (Williams)'),
    (v_topic_id, '152: "Myomectomy" vs "Hysterectomy" for fibroids: Which has a higher "blood loss" risk?', '["Hysterectomy", "Myomectomy (due to multiple incisions in the myometrium)", "Same", "None"]', 1, 'Myomectomy can be technically more difficult and bloody. (Beckmann)'),
    (v_topic_id, '153: "Power Morcellation" during fibroid surgery is controversial because:', '["It takes too long", "It can spread an undiagnosed leiomyosarcoma throughout the peritoneal cavity", "It is expensive", "None"]', 1, 'FDA black box warning; contained morcellation is now preferred. (ACOG)'),
    (v_topic_id, '154: "Asherman Syndrome" is:', '["Fibroids", "Intrauterine adhesions (scarring) following aggressive D&C", "Infection", "None"]', 1, 'Causes amenorrhea and infertility. (Williams)'),
    (v_topic_id, '155: Treatment for Asherman Syndrome?', '["Hysterectomy", "Hysteroscopic adhesiolysis and often hormonal therapy (estrogen)", "Wait", "None"]', 1, 'To restore the uterine cavity. (Beckmann)'),
    (v_topic_id, '156: "Endometrial Polyps" are usually:', '["Malignant", "Benign overgrowths of endometrial glands and stroma", "Infectious", "None"]', 1, 'Presents with intermenstrual bleeding. (Williams)'),
    (v_topic_id, '157: Best way to diagnose an "Endometrial Polyp"?', '["Pap smear", "Saline Infusion Sonohysterography (SIS) or Hysteroscopy", "CT", "None"]', 1, 'SIS provides excellent visualization of the cavity. (ACOG)'),
    (v_topic_id, '158: "PCOS" - What happens to "Estradiol" levels?', '["Very low", "Normal or chronically elevated (due to peripheral conversion of androgens)", "They disappear", "None"]', 1, 'Leads to "unopposed" estrogen status. (Beckmann)'),
    (v_topic_id, '159: "Endometrioma" - Does it respond to medical therapy (OCPs)?', '["Yes, it disappears", "Rarely; surgical excision/drainage is usually required for large ones", "Only in teens", "None"]', 1, 'Medical therapy may help with pain, but not the cyst size. (Williams)'),
    (v_topic_id, '160: "Adenomyosis" - "Definitive" diagnosis is made:', '["On MRI", "On Ultrasound", "On pathology after Hysterectomy", "None"]', 2, 'Imaging is highly suggestive, but pathology is certain. (ACOG)');

    RAISE NOTICE 'SUCCESS: Batch 3 (121-180) MCQs for Benign Gynecology registered.';
END $$;
COMMIT;
