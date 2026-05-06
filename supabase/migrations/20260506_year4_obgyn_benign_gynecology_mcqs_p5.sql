BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-benign-gynecology' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-benign-gynecology not found.';
    END IF;

    -- Batch 5: 241-300 (Complex Differentiations & Multi-System Impact)
    -- Use a temporary table to stage insertions and prevent duplicates
    CREATE TEMP TABLE stage_mcqs (question TEXT, options JSONB, correct_index INT, explanation TEXT);

    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('241: A 19-year-old with hirsutism and irregular cycles has a 17-OH Progesterone level of 400 ng/dL. What is the next step?', '["Diagnose PCOS", "ACTH stimulation test", "Diagnose Cushing", "Hysterectomy"]', 1, '17-OHP > 200 ng/dL requires an ACTH stimulation test to confirm Non-Classic CAH. (ACOG; Williams)'),
    
    ('242: Which of the following is a classic differentiating feature between Endometriosis and Adenomyosis?', '["Both cause dysmenorrhea", "Endometriosis is ectopic tissue OUTSIDE the uterus; Adenomyosis is ectopic tissue WITHIN the myometrium", "Adenomyosis only affects teens", "None"]', 1, 'Fundamental anatomical distinction. (Beckmann; Williams)'),
    
    ('243: A woman with PCOS has a high "Free Androgen Index" (FAI). This is calculated as:', '["Testosterone / LH", "(Total Testosterone / SHBG) x 100", "LH / FSH", "None"]', 1, 'FAI is a more sensitive marker for hyperandrogenism than total testosterone alone. (Comprehensive Gynecology)'),
    
    ('244: What is the "cutoff" for a normal endometrial thickness in a PREMENOPAUSAL woman?', '["5 mm", "There is no absolute cutoff; it varies with the menstrual cycle (up to 16-20 mm in secretory phase)", "25 mm", "None"]', 1, 'Thickness must be interpreted in the context of the cycle phase. (Beckmann; Williams)'),
    
    ('245: A woman with "Endometriosis" has a "Sister Mary Joseph Nodule." Is this likely endometriosis?', '["Yes", "No, this is a sign of metastatic intra-abdominal malignancy (often ovarian or GI)", "It is a normal mole", "None"]', 1, 'Umbilical endometriosis (Villar''s nodule) is benign; Sister Mary Joseph is malignant. (Williams)'),
    
    ('246: "Thecoma" is an ovarian tumor that can cause symptoms similar to:', '["Endometriosis", "PCOS (due to androgen production) or postmenopausal bleeding (due to estrogen)", "Fibroids", "None"]', 1, 'Ovarian sex cord-stromal tumor. (Williams)'),
    
    ('247: In a patient with fibroids, "Hysterosalpingography" (HSG) is primarily used to evaluate:', '["Tumor size", "Tubal patency and contour of the uterine cavity", "Cancer", "None"]', 1, 'Used in infertility workups. (Beckmann; Blueprints)'),
    
    ('248: A woman with PCOS has "Dyslipidemia." The characteristic pattern is:', '["Low LDL", "High Triglycerides, Low HDL, and High LDL", "High HDL", "None"]', 1, 'Highly atherogenic lipid profile. (ACOG; Williams)'),
    
    ('249: "Endometriosis" of the "Rectovaginal Septum" often presents as:', '["A single large cyst", "Firm, painful, palpable nodules between the vagina and rectum", "Infection", "None"]', 1, 'Requires careful bimanual/rectovaginal exam. (Beckmann; Williams)'),
    
    ('250: A 33-year-old with fibroids has "Polycythemia" (high Hgb). This is a rare association due to:', '["Dehydration", "Ectopic Erythropoietin (EPO) production by the fibroid", "High Estrogen", "None"]', 1, 'Known as "Myomatous Erythrocytosis." (Williams; Comprehensive Gynecology)'),
    
    ('251: Which of the following is a "Minor" Rotterdam criterion?', '["There are none; all three carry equal weight", "Obesity", "Age", "None"]', 0, 'Any two of the three criteria confirm the diagnosis. (ACOG)'),
    
    ('252: "Endometriosis" and "Interstitial Cystitis" (Painful Bladder Syndrome) often coexist. This is known as:', '["The Evil Twins of Chronic Pelvic Pain", "The Double Trouble", "The Pelvic Pair", "None"]', 0, 'Commonly found together in patients with chronic pelvic pain. (Williams; Comprehensive Gynecology)'),
    
    ('253: In a woman with PCOS, "Weight loss" primarily improves cycles by:', '["Reducing LH", "Reducing peripheral aromatization and increasing SHBG levels", "Killing the eggs", "None"]', 1, 'Lowers free estrogen and free androgens. (ACOG; Beckmann)'),
    
    ('254: "Hydrosalpinx" found on US in a patient with endometriosis is caused by:', '["Infection", "Adhesions blocking the distal end of the tube, leading to fluid accumulation", "Cancer", "None"]', 1, 'Significant cause of infertility. (Beckmann; Williams)'),
    
    ('255: A 28-year-old with fibroids has "Hydronephrosis" on US. What is the most likely cause?', '["Kidney stones", "The fibroid mass is compressing the ureter as it crosses the pelvic brim", "UTI", "None"]', 1, 'Obstructive uropathy due to mass effect. (Williams; Blueprints)'),
    
    ('256: "Endometriosis" found on the "Diaphragm" often causes pain referred to the:', '["Right shoulder", "Low back", "Legs", "Chest only"]', 0, 'Phrenic nerve irritation. (Williams; Comprehensive Gynecology)'),
    
    ('257: Which of the following "Androgen" levels is MOST commonly elevated in PCOS?', '["DHEA-S", "Free Testosterone", "Androstenedione", "All of the above"]', 3, 'Though free testosterone is often the most sensitive marker. (Beckmann; Williams)'),
    
    ('258: A woman with "Endometriosis" has "Primary" infertility. What does this mean?', '["She has never been pregnant", "She has been pregnant before", "She is over 40", "None"]', 0, 'Never achieved conception. (Beckmann)'),
    
    ('259: "Cervical" fibroids can make which procedure technically difficult?', '["Pap smear", "IUD insertion or Hysteroscopy", "Vaginal exam", "None"]', 1, 'They distort the endocervical canal. (Beckmann)'),
    
    ('260: "Progesterone Resistance" in endometriosis means:', '["The tissue responds too well to Provera", "The ectopic tissue lacks sufficient progesterone receptors to counteract estrogen-driven growth", "Progesterone causes pain", "None"]', 1, 'Key molecular feature of the disease. (Williams; Comprehensive Gynecology)'),
    
    ('261: In PCOS, "Hyperinsulinemia" directly stimulates theca cells via which receptor?', '["FSH receptor", "IGF-1 receptor (and its own insulin receptor)", "LH receptor only", "None"]', 1, 'Synergizes with LH to increase androgen production. (Williams)'),
    
    ('262: "Endometriosis" of the "Bowel" involves the muscularis propria. What is the primary symptom?', '["Diarrhea only", "Cyclical rectal pain and dyschezia", "Vomiting", "None"]', 1, 'Symptoms correlate with the menstrual cycle. (Williams; ACOG)'),
    
    ('263: A woman with "fibroids" has "Pelvic Congestion Syndrome." This is characterized by:', '["Rapid weight loss", "Dull, aching pelvic pain that is worse after standing or intercourse", "Infection", "None"]', 1, 'Due to dilated pelvic veins. (Beckmann)'),
    
    ('264: "Endometriosis" found on the "Nerves" (e.g., obturator nerve) can cause:', '["Numbness", "Cyclical motor or sensory deficits in the leg", "Blindness", "None"]', 1, 'Rare but debilitating extrapelvic manifestation. (Williams)'),
    
    ('265: "Polycystic Ovarian Morphology" (PCOM) on US is seen in what percentage of HEALTHY, ovulating women?', '["0%", "5%", "~20-25%", "80%"]', 2, 'Must not be used alone to diagnose PCOS. (ACOG; Williams)'),
    
    ('266: "Leiomyoma" on MRI is typically:', '["Bright on T2", "Dark (low signal intensity) on T2", "Cystic", "None"]', 1, 'Reflects the dense, fibrous nature of the tissue. (Williams; Comprehensive Gynecology)'),
    
    ('267: A woman with "Endometriosis" has an "endometrioma" that ruptures. The peritoneal fluid will be:', '["Clear", "Thick, dark brown \"chocolate\" fluid", "Pus", "Bright red blood"]', 1, 'Leads to severe chemical peritonitis. (Beckmann; Williams)'),
    
    ('268: "Lichen Sclerosus" is a differential for vulvar pain. How does it look?', '["Red and angry", "Thin, white, \"parchment-like\" or \"cigarette-paper\" skin", "Ulcerated", "None"]', 1, 'Chronic autoimmune condition. (Beckmann)'),
    
    ('269: A woman with PCOS has a "1,5-anhydroglucitol" test. This measures:', '["Androgens", "Short-term glucose control", "LH", "None"]', 1, 'Less common than HbA1c but used in some metabolic workups. (Williams)'),
    
    ('270: "Endometriosis" and "Autoimmune" diseases (e.g., SLE, RA, Thyroiditis) are:', '["Unrelated", "Positively associated (women with endometriosis have higher rates of certain autoimmune conditions)", "Negatively associated", "None"]', 1, 'Suggests a shared underlying immune dysregulation. (ACOG; Williams)'),
    
    ('271: "Uterine Leiomyoma" is a monoclonal tumor. This means:', '["It has many types of cells", "Each fibroid arises from the proliferation of a single smooth muscle cell", "It is infectious", "None"]', 1, 'Genetic studies show each mass in the same uterus can have different mutations. (Williams; Comprehensive Gynecology)'),
    
    ('272: "Endometriosis" in "Postmenopausal" women is usually due to:', '["HRT or peripheral conversion of androgens to estrogens", "Pregnancy", "Lack of vitamins", "None"]', 0, 'Estrogen is required for its persistence. (Williams; ACOG)'),
    
    ('273: "PCOS" and "Nonalcoholic Fatty Liver Disease" (NAFLD) are:', '["Unrelated", "Frequently associated due to shared insulin resistance and obesity", "Only in men", "None"]', 1, 'Metabolic link. (ACOG; Williams)'),
    
    ('274: A woman with "fibroids" has "Lower Extremity Edema." Cause?', '["Mass compression of pelvic lymphatics or veins", "Heart failure", "Renal failure", "None"]', 0, 'Mechanical obstruction by a large uterus. (Williams)'),
    
    ('275: "Endometriosis" found on "Old Surgical Scars" (e.g., C-section scar) is called:', '["Scar endometriosis", "Incisionitis", "Cancer", "None"]', 0, 'Presents as a cyclical painful lump at the scar site. (Williams; Beckmann)'),
    
    ('276: A woman with PCOS has a "High Ferriman-Gallwey score." This indicates:', '["Severe pain", "Significant terminal hair growth in androgen-sensitive areas", "High Estrogen", "None"]', 1, 'Clinical tool for hirsutism. (Beckmann; Williams)'),
    
    ('277: "Adenomyosis" is most common in women in their _____ decade of life.', '["2nd", "3rd", "4th or 5th", "7th"]', 2, 'Typically late reproductive age. (Williams; Beckmann)'),
    
    ('278: "Endometriosis" is a "Disease of Theories." Which theory involves the spread of cells through the bloodstream?', '["Sampson''s", "Halban''s", "Meyer''s", "None"]', 1, 'Lymphatic/Hematogenous spread theory. (Williams; Comprehensive Gynecology)'),
    
    ('279: In a patient with "PCOS," what happens to the "LH" pulse frequency?', '["Decreases", "Increases", "Remains constant", "Stops"]', 1, 'High-frequency GnRH pulses favor LH over FSH. (Williams)'),
    
    ('280: A woman with "fibroids" has "Pelvic Pressure" that is worse at the end of the day. This is:', '["Normal", "A common bulk symptom of a large myomatous uterus", "Psychological", "None"]', 1, 'Gravity increases the pressure sensation. (Blueprints; Beckmann)'),
    
    ('281: "Endometriosis" causing "Infertility": Does Stage I/II disease require treatment if the patient is asymptomatic?', '["No", "Yes, surgical ablation/excision is recommended for women with infertility even in mild stages", "Only if she is over 40", "None"]', 1, 'Proven to increase fecundity in several trials. (ACOG; Williams)'),
    
    ('282: In PCOS, "Hirsutism" should be differentiated from "Hypertrichosis." What is hypertrichosis?', '["Excess terminal hair", "Excessive growth of non-androgen dependent vellus hair (often genetic or metabolic)", "Alopecia", "None"]', 1, 'Often seen in Mediterranean or South Asian ethnicities without PCOS. (Beckmann; Williams)'),
    
    ('283: "Adenomyoma" vs "Leiomyoma": Which one is more likely to be "Tender" on premenstrual exam?', '["Leiomyoma", "Adenomyoma", "They are never tender", "None"]', 1, 'Because it contains functioning endometrial tissue that bleeds internally. (Williams)'),
    
    ('284: "Endometriosis" risk is _____ in women who have "Late menarche" and "Regular exercise."', '["Increased", "Decreased", "Unchanged", "None"]', 1, 'Protective factors that reduce overall estrogen exposure. (Williams; Beckmann)'),
    
    ('285: "PCOS" is a risk factor for which psychological condition?', '["Depression and Anxiety", "Eating disorders", "Body dysmorphic disorder", "All of the above"]', 3, 'Comprehensive psychological impact. (ACOG; Williams)'),
    
    ('286: A woman with "fibroids" has "Urinary Retention." This is caused by:', '["Nerve damage", "Mechanical compression of the urethra or bladder neck", "UTI", "None"]', 1, 'Acute inability to void due to mass effect. (Williams)'),
    
    ('287: "Endometriosis" of the "Pleura" classically causes cyclical:', '["Cough", "Hemoptysis (coughing up blood) or Pneumothorax", "Chest rash", "None"]', 1, 'Thoracic endometriosis syndrome. (Williams; Comprehensive Gynecology)'),
    
    ('288: "PCOS" patients with "Obesity" have higher levels of _____ due to adipose tissue production.', '["Estradiol", "Estrone (E1)", "Estriol", "None"]', 1, 'Aromatase in fat converts androgens to estrone. (Beckmann; Williams)'),
    
    ('289: "Myomectomy" vs "UAE": Which one is better for a woman wanting "Future Pregnancy"?', '["UAE", "Myomectomy", "They are equal", "None"]', 1, 'Myomectomy is the preferred fertility-sparing surgical option. (ACOG; Williams)'),
    
    ('290: "Endometriosis" and "Infertility": What is the role of "Superovulation + IUI"?', '["None", "It is an effective first-line treatment for infertility in women with Stage I/II disease", "It cures the disease", "None"]', 1, 'Increases chances before moving to IVF. (ACOG; Williams)'),
    
    ('291: "Acanthosis Nigricans" in PCOS is most common on the:', '["Palms", "Nape of the neck and Axilla", "Face", "Legs"]', 1, 'Velvety, thickened skin. (Beckmann; Williams)'),
    
    ('292: "Uterine Artery Embolization" results in a volume reduction of fibroids by about:', '["10%", "50-60%", "90%", "100%"]', 1, 'Significant but not complete disappearance. (ACOG; Williams)'),
    
    ('293: "Endometriosis" visual staging is based on points. Stage I is _____ points.', '["1-5", "16-40", "40+", "0"]', 0, 'Minimal disease. (Williams)'),
    
    ('294: "Endometriosis" Stage IV is _____ points.', '["1-5", "16-40", "> 40", "None"]', 2, 'Severe disease with dense adhesions and large cysts. (Williams)'),
    
    ('295: "PCOS" patients have a higher risk of "Gestational Diabetes" in pregnancy. What is the recommended screening?', '["Standard 24-28 week OGTT", "Early screening (at first prenatal visit) if BMI is high or other risks present", "None", "None"]', 1, 'Aggressive monitoring for metabolic issues. (ACOG; Williams)'),
    
    ('296: "Fibroid" histology: smooth muscle cells are arranged in a _____ pattern.', '["Linear", "Whorled", "Random", "Cystic"]', 1, 'Classic description of the bundles of myocytes. (Beckmann)'),
    
    ('297: "Endometriosis" pathognomonic finding on "MRI":', '["High T2 signal", "T2 shading (low signal on T2 in a cyst that is bright on T1)", "Dark on T1", "None"]', 1, 'Specific for endometriomas. (Williams; Comprehensive Gynecology)'),
    
    ('298: "PCOS" and "Hyperprolactinemia": If prolactin is high, what should be ordered next?', '["MRI of the brain (Sella Turcica)", "Thyroid labs (TSH)", "Liver biopsy", "None"]', 1, 'Hypothyroidism is a common and reversible cause of high prolactin. (Beckmann; Williams)'),
    
    ('299: A woman with "fibroids" has "Pelvic Pain" during ovulation. This is called:', '["Dysmenorrhea", "Mittelschmerz", "Dyschezia", "None"]', 1, 'Pain from follicle rupture; may be exacerbated by uterine mass. (Beckmann)'),
    
    ('300: "Endometriosis" and "Chronic Pelvic Pain": What is the "Central Sensitization" theory?', '["The pain is in the uterus", "Chronic pain signals rewire the CNS to perceive pain even without a peripheral trigger", "The patient is lying", "None"]', 1, 'Explains why pain persists after surgery. (Williams; Comprehensive Gynecology)');

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
