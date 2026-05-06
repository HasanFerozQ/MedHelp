BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'obgyn-benign-gynecology' LIMIT 1;
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic obgyn-benign-gynecology not found.';
    END IF;

    -- Batch 3: 122-182 (PCOS and Hyperandrogenism)
    -- Use a temporary table to stage insertions and prevent duplicates
    CREATE TEMP TABLE stage_mcqs (question TEXT, options JSONB, correct_index INT, explanation TEXT);

    INSERT INTO stage_mcqs (question, options, correct_index, explanation) VALUES
    ('122: What are the three criteria in the "Rotterdam" definition for PCOS (must have 2 of 3)?', '["Obesity, DM2, Acne", "Oligo/anovulation, Hyperandrogenism (clinical/biochemical), and Polycystic ovaries on ultrasound", "Pain, Bleeding, Infertility", "None"]', 1, 'Standard diagnostic criteria for PCOS. (ACOG; Beckmann)'),
    
    ('123: Which of the following is the PRIMARY endocrine abnormality in PCOS?', '["Low LH", "Increased GnRH pulse frequency leading to high LH and low/normal FSH", "High Estrogen only", "None"]', 1, 'The high LH:FSH ratio (> 2:1 or 3:1) stimulates the ovarian theca cells to produce excess androgens. (Williams; Beckmann)'),
    
    ('124: "Polycystic" ovaries on ultrasound are defined as having at least _____ follicles (2-9 mm) in either ovary or an ovarian volume > 10 mL.', '["5", "8", "12 (or 20 in newer guidelines)", "50"]', 2, 'The "string of pearls" appearance. (Williams; ACOG)'),
    
    ('125: Which of the following is a "clinical" sign of hyperandrogenism in PCOS?', '["Hirsutism", "Male-pattern alopecia (thinning hair)", "Acne", "All of the above"]', 3, 'Excess androgens affect the hair follicles and sebaceous glands. (Beckmann; Blueprints)'),
    
    ('126: The "Ferriman-Gallwey" score is used to assess the severity of:', '["Pain", "Hirsutism", "Acne", "Obesity"]', 1, 'Scores terminal hair growth in 9 body areas; a score >= 8 is usually considered hirsutism in many populations. (Williams; Comprehensive Gynecology)'),
    
    ('127: What is the underlying cause of "Acanthosis Nigricans" in women with PCOS?', '["Sun exposure", "Insulin resistance (hyperinsulinemia stimulates keratinocytes and melanocytes)", "Lack of vitamins", "None"]', 1, 'Velvety hyperpigmentation in skin folds (neck, axilla). (Beckmann; Williams)'),
    
    ('128: Why are women with PCOS at a significantly increased risk for "Endometrial Cancer"?', '["High Progesterone", "Chronic anovulation leads to \"unopposed\" estrogen, causing endometrial hyperplasia", "HPV infection", "None"]', 1, 'Without ovulation, there is no progesterone to stabilize and shed the lining. (Blueprints; ACOG)'),
    
    ('129: What is the MOST effective FIRST-LINE intervention for overweight women with PCOS desiring pregnancy?', '["Clomiphene", "Weight loss and lifestyle modification", "IVF", "Metformin"]', 1, 'Losing 5-10% of body weight can restore spontaneous ovulation in many women. (ACOG; Beckmann)'),
    
    ('130: Which medication is currently the FIRST-LINE medical therapy for ovulation induction in women with PCOS?', '["Clomiphene citrate", "Letrozole (Aromatase inhibitor)", "Metformin", "Dexamethasone"]', 1, 'Letrozole has higher live birth rates compared to clomiphene in PCOS patients. (ACOG; Williams)'),
    
    ('131: Mechanism of "Clomiphene Citrate" in ovulation induction?', '["Directly stimulates the ovary", "Selective Estrogen Receptor Modulator (SERM) that blocks estrogen receptors in the hypothalamus, increasing GnRH/FSH", "Increases Insulin", "None"]', 1, '"Tricks" the brain into thinking estrogen is low. (Beckmann; Blueprints)'),
    
    ('132: What is the primary role of "Metformin" in PCOS management?', '["Ovulation induction only", "Improving insulin sensitivity and metabolic profile; second-line for ovulation", "Shrinking cysts", "None"]', 1, 'Metformin reduces insulin levels, which in turn reduces ovarian androgen production. (Beckmann; ACOG)'),
    
    ('133: First-line treatment for "menstrual irregularity" and "hirsutism" in women with PCOS NOT desiring pregnancy?', '["Metformin", "Combined Oral Contraceptives (COCs)", "Spironolactone", "Letrozole"]', 1, 'COCs regulate the cycle, protect the endometrium, and increase Sex Hormone Binding Globulin (SHBG) to lower free androgens. (ACOG; Blueprints)'),
    
    ('134: How do Combined Oral Contraceptives (COCs) reduce hirsutism?', '["Blocking the receptor", "Increasing SHBG and suppressing LH (which lowers ovarian androgen production)", "Dissolving hair", "None"]', 1, 'SHBG binds free testosterone, making it inactive. (Beckmann; Williams)'),
    
    ('135: "Spironolactone" is often used for hirsutism. It is a _____ and its use requires _____ because it is teratogenic.', '["Progestin; no testing", "Aldosterone antagonist (anti-androgen); reliable contraception", "Estrogen; weight loss", "None"]', 1, 'Can feminize a male fetus; must be used with OCPs. (Beckmann; ACOG)'),
    
    ('136: A 22-year-old with rapid-onset hirsutism (< 6 months) and signs of "virilization" (clitoromegaly, voice deepening). What should be ruled out?', '["Normal PCOS", "Androgen-secreting tumor (ovarian or adrenal)", "Pregnancy", "Hypothyroidism"]', 1, 'Rapid onset and virilization are red flags for malignancy. (Beckmann; Williams)'),
    
    ('137: In the evaluation of hyperandrogenism, what does an elevated "DHEA-S" level suggest as the source?', '["Ovary", "Adrenal gland", "Pituitary", "Liver"]', 1, 'DHEA-S is almost exclusively produced by the adrenal glands. (Williams; Beckmann)'),
    
    ('138: "Non-classic Congenital Adrenal Hyperplasia" (NCCAH) can mimic PCOS. What lab value is used for screening?', '["TSH", "Morning 17-hydroxyprogesterone (17-OHP) level", "Cortisol", "LH"]', 1, 'If > 200 ng/dL, further testing (ACTH stim) is needed. (ACOG; Williams)'),
    
    ('139: What is the classic finding for "Cushing Syndrome" in a differential for PCOS?', '["Acanthosis", "Buffalo hump, purple striae, and moon facies", "Acne", "Thinness"]', 1, 'Associated with excess cortisol. (Blueprints)'),
    
    ('140: "Ovarian Drilling" (Laparoscopic Ovarian Cautery) is a treatment for:', '["Cancer", "Clomiphene-resistant PCOS infertility", "Pain", "None"]', 1, 'Destroys androgen-producing tissue to restore balance. (Beckmann; ACOG)'),
    
    ('141: What is the main risk of using Clomiphene or Letrozole for ovulation induction?', '["Liver failure", "Multiple gestation (twins ~5-10%)", "Hair loss", "Cancer"]', 1, 'Stimulates multiple follicles. (Beckmann; Blueprints)'),
    
    ('142: "HAIR-AN" syndrome is a severe subgroup of PCOS. What does it stand for?', '["Hyperandrogenism, Insulin Resistance, and Acanthosis Nigricans", "Hair, Acne, Inflammation, Redness", "High Androgens in Regions", "None"]', 0, 'Characterized by extreme insulin resistance. (Williams; Comprehensive Gynecology)'),
    
    ('143: Women with PCOS should be screened for which of the following metabolic conditions?', '["Type 2 Diabetes (via 2-hour OGTT)", "Dyslipidemia", "Obstructive Sleep Apnea", "All of the above"]', 3, 'Comprehensive metabolic screening is essential. (ACOG; Beckmann)'),
    
    ('144: A woman with PCOS has a total testosterone level > 200 ng/dL. What is the most likely diagnosis?', '["PCOS", "Androgen-secreting tumor", "Hypothyroidism", "None"]', 1, 'Testosterone > 200 is highly suspicious for a Sertoli-Leydig cell tumor or similar. (Beckmann; Williams)'),
    
    ('145: "Finasteride" (a 5-alpha-reductase inhibitor) is used for PCOS-related hirsutism. It works by:', '["Blocking LH", "Preventing conversion of Testosterone to the more potent Dihydrotestosterone (DHT)", "Increasing SHBG", "None"]', 1, 'Directly reduces androgen effect on hair. (ACOG; Williams)'),
    
    ('146: "Eflornithine" (Vaniqa) cream treats hirsutism by:', '["Blocking hormones", "Directly inhibiting hair growth in the follicle (topical)", "Bleaching hair", "None"]', 1, 'Local treatment, effective but hair regrows if stopped. (Beckmann)'),
    
    ('147: Why is "progestin withdrawal" (e.g., Provera for 10 days) used in PCOS?', '["To induce ovulation", "To prevent endometrial hyperplasia by causing a shed of the lining", "To cure acne", "None"]', 1, 'For women who don''t want OCPs but need endometrial protection. (ACOG; Beckmann)'),
    
    ('148: What is the effect of "Insulin" on the liver in women with PCOS?', '["Increases glucose", "Decreases the production of SHBG", "Increases SHBG", "None"]', 1, 'Hyperinsulinemia leads to more "free" (active) testosterone. (Williams; Comprehensive Gynecology)'),
    
    ('149: "Stromal Hyperthecosis" is a more severe form of PCOS typically seen in:', '["Teens", "Pregnant women", "Postmenopausal women", "Infants"]', 2, 'Presents with significant virilization and very high testosterone. (Williams; Comprehensive Gynecology)'),
    
    ('150: Which of the following is TRUE about the ovaries in PCOS?', '["They are always painful", "The cysts are actually follicles that have arrested in development", "They are tiny", "None"]', 1, 'Chronic lack of ovulation leads to multiple small follicles. (Beckmann; Williams)'),
    
    ('151: Does every woman with "polycystic ovaries" on ultrasound have PCOS?', '["Yes", "No, many healthy women have this finding; diagnosis requires the other Rotterdam criteria", "Only if she is obese", "None"]', 1, 'PCO on US is sensitive but not specific for the syndrome. (ACOG; Beckmann)'),
    
    ('152: A 30-year-old PCOS patient on OCPs for 1 year still has significant hirsutism. Next step?', '["Switch OCP", "Add Spironolactone", "Surgery", "None"]', 1, 'It takes at least 6 months to see OCP effect on hair; if insufficient, add an anti-androgen. (ACOG; Williams)'),
    
    ('153: PCOS is associated with an increased risk of which pregnancy complication?', '["Gestational Diabetes and Preeclampsia", "Placenta previa", "Breech presentation", "None"]', 0, 'Metabolic dysfunction persists in pregnancy. (Williams; ACOG)'),
    
    ('154: Which lifestyle change is most critical for long-term health in PCOS?', '["High carb diet", "Caloric restriction and regular aerobic exercise to improve insulin sensitivity", "Sleep 12 hours", "None"]', 1, 'Foundation of all PCOS management. (Beckmann; Blueprints)'),
    
    ('155: A "Sertoli-Leydig Cell Tumor" classically presents with:', '["Slow hirsutism", "Rapid virilization and a palpable adnexal mass", "Infection", "None"]', 1, 'Highly androgenic ovarian tumor. (Williams; Beckmann)'),
    
    ('156: Management of "Hyperandrogenism" in pregnancy (e.g., Luteoma of pregnancy) is usually:', '["Surgery", "Observation (usually regresses postpartum)", "Chemo", "Termination"]', 1, 'Benign condition that can virilize the mother and female fetus. (Williams)'),
    
    ('157: "Idiopathic Hirsutism" is defined as:', '["Hirsutism with irregular cycles", "Hirsutism with NORMAL ovulatory cycles and NORMAL androgen levels", "Cancer", "None"]', 1, 'Due to increased 5-alpha-reductase activity in the skin. (Beckmann; Williams)'),
    
    ('158: Which of the following is NOT a Rotterdam criterion?', '["Obesity", "Hyperandrogenism", "Polycystic ovaries", "Oligo-ovulation"]', 0, 'Obesity is common (~50-70%) but NOT a requirement for diagnosis. (ACOG; Williams)'),
    
    ('159: PCOS patients undergoing IVF are at higher risk for which complication?', '["Ovarian Hyperstimulation Syndrome (OHSS)", "Twins", "Infection", "None"]', 0, 'Due to the large number of follicles recruited. (Williams)'),
    
    ('160: What is the role of "Dexamethasone" in PCOS?', '["None", "Small doses may be used to suppress adrenal androgen production in resistant cases", "To treat acne", "None"]', 1, 'Glucocorticoids suppress ACTH. (Comprehensive Gynecology)'),
    
    ('161: "Amenorrhea" in PCOS is defined as the absence of menses for _____ months.', '["1", "3", "6 (or 3 cycles in previously regular women)", "12"]', 2, 'Secondary amenorrhea. (Beckmann)'),
    
    ('162: "Oligomenorrhea" is defined as fewer than _____ menstrual cycles per year.', '["4", "9", "12", "15"]', 1, 'Or cycles > 35 days apart. (Beckmann)'),
    
    ('163: Can PCOS be diagnosed in a woman with regular cycles?', '["Yes, if she has hyperandrogenism and polycystic ovaries", "No", "Only if she is obese", "None"]', 0, 'Follows the "2 of 3" rule. (ACOG; Williams)'),
    
    ('164: In the USMLE context, "string of pearls" on US refers to:', '["Endometriosis", "PCOS", "Fibroids", "Cancer"]', 1, 'Classic buzzword. (Blueprints; Beckmann)'),
    
    ('165: A woman with PCOS wants to get pregnant. She has been on OCPs. What is the first step after stopping OCPs?', '["Letrozole", "Weight loss and prenatal vitamins", "IUI", "None"]', 1, 'Preparation for pregnancy is key. (ACOG)'),
    
    ('166: Why is "Letrozole" preferred over "Clomiphene" in PCOS?', '["It is cheaper", "It does not have the anti-estrogenic effect on the endometrium and cervical mucus", "It works faster", "None"]', 1, 'Better success rates in the PCOS population. (ACOG; Williams)'),
    
    ('167: High LH levels in PCOS stimulate which cells to produce androstenedione?', '["Granulosa cells", "Theca cells", "Oocytes", "None"]', 1, 'LH acts on theca cells. (Williams)'),
    
    ('168: Low FSH levels in PCOS mean there is insufficient aromatization in the _____ cells.', '["Theca", "Granulosa", "Uterine", "None"]', 1, 'FSH acts on granulosa cells to convert androgens to estrogens. (Williams)'),
    
    ('169: "Functional Ovarian Hyperandrogenism" is another term for:', '["Cancer", "PCOS", "Cushing''s", "None"]', 1, 'Focuses on the ovarian source of excess androgens. (Comprehensive Gynecology)'),
    
    ('170: Does PCOS resolve after menopause?', '["Yes, completely", "The androgen excess may persist, but the polycystic morphology and oligomenorrhea stop", "It gets worse", "None"]', 1, 'Metabolic risks (DM2, CVS) continue into menopause. (ACOG; Williams)'),
    
    ('171: Which of the following is a common psychotropic side effect associated with PCOS?', '["Increased risk of depression and anxiety", "Bipolar disorder", "Schizophrenia", "None"]', 0, 'Likely due to chronic symptoms and metabolic issues. (ACOG; Williams)'),
    
    ('172: "Primary Amenorrhea" in a 16-year-old with hirsutism and a normal uterus. Diagnosis?', '["PCOS (can present at menarche)", "Mullerian agenesis", "Turner syndrome", "None"]', 0, 'PCOS can prevent menarche from ever occurring. (Beckmann)'),
    
    ('173: "Premature Adrenarche" is often a precursor to:', '["Fibroids", "PCOS", "Endometriosis", "None"]', 1, 'Early pubic hair growth may indicate later syndrome development. (Williams)'),
    
    ('174: Which OCP is often touted as "best" for PCOS because its progestin has anti-androgenic properties?', '["Levonorgestrel-containing", "Drospirenone-containing (e.g., Yaz/Yasmin)", "Norethindrone", "None"]', 1, 'Drospirenone is a spironolactone analogue. (Williams; Beckmann)'),
    
    ('175: A 35-year-old PCOS patient on Metformin for DM2 becomes pregnant. Should she continue Metformin?', '["Yes, it is generally considered safe and may reduce GDM risk (though OCPs/insulin are preferred for DM management)", "No, it causes birth defects", "Only in the 3rd trimester", "None"]', 0, 'Decision is individualized. (ACOG; Williams)'),
    
    ('176: What is the "cutoff" age for stopping cervical screening in a woman with PCOS?', '["50", "65 (same as others)", "80", "Never"]', 1, 'Same as the general population unless they have a history of high-grade disease. (ACOG)'),
    
    ('177: Which androgen is primarily responsible for "hirsutism" at the follicle level?', '["DHEA-S", "Dihydrotestosterone (DHT)", "Androstenedione", "None"]', 1, 'Converted from testosterone by 5-alpha-reductase. (Beckmann; Williams)'),
    
    ('178: PCOS is the most common cause of _____ infertility.', '["Tubal", "Anovulatory", "Uterine", "Unexplained"]', 1, 'Accounts for ~70-80% of anovulatory infertility. (ACOG; Beckmann)'),
    
    ('179: "Hyperprolactinemia" should be ruled out in PCOS. What is a common symptom?', '["Hirsutism", "Galactorrhea (milky nipple discharge)", "Weight gain", "Pain"]', 1, 'Prolactin inhibits GnRH and can cause oligomenorrhea. (Beckmann)'),
    
    ('180: A woman with PCOS has a "virilized" female fetus. This is most likely due to:', '["Maternal PCOS", "Aromatase deficiency (fetal) or Luteoma of pregnancy", "Diet", "None"]', 1, 'Aromatase deficiency prevents conversion of fetal androgens to estrogens. (Williams)'),
    
    ('181: "Polycystic Ovarian Syndrome" was originally known as:', '["Sampson Syndrome", "Stein-Leventhal Syndrome", "Cushing Syndrome", "None"]', 1, 'Named after the first describers in 1935. (Williams)'),
    
    ('182: "Androstenedione" is converted to "Estrone" in peripheral _____ tissue.', '["Liver", "Adipose", "Muscle", "None"]', 1, 'Obesity leads to more estrone, which feeds back to the brain to further disrupt cycles. (Williams; Beckmann)');

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
