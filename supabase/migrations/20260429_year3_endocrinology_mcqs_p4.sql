-- Migration: Year 3 - Endocrinology MCQ Bank (PART 4: 250-333)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-29

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'endocrinology' LIMIT 1;

    -- SECTION 25: LIPIDS & METABOLIC DEEP DIVE
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '250: "Bile acid sequestrants" (e.g., Cholestyramine) can interfere with the absorption of:', '["Water", "Fat-soluble vitamins (A, D, E, K)", "Sugar", "Proteins"]', 1, 'Should be taken at least 4 hours apart from other meds. (Step-Up)'),
    (v_topic_id, '251: Which lipid medication is most effective at RAISING HDL?', '["Statins", "Niacin", "Fibrates", "Ezetimibe"]', 1, 'Though its benefit in reducing cardiac events is controversial. (Pocket Medicine)'),
    (v_topic_id, '252: "Omega-3 Fatty Acids" (Fish oil) are primarily used to treat:', '["High LDL", "High Triglycerides", "Low HDL", "High sugar"]', 1, 'Especially high doses (Vascepa). (Harrison''s Ch. 400)'),
    (v_topic_id, '253: "Eruptive xanthomas" (small yellow bumps on the skin) are associated with very high levels of:', '["LDL", "Triglycerides", "HDL", "Calcium"]', 1, 'Reflects chylomicronemia. (Step-Up)'),
    (v_topic_id, '254: "Tendinous xanthomas" (especially on the Achilles) are characteristic of:', '["Hypertriglyceridemia", "Familial Hypercholesterolemia (Type IIa)", "Diabetes", "None"]', 1, 'Due to severe, life-long LDL elevation. (Pocket Medicine)'),
    (v_topic_id, '255: The "Friedewald Equation" is used to calculate ____ but is inaccurate if triglycerides are > 400.', '["HDL", "LDL (Total Chol - HDL - TG/5)", "VLDL", "None"]', 1, 'Most labs now use direct LDL measurement. (Harrison''s Ch. 400)'),
    (v_topic_id, '256: "Metabolic Syndrome" increases the risk of developing which type of cancer?', '["Lung", "Colon, Breast, and Endometrial", "Brain", "None"]', 1, 'Associated with hyperinsulinemia and chronic inflammation. (Step-Up)'),
    (v_topic_id, '257: Which lipid-lowering drug class can cause "gallstones"?', '["Statins", "Fibrates", "Niacin", "Bile acid sequestrants"]', 1, 'They increase biliary cholesterol excretion. (Pocket Medicine)'),
    (v_topic_id, '258: "Lipoprotein(a)" is a genetically determined lipid particle that is a strong independent risk factor for:', '["Diabetes", "Early Coronary Artery Disease and Aortic Stenosis", "Liver failure", "None"]', 1, 'Not lowered by standard statin therapy. (Harrison''s Ch. 400)'),
    (v_topic_id, '259: "ApoB" is the primary structural protein found on:', '["HDL", "All non-HDL particles (LDL, VLDL, IDL)", "Chylomicrons only", "None"]', 1, 'Better marker of atherogenic particle count than LDL-C. (Step-Up)');

    -- SECTION 26: DIABETES PHARMACOLOGY RECAP
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '260: "Acarbose" and "Miglitol" work by inhibiting ____ in the gut.', '["Fat absorption", "Alpha-glucosidase (carbohydrate breakdown)", "Proteins", "None"]', 1, 'Reduces post-prandial glucose spikes; causes flatulence. (Pocket Medicine)'),
    (v_topic_id, '261: Which drug class is notorious for causing "genital mycotic infections" (yeast)?', '["DPP-4 inhibitors", "SGLT2 inhibitors", "GLP-1 agonists", "Metformin"]', 1, 'Because they dump sugar into the urine. (Harrison''s Ch. 396)'),
    (v_topic_id, '262: "Pioglitazone" use has been associated with a slightly increased risk of ____ cancer.', '["Lung", "Bladder", "Colon", "Prostate"]', 1, 'Requires caution in patients with a history of bladder cancer. (Step-Up)'),
    (v_topic_id, '263: "Liraglutide" and "Dulaglutide" are once-daily or once-weekly ____.', '["Pills", "Injectable GLP-1 Receptor Agonists", "Insulins", "None"]', 1, 'Strong evidence for cardio-renal protection. (Pocket Medicine)'),
    (v_topic_id, '264: Which medication is preferred for a Type 2 DM patient with established heart failure?', '["Sulfonylureas", "SGLT2 inhibitors", "TZDs (Pioglitazone)", "DPP-4 inhibitors"]', 1, 'They reduce heart failure hospitalizations. (Harrison''s Ch. 396)'),
    (v_topic_id, '265: "Meglitinides" (e.g., Repaglinide) have a mechanism similar to sulfonylureas but are:', '["Longer acting", "Shorter acting and taken with meals", "Less potent", "None"]', 1, 'Useful for post-prandial control. (Step-Up)'),
    (v_topic_id, '266: What is the most common reason for discontinuing Metformin?', '["Hypoglycemia", "GI side effects (diarrhea, bloating, nausea)", "Rash", "Lactic acidosis"]', 1, 'Usually improves with slow titration and extended-release versions. (Pocket Medicine)'),
    (v_topic_id, '267: Patients on long-term Metformin should be screened for which vitamin deficiency?', '["Vitamin D", "Vitamin B12", "Folate", "Vitamin C"]', 1, 'Metformin can interfere with B12 absorption in the ileum. (Harrison''s Ch. 396)'),
    (v_topic_id, '268: "Pramlintide" is an amylin analog used to:', '["Treat Type 2 DM only", "Treat both Type 1 and Type 2 DM as an adjunct to insulin", "Treat Hypoglycemia", "None"]', 1, 'Suppresses glucagon and slows gastric emptying. (Step-Up)'),
    (v_topic_id, '269: A1c of 9.0% equates to an average blood glucose of approximately:', '["150 mg/dL", "210 mg/dL", "300 mg/dL", "100 mg/dL"]', 1, 'Rule of thumb: 6% = 126, and each 1% is ~28-30 mg/dL. (Pocket Medicine)');

    -- SECTION 27: ADRENAL & PITUITARY CLINICAL BITS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '270: "Adrenal crisis" treatment includes aggressive fluids and high-dose ____.', '["Dexamethasone", "Hydrocortisone", "Fludrocortisone", "None"]', 1, 'Hydrocortisone has both glucocorticoid and mineralocorticoid activity. (Harrison''s Ch. 379)'),
    (v_topic_id, '271: "Secondary" adrenal insufficiency (pituitary source) usually lacks which finding compared to "Primary" (Addison''s)?', '["Hypoglycemia", "Hyperpigmentation and Hyperkalemia", "Fatigue", "None"]', 1, 'Aldosterone is still produced (via RAAS), and ACTH is not high. (Step-Up)'),
    (v_topic_id, '272: What is the imaging modality of choice for the pituitary gland?', '["CT scan", "MRI of the Brain/Sella with and without Gadolinium", "Ultrasound", "X-ray"]', 1, 'Superior resolution for small adenomas. (Pocket Medicine)'),
    (v_topic_id, '273: "Pituitary Incidentalomas" < ____ mm (microadenomas) that are non-functioning often only require periodic monitoring.', '["5", "10", "20", "2"]', 1, 'Anything >= 10mm is a macroadenoma. (Harrison''s Ch. 373)'),
    (v_topic_id, '274: "Prolactin" levels > ____ ng/mL are highly suggestive of a true prolactinoma.', '["50", "100", "200", "25"]', 2, 'Lower levels can be due to stalk effect or drugs. (Step-Up)'),
    (v_topic_id, '275: "Somatostatin Analogs" (e.g., Octreotide) are used to treat acromegaly and:', '["Diabetes", "Carcinoid Syndrome and VIPoma", "Hashimoto", "None"]', 1, 'They inhibit many neuroendocrine secretions. (Pocket Medicine)'),
    (v_topic_id, '276: "Cabergoline" is preferred over Bromocriptine for prolactinoma because it is:', '["Cheaper", "More effective and has fewer side effects", "A pill", "None"]', 1, 'Dosed once or twice weekly. (Harrison''s Ch. 373)'),
    (v_topic_id, '277: "Primary Hyperaldosteronism" is a common cause of "Resistant Hypertension" and should be screened for if BP is not at goal with ____ meds.', '["2", "3", "5", "None"]', 1, 'Especially if one is a diuretic. (Step-Up)'),
    (v_topic_id, '278: "Fludrocortisone" is a potent ____ used in the treatment of primary adrenal insufficiency.', '["Glucocorticoid", "Mineralocorticoid", "Androgen", "None"]', 1, 'Replaces the missing aldosterone. (Pocket Medicine)'),
    (v_topic_id, '279: Which adrenal layer is responsible for making androgens (DHEA)?', '["Zona Glomerulosa", "Zona Fasciculata", "Zona Reticularis", "Medulla"]', 2, '"G-F-R" corresponds to "Salt-Sugar-Sex." (Harrison''s Ch. 379)');

    -- SECTION 28: THYROID & CALCIUM FINAL ROUND
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '280: "Amiodarone-induced Thyrotoxicosis Type 1" is seen in patients with underlying goiters and is treated with:', '["Steroids", "Antithyroid drugs (Methimazole)", "Surgery", "None"]', 1, 'Type 1 is iodine-induced overproduction. (Step-Up)'),
    (v_topic_id, '281: "Amiodarone-induced Thyrotoxicosis Type 2" is a destructive thyroiditis and is treated with:', '["Methimazole", "Glucocorticoids (Steroids)", "Antibiotics", "None"]', 1, 'Type 2 is inflammatory destruction. (Pocket Medicine)'),
    (v_topic_id, '282: Which drug can cause "Nephrogenic Diabetes Insipidus" and "Hypothyroidism"?', '["Aspirin", "Lithium", "Metformin", "Digoxin"]', 1, 'Classic board association. (Harrison''s Ch. 374)'),
    (v_topic_id, '283: "Subclinical Hypothyroidism" is defined as:', '["High TSH with Normal Free T4", "Low TSH with Low Free T4", "Normal TSH", "None"]', 0, 'Treatment is controversial unless TSH > 10 or symptomatic. (Step-Up)'),
    (v_topic_id, '284: "Subclinical Hyperthyroidism" is defined as:', '["Low TSH with Normal Free T4/T3", "High TSH", "Normal TSH", "None"]', 0, 'Increases risk of Atrial Fibrillation and Bone loss in elderly. (Pocket Medicine)'),
    (v_topic_id, '285: "Bisphosphonate" treatment for osteoporosis is generally continued for ____ years before a "drug holiday" is considered.', '["1", "3-5", "10", "Lifetime"]', 1, 'Balances benefit against the risk of rare side effects. (Harrison''s Ch. 411)'),
    (v_topic_id, '286: "Raloxifene" is a good choice for osteoporosis in women at high risk for ____.', '["Heart attack", "Breast cancer", "Blood clots", "None"]', 1, 'SERM with protective effects in the breast. (Step-Up)'),
    (v_topic_id, '287: What is the most common cause of "Hypomagnesemia"?', '["GI loss (diarrhea), Diuretics, and Alcoholism", "Hyperthyroidism", "Diabetes only", "None"]', 0, 'Common in clinical practice. (Pocket Medicine)'),
    (v_topic_id, '288: "Zoledronic acid" (Reclast) is a bisphosphonate given via which route?', '["Oral", "IV infusion once a year", "Subcutaneous", "None"]', 1, 'High adherence; bypasses GI issues. (Harrison''s Ch. 411)'),
    (v_topic_id, '289: "Calcitriol" is the active form of Vitamin D (1,25-OH). When is it used instead of Ergocalciferol (D2)?', '["Always", "In advanced Chronic Kidney Disease (CKD)", "In children only", "None"]', 1, 'When the kidney can no longer perform the 1-alpha hydroxylation. (Step-Up)');

    -- SECTION 29: REPRODUCTIVE & HORMONE POTPOURRI
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '290: "Testosterone" is converted to the more potent "Dihydrotestosterone (DHT)" by:', '["Aromatase", "5-alpha-reductase", "17-hydroxylase", "None"]', 1, 'Involved in hair loss and prostate growth. (Pocket Medicine)'),
    (v_topic_id, '291: "Aromatase" converts testosterone into:', '["Estradiol (Estrogen)", "DHT", "Cortisol", "None"]', 0, 'Occurs in adipose tissue; contributes to gynecomastia in obesity. (Harrison''s Ch. 392)'),
    (v_topic_id, '292: "Finasteride" and "Dutasteride" are 5-alpha-reductase inhibitors used to treat:', '["Low libido", "BPH and Male-pattern baldness", "Diabetes", "Cancer"]', 1, 'Reduces DHT levels. (Step-Up)'),
    (v_topic_id, '293: "Primary" hypogonadism (testicular failure) presents with ____ testosterone and ____ LH/FSH.', '["Low; Low", "Low; High", "High; Low", "High; High"]', 1, 'Hypergonadotropic hypogonadism. (Pocket Medicine)'),
    (v_topic_id, '294: "Secondary" hypogonadism (pituitary/hypothalamic) presents with ____ testosterone and ____ LH/FSH.', '["Low; High", "Low; Low or normal", "High; Low", "None"]', 1, 'Hypogonadotropic hypogonadism. (Harrison''s Ch. 392)'),
    (v_topic_id, '295: "Hyperprolactinemia" causes hypogonadism by inhibiting the pulsatile release of:', '["GnRH", "TSH", "Insulin", "None"]', 0, 'Leading to low FSH/LH. (Step-Up)'),
    (v_topic_id, '296: "Hormone replacement" for men (Testosterone) can cause which side effect?', '["Anemia", "Erythrocytosis (high RBC count)", "Weight loss", "None"]', 1, 'Requires monitoring of Hematocrit. (Pocket Medicine)'),
    (v_topic_id, '297: "Sildenafil" (Viagra) works by inhibiting ____ in the corpus cavernosum.', '["Aromatase", "Phosphodiesterase-5 (PDE5)", "Dopamine", "None"]', 1, 'Increases cGMP, leading to smooth muscle relaxation. (Harrison''s Ch. 392)'),
    (v_topic_id, '298: "PDE5 inhibitors" are absolutely contraindicated in patients taking:', '["Beta blockers", "Nitrates (e.g., Nitroglycerin)", "Statins", "Insulin"]', 1, 'Can cause life-threatening hypotension. (Step-Up)'),
    (v_topic_id, '299: "Polycystic Ovary Syndrome" (PCOS) is a diagnosis of exclusion. What must be ruled out?', '["Thyroid disease, Hyperprolactinemia, and late-onset CAH", "Pregnancy", "Both", "None"]', 2, 'Rule out other causes of irregular menses/hirsutism. (Pocket Medicine)');

    -- FINAL ENDO SPRINT (300-333)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '300: Which MEN syndrome is associated with "Marfanoid habitus" (tall, long limbs)?', '["MEN 1", "MEN 2A", "MEN 2B", "None"]', 2, 'Physical sign of MEN 2B. (Harrison''s Ch. 381)'),
    (v_topic_id, '301: "Vitamin D Deficiency" in children is called ____.', '["Osteoporosis", "Rickets", "Scurvy", "Pellagra"]', 1, 'Soft bones and bowing of legs. (Step-Up)'),
    (v_topic_id, '302: "Pheochromocytoma" paroxysms can be triggered by:', '["Deep palpation of the abdomen", "Urinating (in bladder wall Pheos)", "Surgery/Anesthesia", "All of the above"]', 3, 'Catecholamine dump triggers. (Pocket Medicine)'),
    (v_topic_id, '303: "Pre-diabetes" HbA1c is 5.7 to ____ %.', '["6.0", "6.4", "7.0", "None"]', 1, 'High risk for progression to T2DM. (Harrison''s Ch. 396)'),
    (v_topic_id, '304: "Graves opthalmopathy" is worsened by:', '["Alcohol", "Smoking", "Sugar", "Exercise"]', 1, 'Strongly recommended to quit smoking. (Step-Up)'),
    (v_topic_id, '305: "Pretibial myxedema" is a skin finding in:', '["Hypothyroidism", "Graves Disease", "Cushing", "Addison"]', 1, 'Non-pitting edema over the shins. (Pocket Medicine)'),
    (v_topic_id, '306: What is the most common cause of "Hypermagnesemia"?', '["Diuretics", "Renal failure + intake of Mg-containing antacids/laxatives", "Diet", "None"]', 1, 'Decreased excretion. (Harrison''s Ch. 50)'),
    (v_topic_id, '307: "Liddle syndrome" is treated with which diuretic?', '["Spironolactone", "Amiloride or Triamterene (direct ENaC blockers)", "Furosemide", "None"]', 1, 'Spironolactone doesn''t work because the issue is the channel, not aldosterone. (Step-Up)'),
    (v_topic_id, '308: "Chloride-responsive" metabolic alkalosis has a urine chloride of:', '["< 20 mEq/L", "> 40 mEq/L", "Normal", "None"]', 0, 'Responds to saline. (Pocket Medicine)'),
    (v_topic_id, '309: "Acanthosis nigricans" on the neck of a non-obese elderly patient should raise concern for:', '["Diabetes", "Internal Malignancy (e.g., Gastric Adenocarcinoma)", "Fungus", "None"]', 1, 'Malignant form of AN. (Harrison''s Ch. 396)'),
    (v_topic_id, '310: "Prolactin" levels > 500 ng/mL are almost always due to a:', '["Small stalk effect", "Pituitary Macroadenoma", "Pregnancy", "Hypothyroidism"]', 1, 'Very high levels = large tumor. (Step-Up)'),
    (v_topic_id, '311: "Thyroid hormone" increases the expression of ____ receptors on the heart.', '["Alpha-1", "Beta-1 Adrenergic", "Insulin", "None"]', 1, 'Leading to tachycardia and palpitations. (Pocket Medicine)'),
    (v_topic_id, '312: "Hypokalemic periodic paralysis" can be triggered by hyperthyroidism, especially in:', '["Elderly females", "Asian males", "Children", "None"]', 1, 'Triggered by high carb meals or exercise. (Harrison''s Ch. 376)'),
    (v_topic_id, '313: "Osteitis fibrosa cystica" shows a "salt and pepper" appearance on X-ray of the:', '["Long bones", "Skull", "Pelvis", "Hands"]', 1, 'Sign of severe bone resorption in hyperparathyroidism. (Step-Up)'),
    (v_topic_id, '314: "Water deprivation test" shows no change in urine osmo, dDAVP shows 50% increase = ?', '["Central DI", "Nephrogenic DI", "Psychogenic", "None"]', 0, 'Central DI responds to dDAVP. (Pocket Medicine)'),
    (v_topic_id, '315: "Water deprivation test" shows no change in urine osmo, dDAVP shows no change = ?', '["Central DI", "Nephrogenic DI", "Psychogenic", "None"]', 1, 'Nephrogenic DI is resistant. (Harrison''s Ch. 374)'),
    (v_topic_id, '316: "Hypercalcemia" + "Low PTH" + "High PTHrP" = ?', '["Primary HPT", "Malignancy-related hypercalcemia", "Sarcoid", "None"]', 1, 'Paraneoplastic syndrome. (Step-Up)'),
    (v_topic_id, '317: "Hypocalcemia" + "High Phosphate" + "High PTH" = ?', '["Vitamin D deficiency", "Pseudohypoparathyroidism", "Hypoparathyroidism", "None"]', 1, 'End-organ resistance to PTH. (Pocket Medicine)'),
    (v_topic_id, '318: "Hyperthyroidism" + "Tender gland" + "Low RAIU" = ?', '["Graves", "Subacute (De Quervain) Thyroiditis", "Toxic nodule", "None"]', 1, 'Viral thyroiditis. (Harrison''s Ch. 376)'),
    (v_topic_id, '319: "Secondary Adrenal Insufficiency" involves deficiency of:', '["Cortisol only", "Aldosterone only", "Both", "None"]', 0, 'Aldosterone is mostly independent of ACTH. (Step-Up)'),
    (v_topic_id, '320: "Primary Adrenal Insufficiency" involves deficiency of:', '["Cortisol only", "Aldosterone only", "Both Cortisol and Aldosterone", "None"]', 2, 'Whole gland is destroyed. (Pocket Medicine)'),
    (v_topic_id, '321: "High dose Dexamethasone" suppresses ACTH = ?', '["Adrenal tumor", "Cushing Disease (Pituitary)", "Ectopic ACTH", "None"]', 1, 'Pituitary retains some sensitivity. (Harrison''s Ch. 379)'),
    (v_topic_id, '322: "High dose Dexamethasone" DOES NOT suppress ACTH = ?', '["Cushing Disease", "Ectopic ACTH (e.g., Small cell lung CA)", "Adrenal tumor", "None"]', 1, 'Autonomous ectopic production. (Step-Up)'),
    (v_topic_id, '323: "Low dose Dexamethasone" suppresses Cortisol = ?', '["Cushing Syndrome", "Normal / No Cushing", "Adrenal tumor", "None"]', 1, 'Rules out Cushing if suppression is normal. (Pocket Medicine)'),
    (v_topic_id, '324: "Hypoglycemia" + "High Insulin" + "Low C-peptide" = ?', '["Insulinoma", "Factitious insulin use", "Sulfonylurea use", "None"]', 1, 'Exogenous insulin lacks C-peptide. (Harrison''s Ch. 396)'),
    (v_topic_id, '325: "Acanthosis nigricans" is primarily due to high levels of ____ acting on IGF receptors.', '["Glucose", "Insulin", "GH", "TSH"]', 1, 'Stimulates keratinocytes. (Step-Up)'),
    (v_topic_id, '326: "Glucagonoma" skin rash (NME) usually occurs in which areas?', '["Face", "Perineum, Groin, and Lower extremities", "Back", "Hands"]', 1, 'Necrolytic Migratory Erythema. (Pocket Medicine)'),
    (v_topic_id, '327: "VIPoma" classically causes a deficiency in which gastric component?', '["Pepsin", "Acid (Achlorhydria)", "Mucus", "Intrinsic factor"]', 1, 'VIP inhibits gastric acid secretion. (Harrison''s Ch. 380)'),
    (v_topic_id, '328: "MEN 1" is also called ____ syndrome.', '["Sipple", "Wermer", "Albright", "None"]', 1, 'Pituitary, Parathyroid, Pancreas. (Step-Up)'),
    (v_topic_id, '329: "MEN 2A" is also called ____ syndrome.', '["Wermer", "Sipple", "Conn", "None"]', 1, 'MTC, Pheo, Parathyroid. (Pocket Medicine)'),
    (v_topic_id, '330: "Hashimoto thyroiditis" histology shows:', '["Crescents", "Hurthle cells and Germinal centers (Lymphocytic infiltrate)", "Orphan Annie eyes", "None"]', 1, 'Chronic lymphocytic thyroiditis. (Harrison''s Ch. 376)'),
    (v_topic_id, '331: "Graves disease" histology shows:', '["Nodules", "Hyperplastic follicles with scalloped colloid", "Fibrosis", "None"]', 1, 'Diffuse hypertrophy and hyperplasia. (Step-Up)'),
    (v_topic_id, '332: "Medullary Thyroid CA" histology shows:', '["Papillae", "Amyloid stroma and nested C-cells", "Giant cells", "None"]', 1, 'Positive for Congo red stain. (Pocket Medicine)'),
    (v_topic_id, '333: What is the most common cause of "Hypoglycemia" in a non-diabetic patient with a high BMI?', '["Insulinoma", "Reactive hypoglycemia (Post-prandial)", "Liver failure", "None"]', 1, 'Usually follows a high-carb meal. (Harrison''s Ch. 396)');

    RAISE NOTICE 'SUCCESS: Endocrinology MCQ Part 4 (250-333) registered.';
END $$;

COMMIT;
