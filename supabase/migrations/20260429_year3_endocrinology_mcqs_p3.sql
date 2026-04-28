-- Migration: Year 3 - Endocrinology MCQ Bank (PART 3: 167-249)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-29

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'endocrinology' LIMIT 1;

    -- SECTION 18: ADVANCED THYROID
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '167: "Riedel Thyroiditis" is a rare condition where the thyroid is replaced by ____, making it feel "hard as a rock."', '["Fat", "Fibrous tissue", "Cancer", "Pus"]', 1, 'Often associated with IgG4-related disease. (Harrison''s Ch. 376)'),
    (v_topic_id, '168: "Euthyroid Sick Serum" (Nonthyroidal Illness) typically shows which pattern during severe systemic illness?', '["Low TSH, High T4", "Low T3, Normal/Low T4, and Normal/Low TSH", "High TSH", "None"]', 1, 'Reflects adaptation to illness; usually does not require treatment. (Step-Up)'),
    (v_topic_id, '169: "Wolff-Chaikoff Effect" refers to a temporary reduction in thyroid hormone after a/an:', '["Sugar load", "Large iodine load", "Infection", "Surgery"]', 1, 'Protective mechanism to prevent hyperthyroidism. (Pocket Medicine)'),
    (v_topic_id, '170: "Jod-Basedow Phenomenon" is iodine-induced ____ in a patient with a pre-existing goiter.', '["Hypothyroidism", "Hyperthyroidism", "Cancer", "Pain"]', 1, 'Opposite of the Wolff-Chaikoff effect. (Harrison''s Ch. 376)'),
    (v_topic_id, '171: "Amiodarone" can cause which thyroid complication?', '["Hypothyroidism", "Hyperthyroidism", "Both", "None"]', 2, 'Contains significant iodine and has direct toxic effects. (Step-Up)'),
    (v_topic_id, '172: Thyroid hormone is mostly transported in the blood bound to:', '["Albumin", "Thyroid Binding Globulin (TBG)", "Prealbumin", "None"]', 1, 'Only the "Free" fraction is biologically active. (Pocket Medicine)'),
    (v_topic_id, '173: "Thyroglossal Duct Cyst" is a midline neck mass that moves with:', '["Swallowing only", "Tongue protrusion and Swallowing", "Breathing", "Heartbeat"]', 1, 'Congenital remnant of thyroid descent. (Harrison''s Ch. 376)'),
    (v_topic_id, '174: "Struma ovarii" is a rare cause of hyperthyroidism where thyroid tissue is found in a/an:', '["Lung tumor", "Ovarian Teratoma", "Adrenal mass", "Pituitary"]', 1, 'Presents with low RAIU in the neck but high uptake in the pelvis. (Step-Up)'),
    (v_topic_id, '175: "Thyroid Peroxidase (TPO)" is the enzyme responsible for:', '["T4 to T3 conversion", "Iodination of thyroglobulin and coupling of iodotyrosines", "Breaking down TSH", "None"]', 1, 'The target of antithyroid drugs. (Pocket Medicine)'),
    (v_topic_id, '176: TSH is secreted by which part of the pituitary?', '["Posterior", "Anterior", "Stalk", "Hypothalamus"]', 1, 'Regulated by TRH from the hypothalamus. (Harrison''s Ch. 373)');

    -- SECTION 19: PITUITARY & HYPOTHALAMUS DEEP DIVE
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '177: "Craniopharyngioma" is a benign tumor in children that can cause:', '["Hyperthyroidism", "Hypopituitarism and visual field defects", "High sugar", "None"]', 1, 'Remnant of Rathke''s pouch; often calcified. (Step-Up)'),
    (v_topic_id, '178: "Diabetes Insipidus" is confirmed when urine osmolality remains ____ despite a high serum osmolality.', '["High (>800)", "Low (<300)", "Normal", "Variable"]', 1, 'Inability to concentrate urine. (Pocket Medicine)'),
    (v_topic_id, '179: "Somatostatin" (GHIH) is a hormone that ____ the release of GH and TSH.', '["Stimulates", "Inhibits", "Ignores", "Triggers"]', 1, 'Used therapeutically (e.g., Octreotide) for acromegaly. (Harrison''s Ch. 373)'),
    (v_topic_id, '180: "Nelson Syndrome" is rapid enlargement of a pituitary ACTH-tumor following:', '["Steroid use", "Bilateral Adrenalectomy", "Thyroid surgery", "Diabetes"]', 1, 'Loss of feedback from the adrenals leads to aggressive tumor growth. (Step-Up)'),
    (v_topic_id, '181: "Prolactin" release is TONICALLY inhibited by which neurotransmitter?', '["Acetylcholine", "Dopamine", "Serotonin", "GABA"]', 1, 'Anything that blocks dopamine (like antipsychotics) will raise prolactin. (Pocket Medicine)'),
    (v_topic_id, '182: "GnRH" (Gonadotropin-Releasing Hormone) must be secreted in a ____ fashion to stimulate FSH/LH.', '["Constant", "Pulsatile", "High-dose", "Slow"]', 1, 'Continuous GnRH (or long-acting analogs) actually suppresses the axis. (Harrison''s Ch. 373)'),
    (v_topic_id, '183: "Stalk Effect" refers to mild hyperprolactinemia (<100) caused by a mass compressing the pituitary stalk and blocking ____ flow.', '["Blood", "Dopamine", "TSH", "Sugar"]', 1, 'Not a true prolactinoma. (Step-Up)'),
    (v_topic_id, '184: "Secondary (Central) Adrenal Insufficiency" is most commonly caused by:', '["Infection", "Chronic exogenous steroid use and sudden withdrawal", "Pituitary tumor", "Head trauma"]', 1, 'Suppression of the HPA axis. (Pocket Medicine)'),
    (v_topic_id, '185: "Posterior Pituitary" (Neurohypophysis) does NOT synthesize hormones; it stores and releases:', '["TSH and ACTH", "ADH and Oxytocin", "GH and Prolactin", "Insulin"]', 1, 'These are made in the hypothalamus (supraoptic/paraventricular nuclei). (Harrison''s Ch. 373)'),
    (v_topic_id, '186: "SIADH" diagnosis requires the patient to be ____ clinically.', '["Dehydrated", "Euvolemic (no edema, no dehydration)", "Volume overloaded", "None"]', 1, 'A key diagnostic criterion. (Step-Up)');

    -- SECTION 20: ADRENAL & HYPERTENSION
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '187: "Mineralocorticoid Escape" explains why patients with primary hyperaldosteronism do NOT have:', '["Hypertension", "Edema", "Hypokalemia", "Headache"]', 1, 'ANP release and pressure natriuresis prevent significant volume overload. (Harrison''s Ch. 379)'),
    (v_topic_id, '188: "11-beta-hydroxylase" deficiency presents with hypertension because of the accumulation of:', '["Cortisol", "11-deoxycorticosterone (a weak mineralocorticoid)", "Renin", "Potassium"]', 1, 'Distinguishes it from 21-hydroxylase deficiency. (Step-Up)'),
    (v_topic_id, '189: "Dexamethasone" is used for suppression tests because it does NOT:', '["Work", "Interfere with cortisol assays", "Cross the brain", "None"]', 1, 'A synthetic glucocorticoid. (Pocket Medicine)'),
    (v_topic_id, '190: "Adrenal Incidentaloma" > ____ cm are usually recommended for surgical removal due to malignancy risk.', '["1", "4", "0.5", "10"]', 1, 'Size is a major predictor of cancer. (Harrison''s Ch. 379)'),
    (v_topic_id, '191: "Cosyntropin" (ACTH) Stimulation Test is used to diagnose:', '["Cushing", "Adrenal Insufficiency", "Diabetes", "Conn"]', 1, 'A failure of cortisol to rise confirms the diagnosis. (Step-Up)'),
    (v_topic_id, '192: "Primary" adrenal insufficiency shows ____ ACTH, while "Secondary" shows ____ ACTH.', '["Low; High", "High; Low", "Normal; Normal", "High; High"]', 1, 'Primary = the adrenal gland is broken; Secondary = the signal is missing. (Pocket Medicine)'),
    (v_topic_id, '193: "Pheochromocytoma" can be part of which genetic syndrome?', '["VHL, MEN 2, and NF1", "Down syndrome", "Cystic fibrosis", "None"]', 0, 'Important for screening family members. (Harrison''s Ch. 380)'),
    (v_topic_id, '194: "Catecholamine" breakdown products measured in urine for Pheo diagnosis are:', '["Glucose", "Metanephrines and Vanillylmandelic Acid (VMA)", "BUN", "Creatinine"]', 1, 'Usually measured in a 24-hour urine collection. (Step-Up)'),
    (v_topic_id, '195: "Adrenal Hemorrhage" can be seen in patients with sepsis or those taking:', '["Aspirin", "Anticoagulants (e.g., Warfarin)", "Statins", "Insulin"]', 1, 'Can lead to acute adrenal crisis. (Pocket Medicine)'),
    (v_topic_id, '196: In Cushing syndrome, "Hypokalemic Metabolic Alkalosis" is common if cortisol is high enough to:', '["Bind to mineralocorticoid receptors", "Inhibit Renin", "Destroy the kidney", "None"]', 0, 'Cortisol "overflow" effect. (Harrison''s Ch. 379)');

    -- SECTION 21: DIABETES PHARMACOLOGY & MONITORING
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '197: "DPP-4 Inhibitors" (e.g., Sitagliptin) work by:', '["Inhibiting fat absorption", "Increasing levels of native incretins (GLP-1/GIP)", "Killing sugar", "None"]', 1, 'Weight-neutral and low risk of hypoglycemia. (Step-Up)'),
    (v_topic_id, '198: "Thiazolidinediones" (e.g., Pioglitazone) are contraindicated in patients with:', '["Lung cancer", "Heart Failure (due to fluid retention)", "Gout", "Diabetes"]', 1, 'They activate PPAR-gamma and can cause edema. (Pocket Medicine)'),
    (v_topic_id, '199: "SGLT2 inhibitors" increase the risk of which infection?', '["Pneumonia", "Genitourinary (UTIs and Yeast infections)", "Flu", "None"]', 1, 'Due to glucose-rich urine promoting bacterial/fungal growth. (Harrison''s Ch. 396)'),
    (v_topic_id, '200: "GLP-1 Receptor Agonists" carry a potential (though rare) black-box warning for:', '["Heart attack", "Medullary Thyroid Cancer", "Kidney failure", "None"]', 1, 'Based on animal studies. (Step-Up)'),
    (v_topic_id, '201: The "A1c Goal" for most non-pregnant adults with DM is < ____ %.', '["6.0", "7.0", "8.0", "9.0"]', 1, 'Balances benefit of control vs risk of hypoglycemia. (Pocket Medicine)'),
    (v_topic_id, '202: "Hypoglycemia unawareness" is a dangerous complication of autonomic neuropathy where the patient:', '["Has high sugar", "Does not feel the warning signs (tremor, sweating) of low sugar", "Is always hungry", "None"]', 1, 'Risk is increased by frequent episodes or beta-blockers. (Harrison''s Ch. 396)'),
    (v_topic_id, '203: "Pre-diabetes" is defined by an HbA1c of:', '["5.0 - 5.6", "5.7 - 6.4", "6.5 - 7.0", "None"]', 1, 'An opportunity for lifestyle intervention to prevent progression. (Step-Up)'),
    (v_topic_id, '204: "Foot exams" for diabetic patients should be performed how often?', '["Once every 5 years", "At every office visit (at least annually)", "Only if there is pain", "Never"]', 1, 'Crucial for early detection of ulcers. (Pocket Medicine)'),
    (v_topic_id, '205: "ACE inhibitors" are indicated in diabetic patients with hypertension OR:', '["High sugar", "Any degree of Albuminuria", "Weight gain", "Low HDL"]', 1, 'Slowing progression of nephropathy. (Harrison''s Ch. 396)'),
    (v_topic_id, '206: "Intensive" glycemic control (A1c < 6.5) has been shown to reduce ____ but not necessarily ____.', '["Macrovascular; Microvascular", "Microvascular; Macrovascular/Mortality", "Weight; Sugar", "None"]', 1, 'Proven for eyes/kidneys/nerves, less so for heart attacks. (Step-Up)');

    -- SECTION 22: CALCIUM & BONE ADVANCED
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '207: "Parathyroid Hormone-related Protein (PTHrP)" is a cause of hypercalcemia in:', '["Addison''s", "Malignancy (e.g., Squamous cell lung CA)", "Lupus", "None"]', 1, 'Mimics the action of PTH. (Harrison''s Ch. 410)'),
    (v_topic_id, '208: "Vitamin D Toxicity" presents with high calcium and ____ phosphate.', '["Low", "High", "Normal", "None"]', 1, 'Vitamin D increases absorption of both. (Step-Up)'),
    (v_topic_id, '209: "Osteonecrosis of the Jaw" (ONJ) is a very rare side effect associated with:', '["Aspirin", "Long-term high-dose Bisphosphonates", "Insulin", "Metformin"]', 1, 'Often after dental procedures. (Pocket Medicine)'),
    (v_topic_id, '210: "Raloxifene" is a Selective Estrogen Receptor Modulator (SERM) that helps prevent osteoporosis and reduces the risk of:', '["Colon cancer", "Breast cancer", "Heart attack", "Stroke"]', 1, 'Antagonist in the breast, agonist in the bone. (Harrison''s Ch. 411)'),
    (v_topic_id, '211: "Fractional Excretion of Calcium" < 1% in a hypercalcemic patient suggests:', '["Primary HPT", "Familial Hypocalciuric Hypercalcemia (FHH)", "Sarcoidosis", "Cancer"]', 1, 'The kidneys are over-reabsorbing calcium. (Step-Up)'),
    (v_topic_id, '212: "Sarcoidosis" causes hypercalcemia due to ____ production of 1,25-OH Vitamin D.', '["Low", "Extra-renal (macrophage-mediated)", "Thyroid", "None"]', 1, 'Granulomas contain the activating enzyme. (Pocket Medicine)'),
    (v_topic_id, '213: "Low serum Phosphate" in primary hyperparathyroidism is due to PTH-mediated ____ in the urine.', '["Reabsorption", "Wasting/Excretion", "Storage", "None"]', 1, '"PTH = Phosphate Trashing Hormone." (Harrison''s Ch. 410)'),
    (v_topic_id, '214: "Calcitonin" is a hormone that ____ serum calcium levels.', '["Raises", "Lowers", "Stabilizes", "None"]', 1, 'Inhibits osteoclast bone resorption. (Step-Up)'),
    (v_topic_id, '215: "Osteitis Fibrosa Cystica" (Brown tumors) is a classic bone complication of:', '["Osteoporosis", "Severe, chronic hyperparathyroidism", "Paget''s", "Cancer"]', 1, 'Bone is replaced by fibrous tissue. (Pocket Medicine)'),
    (v_topic_id, '216: "Hypomagnesemia" causes hypocalcemia by making the tissues ____ to PTH.', '["Sensitive", "Resistant", "Unresponsive", "None"]', 1, 'Also inhibits PTH secretion. (Harrison''s Ch. 410)');

    -- SECTION 23: REPRODUCTIVE & HORMONE REPLACEMENT
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '217: "Testosterone Replacement Therapy" should be avoided in men with:', '["Diabetes", "Prostate Cancer", "High blood pressure", "Asthma"]', 1, 'Can stimulate tumor growth. (Harrison''s Ch. 392)'),
    (v_topic_id, '218: "Spironolactone" is used in women with PCOS to treat:', '["Sugar", "Hirsutism and Acne (due to anti-androgen effect)", "Obesity", "Pain"]', 1, 'Blocks androgen receptors. (Step-Up)'),
    (v_topic_id, '219: "Clomiphene Citrate" works for infertility by blocking estrogen feedback in the ____, raising FSH/LH.', '["Uterus", "Hypothalamus/Pituitary", "Ovary", "None"]', 1, 'Triggers ovulation. (Pocket Medicine)'),
    (v_topic_id, '220: "Menopause" is diagnosed after how many months of amenorrhea?', '["3", "6", "12", "24"]', 2, 'Average age is 51. (Harrison''s Ch. 391)'),
    (v_topic_id, '221: High FSH in a 55-year-old woman with hot flashes confirms:', '["Pregnancy", "Menopause", "Pituitary tumor", "None"]', 1, 'Loss of ovarian feedback leads to high gonadotropins. (Step-Up)'),
    (v_topic_id, '222: "Hormone Replacement Therapy" (HRT) for menopause should always include Progesterone if the woman has a/an:', '["Uterus", "History of clots", "Gallbladder", "None"]', 0, 'Unopposed estrogen increases the risk of endometrial cancer. (Pocket Medicine)'),
    (v_topic_id, '223: "Vaginal Atrophy" in menopause is treated first-line with:', '["Oral pills", "Topical Estrogen cream", "Antibiotics", "None"]', 1, 'Effective for local symptoms with minimal systemic absorption. (Harrison''s Ch. 391)'),
    (v_topic_id, '224: "Sertoli cells" in the testes are responsible for:', '["Testosterone production", "Spermatogenesis support and Inhibin secretion", "FSH secretion", "None"]', 1, 'Leydig cells make testosterone. (Step-Up)'),
    (v_topic_id, '225: "Inhibin" provides negative feedback to the pituitary for which hormone?', '["LH", "FSH", "ACTH", "TSH"]', 1, 'Specific feedback loop for sperm production. (Pocket Medicine)'),
    (v_topic_id, '226: "Estrogen" excess in men (e.g., from cirrhosis) can cause:', '["Gynecomastia and Testicular atrophy", "Large muscles", "Tall stature", "None"]', 0, 'Feedback suppresses the whole HPG axis. (Harrison''s Ch. 392)');

    -- SECTION 24: ENDOCRINE MIXED BOARD REVIEW
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '227: "Painless" thyroiditis with low uptake = ?', '["Graves", "Silent/Postpartum Thyroiditis", "Toxic nodule", "None"]', 1, 'Inflammatory leak, not overproduction. (Step-Up)'),
    (v_topic_id, '228: "Painful" thyroiditis with low uptake = ?', '["Subacute (De Quervain) Thyroiditis", "Hashimoto", "Graves", "Cancer"]', 0, 'Viral-mediated inflammation. (Pocket Medicine)'),
    (v_topic_id, '229: "C-peptide" low, "Glucose" high = ?', '["Type 2 DM", "Type 1 DM", "Insulinoma", "None"]', 1, 'Absolute insulin deficiency. (Harrison''s Ch. 396)'),
    (v_topic_id, '230: "C-peptide" high, "Glucose" low = ?', '["Starvation", "Insulinoma or Sulfonylurea use", "Exogenous insulin use", "None"]', 1, 'Both secrete/trigger C-peptide; exogenous insulin does NOT. (Step-Up)'),
    (v_topic_id, '231: "K+ high, Na low, BP low" = ?', '["Conn Syndrome", "Primary Adrenal Insufficiency (Addison)", "Cushing", "SIADH"]', 1, 'Lack of mineralocorticoids. (Pocket Medicine)'),
    (v_topic_id, '232: "K+ low, Na normal/high, BP high" = ?', '["Addison", "Primary Hyperaldosteronism (Conn)", "Hypothyroidism", "None"]', 1, 'Excess mineralocorticoids. (Harrison''s Ch. 379)'),
    (v_topic_id, '233: "Headache, Sweating, Tachycardia" = ?', '["Migraine", "Pheochromocytoma", "Anxiety", "None"]', 1, 'Episodic catecholamine excess. (Step-Up)'),
    (v_topic_id, '234: "Painless gross hematuria" = ?', '["UTI", "Urothelial Cancer", "Stone", "None"]', 1, 'Must rule out malignancy. (Pocket Medicine)'),
    (v_topic_id, '235: "Enlarged hands/feet, wide brow" = ?', '["Cushing", "Acromegaly", "Gigantism", "None"]', 1, 'GH excess in adults. (Harrison''s Ch. 373)'),
    (v_topic_id, '236: "Moon facies, Buffalo hump" = ?', '["Addison", "Cushing Syndrome", "Diabetes", "None"]', 1, 'Glucocorticoid excess. (Step-Up)'),
    (v_topic_id, '237: "Tachycardia, Heat intolerance, Weight loss" = ?', '["Hypothyroid", "Hyperthyroid", "Pheo", "None"]', 1, 'Classic thyrotoxicosis. (Pocket Medicine)'),
    (v_topic_id, '238: "Bradycardia, Cold intolerance, Constipation" = ?', '["Hyperthyroid", "Hypothyroid", "Celiac", "None"]', 1, 'Classic myxedema. (Harrison''s Ch. 376)'),
    (v_topic_id, '239: "High Calcium, High PTH" = ?', '["Sarcoid", "Primary Hyperparathyroidism", "Cancer", "Vitamin D toxicity"]', 1, 'Autonomous PTH secretion. (Step-Up)'),
    (v_topic_id, '240: "High Calcium, Low PTH" = ?', '["Primary HPT", "Hypercalcemia of Malignancy", "Addison", "None"]', 1, 'Non-parathyroid source of calcium. (Pocket Medicine)'),
    (v_topic_id, '241: "Low Calcium, High PTH" = ?', '["Hypoparathyroidism", "Secondary Hyperparathyroidism (Vitamin D deficiency/CKD)", "None", "None"]', 1, 'Normal response to low serum calcium. (Harrison''s Ch. 410)'),
    (v_topic_id, '242: "Low Calcium, Low PTH" = ?', '["Secondary HPT", "Primary Hypoparathyroidism (e.g., Post-surgical)", "None", "None"]', 1, 'Gland failure. (Step-Up)'),
    (v_topic_id, '243: "Honeymoon period" in DM Type 1 refers to:', '["Initial diagnosis", "Brief recovery of insulin secretion after starting treatment", "End of life", "None"]', 1, 'Important to warn patients that insulin needs will rise again. (Pocket Medicine)'),
    (v_topic_id, '244: "Statin-induced myalgias" usually affect which muscles?', '["Hands", "Proximal, large muscle groups (Thighs, Back)", "Feet", "None"]', 1, 'Symmetric aching. (Harrison''s Ch. 400)'),
    (v_topic_id, '245: "Metabolic Syndrome" waist circumference cut-off for men is > ____ inches.', '["30", "35", "40", "45"]', 2, 'Measure of central obesity. (Step-Up)'),
    (v_topic_id, '246: "Metabolic Syndrome" waist circumference cut-off for women is > ____ inches.', '["30", "35", "40", "45"]', 1, 'High risk for DM and CVD. (Pocket Medicine)'),
    (v_topic_id, '247: "MODY" (Maturity-Onset Diabetes of the Young) is an autosomal dominant form of DM in:', '["Obese adults", "Non-obese children/young adults", "Elderly", "None"]', 1, 'Due to specific genetic mutations (e.g., Glucokinase). (Harrison''s Ch. 396)'),
    (v_topic_id, '248: "Autoimmune Polyglandular Syndrome Type 1" classically includes Addison''s, Hypoparathyroidism, and:', '["Diabetes", "Mucocutaneous Candidiasis", "Thyroiditis", "None"]', 1, 'Due to AIRE gene mutation. (Step-Up)'),
    (v_topic_id, '249: "Autoimmune Polyglandular Syndrome Type 2" includes Addison''s, Type 1 DM, and:', '["Fungal infection", "Autoimmune Thyroid Disease (Schmidt Syndrome)", "None", "None"]', 1, 'More common than Type 1 APS. (Pocket Medicine)');

    RAISE NOTICE 'SUCCESS: Endocrinology MCQ Part 3 (167-249) registered.';
END $$;

COMMIT;
