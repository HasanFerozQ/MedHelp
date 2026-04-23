-- Migration: Semester 3 - General Pharmacology Cases (60 Blocks)
-- Date: 2026-04-23

BEGIN;

-- 1. Create/Ensure Topic "General Pharmacology" for Semester 3
INSERT INTO topics (semester_id, title, slug, "order")
VALUES (3, 'General Pharmacology', 'general-pharmacology', 20)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, semester_id = 3;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'general-pharmacology' LIMIT 1;

    -- ══════════════════════════════════════════════════════════════════
    -- SET 1 (Cases 1-15) - PK/PD & Autonomics
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 01: Loading Dose & Steady State
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Intravenous Antibiotic Kinetics', 'A 45-year-old male is started on an intravenous antibiotic. The drug has a volume of distribution (Vd) of 40 L and follows first-order kinetics. The target plasma concentration is 5 mg/L.', 1)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What loading dose should be administered to reach the target concentration immediately?', '["100 mg", "200 mg", "400 mg", "800 mg"]', 1, 'Loading Dose = Vd x Cp. So, 40L x 5mg/L = 200mg.'),
    (v_case_id, 'If the drug has a half-life of 4 hours, how long will it take for the drug to reach steady-state?', '["4 hours", "8 hours", "16–20 hours", "40 hours"]', 2, 'Steady state is reached in 4–5 half-lives (4 x 4 = 16 or 5 x 4 = 20 hours).');

    -- CASE 02: Competitive Antagonist
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bronchodilator Receptor Study', 'Graph A shows a drug’s effect increasing with dose until a plateau. Graph B shows that when a second drug is added, the curve shifts to the right but reaches the same maximum.', 2)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The second drug is most likely acting as a:', '["Non-competitive antagonist", "Competitive antagonist", "Irreversible antagonist", "Physiological antagonist"]', 1, 'A rightward shift with preserved Vmax indicates competitive antagonism.'),
    (v_case_id, 'Which parameter is increased in the presence of a competitive antagonist?', '["Vmax", "Km (or EC50)", "Efficacy", "Potency"]', 1, 'Competitive antagonists increase the amount of agonist needed to reach half-max effect (Km/EC50).');

    -- CASE 03: Glaucoma (Pilocarpine)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Miosis and Aqueous Outflow', 'A 60-year-old patient with glaucoma is treated with a topical medication that causes pupillary constriction and improves aqueous humor outflow.', 3)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely mechanism of this drug?', '["Muscarinic agonist", "Alpha-1 antagonist", "Beta-blocker", "Carbonic anhydrase inhibitor"]', 0, 'Muscarinic agonists like Pilocarpine contract the ciliary muscle to improve drainage.'),
    (v_case_id, 'Which side effect would likely occur if this drug reached systemic circulation?', '["Mydriasis", "Tachycardia", "Excessive sweating and salivation", "Urinary retention"]', 2, 'Systemic muscarinic activation causes DUMBBELSS symptoms.');

    -- CASE 04: Organophosphate Poisoning
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Lethargy and Pinpoint Pupils', 'A 22-year-old male is brought to the ER lethargic, HR 40 bpm, salivating profusely, and has 1mm pinpoint pupils.', 4)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely toxin ingested?', '["Atropine", "Organophosphates", "Amphetamines", "Tricyclic antidepressants"]', 1, 'Cholinergic crisis (pinpoint pupils, salivation, bradycardia) is classic for organophosphates.'),
    (v_case_id, 'Which agent should be administered immediately to reverse bradycardia?', '["Propranolol", "Atropine", "Neostigmine", "Epinephrine"]', 1, 'Atropine is a competitive muscarinic antagonist used to reverse cholinergic overload.');

    -- CASE 05: Digoxin
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Heart Failure and Na+/K+ Pump', 'A 65-year-old female is treated for chronic heart failure with a drug that inhibits the Na+/K+ ATPase pump.', 5)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug is she taking?', '["Furosemide", "Digoxin", "Lisinopril", "Metoprolol"]', 1, 'Digoxin works by inhibiting the Na+/K+ ATPase pump.'),
    (v_case_id, 'Which electrolyte abnormality predisposes her to toxicity?', '["Hypercalcemia", "Hypokalemia", "Hypernatremia", "Hypomagnesemia"]', 1, 'Hypokalemia allows more digoxin to bind to the Na+/K+ pump, increasing toxicity risk.');

    -- CASE 06: G6PD Deficiency
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sulfonamide-Induced Anemia', 'A 30-year-old woman treated with a sulfonamide develops jaundice and anemia. Labs show bite cells and Heinz bodies.', 6)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This patient likely has a genetic deficiency in:', '["Cytochrome P450", "G6PD", "Pseudocholinesterase", "N-acetyltransferase"]', 1, 'G6PD deficiency makes RBCs sensitive to oxidative stress from drugs like sulfonamides.'),
    (v_case_id, 'This reaction is categorized as which type?', '["Type A (Augmented)", "Type B (Idiosyncratic)", "Type C (Chronic)", "Type D (Delayed)"]', 1, 'Pharmacogenetic reactions are Type B idiosyncratic reactions.');

    -- CASE 07: Ion Trapping
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Weak Acid Absorption', 'A drug is a weak acid (pKa = 3.5). Gastric pH is 1.5 and intestinal pH is 6.5.', 7)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In which environment will this drug be most readily absorbed?', '["Stomach", "Small Intestine", "Large Intestine", "Equal"]', 0, 'Weak acids are uncharged (lipid-soluble) in acidic environments like the stomach.'),
    (v_case_id, 'If overdosed, what increases its urinary excretion?', '["Ammonium chloride", "Sodium bicarbonate", "Normal saline", "Vitamin C"]', 1, 'Alkalinizing the urine "traps" weak acids in their ionized form, preventing reabsorption.');

    -- CASE 08: Drug Interactions (Warfarin)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Nosebleed and Elevated INR', 'A 55-year-old on warfarin starts a new medication for a fungal nail infection. A week later, INR increases and he has a nosebleed.', 8)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug was most likely added?', '["Rifampin", "Phenobarbital", "Fluconazole", "Carbamazepine"]', 2, 'Fluconazole is a potent CYP450 inhibitor.'),
    (v_case_id, 'What is the mechanism behind the increased INR?', '["Induction of CYP450", "Inhibition of CYP450", "Displacement from albumin", "Decreased Vit K absorption"]', 1, 'Inhibition of warfarin metabolism leads to higher plasma levels and bleeding risk.');

    -- CASE 09: Inverse Agonist
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'High Affinity, Zero Intrinsic Activity', 'A researcher studies Drug X, which has high affinity for receptors but zero intrinsic activity.', 9)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Drug X is best classified as a:', '["Full agonist", "Partial agonist", "Antagonist", "Inverse agonist"]', 2, 'Antagonists have affinity but no efficacy (zero intrinsic activity).'),
    (v_case_id, 'If Drug X were an inverse agonist, what would its effect be?', '["No effect", "Increase constitutive activity", "Decrease constitutive activity", "Partial agonist"]', 2, 'Inverse agonists reduce the baseline "constitutive" activity of a receptor.');

    -- CASE 10: Beta-2 Agonist
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'cAMP and Bronchodilation', 'A 40-year-old with asthma is given a medication that causes bronchodilation by increasing intracellular cAMP.', 10)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which receptor is this drug stimulating?', '["alpha-1", "beta-2", "M3", "D1"]', 1, 'Beta-2 stimulation via Gs proteins increases cAMP and relaxes smooth muscle.'),
    (v_case_id, 'Which of the following is a common side effect?', '["Bradycardia", "Tremor", "Sedation", "Constipation"]', 1, 'Beta-2 agonists often cause skeletal muscle tremor.');

    -- CASE 11: Succinylcholine Apnea
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Prolonged Paralysis After Surgery', 'A patient given succinylcholine remains paralyzed and on a ventilator for several hours longer than expected.', 11)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This "succinylcholine apnea" is due to a deficiency in:', '["Acetylcholinesterase", "Pseudocholinesterase", "MAO", "COMT"]', 1, 'Pseudocholinesterase is responsible for metabolizing succinylcholine.'),
    (v_case_id, 'Succinylcholine acts as a:', '["Non-depolarizing blocker", "Depolarizing blocker", "Muscarinic antagonist", "Ganglionic blocker"]', 1, 'Succinylcholine is a depolarizing neuromuscular blocker.');

    -- CASE 12: Tolerance vs Tachyphylaxis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Increasing Doses for Pain Relief', 'A 50-year-old man with chronic pain takes increasing doses of oxycodone to achieve the same relief.', 12)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This phenomenon is known as:', '["Dependence", "Tolerance", "Tachyphylaxis", "Sensitization"]', 1, 'Tolerance is the gradual decrease in responsiveness to a drug.'),
    (v_case_id, 'If effect decreased rapidly after only a few doses (e.g. nitrates), the term is:', '["Withdrawal", "Potentiation", "Tachyphylaxis", "Idiosyncrasy"]', 2, 'Tachyphylaxis is acute, rapid tolerance.');

    -- CASE 13: Neuroleptic Malignant Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Lead Pipe Rigidity and Fever', 'A child presents with "lead pipe" rigidity, high fever, and autonomic instability after starting an antipsychotic.', 13)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Serotonin syndrome", "Malignant hyperthermia", "NMS", "Tyramine reaction"]', 2, 'NMS is a life-threatening reaction to dopamine blockers.'),
    (v_case_id, 'What is the specific treatment?', '["Atropine", "Dantrolene", "Naloxone", "Flumazenil"]', 1, 'Dantrolene inhibits calcium release in muscles to stop rigidity/fever.');

    -- CASE 14: Therapeutic Index
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Margin of Safety Study', 'Drug A has a TD50 of 1000 mg and an ED50 of 10 mg.', 14)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the Therapeutic Index (TI) of Drug A?', '["0.01", "10", "100", "1000"]', 2, 'TI = TD50 / ED50. (1000 / 10 = 100).'),
    (v_case_id, 'Drugs with a low (narrow) therapeutic index require:', '["Frequent dosing", "Therapeutic drug monitoring", "Oral admin only", "Hospital use only"]', 1, 'Narrow TI drugs need blood level monitoring (e.g., Lithium).');

    -- CASE 15: Reflex Tachycardia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Compensatory Reflex Tachycardia', 'A 45-year-old male is treated for a hypertensive emergency with a drug that causes reflex tachycardia.', 15)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This reflex tachycardia can be prevented by co-administering:', '["Hydralazine", "Propranolol", "Phentolamine", "Nitroglycerin"]', 1, 'Beta-blockers prevent the sympathetic reflex.'),
    (v_case_id, 'Which drug is a pure alpha-1 agonist that causes reflex bradycardia?', '["Isoproterenol", "Phenylephrine", "Dobutamine", "Albuterol"]', 1, 'Phenylephrine increases BP, triggering a parasympathetic reflex slowing the heart.');


    -- ══════════════════════════════════════════════════════════════════
    -- SET 2 (Cases 46-60) - Specific Systems
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 16 (46): SGLT-2 Inhibitor
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Glucuretic Therapy', 'A 55-year-old with Type 2 Diabetes starts a medication that inhibits the SGLT-2 transporter in the PCT.', 46)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following drugs was likely prescribed?', '["Metformin", "Canagliflozin", "Sitagliptin", "Pioglitazone"]', 1, 'Gliflozins are SGLT-2 inhibitors.'),
    (v_case_id, 'What is a common side effect?', '["Lactic acidosis", "GU tract infections", "Weight gain", "Hypoglycemia"]', 1, 'Glucose in the urine promotes yeast and bacterial growth.');

    -- CASE 17 (47): Thioamides (PTU)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hyperthyroidism in Pregnancy', 'A 28-year-old female is diagnosed with Graves disease. She is in her first trimester.', 47)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug is most appropriate in the first trimester?', '["Methimazole", "Propylthiouracil (PTU)", "Radioactive iodine", "Levothyroxine"]', 1, 'PTU is preferred in the 1st trimester due to lower teratogenicity.'),
    (v_case_id, 'Which life-threatening adverse effect is shared by both?', '["Agranulocytosis", "Hepatotoxicity", "Teratogenicity", "Hypocalcemia"]', 0, 'Agranulocytosis is a rare but severe risk of both drugs.');

    -- CASE 18 (48): Gout (Colchicine)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Acute Gout Flare', 'A 60-year-old male with acute gout flare in his great toe. Starts a drug that inhibits microtubule polymerization.', 48)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug is being used for this acute attack?', '["Allopurinol", "Colchicine", "Probenecid", "Febuxostat"]', 1, 'Colchicine inhibits microtubules to stop neutrophil migration.'),
    (v_case_id, 'What is the mechanism of Allopurinol (chronic)?', '["Inhibition of xanthine oxidase", "Inhibition of urate reabsorption", "Activation of uricase", "Inhibition of COX-2"]', 0, 'Allopurinol lowers uric acid production.');

    -- CASE 19 (49): Serotonin Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Combining SSRI and MAO-I', 'Patient with depression has hyperthermia, rigidity, and hyperreflexia after mixing SSRI and MAO-I.', 49)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["NMS", "Serotonin Syndrome", "Malignant Hyperthermia", "Anticholinergic"]', 1, 'Mixing these drugs causes excessive serotonin buildup.'),
    (v_case_id, 'Which agent acts as a specific antidote?', '["Dantrolene", "Cyproheptadine", "Bromocriptine", "Physostigmine"]', 1, 'Cyproheptadine is a serotonin antagonist.');

    -- CASE 20 (50): Isoniazid Neuropathy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pins and Needles During TB Treatment', 'A 34-year-old on RIPE regimen for TB develops peripheral neuropathy.', 50)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug is the likely cause?', '["Rifampin", "Isoniazid", "Pyrazinamide", "Ethambutol"]', 1, 'Isoniazid (INH) is famous for neurotoxicity.'),
    (v_case_id, 'This can be prevented by co-administration of which vitamin?', '["Vit B1", "Vit B6 (Pyridoxine)", "Vit B12", "Vit C"]', 1, 'Isoniazid depletes B6.');

    -- CASE 21 (51): Bisphosphonates
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Osteoporosis and Upright Position', 'A 70-year-old on a bisphosphonate must stay upright for 30 minutes.', 51)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of action?', '["Stimulation of osteoblasts", "Inhibition of osteoclasts", "Vit D activation", "RANKL inhibition"]', 1, 'Bisphosphonates bind to bone and inhibit resorbing cells.'),
    (v_case_id, 'Why must the patient remain upright?', '["Prevent hypotension", "Avoid esophagitis", "Increase absorption", "Prevent jaw necrosis"]', 1, 'Corrosive drug can cause esophageal ulcers if it refluxes.');

    -- CASE 22 (52): Sucralfate
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Ulcer Coating Agent', 'A drug "coats" the ulcer base and requires an acidic environment to polymerize.', 52)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug is being described?', '["Omeprazole", "Sucralfate", "Misoprostol", "Ranitidine"]', 1, 'Sucralfate forms a physical barrier over ulcers.'),
    (v_case_id, 'Why not give with antacids or H2 blockers?', '["Severe diarrhea", "Requires low pH to activate", "Increases toxicity", "Causes alkalosis"]', 1, 'Sucralfate needs acid to turn into a sticky paste.');

    -- CASE 23 (53): Ceftriaxone for Meningitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Empirical Meningitis Treatment', 'A 19-year-old student with meningitis is treated with an intravenous cephalosporin.', 53)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which generation is preferred for CSF penetration?', '["1st", "2nd", "3rd (Ceftriaxone)", "4th"]', 2, 'Ceftriaxone has excellent CNS entry.'),
    (v_case_id, 'What is the primary mechanism of action?', '["30S subunit", "Cell wall (PBP binding)", "DNA gyrase", "Cell membrane"]', 1, 'Beta-lactams inhibit peptidoglycan cross-linking.');

    -- CASE 24 (54): Nitroglycerin
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Angina Relief and cGMP', 'A patient uses sublingual nitroglycerin for acute relief.', 54)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Nitroglycerin increases which signaling molecule?', '["cAMP", "cGMP", "Calcium", "IP3"]', 1, 'Nitric oxide stimulates guanylyl cyclase to make cGMP.'),
    (v_case_id, 'Strictly contraindicated with which drug?', '["Aspirin", "Sildenafil (PDE-5 i)", "Metoprolol", "Atorvastatin"]', 1, 'Combining with PDE-5 inhibitors causes life-threatening hypotension.');

    -- CASE 25 (55): Methotrexate
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Rheumatoid Arthritis and Folate', 'A 45-year-old female with RA is started on Methotrexate.', 55)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Methotrexate inhibits which enzyme?', '["DHFR", "Xanthine oxidase", "COX", "Thymidylate synthase"]', 0, 'Inhibits dihydrofolate reductase.'),
    (v_case_id, 'Which "rescue" agent bypasses the block?', '["Folic acid", "Leucovorin (Folinic acid)", "Vit B12", "Iron"]', 1, 'Leucovorin is already reduced folate.');

    -- CASE 26 (56): Amiodarone
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Atrial Fibrillation and Iodine', 'A 65-year-old on a drug that prolongs QT, has a long half-life, and contains iodine.', 56)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug is he taking?', '["Sotalol", "Amiodarone", "Verapamil", "Digoxin"]', 1, 'Amiodarone contains iodine and is Class III.'),
    (v_case_id, 'Which organ should be monitored due to iodine?', '["Kidneys", "Thyroid", "Pancreas", "Spleen"]', 1, 'Amiodarone can cause hypo- or hyperthyroidism.');

    -- CASE 27 (57): Zolpidem vs Diazepam
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Insomnia and GABA-A', 'A medication for insomnia acts as an agonist at the BZ1 subtype of GABA receptors.', 57)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which is the most likely drug?', '["Diazepam", "Zolpidem", "Phenobarbital", "Ramelteon"]', 1, 'Zolpidem is selective for BZ1.'),
    (v_case_id, 'Mechanism of Benzodiazepines (Diazepam)?', '["Duration of opening", "Frequency of opening", "Melatonin agonist", "Orexin antagonist"]', 1, 'Benzos increase frequency (Barbs increase duration).');

    -- CASE 28 (58): N-acetylcysteine
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cystic Fibrosis and Mucolysis', 'Inhaled medication breaks disulfide bonds in mucus.', 58)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this drug?', '["Albuterol", "N-acetylcysteine", "Guaifenesin", "Cromolyn"]', 1, 'NAC acts as a mucolytic.'),
    (v_case_id, 'Specific antidote for which overdose?', '["Aspirin", "Acetaminophen", "Ibuprofen", "Morphine"]', 1, 'NAC restores glutathione to detoxify NAPQI.');

    -- CASE 29 (59): Statins
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'HMG-CoA Reductase Inhibition', 'A 50-year-old on a statin for hyperlipidemia.', 59)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Statins primarily lower LDL by:', '["Inhibit absorption", "Upregulate LDL receptors", "Decrease VLDL", "Activate PPAR-alpha"]', 1, 'Low cell cholesterol triggers more surface receptors.'),
    (v_case_id, 'Serious muscle-related side effect?', '["Osteoarthritis", "Rhabdomyolysis", "Hypertrophy", "Gout"]', 1, 'Statins can cause muscle breakdown.');

    -- CASE 30 (60): Thiamine and Glucose
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Wernicke Encephalopathy', 'Alcoholic with confusion, ataxia, and ophthalmoplegia.', 60)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Condition caused by deficiency of which vitamin?', '["Vit B1 (Thiamine)", "Vit B2", "Vit B3", "Vit B12"]', 0, 'Wernicke is acute B1 deficiency.'),
    (v_case_id, 'What happens if you give IV glucose before B1?', '["Recovery", "Worsening symptoms", "Hypoglycemia", "Standard care"]', 1, 'Glucose metabolism uses up the last B1, triggering crisis.');


    -- ══════════════════════════════════════════════════════════════════
    -- SET 3 (Cases 61-75) - Tox & Anesthesia
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 31 (61): Cyclosporine
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Inhibiting Calcineurin', 'A 28-year-old on a medication that inhibits calcineurin, preventing IL-2 transcription.', 61)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug is she likely taking?', '["Sirolimus", "Cyclosporine", "Azathioprine", "Mycophenolate"]', 1, 'Cyclosporine inhibits calcineurin.'),
    (v_case_id, 'Characteristic non-renal side effect?', '["Gingival hyperplasia", "Pulmonary fibrosis", "Hemorrhagic cystitis", "Ototoxicity"]', 0, 'Cyclosporine (and Phenytoin) cause gum overgrowth.');

    -- CASE 32 (62): Iron Toxicity
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Chewable Vitamin Ingestion', 'A 4-year-old ingests vitamins, presents with abdominal pain and hematemesis. Radiograph shows opaque tablets.', 62)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Likely cause of acute toxicity?', '["Vit C", "Iron", "Vit D", "Calcium"]', 1, 'Iron tablets are radiopaque and cause GI bleeding.'),
    (v_case_id, 'Specific antidote?', '["Deferoxamine", "Penicillamine", "Dimercaprol", "Calcium EDTA"]', 0, 'Deferoxamine is an iron chelator.');

    -- CASE 33 (63): Anesthetic Induction
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Solubility and MAC', 'A 30-year-old undergoes surgery. Anesthesiologist uses an agent with a low blood-gas partition coefficient.', 63)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does a low blood-gas partition coefficient indicate?', '["High solubility/Slow", "Low solubility/Fast", "High potency", "High MAC"]', 1, 'Lower solubility = faster equilibrium in the brain.'),
    (v_case_id, 'If a drug has a very high MAC value, it has:', '["High potency", "Low potency", "Fast onset", "No effect"]', 1, 'MAC is inversely proportional to potency.');

    -- CASE 34 (64): Misoprostol
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'PGE1 for Ulcer Prevention', 'A 45-year-old on NSAID develops an ulcer. Given a PGE1 analog to prevent further ones.', 64)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug is this PGE1 analog?', '["Misoprostol", "Loperamide", "Ondansetron", "Metoclopramide"]', 0, 'Misoprostol is a PGE1 analog.'),
    (v_case_id, 'Strictly contraindicated in which population?', '["Glaucoma", "Pregnant women", "Asthma", "Children"]', 1, 'Misoprostol causes uterine contractions (can cause abortion).');

    -- CASE 35 (65): Epinephrine Reversal
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pressor Response Flip', 'Epinephrine pressor response flips to depressor response after "Drug Y."', 65)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Drug Y is a:', '["Alpha-blocker", "Beta-blocker", "Muscarinic agonist", "Cholinesterase inhibitor"]', 0, 'Blocking alpha-1 leaves only beta-2 (vasodilation).'),
    (v_case_id, 'The resulting drop in BP is mediated by:', '["Alpha-1", "Alpha-2", "Beta-2", "M3"]', 2, 'Beta-2 receptors cause vasodilation in skeletal muscle vessels.');

    -- CASE 36 (66): Ondansetron
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Chemotherapy-Induced Emesis', 'A 50-year-old prescribed a drug that antagonizes 5-HT3 receptors for nausea.', 66)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug was prescribed?', '["Metoclopramide", "Ondansetron", "Promethazine", "Aprepitant"]', 1, 'Ondansetron is a 5-HT3 blocker.'),
    (v_case_id, 'Known EKG side effect?', '["ST-elevation", "QT prolongation", "Shortened PR", "Delta waves"]', 1, 'Ondansetron can prolong the QT interval.');

    -- CASE 37 (67): COPD LAMAs
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Inhaled Bronchodilators', 'A 60-year-old started on a long-acting muscarinic antagonist (LAMA) for COPD.', 67)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug is a LAMA?', '["Ipratropium", "Tiotropium", "Salmeterol", "Montelukast"]', 1, 'Tiotropium is long-acting (LAMA).'),
    (v_case_id, 'Muscarinic antagonists cause bronchodilation by:', '["Adenylyl Cyclase", "Phosphodiesterase", "Blocking Gq", "K+ channels"]', 2, 'M3 receptors are Gq-linked; blocking them stops constriction.');

    -- CASE 38 (68): Opioid Overdose (Naloxone)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Respiratory Rate of 4 and Pinpoint Pupils', 'A 25-year-old heroin user brought in unconscious.', 68)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Immediate treatment of choice?', '["Methadone", "Naloxone", "Buprenorphine", "Flumazenil"]', 1, 'Naloxone is the opioid antagonist.'),
    (v_case_id, 'Why given parenterally rather than orally?', '["Acid inactivation", "First-pass metabolism", "Gastric irritation", "Only oil soluble"]', 1, 'Orally, Naloxone is almost 100% metabolized by the liver before working.');

    -- CASE 39 (69): EPO
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Anemia of Renal Disease', 'A 55-year-old with CKD is given a medication to stimulate RBC production.', 69)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which agent is used?', '["Filgrastim", "Epoetin alfa", "Oprelvekin", "Sargramostim"]', 1, 'Erythropoietin replaces the missing hormone from the kidney.'),
    (v_case_id, 'Common and serious side effect?', '["Hypotension", "Hypertension", "Thrombocytopenia", "Hypokalemia"]', 1, 'EPO therapy is famous for causing/worsening hypertension.');

    -- CASE 40 (70): Ezetimibe and Niacin
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Inhibiting NPC1L1', 'A patient starts a drug that inhibits the NPC1L1 transporter in the small intestine.', 70)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug is this?', '["Cholestyramine", "Ezetimibe", "Gemfibrozil", "Niacin"]', 1, 'Ezetimibe blocks cholesterol absorption.'),
    (v_case_id, 'Which agent causes flushing mediated by prostaglandins?', '["Atorvastatin", "Niacin", "Fenofibrate", "Alirocumab"]', 1, 'Niacin (B3) causes cutaneous flushing.');

    -- CASE 41 (71): Clindamycin
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pseudomembranous Colitis After Antibiotic', 'Antibiotic inhibits the 50S ribosomal subunit and is known to cause pseudomembranous colitis.', 71)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug is the likely culprit?', '["Clindamycin", "Gentamicin", "Doxycycline", "Ciprofloxacin"]', 0, 'Clindamycin is classically associated with C. diff overgrowth.'),
    (v_case_id, 'Caused by overgrowth of which organism?', '["Staph aureus", "C. difficile", "E. coli", "C. albicans"]', 1, 'Clostridioides difficile causing toxins.');

    -- CASE 42 (72): CYP450 Inducers
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'OCP Failure', 'A woman on OCPs starts an inducer of CYP450 for epilepsy. Becomes pregnant.', 72)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug is a potent CYP450 inducer?', '["Cimetidine", "Valproate", "Carbamazepine", "Erythromycin"]', 2, 'Carbamazepine, Phenytoin, Rifampin are classic inducers.'),
    (v_case_id, 'Induction of CYP450 leads to:', '["Increased levels", "Decreased levels", "Inhibition of absorption", "Increased albumin binding"]', 1, 'More enzymes = faster metabolism = lower drug efficacy.');

    -- CASE 43 (73): Partial Agonist
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Agonist vs Antagonist Site', 'Drug binds to same site but produces opposite effect of an agonist.', 73)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Opposite effect drug is:', '["Antagonist", "Inverse agonist", "Partial agonist", "Allosteric"]', 1, 'Inverse agonists reduce constitutive activity.'),
    (v_case_id, 'True regarding a partial agonist?', '["Higher efficacy", "Can act as antagonist", "Binds different site", "Zero activity"]', 1, 'In the presence of full agonist, partial agonists act as antagonists.');

    -- CASE 44 (74): Malignant Hyperthermia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Heat and Rigidity During Anesthesia', 'Patient given Halothane and Succinylcholine develops high fever and muscle rigidity.', 74)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["NMS", "Malignant Hyperthermia", "Heat Stroke", "Serotonin"]', 1, 'Halothane/Succinylcholine trigger MH.'),
    (v_case_id, 'Condition caused by mutation in which receptor?', '["Nicotinic", "Ryanodine (RyR1)", "Muscarinic", "NMDA"]', 1, 'Defective RyR1 causes massive calcium leak.');

    -- CASE 45 (75): Levodopa/Carbidopa
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Parkinson Therapy', 'A 70-year-old taking a combination of Levodopa and Carbidopa.', 75)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Primary role of Carbidopa?', '["Cross BBB", "Inhibit peripheral DOPA decarboxylase", "Inhibit MAO-B", "Dopamine reuptake"]', 1, 'Prevents peripheral conversion so more L-dopa reaches brain.'),
    (v_case_id, 'Side effect NOT improved by Carbidopa?', '["Nausea", "Vomiting", "Arrhythmias", "Dyskinesias"]', 3, 'CNS side effects (hallucinations/dyskinesias) may actually increase.');


    -- ══════════════════════════════════════════════════════════════════
    -- SET 4 (Cases 76-90) - Final Integration
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 46 (76): Pralidoxime
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Organophosphate Adjuvant', 'A 4-year-old child ingests a liquid in the garage. Salivating, lacrimating, HR 52, pinpoint pupils.', 76)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which enzyme is being inhibited?', '["MAO", "Acetylcholinesterase", "Tyrosine hydroxylase", "Na+/K+ ATPase"]', 1, 'Irreversible blockade of AChE.'),
    (v_case_id, 'Which agent can "rescue" the enzyme?', '["Atropine", "Pralidoxime (2-PAM)", "Physostigmine", "Edrophonium"]', 1, 'Pralidoxime regenerates AChE before "aging" occurs.');

    -- CASE 47 (77): Diuretics and Gout
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'CHF and Gout Flare', 'A 58-year-old with CHF and gout starts a diuretic. Two weeks later has a red swollen great toe.', 77)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which class precipitates gout?', '["Loop", "Thiazide", "K-sparing", "Carbonic anhydrase"]', 1, 'Thiazides compete with uric acid for secretion.'),
    (v_case_id, 'Which diuretic is most likely to cause "ototoxicity"?', '["Chlorthalidone", "Furosemide", "Amiloride", "Acetazolamide"]', 1, 'Loop diuretics can damage hearing at high doses.');

    -- CASE 48 (78): Mesna
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hemorrhagic Cystitis Prevention', 'A 32-year-old undergoing chemo with cyclophosphamide is given a specific adjuvant.', 78)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Name of this protective agent?', '["Leucovorin", "Mesna", "Dexrazoxane", "Filgrastim"]', 1, 'Mesna prevents cyclophosphamide bladder damage.'),
    (v_case_id, 'Neutralizes which toxic metabolite?', '["Acrolein", "Napnap", "Oxalate", "Formaldehyde"]', 0, 'Acrolein is the bladder irritant.');

    -- CASE 49 (79): Warfarin Reversal
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bruising and Elevated PT', 'A woman on warfarin starts an antibiotic and presents with extensive bruising.', 79)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which antibiotic inhibited metabolism?', '["Erythromycin", "Rifampin", "Nafcillin", "Griseofulvin"]', 0, 'Macrolides are strong inhibitors.'),
    (v_case_id, 'Fastest way to reverse effect in emergency?', '["Vit K", "FFP/PCC", "Protamine", "Desmopressin"]', 1, 'FFP or PCC provide immediate replacement of clotting factors.');

    -- CASE 50 (80): PPIs
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Proton Pump Inhibition', 'A drug inhibits the H+/K+ ATPase pump in gastric parietal cells.', 80)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Class of drugs?', '["H2-receptor ant", "PPIs", "Antacids", "Muscarinic ant"]', 1, 'Proton Pump Inhibitors.'),
    (v_case_id, 'Chronic use increases risk of which infection?', '["Strep pneu", "C. difficile", "H. pylori", "Giardia"]', 1, 'Lower stomach acid allows overgrowth.');

    -- CASE 51 (81): Hyperkalemia Management
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Severe Hyperkalemia (6.8 mEq/L)', 'A 50-year-old with CKD presents with high serum potassium.', 81)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug stabilizes the cardiac membrane?', '["Bicarb", "Calcium gluconate", "Insulin", "Albuterol"]', 1, 'Calcium is for membrane stabilization, not for lowering K+.'),
    (v_case_id, 'Which diuretic is strictly contraindicated?', '["HCTZ", "Spironolactone", "Ethacrynic acid", "Mannitol"]', 1, 'Potassium-sparing diuretics will worsen the crisis.');

    -- CASE 52 (82): Mycoplasma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Walking Pneumonia', 'Patient diagnosed with Mycoplasma pneumoniae infection.', 82)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why are Beta-lactams ineffective?', '["Beta-lactamase", "Lacks a cell wall", "Impermeable", "Intracellular"]', 1, 'Mycoplasma has no cell wall target.'),
    (v_case_id, 'Which class is appropriate?', '["Aminoglycosides", "Macrolides", "Sulfonamides", "Glycopeptides"]', 1, 'Macrolides are 1st line.');

    -- CASE 53 (83): ACE-I Cough
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'ACE-I Cough and Bradykinin', 'Patient on ACE inhibitor develops a persistent dry cough.', 83)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Cough is due to accumulation of:', '["Angiotensin I", "Bradykinin", "Renin", "Aldosterone"]', 1, 'ACE normally breaks down bradykinin.'),
    (v_case_id, 'ARBs resolve the cough because they do not:', '["Inhibit ACE", "Bind to AT1", "Affect BP", "Inhibit aldosterone"]', 0, 'ARBs act downstream and don''t affect bradykinin metabolism.');

    -- CASE 54 (84): Bactrim
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Folate Synthesis Inhibition', 'A 25-year-old treated for UTI with a drug that inhibits bacterial dihydropteroate synthase.', 84)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug was likely used?', '["Trimethoprim", "Sulfamethoxazole", "Nitrofurantoin", "Ciprofloxacin"]', 1, 'Sulfonamides block the first step.'),
    (v_case_id, 'Trimethoprim inhibits which subsequent enzyme?', '["DHFR", "DNA Gyrase", "RNA Polymerase", "Topoisomerase IV"]', 0, 'Trimethoprim blocks dihydrofolate reductase.');

    -- CASE 55 (85): Mu Agonist Side Effects
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Opioid Use and Constipation', 'A patient with severe chronic pain is started on a Fentanyl patch.', 85)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Fentanyl acts primarily as an agonist at which receptor?', '["Delta", "Kappa", "Mu", "Sigma"]', 2, 'Opioids work via Mu receptors.'),
    (v_case_id, 'Side effect to which patients do NOT develop tolerance?', '["Resp depression", "Nausea", "Constipation and Miosis", "Euphoria"]', 2, 'Constipation and pinpoint pupils persist indefinitely.');

    -- CASE 56 (86): Ranolazine
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Stable Angina Adjuvant', 'A medication inhibits the "late sodium current" without affecting HR or BP.', 86)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug is being described?', '["Nitroglycerin", "Ranolazine", "Amlodipine", "Metoprolol"]', 1, 'Ranolazine is a novel anti-anginal.'),
    (v_case_id, 'Notable EKG finding?', '["PR shortening", "QT prolongation", "QRS widening", "T-wave inversion"]', 1, 'Ranolazine can prolong the QT interval.');

    -- CASE 57 (87): Cinchonism
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tinnitus and Headache After Malaria Drug', 'Patient presents with "cinchonism" (tinnitus, headache, dizziness).', 87)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug is the likely cause?', '["Chloroquine", "Quinidine/Quinine", "Mefloquine", "Artemether"]', 1, 'Quinidine and Quinine cause cinchonism.'),
    (v_case_id, 'Quinidine Class IA effect on action potential?', '["Decrease slope Phase 0/Increase APD", "Decrease APD", "No Phase 0", "Only Phase 4"]', 0, 'Class IA blocks Na+ channels (Phase 0) and K+ channels (prolongs repolarization).');

    -- CASE 58 (88): Mirabegron
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Overactive Bladder Therapy', 'Patient started on a drug that acts as a beta-3 adrenergic agonist.', 88)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug is this?', '["Oxybutynin", "Mirabegron", "Tolterodine", "Bethanechol"]', 1, 'Mirabegron is a beta-3 agonist.'),
    (v_case_id, 'Primary advantage over older agents?', '["Lower cost", "Lack of anticholinergic side effects", "Fast onset", "Once-yearly"]', 1, 'Avoids dry mouth and constipation associated with muscarinic blockers.');

    -- CASE 59 (89): Dose Adjustments in Renal Failure
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Creatinine Clearance and Dosing', 'Drug is entirely excreted by kidneys. Patient CrCl is 50% of normal.', 89)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How should maintenance dose be adjusted?', '["Doubled", "Halved", "Stay the same", "Quadrupled"]', 1, 'Maintenance dose depends on clearance.'),
    (v_case_id, 'Loading dose is primarily determined by:', '["Clearance", "Vd", "Half-life", "Bioavailability"]', 1, 'Loading dose is for reaching the volume of distribution.');

    -- CASE 60 (90): Terbinafine
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Inhibiting Squalene Epoxidase', 'A 30-year-old is treated for fungal skin infection with a drug that inhibits squalene epoxidase.', 90)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which drug is he using?', '["Fluconazole", "Terbinafine", "Amphotericin B", "Caspofungin"]', 1, 'Terbinafine is an allylamine.'),
    (v_case_id, 'Which class inhibits 14-alpha-demethylase?', '["Polyenes", "Azoles", "Echinocandins", "Flucytosine"]', 1, 'Azoles (like Fluconazole) block the 14-alpha step.');

    RAISE NOTICE 'SUCCESS: General Pharmacology (60 Cases) registered for Semester 3.';
END $$;

COMMIT;
