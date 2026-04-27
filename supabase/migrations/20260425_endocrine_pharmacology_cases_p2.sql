-- Migration: Endocrine Pharmacology Case Blocks (FIXED PART 2: 11-20)
-- Target: US MD / MBBS Year 2 Level (Diabetes)

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

    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'case_questions' AND column_name = 'case_study_id') THEN
        v_col_name := 'case_study_id';
    ELSE
        v_col_name := 'case_id';
    END IF;

    -- CASE 11: Insulin Types
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 11', 'A 15-year-old male with Type 1 Diabetes is educated on insulin formulations.', 11)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Rapid acting insulin analog?', '["Insulin Glargine", "Insulin Lispro", "NPH Insulin", "Insulin Detemir"]', 1, 'Lispro, Aspart, and Glulisine are rapid acting.',
    'Peakless basal insulin?', '["Regular", "Insulin Glargine", "NPH", "Lispro"]', 1, 'Glargine and Degludec are peakless.',
    'Cellular mechanism of insulin?', '["Activates GPCR", "Activates Tyrosine Kinase receptor", "Binds DNA", "None"]', 1, 'Insulin receptor is a tyrosine kinase.';

    -- CASE 12: Metformin
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 12', 'A 50-year-old male is started on Metformin.', 12)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Primary mechanism of Metformin?', '["Stimulates insulin", "Inhibits gluconeogenesis", "Blocks absorption", "None"]', 1, 'It suppresses hepatic glucose production.',
    'Common side effect?', '["Weight gain", "GI distress", "Hypoglycemia", "Rash"]', 1, 'GI side effects are very common.',
    'Metformin fatal risk?', '["Lactic Acidosis", "Ketoacidosis", "Liver failure", "None"]', 0, 'Risk in renal failure patients.';

    -- CASE 13: Sulfonylureas
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 13', 'A patient with Type 2 Diabetes is started on Glipizide.', 13)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Mechanism of Sulfonylureas?', '["Sensitize receptors", "Close K+ channels in beta cells", "Open K+ channels", "None"]', 1, 'Closing K+ channels triggers insulin release.',
    'Most significant risk?', '["Weight loss", "Hypoglycemia", "Diarrhea", "None"]', 1, 'High risk of low blood sugar.',
    'Second-generation sulfonylurea?', '["Chlorpropamide", "Glimepiride", "Tolbutamide", "None"]', 1, 'Glimepiride is a 2nd/3rd gen.';

    -- CASE 14: Meglitinides
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 14', 'A patient is prescribed Repaglinide.', 14)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Difference from Sulfonylureas?', '["Mechanism", "Faster onset and shorter duration", "Longer acting", "None"]', 1, 'Used for post-prandial control.',
    'Mechanism of action?', '["Blocks SGLT2", "Closes ATP-dependent K+ channels", "None", "None"]', 1, 'Same K+ channel closure mechanism.',
    'Instructions?', '["Daily at night", "15-30 minutes before a meal", "After exercise", "None"]', 1, 'Take with meals to prevent hypoglycemia.';

    -- CASE 15: TZDs
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 15', 'A patient is started on Pioglitazone.', 15)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Mechanism of TZDs?', '["Blocks lipase", "Agonist at PPAR-gamma", "Inhibitor", "None"]', 1, 'Increases insulin sensitivity.',
    'Significant side effect?', '["Dehydration", "Fluid retention and Edema", "Tachycardia", "None"]', 1, 'Limits use in heart failure.',
    'Pioglitazone cancer risk?', '["Bladder cancer", "Colon cancer", "Thyroid", "None"]', 0, 'Small risk of bladder malignancy.';

    -- CASE 16: Alpha-Glucosidase Inhibitors
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 16', 'A patient is given Acarbose.', 16)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Mechanism of Acarbose?', '["Inhibits amylase", "Inhibits brush-border alpha-glucosidase", "Stimulates insulin", "None"]', 1, 'Delays carbohydrate digestion.',
    'Primary side effect?', '["Hypoglycemia", "Flatulence and bloating", "Liver failure", "None"]', 1, 'Bacterial fermentation in colon.',
    'Rescue glucose choice?', '["Sucrose", "Pure glucose (Dextrose)", "Starch", "None"]', 1, 'Disaccharide absorption is blocked.';

    -- CASE 17: Pramlintide
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 17', 'A patient is started on Pramlintide.', 17)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Pramlintide is an analog of?', '["Glucagon", "Amylin", "Somatostatin", "None"]', 1, 'Amylin is co-secreted with insulin.',
    'Mechanism?', '["Increases insulin", "Decreases glucagon and slows gastric emptying", "None", "None"]', 1, 'Slowing digestion increases satiety.',
    'Patient type?', '["Type 1", "Type 2", "Both", "None"]', 2, 'Approved for both.';

    -- CASE 18: Glucagon
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 18', 'A diabetic patient with severe hypoglycemia is given Glucagon.', 18)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Emergency drug?', '["Insulin", "Glucagon", "Steroid", "None"]', 1, 'Raises blood sugar quickly.',
    'Primary mechanism?', '["Hepatic glycogenolysis", "Lipolysis", "Muscle glycogenolysis", "None"]', 0, 'Breakdown of liver glycogen.',
    'Glucagon antidote use?', '["Digoxin", "Beta-blocker overdose", "ACE inhibitor", "None"]', 1, 'Increases cardiac cAMP.';

    -- CASE 19: Sitagliptin
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 19', 'A patient is prescribed Sitagliptin.', 19)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Incretin effect?', '["Oral > IV insulin response", "Direct stimulation", "None", "None"]', 0, 'Gut hormones amplify response.',
    'Sitagliptin mechanism?', '["Alpha inhibitor", "DPP-4 inhibitor", "HMG inhibitor", "None"]', 1, 'Prevents GLP-1 breakdown.',
    'Risk reported?', '["Liver", "Acute Pancreatitis", "Kidney", "None"]', 1, 'Incretin-based therapies risk.';

    -- CASE 20: SGLT2 Inhibitors
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 20', 'A patient is started on Empagliflozin.', 20)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'SGLT2 mechanism?', '["Block gut", "Inhibit proximal tubule glucose reabsorption", "None", "None"]', 1, 'Causes glycosuria.',
    'Major benefit?', '["Decrease HF and renal risk", "Increase weight", "Lower rate", "None"]', 0, 'Cardio-renal protection.',
    'Common side effect?', '["Hyperkalemia", "Yeast infections/UTIs", "Constipation", "None"]', 1, 'Glucose in urine fosters infection.';

    RAISE NOTICE 'SUCCESS: Endocrine Pharmacology Cases (11-20) registered.';
END $$;

COMMIT;
