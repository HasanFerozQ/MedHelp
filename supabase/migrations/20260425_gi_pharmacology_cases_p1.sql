-- Migration: GI Pharmacology Case Blocks (FIXED PART 1: 1-10)
-- Target: US MD / MBBS Year 2 Level (Acid-Base & Upper GI)

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

    -- Detect correct column name for case_questions
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'case_questions' AND column_name = 'case_study_id') THEN
        v_col_name := 'case_study_id';
    ELSE
        v_col_name := 'case_id';
    END IF;

    -- CASE 01: PPIs and GERD
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 01', 'A 45-year-old male presents with persistent "heartburn" and a sour taste in his mouth, especially after large meals. He has been taking OTC antacids with little relief. Endoscopy shows signs of erosive esophagitis.', 1)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of action of Omeprazole, the likely first-line treatment?', '["Reversible H2 receptor blockade", "Irreversible inhibition of H+/K+ ATPase", "Neutralization of gastric acid", "Stimulation of bicarbonate secretion"]', 1, 'PPIs form a covalent disulfide bond with the proton pump, irreversibly inhibiting it.',
    'PPIs are administered as prodrugs. Where are they converted to their active sulfenamide form?', '["In the blood stream", "In the acidic environment of the canaliculi of parietal cells", "In the liver", "In the duodenum"]', 1, 'The acidic environment triggers the conversion, focusing the effect on the parietal cells.',
    'Long-term PPI use is associated with a decreased absorption of which mineral, potentially leading to fractures?', '["Sodium", "Magnesium and Calcium", "Potassium", "Zinc"]', 1, 'Decreased acidity reduces the absorption of magnesium and calcium, increasing the risk of osteoporosis.';

    -- CASE 02: H2 Blockers
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 02', 'A 30-year-old female presents with epigastric pain that improves after eating. She is started on Famotidine to manage her symptoms.', 2)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Which hormone-induced acid secretion is directly inhibited by Famotidine?', '["Gastrin", "Histamine", "Acetylcholine", "Somatostatin"]', 1, 'Famotidine is a competitive antagonist of the H2 receptor.',
    'Which older H2 blocker is notorious for causing gynecomastia and drug-drug interactions via CYP450 inhibition?', '["Ranitidine", "Cimetidine", "Nizatidine", "Famotidine"]', 1, 'Cimetidine has anti-androgenic effects and is a potent CYP inhibitor.',
    'H2 blockers primarily reduce acid secretion that occurs during:', '["The cephalic phase", "Nocturnal (basal) periods", "The peak of a meal", "None"]', 1, 'H2 blockers are particularly effective at reducing basal and nocturnal acid secretion.';

    -- CASE 03: Peptic Ulcer Disease (H. pylori)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 03', 'A 50-year-old male with a history of chronic NSAID use presents with severe epigastric pain. A urea breath test is positive for H. pylori.', 3)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the standard "Triple Therapy" for H. pylori eradication?', '["PPI + Amoxicillin + Clarithromycin", "PPI + Metronidazole + Tetracycline", "H2 Blocker + Aspirin", "None"]', 0, 'The classic triple therapy includes a PPI and two antibiotics.',
    'If the patient has a penicillin allergy, which antibiotic is typically substituted for Amoxicillin?', '["Ciprofloxacin", "Metronidazole", "Doxycycline", "Vancomycin"]', 1, 'Metronidazole is the standard substitute in penicillin-allergic patients.',
    'Which drug class is preferred for healing an ulcer caused specifically by chronic NSAID use?', '["PPIs", "H2 blockers", "Antacids", "Sucralfate"]', 0, 'PPIs are superior for healing and preventing NSAID-induced ulcers.';

    -- CASE 04: Misoprostol
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 04', 'An elderly woman with severe rheumatoid arthritis requires high-dose NSAIDs but has a history of GI bleeds. Misoprostol is considered for prophylaxis.', 4)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Misoprostol is an analog of which endogenous substance?', '["Prostaglandin E1", "Thromboxane", "Leukotriene", "Histamine"]', 0, 'It replaces the protective prostaglandins inhibited by NSAIDs.',
    'What is the primary mechanism of Misoprostol in the stomach?', '["Inhibits gastrin", "Increases mucus and bicarbonate secretion", "Neutralizes acid", "None"]', 1, 'It provides cytoprotection by increasing the mucosal barrier.',
    'In which patient population is Misoprostol strictly contraindicated?', '["Patients with hypertension", "Pregnant women", "Children", "Elderly"]', 1, 'It is an abortifacient as it stimulates uterine contractions (PGE1 effect).';

    -- CASE 05: Sucralfate
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 05', 'A patient with multiple stress-induced ulcers is given Sucralfate. The nurse instructs the patient to take it on an empty stomach.', 5)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of Sucralfate?', '["Neutralizes acid", "Forms a physical paste that binds to ulcer craters", "Inhibits proton pumps", "Blocks H2 receptors"]', 1, 'In an acidic environment, it polymerizes into a sticky paste that coats ulcers.',
    'Sucralfate requires which condition to be effective?', '["Alkaline pH", "Acidic pH", "Presence of bile", "None"]', 1, 'It needs acid to activate and polymerize.',
    'Which common side effect is associated with Sucralfate use?', '["Diarrhea", "Constipation", "Tachycardia", "Rash"]', 1, 'The aluminum component can cause constipation.';

    -- CASE 06: Antacids
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 06', 'A patient takes large amounts of Magnesium hydroxide and Aluminum hydroxide for dyspepsia.', 6)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the primary GI side effect of Magnesium hydroxide (Milk of Magnesia)?', '["Constipation", "Diarrhea", "Belching", "None"]', 1, 'Magnesium = Must go (diarrhea).',
    'What is the primary GI side effect of Aluminum hydroxide?', '["Diarrhea", "Constipation", "Nausea", "None"]', 1, 'Aluminum = Aliminimum stool (constipation).',
    'Why are these two often combined in commercial preparations (e.g., Maalox)?', '["To increase potency", "To offset each other''s bowel side effects", "To improve taste", "None"]', 1, 'The laxative effect of Mg offsets the constipating effect of Al.';

    -- CASE 07: Metoclopramide
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 07', 'A diabetic patient presents with early satiety and bloating (Gastroparesis). Metoclopramide is prescribed.', 7)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of Metoclopramide?', '["D2 receptor antagonist", "D2 receptor agonist", "H2 blocker", "PPI"]', 0, 'It antagonizes dopamine receptors, which normally inhibit ACh release in the gut.',
    'Metoclopramide increases the tone of which structure?', '["Pyloric sphincter", "Lower Esophageal Sphincter (LES)", "Gallbladder", "None"]', 1, 'It increases LES tone and promotes gastric emptying.',
    'Which significant side effect can occur due to central dopamine blockade?', '["Liver failure", "Extrapyramidal symptoms (e.g., Parkinsonism, Tardive Dyskinesia)", "Blindness", "None"]', 1, 'It crosses the BBB and can cause movement disorders.';

    -- CASE 08: Ondansetron
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 08', 'A cancer patient experiences severe nausea and vomiting following cisplatin chemotherapy.', 8)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of Ondansetron?', '["D2 antagonist", "5-HT3 receptor antagonist", "NK1 antagonist", "M1 antagonist"]', 1, 'It blocks serotonin receptors in the CTZ and solitary tract nucleus.',
    'Which ECG abnormality is a known risk with high-dose Ondansetron?', '["Shortened PR interval", "QT prolongation", "ST elevation", "None"]', 1, 'It can predispose to Torsades de Pointes.',
    'Ondansetron is particularly effective for which type of vomiting?', '["Motion sickness", "Chemotherapy-induced and post-operative", "Morning sickness", "None"]', 1, 'It is the gold standard for chemo-induced nausea.';

    -- CASE 09: Aprepitant
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 09', 'A patient undergoing highly emetogenic chemotherapy is given a regimen containing Ondansetron, Dexamethasone, and Aprepitant.', 9)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Aprepitant belongs to which class of antiemetics?', '["Neurokinin-1 (NK1) receptor antagonists", "Cannabinoids", "Steroids", "None"]', 0, 'It blocks the binding of substance P in the brainstem.',
    'What is the primary benefit of adding Aprepitant to an antiemetic regimen?', '["Prevents acute vomiting", "Prevents delayed vomiting (24-72 hours post-chemo)", "Increases appetite", "None"]', 1, 'NK1 antagonists are superior for delayed phase emesis.',
    'Aprepitant is a substrate and inducer/inhibitor of which enzyme system?', '["Renal tubules", "CYP3A4", "MAO-A", "None"]', 1, 'It has significant drug-drug interactions via CYP3A4.';

    -- CASE 10: Scopolamine
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 10', 'A person planning a cruise is worried about motion sickness and is prescribed a transdermal patch.', 10)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the drug in the patch and its mechanism?', '["Scopolamine; Muscarinic (M1) antagonist", "Meclizine; H1 antagonist", "Ondansetron; 5-HT3 antagonist", "None"]', 0, 'Scopolamine blocks muscarinic receptors in the vestibular system.',
    'Where is the best anatomical location to apply this patch?', '["Abdomen", "Postauricular (behind the ear)", "Upper arm", "None"]', 1, 'Behind the ear allows for optimal absorption and proximity to the vestibular system.',
    'Which side effect is most likely to occur?', '["Diarrhea", "Dry mouth and blurred vision", "Bradycardia", "None"]', 1, 'Classic anticholinergic side effects.';

    RAISE NOTICE 'SUCCESS: GI Pharmacology Cases (1-10) registered.';
END $$;

COMMIT;
