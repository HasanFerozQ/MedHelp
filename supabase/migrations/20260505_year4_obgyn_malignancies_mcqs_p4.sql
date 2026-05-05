BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-malignancies' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-malignancies not found.';
    END IF;

    -- Batch 4: 181-240 (Special Populations, Hereditary Syndromes, and Advanced Management)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '181: "HIV-positive" women should have cervical cancer screening:', '["Every 3 years", "Twice in the first year after diagnosis, then annually (or every 3 years if age > 30 and negative)", "Every 5 years", "Never"]', 1, 'Immunocompromised status increases risk and progression of HPV disease. (ACOG)'),
    (v_topic_id, '182: Cervical cancer screening in women with "HIV" continues:', '["Until age 65", "Throughout their lifetime", "Until age 50", "None"]', 1, 'Unlike the general population, they do not stop at 65. (ACOG)'),
    (v_topic_id, '183: "Solid" adnexal mass on ultrasound in a postmenopausal woman is:', '["Highly suspicious for malignancy", "Definitely benign", "Always an infection", "None"]', 0, 'Warrants further workup and potentially surgical exploration. (Beckmann)'),
    (v_topic_id, '184: "Ascites" in the presence of an adnexal mass suggests Stage _____ Ovarian Cancer.', '["I", "II", "III or IV", "None"]', 2, 'Indicates peritoneal involvement. (Williams)'),
    (v_topic_id, '185: "Sister Mary Joseph Nodule" biopsy would most likely show:', '["Inflammation", "Adenocarcinoma", "Yeast", "None"]', 1, 'It is a metastatic deposit. (Beckmann)'),
    (v_topic_id, '186: "Call-Exner Bodies" are pathognomonic for:', '["Serous cancer", "Granulosa Cell Tumor", "Dysgerminoma", "None"]', 1, 'Small, fluid-filled spaces between granulosa cells. (Williams)'),
    (v_topic_id, '187: "Schiller-Duval Bodies" are pathognomonic for:', '["Endometrial cancer", "Yolk Sac Tumor (Endodermal Sinus Tumor)", "Choriocarcinoma", "None"]', 1, 'Look like primitive glomeruli. (Beckmann)'),
    (v_topic_id, '188: "Coffee-bean" nuclei on histology are seen in:', '["Brenner Tumor", "Granulosa Cell Tumor", "Both A and B", "None"]', 2, 'Characteristic nuclear groove. (Williams)'),
    (v_topic_id, '189: "Psammoma Bodies" (concentric calcifications) are seen in which Ovarian cancer?', '["High-grade Serous Carcinoma", "Clear cell", "Mucinous", "None"]', 0, 'Also seen in papillary thyroid and meningioma. (Beckmann)'),
    (v_topic_id, '190: A "Krukenberg Tumor" usually presents:', '["Unilaterally", "Bilaterally", "In the uterus", "None"]', 1, 'Metastatic spread often affects both ovaries. (Williams)'),
    (v_topic_id, '191: "Signet Ring Cells" on ovarian biopsy suggest:', '["Primary ovarian cancer", "Metastatic GI cancer (Krukenberg)", "Dermoid", "None"]', 1, 'Intracellular mucin displaces the nucleus. (Beckmann)'),
    (v_topic_id, '192: A "Mature Teratoma" containing malignant tissue (Malignant Transformation) most commonly shows:', '["Adenocarcinoma", "Squamous Cell Carcinoma", "Melanoma", "None"]', 1, 'Usually arises from the squamous component (skin) within the cyst. (Williams)'),
    (v_topic_id, '193: "Endometrial Cancer" with "myometrial invasion > 50%" is Stage:', '["IA", "IB", "II", "None"]', 1, 'FIGO Stage IB. (ACOG)'),
    (v_topic_id, '194: "Stage II" Endometrial cancer differs from Stage I because it involves the:', '["Ovary", "Cervical stroma", "Bladder", "None"]', 1, 'Confined to the uterus but involves the cervix. (Beckmann)'),
    (v_topic_id, '195: A woman on "Tamoxifen" has a new onset of vaginal bleeding. Next step?', '["Adjust dose", "Endometrial Biopsy (EMB)", "Wait and see", "None"]', 1, 'Tamoxifen is an agonist on the endometrium. (ACOG)'),
    (v_topic_id, '196: "Hereditary Nonpolyposis Colorectal Cancer" (HNPCC) / Lynch Syndrome is inherited in an _____ pattern.', '["Autosomal recessive", "Autosomal dominant", "X-linked", "None"]', 1, 'High penetrance for multiple cancers. (Williams)'),
    (v_topic_id, '197: "Gestational Trophoblastic Neoplasia" (GTN) - Which marker is used for follow-up?', '["AFP", "hCG", "CA-125", "None"]', 1, 'The hCG level perfectly correlates with tumor volume. (ACOG)'),
    (v_topic_id, '198: "Choriocarcinoma" is unique among cancers because it can be cured with chemotherapy even in the presence of _____ metastasis.', '["Brain and Liver", "Bone", "Skin", "None"]', 0, 'Highly sensitive to treatment, though brain/liver carry a higher score. (Williams)'),
    (v_topic_id, '199: "Placental Site Trophoblastic Tumor" (PSTT) - Why is it chemoresistant?', '["It grows too fast", "It arises from "intermediate" trophoblasts which are less metabolically active than syncytiotrophoblasts", "It is infectious", "None"]', 1, 'Surgery is the curative approach. (Beckmann)'),
    (v_topic_id, '200: "Invasive Mole" (Chorioadenoma destruens) differs from a simple mole because it:', '["Is always malignant", "Invades the myometrium and may cause uterine perforation", "Is benign", "None"]', 1, 'Villi are present but invasive. (Williams)'),
    (v_topic_id, '201: "Vulvar SCC" Stage IA has an invasion depth of < _____ mm.', '["1", "3", "5", "None"]', 0, 'Can be treated with wide local excision alone. (ACOG)'),
    (v_topic_id, '202: "Vulvar SCC" Stage IB has an invasion depth of > _____ mm.', '["1", "3", "5", "None"]', 0, 'Requires lymph node assessment. (Beckmann)'),
    (v_topic_id, '203: "Vaginal Melanoma" typically occurs in the:', '["Upper vagina", "Distal 1/3 of the vagina", "Cervix", "None"]', 1, 'Very poor prognosis. (Williams)'),
    (v_topic_id, '204: "Vaginal Clear Cell Adenocarcinoma" - Typical age of presentation for DES daughters?', '["10 years old", "Late teens or early 20s", "Postmenopausal", "None"]', 1, 'Classic association with intrauterine exposure. (Beckmann)'),
    (v_topic_id, '205: A "Hydatidiform Mole" is suspected. What should be checked on the "Chest X-ray"?', '["Pneumonia", "Trophoblastic emboli or metastatic disease (GTN)", "Heart size", "None"]', 1, 'Standard part of the initial workup. (ACOG)'),
    (v_topic_id, '206: "Gestational Trophoblastic Neoplasia" - Most common site for the first metastasis?', '["Vagina (presents as purple/blue nodules)", "Brain", "Liver", "None"]', 0, 'Highly vascular deposits. (Williams)'),
    (v_topic_id, '207: "Vaginal" metastasis from Choriocarcinoma should _____ be biopsied.', '["Always", "NEVER (due to risk of catastrophic hemorrhage)", "Only if small", "None"]', 1, 'They are extremely vascular. (ACOG)'),
    (v_topic_id, '208: "Cervical Cancer" - High-risk HPV E6 protein inactivates which tumor suppressor?', '["Rb", "p53", "APC", "None"]', 1, 'E6 -> p53 degradation. (Williams)'),
    (v_topic_id, '209: "Cervical Cancer" - High-risk HPV E7 protein inactivates which tumor suppressor?', '["p53", "Rb (Retinoblastoma)", "KRAS", "None"]', 1, 'E7 -> Rb inactivation. (Williams)'),
    (v_topic_id, '210: "Stage IVA" Cervical cancer involves the:', '["Uterus", "Bladder or rectal mucosa", "Lungs", "Brain"]', 1, 'Extension to adjacent pelvic organs. (Beckmann)'),
    (v_topic_id, '211: "Stage IVB" Cervical cancer involves:', '["Distant metastasis", "Vagina", "Parametria", "None"]', 0, 'Spread beyond the pelvis. (Williams)'),
    (v_topic_id, '212: "Radiation" for cervical cancer: "Brachytherapy" involves:', '["External beam", "Placing radioactive sources directly into the cervix/vagina", "Oral pills", "None"]', 1, 'Allows high dose to the tumor with low dose to surrounding organs. (Beckmann)'),
    (v_topic_id, '213: A "Vaginal Cuff" recurrence of Endometrial cancer is treated with:', '["Surgery only", "Radiation (if not previously irradiated)", "Antibiotics", "None"]', 1, 'Can often be salvaged with local radiation. (ACOG)'),
    (v_topic_id, '214: "Adnexal Mass": A "Simple Cyst" < 5 cm in a premenopausal woman is usually:', '["Cancer", "Physiologic (Follicular or Luteal)", "Infection", "None"]', 1, 'Can be followed with repeat ultrasound in 6-8 weeks. (Beckmann)'),
    (v_topic_id, '215: "Adnexal Mass": A "Complex Cyst" with thick septations and solid components is:', '["Benign", "Suspicious for malignancy", "Normal", "None"]', 1, 'Requires evaluation by a Gyn Oncologist. (ACOG)'),
    (v_topic_id, '216: "Ovarian Cancer" - What is "Omentectomy"?', '["Removal of the uterus", "Removal of the fatty apron of peritoneum (omentum) which is a common site for seeding", "Removal of the bladder", "None"]', 1, 'Mandatory part of staging and debulking. (Williams)'),
    (v_topic_id, '217: "BRCA1" carriers also have an increased risk of which other cancers?', '["Breast and Pancreas", "Colon", "Brain", "None"]', 0, 'Requires intensive screening for both sites. (ACOG)'),
    (v_topic_id, '218: "Lynch Syndrome" carriers should be offered prophylactic Hysterectomy and BSO at age:', '["25", "40-45 (after childbearing)", "60", "None"]', 1, 'To eliminate the high risk of endometrial/ovarian cancer. (ACOG)'),
    (v_topic_id, '219: "Granulosa Cell Tumor" - Why do these patients get Endometrial Biopsies?', '["They have infection", "The tumor secretes estrogen, which can cause concurrent endometrial hyperplasia or cancer", "Routine", "None"]', 1, 'Always evaluate the lining if the tumor is estrogen-producing. (Beckmann)'),
    (v_topic_id, '220: "Thecoma" is a benign stromal tumor that often secretes:', '["Androgens", "Estrogen", "Progesterone", "None"]', 1, 'Behavior similar to granulosa cell tumors but benign. (Williams)'),
    (v_topic_id, '221: "Fibroma" of the ovary is:', '["Malignant", "Benign (solid tumor of connective tissue)", "Infectious", "None"]', 1, 'The mass in Meigs syndrome. (Beckmann)'),
    (v_topic_id, '222: "Brenner Tumor" is an uncommon epithelial tumor that looks like:', '["Skin", "Bladder epithelium (Urothelium)", "Thyroid", "None"]', 1, 'Usually benign. (Williams)'),
    (v_topic_id, '223: "Vulvar Melanoma": The most important prognostic factor is:', '["Color", "Depth of invasion (Breslow thickness)", "Itch", "None"]', 1, 'Standard melanoma prognosticator. (Beckmann)'),
    (v_topic_id, '224: "Hydatidiform Mole" - Why avoid pregnancy during the 6-month hCG monitoring period?', '["It causes cancer", "A new pregnancy will rise hCG, making it impossible to tell if the mole has returned (GTN)", "Birth control is better", "None"]', 1, 'Contraception is mandatory during follow-up. (ACOG)'),
    (v_topic_id, '225: "Gestational Trophoblastic Neoplasia" - Most common cause of death?', '["Infection", "Hemorrhage from metastatic sites or CNS involvement", "Renal failure", "None"]', 1, 'Tumors are highly friable and vascular. (Williams)'),
    (v_topic_id, '226: "HPV-16" is most commonly associated with which histology?', '["Squamous Cell Carcinoma", "Adenocarcinoma", "Sarcoma", "None"]', 0, 'Classic association. (Beckmann)'),
    (v_topic_id, '227: "HPV-18" is more commonly associated with which histology?', '["Squamous", "Adenocarcinoma", "Skin cancer", "None"]', 1, 'Often presents in the endocervix. (Williams)'),
    (v_topic_id, '228: "Bethesda" result: "LGSIL" (Low-grade SIL) on a Pap smear is equivalent to which CIN grade?', '["CIN 1", "CIN 2", "CIN 3", "Cancer"]', 0, 'Reflects the cellular changes of HPV infection. (ACOG)'),
    (v_topic_id, '229: "Bethesda" result: "HGSIL" (High-grade SIL) is equivalent to which CIN grade?', '["CIN 1", "CIN 2 and CIN 3", "Cancer", "None"]', 1, 'Reflects high-grade dysplasia. (ACOG)'),
    (v_topic_id, '230: "Endocervical Curettage" (ECC) is used during colposcopy to sample:', '["The outside of the cervix", "The canal (endocervix) where the lesion may be hiding", "The uterus", "The bladder"]', 1, 'Essential if the transformation zone is not fully seen. (Beckmann)'),
    (v_topic_id, '231: "Conization" (CKC or LEEP) is both diagnostic and:', '["Dangerous", "Therapeutic (it removes the lesion)", "Infectious", "None"]', 1, 'May be the only treatment needed for high-grade CIN. (Williams)'),
    (v_topic_id, '232: "Stage IA2" Cervical cancer has an invasion depth of:', '["< 1mm", "3-5 mm", "10 mm", "None"]', 1, 'Intermediate early stage. (ACOG)'),
    (v_topic_id, '233: "Endometrial Cancer" with "Positive Peritoneal Washings":', '["Automatically makes it Stage III", "No longer changes the stage (FIGO 2009) but should be recorded", "Makes it Stage IV", "None"]', 1, 'Prognostic but not staging-changing in the updated system. (Beckmann)'),
    (v_topic_id, '234: "Dilation and Curettage" (D&C) is _____ sensitive for endometrial cancer than EMB.', '["Less", "More (as more tissue is sampled)", "Same", "None"]', 1, 'But EMB is preferred first due to being an office procedure. (Williams)'),
    (v_topic_id, '235: "Ovarian Cancer" - "CA-125" is a glycoprotein produced by:', '["The tumor only", "Coelomic epithelium (peritoneum, pleura, pericardium)", "The liver", "The brain"]', 1, 'Explains why inflammation in these areas causes elevations. (Beckmann)'),
    (v_topic_id, '236: "Germ Cell Tumors" - Which one is associated with "Turner Syndrome" (45, X) and streak ovaries?', '["Dermoid", "Dysgerminoma", "Gonadoblastoma", "None"]', 2, 'Y-chromosome material in a streak ovary is a high-risk factor. (Williams)'),
    (v_topic_id, '237: "Gonadoblastoma": Management for a girl with Turner Syndrome and Y-chromosome material?', '["Observation", "Bilateral Gonadectomy (due to 25% risk of malignant transformation)", "Hormones only", "None"]', 1, 'Standard of care. (Beckmann)'),
    (v_topic_id, '238: "Choriocarcinoma": Why is it so "hemorrhagic"?', '["It is a blood clot", "It lacks a basement membrane and invades blood vessels directly", "Infection", "None"]', 1, 'Reflects the normal behavior of trophoblasts on "overdrive." (Williams)'),
    (v_topic_id, '239: "Endometrial stromal nodules" are:', '["Malignant", "Benign versions of stromal tumors", "Infectious", "None"]', 1, 'Well-circumscribed and non-invasive. (Beckmann)'),
    (v_topic_id, '240: "Stage II" Vulvar cancer involves:', '["Nodes", "Extension to adjacent structures (lower 1/3 vagina, urethra, or anus) but NO nodes", "Lungs", "None"]', 1, 'Local extension. (Williams)');

    RAISE NOTICE 'SUCCESS: Batch 4 (181-240) MCQs for Gyn Malignancies registered.';
END $$;
COMMIT;
