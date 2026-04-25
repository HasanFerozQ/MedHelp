-- Migration: Year 2 - Endocrine Pharmacology MCQ Bank (PART 3: 141-210)
-- Date: 2026-04-25
-- Target: US MD / MBBS Level (Diabetes & Insulin)

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'endocrine-pharmacology' LIMIT 1;

    -- Targeted Delete for THIS PART ONLY
    DELETE FROM mcqs 
    WHERE topic_id = v_topic_id 
    AND question IN (
        'What is the mechanism of action of Insulin?',
        'Which insulin analog is "Ultra-short-acting" (Rapid-acting)?',
        'Which insulin preparation is "Long-acting" and provides a peakless basal coverage?',
        'The primary side effect of all insulin therapy is:',
        'What is the mechanism of action of Metformin (a Biguanide)?',
        'The most serious (though rare) side effect of Metformin is:',
        'Which drug class stimulates insulin release by blocking ATP-sensitive K+ channels?',
        'A major side effect of Sulfonylureas (e.g., Glyburide) is:',
        'Pioglitazone and Rosiglitazone act by activating which receptor?',
        'What is a significant contraindication for Thiazolidinediones (TZDs)?',
        'The mechanism of Acarbose and Miglitol is:',
        'Which drug class inhibits the DPP-4 enzyme to increase GLP-1 levels?',
        'Exenatide and Liraglutide are analogs of which hormone?',
        'What is a unique benefit of SGLT2 inhibitors like Canagliflozin?',
        'The most common side effect of SGLT2 inhibitors is:',
        'Which oral hypoglycemic is weight-neutral and does NOT cause hypoglycemia?',
        'Pramlintide is a synthetic analog of which hormone?',
        'The mechanism of Meglitinides (e.g., Repaglinide) is similar to which class?',
        'Which insulin should be used for treating Diabetic Ketoacidosis (DKA) intravenously?',
        'What is the "Somogyi effect"?',
        'The "Dawn Phenomenon" is characterized by:',
        'Which drug class is associated with an increased risk of bladder cancer (specifically Pioglitazone)?',
        'Which diabetes drug has a Black Box Warning for Congestive Heart Failure?',
        'The mechanism of Sitagliptin is:',
        'Glucagon is used clinically to treat:',
        'Which drug class is known to cause weight loss in diabetic patients?',
        'Metformin is contraindicated in patients with which condition?',
        'Which second-generation Sulfonylurea has the longest duration of action?',
        'What is the effect of GLP-1 agonists on gastric emptying?',
        'The "Incretin Effect" refers to:',
        'Which drug can mask the symptoms of hypoglycemia in a diabetic patient?',
        'SGLT2 inhibitors act in which part of the nephron?',
        'Which drug class is associated with euglycemic ketoacidosis?',
        'The mechanism of Diazoxide in insulinoma is:',
        'Which insulin has a duration of action up to 42 hours?'
    );

    -- SECTION 4: DIABETES & INSULIN (141-210)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'What is the mechanism of action of Insulin?', '["Activation of Tyrosine Kinase receptor", "Inhibition of Adenylate Cyclase", "Binding to GPCR", "Activation of PPAR-gamma"]', 0, 'Insulin binds to its receptor (alpha/beta subunits), causing autophosphorylation of tyrosine residues.'),
    (v_topic_id, 'Which insulin analog is "Ultra-short-acting" (Rapid-acting)?', '["Glargine", "Detemir", "Lispro", "NPH"]', 2, 'Lispro, Aspart, and Glulisine (LAG) are rapid-acting insulins taken right before meals.'),
    (v_topic_id, 'Which insulin preparation is "Long-acting" and provides a peakless basal coverage?', '["Regular", "NPH", "Glargine", "Lispro"]', 2, 'Glargine and Detemir provide 24-hour basal coverage with no distinct peak.'),
    (v_topic_id, 'The primary side effect of all insulin therapy is:', '["Weight loss", "Hypoglycemia", "Lactic acidosis", "Hypertension"]', 1, 'Hypoglycemia is the most frequent and dangerous complication.'),
    (v_topic_id, 'What is the mechanism of action of Metformin (a Biguanide)?', '["Stimulates insulin release", "Inhibits hepatic gluconeogenesis and increases peripheral glucose uptake", "Blocks glucose absorption in the gut", "Increases renal excretion of glucose"]', 1, 'Metformin activates AMPK, reducing hepatic glucose production.'),
    (v_topic_id, 'The most serious (though rare) side effect of Metformin is:', '["Hypoglycemia", "Lactic Acidosis", "Weight gain", "Peripheral edema"]', 1, 'Metformin can inhibit mitochondrial respiration, leading to lactate buildup, especially in renal failure.'),
    (v_topic_id, 'Which drug class stimulates insulin release by blocking ATP-sensitive K+ channels?', '["Biguanides", "Sulfonylureas", "Thiazolidinediones", "SGLT2 inhibitors"]', 1, 'Blocking K+ channels causes depolarization and Ca2+ influx, triggering insulin exocytosis.'),
    (v_topic_id, 'A major side effect of Sulfonylureas (e.g., Glyburide) is:', '["Weight loss", "Hypoglycemia and weight gain", "Nausea", "Lactic acidosis"]', 1, 'Sulfonylureas are potent secretagogues that carry a high risk of low blood sugar and weight gain.'),
    (v_topic_id, 'Pioglitazone and Rosiglitazone act by activating which receptor?', '["PPAR-alpha", "PPAR-gamma", "DPP-4", "SGLT2"]', 1, 'PPAR-gamma increases insulin sensitivity in adipose, muscle, and liver.'),
    (v_topic_id, 'What is a significant contraindication for Thiazolidinediones (TZDs)?', '["Renal failure", "Heart Failure (NYHA III/IV)", "Asthma", "Hyperthyroidism"]', 1, 'TZDs cause fluid retention, which can worsen congestive heart failure.'),
    (v_topic_id, 'The mechanism of Acarbose and Miglitol is:', '["Inhibition of alpha-glucosidase in the intestinal brush border", "Stimulation of insulin release", "Inhibition of hepatic glucose production", "Blocking renal glucose transport"]', 0, 'They delay the digestion of complex carbohydrates into glucose.'),
    (v_topic_id, 'Which drug class inhibits the DPP-4 enzyme to increase GLP-1 levels?', '["GLP-1 agonists", "Gliptins (e.g., Sitagliptin)", "Glitazones", "Gliflozins"]', 1, 'DPP-4 inhibitors prevent the breakdown of endogenous incretins.'),
    (v_topic_id, 'Exenatide and Liraglutide are analogs of which hormone?', '["Insulin", "Glucagon-like peptide-1 (GLP-1)", "Amylin", "Somatostatin"]', 1, 'They are incretin mimetics that increase insulin and decrease glucagon secretion.'),
    (v_topic_id, 'What is a unique benefit of SGLT2 inhibitors like Canagliflozin?', '["They cause weight gain", "They cause weight loss and reduce blood pressure", "They stimulate insulin release", "They prevent lactic acidosis"]', 1, 'By causing glycosuria, they promote calorie loss and mild diuresis.'),
    (v_topic_id, 'The most common side effect of SGLT2 inhibitors is:', '["Hypoglycemia", "Urinary tract and Genital Mycotic infections", "Lactic acidosis", "Weight gain"]', 1, 'High glucose in the urine provides a growth medium for bacteria and yeast.'),
    (v_topic_id, 'Which oral hypoglycemic is weight-neutral and does NOT cause hypoglycemia?', '["Glyburide", "Metformin", "Pioglitazone", "Repaglinide"]', 1, 'Metformin is the first-line drug for these reasons.'),
    (v_topic_id, 'Pramlintide is a synthetic analog of which hormone?', '["Glucagon", "Amylin", "Incretin", "Somatostatin"]', 1, 'Amylin is co-secreted with insulin and slows gastric emptying and suppresses glucagon.'),
    (v_topic_id, 'The mechanism of Meglitinides (e.g., Repaglinide) is similar to which class?', '["Biguanides", "Sulfonylureas", "TZDs", "Alpha-glucosidase inhibitors"]', 1, 'They also block K+ channels but have a faster onset and shorter duration.'),
    (v_topic_id, 'Which insulin should be used for treating Diabetic Ketoacidosis (DKA) intravenously?', '["NPH", "Regular Insulin", "Glargine", "Detemir"]', 1, 'Regular insulin is the only one used IV for acute emergencies.'),
    (v_topic_id, 'What is the "Somogyi effect"?', '["Morning hyperglycemia due to growth hormone", "Rebound morning hyperglycemia following nocturnal hypoglycemia", "Insulin resistance", "Weight gain from insulin"]', 1, 'The body releases counter-regulatory hormones (epinephrine, cortisol) in response to low sugar at night.'),
    (v_topic_id, 'The "Dawn Phenomenon" is characterized by:', '["Morning hypoglycemia", "Early morning hyperglycemia due to natural GH/Cortisol surge", "Loss of vision", "Nausea"]', 1, 'This occurs without preceding hypoglycemia.'),
    (v_topic_id, 'Which drug class is associated with an increased risk of bladder cancer (specifically Pioglitazone)?', '["Biguanides", "Thiazolidinediones (TZDs)", "DPP-4 inhibitors", "SGLT2 inhibitors"]', 1, 'Long-term use of Pioglitazone has been linked to bladder cancer in some studies.'),
    (v_topic_id, 'Which diabetes drug has a Black Box Warning for Congestive Heart Failure?', '["Metformin", "Rosiglitazone", "Sitagliptin", "Canagliflozin"]', 1, 'TZDs (Rosiglitazone/Pioglitazone) cause edema and heart failure exacerbation.'),
    (v_topic_id, 'The mechanism of Sitagliptin is:', '["GLP-1 receptor agonism", "DPP-4 inhibition", "SGLT2 inhibition", "Inhibition of alpha-glucosidase"]', 1, 'Sitagliptin is a "Gliptin" (DPP-4 inhibitor).'),
    (v_topic_id, 'Glucagon is used clinically to treat:', '["Hyperglycemia", "Severe Hypoglycemia and Beta-blocker overdose", "Diabetes Insipidus", "Acromegaly"]', 1, 'Glucagon increases blood sugar and acts as an inotrope in beta-blocker toxicity.'),
    (v_topic_id, 'Which drug class is known to cause weight loss in diabetic patients?', '["Sulfonylureas", "GLP-1 Agonists", "Insulin", "TZDs"]', 1, 'GLP-1 agonists (e.g., Semaglutide) and SGLT2 inhibitors promote weight loss.'),
    (v_topic_id, 'Metformin is contraindicated in patients with which condition?', '["Obesity", "Renal Impairment (eGFR < 30)", "Hypertension", "Dyslipidemia"]', 1, 'Reduced renal clearance significantly increases the risk of lactic acidosis.'),
    (v_topic_id, 'Which second-generation Sulfonylurea has the longest duration of action?', '["Glipizide", "Glyburide", "Glimepiride", "Chlorpropamide"]', 1, 'Glyburide has active metabolites and a long duration, making it risky for the elderly.'),
    (v_topic_id, 'What is the "Incretin Effect" refers to:', '["Glucose given orally causes a greater insulin response than IV glucose", "Insulin sensitivity increases with exercise", "Biguanides lower glucose", "Glucagon levels rise after a meal"]', 0, 'This is mediated by gut hormones like GLP-1 and GIP.'),
    (v_topic_id, 'Which drug can mask the symptoms of hypoglycemia in a diabetic patient?', '["Aspirin", "Propranolol", "Ciprofloxacin", "Hydrochlorothiazide"]', 1, 'Beta-blockers block the tachycardia and tremors that warn a patient of low sugar.'),
    (v_topic_id, 'SGLT2 inhibitors act in which part of the nephron?', '["Glomerulus", "Proximal Convoluted Tubule", "Loop of Henle", "Distal Tubule"]', 1, 'They block the transporter responsible for 90% of glucose reabsorption.'),
    (v_topic_id, 'Which drug class is associated with euglycemic ketoacidosis?', '["Sulfonylureas", "SGLT2 inhibitors", "Biguanides", "TZDs"]', 1, 'Ketoacidosis can occur even when blood glucose is near normal.'),
    (v_topic_id, 'The mechanism of Diazoxide in insulinoma is:', '["Stimulating insulin", "Opening ATP-sensitive K+ channels to inhibit insulin release", "Blocking the insulin receptor", "Destroying beta cells"]', 1, 'Diazoxide is the "opposite" of a Sulfonylurea; it keeps K+ channels open.'),
    (v_topic_id, 'Which insulin has a duration of action up to 42 hours?', '["Glargine", "Detemir", "Degludec", "NPH"]', 2, 'Degludec is an "Ultra-long-acting" insulin.'),
    (v_topic_id, 'Metformin reduces the risk of which vitamin deficiency?', '["Vitamin C", "Vitamin B12", "Vitamin D", "Folic Acid"]', 1, 'Long-term Metformin can interfere with B12 absorption in the ileum.'),
    (v_topic_id, 'What is the "disulfiram-like reaction" associated with 1st-generation Sulfonylureas?', '["Seizures", "Vomiting and flushing after alcohol ingestion", "Kidney failure", "Hepatitis"]', 1, 'They inhibit acetaldehyde dehydrogenase.'),
    (v_topic_id, 'Which drug class has a risk of Thyroid C-cell tumors in animal studies (Black Box Warning)?', '["SGLT2 inhibitors", "GLP-1 Agonists", "DPP-4 inhibitors", "Biguanides"]', 1, 'Liraglutide and others carry this warning for patients with Medullary Thyroid Cancer history.'),
    (v_topic_id, 'Acarbose is most likely to cause which side effect?', '["Hypoglycemia", "Flatulence and diarrhea", "Weight gain", "Lactic acidosis"]', 1, 'Undigested carbohydrates are fermented by colonic bacteria.'),
    (v_topic_id, 'Which insulin analog is designed to be peakless by forming multi-hexamers at the injection site?', '["Lispro", "Glargine", "Degludec", "Aspart"]', 2, 'Degludec hexamers slow down the absorption significantly.'),
    (v_topic_id, 'The main mechanism of Rosiglitazone is to increase the synthesis of which protein?', '["Glucagon", "GLUT4 and Adiponectin", "SGLT2", "Alpha-glucosidase"]', 1, 'PPAR-gamma activation increases the expression of glucose transporters.'),
    (v_topic_id, 'Why are Sulfonylureas generally avoided in patients with Sulfa allergy?', '["They are not effective", "Potential for cross-reactivity", "They cause renal failure", "They cause heart failure"]', 1, 'They contain a sulfonamide moiety.'),
    (v_topic_id, 'Which insulin is a cloudy suspension and should be rolled before use?', '["Regular", "Glargine", "NPH", "Lispro"]', 2, 'NPH (Neutral Protamine Hagedorn) is an intermediate-acting cloudy insulin.'),
    (v_topic_id, 'The most common side effect of GLP-1 agonists is:', '["Hypoglycemia", "Nausea and vomiting", "Weight gain", "Peripheral edema"]', 1, 'Nausea is very common during the initial weeks of therapy.'),
    (v_topic_id, 'Which drug can be used to treat Refractory Hypoglycemia from Sulfonylurea overdose?', '["Insulin", "Octreotide", "Metformin", "Acarbose"]', 1, 'Octreotide inhibits the over-release of insulin from the stimulated beta cells.'),
    (v_topic_id, 'Miglitol is an inhibitor of:', '["SGLT1", "Alpha-glucosidase", "DPP-4", "PPAR-alpha"]', 1, 'Similar to Acarbose.'),
    (v_topic_id, 'Which diabetes drug has shown significant Cardiovascular Benefit in trials (e.g., EMPA-REG)?', '["Glyburide", "Empagliflozin", "Sitagliptin", "Acarbose"]', 1, 'Empagliflozin reduces CV mortality and HF hospitalizations.'),
    (v_topic_id, 'What is the mechanism of Bromocriptine (a dopamine agonist) in Type 2 Diabetes?', '["Stimulates insulin", "Resets circadian rhythm of hypothalamic dopamine to reduce insulin resistance", "Blocks glucose absorption", "Increases renal excretion"]', 1, 'It is an FDA-approved adjunct for T2DM.'),
    (v_topic_id, 'Which insulin has the fastest onset of action?', '["Regular", "NPH", "Aspart", "Glargine"]', 2, 'Aspart/Lispro start working in 5-15 minutes.'),
    (v_topic_id, 'Sulfonylureas should be used with extreme caution in which patient population?', '["Young adults", "Elderly", "Obese", "Athletes"]', 1, 'The elderly are at high risk for prolonged, fatal hypoglycemia.'),
    (v_topic_id, 'Colesevelam is a bile acid sequestrant that is also used for:', '["Hypertension", "Type 2 Diabetes (as an adjunct)", "Asthma", "Gout"]', 1, 'It has a glucose-lowering effect (mechanism unclear).'),
    (v_topic_id, 'Which drug is a D-phenylalanine derivative secretagogue with a very short half-life?', '["Nateglinide", "Glimepiride", "Metformin", "Miglitol"]', 0, 'Nateglinide and Repaglinide are meglitinides.'),
    (v_topic_id, 'Insulin Glargine is acidic (pH 4.0). What happens when it is injected into the neutral pH of subcutaneous tissue?', '["It dissolves rapidly", "It precipitates and forms a depot for slow release", "It is inactivated", "It causes local infection"]', 1, 'The microprecipitation is what makes it long-acting.'),
    (v_topic_id, 'Which drug class carries a risk of acute pancreatitis?', '["SGLT2 inhibitors", "GLP-1 Agonists and DPP-4 inhibitors", "Biguanides", "TZDs"]', 1, 'Incretin-based therapies have been linked to rare cases of pancreatitis.'),
    (v_topic_id, 'Insulin resistance is primarily characterized by:', '["Lack of insulin production", "Reduced response of target tissues to insulin", "Excess glucagon", "Destruction of beta cells"]', 1, 'This is the hallmark of Type 2 Diabetes.'),
    (v_topic_id, 'The "Honeymoon Phase" in Type 1 Diabetes refers to:', '["The first month of insulin therapy", "Temporary recovery of beta cell function shortly after diagnosis", "Weight loss after insulin", "The onset of complications"]', 1, 'Exogenous insulin reduces stress on remaining beta cells, which temporarily recover.'),
    (v_topic_id, 'Which insulin is "Isophane" insulin?', '["Regular", "NPH", "Lente", "Ultralente"]', 1, 'Isophane is another name for NPH.'),
    (v_topic_id, 'Which SGLT2 inhibitor is also indicated for reducing the risk of end-stage kidney disease?', '["Canagliflozin", "Glipizide", "Acarbose", "Repaglinide"]', 0, 'Canagliflozin (CREDENCE trial) showed renal protection.'),
    (v_topic_id, 'The main drawback of TZDs (Glitazones) regarding bones is:', '["Increased bone density", "Increased risk of fractures (especially in women)", "Bone cancer", "Rickets"]', 1, 'They favor adipogenesis over osteoblastogenesis in the bone marrow.'),
    (v_topic_id, 'In the presence of renal failure, which Sulfonylurea is safest?', '["Glyburide", "Glipizide", "Chlorpropamide", "Acetohexamide"]', 1, 'Glipizide is primarily metabolized by the liver to inactive metabolites.'),
    (v_topic_id, 'What is the primary action of GIP (Gastric Inhibitory Peptide)?', '["Stimulates insulin release", "Inhibits gastric acid secretion and stimulates insulin", "Increases hunger", "Decreases blood sugar directly"]', 1, 'GIP and GLP-1 are the two main incretins.'),
    (v_topic_id, 'Insulin Detemir is long-acting because it:', '["Forms hexamers", "Binds to albumin via a fatty acid chain", "Precipitates in tissue", "Is very large"]', 1, 'The myristic acid chain allows it to bind to albumin.'),
    (v_topic_id, 'Which drug class is associated with Fournier Gangrene (necrotizing fasciitis of the perineum)?', '["Sulfonylureas", "SGLT2 inhibitors", "Biguanides", "DPP-4 inhibitors"]', 1, 'The FDA issued a warning for this rare but severe infection.'),
    (v_topic_id, 'The risk of hypoglycemia is HIGHEST with which of the following?', '["Metformin", "Sitagliptin", "Glyburide", "Acarbose"]', 2, 'Metformin and Acarbose are "euglycemics" (they don''t cause hypoglycemia when used alone).'),
    (v_topic_id, 'Metformin treatment should be withheld before which medical procedure?', '["X-ray", "Contrast CT scan", "Ultrasound", "EKG"]', 1, 'To prevent the risk of lactic acidosis if the contrast causes acute renal failure.'),
    (v_topic_id, 'Which insulin is the only one that can be mixed in the same syringe with NPH?', '["Glargine", "Detemir", "Regular and Rapid-acting analogs", "None"]', 2, 'Glargine/Detemir are acidic and will precipitate if mixed with the neutral NPH.'),
    (v_topic_id, 'The mechanism of Alogliptin is:', '["Inhibition of DPP-4", "GLP-1 receptor agonism", "SGLT2 block", "Amylin analog"]', 0, 'It is a gliptin.'),
    (v_topic_id, 'Lactic acidosis from Metformin is more likely in which state?', '["Alkalosis", "Hypoxia", "Obesity", "Hypertension"]', 1, 'Any condition that increases lactate production exacerbates the risk.'),
    (v_topic_id, 'Which drug class can cause a modest increase in LDL cholesterol?', '["Sulfonylureas", "SGLT2 inhibitors", "Biguanides", "Alpha-glucosidase inhibitors"]', 1, 'SGLT2 inhibitors have been noted to slightly raise LDL.'),
    (v_topic_id, 'The most important initial treatment for a Type 2 diabetic with obesity is:', '["Metformin", "Insulin", "Lifestyle modification", "Sulfonylureas"]', 2, 'Pharmacotherapy is always an adjunct to lifestyle changes.');

    RAISE NOTICE 'SUCCESS: Endocrine Pharmacology MCQ Part 3 (141-210) registered.';
END $$;

COMMIT;
