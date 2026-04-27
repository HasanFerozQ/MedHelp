-- Migration: Systemic Pharmacology Cases Part 1 (01-10) - FIXED SCHEMA V2
-- Goal: Cover Autonomic and Cardiovascular Pharmacology
-- Sources: Lippincott, Katzung, Rang & Dale

BEGIN;

-- 1. Ensure Topic "Systemic Pharmacology" exists for Year 2, Semester 3
INSERT INTO topics (title, slug, semester_id, year_id, "order", usmle_step)
VALUES ('Systemic Pharmacology', 'systemic-pharmacology', 3, 2, 45, NULL)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'systemic-pharmacology' LIMIT 1;

    -- DELETE EXISTING to avoid duplicates
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    -- CASE 01: Cholinergic Agonists (Pilocarpine/Glaucoma)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Sudden Eye Pain', 'A 60-year-old woman presents with sudden onset of severe eye pain, blurred vision, and seeing halos around lights. Her intraocular pressure is 50 mmHg. She is diagnosed with acute angle-closure glaucoma.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which cholinergic agonist is commonly used topically to treat this condition by causing miosis?', '["Atropine", "Pilocarpine", "Scopolamine", "Bethanechol"]', 1, 'Pilocarpine is a direct-acting cholinergic agonist (muscarinic) that causes miosis (pupillary constriction), which opens the drainage angle in the eye, reducing intraocular pressure.'),
    (v_case_id, 'What is the mechanism by which this drug lowers intraocular pressure?', '["Decreases aqueous humor production", "Increases outflow of aqueous humor via the Canal of Schlemm", "Causes mydriasis", "Inhibits carbonic anhydrase"]', 1, 'By causing miosis, pilocarpine pulls the iris away from the trabecular meshwork, facilitating the drainage of aqueous humor.'),
    (v_case_id, 'Which of the following is a potential systemic side effect of this drug?', '["Tachycardia", "Dry mouth", "Excessive sweating and salivation", "Constipation"]', 2, 'Pilocarpine is a muscarinic agonist; systemic absorption can cause "DUMBELS" symptoms, including diaphoresis (sweating) and sialorrhea (salivation).');

    -- CASE 02: Organophosphate Poisoning
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Pesticide Exposure', 'A 45-year-old farmer is brought to the ER after spraying his crops. He presents with pinpoint pupils, profuse sweating, wheezing, and muscle fasciculations.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely mechanism of his toxicity?', '["Direct muscarinic receptor stimulation", "Irreversible inhibition of acetylcholinesterase", "Blockade of nicotinic receptors", "Inhibition of norepinephrine reuptake"]', 1, 'Organophosphates (pesticides) irreversibly bind to and inhibit acetylcholinesterase, leading to a massive accumulation of acetylcholine at both muscarinic and nicotinic synapses.'),
    (v_case_id, 'Which medication should be given immediately to antagonize the muscarinic symptoms?', '["Neostigmine", "Atropine", "Propranolol", "Pilocarpine"]', 1, 'Atropine is a competitive muscarinic antagonist used to reverse life-threatening cholinergic symptoms like bradycardia and bronchorrhea.'),
    (v_case_id, 'Which agent can "regenerate" the acetylcholinesterase enzyme if given before "aging" occurs?', '["Pralidoxime (2-PAM)", "Physostigmine", "Edrophonium", "Naloxone"]', 0, 'Pralidoxime is a cholinesterase regenerator that can pull the organophosphate off the enzyme if administered early.');

    -- CASE 03: Atropine Overdose
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Red as a Beet', 'A child is brought to the ER after ingesting berries from a backyard plant. He is flushed, has dilated pupils, is tachycardic, and is acting delirious.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'These symptoms (Red as a beet, Dry as a bone, Blind as a bat, Mad as a hatter) are characteristic of:', '["Cholinergic toxicity", "Anticholinergic toxicity", "Beta-blocker overdose", "Opioid withdrawal"]', 1, 'These are classic signs of atropine (antimuscarinic) poisoning.'),
    (v_case_id, 'Which drug can be used as an antidote because it crosses the blood-brain barrier to reverse central symptoms?', '["Neostigmine", "Physostigmine", "Pyridostigmine", "Edrophonium"]', 1, 'Physostigmine is a tertiary amine acetylcholinesterase inhibitor that crosses the BBB, making it effective for central anticholinergic toxicity.'),
    (v_case_id, 'What is the effect of atropine on the heart?', '["Decreases heart rate by blocking M2 receptors", "Increases heart rate by blocking M2 receptors", "Decreases heart rate by stimulating M2 receptors", "No effect on the heart"]', 1, 'Atropine blocks M2 muscarinic receptors in the SA node, which normally slow the heart, thus resulting in tachycardia.');

    -- CASE 04: Beta-Blockers (Propranolol)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Asthma and Hypertension', 'A 50-year-old man with a history of asthma and hypertension is started on a new blood pressure medication. Two days later, he presents with severe wheezing and shortness of breath.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which medication was most likely started?', '["Amlodipine", "Lisinopril", "Propranolol", "Metoprolol"]', 2, 'Propranolol is a non-selective beta-blocker. Blocking Beta-2 receptors in the lungs can cause life-threatening bronchoconstriction in patients with asthma.'),
    (v_case_id, 'If a beta-blocker was necessary, which one would have been a safer choice for this patient?', '["Nadolol", "Timolol", "Atenolol", "Pindolol"]', 2, 'Atenolol and Metoprolol are cardioselective (Beta-1 selective) and are less likely to cause bronchospasm than non-selective agents.'),
    (v_case_id, 'What is the primary mechanism by which beta-blockers lower blood pressure in the long term?', '["Direct vasodilation", "Inhibition of renin release from the kidneys", "Blockade of alpha-1 receptors", "Increase in heart rate"]', 1, 'Beta-1 blockade in the juxtaglomerular apparatus of the kidney reduces renin secretion, leading to decreased Angiotensin II and Aldosterone levels.');

    -- CASE 05: Alpha-Blockers (Prazosin/BPH)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'First Dose Effect', 'An elderly man with Benign Prostatic Hyperplasia (BPH) is started on prazosin. After taking his first dose, he stands up to go to the bathroom and faints.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the cause of his fainting?', '["Arrhythmia", "Orthostatic hypotension (First-dose effect)", "Hypoglycemia", "Drug-induced stroke"]', 1, 'Alpha-1 blockers like prazosin cause significant vasodilation. The "first-dose effect" is an exaggerated orthostatic hypotensive response.'),
    (v_case_id, 'How do alpha-1 blockers help with BPH symptoms?', '["Shrink the size of the prostate", "Relax smooth muscle in the bladder neck and prostate", "Inhibit testosterone production", "Increase urine production"]', 1, 'Alpha-1 blockers relax the smooth muscle of the prostate and bladder neck, improving urine flow.'),
    (v_case_id, 'Which alpha-1 blocker is more "uroselective" for the prostate (Alpha-1A) and less likely to cause hypotension?', '["Doxazosin", "Terazosin", "Tamsulosin", "Phenoxybenzamine"]', 2, 'Tamsulosin selectively targets the Alpha-1A receptors found in the prostate, minimizing systemic vascular effects.');

    -- CASE 06: Hypertension (ACE Inhibitors)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Dry Cough', 'A 55-year-old woman started on lisinopril for hypertension returns to the clinic complaining of a persistent, dry, non-productive cough.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism responsible for this cough?', '["Direct irritation of the throat", "Accumulation of bradykinin and substance P in the lungs", "Fluid overload", "Increased renin levels"]', 1, 'ACE normally breaks down bradykinin. Inhibiting ACE leads to elevated bradykinin, which triggers the cough reflex.'),
    (v_case_id, 'What is a life-threatening, though rare, side effect of ACE inhibitors related to the same mechanism?', '["Hyperglycemia", "Angioedema", "Aplastic anemia", "Ototoxicity"]', 1, 'Angioedema (swelling of the face, tongue, or airway) is a serious risk with ACE inhibitors due to bradykinin accumulation.'),
    (v_case_id, 'If the patient cannot tolerate the cough, which class of drug is the best alternative that works on the same pathway but does not affect bradykinin?', '["Calcium Channel Blockers", "Angiotensin Receptor Blockers (ARBs)", "Thiazide diuretics", "Beta-blockers"]', 1, 'ARBs (like Losartan) block the AT1 receptor directly and do not inhibit the breakdown of bradykinin, thus they do not cause the dry cough.');

    -- CASE 07: Heart Failure (Digoxin)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Yellow Vision', 'A 75-year-old man with chronic heart failure and atrial fibrillation presents with nausea, vomiting, and "yellowish" vision (xanthopsia). His EKG shows a characteristically shortened QT and scooped ST segments.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of action of Digoxin?', '["Inhibition of the Na+/K+ ATPase pump", "Stimulation of Beta-1 receptors", "Inhibition of phosphodiesterase", "Blockade of calcium channels"]', 0, 'Digoxin inhibits the Na+/K+ ATPase, which indirectly increases intracellular calcium, leading to increased cardiac contractility (positive inotropy).'),
    (v_case_id, 'Which electrolyte abnormality significantly increases the risk of digoxin toxicity?', '["Hyperkalemia", "Hypokalemia", "Hypernatremia", "Hypocalcemia"]', 1, 'Digoxin competes with potassium for the Na+/K+ ATPase pump. Low potassium levels allow more digoxin to bind, increasing toxicity.'),
    (v_case_id, 'What is the specific antidote for severe digoxin toxicity?', '["N-acetylcysteine", "Atropine", "Digoxin Immune Fab (Digibind)", "Calcium gluconate"]', 2, 'Digoxin-specific antibody fragments (Fab) bind to and neutralize the drug.');

    -- CASE 08: Angina (Nitroglycerin)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Monday Disease', 'An employee in a dynamite factory experiences headaches and flushing while at work from Monday to Friday, but the symptoms disappear over the weekend.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the biochemical mechanism of nitroglycerin-induced vasodilation?', '["Release of Nitric Oxide (NO) and activation of guanylyl cyclase", "Inhibition of cAMP breakdown", "Blockade of voltage-gated calcium channels", "Opening of potassium channels"]', 0, 'Nitrates are converted to NO, which increases cGMP, leading to smooth muscle relaxation (venodilation > arteriodilation).'),
    (v_case_id, 'Why do the factory worker''s symptoms disappear over the weekend and reappear on Monday?', '["Psychological stress", "Development of tolerance (tachyphylaxis) during the week", "Allergic reaction", "Cumulative toxicity"]', 1, 'Continuous exposure to nitrates leads to rapid tolerance. A nitrate-free interval (the weekend) restores sensitivity.'),
    (v_case_id, 'Co-administration of nitroglycerin with which class of drug is absolutely contraindicated due to the risk of fatal hypotension?', '["Beta-blockers", "Statins", "PDE-5 inhibitors (e.g., Sildenafil)", "ACE inhibitors"]', 2, 'Both drugs increase cGMP levels via different mechanisms, leading to synergistic and life-threatening vasodilation.');

    -- CASE 09: Statins (Atorvastatin)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Muscle Pain and Dark Urine', 'A 55-year-old man on high-dose atorvastatin for hyperlipidemia presents with severe muscle pain and dark-colored urine.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the rate-limiting enzyme inhibited by statins?', '["Lipoprotein lipase", "HMG-CoA reductase", "7-alpha-hydroxylase", "Fatty acid synthase"]', 1, 'Statins competitively inhibit HMG-CoA reductase, the rate-limiting step in cholesterol biosynthesis.'),
    (v_case_id, 'What is the serious musculoskeletal adverse effect this patient is likely experiencing?', '["Osteoporosis", "Rhabdomyolysis", "Gout", "Tendonitis"]', 1, 'Rhabdomyolysis is the breakdown of muscle tissue, which can lead to kidney failure from myoglobinuria (causing dark urine).'),
    (v_case_id, 'Which of the following drugs, if added to the statin, would most significantly increase the risk of this muscle toxicity?', '["Ezetimibe", "Gemfibrozil", "Colesevelam", "Fish oil"]', 1, 'Fibrates (especially gemfibrozil) inhibit the glucuronidation of statins, leading to higher plasma levels and increased risk of myopathy.');

    -- CASE 10: Diuretics (Furosemide)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Sulfa Allergy', 'A patient with heart failure and a known severe allergy to sulfonamide antibiotics requires a potent diuretic to treat pulmonary edema.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Furosemide (Lasix) works on which part of the nephron?', '["Proximal convoluted tubule", "Thick ascending limb of the Loop of Henle", "Distal convoluted tubule", "Collecting duct"]', 1, 'Furosemide is a "loop diuretic" that inhibits the Na+/K+/2Cl- cotransporter in the thick ascending limb.'),
    (v_case_id, 'Why might furosemide be problematic for this specific patient?', '["It causes hyperkalemia", "It is a sulfonamide derivative and may cause cross-reactivity", "It is too weak for pulmonary edema", "It causes metabolic acidosis"]', 1, 'Most loop diuretics (except ethacrynic acid) are sulfonamides and carry a theoretical risk of cross-reactivity in patients with sulfa allergies.'),
    (v_case_id, 'Which loop diuretic would be the safest choice if the patient has a truly life-threatening sulfa allergy?', '["Bumetanide", "Torsemide", "Ethacrynic acid", "Hydrochlorothiazide"]', 2, 'Ethacrynic acid is a non-sulfonamide loop diuretic, though it carries a higher risk of ototoxicity.');

    RAISE NOTICE 'SUCCESS: Systemic Pharmacology Cases Part 1 (01-10) registered with correct schema V2.';
END $$;

COMMIT;
