-- Migration: GI Pharmacology Case Blocks (FIXED PART 2: 11-20)
-- Target: US MD / MBBS Year 2 Level (IBD & Motility)

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

    -- CASE 11: Sulfasalazine (IBD)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 11', 'A 28-year-old male with Ulcerative Colitis is started on Sulfasalazine to maintain remission.', 11)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Sulfasalazine is a combination of which two molecules?', '["5-ASA and Sulfapyridine", "Aspirin and Penicillin", "Mesalamine and Ibuprofen", "None"]', 0, 'It is a prodrug linked by an azo bond.',
    'Where is the azo bond cleaved to release the active 5-ASA?', '["Stomach", "Small Intestine", "Colon", "Liver"]', 2, 'Colonic bacteria possess the azoreductase enzyme needed for activation.',
    'Which component of Sulfasalazine is responsible for most of its side effects?', '["5-ASA", "Sulfapyridine", "The azo bond itself", "None"]', 1, 'Sulfapyridine is absorbed and causes the systemic side effects.';

    -- CASE 12: Mesalamine
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 12', 'A patient with IBD is switched from Sulfasalazine to a delayed-release form of Mesalamine (Asacol).', 12)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the primary advantage of Mesalamine over Sulfasalazine?', '["Higher potency", "Fewer sulfonamide-related side effects", "Better taste", "Lower cost"]', 1, 'Mesalamine is pure 5-ASA without the sulfa moiety.',
    'What is the mechanism of action of 5-ASA (Aminosalicylates)?', '["Systemic immunosuppression", "Local inhibition of leukotriene and prostaglandin synthesis", "Antibacterial", "None"]', 1, 'It acts topically on the inflamed mucosa to reduce inflammation.',
    'Which formulation of Mesalamine is preferred for treatment of Ulcerative Proctitis?', '["Oral tablets", "Suppository or Enema", "IV infusion", "None"]', 1, 'Topical delivery provides high local concentration in the rectum.';

    -- CASE 13: Infliximab (Biologics)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 13', 'A patient with severe, fistulizing Crohn''s disease fails to respond to conventional therapy. Infliximab is prescribed.', 13)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the target of Infliximab?', '["IL-6", "TNF-alpha", "VEGF", "IL-12/23"]', 1, 'Infliximab is a chimeric monoclonal antibody against Tumor Necrosis Factor-alpha.',
    'Before starting Infliximab, which screening test is MANDATORY for all patients?', '["Chest X-ray", "Tuberculin skin test", "Liver biopsy", "ECG"]', 1, 'TNF-alpha is required for granuloma maintenance; blocking it can reactivate latent TB.',
    'Which condition is a known long-term complication of anti-TNF therapy?', '["Increased risk of infection and lymphomas", "Liver failure", "Kidney stones", "None"]', 0, 'Immunosuppression increases risk of serious opportunistic infections.';

    -- CASE 14: Loperamide
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 14', 'A traveler develops acute watery diarrhea while on vacation. He takes Loperamide (Imodium).', 14)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of Loperamide?', '["Anticholinergic", "Agonist at Mu-opioid receptors in the gut", "Osmotic agent", "None"]', 1, 'It stimulates mu-receptors to slow intestinal motility.',
    'Why doesn''t Loperamide cause significant CNS effects at standard doses?', '["It doesn''t cross the BBB", "It is rapidly pumped out of the CNS by P-glycoprotein", "It has no affinity for brain receptors", "None"]', 1, 'P-glycoprotein efflux keeps it out of the central nervous system.',
    'In which type of diarrhea is Loperamide strictly contraindicated?', '["Viral gastroenteritis", "Bloody diarrhea or high fever", "Traveler''s diarrhea", "None"]', 1, 'Slowing motility can prolong the presence of invasive pathogens and increase risk of toxic megacolon.';

    -- CASE 15: Diphenoxylate/Atropine
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 15', 'A patient is prescribed Lomotil (Diphenoxylate/Atropine) for refractory diarrhea.', 15)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the primary reason for adding a small amount of Atropine to Diphenoxylate?', '["To increase potency", "To discourage abuse/overdose", "To prevent nausea", "None"]', 1, 'Atropine causes unpleasant side effects if taken in excess, preventing drug abuse.',
    'Diphenoxylate is a derivative of which opioid?', '["Morphine", "Pethidine (Meperidine)", "Fentanyl", "None"]', 1, 'It is related to meperidine but lacks significant analgesic properties at low doses.',
    'The anti-diarrheal effect is achieved by increasing:', '["Intestinal transit time", "Water secretion", "Peristalsis", "None"]', 0, 'Slower transit allows for more water absorption from the stool.';

    -- CASE 16: Bismuth Subsalicylate
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 16', 'A patient takes Pepto-Bismol for "indigestion" and is alarmed to find that his tongue and stools have turned black.', 16)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the cause of the black discoloration?', '["Internal bleeding", "Reaction between bismuth and sulfur", "Iron deficiency", "None"]', 1, 'Bismuth sulfide is a black precipitate formed by reacting with trace sulfur.',
    'Bismuth subsalicylate is used in which regimen for H. pylori?', '["Triple therapy", "Bismuth-based Quadruple therapy", "Sequential therapy", "None"]', 1, 'Bismuth provides a protective coating and has antimicrobial properties.',
    'Which group of patients should avoid high doses of Pepto-Bismol?', '["Hypertensive patients", "Children with viral infections", "Elderly patients", "None"]', 1, 'Like aspirin, it contains salicylate and can cause Reye syndrome.';

    -- CASE 17: Osmotic Laxatives
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 17', 'A patient preparing for a colonoscopy is instructed to drink 4 liters of Polyethylene Glycol (PEG) solution.', 17)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of PEG?', '["Stimulates intestinal nerves", "Osmotic water retention in the gut lumen", "Lubrication", "None"]', 1, 'It is a non-absorbable sugar that keeps water in the colon.',
    'Which of the following is another example of an osmotic laxative?', '["Lactulose", "Bisacodyl", "Senna", "Docusate"]', 0, 'Lactulose is osmotic and also traps ammonia in the gut.',
    'A potential complication of aggressive osmotic laxative use is:', '["Dehydration", "Weight gain", "Hypertension", "None"]', 0, 'Massive fluid shifts can lead to acute renal issues or hypotension.';

    -- CASE 18: Bulk-Forming Laxatives
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 18', 'A patient is advised to increase dietary fiber and start taking Psyllium (Metamucil).', 18)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'Bulk-forming laxatives are generally considered:', '["The most dangerous", "The safest approach to constipation", "The fastest acting", "None"]', 1, 'They mimic the effect of high-fiber diets.',
    'Patients taking Psyllium must be instructed to:', '["Take it before bed", "Drink plenty of water", "Avoid exercise", "None"]', 1, 'Without water, bulk-forming agents can lead to intestinal obstruction.',
    'Mechanism of action?', '["Local irritation", "Osmotic pressure", "Absorption of water and distension of the bowel", "None"]', 2, 'Distension is the natural stimulus for colonic motility.';

    -- CASE 19: Stimulant Laxatives
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 19', 'A patient with severe constipation from chronic opioid use takes Senna and Bisacodyl.', 19)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of Stimulant Laxatives?', '["Soften the stool", "Direct irritation of the enteric nervous system", "Osmotic draw", "None"]', 1, 'They stimulate the nerves to force bowel contractions.',
    'Chronic use of Senna can lead to which harmless finding?', '["Polyps", "Melanosis coli", "Ulcers", "Diverticulosis"]', 1, 'Anthraquinone laxatives cause brown pigmentation of the colonic mucosa.',
    'Stimulant laxatives are generally recommended for:', '["Daily long-term use", "Short-term relief of acute constipation", "Weight loss", "None"]', 1, 'Long-term use can lead to lazy bowel syndrome.';

    -- CASE 20: Stool Softeners
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Clinical Case 20', 'A patient post-myocardial infarction is given Docusate to prevent straining.', 20)
    RETURNING id INTO v_case_id;

    EXECUTE format('INSERT INTO case_questions (%I, question, options, correct_index, explanation) VALUES 
    ($1, $2, $3::jsonb, $4, $5),
    ($1, $6, $7::jsonb, $8, $9),
    ($1, $10, $11::jsonb, $12, $13)', v_col_name)
    USING v_case_id, 
    'What is the mechanism of Docusate?', '["Stimulant", "Surfactant that allows water to penetrate the stool", "Osmotic", "None"]', 1, 'It acts as a detergent to soften the stool mass.',
    'Which of the following is a lubricant laxative?', '["Mineral Oil", "Castor Oil", "PEG", "None"]', 0, 'Mineral oil coats the stool.',
    'Stool softeners are primarily used for:', '["Acute constipation", "Prevention of straining", "Bowel prep", "None"]', 1, 'They prevent the stool from becoming hard and difficult to pass.';

    RAISE NOTICE 'SUCCESS: GI Pharmacology Cases (11-20) registered.';
END $$;

COMMIT;
