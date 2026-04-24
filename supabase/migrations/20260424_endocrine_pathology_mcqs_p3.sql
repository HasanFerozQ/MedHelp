-- Migration: Year 2 - Endocrine Pathology MCQ Bank (PART 3: 141-220)
-- Topics: Adrenal Cortex/Medulla depth, Steroidogenesis, Applied Endocrine Physiology, Thyroid Emergencies
-- Date: 2026-04-24

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    -- 1. Ensure Topic "Endocrine Pathology" exists
    INSERT INTO topics (title, slug, semester_id, year_id, "order")
    VALUES ('Endocrine Pathology', 'endocrine-pathology', 3, 2, 40)
    ON CONFLICT (slug) DO UPDATE SET year_id = 2, semester_id = 3
    RETURNING id INTO v_topic_id;

    -- 2. Insert MCQs (141-220)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    
    -- DEEP DIVE: STEROIDOGENESIS AND CAH
    (v_topic_id, 'In the adrenal steroidogenesis pathway, which enzyme is responsible for converting Cholesterol to Pregnenolone?', '["17-alpha-hydroxylase", "Desmolase (CYP11A1)", "21-hydroxylase", "Aldosterone synthase"]', 1, 'Desmolase (cholesterol side-chain cleavage enzyme) is the rate-limiting step in steroidogenesis, stimulated by ACTH.'),
    (v_topic_id, 'Which of the following would be elevated in 11-beta-hydroxylase deficiency but not in 21-hydroxylase deficiency?', '["17-hydroxyprogesterone", "11-deoxycorticosterone (DOC)", "Renin", "Testosterone"]', 1, '11-beta-OH deficiency blocks the conversion of 11-deoxycorticosterone (DOC) to corticosterone. DOC has mineralocorticoid activity, causing hypertension.'),
    (v_topic_id, 'In 17-alpha-hydroxylase deficiency, which hormone pathway is uniquely preserved and overactive?', '["Cortisol", "Androgens (DHEA, Androstenedione)", "Mineralocorticoids (Aldosterone)", "Estrogens"]', 2, '17-alpha-OH is required for cortisol and sex steroid synthesis. Without it, all precursors shunt towards mineralocorticoid production, causing hypertension and hypokalemia.'),
    (v_topic_id, 'A phenotypically normal male presents with precocious puberty and severe acne at age 4. Blood pressure is normal. Which enzyme deficiency is most likely?', '["11-beta-hydroxylase", "21-hydroxylase (non-classic/late-onset)", "17-alpha-hydroxylase", "5-alpha-reductase"]', 1, 'Non-classic 21-OH deficiency can present later with premature adrenarche/puberty due to androgen excess, often without severe salt-wasting.'),
    (v_topic_id, 'Which zone of the adrenal cortex is completely absent in a patient with a severe lack of Angiotensin II?', '["Zona Glomerulosa", "Zona Fasciculata", "Zona Reticularis", "Adrenal Medulla"]', 0, 'The Zona Glomerulosa produces aldosterone and is primarily regulated by Angiotensin II (and K+), not ACTH.'),

    -- ADRENAL PATHOLOGY DETAILS
    (v_topic_id, 'A patient with suspected Cushing Syndrome has an elevated 24-hour urine free cortisol. A high-dose dexamethasone test does NOT suppress cortisol levels. ACTH is undetectable. Diagnosis?', '["Pituitary Adenoma", "Ectopic ACTH", "Adrenal Adenoma", "Hypothalamic tumor"]', 2, 'Undetectable ACTH means the source of cortisol is independent of ACTH (i.e., an adrenal tumor or exogenous steroids). Ectopic ACTH would show very high, unsuppressed ACTH.'),
    (v_topic_id, 'Which is a highly specific skin finding for primary adrenal insufficiency that distinguishes it from secondary adrenal insufficiency?', '["Striae", "Acanthosis nigricans", "Hyperpigmentation of palmar creases and oral mucosa", "Vitiligo"]', 2, 'Primary AI features high ACTH/MSH, causing hyperpigmentation, especially in friction areas and mucosa. Secondary AI lacks this because ACTH is low.'),
    (v_topic_id, 'A rapid ACTH stimulation test (Cosyntropin test) is performed on a patient. Cortisol fails to rise above 20 mcg/dL. This confirms?', '["Cushing syndrome", "Adrenal insufficiency", "Pheochromocytoma", "Hyperaldosteronism"]', 1, 'Failure of cortisol to rise after exogenous ACTH confirms adrenal insufficiency (primary or chronic secondary where the gland has atrophied).'),
    (v_topic_id, 'In Waterhouse-Friderichsen syndrome, the adrenal glands typically show?', '["Caseating granulomas", "Massive bilateral hemorrhage", "Cortical hyperplasia", "Metastatic infiltration"]', 1, 'Meningococcemia-induced DIC leads to bilateral adrenal hemorrhagic necrosis, causing acute, fatal adrenal insufficiency.'),
    (v_topic_id, 'Adrenal myelolipoma is a benign tumor composed of?', '["Chromaffin cells", "Mature adipose tissue and hematopoietic elements", "Spindle cells", "Cortical cells"]', 1, 'Myelolipomas are rare, benign, hormonally inactive masses containing fat and bone marrow elements, often found incidentally.'),

    -- ENDOCRINE PHYSIOLOGY & RECEPTORS
    (v_topic_id, 'Which of the following hormones utilizes an intracellular/nuclear receptor rather than a cell membrane receptor?', '["Insulin", "Glucagon", "Thyroid Hormone (T3)", "Epinephrine"]', 2, 'Steroid hormones and Thyroid hormone (T3) are lipophilic and bind to intracellular/nuclear receptors to alter gene transcription.'),
    (v_topic_id, 'Insulin receptor signaling is mediated by which of the following pathways?', '["cAMP / PKA", "IP3 / DAG", "Intrinsic Tyrosine Kinase", "JAK / STAT"]', 2, 'The insulin receptor (and IGF-1 receptor) is a receptor tyrosine kinase that auto-phosphorylates upon binding.'),
    (v_topic_id, 'Growth Hormone utilizes which signaling pathway?', '["Intrinsic Tyrosine Kinase", "Receptor-associated Tyrosine Kinase (JAK/STAT)", "cAMP", "cGMP"]', 1, 'GH, Prolactin, and Cytokines use the Non-receptor (associated) Tyrosine Kinase pathway (JAK/STAT).'),
    (v_topic_id, 'Glucagon, TSH, and PTH primarily exert their effects through which second messenger?', '["cGMP", "Calcium", "cAMP", "Tyrosine Kinase"]', 2, 'Most peptide/protein hormones (except insulin, GH, prolactin, oxytocin, ADH-V1) use the Gs-protein/cAMP/Protein Kinase A pathway.'),
    (v_topic_id, 'Which hormone utilizes the cGMP pathway?', '["Vasopressin (V2)", "Atrial Natriuretic Peptide (ANP)", "Insulin", "Cortisol"]', 1, 'ANP, BNP, and Nitric Oxide use cGMP to cause smooth muscle relaxation/vasodilation.'),

    -- THYROID EMERGENCIES AND PHARMACOLOGY
    (v_topic_id, 'A patient with untreated hyperthyroidism develops severe fever, tachycardia, delirium, and shock following a surgical procedure. Diagnosis?', '["Myxedema Coma", "Thyroid Storm", "Malignant Hyperthermia", "Pheochromocytoma crisis"]', 1, 'Thyroid storm is a severe, life-threatening exacerbation of hyperthyroidism, often triggered by stress (surgery, infection, trauma).'),
    (v_topic_id, 'What is the immediate medical management of Thyroid Storm (4 Ps)?', '["PTU, Propranolol, Prednisolone, Potassium Iodide", "Penicillin, Phenytoin, Prednisone, Potassium", "Propranolol, PTU, Paracetamol, Potassium", "Propofol, PTU, Prednisone, Potassium Iodide"]', 0, 'Treatment includes Propranolol (beta-blocker), PTU (blocks synthesis and conversion), Prednisolone/corticosteroids (blocks conversion), and Potassium Iodide (Lugol iodine - blocks release).'),
    (v_topic_id, 'An elderly female with a history of Hashimoto thyroiditis presents with profound hypothermia, bradycardia, and altered mental status in the winter. Diagnosis?', '["Thyroid Storm", "Myxedema Coma", "Adrenal Crisis", "Hypoglycemia"]', 1, 'Myxedema coma is the end-stage of untreated hypothyroidism, featuring severely depressed metabolic rate, hypothermia, and central nervous system depression.'),
    (v_topic_id, 'What is the primary treatment for Myxedema Coma?', '["IV Glucocorticoids and IV Levothyroxine", "Oral Propylthiouracil", "IV Dextrose", "Warming blankets alone"]', 0, 'Treatment requires IV thyroid hormone replacement. Corticosteroids are also given empirically because concomitant adrenal insufficiency must be assumed until ruled out.'),
    (v_topic_id, 'A patient on Amiodarone develops hyperthyroidism. Which type of hyperthyroidism is caused by Amiodarone-induced destructive thyroiditis (Type 2)?', '["High RAIU, TSI positive", "Low RAIU, painful thyroid", "Low RAIU, painless thyroid, elevated IL-6", "High RAIU, multiple hot nodules"]', 2, 'Amiodarone Type 2 toxicity is a destructive thyroiditis leading to pre-formed hormone release. RAIU is low, and the thyroid is painless. It responds to steroids, not thioamides.'),

    -- PARATHYROID DEEP DIVE
    (v_topic_id, 'Which molecule is directly responsible for increasing intestinal absorption of Calcium and Phosphate?', '["PTH", "Calcitonin", "1,25-dihydroxycholecalciferol (Calcitriol)", "25-hydroxycholecalciferol"]', 2, 'Active Vitamin D (Calcitriol) is the primary stimulator of gut absorption of BOTH calcium and phosphate.'),
    (v_topic_id, 'PTH acts on osteoblasts to increase the expression of which molecule, thereby activating osteoclasts?', '["Osteoprotegerin (OPG)", "RANK Ligand (RANKL)", "M-CSF", "Alkaline Phosphatase"]', 1, 'PTH binds to osteoBLASTS, causing them to express RANKL, which then binds to RANK on osteoCLAST precursors, activating them.'),
    (v_topic_id, 'Which molecule acts as a "decoy receptor" for RANKL, preventing osteoclast activation?', '["Osteoprotegerin (OPG)", "Calcitonin", "Vitamin D", "Estrogen"]', 0, 'OPG is produced by osteoblasts (stimulated by estrogen) and binds RANKL, preventing it from activating osteoclasts. High estrogen = High OPG = Bone protection.'),
    (v_topic_id, 'A patient with small cell lung cancer develops hyponatremia. The serum osmolality is low, and urine osmolality is high. Urine sodium is > 40 mEq/L. Which treatment is indicated for asymptomatic cases?', '["Hypertonic saline", "Fluid restriction", "Demeclocycline", "Desmopressin"]', 1, 'For asymptomatic SIADH, fluid restriction is the first-line treatment. Demeclocycline (an ADH antagonist) is used if restriction fails.'),

    -- SPECIFIC TUMORS & PATHOLOGY
    (v_topic_id, 'Which thyroid carcinoma is characterized histologically by sheets of cells in an amyloid stroma?', '["Papillary", "Follicular", "Medullary", "Anaplastic"]', 2, 'Medullary thyroid carcinoma. The amyloid is derived from altered Calcitonin.'),
    (v_topic_id, 'A fine-needle aspiration (FNA) of a thyroid nodule shows normal-appearing follicular cells. Why can this NOT rule out malignancy?', '["FNA misses 50% of tumors", "Follicular carcinoma requires visualization of capsular or vascular invasion to diagnose", "The cells are often masked by lymphocytes", "FNA cannot detect papillary carcinoma"]', 1, 'FNA cannot distinguish between a benign Follicular Adenoma and malignant Follicular Carcinoma because the diagnosis relies entirely on architectural invasion of the capsule/blood vessels.'),
    (v_topic_id, 'Which feature is strongly suggestive of a benign rather than malignant thyroid nodule?', '["Cold nodule on RAIU", "Hot nodule on RAIU", "Solid appearance on ultrasound", "Microcalcifications on ultrasound"]', 1, '"Hot" (hyperfunctioning) nodules are almost never malignant. "Cold" (non-functioning) nodules carry a ~10-15% risk of malignancy.'),
    (v_topic_id, 'Nelson Syndrome occurs after which surgical procedure?', '["Total thyroidectomy", "Bilateral adrenalectomy for Cushing disease", "Parathyroidectomy", "Transsphenoidal pituitary resection"]', 1, 'Bilateral adrenalectomy removes negative feedback on the pituitary, leading to massive enlargement of a pre-existing corticotroph adenoma (hyperpigmentation + mass effect).');

    RAISE NOTICE 'SUCCESS: Endocrine Pathology MCQs Part 3 (141-220) registered.';
END $$;

COMMIT;
