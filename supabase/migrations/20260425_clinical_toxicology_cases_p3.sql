-- Migration: Clinical Toxicology Case Blocks (FIXED PART 3: 21-30)
-- Target: US MD / MBBS Year 2 Level (Cardiovascular & Pharma Emergencies)

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'clinical-toxicology' LIMIT 1;

    -- CASE 21: Beta-blocker Overdose
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A 40-year-old male is brought to the ER after taking 50 tablets of Propranolol. He is bradycardic (HR 35) and hypotensive (BP 70/40). Atropine fails to increase his heart rate.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'Which drug is the first-line antidote for Beta-blocker overdose that acts by bypassing the beta-receptor?', '["Epinephrine", "Glucagon", "Insulin", "Naloxone"]', 1, 'Glucagon activates its own Gs-coupled receptors to increase cAMP in the myocardium, bypassing the blocked beta receptors.'),
    (v_topic_id, v_case_id, 'Propranolol overdose is uniquely dangerous compared to other beta-blockers because of its:', '["Renal toxicity", "Sodium channel blocking (membrane stabilizing) effects", "Liver toxicity", "None"]', 1, 'Propranolol can cause QRS widening and seizures due to its sodium channel blockade.'),
    (v_topic_id, v_case_id, 'What is the primary hemodynamic goal in the management of this patient?', '["Maintain heart rate > 100", "Maintain adequate tissue perfusion (BP and mental status)", "Normal pupils", "Normal skin color"]', 1, 'Supportive care focuses on perfusion rather than just the heart rate number.');

    -- CASE 22: Calcium Channel Blocker Overdose
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A 65-year-old female overdoses on Verapamil. She is hypotensive and bradycardic. Her finger-stick glucose is 350 mg/dL (hyperglycemia).')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What is the mechanism of hyperglycemia in Calcium Channel Blocker (CCB) overdose?', '["CCBs stimulate glucagon release", "CCBs inhibit insulin release from pancreatic beta cells", "CCBs cause liver failure", "None"]', 1, 'Insulin release depends on L-type calcium channels, which are blocked by CCBs.'),
    (v_topic_id, v_case_id, 'High-Dose Insulin (HDI) therapy is used in CCB overdose primarily to:', '["Treat the hyperglycemia", "Improve myocardial metabolic efficiency by facilitating glucose uptake", "Stop seizures", "None"]', 1, 'In shock, the heart switches to glucose as its primary fuel; insulin facilitates this metabolic shift.'),
    (v_topic_id, v_case_id, 'Besides insulin, which electrolyte should be aggressively replaced in CCB toxicity to overcome the blockade?', '["Sodium", "Calcium", "Potassium", "Magnesium"]', 1, 'High doses of calcium (gluconate or chloride) can overcome the competitive blockade of L-type channels.');

    -- CASE 23: Nitroprusside
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A patient being treated for a hypertensive crisis with a Sodium Nitroprusside drip develops confusion, cherry-red skin, and metabolic acidosis.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'Which toxic substance is released during the metabolism of Nitroprusside?', '["Cyanide", "Lead", "Arsenic", "Mercury"]', 0, 'Nitroprusside contains 5 cyanide groups per molecule; prolonged use can lead to cyanide toxicity.'),
    (v_topic_id, v_case_id, 'In a patient with renal failure, which OTHER metabolite of Nitroprusside can accumulate, causing confusion and seizures?', '["Urea", "Thiocyanate", "Formic acid", "Acetone"]', 1, 'Cyanide is converted to thiocyanate in the liver, which is then excreted by the kidneys.'),
    (v_topic_id, v_case_id, 'Which modern antidote should be administered for the acute cyanide toxicity?', '["Methylene blue", "Hydroxocobalamin", "Atropine", "Physostigmine"]', 1, 'Hydroxocobalamin is the preferred modern antidote for cyanide.');

    -- CASE 24: Isoniazid (INH)
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A patient being treated for tuberculosis is brought in with status epilepticus that is unresponsive to Lorazepam.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'Isoniazid (INH) causes seizures primarily by depleting which cofactor?', '["Thiamine (B1)", "Pyridoxine (B6)", "Cobalamin (B12)", "Folate"]', 1, 'INH inhibits pyridoxine phosphokinase, preventing the formation of GABA from glutamate.'),
    (v_topic_id, v_case_id, 'The specific antidote for INH-induced seizures is:', '["Vitamin K", "Pyridoxine (B6)", "Naloxone", "Flumazenil"]', 1, 'Giving B6 restores GABA synthesis and stops the seizures.'),
    (v_topic_id, v_case_id, 'Which neurotransmitter is deficient in this patient?', '["Dopamine", "GABA", "Glutamate", "Acetylcholine"]', 1, 'GABA is the primary inhibitory neurotransmitter in the brain.');

    -- CASE 25: Lithium
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A 35-year-old with bipolar disorder presents with coarse tremors, ataxia, and confusion. Her Lithium level is 4.5 mEq/L.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What is the most common cause of acute-on-chronic lithium toxicity?', '["Overdose", "Dehydration or use of NSAIDs/ACE-inhibitors", "Liver failure", "None"]', 1, 'Decreased renal clearance of lithium is the most common trigger.'),
    (v_topic_id, v_case_id, 'Lithium is a well-known cause of which renal complication?', '["Nephrotic syndrome", "Nephrogenic Diabetes Insipidus", "Kidney stones", "None"]', 1, 'Lithium makes the collecting duct unresponsive to ADH.'),
    (v_topic_id, v_case_id, 'What is the definitive treatment for severe lithium toxicity (Level > 4.0)?', '["IV Normal Saline", "Hemodialysis", "Activated Charcoal", "None"]', 1, 'Hemodialysis is very effective for lithium due to its low molecular weight and lack of protein binding.');

    -- CASE 26: Valproic Acid
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A patient with a history of epilepsy overdoses on Depakote (Valproic acid). He is comatose with a significantly elevated ammonia level.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'The hyperammonemia in valproate overdose is primarily due to:', '["Liver failure", "Inhibition of the urea cycle and depletion of Carnitine", "Kidney failure", "None"]', 1, 'Valproate metabolites inhibit urea cycle enzymes.'),
    (v_topic_id, v_case_id, 'Which specific agent is given to manage the hyperammonemic encephalopathy?', '["Lactulose", "L-Carnitine", "Glucagon", "Atropine"]', 1, 'L-Carnitine helps divert valproate metabolism and restores mitochondrial function.'),
    (v_topic_id, v_case_id, 'A chronic side effect of Valproic acid in young women is:', '["Hirsutism and Polycystic Ovary Syndrome (PCOS)-like symptoms", "Hair loss", "Yellow skin", "None"]', 0, 'Valproate is associated with endocrine and metabolic side effects.');

    -- CASE 27: Phenytoin
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A patient on chronic Dilantin (Phenytoin) therapy presents with fever, a diffuse rash, and lymphadenopathy. Laboratory results show eosinophilia.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What is the name of this idiosyncratic drug reaction?', '["Stevens-Johnson Syndrome", "DRESS Syndrome", "Toxic Epidermal Necrolysis", "None"]', 1, 'Drug Reaction with Eosinophilia and Systemic Symptoms.'),
    (v_topic_id, v_case_id, 'Which chronic physical finding is common in patients on long-term Phenytoin?', '["Gum (Gingival) hyperplasia", "Thinning of the skin", "Blue nails", "None"]', 0, 'One of the classic side effects alongside hirsutism and nystagmus.'),
    (v_topic_id, v_case_id, 'Phenytoin follows "Zero-order" kinetics at high levels. What does this mean?', '["A constant fraction is eliminated per unit time", "A constant amount is eliminated per unit time", "It is never eliminated", "None"]', 1, 'The metabolic pathways become saturated, leading to a rapid rise in serum levels.');

    -- CASE 28: Warfarin
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'An elderly patient on Warfarin (Coumadin) is brought in with severe epistaxis and a large hematoma on his thigh. His INR is 9.0.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'Warfarin inhibits which enzyme to prevent clotting?', '["Thrombin", "Vitamin K Epoxide Reductase", "Factor Xa", "None"]', 1, 'This prevents the recycling of Vitamin K, which is needed for factors II, VII, IX, and X.'),
    (v_topic_id, v_case_id, 'What is the immediate treatment for life-threatening bleeding in this patient?', '["Vitamin K orally", "Prothrombin Complex Concentrate (PCC) or Fresh Frozen Plasma (FFP)", "Heparin", "None"]', 1, 'PCC/FFP provides the missing clotting factors immediately; Vitamin K takes hours to work.'),
    (v_topic_id, v_case_id, 'Which natural anticoagulant is depleted first when starting Warfarin, potentially leading to skin necrosis?', '["Antithrombin III", "Protein C", "Heparin", "None"]', 1, 'Protein C has a short half-life; its early depletion creates a temporary pro-thrombotic state.');

    -- CASE 29: Heparin
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A patient on a Heparin drip for a PE develops sudden severe bleeding after an error in the infusion rate.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'Which cofactor does Heparin activate to inhibit thrombin?', '["Vitamin K", "Antithrombin III", "Factor V", "None"]', 1, 'Heparin increases the activity of ATIII by 1000-fold.'),
    (v_topic_id, v_case_id, 'What is the specific antidote for Heparin overdose?', '["Vitamin K", "Protamine Sulfate", "Naloxone", "Flumazenil"]', 1, 'Protamine is a positively charged molecule that ionically binds the negatively charged heparin.'),
    (v_topic_id, v_case_id, 'Which laboratory test is used to monitor Unfractionated Heparin therapy?', '["PT/INR", "aPTT", "D-dimer", "Platelet count"]', 1, 'Activated Partial Thromboplastin Time.');

    -- CASE 30: Hydrofluoric Acid (HF)
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A technician in a semiconductor plant spills a solution on his hand. He has extreme, deep-seated pain, but there is no visible burn on the skin surface.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'Which toxin is likely responsible for this "pain out of proportion to exam"?', '["Sulfuric Acid", "Hydrofluoric Acid", "Lye", "Bleach"]', 1, 'HF penetrates deeply and binds to electrolytes.'),
    (v_topic_id, v_case_id, 'What is the life-threatening electrolyte emergency caused by HF exposure?', '["Hypercalcemia", "Hypocalcemia and Hyperkalemia", "Hyponatremia", "None"]', 1, 'Fluoride ions bind calcium and magnesium and lead to potassium release from cells, causing cardiac arrest.'),
    (v_topic_id, v_case_id, 'What is the specific treatment for HF exposure?', '["Water wash only", "Topical or injected Calcium Gluconate", "Sodium Bicarbonate", "None"]', 1, 'Calcium neutralizes the fluoride ions to prevent further tissue damage.');

    RAISE NOTICE 'SUCCESS: Clinical Toxicology Cases (21-30) registered.';
END $$;

COMMIT;
