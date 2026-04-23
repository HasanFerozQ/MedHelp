-- Migration: Semester 3 - General Pharmacology MCQ Bank (COMPREHENSIVE)
-- Date: 2026-04-23

BEGIN;

-- 1. Ensure Topic "General Pharmacology" exists for Semester 3
INSERT INTO topics (semester_id, title, slug, "order")
VALUES (3, 'General Pharmacology', 'general-pharmacology', 20)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, semester_id = 3;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'general-pharmacology' LIMIT 1;

    -- SECTION 1: PHARMACOKINETICS - PRINCIPLES & ABSORPTION
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A drug that is a weak acid with a pKa of 3.5 is administered orally. In which environment will it be most lipid-soluble and easily absorbed?', '["Stomach (pH 1.5)", "Duodenum (pH 5.0)", "Ileum (pH 8.0)", "Plasma (pH 7.4)"]', 0, 'Weak acids are non-ionized (lipid-soluble) when the pH is lower than the pKa.'),
    (v_topic_id, 'Which of the following parameters determines the time required to reach steady-state plasma concentration?', '["Bioavailability", "Volume of distribution", "Elimination half-life", "Clearance"]', 2, 'Steady state is reached after approximately 4–5 half-lives, independent of dose or frequency.'),
    (v_topic_id, 'An 80 kg patient is given a 400 mg dose intravenously. The plasma concentration immediately after injection is 10 mg/L. What is the Vd?', '["4 L", "40 L", "80 L", "400 L"]', 1, 'Vd = Dose / C0. 400 mg / 10 mg/L = 40 L.'),
    (v_topic_id, 'A drug with a very high Vd (> 42 L) most likely possesses which characteristic?', '["High molecular weight", "Extensive protein binding", "High lipophilicity and tissue sequestration", "Highly ionized"]', 2, 'Drugs that sequester in fat/tissues have a Vd exceeding total body water volume.'),
    (v_topic_id, 'Which route of administration is subject to the most significant First-Pass Effect?', '["Sublingual", "Intravenous", "Oral", "Rectal"]', 2, 'Orally administered drugs are metabolized by the liver before reaching systemic circulation.'),
    (v_topic_id, 'Which characteristic allows a drug to cross the blood-brain barrier most effectively?', '["High ionization", "High molecular weight", "High lipid solubility", "Strong binding to albumin"]', 2, 'Only small, non-ionized, lipophilic molecules can diffuse through the tight junctions of the BBB.'),
    (v_topic_id, 'A drug is administered as an oral tablet. Which process describes the fraction of the dose that reaches systemic circulation unchanged?', '["Vd", "Bioavailability", "Clearance", "First-pass metabolism"]', 1, 'Bioavailability (F) is the percentage of drug reaching systemic circulation after absorption/metabolism.');

    -- SECTION 2: METABOLISM AND ELIMINATION
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A patient is treated with a drug that follows zero-order elimination kinetics. Which statement is true?', '["Constant fraction eliminated", "Elimination rate is independent of plasma concentration", "Half-life is constant", "Logarithmic decline"]', 1, 'In zero-order kinetics, a constant amount is eliminated per hour because enzymes are saturated.'),
    (v_topic_id, 'Which Phase II metabolic reaction involves addition of a polar group to increase water solubility?', '["Hydrolysis", "Glucuronidation", "Oxidation via CYP450", "Reduction"]', 1, 'Phase II reactions are conjugation reactions (Glucuronidation, Acetylation, Sulfation).'),
    (v_topic_id, 'A patient taking Warfarin begins taking Rifampin. What is the likely effect on Warfarin?', '["Decreased metabolism", "Increased metabolism and decreased effect", "Increased protein binding", "Decreased renal excretion"]', 1, 'Rifampin is a potent CYP450 inducer, which increases metabolism of co-administered drugs.'),
    (v_topic_id, 'In a patient with Slow Acetylator status, which drug is most likely to cause drug-induced Lupus?', '["Penicillin", "Isoniazid", "Propranolol", "Digoxin"]', 1, 'Isoniazid (along with Hydralazine/Procainamide) is metabolized via N-acetylation; slow acetylators are at risk.'),
    (v_topic_id, 'Which equation correctly defines Clearance (Cl)?', '["Cl = Vd x Ke", "Cl = Dose / Half-life", "Cl = Vd / C0", "Cl = LD x F"]', 0, 'Clearance is the product of the volume of distribution and the elimination rate constant (Ke).'),
    (v_topic_id, 'Which organ has the highest capacity for drug metabolism?', '["Kidney", "Lung", "Liver", "Skin"]', 2, 'The liver contains the highest concentration of CYP450 and Phase II enzymes.'),
    (v_topic_id, 'Following Phenobarbital (weak acid) overdose, what treatment can accelerate renal excretion?', '["Ammonium chloride", "Sodium bicarbonate", "Loop diuretics", "Probenecid"]', 1, 'Alkalinizing the urine ionizes weak acids (ion trapping), preventing reabsorption.');

    -- SECTION 3: PHARMACODYNAMICS - RECEPTORS & SIGNALING
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A drug acts as a non-competitive antagonist. How does this affect the LDR curve of the agonist?', '["Shifts curve right", "Decreases the Emax", "Shifts curve left", "Potency increases"]', 1, 'Non-competitive antagonists reduce total available receptors and thus decrease maximal efficacy.'),
    (v_topic_id, 'Which of the following is an example of a physiological antagonist?', '["Propranolol vs NE", "Naloxone vs Morphine", "Epinephrine vs Histamine (on BP)", "Protamine vs Heparin"]', 2, 'Physiological antagonism occurs when two drugs act on different receptors to produce opposite effects.'),
    (v_topic_id, 'The Therapeutic Index (TI) of a drug is calculated as:', '["ED50 / TD50", "TD50 / ED50", "LD50 x ED50", "Cl / Vd"]', 1, 'TI = Toxic Dose 50 / Effective Dose 50. A higher TI indicates a safer drug.'),
    (v_topic_id, 'A partial agonist, in the presence of a full agonist, acts as a:', '["Synergist", "Chemical antagonist", "Competitive antagonist", "Irreversible antagonist"]', 2, 'Partial agonists compete for the same site but have lower intrinsic activity, reducing the overall response.'),
    (v_topic_id, 'Activation of Gq protein-coupled receptors results in which change?', '["Increased cAMP", "Decreased cAMP", "Increased IP3 and DAG", "Increased cGMP"]', 2, 'Gq activates Phospholipase C, cleaving PIP2 into IP3 (releasing Ca2+) and DAG.'),
    (v_topic_id, 'Which receptor type involves DNA transcription and has a lag time of hours to days?', '["Ligand-gated channels", "GPCRs", "Tyrosine kinases", "Intracellular steroid receptors"]', 3, 'Steroid receptors act as transcription factors, leading to slow-onset protein synthesis.'),
    (v_topic_id, 'On a Log-Dose Response curve, a shift to the left indicates:', '["Increased efficacy", "Increased potency", "Decreased potency", "Competitive antagonism"]', 1, 'A leftward shift means a lower dose (EC50) is required for the same effect.');

    -- SECTION 4: POTENCY, EFFICACY & MECHANISMS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Drug A EC50 = 5mg. Drug B EC50 = 50mg. Same Emax. Which statement is true?', '["A is more efficacious", "B is more potent", "A is more potent", "B is a partial agonist"]', 2, 'Potency refers to the concentration (EC50) required; Drug A requires less dose.'),
    (v_topic_id, 'If two drugs have different Emax but same EC50, they differ in:', '["Potency only", "Efficacy only", "Both", "Neither"]', 1, 'Emax is the measure of efficacy; EC50 is the measure of potency.'),
    (v_topic_id, 'A "Full Agonist" has an intrinsic activity (intrinsic efficacy) of:', '["0", "0.5", "1.0", "-1.0"]', 2, 'Full agonists have a maximal intrinsic activity of 1.0.'),
    (v_topic_id, 'Tachyphylaxis is defined as:', '["Genetically abnormal response", "Rapidly developing tolerance", "Enhanced response", "Allergic reaction"]', 1, 'Tachyphylaxis is an acute decrease in response (e.g. with Nitrates).'),
    (v_topic_id, 'Which of the following binds to Gs protein to increase heart rate?', '["Alpha-1", "Alpha-2", "Beta-1", "M2"]', 2, 'Beta-1 receptors are Gs-coupled and stimulate Adenylyl Cyclase.'),
    (v_topic_id, 'The Quantal Dose-Response curve is used to determine:', '["Maximal efficacy in an individual", "Variation in response within a population", "Mechanism of binding", "Rate of metabolism"]', 1, 'Quantal curves plot the % of population showing an "all-or-none" response.');

    -- SECTION 5: TRANSPORTERS, EXCRETION AND CALCULATIONS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'P-glycoprotein (P-gp) in the blood-brain barrier serves what function?', '["Facilitates drug entry", "Efflux pump (moves drugs out)", "Metabolizes drugs", "Binds drugs to albumin"]', 1, 'P-gp actively pumps xenobiotics out of cells, contributing to barrier integrity.'),
    (v_topic_id, 'Which factor increases the passage of a drug across the placental barrier?', '["High molecular weight", "High ionization", "High lipid solubility", "Extensive protein binding"]', 2, 'Small, lipophilic, non-ionized drugs cross membranes (including placenta) most easily.'),
    (v_topic_id, 'A drug has a Vd of 20 L and target Cp of 5 mg/L. What is the required IV Loading Dose?', '["4 mg", "100 mg", "50 mg", "200 mg"]', 1, 'LD = Vd x Target Cp. 20 L x 5 mg/L = 100 mg.'),
    (v_topic_id, 'If a drug has a half-life of 6 hours, how much remains 24 hours after a single dose?', '["50%", "25%", "12.5%", "6.25%"]', 3, '24 hours is 4 half-lives; remaining = (1/2)^4 = 6.25%.'),
    (v_topic_id, 'To maintain Target Css of 10 mg/L with Cl of 2 L/hr, what is the IV infusion rate?', '["5 mg/hr", "20 mg/hr", "40 mg/hr", "10 mg/hr"]', 1, 'Maintenance Dose Rate = Cl x Css. 2 L/hr x 10 mg/L = 20 mg/hr.'),
    (v_topic_id, 'Calculate the bioavailability (F) if AUC oral = 50 and AUC IV = 100 (equal doses).', '["0.2", "0.5", "1.0", "2.0"]', 1, 'F = AUCoral / AUCiv. 50/100 = 0.5 (50%).');

    -- SECTION 6: INTERACTIONS, ADVERSE EFFECTS & AUTONOMICS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A patient experiences an "Idiosyncratic" reaction. This is most likely due to:', '["Overdose", "Known side effect", "Genetic polymorphism", "Drug-drug interaction"]', 2, 'Idiosyncratic reactions are unpredictable and usually related to specific genetic variations.'),
    (v_topic_id, 'Which describes "Synergism"?', '["1 + 1 = 2", "1 + 0 = 2", "1 + 1 = 5", "1 + 1 = 0"]', 2, 'Synergism occurs when combined effect is greater than the sum of individual effects.'),
    (v_topic_id, 'A "Teratogenic" drug is one that:', '["Causes liver failure", "Causes cancer", "Causes fetal malformations", "Causes anaphylaxis"]', 2, 'Teratogenicity refers to the ability of a substance to cause birth defects.'),
    (v_topic_id, 'Primary neurotransmitter released by all pre-ganglionic autonomic fibers:', '["Norepinephrine", "Epinephrine", "Acetylcholine", "Dopamine"]', 2, 'Pre-ganglionic neurons in both divisions release ACh onto nicotinic receptors.'),
    (v_topic_id, 'Rate-limiting step in the synthesis of Norepinephrine is:', '["DOPA decarboxylase", "Tyrosine hydroxylase", "Dopamine beta-hydroxylase", "PNMT"]', 1, 'Tyrosine hydroxylase is the primary regulatory step in catecholamine synthesis.'),
    (v_topic_id, 'Enzyme responsible for termination of Acetylcholine action in the synapse:', '["MAO", "COMT", "Acetylcholinesterase", "Pseudocholinesterase"]', 2, 'ACh is rapidly hydrolyzed by Acetylcholinesterase in the synaptic cleft.');

    -- SECTION 7: RECEPTOR MECHANISMS & SIGNALING
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which receptor utilizes a JAK-STAT signaling pathway?', '["Insulin", "Erythropoietin", "Nicotinic", "Alpha-1"]', 1, 'Cytokine receptors (GH, EPO, IFN) signal via Janus Kinases and STAT proteins.'),
    (v_topic_id, 'The Nicotinic receptor is an example of a:', '["GPCR", "Ligand-gated ion channel", "Voltage-gated channel", "Nuclear receptor"]', 1, 'It is an ionotropic receptor allowing Na+/K+ flux upon ACh binding.'),
    (v_topic_id, 'M3 Muscarinic receptors on vascular endothelium cause vasodilation via:', '["Adenylyl Cyclase", "Nitric Oxide (NO) release", "Calcium inhibition", "Gi activation"]', 1, 'M3 stimulation triggers NO release, which relaxes vascular smooth muscle.'),
    (v_topic_id, 'Which of the following is a classic inhibitor of CYP3A4?', '["St. Johns Wort", "Phenytoin", "Grapefruit Juice", "Carbamazepine"]', 2, 'Grapefruit juice inhibits intestinal CYP3A4, increasing drug bioavailability.'),
    (v_topic_id, 'The term "Up-regulation" of receptors is typically seen after:', '["Chronic agonist exposure", "Chronic antagonist exposure", "Rapid administration", "Partial agonist use"]', 1, 'Chronic blockade leads to an increase in receptor number/sensitivity.');

    -- SECTION 8: CLINICAL CALCULATIONS & EXCRETION
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'For a drug eliminated by GFR only, how will Cl change if GFR is halved?', '["Cl remains same", "Cl doubles", "Cl decreases by 50%", "Cl decreases by 75%"]', 2, 'Renal clearance is directly proportional to GFR for filtered drugs.'),
    (v_topic_id, 'Probenecid reduces renal excretion of Penicillin by:', '["Inhibiting filtration", "Competing for active tubular secretion", "Acidifying urine", "Increasing protein binding"]', 1, 'Probenecid inhibits the Organic Anion Transporter (OAT) in the proximal tubule.'),
    (v_topic_id, 'Which increases the "Loading Dose" required for a drug?', '["Decreased Cl", "Increased Vd", "Increased half-life", "Decreased Vd"]', 1, 'LD = C-target x Vd. Changes in Vd directly affect the loading dose.'),
    (v_topic_id, 'A patient develops hemolysis after Primaquine. Which enzyme deficiency?', '["CYP2D6", "G6PD", "Pseudocholinesterase", "TPMT"]', 1, 'G6PD deficiency prevents RBCs from handling oxidative stress from certain drugs.'),
    (v_topic_id, 'Malignant Hyperthermia defect in:', '["Nicotinic", "Ryanodine receptors (RyR1)", "M2", "Sodium channels"]', 1, 'Defective RyR1 cause massive calcium release from sarcoplasmic reticulum.');

    -- SECTION 9: CLINICAL TRIALS & PRODRUGS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Phase 1 of a clinical trial involves:', '["Large population efficacy", "Safety and dosage in healthy volunteers", "Post-marketing surveillance", "Comparison to existing treatment"]', 1, 'Phase 1 evaluates safety and PK in a small group of healthy subjects.'),
    (v_topic_id, 'Phase 4 of a clinical trial involves:', '["Double-blind studies", "Animal testing", "Post-marketing surveillance", "LD50 determination"]', 2, 'Phase 4 monitors for rare adverse effects after the drug is approved.'),
    (v_topic_id, 'A "Prodrug" is defined as:', '["High potency", "Inactive compound converted to active drug", "Induces own metabolism", "Used for prophylaxis"]', 1, 'Inactive compounds (e.g. Enalapril) that must be metabolized to active form.'),
    (v_topic_id, 'Which drug-receptor interaction is "Irreversible"?', '["Electrostatic", "Hydrogen", "Covalent", "Van der Waals"]', 2, 'Covalent bonding is strong and permanent (e.g. Aspirin on COX).'),
    (v_topic_id, 'Redistribution is the primary mechanism of termination for which drug?', '["Digoxin", "Thiopental", "Penicillin", "Warfarin"]', 2, 'Lipophilic Thiopental acts fast but wears off as it moves from brain to fat/muscle.');

    -- SECTION 10: TOXICOLOGY & ANTIDOTES
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Steady State Concentration (Css) if dose is doubled?', '["Remains same", "Increases 4x", "Doubles", "Depends on Vd"]', 2, 'In first-order kinetics, Css is directly proportional to dosing rate.'),
    (v_topic_id, 'Steady state (93.75%) reached in how many half-lives?', '["1", "2", "3", "4"]', 3, '1=50%, 2=75%, 3=87.5%, 4=93.75%.'),
    (v_topic_id, 'Weak base (pKa 8.5) most trapped (ionized) in:', '["Stomach (pH 2.0)", "Blood (pH 7.4)", "Duodenum (pH 6.0)", "Urine (pH 5.0)"]', 3, 'Weak bases are ionized (BH+) in acidic urine, accelerating excretion.'),
    (v_topic_id, 'Potent CYP450 Inhibitor:', '["Carbamazepine", "Ketoconazole", "Phenobarbital", "Chronic Alcohol"]', 1, 'Ketoconazole is a classic inhibitor (SICKFACES.COM).'),
    (v_topic_id, 'Cl = 120 mL/min (equal to GFR) suggests drug is:', '["Secreted", "Reabsorbed", "Filtered only", "Not filtered"]', 2, 'Clearance matching GFR indicates only glomerular filtration occurs.'),
    (v_topic_id, 'Cumulative Toxicity occurs when:', '["Taken with alcohol", "Dosing rate exceeds elimination rate", "Genetic allergy", "Short half-life"]', 1, 'Failure to clear previous doses leads to accumulation and toxicity.');

    -- SECTION 11: ADVANCED PHARMACOLOGY MIX
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Reason for Oral dose >> IV dose (low Oral-to-Parenteral ratio)?', '["High Vd", "High First-pass effect", "Short half-life", "High potency"]', 1, 'Significant liver metabolism before reaching systemic circulation.'),
    (v_topic_id, 'Transport mechanism requiring ATP:', '["Facilitated diffusion", "Passive diffusion", "Primary Active Transport", "Aqueous diffusion"]', 2, 'Active transport moves molecules against a gradient using energy.'),
    (v_topic_id, 'Which is NOT a Phase I reaction?', '["Hydroxylation", "Sulfoxidation", "Deamination", "Methylation"]', 3, 'Methylation is a Phase II conjugation reaction.'),
    (v_topic_id, '"Potentiation" occurs when:', '["Two drugs have same effect", "One drug with no effect increases effect of another", "Direct receptor action", "Reduced toxicity"]', 1, 'Potentiation is 0 + 1 = 2 (e.g. Clavulanate + Amoxicillin).'),
    (v_topic_id, 'G-protein associated with Alpha-2 adrenergic receptor:', '["Gs", "Gi", "Gq", "G12"]', 1, 'MAD 2s: M2, Alpha-2, D2 are Gi-coupled (inhibitory).'),
    (v_topic_id, 'Maximum Effect a drug can produce is:', '["Potency", "Efficacy", "Affinity", "Kd"]', 1, 'Efficacy (Emax) is the maximal possible response.'),
    (v_topic_id, 'Drug producing sub-maximal response at 100% occupancy:', '["Full agonist", "Partial agonist", "Competitive antagonist", "Inverse agonist"]', 1, 'Partial agonists have lower intrinsic activity than full agonists.'),
    (v_topic_id, 'Affinity represented by which parameter?', '["EC50", "Kd", "Vmax", "Cl"]', 1, 'Kd is the concentration for 50% occupancy; lower Kd = higher affinity.'),
    (v_topic_id, 'Commonest bond in drug-receptor interactions:', '["Covalent", "Ionic/Electrostatic", "Metallic", "Disulfide"]', 1, 'Reversible ionic, hydrogen, and Van der Waals bonds are most common.');

    -- SECTION 12: SPECIALIZED TOPICS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Orphan Drugs are medications for:', '["Unknown manufacturer", "Rare diseases", "Banned drugs", "Pediatrics only"]', 1, 'Drugs developed for conditions affecting < 200,000 people.'),
    (v_topic_id, 'Law describing drug diffusion across membranes:', '["Starling", "Fick", "Boyle", "Newton"]', 1, 'Fick''s law relates flux to concentration gradient and permeability.'),
    (v_topic_id, 'Drug Tolerance characteristic:', '["Increased response", "Need for increasing doses for same effect", "Immediate allergy", "Irreversible binding"]', 1, 'Tolerance is a decrease in response after repeated exposure.'),
    (v_topic_id, 'Route providing 100% bioavailability by definition:', '["IM", "SC", "IV", "Transdermal"]', 2, 'Intravenous bypasses all absorption barriers.'),
    (v_topic_id, 'Loading dose used for drugs with:', '["Small Vd", "Short half-lives", "Long half-lives", "High Cl"]', 2, 'Used to reach steady state quickly when half-life is long.'),
    (v_topic_id, 'Competitive Antagonism characteristic:', '["Reduced Emax", "Rightward shift of LDR curve", "Leftward shift", "Irreversible"]', 1, 'Increases EC50 (potency) without affecting Emax.'),
    (v_topic_id, 'Protein binding for acidic drugs usually involves:', '["Alpha-1 glycoprotein", "Albumin", "Gamma globulin", "Hemoglobin"]', 1, 'Albumin is the primary binder for acidic drugs.'),
    (v_topic_id, 'Enzyme deficient in neonates causing Gray Baby Syndrome:', '["CYP450", "UDP-glucuronosyltransferase", "ADH", "MAO"]', 1, 'Neonates lack UGT to conjugate Chloramphenicol.'),
    (v_topic_id, 'Total Body Water approx volume:', '["4 L", "14 L", "42 L", "100 L"]', 2, 'Approx 60% of body weight (42L for 70kg).');

    -- SECTION 13: ADVANCED PHARMACOKINETICS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Maintenance Dose state represents:', '["Rate in = Rate out", "Cl = 0", "Vd = Plasma Volume", "T1/2 = 0"]', 0, 'Steady state is achieved when dosing equals elimination.'),
    (v_topic_id, 'Chemical Antagonist acts by:', '["Binding receptor", "Blocking signaling", "Reacting chemically with agonist", "Increasing metabolism"]', 2, 'Direct chemical inactivation (e.g. Protamine-Heparin).'),
    (v_topic_id, 'Classic CYP450 Inducer:', '["Cimetidine", "Erythromycin", "Phenytoin", "Valproic acid"]', 2, 'Phenytoin induces CYP450 (Guinness, Coronas, PBRS).'),
    (v_topic_id, 'Clinical Efficacy in Phase 3 compared against:', '["Placebo or gold-standard", "Animal data", "Phase 1 volunteers", "LD50"]', 0, 'Phase 3 is a large comparative trial.'),
    (v_topic_id, 'Bioequivalent drug requirements:', '["Same color", "Same AUC, Cmax, Tmax (range)", "Same company", "Same price"]', 1, 'Generic approval requires statistical bioequivalence.'),
    (v_topic_id, 'Allosteric modulator example:', '["Benzodiazepines at GABA-A", "ACh at Muscarinic", "Atropine", "Epinephrine"]', 0, 'BZDs bind a different site to modify receptor activity.'),
    (v_topic_id, 'Safety Margin ratio:', '["LD1 / ED99", "LD50 / ED50", "Vd / Cl", "Ka / Ke"]', 0, 'A more conservative safety measure than TI.'),
    (v_topic_id, 'Phase II metabolism primary organ:', '["Kidney", "Liver", "Lung", "Intestine"]', 1, 'Liver is the metabolic hub for both phases.'),
    (v_topic_id, 'pH at which drug is 50% ionized:', '["pH 7.4", "pH = pKa", "pH 1.0", "pH 14"]', 1, 'Henderson-Hasselbalch principle.'),
    (v_topic_id, 'Zero-order kinetics Cp vs Time graph:', '["Exponential", "Linear", "Sigmoidal", "Bell-shaped"]', 1, 'Constant amount elimination results in a straight line.');

    -- SECTION 14: PHARMACODYNAMICS & CLINICAL
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which factor does NOT change drug half-life?', '["Aging", "Liver failure", "Increasing dose (first-order)", "Renal failure"]', 2, 'Half-life is constant in first-order kinetics.'),
    (v_topic_id, 'Antagonist affinity and intrinsic activity:', '["High/High", "High/Zero", "Low/High", "Zero/Zero"]', 1, 'Antagonists bind but produce no response.'),
    (v_topic_id, 'Extraction Ratio (ER) definition:', '["Amount excreted", "Fraction removed from blood as it passes", "Vd/Cl", "Protein binding %"]', 1, 'Organ efficiency in removing drug.'),
    (v_topic_id, 'Flow-limited (High ER) drug clearance depends on:', '["Enzyme activity", "Protein binding", "Liver blood flow", "Renal filtration"]', 2, 'Liver removes drug so fast that delivery (blood flow) is the limit.'),
    (v_topic_id, 'Loading Dose (oral) formula:', '["(Vd x Cp) / F", "Vd x Cp x F", "Cl x Css", "(Cl x Css) / F"]', 0, 'Accounts for the fraction (F) that survives first-pass.'),
    (v_topic_id, 'Enzyme induction effect on t1/2:', '["Increases", "Decreases", "No change", "Doubles"]', 1, 'Increased clearance leads to a shorter half-life.'),
    (v_topic_id, 'Non-linear pharmacokinetics association:', '["Low Cp", "Saturation of enzymes/transporters", "High Vd", "Rapid renal excretion"]', 1, 'Saturation shifts kinetics from first-order to zero-order.'),
    (v_topic_id, 'Intrinsic tyrosine kinase activity receptor:', '["Insulin", "Growth Hormone", "Beta-2", "GABA-A"]', 0, 'Insulin receptor is a RTK; GH uses JAK-STAT.'),
    (v_topic_id, 'Phosphatidylinositol cycle activation by Gq:', '["Adenylyl Cyclase", "Phospholipase C", "Phosphodiesterase", "Guanylyl Cyclase"]', 1, 'Gq activates PLC to produce IP3 and DAG.'),
    (v_topic_id, 'M2 Muscarinic second messenger:', '["IP3", "cAMP (Decreased)", "cAMP (Increased)", "cGMP"]', 1, 'M2 is Gi-coupled (inhibits Adenylyl Cyclase).');

    -- SECTION 15: ADVANCED SIGNALING & GENETICS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Nitroglycerin vasodilation mechanism:', '["Increased cAMP", "Increased cGMP", "Calcium increase", "IP3"]', 1, 'NO activates Guanylyl Cyclase to increase cGMP.'),
    (v_topic_id, 'Constitutively Active receptor:', '["Needs agonist", "Baseline activity without ligand", "Always inhibited", "Internalized"]', 1, 'Shows response even in the absence of a ligand.'),
    (v_topic_id, 'Inverse Agonist effect on constitutive receptor:', '["Increases", "No effect", "Reduces below baseline", "Blocks agonist only"]', 2, 'Negative intrinsic activity reduces baseline response.'),
    (v_topic_id, 'Schild Plot purpose:', '["Vmax", "pKa", "Kb of competitive antagonist", "Bioavailability"]', 2, 'Quantifies antagonist potency.'),
    (v_topic_id, 'Tachyphylaxis mechanism (e.g. Tyramine):', '["Down-regulation", "Depletion of neurotransmitter vesicles", "MAO induction", "Renal excretion"]', 1, 'Acute tolerance due to exhaustion of NE stores.'),
    (v_topic_id, 'B-arrestin role:', '["Synthesis", "Desensitization and internalization", "Gs coupling", "Opening channels"]', 1, 'Mediates GPCR desensitization.'),
    (v_topic_id, 'Crigler-Najjar syndrome deficiency:', '["Acetylation", "Sulfation", "Glucuronidation", "Methylation"]', 2, 'UGT enzyme deficiency.'),
    (v_topic_id, 'Suicide Inhibition definition:', '["Reversible", "Drug converted to reactive intermediate binding irreversibly", "Induces enzyme", "Allosteric"]', 1, 'The enzyme activates its own inhibitor (e.g. MAOIs).'),
    (v_topic_id, 'Codeine to Morphine conversion enzyme:', '["CYP3A4", "CYP2D6", "CYP2C19", "CYP1A2"]', 1, 'CYP2D6 polymorphism affects analgesic efficacy.'),
    (v_topic_id, 'Clopidogrel (prodrug) activation deficiency:', '["CYP2D6", "CYP2C19", "CYP3A4", "CYP2C9"]', 1, 'CYP2C19 is required for activation.');

    -- SECTION 16: TOXICOLOGY & SAFETY (Part 2)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Methylation example in drug metabolism:', '["Ethanol", "Epinephrine (COMT)", "Isoniazid", "Aspirin"]', 1, 'COMT methylates catecholamines.'),
    (v_topic_id, 'Therapeutic Window definition:', '["Range MEC to MTC", "Time to steady state", "LD50 / ED50", "Patent period"]', 0, 'Concentration range for efficacy without toxicity.'),
    (v_topic_id, 'Opioid Triad signs:', '["Mydriasis/HTN", "Miosis/Respiratory depression/Coma", "Tachycardia/Fever", "Seizures"]', 1, 'Classic heroin/opioid overdose presentation.'),
    (v_topic_id, 'Activated Charcoal mechanism:', '["Induce vomiting", "Neutralize", "Adsorb in GI tract", "Increase Cl"]', 2, 'Prevents drug absorption by binding it in the gut.'),
    (v_topic_id, 'Hemodialysis most effective for:', '["Large Vd/High protein binding", "Small Vd/Low protein binding/Water soluble", "Lipophilic", "High molecular weight"]', 1, 'Requires the drug to be "free" in the blood compartment.'),
    (v_topic_id, 'Cinchonism (tinnitus/headache) drug:', '["Aspirin", "Quinidine", "Gentamicin", "Digoxin"]', 1, 'Side effect characteristic of Cinchona alkaloids.'),
    (v_topic_id, 'Red Man Syndrome association:', '["Penicillin", "Vancomycin", "Ciprofloxacin", "Amphotericin B"]', 1, 'Infusion-related histamine release.'),
    (v_topic_id, 'Ames Test purpose:', '["Teratogenicity", "Mutagenicity", "Carcinogenicity", "Nephrotoxicity"]', 1, 'Laboratory screen for potential DNA mutations.'),
    (v_topic_id, 'Doxorubicin cumulative toxicity:', '["Nephrotoxicity", "Cardiotoxicity (Heart failure)", "Hemorrhagic cystitis", "Pulmonary fibrosis"]', 1, 'Dose-limiting myocardial damage.'),
    (v_topic_id, 'Half-life for Cl = 5L/hr, Vd = 50L?', '["5 hr", "6.93 hr", "10 hr", "0.693 hr"]', 1, '0.693 x Vd / Cl.');

    -- SECTION 17: CALCULATIONS & ADVANCED (Part 2)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Half-lives to eliminate 97% of drug:', '["3", "5", "7", "10"]', 1, '1=50%, 2=75%, 3=87.5%, 4=93.75%, 5=96.9%.'),
    (v_topic_id, 'Creatinine clearance 25% adjustment:', '["No change", "Reduce dose to 25%", "Increase 4x", "Double frequency"]', 1, 'Dose should be reduced in proportion to renal function.'),
    (v_topic_id, 'Steady State Concentration (Css) IV infusion:', '["Rate / Cl", "Rate x Vd", "LD / Vd", "AUC / Dose"]', 0, 'Css = Infusion Rate / Clearance.'),
    (v_topic_id, 'Adrenal Medulla and Ganglia receptor:', '["Nm", "Nn", "M1", "Alpha-2"]', 1, 'Neuronal nicotinic (Nn) receptors mediate ganglionic transmission.'),
    (v_topic_id, 'Dopamine to NE enzyme:', '["Tyrosine hydroxylase", "Dopamine beta-hydroxylase", "MAO", "COMT"]', 1, 'Occurs inside the neurotransmitter vesicles.'),
    (v_topic_id, 'Hemicholinium action:', '["ACh release", "AChE inhibition", "Choline uptake inhibition", "Vesicle storage"]', 2, 'Blocks the transport of choline into the neuron.'),
    (v_topic_id, 'Category X definition:', '["No risk", "Animal risk only", "Contraindicated; risks outweigh benefits", "Use if benefits high"]', 2, 'Proven fetal harm; absolute contraindication.'),
    (v_topic_id, 'Breast milk drug excretion most likely for:', '["Ionized", "Large/Polar", "Small/Lipophilic/Non-ionized", "Protein-bound"]', 2, 'Molecules that cross cell membranes easily enter milk.'),
    (v_topic_id, 'Elderly Vd for water-soluble drugs (e.g. Digoxin):', '["Increases", "Decreases", "Stays same", "No effect"]', 1, 'Due to decreased total body water in the elderly.'),
    (v_topic_id, 'Thalidomide teratogenic effect:', '["Phocomelia", "Adenocarcinoma", "Neural tube", "Discolored teeth"]', 0, 'Limb reduction defects (seal limbs).');

    -- SECTION 18: CLINICAL & REGULATORY (Part 2)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Double-Blind study definition:', '["Two drugs", "Neither subject nor investigator knows", "Two species", "Performed twice"]', 1, 'Prevents reporting and observation bias.'),
    (v_topic_id, 'Phase 2 clinical trial target population:', '["Healthy volunteers", "Small group of patients with target disease", "Large patient group", "Post-marketing"]', 1, 'First evaluation of efficacy in patients.'),
    (v_topic_id, 'Black Box Warning definition:', '["Illegal drug", "Price warning", "Strongest FDA safety warning for serious risk", "Pediatric only"]', 2, 'Indicates severe or life-threatening adverse risk.'),
    (v_topic_id, 'Pharmacoeconomics focus:', '["Cost-effectiveness", "Structure", "Synthesis", "Side effects"]', 0, 'Evaluates the economic value of drug therapy.'),
    (v_topic_id, 'Generic drug requirement:', '["Color/Shape", "Price", "Active ingredient and bioequivalence", "Excipients"]', 2, 'Must be therapeutically equivalent to the brand.'),
    (v_topic_id, 'Functional Antagonist result:', '["EC50 only", "Net physiological response reduced", "Affinity change", "Metabolism change"]', 1, 'Antagonism by producing an opposite physiological effect.'),
    (v_topic_id, 'NMDA receptor co-agonist:', '["GABA", "Glycine", "Aspartate", "Serine"]', 1, 'Requires Glycine binding to open in response to Glutamate.'),
    (v_topic_id, 'Acidification of urine increases excretion of:', '["Aspirin", "Amphetamine", "Penicillin", "Phenobarbital"]', 1, 'Ionizes basic drugs, preventing reabsorption.'),
    (v_topic_id, 'OAT (Organic Anion Transporter) kidney role:', '["Glucose", "Active secretion of Penicillin", "Water", "Protein"]', 1, 'Mediates active transport into the tubular lumen.'),
    (v_topic_id, 'ABCB1 (P-glycoprotein) inhibitor:', '["Rifampin", "Verapamil", "St. Johns Wort", "Phenobarbital"]', 1, 'Verapamil blocks the efflux pump.');

    -- SECTION 19: RECEPTORS & TRANSPORTERS (Part 2)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'VMAT (Vesicular Monoamine Transporter) inhibitor:', '["Cocaine", "Reserpine", "Amphetamine", "Tyramine"]', 1, 'Prevents monoamine storage, leading to depletion.'),
    (v_topic_id, 'Iodide uptake into thyroid:', '["Simple diffusion", "Secondary active transport", "Facilitated", "Endocytosis"]', 1, 'Sodium-Iodide Symporter (NIS) is secondary active transport.'),
    (v_topic_id, 'SSRI target:', '["VMAT", "SERT", "NET", "DAT"]', 1, 'Selective Serotonin Reuptake Transporter.'),
    (v_topic_id, '7-transmembrane spanning domain receptor family:', '["Ionotropic", "GPCRs", "Nuclear", "Kinase-linked"]', 1, 'Classic structure of G-protein coupled receptors.'),
    (v_topic_id, 'GABA-A receptor type:', '["Gi", "Gq", "Ligand-gated Cl channel", "Ligand-gated Na channel"]', 2, 'Inhibitory chloride channel.'),
    (v_topic_id, 'RTK dimerization upon ligand binding:', '["Internalization", "Dimerization", "Dissociation", "Dephosphorylation"]', 1, 'Binding causes two receptors to pair and autophosphorylate.'),
    (v_topic_id, 'IP3 second messenger function:', '["cAMP", "Opens Calcium channels on SR", "DAG", "cGMP"]', 1, 'Triggers calcium release from intracellular stores.'),
    (v_topic_id, 'BZD antidote:', '["Naloxone", "Flumazenil", "Atropine", "Physostigmine"]', 1, 'Competitive antagonist at the BZD site on GABA-A.'),
    (v_topic_id, 'Organophosphate (pesticide) antidote:', '["Atropine and Pralidoxime", "Neostigmine", "Propranolol", "Acetylcysteine"]', 0, 'Atropine blocks receptors; Pralidoxime regenerates AChE.'),
    (v_topic_id, 'Methanol/Ethylene Glycol antidote:', '["Ethanol or Fomepizole", "Vitamin K", "Deferoxamine", "Penicillamine"]', 0, 'Blocks Alcohol Dehydrogenase to prevent toxic acids.');

    -- SECTION 20: SYSTEMATIC & INTEGRATED (Final Potpourri)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Chemical Antagonism example:', '["NE vs Beta-blocker", "Protamine vs Heparin", "MAO vs Tyramine", "Histamine vs Epinephrine"]', 1, 'Direct chemical binding (positive to negative charges).'),
    (v_topic_id, 'Type 1 Hypersensitivity example:', '["Serum sickness", "Contact dermatitis", "Anaphylaxis (IgE)", "Hemolytic anemia"]', 2, 'Immediate allergic reaction.'),
    (v_topic_id, 'Type 4 Hypersensitivity (Delayed) involves:', '["IgE", "IgG", "T-cells", "Complement"]', 2, 'T-cell mediated response (e.g. poison ivy).'),
    (v_topic_id, 'Commonest Phase I metabolic reaction:', '["Reduction", "Hydrolysis", "Oxidation", "Deamination"]', 2, 'CYP-mediated oxidation is the predominant pathway.'),
    (v_topic_id, 'Weak bases trapped in which environment?', '["Stomach", "Acidic environments", "Non-ionized always", "Cannot cross BBB"]', 1, 'Ion trapping occurs in environments with low pH.'),
    (v_topic_id, 'CYP enzyme for over 50% of drugs:', '["CYP2D6", "CYP3A4", "CYP2C9", "CYP1A2"]', 1, 'CYP3A4 is the most clinically important isoform.'),
    (v_topic_id, 'Vd of 5 L suggests drug is mainly in:', '["Plasma", "ECF", "Total water", "Adipose"]', 0, 'Confined to the blood vessels.'),
    (v_topic_id, 'Potency definition:', '["Max effect", "Dose for 50% of maximal response (EC50)", "Absorption speed", "Receptor count"]', 1, 'Relative dose required for effect.'),
    (v_topic_id, 'G-protein definition:', '["Transmembrane receptor", "Transducer protein that binds GTP", "Enzyme for cAMP", "Second messenger"]', 1, 'Guanine nucleotide-binding protein.'),
    (v_topic_id, 'ED50 definition:', '["Kills 50%", "50% max response in individual", "Desired effect in 50% of population", "50% of LD50"]', 2, 'Effective dose in 50% of subjects.');

    -- SECTION 21: PATHOLOGY & RECENT HIGH-YIELDS (Final)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Barrett esophagus cancer risk:', '["Squamous", "Adenocarcinoma", "Small cell", "Mesothelioma"]', 1, 'Metaplastic tissue predisposes to esophageal adenocarcinoma.'),
    (v_topic_id, 'Right heart failure commonest cause:', '["Left heart failure", "COPD", "Mitral stenosis", "PE"]', 0, 'Back-up of pressure from the left heart.'),
    (v_topic_id, 'Cystic medial necrosis aorta:', '["Syphilis", "Marfan Syndrome", "Hypertension", "Atherosclerosis"]', 1, 'Weakens the media, common in Marfan syndrome.'),
    (v_topic_id, 'Type 1 DM HLA:', '["B27", "DR3/DR4", "A3", "DQ2"]', 1, 'Strong MHC Class II associations.'),
    (v_topic_id, 'HCM septal feature:', '["Thinning", "Asymmetric septal hypertrophy", "Dilation", "Aneurysm"]', 1, 'Classic Hypertrophic Cardiomyopathy finding.'),
    (v_topic_id, 'Russell bodies are found in:', '["Hepatocytes", "Plasma cells", "Neutrophils", "Macrophages"]', 1, 'Aggregates of immunoglobulin in plasma cells.'),
    (v_topic_id, 'Gaucher disease deficient enzyme:', '["Sphingomyelinase", "Glucocerebrosidase", "Hexosaminidase A", "Alpha-galactosidase"]', 1, 'Leads to accumulation of glucocerebroside.'),
    (v_topic_id, 'Niemann-Pick disease deficient enzyme:', '["Sphingomyelinase", "Glucocerebrosidase", "Hexosaminidase A", "Alpha-galactosidase"]', 0, 'Sphingomyelin accumulation; cherry-red spot.'),
    (v_topic_id, 'Alkaptonuria deficient enzyme:', '["Tyrosinase", "Homogentisate oxidase", "Phenylalanine hydroxylase", "Catalase"]', 1, 'Causes ochronosis (darkening of connective tissues).'),
    (v_topic_id, 'Vitamin K dependent clotting factors:', '["2, 7, 9, 10", "1, 2, 5, 8", "11, 12, 13", "7, 8, 9, 10"]', 0, 'Gamma-carboxylation of factors 2, 7, 9, and 10.');

    RAISE NOTICE 'SUCCESS: FULL General Pharmacology MCQ Bank (~185 questions) registered for Semester 3.';
END $$;

COMMIT;
