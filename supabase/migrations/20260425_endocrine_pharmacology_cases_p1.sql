-- Migration: Endocrine Pharmacology Case Blocks (FIXED PART 1: 1-10)
-- Target: US MD / MBBS Year 2 Level (Thyroid & Pituitary)

BEGIN;

-- Ensure the topic exists
INSERT INTO topics (title, slug, year_id, "order")
VALUES ('Endocrine Pharmacology', 'endocrine-pharmacology', 2, 6)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
    v_col_name TEXT;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'endocrine-pharmacology' LIMIT 1;

    -- Detect correct column name for case_questions
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'case_questions' AND column_name = 'case_study_id') THEN
        v_col_name := 'case_study_id';
    ELSE
        v_col_name := 'case_id';
    END IF;

    -- CASE 01: Hypothyroidism (Levothyroxine)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 01', 'A 35-year-old female presents with weight gain, cold intolerance, and a sluggish mood. Lab tests reveal an elevated TSH and low free T4. She is started on Levothyroxine.', 1)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the chemical composition of Levothyroxine?', '["Synthetic T3", "Synthetic T4", "Mixture of T3 and T4", "Desiccated thyroid gland"]', 1, 'Levothyroxine is synthetic T4, the preferred replacement therapy.',
    'Why is T4 preferred over T3 for chronic replacement therapy?', '["T4 is more potent", "T4 has a longer half-life", "T4 is cheaper", "None"]', 1, 'T4 provides a stable reservoir that the body converts to T3 as needed.',
    'A patient on Levothyroxine develops palpitations. What is the cause?', '["Hypersensitivity", "Over-replacement (Iatrogenic Hyperthyroidism)", "Drug interaction", "None"]', 1, 'Excessive dosing mimics hyperthyroidism symptoms.';

    -- CASE 02: Hyperthyroidism (Thionamides)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 02', 'A 28-year-old female presents with tremors, weight loss, and exophthalmos. Graves'' disease is diagnosed, and she is started on Methimazole.', 2)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of action of Methimazole?', '["Inhibits thyroid peroxidase", "Blocks TSH receptors", "Destroys thyroid follicles", "Inhibits T4 to T3 conversion"]', 0, 'It inhibits thyroid peroxidase, blocking iodine organification and coupling.',
    'A patient on Methimazole presents with high fever and severe sore throat. What must be ruled out?', '["Hepatotoxicity", "Agranulocytosis", "Hypothyroidism", "Aplastic anemia"]', 1, 'Agranulocytosis is a rare but critical side effect of thionamides.',
    'In the first trimester of pregnancy, which drug is preferred?', '["Levothyroxine", "Propylthiouracil (PTU)", "Radioactive Iodine", "Lithium"]', 1, 'PTU is preferred in the 1st trimester due to Methimazole''s risk of aplasia cutis.';

    -- CASE 03: Propylthiouracil (PTU)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 03', 'A patient with thyroid storm is treated with a combination of drugs, including high-dose Propylthiouracil (PTU).', 3)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What additional mechanism does PTU have that Methimazole lacks?', '["Blocks TSH release", "Inhibits peripheral deiodinase", "Binds iodine in the gut", "None"]', 1, 'PTU inhibits the peripheral conversion of T4 to the more active T3.',
    'What is the Black Box Warning associated with PTU?', '["Severe Liver Injury", "Kidney failure", "Heart failure", "None"]', 0, 'PTU is associated with a risk of fulminant hepatic failure.',
    'Why is PTU NOT the first-line choice outside of pregnancy?', '["Less effective", "Risk of severe hepatotoxicity", "Expensive", "None"]', 1, 'Methimazole has a better safety profile and longer half-life.';

    -- CASE 04: Radioactive Iodine
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 04', 'An elderly patient with Graves'' disease is scheduled for 131-I therapy.', 4)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'How does 131-I destroy thyroid tissue?', '["Alpha radiation", "Emission of beta particles", "Gamma radiation", "Chemical toxicity"]', 1, 'Beta particles cause local tissue destruction.',
    'What is the most common long-term consequence of 131-I?', '["Thyroid cancer", "Permanent Hypothyroidism", "Parathyroid damage", "Leukemia"]', 1, 'Most patients eventually require lifelong thyroid hormone replacement.',
    'Radioactive Iodine therapy is strictly contraindicated in:', '["Elderly", "Pregnant and breastfeeding women", "Heart disease", "None"]', 1, 'It can cross the placenta and destroy the fetal thyroid.';

    -- CASE 05: Potassium Iodide
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 05', 'A patient is given Lugol''s solution 10 days before an elective thyroidectomy.', 5)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the primary reason for giving iodide before surgery?', '["Increase T4", "Decrease gland size and vascularity", "Prevent anesthesia complications", "None"]', 1, 'Iodides make the gland firmer and less vascular.',
    'What is the Wolff-Chaikoff effect?', '["Increase in T4", "Transient inhibition of hormone synthesis by high iodine", "Autoimmune destruction", "None"]', 1, 'High levels of iodine temporarily shut down the gland.',
    'Why shouldn''t iodide be used as monotherapy?', '["Toxic", "The gland eventually escapes the inhibitory effect", "Hair loss", "None"]', 1, 'The thyroid eventually adapts and resumes hormone production.';

    -- CASE 06: Growth Hormone (Somatropin)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 06', 'A child with documented GH deficiency is started on Somatropin.', 6)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of Somatropin?', '["Stimulates bone", "Agonist at GH receptors, increasing IGF-1", "Blocks somatostatin", "None"]', 1, 'GH stimulates the liver to produce IGF-1.',
    'Which condition is an approved indication in adults?', '["Anti-aging", "GH deficiency after pituitary surgery", "Athletic performance", "None"]', 1, 'GH is only indicated for confirmed deficiency states.',
    'What is a metabolic side effect of GH therapy?', '["Hypoglycemia", "Hyperglycemia and Insulin resistance", "Hypocalcemia", "None"]', 1, 'GH is a counter-regulatory hormone that opposes insulin action.';

    -- CASE 07: Somatostatin Analogs (Octreotide)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 07', 'A 50-year-old male with acromegaly is treated with Octreotide.', 7)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of Octreotide in acromegaly?', '["GH receptor antagonist", "Somatostatin receptor agonist", "Dopamine agonist", "None"]', 1, 'It mimics endogenous somatostatin to inhibit GH secretion.',
    'Which common side effect is associated with Octreotide?', '["Peptic ulcers", "Cholelithiasis (gallstones)", "Liver failure", "None"]', 1, 'By inhibiting CCK release, it causes gallbladder stasis.',
    'Octreotide is also used for:', '["Constipation", "Secretory diarrhea", "GERD", "None"]', 1, 'It inhibits various GI secretory hormones.';

    -- CASE 08: GH Receptor Antagonists (Pegvisomant)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 08', 'An acromegaly patient who failed Octreotide is started on Pegvisomant.', 8)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'How does Pegvisomant differ from Octreotide?', '["Inhibits GH release", "Blocks the GH receptor in the periphery", "Dopamine agonist", "None"]', 1, 'It prevents GH from binding to its receptor.',
    'What is the primary marker used to monitor Pegvisomant?', '["Serum GH", "Serum IGF-1", "BUN", "Glucose"]', 1, 'IGF-1 levels will drop even if GH levels remain high.',
    'Why might GH levels increase during therapy?', '["Loss of negative feedback", "Drug contains GH", "Pituitary growth", "None"]', 0, 'Decreased IGF-1 reduces negative feedback on the pituitary.';

    -- CASE 09: Desmopressin
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 09', 'A patient with Central Diabetes Insipidus is started on DDAVP.', 9)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the drug of choice for Central DI?', '["Vasopressin", "Desmopressin (DDAVP)", "Conivaptan", "Thiazides"]', 1, 'DDAVP is a selective V2 receptor agonist.',
    'Advantage of Desmopressin over Vasopressin?', '["More vasoconstriction", "Selective V2 effect (water retention)", "Cheaper", "None"]', 1, 'Highly selective for water reabsorption.',
    'DDAVP is used in which hematologic condition?', '["Anemia", "vWF Disease Type 1", "Sickle cell", "None"]', 1, 'Stimulates release of Factor VIII and vWF.';

    -- CASE 10: Tolvaptan
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 10', 'A patient with SIADH has severe hyponatremia.', 10)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of Tolvaptan?', '["V1 agonist", "Selective V2 receptor antagonist", "ADH analog", "None"]', 1, 'Blocks ADH binding in the collecting duct.',
    'Primary indication?', '["Hypertension", "Euvolemic hyponatremia", "DI", "None"]', 1, 'Treats low sodium from excess water.',
    'Risk of rapid correction?', '["Heart failure", "Osmotic Demyelination Syndrome", "Seizures", "None"]', 1, 'Sodium must be raised slowly.';

    RAISE NOTICE 'SUCCESS: Endocrine Pharmacology Cases (1-10) registered.';
END $$;

COMMIT;
