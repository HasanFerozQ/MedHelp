BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-malignancies' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-malignancies not found.';
    END IF;

    -- Batch 3: 121-180 (GTN, Fallopian Tube, and Advanced Staging Concepts)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '121: "Gestational Trophoblastic Neoplasia" (GTN) is suspected after molar evacuation if:', '["hCG levels plateau or rise", "hCG drops to zero", "Ultrasound shows a normal uterus", "None"]', 0, 'Indicates persistence or transformation to invasive disease. (ACOG)'),
    (v_topic_id, '122: Most common site of metastasis for "Choriocarcinoma"?', '["Liver", "Lungs", "Brain", "Bone"]', 1, 'Presents with hemoptysis or multiple "cannonball" nodules on CXR. (Williams)'),
    (v_topic_id, '123: Primary treatment for low-risk Gestational Trophoblastic Neoplasia?', '["Hysterectomy", "Single-agent Chemotherapy (Methotrexate or Dactinomycin)", "Radiation", "Wait"]', 1, 'Highly curative (~100% survival). (Beckmann)'),
    (v_topic_id, '124: Primary treatment for high-risk GTN (EMA-CO regimen)?', '["Methotrexate only", "Multi-agent Chemotherapy", "Surgery only", "None"]', 1, 'EMA-CO = Etoposide, Methotrexate, Actinomycin D, Cyclophosphamide, Vincristine. (ACOG)'),
    (v_topic_id, '125: "Placental Site Trophoblastic Tumor" (PSTT) is unique because it:', '["Produces high hCG", "Produces low hCG and is relatively chemoresistant; primary treatment is Hysterectomy", "Only occurs in teens", "None"]', 1, 'Arises from intermediate trophoblast cells. (Williams)'),
    (v_topic_id, '126: "Fallopian Tube Cancer" classically presents with "Latzko''s Triad":', '["Fever, Rash, Pain", "Intermittent profuse watery vaginal discharge (hydrops tubae profluens), pelvic pain, and mass", "Cough, Hemoptysis, Weight loss", "None"]', 1, 'Rare primary tumor, behavior similar to ovarian cancer. (Beckmann)'),
    (v_topic_id, '127: "Cervical Intraepithelial Neoplasia" (CIN): Which cells are the origin of HPV-related dysplasia?', '["Parabasal cells in the transformation zone", "Dead squamous cells", "Glandular cells only", "None"]', 0, 'HPV infects the basal layer through micro-abrasions. (Williams)'),
    (v_topic_id, '128: "Bethesda System" is used for reporting:', '["Hysterectomy margins", "Cervical cytology (Pap smear) results", "Ovarian tumor markers", "None"]', 1, 'Standardized reporting for cervical screening. (ACOG)'),
    (v_topic_id, '129: "ASC-H" (Atypical Squamous Cells, cannot exclude HSIL) management?', '["Repeat pap in 1 year", "Colposcopy", "LEEP", "Hysterectomy"]', 1, 'Higher risk of CIN 2/3 than ASC-US; colposcopy is mandatory. (ACOG)'),
    (v_topic_id, '130: "AGC" (Atypical Glandular Cells) on a Pap smear in a woman > 35. What is the required workup?', '["Colposcopy only", "Colposcopy, Endocervical Curettage (ECC), AND Endometrial Biopsy (EMB)", "Hysterectomy", "None"]', 1, 'AGC can originate from the cervix or the endometrium. (ACOG)'),
    (v_topic_id, '131: Management of "CIN 1" found on colposcopic biopsy?', '["Immediate LEEP", "Observation with repeat screening in 1 year", "Radiation", "None"]', 1, 'Low-grade lesions usually regress without intervention. (ACOG)'),
    (v_topic_id, '132: If colposcopy is "inadequate" (entire transformation zone not seen), and high-grade disease is suspected, what is the next step?', '["Repeat in 5 years", "Diagnostic Excisional Procedure (CKC or LEEP)", "MRI", "None"]', 1, 'Must exclude occult invasive cancer or deep CIN. (Beckmann)'),
    (v_topic_id, '133: A pregnant woman has a Pap result of HSIL. Management?', '["Immediate LEEP", "Colposcopy (biopsy only if invasive cancer suspected); otherwise re-evaluate postpartum", "Abortion", "None"]', 1, 'LEEP is avoided in pregnancy due to risk of hemorrhage and pregnancy loss. (ACOG)'),
    (v_topic_id, '134: "Microinvasive" cervical cancer (IA1) has a depth of invasion < _____ mm.', '["1", "3", "5", "7"]', 1, 'Low risk of lymph node metastasis. (Williams)'),
    (v_topic_id, '135: "Endometrial Hyperplasia" classification (WHO 2014): "Atypical Hyperplasia" (EIN) has a progression risk to cancer of:', '["1%", "10%", "30-40%", "90%"]', 2, 'Requires aggressive management (Progestins vs Surgery). (ACOG)'),
    (v_topic_id, '136: A woman with "Endometrial Cancer" has "adnexal" spread. What stage is this?', '["I", "II", "III (IIIA)", "IV"]', 2, 'Local/regional spread. (FIGO)'),
    (v_topic_id, '137: "Endometrial Cancer" spread to the vagina is Stage:', '["I", "II", "IIIB", "IV"]', 2, 'FIGO Stage III includes vaginal involvement. (Williams)'),
    (v_topic_id, '138: "Endometrial Cancer" with positive para-aortic lymph nodes is Stage:', '["II", "IIIA", "IIIC2", "IV"]', 2, 'Specifically IIIC2. (Beckmann)'),
    (v_topic_id, '139: Primary risk of "Uterine Sarcoma" (e.g., Leiomyosarcoma) compared to fibroids?', '["Fibroids often turn into sarcoma", "Sarcomas are de novo malignancies; risk of malignant change in a fibroid is < 1 in 1000", "They are the same", "None"]', 1, 'Fibroids are benign; sarcomas are highly aggressive. (Williams)'),
    (v_topic_id, '140: "Uterine Leiomyosarcoma" (LMS) should be suspected in a postmenopausal woman with:', '["Small fibroids", "Rapidly enlarging \"fibroid\" mass and bleeding", "No symptoms", "None"]', 1, 'Classic board scenario. (Beckmann)'),
    (v_topic_id, '141: "Endometrial Stromal Sarcoma" (ESS) is characterized by:', '["Aggressive growth", "Slow growth and often responds to hormonal therapy (Progestins)", "Cervical origin", "None"]', 1, 'Low-grade tumor with indolent behavior. (Williams)'),
    (v_topic_id, '142: "Ovarian Cancer" risk reduction: "Bilateral Tubal Ligation" reduces risk by:', '["10%", "~30-50%", "90%", "0%"]', 1, 'Likely by preventing STIC cells from reaching the ovary. (ACOG)'),
    (v_topic_id, '143: "Laparoscopic" surgery for Ovarian Cancer is generally reserved for:', '["All patients", "Early stage (suspected Stage I) and diagnosis/biopsy", "Stage IV", "None"]', 1, 'Laparotomy is preferred for full staging and debulking. (Williams)'),
    (v_topic_id, '144: "Neoadjuvant Chemotherapy" (NACT) in ovarian cancer is used when:', '["The patient is young", "Extensive disease makes primary debulking unsafe or unlikely to be successful", "The patient prefers it", "None"]', 1, 'Shrink tumor before performing interval debulking. (ACOG)'),
    (v_topic_id, '145: "Intraperitoneal (IP) Chemotherapy" in ovarian cancer:', '["Is always worse", "May improve survival in patients with small-volume residual disease after debulking", "Is only for liver mets", "None"]', 1, 'Direct delivery into the peritoneal cavity. (Williams)'),
    (v_topic_id, '146: "Ovarian Torsion" is an emergency. Which type of ovarian mass is most likely to torse?', '["Tiny cyst", "Mass > 5-6 cm (e.g., Dermoid or Paraovarian cyst)", "Advanced cancer", "None"]', 1, 'Weight and mobility allow the pedicle to twist. (Beckmann)'),
    (v_topic_id, '147: "Adnexal Mass" in a CHILD is most likely:', '["Epithelial cancer", "Germ cell tumor (e.g., Dermoid or Malignant Germ Cell)", "Fibroid", "None"]', 1, 'Requires careful investigation for malignancy. (Williams)'),
    (v_topic_id, '148: "Mature Teratoma" (Dermoid) is most at risk for which complication?', '["Rupture", "Torsion", "Infection", "None"]', 1, 'Very mobile and heavy. (Beckmann)'),
    (v_topic_id, '149: "Lichen Sclerosus" is treated with:', '["Antibiotics", "High-potency topical corticosteroids (e.g., Clobetasol)", "Surgery", "Wait"]', 1, 'To relieve symptoms and reduce cancer risk. (ACOG)'),
    (v_topic_id, '150: "Vulvar Intraepithelial Neoplasia" (VIN) "Usual" type is associated with:', '["HPV", "Old age", "Lichen Sclerosus", "None"]', 0, 'Often multifocal and seen in smokers. (Williams)'),
    (v_topic_id, '151: "Vulvar Intraepithelial Neoplasia" (VIN) "Differentiated" type is associated with:', '["HPV", "Lichen Sclerosus and chronic inflammation", "Youth", "None"]', 1, 'High risk of progression to invasive SCC. (Beckmann)'),
    (v_topic_id, '152: "Stage I" Vulvar Cancer:', '["Mets to nodes", "Confined to the vulva/perineum with NO node involvement", "Spread to anus", "None"]', 1, 'Early stage. (Williams)'),
    (v_topic_id, '153: Primary treatment for Vulvar Cancer (Stage IB and beyond)?', '["Radiation only", "Radical local excision or vulvectomy with inguinal lymph node assessment", "Chemotherapy only", "None"]', 1, 'Surgery is the mainstay. (ACOG)'),
    (v_topic_id, '154: "Vaginal Intraepithelial Neoplasia" (VaIN) 3 requires:', '["No treatment", "Excision or Laser ablation", "Radiation", "None"]', 1, 'High-grade precursor. (Beckmann)'),
    (v_topic_id, '155: Primary treatment for invasive "Vaginal Cancer" (all stages)?', '["Surgery for everyone", "Radiation Therapy (External and Brachytherapy)", "Chemotherapy only", "Wait"]', 1, 'Surgery is difficult due to proximity to bladder/rectum; radiation is standard. (Williams)'),
    (v_topic_id, '156: "Hydatidiform Mole": Which type has a higher risk of malignant GTN transformation?', '["Partial (5%)", "Complete (~15-20%)", "They are equal", "None"]', 1, 'Complete moles require stricter follow-up. (ACOG)'),
    (v_topic_id, '157: "Choriocarcinoma" histology?', '["Fetal parts", "Sheet of malignant syncytiotrophoblasts and cytotrophoblasts with NO villi", "Villi present", "None"]', 1, 'Highly vascular and invasive. (Williams)'),
    (v_topic_id, '158: GTN scoring (FIGO/WHO) of 7 or greater indicates:', '["Low-risk (Single agent chemo)", "High-risk (Multi-agent chemo)", "Infection", "Normal"]', 1, 'Determines the aggressiveness of treatment. (ACOG)'),
    (v_topic_id, '159: "Cervical Cancer" - Radical Trachelectomy is:', '["Removal of the whole uterus", "Removal of the cervix and parametria, preserving the uterus for fertility", "Ovary removal", "None"]', 1, 'An option for young women with small early-stage tumors. (Williams)'),
    (v_topic_id, '160: "Parametrium" is the connective tissue adjacent to the:', '["Ovaries", "Cervix and Uterine body", "Vulva", "None"]', 1, 'Involvement indicates Stage IIB disease. (Beckmann)'),
    (v_topic_id, '161: "Endometrial Cancer" - High-grade tumors (G3) have > _____% solid growth pattern.', '["10%", "30%", "50%", "90%"]', 2, 'Grading is based on the architectural solid component. (FIGO)'),
    (v_topic_id, '162: "Ovarian Cancer" - "Stage IC" means:', '["Spread to liver", "Confined to ovary BUT with capsule rupture, surface tumor, or positive washings", "Node positive", "None"]', 1, 'Upstages from IA/IB due to potential for peritoneal seeding. (Williams)'),
    (v_topic_id, '163: "Dermoid Cyst" (Mature Teratoma) is usually found:', '["Only on the left", "Bilaterally in 10-15% of cases", "In the uterus", "None"]', 1, 'Always check the other ovary. (Beckmann)'),
    (v_topic_id, '164: "Sertoli-Leydig" tumors are common in which decade of life?', '["1st", "2nd and 3rd (average 25 years)", "7th", "None"]', 1, 'Tumors of young women. (Williams)'),
    (v_topic_id, '165: "Struma Ovarii" diagnosis is confirmed by:', '["hCG", "Thyroid follicles seen on histology of an ovarian mass", "AFP", "None"]', 1, 'A form of monodermal teratoma. (Beckmann)'),
    (v_topic_id, '166: "Cervical Cancer" - Most common site for distant metastasis?', '["Brain", "Lungs, Liver, and Bone", "Skin", "None"]', 1, 'Usually late in the disease. (Williams)'),
    (v_topic_id, '167: "Endometrial Cancer" - Recurrence most commonly occurs in the:', '["Lungs", "Vaginal vault", "Brain", "Liver"]', 1, 'Found on speculum exam during surveillance. (ACOG)'),
    (v_topic_id, '168: "Lynch Syndrome" (HNPCC) is due to mutations in:', '["BRCA", "DNA Mismatch Repair (MMR) genes (MLH1, MSH2, etc.)", "p53", "APC"]', 1, 'Leads to microsatellite instability. (Beckmann)'),
    (v_topic_id, '169: "Ca-125" half-life after surgery?', '["1 hour", "8-10 days", "1 month", "None"]', 1, 'Should drop significantly if debulking was successful. (Williams)'),
    (v_topic_id, '170: "Pelvic Exenteration" is an ultra-radical surgery for:', '["Primary cancer", "Recurrent cervical cancer confined to the pelvis after radiation", "Stage I disease", "None"]', 1, 'Involves removal of bladder, rectum, and reproductive organs. (Beckmann)'),
    (v_topic_id, '171: "HPV Vaccine" - If a person has already had HPV, should they still get the vaccine?', '["No", "Yes (it protects against other types they haven''t been exposed to yet)", "Only if they are < 18", "None"]', 1, 'Current recommendation. (ACOG)'),
    (v_topic_id, '172: "Endometrial Biopsy" (EMB) sensitivity for cancer?', '["10%", "50%", "~90-99%", "0%"]', 2, 'Highly effective for office diagnosis. (Williams)'),
    (v_topic_id, '173: A "Negative" EMB in a patient with PERSISTENT bleeding?', '["Ignore it", "Proceed to D&C/Hysteroscopy to ensure no focal lesion was missed", "Wait 1 year", "None"]', 1, 'Biopsy is a "blind" procedure. (ACOG)'),
    (v_topic_id, '174: "Pap Smear" in pregnancy - Is "Endocervical Curettage" (ECC) allowed?', '["Yes", "No (risk of pregnancy injury)", "Only in 3rd trimester", "None"]', 1, 'Contraindicated in pregnancy. (Beckmann)'),
    (v_topic_id, '175: "Colposcopy" - "Green Filter" is used to visualize:', '["Blood", "Abnormal vascular patterns (punctation and mosaicism)", "White spots", "None"]', 1, 'Enhances the contrast of vessels. (Williams)'),
    (v_topic_id, '176: "Atypical Squamous Cells" (ASC) - What does "Undetermined Significance" mean?', '["It is definitely cancer", "Changes are present that may be reactive or dysplastic, but don''t meet criteria for SIL", "It is normal", "None"]', 1, 'The most common abnormal pap result. (ACOG)'),
    (v_topic_id, '177: "Endometrial Cancer" - Which histotype is associated with psammoma bodies?', '["Endometrioid", "Serous", "Mucinous", "None"]', 1, 'A high-grade, aggressive type. (Beckmann)'),
    (v_topic_id, '178: "Clear Cell" endometrial cancer is associated with:', '["Obesity", "Smoking", "Poor prognosis and high stage at presentation", "OCPs"]', 2, 'Like serous, it is an aggressive Type II cancer. (Williams)'),
    (v_topic_id, '179: "Vulvar Cancer" - Which node is the "Sentinel" node typically located in?', '["Axillary", "Superficial inguinal (Medial to the femoral vein)", "Pelvic", "None"]', 1, 'First station of lymphatic spread. (Beckmann)'),
    (v_topic_id, '180: "Hydatidiform Mole" - "Theca Lutein Cysts" usually _____ after molar evacuation.', '["Grow", "Spontaneously resolve (over weeks to months)", "Require surgery", "None"]', 1, 'As hCG levels drop. (Williams)');

    RAISE NOTICE 'SUCCESS: Batch 3 (121-180) MCQs for Gyn Malignancies registered.';
END $$;
COMMIT;
