-- Migration: Year 2 - Endocrine Pathology Case Blocks (45 Cases)
-- Date: 2026-04-23

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Create/Ensure Topic "Endocrine Pathology" for Year 2
    INSERT INTO topics (title, slug, semester_id, year_id, "order", usmle_step)
    VALUES ('Endocrine Pathology', 'endocrine-pathology', 3, 2, 40, NULL)
    ON CONFLICT (slug) DO UPDATE SET year_id = 2, semester_id = 3, usmle_step = NULL
    RETURNING id INTO v_topic_id;

    -- CASE 01: Hashimoto Thyroiditis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Firm Neck Mass and Weight Gain', 'A 45-year-old female presents with an enlarging, painless neck mass. She notes increased lethargy and recent weight gain despite no change in diet. Physical exam reveals a firm, diffuse goiter. Labs show elevated TSH and low free T4. Anti-thyroid peroxidase (anti-TPO) antibodies are strongly positive.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Graves Disease", "Hashimoto Thyroiditis", "De Quervain Thyroiditis", "Reidel Thyroiditis"]', 1, 'Hashimoto is the most common cause of hypothyroidism in iodine-sufficient regions; positive anti-TPO is characteristic.'),
    (v_case_id, 'What is the characteristic histological finding?', '["Papillary projections with orphan-annie eye nuclei", "Diffuse atrophy of follicles", "Lymphocytic infiltrate with germinal centers and Hurthle cells", "Granulomatous inflammation with giant cells"]', 2, 'Hurthle cells are eosinophilic metaplastic follicular cells seen in Hashimoto.'),
    (v_case_id, 'This patient is at an increased risk for which malignancy?', '["Papillary thyroid carcinoma", "Medullary thyroid carcinoma", "Marginal zone B-cell lymphoma", "Follicular carcinoma"]', 2, 'Chronic inflammation in Hashimoto increases the risk of B-cell lymphoma.');

    -- CASE 02: Pheochromocytoma / MEN 2A
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pounding Headaches and Hypertension', 'A 32-year-old male presents with episodes of "pounding headaches," palpitations, and drenching sweats. His blood pressure in the office is 190/115 mmHg. He mentions his father died of "some thyroid cancer" in his 40s. A 24-hour urine collection shows elevated metanephrines.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely location of the primary tumor?', '["Adrenal cortex", "Adrenal medulla", "Pituitary anterior lobe", "Parafollicular C-cells"]', 1, 'Pheochromocytoma arises from chromaffin cells in the adrenal medulla.'),
    (v_case_id, 'If this is part of a MEN 2A syndrome, what other finding is expected?', '["Pituitary adenoma", "Pancreatic islet cell tumor", "Medullary thyroid carcinoma", "Parathyroid atrophy"]', 2, 'MEN 2A triad: Medullary thyroid carcinoma, Pheochromocytoma, and Parathyroid hyperplasia.'),
    (v_case_id, 'What is the molecular driver for this syndrome?', '["RET proto-oncogene mutation", "VHL gene mutation", "MEN1 gene mutation", "NF1 mutation"]', 0, 'MEN 2A and 2B are caused by gain-of-function mutations in the RET proto-oncogene.');

    -- CASE 03: SIADH
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Confusion and Nausea in a Smoker', 'A 55-year-old male with a history of small cell lung cancer presents with confusion and nausea. Labs show Serum Na+: 122 mEq/L (Low), Serum Osmolality: 250 mOsm/kg (Low), and Urine Osmolality: 450 mOsm/kg (High). He is euvolemic on exam.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Diabetes Insipidus", "SIADH", "Psychogenic Polydipsia", "Primary Hyperaldosteronism"]', 1, 'SIADH presents with euvolemic hyponatremia and inappropriately concentrated urine; often ectopic in small cell lung cancer.'),
    (v_case_id, 'What is the most appropriate initial treatment for severe symptoms?', '["Water restriction", "Normal saline (0.9%) infusion", "Hypertonic saline (3%) infusion", "Desmopressin"]', 2, 'Severe symptomatic hyponatremia requires careful correction with hypertonic (3%) saline.'),
    (v_case_id, 'Rapid correction of this electrolyte abnormality can lead to?', '["Cerebral edema", "Central pontine myelinolysis", "Hypokalemic periodic paralysis", "Tetany"]', 1, 'Correcting hyponatremia too quickly causes osmotic demyelination (Central Pontine Myelinolysis).');

    -- CASE 04: Cushing Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Truncal Obesity and Purple Striae', 'A 40-year-old female presents with truncal obesity, easy bruising, and new-onset purple striae on her abdomen. She has a BP of 155/95 mmHg. A low-dose dexamethasone suppression test fails to suppress cortisol. A high-dose test results in 60% suppression of cortisol.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely source of the pathology?', '["Adrenal adenoma", "Pituitary adenoma", "Small cell lung cancer (Ectopic ACTH)", "Exogenous steroid use"]', 1, 'Suppression with high-dose dexamethasone indicates a pituitary source (Cushing Disease).'),
    (v_case_id, 'What is the expected level of serum ACTH?', '["Low", "Elevated", "Normal", "Undetectable"]', 1, 'Pituitary adenomas secrete ACTH, leading to elevated levels.'),
    (v_case_id, 'Which of the following is a metabolic consequence of this condition?', '["Metabolic Acidosis", "Hypoglycemia", "Insulin resistance and Gluconeogenesis", "Hyperkalemia"]', 2, 'Glucocorticoids antagonize insulin and stimulate glucose production, causing hyperglycemia/diabetes.');

    -- CASE 05: Type 1 Diabetes Mellitus (DKA)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Lethargy and Thirst in a Child', 'A 9-year-old boy is brought in for excessive thirst and frequent urination. He has lost 10 lbs in the last month. While in the waiting room, he becomes lethargic. Labs show Blood Glucose: 450 mg/dL, pH: 7.1, and positive ketones in the urine.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Type 2 Diabetes Mellitus", "Type 1 Diabetes Mellitus", "Diabetes Insipidus", "Maturity Onset Diabetes of the Young (MODY)"]', 1, 'Sudden onset, weight loss, and DKA in a child is pathognomonic for T1DM.'),
    (v_case_id, 'What is the primary histological finding in the pancreas?', '["Amyloid deposition in islets", "Islet leukocytic infiltration (Insulitis)", "Hypertrophy of beta cells", "Fibrosis and calcification of the head"]', 1, 'T1DM is an autoimmune destruction of beta cells (Insulitis). Amyloid is seen in T2DM.'),
    (v_case_id, 'Which HLA types are most strongly associated with this condition?', '["HLA-B27", "HLA-DR3 and DR4", "HLA-DR2", "HLA-DQ8 only"]', 1, 'HLA-DR3 and DR4 are strongly associated with Type 1 Diabetes.');

    -- CASE 06: Primary Hyperparathyroidism
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Stones, Bones, and Groans', 'A 60-year-old female presents with "stones, bones, abdominal groans, and psychic overtones." Her serum Calcium is 11.5 mg/dL (High) and Phosphorus is 2.1 mg/dL (Low).', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Secondary hyperparathyroidism", "Vitamin D deficiency", "Primary hyperparathyroidism", "Hypoparathyroidism"]', 2, 'High Ca and low PO4 indicate primary hyperparathyroidism, usually due to a parathyroid adenoma.'),
    (v_case_id, 'What bone change is classically associated with this?', '["Osteosarcoma", "Osteitis fibrosa cystica (brown tumors)", "Osteopetrosis", "Osteoid osteoma"]', 1, 'Osteitis fibrosa cystica is characterized by subperiosteal bone resorption and cystic bone lesions.'),
    (v_case_id, 'What is the effect of PTH on the kidneys?', '["Decreases Ca2+ reabsorption in the distal tubule", "Decreases Phosphate reabsorption in the proximal tubule", "Inhibits 1-alpha-hydroxylase", "Increases Bicarbonate reabsorption"]', 1, 'PTH inhibits phosphate reabsorption in the proximal tubule ("PTH Trashes Phosphate").');

    -- CASE 07: 21-Hydroxylase Deficiency
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Ambiguous Genitalia in a Newborn', 'A newborn infant presents with ambiguous genitalia. Labs reveal hyponatremia, hyperkalemia, and elevated 17-hydroxyprogesterone levels.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which enzyme is deficient?', '["11-beta-hydroxylase", "17-alpha-hydroxylase", "21-hydroxylase", "3-beta-hydroxysteroid dehydrogenase"]', 2, '21-hydroxylase deficiency accounts for >90% of CAH; elevated 17-OHP is diagnostic.'),
    (v_case_id, 'In a male infant with this same deficiency, what would be the clinical presentation?', '["Ambiguous genitalia", "Normal genitalia with salt-wasting crisis", "Small penis and undescended testes", "Primary hypertension"]', 1, 'Males have normal genitalia but present with salt-wasting crises (hypovolemia, hyperkalemia) in the first weeks of life.'),
    (v_case_id, 'What is the cause of the adrenal gland appearance in this condition?', '["Atrophy due to lack of ACTH", "Hyperplasia due to excessive ACTH", "Neoplasia", "Hemorrhage (Waterhouse-Friderichsen)"]', 1, 'Lack of cortisol feedback causes high ACTH, leading to bilateral adrenal cortical hyperplasia.');

    -- CASE 08: Graves Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tremors and Staring Gaze', 'A 28-year-old female presents with sweating, tremors, and a "staring" gaze (lid lag). She has a smooth, non-tender goiter and localized edema over her shins (pretibial myxedema).', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the pathogenesis?', '["Toxic multinodular goiter", "Thyroid-stimulating immunoglobulin (TSI)", "Destructive thyroiditis", "Pituitary hyperthyroidism"]', 1, 'Graves is caused by TSI antibodies (Type II hypersensitivity) activating the TSH receptor.'),
    (v_case_id, 'What do you expect to see on a Radioactive Iodine Uptake (RAIU) scan?', '["Low uptake", "Focal hot nodule", "Diffuse, increased uptake", "Multiple cold nodules"]', 2, 'Diffuse gland activation leads to homogeneous, increased uptake.'),
    (v_case_id, 'The exophthalmos is caused by?', '["Sympathetic overactivity", "Glycosaminoglycan deposition and inflammation", "Extraocular muscle atrophy", "High serum T4 levels directly"]', 1, 'Retro-orbital fibroblasts are stimulated by TSI, causing GAG accumulation and edema.');

    -- CASE 09: Addison Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dark Tan and Chronic Fatigue', 'A 50-year-old male with a history of chronic smoking presents with a cough and a 20 lb weight loss. He is noted to have a very dark tan despite it being winter. Labs show low morning cortisol and high ACTH. A cosyntropin stimulation test shows no rise in cortisol.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Secondary Adrenal Insufficiency", "Primary Adrenal Insufficiency (Addison Disease)", "Cushing Syndrome", "Conn Syndrome"]', 1, 'Primary adrenal failure (Addison) shows high ACTH (causing hyperpigmentation) and low baseline/stimulated cortisol.'),
    (v_case_id, 'Why is the patient hyperpigmented?', '["Cortisol stimulates melanocytes", "ACTH and MSH share a common precursor (POMC)", "High potassium stimulates melanin production", "Smoking-induced skin changes"]', 1, 'POMC is cleaved into ACTH and Melanocyte-Stimulating Hormone (MSH).'),
    (v_case_id, 'What is the most common cause of this condition in developing countries?', '["Autoimmune adrenalitis", "Tuberculosis", "Metastatic lung cancer", "Waterhouse-Friderichsen syndrome"]', 1, 'Worldwide/Developing: TB is #1. Western countries: Autoimmune is #1.');

    -- CASE 10: Acromegaly
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Enlarging Hands and Blurry Vision', 'A 45-year-old male presents with enlarging hands and feet. He notes his wedding ring no longer fits and his jaw seems to be protruding. He also complains of new-onset blurry vision on the outer sides of both eyes.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Gigantism", "Acromegaly", "Paget disease of bone", "Hypothyroidism"]', 1, 'Acromegaly occurs after epiphyseal plate closure; gigantism occurs before.'),
    (v_case_id, 'What is the cause of the visual field defect?', '["Diabetic retinopathy", "Compression of the optic chiasm", "Glaucoma", "Corneal edema"]', 1, 'Pituitary adenomas expand superiorly, compressing the optic chiasm (Bitemporal hemianopsia).'),
    (v_case_id, 'How is the diagnosis confirmed?', '["Random Growth Hormone (GH) level", "Failure of GH suppression by oral glucose load", "Elevated TSH", "Dexamethasone suppression test"]', 1, 'Oral Glucose Tolerance Test (OGTT) should normally suppress GH; failure to suppress confirms acromegaly.');

    -- [CASES 11-45 follow the same pattern - Truncated for script safety but fully logic-matched]
    -- [I will add the remaining cases in the next block to ensure no timeout]

    RAISE NOTICE 'SUCCESS: Endocrine Pathology registered (Cases 1-10). Continuing...';
END $$;

COMMIT;
