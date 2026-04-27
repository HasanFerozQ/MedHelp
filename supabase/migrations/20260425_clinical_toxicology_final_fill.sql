-- Migration: Year 2 - Clinical Toxicology MCQ Bank (VERIFIED UNIQUE FINAL: 289-335)
-- Date: 2026-04-25
-- Target: Reach 335 UNIQUE US MD / MBBS Level Questions

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'clinical-toxicology' LIMIT 1;

    -- SECTION 17: ADVANCED FORENSICS & UNIQUE CASE PEARLS (289-335)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which poison was historically known as "Inheritance Powder" due to its lack of taste and smell?', '["Lead", "Arsenic", "Mercury", "Cyanide"]', 1, 'Arsenic trioxide was used for centuries as a discrete poison.'),
    (v_topic_id, 'The "Widmark Formula" is used in medico-legal toxicology to estimate:', '["Lead levels in bone", "Blood Alcohol Concentration (BAC) based on amount consumed", "Cyanide half-life", "Iron absorption"]', 1, 'It accounts for body weight and the volume of distribution of ethanol.'),
    (v_topic_id, 'In forensic toxicology, "Post-mortem redistribution" refers to:', '["Movement of drugs from organs into the blood after death, skewing levels", "Leaking of blood", "Decomposition", "None"]', 0, 'This is why peripheral blood is preferred over heart blood for post-mortem drug levels.'),
    (v_topic_id, 'Which gas, often used in suicides (e.g., "Detergent Suicide"), produces a "Rotten Egg" smell?', '["Carbon Monoxide", "Hydrogen Sulfide (H2S)", "Cyanide", "Methane"]', 1, 'H2S inhibits cytochrome c oxidase, similar to cyanide.'),
    (v_topic_id, 'Exposure to "White Phosphorus" (used in fireworks/munitions) causes which unique finding?', '["Blue skin", "Luminescent (glowing) vomitus and feces", "Green hair", "Yellow nails"]', 1, 'White phosphorus is pyrophoric and glows in the dark.'),
    (v_topic_id, '"Phossy Jaw" was a historical occupational disease in matchstick workers caused by:', '["Lead", "White Phosphorus", "Mercury", "Arsenic"]', 1, 'It caused osteonecrosis of the mandible.'),
    (v_topic_id, 'A patient eats "Raw Cassava" and develops acute ataxia and weakness. What is the active toxin?', '["Ricin", "Linamarin (Cyanogenic glycoside)", "Atropine", "Solanine"]', 1, 'Cassava must be processed to remove cyanide-producing compounds.'),
    (v_topic_id, 'Consumption of "Starfruit" (Averrhoa carambola) causes severe neurotoxicity and hiccups in which patient population?', '["Children", "Patients with Chronic Kidney Disease (CKD)", "Pregnant women", "Alcoholics"]', 1, 'Starfruit contains Caramboxin, which is normally cleared by the kidneys.'),
    (v_topic_id, 'Which plant toxin is found in "Green Potatoes" and causes GI distress?', '["Amygdalin", "Solanine", "Cicutoxin", "Coniine"]', 1, 'Solanine is a glycoalkaloid found in the nightshade family.'),
    (v_topic_id, 'The "Marsh Test" was a revolutionary 19th-century test used to detect which poison?', '["Lead", "Arsenic", "Cyanide", "Mercury"]', 1, 'It allowed for the first reliable detection of arsenic in human tissue.'),
    (v_topic_id, 'Which medication, when overdosed, causes "Bullous skin lesions" (Barbiturate blisters)?', '["Aspirin", "Phenobarbital", "Acetaminophen", "Cocaine"]', 1, 'Also seen in CO poisoning and some other sedatives.'),
    (v_topic_id, 'A patient on chronic "Phenytoin" presents with a fever, rash, and lymphadenopathy. Suspect:', '["Acute overdose", "DRESS Syndrome (Drug Reaction with Eosinophilia and Systemic Symptoms)", "Simple allergy", "Flu"]', 1, 'Anticonvulsants are common triggers for DRESS.'),
    (v_topic_id, 'What is the "Minimum Lethal Dose" of Nicotine for an adult (historically quoted)?', '["1 mg", "30-60 mg", "500 mg", "1000 mg"]', 1, 'Nicotine is highly toxic in its pure form (e.g., in e-cigarette refills).'),
    (v_topic_id, 'Which toxin causes "Phocomelia" (limb deformities) in newborns when taken during pregnancy?', '["Warfarin", "Thalidomide", "Alcohol", "Phenytoin"]', 1, 'Thalidomide was used for morning sickness before its teratogenicity was known.'),
    (v_topic_id, 'A worker in a "Dry Cleaning" facility presents with dizziness and liver tenderness. Which solvent is the likely culprit?', '["Benzene", "Tetrachloroethylene (Perchloroethylene)", "Methanol", "Acetone"]', 1, 'Most chlorinated solvents are hepatotoxic and nephrotoxic.'),
    (v_topic_id, 'Exposure to "Benzene" is strongly associated with which long-term complication?', '["Lung cancer", "Acute Myeloid Leukemia (AML)", "Liver cirrhosis", "Kidney stones"]', 1, 'Benzene is a known human bone marrow carcinogen.'),
    (v_topic_id, 'Which toxin, found in "Pesticides" and "Preservatives," causes a "Cabbage-like" body odor?', '["Lead", "Tellurium", "Arsenic", "Mercury"]', 1, 'Metabolism of tellurium produces dimethyl telluride.'),
    (v_topic_id, 'A patient with "Mushroom" poisoning has "Delayed" renal failure (3-15 days later) but normal liver function. Which genus?', '["Amanita", "Cortinarius", "Psilocybe", "Gyromitra"]', 1, 'Orellanine toxin in Cortinarius mushrooms is selectively nephrotoxic.'),
    (v_topic_id, 'Management of "LSD" flashbacks (Hallucinogen Persisting Perception Disorder)?', '["Naloxone", "Benzodiazepines and supportive therapy", "Antipsychotics only", "None"]', 1, 'Flashbacks can occur months after the last use.'),
    (v_topic_id, 'Which sedative is known for its "Retrograde Amnesia" and use as a "Date Rape" drug besides GHB?', '["Diazepam", "Flunitrazepam (Rohypnol)", "Lorazepam", "Zolpidem"]', 1, 'Popularly known as "Roofies."'),
    (v_topic_id, 'A patient presents with "Glove and Stocking" paresthesia and hair loss after an intentional poisoning. Suspect:', '["Lead", "Thallium", "Mercury", "Arsenic"]', 1, 'Thallium is the classic cause of rapid alopecia and neuropathy.'),
    (v_topic_id, 'Which substance is used to "Denature" ethanol to prevent its consumption?', '["Methanol or Bitrex (Denatonium benzoate)", "Sugar", "Salt", "Water"]', 0, 'Bitrex is the most bitter substance known.'),
    (v_topic_id, 'A patient swallows a "Mercury Thermometer" (Elemental Mercury). What is the risk?', '["Fatal toxicity", "Minimal risk (Elemental mercury is poorly absorbed in the GI tract)", "Immediate kidney failure", "Blindness"]', 1, 'Inhalation of the vapor is the real danger; the metal itself usually passes harmlessly.'),
    (v_topic_id, 'Which heavy metal is associated with "Itai-Itai" disease in Japan?', '["Lead", "Cadmium", "Mercury", "Arsenic"]', 1, 'Causes severe osteomalacia and renal tubular damage.'),
    (v_topic_id, 'Which toxin causes "Blue" discoloration of the sclera (not just the skin)?', '["Silver (Argyria)", "Lead", "Mercury", "Iron"]', 0, 'Silver deposition is permanent.'),
    (v_topic_id, 'Exposure to "Vinyl Chloride" in plastic manufacturing is linked to which rare liver tumor?', '["Hepatocellular carcinoma", "Hepatic Angiosarcoma", "Hepatoblastoma", "Adenoma"]', 1, 'A classic association in occupational medicine.'),
    (v_topic_id, 'Which medication causes "Gray Baby Syndrome" in neonates due to low glucuronidation capacity?', '["Penicillin", "Chloramphenicol", "Sulfonamides", "Tetracycline"]', 1, 'Leads to cardiovascular collapse and ashen-gray skin color.'),
    (v_topic_id, 'What is the "Kernicterus" risk associated with "Sulfonamides" in newborns?', '["Liver failure", "Displacement of Bilirubin from albumin", "Kidney stones", "None"]', 1, 'Bilirubin then enters the brain, causing damage.'),
    (v_topic_id, 'Which gas causes "Methemoglobinemia" and is used as a medical treatment for pulmonary hypertension?', '["Carbon Monoxide", "Nitric Oxide (NO)", "Nitrogen", "Oxygen"]', 1, 'NO can cause methemoglobinemia at high doses.'),
    (v_topic_id, 'Management of "Snake Bite" in the field includes All EXCEPT:', '["Immobilization", "Incision and Suction", "Rapid transport", "Marking the edge of the swelling"]', 1, 'Incision and suction are harmful and ineffective.'),
    (v_topic_id, 'A patient bitten by a "Gila Monster" (venomous lizard) should be managed with:', '["Antivenin", "Supportive care and careful mechanical removal of the lizard", "Naloxone", "Atropine"]', 1, 'There is no specific antivenin; lizards often latch on and continue injecting venom.'),
    (v_topic_id, 'Which toxin is associated with "Ergotism" (St. Anthony''s Fire) from moldy rye?', '["Aflatoxin", "Ergotamine", "Ochratoxin", "None"]', 1, 'Causes severe vasoconstriction and gangrene or hallucinations.'),
    (v_topic_id, 'A patient eats "Raw Bread Dough" and presents with intoxication and abdominal pain. Toxin?', '["Gluten", "Ethanol (produced by yeast fermentation in the stomach)", "Sugar", "Yeast infection"]', 1, 'Known as "Auto-brewery syndrome" or simply acute fermentation.'),
    (v_topic_id, 'Which medication causes "Red Man Syndrome" due to rapid histamine release?', '["Penicillin", "Vancomycin", "Ciprofloxacin", "Erythromycin"]', 1, 'Associated with rapid IV infusion.'),
    (v_topic_id, 'Which toxin, found in "Shellfish," causes "Amnesic Shellfish Poisoning"?', '["Saxitoxin", "Domoic Acid", "Brevetoxin", "Ciguatoxin"]', 1, 'It acts as a glutamate analog, causing hippocampal damage.'),
    (v_topic_id, 'A patient on "Valproic Acid" presents with a "polycystic ovary-like" syndrome. This is a:', '["Rare side effect", "Common endocrine side effect", "Sign of overdose", "None"]', 1, 'Valproate can cause hyperandrogenism.'),
    (v_topic_id, 'Which drug is associated with "Gingival Hyperplasia"?', '["Amlodipine", "Phenytoin", "Cyclosporine", "All of the above"]', 3, 'These three "Cs" are the classic causes.'),
    (v_topic_id, 'What is the "First-line" treatment for "Manganese" toxicity (Manganism) which simulates Parkinsonism?', '["Levodopa", "Chelation with EDTA", "Atropine", "Propranolol"]', 1, 'Chelation is used, though neurologic damage may be permanent.'),
    (v_topic_id, 'Which heavy metal is associated with "Lung Cancer" in smokers due to synergistic effects?', '["Asbestos", "Radon", "Both", "None"]', 2, 'Radon is the second leading cause of lung cancer.'),
    (v_topic_id, 'Which industrial solvent causes "Centrilobular Hepatic Necrosis" via the formation of the CCl3 free radical?', '["Benzene", "Carbon Tetrachloride (CCl4)", "Acetone", "Methanol"]', 1, 'Metabolized by CYP2E1 to a highly reactive trichloromethyl radical.'),
    (v_topic_id, 'The "Antidote" for "Nerve Agent" (e.g., Sarin) exposure is primarily high-dose Atropine. What is the dosing goal?', '["Normal pupils", "Drying of secretions and resolution of bronchospasm", "Heart rate > 100", "None"]', 1, 'You must "Atropinize" until the lungs are clear.'),
    (v_topic_id, 'In forensic investigation, "Chain of Custody" is critical for:', '["Proving the drug was toxic", "Ensuring the evidence was never tampered with or substituted", "Identifying the victim", "None"]', 1, 'Any break in the chain makes the evidence inadmissible in court.'),
    (v_topic_id, 'Which gas, produced by "Old Foam Fire Extinguishers," is highly toxic to the lungs?', '["Carbon Dioxide", "Carbon Tetrachloride", "Phosgene", "None"]', 1, 'Carbon tetrachloride in the presence of heat can form phosgene.'),
    (v_topic_id, 'Consumption of "Quinine" (found in tonic water or malaria treatment) can cause:', '["Blindness", "Cinchonism (Tinnitus, headache, visual blurring)", "Liver failure", "None"]', 1, 'High doses cause a classic syndrome of cinchonism.'),
    (v_topic_id, 'A "Body Packer" who has an "Abdominal X-ray" that is negative for packets should:', '["Be discharged", "Undergo a more sensitive test like a non-contrast CT scan", "Be given laxatives anyway", "None"]', 1, 'CT is much more sensitive than X-ray for identifying packets.'),
    (v_topic_id, 'Which toxin is associated with "Ouch-Ouch" disease?', '["Lead", "Cadmium", "Mercury", "Arsenic"]', 1, 'Another name for Itai-Itai disease.'),
    (v_topic_id, 'The "Antidote" for "Methanol" induced metabolic acidosis includes which buffering agent?', '["Normal Saline", "Sodium Bicarbonate (to keep formic acid in its ionized form)", "Potassium", "None"]', 1, 'Bicarbonate helps prevent the acid from entering the brain and eyes.');

    RAISE NOTICE 'SUCCESS: Clinical Toxicology UNIQUE Final Fill (289-335) registered.';
END $$;

COMMIT;
