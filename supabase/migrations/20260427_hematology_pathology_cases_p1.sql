-- Migration: Hematology Pathology Cases Part 1 (01-10)
-- Goal: Cover RBC Disorders: Microcytic and Macrocytic Anemias
-- Sources: Pathoma, Robbins, Goljan

BEGIN;

-- 1. Ensure Topic "Hematology Pathology" exists
INSERT INTO topics (title, slug, semester_id, year_id, "order", usmle_step)
VALUES ('Hematology Pathology', 'hematology-pathology', 3, 2, 61, NULL)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'hematology-pathology' LIMIT 1;

    -- DELETE existing cases for this range to prevent duplicates on re-run
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 1 AND 10);
    DELETE FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 1 AND 10;

    -- CASE 01: Iron Deficiency Anemia
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Chronic Fatigue and Pica', 'A 45-year-old woman presents with fatigue, shortness of breath on exertion, and a strange craving for ice (pica). She has heavy menstrual periods. Labs show Hemoglobin: 9 g/dL, MCV: 72 fL, and increased RDW.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Anemia of Chronic Disease", "Iron Deficiency Anemia", "Beta-Thalassemia Minor", "Sideroblastic Anemia"]', 1, 'Iron deficiency is the most common cause of microcytic anemia, especially in women of childbearing age due to menorrhagia.'),
    (v_case_id, 'Which of the following lab findings is characteristic of this condition?', '["Increased Ferritin, Decreased TIBC", "Decreased Ferritin, Increased TIBC", "Increased Serum Iron, Increased Ferritin", "Normal Ferritin, Decreased TIBC"]', 1, 'In iron deficiency, storage iron (Ferritin) is depleted, and the liver compensates by producing more transferrin (measured as Total Iron Binding Capacity or TIBC).'),
    (v_case_id, 'If this patient also had esophageal webs and atrophic glossitis, what syndrome would she have?', '["Plummer-Vinson Syndrome", "Gardner Syndrome", "Peutz-Jeghers Syndrome", "Goodpasture Syndrome"]', 0, 'Plummer-Vinson syndrome is characterized by the triad of iron deficiency anemia, esophageal webs, and atrophic glossitis.');

    -- CASE 02: Anemia of Chronic Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Anemia in Rheumatoid Arthritis', 'A 60-year-old man with long-standing rheumatoid arthritis presents with mild fatigue. Labs show a normocytic anemia (MCV 84 fL) that has recently become slightly microcytic (MCV 78 fL). Serum ferritin is elevated.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Iron Deficiency Anemia", "Anemia of Chronic Disease", "Lead Poisoning", "Aplastic Anemia"]', 1, 'Anemia of chronic disease (ACD) is associated with chronic inflammation, which sequesters iron in storage sites.'),
    (v_case_id, 'What molecule, produced by the liver in response to inflammation, is the primary mediator of this condition?', '["Erythropoietin", "Hepcidin", "Ferritin", "Transferrin"]', 1, 'Hepcidin inhibits iron transport by degrading ferroportin on enterocytes and macrophages, preventing iron from being used for erythropoiesis.'),
    (v_case_id, 'How does the TIBC in this condition compare to Iron Deficiency Anemia?', '["It is increased in ACD", "It is decreased in ACD", "It is the same in both", "It is not measurable in ACD"]', 1, 'In ACD, TIBC is decreased because the liver decreases transferrin production in response to high iron stores (even if the iron is sequestered).');

    -- CASE 03: Sideroblastic Anemia
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Anemia and Alcoholism', 'A 50-year-old man with severe alcohol use disorder presents with fatigue. Peripheral smear shows dimorphic RBCs and Pappenheimer bodies. A bone marrow biopsy is performed.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What finding in the bone marrow biopsy would confirm Sideroblastic Anemia?', '["Hypercellularity", "Ringed sideroblasts (iron in mitochondria)", "Auer rods", "Smudge cells"]', 1, 'Ringed sideroblasts are erythroid precursors with iron-laden mitochondria encircling the nucleus, indicating defective heme synthesis.'),
    (v_case_id, 'What is the rate-limiting enzyme of heme synthesis that is often defective in this condition (especially in the X-linked form)?', '["Ferrochelatase", "ALAS (Aminolevulinic acid synthase)", "ALAD", "Porphobilinogen deaminase"]', 1, 'ALAS requires Vitamin B6 as a cofactor. Defects in ALAS lead to sideroblastic anemia.'),
    (v_case_id, 'Which of the following is a common acquired cause of sideroblastic anemia?', '["Vitamin B12 deficiency", "Lead poisoning", "Viral infection", "Chronic blood loss"]', 1, 'Lead poisoning inhibits ferrochelatase and ALAD, leading to sideroblastic anemia and basophilic stippling.');

    -- CASE 04: Beta-Thalassemia Major
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The "Crew-Cut" Appearance', 'A 1-year-old child of Mediterranean descent presents with severe anemia and chipmunk facies (maxillary overgrowth). X-ray of the skull shows a "crew-cut" appearance. He requires regular blood transfusions.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying genetic defect in Beta-Thalassemia Major?', '["Deletion of 2 beta-globin genes", "Mutation leading to absent (beta-0) production of beta-globin chains", "Trisomy 21", "Translocation t(9;22)"]', 1, 'Beta-thalassemia major involves severe mutations resulting in little to no beta-globin production, leading to an excess of alpha-chains that damage RBCs.'),
    (v_case_id, 'What is the primary hemoglobin found in this patient on electrophoresis?', '["HbA", "HbA2 and HbF", "HbH", "HbBart"]', 1, 'Since HbA (alpha2, beta2) cannot be formed, the body produces HbF (alpha2, gamma2) and HbA2 (alpha2, delta2).'),
    (v_case_id, 'Why does this patient develop iron overload (hemosiderosis)?', '["He eats too much spinach", "Chronic transfusions and increased intestinal absorption (due to ineffective erythropoiesis)", "Increased hepcidin levels", "Lack of ferroportin"]', 1, 'Transfusions and increased iron absorption (compensating for anemia) lead to secondary hemochromatosis.');

    -- CASE 05: Vitamin B12 Deficiency
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Strict Veganism and Numbness', 'A 60-year-old woman who has been a strict vegan for 20 years presents with fatigue and a "pins and needles" sensation (paresthesia) in her legs. Labs show a Macrocytic anemia (MCV 115 fL) and hypersegmented neutrophils.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the metabolic cause of the neurological symptoms in B12 deficiency?', '["Accumulation of Methylmalonic Acid (MMA)", "Depletion of Folate", "Elevated Homocysteine only", "Iron deficiency"]', 0, 'B12 is a cofactor for methylmalonyl-CoA mutase. Lack of B12 causes MMA accumulation, which damages myelin in the spinal cord (Subacute Combined Degeneration).'),
    (v_case_id, 'Which lab test can distinguish B12 deficiency from Folate deficiency?', '["Homocysteine level", "Methylmalonic acid (MMA) level", "RDW", "Reticulocyte count"]', 1, 'MMA is elevated in B12 deficiency but NORMAL in folate deficiency. Homocysteine is elevated in both.'),
    (v_case_id, 'If the patient had autoimmune destruction of gastric parietal cells, what would the condition be called?', '["Celiac Disease", "Pernicious Anemia", "Tropical Sprue", "Whipple Disease"]', 1, 'Pernicious anemia is the most common cause of B12 deficiency, caused by a lack of Intrinsic Factor due to autoimmune gastritis.');

    -- CASE 06: Folate Deficiency
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Alcoholism and Macrocytosis', 'A 45-year-old homeless man with chronic alcoholism presents with fatigue. Labs show Hemoglobin 10 g/dL, MCV 112 fL, and normal MMA levels. There are no neurological deficits.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Vitamin B12 Deficiency", "Folate Deficiency", "Iron Deficiency", "Aplastic Anemia"]', 1, 'Folate deficiency is common in alcoholics and the "tea and toast" elderly. It causes megaloblastic anemia without neurological symptoms.'),
    (v_case_id, 'Where is folate primarily absorbed in the GI tract?', '["Stomach", "Duodenum", "Jejunum", "Ileum"]', 2, 'Folate is absorbed in the jejunum, whereas B12 is absorbed in the terminal ileum.'),
    (v_case_id, 'Which drug, often used for rheumatoid arthritis or cancer, can cause folate deficiency by inhibiting dihydrofolate reductase?', '["Methotrexate", "Phenytoin", "Alcohol", "Trimethoprim"]', 0, 'Methotrexate is a folate antagonist that inhibits dihydrofolate reductase.');

    -- CASE 07: Hereditary Spherocytosis
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Jaundice and Splenomegaly', 'An 8-year-old boy presents with intermittent jaundice and an enlarged spleen. His father had his spleen removed at age 20. Labs show an elevated MCHC (38 g/dL) and spherocytes on peripheral smear.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying defect in Hereditary Spherocytosis?', '["Defect in hemoglobin synthesis", "Defect in RBC membrane proteins (Ankyrin, Spectrin, or Band 3)", "G6PD deficiency", "IgG autoantibodies"]', 1, 'Defects in the cytoskeleton-membrane tethering proteins lead to loss of membrane over time, forcing the RBC to become a sphere (least surface-to-volume ratio).'),
    (v_case_id, 'What test is used to diagnose this condition by assessing RBC fragility in hypotonic solutions?', '["Coombs Test", "Osmotic Fragility Test", "Ham Test", "Sugar Water Test"]', 1, 'Spherocytes have little room to expand in hypotonic solution and burst easily, showing increased osmotic fragility.'),
    (v_case_id, 'What is the most common serious complication that can cause a sudden drop in hemoglobin (aplastic crisis) in these patients?', '["Iron deficiency", "Parvovirus B19 infection", "EBV infection", "Bilirubin gallstones"]', 1, 'Parvovirus B19 infects erythroid precursors, leading to a temporary halt in RBC production, which is devastating for patients with high RBC turnover.');

    -- CASE 08: Sickle Cell Anemia (Vaso-occlusive Crisis)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Severe Bone Pain', 'A 15-year-old African American boy presents with severe pain in his legs and back. He recently recovered from a respiratory infection. On exam, he has a low-grade fever and a palpable spleen.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the specific amino acid substitution in Sickle Cell Anemia (HbS)?', '["Glutamic acid to Lysine at position 6", "Glutamic acid to Valine at position 6", "Phenylalanine deletion at position 508", "Valine to Glutamic acid at position 6"]', 1, 'HbS involves a point mutation in the beta-globin gene where hydrophilic glutamic acid is replaced by hydrophobic valine.'),
    (v_case_id, 'What is the most common cause of death in ADULTS with sickle cell disease?', '["Infection (S. pneumoniae)", "Acute Chest Syndrome", "Renal failure", "Stroke"]', 1, 'Acute chest syndrome (vaso-occlusion in pulmonary microvasculature) is the leading cause of death in adults.'),
    (v_case_id, 'Which organism is the most common cause of osteomyelitis in sickle cell patients?', '["Staphylococcus aureus", "Salmonella", "Pseudomonas", "Streptococcus pyogenes"]', 1, 'While S. aureus is the #1 cause of osteomyelitis in the general population, Salmonella is uniquely common in sickle cell patients.');

    -- CASE 09: G6PD Deficiency
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Back Pain and Dark Urine after Fava Beans', 'A 25-year-old man of African descent presents with sudden onset of back pain and dark urine after eating a large bowl of fava beans. Peripheral smear shows "bite cells" and Heinz bodies.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the metabolic role of G6PD in the RBC?', '["Produces ATP via glycolysis", "Produces NADPH to maintain reduced glutathione", "Synthesizes hemoglobin", "Maintains the Na/K pump"]', 1, 'NADPH is required to reduce glutathione. Reduced glutathione neutralizes oxidative stress (like H2O2). Without G6PD, oxidative stress denatures hemoglobin.'),
    (v_case_id, 'What are "Heinz bodies"?', '["Nuclear remnants (DNA)", "Precipitated denatured hemoglobin", "Iron granules", "Ribosomal RNA"]', 1, 'Oxidative stress causes hemoglobin to denature and precipitate into Heinz bodies.'),
    (v_case_id, 'Which cells are responsible for creating the "bite cells" seen on the smear?', '["Macrophages in the liver", "Splenic macrophages", "Kupffer cells", "Neutrophils"]', 1, 'Splenic macrophages remove the Heinz bodies from the RBCs, leaving behind "bites."');

    -- CASE 10: Alpha-Thalassemia (HbH Disease)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The 3-Gene Deletion', 'An Asian man presents with chronic mild-to-moderate anemia. Electrophoresis reveals the presence of Hemoglobin H (beta-4 tetramers).', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How many alpha-globin genes are deleted in HbH disease?', '["One", "Two", "Three", "Four"]', 2, 'HbH disease is caused by the deletion of 3 alpha genes. 4 deletions lead to Hydrops Fetalis (Hb Bart).'),
    (v_case_id, 'What is "Hemoglobin Bart"?', '["Beta-4 tetramer", "Gamma-4 tetramer", "Alpha-4 tetramer", "Delta-4 tetramer"]', 1, 'Hb Bart is composed of four gamma chains and is seen in the lethal 4-gene deletion alpha-thalassemia.'),
    (v_case_id, 'Which ethnic group typically has the "cis" deletion (both genes on the same chromosome) in alpha-thalassemia minor, increasing the risk of offspring with Hydrops Fetalis?', '["Africans", "Asians", "Mediterraneans", "Scandinavians"]', 1, 'Asians often have the cis deletion (--/aa), while Africans typically have the trans deletion (-a/-a).');

    RAISE NOTICE 'SUCCESS: Hematology Pathology Cases Part 1 (01-10) registered.';
END $$;

COMMIT;
