-- Migration: Year 2 - Clinical Toxicology MCQ Bank (PART 5: 281-335)
-- Date: 2026-04-25
-- Target: US MD / MBBS Level (Pesticides, Bites & Household)

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'clinical-toxicology' LIMIT 1;

    -- SECTION 11: PESTICIDES (281-305)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'What is the mechanism of Organophosphate poisoning?', '["Irreversible inhibition of Acetylcholinesterase", "Reversible inhibition of Acetylcholinesterase", "Blocking Muscarinic receptors", "Stimulating Dopamine"]', 0, 'Organophosphates form a stable covalent bond with the enzyme, leading to a cholinergic crisis.'),
    (v_topic_id, 'What is "Aging" in the context of Organophosphate poisoning?', '["The patient getting older", "The chemical process where the enzyme-poison bond becomes permanently irreversible", "Enzyme recovery", "Liver failure"]', 1, 'Oximes must be given BEFORE aging occurs to be effective.'),
    (v_topic_id, 'Antidote for Muscarinic symptoms (SLUDGE/DUMBELS) in organophosphate poisoning?', '["Pralidoxime (2-PAM)", "Atropine", "Naloxone", "Diazepam"]', 1, 'Atropine competitively blocks muscarinic receptors.'),
    (v_topic_id, 'What is the role of Pralidoxime (2-PAM)?', '["Blocks muscarinic receptors", "Reactivates Acetylcholinesterase by removing the phosphate group (if given early)", "Sedation", "Increases blood pressure"]', 1, '2-PAM is the specific "regenerator" of the enzyme.'),
    (v_topic_id, 'Which drug should be titrated to the "Drying of bronchial secretions" in organophosphate poisoning?', '["Pralidoxime", "Atropine", "Albuterol", "Furosemide"]', 1, 'Atropinization is successful when the lungs are clear; pupil size is a less reliable marker.'),
    (v_topic_id, 'How do Carbamates (e.g., Sevin) differ from Organophosphates?', '["They are more toxic", "They cause reversible inhibition and do not undergo aging", "They block dopamine", "None"]', 1, 'Carbamates bind reversibly; Atropine is used, but 2-PAM is usually not required.'),
    (v_topic_id, 'A patient presents with severe Cholinergic crisis after working in a field. What is the first priority after ABCs?', '["Giving Atropine", "Decontamination (Removing clothes and washing skin)", "Gastric lavage", "Ordering a toxicology screen"]', 1, 'Organophosphates are absorbed through the skin; failure to decontaminate can poison the medical staff.'),
    (v_topic_id, 'Which herbicide causes "Pulmonary Fibrosis" by generating free radicals?', '["Glyphosate (Roundup)", "Paraquat", "Atrazine", "2,4-D"]', 1, 'Paraquat is highly toxic; oxygen therapy can actually worsen the lung damage by providing more free radicals.'),
    (v_topic_id, 'Treatment for Paraquat ingestion?', '["High-flow oxygen", "Fuller''s Earth or Activated Charcoal (to prevent absorption)", "Urinary alkalinization", "Hemodialysis"]', 1, 'Aggressive prevention of absorption is the only hope, as there is no specific antidote.'),
    (v_topic_id, 'Organophosphate-induced "Intermediate Syndrome" presents as:', '["Delayed liver failure", "Muscle weakness (neck flexors, respiratory) 24-96 hours after the acute crisis", "Blindness", "Heart block"]', 1, 'Occurs after the acute cholinergic crisis has resolved.'),
    (v_topic_id, '"OPIDN" (Organophosphate-Induced Delayed Neuropathy) is characterized by:', '["Dementia", "Distal axonal degeneration (Wallerian) leading to foot drop/weakness 1-3 weeks later", "Seizures", "None"]', 1, 'Due to inhibition of Neuropathy Target Esterase (NTE).'),
    (v_topic_id, 'Which pesticide is an "Anticoagulant" similar to Warfarin (Superwarfarins)?', '["Malathion", "Brodifacoum", "Paraquat", "Pyrethrins"]', 1, 'Superwarfarins (found in rodenticides) have extremely long half-lives (weeks to months).'),
    (v_topic_id, 'Treatment for Superwarfarin (Brodifacoum) ingestion?', '["High-dose Vitamin K1 (Phytonadione) for weeks/months", "Heparin", "Aspirin", "Vitamin C"]', 0, 'Phresh Frozen Plasma (FFP) is used for acute bleeding; long-term Vitamin K is required.'),
    (v_topic_id, '"Strychnine" poisoning causes seizures by which mechanism?', '["GABA blockade", "Competitive antagonism of Glycine receptors in the spinal cord", "Dopamine release", "None"]', 1, 'Loss of glycine-mediated inhibition leads to "spinal seizures" (opisthotonus).'),
    (v_topic_id, 'Management of Strychnine poisoning?', '["Atropine", "Benzodiazepines and minimal external stimulation", "Naloxone", "Gastric lavage"]', 1, 'Similar to tetanus; prevent muscle spasms.'),

    -- SECTION 12: BITES, STINGS & MUSHROOMS (306-320)
    (v_topic_id, 'A patient bitten by a snake develops "Local tissue necrosis" and "Coagulopathy." Which snake is most likely?', '["Coral snake", "Pit Viper (e.g., Rattlesnake, Copperhead)", "Cobra", "Sea snake"]', 1, 'Crotalinae (Pit vipers) have hemotoxic/proteolytic venom.'),
    (v_topic_id, 'A patient bitten by a snake develops "Respiratory paralysis" and "Ptosis" WITHOUT local swelling. Which snake?', '["Rattlesnake", "Coral snake", "Copperhead", "None"]', 1, 'Elapids (Coral snakes, Cobras) have neurotoxic venom.'),
    (v_topic_id, 'Antidote for Pit Viper (Crotalinae) bites?', '["N-acetylcysteine", "CroFab (Antivenin)", "Atropine", "Heparin"]', 1, 'Fab fragments of ovine antivenin.'),
    (v_topic_id, 'Which spider bite causes "Systemic Latrodectism" (severe muscle pain, rigid abdomen, and diaphoresis)?', '["Brown Recluse", "Black Widow (Latrodectus)", "Tarantula", "Wolf spider"]', 1, 'The venom (alpha-latrotoxin) causes massive release of acetylcholine and norepinephrine.'),
    (v_topic_id, 'Management of Black Widow spider bite?', '["Antivenin (reserved for severe cases), Benzodiazepines, and Opioids", "Antibiotics", "Aspirin", "Surgery"]', 0, 'Pain control and muscle relaxation are key.'),
    (v_topic_id, 'Which spider bite causes "Dermonecrosis" (eschar formation) and rarely hemolysis?', '["Black Widow", "Brown Recluse (Loxosceles)", "Jumping spider", "None"]', 1, 'Venom contains Sphingomyelinase D, which causes tissue destruction.'),
    (v_topic_id, 'Treatment for Brown Recluse bite?', '["Immediate surgery", "Supportive care (Wound care, cold packs, and Dapsone - though controversial)", "Naloxone", "Atropine"]', 1, 'Most heal with conservative care; surgery should be delayed until the lesion stabilizes.'),
    (v_topic_id, 'A patient consumes a wild mushroom and develops "Severe vomiting and diarrhea 6-12 hours later," followed by "Liver failure." Which mushroom?', '["Amanita phalloides (Death Cap)", "Psilocybe", "Amanita muscaria", "Morel"]', 0, 'Amatoxin inhibits RNA polymerase II, stopping protein synthesis in hepatocytes.'),
    (v_topic_id, 'Treatment for Amatoxin (Death Cap) poisoning?', '["Activated charcoal", "Silibinin (Milk thistle extract), NAC, and potentially liver transplant", "Atropine", "Fomepizole"]', 1, 'Multi-dose charcoal and high-dose Penicillin/Silibinin are used to block toxin uptake.'),
    (v_topic_id, 'Consumption of "Amanita muscaria" causes which toxidrome?', '["Opioid", "Cholinergic (Ibotenic acid/Muscimol can cause mixed features)", "Sympathomimetic", "None"]', 1, 'Though it has "Muscarine," the primary toxins actually cause a GABA-ergic/Glutamatergic "delirium."'),
    (v_topic_id, '"Coprine" containing mushrooms (Inky Caps) cause a reaction similar to which drug if consumed with alcohol?', '["Aspirin", "Disulfiram", "Penicillin", "Omeprazole"]', 1, 'Inhibits aldehyde dehydrogenase.'),

    -- SECTION 13: HOUSEHOLD & FINAL REVIEW (321-335)
    (v_topic_id, 'A child swallows "Liquid Drain Cleaner" (Lye). What is the first priority?', '["Induce vomiting", "Neutralize with vinegar", "NPO (Nothing by mouth) and immediate Endoscopy", "Gastric lavage"]', 2, 'Lye (Alkali) causes liquefactive necrosis; inducing vomiting or neutralizing can worsen the burn.'),
    (v_topic_id, 'Why are "Alkali" ingestions considered more dangerous than "Acid" ingestions in the esophagus?', '["Acids are harmless", "Alkali cause liquefactive necrosis (deeper penetration), while acids cause coagulative necrosis (eschar blocks penetration)", "Alkali smell better", "None"]', 1, 'Acids usually damage the stomach more than the esophagus.'),
    (v_topic_id, 'Ingestion of "Gasoline" (Hydrocarbons) poses the greatest risk to which organ?', '["Liver", "Lungs (Aspiration Pneumonitis)", "Heart", "Kidney"]', 1, 'Low viscosity/surface tension allowed them to spread easily into the lungs.'),
    (v_topic_id, 'What is the treatment for Hydrocarbon aspiration?', '["Gastric lavage", "Supportive care (Oxygen, Ventilation) and antibiotics only if infection is proven", "Emetics", "Charcoal"]', 1, 'Lavage and charcoal are contraindicated due to aspiration risk.'),
    (v_topic_id, 'Which household item contains "Mothballs" that can cause hemolysis in G6PD deficient patients?', '["Naphthalene", "Camphor", "Both", "None"]', 0, 'Naphthalene mothballs are oxidizing agents.'),
    (v_topic_id, 'Camphor (found in some chest rubs) can cause which rapid-onset symptom in overdose?', '["Liver failure", "Seizures", "Blindness", "Hair loss"]', 1, 'Camphor is highly neurotoxic.'),
    (v_topic_id, 'Treatment for "Button Battery" ingestion that is stuck in the esophagus?', '["Observation", "Immediate Endoscopic Removal", "Laxatives", "Vinegar"]', 1, 'Current can cause rapid perforation through the esophageal wall.'),
    (v_topic_id, 'A "Cylindrical battery" that has passed into the stomach usually requires:', '["Surgery", "Observation with serial X-rays to ensure passage", "Emetics", "Charcoal"]', 1, 'Most pass harmlessly unless they leak or get stuck.'),
    (v_topic_id, 'Which drug is used for "Body packers" to speed the passage of packets?', '["Laxatives (Bisacodyl)", "Whole Bowel Irrigation (PEG-ELS)", "Mineral Oil", "None"]', 1, 'WBI is the standard for speeding packet transit.'),
    (v_topic_id, 'The "Antidote" for Methemoglobinemia is Methylene Blue. What is its mechanism?', '["Forms methemoglobin", "Provides an alternative electron donor for NADPH-methemoglobin reductase", "Chelates iron", "None"]', 1, 'It accelerates the natural reduction process.'),
    (v_topic_id, 'Which heavy metal poisoning is associated with "Itai-itai disease"?', '["Lead", "Cadmium", "Mercury", "Arsenic"]', 1, 'Causes severe osteomalacia and renal failure.'),
    (v_topic_id, 'Treatment for "Itai-itai" disease (Cadmium)?', '["Chelation (limited efficacy)", "Vitamin D and supportive care", "Hemodialysis", "Aspirin"]', 1, 'Cadmium is very difficult to chelate; treatment is supportive.'),
    (v_topic_id, 'A patient on "Monoamine Oxidase Inhibitors" (MAOIs) eats cheese and develops a hypertensive crisis. What is the cause?', '["Lactose", "Tyramine", "Vitamin K", "Protein"]', 1, 'Tyramine acts as an indirect sympathomimetic.'),
    (v_topic_id, 'Treatment for "Tyramine" hypertensive crisis?', '["Beta-blockers", "Alpha-1 blockers (e.g., Phentolamine) or Nitroprusside", "Aspirin", "Diazepam"]', 1, 'Alpha-blockade is necessary to counter the vasoconstriction.'),
    (v_topic_id, 'Which GI drug is used as an "Antidote" for Radioactive Iodine (131-I) exposure?', '["Loperamide", "Potassium Iodide (SSKI)", "Activated Charcoal", "Omeprazole"]', 1, 'It saturates the thyroid with "cold" iodine to prevent uptake of "hot" iodine.');

    RAISE NOTICE 'SUCCESS: Clinical Toxicology MCQ Part 5 (281-335) registered.';
END $$;

COMMIT;
