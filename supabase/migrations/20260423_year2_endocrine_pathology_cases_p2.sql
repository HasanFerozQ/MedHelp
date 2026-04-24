-- Migration: Year 2 - Endocrine Pathology Cases (PART 2: 11-30)
-- Date: 2026-04-23

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'endocrine-pathology' LIMIT 1;

    -- CASE 11: MEN 1
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bone Pain and Recurrent Ulcers', 'A 35-year-old female presents with severe bone pain and a history of multiple fractures. She also has a history of recurrent peptic ulcers. Labs show hypercalcemia and high PTH.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'If this is part of MEN 1, what other tumor should be screened for?', '["Pheochromocytoma", "Medullary thyroid carcinoma", "Pancreatic endocrine tumors (e.g., Gastrinoma)", "Follicular thyroid cancer"]', 2, 'MEN 1 (Wermer Syndrome) triad: Pituitary, Parathyroid, and Pancreatic tumors (3 Ps).'),
    (v_case_id, 'What is the gene mutation in MEN 1?', '["RET", "Menin", "p53", "VHL"]', 1, 'MEN1 is a tumor suppressor gene on chromosome 11 that encodes the protein menin.'),
    (v_case_id, 'The "psychic overtones" in hypercalcemia refer to?', '["Hallucinations", "Depression and lethargy", "Mania", "Seizures"]', 1, 'Hypercalcemia classically presents with depression, confusion, and fatigue.');

    -- CASE 12: Central Diabetes Insipidus
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Head Injury and Polyuria', 'A 22-year-old female presents with sudden onset of polyuria and polydipsia after a head injury. Her urine specific gravity is 1.002. Administration of ADH (Desmopressin) results in a 60% increase in urine osmolality.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Nephrogenic Diabetes Insipidus", "Central Diabetes Insipidus", "Primary Polydipsia", "SIADH"]', 1, 'Response to Desmopressin (>50% increase) confirms Central DI (lack of ADH production).'),
    (v_case_id, 'Where is ADH synthesized?', '["Posterior pituitary", "Anterior pituitary", "Hypothalamic nuclei (Supraoptic/Paraventricular)", "Adrenal cortex"]', 2, 'ADH is synthesized in the hypothalamus and stored/released by the posterior pituitary.'),
    (v_case_id, 'What would be the response to ADH if the diagnosis were Nephrogenic DI?', '["Significant increase in urine concentration", "Little to no change in urine concentration", "Decrease in urine osmolality", "Sudden drop in serum sodium"]', 1, 'Nephrogenic DI involves end-organ resistance to ADH; exogenous ADH will not concentrate the urine.');

    -- CASE 13: Diabetic Nephropathy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Proteinuria in Type 2 Diabetes', 'A 65-year-old male with long-standing Type 2 Diabetes is found to have protein in his urine (300 mg/day).', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the earliest histological change in the kidney in this patient?', '["Kimmelstiel-Wilson nodules", "Mesangial expansion and GBM thickening", "Fibrin caps", "Necrotizing papillitis"]', 1, 'Mesangial expansion and basement membrane thickening precede nodular sclerosis.'),
    (v_case_id, 'Which medication is first-line to slow the progression of this renal disease?', '["Beta-blockers", "ACE inhibitors", "Loop diuretics", "NSAIDs"]', 1, 'ACE inhibitors reduce intraglomerular pressure by dilating the efferent arteriole.'),
    (v_case_id, 'Kimmelstiel-Wilson nodules are pathognomonic for?', '["Hypertensive nephrosclerosis", "Diabetic nephropathy", "Amyloidosis", "Minimal change disease"]', 1, 'These are nodular hyaline deposits in the mesangium, specific to DM.');

    -- CASE 14: Medullary Thyroid Carcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cold Thyroid Nodule with Amyloid', 'A 42-year-old male presents with a "cold" thyroid nodule found on ultrasound. Fine-needle aspiration shows clusters of cells in an amyloid stroma.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Papillary carcinoma", "Follicular carcinoma", "Medullary carcinoma", "Anaplastic carcinoma"]', 2, 'Amyloid stroma (from calcitonin) is the classic finding for Medullary Thyroid Carcinoma.'),
    (v_case_id, 'From which cells does this tumor originate?', '["Follicular cells", "Parafollicular C-cells", "Fibroblasts", "Lymphocytes"]', 1, 'C-cells produce calcitonin, which forms the amyloid deposits.'),
    (v_case_id, 'What hormone is used as a tumor marker for recurrence?', '["Thyroglobulin", "Calcitonin", "PTH", "TSH"]', 1, 'Calcitonin levels track with tumor burden in MTC.');

    -- CASE 15: Sheehan Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Postpartum Failure to Lactate', 'A patient with a history of heavy postpartum hemorrhage fails to lactate and does not resume her menses. She reports severe fatigue and cold intolerance.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Pituitary Apoplexy", "Sheehan Syndrome", "Prolactinoma", "Empty Sella Syndrome"]', 1, 'Postpartum pituitary necrosis due to hypovolemic shock.'),
    (v_case_id, 'What is the underlying mechanism?', '["Autoimmune destruction", "Ischemic necrosis of the anterior pituitary", "Rupture of an aneurysm", "Metastatic spread"]', 1, 'The enlarged pregnancy pituitary is sensitive to low blood flow (ischemia).'),
    (v_case_id, 'Why is the pituitary susceptible to this during pregnancy?', '["The pituitary shrinks during pregnancy", "The pituitary doubles in size but blood supply does not increase proportionally", "Estrogen causes pituitary vasospasm", "Increased intracranial pressure"]', 1, 'Lactotroph hyperplasia during pregnancy makes the gland highly oxygen-dependent.');

    -- CASE 16: Zollinger-Ellison Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Persistent Peptic Ulcers and Steatorrhea', 'A 48-year-old male presents with persistent epigastric pain and multiple peptic ulcers, including one in the jejunum. He also complains of foul-smelling, fatty stools. A secretin stimulation test shows paradoxically increased gastrin levels.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Insulinoma", "Zollinger-Ellison Syndrome (Gastrinoma)", "Glucagonoma", "VIPoma"]', 1, 'Gastrinomas secrete excess gastrin, causing severe peptic ulcers and diarrhea.'),
    (v_case_id, 'Where is this tumor most commonly located?', '["Duodenum or Pancreas", "Stomach fundus", "Adrenal medulla", "Hepatic bile ducts"]', 0, 'The "Gastrinoma triangle" includes the duodenum and head of the pancreas.'),
    (v_case_id, 'Why does the patient have steatorrhea?', '["Inhibition of lipase by high gastric acid", "Destruction of pancreatic acinar cells", "Deficiency of bile salts", "Direct invasion of the small bowel"]', 0, 'Excess gastric acid lowers intestinal pH, inactivating pancreatic lipase.');

    -- CASE 17: Glucagonoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Migratory Rash and Weight Loss', 'A 50-year-old female presents with a new-onset "migratory" rash on her legs that is painful and crusting (necrolytic migratory erythema). She also has a history of mild diabetes and weight loss.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Somatostatinoma", "Glucagonoma", "Zinc deficiency", "Pemphigus vulgaris"]', 1, 'Necrolytic migratory erythema is the hallmark of a glucagonoma.'),
    (v_case_id, 'What would you expect to see on labs?', '["Hypoglycemia", "Elevated Serum Glucagon", "Elevated Serum Insulin", "Low Serum Gastrin"]', 1, 'Glucagonoma is a tumor of pancreatic alpha cells.'),
    (v_case_id, 'Which of the "D''s" is NOT associated with this condition?', '["Diabetes", "Dermatitis", "Depression", "Diarrhea"]', 3, 'Diarrhea is more typical of VIPoma; Glucagonoma features Diabetes, Dermatitis, DVT, and Depression.');

    -- CASE 18: De Quervain Thyroiditis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tender Thyroid Post-Viral Illness', 'A 30-year-old female presents with a very tender thyroid gland following a viral upper respiratory infection. She has symptoms of hyperthyroidism, but her ESR is markedly elevated.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Hashimoto Thyroiditis", "Subacute Granulomatous (De Quervain) Thyroiditis", "Graves Disease", "Subacute Lymphocytic Thyroiditis"]', 1, 'De Quervain is the only thyroiditis with significant gland tenderness/pain.'),
    (v_case_id, 'Histology would likely show?', '["Diffuse lymphocytic infiltrate", "Multinucleated giant cells and granulomatous inflammation", "Extensive fibrosis extending beyond the capsule", "Branching papillae with calcifications"]', 1, 'Granulomatous inflammation is the hallmark of subacute thyroiditis.'),
    (v_case_id, 'What is the typical clinical course?', '["Permanent hypothyroidism", "Permanent hyperthyroidism", "Transient hyperthyroidism followed by transient hypothyroidism, then recovery", "Progression to Riedel thyroiditis"]', 2, 'It is self-limiting; leakage of pre-formed hormone causes hyperthyroidism first.');

    -- CASE 19: Conn Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Weakness and Hypertension', 'A 62-year-old male with a history of hypertension presents with muscle weakness and polyuria. Labs show Na = 148 mEq/L (High), K = 2.8 mEq/L (Low), and a plasma aldosterone-to-renin ratio (ARR) of >30.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Renal artery stenosis", "Conn Syndrome (Primary Hyperaldosteronism)", "Cushing Syndrome", "Liddle Syndrome"]', 1, 'Hypokalemia + Hypertension + High Aldosterone/Low Renin = Conn Syndrome.'),
    (v_case_id, 'What is the expected Renin level?', '["High", "Low", "Normal", "Elevated but suppressed by ACE inhibitors"]', 1, 'High aldosterone feedback-inhibits renin production.'),
    (v_case_id, 'What acid-base disturbance is expected?', '["Metabolic acidosis", "Metabolic alkalosis", "Respiratory acidosis", "Normal pH"]', 1, 'Aldosterone promotes H+ secretion and HCO3- reabsorption.');

    -- CASE 20: Androgen Insensitivity Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Primary Amenorrhea and XY Karyotype', 'A 19-year-old female is evaluated for primary amenorrhea. Physical exam reveals she is tall, has no axillary or pubic hair, but has well-developed breasts. Lab testing shows a 46, XY karyotype.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Turner Syndrome", "Androgen Insensitivity Syndrome (AIS)", "5-alpha-reductase deficiency", "Klinefelter Syndrome"]', 1, 'AIS features female phenotype, XY genotype, and absent pubic/axillary hair.'),
    (v_case_id, 'Where are the gonads located in this patient?', '["Intra-abdominal or inguinal canal (Testes)", "Pelvis (Streak ovaries)", "Pelvis (Normal uterus and ovaries)", "Not present"]', 0, 'Testes develop normally but remain undescended.'),
    (v_case_id, 'Why does this patient have breasts?', '["Excess progesterone", "Peripheral conversion of excess testosterone to estrogen", "Normal ovarian function", "High levels of FSH"]', 1, 'Inability to use testosterone leads to excess substrate for aromatase.');

    -- CASE 21: Riedel Thyroiditis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hard Woody Neck Mass', 'A 55-year-old male presents with a hard, "woody" neck mass that is fixed to surrounding structures. He has recently developed difficulty breathing and a hoarse voice. Biopsy shows dense fibrous tissue with a chronic inflammatory infiltrate.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Anaplastic Thyroid Carcinoma", "Riedel Thyroiditis", "Hashimoto Thyroiditis", "Follicular Adenoma"]', 1, 'Woody, fixed thyroid fibrosis (IgG4-related) is Riedel.'),
    (v_case_id, 'This condition is often associated with which other systemic finding?', '["Retroperitoneal fibrosis", "Migratory thrombophlebitis", "Pheochromocytoma", "Thymoma"]', 0, 'Riedel is part of a systemic fibroinflammatory process.'),
    (v_case_id, 'Biopsy of Anaplastic Carcinoma (the main differential) would show?', '["Hurthle cells", "Highly pleomorphic, spindle, and giant cells", "Psammoma bodies", "Follicles invading the capsule"]', 1, 'Anaplastic is a rapidly growing, high-grade malignancy unlike the benign fibrosis of Riedel.');

    -- CASE 22: McCune-Albright Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Precocious Puberty and Cafe-au-Lait Spots', 'A 4-year-old girl presents with precocious puberty and large, irregular cafe-au-lait spots (Coast of Maine). X-rays show polyostotic fibrous dysplasia of the bones.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["McCune-Albright Syndrome", "Neurofibromatosis Type 1", "MEN 1", "Li-Fraumeni Syndrome"]', 0, 'Triad: Precocious puberty, Fibrous dysplasia, and Cafe-au-lait spots.'),
    (v_case_id, 'What is the molecular defect?', '["Mutation in the G-protein signaling (Gs alpha subunit)", "RET mutation", "NF1 gene mutation", "Loss of p53"]', 0, 'Constitutive activation of Gs protein alpha subunit.'),
    (v_case_id, 'Is this condition inherited?', '["Autosomal Dominant", "Autosomal Recessive", "X-linked", "Sporadic (Mosaicism)"]', 3, 'McCune-Albright is a somatic mutation (lethal if germline).');

    -- CASE 23: Thyroid Lymphoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Rapid Growth of Long-Standing Goiter', 'A 70-year-old female with a long history of a multinodular goiter suddenly develops rapid growth of the mass. Histology shows sheets of small blue cells.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Thyroid Lymphoma", "Medullary Carcinoma", "Follicular Carcinoma", "Papillary Carcinoma"]', 0, 'Rapid enlargement of a Hashimoto gland usually signals B-cell lymphoma.'),
    (v_case_id, 'This patient likely had a pre-existing history of?', '["Graves Disease", "Hashimoto Thyroiditis", "Iodine deficiency", "Radiation exposure"]', 1, 'Hashimoto is the major risk factor for primary thyroid lymphoma.'),
    (v_case_id, 'What is the treatment of choice?', '["Radical Surgery", "Radioactive Iodine", "Chemotherapy and Radiation", "Levothyroxine suppression"]', 2, 'Lymphomas respond better to non-surgical treatment.');

    -- CASE 24: Factitious Hyperthyroidism
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hyperthyroidism with Low RAIU and Low Thyroglobulin', 'A 45-year-old female presents with symptoms of hyperthyroidism. On physical exam, no goiter is felt. Radioactive iodine uptake (RAIU) is found to be very low. Serum thyroglobulin is also very low.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Graves Disease", "Factitious Hyperthyroidism (Exogenous T4)", "Struma Ovarii", "Subacute Thyroiditis"]', 1, 'Exogenous T4 suppresses the gland (low RAIU) and thyroglobulin production.'),
    (v_case_id, 'If the thyroglobulin was high, but RAIU was low, what would be the most likely diagnosis?', '["Graves", "Thyroiditis (leakage of pre-formed hormone)", "Toxic Multinodular Goiter", "Hot Nodule"]', 1, 'Thyroiditis involves destruction of thyroid tissue, leaking stored thyroglobulin.'),
    (v_case_id, 'Struma Ovarii is a specialized form of?', '["Teratoma", "Dysgerminoma", "Granulosa cell tumor", "Yolk sac tumor"]', 0, 'Teratomas containing predominantly thyroid tissue.');

    -- CASE 25: Pancreatic Alpha Cells / Glucagon
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hypoglycemia Rescue', 'A patient with a history of Type 1 Diabetes is found unconscious. Blood sugar is 30 mg/dL. He is given an injection of a hormone that increases blood sugar by stimulating hepatic glycogenolysis.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What hormone was likely administered?', '["Insulin", "Glucagon", "Somatostatin", "Epinephrine"]', 1, 'Glucagon is the standard emergency treatment for hypoglycemia when IV access is missing.'),
    (v_case_id, 'Which cells in the pancreas produce this hormone?', '["Beta cells", "Alpha cells", "Delta cells", "F cells"]', 1, 'Alpha cells secrete glucagon; Beta cells secrete insulin.'),
    (v_case_id, 'Somatostatin inhibits the release of?', '["Only Insulin", "Only Glucagon", "Both Insulin and Glucagon", "Only GH"]', 2, 'Delta cells secrete Somatostatin, which has paracrine inhibitory effects on alpha and beta cells.');

    -- CASE 26: Klinefelter Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tall Stature and Infertility', 'A 25-year-old male presents with infertility. He is tall with long extremities and has small, firm testes and gynecomastia.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Klinefelter Syndrome", "Kallmann Syndrome", "Turner Syndrome", "Fragile X Syndrome"]', 0, 'Klinefelter (47, XXY) features testicular dysgenesis and hypergonadotropic hypogonadism.'),
    (v_case_id, 'What is the characteristic karyotype?', '["45, XO", "47, XXY", "47, XYY", "46, XY"]', 1, 'Classic Klinefelter karyotype.'),
    (v_case_id, 'What is the status of FSH and Inhibin B?', '["Low FSH, High Inhibin", "High FSH, Low Inhibin", "Normal FSH, Normal Inhibin", "Low FSH, Low Inhibin"]', 1, 'Primary testicular failure leads to loss of negative feedback (High FSH).');

    -- CASE 27: Follicular Carcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Follicular Nodule with Capsular Invasion', 'A 38-year-old male presents with a "cold" thyroid nodule. Histology shows invasion of the fibrous capsule and blood vessels by follicular cells.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Follicular Adenoma", "Follicular Carcinoma", "Papillary Carcinoma", "Medullary Carcinoma"]', 1, 'Invasion of the capsule or vessels distinguishes carcinoma from adenoma.'),
    (v_case_id, 'How is this tumor best distinguished from Follicular Adenoma?', '["Presence of Orphan Annie eye nuclei", "Presence of amyloid", "Capsular or vascular invasion", "Increased mitotic rate only"]', 2, 'FNA cannot distinguish these; definitive diagnosis requires surgical pathology.'),
    (v_case_id, 'How does this tumor typically spread?', '["Lymphatics", "Hematogenously (Blood)", "Direct extension only", "Seeding into body cavities"]', 1, 'Follicular (and Medullary/Anaplastic) spread via blood; Papillary spreads via lymphatics.');

    -- CASE 28: Kallmann Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Delayed Puberty and Anosmia', 'A 12-year-old boy presents with anosmia (inability to smell) and delayed puberty. Labs show low GnRH, low FSH, and low Testosterone.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Klinefelter Syndrome", "Kallmann Syndrome", "Prader-Willi Syndrome", "Pituitary Adenoma"]', 1, 'The association of anosmia and hypogonadism is pathognomonic.'),
    (v_case_id, 'What is the embryological defect?', '["Failure of GnRH neurons to migrate from the olfactory placode", "Failure of the pituitary to form from Rathke''s pouch", "Autoimmune destruction of the hypothalamus", "Mutation in the androgen receptor"]', 0, 'KAL1 gene mutation affecting neuronal migration.'),
    (v_case_id, 'This condition is a form of?', '["Hypergonadotropic hypogonadism", "Hypogonadotropic hypogonadism", "Primary gonadal failure", "Peripheral androgen resistance"]', 1, 'It is secondary (hypogonadotropic) failure at the level of the hypothalamus.');

    -- CASE 29: Prolactinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Galactorrhea and Amenorrhea', 'A 35-year-old female presents with galactorrhea and amenorrhea. She is not pregnant.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Prolactinoma", "GH-secreting adenoma", "Craniopharyngioma", "Sheehan Syndrome"]', 0, 'Hyperprolactinemia inhibits GnRH, leading to amenorrhea and galactorrhea.'),
    (v_case_id, 'Which neurotransmitter inhibits the release of this hormone?', '["Serotonin", "Acetylcholine", "Dopamine", "Norepinephrine"]', 2, 'Dopamine is the primary prolactin-inhibiting factor (PIF).'),
    (v_case_id, 'What is the effect of high prolactin on GnRH?', '["Increases GnRH secretion", "Inhibits GnRH secretion", "No effect on GnRH", "Sensitizes the pituitary to GnRH"]', 1, 'Prolactin inhibits the pulsatile release of GnRH.');

    -- CASE 30: Graves Histology (Scalloping)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Scalloping of Colloid', 'A patient presents with weight loss, tachycardia, and heat intolerance. A thyroid biopsy shows clear "scalloping" of the colloid at the edges of the follicles.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Hashimoto Thyroiditis", "Graves Disease", "Multinodular Goiter", "Follicular Adenoma"]', 1, 'Scalloping is evidence of high thyroid cell activity in Graves.'),
    (v_case_id, 'What causes the "scalloping" appearance?', '["Apoptosis of follicular cells", "Active reabsorption of colloid by hyperactive follicular cells", "Fibrosis cutting into the follicles", "Inflammatory cell infiltration"]', 1, 'Follicular cells are intensely pulling colloid in for processing.'),
    (v_case_id, 'Which of the following is specific to Graves and NOT other causes of hyperthyroidism?', '["Tachycardia", "Heat intolerance", "Exophthalmos", "Tremor"]', 2, 'Exophthalmos and pretibial myxedema are autoimmune-specific features of Graves.');

    RAISE NOTICE 'SUCCESS: Endocrine Pathology Part 2 (11-30) registered.';
END $$;

COMMIT;
