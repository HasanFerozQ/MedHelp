-- Migration: Year 2 - Clinical Toxicology MCQ Bank (PART 1: 1-70)
-- Date: 2026-04-25
-- Target: US MD / MBBS Level (General Principles & Toxidromes)

BEGIN;

-- 1. Register Topic
INSERT INTO topics (title, slug, year_id, semester_id)
VALUES ('Clinical Toxicology', 'clinical-toxicology', 2, 4)
ON CONFLICT (slug) DO UPDATE SET 
    title = EXCLUDED.title,
    year_id = EXCLUDED.year_id,
    semester_id = EXCLUDED.semester_id;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'clinical-toxicology' LIMIT 1;

    -- Master Wipe for Clinical Toxicology to ensure zero redundancy
    DELETE FROM mcqs WHERE topic_id = v_topic_id;

    -- SECTION 1: GENERAL PRINCIPLES & DECONTAMINATION (1-35)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Activated charcoal is most effective when administered within what time frame after ingestion?', '["1 hour", "4 hours", "12 hours", "24 hours"]', 0, 'Charcoal adsorption decreases significantly as time passes and the toxin leaves the stomach.'),
    (v_topic_id, 'Which of the following substances is NOT adsorbed by activated charcoal?', '["Aspirin", "Iron", "Amitriptyline", "Phenobarbital"]', 1, 'Charcoal does not bind "PHAILS": Pesticides, Hydrocarbons, Acids/Alkali, Iron, Lithium, and Solvents/Alcohols.'),
    (v_topic_id, 'What is the primary contraindication for Gastric Lavage?', '["Ingestion of pills", "Ingestion of corrosive substances (Acids/Alkali)", "Overdose of 50 tablets", "Age over 65"]', 1, 'Corrosives damage the esophagus; a lavage tube can cause perforation or worsen the injury.'),
    (v_topic_id, 'Whole Bowel Irrigation (WBI) using PEG-electrolyte solution is specifically indicated for:', '["Alcohol poisoning", "Body packers (drug mules) and ingestion of lead/iron packets", "Aspirin overdose", "Cyanide poisoning"]', 1, 'WBI is used for sustained-release drugs, heavy metals, and drug packets.'),
    (v_topic_id, 'Urinary alkalinization (pH 7.5-8.5) is used to enhance the elimination of which weak acid drug?', '["Amphetamines", "Salicylates (Aspirin)", "Morphine", "Cocaine"]', 1, 'Alkaline urine ionizes weak acids (ion trapping), preventing their reabsorption in the renal tubules.'),
    (v_topic_id, 'What substance is used to achieve urinary alkalinization?', '["Ammonium chloride", "Sodium bicarbonate", "Normal saline", "Acetazolamide"]', 1, 'IV sodium bicarbonate is the standard for alkalinizing both blood and urine.'),
    (v_topic_id, 'Hemodialysis is effective for toxins with which of the following characteristics?', '["High volume of distribution", "Low molecular weight and low protein binding", "High lipid solubility", "High protein binding"]', 1, 'Small, water-soluble, and poorly protein-bound drugs are easily cleared by the dialyzer.'),
    (v_topic_id, 'Which of the following toxins is cleared by Hemodialysis?', '["Digoxin", "Lithium", "Tricyclic Antidepressants", "Benzodiazepines"]', 1, 'Lithium has a low molecular weight and low protein binding, making it highly dialyzable.'),
    (v_topic_id, 'Multiple-dose activated charcoal (MDAC) is useful for drugs that undergo:', '["Renal excretion", "Enterohepatic circulation", "Metabolism in the lung", "First-pass effect"]', 1, 'Drugs like Theophylline, Phenobarbital, and Carbamazepine re-enter the gut lumen and are "mopped up" by MDAC.'),
    (v_topic_id, 'What is the risk of using syrup of ipecac for decontamination?', '["Seizures", "Aspiration pneumonia and delayed administration of charcoal", "Liver failure", "Kidney stones"]', 1, 'Ipecac is no longer recommended due to these risks.'),
    (v_topic_id, 'Ipecac is strictly contraindicated in the ingestion of:', '["Hydrocarbons (e.g., gasoline)", "Vitamins", "Antacids", "Antibiotics"]', 0, 'Inducing vomiting of hydrocarbons can lead to severe aspiration pneumonitis.'),
    (v_topic_id, 'Which lab value is most critical to monitor during urinary alkalinization?', '["Sodium", "Potassium (Hypokalemia)", "Calcium", "Chloride"]', 1, 'Alkalosis shifts potassium into cells; hypokalemia also makes it impossible to alkalinize the urine.'),
    (v_topic_id, 'The "Anion Gap" (Na - [Cl + HCO3]) is normally:', '["2-4", "8-12", "20-25", "0-5"]', 1, 'An elevated anion gap suggests the presence of unmeasured acidic toxins (MUDPILES).'),
    (v_topic_id, 'Which toxin causes a High Anion Gap Metabolic Acidosis (HAGMA)?', '["Salicylates", "Methanol", "Ethylene Glycol", "All of the above"]', 3, 'These are all part of the classic MUDPILES mnemonic.'),
    (v_topic_id, 'The "Osmolar Gap" is the difference between measured and calculated serum osmolality. A gap > 10 suggests:', '["Iron poisoning", "Toxic alcohol ingestion (Methanol, Ethylene Glycol, Ethanol)", "Lead poisoning", "Cyanide"]', 1, 'Small, uncharged molecules like alcohols increase osmolality significantly.'),
    (v_topic_id, 'Calculate serum osmolality: [2 x Na] + [Glucose/18] + [BUN/2.8]. If the measured value is much higher, suspect:', '["Sodium", "Unmeasured osmole (Toxic alcohol)", "Potassium", "Water"]', 1, 'This is the basis of the Osmolar Gap.'),
    (v_topic_id, 'Which decontamination method is preferred for a patient who swallowed a large handful of "Extended Release" Verapamil 30 minutes ago?', '["Activated charcoal", "Whole Bowel Irrigation (WBI)", "Gastric Lavage", "Hemodialysis"]', 1, 'WBI is superior for sustained-release/extended-release preparations.'),
    (v_topic_id, 'Urinary acidification (using Ammonium Chloride) was once used for amphetamines but is now avoided because it can worsen:', '["Liver damage", "Rhabdomyolysis and acute kidney injury", "Seizures", "Hypertension"]', 1, 'Acidic urine promotes the precipitation of myoglobin in the tubules.'),
    (v_topic_id, 'What is the "First Priority" in the management of any poisoned patient?', '["Giving the antidote", "ABCs (Airway, Breathing, Circulation)", "Gastric lavage", "Ordering a toxicology screen"]', 1, 'Stabilization always precedes decontamination or specific treatment.'),
    (v_topic_id, '"Coma Cocktail" traditionally included Oxygen, Thiamine, Naloxone, and:', '["Atropine", "Glucose (Dextrose)", "Charcoal", "Flumazenil"]', 1, 'Dextrose treats hypoglycemia, a common cause of altered mental status.'),
    (v_topic_id, 'Why is Thiamine given before Dextrose in a suspected alcoholic patient?', '["To increase sugar absorption", "To prevent Wernicke Encephalopathy", "To stop vomiting", "To treat liver failure"]', 1, 'Glucose can precipitate Wernicke''s in thiamine-deficient patients.'),
    (v_topic_id, 'Which toxicology screen is most reliable?', '["Urine immunoassay", "Serum GC-MS (Gas Chromatography-Mass Spectrometry)", "Blood count", "X-ray"]', 1, 'GC-MS is the "gold standard" for definitive identification.'),
    (v_topic_id, 'A patient presents with pinpoint pupils, respiratory depression, and bradycardia. Which toxidrome?', '["Anticholinergic", "Opioid", "Sympathomimetic", "Cholinergic"]', 1, 'This is the "Opioid Triad."'),
    (v_topic_id, 'What is the "DUMBELS" mnemonic for Cholinergic toxicity?', '["Diarrhea, Urination, Miosis, Bradycardia, Emesis, Lacrimation, Salivation", "Dizziness, Ulcers, Mania, Bone pain, Edema, Limping, Sleepiness", "None", "Deafness, Uveitis, Myalgia, Burning, Exhaustion, Loss of taste"]', 0, 'It represents the muscarinic effects of organophosphates or nerve agents.'),
    (v_topic_id, 'Which toxidrome presents as "Mad as a hatter, Red as a beet, Dry as a bone, Blind as a bat, Hot as a hare"?', '["Cholinergic", "Anticholinergic", "Opioid", "Sympathomimetic"]', 1, 'Caused by drugs like Atropine, Scopolamine, or TCAs.'),
    (v_topic_id, 'The key difference between Sympathomimetic (Cocaine) and Anticholinergic (Atropine) toxidromes is:', '["Pupil size", "Presence of sweat (Sympathomimetic = wet; Anticholinergic = dry)", "Heart rate", "Agitation"]', 1, 'Both cause tachycardia and mydriasis, but only Sympathomimetics cause diaphoresis.'),
    (v_topic_id, 'A patient has a heart rate of 140, BP 180/110, dilated pupils, and is sweating profusely. Most likely substance?', '["Morphine", "Cocaine/Amphetamines", "Atropine", "Diazepam"]', 1, 'Sympathomimetic toxidrome.'),
    (v_topic_id, 'What is the primary risk of severe Sympathomimetic toxicity?', '["Liver failure", "Hypertensive crisis, stroke, and myocardial infarction", "Respiratory depression", "Bradycardia"]', 1, 'Excess catecholamines stress the cardiovascular system.'),
    (v_topic_id, 'In Anticholinergic toxicity, the "Hot as a hare" refers to:', '["Agitation", "Hyperthermia due to lack of sweating", "Flushing", "Seizures"]', 1, 'Inability to sweat impairs thermoregulation.'),
    (v_topic_id, 'What is the "Killer B''s" of Cholinergic toxicity?', '["Bradycardia, Bronchorrhea, and Bronchospasm", "Bleeding, Bruising, Bone pain", "Burning, Blistering, Blurring", "None"]', 0, 'These muscarinic effects are the primary cause of death in organophosphate poisoning.'),
    (v_topic_id, 'Nicotinic effects of Cholinergic toxicity (e.g., organophosphates) include:', '["Miosis", "Muscle fasciculations, cramping, and paralysis", "Salivation", "Diarrhea"]', 1, 'Overstimulation of the NMJ leads to "Monday-Tuesday-Wednesday-Thursday-Friday" (Mydriasis, Tachycardia, Weakness, Hypertension, Fasciculations).'),
    (v_topic_id, 'Which toxidrome presents with CNS depression, ataxia, and slurred speech but normal vitals?', '["Opioid", "Sedative-Hypnotic (Benzodiazepines/Barbiturates)", "Sympathomimetic", "Anticholinergic"]', 1, 'Sedative-hypnotics generally don''t cause the vitals changes seen in opioids.'),
    (v_topic_id, 'The "SLUDGE" mnemonic for Cholinergic toxicity stands for:', '["Salivation, Lacrimation, Urination, Defecation, GI distress, Emesis", "Sleep, Lethargy, Ulcers, Drowsiness, Gastritis, Edema", "None", "Skin, Lung, Urine, Diet, Gall, Ear"]', 0, 'Another way to remember parasympathetic overactivity.'),
    (v_topic_id, 'Which substance can cause a "Mixed" toxidrome (e.g., both sympathomimetic and anticholinergic features)?', '["Cocaine", "Tricyclic Antidepressants (TCAs)", "Heroin", "Ethanol"]', 1, 'TCAs block muscarinic receptors AND inhibit norepinephrine reuptake.'),
    (v_topic_id, 'Physical exam finding: "Vertical and horizontal nystagmus" is highly suggestive of poisoning with:', '["Ethanol", "Phencyclidine (PCP)", "Cocaine", "LSD"]', 1, 'PCP causes aggressive behavior and unique multidirectional nystagmus.'),

    -- SECTION 2: SPECIFIC TOXIDROMES & PITFALLS (36-70)
    (v_topic_id, 'A patient with "Garlic breath" and severe diarrhea likely has which poisoning?', '["Lead", "Arsenic", "Mercury", "Cyanide"]', 1, 'Arsenic is the classic "garlic" poison.'),
    (v_topic_id, '"Bitter Almond" smell on the breath suggests:', '["Arsenic", "Cyanide", "Methanol", "Acetone"]', 1, 'Cyanide inhibits cytochrome c oxidase.'),
    (v_topic_id, '"Oil of Wintergreen" smell suggests ingestion of:', '["Aspirin", "Methyl Salicylate", "Iron", "Vitamin C"]', 1, 'Methyl salicylate is highly toxic even in small amounts.'),
    (v_topic_id, 'Which toxidrome causes "Mydriasis" (dilated pupils)?', '["Opioid", "Anticholinergic and Sympathomimetic", "Cholinergic", "All of the above"]', 1, 'Both increase pupillary diameter via different mechanisms.'),
    (v_topic_id, 'Which toxidrome causes "Miosis" (pinpoint pupils)?', '["Opioids and Cholinergics", "Sympathomimetics", "Anticholinergics", "None"]', 0, 'Parasympathetic dominance or mu-opioid activation causes constriction.'),
    (v_topic_id, 'Isopropanol ingestion causes which unique combination?', '["Anion gap acidosis", "Osmolar gap WITHOUT metabolic acidosis", "High anion gap", "Normal gap"]', 1, 'Isopropanol is metabolized to acetone (an osmole but not an acid).'),
    (v_topic_id, 'The "Wood Alcohol" poisoning that causes blindness is:', '["Ethanol", "Methanol", "Ethylene Glycol", "Isopropanol"]', 1, 'Methanol is metabolized to formic acid, which is toxic to the optic nerve.'),
    (v_topic_id, 'Antifreeze poisoning that causes kidney stones (calcium oxalate) is:', '["Methanol", "Ethylene Glycol", "Isopropanol", "Ethanol"]', 1, 'Metabolism produces oxalic acid.'),
    (v_topic_id, '"Fomepizole" is the antidote for which poisonings?', '["Lead and Iron", "Methanol and Ethylene Glycol", "Opioids", "Benzodiazepines"]', 1, 'It inhibits Alcohol Dehydrogenase, preventing the formation of toxic metabolites.'),
    (v_topic_id, 'What is the second-line alternative to Fomepizole?', '["Acetone", "Ethanol", "Isopropanol", "Sodium bicarbonate"]', 1, 'Ethanol has a higher affinity for alcohol dehydrogenase than methanol/ethylene glycol.'),
    (v_topic_id, 'A patient presents with a "Bull''s eye" rash after a tick bite. What is the treatment?', '["Penicillin", "Doxycycline", "Vancomycin", "Aspirin"]', 1, 'Treatment for Lyme disease (not technically toxicology, but often included in environmental tox).'),
    (v_topic_id, 'In "Serotonin Syndrome," which physical exam finding is most distinguishing from NMS?', '["Fever", "Hyperreflexia and Clonus", "Rigidity", "Altered mental status"]', 1, 'Lower extremity clonus is characteristic of serotonin excess.'),
    (v_topic_id, 'Antidote for Serotonin Syndrome?', '["Naloxone", "Cyproheptadine", "Bromocriptine", "Dantrolene"]', 1, 'Cyproheptadine is a 5-HT2 receptor antagonist.'),
    (v_topic_id, 'Antidote for Neuroleptic Malignant Syndrome (NMS)?', '["Naloxone", "Dantrolene or Bromocriptine", "Cyproheptadine", "Flumazenil"]', 1, 'Dantrolene (muscle relaxant) or Bromocriptine (dopamine agonist).'),
    (v_topic_id, 'What is the classic ECG finding in Tricyclic Antidepressant (TCA) overdose?', '["Short QT", "Wide QRS and tall R wave in aVR", "ST elevation", "T wave inversion"]', 1, 'TCAs block sodium channels in the heart, slowing conduction.'),
    (v_topic_id, 'What is the treatment for TCA-induced QRS widening?', '["Lidocaine", "Sodium Bicarbonate", "Amiodarone", "Atropine"]', 1, 'Sodium bicarbonate increases extracellular sodium and pH, overcoming the channel blockade.'),
    (v_topic_id, 'A patient with chronic alcoholism presents with confusion, ataxia, and ophthalmoplegia. Diagnosis?', '["Methanol poisoning", "Wernicke Encephalopathy", "Stroke", "Hypoglycemia"]', 1, 'The classic triad of thiamine deficiency.'),
    (v_topic_id, '"Blue-green" emesis suggests poisoning with:', '["Iron", "Copper salts", "Lead", "Arsenic"]', 1, 'Copper sulfate is blue.'),
    (v_topic_id, 'In a "Body Packer" whose drug packet has ruptured, what is the best management?', '["WBI", "Emergency Surgery", "Laxatives", "Charcoal"]', 1, 'Ruptured packets lead to massive absorption and require immediate surgical removal.'),
    (v_topic_id, 'What is the "Antidote" for Benzodiazepine overdose?', '["Naloxone", "Flumazenil", "Atropine", "Physostigmine"]', 1, 'Flumazenil is a competitive GABA-A receptor antagonist.'),
    (v_topic_id, 'Why is Flumazenil used cautiously (or avoided) in chronic BZD users?', '["It causes liver failure", "It can precipitate life-threatening seizures", "It causes heart attacks", "It is ineffective"]', 1, 'Acute withdrawal in a dependent patient can trigger seizures.'),
    (v_topic_id, '"Physostigmine" is the antidote for which toxidrome?', '["Cholinergic", "Anticholinergic", "Opioid", "Sympathomimetic"]', 1, 'It is an acetylcholinesterase inhibitor that crosses the BBB.'),
    (v_topic_id, 'What is the major contraindication for Physostigmine?', '["History of asthma", "TCA overdose (risk of heart block/asystole)", "Old age", "Pregnancy"]', 1, 'TCA-induced conduction delays are worsened by physostigmine.'),
    (v_topic_id, 'A child swallows several "Iron" supplement tablets. What is the antidote?', '["N-acetylcysteine", "Deferoxamine", "Dimercaprol", "EDTA"]', 1, 'Iron-chelating agent.'),
    (v_topic_id, '"Vin-rose" urine after Deferoxamine administration indicates:', '["Blood in urine", "Excretion of the ferrioxamine complex (Iron is being cleared)", "Liver failure", "Kidney failure"]', 1, 'The complex has a reddish-pink color.'),
    (v_topic_id, 'Treatment for Beta-blocker overdose that acts by increasing cAMP via a non-adrenergic pathway?', '["Epinephrine", "Glucagon", "Atropine", "Insulin"]', 1, 'Glucagon has its own receptors on the heart that stimulate Gs protein.'),
    (v_topic_id, '"High-dose Insulin" therapy is used for which overdoses?', '["Diabetes", "Beta-blocker and Calcium Channel Blocker (CCB) overdose", "Aspirin", "Iron"]', 1, 'It provides a metabolic boost to the failing heart.'),
    (v_topic_id, 'Antidote for "Cyanide" poisoning in the modern kit?', '["Methylene blue", "Hydroxocobalamin (Cyanokit)", "N-acetylcysteine", "Atropine"]', 1, 'Hydroxocobalamin binds cyanide to form Vitamin B12 (cyanocobalamin).'),
    (v_topic_id, 'Older Cyanide kits used "Amyl Nitrite" to create what substance to trap cyanide?', '["Hemoglobin", "Methemoglobin", "Carboxyhemoglobin", "Myoglobin"]', 1, 'Methemoglobin has a high affinity for cyanide (forming cyanmethemoglobin).'),
    (v_topic_id, 'Which drug is used for "Methemoglobinemia" (e.g., from Nitrites or Local Anesthetics)?', '["Hydroxocobalamin", "Methylene Blue", "N-acetylcysteine", "Dimercaprol"]', 1, 'It acts as an electron donor to reduce Fe3+ back to Fe2+.'),
    (v_topic_id, 'What is the "Antidote" for Digoxin toxicity?', '["Atropine", "Digoxin-specific antibody fragments (DigiFab)", "Calcium", "Potassium"]', 1, 'Antibodies bind and neutralize the drug.'),
    (v_topic_id, 'In Digoxin toxicity, should you give IV Calcium for hyperkalemia?', '["Yes, immediately", "No (the \"Stone Heart\" theory suggests it may cause irreversible contraction)", "Only if the patient is young", "Only if the patient is old"]', 1, 'Calcium may worsen digoxin-induced arrhythmias; use DigiFab or insulin/dextrose instead.'),
    (v_topic_id, 'Which poisoning causes "Cherry-red" skin and mucous membranes?', '["Cyanide", "Carbon Monoxide", "Lead", "Arsenic"]', 1, 'Due to carboxyhemoglobin.'),
    (v_topic_id, 'Which toxin causes "Bright red" venous blood (arterialization of venous blood)?', '["Carbon Monoxide", "Cyanide", "Iron", "Aspirin"]', 1, 'Cyanide prevents cells from using oxygen, so venous blood remains oxygenated.'),
    (v_topic_id, 'A patient with massive Aspirin overdose presents with high fever, metabolic acidosis, and tinnitus. What is the priority treatment?', '["Gastric lavage", "Urinary alkalinization and potentially Hemodialysis", "N-acetylcysteine", "Atropine"]', 1, 'Aggressive elimination is key.');

    RAISE NOTICE 'SUCCESS: Clinical Toxicology MCQ Part 1 (1-70) registered.';
END $$;

COMMIT;
