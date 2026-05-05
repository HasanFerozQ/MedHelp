BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-benign-gynecology' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-benign-gynecology not found.';
    END IF;

    -- Batch 4: 181-240 (Hirsutism, Amenorrhea, and Pediatric Gyn Basics)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '181: "Hirsutism" - A "Total Testosterone" level > _____ ng/dL should prompt investigation for an androgen-secreting tumor.', '["50", "100", "200", "500"]', 2, 'Rapid onset and very high levels suggest malignancy (e.g., Sertoli-Leydig tumor). (ACOG)'),
    (v_topic_id, '182: A "DHEAS" level > _____ mcg/dL suggests an adrenal tumor.', '["100", "350", "700", "None"]', 2, 'DHEAS is primarily produced by the adrenal glands. (Beckmann)'),
    (v_topic_id, '183: "Congenital Adrenal Hyperplasia" (Late-onset/Non-classic) can mimic PCOS. What marker is used to screen?', '["17-hydroxyprogesterone (17-OHP)", "hCG", "CA-125", "None"]', 0, 'Measured in the early morning fasting state. (Williams)'),
    (v_topic_id, '184: "Cushing Syndrome" is caused by an excess of:', '["Androgens", "Cortisol", "Estrogen", "None"]', 1, 'Presents with moon facies, striae, and central obesity. (Beckmann)'),
    (v_topic_id, '185: "Hyperprolactinemia" causes amenorrhea by:', '["Increasing FSH", "Inhibiting GnRH pulsatility", "Directly blocking the uterus", "None"]', 1, 'Can also cause galactorrhea. (ACOG)'),
    (v_topic_id, '186: "Primary Amenorrhea" is defined as the absence of menses by age _____ (if secondary sexual characteristics are present).', '["13", "15", "16", "18"]', 1, 'Or age 13 if no breast development. (ACOG)'),
    (v_topic_id, '187: Most common cause of Primary Amenorrhea with BREAST development but NO uterus?', '["Turner Syndrome", "Mullerian Agenesis (Mayer-Rokitansky-Küster-Hauser syndrome)", "PCOS", "None"]', 1, 'Karyotype is 46, XX; ovaries are functional. (Williams)'),
    (v_topic_id, '188: "Androgen Insensitivity Syndrome" (AIS) karyotype is:', '["46, XX", "46, XY", "45, X", "None"]', 1, 'Phenotypically female but genetically male; no uterus, blind-ending vagina. (Beckmann)'),
    (v_topic_id, '189: "Turner Syndrome" (45, X) results in:', '["Large ovaries", "Streak ovaries (gonadal dysgenesis) and lack of breast development", "High estrogen", "None"]', 1, 'Presents with short stature and webbed neck. (Williams)'),
    (v_topic_id, '190: "Kallmann Syndrome" is characterized by primary amenorrhea and:', '["Blindness", "Anosmia (inability to smell)", "Obesity", "None"]', 1, 'Due to failure of GnRH-producing neurons to migrate. (Beckmann)'),
    (v_topic_id, '191: "Swyer Syndrome" (46, XY pure gonadal dysgenesis) presents with:', '["Normal uterus and streak ovaries", "No uterus", "High testosterone", "None"]', 0, 'Requires gonadectomy due to high cancer risk. (Williams)'),
    (v_topic_id, '192: "Imperforate Hymen" presents with:', '["Bleeding", "Cyclic pelvic pain in a young girl with primary amenorrhea and a \"bulging blue membrane\" on exam", "Fever", "None"]', 1, 'Blood accumulates in the vagina (hematocolpos). (Beckmann)'),
    (v_topic_id, '193: "Septate Uterus" is a Mullerian anomaly most associated with:', '["Cancer", "Recurrent Miscarriage", "Obesity", "None"]', 1, 'Poor blood supply to the septum. (ACOG)'),
    (v_topic_id, '194: "Uterus Didelphys" is:', '["One uterus", "Double uterus and double cervix", "No uterus", "None"]', 1, 'Due to failure of fusion of the Mullerian ducts. (Williams)'),
    (v_topic_id, '195: "Labial Adhesions" in prepubertal girls are usually treated with:', '["Surgery", "Topical estrogen cream", "Antibiotics", "None"]', 1, 'Due to low estrogen levels in childhood. (Beckmann)'),
    (v_topic_id, '196: "Lichen Sclerosus" in a child:', '["Is always abuse", "Can be spontaneous; presents with \"Figure-of-eight\" distribution and itching", "Needs surgery", "None"]', 1, 'Important to distinguish from trauma/abuse. (ACOG)'),
    (v_topic_id, '197: "Urethral Prolapse" in young girls presents as:', '["A donut-shaped red mass at the urethral meatus", "Vaginal bleeding", "Twins", "None"]', 0, 'Treated with topical estrogen. (Williams)'),
    (v_topic_id, '198: "Premature Thelarche" is:', '["Early menses", "Isolated breast development before age 8 without other signs of puberty", "Obesity", "None"]', 1, 'Usually a benign variant. (Beckmann)'),
    (v_topic_id, '199: "Premature Adrenarche" is:', '["Early breasts", "Isolated pubic/axillary hair development before age 8", "Fever", "None"]', 1, 'Often associated with increased risk of later PCOS. (Williams)'),
    (v_topic_id, '200: "Central Precocious Puberty" is _____ dependent.', '["Estrogen", "GnRH (Gonadotropin-dependent)", "Weight", "None"]', 1, 'Bone age is advanced. (ACOG)'),
    (v_topic_id, '201: "McCune-Albright Syndrome" triad:', '["Precocious puberty, Cafe-au-lait spots, and Polyostotic fibrous dysplasia", "Pain, Fever, Rash", "None", "Blindness"]', 0, 'Gonadotropin-independent precocity. (Beckmann)'),
    (v_topic_id, '202: "Progesterone Challenge Test": Bleeding after stopping progesterone indicates:', '["No estrogen", "Adequate estrogen and a patent outflow tract", "Uterine scarring", "None"]', 1, 'Used in the workup of secondary amenorrhea. (Williams)'),
    (v_topic_id, '203: "Premature Ovarian Insufficiency" (POI) is defined as menopause before age:', '["30", "40", "45", "50"]', 1, 'Characterized by high FSH and low Estrogen. (ACOG)'),
    (v_topic_id, '204: "Fragile X Premutation" is a genetic cause of:', '["Fibroids", "Premature Ovarian Insufficiency", "Twins", "None"]', 1, 'Important to screen POI patients for this. (ACOG)'),
    (v_topic_id, '205: "Secondary Dysmenorrhea" - Pain that begins _____ before menses.', '["1-2 days", "Several days before and lasts throughout the cycle", "After menses", "None"]', 1, 'Suggests underlying pathology like endometriosis or adenomyosis. (Beckmann)'),
    (v_topic_id, '206: "Primary Dysmenorrhea" is due to:', '["Endometriosis", "Excessive prostaglandin (PGF2-alpha) production in the endometrium", "Infection", "None"]', 1, 'Presents shortly after menarche; responsive to NSAIDs. (ACOG)'),
    (v_topic_id, '207: "Endometrial Polyps" - Malignancy risk in a postmenopausal woman?', '["0%", "Up to 5%", "50%", "None"]', 1, 'Polyps in symptomatic postmenopausal women should always be removed. (Williams)'),
    (v_topic_id, '208: "Endometrial Polyps" - Can they cause "Infertility"?', '["No", "Yes, by acting as a foreign body in the cavity", "Only if malignant", "None"]', 1, 'Hysteroscopic removal can improve pregnancy rates. (ACOG)'),
    (v_topic_id, '209: "Fibroids" - Is "Obesity" a risk factor?', '["No", "Yes, due to increased peripheral conversion of estrogen", "Only in men", "None"]', 1, 'Standard association. (Beckmann)'),
    (v_topic_id, '210: "Fibroids" - "Hereditary Leiomyomatosis and Renal Cell Cancer" (HLRCC) is associated with:', '["Fumarate hydratase mutation", "p53", "APC", "None"]', 0, 'Presents with multiple cutaneous and uterine leiomyomas and aggressive kidney cancer. (Williams)'),
    (v_topic_id, '211: "Pelvic Organ Prolapse" (POP) - Primary risk factor?', '["Vaginal childbirth", "Obesity", "Aging", "All of the above"]', 3, 'Weakening of the pelvic floor support. (ACOG)'),
    (v_topic_id, '212: "Cystocele" is prolapse of the:', '["Rectum", "Bladder into the anterior vaginal wall", "Uterus", "None"]', 1, 'Often causes urinary symptoms. (Beckmann)'),
    (v_topic_id, '213: "Rectocele" is prolapse of the:', '["Bladder", "Rectum into the posterior vaginal wall", "Bowel", "None"]', 1, 'May require "splinting" to defecate. (Williams)'),
    (v_topic_id, '214: "Enterocele" is:', '["Bladder prolapse", "Herniation of the small bowel into the vaginal vault", "Stomach", "None"]', 1, 'Common after hysterectomy. (Beckmann)'),
    (v_topic_id, '215: "Pessary" is a:', '["Surgery", "Removable device placed in the vagina to support prolapsed organs", "Meds", "None"]', 1, 'Conservative management option for POP. (ACOG)'),
    (v_topic_id, '216: "Colpocleisis" is a surgical treatment for prolapse that involves:', '["Removing the uterus", "Obliterating (closing) the vaginal canal", "Fixing the bladder", "None"]', 1, 'Reserved for patients who are not sexually active and are poor surgical candidates. (Williams)'),
    (v_topic_id, '217: "Urinary Incontinence" - "Stress" incontinence is caused by:', '["Overactive bladder", "Increased intra-abdominal pressure (coughing, sneezing) and urethral hypermobility", "Infection", "None"]', 1, 'Core clinical concept. (ACOG)'),
    (v_topic_id, '218: "Urge Incontinence" is caused by:', '["Urethral hypermobility", "Detrusor overactivity", "Stones", "None"]', 1, 'Characterized by a sudden, intense need to void. (Beckmann)'),
    (v_topic_id, '219: "Overflow Incontinence" is associated with:', '["Small bladder", "Bladder underactivity (detrusor areflexia) or outlet obstruction", "Excessive drinking", "None"]', 1, 'Presents with frequent dribbling. (Williams)'),
    (v_topic_id, '220: "First-line" treatment for "Urge Incontinence"?', '["Surgery", "Bladder training and pelvic floor exercises (Behavioral therapy)", "Anticholinergics", "None"]', 1, 'Always start with conservative measures. (ACOG)'),
    (v_topic_id, '221: "Anticholinergics" (e.g., Oxybutynin) for urge incontinence should be avoided in:', '["Asthma", "Narrow-angle glaucoma", "Diabetes", "None"]', 1, 'Can worsen intraocular pressure. (Beckmann)'),
    (v_topic_id, '222: "Surgical" gold standard for Stress Incontinence?', '["Hysterectomy", "Mid-urethral Sling (MUS)", "Antibiotics", "None"]', 1, 'Highly effective minimally invasive procedure. (ACOG)'),
    (v_topic_id, '223: "Q-tip Test" is used to diagnose:', '["Infection", "Urethral hypermobility (Angle > 30 degrees)", "Cancer", "None"]', 1, 'Standard part of the incontinence workup. (Williams)'),
    (v_topic_id, '224: "Cystometrogram" (CMG) measures:', '["Bladder size", "Pressure-volume relationship during bladder filling", "Kidney function", "None"]', 1, 'Part of urodynamic testing. (Beckmann)'),
    (v_topic_id, '225: "Vesicovaginal Fistula" presents with:', '["Urge", "Continuous leakage of urine from the vagina following surgery or radiation", "Pain", "None"]', 1, 'Diagnosed with a "Tampon test" and dye. (Williams)'),
    (v_topic_id, '226: "PCOS" - Risk of "Gestational Diabetes" in pregnancy?', '["Decreased", "Increased", "No effect", "None"]', 1, 'Due to underlying insulin resistance. (ACOG)'),
    (v_topic_id, '227: "PCOS" - Most common age of onset?', '["Childhood", "Puberty / Late adolescence", "40s", "None"]', 1, 'Symptoms often emerge shortly after menarche. (Beckmann)'),
    (v_topic_id, '228: "Hirsutism" - "Vaniqa" (Eflornithine cream) works by:', '["Removing hair permanently", "Slowing the rate of hair growth", "Changing hair color", "None"]', 1, 'Topical treatment for facial hair. (Williams)'),
    (v_topic_id, '229: "Endometriosis" - Is a "normal" pelvic exam possible?', '["No", "Yes, up to 50% of patients with laparoscopically proven disease have a normal physical exam", "Only in men", "None"]', 1, 'Limits the utility of physical exam for diagnosis. (ACOG)'),
    (v_topic_id, '230: "Endometriosis" - "Surgical" ablation of nerve pathways for pain?', '["LUNA (Laparoscopic Uterosacral Nerve Ablation)", "Myomectomy", "None", "LEEP"]', 0, 'Historically used, but randomized trials show limited benefit. (Williams)'),
    (v_topic_id, '231: "Adenomyosis" - "Osada procedure" is:', '["Hysterectomy", "Uterine-sparing surgical excision of adenomyotic tissue", "Meds", "None"]', 1, 'Technically challenging conservative surgery. (Williams)'),
    (v_topic_id, '232: "Asherman Syndrome" - Why is "Estrogen" given after surgery?', '["To prevent pregnancy", "To stimulate endometrial regrowth and prevent re-adhesion", "To stop bleeding", "None"]', 1, 'Part of the post-operative recovery protocol. (Beckmann)'),
    (v_topic_id, '233: "Endometrial Polyps" - Most common histological type?', '["Adenocarcinoma", "Hyperplastic with or without atypia", "Fibrocystic", "None"]', 1, 'Reflects the underlying hormonal environment. (Williams)'),
    (v_topic_id, '234: "Fibroids" - Can they cause "Constipation"?', '["No", "Yes, by direct posterior compression of the rectum", "Only if small", "None"]', 1, 'A common "bulk" symptom. (Beckmann)'),
    (v_topic_id, '235: "PCOS" - "Aromatase" inhibitors (Letrozole) are preferred over Clomiphene because:', '["They are cheaper", "They have a shorter half-life and no anti-estrogenic effect on the endometrium", "They cause more twins", "None"]', 1, 'Results in a better endometrial environment for implantation. (ACOG)'),
    (v_topic_id, '236: "Hirsutism" vs "Virilization": Virilization includes hirsutism plus:', '["Weight loss", "Voice deepening, clitoromegaly, and increased muscle mass", "Fever", "None"]', 1, 'Suggests much higher androgen levels. (Williams)'),
    (v_topic_id, '237: "Primary Amenorrhea" - If FSH is high and ovaries are NOT seen on US?', '["Turner Syndrome", "PCOS", "Pregnancy", "None"]', 0, 'Suggests gonadal dysgenesis. (Beckmann)'),
    (v_topic_id, '238: "Mullerian Agenesis" - Are "Kidney" anomalies common?', '["No", "Yes, up to 30% have renal anomalies (e.g., renal agenesis, pelvic kidney)", "Only in men", "None"]', 1, 'Always perform renal ultrasound in these patients. (ACOG)'),
    (v_topic_id, '239: "Endometriosis" - Risk of "recurrence" after conservative surgery?', '["0%", "Up to 40% over 5 years", "100%", "None"]', 1, 'Chronic disease management is required. (ACOG)'),
    (v_topic_id, '240: "Adenomyosis" - "Swiss-cheese" appearance of the myometrium?', '["Fibroid", "Adenomyosis (on MRI or Ultrasound)", "Cancer", "None"]', 1, 'Reflects multiple small cystic spaces. (Beckmann)');

    RAISE NOTICE 'SUCCESS: Batch 4 (181-240) MCQs for Benign Gynecology registered.';
END $$;
COMMIT;
