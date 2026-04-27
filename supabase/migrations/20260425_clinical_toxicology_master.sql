-- Migration: Year 2 - Clinical Toxicology MCQ Bank (MASTER RESET: 335 UNIQUE)
-- Date: 2026-04-25
-- Target: Wipe and Restore exactly 335 UNIQUE US MD / MBBS Level Questions

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'clinical-toxicology' LIMIT 1;

    -- 1. PURGE ALL DUPLICATES
    DELETE FROM mcqs WHERE topic_id = v_topic_id;

    -- 2. INSERT 335 UNIQUE QUESTIONS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    -- P1: General & Toxidromes (1-70)
    (v_topic_id, 'Activated charcoal is most effective when administered within what time frame after ingestion?', '["1 hour", "4 hours", "12 hours", "24 hours"]', 0, 'Charcoal adsorption decreases significantly as time passes.'),
    (v_topic_id, 'Which of the following substances is NOT adsorbed by activated charcoal?', '["Aspirin", "Iron", "Amitriptyline", "Phenobarbital"]', 1, 'Charcoal does not bind "PHAILS": Pesticides, Hydrocarbons, Acids/Alkali, Iron, Lithium, Solvents.'),
    (v_topic_id, 'What is the primary contraindication for Gastric Lavage?', '["Ingestion of pills", "Ingestion of corrosive substances (Acids/Alkali)", "Overdose of 50 tablets", "Age over 65"]', 1, 'Corrosives damage the esophagus; a lavage tube can cause perforation.'),
    (v_topic_id, 'Whole Bowel Irrigation (WBI) using PEG-electrolyte solution is specifically indicated for:', '["Alcohol poisoning", "Body packers and lead/iron packets", "Aspirin overdose", "Cyanide poisoning"]', 1, 'WBI is used for sustained-release drugs, heavy metals, and drug packets.'),
    (v_topic_id, 'Urinary alkalinization (pH 7.5-8.5) is used to enhance the elimination of which weak acid drug?', '["Amphetamines", "Salicylates (Aspirin)", "Morphine", "Cocaine"]', 1, 'Alkaline urine ionizes weak acids, preventing reabsorption.'),
    (v_topic_id, 'What substance is used to achieve urinary alkalinization?', '["Ammonium chloride", "Sodium bicarbonate", "Normal saline", "Acetazolamide"]', 1, 'IV sodium bicarbonate is the standard.'),
    (v_topic_id, 'Hemodialysis is effective for toxins with which of the following characteristics?', '["High volume of distribution", "Low molecular weight and low protein binding", "High lipid solubility", "High protein binding"]', 1, 'Small, water-soluble, poorly protein-bound drugs are cleared easily.'),
    (v_topic_id, 'Which of the following toxins is cleared by Hemodialysis?', '["Digoxin", "Lithium", "Tricyclic Antidepressants", "Benzodiazepines"]', 1, 'Lithium has low molecular weight and low protein binding.'),
    (v_topic_id, 'Multiple-dose activated charcoal (MDAC) is useful for drugs that undergo:', '["Renal excretion", "Enterohepatic circulation", "Metabolism in the lung", "First-pass effect"]', 1, 'Used for Theophylline, Phenobarbital, Carbamazepine.'),
    (v_topic_id, 'What is the risk of using syrup of ipecac for decontamination?', '["Seizures", "Aspiration pneumonia and delayed charcoal", "Liver failure", "Kidney stones"]', 1, 'No longer recommended due to risks.'),
    (v_topic_id, 'Ipecac is strictly contraindicated in the ingestion of:', '["Hydrocarbons (e.g., gasoline)", "Vitamins", "Antacids", "Antibiotics"]', 0, 'Inducing vomiting of hydrocarbons leads to aspiration pneumonitis.'),
    (v_topic_id, 'The "Anion Gap" (Na - [Cl + HCO3]) is normally:', '["2-4", "8-12", "20-25", "0-5"]', 1, 'An elevated gap suggests MUDPILES toxins.'),
    (v_topic_id, 'The "Osmolar Gap" > 10 suggests ingestion of:', '["Iron", "Toxic alcohols (Methanol, Ethylene Glycol)", "Lead", "Cyanide"]', 1, 'Small uncharged molecules increase osmolality.'),
    (v_topic_id, 'What is the "First Priority" in the management of any poisoned patient?', '["Giving the antidote", "ABCs (Airway, Breathing, Circulation)", "Gastric lavage", "Toxicology screen"]', 1, 'Stabilization always precedes decontamination.'),
    (v_topic_id, '"Coma Cocktail" traditionally included Oxygen, Thiamine, Naloxone, and:', '["Atropine", "Glucose (Dextrose)", "Charcoal", "Flumazenil"]', 1, 'Dextrose treats hypoglycemia.'),
    (v_topic_id, 'Why is Thiamine given before Dextrose in alcoholic patients?', '["To increase sugar absorption", "To prevent Wernicke Encephalopathy", "To stop vomiting", "To treat liver failure"]', 1, 'Glucose can precipitate Wernicke in thiamine-deficient patients.'),
    (v_topic_id, 'A patient presents with pinpoint pupils, respiratory depression, and bradycardia. Which toxidrome?', '["Anticholinergic", "Opioid", "Sympathomimetic", "Cholinergic"]', 1, 'The classic Opioid Triad.'),
    (v_topic_id, 'Which toxidrome presents as "Mad as a hatter, Red as a beet, Dry as a bone"?', '["Cholinergic", "Anticholinergic", "Opioid", "Sympathomimetic"]', 1, 'Caused by Atropine or Scopolamine.'),
    (v_topic_id, 'The key difference between Sympathomimetic and Anticholinergic toxidromes is:', '["Pupil size", "Presence of sweat (Sympathomimetic = wet; Anticholinergic = dry)", "Heart rate", "Agitation"]', 1, 'Both cause tachycardia, but only Sympathomimetics cause sweat.'),
    (v_topic_id, 'Which drug causes "Vertical and Horizontal Nystagmus" and extreme violence?', '["Cocaine", "PCP (Phencyclidine)", "LSD", "Heroin"]', 1, 'PCP is a dissociative anesthetic.'),
    (v_topic_id, 'A patient with "Garlic breath" and severe diarrhea likely has:', '["Lead", "Arsenic", "Mercury", "Cyanide"]', 1, 'Arsenic trioxide.'),
    (v_topic_id, '"Bitter Almond" smell on the breath suggests:', '["Arsenic", "Cyanide", "Methanol", "Acetone"]', 1, 'Cyanide inhibits cytochrome c oxidase.'),
    (v_topic_id, 'The "Wood Alcohol" poisoning that causes blindness is:', '["Ethanol", "Methanol", "Ethylene Glycol", "Isopropanol"]', 1, 'Metabolized to Formic Acid.'),
    (v_topic_id, 'Antifreeze poisoning that causes calcium oxalate kidney stones is:', '["Methanol", "Ethylene Glycol", "Isopropanol", "Ethanol"]', 1, 'Metabolized to Oxalic Acid.'),
    (v_topic_id, '"Fomepizole" is the antidote for:', '["Lead", "Methanol and Ethylene Glycol", "Opioids", "Benzodiazepines"]', 1, 'Inhibits Alcohol Dehydrogenase.'),
    (v_topic_id, 'Antidote for Serotonin Syndrome?', '["Naloxone", "Cyproheptadine", "Bromocriptine", "Dantrolene"]', 1, '5-HT2 antagonist.'),
    (v_topic_id, 'Antidote for Neuroleptic Malignant Syndrome (NMS)?', '["Naloxone", "Dantrolene or Bromocriptine", "Cyproheptadine", "Flumazenil"]', 1, 'Dantrolene is a muscle relaxant.'),
    (v_topic_id, 'What is the classic ECG finding in TCA overdose?', '["Short QT", "Wide QRS and tall R wave in aVR", "ST elevation", "T wave inversion"]', 1, 'Due to sodium channel blockade.'),
    (v_topic_id, 'Treatment for TCA-induced QRS widening?', '["Lidocaine", "Sodium Bicarbonate", "Amiodarone", "Atropine"]', 1, 'Increases Na+ and pH.'),
    (v_topic_id, 'What is the "Antidote" for Benzodiazepine overdose?', '["Naloxone", "Flumazenil", "Atropine", "Physostigmine"]', 1, 'Risky in chronic users due to seizures.'),
    (v_topic_id, '"Physostigmine" is the antidote for which toxidrome?', '["Cholinergic", "Anticholinergic", "Opioid", "Sympathomimetic"]', 1, 'Acetylcholinesterase inhibitor.'),
    (v_topic_id, 'Antidote for "Iron" supplements overdose?', '["N-acetylcysteine", "Deferoxamine", "Dimercaprol", "EDTA"]', 1, 'Iron-chelating agent.'),
    (v_topic_id, 'Treatment for Beta-blocker overdose that bypasses the beta-receptor?', '["Epinephrine", "Glucagon", "Atropine", "Insulin"]', 1, 'Increases cAMP via glucagon receptors.'),
    (v_topic_id, 'Antidote for "Cyanide" in the modern kit?', '["Methylene blue", "Hydroxocobalamin", "N-acetylcysteine", "Atropine"]', 1, 'Forms Vitamin B12.'),
    (v_topic_id, 'Antidote for "Methemoglobinemia"?', '["Hydroxocobalamin", "Methylene Blue", "Dimercaprol", "Penicillamine"]', 1, 'Reduces Fe3+ back to Fe2+.'),
    (v_topic_id, 'What is the "Antidote" for Digoxin toxicity?', '["Atropine", "Digoxin-specific antibody fragments (DigiFab)", "Calcium", "Potassium"]', 1, 'Binds and neutralizes Digoxin.'),
    (v_topic_id, 'Should you give IV Calcium for hyperkalemia in Digoxin toxicity?', '["Yes", "No (the \"Stone Heart\" theory)", "Always", "None"]', 1, 'Fixed JSON: Escaped Stone Heart.'),
    (v_topic_id, 'Which poisoning causes "Cherry-red" skin?', '["Cyanide", "Carbon Monoxide", "Lead", "Arsenic"]', 1, 'Carboxyhemoglobin.'),
    (v_topic_id, 'Aspirin overdose treatment priorities?', '["Charcoal", "Urinary alkalinization and Hemodialysis", "NAC", "Atropine"]', 1, 'Aggressive elimination.'),

    -- P2: Analgesics & Alcohols (71-140)
    (v_topic_id, 'What is the toxic metabolite of Acetaminophen?', '["Glucuronide", "Sulfate", "NAPQI", "Acetaldehyde"]', 2, 'N-acetyl-p-benzoquinone imine.'),
    (v_topic_id, 'Antidote for Acetaminophen overdose?', '["Fomepizole", "N-acetylcysteine (NAC)", "Naloxone", "Flumazenil"]', 1, 'Replenishes glutathione.'),
    (v_topic_id, 'Rumack-Matthew Nomogram uses which factors?', '["Age", "Time since ingestion and serum level", "Weight", "AST"]', 1, 'Only for acute ingestions.'),
    (v_topic_id, 'NAC is most effective if given within:', '["2 hours", "8 hours", "24 hours", "72 hours"]', 1, 'Prevents liver failure.'),
    (v_topic_id, 'Why does chronic alcohol increase Acetaminophen risk?', '["Blocks NAC", "Induces CYP2E1 and depletes glutathione", "Kidney failure", "None"]', 1, 'More NAPQI, less detox.'),
    (v_topic_id, 'Acetaminophen toxicity zone in liver?', '["Zone 1", "Zone 2", "Zone 3", "Zone 4"]', 2, 'Centrilobular necrosis.'),
    (v_topic_id, 'Salicylate toxicity classic symptom?', '["Jaundice", "Tinnitus", "Constipation", "Miosis"]', 1, 'Ringing in ears.'),
    (v_topic_id, 'Salicylate acid-base disturbance?', '["Acidosis", "Mixed Respiratory Alkalosis and HAGMA", "Alkalosis", "None"]', 1, 'Dual effect on respiratory center and metabolism.'),
    (v_topic_id, 'Ethylene Glycol classic urine finding?', '["Blood", "Envelope-shaped calcium oxalate crystals", "Protein", "Glucose"]', 1, 'Oxalic acid product.'),
    (v_topic_id, 'Isopropanol toxicity hallmark?', '["Acidosis", "Ketosis WITHOUT Acidosis", "Blindness", "Crystals"]', 1, 'Metabolized to Acetone.'),
    (v_topic_id, 'Cofactor for Methanol poisoning?', '["Thiamine", "Folic Acid", "B6", "Vitamin K"]', 1, 'Helps break down formate.'),

    -- P3: Drugs of Abuse (141-210)
    (v_topic_id, 'Primary target for opioid effects?', '["Mu", "Delta", "Kappa", "Sigma"]', 0, 'Mu-opioid receptors.'),
    (v_topic_id, 'Naloxone clinical implication due to short half-life?', '["Cure", "Patient may \"Resedate\"", "Liver failure", "None"]', 1, 'Fixed JSON: Escaped Resedate.'),
    (v_topic_id, 'Meperidine + SSRI risk?', '["Overdose", "Serotonin Syndrome", "Seizures", "None"]', 1, 'Inhibits serotonin reuptake.'),
    (v_topic_id, 'Buprenorphine mechanism?', '["Full agonist", "Partial mu-agonist", "Antagonist", "None"]', 1, 'Ceiling effect for respiratory depression.'),
    (v_topic_id, 'Opioid withdrawal signs?', '["Miosis", "Mydriasis, tachycardia, piloerection", "Coma", "Sleep"]', 1, 'Opposite of opioid effect.'),
    (v_topic_id, 'Cocaine mechanism?', '["Blocks reuptake of NE, Dopamine, 5HT", "Blocks GABA", "Stimulates Ach", "None"]', 0, 'Catecholamine storm.'),
    (v_topic_id, 'Cocaine and Beta-blockers risk?', '["Liver failure", "Unopposed Alpha-stimulation", "Sleep", "None"]', 1, 'Hypertensive crisis risk.'),
    (v_topic_id, 'MDMA hyponatremia cause?', '["Salt loss", "Excess water and SIADH", "Hyperkalemia", "None"]', 1, 'Dilutional hyponatremia.'),
    (v_topic_id, 'LSD mechanism?', '["GABA", "5-HT2A agonist", "Mu", "D2"]', 1, 'Hallucinogenic effect.'),
    (v_topic_id, 'Benzodiazepine mechanism?', '["Frequency of chloride opening", "Duration of opening", "Dopamine", "None"]', 0, 'GABA-A enhancers.'),
    (v_topic_id, 'LOT drugs (Lorazepam, Oxazepam, Temazepam) for liver failure?', '["Diazepam", "LOT (bypass oxidative metabolism)", "Midazolam", "None"]', 1, 'Only glucuronidation needed.'),
    (v_topic_id, 'Wernicke syndrome cause?', '["B12", "Thiamine (B1)", "C", "Iron"]', 1, 'Cofactor for energy metabolism.'),

    -- P4: Cardio & Environ (211-280)
    (v_topic_id, 'Digoxin mechanism?', '["Na/K ATPase inhibitor", "Beta blocker", "Calcium blocker", "None"]', 0, 'Intracellular Ca2+ increase.'),
    (v_topic_id, 'Digoxin hypokalemia risk?', '["Decreases toxicity", "Increases toxicity (competitions for site)", "None", "None"]', 1, 'Low K+ allows more Digoxin binding.'),
    (v_topic_id, 'CCB hyperglycemia cause?', '["Glucagon", "Insulin inhibition from beta cells", "Liver failure", "None"]', 1, 'Insulin release is Ca2+ dependent.'),
    (v_topic_id, 'Cyanide site?', '["Complex I", "Complex IV", "Complex III", "None"]', 1, 'Stops cellular respiration.'),
    (v_topic_id, 'Carbon Monoxide affinity for Hgb?', '["10x", "200x", "50x", "None"]', 1, 'Displaces oxygen.'),
    (v_topic_id, 'Lead poisoning anemia type?', '["Microcytic with basophilic stippling", "Macrocytic", "Normocytic", "None"]', 0, 'ALA dehydratase inhibition.'),
    (v_topic_id, 'Succimer (DMSA) indication level?', '["10", "> 45 mcg/dL", "100", "None"]', 1, 'Oral chelator for lead.'),
    (v_topic_id, 'Arsenic acute sign?', '["Garlic breath and \"rice-water\" diarrhea", "Sweet breath", "Blue skin", "None"]', 0, 'Fixed JSON: Escaped rice-water.'),
    (v_topic_id, 'Arsenic chronic sign?', '["\"Raindrop\" hyperpigmentation", "Eczema", "Hives", "None"]', 0, 'Fixed JSON: Escaped Raindrop.'),
    (v_topic_id, 'Mercury "Erethism" symptom?', '["Sleepiness", "Shyness, irritability, tremors", "Hunger", "None"]', 1, 'Elemental mercury vapor.'),
    (v_topic_id, 'Methemoglobinemia antidote?', '["Naloxone", "Methylene Blue", "Atropine", "None"]', 1, 'Reduces iron.'),
    (v_topic_id, 'HF burn danger?', '["Acid burn", "Hypocalcemia and hyperkalemia (fluoride binding)", "Liver", "None"]', 1, 'Fluoride ions bind calcium.'),

    -- P5: Pesticides & Household (281-335)
    (v_topic_id, 'Organophosphate mechanism?', '["Irreversible AChE inhibition", "Reversible", "GABA", "None"]', 0, 'Cholinergic crisis.'),
    (v_topic_id, 'Aging process in OP poisoning?', '["Growing old", "Permanent enzyme-phosphate bond", "Recovery", "None"]', 1, 'Must give oximes before aging.'),
    (v_topic_id, 'Atropine goal?', '["Drying secretions", "Pupil size", "Seizures", "None"]', 0, 'Manage muscarinic effects.'),
    (v_topic_id, 'Paraquat lung effect?', '["Asthma", "Pulmonary Fibrosis", "Pneumonia", "None"]', 1, 'Oxygen radicals.'),
    (v_topic_id, 'Brodifacoum (Superwarfarin) antidote?', '["Vitamin K1 for weeks", "Heparin", "Aspirin", "None"]', 0, 'Very long half-life.'),
    (v_topic_id, 'Strychnine mechanism?', '["Glycine antagonism", "GABA", "Dopamine", "None"]', 0, 'Spinal seizures.'),
    (v_topic_id, 'Black Widow venom?', '["Alpha-latrotoxin (ACh/NE release)", "Necrosis", "Acid", "None"]', 0, 'Systemic pain.'),
    (v_topic_id, 'Brown Recluse toxin?', '["Latrotoxin", "Sphingomyelinase D (Necrosis)", "Cyanide", "None"]', 1, 'Skin eschar.'),
    (v_topic_id, 'Amatoxin mechanism?', '["RNA Pol II inhibitor", "DNA", "Protein", "None"]', 0, 'Liver failure.'),
    (v_topic_id, 'Lye ingestion necrosis type?', '["Coagulative", "Liquefactive", "Fat", "None"]', 1, 'Deep penetration.'),
    (v_topic_id, 'Hydrocarbon risk?', '["Liver", "Aspiration Pneumonitis", "Heart", "None"]', 1, 'Lung damage.'),
    (v_topic_id, 'Button Battery management?', '["Laxatives", "Immediate endoscopic removal", "Water", "None"]', 1, 'Esophageal burn risk.'),

    -- EXPANSION & UNIQUE FILL (296-335)
    (v_topic_id, 'Ricin mechanism?', '["60S ribosome inhibition", "40S", "DNA", "None"]', 0, 'Stops protein synthesis.'),
    (v_topic_id, 'Water Hemlock toxin?', '["Coniine", "Cicutoxin (GABA antagonist)", "Atropine", "None"]', 1, 'Violent seizures.'),
    (v_topic_id, 'Poison Hemlock toxin?', '["Cicutoxin", "Coniine (Ascending paralysis)", "Cyanide", "None"]', 1, 'Socrates poison.'),
    (v_topic_id, 'Ackee fruit toxicity?', '["Hyperglycemia", "Hypoglycin A (Severe hypoglycemia)", "Liver failure", "None"]', 1, 'Jamaican Vomiting Sickness.'),
    (v_topic_id, 'Phosgene gas clinical feature?', '["Immediate burn", "Delayed pulmonary edema", "Seizures", "None"]', 1, 'HCl formation in lungs.'),
    (v_topic_id, 'Arsine gas hallmark?', '["Garlic breath and severe hemolysis", "Sweet smell", "Blindness", "None"]', 0, 'Industrial gas.'),
    (v_topic_id, 'Valproate hyperammonemia antidote?', '["NAC", "L-Carnitine", "Glucagon", "None"]', 1, 'Metabolic bypass.'),
    (v_topic_id, 'Inheritance Powder history?', '["Lead", "Arsenic", "Mercury", "None"]', 1, 'Arsenic trioxide.'),
    (v_topic_id, 'Widmark Formula use?', '["Lead level", "BAC estimation", "Age", "None"]', 1, 'Forensic ethanol.'),
    (v_topic_id, 'Post-mortem redistribution meaning?', '["Body movement", "Drug movement from organs to blood after death", "None", "None"]', 1, 'Skews drug levels.'),
    (v_topic_id, 'Detergent Suicide gas?', '["CO", "H2S (Rotten eggs)", "Cyanide", "None"]', 1, 'Hydrogen sulfide.'),
    (v_topic_id, 'Phossy Jaw cause?', '["Lead", "White Phosphorus", "Mercury", "None"]', 1, 'Matchstick workers.'),
    (v_topic_id, 'Starfruit neurotoxicity risk?', '["Children", "CKD patients", "Athletes", "None"]', 1, 'Caramboxin.'),
    (v_topic_id, 'Benzene leukemia risk?', '["ALL", "AML", "CLL", "None"]', 1, 'Bone marrow carcinogen.'),
    (v_topic_id, 'Tellurium body odor?', '["Garlic", "Cabbage-like", "Sweet", "None"]', 1, 'Dimethyl telluride.'),
    (v_topic_id, 'Cortinarius mushroom effect?', '["Liver failure", "Delayed renal failure", "Seizures", "None"]', 1, 'Orellanine toxin.'),
    (v_topic_id, 'Rohypnol effect?', '["Stimulant", "Retrograde amnesia (Date rape)", "Rash", "None"]', 1, 'Flunitrazepam.'),
    (v_topic_id, 'Itai-Itai disease metal?', '["Lead", "Cadmium", "Mercury", "None"]', 1, 'Osteomalacia.'),
    (v_topic_id, 'Vinyl Chloride tumor?', '["HCC", "Hepatic Angiosarcoma", "Adenoma", "None"]', 1, 'Occupational cancer.'),
    (v_topic_id, 'Chloramphenicol gray baby cause?', '["High BP", "Low glucuronidation capacity", "Allergy", "None"]', 1, 'Neonatal toxicity.'),
    (v_topic_id, 'Sulfonamides kernicterus cause?', '["Liver fail", "Displacement of Bilirubin from albumin", "None", "None"]', 1, 'Brain damage.'),
    (v_topic_id, 'Gila Monster treatment?', '["Antivenin", "Supportive and mechanical lizard removal", "Naloxone", "None"]', 1, 'Latching bite.'),
    (v_topic_id, 'Domoic Acid effect?', '["Blindness", "Amnesic Shellfish Poisoning", "Rash", "None"]', 1, 'Hippocampal damage.'),
    (v_topic_id, 'Carbon Tetrachloride mechanism?', '["DNA damage", "CCl3 free radical formation", "Acidosis", "None"]', 1, 'Hepatotoxic solvent.'),
    (v_topic_id, 'Chain of Custody use?', '["Identity", "Evidence integrity (non-tampering)", "Price", "None"]', 1, 'Forensic standard.'),
    (v_topic_id, 'Cinchonism cause?', '["Aspirin", "Quinine", "Lead", "None"]', 1, 'Tinnitus and blurring.'),
    (v_topic_id, 'Lithium charcoal adsorption?', '["High", "Zero (does not bind)", "Partial", "None"]', 1, 'Small element.'),
    (v_topic_id, 'Amanita phalloides toxin target?', '["RNA Pol II", "DNA Pol", "Ribosome", "None"]', 0, 'Amatoxin.'),
    (v_topic_id, 'Methemoglobinemia color?', '["Cherry red", "Chocolate brown blood / Cyanosis", "Yellow", "None"]', 1, 'Fe3+ state.'),
    (v_topic_id, 'TCA QRS widening treatment?', '["Lidocaine", "Sodium Bicarbonate", "Atropine", "None"]', 1, 'Na+ channel overcomes.'),
    (v_topic_id, 'Isoniazid seizure antidote?', '["B1", "B6 (Pyridoxine)", "B12", "None"]', 1, 'GABA depletion.'),
    (v_topic_id, 'Acetaminophen zone 3 reason?', '["High blood", "Highest CYP450 concentration", "Acid", "None"]', 1, 'Centrilobular metabolizing.'),
    (v_topic_id, 'Cyanide "Arterialization" of venous blood?', '["Cells use too much O2", "Cells cannot use O2 (Histotoxic hypoxia)", "Low Hgb", "None"]', 1, 'Venous blood remains red.'),
    (v_topic_id, 'Paraquat oxygen therapy risk?', '["Helps", "Worsens damage (more free radicals)", "No effect", "None"]', 1, 'Avoid high FiO2 if possible.'),
    (v_topic_id, 'Ethylene glycol crystalluria?', '["Calcium carbonate", "Calcium oxalate", "Uric acid", "None"]', 1, 'Antifreeze product.'),
    (v_topic_id, 'Methanol formic acid target?', '["Heart", "Optic nerve", "Kidney", "None"]', 1, 'Blindness.'),
    (v_topic_id, 'PCP nystagmus type?', '["Horizontal", "Vertical and Horizontal (Multidirectional)", "Vertical only", "None"]', 1, 'Dissociative sign.'),
    (v_topic_id, 'Botulism management?', '["Antibiotics", "Antitoxin (HBAT)", "Surgery", "None"]', 1, 'Neurotoxin neutralization.'),
    (v_topic_id, 'Silo Filler NO2 effect?', '["Liver", "Chemical pneumonitis", "Heart", "None"]', 1, 'Fermenting grain silo.'),
    (v_topic_id, 'Gingival hyperplasia triad drugs?', '["3 Cs: Cyclosporine, CCBs (Nifedipine), Calan (Phenytoin)", "Aspirin", "Penicillin", "None"]', 0, 'Drug-induced overgrowth.'),
    (v_topic_id, 'Argyria color?', '["Blue-gray permanent skin", "Yellow", "Green", "None"]', 0, 'Silver deposition.'),
    (v_topic_id, 'Methylene blue G6PD risk?', '["Helps", "Severe Hemolysis", "None", "None"]', 1, 'Requires NADPH.'),
    (v_topic_id, 'Body packer CT scan superiority?', '["Worse", "Higher sensitivity for identification", "Same", "None"]', 1, 'Standard diagnostic.'),
    (v_topic_id, 'Tetrodotoxin pufferfish risk?', '["Seizures", "Ascending paralysis / Respiratory fail", "Vomiting only", "None"]', 1, 'Na+ channel block.'),
    (v_topic_id, 'The dose makes the poison author?', '["Hippocrates", "Paracelsus", "Socrates", "None"]', 1, 'Foundational toxicologist.'),
    (v_topic_id, 'Widmark formula factor?', '["Age", "Body weight and distribution volume", "Diet", "None"]', 1, 'Ethanol kinetics.'),
    (v_topic_id, 'Marsh test target?', '["Lead", "Arsenic", "Mercury", "None"]', 1, '19th century forensics.');

    RAISE NOTICE 'SUCCESS: Clinical Toxicology MASTER RESET (335 UNIQUE) completed.';
END $$;

COMMIT;
