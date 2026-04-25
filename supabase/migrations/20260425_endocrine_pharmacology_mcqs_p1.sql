-- Migration: Year 2 - Endocrine Pharmacology MCQ Bank (PART 1: 1-70)
-- Date: 2026-04-25
-- Target: US MD / MBBS Level

BEGIN;

-- 1. Register Topic
INSERT INTO topics (title, slug, year_id, semester_id)
VALUES ('Endocrine Pharmacology', 'endocrine-pharmacology', 2, 3)
ON CONFLICT (slug) DO UPDATE SET 
    title = EXCLUDED.title,
    year_id = EXCLUDED.year_id,
    semester_id = EXCLUDED.semester_id;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'endocrine-pharmacology' LIMIT 1;

    -- Master Wipe ONLY in Part 1 to start a clean 335 count
    DELETE FROM mcqs WHERE topic_id = v_topic_id;

    -- SECTION 1: HYPOTHALAMIC & PITUITARY (1-35)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which hypothalamic hormone is used clinically to stimulate growth in children with pituitary dwarfism?', '["Somatropin", "Sermorelin", "Octreotide", "Pegvisomant"]', 1, 'Sermorelin is a GHRH analog used to test pituitary function or stimulate growth.'),
    (v_topic_id, 'What is the mechanism of action of Octreotide?', '["GH receptor antagonist", "Somatostatin analog", "D2 receptor agonist", "GnRH agonist"]', 1, 'Octreotide is a long-acting somatostatin analog that inhibits GH, glucagon, and insulin release.'),
    (v_topic_id, 'Which drug is a GH receptor antagonist used for Acromegaly that has failed to respond to other treatments?', '["Octreotide", "Lanreotide", "Pegvisomant", "Bromocriptine"]', 2, 'Pegvisomant blocks the GH receptor, preventing the production of IGF-1.'),
    (v_topic_id, 'A patient with hyperprolactinemia should be treated with which of the following?', '["Dopamine antagonist", "Bromocriptine", "Oxytocin", "Desmopressin"]', 1, 'Dopamine (and its agonists like Bromocriptine/Cabergoline) inhibits prolactin secretion.'),
    (v_topic_id, 'Which drug is used for "Central Diabetes Insipidus" and acts on V2 receptors?', '["Vasopressin", "Desmopressin (DDAVP)", "Conivaptan", "Tolvaptan"]', 1, 'Desmopressin is a selective V2 agonist with minimal V1 (vasoconstrictor) activity.'),
    (v_topic_id, 'Conivaptan and Tolvaptan are V2 antagonists used to treat which condition?', '["Diabetes Insipidus", "SIADH", "Nocturnal enuresis", "Von Willebrand disease"]', 1, 'They are "vaptans" used to increase water excretion in hyponatremic states like SIADH.'),
    (v_topic_id, 'Which hormone is used clinically to induce labor and prevent postpartum hemorrhage?', '["Vasopressin", "Oxytocin", "Progesterone", "Prolactin"]', 1, 'Oxytocin stimulates uterine contractions.'),
    (v_topic_id, 'Leuprolide, when given in a pulsatile fashion, is used to treat:', '["Prostate cancer", "Infertility", "Endometriosis", "Precocious puberty"]', 1, 'Pulsatile GnRH stimulates FSH/LH release; continuous administration suppresses them.'),
    (v_topic_id, 'Which side effect is most common with continuous Leuprolide therapy in men?', '["Hypertension", "Hot flashes and gynecomastia", "Weight gain", "Tachycardia"]', 1, 'Suppression of testosterone leads to menopausal-like symptoms and breast enlargement.'),
    (v_topic_id, 'Ganirelix and Cetrorelix are used in assisted reproduction because they:', '["Stimulate ovulation", "Act as competitive GnRH antagonists", "Inhibit FSH release", "Increase progesterone"]', 1, 'They prevent the premature LH surge during ovarian stimulation.'),
    (v_topic_id, 'Somatropin (recombinant GH) acts primarily by increasing the production of which factor?', '["IGF-1 (Somatomedin C)", "Glucagon", "Cortisol", "Thyroxine"]', 0, 'Most GH effects are mediated through IGF-1 produced in the liver.'),
    (v_topic_id, 'Which pituitary drug is used to treat Von Willebrand Disease (Type 1)?', '["Oxytocin", "Desmopressin", "Follitropin", "Human Chorionic Gonadotropin"]', 1, 'Desmopressin stimulates the release of vWF and Factor VIII from endothelial cells.'),
    (v_topic_id, 'Oxytocin is contraindicated in which scenario?', '["Postpartum hemorrhage", "Induction of labor", "Fetal distress", "Breastfeeding difficulty"]', 2, 'Oxytocin can cause uterine hyperstimulation and further compromise a distressed fetus.'),
    (v_topic_id, 'What is the primary clinical use of Cosyntropin?', '["Treatment of Addison disease", "Diagnosis of adrenal insufficiency", "Treatment of asthma", "Suppression of ACTH"]', 1, 'Cosyntropin is a synthetic ACTH used to see if the adrenal gland can still produce cortisol.'),
    (v_topic_id, 'Which drug is a recombinant form of FSH used for ovulation induction?', '["Follitropin alpha", "Urofollitropin", "Menotropins", "Lutropin"]', 0, 'Follitropin alpha is purely FSH.'),
    (v_topic_id, 'Human Chorionic Gonadotropin (hCG) is often used clinically as a substitute for which hormone?', '["FSH", "LH", "TSH", "ACTH"]', 1, 'hCG shares the same alpha subunit and acts on LH receptors to trigger ovulation.'),
    (v_topic_id, 'Which drug is used for nocturnal enuresis in children?', '["Oral Desmopressin", "Octreotide", "Vasopressin", "Oxytocin"]', 0, 'Desmopressin reduces urine volume at night.'),
    (v_topic_id, 'The mechanism of Terlipressin in esophageal varices is:', '["Splanchnic vasodilation", "Splanchnic vasoconstriction via V1 receptors", "Increase in heart rate", "Direct inhibition of bleeding"]', 1, 'V1 stimulation causes vasoconstriction in the mesenteric circulation.'),
    (v_topic_id, 'Which hypothalamic hormone inhibits the release of both Growth Hormone and TSH?', '["TRH", "CRH", "Somatostatin", "GHRH"]', 2, 'Somatostatin is the universal "inhibitory" hormone.'),
    (v_topic_id, 'A patient on chronic Leuprolide for prostate cancer is at risk for which metabolic complication?', '["Hyperglycemia", "Osteoporosis", "Hypokalemia", "Hypocalcemia"]', 1, 'Low testosterone levels lead to decreased bone mineral density.'),
    (v_topic_id, 'Gonadorelin is used clinically for which purpose?', '["Treatment of breast cancer", "Diagnostic test for LH responsiveness", "Treatment of endometriosis", "Contraception"]', 1, 'It is synthetic GnRH used for diagnostic purposes.'),
    (v_topic_id, 'Which drug is an Orally active V2-selective antagonist?', '["Conivaptan", "Tolvaptan", "Desmopressin", "Lixivaptan"]', 1, 'Tolvaptan is oral; Conivaptan is IV (V1a/V2).'),
    (v_topic_id, 'What is the primary side effect of Tolvaptan?', '["Kidney failure", "Hepatotoxicity", "Hypertension", "Seizures"]', 1, 'Use is limited to 30 days due to potential liver injury.'),
    (v_topic_id, 'Which drug is used for growth failure in children with IGF-1 deficiency (Laron dwarfism)?', '["Somatropin", "Mecasermin", "Pegvisomant", "Octreotide"]', 1, 'Mecasermin is recombinant human IGF-1.'),
    (v_topic_id, 'Side effects of Mecasermin include which of the following?', '["Hyperglycemia", "Hypoglycemia", "Hypercalcemia", "Hypertension"]', 1, 'IGF-1 has insulin-like effects and can cause hypoglycemia.'),
    (v_topic_id, 'Which drug is a Dopamine agonist used to treat Acromegaly?', '["Chlorpromazine", "Cabergoline", "Metoclopramide", "Haloperidol"]', 1, 'Cabergoline is a long-acting D2 agonist.'),
    (v_topic_id, 'Oxytocin can cause which electrolyte abnormality if given in high doses with free water?', '["Hypernatremia", "Hyponatremia", "Hyperkalemia", "Hypocalcemia"]', 1, 'It has weak vasopressin-like cross-reactivity, leading to water retention.'),
    (v_topic_id, 'Menotropins (hMG) consist of which hormones?', '["Pure FSH", "Pure LH", "FSH and LH in equal amounts", "hCG only"]', 2, 'hMG is purified from the urine of postmenopausal women.'),
    (v_topic_id, 'The "flare" phenomenon seen early in Leuprolide therapy is caused by:', '["Sudden drop in LH", "Initial stimulation of LH/FSH before downregulation", "Immune reaction", "Direct effect on bone marrow"]', 1, 'Initial GnRH agonism causes a surge in testosterone before suppression occurs.'),
    (v_topic_id, 'Which drug is given to prevent the Leuprolide flare in prostate cancer patients?', '["Finasteride", "Flutamide", "Spironolactone", "Tamoxifen"]', 1, 'Flutamide blocks the initial surge of testosterone from binding to receptors.'),
    (v_topic_id, 'Protirelin is a synthetic version of which hormone?', '["TRH", "TSH", "CRH", "GHRH"]', 0, 'It is used to test the TSH response.'),
    (v_topic_id, 'Which condition is treated with Pasireotide?', '["Acromegaly", "Cushing Disease", "Addison Disease", "SIADH"]', 1, 'Pasireotide is a somatostatin analog with high affinity for sst5 receptors (pituitary).'),
    (v_topic_id, 'A major side effect of Pasireotide is:', '["Hypoglycemia", "Hyperglycemia", "Hypokalemia", "Bradycardia"]', 1, 'It significantly inhibits insulin release.'),
    (v_topic_id, 'Which drug is used to differentiate between central and nephrogenic diabetes insipidus?', '["Vasopressin", "Desmopressin", "Lithium", "Furosemide"]', 1, 'Central responds to DDAVP (urine concentrates); Nephrogenic does not.'),
    (v_topic_id, 'Atosiban is a drug used to delay preterm labor (Tocolytic). What is its mechanism?', '["Beta-2 agonist", "Calcium channel blocker", "Oxytocin receptor antagonist", "Prostaglandin inhibitor"]', 2, 'Atosiban blocks oxytocin from inducing contractions.'),

    -- SECTION 2: THYROID & ANTITHYROID (36-70)
    (v_topic_id, 'The drug of choice for Thyroid Hormone Replacement is:', '["Liothyronine (T3)", "Levothyroxine (T4)", "Liotrix", "Dessicated Thyroid"]', 1, 'T4 is preferred due to its longer half-life and peripheral conversion to T3.'),
    (v_topic_id, 'What is the mechanism of action of Methimazole and Propylthiouracil (PTU)?', '["Inhibition of iodine uptake", "Inhibition of thyroid peroxidase (TPO)", "Blocking T4 to T3 conversion only", "Destruction of thyroid follicles"]', 1, 'They prevent the oxidation of iodide and the coupling of iodotyrosines.'),
    (v_topic_id, 'In addition to inhibiting TPO, Propylthiouracil (PTU) also does which of the following?', '["Blocks iodine uptake", "Blocks peripheral conversion of T4 to T3", "Inhibits TSH release", "Stimulates thyroid growth"]', 1, 'This makes PTU preferred in severe "Thyroid Storm."'),
    (v_topic_id, 'Which antithyroid drug is preferred in the FIRST trimester of pregnancy?', '["Methimazole", "Propylthiouracil (PTU)", "Radioactive Iodine", "Levothyroxine"]', 1, 'Methimazole is associated with birth defects (Aplasia Cutis); PTU is safer in the 1st trimester.'),
    (v_topic_id, 'Which antithyroid drug is preferred in the SECOND and THIRD trimesters?', '["Methimazole", "Propylthiouracil (PTU)", "Iodide", "Propranolol"]', 0, 'Methimazole is preferred after the 1st trimester due to PTU''s hepatotoxicity risk.'),
    (v_topic_id, 'The most serious side effect of Thionamides (Methimazole/PTU) is:', '["Hepatotoxicity", "Agranulocytosis", "Hypothyroidism", "Goiter"]', 1, 'Agranulocytosis (low WBC) is rare but life-threatening; patients must report sore throats.'),
    (v_topic_id, 'Which drug is used to treat the sympathetic symptoms (tachycardia, tremors) of Hyperthyroidism?', '["Levothyroxine", "Propranolol", "Methimazole", "Iodine"]', 1, 'Beta-blockers manage the "adrenal-like" symptoms of thyrotoxicosis.'),
    (v_topic_id, 'The "Wolff-Chaikoff effect" refers to:', '["Stimulation of thyroid by low iodine", "Reduction in thyroid hormone synthesis by high doses of iodide", "Increased conversion of T4 to T3", "Thyroid cancer caused by radiation"]', 1, 'High iodide transiently shuts down thyroid hormone production.'),
    (v_topic_id, 'Why is Lugol''s Solution (Iodide) given 10 days before a Thyroidectomy?', '["To stimulate hormone release", "To increase the size of the gland", "To decrease the vascularity of the thyroid gland", "To prevent TSH release"]', 2, 'Iodide shrinks the gland and makes it less likely to bleed during surgery.'),
    (v_topic_id, 'What is the mechanism of Radioactive Iodine (131-I)?', '["Inhibits TPO", "Destruction of thyroid parenchyma by beta particles", "Blocking TSH receptors", "Inducing the Wolff-Chaikoff effect"]', 1, 'Beta radiation causes localized tissue destruction.'),
    (v_topic_id, 'Radioactive Iodine is contraindicated in which group?', '["Elderly", "Patients with heart disease", "Pregnant women", "Graves disease patients"]', 2, 'It crosses the placenta and destroys the fetal thyroid.'),
    (v_topic_id, 'A patient on Levothyroxine develops palpitations and heat intolerance. What should be done?', '["Increase dose", "Decrease dose", "Add Propranolol", "Switch to Methimazole"]', 1, 'These are symptoms of iatrogenic hyperthyroidism (over-replacement).'),
    (v_topic_id, 'Which drug can interfere with the absorption of Levothyroxine?', '["Calcium carbonate", "Iron supplements", "PPIs", "All of the above"]', 3, 'T4 should be taken on an empty stomach to avoid interaction with minerals and acid levels.'),
    (v_topic_id, 'The half-life of Levothyroxine is approximately:', '["24 hours", "3 days", "7 days", "14 days"]', 2, 'The long half-life (7 days) allows for once-daily dosing.'),
    (v_topic_id, 'Which thyroid preparation is purely T3?', '["Levothyroxine", "Liothyronine", "Liotrix", "Armor Thyroid"]', 1, 'Liothyronine is T3; it is more potent but has a short half-life.'),
    (v_topic_id, 'What is a major disadvantage of using T3 (Liothyronine) for replacement?', '["It is not effective", "It causes more cardiotoxicity due to peaks", "It cannot be converted to T4", "It causes weight gain"]', 1, 'Short-acting T3 causes rapid spikes in hormone levels, stressing the heart.'),
    (v_topic_id, 'Amiodarone (an antiarrhythmic) can cause which thyroid problem?', '["Hyperthyroidism only", "Hypothyroidism only", "Both Hyperthyroidism and Hypothyroidism", "Thyroid cancer"]', 2, 'Amiodarone contains high iodine levels and can inhibit or stimulate the thyroid.'),
    (v_topic_id, 'Potassium Perchlorate and Thiocyanate inhibit the thyroid by:', '["Inhibiting TPO", "Competitive inhibition of the Sodium-Iodide Symporter (NIS)", "Blocking T3 receptors", "Inhibiting TSH"]', 1, 'They block the "trapping" of iodine by the thyroid.'),
    (v_topic_id, 'Why are perchlorate/thiocyanate rarely used today?', '["Ineffectiveness", "Aplastic anemia", "Nephrotoxicity", "Severe diarrhea"]', 1, 'They are associated with bone marrow suppression.'),
    (v_topic_id, 'Liothyronine is preferred over Levothyroxine in which specific scenario?', '["Chronic replacement", "Initial treatment of Myxedema Coma", "Mild hypothyroidism", "Pregnancy"]', 1, 'T3 is needed for a rapid onset of action in life-threatening myxedema.'),
    (v_topic_id, 'Ipodate and Iopanoic Acid are contrast agents that also:', '["Block TPO", "Inhibit peripheral T4 to T3 conversion", "Stimulate the thyroid", "Block TSH"]', 1, 'They are potent inhibitors of 5-deiodinase.'),
    (v_topic_id, 'Which drug is used to protect the thyroid gland from radiation (e.g., nuclear accident)?', '["Methimazole", "Potassium Iodide", "Levothyroxine", "Propylthiouracil"]', 1, 'KI saturates the gland with non-radioactive iodine, preventing uptake of 131-I.'),
    (v_topic_id, 'The most common side effect of Levothyroxine at correct doses is:', '["Weight gain", "No significant side effects", "Hair loss", "Dry skin"]', 1, 'If the dose is correct, T4 is physiologically identical to the body''s hormone.'),
    (v_topic_id, 'Propylthiouracil (PTU) carries a Black Box Warning for:', '["Severe Hepatotoxicity", "Renal failure", "Cardiotoxicity", "Aplastic anemia"]', 0, 'Methimazole is preferred because PTU can cause sudden fulminant liver failure.'),
    (v_topic_id, 'A patient with Graves disease is being prepared for surgery. Which drug will rapidly decrease thyroid hormone release?', '["PTU", "Methimazole", "Potassium Iodide", "Propranolol"]', 2, 'Iodides (Lugol''s) act rapidly by inhibiting release (Wolff-Chaikoff).'),
    (v_topic_id, 'Which lab test is most sensitive for monitoring thyroid replacement therapy?', '["Free T4", "Total T4", "TSH", "Reverse T3"]', 2, 'TSH reflects the overall thyroid status of the body via feedback.'),
    (v_topic_id, 'Lithium (used for Bipolar Disorder) can cause:', '["Hyperthyroidism", "Hypothyroidism", "Thyroid Storm", "Thyroiditis"]', 1, 'Lithium inhibits thyroid hormone release.'),
    (v_topic_id, 'Which drug blocks the conversion of T4 to T3 in the periphery?', '["Amiodarone", "Propranolol", "PTU", "All of the above"]', 3, 'High-dose Beta-blockers, PTU, and corticosteroids all inhibit 5-deiodinase.'),
    (v_topic_id, 'How long does it take for Methimazole to start lowering thyroid hormone levels?', '["2 hours", "2 days", "3-4 weeks", "3 months"]', 2, 'It only stops new synthesis; it doesn''t affect pre-stored hormone in the colloid.'),
    (v_topic_id, 'Treatment of Thyroid Storm include all EXCEPT:', '["IV Propranolol", "IV Propylthiouracil", "IV Levothyroxine", "Hydrocortisone"]', 2, 'T4 would worsen the condition; we use blockers only.'),
    (v_topic_id, 'What is the role of glucocorticoids in Thyroid Storm?', '["They stimulate the thyroid", "They inhibit peripheral T4 to T3 conversion", "They treat potential adrenal insufficiency", "B and C"]', 3, 'Steroids are part of the "multi-modal" blocking strategy.'),
    (v_topic_id, 'Which drug is used as an adjunct to radioactive iodine to improve its uptake?', '["Methimazole", "Thyrotropin alpha", "Levothyroxine", "Iodide"]', 1, 'TSH stimulates the gland to "suck in" more radioactive iodine.'),
    (v_topic_id, 'A patient on PTU presents with a fever and sore throat. What is the immediate next step?', '["Prescribe antibiotics", "Check CBC with differential", "Increase PTU dose", "Prescribe throat lozenges"]', 1, 'Rule out agranulocytosis immediately.'),
    (v_topic_id, 'The mechanism of goiter formation during thionamide therapy is:', '["Direct stimulation of gland", "Feedback increase in TSH due to low T4", "Iodine deficiency", "Inflammation"]', 1, 'Blocking synthesis lowers T4, which causes the pituitary to release more TSH.'),
    (v_topic_id, 'In myxedema coma, why is IV therapy preferred?', '["Patient is unconscious", "Severe gut edema may limit absorption", "Rapid onset is needed", "All of the above"]', 3, 'IV T4/T3 is critical in this emergency.');

    RAISE NOTICE 'SUCCESS: Endocrine Pharmacology MCQ Part 1 (1-70) registered.';
END $$;

COMMIT;
