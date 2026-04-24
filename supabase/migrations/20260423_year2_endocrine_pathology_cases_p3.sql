-- Migration: Year 2 - Endocrine Pathology Cases (PART 3: 31-45)
-- Date: 2026-04-23

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'endocrine-pathology' LIMIT 1;

    -- CASE 31: Waterhouse-Friderichsen Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Neisseria Meningitidis and Shock', 'A 2-year-old child is brought to the ER with a high fever, petechial rash, and rapidly progressing shock. Blood cultures are positive for Neisseria meningitidis. Despite aggressive fluids, he develops acute adrenal insufficiency.', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Addison Disease", "Waterhouse-Friderichsen Syndrome", "Conn Syndrome", "Schmidt Syndrome"]', 1, 'Acute adrenal insufficiency due to bilateral adrenal hemorrhage associated with meningococcemia.'),
    (v_case_id, 'What is the characteristic finding on adrenal imaging?', '["Bilateral adrenal atrophy", "Bilateral adrenal hemorrhage", "Adrenal cortical adenoma", "Metastatic calcification"]', 1, 'Hemorrhagic destruction of the adrenals occurs due to DIC.'),
    (v_case_id, 'This condition causes a deficiency in which of the following?', '["Only Cortisol", "Only Aldosterone", "Cortisol, Aldosterone, and Sex Steroids", "Only Epinephrine"]', 2, 'Primary adrenal failure affects the entire cortex (all three layers).');

    -- CASE 32: HIV/CMV Adrenalitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Brain Fog and Salt Cravings in HIV', 'A 45-year-old male with a history of HIV presents with persistent "brain fog" and salt cravings. Labs show a morning cortisol of 2 ug/dL (Very low). CT scan shows calcified adrenal glands.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of his adrenal insufficiency in the context of HIV?', '["Autoimmune destruction", "Cytomegalovirus (CMV) or Tuberculosis", "Ketoconazole side effect", "Pituitary infarction"]', 1, 'CMV is a common opportunistic infection causing adrenalitis in AIDS patients; TB causes calcified glands.'),
    (v_case_id, 'What would the ACTH level be in this patient?', '["Low", "Elevated", "Normal", "Undetectable"]', 1, 'Primary failure leads to loss of feedback and high ACTH.'),
    (v_case_id, 'How would this patient’s blood pressure respond to an infusion of Renin?', '["Rapid increase", "No change (Resistance due to lack of Aldosterone)", "Sudden drop", "Increase only if paired with Cortisol"]', 1, 'Renin cannot increase blood pressure effectively without functional adrenal production of aldosterone.');

    -- CASE 33: CAH (11-beta vs 21)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Precocious Puberty and Normal BP', 'A 6-year-old girl presents with early pubic hair development and accelerated bone age. She is normotensive. Labs show elevated 17-hydroxyprogesterone and elevated androstenedione.', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["11-beta-hydroxylase deficiency", "17-alpha-hydroxylase deficiency", "21-hydroxylase deficiency (Simple Virilizing form)", "Polycystic Ovarian Syndrome"]', 2, '21-hydroxylase deficiency causes virilization without hypertension.'),
    (v_case_id, 'Which of the following is increased in 11-beta-hydroxylase deficiency but NOT in 21-hydroxylase deficiency?', '["Cortisol", "11-deoxycorticosterone (DOC)", "Testosterone", "Progesterone"]', 1, 'DOC is a mineralocorticoid that causes hypertension in 11-beta deficiency.'),
    (v_case_id, '11-beta-hydroxylase deficiency typically presents with?', '["Hypotension and hyperkalemia", "Hypertension and hypokalemia", "Ambiguous genitalia in males", "Decreased sex steroids"]', 1, 'DOC buildup acts like aldosterone, causing hypertension.');

    -- CASE 34: Hurthle Cell Metaplasia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Granular Eosinophilic Cells', 'A 40-year-old male presents with a thyroid nodule. Histology reveals large, polygonal cells with abundant granular eosinophilic cytoplasm.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of these cells?', '["Chief cells", "Hurthle cells", "Clear cells", "Parafollicular cells"]', 1, 'Hurthle cells are classic in Hashimoto and Follicular lesions.'),
    (v_case_id, 'These cells are essentially follicular cells that have undergone which change?', '["Malignant transformation", "Metaplasia with increased mitochondria", "Atrophy due to lack of TSH", "Viral infection"]', 1, 'The granular cytoplasm is packed with mitochondria.'),
    (v_case_id, 'Hurthle cells are most commonly associated with which benign condition?', '["Graves Disease", "Hashimoto Thyroiditis", "De Quervain Thyroiditis", "Multinodular Goiter"]', 1, 'Hashimoto thyroiditis frequently features Hurthle cell metaplasia.');

    -- CASE 35: VIPoma (Verner-Morrison)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'WDHA Syndrome', 'A 50-year-old male presents with watery diarrhea, hypokalemia, and achlorhydria (the "WDHA" syndrome). A CT scan reveals a mass in the tail of the pancreas.', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Insulinoma", "VIPoma", "Gastrinoma", "Glucagonoma"]', 1, 'Vasoactive Intestinal Peptide secretion causes profound watery diarrhea.'),
    (v_case_id, 'What is the physiological effect of VIP (Vasoactive Intestinal Peptide)?', '["Increases gastric acid secretion", "Stimulates intestinal water and electrolyte secretion", "Inhibits gallbladder contraction", "Stimulates gluconeogenesis"]', 1, 'VIP stimulates secretion and relaxes smooth muscle; it inhibits gastrin.'),
    (v_case_id, 'This syndrome is also known as?', '["Verner-Morrison Syndrome", "Zollinger-Ellison Syndrome", "Cushing Syndrome", "Conn Syndrome"]', 0, 'Also called "Pancreatic Cholera" due to the severity of the diarrhea.');

    -- CASE 36: Pseudohypoparathyroidism
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Short Stature and Shortened Metacarpals', 'A 10-year-old child presents with short stature, a round face, and shortened 4th and 5th metacarpals. Labs show high PTH and low Calcium.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Hypoparathyroidism", "Pseudohypoparathyroidism (Albright Hereditary Osteodystrophy)", "Vitamin D deficiency", "Secondary Hyperparathyroidism"]', 1, 'Resistance to PTH at the receptor level causes high PTH with hypocalcemia.'),
    (v_case_id, 'What is the underlying defect?', '["Vitamin D receptor mutation", "Defective Gs protein alpha-subunit (end-organ resistance to PTH)", "Autoimmune destruction of parathyroid glands", "Pituitary resistance to GHRH"]', 1, 'Specifically an imprinting defect in GNAS1.'),
    (v_case_id, 'If the same physical features are present but labs (Calcium/PTH) are normal, it is called?', '["Pseudopseudohypoparathyroidism", "Osteogenesis imperfecta", "DiGeorge Syndrome", "Noonan Syndrome"]', 0, 'Inherited from the father; physical features only, no biochemical resistance.');

    -- CASE 37: Thyroglossal Duct Cyst
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Midline Neck Mass and Tongue Protrusion', 'A 20-year-old male presents with a midline neck mass that moves upward when he sticks out his tongue.', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Branchial cleft cyst", "Thyroglossal duct cyst", "Lingual thyroid", "Dermoid cyst"]', 1, 'Midline and moves with tongue = Thyroglossal cyst. (Branchial is lateral).'),
    (v_case_id, 'This cyst is a remnant of the descent of the thyroid from which embryological site?', '["Foramen cecum", "Third pharyngeal pouch", "Fourth pharyngeal pouch", "Rathke''s pouch"]', 0, 'Thyroid descends from the tongue base (foramen cecum) to the neck.'),
    (v_case_id, 'If a mass is found at the base of the tongue instead of the neck, it is likely?', '["A thyroglossal cyst", "Lingual thyroid", "A salivary gland tumor", "A cystic hygroma"]', 1, 'Lingual thyroid occurs when the gland fails to descend.');

    -- CASE 38: Secondary/Tertiary Hyperparathyroidism (CKD)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bone Pain in CKD', 'A patient with chronic kidney disease (CKD) presents with bone pain. Labs show Low Calcium, High Phosphorus, and High PTH.', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Primary Hyperparathyroidism", "Secondary Hyperparathyroidism", "Tertiary Hyperparathyroidism", "Pseudohypoparathyroidism"]', 1, 'Secondary failure in CKD is due to high PO4 and low Vitamin D activation.'),
    (v_case_id, 'Why is Calcium low in this CKD patient?', '["Excess urinary loss of calcium", "Decreased 1-alpha-hydroxylase activity and phosphate retention", "PTH resistance", "Malabsorption"]', 1, 'Kidneys cannot activate Vitamin D, and phosphate binds calcium.'),
    (v_case_id, 'If PTH remains high even after a kidney transplant and Calcium becomes high, it is called?', '["Primary Hyperparathyroidism", "Secondary Hyperparathyroidism", "Tertiary Hyperparathyroidism", "Pseudopseudohypoparathyroidism"]', 2, 'Tertiary involves autonomous parathyroid secretion after long-standing secondary stimulation.');

    -- CASE 39: Osteitis Fibrosa Cystica
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Brown Tumors and subperiosteal Resorption', 'A 30-year-old female presents with severe bone pain. Histology shows "brown tumors" and "railroad track" subperiosteal bone resorption.', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'These findings are most indicative of?', '["Osteoporosis", "Osteitis fibrosa cystica", "Osteomalacia", "Paget disease"]', 1, 'The classic bone pathology of severe hyperparathyroidism.'),
    (v_case_id, 'This condition is a classic manifestation of?', '["Hyperthyroidism", "Hyperparathyroidism", "Hypothyroidism", "Hypercortisolism"]', 1, 'Excess PTH causes high osteoclast activity.'),
    (v_case_id, 'The "brown" color of the tumors is due to?', '["Melanin", "Hemosiderin from hemorrhage", "Lipofuscin", "Bilirubin"]', 1, 'Hemorrhage and replacement with fibrous tissue creates the brown color.');

    -- CASE 40: Cretinism (Congenital Hypothyroidism)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Macroglossia and Umbilical Hernia in a Neonate', 'A neonate presents with a prominent tongue (macroglossia), umbilical hernia, and severe developmental delay (if untreated).', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Congenital Adrenal Hyperplasia", "Congenital Hypothyroidism (Cretinism)", "Down Syndrome", "DiGeorge Syndrome"]', 1, 'Pot-bellied, pale, puffy-faced infant with protruding tongue and umbilical hernia.'),
    (v_case_id, 'What is the most common cause of this worldwide?', '["Thyroid dysgenesis", "Iodine deficiency", "Maternal antithyroid antibodies", "TSH receptor mutation"]', 1, 'Iodine deficiency is the #1 cause worldwide; dysgenesis is #1 in developed countries.'),
    (v_case_id, 'Why is this condition screened for at birth?', '["To prevent sudden infant death", "To prevent irreversible intellectual disability", "To prevent heart failure", "To prevent childhood obesity"]', 1, 'Thyroid hormone is essential for early brain development.');

    -- CASE 41: Craniopharyngioma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Suprasellar Mass with Motor Oil Fluid', 'A 35-year-old male presents with visual field defects and a headache. An MRI shows a calcified cystic mass above the sella turcica. The cyst contains "motor oil" like fluid.', 41)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Pituitary Adenoma", "Craniopharyngioma", "Rathke Cleft Cyst", "Meningioma"]', 1, 'Calcification and motor-oil fluid are key features of Craniopharyngioma.'),
    (v_case_id, 'From what embryological structure does this tumor derive?', '["Neural ectoderm", "Rathke''s pouch (Surface ectoderm)", "Mesoderm", "Endoderm"]', 1, 'Derived from Rathke''s pouch remnants.'),
    (v_case_id, 'This tumor is the most common cause of suprasellar mass in?', '["Elderly patients", "Children and adolescents", "Pregnant women", "Post-menopausal women"]', 1, 'It is a common pediatric suprasellar tumor.');

    -- CASE 42: Papillary Thyroid Carcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Orphan Annie Eyes and Psammoma Bodies', 'A 50-year-old male presents with a history of "cold" thyroid nodules. Biopsy of one shows Orphan Annie eye nuclei and Psammoma bodies.', 42)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Follicular Carcinoma", "Medullary Carcinoma", "Papillary Carcinoma", "Anaplastic Carcinoma"]', 2, 'Orphan Annie eyes (empty-looking nuclei) are diagnostic for Papillary.'),
    (v_case_id, 'What is a "Psammoma body"?', '["A cluster of malignant cells", "A laminated calcification", "A viral inclusion", "A lipid droplet"]', 1, 'Concentric calcifications seen in Papillary Thyroid, Meningioma, and Mesothelioma.'),
    (v_case_id, 'What is the most significant risk factor for this malignancy?', '["Iodine deficiency", "Childhood radiation exposure", "High dietary salt", "Excessive caffeine"]', 1, 'Radiation exposure (e.g., for tonsils or acne in the past) increases Papillary risk.');

    -- CASE 43: Nephrogenic Diabetes Insipidus
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Lithium and Persistent Low Osmolality', 'A patient presents with polydipsia and polyuria. A water deprivation test is performed. The urine osmolality remains low. After administration of Desmopressin, the urine osmolality still remains low.', 43)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Central Diabetes Insipidus", "Nephrogenic Diabetes Insipidus", "Primary Polydipsia", "SIADH"]', 1, 'Failure to respond to Desmopressin indicates renal resistance.'),
    (v_case_id, 'Which medication is a common cause of this condition?', '["Lithium", "Amiodarone", "Penicillin", "Metformin"]', 0, 'Lithium is a classic cause of acquired Nephrogenic DI.'),
    (v_case_id, 'How do you treat the medication-induced form of this condition?', '["Desmopressin", "Amiloride or Hydrochlorothiazide", "Fluid bolus", "Spironolactone"]', 1, 'Amiloride blocks lithium entry into collecting duct cells.');

    -- CASE 44: Insulinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Whipple Triad and High C-peptide', 'A 45-year-old female presents with sweating and tremors. Her blood glucose is 40 mg/dL. Her symptoms improve immediately after eating a candy bar (Whipple triad). Labs show High Insulin and High C-peptide.', 44)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Exogenous insulin injection", "Insulinoma", "Sulfonylurea abuse", "Glucagonoma"]', 1, 'High insulin AND high C-peptide indicates endogenous production.'),
    (v_case_id, 'If the C-peptide were LOW but Insulin were HIGH, what would be the diagnosis?', '["Insulinoma", "Factitious hypoglycemia (Exogenous insulin)", "Sulfonylurea overdose", "Nesidioblastosis"]', 1, 'Exogenous insulin lacks the pro-insulin C-peptide cleavage product.'),
    (v_case_id, 'C-peptide is a byproduct of the cleavage of?', '["Preproinsulin", "Proinsulin", "Glucagon", "Somatostatin"]', 1, 'Proinsulin is cleaved into Insulin and C-peptide.');

    -- CASE 45: Hypothyroidism Reflexes
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Delayed Reflex Relaxation and Constipation', 'A 55-year-old female presents with severe fatigue, constipation, and a "hung-up" Achilles tendon reflex (delayed relaxation phase).', 45)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Hyperthyroidism", "Hypothyroidism", "Hypercalcemia", "Hypokalemia"]', 1, 'Hypothyroidism slows metabolism, including muscle relaxation (Woltman sign).'),
    (v_case_id, 'What is the term for the non-pitting edema seen in severe forms of this condition?', '["Anasarca", "Myxedema", "Lymphedema", "Ascites"]', 1, 'Myxedema is caused by glycosaminoglycan accumulation in the skin.'),
    (v_case_id, 'In the US, what is the most common cause of this condition?', '["Iodine deficiency", "Hashimoto Thyroiditis", "Pituitary failure", "Subacute thyroiditis"]', 1, 'Hashimoto is the leading cause of hypothyroidism in developed countries.');

    RAISE NOTICE 'SUCCESS: Endocrine Pathology Part 3 (31-45) registered.';
END $$;

COMMIT;
