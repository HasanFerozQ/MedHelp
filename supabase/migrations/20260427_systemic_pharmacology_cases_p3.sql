-- Migration: Systemic Pharmacology Cases Part 3 (21-30) - FIXED SCHEMA
-- Goal: Cover Endocrine, GI, and Respiratory Pharmacology
-- Sources: Lippincott, Katzung, Rang & Dale

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'systemic-pharmacology' LIMIT 1;

    -- DELETE existing cases for this range to prevent duplicates on re-run
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 21 AND 30);
    DELETE FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 21 AND 30;

    -- CASE 21: Diabetes Type 1 & Insulins
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Kussmaul Respirations', 'A 19-year-old male with Type 1 Diabetes Mellitus presents with a blood glucose of 450 mg/dL, deep and rapid breathing (Kussmaul respirations), and fruity-smelling breath. He is diagnosed with Diabetic Ketoacidosis (DKA).', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which specific type of insulin is exclusively used for intravenous infusion in the management of DKA?', '["Insulin Glargine", "NPH Insulin", "Regular Insulin", "Insulin Degludec"]', 2, 'Regular (short-acting) insulin is the only formulation that can be given intravenously. NPH is an intermediate suspension, and Glargine is long-acting and precipitates at physiologic pH.'),
    (v_case_id, 'As the insulin infusion begins to lower his blood glucose and reverse the ketoacidosis, which electrolyte must be closely monitored and aggressively replaced?', '["Sodium", "Calcium", "Potassium", "Magnesium"]', 2, 'Insulin drives potassium into cells via the Na+/K+ ATPase pump. As DKA is treated, serum potassium rapidly drops, risking severe hypokalemia and arrhythmias.'),
    (v_case_id, 'For his long-term at-home regimen, he is prescribed Insulin Glargine. What is the mechanism that gives Glargine its 24-hour "peakless" duration of action?', '["It is bound to zinc and protamine", "It forms micro-precipitates in subcutaneous tissue that slowly dissolve", "It strongly binds to albumin in the blood", "It is rapidly metabolized into an active metabolite"]', 1, 'Insulin glargine is formulated at an acidic pH. When injected into the neutral pH of subcutaneous tissue, it precipitates into crystals that slowly release hexamers over 24 hours.'),
    (v_case_id, 'Which of the following is a rapid-acting insulin preparation typically injected right before meals?', '["Insulin Detemir", "NPH Insulin", "Insulin Lispro", "Regular Insulin"]', 2, 'Insulin lispro, aspart, and glulisine have modified amino acid sequences that prevent them from forming hexamers, allowing for rapid absorption (onset 15 mins).');

    -- CASE 22: Diabetes Type 2 (Oral Agents & Incretins)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Refractory HbA1c', 'A 55-year-old obese woman with Type 2 Diabetes Mellitus is started on Metformin. Three months later, her HbA1c is still 8.5%, so her physician adds Semaglutide.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary mechanism of action of Metformin?', '["Stimulates insulin release from pancreatic beta cells", "Inhibits hepatic gluconeogenesis via AMPK activation", "Inhibits SGLT2 in the kidney", "Activates PPAR-gamma to increase insulin sensitivity"]', 1, 'Metformin acts primarily on the liver to decrease glucose production and on muscle to increase peripheral glucose uptake.'),
    (v_case_id, 'What is the most feared, albeit rare, adverse effect of Metformin, particularly in patients with renal failure?', '["Severe hypoglycemia", "Lactic acidosis", "Weight gain", "Pancreatitis"]', 1, 'Metformin inhibits mitochondrial complex I, forcing cells to rely more on anaerobic glycolysis, which produces lactic acid. It is contraindicated in severe renal impairment.'),
    (v_case_id, 'What is the mechanism of action of Semaglutide?', '["GLP-1 receptor agonist", "DPP-4 inhibitor", "SGLT2 inhibitor", "Sulfonylurea"]', 0, 'Semaglutide is a GLP-1 agonist that enhances glucose-dependent insulin secretion, slows gastric emptying, and promotes weight loss (satiety).'),
    (v_case_id, 'If the physician had prescribed a Sulfonylurea (e.g., Glipizide) instead, how would its mechanism differ?', '["It blocks intestinal carbohydrate absorption", "It directly closes ATP-sensitive K+ channels on beta cells, triggering insulin release regardless of glucose levels", "It causes massive glycosuria", "It increases peripheral insulin sensitivity"]', 1, 'Sulfonylureas force insulin release by closing K+ channels and depolarizing the beta cell. Because this is independent of ambient glucose, they carry a high risk of hypoglycemia and weight gain.');

    -- CASE 23: Thyroid Pharmacology
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, ' Graves'' Disease Management', 'A 34-year-old woman presents with palpitations, weight loss, and heat intolerance. Labs reveal a markedly decreased TSH and elevated Free T4. She is started on Methimazole.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of action of Methimazole?', '["Destroys the thyroid gland via radiation", "Inhibits thyroid peroxidase (TPO), preventing oxidation and coupling of iodide", "Blocks the peripheral conversion of T4 to T3", "Inhibits the release of preformed thyroid hormone"]', 1, 'Thioamides (Methimazole and PTU) inhibit TPO, stopping the synthesis of new thyroid hormones.'),
    (v_case_id, 'Why is Propylthiouracil (PTU) generally reserved for the first trimester of pregnancy or thyroid storm, rather than being used first-line?', '["It is less effective than Methimazole", "It carries a black box warning for severe hepatotoxicity", "It causes severe birth defects", "It requires intravenous administration"]', 1, 'PTU can cause fulminant liver failure. However, it is preferred in the 1st trimester of pregnancy because Methimazole is teratogenic (aplasia cutis).'),
    (v_case_id, 'Which medication should be added immediately to control her symptoms (palpitations, tremors) while waiting for the Methimazole to take effect?', '["Levothyroxine", "Radioactive Iodine", "Propranolol", "Glucocorticoids"]', 2, 'Beta-blockers (like propranolol) rapidly control the sympathetic symptoms of hyperthyroidism and, at high doses, partially inhibit the peripheral conversion of T4 to T3.'),
    (v_case_id, 'A patient on Methimazole presents two months later with a sudden onset of high fever and a severe sore throat. What life-threatening complication must be ruled out immediately?', '["Agranulocytosis", "Thyroid storm", "Myxedema coma", "Aplastic anemia"]', 0, 'Agranulocytosis is a rare but severe side effect of thioamides. A sudden sore throat or fever requires immediate white blood cell count.');

    -- CASE 24: Corticosteroids
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Cushingoid Features', 'A 45-year-old man with severe rheumatoid arthritis has been taking high-dose prednisone for 8 months. He presents with weight gain, facial swelling, easy bruising, and weakness.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary cellular mechanism of action of glucocorticoids like prednisone?', '["Activation of cell-surface G-protein coupled receptors", "Binding to cytosolic receptors, translocating to the nucleus, and altering gene transcription", "Direct inhibition of COX-1 and COX-2 enzymes", "Blockade of histamine release from mast cells"]', 1, 'Glucocorticoids are steroid hormones. They cross the cell membrane, bind intracellular receptors, and alter the transcription of inflammatory and anti-inflammatory genes.'),
    (v_case_id, 'The patient''s symptoms (moon facies, central obesity, easy bruising, proximal muscle weakness) are characteristic of which condition?', '["Addison''s disease", "Iatrogenic Cushing''s syndrome", "Conn''s syndrome", "Pheochromocytoma"]', 1, 'Chronic use of exogenous glucocorticoids mimics cortisol excess, leading to Cushingoid features.'),
    (v_case_id, 'Which of the following is a direct consequence of long-term glucocorticoid use on bone metabolism?', '["Increased osteoblast activity", "Decreased calcium excretion", "Osteoporosis due to increased osteoclast activity and decreased calcium absorption", "Osteopetrosis"]', 2, 'Glucocorticoids antagonize vitamin D, decrease gut calcium absorption, increase renal calcium excretion, and directly inhibit osteoblasts, leading to severe osteoporosis.'),
    (v_case_id, 'Why must the prednisone dose be tapered slowly rather than stopped abruptly?', '["To prevent acute adrenal crisis (Addisonian crisis) due to HPA axis suppression", "To prevent a severe allergic reaction", "To avoid massive fluid retention", "To prevent rebound arthritis"]', 0, 'Exogenous steroids suppress the hypothalamus and pituitary gland (low CRH, low ACTH), causing adrenal atrophy. Abrupt cessation leads to acute adrenal insufficiency (shock, hypotension).');

    -- CASE 25: Asthma Pharmacology
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Acute Asthma Flare', 'A 12-year-old boy with asthma presents to the ER with an acute exacerbation. He is wheezing and short of breath. He usually takes a fluticasone inhaler twice daily but forgot it.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate first-line rescue medication for his acute symptoms?', '["Inhaled Salmeterol", "Oral Montelukast", "Inhaled Albuterol", "Intravenous Theophylline"]', 2, 'Albuterol is a Short-Acting Beta-2 Agonist (SABA) and the drug of choice for acute bronchospasm relief.'),
    (v_case_id, 'What is the purpose of his daily fluticasone inhaler?', '["To provide immediate bronchodilation", "To reduce chronic airway inflammation via gene transcription changes", "To block leukotriene receptors", "To inhibit mast cell degranulation"]', 1, 'Fluticasone is an Inhaled Corticosteroid (ICS). It is the cornerstone of long-term asthma control, reducing chronic inflammation and preventing exacerbations.'),
    (v_case_id, 'Which oral medication could be added to his regimen that works by competitively antagonizing leukotriene (CysLT1) receptors?', '["Zileuton", "Montelukast", "Cromolyn", "Omalizumab"]', 1, 'Montelukast and Zafirlukast are leukotriene receptor antagonists. Zileuton inhibits the enzyme (5-lipoxygenase) that makes leukotrienes.'),
    (v_case_id, 'If the patient were given Theophylline, its mechanism of action would involve:', '["Inhibition of phosphodiesterase (PDE), increasing cAMP", "Direct beta-2 receptor agonism", "Muscarinic antagonism", "Inhibition of IgE binding to mast cells"]', 0, 'Theophylline is a methylxanthine that inhibits PDE (increasing cAMP = bronchodilation) and blocks adenosine receptors. It has a narrow therapeutic index.');

    -- CASE 26: Peptic Ulcer Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'H. pylori Triple Therapy', 'A 42-year-old man presents with gnawing epigastric pain that improves with eating. Endoscopy reveals a duodenal ulcer. He is prescribed Omeprazole, Clarithromycin, and Amoxicillin.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary mechanism of action of Omeprazole?', '["Competitive antagonism of H2 histamine receptors", "Neutralization of gastric acid", "Irreversible inhibition of the H+/K+ ATPase (Proton Pump) on parietal cells", "Coating the ulcer crater"]', 2, 'Proton Pump Inhibitors (PPIs) irreversibly bind and inhibit the final common pathway of acid secretion.'),
    (v_case_id, 'Why is Omeprazole combined with two antibiotics in this patient?', '["To prevent secondary pneumonia", "To eradicate Helicobacter pylori, the primary cause of the ulcer", "To treat a suspected Clostridium difficile infection", "To improve the absorption of the PPI"]', 1, 'This is "Triple Therapy," the standard first-line treatment to eradicate H. pylori and cure the ulcer.'),
    (v_case_id, 'If the patient had instead taken an over-the-counter antacid containing aluminum hydroxide, what common side effect might he experience?', '["Diarrhea", "Constipation", "Rebound hyperacidity", "Metabolic acidosis"]', 1, 'Aluminum-based antacids cause constipation. Magnesium-based antacids cause diarrhea. (Mnemonic: AluMINIMUM amount of feces; Mg = Must Go).'),
    (v_case_id, 'Which medication acts by creating a viscous, sticky polymer in an acidic environment that coats and protects the ulcer crater?', '["Misoprostol", "Famotidine", "Sucralfate", "Bismuth subsalicylate"]', 2, 'Sucralfate requires an acidic environment to undergo cross-linking, forming a physical barrier over the ulcer. (Do not give with PPIs/H2 blockers simultaneously).');

    -- CASE 27: Antiemetics
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Chemotherapy Induced Emesis', 'A 50-year-old woman undergoing chemotherapy is given a medication prior to her infusion to prevent nausea. She still experiences some nausea and is given a second rescue drug that eventually causes dystonia.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The first drug given to prevent chemotherapy-induced nausea and vomiting (CINV) was most likely Ondansetron. What is its mechanism?', '["D2 dopamine receptor antagonist", "5-HT3 serotonin receptor antagonist", "H1 histamine antagonist", "Muscarinic M1 antagonist"]', 1, 'Ondansetron is a potent 5-HT3 antagonist working both centrally (chemoreceptor trigger zone) and peripherally (vagal afferents in the GI tract).'),
    (v_case_id, 'The second "rescue" drug, which caused the dystonic reaction, was most likely:', '["Metoclopramide", "Scopolamine", "Aprepitant", "Dexamethasone"]', 0, 'Metoclopramide is a D2 receptor antagonist (and prokinetic). Blocking dopamine in the nigrostriatal pathway causes Extrapyramidal Symptoms (EPS) like dystonia.'),
    (v_case_id, 'Which antiemetic specifically blocks the Neurokinin 1 (NK1) receptor in the brain, preventing the action of Substance P?', '["Promethazine", "Ondansetron", "Aprepitant", "Dronabinol"]', 2, 'Aprepitant is an NK1 antagonist used specifically for the delayed phase of chemotherapy-induced emesis.'),
    (v_case_id, 'Which antiemetic is primarily used for motion sickness via a transdermal patch?', '["Meclizine", "Scopolamine", "Prochlorperazine", "Metoclopramide"]', 1, 'Scopolamine is an antimuscarinic (anticholinergic) highly effective for vestibular-induced nausea (motion sickness).');

    -- CASE 28: Osteoporosis Pharmacology
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Oral Bisphosphonates', 'A 70-year-old postmenopausal woman with a T-score of -3.0 is prescribed Alendronate. She is told to take it first thing in the morning and remain upright for 30 minutes.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary mechanism of action of Alendronate?', '["Stimulates osteoblast differentiation", "Provides elemental calcium for bone matrix", "Incorporates into bone matrix and induces apoptosis of osteoclasts", "Mimics the action of parathyroid hormone"]', 2, 'Bisphosphonates (like alendronate) are analogues of pyrophosphate. They bind to hydroxyapatite in bone, are ingested by osteoclasts during resorption, and cause osteoclast apoptosis.'),
    (v_case_id, 'Why must the patient remain upright for 30 minutes after taking the medication?', '["To prevent severe orthostatic hypotension", "To ensure rapid absorption in the stomach", "To prevent erosive esophagitis", "To increase distribution to the bones"]', 2, 'Bisphosphonates are notoriously caustic to the esophageal mucosa. Lying down can cause reflux and severe erosive esophagitis.'),
    (v_case_id, 'Which medication works by acting as an agonist at estrogen receptors in bone but as an antagonist at estrogen receptors in the breast and uterus?', '["Denosumab", "Raloxifene", "Teriparatide", "Calcitonin"]', 1, 'Raloxifene is a Selective Estrogen Receptor Modulator (SERM) used for osteoporosis that does not increase the risk of endometrial or breast cancer.'),
    (v_case_id, 'Which drug is a recombinant form of Parathyroid Hormone (PTH) that, when given in low, pulsatile daily doses, actually stimulates bone formation (anabolic)?', '["Teriparatide", "Denosumab", "Alendronate", "Cholecalciferol"]', 0, 'While continuous high PTH causes bone resorption, low-dose intermittent Teriparatide (PTH analogue) stimulates osteoblasts and builds new bone.');

    -- CASE 29: Reproductive Pharmacology
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Oral Contraceptives and Smoking', 'A 28-year-old woman requests an oral contraceptive pill. Her physician warns her of the risks, particularly because she smokes 1 pack of cigarettes a day.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary mechanism by which the estrogen and progestin in the OCP prevent pregnancy?', '["They are spermicidal", "They prevent implantation of the fertilized egg", "They inhibit the release of FSH and LH via negative feedback, preventing ovulation", "They cause shedding of the endometrial lining"]', 2, 'Estrogen and progestin exert negative feedback on the anterior pituitary and hypothalamus, suppressing the LH surge required for ovulation.'),
    (v_case_id, 'Why is her smoking habit a significant contraindication to taking estrogen-containing OCPs?', '["Smoking dramatically increases the risk of deep vein thrombosis, pulmonary embolism, and stroke", "Smoking negates the contraceptive effect of the pill", "Smoking causes the pill to induce early menopause", "Smoking increases the risk of osteoporosis"]', 0, 'Estrogens increase the hepatic synthesis of clotting factors. Smoking damages endothelium. The combination (especially in women >35) massively increases the risk of cardiovascular events and thrombosis.'),
    (v_case_id, 'Which medication is a partial estrogen agonist in the hypothalamus used to treat infertility (PCOS) by inducing ovulation?', '["Mifepristone", "Clomiphene", "Tamoxifen", "Leuprolide"]', 1, 'Clomiphene blocks estrogen negative feedback at the hypothalamus, increasing pulsatile GnRH, which increases FSH/LH to stimulate follicle development and ovulation.'),
    (v_case_id, 'What is the mechanism of action of Mifepristone (RU-486)?', '["Progesterone receptor antagonist", "Estrogen receptor agonist", "Prostaglandin analogue", "Androgen receptor antagonist"]', 0, 'Mifepristone blocks progesterone receptors, leading to the breakdown of the decidua and termination of early pregnancy.');

    -- CASE 30: Gout Pharmacology
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Chronic Gout Management', 'A 55-year-old man with chronic gout and a history of kidney stones presents for long-term management. He currently has no active joint pain. He is prescribed Allopurinol.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of action of Allopurinol?', '["Inhibits xanthine oxidase, decreasing uric acid production", "Increases renal excretion of uric acid", "Inhibits microtubule polymerization", "Inhibits cyclooxygenase (COX)"]', 0, 'Allopurinol and Febuxostat inhibit xanthine oxidase, preventing the conversion of hypoxanthine and xanthine into uric acid.'),
    (v_case_id, 'Why must an NSAID or Colchicine be co-administered during the first few weeks of initiating Allopurinol therapy?', '["To treat the underlying kidney stones", "Because allopurinol takes a month to start working", "Because sudden changes in uric acid levels can mobilize tissue stores and precipitate an acute gout attack", "To prevent liver damage from allopurinol"]', 2, 'Initiating urate-lowering therapy rapidly shifts the uric acid equilibrium, causing microcrystals to shed from joints and triggering a severe acute flare unless prophylactic anti-inflammatories are given.'),
    (v_case_id, 'How does Colchicine work to treat an acute gout flare?', '["It degrades uric acid into allantoin", "It binds and stabilizes tubulin, inhibiting microtubule polymerization and impairing leukocyte migration", "It selectively inhibits COX-2", "It increases renal uric acid clearance"]', 1, 'Colchicine stops the inflammatory cascade by preventing neutrophils from moving into the joint and engulfing the crystals.'),
    (v_case_id, 'Probenecid is another drug used for chronic gout. How does it work?', '["Uricosuric agent: it blocks the reabsorption of uric acid in the proximal tubule", "It degrades uric acid", "It inhibits xanthine oxidase", "It blocks IL-1 receptors"]', 0, 'Probenecid increases the excretion of uric acid. It requires good renal function and should be avoided in patients with a history of uric acid kidney stones.');

    RAISE NOTICE 'SUCCESS: Systemic Pharmacology Cases Part 3 (21-30) registered with correct schema.';
END $$;

COMMIT;
