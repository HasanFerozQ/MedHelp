-- Migration: Year 2 - Endocrine Pathology MCQ Bank (PART 4: 221-300)
-- Topics: Endocrine Hypertension, Bone Pathology, Pharmacology, Reproductive Endocrine
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

    -- 2. Insert MCQs (221-300)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    
    -- ENDOCRINE HYPERTENSION & RENAL PHYSIOLOGY
    (v_topic_id, 'A patient presents with severe hypertension, hypokalemia, and metabolic alkalosis. Both Renin and Aldosterone levels are severely depressed. Diagnosis?', '["Primary Hyperaldosteronism (Conn Syndrome)", "Secondary Hyperaldosteronism", "Liddle Syndrome", "Pheochromocytoma"]', 2, 'Liddle syndrome is an autosomal dominant gain-of-function mutation in the ENaC channel. It mimics hyperaldosteronism, but the feedback loop appropriately suppresses both renin and aldosterone.'),
    (v_topic_id, 'Which medication is the treatment of choice for Liddle Syndrome?', '["Spironolactone", "Amiloride", "Lisinopril", "Losartan"]', 1, 'Amiloride (or triamterene) directly blocks the ENaC channel. Spironolactone (aldosterone receptor antagonist) is ineffective because aldosterone is already low.'),
    (v_topic_id, 'A patient consumes large amounts of black licorice and develops hypertension and hypokalemia. What is the mechanism?', '["Direct stimulation of the aldosterone receptor", "Inhibition of 11-beta-hydroxysteroid dehydrogenase type 2", "Stimulation of renin release", "Inhibition of ACE"]', 1, 'Glycyrrhetinic acid in black licorice inhibits 11-beta-HSD2, preventing the conversion of cortisol to inactive cortisone in the kidney. Cortisol then binds the mineralocorticoid receptor, causing apparent mineralocorticoid excess.'),
    (v_topic_id, 'In Apparent Mineralocorticoid Excess (AME) syndrome, the urine ratio of which two metabolites is altered?', '["Cortisol to Cortisone", "Epinephrine to Norepinephrine", "Aldosterone to Renin", "VMA to HVA"]', 0, 'Because 11-beta-HSD2 is defective, cortisol is not converted to cortisone, leading to a high cortisol:cortisone ratio.'),
    
    -- BONE DISORDERS LABS
    (v_topic_id, 'What are the classic serum calcium, phosphate, ALP, and PTH levels in uncomplicated Osteoporosis?', '["Low Ca, Low PO4, High ALP, High PTH", "Normal Ca, Normal PO4, Normal ALP, Normal PTH", "High Ca, Low PO4, High ALP, High PTH", "Normal Ca, Normal PO4, High ALP, Normal PTH"]', 1, 'Osteoporosis involves loss of bone mass but the mineral composition (and serum labs) remains entirely normal.'),
    (v_topic_id, 'A patient with chronic renal failure has severe bone pain. Labs show Low Calcium, High Phosphate, and High PTH. Diagnosis?', '["Osteomalacia", "Osteitis Fibrosa Cystica (Renal Osteodystrophy)", "Paget Disease", "Osteopetrosis"]', 1, 'This is the classic lab profile for secondary hyperparathyroidism due to renal failure.'),
    (v_topic_id, 'What is the primary defect in Osteopetrosis (Marble Bone Disease)?', '["Failure of osteoblast matrix formation", "Defective osteoclast bone resorption", "Vitamin D deficiency", "Overactive parathyroid glands"]', 1, 'Osteoclasts lack carbonic anhydrase II, failing to create the acidic environment necessary to resorb bone. Bones become thick but brittle.'),
    (v_topic_id, 'What are the typical lab findings in Vitamin D deficiency (Osteomalacia/Rickets)?', '["Low Ca, Low PO4, High PTH, High ALP", "High Ca, Low PO4, Normal PTH, Normal ALP", "Normal Ca, Normal PO4, Normal PTH, Normal ALP", "High Ca, High PO4, Low PTH, Low ALP"]', 0, 'Low Vit D reduces gut absorption of Ca/PO4. Low Ca triggers high PTH. High PTH "trashes" PO4 (worsening hypophosphatemia) and tries to raise Ca, causing high ALP from osteoblast activity.'),

    -- REPRODUCTIVE ENDOCRINOLOGY
    (v_topic_id, 'A 16-year-old female presents with primary amenorrhea, absent breast development, and anosmia (lack of smell). Diagnosis?', '["Turner Syndrome", "Kallmann Syndrome", "Androgen Insensitivity Syndrome", "Müllerian Agenesis"]', 1, 'Kallmann syndrome is a failure of GnRH-producing neurons to migrate from the olfactory placode to the hypothalamus. Results in hypogonadotropic hypogonadism and anosmia.'),
    (v_topic_id, 'What are the expected GnRH, FSH, LH, and Estrogen levels in Kallmann Syndrome?', '["High GnRH, High FSH/LH, Low Estrogen", "Low GnRH, Low FSH/LH, Low Estrogen", "Low GnRH, High FSH/LH, High Estrogen", "Normal GnRH, Normal FSH/LH, Low Estrogen"]', 1, 'Because GnRH is absent, the entire downstream axis is depressed.'),
    (v_topic_id, 'A 46,XX patient presents with obesity, hirsutism, and oligomenorrhea. Ultrasound shows enlarged ovaries with multiple peripheral cysts. What is the classic LH:FSH ratio?', '["1:1", "1:2", "> 2:1", "1:4"]', 2, 'In Polycystic Ovary Syndrome (PCOS), high pulsatile GnRH leads to elevated LH relative to FSH (LH:FSH > 2). High LH drives ovarian theca cells to produce androgens.'),
    (v_topic_id, 'Which medication is often first-line to address the metabolic and ovulatory dysfunction in PCOS?', '["Clomiphene", "Metformin", "Spironolactone", "Oral Contraceptives"]', 1, 'Insulin resistance drives the pathology of PCOS; Metformin reduces insulin levels, decreasing androgen production and often restoring ovulation.'),
    (v_topic_id, 'A phenotypically normal female presents with primary amenorrhea. Karyotype is 46,XY. Testosterone levels are high. Ultrasound reveals absent uterus and fallopian tubes, with testes in the inguinal canal. Diagnosis?', '["Kallmann Syndrome", "Complete Androgen Insensitivity Syndrome", "5-alpha-reductase deficiency", "Turner Syndrome"]', 1, 'CAIS involves a defective androgen receptor. The testes produce Anti-Müllerian Hormone (degenerating internal female structures) and testosterone, which aromatizes to estrogen (causing female external phenotype and breast development).'),

    -- ENDOCRINE PHARMACOLOGY
    (v_topic_id, 'Which drug is a selective estrogen receptor modulator (SERM) used to treat osteoporosis but increases the risk of DVT and hot flashes?', '["Alendronate", "Raloxifene", "Teriparatide", "Denosumab"]', 1, 'Raloxifene is an estrogen agonist in bone (prevents osteoporosis) but an antagonist in breast/uterus. It carries a DVT risk similar to estrogen.'),
    (v_topic_id, 'What is the mechanism of action of Bisphosphonates (e.g., Alendronate)?', '["Stimulate osteoblasts", "Provide calcium substrate", "Bind hydroxyapatite and induce osteoclast apoptosis", "Inhibit RANKL"]', 2, 'Bisphosphonates are pyrophosphate analogs that accumulate in bone and poison osteoclasts when they attempt resorption.'),
    (v_topic_id, 'Which monoclonal antibody is used for osteoporosis by mimicking the action of Osteoprotegerin (OPG)?', '["Rituximab", "Denosumab", "Infliximab", "Omalizumab"]', 1, 'Denosumab binds directly to RANKL, preventing osteoclast activation.'),
    (v_topic_id, 'Teriparatide is used to treat severe osteoporosis. What is its mechanism?', '["Recombinant PTH analog given continuously", "Recombinant PTH analog given in pulsatile fashion", "Calcitonin analog", "Vitamin D analog"]', 1, 'Pulsatile (low, intermittent) administration of PTH stimulates osteoblasts to build bone. Continuous high PTH (as in hyperparathyroidism) destroys bone.'),
    (v_topic_id, 'Which side effect is classically associated with the use of Propylthiouracil (PTU) but LESS so with Methimazole?', '["Agranulocytosis", "Hepatotoxicity", "Aplasia cutis", "Rash"]', 1, 'Both cause agranulocytosis, but PTU has a black box warning for severe, potentially fatal hepatotoxicity.'),

    -- INTEGRATED PATHOLOGY AND CLINICAL SCENARIOS
    (v_topic_id, 'A patient with Hashimoto thyroiditis develops a rapidly enlarging, firm neck mass that is causing dysphagia and stridor. Diagnosis?', '["Papillary Carcinoma", "Follicular Carcinoma", "Primary Thyroid Lymphoma (Marginal Zone B-cell)", "Parathyroid Adenoma"]', 2, 'Hashimoto thyroiditis significantly increases the risk of primary B-cell lymphoma of the thyroid, which presents as a rapidly expanding mass.'),
    (v_topic_id, 'A neonate presents with jitteriness, seizures, and a blood glucose of 25 mg/dL. The mother has poorly controlled Type 2 Diabetes. What is the mechanism of the neonate''s condition?', '["Maternal insulin crossed the placenta", "Fetal islet cell hypoplasia", "Fetal beta cell hyperplasia due to maternal hyperglycemia", "Defective gluconeogenesis in the fetus"]', 2, 'Maternal glucose crosses the placenta, but maternal insulin does not. The fetal pancreas hypertrophies to produce massive insulin. At birth, the maternal glucose supply is cut off, but fetal insulin remains high, causing severe hypoglycemia.'),
    (v_topic_id, 'Which autoantibody is highly specific for Type 1 Diabetes Mellitus?', '["Anti-TPO", "Anti-Glutamic Acid Decarboxylase (Anti-GAD65)", "Anti-TSH Receptor", "Anti-dsDNA"]', 1, 'Anti-GAD65 and Islet Cell Antibodies (ICA) are classic markers for T1DM.'),
    (v_topic_id, 'A patient with a pituitary macroadenoma undergoes transsphenoidal resection. Post-operatively, they develop severe polyuria (10 L/day) and hypernatremia. Treatment?', '["Fluid restriction", "Demeclocycline", "Desmopressin (DDAVP)", "Hydrochlorothiazide"]', 2, 'Surgical trauma to the posterior pituitary stalk causes transient or permanent Central Diabetes Insipidus. DDAVP replaces the missing ADH.'),
    (v_topic_id, 'Which diuretic can be used to treat Nephrogenic Diabetes Insipidus?', '["Furosemide", "Spironolactone", "Hydrochlorothiazide", "Acetazolamide"]', 2, 'Thiazides cause mild volume depletion, which leads to a compensatory increase in proximal tubule sodium and water reabsorption, paradoxically reducing urine output in DI.'),
    (v_topic_id, 'A patient with Zollinger-Ellison Syndrome is scheduled for surgery. To localize the gastrinoma, which imaging study is most sensitive?', '["CT scan of abdomen", "Somatostatin receptor scintigraphy (Octreoscan)", "Ultrasound", "MRI of the brain"]', 1, 'Neuroendocrine tumors (like gastrinomas) heavily express somatostatin receptors, making Octreotide scans highly specific and sensitive for localization.'),
    (v_topic_id, 'What is the diagnostic criteria for Diabetes Mellitus based on HbA1c?', '["≥ 5.7%", "≥ 6.0%", "≥ 6.5%", "≥ 7.0%"]', 2, 'HbA1c ≥ 6.5% on two separate occasions (or one occasion with symptoms) is diagnostic. 5.7% - 6.4% is pre-diabetes.'),
    (v_topic_id, 'A diabetic patient is found to have microalbuminuria on a routine screening. Which medication should be initiated to protect the kidneys?', '["Amlodipine", "Metoprolol", "Lisinopril", "Hydrochlorothiazide"]', 2, 'ACE inhibitors (or ARBs) dilate the efferent arteriole, reducing glomerular hyperfiltration pressure, which slows the progression of diabetic nephropathy.'),
    (v_topic_id, 'Kimmelstiel-Wilson nodules are composed of?', '["Amyloid", "Immune complexes", "Hyaline/mesangial matrix material", "Fibrin"]', 2, 'They are nodular accumulations of mesangial matrix (hyaline) caused by nonenzymatic glycosylation of the basement membranes.'),
    (v_topic_id, 'A 30-year-old male presents with loss of libido and impotence. Labs reveal a markedly elevated Prolactin level. Which visual defect is most likely?', '["Binasal hemianopsia", "Bitemporal hemianopsia", "Right homonymous hemianopsia", "Central scotoma"]', 1, 'The mass effect of a prolactinoma (pituitary adenoma) compresses the optic chiasm, leading to bitemporal hemianopsia.');

    RAISE NOTICE 'SUCCESS: Endocrine Pathology MCQs Part 4 (221-300) registered.';
END $$;

COMMIT;
