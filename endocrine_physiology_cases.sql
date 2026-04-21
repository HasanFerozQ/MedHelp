-- ==========================================
-- Endocrine Physiology Clinical Cases Migration
-- 25 Scenarios | Semester 2 First Year
-- ==========================================

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Get Topic ID
    SELECT id INTO v_topic_id FROM public.topics 
    WHERE title = 'Endocrine Physiology' AND (semester_id = 2 OR usmle_step = 1) 
    LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "Endocrine Physiology" not found.';
    END IF;

    -- 2. Clear existing cases for this topic
    DELETE FROM public.case_studies WHERE topic_id = v_topic_id;

    -- CASE 1
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Primary Hypothyroidism and Feedback', 'A 28-year-old woman presents with fatigue, weight gain, cold intolerance, and constipation. Lab testing shows low free T4 and high TSH.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The most likely endocrine defect is:', '["Secondary hypothyroidism", "Primary hypothyroidism", "Tertiary hypothyroidism", "Hyperthyroidism", "Euthyroid sick syndrome"]', 1, 'Low T4 with high TSH indicates the thyroid gland itself is the problem (Primary Hypothyroidism).'),
    (v_case_id, 'The elevated TSH occurs because of loss of negative feedback by:', '["Cortisol", "Thyroxine and triiodothyronine", "Aldosterone", "Prolactin", "Growth hormone"]', 1, 'T3 and T4 normally provide negative feedback to the pituitary to inhibit TSH release.'),
    (v_case_id, 'TSH is secreted by the:', '["Posterior pituitary", "Anterior pituitary", "Thyroid follicular cell", "Hypothalamus", "Parathyroid gland"]', 1, 'Thyroid-stimulating hormone is produced by thyrotrophs in the anterior pituitary.'),
    (v_case_id, 'TRH is secreted by the:', '["Adrenal cortex", "Hypothalamus", "Thyroid gland", "Posterior pituitary", "Pancreatic islet"]', 1, 'Thyrotropin-releasing hormone comes from the hypothalamus to stimulate the pituitary.');

    -- CASE 2
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hyperthyroidism Physiology', 'A 24-year-old woman has weight loss despite increased appetite, heat intolerance, sweating, and palpitations.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Thyroid hormone increases basal metabolic rate mainly by increasing:', '["Na+/K+ ATPase activity", "H+/K+ ATPase activity", "Insulin release only", "Calcium deposition", "ADH secretion"]', 0, 'Thyroid hormones increase the expression and activity of the Na/K pump in most tissues.'),
    (v_case_id, 'Thyroid hormone excess typically causes:', '["Bradycardia", "Tachycardia", "Reduced beta-adrenergic sensitivity", "Constipation", "Cold intolerance"]', 1, 'Increased thyroid hormone upregulates beta-adrenergic receptors, leading to heart racing.'),
    (v_case_id, 'Much of T3 in peripheral tissues is formed by:', '["Direct pituitary secretion", "Conversion of T4 to T3", "Adrenal synthesis", "Renal secretion", "Thyroglobulin breakdown in plasma only"]', 1, 'Peripheral deiodination of T4 (pro-hormone) is the main source of active T3.');

    -- CASE 3
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Thyroid Hormone Transport and Activity', 'A physiology tutor asks about circulating thyroid hormones.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The major thyroid hormone secreted by the thyroid gland is:', '["T3", "T4", "Reverse T3", "TSH", "TRH"]', 1, 'T4 is produced in much larger quantities than T3 by the thyroid.'),
    (v_case_id, 'The more biologically active thyroid hormone is:', '["T4", "T3", "Reverse T3", "Thyroglobulin", "Calcitonin"]', 1, 'T3 has a higher affinity for thyroid hormone receptors.'),
    (v_case_id, 'Most circulating thyroid hormone is:', '["Free in plasma", "Protein-bound", "Stored in RBCs", "Bound to insulin", "Excreted unchanged in urine"]', 1, 'Over 99% is bound to Thyroxine-Binding Globulin (TBG), albumin, or transthyretin.');

    -- CASE 4
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Graves-Type Physiology', 'A 30-year-old woman has diffuse thyroid enlargement, warm skin, and tremor. Her TSH is low and free T4 is high.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'In primary hyperthyroidism, pituitary TSH is low because of:', '["Increased TRH secretion", "Negative feedback from high thyroid hormone", "Pituitary infarction", "ADH inhibition", "Cortisol deficiency"]', 1, 'High T4/T3 suppresses the secretion of TSH from the pituitary.'),
    (v_case_id, 'Thyroid follicular cells synthesize thyroid hormone using:', '["Cholesterol", "Tyrosine residues in thyroglobulin and iodine", "Tryptophan", "Cortisol precursors", "Calcium phosphate"]', 1, 'Thyroglobulin acts as a scaffold for iodination.'),
    (v_case_id, 'Organification in thyroid hormone synthesis refers to:', '["Release of T3 into blood", "Iodination of tyrosine residues", "Conversion of T4 to T3 in liver", "Secretion of TSH", "Endocytosis of colloid"]', 1, 'The process where iodine is chemically bound to tyrosine residues on thyroglobulin.');

    -- CASE 5
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Calcium Homeostasis and PTH', 'A 46-year-old woman presents with muscle cramps and tingling. Labs show low serum calcium.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The hormone most directly released in response to hypocalcemia is:', '["Calcitonin", "Parathyroid hormone", "Aldosterone", "Prolactin", "ACTH"]', 1, 'PTH is the primary defender against low serum calcium.'),
    (v_case_id, 'PTH raises serum calcium partly by increasing calcium reabsorption in the:', '["Proximal tubule", "Distal convoluted tubule", "Collecting duct", "Loop of Henle thin limb", "Bowman capsule"]', 1, 'PTH acts on the DCT to increase calcium salvage from filtrate.'),
    (v_case_id, 'PTH lowers serum phosphate mainly by:', '["Increasing GI absorption", "Decreasing renal phosphate reabsorption", "Inhibiting bone resorption", "Increasing calcitonin release", "Increasing distal tubular phosphate reabsorption"]', 1, 'PTH downregulates Na-Pi cotransporters in the proximal tubule.'),
    (v_case_id, 'PTH stimulates renal formation of:', '["Inactive vitamin D", "1,25-dihydroxyvitamin D", "Calcitonin", "Thyroxine", "Aldosterone"]', 1, 'PTH induces 1-alpha-hydroxylase activity.');

    -- CASE 6
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Calcitonin vs PTH', 'A student is asked to compare calcitonin and PTH.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Calcitonin is secreted by:', '["Thyroid follicular cells", "Thyroid parafollicular C cells", "Parathyroid chief cells", "Adrenal medulla", "Anterior pituitary"]', 1, 'C cells are distinct from the T4-producing follicles.'),
    (v_case_id, 'Calcitonin tends to:', '["Increase serum calcium", "Lower serum calcium by inhibiting osteoclast activity", "Increase phosphate reabsorption in kidney only", "Increase PTH release", "Increase 1-alpha hydroxylase activity"]', 1, 'Calcitonin "tones down" blood calcium.'),
    (v_case_id, 'In day-to-day human calcium regulation, the dominant hormone is:', '["Calcitonin", "PTH", "Aldosterone", "ADH", "Insulin"]', 1, 'PTH is much more critical for life than calcitonin in humans.');

    -- CASE 7
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Insulin Physiology', 'A healthy man eats a high-carbohydrate meal. Plasma glucose rises and insulin is released.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Insulin is secreted by:', '["Alpha cells", "Beta cells", "Delta cells", "F cells", "Thyrotrophs"]', 1, 'Langerhans islets beta cells secrete insulin.'),
    (v_case_id, 'Glucose stimulates insulin release primarily after entering beta cells via:', '["GLUT1 only", "GLUT2", "SGLT1", "ENaC", "NKCC"]', 1, 'GLUT2 has high capacity and allows glucose sensing proportional to plasma levels.'),
    (v_case_id, 'Increased ATP in beta cells leads to:', '["Opening of ATP-sensitive K+ channels", "Closure of ATP-sensitive K+ channels and depolarization", "Hyperpolarization by chloride influx only", "Inhibition of calcium entry", "Glucagon secretion"]', 1, 'K-ATP closure is the key step in stimulus-secretion coupling.'),
    (v_case_id, 'Insulin promotes:', '["Lipolysis", "Glycogen synthesis", "Gluconeogenesis", "Ketogenesis", "Proteolysis"]', 1, 'Insulin is the primary anabolic hormone.');

    -- CASE 8
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Glucagon Physiology', 'A patient has been fasting overnight.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The pancreatic hormone that rises to maintain blood glucose during fasting is:', '["Insulin", "Glucagon", "Somatostatin", "Pancreatic polypeptide", "CCK"]', 1, 'Glucagon acts to prevent hypoglycemia.'),
    (v_case_id, 'Glucagon is secreted by:', '["Beta cells", "Alpha cells", "Delta cells", "Chief cells", "Parietal cells"]', 1, 'Islet alpha cells secrete glucagon.'),
    (v_case_id, 'Glucagon acts mainly on the liver to increase:', '["Glycogenesis", "Glycogenolysis and gluconeogenesis", "Glucose uptake into skeletal muscle", "Protein synthesis", "Calcium deposition"]', 1, 'Increases breakdown of stores and synthesis of new glucose.');

    -- CASE 9
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Somatostatin in Islets', 'A physiology professor asks about islet cell interactions.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Somatostatin is secreted by pancreatic:', '["Alpha cells", "Beta cells", "Delta cells", "PP cells", "Acinar cells"]', 2, 'Islet delta cells produce somatostatin.'),
    (v_case_id, 'Somatostatin generally:', '["Stimulates insulin and glucagon release", "Inhibits both insulin and glucagon release", "Raises growth hormone only", "Increases thyroid hormone synthesis", "Promotes gastric acid secretion"]', 1, 'Acts paracrine-style to inhibit neighbors.'),
    (v_case_id, 'Somatostatin also inhibits which pituitary hormone?', '["ACTH only", "Growth hormone", "TSH only", "FSH only", "Prolactin only"]', 1, 'Somatostatin is also called Growth Hormone Inhibiting Hormone (GHIH).');

    -- CASE 10
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fasting State Integration', 'A person has not eaten for 24 hours.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Blood glucose is maintained initially mainly by hepatic:', '["Glycogenesis", "Glycogenolysis", "Lipogenesis", "Protein synthesis", "Ketone excretion"]', 1, 'Breakdown of stored starch (glycogen) is the fastest response.'),
    (v_case_id, 'With more prolonged fasting, glucose production relies increasingly on:', '["Glycogenesis", "Gluconeogenesis", "Insulin secretion", "Intestinal absorption", "Thyroid hormone storage"]', 1, 'The liver makes sugar from scratch (amino acids, glycerol).'),
    (v_case_id, 'Which hormone favors lipolysis during fasting?', '["Insulin", "Glucagon and catecholamines", "Prolactin", "Calcitonin", "Aldosterone only"]', 1, 'Low insulin plus high glucagon/epineprhine triggers fat burning.');

    -- CASE 11
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Adrenal Cortex Layers', 'A student is asked about adrenal steroid production.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Aldosterone is produced mainly in the:', '["Zona glomerulosa", "Zona fasciculata", "Zona reticularis", "Adrenal medulla", "Posterior pituitary"]', 0, 'Outer layer produces mineralocorticoids.'),
    (v_case_id, 'Cortisol is produced mainly in the:', '["Zona glomerulosa", "Zona fasciculata", "Zona reticularis", "Adrenal medulla", "Pineal gland"]', 1, 'Middle layer produces glucocorticoids.'),
    (v_case_id, 'Adrenal androgens are produced mainly in the:', '["Zona glomerulosa", "Zona fasciculata", "Zona reticularis", "Medulla", "Parathyroid glands"]', 2, 'Inner layer produces sex steroids.');

    -- CASE 12
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cortisol Regulation', 'A patient under severe stress has increased ACTH and cortisol secretion.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'ACTH is secreted by the:', '["Hypothalamus", "Anterior pituitary", "Posterior pituitary", "Adrenal cortex", "Adrenal medulla"]', 1, 'Adrenocorticotropic hormone comes from the pituitary.'),
    (v_case_id, 'ACTH release is stimulated by hypothalamic:', '["TRH", "CRH", "GnRH", "GHRH", "Dopamine"]', 1, 'Corticotropin-releasing hormone is the trigger.'),
    (v_case_id, 'Cortisol exerts negative feedback on:', '["Thyroid only", "Both hypothalamus and anterior pituitary", "Kidney only", "Pancreatic islets only", "Adrenal medulla only"]', 1, 'Cortisol limits its own production by suppressing CRH and ACTH.'),
    (v_case_id, 'Cortisol tends to increase:', '["Peripheral glucose uptake in muscle", "Gluconeogenesis", "Insulin sensitivity", "Protein synthesis only", "Calcium deposition in bone"]', 1, 'Glucocorticoids are "counter-regulatory" to insulin.');

    -- CASE 13
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cortisol Effects on Metabolism', 'A physiology MCQ asks about the metabolic role of cortisol.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Cortisol tends to increase blood glucose by promoting:', '["Glycogenesis only", "Gluconeogenesis and reduced peripheral glucose uptake", "Beta-cell proliferation only", "Muscle glucose uptake", "Hepatic glycogen depletion only"]', 1, 'Favors survival by keeping blood sugar available for the brain.'),
    (v_case_id, 'Cortisol excess is associated with increased:', '["Protein synthesis in muscle", "Protein breakdown in muscle", "Bone formation", "Insulin sensitivity", "TSH release"]', 1, 'High cortisol leads to muscle wasting and thinning of the skin.'),
    (v_case_id, 'Cortisol has important permissive effects on:', '["Catecholamine-mediated vascular responsiveness", "Thyroglobulin synthesis only", "Prolactin release", "Calcium excretion only", "Growth hormone suppression only"]', 0, 'Without cortisol, blood pressure collapses even with high epinephrine.');

    -- CASE 14
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Aldosterone Regulation', 'A dehydrated patient has low effective circulating volume and elevated aldosterone.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Aldosterone secretion is stimulated strongly by:', '["Hypernatremia only", "Angiotensin II and hyperkalemia", "Low potassium", "ADH only", "Calcitonin"]', 1, 'Ang II (volume signal) and Potassium (electrolyte signal) are both triggers.'),
    (v_case_id, 'Aldosterone acts mainly on the:', '["Proximal tubule", "Distal nephron principal cells", "Loop of Henle thin limb", "Macula densa", "Bowman capsule"]', 1, 'Targets the late distal tubule and collecting ducts.'),
    (v_case_id, 'Aldosterone increases:', '["Sodium excretion and potassium retention", "Sodium reabsorption and potassium secretion", "Glucose reabsorption", "Bicarbonate loss only", "Calcium secretion"]', 1, 'Conserves sodium to expand volume; loses potassium.');

    -- CASE 15
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'ADH Physiology', 'A marathon runner becomes dehydrated and hyperosmolar.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The hormone most directly increased by high plasma osmolality is:', '["Aldosterone", "ADH", "ANP", "Cortisol", "TSH"]', 1, 'Antidiuretic hormone is very sensitive to osmolality (1% change).'),
    (v_case_id, 'ADH is synthesized in the:', '["Posterior pituitary", "Hypothalamus", "Adrenal medulla", "Thyroid gland", "Parathyroid gland"]', 1, 'Made in the supraoptic and paraventricular nuclei.'),
    (v_case_id, 'ADH is released from the:', '["Anterior pituitary", "Posterior pituitary", "Zona glomerulosa", "Pineal gland", "Pancreatic islets"]', 1, 'Stored and secreted by the neurohypophysis.'),
    (v_case_id, 'ADH increases water reabsorption primarily by inserting:', '["GLUT4", "Aquaporin-2 channels", "ENaC channels", "NKCC channels", "H+/K+ ATPase"]', 1, 'Water channels in the apical membrane of collecting duct cells.');

    -- CASE 16
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Diabetes Insipidus Physiology', 'A patient has large volumes of dilute urine and increased plasma osmolality.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Deficiency of ADH would most directly impair water reabsorption in the:', '["Proximal tubule", "Thick ascending limb", "Collecting duct", "Loop of Henle descending limb only", "Glomerulus"]', 2, 'The only segment that is dynamically regulated by ADH for water.'),
    (v_case_id, 'In central diabetes insipidus, the primary problem is:', '["Renal resistance to ADH", "Deficient ADH secretion", "Excess aldosterone", "Excess cortisol", "Lack of insulin"]', 1, 'Damage to the hypothalamus or posterior pituitary.'),
    (v_case_id, 'Urine in untreated diabetes insipidus is typically:', '["Very concentrated", "Dilute", "Glucose rich always", "Protein rich", "Hypertonic to plasma in all cases"]', 1, 'Hypotonic to plasma because the "water-saver" is missing.');

    -- CASE 17
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Growth Hormone Axis', 'A child has short stature due to growth hormone deficiency.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Growth hormone is secreted by the:', '["Posterior pituitary", "Anterior pituitary", "Hypothalamus", "Liver", "Thyroid gland"]', 1, 'Somatotrophs in the anterior pituitary produce GH.'),
    (v_case_id, 'Growth hormone secretion is stimulated by hypothalamic:', '["Somatostatin", "GHRH", "Dopamine", "CRH", "TRH"]', 1, 'Growth Hormone-Releasing Hormone.'),
    (v_case_id, 'Which hypothalamic hormone inhibits growth hormone release?', '["GnRH", "Somatostatin", "GHRH", "TRH", "ADH"]', 1, 'Somatostatin (GHIH) keeps GH in check.'),
    (v_case_id, 'Many growth-promoting effects of GH are mediated by:', '["ACTH", "IGF-1", "Prolactin", "Calcitonin", "Aldosterone"]', 1, 'Insulin-like Growth Factor 1 (Somatomedin C).');

    -- CASE 18
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Growth Hormone Metabolic Effects', 'A physiology teacher asks about the acute metabolic effects of GH.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Growth hormone tends to:', '["Increase glucose uptake into muscle and fat", "Decrease lipolysis", "Increase lipolysis and reduce glucose uptake", "Cause severe hypoglycemia", "Decrease protein synthesis"]', 2, 'GH works to increase fuel availability (fats and sugar).'),
    (v_case_id, 'Excess GH may therefore have a:', '["Hypoglycemic effect only", "Diabetogenic effect", "Thyromimetic effect", "Mineralocorticoid effect", "Antidiuretic effect only"]', 1, 'By increasing insulin resistance.'),
    (v_case_id, 'IGF-1 is produced largely by the:', '["Kidney", "Liver", "Thyroid", "Parathyroid", "Adrenal medulla"]', 1, 'The liver is the primary endocrine source of IGF-1.');

    -- CASE 19
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Prolactin and Dopamine', 'A postpartum woman is breastfeeding. A student asks about prolactin control.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Prolactin is secreted by the:', '["Posterior pituitary", "Anterior pituitary", "Mammary gland", "Hypothalamus", "Placenta only"]', 1, 'Lactotrophs in the anterior pituitary.'),
    (v_case_id, 'The dominant hypothalamic control of prolactin is:', '["Stimulatory by CRH", "Inhibitory by dopamine", "Inhibitory by GHRH", "Stimulatory by somatostatin", "Stimulatory by ADH"]', 1, 'Prolactin is unique because its default state is being inhibited by Dopamine.'),
    (v_case_id, 'Suckling tends to:', '["Increase dopamine and reduce prolactin", "Decrease dopamine and increase prolactin", "Decrease oxytocin", "Inhibit milk let-down", "Suppress anterior pituitary entirely"]', 1, 'Removes the inhibition to allow milk production.'),
    (v_case_id, 'Prolactin mainly promotes:', '["Milk ejection", "Milk production", "Uterine contraction", "Thyroid hormone release", "Ovarian follicle rupture"]', 1, 'Drives synthesis of milk proteins.');

    -- CASE 20
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Oxytocin Physiology', 'A woman in labor has strong uterine contractions.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Oxytocin is synthesized in the:', '["Posterior pituitary", "Hypothalamus", "Anterior pituitary", "Adrenal medulla", "Placenta only"]', 1, 'Made in hypothalamic neurons, then travels to the pituitary.'),
    (v_case_id, 'Oxytocin is released from the:', '["Anterior pituitary", "Posterior pituitary", "Thyroid", "Pineal gland", "Adrenal cortex"]', 1, 'Secreted from the neurohypophysis.'),
    (v_case_id, 'Oxytocin mediates:', '["Milk production", "Milk ejection and uterine contraction", "Sodium retention", "Cortisol release", "Thyroid growth"]', 1, 'Responsible for the "let-down" reflex and birth.');

    -- CASE 21
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Gonadotropin Regulation', 'A physiology question asks about reproductive hormone control.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'FSH and LH are released from the:', '["Posterior pituitary", "Anterior pituitary", "Hypothalamus", "Gonads", "Adrenal cortex"]', 1, 'Gonadotrophs produce these in the pituitary.'),
    (v_case_id, 'Their secretion is stimulated by hypothalamic:', '["TRH", "GnRH", "CRH", "GHRH", "Somatostatin"]', 1, 'Gonadotropin-Releasing Hormone.'),
    (v_case_id, 'GnRH is normally secreted in a:', '["Constant continuous fashion for maximal effect", "Pulsatile manner", "Once-daily burst only", "Circadian adrenal pattern", "Reflex-independent pattern only"]', 1, 'Constant GnRH actually inhibits the axis (downregulation).');

    -- CASE 22
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Estrogen and LH Surge', 'A woman in mid-cycle has a surge in LH.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'The LH surge is triggered by:', '["Negative feedback of estrogen", "Positive feedback of sustained high estrogen", "Progesterone suppression", "Inhibin only", "Prolactin only"]', 1, 'Estrogen flips from negative to positive feedback at mid-cycle.'),
    (v_case_id, 'The LH surge induces:', '["Menstruation", "Ovulation", "Lactation", "Follicular atresia only", "Placental separation"]', 1, 'Rupture of the dominant follicle.'),
    (v_case_id, 'FSH and LH act on the ovary to regulate:', '["Only progesterone secretion", "Follicular development and steroidogenesis", "Thyroid function", "Cortisol synthesis", "Calcium homeostasis"]', 1, 'Coordinates both the structural development and hormone production.');

    -- CASE 23
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Insulin vs Counterregulatory Hormones', 'A patient becomes hypoglycemic after prolonged exercise without food intake.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Which hormone is most rapidly released to defend against hypoglycemia?', '["Insulin", "Glucagon", "Aldosterone", "TSH", "Calcitonin"]', 1, 'Glucagon is the immediate first-responder.'),
    (v_case_id, 'Which hormone also helps raise glucose by increasing glycogenolysis in acute stress?', '["Prolactin", "Epinephrine", "Oxytocin", "ADH", "Somatostatin"]', 1, 'Adrenaline (Epi) triggers rapid glucose release.'),
    (v_case_id, 'Cortisol and growth hormone are considered:', '["Pure hypoglycemic hormones", "Counterregulatory hormones", "Thyroid axis hormones", "Calcium-lowering hormones", "Only reproductive hormones"]', 1, 'They work against insulin to raise blood sugar during stress.');

    -- CASE 24
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Catecholamine Physiology', 'A patient with severe fear has tachycardia, sweating, and tremor.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Epinephrine is secreted by the:', '["Adrenal cortex", "Adrenal medulla", "Anterior pituitary", "Hypothalamus", "Thyroid gland"]', 1, 'The inner part of the adrenal gland.'),
    (v_case_id, 'Catecholamines are synthesized from:', '["Tyrosine", "Tryptophan", "Cholesterol", "Histidine", "Glycine"]', 0, 'Tyrosine -> Dopa -> Dopamine -> NE -> Epi.'),
    (v_case_id, 'The adrenal medulla is functionally analogous to:', '["A parasympathetic ganglion", "A sympathetic ganglion", "The anterior pituitary", "The thyroid follicle", "The zona glomerulosa"]', 1, 'Stimulated by pre-ganglionic sympathetic fibers.'),
    (v_case_id, 'Epinephrine generally causes:', '["Decreased heart rate and bronchodilation failure", "Increased heart rate and glycogenolysis", "Reduced lipolysis", "Insulin-like effects only", "Decreased blood glucose"]', 1, 'Prepares the body for immediate action.');

    -- CASE 25
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Integrated Endocrine Feedback', 'A teacher asks a student to identify a general principle of endocrine axes.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation)
    VALUES 
    (v_case_id, 'Most classic endocrine axes are regulated primarily by:', '["Positive feedback only", "Negative feedback", "Osmosis only", "Renal filtration only", "Enterohepatic circulation"]', 1, 'Ensures homeostatic stability.'),
    (v_case_id, 'An example of positive feedback in endocrine physiology is:', '["Cortisol suppressing ACTH", "Thyroid hormone suppressing TSH", "Estrogen triggering the LH surge", "ADH suppressing osmoreceptors", "Insulin suppressing glucagon"]', 2, 'The LH surge is the explosive exception.'),
    (v_case_id, 'Hormones that bind intracellular receptors include:', '["Peptide hormones only", "Steroid and thyroid hormones", "Catecholamines only", "Insulin and glucagon", "ADH and oxytocin"]', 1, 'Lipid-soluble hormones can cross the cell membrane.'),
    (v_case_id, 'Peptide hormones typically act through:', '["Intracellular nuclear receptors", "Cell surface receptors and second messengers", "Direct DNA binding only", "Mitochondrial receptors only", "Thyroglobulin binding"]', 1, 'Require a transmembrane middle-man.');

    RAISE NOTICE 'Endocrine Physiology cases populated successfully.';
END $$;
