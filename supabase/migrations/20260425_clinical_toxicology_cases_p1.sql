-- Migration: Clinical Toxicology Case Blocks (FIXED PART 1: 1-10)
-- Target: US MD / MBBS Year 2 Level

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'clinical-toxicology' LIMIT 1;

    -- CASE 1: Acetaminophen
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A 24-year-old female is brought to the ER 6 hours after ingesting "a whole bottle" of extra-strength Tylenol in a suicide attempt. She currently has mild nausea but otherwise feels fine.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What is the most likely pathological finding if this patient remains untreated for 72 hours?', '["Macrovesicular steatosis", "Centrilobular (Zone 3) hepatic necrosis", "Periportal inflammation", "Bridging fibrosis"]', 1, 'NAPQI is produced primarily by CYP450 enzymes which are most concentrated in Zone 3.'),
    (v_topic_id, v_case_id, 'Which substance is depleted in the liver during the detoxification of the toxic metabolite NAPQI?', '["Vitamin K", "Glutathione", "Glucuronic acid", "Albumin"]', 1, 'NAPQI is neutralized by conjugation with glutathione; when glutathione is exhausted, NAPQI binds to cellular proteins.'),
    (v_topic_id, v_case_id, 'What is the mechanism of the antidote N-acetylcysteine (NAC)?', '["Direct inhibition of CYP2E1", "Acts as a glutathione precursor and substitute", "Induces glucuronidation", "Competitively blocks acetaminophen receptors"]', 1, 'NAC provides cysteine for glutathione synthesis and can directly bind NAPQI.');

    -- CASE 2: Salicylates
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A 55-year-old male is found confused with "ringing in his ears." Vital signs show: BP 130/80, HR 110, RR 28, Temp 101.5 F. Arterial blood gas shows a pH of 7.42, pCO2 of 20 mmHg, and HCO3 of 14 mEq/L.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What is the primary acid-base disturbance described?', '["Metabolic Acidosis only", "Respiratory Alkalosis only", "Mixed Respiratory Alkalosis and Metabolic Acidosis", "Compensated Respiratory Acidosis"]', 2, 'Salicylates directly stimulate the respiratory center (alkalosis) and uncouple oxidative phosphorylation (acidosis).'),
    (v_topic_id, v_case_id, 'What is the mechanism of hyperthermia in this patient?', '["Inhibition of cyclooxygenase", "Uncoupling of oxidative phosphorylation", "Direct stimulation of the hypothalamus", "Muscle rigidity"]', 1, 'Energy is dissipated as heat instead of being stored as ATP.'),
    (v_topic_id, v_case_id, 'Which treatment is most appropriate to enhance the elimination of the toxin?', '["IV Normal Saline", "IV Sodium Bicarbonate", "Hemodialysis", "Forced Diuresis with Furosemide"]', 1, 'Alkalinization of urine (pH 7.5-8.5) "traps" the ionized salicylate in the renal tubules.');

    -- CASE 3: TCAs
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A 19-year-old male is brought in by EMS after a suspected Amitriptyline overdose. He is lethargic and has a seizure in the ER. The ECG shows a QRS duration of 140 ms and a tall R wave in aVR.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'The widened QRS complex is primarily due to the blockade of which channel?', '["Voltage-gated Potassium channels", "Fast Sodium channels", "L-type Calcium channels", "Chloride channels"]', 1, 'TCAs block fast sodium channels in the myocardium, slowing Phase 0 depolarization.'),
    (v_topic_id, v_case_id, 'What is the immediate treatment of choice for the cardiac conduction delay?', '["Lidocaine", "Sodium Bicarbonate", "Amiodarone", "Atropine"]', 1, 'Bicarbonate increases extracellular sodium and serum pH, which decreases TCA binding to sodium channels.'),
    (v_topic_id, v_case_id, 'The patient''s dilated pupils and dry skin are due to the blockade of:', '["Alpha-1 receptors", "Muscarinic Acetylcholine receptors", "Dopamine D2 receptors", "Histamine H1 receptors"]', 1, 'TCAs have potent anticholinergic side effects.');

    -- CASE 4: Methanol
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A homeless man presents with abdominal pain and "blurred vision like a snowstorm." Laboratory results show a significant Anion Gap Metabolic Acidosis and an Osmolar Gap.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'Which metabolite is responsible for the visual damage?', '["Acetaldehyde", "Formic Acid", "Oxalic Acid", "Acetic Acid"]', 1, 'Methanol is converted to formaldehyde and then to formic acid, which is toxic to the optic nerve.'),
    (v_topic_id, v_case_id, 'Which enzyme is the target for the antidote Fomepizole?', '["Aldehyde Dehydrogenase", "Alcohol Dehydrogenase", "Cytochrome P450", "Xanthine Oxidase"]', 1, 'Fomepizole inhibits Alcohol Dehydrogenase, preventing the formation of toxic metabolites.'),
    (v_topic_id, v_case_id, 'Which part of the brain is characteristically damaged in severe methanol poisoning?', '["Putamen", "Caudate", "Cerebellum", "Hippocampus"]', 0, 'Putaminal necrosis/hemorrhage is a classic neuroimaging finding for methanol.');

    -- CASE 5: Ethylene Glycol
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A patient is brought to the ER with altered mental status. Urinalysis reveals envelope-shaped crystals under polarized light. The patient has a profound HAGMA.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What is the composition of the crystals seen in the urine?', '["Uric acid", "Calcium oxalate", "Struvite", "Cystine"]', 1, 'Ethylene glycol is metabolized to oxalic acid, which precipitates with calcium.'),
    (v_topic_id, v_case_id, 'What electrolyte abnormality is commonly associated with this ingestion?', '["Hypercalcemia", "Hypocalcemia", "Hyperkalemia", "Hypomagnesemia"]', 1, 'The formation of calcium oxalate crystals depletes ionized calcium in the blood.'),
    (v_topic_id, v_case_id, 'Besides Fomepizole, which vitamins are used as adjunctive therapy to divert metabolism to non-toxic pathways?', '["Vitamin C and D", "Thiamine and Pyridoxine", "Folate and B12", "Vitamin K and A"]', 1, 'Thiamine and Pyridoxine help convert glyoxylate to non-toxic metabolites.');

    -- CASE 6: Opioids
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'An unconscious 30-year-old man is found in an alleyway. Physical exam: RR 6, BP 90/60, HR 50. Pupils are 1mm. There are track marks on his arms.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'Which anatomical structure mediates the pupillary finding?', '["Superior cervical ganglion", "Edinger-Westphal nucleus", "Ciliary ganglion", "Optic chiasm"]', 1, 'Opioids stimulate the EW nucleus, leading to parasympathetic pupillary constriction.'),
    (v_topic_id, v_case_id, 'After administration of an antidote, the patient wakes up but becomes agitated and develops goosebumps (piloerection). Diagnosis?', '["Serotonin Syndrome", "Opioid Withdrawal", "Malignant Hyperthermia", "NMS"]', 1, 'Sudden displacement of opioids by an antagonist causes acute withdrawal.'),
    (v_topic_id, v_case_id, 'Why must the patient be monitored for several hours after responding to Naloxone?', '["Naloxone causes liver failure", "The half-life of Naloxone is shorter than many opioids, leading to resedation", "Risk of delayed stroke", "None"]', 1, 'Naloxone wears off in 60-90 mins; the opioid may still be active.');

    -- CASE 7: Organophosphates
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A farmer is brought to the ER after accidentally spraying himself with pesticide. He is salivating, vomiting, and having difficulty breathing. Exam shows pinpoint pupils and diffuse wheezing.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What is the mechanism of action of the toxin?', '["Reversible inhibition of AChE", "Irreversible inhibition of Acetylcholinesterase", "Muscarinic agonist", "Nicotinic antagonist"]', 1, 'Organophosphates form a stable covalent bond with AChE.'),
    (v_topic_id, v_case_id, 'Which drug should be given immediately to treat the "Killer Bs" (Bronchospasm and Bronchorrhea)?', '["Pralidoxime", "Atropine", "Naloxone", "Diazepam"]', 1, 'Atropine is a competitive muscarinic antagonist that reverses the life-threatening respiratory secretions.'),
    (v_topic_id, v_case_id, 'What is the role of Pralidoxime (2-PAM) in this case?', '["Antimuscarinic", "Reactivates Acetylcholinesterase", "Sedation", "Muscle relaxant"]', 1, '2-PAM breaks the bond between the toxin and enzyme if given before "aging" occurs.');

    -- CASE 8: Digoxin
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'An 80-year-old woman on medication for heart failure presents with nausea, abdominal pain, and "yellow vision." Laboratory results: Potassium 6.0 mEq/L, Creatinine 2.5 mg/dL.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What is the most sensitive predictor of mortality in acute ingestion?', '["Digoxin level", "Potassium level", "Heart rate", "Age"]', 1, 'Hyperkalemia > 5.5 reflects the degree of Na/K ATPase pump inhibition.'),
    (v_topic_id, v_case_id, 'The "Yellow vision" (Xanthopsia) is a classic side effect of:', '["Aspirin", "Digoxin", "Lead", "Lithium"]', 1, 'Due to inhibition of retinal Na/K pumps.'),
    (v_topic_id, v_case_id, 'Why is IV Calcium traditionally avoided for hyperkalemia in this patient?', '["It is too expensive", "It may cause \"Stone Heart\" (irreversible contraction)", "It is ineffective", "None"]', 1, 'Intracellular calcium is already high; adding more could theoretically lead to hypercontraction.');

    -- CASE 9: Iron
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A 3-year-old boy swallowed a bottle of his mother''s "prenatal vitamins" 2 hours ago. He has severe vomiting and bloody diarrhea. An abdominal X-ray shows multiple radiopaque pills.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What is the primary mechanism of cellular damage in iron toxicity?', '["Inhibition of Na/K pump", "Free radical generation and lipid peroxidation", "Inhibition of RNA polymerase", "Blocking sodium channels"]', 1, 'Iron acts as a potent oxidant.'),
    (v_topic_id, v_case_id, 'Which clinical stage of iron poisoning is characterized by a "latent" period where the patient seems to recover?', '["Stage 1", "Stage 2", "Stage 3", "Stage 4"]', 1, 'Occurs 6-24 hours after ingestion before metabolic collapse occurs.'),
    (v_topic_id, v_case_id, 'What is the specific chelator for this patient?', '["Succimer", "Deferoxamine", "Penicillamine", "Dimercaprol"]', 1, 'Deferoxamine binds iron to form ferrioxamine, which is excreted in the urine (Vin-rose urine).');

    -- CASE 10: Carbon Monoxide
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A family is found unconscious in their home during a winter power outage. They were using a charcoal grill indoors. The father has a "cherry-red" appearance to his skin.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What effect does Carbon Monoxide (CO) have on the oxygen-hemoglobin dissociation curve?', '["Right shift", "Left shift", "No change", "Upward shift"]', 1, 'CO increases the affinity of the remaining hemoglobin for oxygen, preventing its release to tissues.'),
    (v_topic_id, v_case_id, 'Which brain structure is characteristically infarcted in CO poisoning?', '["Globus pallidus", "Amygdala", "Thalamus", "Pituitary"]', 0, 'Symmetric necrosis of the globus pallidus is the classic MRI finding.'),
    (v_topic_id, v_case_id, 'What is the most appropriate next step in management?', '["Intubation only", "100% High-flow Oxygen", "Sodium Bicarbonate", "Naloxone"]', 1, 'Oxygen competes with CO for hemoglobin; hyperbaric oxygen may be used for severe cases.');

    RAISE NOTICE 'SUCCESS: Clinical Toxicology Cases (1-10) registered.';
END $$;

COMMIT;
