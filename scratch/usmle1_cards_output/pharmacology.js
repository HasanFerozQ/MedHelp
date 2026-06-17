const pharmacologyCards = [
  {
    "q": "What are the four main <b>pharmacokinetic</b> processes (ADME)?",
    "a": "<ul><li><b>A</b>bsorption</li><li><b>D</b>istribution</li><li><b>M</b>etabolism</li><li><b>E</b>xcretion</li></ul>"
  },
  {
    "q": "<b>Bioavailability</b> (F) definition and formula?",
    "a": "<ul><li>Fraction of administered dose that reaches systemic circulation unchanged.</li><li><b>F = AUC_oral / AUC_IV</b></li></ul>"
  },
  {
    "q": "What is the <b>first-pass effect</b>? Which routes avoid it?",
    "a": "Metabolism of drug before reaching systemic circulation (mainly hepatic). Avoided by: sublingual, rectal (partial), IV, IM, transdermal, inhalation."
  },
  {
    "q": "Volume of distribution (Vd) formula and clinical meaning?",
    "a": "<ul><li><b>Vd = Amount of drug in body / Plasma concentration</b></li><li>High Vd = extensive tissue distribution (lipophilic drugs). Low Vd = stays in plasma (hydrophilic).</li></ul>"
  },
  {
    "q": "What does a low Vd (&lt; 5 L) indicate?",
    "a": "Drug is confined to plasma (e.g., large molecules, highly protein-bound drugs)."
  },
  {
    "q": "Half-life (t½) formula?",
    "a": "<b>t½ = 0.693 × Vd / Clearance (CL)</b>"
  },
  {
    "q": "Steady-state concentration is reached after how many half-lives?",
    "a": "Approximately <b>4–5 half-lives</b> (94–97% of steady state)."
  },
  {
    "q": "<b>Loading dose</b> formula?",
    "a": "<b><b>Loading dose</b> = Vd × Target concentration / F</b>"
  },
  {
    "q": "<b>Maintenance dose</b> formula?",
    "a": "<b><b>Maintenance dose</b> = CL × Target concentration × Dosing interval / F</b>"
  },
  {
    "q": "<b>Zero-order elimination</b> — examples?",
    "a": "Constant amount eliminated per unit time (saturation kinetics). Examples: Ethanol, <b>Phenytoin</b> (high dose), <b>Aspirin</b> (high dose), <b>Theophylline</b>."
  },
  {
    "q": "<b>Phase I metabolism</b> reactions?",
    "a": "Oxidation, Reduction, Hydrolysis (usually by <b>CYP450</b>). Introduces or unmasks polar groups."
  },
  {
    "q": "<b>Phase II metabolism</b> reactions?",
    "a": "Conjugation (<b>Glucuronidation</b>, Sulfation, Acetylation, Glutathione, Glycine). Makes drug more water-soluble."
  },
  {
    "q": "Most common <b>CYP450</b> enzyme involved in drug metabolism?",
    "a": "<b>CYP3A4</b> (metabolizes ~50% of drugs)."
  },
  {
    "q": "Strong <b>CYP3A4</b> inducers (high-yield)?",
    "a": "<b>Carbamazepine</b>, <b>Rifampin</b>, <b>Phenytoin</b>, St. John’s Wort, Phenobarbital (CRAP). Also smoking."
  },
  {
    "q": "Strong <b>CYP3A4</b> inhibitors (high-yield)?",
    "a": "Ketoconazole, <b>Itraconazole</b>, Clarithromycin, <b>Erythromycin</b>, Grapefruit juice, <b>Ritonavir</b>, Cobicistat."
  },
  {
    "q": "What is the <b>therapeutic index</b>?",
    "a": "<b>TI = TD50 / ED50</b> (or LD50/ED50). Higher TI = safer drug."
  },
  {
    "q": "What are <b>competitive antagonists</b>?",
    "a": "Bind same site as agonist; can be overcome by increasing agonist concentration. Shift dose-response curve right (e.g., <b>Naloxone</b> at opioid receptors)."
  },
  {
    "q": "What are non-competitive (irreversible) antagonists?",
    "a": "Bind different site or covalently; cannot be overcome by increasing agonist. Decrease maximal response (Emax)."
  },
  {
    "q": "Full agonist vs Partial agonist on dose-response curve?",
    "a": "Full agonist: reaches 100% Emax. Partial agonist: reaches lower Emax even at full receptor occupancy."
  },
  {
    "q": "What is potency vs efficacy?",
    "a": "<b>Potency:</b> dose required for effect (related to EC50). <b>Efficacy:</b> maximal effect achievable (Emax)."
  },
  {
    "q": "Receptor types coupled to G-proteins (major families)?",
    "a": "<b>GPCR</b> (7-transmembrane). <b>Gs</b> (↑cAMP), <b>Gi</b> (↓cAMP), <b>Gq</b> (↑IP3/DAG)."
  },
  {
    "q": "Ion channel receptors — examples?",
    "a": "Nicotinic ACh receptor, GABA-A, Glycine, 5-HT3."
  },
  {
    "q": "Enzyme-linked receptors — examples?",
    "a": "Tyrosine kinase receptors (Insulin, EGF, PDGF), JAK-STAT (Cytokines), Guanylate cyclase (ANP, NO)."
  },
  {
    "q": "Intracellular (nuclear) receptors — examples?",
    "a": "Steroid hormones (Glucocorticoids, Estrogen, Testosterone), Thyroid hormone, Vitamin D, Retinoic acid."
  },
  {
    "q": "Most common mechanism of drug tolerance?",
    "a": "Receptor downregulation or desensitization."
  },
  {
    "q": "<b>Tachyphylaxis</b> definition?",
    "a": "Rapid development of tolerance after only a few doses (e.g., indirect sympathomimetics like amphetamine, nitrates)."
  },
  {
    "q": "What is a <b>prodrug</b>? Give examples.",
    "a": "Inactive compound converted to active metabolite. Examples: Codeine → Morphine, Enalapril → Enalaprilat, <b>Levodopa</b>."
  },
  {
    "q": "High-yield Phase II conjugation deficient in neonates?",
    "a": "<b>Glucuronidation</b> (e.g., Gray baby syndrome with <b>Chloramphenicol</b>)."
  },
  {
    "q": "Drugs highly extracted by liver (high first-pass)?",
    "a": "<b>Propranolol</b>, Morphine, Nitroglycerin, <b>Lidocaine</b>."
  },
  {
    "q": "Drugs with high <b>protein binding</b> (&gt;90%)?",
    "a": "Warfarin, <b>Phenytoin</b>, Diazepam, <b>Valproate</b>, <b>Aspirin</b>."
  },
  {
    "q": "What displaces warfarin from albumin increasing its effect?",
    "a": "Sulfa drugs, NSAIDs, <b>Phenytoin</b>, <b>Valproate</b>."
  },
  {
    "q": "<b>Renal clearance</b> formula?",
    "a": "<b>CL_renal = (U × V) / P</b> (urine concentration × urine flow / plasma concentration)."
  },
  {
    "q": "<b>pH-dependent drug trapping</b> — <b>weak acids</b>?",
    "a": "<b>Weak acids</b> (e.g., <b>Aspirin</b>, Phenobarbital) are ionized (trapped) in alkaline urine → alkalinize urine for overdose."
  },
  {
    "q": "<b>pH-dependent drug trapping</b> — <b>weak bases</b>?",
    "a": "<b>Weak bases</b> (e.g., Amphetamines) are ionized in acidic urine → acidify urine for overdose."
  },
  {
    "q": "What is the most common adverse drug reaction type (Type A)?",
    "a": "Augmented (dose-dependent, predictable, related to pharmacology)."
  },
  {
    "q": "Type B adverse reaction?",
    "a": "Bizarre (idiosyncratic, unpredictable, e.g., <b>hypersensitivity</b>, G6PD hemolysis)."
  },
  {
    "q": "Drugs causing <b>gingival hyperplasia</b>?",
    "a": "<b>Phenytoin</b>, <b>Cyclosporine</b>, Calcium channel blockers (especially <b>Nifedipine</b>)."
  },
  {
    "q": "Drugs causing <b>photosensitivity</b>?",
    "a": "<b>Tetracyclines</b>, <b>Sulfonamides</b>, <b>Amiodarone</b>, Psoralens, <b>Griseofulvin</b>."
  },
  {
    "q": "Drugs causing <b>lupus-like syndrome</b>?",
    "a": "Procainamide, <b>Hydralazine</b>, <b>Isoniazid</b>, Quinidine, Minocycline (PHIQ)."
  },
  {
    "q": "Drugs causing <b>ototoxicity</b>?",
    "a": "<b>Aminoglycosides</b>, Loop diuretics (<b>Furosemide</b>), <b>Cisplatin</b>, <b>Vancomycin</b>."
  },
  {
    "q": "Drugs causing <b>nephrotoxicity</b> (high-yield)?",
    "a": "<b>Aminoglycosides</b>, <b>Amphotericin B</b>, <b>Cisplatin</b>, NSAIDs, ACEi/ARBs (in renal artery stenosis), Contrast dye."
  },
  {
    "q": "Drugs causing <b>hepatotoxicity</b> (high-yield)?",
    "a": "<b>Acetaminophen</b> (most common), <b>Isoniazid</b>, <b>Rifampin</b>, <b>Pyrazinamide</b>, <b>Statins</b>, <b>Valproate</b>, Alcohol."
  },
  {
    "q": "Most common cause of drug-induced seizures?",
    "a": "<b>Bupropion</b>, Imipenem, <b>Isoniazid</b>, Tramadol, <b>Theophylline</b>."
  },
  {
    "q": "What is the mechanism of action of <b>Atropine</b>?",
    "a": "Competitive muscarinic receptor antagonist."
  },
  {
    "q": "What is the mechanism of action of <b>Physostigmine</b>?",
    "a": "Reversible cholinesterase inhibitor (crosses BBB)."
  },
  {
    "q": "What is the antidote for <b>organophosphate</b> poisoning?",
    "a": "<b>Atropine</b> (large doses) + <b>Pralidoxime</b> (2-PAM) to regenerate AChE."
  },
  {
    "q": "What receptors do Catecholamines act on (order of potency)?",
    "a": "<ul><li><b>Epinephrine:</b> α1 = α2 &gt; β1 &gt; β2</li><li><b>NE:</b> α1 = α2 &gt; β1 &gt;&gt; β2</li></ul>"
  },
  {
    "q": "What is the mechanism of action of Cocaine?",
    "a": "Blocks reuptake of NE, DA, and 5-HT (sympathomimetic)."
  },
  {
    "q": "What is the mechanism of action of Amphetamines?",
    "a": "Promote release of NE and DA + inhibit reuptake."
  },
  {
    "q": "What is the mechanism of action of Reserpine?",
    "a": "Inhibits VMAT → depletes NE stores (old antihypertensive)."
  },
  {
    "q": "What is the mechanism of action of Clonidine?",
    "a": "Central α2-agonist → ↓ sympathetic outflow."
  },
  {
    "q": "Mechanism of action of <b>Bethanechol</b>?",
    "a": "Direct muscarinic (M3) agonist. Used for postoperative ileus and urinary retention."
  },
  {
    "q": "Mechanism of action of <b>Pilocarpine</b>?",
    "a": "Direct muscarinic agonist (especially M3). Used for <b>glaucoma</b> and xerostomia."
  },
  {
    "q": "Mechanism and clinical use of <b>Neostigmine</b>?",
    "a": "Reversible AChE inhibitor (does NOT cross BBB). Used for <b>myasthenia gravis</b> and reversal of neuromuscular blockade."
  },
  {
    "q": "Mechanism and clinical use of <b>Edrophonium</b>?",
    "a": "Short-acting AChE inhibitor. Used in Tensilon test for <b>myasthenia gravis</b> diagnosis."
  },
  {
    "q": "What is the antidote for <b>atropine</b> (antimuscarinic) toxicity?",
    "a": "<b>Physostigmine</b> (crosses BBB)."
  },
  {
    "q": "Mechanism of action of α1-agonists? Example?",
    "a": "Vasoconstriction → ↑ BP. Example: Phenylephrine (nasal decongestant)."
  },
  {
    "q": "Mechanism of action of α2-agonists? Example?",
    "a": "Central: ↓ sympathetic outflow. Peripheral: ↓ NE release. Example: Clonidine."
  },
  {
    "q": "Mechanism of action of β1-selective agonists? Clinical use?",
    "a": "↑ heart rate and contractility. Example: <b>Dobutamine</b> (heart failure, cardiogenic shock)."
  },
  {
    "q": "Mechanism of action of β2-agonists? Clinical use?",
    "a": "Bronchodilation, uterine relaxation. Examples: <b>Albuterol</b> (asthma), <b>Terbutaline</b> (preterm labor)."
  },
  {
    "q": "Mechanism of action of <b>Isoproterenol</b>?",
    "a": "Non-selective β-agonist (β1 = β2). Used in bradycardia or heart block."
  },
  {
    "q": "Mechanism of action of Epinephrine (low dose vs high dose)?",
    "a": "<ul><li><b>Low dose:</b> β effects predominate (↑ HR, bronchodilation).</li><li><b>High dose:</b> α effects predominate (vasoconstriction).</li></ul>"
  },
  {
    "q": "Mechanism of action of Norepinephrine?",
    "a": "Mainly α1 &gt; β1. Used in septic shock (vasopressor)."
  },
  {
    "q": "Mechanism of action of <b>Phenoxybenzamine</b>?",
    "a": "Non-selective, irreversible α-blocker. Used in pheochromocytoma."
  },
  {
    "q": "Mechanism of action of <b>Prazosin</b>?",
    "a": "Selective α1-blocker. Used for hypertension and BPH."
  },
  {
    "q": "Mechanism of action of <b>Propranolol</b>?",
    "a": "Non-selective β-blocker. Uses: HTN, angina, tremor, migraine prophylaxis, hyperthyroidism."
  },
  {
    "q": "Mechanism of action of <b>Metoprolol</b>?",
    "a": "β1-selective blocker. Preferred in patients with asthma/COPD."
  },
  {
    "q": "Side effects of β-blockers (high-yield)?",
    "a": "Bradycardia, AV block, fatigue, erectile dysfunction, masking of hypoglycemia, exacerbation of asthma."
  },
  {
    "q": "What is the treatment for β-blocker overdose?",
    "a": "Glucagon (increases cAMP independently of β-receptors)."
  },
  {
    "q": "Mechanism of action of <b>Atropine</b>?",
    "a": "Competitive muscarinic antagonist."
  },
  {
    "q": "Clinical uses of <b>Atropine</b>?",
    "a": "Bradycardia, <b>organophosphate</b> poisoning, pupil dilation, antisecretory before surgery."
  },
  {
    "q": "Mechanism of action of Scopolamine?",
    "a": "Muscarinic antagonist. Used for motion sickness."
  },
  {
    "q": "What are the effects of muscarinic blockade (mnemonic)?",
    "a": "<b>Dry as a bone, Red as a beet, Blind as a bat, Mad as a hatter, Hot as a hare</b>."
  },
  {
    "q": "Mechanism of action of Hexamethonium?",
    "a": "Ganglionic blocker (nicotinic antagonist). Rarely used."
  },
  {
    "q": "Mechanism of action of <b>Succinylcholine</b>?",
    "a": "Depolarizing neuromuscular blocker (persistent agonist at nicotinic receptors)."
  },
  {
    "q": "Mechanism of action of <b>Rocuronium</b> / <b>Vecuronium</b>?",
    "a": "Non-depolarizing neuromuscular blockers (competitive nicotinic antagonists)."
  },
  {
    "q": "Reversal of non-depolarizing neuromuscular blockade?",
    "a": "<b>Neostigmine</b> + <b>Glycopyrrolate</b> (or <b>Sugammadex</b> for <b>Rocuronium</b>)."
  },
  {
    "q": "Mechanism of action of <b>Dantrolene</b>?",
    "a": "Inhibits Ca²⁺ release from sarcoplasmic reticulum. Used in <b>malignant hyperthermia</b>."
  },
  {
    "q": "Mechanism of action of <b>Baclofen</b>?",
    "a": "GABA-B receptor agonist. Used for spasticity."
  },
  {
    "q": "Mechanism of action of <b>Tizanidine</b>?",
    "a": "Central α2-agonist. Used for spasticity."
  },
  {
    "q": "Mechanism of action of <b>Nitroprusside</b>?",
    "a": "Releases NO → ↑ cGMP → vasodilation (arterial + venous)."
  },
  {
    "q": "Mechanism of action of <b>Hydralazine</b>?",
    "a": "Direct arterial vasodilator (↑ cGMP). Used in HTN and heart failure."
  },
  {
    "q": "Mechanism of action of <b>Minoxidil</b>?",
    "a": "Opens K⁺ channels → hyperpolarization → arterial vasodilation."
  },
  {
    "q": "Mechanism of action of ACE inhibitors (e.g., <b>Lisinopril</b>)?",
    "a": "Inhibit angiotensin-converting enzyme → ↓ Ang II, ↑ <b>bradykinin</b>."
  },
  {
    "q": "Side effects of ACE inhibitors?",
    "a": "Cough, angioedema, hyperkalemia, renal failure (in bilateral renal artery stenosis)."
  },
  {
    "q": "Mechanism of action of ARBs (e.g., <b>Losartan</b>)?",
    "a": "Block AT1 receptors. No effect on <b>bradykinin</b> (no cough)."
  },
  {
    "q": "Mechanism of action of <b>Aliskiren</b>?",
    "a": "Direct renin inhibitor."
  },
  {
    "q": "Mechanism of action of Calcium channel blockers (Dihydropyridines)?",
    "a": "Block L-type Ca²⁺ channels in vascular smooth muscle → vasodilation (e.g., <b>Amlodipine</b>, <b>Nifedipine</b>)."
  },
  {
    "q": "Mechanism of action of <b>Verapamil</b> / <b>Diltiazem</b>?",
    "a": "<b>Non-dihydropyridine CCBs</b> — block Ca²⁺ channels in heart (negative inotrope/chronotrope) and vessels."
  },
  {
    "q": "Mechanism of action of <b>Digoxin</b>?",
    "a": "Inhibits Na⁺/K⁺ ATPase → ↑ intracellular Na⁺ → ↑ Ca²⁺ via NCX → positive inotrope."
  },
  {
    "q": "Toxicity of <b>Digoxin</b>?",
    "a": "Arrhythmias (especially with hypokalemia), visual changes (xanthopsia), <b>GI</b> upset."
  },
  {
    "q": "Antidote for <b>Digoxin</b> toxicity?",
    "a": "<b>Digoxin</b>-specific antibody fragments (Digibind)."
  },
  {
    "q": "Mechanism of action of <b>Amiodarone</b>?",
    "a": "Class III antiarrhythmic (K⁺ channel blocker) with properties of <b>all</b> classes."
  },
  {
    "q": "Major toxicities of <b>Amiodarone</b>?",
    "a": "Pulmonary fibrosis, thyroid dysfunction (hypo/hyper), corneal deposits, blue-gray skin, <b>hepatotoxicity</b>."
  },
  {
    "q": "Mechanism of action of <b>Lidocaine</b>?",
    "a": "<b>Class Ib antiarrhythmic</b> — Na⁺ channel blocker (preferentially affects ischemic tissue)."
  },
  {
    "q": "Mechanism of action of <b>Adenosine</b>?",
    "a": "Activates A1 receptors → ↑ K⁺ outflow → hyperpolarization. Used for SVT termination."
  },
  {
    "q": "Mechanism of action of Magnesium sulfate in torsades de pointes?",
    "a": "Stabilizes cardiac membrane."
  },
  {
    "q": "Mechanism of action of <b>Statins</b>?",
    "a": "<b>HMG-CoA reductase</b> inhibitors → ↓ cholesterol synthesis → ↑ LDL receptor expression."
  },
  {
    "q": "Side effects of <b>Statins</b>?",
    "a": "Myopathy, rhabdomyolysis, elevated LFTs, teratogenic."
  },
  {
    "q": "Mechanism of action of <b>Ezetimibe</b>?",
    "a": "Inhibits NPC1L1 cholesterol transporter in small intestine."
  },
  {
    "q": "Mechanism of action of Fibrates (e.g., <b>Gemfibrozil</b>)?",
    "a": "PPAR-α agonists → ↑ lipoprotein lipase → ↓ triglycerides."
  },
  {
    "q": "Mechanism of action of <b>Niacin</b>?",
    "a": "Inhibits lipolysis in adipose tissue → ↓ VLDL → ↓ LDL and ↑ HDL."
  },
  {
    "q": "Mechanism of action of Bile acid sequestrants (e.g., <b>Cholestyramine</b>)?",
    "a": "Bind bile acids in intestine → ↑ hepatic bile acid synthesis from cholesterol."
  },
  {
    "q": "Mechanism of action of Penicillin G / V?",
    "a": "Inhibits cell wall synthesis by binding penicillin-binding proteins (PBPs) → inhibits transpeptidation."
  },
  {
    "q": "Mechanism of action of <b>Cephalosporins</b>?",
    "a": "Same as <b>penicillins</b>: inhibit cell wall synthesis via PBPs."
  },
  {
    "q": "Mechanism of action of <b>Vancomycin</b>?",
    "a": "Inhibits cell wall synthesis by binding D-ala-D-ala terminus of peptidoglycan precursor."
  },
  {
    "q": "Mechanism of action of <b>Aminoglycosides</b> (<b>Gentamicin</b>, <b>Tobramycin</b>)?",
    "a": "Inhibit protein synthesis by binding 30S ribosomal subunit → misreading of mRNA."
  },
  {
    "q": "Mechanism of action of <b>Tetracyclines</b>?",
    "a": "Bind 30S subunit → prevent tRNA attachment."
  },
  {
    "q": "Mechanism of action of <b>Macrolides</b> (<b>Erythromycin</b>, <b>Azithromycin</b>)?",
    "a": "Bind 50S subunit → inhibit translocation."
  },
  {
    "q": "Mechanism of action of <b>Clindamycin</b>?",
    "a": "Binds 50S subunit → inhibits protein synthesis."
  },
  {
    "q": "Mechanism of action of <b>Linezolid</b>?",
    "a": "Binds 50S subunit → inhibits initiation complex formation."
  },
  {
    "q": "Mechanism of action of <b>Chloramphenicol</b>?",
    "a": "Binds 50S subunit → inhibits peptidyl transferase."
  },
  {
    "q": "Mechanism of action of <b>Sulfonamides</b>?",
    "a": "Competitive inhibitors of dihydropteroate synthase (PABA analog)."
  },
  {
    "q": "Mechanism of action of <b>Trimethoprim</b>?",
    "a": "Inhibits dihydrofolate reductase."
  },
  {
    "q": "Mechanism of action of <b>Fluoroquinolones</b> (<b>Ciprofloxacin</b>)?",
    "a": "Inhibit DNA gyrase (topoisomerase II) and topoisomerase IV."
  },
  {
    "q": "Mechanism of action of <b>Metronidazole</b>?",
    "a": "Forms toxic free radicals in anaerobic bacteria and protozoa."
  },
  {
    "q": "Mechanism of action of <b>Rifampin</b>?",
    "a": "Inhibits DNA-dependent RNA polymerase."
  },
  {
    "q": "Mechanism of action of <b>Isoniazid</b> (<b>INH</b>)?",
    "a": "Inhibits mycolic acid synthesis (requires catalase-peroxidase activation)."
  },
  {
    "q": "Mechanism of action of <b>Pyrazinamide</b>?",
    "a": "Disrupts membrane energetics and inhibits fatty acid synthesis (active in acidic pH)."
  },
  {
    "q": "Mechanism of action of <b>Ethambutol</b>?",
    "a": "Inhibits arabinosyl transferase (cell wall synthesis)."
  },
  {
    "q": "First-line treatment for Tuberculosis (RIPE)?",
    "a": "<b>R</b>ifampin, <b>I</b>soniazid, <b>P</b>yrazinamide, <b>E</b>thambutol."
  },
  {
    "q": "Major toxicity of <b>Isoniazid</b>?",
    "a": "Peripheral neuropathy (prevent with Pyridoxine/B6), <b>hepatotoxicity</b>."
  },
  {
    "q": "Major toxicity of <b>Rifampin</b>?",
    "a": "Orange-red discoloration of fluids, induces <b>CYP450</b>."
  },
  {
    "q": "Mechanism of action of <b>Acyclovir</b> / <b>Valacyclovir</b>?",
    "a": "Guanosine analog → inhibits viral DNA polymerase (requires viral thymidine kinase)."
  },
  {
    "q": "Mechanism of action of <b>Ganciclovir</b>?",
    "a": "Inhibits CMV DNA polymerase (requires viral UL97 kinase)."
  },
  {
    "q": "Mechanism of action of <b>Oseltamivir</b>?",
    "a": "Neuraminidase inhibitor (Influenza A & B)."
  },
  {
    "q": "Mechanism of action of <b>Sofosbuvir</b>?",
    "a": "NS5B RNA polymerase inhibitor (Hepatitis C)."
  },
  {
    "q": "Mechanism of action of <b>Amphotericin B</b>?",
    "a": "Binds ergosterol → forms pores in fungal membrane."
  },
  {
    "q": "Major toxicity of <b>Amphotericin B</b>?",
    "a": "<b>Nephrotoxicity</b>, infusion-related reactions, hypokalemia, hypomagnesemia."
  },
  {
    "q": "Mechanism of action of Azoles (<b>Fluconazole</b>, <b>Itraconazole</b>)?",
    "a": "Inhibit lanosterol 14-α-demethylase → ↓ ergosterol synthesis."
  },
  {
    "q": "Mechanism of action of Echinocandins (<b>Caspofungin</b>)?",
    "a": "Inhibit β-glucan synthase → weaken fungal cell wall."
  },
  {
    "q": "Mechanism of action of <b>Terbinafine</b>?",
    "a": "Inhibits squalene epoxidase (dermatophytes)."
  },
  {
    "q": "Mechanism of action of <b>Griseofulvin</b>?",
    "a": "Disrupts microtubule function → inhibits mitosis in dermatophytes."
  },
  {
    "q": "Mechanism of action of <b>Methotrexate</b>?",
    "a": "Folate analog → inhibits dihydrofolate reductase."
  },
  {
    "q": "Mechanism of action of <b>5-Fluorouracil</b> (<b>5-FU</b>)?",
    "a": "Pyrimidine analog → inhibits thymidylate synthase."
  },
  {
    "q": "Mechanism of action of <b>Cytarabine</b>?",
    "a": "Pyrimidine analog → inhibits DNA polymerase."
  },
  {
    "q": "Mechanism of action of <b>Cisplatin</b> / <b>Carboplatin</b>?",
    "a": "Cross-link DNA strands."
  },
  {
    "q": "Mechanism of action of <b>Doxorubicin</b> (Adriamycin)?",
    "a": "Intercalates DNA, generates free radicals, inhibits topoisomerase II."
  },
  {
    "q": "Major toxicity of <b>Doxorubicin</b>?",
    "a": "Cardiotoxicity (cumulative dose-dependent cardiomyopathy)."
  },
  {
    "q": "Mechanism of action of <b>Vincristine</b> / <b>Vinblastine</b>?",
    "a": "Inhibit microtubule polymerization (M-phase arrest)."
  },
  {
    "q": "Mechanism of action of <b>Paclitaxel</b>?",
    "a": "Stabilizes microtubules (M-phase arrest)."
  },
  {
    "q": "Mechanism of action of <b>Etoposide</b>?",
    "a": "Inhibits topoisomerase II."
  },
  {
    "q": "Mechanism of action of <b>Imatinib</b>?",
    "a": "Tyrosine kinase inhibitor (<b>BCR-ABL</b>)."
  },
  {
    "q": "Mechanism of action of <b>Trastuzumab</b> (Herceptin)?",
    "a": "Monoclonal antibody against HER2/neu."
  },
  {
    "q": "Mechanism of action of <b>Rituximab</b>?",
    "a": "Anti-CD20 monoclonal antibody."
  },
  {
    "q": "Mechanism of action of <b>Cyclophosphamide</b>?",
    "a": "Alkylating agent → cross-links DNA."
  },
  {
    "q": "Major toxicity of <b>Cyclophosphamide</b>?",
    "a": "Hemorrhagic cystitis (prevent with <b>Mesna</b>)."
  },
  {
    "q": "Mechanism of action of <b>Prednisone</b> / <b>Dexamethasone</b>?",
    "a": "Glucocorticoid receptor agonist → gene transcription modulation."
  },
  {
    "q": "Mechanism of action of <b>Tamoxifen</b>?",
    "a": "SERM (estrogen antagonist in breast tissue)."
  },
  {
    "q": "Mechanism of action of <b>Levothyroxine</b>?",
    "a": "Synthetic T4."
  },
  {
    "q": "Mechanism of action of <b>Propylthiouracil</b> (<b>PTU</b>) / <b>Methimazole</b>?",
    "a": "Inhibit thyroid peroxidase → block thyroid hormone synthesis."
  },
  {
    "q": "Which antithyroid drug is preferred in pregnancy?",
    "a": "<b>Propylthiouracil (PTU)</b> — lower risk of teratogenicity."
  },
  {
    "q": "Mechanism of action of <b>Metformin</b>?",
    "a": "Activates <b>AMPK</b> → ↓ hepatic gluconeogenesis, ↑ peripheral glucose uptake."
  },
  {
    "q": "Mechanism of action of Sulfonylureas (<b>Glipizide</b>)?",
    "a": "Close K⁺-<b>ATP</b> channels in β-cells → depolarization → insulin release."
  },
  {
    "q": "Mechanism of action of Thiazolidinediones (<b>Pioglitazone</b>)?",
    "a": "PPAR-γ agonists → ↑ insulin sensitivity."
  },
  {
    "q": "Mechanism of action of GLP-1 agonists (e.g., <b>Exenatide</b>)?",
    "a": "↑ glucose-dependent insulin release, ↓ glucagon, slow gastric emptying."
  },
  {
    "q": "Mechanism of action of <b>SGLT2</b> inhibitors (e.g., <b>Dapagliflozin</b>)?",
    "a": "Inhibit glucose reabsorption in proximal tubule → glucosuria."
  },
  {
    "q": "Mechanism of action of Insulin?",
    "a": "Binds tyrosine kinase receptor → ↑ <b>GLUT4</b> translocation."
  },
  {
    "q": "Mechanism of action of <b>Omeprazole</b> / <b>Pantoprazole</b>?",
    "a": "Irreversible proton pump (H⁺/K⁺ ATPase) inhibitor."
  },
  {
    "q": "Mechanism of action of <b>Cimetidine</b> / <b>Ranitidine</b>?",
    "a": "H₂ receptor antagonists."
  },
  {
    "q": "Mechanism of action of <b>Ondansetron</b>?",
    "a": "5-HT3 receptor antagonist (anti-emetic)."
  },
  {
    "q": "Mechanism of action of <b>Loperamide</b>?",
    "a": "μ-opioid agonist in enteric nervous system (antidiarrheal)."
  },
  {
    "q": "Mechanism of action of <b>Lactulose</b>?",
    "a": "Osmotic laxative + ammonia trapper (hepatic encephalopathy)."
  },
  {
    "q": "Mechanism of action of <b>Sucralfate</b>?",
    "a": "Forms viscous gel in acidic environment → physical barrier over ulcers."
  },
  {
    "q": "Mechanism of action of <b>Misoprostol</b>?",
    "a": "PGE1 analog → ↑ mucus/bicarbonate, ↓ acid."
  },
  {
    "q": "Mechanism of action of <b>Acetaminophen</b>?",
    "a": "Inhibits COX in CNS (weak peripheral effect)."
  },
  {
    "q": "Mechanism of action of <b>Aspirin</b>?",
    "a": "Irreversible COX-1/2 inhibitor (↓ TXA2)."
  },
  {
    "q": "Mechanism of action of <b>Ibuprofen</b> / <b>Naproxen</b>?",
    "a": "Reversible COX-1/2 inhibitors."
  },
  {
    "q": "Mechanism of action of <b>Celecoxib</b>?",
    "a": "Selective COX-2 inhibitor."
  },
  {
    "q": "Mechanism of action of <b>Acetylcysteine</b>?",
    "a": "Replenishes glutathione (<b>acetaminophen</b> overdose antidote)."
  },
  {
    "q": "Mechanism of action of <b>Allopurinol</b>?",
    "a": "Xanthine oxidase inhibitor."
  },
  {
    "q": "Mechanism of action of <b>Febuxostat</b>?",
    "a": "Non-purine xanthine oxidase inhibitor."
  },
  {
    "q": "Mechanism of action of <b>Colchicine</b>?",
    "a": "Binds tubulin → inhibits microtubule polymerization and neutrophil <b>chemotaxis</b>."
  },
  {
    "q": "Mechanism of action of <b>Probenecid</b>?",
    "a": "Inhibits <b>uric acid</b> reabsorption in proximal tubule."
  },
  {
    "q": "Mechanism of action of <b>Rasburicase</b>?",
    "a": "Recombinant urate oxidase (breaks down <b>uric acid</b> to allantoin)."
  },
  {
    "q": "Mechanism of action of <b>Furosemide</b>?",
    "a": "Inhibits Na⁺-K⁺-2Cl⁻ cotransporter in thick ascending limb."
  },
  {
    "q": "Mechanism of action of <b>Hydrochlorothiazide</b>?",
    "a": "Inhibits Na⁺-Cl⁻ cotransporter in distal convoluted tubule."
  },
  {
    "q": "Mechanism of action of <b>Spironolactone</b> / <b>Eplerenone</b>?",
    "a": "Aldosterone receptor antagonists (K⁺-sparing)."
  },
  {
    "q": "Mechanism of action of <b>Mannitol</b>?",
    "a": "Osmotic diuretic."
  },
  {
    "q": "Mechanism of action of <b>Acetazolamide</b>?",
    "a": "Carbonic anhydrase inhibitor."
  },
  {
    "q": "Mechanism of action of <b>Ethacrynic acid</b>?",
    "a": "Loop diuretic (not a sulfonamide)."
  },
  {
    "q": "Mechanism of action of <b>SSRIs</b> (e.g., Fluoxetine)?",
    "a": "Selective <b>serotonin</b> reuptake inhibition."
  },
  {
    "q": "Mechanism of action of <b>SNRIs</b> (e.g., Venlafaxine)?",
    "a": "Inhibit reuptake of <b>serotonin</b> and norepinephrine."
  },
  {
    "q": "Mechanism of action of <b>TCAs</b> (e.g., <b>Amitriptyline</b>)?",
    "a": "Inhibit reuptake of NE and 5-HT; also block muscarinic, α1, H1 receptors."
  },
  {
    "q": "Mechanism of action of <b>MAOIs</b>?",
    "a": "Inhibit monoamine oxidase → ↑ NE, 5-HT, DA."
  },
  {
    "q": "Mechanism of action of <b>Bupropion</b>?",
    "a": "NDRI (norepinephrine-dopamine reuptake inhibitor)."
  },
  {
    "q": "Mechanism of action of <b>Mirtazapine</b>?",
    "a": "α2 antagonist + 5-HT2/3 antagonist (increases NE and 5-HT)."
  },
  {
    "q": "Mechanism of action of <b>Lithium</b>?",
    "a": "Inhibits inositol monophosphatase and <b>glycogen</b> synthase kinase-3."
  },
  {
    "q": "Mechanism of action of <b>Valproate</b>?",
    "a": "Increases GABA, blocks Na⁺ channels, inhibits T-type Ca²⁺ channels."
  },
  {
    "q": "Mechanism of action of <b>Lamotrigine</b>?",
    "a": "Blocks voltage-gated Na⁺ channels."
  },
  {
    "q": "Mechanism of action of <b>Carbamazepine</b>?",
    "a": "Blocks Na⁺ channels; induces <b>CYP450</b>."
  },
  {
    "q": "Mechanism of action of <b>Phenytoin</b>?",
    "a": "Blocks Na⁺ channels (<b>zero-order kinetics</b> at high doses)."
  },
  {
    "q": "Mechanism of action of <b>Benzodiazepines</b>?",
    "a": "Enhance GABA-A receptor (↑ Cl⁻ conductance)."
  },
  {
    "q": "Mechanism of action of <b>Barbiturates</b>?",
    "a": "Prolong GABA-A channel opening."
  },
  {
    "q": "Mechanism of action of <b>Buspirone</b>?",
    "a": "5-HT1A partial agonist (anxiolytic without sedation)."
  },
  {
    "q": "Mechanism of action of Typical antipsychotics (<b>Haloperidol</b>)?",
    "a": "D2 receptor antagonists."
  },
  {
    "q": "Mechanism of action of Atypical antipsychotics (<b>Risperidone</b>, <b>Olanzapine</b>)?",
    "a": "D2 + 5-HT2A antagonists."
  },
  {
    "q": "Mechanism of action of <b>Clozapine</b>?",
    "a": "Atypical antipsychotic with low D2 affinity; used in treatment-resistant schizophrenia."
  },
  {
    "q": "Major toxicity of <b>Clozapine</b>?",
    "a": "<b>Agranulocytosis</b> (requires weekly WBC monitoring)."
  },
  {
    "q": "Mechanism of action of <b>Levodopa</b>?",
    "a": "Dopamine precursor (crosses BBB)."
  },
  {
    "q": "Why is <b>Carbidopa</b> given with <b>Levodopa</b>?",
    "a": "Inhibits peripheral DOPA decarboxylase → ↑ CNS availability of L-DOPA."
  },
  {
    "q": "Mechanism of action of <b>Selegiline</b> / <b>Rasagiline</b>?",
    "a": "MAO-B inhibitors."
  },
  {
    "q": "Mechanism of action of <b>Entacapone</b>?",
    "a": "COMT inhibitor (prolongs L-DOPA action)."
  },
  {
    "q": "Mechanism of action of <b>Memantine</b>?",
    "a": "NMDA receptor antagonist (moderate-severe Alzheimer)."
  },
  {
    "q": "Mechanism of action of <b>Donepezil</b>?",
    "a": "Acetylcholinesterase inhibitor (Alzheimer)."
  },
  {
    "q": "Mechanism of action of <b>Riluzole</b>?",
    "a": "Used in ALS (↓ glutamate release)."
  },
  {
    "q": "Mechanism of action of <b>Primaquine</b>?",
    "a": "Disrupts mitochondrial electron transport in Plasmodium. Used for radical cure of P. vivax/ovale (liver hypnozoites)."
  },
  {
    "q": "Mechanism of action of <b>Chloroquine</b>?",
    "a": "Raises pH in parasite food vacuole → prevents heme polymerization."
  },
  {
    "q": "Mechanism of action of <b>Artemisinin</b> derivatives?",
    "a": "Generate free radicals → damage parasite proteins."
  },
  {
    "q": "Mechanism of action of <b>Ivermectin</b>?",
    "a": "Increases GABA and glutamate-gated Cl⁻ conductance in nematodes → paralysis."
  },
  {
    "q": "Mechanism of action of <b>Albendazole</b> / <b>Mebendazole</b>?",
    "a": "Inhibits microtubule synthesis (β-tubulin binding)."
  },
  {
    "q": "Mechanism of action of <b>Praziquantel</b>?",
    "a": "Increases Ca²⁺ permeability in trematodes/cestodes → muscle contraction and paralysis."
  },
  {
    "q": "Mechanism of action of <b>Niclosamide</b>?",
    "a": "Inhibits oxidative phosphorylation in tapeworms."
  },
  {
    "q": "Mechanism of action of <b>Pentamidine</b>?",
    "a": "Inhibits DNA synthesis and topoisomerase. Used for PCP and African trypanosomiasis."
  },
  {
    "q": "Mechanism of action of <b>Miltefosine</b>?",
    "a": "Alkylphosphocholine → disrupts parasite cell membrane (visceral leishmaniasis)."
  },
  {
    "q": "Major adverse effect of <b>Aminoglycosides</b>?",
    "a": "<b>Nephrotoxicity</b> and <b>Ototoxicity</b> (especially with loop diuretics)."
  },
  {
    "q": "Major adverse effect of <b>Vancomycin</b> (rapid infusion)?",
    "a": "Red man syndrome (<b>histamine</b> release)."
  },
  {
    "q": "Major adverse effect of <b>Linezolid</b>?",
    "a": "Thrombocytopenia, optic neuropathy, <b>serotonin</b> syndrome (with <b>SSRIs</b>)."
  },
  {
    "q": "Major adverse effect of <b>Chloramphenicol</b>?",
    "a": "Gray baby syndrome, aplastic anemia."
  },
  {
    "q": "Major adverse effect of <b>Fluoroquinolones</b>?",
    "a": "Tendon rupture (Achilles), cartilage damage (avoid in children/pregnancy), QT prolongation."
  },
  {
    "q": "Major adverse effect of <b>Tetracyclines</b>?",
    "a": "Tooth discoloration, <b>photosensitivity</b>, Fanconi syndrome (expired drug)."
  },
  {
    "q": "Major adverse effect of <b>Sulfonamides</b>?",
    "a": "Stevens-Johnson syndrome, kernicterus in neonates, hemolysis in G6PD deficiency."
  },
  {
    "q": "Major drug interaction with <b>Rifampin</b>?",
    "a": "Strong <b>CYP450</b> inducer → decreases effectiveness of oral contraceptives, warfarin, protease inhibitors."
  },
  {
    "q": "Major drug interaction with <b>Macrolides</b> (except <b>Azithromycin</b>)?",
    "a": "Strong <b>CYP3A4</b> inhibitors → increased levels of <b>statins</b>, <b>theophylline</b>, warfarin."
  },
  {
    "q": "Mechanism of action of <b>Abacavir</b>?",
    "a": "Nucleoside reverse transcriptase inhibitor (NRTI)."
  },
  {
    "q": "Major toxicity of <b>Abacavir</b>?",
    "a": "<b>Hypersensitivity</b> reaction (screen for HLA-B*5701)."
  },
  {
    "q": "Mechanism of action of <b>Efavirenz</b>?",
    "a": "Non-nucleoside reverse transcriptase inhibitor (NNRTI)."
  },
  {
    "q": "Major side effect of <b>Efavirenz</b>?",
    "a": "Neuropsychiatric symptoms, vivid dreams, teratogenic."
  },
  {
    "q": "Mechanism of action of Protease inhibitors (e.g., <b>Ritonavir</b>)?",
    "a": "Inhibit HIV protease → prevent maturation of virions."
  },
  {
    "q": "Major side effect of Protease inhibitors?",
    "a": "Lipodystrophy, hyperglycemia, <b>CYP3A4</b> inhibition (especially <b>Ritonavir</b>)."
  },
  {
    "q": "Mechanism of action of Integrase inhibitors (e.g., <b>Raltegravir</b>)?",
    "a": "Inhibit HIV integrase → prevent viral DNA integration into host genome."
  },
  {
    "q": "Mechanism of action of <b>Enfuvirtide</b>?",
    "a": "Fusion inhibitor (blocks gp41)."
  },
  {
    "q": "Mechanism of action of <b>Maraviroc</b>?",
    "a": "CCR5 co-receptor antagonist."
  },
  {
    "q": "Mechanism of action of <b>Hydroxychloroquine</b> in lupus?",
    "a": "Stabilizes lysosomal membranes, interferes with antigen presentation."
  },
  {
    "q": "Mechanism of action of <b>Mycophenolate mofetil</b>?",
    "a": "Inhibits inosine monophosphate dehydrogenase → blocks purine synthesis in lymphocytes."
  },
  {
    "q": "Mechanism of action of <b>Azathioprine</b>?",
    "a": "Purine analog → inhibits lymphocyte proliferation."
  },
  {
    "q": "Mechanism of action of <b>Tacrolimus</b> / <b>Cyclosporine</b>?",
    "a": "Calcineurin inhibitors → block IL-2 transcription."
  },
  {
    "q": "Mechanism of action of <b>Sirolimus</b> (<b>Rapamycin</b>)?",
    "a": "mTOR inhibitor → blocks T-cell proliferation."
  },
  {
    "q": "Mechanism of action of <b>Basiliximab</b>?",
    "a": "Anti-IL-2 receptor (CD25) monoclonal antibody."
  },
  {
    "q": "Mechanism of action of <b>Natalizumab</b>?",
    "a": "Anti-α4-integrin antibody → prevents lymphocyte migration into CNS (MS, Crohn’s)."
  },
  {
    "q": "Mechanism of action of <b>Infliximab</b> / <b>Adalimumab</b>?",
    "a": "Anti-<b>TNF</b>-α monoclonal antibodies."
  },
  {
    "q": "Major risk with Anti-<b>TNF</b> agents?",
    "a": "Reactivation of latent TB, opportunistic infections."
  },
  {
    "q": "Mechanism of action of <b>Anakinra</b>?",
    "a": "IL-1 receptor antagonist."
  },
  {
    "q": "Mechanism of action of <b>Tocilizumab</b>?",
    "a": "Anti-IL-6 receptor antibody."
  },
  {
    "q": "Mechanism of action of <b>Ustekinumab</b>?",
    "a": "Anti-IL-12/IL-23 monoclonal antibody."
  },
  {
    "q": "Mechanism of action of <b>Secukinumab</b>?",
    "a": "Anti-IL-17A monoclonal antibody."
  },
  {
    "q": "Mechanism of action of <b>Omalizumab</b>?",
    "a": "Anti-<b>IgE</b> monoclonal antibody (asthma, urticaria)."
  },
  {
    "q": "Mechanism of action of <b>Eculizumab</b>?",
    "a": "Anti-C5 monoclonal antibody (paroxysmal nocturnal hemoglobinuria, aHUS)."
  },
  {
    "q": "Mechanism of action of <b>Rituximab</b> in rheumatoid arthritis?",
    "a": "Depletes B cells (anti-CD20)."
  },
  {
    "q": "Mechanism of action of <b>Methotrexate</b> in rheumatoid arthritis?",
    "a": "Inhibits dihydrofolate reductase + anti-inflammatory effects at low dose."
  },
  {
    "q": "Mechanism of action of <b>Leflunomide</b>?",
    "a": "Inhibits dihydroorotate dehydrogenase → blocks pyrimidine synthesis."
  },
  {
    "q": "Mechanism of action of <b>Sulfasalazine</b>?",
    "a": "Anti-inflammatory + antibacterial (cleaved to 5-ASA + sulfapyridine)."
  },
  {
    "q": "Mechanism of action of <b>Hydroxychloroquine</b> in RA?",
    "a": "Lysosomal alkalinization and interference with antigen processing."
  },
  {
    "q": "Mechanism of action of <b>Finasteride</b>?",
    "a": "5α-reductase inhibitor → ↓ dihydrotestosterone (DHT). Used in BPH and male pattern baldness."
  },
  {
    "q": "Mechanism of action of <b>Flutamide</b> / <b>Bicalutamide</b>?",
    "a": "Androgen receptor antagonists. Used in prostate cancer."
  },
  {
    "q": "Mechanism of action of <b>Leuprolide</b>?",
    "a": "GnRH agonist (continuous use → downregulation). Used in prostate cancer, endometriosis, precocious puberty."
  },
  {
    "q": "Mechanism of action of <b>Sildenafil</b> / <b>Tadalafil</b>?",
    "a": "PDE-5 inhibitors → ↑ cGMP → smooth muscle relaxation in corpus cavernosum."
  },
  {
    "q": "Mechanism of action of <b>Tamsulosin</b>?",
    "a": "α1A-selective blocker (prostate smooth muscle). Used in BPH."
  },
  {
    "q": "Mechanism of action of <b>Oxybutynin</b> / <b>Tolterodine</b>?",
    "a": "Muscarinic antagonists. Used for urge incontinence / overactive bladder."
  },
  {
    "q": "Mechanism of action of <b>Desmopressin</b> (<b>DDAVP</b>)?",
    "a": "V2 receptor agonist → ↑ aquaporin-2 insertion in collecting duct (central DI, nocturnal enuresis)."
  },
  {
    "q": "Mechanism of action of <b>Demeclocycline</b>?",
    "a": "Tetracycline derivative that causes nephrogenic diabetes insipidus (used in <b>SIADH</b>)."
  },
  {
    "q": "Mechanism of action of <b>Conivaptan</b> / <b>Tolvaptan</b>?",
    "a": "V2 receptor antagonists (aquaretics). Used in <b>SIADH</b>."
  },
  {
    "q": "Mechanism of action of <b>Octreotide</b>?",
    "a": "Somatostatin analog. Used in acromegaly, carcinoid syndrome, variceal bleeding."
  },
  {
    "q": "Mechanism of action of <b>Propylthiouracil</b> (<b>PTU</b>) vs <b>Methimazole</b>?",
    "a": "Both inhibit thyroid peroxidase. <b>PTU</b> also inhibits peripheral T4 → T3 conversion."
  },
  {
    "q": "Mechanism of action of Radioactive Iodine (I-131)?",
    "a": "Destroys thyroid follicular cells via β-emission."
  },
  {
    "q": "Mechanism of action of <b>Cinacalcet</b>?",
    "a": "Calcimimetic → activates CaSR in parathyroid → ↓ PTH secretion."
  },
  {
    "q": "Mechanism of action of <b>Bisphosphonates</b> (<b>Alendronate</b>, <b>Zoledronate</b>)?",
    "a": "Inhibit osteoclast activity → ↓ bone resorption."
  },
  {
    "q": "Major side effect of <b>Bisphosphonates</b>?",
    "a": "Esophagitis (oral), osteonecrosis of jaw, atypical femoral fractures."
  },
  {
    "q": "Mechanism of action of <b>Teriparatide</b>?",
    "a": "Recombinant PTH (1-34) → anabolic effect on bone (intermittent dosing)."
  },
  {
    "q": "Mechanism of action of <b>Denosumab</b>?",
    "a": "Anti-RANKL monoclonal antibody → inhibits osteoclast differentiation."
  },
  {
    "q": "Mechanism of action of <b>Raloxifene</b>?",
    "a": "SERM: agonist on bone, antagonist on breast/uterus."
  },
  {
    "q": "Mechanism of action of <b>Calcitonin</b>?",
    "a": "Inhibits osteoclast activity. Used in hypercalcemia and <b>osteoporosis</b>."
  },
  {
    "q": "Mechanism of action of <b>Orlistat</b>?",
    "a": "Pancreatic and gastric lipase inhibitor → ↓ fat absorption."
  },
  {
    "q": "Mechanism of action of <b>Lactulose</b> in hepatic encephalopathy?",
    "a": "Osmotic laxative + acidifies colon → traps NH4+."
  },
  {
    "q": "Mechanism of action of <b>Rifaximin</b>?",
    "a": "Non-absorbable antibiotic. Used in hepatic encephalopathy and traveler’s diarrhea."
  },
  {
    "q": "Mechanism of action of <b>Alosetron</b>?",
    "a": "5-HT3 antagonist. Used in severe IBS-D (women only)."
  },
  {
    "q": "Mechanism of action of <b>Lubiprostone</b>?",
    "a": "ClC-2 chloride channel activator → ↑ intestinal fluid secretion (IBS-C, opioid constipation)."
  },
  {
    "q": "Mechanism of action of <b>Teduglutide</b>?",
    "a": "GLP-2 analog → promotes intestinal growth in short bowel syndrome."
  },
  {
    "q": "Mechanism of action of <b>Montelukast</b> / <b>Zafirlukast</b>?",
    "a": "Leukotriene receptor (CysLT1) antagonists."
  },
  {
    "q": "Mechanism of action of <b>Theophylline</b>?",
    "a": "Non-selective PDE inhibitor + <b>adenosine</b> receptor antagonist."
  },
  {
    "q": "Major toxicity of <b>Theophylline</b>?",
    "a": "Narrow <b>therapeutic index</b>: seizures, arrhythmias, nausea."
  },
  {
    "q": "Mechanism of action of <b>Cromolyn</b>?",
    "a": "Mast cell stabilizer. Used in asthma prophylaxis."
  },
  {
    "q": "Mechanism of action of <b>Ipratropium</b> / <b>Tiotropium</b>?",
    "a": "Muscarinic antagonists (bronchodilators)."
  },
  {
    "q": "Mechanism of action of <b>Pseudoephedrine</b>?",
    "a": "α-adrenergic agonist → nasal vasoconstriction (decongestant)."
  },
  {
    "q": "Mechanism of action of <b>Dextromethorphan</b>?",
    "a": "NMDA receptor antagonist (antitussive)."
  },
  {
    "q": "Mechanism of action of <b>Guaifenesin</b>?",
    "a": "Expectorant → ↑ respiratory tract fluid volume."
  },
  {
    "q": "Mechanism of action of <b>Acetylcysteine</b> in <b>acetaminophen</b> overdose?",
    "a": "Replenishes glutathione + direct binding of toxic metabolite <b>NAPQI</b>."
  },
  {
    "q": "Mechanism of action of <b>Fomepizole</b>?",
    "a": "Alcohol dehydrogenase inhibitor. Used in methanol/ethylene glycol poisoning."
  },
  {
    "q": "Mechanism of action of <b>Pralidoxime</b> (2-PAM)?",
    "a": "Regenerates acetylcholinesterase in <b>organophosphate</b> poisoning."
  },
  {
    "q": "Mechanism of action of <b>Flumazenil</b>?",
    "a": "Competitive benzodiazepine receptor antagonist."
  },
  {
    "q": "Mechanism of action of <b>Naloxone</b> / <b>Naltrexone</b>?",
    "a": "Opioid receptor antagonists."
  },
  {
    "q": "Mechanism of action of <b>Physostigmine</b> in anticholinergic toxicity?",
    "a": "Reversible cholinesterase inhibitor that crosses BBB."
  },
  {
    "q": "Mechanism of action of Vitamin K in warfarin overdose?",
    "a": "Replenishes vitamin K stores → restores clotting factors."
  },
  {
    "q": "Mechanism of action of <b>Protamine sulfate</b>?",
    "a": "Binds heparin → neutralizes it."
  },
  {
    "q": "Mechanism of action of <b>Idarucizumab</b>?",
    "a": "Specific reversal agent for <b>Dabigatran</b>."
  },
  {
    "q": "Mechanism of action of <b>Andexanet alfa</b>?",
    "a": "Reversal agent for Factor Xa inhibitors (Rivaroxaban, Apixaban)."
  },
  {
    "q": "Mechanism of action of <b>Methylene blue</b>?",
    "a": "Reduces methemoglobin to hemoglobin."
  },
  {
    "q": "Mechanism of action of <b>Deferoxamine</b>?",
    "a": "Iron chelator."
  },
  {
    "q": "Mechanism of action of <b>Dimercaprol</b> (<b>BAL</b>)?",
    "a": "Chelator for heavy metals (arsenic, gold, lead, mercury)."
  },
  {
    "q": "Mechanism of action of <b>EDTA</b>?",
    "a": "Chelator for lead and calcium."
  },
  {
    "q": "Mechanism of action of <b>Penicillamine</b>?",
    "a": "Chelator for copper (<b>Wilson disease</b>), lead, and rheumatoid arthritis."
  },
  {
    "q": "What is the volume of distribution (Vd) clinical implication for highly lipophilic drugs?",
    "a": "<b>Very high Vd (&gt; body water volume)</b> — extensive tissue distribution (e.g., amiodarone, chloroquine, digoxin)."
  },
  {
    "q": "What is the effect of hypoalbuminemia on highly protein-bound drugs?",
    "a": "Increased free (active) fraction → higher risk of toxicity (e.g., <b>phenytoin</b>, warfarin)."
  },
  {
    "q": "<b>Zero-order kinetics</b> drugs (high-yield list)?",
    "a": "<b>Phenytoin</b> (high dose), Ethanol, <b>Aspirin</b> (high dose), <b>Theophylline</b>."
  },
  {
    "q": "Drugs with narrow <b>therapeutic index</b> (high-yield)?",
    "a": "<b>Digoxin</b>, <b>Lithium</b>, <b>Theophylline</b>, <b>Phenytoin</b>, Warfarin, <b>Aminoglycosides</b>, <b>Vancomycin</b>."
  },
  {
    "q": "What is the most common cause of drug-induced torsades de pointes?",
    "a": "Drugs that prolong QT interval (e.g., antiarrhythmics, antipsychotics, <b>macrolides</b>, <b>fluoroquinolones</b>, <b>ondansetron</b>)."
  },
  {
    "q": "Drugs that cause <b>serotonin</b> syndrome (high-yield combination)?",
    "a": "<b>MAOIs</b> + <b>SSRIs</b>/<b>SNRIs</b>, <b>MAOIs</b> + Meperidine, <b>Linezolid</b> + <b>SSRIs</b>."
  },
  {
    "q": "Drugs that cause <b>malignant hyperthermia</b>?",
    "a": "<b>Succinylcholine</b> + volatile anesthetics (halothane, isoflurane). Treated with <b>dantrolene</b>."
  },
  {
    "q": "Drugs causing drug-induced lupus (high-yield)?",
    "a": "Procainamide, <b>Hydralazine</b>, <b>Isoniazid</b>, Quinidine, Minocycline."
  },
  {
    "q": "Drugs causing gynecomastia (high-yield)?",
    "a": "<b>Spironolactone</b>, <b>Cimetidine</b>, Ketoconazole, <b>Digoxin</b>, Estrogens, Anti-androgens."
  },
  {
    "q": "Drugs causing orange-red body fluids?",
    "a": "<b>Rifampin</b>."
  },
  {
    "q": "Drugs causing blue-gray skin discoloration?",
    "a": "<b>Amiodarone</b>."
  },
  {
    "q": "Drugs causing retinopathy (high-yield)?",
    "a": "<b>Chloroquine</b> / <b>Hydroxychloroquine</b>, <b>Hydroxychloroquine</b> requires eye exams."
  },
  {
    "q": "Drugs causing optic neuritis?",
    "a": "<b>Ethambutol</b>, <b>Linezolid</b>, <b>Isoniazid</b> (with B6 deficiency)."
  },
  {
    "q": "Drugs causing peripheral neuropathy (high-yield)?",
    "a": "<b>Isoniazid</b>, <b>Metronidazole</b>, <b>Vincristine</b>, <b>Paclitaxel</b>, Nitrofurantoin, Didanosine."
  },
  {
    "q": "Drugs causing pseudomembranous colitis?",
    "a": "<b>Clindamycin</b>, <b>Cephalosporins</b>, <b>Fluoroquinolones</b>, Ampicillin."
  },
  {
    "q": "Drugs causing interstitial nephritis?",
    "a": "Methicillin, NSAIDs, PPIs, <b>Sulfonamides</b>, <b>Rifampin</b>."
  },
  {
    "q": "Drugs causing Fanconi syndrome?",
    "a": "Expired <b>tetracyclines</b>, Ifosfamide, Tenofovir."
  },
  {
    "q": "Drugs contraindicated in pregnancy (high-yield categories)?",
    "a": "ACEi/ARBs, <b>Statins</b>, <b>Tetracyclines</b>, <b>Fluoroquinolones</b>, <b>Aminoglycosides</b>, Warfarin, Isotretinoin, Thalidomide."
  },
  {
    "q": "Drugs safe in pregnancy (high-yield)?",
    "a": "<b>Penicillins</b>, <b>Cephalosporins</b>, <b>Azithromycin</b>, <b>Acetaminophen</b>, Heparin, Insulin, Labetalol, Methyldopa."
  },
  {
    "q": "Drugs that require dose adjustment in renal failure (high-yield)?",
    "a": "<b>Aminoglycosides</b>, <b>Vancomycin</b>, <b>Digoxin</b>, <b>Lithium</b>, <b>Methotrexate</b>, <b>Allopurinol</b>."
  },
  {
    "q": "Drugs that require dose adjustment in hepatic failure?",
    "a": "<b>Phenytoin</b>, <b>Valproate</b>, <b>Theophylline</b>, <b>Lidocaine</b>, <b>Propranolol</b>."
  },
  {
    "q": "Most common mechanism of <b>pharmacokinetic</b> drug interaction?",
    "a": "<b>CYP450</b> enzyme induction or inhibition."
  },
  {
    "q": "Strongest <b>CYP3A4</b> inducers?",
    "a": "<b>Rifampin</b>, <b>Carbamazepine</b>, <b>Phenytoin</b>, St. John’s Wort."
  },
  {
    "q": "Strongest <b>CYP3A4</b> inhibitors?",
    "a": "Ketoconazole, <b>Itraconazole</b>, <b>Ritonavir</b>, Clarithromycin, Grapefruit juice."
  },
  {
    "q": "P-glycoprotein (MDR1) inducers vs inhibitors effect?",
    "a": "Inducers decrease drug absorption/effect. Inhibitors increase drug levels (e.g., <b>verapamil</b>, quinidine)."
  },
  {
    "q": "What is the effect of grapefruit juice on drug levels?",
    "a": "Inhibits intestinal <b>CYP3A4</b> and P-gp → increased <b>bioavailability</b> of many drugs."
  },
  {
    "q": "Warfarin drug interactions (high-yield)?",
    "a": "<ul><li><b>Increased effect:</b> Amiodarone, TMP-SMX, Metronidazole, Fluconazole.</li><li><b>Decreased effect:</b> Rifampin, Carbamazepine, Vitamin K.</li></ul>"
  },
  {
    "q": "What is <b>pharmacodynamics</b>?",
    "a": "What the drug does to the body (receptor interaction, dose-response)."
  },
  {
    "q": "What is <b>pharmacokinetics</b>?",
    "a": "What the body does to the drug (ADME)."
  },
  {
    "q": "Phase I vs <b>Phase II metabolism</b> summary?",
    "a": "<ul><li><b>Phase I:</b> oxidation/reduction/hydrolysis (CYP450).</li><li><b>Phase II:</b> conjugation (makes more polar).</li></ul>"
  },
  {
    "q": "Most common Phase II reaction?",
    "a": "<b>Glucuronidation</b>."
  },
  {
    "q": "Drugs metabolized by <b>zero-order kinetics</b> at therapeutic doses?",
    "a": "<b>Phenytoin</b>, Ethanol."
  },
  {
    "q": "What is <b>bioavailability</b>?",
    "a": "Fraction of administered dose that reaches systemic circulation unchanged."
  },
  {
    "q": "What route has 100% <b>bioavailability</b>?",
    "a": "Intravenous (IV)."
  },
  {
    "q": "What is <b>extraction ratio</b>?",
    "a": "Fraction of drug removed from blood by liver in one pass. High extraction = high <b>first-pass effect</b>."
  },
  {
    "q": "Drugs with high hepatic extraction (high first-pass)?",
    "a": "Morphine, <b>Propranolol</b>, Nitroglycerin, <b>Lidocaine</b>."
  },
  {
    "q": "What is the Henderson-Hasselbalch equation used for?",
    "a": "To determine ionization state of <b>weak acids</b>/bases and predict distribution/trapping."
  },
  {
    "q": "Ionization of <b>weak acids</b> in alkaline environment?",
    "a": "More ionized (A⁻) → trapped in alkaline urine (e.g., <b>aspirin</b> overdose → alkalinize urine)."
  },
  {
    "q": "Ionization of <b>weak bases</b> in acidic environment?",
    "a": "More ionized (BH⁺) → trapped in acidic urine (e.g., amphetamine overdose)."
  },
  {
    "q": "What is the blood-brain barrier permeability rule?",
    "a": "Lipid-soluble, non-ionized, low molecular weight drugs cross more easily."
  },
  {
    "q": "What is receptor reserve?",
    "a": "Maximal response can be achieved with only partial receptor occupancy (spare receptors)."
  },
  {
    "q": "What is efficacy?",
    "a": "Maximal effect a drug can produce (Emax), independent of dose."
  },
  {
    "q": "What is potency?",
    "a": "Dose required to produce 50% of maximal effect (EC50). Lower EC50 = higher potency."
  },
  {
    "q": "Full agonist vs partial agonist on log dose-response curve?",
    "a": "Full agonist reaches 100% Emax. Partial agonist has lower Emax."
  },
  {
    "q": "Competitive antagonist effect on dose-response curve?",
    "a": "Shifts curve to the right (↑ EC50), no change in Emax."
  },
  {
    "q": "Non-competitive antagonist effect on dose-response curve?",
    "a": "Decreases Emax, no change or slight right shift in EC50."
  },
  {
    "q": "What is an <b>inverse agonist</b>?",
    "a": "Binds receptor and produces opposite effect of constitutive activity (e.g., some antihistamines at H1)."
  }
];
module.exports = { pharmacologyCards };
