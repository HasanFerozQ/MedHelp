-- Migration: Year 3 - Endocrinology MCQ Bank (PART 1: 1-83)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-29

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'endocrinology' LIMIT 1;

    -- SECTION 1: HYPOTHALAMUS & PITUITARY BASICS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '1: What is the most common type of functioning pituitary adenoma?', '["Growth Hormone-secreting", "Prolactinoma", "ACTH-secreting", "TSH-secreting"]', 1, 'Accounts for about 40-50% of pituitary tumors. (Harrison''s Ch. 373)'),
    (v_topic_id, '2: Which medication class is the FIRST-LINE treatment for most Prolactinomas?', '["Surgery", "Dopamine Agonists (e.g., Cabergoline, Bromocriptine)", "Radiation", "Somatostatin analogs"]', 1, 'Prolactinomas are unique because they are primarily managed medically. (Step-Up)'),
    (v_topic_id, '3: "Acromegaly" in adults is caused by excessive secretion of:', '["Prolactin", "Growth Hormone (GH)", "Cortisol", "Thyroxine"]', 1, 'Presents with enlarged hands, feet, and coarse facial features. (Pocket Medicine)'),
    (v_topic_id, '4: The screening test of choice for suspected Acromegaly is:', '["Random GH level", "Serum IGF-1 (Insulin-like Growth Factor 1)", "Oral Glucose Tolerance Test", "Brain MRI"]', 1, 'IGF-1 has a longer half-life and less fluctuation than GH. (Harrison''s Ch. 373)'),
    (v_topic_id, '5: "Gigantism" occurs when GH excess happens ____ the closure of epiphyseal plates.', '["Before", "After", "During", "Never"]', 0, 'Leads to excessive linear growth. (Step-Up)'),
    (v_topic_id, '6: "Bitemporal Hemianopsia" (loss of outer vision) is caused by a pituitary tumor compressing the:', '["Optic nerve", "Optic Chiasm", "Occipital lobe", "Retina"]', 1, 'The classic visual field defect of pituitary macroadenomas. (Pocket Medicine)'),
    (v_topic_id, '7: "Sheehan Syndrome" is postpartum pituitary necrosis caused by:', '["Tumor", "Hypovolemic shock/hemorrhage during delivery", "Infection", "Autoimmunity"]', 1, 'The enlarged pituitary of pregnancy is highly sensitive to ischemia. (Harrison''s Ch. 373)'),
    (v_topic_id, '8: "Empty Sella Syndrome" is often an incidental finding on MRI and is most common in:', '["Thin men", "Obese women with intracranial hypertension", "Children", "Elderly"]', 1, 'Usually has normal pituitary function. (Step-Up)'),
    (v_topic_id, '9: Which hormone deficiency is the most common in "Hypopituitarism"?', '["ACTH", "Gonadotropins (FSH/LH)", "TSH", "Prolactin"]', 1, 'Leads to secondary hypogonadism. (Pocket Medicine)'),
    (v_topic_id, '10: "Pituitary Apoplexy" is a medical emergency characterized by sudden hemorrhage into a pituitary tumor, presenting with:', E'["Slow weight gain", "Sudden \\"thunderclap\\" headache, vision loss, and shock", "High fever", "Diarrhea"]', 1, 'Requires urgent steroids and often neurosurgery. (Harrison''s Ch. 373)');

    -- SECTION 2: ADH & POSTERIOR PITUITARY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '11: "Central Diabetes Insipidus" (DI) is a failure of the pituitary to ____ ADH.', '["Produce/Secrete", "Respond to", "Break down", "Store"]', 0, 'Results in polyuria and polydipsia. (Step-Up)'),
    (v_topic_id, '12: What is the treatment of choice for Central Diabetes Insipidus?', '["Fluid restriction", "Desmopressin (dDAVP)", "Lithium", "Insulin"]', 1, 'Replaces the missing vasopressin. (Pocket Medicine)'),
    (v_topic_id, '13: "SIADH" (Syndrome of Inappropriate ADH) results in which electrolyte abnormality?', '["Hypernatremia", "Hyponatremia (Euvolemic)", "Hyperkalemia", "Hypocalcemia"]', 1, 'Water retention dilutes the serum sodium. (Harrison''s Ch. 49)'),
    (v_topic_id, '14: A classic cause of SIADH is paraneoplastic secretion from which cancer?', '["Squamous cell lung cancer", "Small Cell Lung Cancer", "Colon cancer", "Breast cancer"]', 1, 'Ectopic ADH production. (Step-Up)'),
    (v_topic_id, '15: "Psychogenic Polydipsia" presents with low sodium and ____ urine osmolality.', '["High (>500)", "Low (<100)", "Normal", "None"]', 1, 'The body is appropriately trying to pee out the excess water. (Pocket Medicine)'),
    (v_topic_id, '16: "Nephrogenic DI" is a failure of the ____ to respond to ADH.', '["Brain", "Kidney", "Liver", "Lungs"]', 1, 'ADH levels are normal or high. (Harrison''s Ch. 374)'),
    (v_topic_id, '17: "Oxytocin" is responsible for uterine contractions and:', '["Milk production", "Milk let-down (ejection)", "Sodium retention", "Sleep"]', 1, 'Prolactin stimulates production; Oxytocin stimulates ejection. (Step-Up)'),
    (v_topic_id, '18: ADH acts on which part of the nephron to insert aquaporins?', '["Proximal tubule", "Collecting Duct", "Loop of Henle", "Glomerulus"]', 1, 'Regulates final urine concentration. (Pocket Medicine)'),
    (v_topic_id, '19: "Vaptan" drugs (like Tolvaptan) are antagonists for which hormone receptor?', '["Insulin", "Vasopressin (V2)", "TSH", "ACTH"]', 1, 'Used in certain cases of SIADH. (Harrison''s Ch. 49)'),
    (v_topic_id, '20: What happens to serum sodium in SIADH if the patient is given Normal Saline?', '["It increases", "It decreases further", "It stays the same", "None"]', 1, 'The body retains the water and pees out the salt. (Step-Up)');

    -- SECTION 3: THYROID BASICS & HYPERTHYROIDISM
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '21: What is the most common cause of Hyperthyroidism in the United States?', '["Toxic Multinodular Goiter", "Graves Disease", "Thyroiditis", "Pituitary tumor"]', 1, 'Autoimmune disease with TSH-receptor stimulating antibodies. (Harrison''s Ch. 376)'),
    (v_topic_id, '22: "Exophthalmos" (bulging eyes) and pretibial myxedema are unique to which condition?', '["Toxic adenoma", "Graves Disease", "Painless thyroiditis", "Iodine deficiency"]', 1, 'Due to fibroblast activation in the orbit and skin. (Step-Up)'),
    (v_topic_id, '23: Which medication is preferred for the treatment of Graves Disease in the FIRST trimester of pregnancy?', '["Methimazole", "Propylthiouracil (PTU)", "Radioactive Iodine", "Surgery"]', 1, 'Methimazole is associated with birth defects (aplasia cutis) in early pregnancy. (Pocket Medicine)'),
    (v_topic_id, '24: A patient has low TSH and high Free T4. This is:', '["Hypothyroidism", "Primary Hyperthyroidism", "Secondary Hyperthyroidism", "Normal"]', 1, 'The thyroid is overproducing, suppressing TSH. (Harrison''s Ch. 376)'),
    (v_topic_id, '25: "Radioactive Iodine Uptake (RAIU)" is HIGH and DIFFUSE in:', '["Subacute Thyroiditis", "Graves Disease", "Toxic Multinodular Goiter", "Factitious ingestion"]', 1, 'The whole gland is hyperactive. (Step-Up)'),
    (v_topic_id, '26: "Thyroid Storm" is a life-threatening state of hyperthyroidism often triggered by:', '["Sleep", "Surgery, Infection, or Trauma", "Eating", "Exercise"]', 1, 'Requires ICU care and multiple medications (PTU, Beta-blockers, Steroids, Iodine). (Pocket Medicine)'),
    (v_topic_id, '27: Why are Beta-blockers (like Propranolol) given in hyperthyroidism?', '["To lower T4 levels", "To control symptoms (tachycardia, tremors, anxiety)", "To treat infection", "None"]', 1, 'They block the sympathetic effects of thyroid hormone. (Harrison''s Ch. 376)'),
    (v_topic_id, '28: "Subacute (De Quervain''s) Thyroiditis" typically presents with hyperthyroidism followed by hypothyroidism and:', '["Painless goiter", "A very painful, tender thyroid gland", "Eye changes", "Fever only"]', 1, 'Often follows a viral upper respiratory infection. (Step-Up)'),
    (v_topic_id, '29: "Toxic Multinodular Goiter" is more common in which population?', '["Children", "Elderly", "Teenagers", "Men only"]', 1, 'Multiple nodules become autonomous over time. (Pocket Medicine)'),
    (v_topic_id, '30: A "low/suppressed" RAIU in a hyperthyroid patient suggests:', '["Graves Disease", "Thyroiditis or Factitious ingestion", "Toxic adenoma", "Hot nodule"]', 1, 'The gland is not actively producing hormone; it''s either leaking or coming from outside. (Harrison''s Ch. 376)');

    -- SECTION 4: HYPOTHYROIDISM
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '31: What is the most common cause of Hypothyroidism in iodine-sufficient areas (like the US)?', '["Iodine deficiency", "Hashimoto Thyroiditis", "Surgery", "Radiation"]', 1, 'Autoimmune destruction of the thyroid. (Harrison''s Ch. 376)'),
    (v_topic_id, '32: "Anti-TPO" (Thyroid Peroxidase) antibodies are a marker for:', '["Graves", "Hashimoto Thyroiditis", "Thyroid Cancer", "Subacute Thyroiditis"]', 1, 'Present in >90% of Hashimoto patients. (Step-Up)'),
    (v_topic_id, '33: A patient has high TSH and low Free T4. This is:', '["Secondary Hypothyroidism", "Primary Hypothyroidism", "Hyperthyroidism", "Normal"]', 1, 'The thyroid is failing, so the pituitary is pumping out TSH to compensate. (Pocket Medicine)'),
    (v_topic_id, '34: What is the treatment of choice for primary hypothyroidism?', '["Methimazole", "Levothyroxine (T4)", "Liothyronine (T3)", "Iodine"]', 1, 'Stable half-life; dosed once daily. (Harrison''s Ch. 376)'),
    (v_topic_id, '35: "Myxedema Coma" is a severe, life-threatening form of hypothyroidism characterized by:', '["High fever", "Hypothermia, altered mental status, and bradycardia", "Seizures", "Diarrhea"]', 1, 'Requires IV Levothyroxine and often IV Hydrocortisone. (Step-Up)'),
    (v_topic_id, '36: In secondary (central) hypothyroidism, the TSH is typically:', '["High", "Low or inappropriately normal", "Very high", "Fluctuating"]', 1, 'The problem is in the pituitary/hypothalamus. (Pocket Medicine)'),
    (v_topic_id, '37: "Cretinism" refers to untreated congenital hypothyroidism leading to:', '["Tall stature", "Intellectual disability and short stature", "Blindness", "Obesity only"]', 1, 'Prevented by routine newborn screening. (Harrison''s Ch. 376)'),
    (v_topic_id, '38: Patients with Hashimoto Thyroiditis have an increased risk of which malignancy?', '["Papillary cancer", "Thyroid Lymphoma", "Anaplastic cancer", "Medullary cancer"]', 1, 'A rare but important association. (Step-Up)'),
    (v_topic_id, '39: Levothyroxine requirements usually ____ during pregnancy.', '["Decrease", "Increase", "Stay the same", "Drop to zero"]', 1, 'Due to increased Thyroid Binding Globulin (TBG). (Pocket Medicine)'),
    (v_topic_id, '40: A "cold" nodule on a thyroid scan is more likely to be ____ than a "hot" nodule.', '["Benign", "Malignant", "Cystic", "Infected"]', 1, 'Hot nodules are almost never cancerous. (Harrison''s Ch. 377)');

    -- SECTION 5: THYROID NODULES & CANCER
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '41: What is the most common type of Thyroid Cancer?', '["Follicular", "Papillary Carcinoma", "Medullary", "Anaplastic"]', 1, 'Accounts for >80% of cases; excellent prognosis. (Harrison''s Ch. 377)'),
    (v_topic_id, '42: "Psammoma bodies" and "Orphan Annie eye" nuclei are hallmarks of:', '["Medullary CA", "Papillary Thyroid CA", "Follicular CA", "Anaplastic"]', 1, 'Classic histological features. (Step-Up)'),
    (v_topic_id, '43: "Medullary Thyroid Cancer" (MTC) originates from ____ cells and secretes ____.', '["Follicular; T4", "Parafollicular C-cells; Calcitonin", "Immune; IgA", "None"]', 1, 'Associated with MEN 2A and 2B. (Pocket Medicine)'),
    (v_topic_id, '44: Which thyroid cancer is known for being extremely aggressive and having a near 100% mortality rate?', '["Papillary", "Anaplastic Carcinoma", "Follicular", "Medullary"]', 1, 'Often presents in older patients with rapid neck swelling. (Harrison''s Ch. 377)'),
    (v_topic_id, '45: "Follicular Thyroid Cancer" cannot be distinguished from a benign adenoma by:', '["Ultrasound", "Fine Needle Aspiration (FNA)", "CT scan", "MRI"]', 1, 'Diagnosis requires seeing vascular or capsular invasion on surgery. (Step-Up)'),
    (v_topic_id, '46: What is the first-line imaging test for evaluating a palpable thyroid nodule?', '["CT scan", "Thyroid Ultrasound", "PET scan", "X-ray"]', 1, 'Determines if FNA is necessary based on size and features. (Pocket Medicine)'),
    (v_topic_id, '47: A thyroid nodule found in a patient with a history of ____ is more concerning for malignancy.', '["Smoking", "Childhood neck radiation", "Alcohol", "Obesity"]', 1, 'Significant risk factor for papillary cancer. (Harrison''s Ch. 377)'),
    (v_topic_id, '48: Which serum marker is used to MONITOR for recurrence in patients who had a total thyroidectomy for papillary cancer?', '["Calcitonin", "Thyroglobulin", "CEA", "AFP"]', 1, 'Should be undetectable if all thyroid tissue is gone. (Step-Up)'),
    (v_topic_id, '49: "Hurthle cells" (large eosinophilic cells) are most commonly seen in:', '["Graves", "Follicular or Hashimoto Thyroiditis", "Medullary", "None"]', 1, 'Modified follicular cells. (Pocket Medicine)'),
    (v_topic_id, '50: Most thyroid cancers are clinically ____.', '["Hyperthyroid", "Hypothyroid", "Euthyroid (normal TSH/T4)", "Painful"]', 2, 'Thyroid function tests are usually normal in the setting of a nodule. (Harrison''s Ch. 377)');

    -- SECTION 6: ADRENAL CORTEX (CUSHING & ADDISON)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '51: What is the most common cause of "Cushing Syndrome" overall?', '["Adrenal tumor", "Exogenous glucocorticoid use (Steroids)", "Pituitary adenoma", "Lung cancer"]', 1, 'Iatrogenic Cushing is the leader. (Harrison''s Ch. 379)'),
    (v_topic_id, '52: "Cushing Disease" specifically refers to Cushing Syndrome caused by a:', '["Lung tumor", "Pituitary Adenoma (ACTH-secreting)", "Adrenal cancer", "Kidney stone"]', 1, 'High ACTH leads to bilateral adrenal hyperplasia. (Step-Up)'),
    (v_topic_id, '53: "Addison Disease" refers to primary ____.', '["Hyperaldosteronism", "Adrenal Insufficiency", "Hypercortisolism", "Diabetes"]', 1, 'Autoimmune destruction of the adrenal cortex is the most common cause in the US. (Pocket Medicine)'),
    (v_topic_id, '54: "Hyperpigmentation" of skin and mucous membranes is seen in:', '["Secondary Adrenal Insufficiency", "Primary Adrenal Insufficiency (Addison''s)", "Cushing Syndrome", "Hypothyroidism"]', 1, 'High ACTH (from lack of cortisol feedback) cross-reacts with MSH receptors. (Harrison''s Ch. 379)'),
    (v_topic_id, '55: "Acute Adrenal Crisis" is a medical emergency presenting with shock and:', '["Hypertension", "Hypotension, Hyponatremia, and Hyperkalemia", "Hyperglycemia", "Weight gain"]', 1, 'Requires immediate IV fluids and stress-dose Hydrocortisone. (Step-Up)'),
    (v_topic_id, '56: The screening test of choice for suspected Cushing Syndrome is:', '["Random cortisol", "24-hour urinary free cortisol or Overnight Dexamethasone Suppression Test", "Brain MRI first", "ACTH level alone"]', 1, 'Confirms hypercortisolism exists before looking for the source. (Pocket Medicine)'),
    (v_topic_id, '57: Which condition is associated with "Moon facies," "Buffalo hump," and "Purple striae"?', '["Addison''s", "Cushing Syndrome", "Conn Syndrome", "Diabetes"]', 1, 'Clinical signs of chronic cortisol excess. (Harrison''s Ch. 379)'),
    (v_topic_id, '58: A "High-dose Dexamethasone Suppression Test" that suppresses cortisol by >50% suggests:', '["Adrenal tumor", "Cushing Disease (Pituitary)", "Ectopic ACTH (Lung)", "None"]', 1, 'Pituitary tumors retain some sensitivity to feedback. (Step-Up)'),
    (v_topic_id, '59: Adrenal insufficiency leads to "Hypoglycemia" because cortisol normally ____ blood sugar.', '["Lowers", "Raises", "Buffers", "None"]', 1, 'Cortisol is a counter-regulatory (stress) hormone. (Pocket Medicine)'),
    (v_topic_id, '60: "Waterhouse-Friderichsen Syndrome" is acute adrenal failure due to hemorrhage, often triggered by:', '["N. meningitidis sepsis", "Smoking", "Alcohol", "Diabetes"]', 0, 'Life-threatening complication of meningococcemia. (Harrison''s Ch. 379)');

    -- SECTION 7: ALDOSTERONE & PHEOCHROMOCYTOMA
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '61: "Conn Syndrome" is also known as:', '["Adrenal insufficiency", "Primary Hyperaldosteronism (usually due to an adenoma)", "Cushing", "Pheo"]', 1, 'Presents with hypertension and hypokalemia. (Harrison''s Ch. 379)'),
    (v_topic_id, '62: The screening test for primary hyperaldosteronism is:', '["Random K+", "Plasma Aldosterone to Plasma Renin Activity (ARR) Ratio", "CT scan", "24hr Urine"]', 1, 'A high ratio (>20-30) suggests autonomous aldosterone production. (Step-Up)'),
    (v_topic_id, '63: "Pheochromocytoma" is a tumor of the adrenal ____ that secretes ____.', '["Cortex; Cortisol", "Medulla; Catecholamines (Epi/Norepi)", "Cortex; Aldosterone", "Medulla; Insulin"]', 1, 'Presents with episodic "paroxysms." (Pocket Medicine)'),
    (v_topic_id, '64: The classic triad of Pheochromocytoma is headache, sweating (diaphoresis), and:', '["Jaundice", "Palpitations/Tachycardia", "Diarrhea", "Weight gain"]', 1, 'Often accompanied by severe hypertension. (Harrison''s Ch. 380)'),
    (v_topic_id, '65: Before surgical removal of a Pheochromocytoma, which drug class MUST be given first?', '["Beta-blockers", "Alpha-blockers (e.g., Phenoxybenzamine)", "Diuretics", "Insulin"]', 1, 'Blocking beta first can cause "unopposed alpha" stimulation and a hypertensive crisis. (Step-Up)'),
    (v_topic_id, '66: "Congenital Adrenal Hyperplasia" (CAH) is most commonly caused by a deficiency of:', '["11-beta hydroxylase", "21-hydroxylase", "17-alpha hydroxylase", "Aldosterone synthase"]', 1, 'Leads to low cortisol/aldosterone and high androgens (virilization). (Pocket Medicine)'),
    (v_topic_id, '67: 21-hydroxylase deficiency presents with "salt wasting" and elevated levels of:', '["17-hydroxyprogesterone", "Glucose", "TSH", "Calcitonin"]', 0, 'Screened for in newborns. (Harrison''s Ch. 379)'),
    (v_topic_id, '68: Primary hyperaldosteronism causes which acid-base disturbance?', '["Metabolic Acidosis", "Metabolic Alkalosis", "Respiratory Acidosis", "None"]', 1, 'Aldosterone promotes H+ and K+ excretion. (Step-Up)'),
    (v_topic_id, '69: The "Rule of 10s" (10% bilateral, 10% malignant, 10% extra-adrenal) applies to:', '["Cushing", "Pheochromocytoma", "Addison''s", "Graves"]', 1, 'Though genetic links are making this rule less absolute. (Pocket Medicine)'),
    (v_topic_id, '70: Adrenal "Incidentalomas" found on CT require:', '["Immediate surgery", "Biochemical workup (checking for function) and follow-up", "Nothing", "Biopsy first"]', 1, 'Must rule out subclinical Cushing or Pheo. (Harrison''s Ch. 379)');

    -- SECTION 8: DIABETES MELLITUS BASICS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '71: Type 1 Diabetes is primarily caused by:', '["Insulin resistance", "Autoimmune destruction of pancreatic beta cells", "Eating too much sugar", "Obesity"]', 1, 'Results in absolute insulin deficiency. (Harrison''s Ch. 396)'),
    (v_topic_id, '72: Type 2 Diabetes is primarily characterized by:', '["Absolute insulin deficiency", "Insulin resistance and relative insulin deficiency", "Infection", "Genetic mutation only"]', 1, 'Strongly associated with obesity and metabolic syndrome. (Step-Up)'),
    (v_topic_id, '73: The "Gold Standard" test for monitoring long-term glycemic control (3 months) is:', '["Fasting Glucose", "HbA1c (Hemoglobin A1c)", "Oral Glucose Tolerance Test", "C-peptide"]', 1, 'Measures glycation of red blood cells. (Pocket Medicine)'),
    (v_topic_id, '74: A diagnosis of Diabetes is made if the HbA1c is >= ____ %.', '["5.7", "6.5", "7.0", "12.0"]', 1, 'Criteria for diagnosis. (Harrison''s Ch. 396)'),
    (v_topic_id, '75: A "Fasting Plasma Glucose" of >= ____ mg/dL is diagnostic for Diabetes.', '["100", "126", "140", "200"]', 1, 'Requires confirmation with a second test unless symptomatic. (Step-Up)'),
    (v_topic_id, '76: "Acanthosis Nigricans" is a skin finding often associated with:', '["Insulin deficiency", "Insulin Resistance", "Hypothyroidism", "Cushing Syndrome"]', 1, 'Velvety, dark plaques in the neck and axilla. (Pocket Medicine)'),
    (v_topic_id, '77: Which marker can distinguish between Type 1 and Type 2 Diabetes (it is low/absent in Type 1)?', '["Glucose", "C-peptide", "Glucagon", "Insulin antibodies"]', 1, 'Released in 1:1 ratio with endogenous insulin. (Harrison''s Ch. 396)'),
    (v_topic_id, '78: "Metformin" is the first-line medication for Type 2 DM. Its primary mechanism is:', '["Stimulating insulin secretion", "Inhibiting hepatic glucose production (gluconeogenesis)", "Increasing sugar in urine", "Killing sugar"]', 1, 'Does not cause weight gain or hypoglycemia. (Step-Up)'),
    (v_topic_id, '79: "Sulfonylureas" (e.g., Glyburide, Glipizide) work by:', '["Sensitizing cells", "Stimulating pancreatic insulin secretion", "Blocking glucagon", "None"]', 1, 'Carries a significant risk of hypoglycemia. (Pocket Medicine)'),
    (v_topic_id, '80: Which class of DM drugs is known for promoting weight loss and having cardiovascular benefits?', '["SGLT2 inhibitors and GLP-1 agonists", "Insulin", "Sulfonylureas", "Pioglitazone"]', 0, 'Modern mainstays of therapy. (Harrison''s Ch. 396)'),
    (v_topic_id, '81: "Gestational Diabetes" is usually screened for at how many weeks of gestation?', '["4-8 weeks", "24-28 weeks", "36 weeks", "Delivery"]', 1, 'Using the oral glucose tolerance test. (Step-Up)'),
    (v_topic_id, '82: What is the most common cause of death in patients with long-standing Diabetes?', '["Renal failure", "Cardiovascular Disease (MI/Stroke)", "Infection", "Hypoglycemia"]', 1, 'Diabetes is a "cardiovascular equivalent." (Pocket Medicine)'),
    (v_topic_id, '83: "Retinopathy," "Nephropathy," and "Neuropathy" are examples of ____ complications of DM.', '["Macrovascular", "Microvascular", "Psychological", "Infectious"]', 1, 'Damage to small vessels and nerves. (Harrison''s Ch. 396)');

    RAISE NOTICE 'SUCCESS: Endocrinology MCQ Part 1 (1-83) registered.';
END $$;

COMMIT;
