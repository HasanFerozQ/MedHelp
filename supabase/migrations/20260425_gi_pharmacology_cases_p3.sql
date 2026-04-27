-- Migration: GI Pharmacology Case Blocks (FIXED PART 3: 21-30)
-- Target: US MD / MBBS Year 2 Level (Liver, Pancreas & Metabolism)

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

    -- CASE 21: Pancrelipase
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 21', 'A 10-year-old child with Cystic Fibrosis presents with steatorrhea and poor weight gain.', 21)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Pancrelipase contains a mixture of which enzymes?', '["Amylase, Lipase, and Protease", "Pepsin and HCl", "Gastrin and Secretin", "None"]', 0, 'It replaces the missing exocrine pancreatic enzymes.',
    'Why must Pancrelipase capsules be enteric-coated?', '["To prevent nausea", "To prevent inactivation by gastric acid", "To improve shelf life", "None"]', 1, 'Pancreatic enzymes are sensitive to acid.',
    'High doses of pancreatic enzymes in CF have been linked to:', '["Liver cirrhosis", "Fibrosing colonopathy", "Pulmonary fibrosis", "None"]', 1, 'High doses can lead to colonic strictures in children.';

    -- CASE 22: Ursodeoxycholic Acid (UDCA)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 22', 'A 45-year-old female with Primary Biliary Cholangitis (PBC) is started on UDCA.', 22)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of UDCA in liver disease?', '["Dissolves all types of stones", "Decreases cholesterol content of bile", "Inhibits bilirubin", "None"]', 1, 'It reduces the concentration of toxic bile acids.',
    'UDCA is also used in which gallbladder condition?', '["Acute cholecystitis", "Dissolution of cholesterol gallstones", "Gallbladder cancer", "None"]', 1, 'It only works on cholesterol stones.',
    'Which lab parameter is primarily monitored for response?', '["AST/ALT", "Alkaline Phosphatase (ALP)", "BUN", "Glucose"]', 1, 'ALP is the key marker of cholestasis in PBC.';

    -- CASE 23: Lactulose
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 23', 'A patient with liver cirrhosis presents with hepatic encephalopathy.', 23)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'How does Lactulose reduce ammonia levels in the blood?', '["Directly binds ammonia", "Convert NH3 to non-absorbable NH4+", "Inhibits protein digestion", "None"]', 1, 'Acidification of the gut traps ammonia.',
    'Besides ammonia trapping, what is the other mechanism?', '["Stimulant laxative", "Osmotic laxative", "Antacid", "None"]', 1, 'It speeds up gut transit.',
    'Which antibiotic is often added to Lactulose?', '["Amoxicillin", "Rifaximin", "Ciprofloxacin", "Metronidazole"]', 1, 'Rifaximin is poorly absorbed and targets the gut flora.';

    -- CASE 24: Orlistat
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 24', 'A patient seeking weight loss is prescribed Orlistat.', 24)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of action of Orlistat?', '["Suppresses appetite", "Inhibits gastric and pancreatic lipases", "Increases metabolic rate", "None"]', 1, 'It prevents the breakdown of dietary fats.',
    'Which side effect is a common complaint?', '["Constipation", "Steatorrhea", "Insomnia", "None"]', 1, 'Undigested fat in the stool leads to greasy stools.',
    'Patients on Orlistat should be monitored for deficiencies in:', '["Vitamin C", "Fat-soluble vitamins", "B-complex vitamins", "Iron"]', 1, 'Malabsorption of fat leads to malabsorption of fat-soluble vitamins.';

    -- CASE 25: Octreotide
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 25', 'A patient with esophageal varices bleeding is given Octreotide.', 25)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Octreotide is a long-acting analog of which hormone?', '["Glucagon", "Somatostatin", "Gastrin", "Insulin"]', 1, 'It mimics somatostatin.',
    'How does Octreotide help in acute variceal bleeding?', '["Systemic hypertension", "Splanchnic vasoconstriction", "Direct clotting", "None"]', 1, 'It allows for splanchnic vasoconstriction.',
    'Octreotide is also used to treat secretory diarrhea from:', '["VIPomas", "Giardia", "C. diff", "None"]', 0, 'It inhibits the secretion of various GI hormones.';

    -- CASE 26: Methylnaltrexone
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 26', 'A cancer patient on Morphine develops severe opioid-induced constipation.', 26)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of Methylnaltrexone?', '["Peripheral Mu-opioid receptor antagonist", "Central Mu agonist", "Bulk laxative", "None"]', 0, 'It blocks opioid receptors in the gut.',
    'Why does it NOT trigger withdrawal in the brain?', '["Partial agonist", "Quaternary ammonium compound (no BBB cross)", "None", "None"]', 1, 'The positive charge prevents it from entering the CNS.',
    'What is the primary indication?', '["Opioid overdose", "Opioid-induced constipation", "Addiction", "None"]', 1, 'Specifically for OIC.';

    -- CASE 27: Cholestyramine
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 27', 'A patient with ileal resection develops bile acid malabsorption diarrhea.', 27)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of Cholestyramine?', '["Inhibits lipase", "Bile Acid Sequestrant", "Antacid", "None"]', 1, 'It binds bile acids in the gut.',
    'What is a common GI side effect?', '["Diarrhea", "Constipation", "Heartburn", "None"]', 1, 'It is a resin that often causes constipation.',
    'Cholestyramine can interfere with the absorption of:', '["Digoxin and Warfarin", "Aspirin", "Vitamin C", "None"]', 0, 'It binds many negatively charged drugs.';

    -- CASE 28: Linaclotide
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 28', 'A woman with IBS-C is started on Linaclotide.', 28)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of Linaclotide?', '["Guanylate Cyclase-C agonist", "Chloride channel blocker", "Serotonin antagonist", "None"]', 0, 'It increases cGMP.',
    'What is the effect of increased fluid secretion?', '["Softer stool", "Constipation", "Vomiting", "None"]', 0, 'More water eases transit.',
    'Linaclotide also helps with:', '["Nausea", "Abdominal pain", "Bloody stools", "None"]', 1, 'It decreases pain-sensing nerve activity.';

    -- CASE 29: Alosetron
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 29', 'A patient with severe IBS-D is considered for Alosetron.', 29)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of Alosetron?', '["5-HT3 antagonist", "5-HT4 agonist", "D2 antagonist", "None"]', 0, 'It blocks serotonin in the gut.',
    'Why is it restricted to severe cases?', '["Ineffective in men", "Risk of Ischemic Colitis", "Liver failure", "None"]', 1, 'Risk of severe bowel ischemia.',
    'Where is Serotonin primarily produced?', '["Parietal cells", "EC cells", "G cells", "Chief cells"]', 1, 'Enterochromaffin cells store the majority.';

    -- CASE 30: Lubiprostone
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 30', 'A patient with chronic idiopathic constipation is started on Lubiprostone.', 30)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of Lubiprostone?', '["Chloride channel activator", "Osmotic", "Stimulant", "None"]', 0, 'It activates ClC-2 channels.',
    'What is a common side effect?', '["Headache", "Nausea", "Rash", "None"]', 1, 'Nausea is very common.',
    'Lubiprostone is a derivative of:', '["Morphine", "Prostaglandin E1", "Bile acid", "None"]', 1, 'It is a PGE1 derivative.';

    RAISE NOTICE 'SUCCESS: GI Pharmacology Cases (21-30) registered.';
END $$;

COMMIT;
