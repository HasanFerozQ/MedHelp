-- Migration: Year 2 - Systemic Pharmacology MCQ Bank (PART 4: 211-280)
-- Date: 2026-04-25
-- Based on: Lippincott, Katzung, and Rang & Dale

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'systemic-pharmacology' LIMIT 1;

    -- 2. Prevent Duplicates by removing existing questions for this part
    DELETE FROM mcqs 
    WHERE topic_id = v_topic_id 
    AND question IN (
        'Which type of Insulin has the fastest onset and shortest duration (often used just before meals)?',
        'Glargine and Detemir are examples of:',
        'What is the most common side effect of Insulin therapy?',
        'Metformin is the first-line drug for Type 2 Diabetes. Its primary mechanism is:',
        'What is the most serious (though rare) side effect of Metformin?',
        'Sulfonylureas (e.g., Glyburide, Glipizide) work by:',
        'Which class of diabetes drugs (e.g., Pioglitazone) acts as an agonist for PPAR-gamma to increase insulin sensitivity?',
        'Exenatide and Liraglutide are used for diabetes and weight loss. They act as:',
        'Which class of drugs (e.g., Sitagliptin) prevents the breakdown of endogenous GLP-1?',
        'Canagliflozin and Empagliflozin lower blood glucose by:',
        'A major side effect of SGLT2 inhibitors is:',
        'Acarbose and Miglitol act by:',
        'Which drug is used for the emergency treatment of severe hypoglycemia in a patient who is unconscious?',
        'The drug of choice for Hypothyroidism is:',
        'Propylthiouracil (PTU) and Methimazole are used for Hyperthyroidism. PTU is unique because it also:',
        'Which anti-thyroid drug is preferred in the first trimester of pregnancy?',
        'What is the mechanism of action of Glucocorticoids (e.g., Prednisone)?',
        'Chronic use of high-dose corticosteroids can cause:',
        'Sudden withdrawal of chronic corticosteroids can lead to:',
        'Which drug is a selective estrogen receptor modulator (SERM) used to treat and prevent breast cancer?',
        'Raloxifene is a SERM preferred for osteoporosis because it:',
        'Clomiphene is used to treat:',
        'The mechanism of \"Mini-pills\" (Progestin-only) is primarily:',
        'Mifepristone (RU-486) is used for medical abortion. It is an:',
        'Finasteride is used for BPH and male-pattern baldness. Its mechanism is:',
        'Sildenafil (Viagra) works by:',
        'Which drug is a \"Short-Acting Beta Agonist\" (SABA) used as a rescue inhaler in asthma?',
        'The first-line drug for chronic management of persistent asthma is:',
        'Montelukast and Zafirlukast are used in asthma. They act by:',
        'What is the mechanism of Theophylline?',
        'Which drug is a monoclonal antibody that binds to IgE, used in severe allergic asthma?',
        'A patient on chronic Prednisone for asthma should be monitored for:',
        'The mechanism of Proton Pump Inhibitors (PPIs like Omeprazole) is:',
        'Which H2 receptor antagonist is notorious for causing gynecomastia and inhibiting CYP450?',
        'Misoprostol is used to prevent NSAID-induced ulcers. It is a:',
        'Which GI drug acts as a \"physical barrier\" by forming a paste-like substance in the presence of acid to coat ulcers?',
        'Ondansetron is a first-line antiemetic for chemotherapy-induced nausea. Its mechanism is:',
        'Metoclopramide is used for gastroparesis. It acts as a:',
        'The primary mechanism of Aspirin is:',
        'NSAIDs (e.g., Ibuprofen, Naproxen) cause gastric ulcers primarily by inhibiting the production of:',
        'Which NSAID is selective for COX-2 and has a lower risk of GI ulcers but a higher risk of cardiovascular events?',
        'Acetaminophen (Paracetamol) differs from NSAIDs because it lacks significant:',
        'What is the toxic metabolite of Acetaminophen responsible for liver necrosis in overdose?',
        'What is the antidote for Acetaminophen overdose?',
        'Which drug is used for acute Gout attacks by inhibiting microtubule polymerization and neutrophil migration?',
        'Allopurinol is used for chronic Gout prophylaxis. Its mechanism is:',
        'Probenecid lowers uric acid levels by:',
        'Which H1 antihistamine is \"first-generation\" and highly sedative with significant anticholinergic effects?',
        'Which 2nd generation antihistamine is non-sedating and preferred for seasonal allergies?',
        'What is the mechanism of Montelukast in treating asthma?'
    );

    -- SECTION 10: ENDOCRINE PHARMACOLOGY - DIABETES (211-230)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which type of Insulin has the fastest onset and shortest duration (often used just before meals)?', '["NPH", "Glargine", "Lispro", "Detemir"]', 2, 'Lispro, Aspart, and Glulisine are rapid-acting insulins.'),
    (v_topic_id, 'Glargine and Detemir are examples of:', '["Rapid-acting insulin", "Short-acting insulin", "Intermediate-acting insulin", "Long-acting (peakless) insulin"]', 3, 'These provide a basal level of insulin for ~24 hours.'),
    (v_topic_id, 'What is the most common side effect of Insulin therapy?', '["Weight loss", "Hypoglycemia", "Hypertension", "Lactic acidosis"]', 1, 'Hypoglycemia is the most frequent and potentially dangerous adverse effect.'),
    (v_topic_id, 'Metformin is the first-line drug for Type 2 Diabetes. Its primary mechanism is:', '["Stimulating insulin release", "Decreasing hepatic gluconeogenesis", "Increasing glucose excretion", "Blocking alpha-glucosidase"]', 1, 'Metformin also increases peripheral insulin sensitivity via AMPK activation.'),
    (v_topic_id, 'What is the most serious (though rare) side effect of Metformin?', '["Hypoglycemia", "Lactic Acidosis", "Weight gain", "Kidney stones"]', 1, 'Lactic acidosis can occur, especially in patients with renal impairment (Metformin is excreted unchanged by kidneys).'),
    (v_topic_id, 'Sulfonylureas (e.g., Glyburide, Glipizide) work by:', '["Binding to the PPAR-gamma receptor", "Closing ATP-sensitive K+ channels in B-cells", "Inhibiting DPP-4", "Mimicking Incretins"]', 1, 'Closing K+ channels causes depolarization and Ca2+ influx, leading to insulin release.'),
    (v_topic_id, 'Which class of diabetes drugs (e.g., Pioglitazone) acts as an agonist for PPAR-gamma to increase insulin sensitivity?', '["Sulfonylureas", "Thiazolidinediones (TZDs)", "GLP-1 agonists", "SGLT2 inhibitors"]', 1, 'TZDs take weeks to work as they affect gene transcription.'),
    (v_topic_id, 'Exenatide and Liraglutide are used for diabetes and weight loss. They act as:', '["DPP-4 inhibitors", "GLP-1 receptor agonists", "Amylin analogs", "SGLT2 inhibitors"]', 1, 'GLP-1 agonists (Incretin mimetics) increase glucose-dependent insulin release and slow gastric emptying.'),
    (v_topic_id, 'Which class of drugs (e.g., Sitagliptin) prevents the breakdown of endogenous GLP-1?', '["DPP-4 inhibitors", "SGLT2 inhibitors", "Alpha-glucosidase inhibitors", "Meglitinides"]', 0, 'Sitagliptin and Saxagliptin are "Gliptins."'),
    (v_topic_id, 'Canagliflozin and Empagliflozin lower blood glucose by:', '["Inhibiting gluconeogenesis", "Inhibiting SGLT2 in the proximal tubule", "Blocking glucose absorption in the gut", "Increasing insulin secretion"]', 1, 'They promote glucose excretion in the urine ("Glucosuria").'),
    (v_topic_id, 'A major side effect of SGLT2 inhibitors is:', '["Hypoglycemia", "Genitourinary infections (Candidiasis, UTIs)", "Lactic acidosis", "Weight gain"]', 1, 'The presence of glucose in the urine promotes bacterial and fungal growth.'),
    (v_topic_id, 'Acarbose and Miglitol act by:', '["Inhibiting alpha-glucosidase in the gut", "Stimulating insulin release", "Inhibiting renal reabsorption", "Increasing liver glucose output"]', 0, 'They delay the digestion of carbohydrates, leading to flatulence and GI upset.'),
    (v_topic_id, 'Which drug is used for the emergency treatment of severe hypoglycemia in a patient who is unconscious?', '["Insulin", "Glucagon", "Metformin", "Acarbose"]', 1, 'Glucagon (IM/Subcutaneous) stimulates hepatic glucose output.'),

    -- SECTION 11: ENDOCRINE - THYROID, STEROIDS & REPRODUCTION (231-255)
    (v_topic_id, 'The drug of choice for Hypothyroidism is:', '["Propylthiouracil (PTU)", "Levothyroxine (T4)", "Methimazole", "Radioactive Iodine"]', 1, 'T4 is preferred over T3 because it has a longer half-life and acts as a reservoir.'),
    (v_topic_id, 'Propylthiouracil (PTU) and Methimazole are used for Hyperthyroidism. PTU is unique because it also:', '["Inhibits the release of thyroid hormone", "Inhibits peripheral conversion of T4 to T3", "Destroys the thyroid gland", "Binds to TSH receptors"]', 1, 'PTU is preferred in thyroid storm for this reason.'),
    (v_topic_id, 'Which anti-thyroid drug is preferred in the first trimester of pregnancy?', '["Methimazole", "Propylthiouracil (PTU)", "Radioactive Iodine", "Lithium"]', 1, 'Methimazole is associated with teratogenicity (aplasia cutis), so PTU is used in the 1st trimester.'),
    (v_topic_id, 'What is the mechanism of action of Glucocorticoids (e.g., Prednisone)?', '["Inhibition of COX-1 only", "Inhibition of Phospholipase A2 and gene transcription", "Blockade of histamine receptors", "Stimulation of the immune system"]', 1, 'Steroids increase the synthesis of lipocortin, which inhibits PLA2, the first step in the arachidonic acid cascade.'),
    (v_topic_id, 'Chronic use of high-dose corticosteroids can cause:', '["Addison''s disease", "Cushingoid features (Moon face, Buffalo hump)", "Weight loss", "Hypoglycemia"]', 1, 'Iatrogenic Cushing syndrome is a major complication.'),
    (v_topic_id, 'Sudden withdrawal of chronic corticosteroids can lead to:', '["Hypertension", "Acute Adrenal Insufficiency (Crisis)", "Hyperglycemia", "Hypernatremia"]', 1, 'Chronic use suppresses the HPA axis; time is needed for the adrenal glands to recover.'),
    (v_topic_id, 'Which drug is a selective estrogen receptor modulator (SERM) used to treat and prevent breast cancer?', '["Clomiphene", "Tamoxifen", "Anastrozole", "Finasteride"]', 1, 'Tamoxifen is an antagonist in the breast but an agonist in bone and endometrium.'),
    (v_topic_id, 'Raloxifene is a SERM preferred for osteoporosis because it:', '["Is an agonist in the breast", "Is an antagonist in the endometrium (no risk of cancer)", "Is more potent than estrogen", "Causes weight loss"]', 1, 'Unlike tamoxifen, raloxifene does not increase the risk of uterine cancer.'),
    (v_topic_id, 'Clomiphene is used to treat:', '["Breast cancer", "Infertility (induces ovulation)", "Prostate cancer", "Endometriosis"]', 1, 'Clomiphene blocks estrogen receptors in the hypothalamus, preventing negative feedback and increasing FSH/LH.'),
    (v_topic_id, 'The mechanism of "Mini-pills" (Progestin-only) is primarily:', '["Inhibition of ovulation", "Thickening of cervical mucus and endometrial thinning", "Blocking sperm motility", "Inducing menstruation"]', 1, 'Progestins mainly affect the mucus; combined pills more reliably inhibit ovulation.'),
    (v_topic_id, 'Mifepristone (RU-486) is used for medical abortion. It is an:', '["Estrogen agonist", "Progesterone antagonist", "Prostaglandin analog", "Androgen blocker"]', 1, 'It blocks the progesterone needed to maintain the pregnancy.'),
    (v_topic_id, 'Finasteride is used for BPH and male-pattern baldness. Its mechanism is:', '["5-alpha-reductase inhibitor", "Androgen receptor blocker", "Alpha-1 blocker", "PDE5 inhibitor"]', 0, 'It prevents the conversion of testosterone to the more potent dihydrotestosterone (DHT).'),
    (v_topic_id, 'Sildenafil (Viagra) works by:', '["Increasing Nitric Oxide production", "Inhibiting Phosphodiesterase V (PDE5)", "Blocking alpha-receptors", "Stimulating testosterone"]', 1, 'Inhibition of PDE5 keeps cGMP levels high in the corpus cavernosum.'),

    -- SECTION 12: RESPIRATORY & GI PHARMACOLOGY (256-270)
    (v_topic_id, 'Which drug is a "Short-Acting Beta Agonist" (SABA) used as a rescue inhaler in asthma?', '["Salmeterol", "Albuterol", "Fluticasone", "Ipratropium"]', 1, 'Albuterol is the mainstay for acute bronchospasm.'),
    (v_topic_id, 'The first-line drug for chronic management of persistent asthma is:', '["Inhaled Corticosteroid (ICS)", "Theophylline", "Montelukast", "Cromolyn"]', 0, 'ICS (e.g., Fluticasone, Budesonide) target the underlying inflammation.'),
    (v_topic_id, 'Montelukast and Zafirlukast are used in asthma. They act by:', '["Inhibiting 5-Lipoxygenase", "Blocking Leukotriene (CysLT1) receptors", "Stabilizing mast cells", "Stimulating beta-2 receptors"]', 1, 'They are particularly useful in aspirin-sensitive and exercise-induced asthma.'),
    (v_topic_id, 'What is the mechanism of Theophylline?', '["Beta-2 agonist", "Phosphodiesterase inhibition and Adenosine receptor block", "Steroid receptor binding", "Mast cell stabilizer"]', 1, 'Theophylline has a narrow therapeutic index and requires monitoring.'),
    (v_topic_id, 'Which drug is a monoclonal antibody that binds to IgE, used in severe allergic asthma?', '["Omalizumab", "Mepolizumab", "Adalimumab", "Rituximab"]', 0, 'Omalizumab prevents IgE from binding to mast cells.'),
    (v_topic_id, 'A patient on chronic Prednisone for asthma should be monitored for:', '["Osteoporosis", "Cataracts", "Hyperglycemia", "All of the above"]', 3, 'Systemic steroids have widespread side effects.'),
    (v_topic_id, 'The mechanism of Proton Pump Inhibitors (PPIs like Omeprazole) is:', '["H2 receptor block", "Irreversible inhibition of H+/K+ ATPase", "Neutralizing acid", "Coating the stomach"]', 1, 'PPIs are the most potent inhibitors of gastric acid secretion.'),
    (v_topic_id, 'Which H2 receptor antagonist is notorious for causing gynecomastia and inhibiting CYP450?', '["Ranitidine", "Famotidine", "Cimetidine", "Nizatidine"]', 2, 'Cimetidine has anti-androgenic effects and many drug interactions.'),
    (v_topic_id, 'Misoprostol is used to prevent NSAID-induced ulcers. It is a:', '["Prostaglandin E1 analog", "H2 blocker", "PPI", "Antacid"]', 0, 'Misoprostol increases mucus/bicarbonate and decreases acid. (Warning: Abortifacient).'),
    (v_topic_id, 'Which GI drug acts as a "physical barrier" by forming a paste-like substance in the presence of acid to coat ulcers?', '["Loperamide", "Sucralfate", "Metoclopramide", "Ondansetron"]', 1, 'Sucralfate requires an acidic environment to work, so it shouldn''t be taken with PPIs.'),
    (v_topic_id, 'Ondansetron is a first-line antiemetic for chemotherapy-induced nausea. Its mechanism is:', '["D2 antagonist", "5-HT3 receptor antagonist", "H1 blocker", "NK1 antagonist"]', 1, '5-HT3 blockers act both peripherally (gut) and centrally (CTZ).'),
    (v_topic_id, 'Metoclopramide is used for gastroparesis. It acts as a:', '["D2 receptor antagonist and prokinetic", "Muscarinic blocker", "Serotonin agonist", "PPI"]', 0, 'Metoclopramide increases GI motility but can cause EPS (Parkinsonism).'),

    -- SECTION 13: AUTACOIDS, NSAIDS & GOUT (271-280)
    (v_topic_id, 'The primary mechanism of Aspirin is:', '["Reversible inhibition of COX-1 and COX-2", "Irreversible inhibition of COX-1 and COX-2 via acetylation", "Selective COX-2 inhibition", "Inhibition of Lipoxygenase"]', 1, 'Aspirin''s irreversible action is why its anti-platelet effect lasts for the life of the platelet.'),
    (v_topic_id, 'NSAIDs (e.g., Ibuprofen, Naproxen) cause gastric ulcers primarily by inhibiting the production of:', '["Thromboxane A2", "Prostaglandin E2 and I2", "Leukotrienes", "Nitric Oxide"]', 1, 'PGE2 and PGI2 are cytoprotective in the stomach.'),
    (v_topic_id, 'Which NSAID is selective for COX-2 and has a lower risk of GI ulcers but a higher risk of cardiovascular events?', '["Indomethacin", "Celecoxib", "Diclofenac", "Ketorolac"]', 1, 'Celecoxib spares COX-1 (stomach) but may tip the balance toward thrombosis.'),
    (v_topic_id, 'Acetaminophen (Paracetamol) differs from NSAIDs because it lacks significant:', '["Analgesic activity", "Antipyretic activity", "Anti-inflammatory activity", "Liver toxicity"]', 2, 'Acetaminophen is NOT an anti-inflammatory drug; it acts primarily in the CNS.'),
    (v_topic_id, 'What is the toxic metabolite of Acetaminophen responsible for liver necrosis in overdose?', '["NAPQI", "Glutathione", "Acetic acid", "Para-aminophenol"]', 0, 'NAPQI accumulates when glutathione stores are depleted.'),
    (v_topic_id, 'What is the antidote for Acetaminophen overdose?', '["N-acetylcysteine (NAC)", "Flumazenil", "Atropine", "Naloxone"]', 0, 'NAC restores glutathione levels.'),
    (v_topic_id, 'Which drug is used for acute Gout attacks by inhibiting microtubule polymerization and neutrophil migration?', '["Allopurinol", "Colchicine", "Probenecid", "Febuxostat"]', 1, 'Colchicine is for acute relief. It can cause significant diarrhea.'),
    (v_topic_id, 'Allopurinol is used for chronic Gout prophylaxis. Its mechanism is:', '["Increasing uric acid excretion", "Inhibition of Xanthine Oxidase", "Increasing uric acid metabolism", "Blocking IL-1"]', 1, 'Xanthine oxidase inhibition reduces the production of uric acid.'),
    (v_topic_id, 'Probenecid lowers uric acid levels by:', '["Inhibiting its synthesis", "Inhibiting its reabsorption in the proximal tubule", "Degrading uric acid to allantoin", "Blocking neutrophil activation"]', 1, 'Probenecid is a "uricosuric" agent.'),
    (v_topic_id, 'Which H1 antihistamine is "first-generation" and highly sedative with significant anticholinergic effects?', '["Loratadine", "Diphenhydramine", "Cetirizine", "Fexofenadine"]', 1, 'First-gen antihistamines cross the BBB. Second-gen (e.g., Loratadine) do not.'),
    (v_topic_id, 'Which 2nd generation antihistamine is non-sedating and preferred for seasonal allergies?', '["Diphenhydramine", "Loratadine", "Hydroxyzine", "Promethazine"]', 1, 'Loratadine, Cetirizine, and Fexofenadine do not cross the BBB significantly.'),
    (v_topic_id, 'What is the mechanism of Montelukast in treating asthma?', '["Lipoxygenase inhibitor", "Leukotriene receptor antagonist", "Beta-2 agonist", "Mast cell stabilizer"]', 1, 'Montelukast blocks CysLT1 receptors to prevent bronchoconstriction and inflammation.');

    RAISE NOTICE 'SUCCESS: Systemic Pharmacology MCQ Part 4 (211-280) registered.';
END $$;

COMMIT;
