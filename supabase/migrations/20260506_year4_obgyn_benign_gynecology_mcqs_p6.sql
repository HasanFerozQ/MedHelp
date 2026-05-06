BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-benign-gynecology' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-benign-gynecology not found.';
    END IF;

    -- Batch 6: 301-350 (Final Review, Emerging Therapies & Pearls)
    -- Use a temporary table to stage insertions and prevent duplicates
    CREATE TEMP TABLE stage_mcqs (question TEXT, options JSONB, correct_index INT, explanation TEXT);

    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('301: Which new class of oral medication provides GnRH antagonism WITHOUT the initial surge (flare) seen in agonists?', '["SPRMs", "Oral GnRH Antagonists (e.g., Relugolix, Elagolix)", "Aromatase inhibitors", "None"]', 1, 'Used for both fibroids and endometriosis. (ACOG; Williams)'),
    
    ('302: "Relugolix" combination therapy (Myfembree) includes Relugolix, Estradiol, and Norethindrone. What is the purpose of the hormones?', '["To treat the fibroid", "Add-back therapy to prevent bone loss and vasomotor symptoms while maintaining GnRH suppression", "To prevent pregnancy", "None"]', 1, 'Allows for long-term use. (ACOG)'),
    
    ('303: "Endometriosis" is a major cause of "Dyspareunia." Which type of dyspareunia is most characteristic?', '["Introital (at the opening)", "Deep (on penetration or thrusting)", "Vulvar", "None"]', 1, 'Due to pressure on the uterosacral ligaments or the rectovaginal septum. (Beckmann; Blueprints)'),
    
    ('304: In PCOS, the "Insulin resistance" is primarily seen in which organs?', '["Brain", "Skeletal muscle, Adipose tissue, and Liver", "Ovaries only", "None"]', 1, 'Systemic metabolic dysfunction. (Williams; Comprehensive Gynecology)'),
    
    ('305: A woman with "adenomyosis" and "endometriosis" has failed medical therapy. She undergoes "Hysterectomy" but keeps her ovaries. Will her ENDOMETRIOSIS symptoms likely resolve?', '["Yes, always", "Maybe not, as the ovaries still produce the estrogen that stimulates any residual extrauterine implants", "No, never", "None"]', 1, 'Hysterectomy only cures adenomyosis; endometriosis requires excision or BSO for a definitive hormonal cure. (ACOG; Williams)'),
    
    ('306: Which "Fibroid" location is most difficult to access and remove during a LAPAROSCOPIC myomectomy?', '["Subserosal", "Deep intramural or Cervical", "Pedunculated", "None"]', 1, 'Requires extensive myometrial dissection and reconstruction. (Beckmann)'),
    
    ('307: "Endometriosis" of the "Appendix" is often found in what percentage of women with Stage IV disease?', '["1%", "10-15%", "50%", "None"]', 1, 'Often requires appendectomy during surgical staging. (Williams; Comprehensive Gynecology)'),
    
    ('308: A woman with PCOS has "Infertility" but regular cycles. What is the most likely cause of her infertility?', '["Anovulation", "Poor egg quality or subtle luteal phase defect", "Blocked tubes", "None"]', 1, 'PCOS can affect fertility even in ovulatory women. (ACOG; Williams)'),
    
    ('309: What is the "recurrence risk" of an endometrioma after simple needle aspiration?', '["0%", "50%", "~90-100%", "None"]', 2, 'The cyst wall must be removed or destroyed to prevent recurrence. (Beckmann; ACOG)'),
    
    ('310: "Hysteroscopic" myomectomy is indicated for which FIGO types?', '["Type 0, 1, and sometimes 2", "Type 4", "Type 7", "None"]', 0, 'Used for intracavitary or partially intramural fibroids. (ACOG; Williams)'),
    
    ('311: A woman with "fibroids" has "Intermenstrual" bleeding. What should be excluded first?', '["Normal fibroid symptom", "Endometrial polyps or Malignancy (Hyperplasia/Cancer)", "Pregnancy", "None"]', 1, 'Fibroids typically cause heavy cycles (HMB), not bleeding BETWEEN cycles. (Beckmann; Williams)'),
    
    ('312: "Endometriosis" and "Infertility": Does IVF bypass the negative effects of the inflammatory peritoneal environment?', '["No", "Yes, IVF has excellent success rates in endometriosis as it bypasses the pelvic environment", "Only in teens", "None"]', 1, 'Often the most effective treatment for Stage III/IV infertility. (ACOG; Williams)'),
    
    ('313: "PCOS" and "Hyperandrogenism": Which test is the MOST sensitive for diagnosing biochemical hyperandrogenism in a woman with regular cycles?', '["Total Testosterone", "Calculated Free Testosterone or FAI", "DHEA-S", "LH"]', 1, 'Free testosterone accounts for the low SHBG often seen in these patients. (ACOG; Williams)'),
    
    ('314: "Adenomyosis" is most commonly "diffuse." When it is localized to a specific area, it is called:', '["A fibroid", "An adenomyoma", "An endometrioma", "None"]', 1, 'Can mimic a leiomyoma but lacks the capsule. (Williams)'),
    
    ('315: Which "Fibroid" symptom is most commonly improved by "Progestin-only" methods (e.g., Depo-Provera or Mirena)?', '["Bulk symptoms", "Heavy Menstrual Bleeding (HMB)", "Infertility", "None"]', 1, 'Effective for thinning the lining and reducing flow. (Beckmann; Blueprints)'),
    
    ('316: "Endometriosis" and "Autoimmunity": Women with endometriosis are at higher risk for which thyroid condition?', '["Hyperthyroidism", "Hashimoto''s Thyroiditis", "Graves'' disease", "None"]', 1, 'Common autoimmune overlap. (Williams; ACOG)'),
    
    ('317: A woman with PCOS has a "Total Testosterone" level of 50 ng/dL. This is:', '["High", "Normal for a woman (usually < 60-80 ng/dL)", "Low", "None"]', 1, 'Total T is often only mildly elevated or even normal in PCOS. (Beckmann; Williams)'),
    
    ('318: "Myomectomy" during "Cesarean Section" is generally:', '["Encouraged", "Avoided due to high risk of uncontrollable hemorrhage", "Only for tiny fibroids", "None"]', 1, 'The pregnant uterus is extremely vascular. (Williams; ACOG)'),
    
    ('319: "Endometriosis" of the "Rectum": A "shaving" technique refers to:', '["Removing the entire rectum", "Removing the implant from the surface without entering the lumen", "Draining a cyst", "None"]', 1, 'Surgical approach for superficial bowel involvement. (Williams)'),
    
    ('320: "PCOS" and "Metformin": Does it cause weight loss?', '["Yes, significantly", "It may cause modest weight loss (~2-3 kg) but is primarily used for metabolic control", "No", "None"]', 1, 'Not a primary weight-loss drug. (ACOG; Williams)'),
    
    ('321: "Leiomyoma" gene mutation: The _____ gene is mutated in up to 70% of fibroids.', '["BRCA1", "MED12", "TP53", "None"]', 1, 'Key somatic mutation in fibroid pathogenesis. (Williams; Comprehensive Gynecology)'),
    
    ('322: "Endometriosis" and "Infertility": What is the "fecundability" rate in untreated women with endometriosis?', '["20%", "2-10% per month", "50%", "None"]', 1, 'Significantly lower than the 20-25% in healthy couples. (Williams; ACOG)'),
    
    ('323: "PCOS" and "Hirsutism": Which area is assessed for hair growth in the Ferriman-Gallwey score?', '["Upper lip", "Lower abdomen", "Thighs", "All of the above"]', 3, 'Total of 9 areas assessed. (Beckmann; Williams)'),
    
    ('324: "Uterine" fibroids can be "Parasitic." This most often happens after which procedure?', '["Hysterectomy", "Laparoscopic myomectomy with power morcellation", "Aspiration", "None"]', 1, 'Small pieces of tissue can seed the peritoneum and grow. (ACOG; Williams)'),
    
    ('325: "Endometriosis" and "Pain": "Allodynia" refers to:', '["Pain with menses", "Pain from a stimulus that does not normally cause pain (e.g., light touch)", "Deep pain", "None"]', 1, 'Sign of chronic pain sensitization. (Williams)'),
    
    ('326: In a patient with PCOS, "Acanthosis Nigricans" is a reason to check which lab FIRST?', '["Testosterone", "Fastng Glucose or Hemoglobin A1c", "Prolactin", "None"]', 1, 'Immediate metabolic screening is warranted. (ACOG; Beckmann)'),
    
    ('327: "Adenomyosis" on pathology: "Myometrial hyperplasia" occurs in response to:', '["Infection", "Hormonal stimulation by the ectopic endometrial tissue", "Cancer", "None"]', 1, 'Leads to the characteristic globular uterine enlargement. (Williams)'),
    
    ('328: "Fibroid" treatment: "High-intensity Focused Ultrasound" (HIFU) works by:', '["Freezing the tumor", "Thermal coagulation (heating) of the tissue", "Cutting", "None"]', 1, 'Non-invasive ablation. (Williams; ACOG)'),
    
    ('329: "Endometriosis" and "CA-125": When is it MOST likely to be elevated?', '["Stage I", "Stage III/IV or during menstruation/rupture", "Always", "None"]', 1, 'Reflects the amount of peritoneal irritation and disease volume. (Williams)'),
    
    ('330: "PCOS" and "Infertility": "Ovarian Drilling" carries a risk of:', '["Cancer", "Ovarian adhesions and premature ovarian failure if overdone", "Weight gain", "None"]', 1, 'Surgical risk to be weighed against benefits. (ACOG; Williams)'),
    
    ('331: "Leiomyoma" size is often described in terms of:', '["Grams", "Weeks of gestation (e.g., 14-week size)", "Centimeters only", "None"]', 1, 'Clinical comparison to a pregnant uterus. (Beckmann)'),
    
    ('332: "Endometriosis" and "Pain": "Hyperalgesia" refers to:', '["No pain", "An exaggerated response to a normally painful stimulus", "Only cyclic pain", "None"]', 1, 'Another feature of centralized chronic pain. (Williams)'),
    
    ('333: A woman with "fibroids" has "Stress Urinary Incontinence." How?', '["The mass is too small", "A large fundal fibroid is pressing down on the bladder, increasing intra-abdominal pressure", "UTI", "None"]', 1, 'Direct pressure on the bladder. (Beckmann; Williams)'),
    
    ('334: "Endometriosis" and "Bowel" surgery: "Segmental Resection" involves:', '["Shaving the surface", "Removing a full circumference piece of bowel and re-anastomosing", "Draining", "None"]', 1, 'Required for deep infiltration or obstruction. (Williams; ACOG)'),
    
    ('335: "PCOS" and "Hyperandrogenism": "Late-onset" CAH is most common in which ethnic group?', '["African American", "Ashkenazi Jewish", "Asian", "None"]', 1, 'Prevalence can be as high as 1-3% in this population. (Williams; Beckmann)'),
    
    ('336: "Fibroid" histology: "Bizarre" leiomyomas (atypical leiomyomas) are characterized by:', '["Rapid growth", "Giant cells and nuclear atypia but NO high mitotic rate or necrosis", "Malignancy", "None"]', 1, 'Benign variant that can be confused with sarcoma. (Williams; Comprehensive Gynecology)'),
    
    ('337: "Endometriosis" and "Infertility": "Endometrial receptivity" is often _____ in these patients.', '["Increased", "Decreased (due to altered cytokine profile)", "Normal", "None"]', 1, 'The uterus itself may be less receptive. (Williams; Comprehensive Gynecology)'),
    
    ('338: "PCOS" and "Metabolic Syndrome": Which "HDL" level is a criterion (for women)?', '["< 30 mg/dL", "< 50 mg/dL", "> 60 mg/dL", "None"]', 1, 'Low HDL is a core metabolic risk factor. (AHA; Williams)'),
    
    ('339: "Uterine Artery Embolization" is contraindicated in which type of fibroid?', '["Intramural", "Pedunculated subserosal or submucosal (risk of \"stalk\" necrosis or expulsion)", "Small", "None"]', 1, 'Increased risk of complications. (ACOG; Williams)'),
    
    ('340: "Endometriosis" and "Pregnancy": Symptoms usually _____ during pregnancy.', '["Worsen", "Improve (due to high progesterone levels)", "Stay the same", "None"]', 1, 'Pregnancy is a natural "pseudopregnancy" treatment. (Beckmann; Williams)'),
    
    ('341: "PCOS" and "Acanthosis Nigricans": If it appears RAPIDLY in an older patient, consider:', '["PCOS", "Gastric adenocarcinoma (malignant acanthosis nigricans)", "Sunburn", "None"]', 1, 'Rare but important paraneoplastic sign. (Williams)'),
    
    ('342: "Leiomyoma" and "Infertility": "Interstitial" fibroids are located:', '["In the cavity", "In the portion of the tube that traverses the uterine wall", "In the cervix", "None"]', 1, 'Can cause tubal ostia obstruction. (Williams)'),
    
    ('343: "Endometriosis" Visual Diagnosis: "Red flame-like" lesions are more _____ than "Black" lesions.', '["Old", "Active and symptomatic", "Scarred", "None"]', 1, 'Target for surgical ablation. (Williams; Beckmann)'),
    
    ('344: "PCOS" and "Infertility": "Clomiphene" is usually started on which day of the menstrual cycle?', '["Day 1", "Day 3 or 5", "Day 14", "Day 28"]', 1, 'Standard induction protocol. (Beckmann)'),
    
    ('345: "Uterine Leiomyoma" is the most common reason for _____ in the United States.', '["Hysterectomy", "C-section", "Abortion", "None"]', 0, 'Major surgical volume. (ACOG; Beckmann)'),
    
    ('346: "Endometriosis" and "Laparoscopy": The "peritoneal pocket" finding is:', '["A normal variant", "An area of peritoneum where implants are commonly hidden", "A type of cyst", "None"]', 1, 'Must be carefully inspected by the surgeon. (Williams)'),
    
    ('347: "PCOS" and "Hyperinsulinemia" leads to increased "free" estrogen because it:', '["Produces estrogen", "Suppresses SHBG in the liver (similar to its effect on testosterone)", "Increases LH", "None"]', 1, 'Both androgens and estrogens are more "active" when SHBG is low. (Williams)'),
    
    ('348: "Adenomyosis" vs "Pregnancy": Which one is more likely to have a "soft" uterus?', '["Adenomyosis", "Pregnancy (Hegar''s sign)", "Fibroids", "None"]', 1, 'Both can be soft, but pregnancy is a core differential. (Beckmann)'),
    
    ('349: "Leiomyoma" and "Renal" function: Chronic ureteral compression can lead to:', '["Kidney stones", "Atrophy of the renal cortex and hydronephrosis", "Bladder cancer", "None"]', 1, 'Important indication for intervention. (Williams)'),
    
    ('350: "Endometriosis" and "Quality of Life": The average delay from symptom onset to diagnosis is:', '["1 month", "1 year", "~7-10 years", "50 years"]', 2, 'Significant diagnostic gap due to normalization of pain. (ACOG; Williams)');

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
