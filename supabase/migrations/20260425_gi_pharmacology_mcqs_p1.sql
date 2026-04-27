-- Migration: Year 2 - GI Pharmacology MCQ Bank (PART 1: 1-70)
-- Date: 2026-04-25
-- Target: US MD / MBBS Level (Lippincott, Katzung, Rang & Dale)

BEGIN;

-- 1. Register Topic
INSERT INTO topics (title, slug, year_id, semester_id)
VALUES ('GI Pharmacology', 'gi-pharmacology', 2, 3)
ON CONFLICT (slug) DO UPDATE SET 
    title = EXCLUDED.title,
    year_id = EXCLUDED.year_id,
    semester_id = EXCLUDED.semester_id;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'gi-pharmacology' LIMIT 1;

    -- Master Wipe for GI Pharmacology to ensure zero redundancy
    DELETE FROM mcqs WHERE topic_id = v_topic_id;

    -- SECTION 1: ANTI-EMETICS (1-35)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which drug is a selective 5-HT3 receptor antagonist used to prevent chemotherapy-induced nausea and vomiting?', '["Metoclopramide", "Ondansetron", "Aprepitant", "Promethazine"]', 1, 'Ondansetron blocks serotonin receptors in the CTZ and periphery.'),
    (v_topic_id, 'What is the primary mechanism of action of Aprepitant?', '["Dopamine D2 antagonist", "Serotonin 5-HT3 antagonist", "Neurokinin-1 (NK1) receptor antagonist", "Muscarinic antagonist"]', 2, 'Aprepitant blocks substance P from binding to NK1 receptors.'),
    (v_topic_id, 'Which antiemetic is a D2 receptor antagonist that also has prokinetic properties?', '["Granisetron", "Metoclopramide", "Scopolamine", "Dexamethasone"]', 1, 'Metoclopramide blocks D2 receptors and increases gastric emptying.'),
    (v_topic_id, 'A patient on Metoclopramide develops acute dystonia. Which neurotransmitter imbalance is responsible?', '["Excess Dopamine", "Dopamine blockade leading to relative Cholinergic excess", "Low Acetylcholine", "Excess Serotonin"]', 1, 'D2 blockade in the basal ganglia causes extrapyramidal symptoms.'),
    (v_topic_id, 'Which drug is the treatment of choice for Motion Sickness?', '["Ondansetron", "Scopolamine (Hyoscine)", "Loperamide", "Misoprostol"]', 1, 'Scopolamine is an antimuscarinic that acts on the vestibular system.'),
    (v_topic_id, 'What is a common side effect of 5-HT3 antagonists like Ondansetron?', '["Diarrhea", "QT interval prolongation and constipation", "Hypertension", "Seizures"]', 1, 'Constipation and QT prolongation are classic side effects.'),
    (v_topic_id, 'Which antiemetic is particularly useful for Delayed chemotherapy-induced nausea?', '["Ondansetron", "Aprepitant", "Chlorpromazine", "Dronabinol"]', 1, 'NK1 antagonists like Aprepitant/Rolapitant are superior for delayed emesis.'),
    (v_topic_id, 'Dronabinol and Nabilone are used as antiemetics. What is their pharmacologic class?', '["Corticosteroids", "Cannabinoids", "Benzodiazepines", "Antihistamines"]', 1, 'Synthetic cannabinoids are used when other antiemetics fail.'),
    (v_topic_id, 'Which drug is an H1-receptor antagonist used specifically for vestibular-induced nausea (motion sickness)?', '["Cimetidine", "Meclizine", "Ranitidine", "Famotidine"]', 1, 'Meclizine and Cyclizine are H1 blockers with antimuscarinic activity.'),
    (v_topic_id, 'Metoclopramide is contraindicated in which of the following conditions?', '["GERD", "Gastroparesis", "Mechanical Bowel Obstruction", "Post-operative nausea"]', 2, 'Increasing motility against an obstruction can lead to perforation.'),
    (v_topic_id, 'Which corticosteroid is commonly used as an adjunct to increase the efficacy of antiemetic regimens?', '["Prednisone", "Dexamethasone", "Hydrocortisone", "Fludrocortisone"]', 1, 'Dexamethasone enhances 5-HT3 and NK1 antagonist effects.'),
    (v_topic_id, 'What is the "Black Box Warning" for Metoclopramide regarding long-term use?', '["Liver failure", "Tardive Dyskinesia", "Agranulocytosis", "Cardiac arrest"]', 1, 'Chronic D2 blockade can lead to irreversible involuntary movements.'),
    (v_topic_id, 'Which antiemetic belongs to the Phenothiazine class?', '["Promethazine", "Domperidone", "Palonosetron", "Netupitant"]', 0, 'Promethazine and Prochlorperazine are phenothiazines.'),
    (v_topic_id, 'Domperidone is preferred over Metoclopramide for some patients because:', '["It is more potent", "It does not cross the blood-brain barrier readily (fewer EPS)", "It is available as a patch", "It has no side effects"]', 1, 'Domperidone acts peripherally in the CTZ (which is outside the BBB) but doesn''t hit the basal ganglia.'),
    (v_topic_id, 'Which antiemetic is used for refractory emesis and also stimulates appetite (e.g., in AIDS or Cancer)?', '["Ondansetron", "Dronabinol", "Scopolamine", "Diphenhydramine"]', 1, 'Cannabinoids have orexigenic (appetite-stimulating) effects.'),
    (v_topic_id, 'Palonosetron is unique among 5-HT3 antagonists because:', '["It is oral only", "It has a much longer half-life (approx. 40 hours)", "It causes diarrhea", "It is also a D2 blocker"]', 1, 'Its long half-life makes it effective for both acute and delayed emesis.'),
    (v_topic_id, 'Which benzodiazepine is used as an adjunct in antiemetic therapy primarily for its "Anticipatory" benefit?', '["Diazepam", "Lorazepam", "Midazolam", "Alprazolam"]', 1, 'Lorazepam/Alprazolam help with the anxiety/vomiting triggered by simply entering the clinic.'),
    (v_topic_id, 'Antihistamines used for motion sickness (e.g., Dimenhydrinate) often cause:', '["Insomnia", "Sedation and dry mouth", "Hyperactivity", "Hypertension"]', 1, 'These are due to central H1 and M1 receptor blockade.'),
    (v_topic_id, 'Which receptor in the Chemoreceptor Trigger Zone (CTZ) is blocked by Haloperidol for emesis?', '["5-HT3", "D2", "NK1", "CB1"]', 1, 'Butyrophenones like Haloperidol and Droperidol are potent D2 antagonists.'),
    (v_topic_id, 'Droperidol carries a black box warning for which cardiac side effect?', '["Myocardial infarction", "QT prolongation and Torsades de Pointes", "Bradycardia", "Hypertension"]', 1, 'ECG monitoring is required.'),
    (v_topic_id, 'A patient on chronic Metoclopramide therapy presents with high fever, muscle rigidity, and autonomic instability. Diagnosis?', '["Serotonin Syndrome", "Neuroleptic Malignant Syndrome (NMS)", "Malignant Hyperthermia", "Anticholinergic Toxicity"]', 1, 'NMS is a rare but fatal side effect of dopamine antagonists.'),
    (v_topic_id, 'Which drug is a combined NK1 antagonist and 5-HT3 antagonist?', '["Akynzeo (Netupitant/Palonosetron)", "Ondansetron", "Aprepitant", "Metoclopramide"]', 0, 'Combination products improve compliance and efficacy.'),
    (v_topic_id, 'The site of action for Scopolamine in motion sickness is:', '["CTZ", "Vestibular Apparatus", "Stomach", "Nodose Ganglion"]', 1, 'It blocks cholinergic transmission from the inner ear to the brain.'),
    (v_topic_id, 'Which drug is an Orally Disintegrating Tablet (ODT) used for easy administration during nausea?', '["Metoclopramide", "Ondansetron", "Aprepitant", "Misoprostol"]', 1, 'Ondansetron ODT is very common.'),
    (v_topic_id, 'Phosphonated carbohydrate solution (Emetrol) works by:', '["Blocking D2 receptors", "Directly reducing smooth muscle contraction in the GI tract", "Inhibiting Serotonin", "Stimulating the CTZ"]', 1, 'It is a mild, local OTC remedy.'),
    (v_topic_id, 'Which drug is used for vomiting during pregnancy if Vitamin B6/Doxylamine fails?', '["Ondansetron", "Promethazine", "Metoclopramide", "Any of the above"]', 3, 'Treatment is stepped based on severity.'),
    (v_topic_id, 'What is the main advantage of Rolapitant over Aprepitant?', '["It is more potent", "It has a longer half-life (approx. 180 hours) and does not inhibit CYP3A4", "It is IV only", "It is cheaper"]', 1, 'Rolapitant has fewer drug-drug interactions than Aprepitant.'),
    (v_topic_id, 'Side effect of NK1 antagonists like Aprepitant includes All EXCEPT:', '["Fatigue", "Hiccups", "Diarrhea", "Hypertension"]', 3, 'Hiccups are a quirky but classic side effect of NK1 blockers.'),
    (v_topic_id, 'Which antiemetic is an antagonist at M1, H1, D2, and alpha-1 receptors?', '["Promethazine", "Ondansetron", "Aprepitant", "Meclizine"]', 0, 'Promethazine is "dirty" (multi-receptor), which makes it effective but causes more side effects.'),
    (v_topic_id, 'In radiation-induced emesis, which drug class is first-line?', '["D2 antagonists", "5-HT3 antagonists", "NK1 antagonists", "Antihistamines"]', 1, 'Serotonin release from the gut is the primary mechanism in radiation emesis.'),
    (v_topic_id, 'Which drug is a high-potency D2 antagonist used in palliative care for malignant bowel obstruction?', '["Ondansetron", "Haloperidol", "Scopolamine", "Meclizine"]', 1, 'Haloperidol is very effective for chemical/metabolic causes of nausea.'),
    (v_topic_id, 'Cannabinoids act on which receptors in the brain to reduce emesis?', '["CB1", "CB2", "D2", "5-HT3"]', 0, 'CB1 receptors are found in the vomiting center.'),
    (v_topic_id, 'What is the risk of using Promethazine in children under 2 years of age?', '["Seizures", "Severe Respiratory Depression", "Liver failure", "Bone marrow suppression"]', 1, 'Promethazine is contraindicated in toddlers due to this fatal risk.'),
    (v_topic_id, 'Which antiemetic is also used as a sedative-hypnotic before minor surgery?', '["Promethazine", "Ondansetron", "Aprepitant", "Domperidone"]', 0, 'Due to its strong H1 blockade.'),
    (v_topic_id, 'Which 5-HT3 antagonist is available as a transdermal patch for 7-day coverage?', '["Ondansetron", "Granisetron", "Dolasetron", "Palonosetron"]', 1, 'Sancuso (Granisetron patch) is used for multi-day chemo cycles.'),

    -- SECTION 2: ACID PEPTIC DISEASE (36-70)
    (v_topic_id, 'What is the mechanism of action of Omeprazole?', '["H2 receptor antagonism", "Irreversible inhibition of the H+/K+ ATPase pump", "Neutralization of gastric acid", "Stimulation of mucus secretion"]', 1, 'PPIs bind covalently to the proton pump in parietal cells.'),
    (v_topic_id, 'PPIs are considered "Prodrugs." Where are they activated?', '["Liver", "Bloodstream", "Acidic environment of the parietal cell canaliculi", "Intestines"]', 2, 'The acid environment of the stomach causes the PPI to form a reactive sulfenamide.'),
    (v_topic_id, 'When is the most effective time to take a Proton Pump Inhibitor?', '["Before bed", "30-60 minutes before the first meal of the day", "Immediately after a meal", "With antacids"]', 1, 'PPIs work best when the pumps are actively being recruited (post-fasting).'),
    (v_topic_id, 'Which H2-receptor antagonist is known for inhibiting CYP450 enzymes and causing anti-androgenic effects?', '["Ranitidine", "Famotidine", "Cimetidine", "Nizatidine"]', 2, 'Cimetidine causes gynecomastia, impotence, and many drug interactions.'),
    (v_topic_id, 'What is a common side effect of long-term PPI use regarding bones?', '["Osteopetrosis", "Increased risk of fractures (Osteoporosis)", "Bone cancer", "Rickets"]', 1, 'Reduced acid impairs calcium absorption.'),
    (v_topic_id, 'PPIs increase the risk of which hospital-acquired infection?', '["MRSA", "Clostridioides difficile (C. diff)", "Tuberculosis", "Hepatitis"]', 1, 'Loss of the "acid barrier" allows bacteria to survive and colonize the gut.'),
    (v_topic_id, 'What is the mechanism of action of Misoprostol?', '["H2 blocker", "PGE1 analog that stimulates mucus/bicarbonate and inhibits acid", "PPI", "Antacid"]', 1, 'Misoprostol replaces protective prostaglandins.'),
    (v_topic_id, 'Which drug is used to prevent NSAID-induced gastric ulcers but is contraindicated in pregnancy?', '["Omeprazole", "Misoprostol", "Sucralfate", "Bismuth"]', 1, 'Misoprostol is an abortifacient (causes uterine contractions).'),
    (v_topic_id, 'What is the mechanism of Sucralfate?', '["Inhibits acid", "Forms a protective paste over ulcerated tissue", "Kills H. pylori", "Stimulates gastrin"]', 1, 'It polymerizes in acid to form a physical barrier.'),
    (v_topic_id, 'Which antacid is most likely to cause constipation?', '["Magnesium hydroxide", "Aluminum hydroxide", "Sodium bicarbonate", "Calcium carbonate"]', 1, 'Aluminum causes constipation; Magnesium causes diarrhea ("Alu-min-um" = "Al-one" = slow).'),
    (v_topic_id, 'Which antacid is most likely to cause osmotic diarrhea?', '["Aluminum hydroxide", "Magnesium hydroxide", "Calcium carbonate", "Sodium bicarbonate"]', 1, 'Magnesium is poorly absorbed and draws water into the lumen.'),
    (v_topic_id, 'The "Milk-Alkali Syndrome" is associated with excessive intake of which antacid?', '["Magnesium hydroxide", "Aluminum hydroxide", "Calcium carbonate", "Sodium bicarbonate"]', 2, 'Excess calcium and absorbable alkali leads to hypercalcemia and alkalosis.'),
    (v_topic_id, 'Why is Magnesium Hydroxide and Aluminum Hydroxide often given together?', '["To double the potency", "To offset each other''s bowel side effects (diarrhea/constipation)", "To prevent liver toxicity", "To kill H. pylori"]', 1, 'The balanced combination results in normal bowel movements.'),
    (v_topic_id, 'Which drug is part of the standard Triple Therapy for H. pylori?', '["PPI + Amoxicillin + Clarithromycin", "H2 blocker + Tetracycline", "PPI + Metronidazole only", "Antacid + Bismuth"]', 0, 'This is the first-line "PAC" regimen.'),
    (v_topic_id, 'What is the mechanism of Bismuth Subsalicylate in ulcer healing?', '["Coats the ulcer and has direct antimicrobial activity against H. pylori", "Inhibits gastrin", "Neutralizes HCl", "Blocks H2 receptors"]', 0, 'Bismuth has multiple cytoprotective and antibacterial effects.'),
    (v_topic_id, 'A patient on Bismuth reports their tongue and stool have turned black. What should they do?', '["Go to the ER", "Stop the drug immediately", "Nothing, this is a harmless side effect of Bismuth", "Take a laxative"]', 2, 'Bismuth reacts with sulfur in saliva/gut to form bismuth sulfide (black).'),
    (v_topic_id, 'Long-term PPI use is associated with deficiency of which vitamin?', '["Vitamin C", "Vitamin B12", "Vitamin D", "Vitamin K"]', 1, 'Acid is required to release B12 from food proteins.'),
    (v_topic_id, 'Which H2 blocker is the most potent and has the fewest side effects?', '["Cimetidine", "Famotidine", "Ranitidine", "Nizatidine"]', 1, 'Famotidine is highly selective and potent.'),
    (v_topic_id, 'Hypergastrinemia is a common finding in patients on long-term PPIs because:', '["The drug stimulates gastrin directly", "Lack of acid feedback inhibition on G-cells", "The drug blocks gastrin receptors", "PPIs cause gastrinomas"]', 1, 'Low acid levels signal the body to produce more gastrin to compensate.'),
    (v_topic_id, 'Which drug class is used to treat Zollinger-Ellison Syndrome?', '["Low-dose H2 blockers", "High-dose PPIs", "Antacids", "Sucralfate"]', 1, 'PPIs are the only drugs potent enough to handle the massive acid in ZE syndrome.'),
    (v_topic_id, 'Antacids can interfere with the absorption of which antibiotics?', '["Penicillins", "Tetracyclines and Fluoroquinolones", "Macrolides", "Cephalosporins"]', 1, 'Divalent/trivalent cations (Ca, Mg, Al) chelate these drugs.'),
    (v_topic_id, 'Which PPI has the best profile for use in patients on Clopidogrel?', '["Omeprazole", "Esomeprazole", "Pantoprazole", "Lansoprazole"]', 2, 'Pantoprazole has minimal inhibition of CYP2C19 (which activates Clopidogrel).'),
    (v_topic_id, 'What is the role of Metronidazole in H. pylori therapy?', '["Inhibits the proton pump", "Antibacterial used in Quadruple therapy or when allergic to Penicillin", "Cytoprotective", "Increases mucus"]', 1, 'It is an alternative to amoxicillin.'),
    (v_topic_id, 'Sucralfate requires which environment to work?', '["Alkaline (pH > 7)", "Acidic (pH < 4)", "Neutral", "Bile-rich"]', 1, 'It needs acid to polymerize; thus, it shouldn''t be taken with antacids/PPIs.'),
    (v_topic_id, 'Which drug is a Potassium-competitive acid blocker (P-CAB)?', '["Omeprazole", "Vonoprazan", "Famotidine", "Misoprostol"]', 1, 'Vonoprazan is a new class of non-covalent, rapid-acting acid blockers.'),
    (v_topic_id, 'Sodium Bicarbonate as an antacid carries a risk of:', '["Metabolic Acidosis", "Metabolic Alkalosis and Fluid Overload", "Constipation", "Hepatitis"]', 1, 'It is highly absorbable and contains significant sodium.'),
    (v_topic_id, 'Magnesium-containing antacids should be avoided in which group?', '["Elderly", "Pregnant women", "Patients with Renal Failure", "Patients with Liver failure"]', 2, 'Hypermagnesemia can occur if the kidneys cannot excrete the absorbed magnesium.'),
    (v_topic_id, 'What is "Rebound Acid Hypersecretion"?', '["Acid spikes when taking PPIs", "Sudden increase in acid production when stopping PPI therapy", "Acid reflux caused by food", "None of the above"]', 1, 'Occurs due to the hypergastrinemia during PPI treatment.'),
    (v_topic_id, 'Which drug is a mucosal protectant that also has antidiarrheal properties?', '["Misoprostol", "Bismuth Subsalicylate", "Sucralfate", "Calcium Carbonate"]', 1, 'The salicylate component has anti-secretory effects.'),
    (v_topic_id, 'Chronic PPI use can lead to which mineral deficiency besides Calcium?', '["Sodium", "Magnesium (Hypomagnesemia)", "Potassium", "Iron"]', 1, 'Hypomagnesemia is a serious, sometimes life-threatening complication of PPIs.'),
    (v_topic_id, 'Which PPI is available in an intravenous formulation for GI bleeding?', '["Omeprazole", "Pantoprazole", "Lansoprazole", "Esomeprazole"]', 1, 'Pantoprazole and Esomeprazole are commonly used IV.'),
    (v_topic_id, 'The mechanism of Pirenzepine in ulcer treatment was:', '["H2 block", "Selective M1 muscarinic antagonism", "PPI", "Gastrin block"]', 1, 'Rarely used now, but it selectively inhibited acid-secreting vagal signals.'),
    (v_topic_id, 'Why is Misoprostol used during "Medical Abortion"?', '["To kill the fetus", "To induce uterine contractions in combination with Mifepristone", "To stop bleeding", "To protect the stomach"]', 1, 'It is used off-label for its prostaglandin-mediated uterine effects.'),
    (v_topic_id, 'Clarithromycin resistance in H. pylori is treated by switching to:', '["Triple therapy", "Bismuth-based Quadruple Therapy", "H2 blockers only", "Antacids"]', 1, 'Quadruple therapy (PPI + Bismuth + Metronidazole + Tetracycline) is the standard alternative.'),
    (v_topic_id, 'Which drug inhibits the production of prostaglandins in the gut and can lead to ulcers?', '["Acetaminophen", "Naproxen (NSAIDs)", "Omeprazole", "Sucralfate"]', 1, 'NSAIDs block COX-1, which is responsible for protective GI prostaglandins.');

    RAISE NOTICE 'SUCCESS: GI Pharmacology MCQ Part 1 (1-70) registered.';
END $$;

COMMIT;
