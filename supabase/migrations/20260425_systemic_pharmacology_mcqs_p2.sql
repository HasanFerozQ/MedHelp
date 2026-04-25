-- Migration: Year 2 - Systemic Pharmacology MCQ Bank (PART 2: 71-140)
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
        'Which drug is a non-selective, irreversible alpha-receptor antagonist used in the preoperative management of Pheochromocytoma?',
        'Phentolamine is used to diagnose Pheochromocytoma and treat hypertensive crises. It is a:',
        'Which selective alpha-1 antagonist is used to treat benign prostatic hyperplasia (BPH) by relaxing the smooth muscle of the bladder neck and prostate?',
        'What is the \"First-dose phenomenon\" associated with Prazosin?',
        'Which drug is a selective Alpha-2 antagonist (though clinical use is rare)?',
        'Which of the following is a Non-selective Beta Blocker (B1 and B2)?',
        'Selective Beta-1 blockers (e.g., Metoprolol, Atenolol) are preferred in patients with:',
        'Which Beta Blocker has a very short half-life (minutes) and is given IV for acute arrhythmia control during surgery?',
        'Which drugs are combined Alpha and Beta blockers used to treat hypertensive emergencies and heart failure?',
        'Which Beta Blocker has \"Intrinsic Sympathomimetic Activity\" (ISA) and is useful in patients who develop severe bradycardia with other blockers?',
        'Why are Beta Blockers contraindicated in patients with \"Prinzmetal\" (variant) Angina?',
        'What is the effect of Beta Blockers on the symptoms of Hypoglycemia in diabetics?',
        'Which Beta Blocker is specifically used topically to treat Open-Angle Glaucoma?',
        'Sudden withdrawal of Beta Blockers after chronic use can cause:',
        'Which drug is a Beta Blocker that also has Class III antiarrhythmic properties (blocks K+ channels)?',
        'Carvedilol is a mainstay in the treatment of chronic Heart Failure because it:',
        'Beta blockers reduce blood pressure primarily by:',
        'Which of the following describes \"Cardioselectivity\" in beta blockers?',
        'Propranolol is used to treat \"Stage Fright\" because it:',
        'Which beta blocker is used to treat hyperthyroidism/thyroid storm?',
        'Which class of drugs is the first-line treatment for hypertension in a diabetic patient with albuminuria?',
        'What is the most common side effect of ACE Inhibitors (e.g., Lisinopril) that often leads to switching to an ARB?',
        'Which Calcium Channel Blocker (CCB) is \"Dihydropyridine\" and acts primarily on peripheral blood vessels?',
        'What is the primary mechanism of action of Nitroglycerin in relieving Angina?',
        'A patient taking Nitroglycerin develops a severe headache and \"Monday Disease\" tolerance. These are due to:',
        'Which drug is a \"Renin Inhibitor\" used for hypertension?',
        'Hydralazine is a direct vasodilator that primarily targets:',
        'What is the life-threatening side effect associated with ACE Inhibitors?',
        'Which CCB is used to prevent cerebral vasospasm following a subarachnoid hemorrhage?',
        'Verapamil is most likely to cause which of the following side effects?',
        'Why should Nitrates NOT be taken with Sildenafil (Viagra)?',
        'Sodium Nitroprusside is used in hypertensive emergencies. What toxic byproduct can accumulate during its infusion?',
        'What is the \"Coronary Steal\" phenomenon associated with certain vasodilators like Dipyridamole?',
        'Which antihypertensive drug is known to cause a \"Lupus-like syndrome\"?',
        'What is the drug of choice for hypertension in pregnancy?',
        'The mechanism of action of ARBs (e.g., Losartan) is:',
        'Which side effect is common to both ACEIs and Spironolactone?',
        'Minoxidil causes hair growth (Rogaine) but as an oral antihypertensive, it can cause:',
        'Which nitrate has the highest oral bioavailability and is used for maintenance therapy?',
        'Fenoldopam is used in hypertensive emergencies. It acts as a:',
        'Where in the nephron do \"Loop Diuretics\" (e.g., Furosemide) act?',
        'Thiazide diuretics (e.g., Hydrochlorothiazide) act on which transporter?',
        'Which diuretic is the first-line treatment for high intracranial pressure?',
        'Acetazolamide acts in the proximal tubule by inhibiting:',
        'Which of the following is a \"Potassium-Sparing\" diuretic that directly blocks ENaC channels in the collecting duct?',
        'Loop diuretics are known to cause which electrolyte abnormality?',
        'What is the \"Ototoxicity\" risk associated with Loop Diuretics?',
        'Thiazide diuretics are unique because they increase the reabsorption of:',
        'Which diuretic is specifically indicated for heart failure with reduced ejection fraction (HFrEF) to improve survival?',
        'Spironolactone can cause which endocrine side effect in males?',
        'Which diuretic is used to treat Mountain Sickness?',
        'Eplerenone is preferred over Spironolactone in some patients because it:',
        'What is the risk of combining an ACE Inhibitor with Amiloride?',
        'The \"High Ceiling\" diuretics refers to:',
        'Which electrolyte profile is characteristic of Thiazide use?',
        'Patients with a Sulfa allergy may react to which of the following?',
        'Ethacrynic acid is used for patients who:',
        'Diabetes Insipidus (Nephrogenic) is ironically treated with:',
        'Conivaptan and Tolvaptan are diuretics that act as:',
        'Which diuretic can cause a Metabolic Acidosis?'
    );

    -- SECTION 4: ADRENERGIC ANTAGONISTS (71-90)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which drug is a non-selective, irreversible alpha-receptor antagonist used in the preoperative management of Pheochromocytoma?', '["Phentolamine", "Phenoxybenzamine", "Prazosin", "Doxazosin"]', 1, 'Phenoxybenzamine binds covalently to alpha receptors, preventing the hypertensive crisis caused by catecholamine release during tumor manipulation.'),
    (v_topic_id, 'Phentolamine is used to diagnose Pheochromocytoma and treat hypertensive crises. It is a:', '["Non-selective, reversible alpha antagonist", "Selective alpha-1 antagonist", "Selective alpha-2 antagonist", "Irreversible alpha antagonist"]', 0, 'Phentolamine is reversible and non-selective.'),
    (v_topic_id, 'Which selective alpha-1 antagonist is used to treat benign prostatic hyperplasia (BPH) by relaxing the smooth muscle of the bladder neck and prostate?', '["Tamsulosin", "Propranolol", "Yohimbine", "Atenolol"]', 0, 'Tamsulosin is selective for alpha-1A receptors found in the prostate.'),
    (v_topic_id, 'What is the \"First-dose phenomenon\" associated with Prazosin?', '["Sudden tachycardia", "Severe orthostatic hypotension and syncope", "Hypertensive urgency", "Allergic reaction"]', 1, 'Alpha-1 blockers can cause a dramatic drop in BP upon the first dose; it should be taken at bedtime.'),
    (v_topic_id, 'Which drug is a selective Alpha-2 antagonist (though clinical use is rare)?', '["Yohimbine", "Clonidine", "Doxazosin", "Labetalol"]', 0, 'Yohimbine blocks alpha-2 receptors, potentially increasing sympathetic outflow.'),
    (v_topic_id, 'Which of the following is a Non-selective Beta Blocker (B1 and B2)?', '["Atenolol", "Metoprolol", "Propranolol", "Esmolol"]', 2, 'Propranolol blocks both B1 and B2 receptors.'),
    (v_topic_id, 'Selective Beta-1 blockers (e.g., Metoprolol, Atenolol) are preferred in patients with:', '["Hypertension and Asthma", "Hypertension and Bradycardia", "Heart failure and AV block", "Diabetes and Hypoglycemia"]', 0, 'B1 selective blockers (cardioselective) are safer in asthmatics because they minimize B2-mediated bronchoconstriction.'),
    (v_topic_id, 'Which Beta Blocker has a very short half-life (minutes) and is given IV for acute arrhythmia control during surgery?', '["Esmolol", "Propranolol", "Nadolol", "Timolol"]', 0, 'Esmolol is rapidly metabolized by plasma esterases.'),
    (v_topic_id, 'Which drugs are combined Alpha and Beta blockers used to treat hypertensive emergencies and heart failure?', '["Labetalol and Carvedilol", "Metoprolol and Atenolol", "Pindolol and Acebutolol", "Propranolol and Timolol"]', 0, 'Labetalol and Carvedilol provide both peripheral vasodilation (alpha-1) and cardiac protection (beta).'),
    (v_topic_id, 'Which Beta Blocker has \"Intrinsic Sympathomimetic Activity\" (ISA) and is useful in patients who develop severe bradycardia with other blockers?', '["Pindolol", "Metoprolol", "Timolol", "Bisoprolol"]', 0, 'Pindolol and Acebutolol are partial agonists; they block the effect of high NE but provide a low-level stimulus.'),
    (v_topic_id, 'Why are Beta Blockers contraindicated in patients with \"Prinzmetal\" (variant) Angina?', '["They cause tachycardia", "They allow unopposed alpha-mediated coronary vasospasm", "They increase oxygen demand", "They cause hypotension"]', 1, 'Blocking B2 (vasodilation) leaves Alpha-1 (vasoconstriction) unopposed, worsening the spasm.'),
    (v_topic_id, 'What is the effect of Beta Blockers on the symptoms of Hypoglycemia in diabetics?', '["They worsen the hypoglycemia", "They mask the warning signs (tachycardia, tremor)", "They increase insulin sensitivity", "They prevent sweating"]', 1, 'Sweating is mediated by muscarinic receptors and is NOT masked, but the sympathetic "warning" signs are blocked.'),
    (v_topic_id, 'Which Beta Blocker is specifically used topically to treat Open-Angle Glaucoma?', '["Propranolol", "Timolol", "Atenolol", "Sotalol"]', 1, 'Timolol reduces aqueous humor production by the ciliary body.'),
    (v_topic_id, 'Sudden withdrawal of Beta Blockers after chronic use can cause:', '["Rebound hypertension and tachycardia", "Severe hypotension", "Drowsiness", "Weight gain"]', 0, 'Chronic block leads to up-regulation of receptors; sudden withdrawal allows excessive catecholamine stimulus.'),
    (v_topic_id, 'Which drug is a Beta Blocker that also has Class III antiarrhythmic properties (blocks K+ channels)?', '["Sotalol", "Esmolol", "Metoprolol", "Nadolol"]', 0, 'Sotalol is a non-selective beta blocker with potassium channel blocking activity.'),
    (v_topic_id, 'Carvedilol is a mainstay in the treatment of chronic Heart Failure because it:', '["Increases HR", "Reduces cardiac remodeling and mortality", "Increases renin", "Is a potent diuretic"]', 1, 'Along with Metoprolol and Bisoprolol, Carvedilol is proven to increase survival in HF patients.'),
    (v_topic_id, 'Beta blockers reduce blood pressure primarily by:', '["Reducing cardiac output and inhibiting renin release", "Direct peripheral vasodilation", "Increasing sodium excretion", "Blocking alpha-1 receptors"]', 0, 'The B1 block in the heart and the B1 block in the juxtaglomerular cells (renin) are the key mechanisms.'),
    (v_topic_id, 'Which of the following describes "Cardioselectivity" in beta blockers?', '["Higher affinity for B1 than B2", "Higher affinity for B2 than B1", "Inability to cross the BBB", "Lack of ISA"]', 0, 'Cardioselective = B1 selective.'),
    (v_topic_id, 'Propranolol is used to treat "Stage Fright" because it:', '["Is a strong sedative", "Blunts the peripheral sympathetic manifestations of anxiety", "Increases dopamine", "Blocks GABA"]', 1, 'It prevents the tachycardia and tremors associated with performance anxiety.'),
    (v_topic_id, 'Which beta blocker is used to treat hyperthyroidism/thyroid storm?', '["Propranolol", "Atenolol", "Metoprolol", "Esmolol"]', 0, 'Propranolol is preferred because it also inhibits the peripheral conversion of T4 to T3.'),

    -- SECTION 5: CARDIOVASCULAR PHARMACOLOGY - HTN & ANGINA (91-115)
    (v_topic_id, 'Which class of drugs is the first-line treatment for hypertension in a diabetic patient with albuminuria?', '["Calcium Channel Blockers", "ACE Inhibitors", "Beta Blockers", "Thiazide Diuretics"]', 1, 'ACEIs (and ARBs) are reno-protective in diabetics.'),
    (v_topic_id, 'What is the most common side effect of ACE Inhibitors (e.g., Lisinopril) that often leads to switching to an ARB?', '["Hypokalemia", "Dry Cough", "Hyperglycemia", "Constipation"]', 1, 'Cough is due to the accumulation of bradykinin (which ACE normally breaks down).'),
    (v_topic_id, 'Which Calcium Channel Blocker (CCB) is "Dihydropyridine" and acts primarily on peripheral blood vessels?', '["Verapamil", "Diltiazem", "Amlodipine", "Digoxin"]', 2, 'Amlodipine and Nifedipine are vasoselective; Verapamil is cardioselective.'),
    (v_topic_id, 'What is the primary mechanism of action of Nitroglycerin in relieving Angina?', '["Increasing heart rate", "Peripheral vasodilation (venodilation), reducing preload", "Increasing afterload", "Blocking beta receptors"]', 1, 'Nitrates are converted to Nitric Oxide, which relaxes venous smooth muscle, reducing the workload on the heart.'),
    (v_topic_id, 'A patient taking Nitroglycerin develops a severe headache and \"Monday Disease\" tolerance. These are due to:', '["Cerebral vasoconstriction", "Vessel dilation and depletion of sulfhydryl groups", "Allergy", "Serotonin syndrome"]', 1, 'Headache is due to meningeal vasodilation. Tolerance requires a nitrate-free interval.'),
    (v_topic_id, 'Which drug is a "Renin Inhibitor" used for hypertension?', '["Aliskiren", "Losartan", "Enalapril", "Spironolactone"]', 0, 'Aliskiren directly inhibits the enzyme renin.'),
    (v_topic_id, 'Hydralazine is a direct vasodilator that primarily targets:', '["Veins", "Arteries", "Both equally", "Capillaries"]', 1, 'Hydralazine causes arterial dilation, which can trigger reflex tachycardia.'),
    (v_topic_id, 'What is the life-threatening side effect associated with ACE Inhibitors?', '["Angioedema", "Liver failure", "Ototoxicity", "Gout"]', 0, 'Angioedema is a rare but serious swelling of the airway, also related to bradykinin.'),
    (v_topic_id, 'Which CCB is used to prevent cerebral vasospasm following a subarachnoid hemorrhage?', '["Amlodipine", "Nimodipine", "Verapamil", "Diltiazem"]', 1, 'Nimodipine has high lipid solubility and crosses the BBB to act on cerebral vessels.'),
    (v_topic_id, 'Verapamil is most likely to cause which of the following side effects?', '["Tachycardia", "Constipation", "Diarrhea", "Hyperkalemia"]', 1, 'Verapamil slows GI transit and can cause significant constipation.'),
    (v_topic_id, 'Why should Nitrates NOT be taken with Sildenafil (Viagra)?', '["They neutralize each other", "Risk of severe, fatal hypotension", "They cause priapism", "They increase heart rate"]', 1, 'Both increase cGMP; the synergistic effect causes extreme vasodilation.'),
    (v_topic_id, 'Sodium Nitroprusside is used in hypertensive emergencies. What toxic byproduct can accumulate during its infusion?', '["Methanol", "Cyanide", "Ammonia", "Lactic acid"]', 1, 'Nitroprusside contains 5 cyanide groups; it is treated with Sodium Thiosulfate or Hydroxocobalamin.'),
    (v_topic_id, 'What is the \"Coronary Steal\" phenomenon associated with certain vasodilators like Dipyridamole?', '["Increase in blood flow to ischemic areas", "Dilation of healthy vessels divert blood away from ischemic, maximally dilated areas", "Rupture of coronary arteries", "Blockage of veins"]', 1, 'This can worsen ischemia in patients with coronary artery disease.'),
    (v_topic_id, 'Which antihypertensive drug is known to cause a \"Lupus-like syndrome\"?', '["Hydralazine", "Propranolol", "Captopril", "Amlodipine"]', 0, 'Hydralazine (and Procainamide/Isoniazid) are associated with drug-induced SLE (anti-histone antibodies).'),
    (v_topic_id, 'What is the drug of choice for hypertension in pregnancy?', '["Enalapril", "Losartan", "Methyldopa", "Hydrochlorothiazide"]', 2, 'Methyldopa (and Labetalol/Hydralazine) are safe; ACEIs/ARBs are teratogenic (renal dysgenesis).'),
    (v_topic_id, 'The mechanism of action of ARBs (e.g., Losartan) is:', '["Inhibition of ACE", "Blockade of AT1 receptors", "Blockade of AT2 receptors", "Inhibition of aldosterone"]', 1, 'ARBs block the receptor itself, not the production of Angiotensin II.'),
    (v_topic_id, 'Which side effect is common to both ACEIs and Spironolactone?', '["Hypokalemia", "Hyperkalemia", "Hypernatremia", "Hypoglycemia"]', 1, 'Both reduce aldosterone effect, leading to potassium retention.'),
    (v_topic_id, 'Minoxidil causes hair growth (Rogaine) but as an oral antihypertensive, it can cause:', '["Bradycardia", "Severe reflex tachycardia and fluid retention", "Dry mouth", "Anemia"]', 1, 'Potent vasodilation triggers a massive sympathetic and RAAS response.'),
    (v_topic_id, 'Which nitrate has the highest oral bioavailability and is used for maintenance therapy?', '["Nitroglycerin", "Isosorbide mononitrate", "Isosorbide dinitrate", "Amyl nitrite"]', 1, 'Isosorbide mononitrate (ISMN) is 100% bioavailable and long-acting.'),
    (v_topic_id, 'Fenoldopam is used in hypertensive emergencies. It acts as a:', '["D1 agonist", "Alpha-1 antagonist", "Beta blocker", "V1 antagonist"]', 0, 'Fenoldopam causes peripheral vasodilation and improves renal perfusion.'),

    -- SECTION 6: RENAL PHARMACOLOGY - DIURETICS (116-140)
    (v_topic_id, 'Where in the nephron do "Loop Diuretics" (e.g., Furosemide) act?', '["Proximal Convoluted Tubule", "Thick Ascending Limb of Henle", "Distal Convoluted Tubule", "Collecting Duct"]', 1, 'Loop diuretics inhibit the Na+/K+/2Cl- cotransporter in the thick ascending limb.'),
    (v_topic_id, 'Thiazide diuretics (e.g., Hydrochlorothiazide) act on which transporter?', '["Na+/K+/2Cl-", "Na+/Cl- cotransporter", "Carbonic anhydrase", "Aldosterone receptor"]', 1, 'Thiazides act in the early distal convoluted tubule.'),
    (v_topic_id, 'Which diuretic is the first-line treatment for high intracranial pressure?', '["Furosemide", "Mannitol", "Acetazolamide", "Spironolactone"]', 1, 'Mannitol is an osmotic diuretic that draws water out of tissues into the vascular space.'),
    (v_topic_id, 'Acetazolamide acts in the proximal tubule by inhibiting:', '["Na+/K+ ATPase", "Carbonic anhydrase", "Aquaporins", "ENaC channels"]', 1, 'Carbonic anhydrase inhibition leads to bicarbonate loss and alkaline urine.'),
    (v_topic_id, 'Which of the following is a "Potassium-Sparing" diuretic that directly blocks ENaC channels in the collecting duct?', '["Spironolactone", "Amiloride", "Hydrochlorothiazide", "Bumetanide"]', 1, 'Amiloride and Triamterene block ENaC. Spironolactone is an aldosterone antagonist.'),
    (v_topic_id, 'Loop diuretics are known to cause which electrolyte abnormality?', '["Hyperkalemia", "Hypokalemia and Hypocalcemia", "Hypercalcemia", "Hyponatremia only"]', 1, 'Loops cause loss of K+, H+, and Ca2+ ("Loops Lose Calcium").'),
    (v_topic_id, 'What is the "Ototoxicity" risk associated with Loop Diuretics?', '["Permanent blindness", "Reversible or permanent hearing loss", "Loss of taste", "Numbness"]', 1, 'High doses, especially with aminoglycosides, can damage the inner ear.'),
    (v_topic_id, 'Thiazide diuretics are unique because they increase the reabsorption of:', '["Sodium", "Potassium", "Calcium", "Bicarbonate"]', 2, 'Thiazides are used to prevent calcium stones because they reduce urinary calcium.'),
    (v_topic_id, 'Which diuretic is specifically indicated for heart failure with reduced ejection fraction (HFrEF) to improve survival?', '["Furosemide", "Spironolactone", "Acetazolamide", "Mannitol"]', 1, 'Aldosterone antagonists prevent cardiac fibrosis and remodeling.'),
    (v_topic_id, 'Spironolactone can cause which endocrine side effect in males?', '["Hirsutism", "Gynecomastia", "Testicular atrophy", "Increased libido"]', 1, 'Spironolactone has anti-androgenic effects (blocks testosterone receptors).'),
    (v_topic_id, 'Which diuretic is used to treat Mountain Sickness?', '["Mannitol", "Acetazolamide", "Chlorthalidone", "Indapamide"]', 1, 'Acetazolamide causes a metabolic acidosis that stimulates ventilation.'),
    (v_topic_id, 'Eplerenone is preferred over Spironolactone in some patients because it:', '["Is more potent", "Has fewer anti-androgenic side effects", "Is cheaper", "Acts faster"]', 1, 'Eplerenone is highly selective for the mineralocorticoid receptor.'),
    (v_topic_id, 'What is the risk of combining an ACE Inhibitor with Amiloride?', '["Severe hypokalemia", "Severe hyperkalemia", "Ototoxicity", "Renal stones"]', 1, 'Both increase potassium levels, risking life-threatening hyperkalemia.'),
    (v_topic_id, 'The \"High Ceiling\" diuretics refers to:', '["Thiazides", "Loop Diuretics", "Osmotic Diuretics", "Potassium-Sparing"]', 1, 'Loops have a very steep dose-response curve (maximal efficacy is very high).'),
    (v_topic_id, 'Which electrolyte profile is characteristic of Thiazide use?', '["Hypokalemia, Hyponatremia, Hypercalcemia, Hyperuricemia", "Hyperkalemia, Hyponatremia, Hypocalcemia", "Hypokalemia, Hypernatremia, Hypocalcemia", "Hyperkalemia, Hyperuricemia"]', 0, 'Thiazides cause "HyperGLUC": Glycemia, Lipidemia, Uricemia, Calcemia.'),
    (v_topic_id, 'Patients with a Sulfa allergy may react to which of the following?', '["Furosemide and Thiazides", "Ethacrynic acid", "Spironolactone", "Amiloride"]', 0, 'Most loops and thiazides are sulfonamide derivatives.'),
    (v_topic_id, 'Ethacrynic acid is used for patients who:', '["Have a sulfa allergy", "Have liver failure", "Are pregnant", "Need an osmotic diuretic"]', 0, 'Ethacrynic acid is the only non-sulfa loop diuretic.'),
    (v_topic_id, 'Diabetes Insipidus (Nephrogenic) is ironically treated with:', '["Thiazide diuretics", "Loop diuretics", "Mannitol", "Vasopressin"]', 0, 'Thiazides cause mild volume depletion, which increases proximal water reabsorption.'),
    (v_topic_id, 'Conivaptan and Tolvaptan are diuretics that act as:', '["Aldosterone antagonists", "Vasopressin (V2) receptor antagonists", "Sodium channel blockers", "Renin inhibitors"]', 1, 'They are "Vaptans" or aquaretics, used for SIADH.'),
    (v_topic_id, 'Which diuretic can cause a Metabolic Acidosis?', '["Furosemide", "Hydrochlorothiazide", "Acetazolamide", "Spironolactone"]', 2, 'Loss of bicarbonate (Acetazolamide) causes normal anion gap metabolic acidosis.');

    RAISE NOTICE 'SUCCESS: Systemic Pharmacology MCQ Part 2 (71-140) registered.';
END $$;

COMMIT;
