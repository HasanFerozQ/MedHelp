-- Migration: Year 2 - Systemic Pharmacology MCQ Bank (PART 3: 141-210)
-- Date: 2026-04-25
-- Based on: Lippincott, Katzung, and Rang & Dale

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'systemic-pharmacology' LIMIT 1;

    -- 2. Prevent Duplicates by removing existing questions for this part
    DELETE FROM mcqs 
    WHERE topic_id = v_topic_id 
    AND question IN (
        'Which Class I antiarrhythmic is a Sodium Channel Blocker with strong affinity for activated/inactivated channels in ischemic tissue (Class IB)?',
        'Quinidine and Procainamide are Class IA antiarrhythmics that also have which significant side effect?',
        'Which Class IC antiarrhythmic is the most potent sodium channel blocker and is contraindicated in patients with structural heart disease (Post-MI)?',
        'Amiodarone is a Class III antiarrhythmic. What is its primary mechanism?',
        'Amiodarone contains iodine. Which of the following is a common side effect of long-term use?',
        'Which Class IV antiarrhythmic is a Calcium Channel Blocker specifically used to slow the heart rate in Atrial Fibrillation?',
        'Adenosine is the drug of choice for treating:',
        'What is the mechanism of action of Digoxin?',
        'Digoxin toxicity is worsened by which electrolyte abnormality?',
        'A patient on Digoxin sees \"yellow-green halos\" around lights. This indicates:',
        'Which drug is a \"Venodilator\" used in acute heart failure to reduce preload?',
        'Milrinone is used in acute heart failure. Its mechanism is:',
        'Which drug is an ARNI (Angiotensin Receptor-Neprilysin Inhibitor) used in chronic heart failure?',
        'The primary benefit of Beta Blockers in chronic heart failure is:',
        'Which drug is an SGLT2 inhibitor used in heart failure (even in non-diabetics) to reduce hospitalizations?',
        'What is the antidote for Digoxin toxicity?',
        'Which antiarrhythmic is associated with \"Cinchonism\" (tinnitus, headache, dizziness)?',
        'Which drug is used to treat \"Torsades de Pointes\"?',
        'Ivabradine is used in heart failure for patients with a high heart rate. It works by:',
        'Which statin is the most potent and often used in high-intensity therapy?',
        'What is the mechanism of Statins?',
        'A patient on a statin develops severe muscle pain and dark urine. What should be checked?',
        'Which lipid-lowering drug is known to cause significant \"Flushing\" mediated by prostaglandins?',
        'The mechanism of Ezetimibe is:',
        'Which class of drugs is best for lowering Triglycerides by activating PPAR-alpha?',
        'Benzodiazepines (e.g., Diazepam) act by:',
        'Barbiturates (e.g., Phenobarbital) differ from Benzodiazepines because they:',
        'What is the antidote for Benzodiazepine overdose?',
        'Which Benzodiazepine is preferred for status epilepticus due to its long-acting profile?',
        'Buspirone is used for General Anxiety Disorder (GAD) and is unique because it:',
        'The \"Z-drugs\" (Zolpidem, Zaleplon) are used for:',
        'Ramelteon is a sedative used for insomnia that acts as a:',
        'Which drug is a competitive Orexin receptor antagonist used for insomnia?',
        'Phenobarbital is used in infants with neonatal jaundice because it:',
        'Which IV anesthetic is known for causing \"Dissociative Anesthesia\" and can cause vivid dreams/hallucinations?',
        'Propofol is the most common IV induction agent. Its major side effect is:',
        'Which inhaled anesthetic has the lowest Blood:Gas partition coefficient, leading to the fastest onset and recovery?',
        'What is \"Minimum Alveolar Concentration\" (MAC)?',
        'Halothane is rarely used now due to the risk of:',
        'Nitrous Oxide is unique among inhaled anesthetics because it:',
        'Which class of antidepressants is first-line for most depression and anxiety disorders?',
        'Fluoxetine differs from other SSRIs because it has:',
        'A patient on an SSRI takes a "St. John''s Wort" supplement and develops hyperthermia, muscle rigidity, and diarrhea. Diagnosis?',
        'Tricyclic Antidepressants (TCAs like Amitriptyline) are dangerous in overdose primarily due to:',
        'A patient taking an MAO inhibitor (e.g., Phenelzine) eats aged cheese and wine and develops a hypertensive crisis. This is the:',
        'Which antidepressant is also used for smoking cessation and lacks sexual side effects?',
        'Which antidepressant is a highly sedative H1 antagonist used for depression with insomnia?',
        'Trazodone is used for insomnia but can cause which rare, painful emergency?',
        'What is the primary mechanism of \"Typical\" Antipsychotics (e.g., Haloperidol)?',
        'Extrapyramidal Symptoms (EPS) like acute dystonia and parkinsonism are side effects of which drug class?',
        'Which drug is used to treat \"Tardive Dyskinesia\"?',
        'Clozapine is an \"Atypical\" antipsychotic. What is its most dangerous side effect requiring regular blood monitoring?',
        'Atypical antipsychotics (e.g., Olanzapine, Quetiapine) differ from typicals because they have:',
        'Lithium is the first-line treatment for Bipolar Disorder. What is its therapeutic window?',
        'Which of the following is a symptom of Lithium toxicity?',
        'Lithium can cause which endocrine abnormality?',
        'What is the \"Neuroleptic Malignant Syndrome\" (NMS)?',
        'Which drug is used to treat NMS?',
        'A patient on Valproate for epilepsy becomes pregnant. What is the major risk to the fetus?',
        'Which anticonvulsant is known to cause \"Gingival Hyperplasia\" and hirsutism?',
        'Carbamazepine is the drug of choice for:',
        'Ethosuximide is used specifically for which type of seizure?',
        'What is a potentially fatal skin reaction (Stevens-Johnson Syndrome) associated with Lamotrigine?',
        'Which drug is used for Parkinson''s Disease and is a precursor that crosses the BBB?',
        'Why is Carbidopa given with Levodopa?'
    );

    -- SECTION 7: ANTIARRHYTHMICS & HEART FAILURE (141-165)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which Class I antiarrhythmic is a Sodium Channel Blocker with strong affinity for activated/inactivated channels in ischemic tissue (Class IB)?', '["Procainamide", "Lidocaine", "Flecainide", "Quinidine"]', 1, 'Lidocaine (IB) binds and dissociates rapidly; it is selective for ischemic myocardium (Post-MI arrhythmias).'),
    (v_topic_id, 'Quinidine and Procainamide are Class IA antiarrhythmics that also have which significant side effect?', '["QT prolongation and Torsades de Pointes", "Bradycardia only", "Hypertension", "Hyperkalemia"]', 0, 'Class IA and Class III drugs prolong the action potential duration, increasing the risk of Torsades.'),
    (v_topic_id, 'Which Class IC antiarrhythmic is the most potent sodium channel blocker and is contraindicated in patients with structural heart disease (Post-MI)?', '["Lidocaine", "Mexiletine", "Flecainide", "Amiodarone"]', 2, 'Flecainide (IC) slows conduction significantly and can be pro-arrhythmic in damaged hearts (CAST trial).'),
    (v_topic_id, 'Amiodarone is a Class III antiarrhythmic. What is its primary mechanism?', '["Sodium channel block", "Potassium channel block", "Calcium channel block", "Beta block"]', 1, 'Class III drugs prolong Phase 3 repolarization by blocking K+ channels.'),
    (v_topic_id, 'Amiodarone contains iodine. Which of the following is a common side effect of long-term use?', '["Pulmonary fibrosis", "Thyroid dysfunction (hypo or hyper)", "Blue-gray skin discoloration", "All of the above"]', 3, 'Amiodarone has a very broad side effect profile due to its long half-life and tissue accumulation.'),
    (v_topic_id, 'Which Class IV antiarrhythmic is a Calcium Channel Blocker specifically used to slow the heart rate in Atrial Fibrillation?', '["Amlodipine", "Nifedipine", "Verapamil", "Lidocaine"]', 2, 'Non-dihydropyridines (Verapamil/Diltiazem) act on the SA and AV nodes.'),
    (v_topic_id, 'Adenosine is the drug of choice for treating:', '["Ventricular Fibrillation", "Paroxysmal Supraventricular Tachycardia (PSVT)", "Bradycardia", "Atrial Flutter"]', 1, 'Adenosine causes a transient "heart block" by opening K+ channels and hyperpolarizing the AV node.'),
    (v_topic_id, 'What is the mechanism of action of Digoxin?', '["Inhibition of Na+/K+ ATPase", "Stimulation of Adenylyl Cyclase", "Inhibition of Phosphodiesterase III", "Calcium channel block"]', 0, 'Inhibition of the pump increases intracellular Na+, which slows the Na+/Ca2+ exchanger, leading to higher intracellular Ca2+ and increased contractility.'),
    (v_topic_id, 'Digoxin toxicity is worsened by which electrolyte abnormality?', '["Hyperkalemia", "Hypokalemia", "Hypercalcemia", "Hypernatremia"]', 1, 'Low K+ allows more Digoxin to bind to the Na+/K+ ATPase pump.'),
    (v_topic_id, 'A patient on Digoxin sees "yellow-green halos" around lights. This indicates:', '["Normal drug effect", "Toxicity", "Allergic reaction", "Vitamin deficiency"]', 1, 'Xanthopsia (yellow vision) is a classic sign of digitalis toxicity.'),
    (v_topic_id, 'Which drug is a "Venodilator" used in acute heart failure to reduce preload?', '["Hydralazine", "Nitroglycerin", "Furosemide", "Dobutamine"]', 1, 'Nitroglycerin/Nitrates primarily reduce preload.'),
    (v_topic_id, 'Milrinone is used in acute heart failure. Its mechanism is:', '["Beta agonist", "Phosphodiesterase III (PDE3) inhibitor", "Na+/K+ ATPase inhibitor", "ACE inhibitor"]', 1, 'Inhibition of PDE3 increases cAMP in the heart (inotropy) and vessels (vasodilation - "inodilator").'),
    (v_topic_id, 'Which drug is an ARNI (Angiotensin Receptor-Neprilysin Inhibitor) used in chronic heart failure?', '["Sacubitril/Valsartan", "Lisinopril", "Losartan", "Spironolactone"]', 0, 'Sacubitril inhibits neprilysin, preventing the breakdown of beneficial natriuretic peptides (BNP).'),
    (v_topic_id, 'The primary benefit of Beta Blockers in chronic heart failure is:', '["Increasing HR", "Inhibiting remodeling and protecting against catecholamine toxicity", "Direct inotropy", "Increasing BP"]', 1, 'Beta blockers slow the heart and reduce the pathological remodeling driven by the sympathetic nervous system.'),
    (v_topic_id, 'Which drug is an SGLT2 inhibitor used in heart failure (even in non-diabetics) to reduce hospitalizations?', '["Metformin", "Dapagliflozin", "Sitagliptin", "Pioglitazone"]', 1, 'SGLT2 inhibitors (Flozins) have shown significant cardiovascular benefits.'),
    (v_topic_id, 'What is the antidote for Digoxin toxicity?', '["Atropine", "Digoxin Immune Fab (Digibind)", "Calcium Gluconate", "Potassium"]', 1, 'Digibind is an antibody fragment that binds and neutralizes Digoxin.'),
    (v_topic_id, 'Which antiarrhythmic is associated with "Cinchonism" (tinnitus, headache, dizziness)?', '["Quinidine", "Procainamide", "Lidocaine", "Amiodarone"]', 0, 'Quinidine is derived from cinchona bark.'),
    (v_topic_id, 'Which drug is used to treat "Torsades de Pointes"?', '["Calcium", "Magnesium Sulfate", "Potassium", "Sodium"]', 1, 'IV Magnesium is the treatment of choice for drug-induced QT prolongation/Torsades.'),
    (v_topic_id, 'Ivabradine is used in heart failure for patients with a high heart rate. It works by:', '["Blocking Calcium channels", "Blocking Beta receptors", "Inhibiting the \"funny\" current (If) in the SA node", "Inhibiting ACE"]', 2, 'Ivabradine reduces HR without affecting contractility.'),
    (v_topic_id, 'Which statin is the most potent and often used in high-intensity therapy?', '["Simvastatin", "Atorvastatin", "Pravastatin", "Lovastatin"]', 1, 'Atorvastatin and Rosuvastatin are the most potent.'),
    (v_topic_id, 'What is the mechanism of Statins?', '["Inhibition of HMG-CoA reductase", "Inhibition of Lipoprotein Lipase", "Binding to Bile Acids", "Activation of PPAR-alpha"]', 0, 'Statins inhibit the rate-limiting step in cholesterol synthesis.'),
    (v_topic_id, 'A patient on a statin develops severe muscle pain and dark urine. What should be checked?', '["AST/ALT", "Creatine Kinase (CK)", "BUN/Creatinine", "Glucose"]', 1, 'Rhabdomyolysis is a rare but severe side effect; elevated CK and myoglobinuria are markers.'),
    (v_topic_id, 'Which lipid-lowering drug is known to cause significant "Flushing" mediated by prostaglandins?', '["Statins", "Niacin", "Ezetimibe", "Gemfibrozil"]', 1, 'Niacin (Vitamin B3) causes flushing, which can be reduced by taking Aspirin 30 mins before.'),
    (v_topic_id, 'The mechanism of Ezetimibe is:', '["Inhibition of HMG-CoA reductase", "Inhibition of cholesterol absorption in the small intestine", "Upregulation of LDL receptors", "Binding to bile acids"]', 1, 'Ezetimibe targets the NPC1L1 transporter in the gut.'),
    (v_topic_id, 'Which class of drugs is best for lowering Triglycerides by activating PPAR-alpha?', '["Statins", "Fibrates", "Bile Acid Sequestrants", "PCSK9 Inhibitors"]', 1, 'Fibrates (e.g., Gemfibrozil, Fenofibrate) are the drug of choice for severe hypertriglyceridemia.'),

    -- SECTION 8: CNS PHARMACOLOGY - ANXIOLYTICS & SEDATIVES (166-185)
    (v_topic_id, 'Benzodiazepines (e.g., Diazepam) act by:', '["Directly opening GABA channels", "Increasing the FREQUENCY of GABA-A channel opening", "Increasing the DURATION of GABA-A channel opening", "Inhibiting GABA reuptake"]', 1, 'BZDs are positive allosteric modulators; they require GABA to be present.'),
    (v_topic_id, 'Barbiturates (e.g., Phenobarbital) differ from Benzodiazepines because they:', '["Are safer", "Increase the DURATION of GABA-A channel opening", "Have a specific antidote", "Do not cause respiratory depression"]', 1, 'Barbiturates are more dangerous because they can open the channel even without GABA at high doses.'),
    (v_topic_id, 'What is the antidote for Benzodiazepine overdose?', '["Naloxone", "Flumazenil", "Physostigmine", "Atropine"]', 1, 'Flumazenil is a competitive antagonist at the BZD binding site.'),
    (v_topic_id, 'Which Benzodiazepine is preferred for status epilepticus due to its long-acting profile?', '["Midazolam", "Lorazepam", "Triazolam", "Alprazolam"]', 1, 'Lorazepam and Diazepam are first-line for active seizures.'),
    (v_topic_id, 'Buspirone is used for General Anxiety Disorder (GAD) and is unique because it:', '["Is a GABA agonist", "Has no sedative or addictive properties", "Works immediately", "Is a beta blocker"]', 1, 'Buspirone is a 5-HT1A partial agonist; it takes 1-2 weeks to work but lacks abuse potential.'),
    (v_topic_id, 'The \"Z-drugs\" (Zolpidem, Zaleplon) are used for:', '["Anxiety", "Insomnia", "Seizures", "Anesthesia"]', 1, 'They are selective for the BZ1 receptor subtype and have less effect on sleep architecture.'),
    (v_topic_id, 'Ramelteon is a sedative used for insomnia that acts as a:', '["GABA agonist", "Melatonin receptor agonist", "Histamine blocker", "Orexin antagonist"]', 1, 'Ramelteon mimics melatonin in the suprachiasmatic nucleus.'),
    (v_topic_id, 'Which drug is a competitive Orexin receptor antagonist used for insomnia?', '["Suvorexant", "Zolpidem", "Diphenhydramine", "Trazodone"]', 0, 'Orexin (hypocretin) promotes wakefulness; Suvorexant blocks this signal.'),
    (v_topic_id, 'Phenobarbital is used in infants with neonatal jaundice because it:', '["Increases bile production", "Induces glucuronyl transferase (Phase II enzyme)", "Binds to bilirubin", "Increases excretion"]', 1, 'Induction of hepatic enzymes helps conjugate bilirubin.'),
    (v_topic_id, 'Which IV anesthetic is known for causing "Dissociative Anesthesia" and can cause vivid dreams/hallucinations?', '["Propofol", "Ketamine", "Etomidate", "Thiopental"]', 1, 'Ketamine is an NMDA antagonist; it provides analgesia and amnesia but the patient may appear awake.'),
    (v_topic_id, 'Propofol is the most common IV induction agent. Its major side effect is:', '["Hypertension", "Hypotension and respiratory depression", "Seizures", "Malignant hyperthermia"]', 1, 'Propofol is a potent vasodilator and respiratory depressant.'),
    (v_topic_id, 'Which inhaled anesthetic has the lowest Blood:Gas partition coefficient, leading to the fastest onset and recovery?', '["Halothane", "Nitrous Oxide", "Isoflurane", "Sevoflurane"]', 1, 'Low solubility in blood = rapid equilibrium with the brain.'),
    (v_topic_id, 'What is "Minimum Alveolar Concentration" (MAC)?', '["The dose that causes 100% anesthesia", "The concentration that prevents movement in 50% of patients", "The toxic dose", "The concentration in the blood"]', 1, 'MAC is a measure of potency; 1/MAC is potency.'),
    (v_topic_id, 'Halothane is rarely used now due to the risk of:', '["Renal failure", "Halothane Hepatitis (fulminant hepatic necrosis)", "Blindness", "Pancreatitis"]', 1, 'Halothane can cause severe, idiosyncratic liver damage.'),
    (v_topic_id, 'Nitrous Oxide is unique among inhaled anesthetics because it:', '["Is very potent (low MAC)", "Provides significant analgesia", "Causes severe respiratory depression", "Is a liquid at room temperature"]', 1, 'N2O is a gas with high MAC (low potency) but good analgesic properties.'),

    -- SECTION 9: CNS - ANTIDEPRESSANTS & ANTIPSYCHOTICS (186-210)
    (v_topic_id, 'Which class of antidepressants is first-line for most depression and anxiety disorders?', '["TCAs", "MAOIs", "SSRIs", "SNRIs"]', 2, 'Selective Serotonin Reuptake Inhibitors (e.g., Fluoxetine, Sertraline) have the best safety profile.'),
    (v_topic_id, 'Fluoxetine differs from other SSRIs because it has:', '["The shortest half-life", "The longest half-life (and active metabolite)", "No side effects", "A specific antidote"]', 1, 'Fluoxetine lasts for weeks after discontinuation.'),
    (v_topic_id, 'A patient on an SSRI takes a "St. John''s Wort" supplement and develops hyperthermia, muscle rigidity, and diarrhea. Diagnosis?', '["Neuroleptic Malignant Syndrome", "Serotonin Syndrome", "Anticholinergic Toxicity", "Hypertensive Crisis"]', 1, 'Excessive serotonin (often from multiple agents) leads to this life-threatening triad.'),
    (v_topic_id, 'Tricyclic Antidepressants (TCAs like Amitriptyline) are dangerous in overdose primarily due to:', '["Liver failure", "Cardiotoxicity (arrhythmias via Na+ channel block)", "Kidney failure", "Seizures only"]', 1, 'The "3 Cs" of TCAs: Coma, Convulsions, Cardiotoxicity.'),
    (v_topic_id, 'A patient taking an MAO inhibitor (e.g., Phenelzine) eats aged cheese and wine and develops a hypertensive crisis. This is the:', '["Serotonin syndrome", "Tyramine \"cheese\" effect", "Withdrawal syndrome", "Allergic reaction"]', 1, 'MAO-A normally breaks down tyramine; if blocked, tyramine causes massive NE release.'),
    (v_topic_id, 'Which antidepressant is also used for smoking cessation and lacks sexual side effects?', '["Bupropion", "Venlafaxine", "Mirtazapine", "Paroxetine"]', 0, 'Bupropion inhibits NE and Dopamine reuptake.'),
    (v_topic_id, 'Which antidepressant is a highly sedative H1 antagonist used for depression with insomnia?', '["Fluoxetine", "Mirtazapine", "Duloxetine", "Sertraline"]', 1, 'Mirtazapine is an alpha-2 antagonist that increases 5-HT/NE and is a potent antihistamine.'),
    (v_topic_id, 'Trazodone is used for insomnia but can cause which rare, painful emergency?', '["Gout", "Priapism", "Seizures", "Glaucoma"]', 1, 'Trazodone is known for "Traz-o-bone" (priapism).'),
    (v_topic_id, 'What is the primary mechanism of "Typical" Antipsychotics (e.g., Haloperidol)?', '["5-HT2A block", "Strong D2 receptor block", "D4 block", "GABA activation"]', 1, 'Typical neuroleptics are potent dopamine D2 antagonists.'),
    (v_topic_id, 'Extrapyramidal Symptoms (EPS) like acute dystonia and parkinsonism are side effects of which drug class?', '["SSRIs", "Typical Antipsychotics", "Lithium", "Benzodiazepines"]', 1, 'Blocking dopamine in the nigrostriatal pathway leads to movement disorders.'),
    (v_topic_id, 'Which drug is used to treat "Tardive Dyskinesia"?', '["Haloperidol", "Valbenazine", "Propranolol", "Benztropine"]', 1, 'VMAT2 inhibitors like Valbenazine/Deutetrabenazine are used for TD.'),
    (v_topic_id, 'Clozapine is an "Atypical" antipsychotic. What is its most dangerous side effect requiring regular blood monitoring?', '["Weight gain", "Agranulocytosis", "Seizures", "Myocarditis"]', 1, 'Clozapine can cause life-threatening bone marrow suppression (low WBC count).'),
    (v_topic_id, 'Atypical antipsychotics (e.g., Olanzapine, Quetiapine) differ from typicals because they have:', '["Stronger D2 block", "5-HT2A antagonism and lower D2 affinity", "No metabolic side effects", "No risk of NMS"]', 1, 'This profile reduces EPS but increases metabolic side effects (weight gain, diabetes).'),
    (v_topic_id, 'Lithium is the first-line treatment for Bipolar Disorder. What is its therapeutic window?', '["Very wide", "Very narrow (0.6 - 1.2 mEq/L)", "It has no toxicity", "Only toxic at high doses"]', 1, 'Lithium levels must be monitored closely to avoid neurotoxicity and renal damage.'),
    (v_topic_id, 'Which of the following is a symptom of Lithium toxicity?', '["Tremor, ataxia, and confusion", "Tachycardia", "Constipation", "Insomnia"]', 0, 'Coarse tremor and CNS signs are early warnings of toxicity.'),
    (v_topic_id, 'Lithium can cause which endocrine abnormality?', '["Hyperthyroidism", "Hypothyroidism and Nephrogenic Diabetes Insipidus", "Cushing syndrome", "Adrenal insufficiency"]', 1, 'Lithium interferes with TSH signaling and ADH effect in the kidney.'),
    (v_topic_id, 'What is the "Neuroleptic Malignant Syndrome" (NMS)?', '["Serotonin excess", "Severe D2 block causing \"lead-pipe\" rigidity, hyperthermia, and autonomic instability", "Allergy to penicillin", "Malignant hyperthermia during surgery"]', 1, 'NMS is caused by antipsychotics; Malignant Hyperthermia is caused by anesthetics.'),
    (v_topic_id, 'Which drug is used to treat NMS?', '["Atropine", "Dantrolene or Bromocriptine", "Naloxone", "Flumazenil"]', 1, 'Bromocriptine (dopamine agonist) and Dantrolene (muscle relaxant) are used.'),
    (v_topic_id, 'A patient on Valproate for epilepsy becomes pregnant. What is the major risk to the fetus?', '["Fetal Hydantoin Syndrome", "Neural Tube Defects (Spina Bifida)", "Grey Baby Syndrome", "Yellow teeth"]', 1, 'Valproate inhibits folate metabolism, leading to NTDs.'),
    (v_topic_id, 'Which anticonvulsant is known to cause "Gingival Hyperplasia" and hirsutism?', '["Phenobarbital", "Phenytoin", "Carbamazepine", "Ethosuximide"]', 1, 'Phenytoin has several "cosmetic" side effects.'),
    (v_topic_id, 'Carbamazepine is the drug of choice for:', '["Absence seizures", "Trigeminal Neuralgia", "Myoclonic seizures", "Status epilepticus"]', 1, 'Carbamazepine is excellent for neuropathic pain and focal seizures.'),
    (v_topic_id, 'Ethosuximide is used specifically for which type of seizure?', '["Tonic-clonic", "Absence (Petit Mal)", "Status epilepticus", "Complex partial"]', 1, 'Ethosuximide blocks T-type calcium channels in the thalamus.'),
    (v_topic_id, 'What is a potentially fatal skin reaction (Stevens-Johnson Syndrome) associated with Lamotrigine?', '["Urticaria", "Toxic Epidermal Necrolysis (TEN)", "Acne", "Psoriasis"]', 1, 'Lamotrigine must be titrated slowly to reduce the risk of SJS/TEN.'),
    (v_topic_id, 'Which drug is used for Parkinson''s Disease and is a precursor that crosses the BBB?', '["Dopamine", "Levodopa", "Carbidopa", "Selegiline"]', 1, 'Dopamine itself does not cross the BBB. Levodopa does.'),
    (v_topic_id, 'Why is Carbidopa given with Levodopa?', '["To increase dopamine in the heart", "To inhibit peripheral DDC and increase Levodopa entry into the brain", "To reduce tremors", "To block MAO"]', 1, 'Carbidopa prevents the peripheral breakdown of Levodopa, reducing side effects like nausea/arrhythmias.');

    RAISE NOTICE 'SUCCESS: Systemic Pharmacology MCQ Part 3 (141-210) registered.';
END $$;

COMMIT;
