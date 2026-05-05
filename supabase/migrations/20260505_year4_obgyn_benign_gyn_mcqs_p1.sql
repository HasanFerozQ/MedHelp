BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-benign-gynecology' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-benign-gynecology not found.';
    END IF;

    -- Batch 1: 1-60 (Uterine Leiomyomas and Adenomyosis)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '1: What are "Leiomyomas" (Fibroids) primarily composed of?', '["Glandular tissue", "Smooth muscle cells and extracellular matrix", "Fat cells", "Skeletal muscle"]', 1, 'They are the most common benign tumors of the female reproductive tract. (Williams Gynecology)'),
    (v_topic_id, '2: Fibroids are "Estrogen-dependent." This means they usually:', '["Shrink during pregnancy", "Enlarge during pregnancy and shrink after menopause", "Occur before puberty", "None"]', 1, 'Estrogen and progesterone stimulate their growth. (Beckmann)'),
    (v_topic_id, '3: Which type of fibroid is most likely to cause "Heavy Menstrual Bleeding" (Menorrhagia)?', '["Subserosal", "Submucosal", "Intramural", "Pedunculated"]', 1, 'Submucosal fibroids distort the uterine cavity and increase surface area of the endometrium. (ACOG)'),
    (v_topic_id, '4: "Subserosal" fibroids are located:', '["Just under the endometrium", "Within the myometrium", "On the outer surface of the uterus", "In the cervix"]', 2, 'May be pedunculated and mimic an adnexal mass. (Williams)'),
    (v_topic_id, '5: Most common symptom of uterine fibroids?', '["Pain", "Infertility", "Heavy Menstrual Bleeding", "Asymptomatic"]', 3, 'Many fibroids are incidental findings and do not cause symptoms. (Beckmann)'),
    (v_topic_id, '6: "Red Degeneration" of a fibroid occurs most commonly during:', '["Menopause", "Pregnancy (due to rapid growth outstripping blood supply)", "Puberty", "None"]', 1, 'Presents with acute, severe localized pain. (Williams)'),
    (v_topic_id, '7: Management of "Red Degeneration" in pregnancy?', '["Emergency surgery", "Conservative management (Analgesics and observation)", "Antibiotics", "Delivery"]', 1, 'Usually resolves in 7-10 days. (ACOG)'),
    (v_topic_id, '8: What is the "First-line" imaging modality for diagnosing uterine fibroids?', '["CT scan", "Transvaginal Ultrasound (TVUS)", "MRI", "Hysterosalpingogram"]', 1, 'Highly sensitive and cost-effective. (ACOG)'),
    (v_topic_id, '9: "MRI" is superior to ultrasound for fibroids when:', '["Distinguishing fibroids from adenomyosis or surgical planning for multiple fibroids", "Screening", "The patient is thin", "None"]', 0, 'Provides better mapping of the uterine wall. (Williams)'),
    (v_topic_id, '10: Definitive treatment for symptomatic fibroids in a woman who has COMPLETED childbearing?', '["Myomectomy", "Hysterectomy", "OCPs", "None"]', 1, 'The only 100% curative option. (Beckmann)'),
    (v_topic_id, '11: Surgical treatment for fibroids in a woman who DESIRES to preserve fertility?', '["Hysterectomy", "Myomectomy (removal of the fibroids only)", "Radiation", "None"]', 1, 'Preserves the uterus. (ACOG)'),
    (v_topic_id, '12: "Uterine Artery Embolization" (UAE) works by:', '["Cutting the nerves", "Injecting microspheres to block blood flow to the fibroids, causing infarction", "Suction", "None"]', 1, 'Minimally invasive alternative to surgery. (Williams)'),
    (v_topic_id, '13: UAE is generally NOT recommended for women who:', '["Are obese", "Desire future pregnancy (due to potential placental/uterine effects)", "Are over 40", "None"]', 1, 'Long-term fertility outcomes are less certain than myomectomy. (ACOG)'),
    (v_topic_id, '14: "GnRH Agonists" (e.g., Leuprolide) are used pre-operatively for fibroids to:', '["Make the surgery longer", "Shrink the fibroids and improve anemia before surgery", "Cure the fibroids", "None"]', 1, 'Induces a temporary hypoestrogenic state. (Beckmann)'),
    (v_topic_id, '15: "Adenomyosis" is defined as:', '["Fibroids", "Presence of endometrial glands and stroma within the myometrium", "Infection", "None"]', 1, 'Often called "endometriosis of the uterus." (Williams)'),
    (v_topic_id, '16: Classic physical exam finding for Adenomyosis?', '["Hard, irregular uterus", "Symmetrically enlarged, soft (\"boggy\"), and globally tender uterus", "Small uterus", "None"]', 1, 'Contrasts with the firm/irregular uterus of fibroids. (Beckmann)'),
    (v_topic_id, '17: Common symptoms of Adenomyosis?', '["Secondary dysmenorrhea and heavy menstrual bleeding", "Fever", "Weight gain", "None"]', 0, 'Usually affects women in their late 30s-40s. (ACOG)'),
    (v_topic_id, '18: Definitive treatment for Adenomyosis?', '["Myomectomy", "Hysterectomy", "OCPs", "None"]', 1, 'Hormonal suppression can help, but surgery is the only cure. (Williams)'),
    (v_topic_id, '19: "Mirena" (Levonorgestrel IUD) helps in Adenomyosis by:', '["Removing the glands", "Thinning the endometrium and reducing bleeding/pain", "Infecting the uterus", "None"]', 1, 'A common first-line conservative management. (Beckmann)'),
    (v_topic_id, '20: "Leiomyoma" vs "Leiomyosarcoma": What is the risk of a "fibroid" actually being a sarcoma?', '["50%", "< 1 in 1000", "10%", "None"]', 1, 'Very rare; sarcomas usually arise de novo. (ACOG)'),
    (v_topic_id, '21: "Fibroid" location: "Intramural" means:', '["Inside the cavity", "On the outside", "Within the muscular wall of the uterus", "In the tube"]', 2, 'The most common location overall. (Williams)'),
    (v_topic_id, '22: "Pedunculated" fibroids are attached by a:', '["Base", "Stalk", "Nerve", "None"]', 1, 'Can undergo torsion, causing acute pain. (Beckmann)'),
    (v_topic_id, '23: Which race has a higher prevalence and earlier onset of uterine fibroids?', '["White", "African American", "Asian", "Hispanic"]', 1, 'Up to 70-80% of Black women will develop fibroids by age 50. (ACOG)'),
    (v_topic_id, '24: "Estrogen" receptors are _____ in fibroids compared to normal myometrium.', '["Lower", "Higher", "Absent", "Same"]', 1, 'Contributes to their rapid growth in reproductive years. (Williams)'),
    (v_topic_id, '25: "Hyaline Degeneration" is the most common type of degeneration in fibroids. It results in:', '["Calcification", "Replacement of muscle with clear, proteinaceous tissue", "Fat", "Infection"]', 1, 'A common pathological finding. (Beckmann)'),
    (v_topic_id, '26: "Cystic Degeneration" occurs when the hyaline tissue:', '["Hardens", "Liquefies", "Bleeds", "None"]', 1, 'Looks like a fluid-filled cavity on imaging. (Williams)'),
    (v_topic_id, '27: "Calcific Degeneration" is most common in which group?', '["Teens", "Postmenopausal women", "Pregnant women", "None"]', 1, 'Results in a "popcorn" appearance on X-ray. (Beckmann)'),
    (v_topic_id, '28: "Submucosal" fibroids are classified by their:', '["Color", "Depth of extension into the myometrium (Type 0, 1, 2)", "Weight", "None"]', 1, 'Type 0 is completely within the cavity. (FIGO)'),
    (v_topic_id, '29: "Hysteroscopic Myomectomy" is the preferred approach for removing:', '["Large subserosal fibroids", "Submucosal fibroids (Type 0 and 1)", "Intramural fibroids", "None"]', 1, 'Allows for removal via the cervix without abdominal incisions. (ACOG)'),
    (v_topic_id, '30: "Endometrial Ablation" can be used for bleeding control in fibroids ONLY if:', '["Fibroids are < 3 cm and do not distort the cavity", "Fibroids are large", "The patient wants babies", "None"]', 0, 'Distortion prevents the ablation device from reaching all tissue. (Beckmann)'),
    (v_topic_id, '31: "Adenomyosis" - Typical age of presentation?', '["Puberty", "Parous women in their 40s and 50s", "Infants", "None"]', 1, 'Often found incidentally in hysterectomy specimens. (Williams)'),
    (v_topic_id, '32: "Adenomyosis" on ultrasound often shows "heterogeneous" myometrium and:', '["Myometrial cysts", "Clear borders", "No blood flow", "None"]', 0, 'Islands of ectopic endometrium. (Beckmann)'),
    (v_topic_id, '33: "Junctional Zone" thickening (> 12 mm) on MRI is a key diagnostic feature of:', '["Fibroids", "Adenomyosis", "Cancer", "None"]', 1, 'The JZ is the inner layer of the myometrium. (Williams)'),
    (v_topic_id, '34: "Secondary Dysmenorrhea" in Adenomyosis starts:', '["Before menses", "During menses and persists", "Only after menses", "None"]', 1, 'Due to bleeding within the myometrium. (Beckmann)'),
    (v_topic_id, '35: "Endometriosis" differs from Adenomyosis because the ectopic tissue is located:', '["Within the myometrium", "OUTSIDE the uterus (e.g., ovaries, peritoneum)", "In the cervix", "None"]', 1, 'Fundamental distinction. (ACOG)'),
    (v_topic_id, '36: "Leiomyoma" - Most common location for "calcification"?', '["Submucosal", "Subserosal", "Intramural", "None"]', 1, 'Due to poorer blood supply at the periphery. (Williams)'),
    (v_topic_id, '37: "Uterine Artery" arises from the _____ branch of the Internal Iliac Artery.', '["Posterior", "Anterior", "Superior", "None"]', 1, 'High-yield anatomy for UAE. (Beckmann)'),
    (v_topic_id, '38: "Parasitic" fibroid is a subserosal fibroid that:', '["Has worms", "Attaches to a nearby organ (e.g., omentum) and develops a new blood supply, losing its connection to the uterus", "Is infectious", "None"]', 1, 'A rare clinical entity. (Williams)'),
    (v_topic_id, '39: "Cervical" fibroids can cause:', '["Dyspareunia and urinary obstruction", "Twins", "Infertility only", "None"]', 0, 'Due to their location in the pelvis. (Beckmann)'),
    (v_topic_id, '40: "Prolapsed" fibroid (Fibroid in evolution):', '["Subserosal", "A submucosal fibroid that has detached and passed through the cervix", "Cancer", "None"]', 1, 'Can be removed vaginally. (ACOG)'),
    (v_topic_id, '41: "GnRH Agonist" therapy is limited to 6 months because of the risk of:', '["Cancer", "Bone loss (Osteoporosis)", "Hair loss", "None"]', 1, 'Due to prolonged low estrogen levels. (Beckmann)'),
    (v_topic_id, '42: "Add-back" therapy (low-dose estrogen/progestin) is used with GnRH agonists to:', '["Stop the drug", "Reduce side effects like hot flashes and bone loss while maintaining efficacy", "Help pregnancy", "None"]', 1, 'Extends the duration of safe use. (ACOG)'),
    (v_topic_id, '43: "Uterine Fibroids" - Is a biopsy required before surgery?', '["Always", "No, diagnosis is usually clinical/radiological unless malignancy is suspected", "Yes", "None"]', 1, 'Standard practice. (Beckmann)'),
    (v_topic_id, '44: "Leiomyoma" - Can they cause "Polycythemia"?', '["No", "Yes, rare production of erythropoietin by the tumor", "Always", "None"]', 1, 'A rare paraneoplastic syndrome. (Williams)'),
    (v_topic_id, '45: "Adenomyosis" - Is it associated with infertility?', '["No", "Yes, potentially by affecting embryo implantation and uterine contractility", "Only in men", "None"]', 1, 'Increasingly recognized in fertility workups. (ACOG)'),
    (v_topic_id, '46: "Halban''s Sign" (sensitive, tender uterus during premenstrual phase) is associated with:', '["Fibroids", "Adenomyosis", "Cancer", "None"]', 1, 'Classic eponym. (Beckmann)'),
    (v_topic_id, '47: "Uterine Artery Embolization" - Potential complication?', '["Post-embolization syndrome (Pain, fever, malaise)", "Premature ovarian failure", "Infection", "All of the above"]', 3, 'Patient counseling is essential. (Williams)'),
    (v_topic_id, '48: "Myomectomy" - Risk of recurrence?', '["0%", "Significant (~15-30% within 5-10 years)", "100%", "None"]', 1, 'New fibroids can develop from existing microscopic seeds. (ACOG)'),
    (v_topic_id, '49: "Hysterectomy" - "Supracervical" (Partial) removes the:', '["Cervix only", "Uterine body, leaving the cervix in place", "Whole uterus", "Ovaries"]', 1, 'Option for benign disease to preserve pelvic support. (Beckmann)'),
    (v_topic_id, '50: "Hysterectomy" - "Total" removes the:', '["Body and Cervix", "Body only", "Ovaries", "None"]', 0, 'Most common approach. (ACOG)'),
    (v_topic_id, '51: "Salpingo-oophorectomy" is the removal of:', '["The tubes and ovaries", "The uterus", "The cervix", "None"]', 0, 'May be done concurrently with hysterectomy. (Beckmann)'),
    (v_topic_id, '52: "Adenomyoma" is a:', '["Fibroid", "Localized area of adenomyosis that mimics a fibroid", "Cancer", "None"]', 1, 'Lacks the distinct pseudo-capsule of a true fibroid. (Williams)'),
    (v_topic_id, '53: "Fibroids" - Can they cause "Hydronephrosis"?', '["No", "Yes, large fibroids can compress the ureters against the pelvic brim", "Only in GDM", "None"]', 1, 'May present as flank pain. (Beckmann)'),
    (v_topic_id, '54: "Fibroids" - Effect on labor?', '["Always C-section", "Can cause malpresentation, labor dystocia, or PPH", "No effect", "None"]', 1, 'Depends on size and location. (ACOG)'),
    (v_topic_id, '55: "Submucosal" fibroid removal - First-line surgical approach?', '["Laparoscopy", "Hysteroscopy", "Laparotomy", "None"]', 1, 'Least invasive and most effective for cavity lesions. (ACOG)'),
    (v_topic_id, '56: "Intramural" fibroid removal - Approach?', '["Laparoscopy or Laparotomy (depending on size/number)", "Hysteroscopy", "Vaginal", "None"]', 0, 'Requires entry into the myometrium. (Beckmann)'),
    (v_topic_id, '57: "Adenomyosis" - Are "ovaries" affected?', '["Always", "No, it is a uterine condition", "Only in teens", "None"]', 1, 'Contrasts with endometriosis. (Williams)'),
    (v_topic_id, '58: "Adenomyosis" - Is it associated with "Endometrial Cancer"?', '["No direct link, but both are associated with hyperestrogenic states", "Yes, directly", "Only in smoking", "None"]', 0, 'Common soil but different pathologies. (Beckmann)'),
    (v_topic_id, '59: "Fibroids" - Does "smoking" affect risk?', '["Increases", "Decreases (potentially due to lower estrogen levels)", "No effect", "None"]', 1, 'Interestingly, smoking is a protective factor for fibroids. (Williams)'),
    (v_topic_id, '60: "Adenomyosis" - "Menstrual phase" appearance on ultrasound?', '["Normal", "Small anechoic spaces (hemorrhage) within the myometrium", "Solid mass", "None"]', 1, 'Dynamic changes during the cycle. (Beckmann)');

    RAISE NOTICE 'SUCCESS: Batch 1 (1-60) MCQs for Benign Gynecology registered.';
END $$;
COMMIT;
