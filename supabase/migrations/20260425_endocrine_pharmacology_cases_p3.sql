-- Migration: Endocrine Pharmacology Case Blocks (FIXED PART 3: 21-30)
-- Target: US MD / MBBS Year 2 Level (Adrenal & Bone)

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

    -- CASE 21: Prednisone
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 21', 'A patient is started on oral Prednisone.', 21)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Mechanism?', '["Inhibits Histamine", "Inhibits PLA2 and NF-kB", "Kills bacteria", "None"]', 1, 'Reduces leukotrienes and prostaglandins.',
    'Moon facies condition?', '["Addison", "Cushing", "Conn", "None"]', 1, 'Iatrogenic Cushing syndrome.',
    'Activation organ?', '["Kidney", "Liver", "Lung", "None"]', 1, 'Prednisone to Prednisolone via liver.';

    -- CASE 22: Addison Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 22', 'A patient is diagnosed with Primary Adrenal Insufficiency.', 22)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Cortisol replacement?', '["Dexamethasone", "Hydrocortisone", "Betamethasone", "None"]', 1, 'Mimics natural cortisol.',
    'Mineralocorticoid replacement?', '["Fludrocortisone", "Spironolactone", "Prednisolone", "None"]', 0, 'Manages salt/water balance.',
    'Stress strategy?', '["Stop", "Stress-dose steroids (double/triple)", "None", "None"]', 1, 'Prevent adrenal crisis.';

    -- CASE 23: Dexamethasone Test
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 23', 'Clinician uses Dexamethasone test.', 23)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Mineralocorticoid activity of Dex?', '["High", "Minimal to zero", "Same as cortisol", "None"]', 1, 'Purely glucocorticoid.',
    'Pituitary tumor response (high dose)?', '["No change", "Suppression of cortisol", "Increase", "None"]', 1, 'Retains some sensitivity.',
    'No suppression even at high dose?', '["Pituitary", "Ectopic source (Small cell lung cancer)", "None", "None"]', 1, 'Autonomous production.';

    -- CASE 24: Ketoconazole
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 24', 'A patient is started on Ketoconazole for Cushing.', 24)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Endocrine mechanism?', '["Blocks GH", "Inhibits CYP enzymes in steroidogenesis", "None", "None"]', 1, 'Inhibits adrenal steroid synthesis.',
    'Side effect in men?', '["Weight gain", "Gynecomastia", "Hirsutism", "None"]', 1, 'Anti-androgenic effect.',
    'Metyrapone target?', '["11-beta-hydroxylase", "21-hydroxylase", "None", "None"]', 0, 'Blocks final step of cortisol.';

    -- CASE 25: Spironolactone
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 25', 'A patient is started on Spironolactone.', 25)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Mechanism?', '["Blocks Na", "Aldosterone receptor antagonist", "None", "None"]', 1, 'Compete in distal tubule.',
    'More selective agent?', '["Amiloride", "Eplerenone", "None", "None"]', 1, 'Lower anti-androgenic effect.',
    'Electrolyte risk?', '["Hypokalemia", "Hyperkalemia", "None", "None"]', 1, 'Potassium retention.';

    -- CASE 26: Alendronate
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 26', 'A patient is started on Alendronate.', 26)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Mechanism?', '["Stimulate bone", "Inhibit osteoclast bone resorption", "None", "None"]', 1, 'Bind hydroxyapatite crystals.',
    'Why stay upright?', '["Absorption", "Prevent esophagitis", "None", "None"]', 1, 'Extremely irritating to mucosa.',
    'Rare serious complication?', '["Cancer", "Osteonecrosis of the Jaw", "None", "None"]', 1, 'Particularly after dental work.';

    -- CASE 27: Teriparatide
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 27', 'A patient is started on Teriparatide.', 27)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Teriparatide is?', '["Recombinant PTH", "Vitamin D", "None", "None"]', 0, 'Fragment of Parathyroid Hormone.',
    'Osteoporosis paradox?', '["Low doses", "Intermittent administration stimulates osteoblasts", "None", "None"]', 1, 'Pulsatile is anabolic.',
    'Duration limit?', '["6 months", "2 years", "Lifetime", "None"]', 1, 'Osteosarcoma risk in rats.';

    -- CASE 28: Denosumab
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 28', 'A patient is treated with Denosumab.', 28)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Mechanism?', '["Blocks PTH", "Monoclonal antibody against RANKL", "None", "None"]', 1, 'Prevents osteoclast maturation.',
    'Mimics endogenous?', '["Vitamin D", "Osteoprotegerin (OPG)", "None", "None"]', 1, 'OPG is natural decoy.',
    'Renal safety?', '["Yes, used in renal impairment", "No", "None", "None"]', 0, 'Not cleared by kidney.';

    -- CASE 29: Raloxifene
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 29', 'A patient is started on Raloxifene.', 29)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'SERM stands for?', '["Selective Estrogen Receptor Modulator", "None", "None", "None"]', 0, 'Tissue-specific agonist/antagonist.',
    'Bone vs Breast?', '["Agonist bone; Antagonist breast", "Antagonist both", "None", "None"]', 0, 'Strengthens bone and prevents cancer.',
    'Major risk?', '["Cancer", "Thromboembolism (VTE)", "None", "None"]', 1, 'Increases risk of clots.';

    -- CASE 30: Cinacalcet
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 30', 'A patient is given Cinacalcet.', 30)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Mechanism?', '["Vitamin D", "Activates Ca-sensing receptor (CaSR)", "None", "None"]', 1, 'Tricks parathyroid to suppress PTH.',
    'Active form of Vitamin D?', '["D3", "Calcitriol", "D2", "None"]', 1, '1,25-dihydroxy-D3.',
    'Phosphate binder?', '["Sevelamer", "Metformin", "None", "None"]', 0, 'Non-absorbable resin.';

    RAISE NOTICE 'SUCCESS: Endocrine Pharmacology Cases (21-30) registered.';
END $$;

COMMIT;
