BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-malignancies' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-malignancies not found.';
    END IF;

    -- Batch 5: 241-300 (Advanced Clinical Scenarios and Complications of Treatment)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '241: A 65-year-old G0 has a 10 cm solid adnexal mass, ascites, and a CA-125 of 1200. Most likely diagnosis?', '["Endometriosis", "Epithelial Ovarian Cancer", "PCOS", "Fibroid"]', 1, 'Classic presentation for advanced epithelial ovarian cancer. (Williams)'),
    (v_topic_id, '242: A 19-year-old has a 12 cm adnexal mass and an LDH of 3000. Most likely diagnosis?', '["Epithelial cancer", "Dysgerminoma", "Fibroid", "Endometrioma"]', 1, 'Malignant germ cell tumor in a young woman with high LDH. (Beckmann)'),
    (v_topic_id, '243: A 45-year-old has an ASC-US pap. HPV is NEGATIVE. Next step?', '["Colposcopy", "Routine screening in 3 or 5 years", "Immediate LEEP", "Wait"]', 1, 'Negative high-risk HPV makes high-grade disease very unlikely. (ACOG)'),
    (v_topic_id, '244: A 28-year-old has CIN 3 on LEEP. Margins are POSITIVE. Next step?', '["Hysterectomy", "Observe with Pap and ECC in 6 months (or repeat LEEP if persistent)", "Radiation", "None"]', 1, 'Conservative management is often tried first in women of reproductive age. (ACOG)'),
    (v_topic_id, '245: "Ovarian Cancer" - What is a "Platinum-sensitive" recurrence?', '["Recurrence within 1 month", "Recurrence > 6 months after completing platinum chemotherapy", "Recurrence in the brain", "None"]', 1, 'These patients can be treated with platinum agents again. (ACOG)'),
    (v_topic_id, '246: "Ovarian Cancer" - "Platinum-resistant" recurrence is:', '["Recurrence < 6 months after completing platinum", "Recurrence in nodes", "None", "Curable"]', 0, 'Requires non-platinum based chemotherapy and has a poorer prognosis. (ACOG)'),
    (v_topic_id, '247: "Bevacizumab" (Avastin) mechanism?', '["Inhibits DNA", "Monoclonal antibody against VEGF (anti-angiogenic)", "Hormone blocker", "None"]', 1, 'Used in advanced or recurrent ovarian cancer. (Williams)'),
    (v_topic_id, '248: "PARP Inhibitors" (e.g., Olaparib) are most effective in ovarian cancer patients with:', '["Smoking", "BRCA1 or BRCA2 mutations", "Diabetes", "None"]', 1, 'Target "synthetic lethality" in DNA-repair deficient cells. (ACOG)'),
    (v_topic_id, '249: "Lynch Syndrome" screening for Colon Cancer?', '["Colonoscopy every 10 years", "Colonoscopy every 1-2 years starting at age 20-25", "Blood test", "None"]', 1, 'Intensive surveillance is required. (Beckmann)'),
    (v_topic_id, '250: "Cervical Cancer" - Complication of "Radical Hysterectomy"?', '["Ureteral injury (due to proximity of ureter to parametria)", "Bladder dysfunction (denervation)", "Lymphocele", "All of the above"]', 3, 'Major surgery with significant potential morbidity. (Williams)'),
    (v_topic_id, '251: "Radiation" complication: "Radiation Proctitis" presents with:', '["Vaginal bleeding", "Rectal bleeding and tenesmus", "Fever", "None"]', 1, 'Direct injury to the rectal mucosa. (Beckmann)'),
    (v_topic_id, '252: "Radiation" complication: "Vaginal Stenosis" management?', '["Surgery", "Vaginal dilators and topical estrogen", "Antibiotics", "None"]', 1, 'To maintain sexual function and allow for future exams. (ACOG)'),
    (v_topic_id, '253: "Endometrial Cancer" - Most common site for LUNGS metastasis?', '["Pleural effusion", "Multiple nodules", "Pneumonia", "None"]', 1, 'Standard metastatic pattern. (Williams)'),
    (v_topic_id, '254: "Gestational Trophoblastic Neoplasia": "Placental Site Trophoblastic Tumor" (PSTT) - marker?', '["High hCG", "Human Placental Lactogen (hPL)", "AFP", "None"]', 1, 'Secreted by intermediate trophoblasts. (Beckmann)'),
    (v_topic_id, '255: "Hydatidiform Mole" - Risk of "recurrence" in a subsequent pregnancy?', '["1%", "10-15%", "50%", "0%"]', 0, 'Low but significantly higher than the general population. (ACOG)'),
    (v_topic_id, '256: "Adnexal Mass" - "Whirlpool Sign" on ultrasound is suggestive of:', '["Cancer", "Ovarian Torsion", "Endometriosis", "None"]', 1, 'Reflects the twisted vascular pedicle. (Williams)'),
    (v_topic_id, '257: "CA-125" - If a patient has a known ovarian cancer and the CA-125 is RISING before imaging shows a tumor, what is this called?', '["Normal", "Biochemical recurrence", "Infection", "None"]', 1, 'May lead to early resumption of chemotherapy. (ACOG)'),
    (v_topic_id, '258: "Vulvar SCC" - Survival is most closely linked to:', '["Patient age", "Number of positive inguinal lymph nodes", "Tumor color", "None"]', 1, 'Lymph node status is the primary driver of outcomes. (Williams)'),
    (v_topic_id, '259: "Primary Vaginal Cancer" - FIGO Stage I?', '["Confined to vaginal wall", "Nodes positive", "Spread to bladder", "None"]', 0, 'Standard staging. (Beckmann)'),
    (v_topic_id, '260: "Cervical Cancer" - Which staging exam is used to check for bladder invasion?', '["MRI only", "Cystoscopy", "CT", "None"]', 1, 'Traditional clinical staging component. (Williams)'),
    (v_topic_id, '261: "Cervical Cancer" - Which staging exam is used to check for rectal invasion?', '["CT", "Proctosigmoidoscopy", "MRI", "None"]', 1, 'Traditional clinical staging component. (Williams)'),
    (v_topic_id, '262: "Endometrial Cancer" - "Grade 1" (G1) tumor?', '["Solid growth < 5%", "Solid growth > 50%", "Undifferentiated", "None"]', 0, 'Well-differentiated glandular tissue. (FIGO)'),
    (v_topic_id, '263: "Endometrial Cancer" - "Grade 2" (G2) tumor?', '["Solid growth 6-50%", "Solid 100%", "Normal", "None"]', 0, 'Intermediate differentiation. (FIGO)'),
    (v_topic_id, '264: "Endometrial Cancer" - If a Grade 1 or 2 tumor has significant "nuclear atypia," what happens to the grade?', '["Nothing", "Increased by 1 (e.g., G1 becomes G2)", "Reduced", "None"]', 1, 'Nuclear features can override architectural grading. (FIGO)'),
    (v_topic_id, '265: "Ovarian Germ Cell Tumors" - Which one can cause precocious puberty via hCG production?', '["Dermoid", "Non-gestational Choriocarcinoma", "Struma Ovarii", "None"]', 1, 'hCG acts like LH on the ovary. (Williams)'),
    (v_topic_id, '266: "Immature Teratoma" - Grade is based on the amount of immature _____ tissue.', '["Fat", "Neural", "Bone", "None"]', 1, 'High grade = more primitive neuroepithelium. (Beckmann)'),
    (v_topic_id, '267: "Endometrial Cancer" - Progestin therapy (e.g., Mirena IUD or Megace) for Grade 1 Stage IA cancer is:', '["Standard for everyone", "An option for women desiring fertility or those medically unfit for surgery", "Never used", "None"]', 1, 'Requires frequent EMB monitoring to ensure response. (ACOG)'),
    (v_topic_id, '268: "Lichen Sclerosus" - Is it contagious?', '["Yes", "No", "Only through blood", "None"]', 1, 'Chronic inflammatory/autoimmune condition. (Beckmann)'),
    (v_topic_id, '269: "Lichen Planus" of the vulva:', '["Is always painless", "Presents with erosive lesions and "Wickham striae" (white striae) on the mucosa", "Is easy to cure", "None"]', 1, 'Often affects the vagina too (unlike Lichen Sclerosus). (Williams)'),
    (v_topic_id, '270: "Vulvar Paget Disease" - Risk of associated cancer?', '["0%", "Up to 25% have an underlying adenocarcinoma", "100%", "None"]', 1, 'Search for GI or Gyn primary cancer is required. (Beckmann)'),
    (v_topic_id, '271: "Gestational Trophoblastic Neoplasia" - What is the most common "secondary" malignancy after Methotrexate?', '["Lung", "Leukemia (specifically AML/MDS) - very rare risk with Etoposide", "None", "Breast"]', 1, 'Associated with high doses of specific chemo agents. (Williams)'),
    (v_topic_id, '272: "Ovarian Cancer" - "Ascites" pathophysiology?', '["Too much drinking", "Tumor cells blocking sub-diaphragmatic lymphatics and increased peritoneal permeability", "Infection", "None"]', 1, 'Leads to massive fluid accumulation. (Williams)'),
    (v_topic_id, '273: "Ovarian Cancer" - "Pleural Effusion" upstages to Stage:', '["II", "III", "IV (IVA if positive cytology)", "None"]', 2, 'Distant spread. (FIGO)'),
    (v_topic_id, '274: "BRCA2" mutations have a higher risk of which cancer in MEN?', '["Prostate", "Breast", "Pancreas", "All of the above"]', 3, 'Important for family history. (ACOG)'),
    (v_topic_id, '275: "Endometrial Stromal Sarcoma" (ESS) - Low grade?', '["Malignant but slow growing and hormone responsive", "Highly aggressive", "Benign", "None"]', 0, 'Contrasts with high-grade ESS. (Williams)'),
    (v_topic_id, '276: "Carcinosarcoma" (MMMT) of the uterus:', '["Is a benign polyp", "Is a high-grade Type II endometrial cancer with both epithelial and mesenchymal components", "Only occurs in children", "None"]', 1, 'Highly aggressive. (Beckmann)'),
    (v_topic_id, '277: "Cervical Cancer" - Most common age of diagnosis?', '["20", "45-50", "80", "None"]', 1, 'Bimodal peak often described (30s and 50s). (Williams)'),
    (v_topic_id, '278: "Pap Smear" - If "Endometrial Cells" are reported in a woman > 45. Next step?', '["Ignore", "Endometrial Biopsy (EMB) is recommended to rule out cancer", "Wait", "None"]', 1, 'Warrants evaluation in older or symptomatic women. (ACOG)'),
    (v_topic_id, '279: "Vulvar SCC" - Most common site of distant metastasis?', '["Brain", "Lungs and Liver", "Skin", "None"]', 1, 'Usually follows lymph node involvement. (Beckmann)'),
    (v_topic_id, '280: "Cervical Cancer" - If a patient has a "barrel-shaped" cervix, what stage is suspected?', '["IA", "IB2 (large local tumor)", "IV", "None"]', 1, 'Indicates a large central tumor mass. (Williams)'),
    (v_topic_id, '281: "Endometrial Cancer" - Survival for Stage I?', '["10%", "50%", "> 90%", "0%"]', 2, 'Excellent prognosis if caught early. (ACOG)'),
    (v_topic_id, '282: "Ovarian Cancer" - Overall 5-year survival (all stages)?', '["10%", "45-50%", "90%", "None"]', 1, 'Reflects the high percentage of late-stage diagnoses. (ACOG)'),
    (v_topic_id, '283: "GTN" - Overall 5-year survival for "Low-Risk" disease?', '["50%", "近 100%", "10%", "None"]', 1, 'One of the most curable cancers. (Williams)'),
    (v_topic_id, '284: "GTN" - Overall 5-year survival for "High-Risk" disease?', '["20%", "70-90%", "0%", "None"]', 1, 'Still relatively high due to chemo-sensitivity. (ACOG)'),
    (v_topic_id, '285: "Cervical Cancer" - "Cisplatin" in chemoradiation acts as a:', '["Cure only", "Radiosensitizer (makes the radiation more effective)", "None", "Hormone"]', 1, 'Essential component of the standard protocol. (Williams)'),
    (v_topic_id, '286: "Ovarian Torsion" - Should you untwist it (detorsion)?', '["No, remove it always", "Yes, detorsion is preferred to preserve function unless the ovary is clearly necrotic", "Wait", "None"]', 1, 'Risk of thromboembolism is now considered very low. (ACOG)'),
    (v_topic_id, '287: "Hydatidiform Mole" - "Early pre-eclampsia" (< 20 weeks) is a classic sign of:', '["Normal pregnancy", "Molar pregnancy", "GDM", "None"]', 1, 'High-yield board association. (Beckmann)'),
    (v_topic_id, '288: "Cervical Cancer" - "Hydronephrosis" on IVP or CT automatically makes it Stage:', '["I", "II", "III (IIIB)", "IV"]', 2, 'Indicates pelvic sidewall extension/obstruction. (FIGO)'),
    (v_topic_id, '289: "Ovarian Germ Cell Tumor": Which one is associated with "Reis-Kucklan" bodies?', '["None", "Sertoli-Leydig (Reinke crystals)", "Dermoid", "None"]', 1, 'High-yield histology. (Williams)'),
    (v_topic_id, '290: "Adnexal Mass": "Endometrioma" ultrasound appearance?', '["Empty", "Ground-glass (homogeneous low-level internal echoes)", "Complex with solid nodes", "None"]', 1, 'Reflects old blood ("Chocolate cyst"). (Beckmann)'),
    (v_topic_id, '291: "Cervical Cancer" - Screening for "Immunosuppressed" (Transplant) patients?', '["Every 10 years", "Annual screening for life", "Every 5 years", "None"]', 1, 'Similar to HIV protocol. (ACOG)'),
    (v_topic_id, '292: "Endometrial Cancer" - Is lymph node dissection always required in Stage I?', '["Yes", "Depends on risk (Grade, depth, size); some low-risk cases may omit or use sentinel nodes", "No", "None"]', 1, 'Increasing use of sentinel nodes to reduce morbidity. (ACOG)'),
    (v_topic_id, '293: "Vulvar Cancer" - If nodes are positive, what is the next step?', '["Surgery only", "Postoperative Radiation to the groins/pelvis", "Wait", "None"]', 1, 'To reduce regional recurrence. (Williams)'),
    (v_topic_id, '294: "Vaginal Cancer" - Primary risk factor besides HPV?', '["Alcohol", "History of cervical cancer or dysplasia", "Multiple births", "None"]', 1, 'Reflects the "field effect" of HPV on the lower tract. (Beckmann)'),
    (v_topic_id, '295: "Clear Cell" Adenocarcinoma of the cervix - Does it have any relation to HPV?', '["Yes", "No (mostly associated with DES or sporadic)", "Only in teens", "None"]', 1, 'Important distinction from SCC. (Williams)'),
    (v_topic_id, '296: "Hysterectomy" - "Extrafascial" (Simple) vs "Intrafascial"?', '["Simple is for cancer", "Simple removes the cervix; Intrafascial leaves some tissue for benign disease", "They are the same", "None"]', 1, 'Surgical nuances. (Beckmann)'),
    (v_topic_id, '297: "Gyn Malignancy" - "Palliative Care" is appropriate for:', '["Only dying patients", "Any patient with advanced disease to help with symptom management and goals of care", "No one", "None"]', 1, 'Integrated early into Gyn Onc care. (ACOG)'),
    (v_topic_id, '298: "Endometrial Cancer" - "Metastasis" to the liver surface (capsule) is Stage:', '["I", "II", "III", "IV"]', 2, 'Stage III. (FIGO)'),
    (v_topic_id, '299: "Endometrial Cancer" - "Metastasis" to the liver parenchyma is Stage:', '["I", "II", "III", "IV"]', 3, 'Stage IV. (FIGO)'),
    (v_topic_id, '300: "Ovarian Cancer" - "Positive" nodes are Stage:', '["I", "II", "IIIA1", "IV"]', 2, 'Regional lymph node spread. (FIGO)');

    RAISE NOTICE 'SUCCESS: Batch 5 (241-300) MCQs for Gyn Malignancies registered.';
END $$;
COMMIT;
