BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-benign-gynecology' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-benign-gynecology not found.';
    END IF;

    -- Batch 5: 241-300 (Advanced Clinical Scenarios and Surgical Details)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '241: A 32-year-old G0 has sudden onset of severe RLQ pain and vomiting. Ultrasound shows a 7 cm complex mass and no blood flow to the right ovary. Management?', '["Antibiotics", "Emergency Laparoscopy (Detorsion)", "Observe", "MRI"]', 1, 'Classic presentation for ovarian torsion requiring immediate intervention. (ACOG)'),
    (v_topic_id, '242: A 24-year-old has primary amenorrhea, normal breast development, but a blind-ending vagina and NO uterus. Karyotype 46, XX. Diagnosis?', '["Turner Syndrome", "Mullerian Agenesis (MRKH)", "AIS", "PCOS"]', 1, 'Ovaries are present and functional. (Williams)'),
    (v_topic_id, '243: A patient has "Heavy Menstrual Bleeding" and a 2 cm submucosal fibroid (Type 0). Most appropriate surgical approach?', '["Laparoscopic myomectomy", "Hysteroscopic myomectomy", "Hysterectomy", "UAE"]', 1, 'Minimally invasive and standard of care for cavity lesions. (ACOG)'),
    (v_topic_id, '244: A woman with "Endometriosis" has failed NSAIDs and OCPs. Next best step for symptom control?', '["Hysterectomy", "GnRH agonist (Leuprolide) with add-back therapy", "Radiation", "Wait"]', 1, 'Second-line medical therapy for pain. (Beckmann)'),
    (v_topic_id, '245: A 20-year-old with "PCOS" has significant hirsutism. She is already on OCPs. What can be added?', '["Metformin", "Spironolactone", "Letrozole", "None"]', 1, 'Dual therapy with OCPs and an anti-androgen is effective for hirsutism. (ACOG)'),
    (v_topic_id, '246: "Pelvic Inflammatory Disease" (PID) - Why is "Metronidazole" often added to the Ceftriaxone/Doxycycline regimen?', '["To treat gonorrhea", "To cover anaerobes and BV", "To treat yeast", "None"]', 1, 'Provides better coverage for polymicrobial infections. (CDC)'),
    (v_topic_id, '247: "Tubo-ovarian Abscess" (TOA) - If the patient becomes ACUTELY hemodynamically unstable with signs of peritonitis?', '["Wait for antibiotics", "Emergency Laparotomy (TOA rupture is a surgical emergency)", "Give more fluids", "None"]', 1, 'Rupture has a high mortality rate if not treated surgically. (Williams)'),
    (v_topic_id, '248: "Asherman Syndrome" - What is the characteristic finding on "Hysterosalpingogram" (HSG)?', '["Double uterus", "Irregular filling defects (adhesions)", "Blocked tubes only", "None"]', 1, 'Standard diagnostic tool. (Beckmann)'),
    (v_topic_id, '249: "Endometrial Polyps" - "Sessile" vs "Pedunculated"?', '["Sessile has a broad base; Pedunculated has a stalk", "They are the same", "None", "Cancer"]', 0, 'Surgical descriptions. (Williams)'),
    (v_topic_id, '250: "Uterine Artery Embolization" (UAE) - What is the most common material used for embolization?', '["Gold", "Tris-acryl gelatin microspheres or Polyvinyl alcohol (PVA)", "Glue", "None"]', 1, 'Standard embolic agents. (Beckmann)'),
    (v_topic_id, '251: "Hysterectomy" - Complication: "Vaginal Vault Prolapse" risk is minimized by?', '["Removing the cervix", "Surgical suspension of the vault to the uterosacral or sacrospinous ligaments", "Wait", "None"]', 1, 'Ensuring adequate apical support. (ACOG)'),
    (v_topic_id, '252: "Stress Incontinence" - "Sling" surgery: Does it go under the bladder or the urethra?', '["Bladder", "Mid-urethra", "Uterus", "None"]', 1, 'Provides support to the urethra during increased abdominal pressure. (Beckmann)'),
    (v_topic_id, '253: "Urinary Incontinence" - "Mirabegron" (Myrbetriq) mechanism?', '["Anticholinergic", "Beta-3 adrenergic agonist (relaxes the detrusor muscle)", "Alpha blocker", "None"]', 1, 'Alternative to anticholinergics with fewer dry-mouth/constipation side effects. (Williams)'),
    (v_topic_id, '254: "Interstitial Cystitis" - Avoid which foods?', '["Greens", "Acidic foods (citrus), caffeine, alcohol, and spicy foods", "Bread", "None"]', 1, 'Common triggers for bladder pain. (ACOG)'),
    (v_topic_id, '255: "Vaginal Vestibulitis" - Initial management?', '["Immediate surgery", "Pelvic floor physical therapy, behavioral modification, and topical lidocaine/estrogen", "Steroids", "None"]', 1, 'Multi-modal conservative approach. (Beckmann)'),
    (v_topic_id, '256: "Imperforate Hymen" - Long-term complication if left untreated?', '["Infertility", "Hematocolpos, hematometra, and potentially endometriosis from retrograde flow", "None", "GDM"]', 1, 'Must be surgically relieved by a cruciate incision. (Williams)'),
    (v_topic_id, '257: "Septate Uterus" - Why is it the most common anomaly associated with pregnancy loss?', '["It is too small", "The septum is fibrous and has poor blood supply, preventing proper implantation", "Twins", "None"]', 1, 'Can be treated with hysteroscopic resection. (ACOG)'),
    (v_topic_id, '258: "Bicornuate Uterus" results from:', '["Full fusion failure", "Partial fusion failure of the Mullerian ducts", "No uterus", "None"]', 1, 'Presents with a heart-shaped uterus. (Beckmann)'),
    (v_topic_id, '259: "Fibroids" - Can they cause "Painful Intercourse"?', '["No", "Yes (Dyspareunia), especially if located low in the uterus or cervix", "Only in men", "None"]', 1, 'Physical pressure from the mass. (Williams)'),
    (v_topic_id, '260: "Adenomyosis" - "Myometrial" thickness in adenomyosis is typically:', '["Thinner", "Asymmetrically or globally increased", "Normal", "None"]', 1, 'Leads to the "boggy" feel on exam. (Beckmann)'),
    (v_topic_id, '261: "Endometriosis" - Most common site for "Bowel" endometriosis?', '["Duodenum", "Anterior wall of the rectum and sigmoid colon", "Jejunum", "None"]', 1, 'Causes cyclic bowel symptoms. (Williams)'),
    (v_topic_id, '262: "PCOS" - Does "Metformin" increase the risk of twins?', '["Yes", "No (unlike Clomiphene, it just restores natural ovulation)", "Maybe", "None"]', 1, 'Benefit for fertility without increasing multiple gestation risk. (ACOG)'),
    (v_topic_id, '263: "Hirsutism" - How long does it take to see results from medical therapy (e.g., OCPs)?', '["1 week", "6-9 months (due to the hair growth cycle)", "2 years", "None"]', 1, 'Requires patient patience and education. (Beckmann)'),
    (v_topic_id, '264: "Primary Amenorrhea" - "Hymenotomy" is the procedure to fix:', '["Mullerian agenesis", "Imperforate hymen", "PCOS", "None"]', 1, 'Surgical opening of the hymen. (Williams)'),
    (v_topic_id, '265: "Secondary Amenorrhea" - "Sheehan Syndrome" is:', '["Thyroid failure", "Postpartum pituitary necrosis due to severe hemorrhage", "Liver failure", "None"]', 1, 'Classic board association. (Beckmann)'),
    (v_topic_id, '266: "Sheehan Syndrome" presents with failure to:', '["Lactate (due to low prolactin)", "Lose weight", "Walk", "None"]', 0, 'Followed by other pituitary deficiencies. (ACOG)'),
    (v_topic_id, '267: "Premature Ovarian Insufficiency" - What is the most important long-term medication?', '["Insulin", "Hormone Replacement Therapy (to prevent osteoporosis and CVD)", "Antibiotics", "None"]', 1, 'Maintains estrogen levels until the age of natural menopause. (ACOG)'),
    (v_topic_id, '268: "Laparoscopy" - Complication: "Thermal injury" to the bowel?', '["Not possible", "Major risk of electrocautery; may present several days after surgery with peritonitis", "None", "Infection"]', 1, 'Requires high index of suspicion. (Williams)'),
    (v_topic_id, '269: "Endometriosis" - "Decidualization" is a change seen in lesions during:', '["Menopause", "Pregnancy (under progesterone influence)", "Puberty", "None"]', 1, 'Can make lesions look larger or more cystic on US. (Beckmann)'),
    (v_topic_id, '270: "PCOS" - "Letrozole" is an aromatase inhibitor. It works by:', '["Increasing estrogen", "Lowering estrogen, which causes the pituitary to release more FSH", "Destroying the ovary", "None"]', 1, 'Standard ovulation induction mechanism. (ACOG)'),
    (v_topic_id, '271: "Adenomyosis" - Why is it more common in "multiparous" women?', '["They have more kids", "Potential trauma to the myometrium during pregnancy/delivery allowing endometrial invasion", "Unknown", "None"]', 1, 'One proposed theory. (Williams)'),
    (v_topic_id, '272: "Fibroids" - "Intravasation" is a risk during hysteroscopic surgery where:', '["The patient bleeds", "Fluid used for distension enters the vascular system", "The uterus ruptures", "None"]', 1, 'Can cause severe electrolyte imbalance (especially with glycine/monopolar). (ACOG)'),
    (v_topic_id, '273: "Pelvic Inflammatory Disease" - "Silent" PID is most common with which organism?', '["Gonorrhea", "Chlamydia", "E. coli", "None"]', 1, 'Leads to severe tubal damage without overt symptoms. (Beckmann)'),
    (v_topic_id, '274: "Tubo-ovarian Abscess" - "Hydrosalpinx" is:', '["A new tube", "A tube blocked with clear fluid (chronic PID)", "Cancer", "None"]', 1, 'Often seen on ultrasound after a PID episode. (Williams)'),
    (v_topic_id, '275: "Endometrioma" - "Aspiration" (draining) of the cyst:', '["Is curative", "Is generally NOT recommended due to high recurrence and risk of infection", "Is the only treatment", "None"]', 1, 'Surgical excision of the cyst wall is preferred. (ACOG)'),
    (v_topic_id, '276: "Vulvar Vestibulitis" - "Vestibulectomy" is:', '["Removing the uterus", "Surgical removal of the tender vestibular tissue", "A cream", "None"]', 1, 'Last-resort surgery for refractory pain. (Beckmann)'),
    (v_topic_id, '277: "Stress Incontinence" - Is "Pelvic Floor PT" effective?', '["No", "Yes, first-line treatment for mild-to-moderate stress incontinence", "Only if malignant", "None"]', 1, 'Standard of care. (ACOG)'),
    (v_topic_id, '278: "Vesicovaginal Fistula" - Most common cause globally?', '["Surgery", "Obstructed labor (pressure necrosis)", "Cancer", "None"]', 1, 'In the US, it is most common after hysterectomy. (Williams)'),
    (v_topic_id, '279: "Endometrial Hyperplasia" - WITHOUT atypia. Management?', '["Hysterectomy", "Progestin therapy (e.g., Megace or Mirena IUD)", "Radiation", "None"]', 1, 'Highly effective at reversing the hyperplasia. (ACOG)'),
    (v_topic_id, '280: "Endometrial Hyperplasia" - WITH atypia (EIN). Management?', '["Progestins only", "Hysterectomy (due to high risk of concurrent or future cancer)", "Wait", "None"]', 1, 'Standard of care in postmenopausal women. (ACOG)'),
    (v_topic_id, '281: "Fibroids" - Can they cause "Fever"?', '["No", "Yes, during red degeneration or if a pedunculated fibroid torses/infarcts", "Always", "None"]', 1, 'Due to acute inflammation. (Williams)'),
    (v_topic_id, '282: "Adenomyosis" - "Globular" uterus is often used to describe:', '["Cancer", "Adenomyosis", "Fibroids", "None"]', 1, 'Symmetrical, round enlargement. (Beckmann)'),
    (v_topic_id, '283: "Endometriosis" - "Retrograde menstruation" is found in what percentage of ALL women?', '["1%", "Up to 70-90%", "100%", "None"]', 1, 'Suggests that additional factors (immune/local) are needed for disease to develop. (Williams)'),
    (v_topic_id, '284: "PCOS" - Does "Birth Control" cure the disease?', '["Yes", "No, it manages symptoms (bleeding/acne/hair) and protects the endometrium but is not a cure", "Maybe", "None"]', 1, 'Mainstay of long-term management. (ACOG)'),
    (v_topic_id, '285: "Hirsutism" - "Laser hair removal" is most effective on:', '["Blonde hair", "Dark hair on light skin (due to pigment targeting)", "Red hair", "None"]', 1, 'Targeting melanin in the hair follicle. (Beckmann)'),
    (v_topic_id, '286: "Asherman Syndrome" - Can it cause "Cyclic Pain"?', '["No", "Yes, if the lower uterus is scarred but the upper endometrium is functional (hematometra)", "Only in GDM", "None"]', 1, 'Trapped menstrual blood. (Williams)'),
    (v_topic_id, '287: "Mullerian Agenesis" - "Vaginal Dilators" are used to:', '["Treat infection", "Create or lengthen a functional vagina through pressure", "None", "Hysterectomy"]', 1, 'Non-surgical (Frank method) creation of a neovagina. (ACOG)'),
    (v_topic_id, '288: "Septate Uterus" vs "Bicornuate Uterus": Which one is more easily repaired?', '["Bicornuate", "Septate (via simple hysteroscopic resection)", "None", "Both"]', 1, 'Bicornuate requires major abdominal surgery (Strassman metroplasty). (Williams)'),
    (v_topic_id, '289: "Endometrial Polyps" - "Polypectomy" is usually performed via:', '["Laparoscopy", "Hysteroscopy", "Vaginal", "None"]', 1, 'Directed removal under visualization. (Beckmann)'),
    (v_topic_id, '290: "Adenomyosis" - Why is it often a "diagnosis of exclusion"?', '["It is rare", "Symptoms overlap with fibroids/endometriosis and imaging was historically poor", "Unknown", "None"]', 1, 'Modern imaging (MRI/3D US) has improved this. (Williams)'),
    (v_topic_id, '291: "PID" - Does "Douching" increase the risk?', '["No", "Yes, significantly", "Only in teens", "None"]', 1, 'Alters vaginal flora and facilitates ascending infection. (ACOG)'),
    (v_topic_id, '292: "TOA" - Complication: "Sepsis" presents with:', '["Hypotension, tachycardia, and fever", "Pain only", "Weight gain", "None"]', 0, 'Life-threatening emergency. (Beckmann)'),
    (v_topic_id, '293: "Follicular Cyst" - If it doesn''t resolve in 8 weeks?', '["Ignore", "Warrants further investigation to rule out a neoplastic cyst", "Immediate surgery", "None"]', 1, 'Persistent cysts are not "functional." (ACOG)'),
    (v_topic_id, '294: "Mature Teratoma" - "Sebum" within the cyst is:', '["Clear", "Thick, oily substance produced by sebaceous glands", "Water", "None"]', 1, 'A classic feature of "dermoid" cysts. (Williams)'),
    (v_topic_id, '295: "Bartholin Abscess" - Organisms?', '["Gonorrhea", "Polymicrobial (skin flora, anaerobes, E. coli)", "Chlamydia", "Both A and B"]', 3, 'While classically associated with STIs, most are polymicrobial. (Beckmann)'),
    (v_topic_id, '296: "Chronic Pelvic Pain" - "Multidisciplinary" approach includes:', '["Gyn, PT, Psychology, and Pain Management", "Only Gyn", "None", "Surgery only"]', 0, 'Essential for chronic pain syndromes. (ACOG)'),
    (v_topic_id, '297: "Pelvic Organ Prolapse" - "Stage 0"?', '["Out of the body", "No prolapse", "Full prolapse", "None"]', 1, 'POP-Q staging system. (Williams)'),
    (v_topic_id, '298: "Pelvic Organ Prolapse" - "Stage IV" is:', '["No prolapse", "Complete eversion of the vagina (Procidentia)", "Small bulge", "None"]', 1, 'Most severe stage. (Beckmann)'),
    (v_topic_id, '299: "Urinary Incontinence" - "Post-void Residual" (PVR) > _____ mL suggests overflow incontinence.', '["50", "200", "10", "None"]', 1, 'Indicates significant urinary retention. (ACOG)'),
    (v_topic_id, '300: "Gyn Malignancy" - "Ovarian" cancer can mimic benign cysts. "CA-125" is most helpful in:', '["Teens", "Postmenopausal women with an adnexal mass", "Pregnancy", "None"]', 1, 'Higher positive predictive value in older women. (ACOG)');

    RAISE NOTICE 'SUCCESS: Batch 5 (241-300) MCQs for Benign Gynecology registered.';
END $$;
COMMIT;
