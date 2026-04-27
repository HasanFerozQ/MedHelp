-- Migration: Endocrine Pharmacology Case Blocks (FIXED PART 4: 31-40)
-- Target: US MD / MBBS Year 2 Level (Reproductive)

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

    -- CASE 31: OCPs
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 31', 'A patient is prescribed combination OCPs.', 31)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Primary mechanism?', '["Kill sperm", "Suppress LH/FSH and inhibit ovulation", "None", "None"]', 1, 'Negative feedback on pituitary.',
    'Significant risk (smokers)?', '["Liver", "Thromboembolism (VTE)", "None", "None"]', 1, 'Increased clotting factors.',
    'Breastfeeding pill?', '["Combined", "Progestin-only (Minipill)", "None", "None"]', 1, 'Safe for lactation.';

    -- CASE 32: Tamoxifen
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 32', 'A patient with ER+ breast cancer takes Tamoxifen.', 32)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Breast vs Endometrium?', '["Antagonist breast; Agonist endometrium", "Agonist both", "None", "None"]', 0, 'Different tissue effects.',
    'Cancer risk?', '["Breast", "Endometrial cancer", "None", "None"]', 1, 'Agonist activity in uterus.',
    'Raloxifene uterus effect?', '["Agonist", "Antagonist", "None", "None"]', 1, 'Does not increase uterine cancer risk.';

    -- CASE 33: Clomiphene
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 33', 'A patient seeking to conceive takes Clomiphene.', 33)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Mechanism?', '["LH analog", "ER antagonist in hypothalamus/pituitary", "None", "None"]', 1, 'Blocks negative feedback.',
    'Indication?', '["Contraception", "Induction of ovulation", "None", "None"]', 1, 'Treats anovulation.',
    'Common complication?', '["Infertility", "Multiple gestations (Twins)", "None", "None"]', 1, 'Stimulates multiple follicles.';

    -- CASE 34: Leuprolide
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 34', 'A patient with prostate cancer is on continuous Leuprolide.', 34)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Continuous effect?', '["Stimulates", "Suppresses release via GnRH receptor down-regulation", "None", "None"]', 1, 'Desensitizes pituitary.',
    'Initial concern?', '["Tumor flare", "Liver failure", "None", "None"]', 0, 'Transient testosterone surge.',
    'Ovulation induction use?', '["Continuous", "Pulsatile", "None", "None"]', 1, 'Mimics natural physiology.';

    -- CASE 35: Finasteride
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 35', 'A 65-year-old male takes Finasteride for BPH.', 35)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Mechanism?', '["Alpha blocker", "5-alpha-reductase inhibitor", "None", "None"]', 1, 'Prevents conversion to DHT.',
    'Other indication?', '["Cancer", "Male pattern baldness", "None", "None"]', 1, 'Prevents hair loss.',
    'Time to effect?', '["1 day", "3-6 months", "None", "None"]', 1, 'Takes months to shrink tissue.';

    -- CASE 36: Flutamide
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 36', 'A patient takes Flutamide with Leuprolide.', 36)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Mechanism?', '["5-alpha inhibitor", "Competitive androgen receptor antagonist", "None", "None"]', 1, 'Blocks T/DHT binding.',
    'Why start with Leuprolide?', '["Potency", "To prevent tumor flare surge", "None", "None"]', 1, 'Protects receptors during surge.',
    'Side effect in men?', '["Hirsutism", "Gynecomastia", "None", "None"]', 1, 'Relative estrogen effect increase.';

    -- CASE 37: Mifepristone
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 37', 'A patient undergoes medical termination.', 37)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Mifepristone mechanism?', '["Prostaglandin", "Progesterone receptor antagonist", "None", "None"]', 1, 'Blocks progesterone support.',
    'Misoprostol role?', '["Infection", "Stimulate uterine contractions", "None", "None"]', 1, 'Expels contents.',
    'Other use?', '["Addison", "Hypercortisolism (Cushing)", "None", "None"]', 1, 'Glucocorticoid antagonist.';

    -- CASE 38: Danazol
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 38', 'A patient with endometriosis takes Danazol.', 38)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Mechanism?', '["Estrogen", "Synthetic androgen; weak agonist", "None", "None"]', 1, 'Suppresses axis.',
    'Virilization side effects?', '["Weight loss", "Yes (acne, hirsutism, voice change)", "None", "None"]', 1, 'Androgenic nature.',
    'Other condition?', '["Hereditary Angioedema", "Aplastic anemia", "None", "None"]', 0, 'Increases C1 inhibitor.';

    -- CASE 39: Anastrozole
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 39', 'A postmenopausal woman takes Anastrozole.', 39)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Mechanism?', '["ER antagonist", "Aromatase inhibitor", "None", "None"]', 1, 'Prevents estrogen synthesis.',
    'Postmenopausal advantage?', '["Cheap", "Superior efficacy; no endometrial cancer risk", "None", "None"]', 1, 'Peripheral aromatization focus.',
    'Skeletal side effect?', '["Spurs", "Increased risk of osteoporosis/fractures", "None", "None"]', 1, 'Lower estrogen accelerators.';

    -- CASE 40: Sildenafil
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 40', 'A 60-year-old male asks about Sildenafil.', 40)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Mechanism?', '["cAMP", "PDE-5 inhibitor; increases cGMP", "None", "None"]', 1, 'Smooth muscle relaxation.',
    'Nitrate risk?', '["Yes, life-threatening hypotension", "No", "None", "None"]', 0, 'Synergistic vasodilation.',
    'Other indication?', '["Heart failure", "Pulmonary Arterial Hypertension (PAH)", "None", "None"]', 1, 'Revatio brand.';

    RAISE NOTICE 'SUCCESS: Endocrine Pharmacology Cases (31-40) registered.';
END $$;

COMMIT;
