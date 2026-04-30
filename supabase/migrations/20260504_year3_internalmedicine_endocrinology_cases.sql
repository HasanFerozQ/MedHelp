BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'endocrinology' LIMIT 1;

    -- CASE 01: Type 2 Diabetes Mellitus (Diagnosis)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Asymptomatic Hyperglycemia', 'A 52-year-old obese male presents for a routine physical. He has no symptoms but a strong family history of "sugar." His fasting plasma glucose is 135 mg/dL on two separate occasions.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnostic threshold for Fasting Plasma Glucose (FPG) for Diabetes?', '[">= 100 mg/dL", ">= 110 mg/dL", ">= 126 mg/dL", ">= 200 mg/dL"]', 2, 'Per ADA criteria; must be confirmed on a second test unless symptomatic.'),
    (v_case_id, 'What is the diagnostic threshold for HbA1c?', '[">= 5.7%", ">= 6.0%", ">= 6.5%", ">= 7.0%"]', 2, 'HbA1c reflects average glucose over the last 3 months.'),
    (v_case_id, 'What is the first-line medication for most patients with new-onset Type 2 Diabetes?', '["Insulin", "Glipizide", "Metformin", "Pioglitazone"]', 2, 'Metformin is the gold standard for its efficacy, safety, and lack of weight gain/hypoglycemia.');

    -- CASE 02: Diabetic Ketoacidosis (DKA)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Lethargy and "Fruity" Breath', 'A 19-year-old female with Type 1 Diabetes presents with abdominal pain, vomiting, and confusion. Her breath has a "fruity" odor. Labs: Glucose 450, pH 7.15, Bicarbonate 12, positive serum ketones.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first priority in the management of DKA?', '["IV Insulin bolus", "Aggressive IV Fluid Resuscitation (Normal Saline)", "Bicarbonate infusion", "Antibiotics"]', 1, 'Volume expansion is the critical first step.'),
    (v_case_id, 'Which electrolyte must be monitored and replaced carefully during insulin therapy for DKA?', '["Sodium", "Potassium", "Calcium", "Magnesium"]', 1, 'Insulin shifts potassium into cells; even if the serum level is normal, the total body potassium is depleted.'),
    (v_case_id, 'When should you switch from Normal Saline to D5W + 1/2NS in DKA management?', '["When the pH is > 7.4", "When the Blood Glucose falls below 200-250 mg/dL", "Immediately", "Never"]', 1, 'To prevent hypoglycemia while continuing the insulin infusion needed to clear the ketones.');

    -- CASE 03: Hyperosmolar Hyperglycemic State (HHS)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Severe Dehydration and Extreme Hyperglycemia', 'An 80-year-old male with Type 2 Diabetes is brought from a nursing home with severe confusion. Labs: Glucose 950 mg/dL, pH 7.35 (Normal), Bicarbonate 24 (Normal), negative ketones, and calculated Serum Osmolality of 350 mOsm/kg.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["DKA", "HHS", "Stroke", "Uremia"]', 1, 'HHS is characterized by profound hyperglycemia, high osmolality, and a lack of significant ketoacidosis.'),
    (v_case_id, 'Why do HHS patients NOT develop ketoacidosis?', '["They don''t have fat", "They have enough residual insulin to suppress lipolysis but not enough to control glucose", "Their liver is broken", "They drink too much water"]', 1, 'A small amount of insulin prevents the breakdown of fats into ketones.'),
    (v_case_id, 'HHS is most commonly triggered by:', '["Eating too much sugar", "Infection (e.g., Pneumonia or UTI)", "Exercise", "Skipping a meal"]', 1, 'Dehydration and physiologic stress are the primary drivers.');

    -- CASE 04: Graves Disease (Hyperthyroidism)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tremors, Heat Intolerance, and Proptosis', 'A 30-year-old female presents with palpitations, weight loss despite increased appetite, and "bulging eyes." On exam, she has a diffuse, non-tender goiter and a fine tremor.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely pattern of TSH and Free T4 in this patient?', '["High TSH, Low T4", "Low TSH, High T4", "Normal TSH, High T4", "High TSH, High T4"]', 1, 'Primary hyperthyroidism shows suppressed TSH due to feedback.'),
    (v_case_id, 'What is the name for the "bulging eyes" finding?', '["Papilledema", "Exophthalmos (or Proptosis)", "Ptosis", "Nystagmus"]', 1, 'Specifically associated with Graves disease due to retro-orbital inflammation.'),
    (v_case_id, 'What is the most appropriate medication to treat her palpitations and tremors acutely?', '["Methimazole", "Propranolol", "Levothyroxine", "Iodine"]', 1, 'Beta-blockers provide rapid symptomatic relief of adrenergic symptoms.');

    -- CASE 05: Hashimoto Thyroiditis (Hypothyroidism)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fatigue, Cold Intolerance, and Weight Gain', 'A 45-year-old female presents with 6 months of worsening fatigue, constipation, and a 10 lb weight gain. She feels "cold all the time." On exam, she has a firm, diffuse goiter.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the best initial screening test for hypothyroidism?', '["Serum Free T4", "Serum TSH", "Thyroid Ultrasound", "Anti-TPO antibodies"]', 1, 'TSH is the most sensitive test for primary thyroid disease.'),
    (v_case_id, 'Which antibody is highly specific for Hashimoto thyroiditis?', '["TSH-receptor antibody (TSI)", "Anti-Thyroid Peroxidase (anti-TPO)", "ANA", "Anti-centromere"]', 1, 'Present in > 90% of patients.'),
    (v_case_id, 'What is the standard treatment?', '["Methimazole", "Levothyroxine (T4)", "Radioactive Iodine", "Surgery"]', 1, 'Hormone replacement with synthetic T4.');

    -- CASE 06: Thyroid Storm
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever, Tachycardia, and Delirium', 'A patient with known hyperthyroidism undergoes emergency surgery. In the recovery room, she develops a fever of 105\u00b0F, a HR of 160 bpm, and becomes extremely agitated and confused.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Malignant Hyperthermia", "Thyroid Storm", "Sepsis", "Serotonin Syndrome"]', 1, 'A life-threatening extreme of hyperthyroidism often triggered by stress or surgery.'),
    (v_case_id, 'Which of the following is NOT part of the standard management for thyroid storm?', '["Beta-blockers", "Propylthiouracil (PTU)", "Glucocorticoids", "Levothyroxine"]', 3, 'PTU (to block synthesis and T4->T3 conversion), Beta-blockers (symptoms), and Steroids (block conversion) are all used. Adding T4 would worsen the condition.'),
    (v_case_id, 'Why are glucocorticoids used in thyroid storm?', '["To treat infection", "To inhibit the peripheral conversion of T4 to T3", "To raise blood sugar", "To prevent adrenal failure"]', 1, 'High-dose steroids block the activation of thyroid hormone.');

    -- CASE 07: Myxedema Coma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hypothermia, Bradycardia, and Altered Mental Status', 'An 80-year-old female with a history of hypothyroidism is found unresponsive in her unheated apartment. She is hypothermic (temp 94\u00b0F), bradycardic (HR 40), and has non-pitting edema of her face and legs.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Sepsis", "Myxedema Coma", "Stroke", "Drug overdose"]', 1, 'The life-threatening extreme of hypothyroidism.'),
    (v_case_id, 'What is the most appropriate initial management?', '["Passive rewarming and IV Levothyroxine", "Methimazole", "Aggressive diuretics", "Aspirin"]', 0, 'Requires urgent hormone replacement and supportive care.'),
    (v_case_id, 'Which other condition should be suspected and treated empirically in these patients?', '["Diabetes", "Adrenal Insufficiency", "Liver failure", "Cancer"]', 1, 'Concomitant adrenal insufficiency is common; give stress-dose steroids until it is ruled out.');

    -- CASE 08: Primary Hyperparathyroidism
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hypercalcemia and Low Phosphorus', 'A 60-year-old female presents with constipation and a new kidney stone. Her labs show Calcium 11.5 mg/dL (High), Phosphorus 2.2 mg/dL (Low), and PTH 150 pg/mL (High).', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Vitamin D deficiency", "Primary Hyperparathyroidism", "Secondary Hyperparathyroidism", "Cancer"]', 1, 'High Ca + High/Normal PTH = Primary Hyperparathyroidism.'),
    (v_case_id, 'What is the most common cause of primary hyperparathyroidism?', '["Parathyroid hyperplasia", "Parathyroid Adenoma", "Parathyroid Carcinoma", "Kidney failure"]', 1, 'A single benign adenoma accounts for > 80% of cases.'),
    (v_case_id, 'What is the definitive treatment for symptomatic patients?', '["Bisphosphonates", "Surgical parathyroidectomy", "Calcimimetics", "High-fiber diet"]', 1, 'Removing the overactive gland is the only cure.');

    -- CASE 09: Hypoparathyroidism (Post-Surgical)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Perioral Numbness and Tapping the Face', 'A 35-year-old female undergoes a total thyroidectomy for cancer. On postoperative day 2, she complains of tingling around her mouth. When her cheek is tapped, her lip twitches.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the twinge of the lip when the facial nerve is tapped called?', '["Trousseau sign", "Chvostek sign", "Murphy sign", "Babinski sign"]', 1, 'A classic sign of hypocalcemia.'),
    (v_case_id, 'What is the cause of her hypocalcemia?', '["Low TSH", "Accidental removal or damage to the parathyroid glands", "Low Vitamin D", "Renal failure"]', 1, 'Common complication of neck surgery.'),
    (v_case_id, 'What ECG finding is associated with hypocalcemia?', '["Peaked T-waves", "Prolonged QT interval", "Short QT interval", "Delta wave"]', 1, 'Hypocalcemia prolongs the ST segment and the QT interval.');

    -- CASE 10: Cushing Syndrome (Diagnosis)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Weight Gain, Purple Striae, and Buffalo Hump', 'A 40-year-old female presents with central obesity, a "moon face," and wide purple stretch marks on her abdomen. Her BP is 155/95 mmHg.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the best initial screening test for Cushing syndrome?', '["Random serum cortisol", "24-hour urinary free cortisol or Overnight dexamethasone suppression test", "CT Adrenals", "ACTH level"]', 1, 'Confirm hypercortisolism before looking for the source.'),
    (v_case_id, 'If the screening is positive, what is the next step to determine the source?', '["MRI Brain", "Plasma ACTH level", "Petrosal sinus sampling", "DHEAS"]', 1, 'ACTH tells you if it is ACTH-dependent (high) or independent (low/adrenal).'),
    (v_case_id, 'A "Buffalo Hump" is also known as:', '["Cervical fat pad", "Scoliosis", "Kyphosis", "Lipoma"]', 0, 'Dorsocervical fat pad is a sign of chronic cortisol excess.');

    -- CASE 11: Adrenal Insufficiency (Addison''s Disease)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hyperpigmentation and Hypotension', 'A 50-year-old male with a history of vitiligo presents with severe fatigue, weight loss, and low blood pressure. His skin is noted to be very dark, especially in the palmar creases. Labs: Na 130 (Low), K 5.5 (High).', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Addison''s Disease (Primary Adrenal Insufficiency)", "Secondary Adrenal Insufficiency", "Diabetes", "Hypothyroidism"]', 1, 'Hyperpigmentation and hyperkalemia point to PRIMARY failure (Addison''s).'),
    (v_case_id, 'What is the most common cause of Addison''s disease in the United States?', '["Tuberculosis", "Autoimmune Adrenalitis", "Metastatic cancer", "Infarction"]', 1, 'Autoimmune destruction of the cortex.'),
    (v_case_id, 'What is the definitive diagnostic test?', '["Random cortisol", "Cosyntropin (ACTH) Stimulation Test", "Insulin tolerance test", "CT scan"]', 1, 'Failure of cortisol to rise after ACTH injection confirms the diagnosis.');

    -- CASE 12: Pheochromocytoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Paroxysmal HTN, Headache, and Sweating', 'A 35-year-old female presents with episodes of "pounding headaches," palpitations, and drenching sweats. During an episode, her BP is 210/120 mmHg.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the best initial screening test?', '["CT Abdomen", "Plasma free metanephrines or 24-hour urine metanephrines", "Renal artery ultrasound", "Aldosterone/Renin ratio"]', 1, 'Metanephrines are breakdown products of catecholamines.'),
    (v_case_id, 'Which medication MUST be started first before surgery to prevent a hypertensive crisis?', '["Beta-blocker (e.g., Propranolol)", "Alpha-blocker (e.g., Phenoxybenzamine)", "ACE inhibitor", "Diuretic"]', 1, 'Alpha-blockade MUST come before beta-blockade to avoid "unopposed alpha" vasoconstriction.'),
    (v_case_id, 'Where do most pheochromocytomas arise?', '["Adrenal Cortex", "Adrenal Medulla", "Pituitary", "Carotid body"]', 1, 'Arise from chromaffin cells.');

    -- CASE 13: Primary Hyperaldosteronism (Conn Syndrome)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hypertension and Hypokalemia', 'A 45-year-old male with persistent HTN (160/100) is found to have a potassium of 3.0 mEq/L. He is not taking any diuretics. His plasma Renin is very low and Aldosterone is high.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Renal Artery Stenosis", "Primary Hyperaldosteronism (Conn Syndrome)", "Liddle syndrome", "Addison''s"]', 1, 'High aldosterone + Low renin = Primary problem (usually adrenal adenoma).'),
    (v_case_id, 'What is the preferred medication for patients with bilateral adrenal hyperplasia?', '["Lisinopril", "Spironolactone or Eplerenone", "Amlodipine", "Furosemide"]', 1, 'Aldosterone antagonists block the hormone at the receptor level.'),
    (v_case_id, 'What acid-base disturbance is associated with this condition?', '["Metabolic Acidosis", "Metabolic Alkalosis", "Respiratory Acidosis", "None"]', 1, 'Aldosterone promotes the excretion of H+ and K+ in exchange for Na+.');

    -- CASE 14: Acromegaly
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Enlarging Ring Size and New-onset Snoring', 'A 50-year-old male notes that he had to buy larger shoes and his wedding ring no longer fits. His wife says he snores loudly. On exam, he has a prominent brow and a large tongue.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the best initial screening test for acromegaly?', '["Random Growth Hormone (GH)", "Insulin-like Growth Factor-1 (IGF-1)", "MRI Brain", "Glucose tolerance test"]', 1, 'IGF-1 levels are stable throughout the day, unlike GH.'),
    (v_case_id, 'What is the gold standard confirmatory test?', '["Random GH", "Oral Glucose Tolerance Test (OGTT) with GH measurement", "Dexamethasone test", "Water deprivation test"]', 1, 'Glucose should suppress GH; failure to suppress is diagnostic.'),
    (v_case_id, 'What is the most common cause of death in acromegaly patients?', '["Brain tumor", "Cardiovascular Disease (Heart failure/Cardiomyopathy)", "Lung cancer", "Diabetes"]', 1, 'Chronic GH excess leads to hypertrophic cardiomyopathy.');

    -- CASE 15: Prolactinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Galactorrhea and Amenorrhea', 'A 28-year-old female presents with nipple discharge and her periods have stopped. She is not pregnant. Her Prolactin level is 300 ng/mL (Normal < 20).', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pituitary Adenoma (Prolactinoma)", "Pregnancy", "Hypothyroidism", "PCOS"]', 0, 'Most common secretory pituitary tumor.'),
    (v_case_id, 'What is the first-line treatment for most prolactinomas?', '["Surgical resection", "Dopamine agonists (e.g., Cabergoline or Bromocriptine)", "Radiation", "Wait and see"]', 1, 'Medical therapy is highly effective at shrinking the tumor and normalizing prolactin.'),
    (v_case_id, 'How does prolactin cause amenorrhea?', '["Directly inhibits the ovaries", "Inhibits GnRH secretion", "Destroys the pituitary", "None"]', 1, 'Prolactin suppresses the hypothalamic-pituitary-gonadal axis.');

    -- CASE 16: Diabetes Insipidus (Nephrogenic)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Polyuria on Lithium', 'A 45-year-old male with Bipolar disorder on Lithium therapy presents with intense thirst and urinating 6 liters a day. His Sodium is 148 mEq/L. Desmopressin administration does NOT increase his urine osmolality.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Central DI", "Nephrogenic DI", "Psychogenic polydipsia", "SIADH"]', 1, 'Failure to respond to ADH (Desmopressin) indicates the kidney is resistant.'),
    (v_case_id, 'What is the mechanism by which Lithium causes this?', '["Destroys the pituitary", "Antagonizes the V2 receptor/AQP2 channels in the collecting duct", "Inhibits thirst", "None"]', 1, 'Lithium is a classic cause of nephrogenic DI.'),
    (v_case_id, 'What is the paradoxical treatment for nephrogenic DI?', '["Fluid restriction", "Thiazide diuretics", "Loop diuretics", "IV saline"]', 1, 'Thiazides cause mild volume depletion, increasing proximal reabsorption of water and sodium.');

    -- CASE 17: SIADH
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hyponatremia in a Patient with Small Cell Lung Cancer', 'A 65-year-old male with small cell lung cancer presents with confusion. Sodium is 118 mEq/L. He is euvolemic. Urine Na is 50, Urine Osm 600.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the best initial management for moderate symptoms?', '["3% Saline", "Fluid restriction and salt tablets", "Normal Saline", "Furosemide"]', 1, 'Fluid restriction is the mainstay; 3% saline is reserved for severe symptoms (seizures, coma).'),
    (v_case_id, 'Which medication blocks the V2 receptor and can be used for SIADH?', '["Vasopressin", "Tolvaptan or Conivaptan", "Lisinopril", "Metformin"]', 1, 'Vaptans are vasopressin receptor antagonists.'),
    (v_case_id, 'Small cell lung cancer causes SIADH via:', '["Ectopic production of ADH", "Destruction of the pituitary", "Inhibition of thirst", "None"]', 0, 'Paraneoplastic secretion.');

    -- CASE 18: Primary Adrenal Insufficiency (Acute Crisis)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hypotension and Fever after Surgery', 'A patient with known Addison''s disease undergoes abdominal surgery. In the ICU, her BP drops to 70/40 mmHg and does not respond to 2 liters of fluid. She has a high fever.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Sepsis", "Adrenal Crisis", "Hemorrhage", "PE"]', 1, 'Acute failure to produce cortisol in response to stress.'),
    (v_case_id, 'What is the most important life-saving treatment?', '["IV Norepinephrine", "High-dose IV Hydrocortisone", "Broad-spectrum antibiotics", "IV Glucose only"]', 1, 'Stress-dose steroids are essential.'),
    (v_case_id, 'Why does this patient have a fever?', '["Infection only", "Cortisol deficiency leads to dysregulated cytokine production (IL-1, IL-6)", "Brain tumor", "None"]', 1, 'Fever is a common feature of adrenal crisis even without infection.');

    -- CASE 19: Polycystic Ovary Syndrome (PCOS)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Irregular Periods, Acne, and Hirsutism', 'A 24-year-old obese female presents with irregular periods (only 3 a year) and facial hair growth. Labs show an LH/FSH ratio of 3:1.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Prolactinoma", "PCOS", "Cushing Syndrome", "Hypothyroidism"]', 1, 'Hyperandrogenism + Oligo-ovulation in an obese patient.'),
    (v_case_id, 'What is the underlying metabolic abnormality strongly associated with PCOS?', '["Insulin resistance", "Diabetes Insipidus", "Hypoglycemia", "Low LDL"]', 0, 'Hyperinsulinemia drives androgen production in the ovaries.'),
    (v_case_id, 'What is the first-line management for a patient with PCOS who wants to lose weight and regulate periods?', '["Oral contraceptives", "Lifestyle modification (Weight loss and Exercise)", "Spironolactone", "Metformin"]', 1, 'Weight loss improves insulin sensitivity and often restores ovulation.');

    -- CASE 20: Osteoporosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Asymptomatic Postmenopausal Female with a Fracture', 'A 70-year-old female presents after falling and breaking her hip. She has no previous history of fractures. A DEXA scan shows a T-score of -3.0.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What T-score threshold defines osteoporosis?', '["< -1.0", "< -2.0", "< -2.5", "< 0"]', 2, 'Per WHO criteria; -1.0 to -2.5 is osteopenia.'),
    (v_case_id, 'What is the first-line pharmacological treatment?', '["Calcium only", "Bisphosphonates (e.g., Alendronate)", "Estrogen", "Vitamin D only"]', 1, 'Bisphosphonates inhibit osteoclast activity.'),
    (v_case_id, 'Which of the following is a known rare side effect of bisphosphonates?', '["Liver failure", "Osteonecrosis of the jaw", "Kidney stones", "Hair loss"]', 1, 'Also atypical femur fractures.');

    -- CASE 21: Paget Disease of Bone
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Increasing Hat Size and Bone Pain', 'A 75-year-old male presents with deep, boring pain in his right leg and says his favorite hat "doesn''t fit anymore." Labs: Isolated elevation of Alkaline Phosphatase; Calcium and Phosphorus are normal.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Bone cancer", "Paget Disease of Bone", "Osteoporosis", "Rickets"]', 1, 'Characterized by disordered bone remodeling (high turnover).'),
    (v_case_id, 'What is the classic X-ray finding?', '["Lytic lesions", "Thickened, disorganized bone with a \"mosaic\" pattern on histology", "Diffuse thinning", "Normal"]', 1, 'Histology shows a mosaic pattern of lamellar bone.'),
    (v_case_id, 'What is a dangerous neurological complication of skull involvement?', '["Hearing loss", "Blindness", "Loss of smell", "None"]', 0, 'Bone overgrowth compresses the 8th cranial nerve in the internal auditory meatus.');

    -- CASE 22: MEN 1 Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Kidney Stones, Stomach Ulcers, and Blurred Vision', 'A 35-year-old male presents with recurrent kidney stones. His father had a pituitary tumor. Labs show high Calcium, high PTH, and a large pancreatic mass.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["MEN 1", "MEN 2A", "MEN 2B", "VHL"]', 0, 'The 3 Ps: Parathyroid, Pancreas, Pituitary.'),
    (v_case_id, 'Which gene is mutated in MEN 1?', '["RET", "MEN1 (Menin)", "VHL", "APC"]', 1, 'A tumor suppressor gene.'),
    (v_case_id, 'What pancreatic tumor is most common in MEN 1?', '["Insulinoma", "Gastrinoma", "Glucagonoma", "Somatostatinoma"]', 1, 'Zollinger-Ellison syndrome is common in MEN 1.');

    -- CASE 23: MEN 2A Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Thyroid Mass and High BP', 'A 30-year-old female is found to have medullary thyroid carcinoma. She also has episodes of palpitations and high BP. Her serum Calcium is high.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["MEN 1", "MEN 2A", "MEN 2B", "Lynch"]', 1, 'Medullary Thyroid, Pheo, and Parathyroid Hyperplasia.'),
    (v_case_id, 'Which gene is mutated in MEN 2A and 2B?', '["MEN1", "RET proto-oncogene", "NF1", "Rb"]', 1, 'Gain-of-function mutation.'),
    (v_case_id, 'What is the characteristic hormone secreted by medullary thyroid cancer?', '["TSH", "Calcitonin", "Thyroglobulin", "PTH"]', 1, 'Arises from the C-cells.');

    -- CASE 24: MEN 2B Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Thyroid Mass and "Bumpy" Tongue', 'A 20-year-old male presents with a thyroid mass. He has a very tall, thin build and fleshy bumps on his tongue and lips.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Marfan Syndrome", "MEN 2B", "MEN 2A", "NF1"]', 1, 'Medullary Thyroid, Pheo, and Marfanoid habitus/Mucosal neuromas.'),
    (v_case_id, 'How is MEN 2B distinguished from MEN 2A?', '["Presence of parathyroid disease", "Presence of mucosal neuromas and lack of parathyroid disease", "Better prognosis", "Different gene"]', 1, 'Both have RET mutations, but 2B does not typically involve the parathyroid.'),
    (v_case_id, 'The "bumpy" lesions on the tongue are:', '["Warts", "Mucosal Neuromas", "Cancer", "Ulcers"]', 1, 'Fleshy, benign nerve tumors.');

    -- CASE 25: Hypoglycemia (Insulinoma)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fainting and Low Sugar in a Non-Diabetic', 'A 35-year-old female presents with episodes of confusion and sweating that are relieved by eating. During an episode, her blood glucose is 40 mg/dL. Her Insulin and C-peptide levels are both high.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Exogenous insulin use", "Insulinoma", "Addison''s", "Liver failure"]', 1, 'High insulin + high C-peptide indicates endogenous production (Insulinoma). Exogenous insulin would show low C-peptide.'),
    (v_case_id, 'What is the "Whipple Triad"?', '["Fever, pain, jaundice", "Symptoms of hypoglycemia, low blood glucose, and relief of symptoms with glucose", "BP, HR, RR", "None"]', 1, 'The clinical criteria for investigating hypoglycemia.'),
    (v_case_id, 'What is the most appropriate imaging to find the tumor?', '["CT Abdomen", "Endoscopic Ultrasound", "MRI Brain", "PET scan"]', 1, 'Insulinomas are often very small and difficult to see on standard CT.');

    -- CASE 26: Factitious Hypoglycemia (Exogenous Insulin)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Low Sugar with Low C-Peptide', 'A 30-year-old nurse is found unconscious. Glucose 30, Insulin 500 (Very High), C-peptide 0.1 (Very Low). Proinsulin is also low.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the cause of her hypoglycemia?', '["Insulinoma", "Exogenous Insulin injection", "Sulfonylurea use", "Sepsis"]', 1, 'High insulin but low C-peptide means the insulin was injected.'),
    (v_case_id, 'Why is the C-peptide low?', '["It is destroyed by insulin", "C-peptide is only co-secreted with endogenous insulin", "The lab made a mistake", "None"]', 1, 'Insulin and C-peptide are cleaved from proinsulin in equal amounts in the pancreas.'),
    (v_case_id, 'If she had taken a Sulfonylurea instead of insulin, what would the C-peptide be?', '["Low", "High", "Normal", "Undetectable"]', 1, 'Sulfonylureas stimulate endogenous insulin release, so C-peptide would be high.');

    -- CASE 27: Sheehan Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Failure to Lactate after a Bloody Delivery', 'A 30-year-old female had a complicated delivery with massive hemorrhage. She is now 3 weeks postpartum and is unable to breastfeed. She feels extremely tired and has lost her pubic hair.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pituitary tumor", "Sheehan Syndrome", "Addison''s", "Hypothyroidism"]', 1, 'Ischemic necrosis of the pituitary following postpartum hemorrhage.'),
    (v_case_id, 'The enlarged pituitary of pregnancy is vulnerable to ischemia because:', '["It is small", "It doubles in size but the blood supply remains the same", "It is infected", "None"]', 1, 'The gland is very metabolically active but the portal system is low-pressure.'),
    (v_case_id, 'What is the first hormone to be lost in panhypopituitarism typically?', '["ACTH", "Growth Hormone", "TSH", "Prolactin"]', 1, 'Followed by LH/FSH, then TSH, then ACTH.');

    -- CASE 28: Empty Sella Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Incidental Finding on Head MRI', 'A 40-year-old obese female has an MRI for headaches. The radiologist reports "the sella turcica is filled with CSF and the pituitary gland is flattened." Her hormone levels are normal.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Pituitary tumor", "Empty Sella Syndrome", "Craniopharyngioma", "Stroke"]', 1, 'A common incidental finding; usually the pituitary function remains normal.'),
    (v_case_id, 'This condition is most commonly associated with:', '["Diabetes", "Idiopathic Intracranial Hypertension (Pseudotumor cerebri)", "Heart failure", "Smoking"]', 1, 'High CSF pressure pushes the arachnoid into the sella.'),
    (v_case_id, 'What is the recommended management?', '["Surgery", "Reassurance (if pituitary function is normal)", "Radiation", "Levothyroxine"]', 1, 'No treatment needed for primary empty sella without hormonal deficits.');

    -- CASE 29: Diabetic Foot Ulcer
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Painless Wound on the Sole of the Foot', 'A 65-year-old male with long-standing Type 2 Diabetes presents with a "hole" in the bottom of his foot. He didn''t realize it was there until his sock was bloody. On exam, he cannot feel a monofilament on his toes.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary cause of this ulcer?', '["Infection", "Diabetic Neuropathy", "Arterial disease only", "Trauma alone"]', 1, 'Loss of protective sensation (neuropathy) leads to repetitive trauma and ulceration.'),
    (v_case_id, 'What is the most serious complication of a deep diabetic foot ulcer?', '["Pain", "Osteomyelitis", "Weight loss", "Fever"]', 1, 'Infection spreading to the bone often requires amputation.'),
    (v_case_id, 'What is the best way to prevent these ulcers?', '["Daily foot exams", "High-sugar diet", "Tight shoes", "Antibiotics"]', 0, 'Early detection of minor injuries.');

    -- CASE 30: Carcinoid Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Flushing and Diarrhea', 'A 60-year-old male presents with episodes of intense facial flushing and watery diarrhea. He is found to have multiple liver masses. A 24-hour urine collection shows high 5-HIAA.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pheochromocytoma", "Carcinoid Syndrome", "ZES", "IBS"]', 1, 'Secretes serotonin and other vasoactive substances.'),
    (v_case_id, 'Why do symptoms usually only appear AFTER the tumor has metastasized to the liver?', '["The liver makes the hormone", "The liver normally metabolizes the hormone (First-pass effect)", "The tumor only grows in the liver", "None"]', 1, 'Hormones from a primary GI carcinoid are inactivated by the liver before reaching systemic circulation.'),
    (v_case_id, 'What heart complication is associated with carcinoid syndrome?', '["Aortic Stenosis", "Tricuspid Regurgitation/Right-sided heart fibrosis", "Mitral Stenosis", "Left-sided failure"]', 1, 'High serotonin levels cause fibrous plaques on the right heart valves; left heart is protected because the lungs metabolize serotonin.');

    RAISE NOTICE 'SUCCESS: Endocrinology Case Blocks (1-30) registered.';
END $$;

COMMIT;
