-- Migration: Year 2 - Systemic Pharmacology MCQ Bank (PART 1: 1-70)
-- Date: 2026-04-25
-- Based on: Lippincott, Katzung, and Rang & Dale

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    -- 1. Create/Ensure Topic "Systemic Pharmacology" for Year 2
    INSERT INTO topics (title, slug, semester_id, year_id, "order", usmle_step)
    VALUES ('Systemic Pharmacology', 'systemic-pharmacology', 3, 2, 45, NULL)
    ON CONFLICT (slug) DO UPDATE SET 
        title = EXCLUDED.title,
        year_id = 2, 
        semester_id = 3, 
        usmle_step = NULL,
        "order" = 45
    RETURNING id INTO v_topic_id;

    -- 2. Master Wipe for this topic to ensure no redundancy
    DELETE FROM mcqs WHERE topic_id = v_topic_id;

    -- SECTION 1: GENERAL PRINCIPLES & PHARMACOKINETICS (1-20)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which of the following describes the volume of distribution (Vd) of a drug that is highly bound to plasma proteins?', '["High Vd", "Low Vd", "Vd is equal to total body water", "Vd is independent of protein binding"]', 1, 'Drugs restricted to the vascular compartment (due to high protein binding) have a low Vd.'),
    (v_topic_id, 'A drug follows first-order kinetics. If the concentration is 100 mg/L and the half-life is 4 hours, what will the concentration be after 12 hours?', '["50 mg/L", "25 mg/L", "12.5 mg/L", "6.25 mg/L"]', 2, 'After 3 half-lives (12/4), the concentration is 100 -> 50 -> 25 -> 12.5 mg/L.'),
    (v_topic_id, 'Which phase of hepatic metabolism involves conjugation reactions like glucuronidation to make a drug more water-soluble?', '["Phase I", "Phase II", "Phase III", "Phase IV"]', 1, 'Phase I involves Redox/Hydrolysis (CYP450). Phase II involves conjugation (Glucuronidation, Acetylation).'),
    (v_topic_id, 'The "Loading Dose" of a drug is primarily determined by which pharmacokinetic parameter?', '["Clearance", "Volume of Distribution", "Half-life", "Bioavailability"]', 1, 'LD = (Target Concentration x Vd) / F. Maintenance Dose depends on Clearance.'),
    (v_topic_id, 'What is the effect of a "Competitive Antagonist" on the log dose-response curve of an agonist?', '["Shifts curve to the right, increases EC50", "Shifts curve down, decreases Emax", "Shifts curve to the left, decreases EC50", "No change to the curve"]', 0, 'Competitive antagonists can be overcome by more agonist, so Emax stays the same but potency (EC50) decreases.'),
    (v_topic_id, 'Which of the following is a "Spare Receptor" phenomenon?', '["Emax is reached when only a fraction of receptors are occupied", "Antagonist binds irreversibly", "Agonist has no efficacy", "Upregulation of receptors"]', 0, 'Spare receptors exist if the maximal response is achieved at less than 100% receptor occupancy.'),
    (v_topic_id, 'A drug has a narrow "Therapeutic Index." This means:', '["The drug is very safe", "The dose required for effect is close to the dose that causes toxicity", "The drug has a long half-life", "The drug is only given orally"]', 1, 'TI = TD50 / ED50. A small ratio means high risk (e.g., Warfarin, Digoxin, Lithium).'),
    (v_topic_id, 'Weakly acidic drugs (like Aspirin) are best absorbed in which environment?', '["Acidic (Stomach)", "Alkaline (Small Intestine)", "Neutral (Blood)", "Independent of pH"]', 0, 'Weak acids are non-ionized (lipid-soluble) in acidic environments (low pH).'),
    (v_topic_id, 'What is the "First-pass effect"?', '["Drug metabolism in the gut and liver before reaching systemic circulation", "Excretion in the urine", "Distribution to the brain", "Binding to albumin"]', 0, 'Oral drugs are absorbed into the portal vein and metabolized by the liver before reaching the heart.'),
    (v_topic_id, 'If a drug is a "Prodrug," it means:', '["It is active only after metabolism", "It is given via the IV route only", "It has no side effects", "It bypasses the liver"]', 0, 'Prodrugs (e.g., Enalapril, Levodopa) require metabolic activation.'),
    (v_topic_id, 'Which cytochrome P450 enzyme is responsible for the metabolism of the largest number of clinical drugs?', '["CYP1A2", "CYP2D6", "CYP3A4", "CYP2C9"]', 2, 'CYP3A4 is the major isoform for drug metabolism.'),
    (v_topic_id, 'Induction of CYP450 enzymes by a drug (e.g., Rifampin) will have what effect on a co-administered drug?', '["Decrease its plasma concentration", "Increase its plasma concentration", "Decrease its excretion", "No effect"]', 0, 'Induction increases the rate of metabolism, lowering the levels of the substrate drug.'),
    (v_topic_id, 'The "Steady State" concentration of a drug is reached after approximately how many half-lives?', '["1-2", "4-5", "10", "Immediately"]', 1, 'It takes 4-5 half-lives to reach steady state (and to clear the drug).'),
    (v_topic_id, 'Zero-order elimination kinetics means:', '["A constant amount of drug is eliminated per unit time", "A constant fraction of drug is eliminated per unit time", "Elimination is proportional to concentration", "Half-life is constant"]', 0, 'Zero-order (e.g., Alcohol, Aspirin, Phenytoin) means the elimination mechanism is saturated.'),
    (v_topic_id, 'Which route of administration has 100% bioavailability by definition?', '["Oral", "Intramuscular", "Intravenous", "Subcutaneous"]', 2, 'IV injection bypasses all absorption barriers and first-pass metabolism.'),
    (v_topic_id, 'An "Inverse Agonist" does what to receptor activity?', '["Binds and produces the same effect as agonist", "Binds and has no effect", "Binds and reduces constitutive activity below baseline", "Blocks the agonist only"]', 2, 'Inverse agonists stabilize the inactive state of the receptor.'),
    (v_topic_id, 'Tachyphylaxis refers to:', '["Slow onset of action", "Rapidly developing tolerance", "Delayed side effects", "Enhanced drug efficacy"]', 1, 'Tachyphylaxis is a quick decrease in response (e.g., Nitroglycerin, Ephedrine).'),
    (v_topic_id, 'What is the primary site of drug excretion?', '["Liver", "Lungs", "Kidneys", "Skin"]', 2, 'The renal system is the main route for removing water-soluble drugs.'),
    (v_topic_id, 'A "Full Agonist" has an intrinsic activity (efficacy) of:', '["0", "0.5", "1", "-1"]', 2, 'Full agonists have maximal efficacy (1.0). Antagonists have 0 efficacy.'),
    (v_topic_id, 'Which of the following increases the filtration of a drug in the glomerulus?', '["High protein binding", "Low molecular weight", "High lipid solubility", "Tubular secretion"]', 1, 'Only free (unbound) and small drugs are filtered in the glomerulus.'),

    -- SECTION 2: AUTONOMIC NERVOUS SYSTEM - CHOLINERGICS (21-45)
    (v_topic_id, 'Which receptor is located on the skeletal muscle neuromuscular junction and is a ligand-gated ion channel?', '["Muscarinic M1", "Muscarinic M3", "Nicotinic Nm", "Nicotinic Nn"]', 2, 'Nm receptors are ionotropic and found at the skeletal NMJ.'),
    (v_topic_id, 'Activation of Muscarinic M3 receptors in the eye causes:', '["Mydriasis (dilation)", "Miosis (constriction) and Cycloplegia", "Miosis (constriction) and accommodation (ciliary contraction)", "Increase in intraocular pressure"]', 2, 'M3 activation causes miosis (sphincter) and ciliary muscle contraction (accommodation/drainage).'),
    (v_topic_id, 'Which of the following is a "Direct-acting" cholinergic agonist used to treat post-operative urinary retention?', '["Bethanechol", "Pilocarpine", "Atropine", "Neostigmine"]', 0, 'Bethanechol is selective for the bladder/GI tract muscarinic receptors.'),
    (v_topic_id, 'Pilocarpine is used in the treatment of Glaucoma because it:', '["Produces mydriasis", "Contracts the ciliary muscle to open the trabecular meshwork", "Reduces aqueous humor production", "Blocks alpha-receptors"]', 1, 'Pilocarpine is a muscarinic agonist that facilitates aqueous outflow.'),
    (v_topic_id, 'Which indirect-acting cholinergic (AChE inhibitor) is used in the diagnosis of Myasthenia Gravis (Tensilon test)?', '["Neostigmine", "Edrophonium", "Physostigmine", "Pyridostigmine"]', 1, 'Edrophonium is very short-acting, making it ideal for the rapid "Tensilon test."'),
    (v_topic_id, 'Organophosphate poisoning (e.g., Sarin, Malathion) is treated with which of the following?', '["Atropine and Pralidoxime (2-PAM)", "Neostigmine", "Propranolol", "Acetylcholine"]', 0, 'Atropine blocks the muscarinic symptoms; Pralidoxime regenerates the AChE enzyme if given before "aging."'),
    (v_topic_id, 'Which AChE inhibitor is unique because it crosses the Blood-Brain Barrier and is used to treat Atropine overdose?', '["Neostigmine", "Physostigmine", "Pyridostigmine", "Donepezil"]', 1, 'Physostigmine is a tertiary amine and lipophilic. Neostigmine/Pyridostigmine are quaternary and do not cross the BBB.'),
    (v_topic_id, 'What is the "SLUDGE" mnemonic for cholinergic excess?', '["Salivation, Lacrimation, Urination, Defecation, GI distress, Emesis", "Sleep, Lethargy, Unconscious, Dizziness, Gastritis, Edema", "Sweating, Lung edema, Urgency, Diarrhea, Gastric pain, Euphoria", "None of the above"]', 0, 'SLUDGE describes the massive parasympathetic overstimulation.'),
    (v_topic_id, 'Which of the following is an irreversible AChE inhibitor used as an insecticide?', '["Donepezil", "Malathion", "Rivastigmine", "Galantamine"]', 1, 'Malathion and Parathion are organophosphates used as insecticides.'),
    (v_topic_id, 'The mechanism of action of Donepezil in Alzheimer''s disease is:', '["Direct muscarinic agonist", "Central AChE inhibitor", "NMDA antagonist", "Dopamine agonist"]', 1, 'Donepezil increases ACh levels in the brain to compensate for cholinergic loss.'),
    (v_topic_id, 'Which drug is a Muscarinic Antagonist used to produce mydriasis and cycloplegia for eye exams?', '["Pilocarpine", "Atropine", "Timolol", "Epinephrine"]', 1, 'Atropine (or Tropicamide/Cyclopentolate) blocks M3 receptors in the eye.'),
    (v_topic_id, 'Which drug is a Muscarinic Antagonist used to treat overactive bladder by relaxing the detrusor muscle?', '["Oxybutynin", "Ipratropium", "Scopolamine", "Bethanechol"]', 0, 'Oxybutynin and Tolterodine are M3 selective antagonists for the bladder.'),
    (v_topic_id, 'What is the "Atropine Flush"?', '["Vasodilation of cutaneous vessels in the face/neck due to M3 block", "Vasoconstriction", "Cyanosis", "Jaundice"]', 0, 'At high doses, atropine causes "Red as a beet" skin due to an unknown compensatory mechanism for hyperthermia.'),
    (v_topic_id, 'Which muscarinic antagonist is used in COPD/Asthma because it causes bronchodilation without systemic side effects (via inhalation)?', '["Albuterol", "Ipratropium", "Theophylline", "Montelukast"]', 1, 'Ipratropium and Tiotropium are quaternary muscarinic blockers (SAMA/LAMA).'),
    (v_topic_id, 'What is the primary use of Scopolamine?', '["Treating Glaucoma", "Preventing Motion Sickness", "Treating Hypertension", "Inducing labor"]', 1, 'Scopolamine (transdermal patch) is very effective for motion sickness via CNS muscarinic block.'),
    (v_topic_id, 'A patient presents with dry mouth, blurred vision, tachycardia, and constipation after taking a "cold" medicine. Which drug class is likely responsible?', '["Adrenergic agonist", "Anticholinergic (Antimuscarinic)", "Beta-blocker", "Cholinergic agonist"]', 1, 'These are the "Dry as a bone, Blind as a bat..." symptoms of atropine-like drugs.'),
    (v_topic_id, 'Which drug is used to treat Bradycardia during surgery by blocking the vagal effect on the heart?', '["Atropine", "Epinephrine", "Amiodarone", "Digoxin"]', 0, 'Atropine increases heart rate by blocking M2 receptors in the SA node.'),
    (v_topic_id, 'Which drug is a Neuromuscular Blocker that acts as a "Depolarizing" agent (Nicotinic Agonist)?', '["Pancuronium", "Succinylcholine", "Tubocurarine", "Vecuronium"]', 1, 'Succinylcholine causes initial fasciculations followed by flaccid paralysis (Phase I/II block).'),
    (v_topic_id, 'Malignant Hyperthermia is a life-threatening complication associated with which drug?', '["Atropine", "Succinylcholine", "Neostigmine", "Dantrolene"]', 1, 'Succinylcholine + inhaled anesthetics can trigger excessive Ca2+ release in susceptible individuals (RYR1 mutation).'),
    (v_topic_id, 'What is the antidote for Malignant Hyperthermia?', '["Atropine", "Dantrolene", "Calcium Gluconate", "Pralidoxime"]', 1, 'Dantrolene prevents Ca2+ release from the sarcoplasmic reticulum.'),
    (v_topic_id, 'Non-depolarizing NMJ blockers (e.g., Vecuronium) are reversed by:', '["Atropine", "Neostigmine", "Adrenaline", "Succinylcholine"]', 1, 'AChE inhibitors like Neostigmine increase ACh at the NMJ to compete with the blocker. (Atropine is given concurrently to prevent muscarinic side effects).'),
    (v_topic_id, 'Botulinum Toxin acts by:', '["Blocking ACh receptors", "Inhibiting AChE", "Preventing ACh release from the presynaptic terminal", "Inhibiting choline uptake"]', 2, 'Botox cleaves SNARE proteins, preventing vesicular fusion/release.'),
    (v_topic_id, 'Which muscarinic antagonist is preferred in Parkinson''s disease to reduce tremors?', '["Benztropine", "Ipratropium", "Oxybutynin", "Atropine"]', 0, 'Benztropine helps restore the balance between dopamine and acetylcholine in the striatum.'),
    (v_topic_id, 'In the heart, activation of M2 receptors leads to:', '["Tachycardia", "Bradycardia and decreased conduction velocity", "Increased contractility", "Vasoconstriction"]', 1, 'M2 activation (parasympathetic) is G-i mediated, slowing the heart.'),
    (v_topic_id, 'Which muscarinic blocker is used to treat peptic ulcers by reducing gastric acid secretion (though rarely used now)?', '["Pirenzepine", "Tiotropium", "Darifenacin", "Tropicamide"]', 0, 'Pirenzepine is an M1 selective antagonist.'),

    -- SECTION 3: ADRENERGIC SYSTEM - AGONISTS (46-70)
    (v_topic_id, 'Which adrenergic receptor is primarily responsible for Vasoconstriction of peripheral blood vessels?', '["Alpha-1", "Alpha-2", "Beta-1", "Beta-2"]', 0, 'Alpha-1 receptors are found on vascular smooth muscle and cause contraction (Gq).'),
    (v_topic_id, 'Alpha-2 receptors are primarily located:', '["Post-synaptically in the heart", "Pre-synaptically to inhibit NE release", "On bronchial smooth muscle", "In the skeletal muscle"]', 1, 'Alpha-2 are inhibitory autoreceptors (Gi).'),
    (v_topic_id, 'Beta-1 receptors are predominantly found in the:', '["Lungs", "Heart", "Liver", "Bladder"]', 1, 'Beta-1 = 1 Heart. Beta-2 = 2 Lungs.'),
    (v_topic_id, 'Activation of Beta-2 receptors leads to:', '["Bronchoconstriction", "Bronchodilation and Vasodilation in skeletal muscle", "Bradycardia", "Miosis"]', 1, 'Beta-2 activation increases cAMP (Gs), leading to smooth muscle relaxation.'),
    (v_topic_id, 'Epinephrine (Adrenaline) at high doses acts primarily on:', '["Alpha receptors", "Beta receptors", "Dopamine receptors", "Only Beta-2"]', 0, 'At low doses, Beta effects (vasodilation) dominate. At high doses, Alpha effects (vasoconstriction) dominate.'),
    (v_topic_id, 'Norepinephrine (Noradrenaline) differs from Epinephrine because it lacks significant activity at:', '["Alpha-1 receptors", "Alpha-2 receptors", "Beta-1 receptors", "Beta-2 receptors"]', 3, 'NE has minimal Beta-2 activity, so it always causes vasoconstriction (no vasodilation).'),
    (v_topic_id, 'Isoproterenol is a non-selective agonist at:', '["Alpha receptors only", "Beta receptors only (B1 and B2)", "Alpha and Beta receptors", "Dopamine receptors"]', 1, 'Isoproterenol increases HR (B1) and decreases BP (B2 vasodilation).'),
    (v_topic_id, 'Which drug is a selective Beta-1 agonist used to treat cardiogenic shock or acute heart failure?', '["Albuterol", "Dobutamine", "Phenylephrine", "Clonidine"]', 1, 'Dobutamine increases contractility with less effect on HR than isoproterenol.'),
    (v_topic_id, 'Which adrenergic agonist is used as a nasal decongestant (Alpha-1 selective)?', '["Phenylephrine", "Salmeterol", "Clonidine", "Dopamine"]', 0, 'Alpha-1 agonists cause vasoconstriction in nasal mucosa, reducing swelling.'),
    (v_topic_id, 'Clonidine is used to treat Hypertension. Its mechanism is:', '["Alpha-1 antagonist", "Centrally acting Alpha-2 agonist", "Beta-1 blocker", "Direct vasodilator"]', 1, 'Clonidine reduces sympathetic outflow from the CNS.'),
    (v_topic_id, 'Which drug is the first-line treatment for Anaphylactic Shock?', '["Norepinephrine", "Epinephrine", "Dopamine", "Diphenhydramine"]', 1, 'Epinephrine causes bronchodilation (B2), increases BP (Alpha1), and stabilizes mast cells.'),
    (v_topic_id, 'Albuterol is used to treat acute asthma attacks because it is a:', '["Non-selective beta agonist", "Selective Beta-2 agonist", "Selective Alpha-1 agonist", "Muscarinic agonist"]', 1, 'Beta-2 agonists are rapid bronchodilators.'),
    (v_topic_id, 'Dopamine at low doses (D1) primarily causes:', '["Vasoconstriction", "Renal and mesenteric vasodilation", "Increased heart rate", "Decreased urination"]', 1, 'Low-dose dopamine improves renal blood flow.'),
    (v_topic_id, 'Which drug is a Long-Acting Beta Agonist (LABA) used for asthma prophylaxis?', '["Albuterol", "Salmeterol", "Terbutaline", "Metaproterenol"]', 1, 'Salmeterol and Formoterol are lipophilic and have long durations of action.'),
    (v_topic_id, 'Activation of Beta-1 receptors in the kidney leads to:', '["Inhibition of Renin", "Release of Renin", "Vasoconstriction", "Diuresis"]', 1, 'Beta-1 stimulation increases renin release, activating the RAAS system.'),
    (v_topic_id, 'Which drug is a selective Alpha-2 agonist used to treat glaucoma by reducing aqueous humor production?', '["Brimonidine", "Pilocarpine", "Timolol", "Acetazolamide"]', 0, 'Brimonidine is a topical alpha-2 agonist.'),
    (v_topic_id, 'What is the "Reflex Bradycardia" seen with Phenylephrine?', '["Direct M2 stimulation", "Response to Alpha-1 mediated increase in BP via baroreceptors", "Direct Beta-1 block", "CNS sedation"]', 1, 'The sudden rise in BP triggers the baroreceptor reflex, which increases vagal tone to slow the heart.'),
    (v_topic_id, 'Terbutaline is used in obstetrics to:', '["Induce labor", "Stop premature labor (Tocolysis)", "Prevent eclampsia", "Induce ovulation"]', 1, 'Beta-2 agonists relax the uterine smooth muscle (myometrium).'),
    (v_topic_id, 'Amphetamine and Cocaine are "Indirect-acting" sympathomimetics because they:', '["Bind directly to receptors", "Increase the availability of NE in the synapse", "Inhibit AChE", "Block alpha receptors"]', 1, 'Amphetamine increases release; Cocaine blocks reuptake of NE/Dopamine.'),
    (v_topic_id, 'Which of the following describes the mechanism of Mirabegron?', '["Beta-3 agonist for overactive bladder", "Beta-2 agonist for asthma", "Alpha-1 agonist for hypotension", "Muscarinic blocker"]', 0, 'Beta-3 receptors are found in the bladder (detrusor) and mediate relaxation.'),
    (v_topic_id, 'What is the effect of Epinephrine on blood glucose?', '["Hypoglycemia", "Hyperglycemia via glycogenolysis and gluconeogenesis", "No effect", "Decreased insulin secretion only"]', 1, 'Epinephrine (Beta-2) promotes the breakdown of glycogen into glucose.'),
    (v_topic_id, 'Which drug is a selective Alpha-1 agonist used to treat orthostatic hypotension?', '["Midodrine", "Clonidine", "Doxazosin", "Prazosin"]', 0, 'Midodrine increases vascular tone.'),
    (v_topic_id, 'Why is Epinephrine added to local anesthetics?', '["To increase systemic absorption", "To cause local vasoconstriction and prolong the duration of action", "To prevent pain", "To increase the pH"]', 1, 'Vasoconstriction reduces blood flow, keeping the anesthetic at the site and reducing bleeding.'),
    (v_topic_id, 'What is the primary side effect of Albuterol?', '["Bradycardia", "Tremor and Tachycardia", "Constipation", "Drowsiness"]', 1, 'Beta-2 receptors in skeletal muscle cause tremor; spillover to B1 or reflex causes tachycardia.'),
    (v_topic_id, 'Which drug is an Alpha-2 agonist used to treat spasticity?', '["Tizanidine", "Baclofen", "Diazepam", "Dantrolene"]', 0, 'Tizanidine is a centrally acting alpha-2 agonist related to clonidine.');

    RAISE NOTICE 'SUCCESS: Systemic Pharmacology MCQ Part 1 (1-70) registered.';
END $$;

COMMIT;
