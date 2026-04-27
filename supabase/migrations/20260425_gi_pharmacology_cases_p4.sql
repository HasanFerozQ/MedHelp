-- Migration: GI Pharmacology Case Blocks (FIXED PART 4: 31-40)
-- Target: US MD / MBBS Year 2 Level (Advanced Integration)

BEGIN;

-- Ensure the topic exists
INSERT INTO topics (title, slug, year_id, "order")
VALUES ('GI Pharmacology', 'gi-pharmacology', 2, 5)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
    v_col_name TEXT;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'gi-pharmacology' LIMIT 1;

    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'case_questions' AND column_name = 'case_study_id') THEN
        v_col_name := 'case_study_id';
    ELSE
        v_col_name := 'case_id';
    END IF;

    -- CASE 31: Telotristat Ethyl
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 31', 'A patient with metastatic carcinoid syndrome has refractory diarrhea.', 31)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of Telotristat ethyl?', '["Inhibits Tryptophan Hydroxylase", "Blocks 5-HT3", "Somatostatin analog", "None"]', 0, 'It inhibits the rate-limiting enzyme in serotonin synthesis.',
    'Which amino acid is the precursor for serotonin?', '["Tyrosine", "Tryptophan", "Phenylalanine", "Histidine"]', 1, 'Serotonin is synthesized from tryptophan.',
    'Why is reducing serotonin beneficial?', '["Treats cancer", "Reduces massive GI motility", "Improves sleep", "None"]', 1, 'Serotonin is the primary mediator of the diarrhea.';

    -- CASE 32: Teduglutide
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 32', 'A patient with Short Bowel Syndrome is started on Teduglutide.', 32)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Teduglutide is an analog of which hormone?', '["GLP-2", "Insulin", "Ghrelin", "None"]', 0, 'GLP-2 promotes intestinal growth.',
    'What is the primary effect?', '["Increases transit time", "Promotes mucosal growth", "Inhibits enzymes", "None"]', 1, 'It increases absorptive surface area.',
    'What is a major safety concern?', '["Liver failure", "Promotion of tumor growth", "Kidney stones", "None"]', 1, 'It can accelerate the growth of malignancies.';

    -- CASE 33: Prucalopride
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 33', 'A patient with chronic idiopathic constipation takes Prucalopride.', 33)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of Prucalopride?', '["5-HT4 agonist", "D2 antagonist", "Guanylate cyclase agonist", "None"]', 0, 'It stimulates 5-HT4 receptors.',
    'Compared to older prokinetics, it is safer because:', '["No BBB cross", "No QT prolongation", "Liquid", "None"]', 1, 'Cardiotoxicity was the issue with older ones.',
    'Which neurotransmitter release is increased?', '["Dopamine", "Acetylcholine", "GABA", "None"]', 1, '5-HT4 receptors facilitate ACh release.';

    -- CASE 34: Eluxadoline
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 34', 'A patient with IBS-D is prescribed Eluxadoline.', 34)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Eluxadoline effect at Mu receptor?', '["Mu agonist", "Mu antagonist", "Delta agonist", "None"]', 0, 'It is a Mu-agonist.',
    'What is its effect at the Delta receptor?', '["DOR agonist", "DOR antagonist", "Mu antagonist", "None"]', 1, 'It is a Delta-antagonist.',
    'Contraindication due to pancreatitis risk?', '["Diabetics", "Patients without a gallbladder", "Smokers", "None"]', 1, 'Higher risk of Sphincter of Oddi spasm.';

    -- CASE 35: Obeticholic Acid
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 35', 'A PBC patient is started on Obeticholic acid.', 35)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of Obeticholic acid?', '["Bile acid sequestrant", "FXR agonist", "PPAR agonist", "None"]', 1, 'It is a nuclear receptor agonist.',
    'Common dose-limiting side effect?', '["Nausea", "Pruritus", "Headache", "None"]', 1, 'Itching is very common.',
    'Effect on bile acid synthesis?', '["Increases", "Suppresses", "No effect", "None"]', 1, 'It provides negative feedback.';

    -- CASE 36: Doxylamine/Pyridoxine
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 36', 'A pregnant woman has severe morning sickness.', 36)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'First-line pharmacotherapy for NVP?', '["Ondansetron", "Doxylamine and B6", "Metoclopramide", "None"]', 1, 'Best safety data.',
    'Drug class of Doxylamine?', '["H1 antihistamine", "PPI", "D2 antagonist", "None"]', 0, 'It is a first-gen antihistamine.',
    'Why is Pyridoxine included?', '["Anemia", "Independent anti-nausea effect", "Taste", "None"]', 1, 'B6 reduces nausea.';

    -- CASE 37: Lactase
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 37', 'A patient with lactose intolerance eats dairy.', 37)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Mechanism of lactase supplements?', '["Blocks receptors", "Exogenous enzyme", "Antacid", "None"]', 1, 'Breaks down lactose.',
    'Type of diarrhea?', '["Secretory", "Osmotic", "Inflammatory", "None"]', 1, 'Undigested sugar is osmotic.',
    'Where is endogenous lactase?', '["Stomach", "Brush border", "Pancreas", "None"]', 1, 'Small intestinal villi.';

    -- CASE 38: Simethicone
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 38', 'A patient complains of trapped gas.', 38)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of Simethicone?', '["Inhibits gas", "Alters surface tension", "Antacid", "None"]', 1, 'Coalesces bubbles.',
    'Is it absorbed?', '["Yes", "No (inert)", "Children only", "None"]', 1, 'It stays in the gut.',
    'Does it reduce gas volume?', '["Yes", "No", "None", "None"]', 1, 'Just changes physical form.';

    -- CASE 39: UDCA in Pregnancy
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 39', 'A pregnant woman has Intrahepatic Cholestasis of Pregnancy.', 39)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'First-line treatment for ICP?', '["UDCA", "Cholestyramine", "Antihistamine", "None"]', 0, 'UDCA is first-line.',
    'Major risk to the fetus?', '["Limb defects", "Stillbirth", "Blindness", "None"]', 1, 'Bile acids are toxic.',
    'Other drug that can be added?', '["Lactulose", "Cholestyramine", "Sevelamer", "None"]', 1, 'Resins can help.';

    -- CASE 40: Hormones
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 40', 'Researcher studying GI hormones.', 40)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Strongest stimulant of acid?', '["Secretin", "Gastrin", "CCK", "None"]', 1, 'Gastrin is strongest.',
    'Primary physiological brake?', '["Gastrin", "Somatostatin", "Motilin", "None"]', 1, 'Somatostatin inhibits all.',
    'MMC stimulator / Erythromycin target?', '["CCK", "Motilin", "Secretin", "None"]', 1, 'Erythromycin is a motilin agonist.';

    RAISE NOTICE 'SUCCESS: GI Pharmacology Cases (31-40) registered.';
END $$;

COMMIT;
