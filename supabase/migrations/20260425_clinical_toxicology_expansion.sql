-- Migration: Year 2 - Clinical Toxicology MCQ Bank (FINAL EXPANSION: 296-335)
-- Date: 2026-04-25
-- Target: Reach 335 US MD / MBBS Level Questions

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'clinical-toxicology' LIMIT 1;

    -- SECTION 14: ADVANCED CRITICAL CARE & PLANT TOXINS (296-335)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which plant toxin inhibits the 60S ribosomal subunit, stopping protein synthesis similarly to Shiga toxin?', '["Ricinus communis (Ricin)", "Atropa belladonna", "Digitalis", "Oleander"]', 0, 'Ricin is an extremely potent Type II Ribosome-Inactivating Protein.'),
    (v_topic_id, 'A patient eats "Lily of the Valley." Which cardiac toxin does it contain?', '["Cyanide", "Cardiac Glycosides (similar to Digoxin)", "Atropine", "Strychnine"]', 1, 'Lily of the Valley, Oleander, and Foxglove all contain cardiac glycosides.'),
    (v_topic_id, 'Which plant causes "Water Hemlock" poisoning, the most violently toxic plant in North America?', '["Cicutoxin", "Coniine", "Nicotine", "Taxine"]', 0, 'Cicutoxin is a GABA antagonist that causes intractable seizures.'),
    (v_topic_id, 'Socrates was famously executed using "Poison Hemlock." What is the active toxin?', '["Cicutoxin", "Coniine", "Atropine", "Strychnine"]', 1, 'Coniine causes ascending paralysis similar to Guillain-Barre syndrome.'),
    (v_topic_id, 'Ingestion of "Ackee fruit" (unripe) causes which metabolic emergency?', '["Hyperglycemia", "Hypoglycin A-induced severe hypoglycemia (Jamaican Vomiting Sickness)", "Metabolic alkalosis", "None"]', 1, 'Hypoglycin A inhibits fatty acid oxidation.'),
    (v_topic_id, 'Which industrial gas smells like "Freshly cut hay" and causes delayed pulmonary edema?', '["Chlorine", "Phosgene", "Ammonia", "Carbon Monoxide"]', 1, 'Phosgene reacts with lung tissue to produce HCl, but the onset is delayed.'),
    (v_topic_id, 'What is the management for "Chlorine Gas" inhalation?', '["Atropine", "Humidified oxygen and potentially nebulized Sodium Bicarbonate", "Naloxone", "Intubation only"]', 1, 'Nebulized bicarbonate helps neutralize the acid formed by chlorine in the airway.'),
    (v_topic_id, 'A worker in a "Semiconductor" plant presents with hemolysis and "garlic breath" after exposure to a gas. Suspect:', '["Arsine gas", "Cyanide", "Nitrogen", "Oxygen"]', 0, 'Arsine is a potent hemolytic agent.'),
    (v_topic_id, '"Metal Fume Fever" is most commonly caused by inhalation of which metal oxide?', '["Lead", "Zinc Oxide", "Iron", "Mercury"]', 1, 'Common in welders ("Welder''s ague").'),
    (v_topic_id, 'Which toxin is associated with "Polymer Fume Fever" (Teflon flu)?', '["Polytetrafluoroethylene (PTFE) decomposition products", "PVC", "Rubber", "None"]', 0, 'Occurs when Teflon is overheated.'),
    (v_topic_id, 'Treatment for "Vitamin A" toxicity (Hypervitaminosis A)?', '["Liver transplant", "Discontinuation and supportive care", "Vitamin K", "Aspirin"]', 1, 'Chronic excess causes bone pain, hair loss, and hepatosplenomegaly.'),
    (v_topic_id, 'Acute Vitamin A toxicity can present with which CNS finding?', '["Stroke", "Pseudotumor Cerebri (Idiopathic Intracranial Hypertension)", "Coma", "Blindness"]', 1, 'Bulging fontanelles in infants and papilledema in adults.'),
    (v_topic_id, 'A patient on chronic "Lithium" presents with coarse tremors, ataxia, and confusion. What is the priority treatment if the level is > 4.0 mEq/L?', '["IV Saline", "Hemodialysis", "Charcoal", "Naloxone"]', 1, 'Hemodialysis is the definitive treatment for severe lithium toxicity.'),
    (v_topic_id, 'Why is "Activated Charcoal" useless in Lithium overdose?', '["Lithium is an element and doesn''t bind to charcoal", "Lithium is too large", "Charcoal is too acidic", "None"]', 0, 'Lithium (and other metals/electrolytes) does not adsorb to charcoal.'),
    (v_topic_id, 'The "Antidote" for Valproic Acid overdose associated with hyperammonemia is:', '["N-acetylcysteine", "L-Carnitine", "Glucagon", "Atropine"]', 1, 'L-Carnitine aids in the metabolism of valproate and nitrogen excretion.'),
    (v_topic_id, 'A patient presents with "Mydriasis" and "Tachycardia" after using an over-the-counter nasal spray too much. Toxin?', '["Aspirin", "Imidazolines (e.g., Oxymetazoline/Afrin)", "Vitamin C", "Zinc"]', 1, 'Large doses cause a clonidine-like effect (CNS depression and bradycardia in children).'),
    (v_topic_id, 'Management of "Body Packers" involves which decontamination method?', '["Emetics", "Whole Bowel Irrigation (PEG-ELS)", "Surgery for everyone", "None"]', 1, 'WBI is used to safely pass packets; surgery is only for rupture or obstruction.'),
    (v_topic_id, 'Which toxin causes "Blue-Man Syndrome" (Amiodarone) or "Argyria" (Silver)?', '["Iron", "Silver (Argyria)", "Lead", "Mercury"]', 1, 'Silver causes permanent blue-gray skin discoloration.'),
    (v_topic_id, 'A patient presents with a "Metallic taste," gingivitis, and "Madness" (psychiatric changes). Historically associated with hat-making?', '["Lead", "Mercury (Erethism)", "Arsenic", "Iron"]', 1, 'The "Mad Hatter" was due to elemental mercury exposure.'),
    (v_topic_id, 'Which toxin is associated with "Honey" ingestion in infants, leading to "Floppy Baby Syndrome"?', '["Lead", "Clostridium botulinum (Botulism spores)", "Mercury", "Vitamin A"]', 1, 'Infant botulism occurs due to colonization of the GI tract.'),
    (v_topic_id, 'The "Antidote" for Botulism is:', '["Antibiotics", "Equine-derived Heptavalent Antitoxin (HBAT) or BIG-IV", "Atropine", "Naloxone"]', 1, 'Antitoxin neutralizes circulating toxin but doesn''t reverse existing paralysis.'),
    (v_topic_id, 'Which heavy metal is associated with "Lung Cancer" and "Mesothelioma" risk in industrial workers?', '["Lead", "Asbestos (Technically a mineral fiber)", "Mercury", "Iron"]', 1, 'Asbestos is the classic industrial toxin for lung pathology.'),
    (v_topic_id, 'The hallmark of "Silo Filler''s Disease" is exposure to which gas?', '["Carbon Dioxide", "Nitrogen Dioxide (NO2)", "Methane", "Ammonia"]', 1, 'Found in fermenting grain silos; causes chemical pneumonitis.'),
    (v_topic_id, 'What is the "First-line" treatment for "Mushroom" poisoning with early GI symptoms (< 2 hours)?', '["Atropine", "Supportive care and Charcoal (usually not Amanita if early)", "Liver transplant", "None"]', 1, 'Early symptoms usually suggest less toxic mushrooms; late symptoms (> 6h) are more dangerous.'),
    (v_topic_id, 'Which toxin causes "Gyremerin" poisoning, leading to a "Monomethylhydrazine" toxidrome (seizures/liver failure)?', '["Gyromitra (False Morels)", "Amanita", "Psilocybe", "Morels"]', 0, 'False morels contain gyromitrin; Pyridoxine is the antidote for seizures.'),
    (v_topic_id, 'Management of "Ciguatera" fish poisoning?', '["Antivenin", "Supportive care and potentially IV Mannitol", "Antibiotics", "Aspirin"]', 1, 'Ciguatera causes "Cold Reversal" (hot feels cold).'),
    (v_topic_id, '"Scombroid" fish poisoning is caused by the bacterial conversion of histidine to:', '["Ciguatoxin", "Histamine", "Tetrodotoxin", "Saxitoxin"]', 1, 'Occurs in poorly refrigerated fish (Tuna, Mahi-mahi); presents like an allergic reaction.'),
    (v_topic_id, 'Which fish toxin causes "Paralytic Shellfish Poisoning" by blocking sodium channels?', '["Histamine", "Saxitoxin (from Red Tide Dinoflagellates)", "Ciguatoxin", "None"]', 1, 'Similar mechanism to Tetrodotoxin.'),
    (v_topic_id, 'What is the mechanism of "Tetrodotoxin" (Pufferfish)?', '["GABA blocker", "Voltage-gated Sodium channel blocker", "Mu agonist", "Acetylcholine agonist"]', 1, 'Causes rapid ascending paralysis and respiratory failure.'),
    (v_topic_id, 'A patient on "Theophylline" overdose develops refractory seizures and tachyarrhythmias. Treatment?', '["Beta-blockers", "Hemodialysis or Hemoperfusion", "Naloxone", "Atropine"]', 1, 'Theophylline is highly clearable via extracorporeal methods.'),
    (v_topic_id, 'Which drug causes "Hypokalemia" and "Hyperglycemia" in acute overdose?', '["Beta-blockers", "Theophylline / Caffeine", "Iron", "Aspirin"]', 1, 'Beta-2 stimulation and phosphodiesterase inhibition.'),
    (v_topic_id, 'The "Antidote" for "Isoniazid (INH)" induced seizures is:', '["Diazepam", "Pyridoxine (Vitamin B6)", "Thiamine", "Naloxone"]', 1, 'INH inhibits the production of GABA by depleting B6.'),
    (v_topic_id, 'A patient with "Methylene Blue" treatment for methemoglobinemia who has G6PD deficiency will develop:', '["Stroke", "Severe Hemolysis", "Blindness", "Nothing"]', 1, 'Methylene blue requires NADPH to work; in G6PD deficiency, it becomes an oxidant.'),
    (v_topic_id, 'Which toxin causes "Acorn-shaped" calcium oxalate crystals?', '["Ethanol", "Ethylene Glycol", "Methanol", "Aspirin"]', 1, 'Monohydrate crystals look like spindles/acorns; dihydrate look like envelopes.'),
    (v_topic_id, 'Management of "Lye" (Alkali) ingestion in the first 24 hours?', '["Neutralize with lemon juice", "Endoscopy to grade the burn", "Gastric lavage", "None"]', 1, 'Grading the burn via endoscopy is critical for long-term management.'),
    (v_topic_id, 'Which heavy metal is associated with "Peripheral Neuropathy" (Stocking-glove) and "Skin cancer"?', '["Lead", "Arsenic", "Mercury", "Iron"]', 1, 'Chronic arsenicosis.'),
    (v_topic_id, 'What is the "Treatment" for a venomous "Cobra" bite?', '["Suction", "Specific Antivenin (Polyvalent or Monovalent)", "Tourniquet", "None"]', 1, 'Neurotoxic cobra venom requires rapid antivenin administration.'),
    (v_topic_id, 'Which toxin causes "Mouth-feel" of sand or grit (asbestos related)?', '["Lead", "Asbestos", "Mercury", "None"]', 1, 'Asbestos fibers are microscopic and have no taste; this is a trick question.'),
    (v_topic_id, 'The term "Toxidrome" was coined by which famous toxicologist?', '["Paracelsus", "Mofenson", "Rumack", "Done"]', 1, 'Dr. Howard Mofenson.'),
    (v_topic_id, '"The dose makes the poison" is a quote by:', '["Socrates", "Paracelsus", "Hippocrates", "Osler"]', 1, 'Philippus Aureolus Theophrastus Bombastus von Hohenheim (Paracelsus).');

    RAISE NOTICE 'SUCCESS: Clinical Toxicology Final Expansion (296-335) registered.';
END $$;

COMMIT;
