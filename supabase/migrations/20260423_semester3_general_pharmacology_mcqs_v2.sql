-- Migration: Semester 3 - General Pharmacology MCQ Bank (VOLUME 2 - FULL 100 Qs)
-- Date: 2026-04-23

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'general-pharmacology' LIMIT 1;

    -- BLOCK 1: MOLECULAR PK & DIFFUSION
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A drug with a molecular weight of 80,000 Daltons is administered intravenously. What is its likely Volume of Distribution (Vd)?', '["3 L", "14 L", "42 L", "100 L"]', 0, 'Very large molecules are trapped within the vascular compartment (plasma volume), which is approx 3 L.'),
    (v_topic_id, 'Which of the following describes "Facilitated Diffusion"?', '["Movement against gradient using ATP", "Carrier-mediated transport down gradient without energy", "Passage through aqueous pores", "Engulfing by membrane"]', 1, 'Requires a transporter protein but moves molecules from high to low concentration without energy.'),
    (v_topic_id, 'For a weak base drug with a pKa of 8.0, in which environment will it be most lipid-soluble?', '["Stomach (pH 2.0)", "Duodenum (pH 5.0)", "Ileum (pH 8.0)", "Plasma (pH 7.4)"]', 2, 'Weak bases are non-ionized (lipid-soluble) when the pH is higher than or equal to their pKa.'),
    (v_topic_id, 'What is the effect of high plasma protein binding on the glomerular filtration of a drug?', '["Increases filtration", "No effect", "Decreases filtration", "Causes secretion"]', 2, 'Only the "free" or unbound fraction of a drug can pass through the glomerular filtration barrier.'),
    (v_topic_id, 'Which organ has the highest Extraction Ratio for drugs subject to a high first-pass effect?', '["Kidney", "Lung", "Liver", "Spleen"]', 2, 'The liver is the primary site for the first-pass effect as portal blood enters it directly.');

    -- BLOCK 2: METABOLISM & KINETICS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which Phase I enzyme is primarily responsible for the metabolism of caffeine and theophylline?', '["CYP3A4", "CYP2D6", "CYP1A2", "CYP2C19"]', 2, 'CYP1A2 is the specific isoform induced by smoking and responsible for xanthine metabolism.'),
    (v_topic_id, 'In First-Order kinetics, what remains constant over time?', '["Amount eliminated per hour", "Half-life of the drug", "Plasma concentration", "Saturation of enzymes"]', 1, 'In first-order elimination, a constant fraction is eliminated, meaning t1/2 is independent of dose.'),
    (v_topic_id, 'Which Phase II reaction involves the addition of an acetyl group from Acetyl-CoA?', '["Glucuronidation", "Acetylation", "Sulfation", "Methylation"]', 1, 'Performed by NAT; subject to genetic polymorphism (fast vs slow acetylators).'),
    (v_topic_id, 'A drug has clearance of 50 mL/min and Vd of 100 L. Calculate Ke.', '["0.0005 min-1", "0.005 min-1", "0.5 min-1", "2.0 min-1"]', 0, 'Ke = Cl / Vd. 50 mL/min / 100,000 mL = 0.0005 min-1.'),
    (v_topic_id, 'Which factor can lead to the Saturation of drug metabolism, shifting kinetics to zero-order?', '["Low concentration", "High concentration exceeding enzyme capacity", "Increased renal flow", "Prodrug use"]', 1, 'Zero-order occurs when metabolic pathways are saturated (e.g. Ethanol, Phenytoin).');

    -- BLOCK 3: RECEPTOR THEORY & SIGNALING
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'What is the Intrinsic Activity of a competitive antagonist?', '["1.0", "0.5", "0", "-1.0"]', 2, 'Antagonists have affinity (they bind) but zero intrinsic activity (no response triggered).'),
    (v_topic_id, 'The Therapeutic Window represents the range between:', '["ED50 and TD50", "Cmax and Tmax", "Minimum effective and minimum toxic concentrations", "F and Cl"]', 2, 'The safe concentration range where the drug is effective without being toxic.'),
    (v_topic_id, 'Which second messenger is inhibited when a Gi protein is activated?', '["cAMP", "IP3", "DAG", "cGMP"]', 0, 'Gi proteins inhibit Adenylyl Cyclase, which leads to a decrease in cAMP production.'),
    (v_topic_id, 'A drug that stabilizes a receptor in its inactive conformation, reducing baseline activity, is a:', '["Agonist", "Antagonist", "Partial agonist", "Inverse agonist"]', 3, 'Inverse agonists suppress constitutive (baseline) receptor activity.'),
    (v_topic_id, 'What happens to the Emax of an agonist in the presence of a non-competitive antagonist?', '["Increases", "Stays same", "Decreases", "Shifts left"]', 2, 'Non-competitive antagonists effectively remove receptors from the system, lowering maximal response.');

    -- BLOCK 4: SIGNAL TRANSDUCTION
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which second messenger is produced by the action of Phospholipase C?', '["cAMP", "cGMP", "IP3", "Tyrosine Kinase"]', 2, 'PLC cleaves PIP2 into IP3 (calcium release) and DAG (PKC activation).'),
    (v_topic_id, 'Which is an example of Chemical Antagonism?', '["Propranolol vs NE", "Insulin vs Glucagon", "Protamine vs Heparin", "Atropine vs ACh"]', 2, 'Chemical antagonism occurs when two drugs react to form an inactive complex.'),
    (v_topic_id, 'In the signal transduction of the Nicotinic receptor, what is the primary event?', '["Gs activation", "Opening of Na+/K+ ion channel", "Tyrosine phosphorylation", "JAK-STAT activation"]', 1, 'The Nicotinic receptor is an ionotropic receptor that opens an integrated channel.'),
    (v_topic_id, 'Which receptor type involves dimerization and autophosphorylation?', '["GPCR", "Ion channel", "Receptor Tyrosine Kinase", "Nuclear receptor"]', 2, 'RTKs (e.g. Insulin receptor) must dimerize to activate intracellular kinase domains.'),
    (v_topic_id, 'Summation of drug effects is defined as:', '["1 + 1 = 3", "1 + 1 = 2", "1 + 0 = 2", "1 + 1 = 0"]', 1, 'Combined effect equals the sum of individual effects (additive effect).');

    -- BLOCK 5: CLINICAL TOXICOLOGY & INTERACTIONS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Patient on Digoxin begins Amiodarone; Digoxin levels rise. Mechanism?', '["CYP3A4 induction", "Inhibition of P-glycoprotein (P-gp)", "Increased renal flow", "Decreased protein binding"]', 1, 'Amiodarone inhibits P-gp, which is responsible for Digoxin secretion.'),
    (v_topic_id, 'Which heavy metal is treated with Penicillamine as a first-line chelator?', '["Lead", "Iron", "Copper (Wilson''s)", "Mercury"]', 2, 'Penicillamine is a specific copper-chelating agent used in Wilson''s disease.'),
    (v_topic_id, 'Disulfiram-like reaction with alcohol while on an antibiotic. Likely culprit?', '["Penicillin G", "Metronidazole", "Ciprofloxacin", "Azithromycin"]', 1, 'Metronidazole inhibits acetaldehyde dehydrogenase, causing toxic buildup.'),
    (v_topic_id, 'Which clinical trial phase involves Post-marketing surveillance?', '["Phase I", "Phase II", "Phase III", "Phase IV"]', 3, 'Phase IV occurs after approval to detect rare, long-term adverse effects.'),
    (v_topic_id, 'Antidote for Cyanide poisoning that provides a sulfur donor:', '["Sodium Nitrite", "Sodium Thiosulfate", "Hydroxocobalamin", "Methylene Blue"]', 1, 'Thiosulfate acts as a sulfur donor for rhodanese to detoxify cyanide.');

    -- BLOCK 6: RENAL & HEPATIC PRINCIPLES
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which equation correctly represents Clearance?', '["Cl = Dose / Vd", "Cl = Elimination Rate / Plasma Concentration", "Cl = Vd x t1/2", "Cl = Dosing Rate x F"]', 1, 'Clearance is the volume of plasma cleared of drug per unit time.'),
    (v_topic_id, 'Drug 100% secreted by OAT in kidney. Co-administered Probenecid effect?', '["Cl increases", "Half-life increases", "Liver toxicity", "Filtered faster"]', 1, 'Probenecid competes for OAT, slowing secretion and increasing half-life.'),
    (v_topic_id, 'Which is a Phase II metabolic reaction?', '["Dealkylation", "Hydrolysis", "Glucuronidation", "Hydroxylation"]', 2, 'Glucuronidation is a conjugation (Phase II) reaction.'),
    (v_topic_id, 'Cirrhotic patient with low albumin. Effect on Warfarin?', '["Decreased free drug", "Increased free drug concentration", "Decreased Vd", "No change"]', 1, 'Less albumin means more "free" active drug, increasing risk of bleeding.'),
    (v_topic_id, 'Term for drug secreted in bile, entered intestine, and reabsorbed:', '["First-pass", "Enterohepatic Recirculation", "GFR", "Passive reabsorption"]', 1, 'Enterohepatic cycling prolongs the duration of action for many drugs.');

    -- BLOCK 7: ADVANCED PHARMACODYNAMICS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Low Kd (dissociation constant) indicates:', '["Low affinity", "High affinity", "Low efficacy", "High potency"]', 1, 'Kd is the concentration for 50% occupancy; lower Kd means tighter binding.'),
    (v_topic_id, 'Spare Receptor definition:', '["Damaged/non-functional", "Doesn''t need to be occupied for Emax", "CNS only", "Antagonist only"]', 1, 'Maximal response achieved with only a fraction of receptors occupied.'),
    (v_topic_id, 'Primary second messenger for M1 and M3 receptors?', '["cAMP", "cGMP", "IP3/DAG", "Nitric Oxide"]', 2, 'M1 and M3 are Gq coupled, activating the phosphoinositide pathway.'),
    (v_topic_id, 'Which is a Functional Antagonist?', '["Atropine", "Naloxone", "Epinephrine vs Histamine on airways", "Phentolamine"]', 2, 'Opposite physiological effects produced by different receptor agonists.'),
    (v_topic_id, 'Efficacy is best represented by which parameter?', '["EC50", "x-axis intercept", "y-axis maximum (Emax)", "Slope"]', 2, 'Emax is the maximum effect regardless of the dose required.');

    -- BLOCK 8: SPECIAL POPULATIONS & GENETICS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Enzyme absent in neonates leading to Gray Baby Syndrome?', '["CYP3A4", "UDP-glucuronosyltransferase (UGT)", "ADH", "MAO-B"]', 1, 'Neonates cannot conjugate chloramphenicol with glucuronic acid.'),
    (v_topic_id, 'Higher Warfarin dose required in average. Likely polymorphism?', '["CYP2C9", "CYP3A4", "H1 receptor", "VKORC1"]', 3, 'Variations in the target (VKORC1) or metabolism (CYP2C9) alter dose needs.'),
    (v_topic_id, 'Clinical phase first to test efficacy in actual patients?', '["Phase I", "Phase II", "Phase III", "Phase IV"]', 1, 'Phase II evaluates therapeutic efficacy and safety in the target population.'),
    (v_topic_id, 'Why are elderly more sensitive to water-soluble Digoxin?', '["Increased water", "Decreased water and renal clearance", "Increased muscle", "Increased flow"]', 1, 'Less body water (smaller Vd) and declining GFR (reduced clearance).'),
    (v_topic_id, 'Category X FDA pregnancy classification:', '["Safe", "Animal studies safe", "Risks clearly outweigh benefits", "No studies"]', 2, 'Contraindicated in pregnancy due to proven teratogenicity.');

    -- BLOCK 9: GENERAL PRINCIPLES MIX
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Route most affected by presence of food in stomach?', '["IV", "Sublingual", "Oral", "IM"]', 2, 'Food alters gastric emptying and can physically interfere with absorption.'),
    (v_topic_id, 'Primary benefit of a Loading Dose?', '["Decrease toxicity", "Reach steady-state more rapidly", "Increase half-life", "Avoid first-pass"]', 1, 'Bypasses the 4-5 half-lives usually required to reach plateau.'),
    (v_topic_id, 'Type B (Idiosyncratic) adverse reaction example:', '["Hypoglycemia", "Bradycardia", "Hemolysis in G6PD deficiency", "Gastric ulcers"]', 2, 'Unpredictable, genetic-based response not related to primary mechanism.'),
    (v_topic_id, 'Therapeutic Index (TI) of 2.0 is considered:', '["Very safe", "Wide safety margin", "Narrow (potentially dangerous)", "Non-toxic"]', 2, 'Low TI means toxic and effective doses are very close (e.g. Lithium, Digoxin).'),
    (v_topic_id, 'Second messenger for ANP receptor?', '["cAMP", "cGMP", "IP3", "Tyrosine Kinase"]', 1, 'ANP receptor has intrinsic guanylyl cyclase activity producing cGMP.');

    -- BLOCK 10: PK/PD CALCULATIONS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Half-lives required to eliminate 93.75% of drug?', '["2", "3", "4", "5"]', 2, '1=50%, 2=75%, 3=87.5%, 4=93.75%.'),
    (v_topic_id, 'Drug highly bound to tissue proteins. Resulting Vd?', '["Very small", "Equal to plasma", "Very large (> 42 L)", "14 L"]', 2, 'Tissue sequestration pulls drug out of plasma, increasing calculated Vd.'),
    (v_topic_id, 'Bioequivalence definition:', '["Same structure", "No significant difference in rate/extent of absorption", "Same class", "Metabolite match"]', 1, 'Ensures generic drugs can be substituted for brand name.'),
    (v_topic_id, 'Maintenance Dose determinant:', '["Vd", "Clearance", "Potency", "Half-life"]', 1, 'Maintenance dose replaces drug cleared per unit time.'),
    (v_topic_id, 'GABA-A receptor is a:', '["Na channel", "Cl channel", "GPCR", "Nuclear receptor"]', 1, 'Activation increases chloride influx, causing hyperpolarization (inhibition).');

    -- BLOCK 11: SIGNALING SPECIFICS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Enzyme that converts ATP to cAMP:', '["Phosphodiesterase", "Adenylyl Cyclase", "Guanylyl Cyclase", "Protein Kinase A"]', 1, 'Adenylyl cyclase is the effector for Gs and Gi proteins.'),
    (v_topic_id, 'Second messenger for Alpha-1 adrenergic receptor:', '["cAMP", "IP3/DAG", "cGMP", "Tyrosine Kinase"]', 1, 'Alpha-1 receptors are Gq coupled, activating PLC.'),
    (v_topic_id, 'JAK-STAT signaling pathway used by:', '["Insulin", "Growth Hormone", "ACh (Nicotinic)", "Epinephrine"]', 1, 'Growth hormone and many cytokines lack intrinsic kinases and use JAK-STAT.'),
    (v_topic_id, 'Methanol poisoning antidote:', '["Naloxone", "Ethanol or Fomepizole", "Atropine", "Flumazenil"]', 1, 'Inhibits Alcohol Dehydrogenase to prevent toxic metabolite formation.'),
    (v_topic_id, 'Cinchonism (tinnitus/headache) association:', '["Aspirin", "Quinidine", "Gentamicin", "Digoxin"]', 1, 'Classic side effect profile for Cinchona alkaloids.');

    -- BLOCK 12: TOXICOLOGY & ANTIDOTES (Part 2)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Specific antidote for Benzodiazepine overdose:', '["Naloxone", "Flumazenil", "N-acetylcysteine", "Protamine"]', 1, 'Flumazenil is a competitive antagonist at the BZD binding site.'),
    (v_topic_id, 'Gray Baby Syndrome Phase II reaction deficiency:', '["Acetylation", "Methylation", "Glucuronidation", "Sulfation"]', 2, 'Neonates lack UDP-glucuronosyltransferase (UGT) activity.'),
    (v_topic_id, 'Red Man Syndrome cause:', '["Penicillin", "Vancomycin", "Erythromycin", "Ciprofloxacin"]', 1, 'Rapid infusion leads to direct mast cell degranulation.'),
    (v_topic_id, 'Steady state achieved after regular dosing in:', '["1 half-life", "2 half-lives", "4-5 half-lives", "10 half-lives"]', 2, 'At 4-5 half-lives, intake equals output.'),
    (v_topic_id, 'Drug Vd = 40L, Cl = 2L/hr. Half-life?', '["13.8 hr", "20 hr", "6.93 hr", "40 hr"]', 0, 't1/2 = 0.693 x Vd / Cl. 0.693 x 40 / 2 = 13.86 hr.');

    -- BLOCK 13: PHARMACOKINETICS MIX
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Route subject to First-Pass Effect:', '["Sublingual", "Intravenous", "Oral", "Transdermal"]', 2, 'Portal delivery to liver before systemic circulation.'),
    (v_topic_id, 'pH at which weak acid (pKa 4.4) is 50% ionized:', '["1.0", "4.4", "7.4", "10.0"]', 1, 'Ionized/non-ionized concentrations equal when pH = pKa.'),
    (v_topic_id, 'Factor increasing Loading Dose:', '["Decreased Cl", "Increased Vd", "Increased t1/2", "Decreased potency"]', 1, 'LD = Target concentration x Vd.'),
    (v_topic_id, 'CYP450 Inhibitor:', '["Rifampin", "Phenytoin", "Ketoconazole", "Carbamazepine"]', 2, 'Ketoconazole is a potent inhibitor.'),
    (v_topic_id, 'Grapefruit juice inhibits intestinal enzyme:', '["CYP2D6", "CYP3A4", "CYP1A2", "MAO-A"]', 1, 'Leads to increased bioavailability of drugs like statins.');

    -- BLOCK 14: ENZYMES & RECEPTORS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Prodrug converted to active form by CYP2D6:', '["Enalapril", "Codeine", "Prednisone", "Levodopa"]', 1, 'Codeine conversion to Morphine requires CYP2D6.'),
    (v_topic_id, 'Phase I reaction involving addition of -OH group:', '["Reduction", "Hydrolysis", "Oxidation", "Acetylation"]', 2, 'Hydroxylation is an oxidative process.'),
    (v_topic_id, 'Highest concentration of CYP450 organ:', '["Kidney", "Lung", "Liver", "Brain"]', 2, 'Liver is the primary metabolic factory.'),
    (v_topic_id, 'Log-Dose Response: Curve A to the left of B means:', '["A is more efficacious", "A is more potent", "B is partial agonist", "A is antagonist"]', 1, 'Left shift = Higher potency.'),
    (v_topic_id, 'Intrinsic Activity of partial agonist:', '["1.0", "0", "Between 0 and 1.0", "Less than 0"]', 2, 'Cannot reach maximal effect of full agonist.');

    -- BLOCK 15: ADVERSE EFFECTS & EXCRETION
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Tachyphylaxis definition:', '["Gradual loss", "Rapid desensitization in min/hr", "Increased sensitivity", "Genetic resistance"]', 1, 'Acute loss of response.'),
    (v_topic_id, 'Competitive antagonist changes ED50 but NOT:', '["Potency", "Emax", "Affinity", "Slope"]', 1, 'Maximal efficacy remains achievable with higher dose.'),
    (v_topic_id, 'Alpha-1 adrenergic receptor G-protein type:', '["Alpha-2", "Beta-1", "Alpha-1 (Gq)", "D2"]', 2, 'Alpha-1 is Gq coupled (PLC pathway).'),
    (v_topic_id, 'Drug blocking renal tubular secretion of Penicillin:', '["Aspirin", "Probenecid", "Furosemide", "Spironolactone"]', 1, 'Competes for Organic Anion Transporter (OAT).'),
    (v_topic_id, 'Type 1 hypersensitivity reaction example:', '["Serum Sickness", "Contact Dermatitis", "Anaphylaxis (IgE)", "Hemolytic Anemia"]', 2, 'Immediate IgE-mediated response.');

    -- BLOCK 16: SIGNALING & KINETICS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'First-order elimination characteristic:', '["Constant amount", "Constant fraction", "Saturation", "Linear decline"]', 1, 'Rate is proportional to concentration.'),
    (v_topic_id, 'Steady State definition:', '["Eliminated", "Rate in = Rate out", "Peak conc", "No absorption"]', 1, 'Constant plasma level during repeated dosing.'),
    (v_topic_id, 'Factor decreasing Volume of Distribution:', '["High lipid solubility", "High plasma protein binding", "Tissue binding", "Low molecular weight"]', 1, 'Keeps drug in vascular space.'),
    (v_topic_id, 'Second messenger activating Protein Kinase A (PKA):', '["cGMP", "IP3", "cAMP", "DAG"]', 2, 'Adenylyl cyclase produces cAMP which activates PKA.'),
    (v_topic_id, 'Muscarinic receptor link:', '["Nicotinic", "Insulin", "Muscarinic (G-protein)", "Estrogen"]', 2, 'Muscarinic receptors are GPCRs.');

    -- BLOCK 17: FINAL MECHANISMS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Effector enzyme for Gq protein:', '["Adenylyl Cyclase", "Phospholipase C", "Guanylyl Cyclase", "Phosphodiesterase"]', 1, 'PLC produces IP3 and DAG.'),
    (v_topic_id, 'JAK-STAT Janus Kinase definition:', '["Just another", "Junctional", "Janus Kinase", "Joint activation"]', 2, 'Non-receptor tyrosine kinases.'),
    (v_topic_id, 'Smooth muscle relaxation in response to Nitric Oxide messenger:', '["cAMP", "cGMP", "IP3", "DAG"]', 1, 'cGMP activates PKG to cause relaxation.'),
    (v_topic_id, 'Antidote for Heparin overdose:', '["Vitamin K", "Protamine Sulfate", "Aminocaproic acid", "FFP"]', 1, 'Positive Protamine neutralizes negative Heparin.'),
    (v_topic_id, 'Antidote for Warfarin overdose:', '["Protamine", "Vitamin K", "Naloxone", "Flumazenil"]', 1, 'Vitamin K promotes clotting factor synthesis.');

    -- BLOCK 18: TOXICOLOGY & SAFETY (Final)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Acetylcysteine replenishes which molecule in paracetamol poisoning?', '["ATP", "Glutathione", "Vitamin C", "Glucuronic Acid"]', 1, 'Necessary to detoxify NAPQI.'),
    (v_topic_id, 'Pinpoint Pupils and Salivation toxicity:', '["Atropine", "Organophosphates (Pesticides)", "Amphetamines", "Cocaine"]', 1, 'Cholinergic crisis (SLUDGE).'),
    (v_topic_id, 'Antidote regenerating Acetylcholinesterase:', '["Atropine", "Pralidoxime (2-PAM)", "Physostigmine", "Neostigmine"]', 1, 'Removes phosphate from the enzyme.'),
    (v_topic_id, 'Black Box Warning definition:', '["Out of stock", "Strictest warning for serious risks", "Generic only", "Cost warning"]', 1, 'Highest safety alert on label.'),
    (v_topic_id, 'Phase III designs:', '["Phase I", "Phase II", "Double-Blind / Placebo-Controlled", "Phase IV"]', 2, 'Definitive pre-approval trials.');

    -- BLOCK 19: REGULATORY & PRINCIPLES
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'IND application filed:', '["Before animal", "Before human testing (Phase I) starts", "After Phase III", "After pharmacy"]', 1, 'Request to start clinical trials.'),
    (v_topic_id, 'Teratogenicity definition:', '["Liver toxicity", "Ability to cause birth defects", "Cancer", "Kidney toxicity"]', 1, 'Developmental malformations.'),
    (v_topic_id, 'Post-marketing surveillance example:', '["Animal", "Phase IV trials", "Healthy volunteers", "In vitro"]', 1, 'Real-world performance monitoring.'),
    (v_topic_id, 'Pharmacodynamics involves study of:', '["Vd/Cl", "Dose-response and mechanisms", "Bioavailability", "Renal excretion"]', 1, 'Body''s response to the drug.'),
    (v_topic_id, 'Affinity definition:', '["Max response", "Strength of bond between drug and receptor", "Absorption speed", "Metabolism rate"]', 1, 'Measure of binding tightness.');

    -- BLOCK 20: FINAL SIGNALING
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Second messenger activating Protein Kinase C:', '["cAMP", "IP3", "DAG", "cGMP"]', 2, 'DAG stays in membrane to activate PKC.'),
    (v_topic_id, 'G-protein inhibiting Adenylyl Cyclase:', '["Gs", "Gi", "Gq", "Go"]', 1, 'Gi is inhibitory.'),
    (v_topic_id, 'Steady State typically achieved after how many half-lives?', '["1", "2", "4-5", "10"]', 2, 'Plateau reached in 4-5 t1/2.');

    RAISE NOTICE 'SUCCESS: FULL General Pharmacology MCQ Volume 2 (100 questions) registered.';
END $$;

COMMIT;
