BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Fetch Topic ID for Toxicology
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'em-toxicology' LIMIT 1;

    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic "em-toxicology" not found.';
    END IF;

    ---------------------------------------------------------------------------
    -- CASE 01: Acetaminophen Toxicity - Timing (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Silent Poison' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Silent Poison', 'A patient presents 4 hours after ingesting a whole bottle of Tylenol. He is currently asymptomatic.', 1) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'A patient presents 4 hours after ingesting a whole bottle of Tylenol. He is currently asymptomatic.', "order" = 1 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most important clinical tool for determining treatment at 4 hours post-ingestion?', '["AST/ALT levels", "The Rumack-Matthew Nomogram", "Bilirubin", "None"]', 1, 'The nomogram is used to predict hepatotoxicity risk based on a 4-hour (or later) serum acetaminophen level.'),
    (v_case_id, 'Why are patients often asymptomatic in the first 24 hours?', '["The drug is non-toxic", "The initial phase involves vague GI symptoms or no symptoms at all; hepatotoxicity peaks later (72-96h)", "None", "None"]', 1, 'Acetaminophen toxicity is a delayed clinical crisis.'),
    (v_case_id, 'What is the primary mechanism of hepatotoxicity?', '["Direct cell lysis", "Depletion of glutathione and accumulation of the toxic metabolite NAPQI", "None", "None"]', 1, 'NAPQI causes oxidative stress and centrilobular necrosis.');

    ---------------------------------------------------------------------------
    -- CASE 02: Antidote - N-acetylcysteine (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Liver Protector' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Liver Protector', 'A patient requires N-acetylcysteine (NAC) for an acetaminophen overdose.', 2) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Liver Protector', "order" = 2 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How does NAC work?', '["It neutralizes Tylenol", "It serves as a glutathione precursor and substitute, detoxifying NAPQI", "None", "None"]', 1, 'NAC restores the body''s ability to handle the toxic metabolite.'),
    (v_case_id, 'NAC is nearly 100% effective if given within how many hours of ingestion?', '["2 hours", "8 hours", "24 hours", "None"]', 1, 'Early administration is critical for preventing permanent liver damage.'),
    (v_case_id, 'What is a common side effect of the IV NAC loading dose?', '["Hypoglycemia", "Anaphylactoid reaction (rash, flushing, wheezing)", "None", "None"]', 1, 'IV NAC can cause a non-IgE mediated release of histamine.');

    ---------------------------------------------------------------------------
    -- CASE 03: Aspirin Toxicity - Salicylism (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Tinnitus and Tachypnea' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Tinnitus and Tachypnea', 'A patient is hyperventilating and complaining of "ringing in the ears" after an overdose.', 3) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Tinnitus and Tachypnea', "order" = 3 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic early acid-base finding in salicylate toxicity?', '["Pure metabolic acidosis", "Mixed Respiratory Alkalosis and Primary Metabolic Acidosis", "None", "None"]', 1, 'Salicylates stimulate the respiratory center (alkalosis) and uncouple oxidative phosphorylation (acidosis).'),
    (v_case_id, 'Why is urinary alkalinization (IV Bicarbonate) used?', '["To treat the acidosis", "To \"ion trap\" the salicylate in the urine and increase excretion", "None", "None"]', 1, 'Alkaline urine keeps the salicylate in an ionized, non-reabsorbable state.'),
    (v_case_id, 'What is the primary indicator for emergent Hemodialysis in Aspirin overdose?', '["Level > 20 mg/dL", "Level > 100 mg/dL (acute) or severe AMS/refractory acidosis", "None", "None"]', 1, 'Very high levels or life-threatening symptoms necessitate dialysis.');

    ---------------------------------------------------------------------------
    -- CASE 04: Opioid Toxidrome (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pinpoint Pupils' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pinpoint Pupils', 'A patient is found unresponsive with a RR of 6 and miosis.', 4) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pinpoint Pupils', "order" = 4 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the priority in managing this patient?', '["Wait for Naloxone", "Support ventilation (BVM/Oxygen) while preparing Naloxone", "Intubate immediately", "None"]', 1, 'Oxygenation and ventilation are the immediate priorities to prevent cardiac arrest.'),
    (v_case_id, 'What is the goal of Naloxone administration?', '["Complete wakefulness", "Adequate spontaneous ventilation", "None", "None"]', 1, 'The goal is to restore breathing, not necessarily to wake the patient up fully (which can trigger withdrawal).'),
    (v_case_id, 'Which opioid is notorious for causing seizures and not just miosis?', '["Heroin", "Meperidine (Demerol)", "Fentanyl", "None"]', 1, 'Meperidine''s metabolite, normeperidine, is pro-convulsant.');

    ---------------------------------------------------------------------------
    -- CASE 05: Anticholinergic Toxidrome (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Mad as a Hatter' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Mad as a Hatter', 'A patient has dry skin, dilated pupils, a high heart rate, and is picking at invisible objects.', 5) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Mad as a Hatter', "order" = 5 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is NOT part of the anticholinergic mnemonic?', '["Red as a beet", "Wet as a sponge", "Hot as a hare", "Blind as a bat"]', 1, 'Anticholinergic toxicity causes "Dry as a bone," not wet.'),
    (v_case_id, 'What is the antidote for severe, refractory anticholinergic delirium?', '["Atropine", "Physostigmine", "Flumazenil", "None"]', 1, 'Physostigmine is an acetylcholinesterase inhibitor that crosses the blood-brain barrier.'),
    (v_case_id, 'In which situation is Physostigmine CONTRAINDICATED?', '["Aspirin overdose", "TCA (Tricyclic Antidepressant) overdose due to risk of asystole", "None", "None"]', 1, 'Physostigmine should never be used if TCA toxicity is suspected.');

    ---------------------------------------------------------------------------
    -- CASE 06: Cholinergic Toxidrome - Organophosphates (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'SLUDGEM' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'SLUDGEM', 'A farmer presents with salivation, lacrimation, and severe bradycardia after spraying pesticides.', 6) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'SLUDGEM', "order" = 6 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of organophosphate toxicity?', '["Blocks receptors", "Irreversible inhibition of Acetylcholinesterase", "None", "None"]', 1, 'This leads to an excess of acetylcholine at all cholinergic synapses.'),
    (v_case_id, 'What is the "Killer B" of cholinergic toxicity?', '["Bradycardia, Bronchospasm, and Bronchorrhea", "Bleeding", "Bilirubin", "None"]', 0, 'Excessive secretions and airway constriction are the primary causes of death.'),
    (v_case_id, 'What is the target endpoint for Atropine dosing in this poisoning?', '["Normal HR", "Drying of bronchial secretions", "None", "None"]', 1, 'You give atropine until the lungs are clear, regardless of the dose required.');

    ---------------------------------------------------------------------------
    -- CASE 07: Sympathomimetic Toxidrome - Cocaine (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hyper-Adrenergic State' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hyper-Adrenergic State', 'A patient has a HR of 140, BP of 180/100, dilated pupils, and is sweating profusely.', 7) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hyper-Adrenergic State', "order" = 7 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How do you distinguish sympathomimetic from anticholinergic toxidromes?', '["Pupil size", "Sweating (diaphoresis) is present in sympathomimetic states; skin is dry in anticholinergic", "None", "None"]', 1, 'This is a key physical exam differentiator.'),
    (v_case_id, 'Which class of drugs is CONTRAINDICATED for hypertension in cocaine toxicity?', '["Benzodiazepines", "Beta-blockers (due to fear of \"unopposed alpha\" stimulation)", "Calcium channel blockers", "None"]', 1, 'Blocking beta-2 causes vasoconstriction, which can worsen hypertension and coronary spasm when alpha-1 is stimulated.'),
    (v_case_id, 'What is the first-line treatment for cocaine-induced agitation and hypertension?', '["Haloperidol", "Benzodiazepines", "Labetalol", "None"]', 1, 'Benzos reduce the sympathetic outflow from the CNS.');

    ---------------------------------------------------------------------------
    -- CASE 08: Tricyclic Antidepressants - TCAs (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Wide QRS' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Wide QRS', 'An overdose patient has a QRS duration of 140 ms and a large R-wave in lead aVR.', 8) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Wide QRS', "order" = 8 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary toxic effect of TCAs on the heart?', '["Beta-blockade", "Sodium channel blockade", "Calcium blockade", "None"]', 1, 'This slows depolarization and widens the QRS.'),
    (v_case_id, 'What is the immediate treatment for QRS widening in TCA overdose?', '["Lidocaine", "Sodium Bicarbonate (IV boluses)", "Magnesium", "None"]', 1, 'Sodium bicarbonate increases the extracellular sodium concentration and pH, mitigating the channel blockade.'),
    (v_case_id, 'What are the "3 Cs" of TCA toxicity?', '["Cardiotoxicity, Convulsions, Coma", "Chills, Cough, Cold", "None", "None"]', 0, 'These represent the life-threatening manifestations.');

    ---------------------------------------------------------------------------
    -- CASE 09: Toxic Alcohols - Methanol (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Snowstorm Vision' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Snowstorm Vision', 'A patient presents with a profound anion-gap metabolic acidosis and complaints of blurry vision after drinking "moonshine."', 9) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Snowstorm Vision', "order" = 9 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the toxic metabolite of methanol?', '["Oxalate", "Formic Acid", "Acetic Acid", "None"]', 1, 'Formic acid causes retinal damage and metabolic acidosis.'),
    (v_case_id, 'What is the first-line medication to block the metabolism of toxic alcohols?', '["Ethanol only", "Fomepizole", "Bicarbonate", "None"]', 1, 'Fomepizole is a potent inhibitor of alcohol dehydrogenase.'),
    (v_case_id, 'Which vitamin is given as a cofactor to help break down formic acid?', '["Thiamine", "Folate", "Vitamin K", "None"]', 1, 'Folate (Leucovorin) helps metabolize formate to CO2 and water.');

    ---------------------------------------------------------------------------
    -- CASE 10: Toxic Alcohols - Ethylene Glycol (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Antifreeze Ingestion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Antifreeze Ingestion', 'A patient is intoxicated but has no odor of ethanol. Laboratory shows acute renal failure and envelope-shaped crystals in the urine.', 10) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Antifreeze Ingestion', "order" = 10 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the crystals found in the urine?', '["Urate", "Calcium Oxalate", "Struvite", "None"]', 1, 'Oxalate crystals are a byproduct of ethylene glycol metabolism and cause renal tubular damage.'),
    (v_case_id, 'Besides Fomepizole, what other treatment is often required for severe ethylene glycol poisoning?', '["Antibiotics", "Hemodialysis", "Insulin", "None"]', 1, 'Dialysis removes both the parent alcohol and the toxic metabolites.'),
    (v_case_id, 'What are the cofactors given for ethylene glycol metabolism?', '["Thiamine and Pyridoxine", "Folate", "None", "None"]', 0, 'These shift the metabolism away from the toxic oxalate pathway.');

    ---------------------------------------------------------------------------
    -- CASE 11: Carbon Monoxide - CO (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Silent Killer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Silent Killer', 'Multiple family members present with headache and nausea after a cold night using a space heater.', 11) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Silent Killer', "order" = 11 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Will a standard pulse oximeter detect CO poisoning?', '["Yes", "No, it cannot distinguish between carboxyhemoglobin and oxyhemoglobin", "None", "None"]', 1, 'Pulse-ox will usually show a falsely normal reading.'),
    (v_case_id, 'What is the diagnostic test of choice?', '["Arterial Blood Gas only", "Co-oximetry (from arterial or venous blood)", "CT Brain", "None"]', 1, 'Co-oximetry directly measures the percentage of carboxyhemoglobin.'),
    (v_case_id, 'When is Hyperbaric Oxygen (HBO) indicated?', '["Everyone with CO", "CO > 25% (or > 15% in pregnancy) or evidence of neurologic/cardiac dysfunction", "None", "None"]', 1, 'HBO reduces the half-life of CO significantly and may prevent neurological sequelae.');

    ---------------------------------------------------------------------------
    -- CASE 12: Cyanide Poisoning (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'House Fire Collapse' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'House Fire Collapse', 'A victim pulled from a smoke-filled room is hypotensive with a very high lactate (15.0 mmol/L).', 12) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'House Fire Collapse', "order" = 12 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of cyanide toxicity?', '["Blocks hemoglobin", "Inhibits Cytochrome C oxidase, stopping aerobic respiration", "None", "None"]', 1, 'Cyanide prevents cells from using oxygen, even if it is available.'),
    (v_case_id, 'What is the preferred antidote in the US for suspected cyanide poisoning in fire victims?', '["Nitrites", "Hydroxocobalamin (Cyanokit)", "Methylene Blue", "None"]', 1, 'Hydroxocobalamin binds cyanide to form Vitamin B12, which is excreted.'),
    (v_case_id, 'Why are Nitrites often avoided in fire victims?', '["Too expensive", "They cause methemoglobinemia, which would worsen the oxygen deficit in a victim who likely also has CO poisoning", "None", "None"]', 1, 'Dual CO and methemoglobinemia is a lethal combination.');

    ---------------------------------------------------------------------------
    -- CASE 13: Digoxin Toxicity (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Yellow-Green Halos' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Yellow-Green Halos', 'An elderly patient on Digoxin has nausea, vomiting, and "distorted vision."', 13) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Yellow-Green Halos', "order" = 13 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What electrolyte abnormality is a marker of SEVERE acute digoxin toxicity?', '["Hypokalemia", "Hyperkalemia", "Hyponatremia", "None"]', 1, 'Digoxin blocks the Na+/K+ pump, leaving K+ in the extracellular space; K+ > 5.0 in acute toxicity is a poor prognostic sign.'),
    (v_case_id, 'What is the definitive treatment for severe digoxin poisoning?', '["Dialysis", "Digoxin Immune Fab (Digibind)", "Calcium", "None"]', 1, 'Fab fragments bind digoxin and allow it to be cleared.'),
    (v_case_id, 'Why should IV Calcium be used with caution (or avoided) in digoxin toxicity?', '["It doesn''t work", "Theoretical risk of \"stone heart\" (irreversible contraction)", "None", "None"]', 1, 'Though debated, most experts prefer Fab fragments for managing the hyperkalemia of Digoxin.');

    ---------------------------------------------------------------------------
    -- CASE 14: Beta-Blocker Toxicity (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Heart Block' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Heart Block', 'A patient overdosed on Propranolol. He is bradycardic and hypotensive.', 14) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Heart Block', "order" = 14 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the initial antidote for beta-blocker overdose?', '["Atropine", "Glucagon", "Insulin", "None"]', 1, 'Glucagon stimulates adenylate cyclase via a different receptor, bypassing the beta-blockade.'),
    (v_case_id, 'What is the role of High-Dose Insulin (HDI) in this setting?', '["Lower sugar", "Potent inotrope that improves myocardial energy use", "None", "None"]', 1, 'HDI is now considered a first-line therapy for severe BB/CCB shock.'),
    (v_case_id, 'Which beta-blocker also blocks potassium channels and can cause QT prolongation?', '["Metoprolol", "Sotalol", "Atenolol", "None"]', 1, 'Sotalol carries an additional risk of Torsades de Pointes.');

    ---------------------------------------------------------------------------
    -- CASE 15: Calcium Channel Blocker Toxicity (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pump Failure' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pump Failure', 'A patient presents with severe bradycardia and shock after ingesting Verapamil.', 15) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Pump Failure', "order" = 15 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic blood sugar finding in CCB overdose?', '["Hypoglycemia", "Hyperglycemia", "Normal", "None"]', 1, 'CCBs block insulin release from the pancreas (calcium-dependent), causing high blood sugar.'),
    (v_case_id, 'How do you distinguish BB from CCB overdose clinically?', '["HR", "CCBs often cause hyperglycemia and preserved mental status; BBs often cause hypoglycemia and earlier CNS depression", "None", "None"]', 1, 'Glucose is a helpful clue in the "bradycardia/hypotension" algorithm.'),
    (v_case_id, 'What is "Lipid Emulsion Therapy" used for?', '["To feed the patient", "To scavenge lipophilic drugs (like Verapamil or Propranolol) out of the tissues", "None", "None"]', 1, 'Intralipid acts as a "lipid sink" for lipophilic toxins.');

    ---------------------------------------------------------------------------
    -- CASE 16: Iron Poisoning (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Metallic GI Upset' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Metallic GI Upset', 'A child ingests a handful of prenatal vitamins. He has vomiting and bloody diarrhea.', 16) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Metallic GI Upset', "order" = 16 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does activated charcoal bind iron?', '["Yes", "No", "Only if given early", "None"]', 1, 'Iron (and other metals/electrolytes) does not bind to charcoal.'),
    (v_case_id, 'What is the specific chelator for iron?', '["Succimer", "Deferoxamine", "EDTA", "None"]', 1, 'Deferoxamine binds iron and is excreted in the urine.'),
    (v_case_id, 'What color change in the urine is associated with Deferoxamine therapy?', '["Blue", "Vin-rose (reddish-pink)", "Green", "None"]', 1, 'The ferrioxamine complex gives the urine a characteristic color.');

    ---------------------------------------------------------------------------
    -- CASE 17: Lead Poisoning (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Lead and the Gut' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Lead and the Gut', 'A child in an old house has abdominal pain, constipation, and developmental delay.', 17) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Lead and the Gut', "order" = 17 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic finding on a peripheral blood smear in lead poisoning?', '["Heinz bodies", "Basophilic stippling", "Schistocytes", "None"]', 1, 'Lead inhibits enzymes in heme synthesis, leading to ribosomal aggregation.'),
    (v_case_id, 'What is the first-line oral chelator for children with lead levels > 45 mcg/dL?', '["Penicillamine", "Succimer (DMSA)", "BAL", "None"]', 1, 'Succimer is effective and relatively safe for oral use.'),
    (v_case_id, 'For severe lead encephalopathy, which two drugs are used together?', '["BAL and EDTA", "Succimer and Iron", "None", "None"]', 0, 'BAL must be given FIRST to prevent redistributing lead to the brain.');

    ---------------------------------------------------------------------------
    -- CASE 18: Serotonin Syndrome (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hyper-Reflexic State' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hyper-Reflexic State', 'A patient on an SSRI and Tramadol has a fever, tremor, and "inducible clonus" in the legs.', 18) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hyper-Reflexic State', "order" = 18 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the hallmark physical exam finding of serotonin syndrome?', '["Lead-pipe rigidity", "Hyperreflexia and Clonus (especially in lower extremities)", "None", "None"]', 1, 'This distinguishes it from Neuroleptic Malignant Syndrome (which has rigidity).'),
    (v_case_id, 'What is the first-line treatment for agitation and fever in Serotonin Syndrome?', '["Dantrolene", "Benzodiazepines", "Haloperidol", "None"]', 1, 'Aggressive sedation with benzos is the mainstay of care.'),
    (v_case_id, 'What is the specific serotonin antagonist used in severe cases?', '["Propranolol", "Cyproheptadine", "Odansetron", "None"]', 1, 'Cyproheptadine is a first-generation antihistamine with potent 5-HT2A antagonism.');

    ---------------------------------------------------------------------------
    -- CASE 19: Neuroleptic Malignant Syndrome - NMS (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rigidity Crisis' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rigidity Crisis', 'A schizophrenic patient on Haloperidol has a temperature of 40°C, tachycardia, and "lead-pipe" muscle rigidity.', 19) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Rigidity Crisis', "order" = 19 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the suspected mechanism of NMS?', '["Serotonin excess", "Dopamine D2 receptor blockade", "None", "None"]', 1, 'This leads to autonomic instability and muscle dysfunction.'),
    (v_case_id, 'What is the priority for a patient with severe NMS?', '["Aspirin", "Cooling and IV Fluids (to prevent renal failure from rhabdomyolysis)", "Antibiotics", "None"]', 1, 'High fever and muscle breakdown (high CK) are the main threats.'),
    (v_case_id, 'Which muscle relaxant is specifically used for NMS?', '["Baclofen", "Dantrolene", "Succinylcholine", "None"]', 1, 'Dantrolene inhibits calcium release from the sarcoplasmic reticulum.');

    ---------------------------------------------------------------------------
    -- CASE 20: Caustic Ingestions (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Drain Cleaner Ingestion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Drain Cleaner Ingestion', 'A patient accidentally drinks a strong alkali (Lye).', 20) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Drain Cleaner Ingestion', "order" = 20 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Should you induce vomiting (emesis) in this patient?', '["Yes", "No, it causes \"re-exposure\" of the esophagus to the caustic", "None", "None"]', 1, 'Never induce vomiting or give neutralizers (which create heat).'),
    (v_case_id, 'What type of necrosis do Alkalis cause?', '["Coagulative", "Liquefactive", "None", "None"]', 1, 'Alkalis cause liquefactive necrosis, which penetrates deeper than the coagulative necrosis of acids.'),
    (v_case_id, 'What is the diagnostic study of choice within 24 hours?', '["Barium swallow", "Upper Endoscopy", "CT Abdomen", "None"]', 1, 'Endoscopy assesses the degree of esophageal and gastric injury.');

    ---------------------------------------------------------------------------
    -- CASE 21: Methemoglobinemia (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Blue Patient' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Blue Patient', 'A patient becomes cyanotic after being treated with Benzocaine spray for a procedure. Pulse-ox is 85% and does not improve with O2.', 21) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Blue Patient', "order" = 21 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the color of the blood in methemoglobinemia?', '["Bright red", "Chocolate brown", "Dark blue", "None"]', 1, 'This is a classic physical finding.'),
    (v_case_id, 'What is the antidote for symptomatic methemoglobinemia?', '["Hydroxocobalamin", "Methylene Blue", "N-acetylcysteine", "None"]', 1, 'Methylene blue acts as an electron donor to reduce the iron in hemoglobin.'),
    (v_case_id, 'Methylene Blue is CONTRAINDICATED in which condition?', '["Kidney failure", "G6PD deficiency (risk of severe hemolysis)", "None", "None"]', 1, 'It requires the NADPH pathway to work; in G6PD, it can cause a crisis.');

    ---------------------------------------------------------------------------
    -- CASE 22: Hydrocarbon Aspiration (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Gasoline Ingestion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Gasoline Ingestion', 'A child swallows gasoline. He is now coughing and has a low O2 saturation.', 22) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Gasoline Ingestion', "order" = 22 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary danger of hydrocarbon ingestion?', '["Liver failure", "Chemical Pneumonitis due to low viscosity and high volatility", "None", "None"]', 1, 'Hydrocarbons "crawl" into the lungs easily.'),
    (v_case_id, 'Should you Induce emesis or use Activated Charcoal?', '["Yes", "No", "Charcoal only", "None"]', 1, 'Emesis increases aspiration risk, and charcoal does not bind hydrocarbons.'),
    (v_case_id, 'What is the observation period for an asymptomatic hydrocarbon ingestion?', '["1 hour", "6 hours (with a repeat CXR)", "None", "None"]', 1, 'If the child is fine at 6 hours and the X-ray is clear, they can go home.');

    ---------------------------------------------------------------------------
    -- CASE 23: Lithium Toxicity (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tremor and Diarrhea' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tremor and Diarrhea', 'A bipolar patient has worsened tremor, ataxia, and confusion.', 23) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Tremor and Diarrhea', "order" = 23 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Does activated charcoal bind Lithium?', '["Yes", "No", "None", "None"]', 1, 'Lithium is a metal and does not bind to charcoal.'),
    (v_case_id, 'What is the most effective way to clear Lithium in severe toxicity?', '["IV Saline only", "Hemodialysis", "Diuretics", "None"]', 1, 'Dialysis is highly effective for Lithium (a small, water-soluble ion).'),
    (v_case_id, 'What commonly prescribed ED medication can increase lithium levels?', '["Tylenol", "NSAIDs (like Ibuprofen)", "Antibiotics", "None"]', 1, 'NSAIDs reduce the renal clearance of lithium.');

    ---------------------------------------------------------------------------
    -- CASE 24: Isoniazid - INH Toxicity (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Seizures and TB' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Seizures and TB', 'A patient on TB treatment presents with refractory seizures.', 24) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Seizures and TB', "order" = 24 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of INH-induced seizures?', '["Inhibition of Vitamin B6 (Pyridoxine), leading to low GABA levels", "Direct stimulation", "None", "None"]', 0, 'GABA is the brain''s primary inhibitory neurotransmitter.'),
    (v_case_id, 'What is the specific antidote for INH-induced seizures?', '["Phenytoin", "Pyridoxine (Vitamin B6)", "Thiamine", "None"]', 1, 'Standard anti-epileptics often fail; B6 is the "cure."'),
    (v_case_id, 'What dose of Pyridoxine is given?', '["10 mg", "Gram-for-gram equivalent to the amount of INH ingested (up to 5g)", "None", "None"]', 1, 'It is one of the few weight-for-weight antidotes.');

    ---------------------------------------------------------------------------
    -- CASE 25: Black Widow Spider Bite (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Rigid Abdomen' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Rigid Abdomen', 'A patient has severe abdominal muscle pain and rigidity after a bite in his garage.', 25) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Rigid Abdomen', "order" = 25 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the toxin in Black Widow venom?', '["Sphingomyelinase D", "Alpha-latrotoxin", "None", "None"]', 1, 'This causes massive release of acetylcholine and norepinephrine.'),
    (v_case_id, 'What is the hallmark clinical finding?', '["Skin necrosis", "Severe muscle cramping (latrodectism) mimicking a surgical abdomen", "None", "None"]', 1, 'The "acute abdomen" presentation is common.'),
    (v_case_id, 'What is the first-line treatment for pain and cramping?', '["Antivenom", "Benzodiazepines and Opioids", "Ice only", "None"]', 1, 'Antivenom is reserved for severe cases due to serum sickness risk; most are managed supportively.');

    ---------------------------------------------------------------------------
    -- CASE 26: Brown Recluse Spider Bite (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Sinking Ulcer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Sinking Ulcer', 'A patient has a bite that has developed a "bull''s-eye" lesion with central necrosis.', 26) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Sinking Ulcer', "order" = 26 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary toxin in Brown Recluse venom?', '["Sphingomyelinase D", "Latrotoxin", "None", "None"]', 0, 'It causes local tissue destruction and hemolysis.'),
    (v_case_id, 'What is the recommended management for most Brown Recluse bites?', '["Immediate excision", "Supportive care (RICE, wound care)", "Antivenom", "None"]', 1, 'Most heal on their own; early surgery can worsen the defect.'),
    (v_case_id, 'What is a rare but severe systemic complication?', '["Heart failure", "Hemolysis and DIC", "None", "None"]', 1, 'Systemic loxoscelism is dangerous but uncommon.');

    ---------------------------------------------------------------------------
    -- CASE 27: Snake Bites - Crotalids (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Pit Viper' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Pit Viper', 'A patient is bitten by a Rattlesnake. The limb is swollen and he has low platelets.', 27) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Pit Viper', "order" = 27 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Should you use a tourniquet or "cut and suck" the venom?', '["Yes", "No, it increases local tissue damage", "None", "None"]', 1, 'These historical methods are now strictly contraindicated.'),
    (v_case_id, 'What is the primary treatment for significant envenomation?', '["Antibiotics", "CroFab (Antivenom)", "Steroids", "None"]', 1, 'CroFab is indicated for progressive swelling or coagulopathy.'),
    (v_case_id, 'What is a "Dry Bite"?', '["Bite from a dead snake", "A bite where no venom was actually injected (occurs in ~25% of cases)", "None", "None"]', 1, 'Dry bites require observation only.');

    ---------------------------------------------------------------------------
    -- CASE 28: Alcohol Withdrawal (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Shaking Patient' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Shaking Patient', 'A chronic alcoholic is hospitalized and becomes tremulous, tachycardic, and starts hallucinating at 48 hours.', 28) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Shaking Patient', "order" = 28 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most severe form of alcohol withdrawal?', '["Seizures", "Delirium Tremens (DTs)", "Wernicke''s", "None"]', 1, 'DTs involve severe autonomic instability and have high mortality if untreated.'),
    (v_case_id, 'What is the mainstay of treatment?', '["Phenytoin", "Benzodiazepines (titrated to effect)", "Beta-blockers", "None"]', 1, 'Benzos substitute for the missing ethanol at the GABA receptors.'),
    (v_case_id, 'Why are "Symptom-Triggered" protocols (CIWA) preferred over fixed dosing?', '["They are cheaper", "They reduce total benzo dose and duration of treatment", "None", "None"]', 1, 'Treating based on actual symptoms is safer and more effective.');

    ---------------------------------------------------------------------------
    -- CASE 29: Body Packing vs. Stuffing (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Drug Courier' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Drug Courier', 'A "body packer" arrives in the ED. He has swallowed 50 packets of cocaine. He is currently stable.', 29) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Drug Courier', "order" = 29 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the management of an asymptomatic body packer?', '["Immediate surgery", "Whole Bowel Irrigation (GoLYTELY) and observation", "None", "None"]', 1, 'Surgery is reserved for packet rupture or obstruction.'),
    (v_case_id, 'If a cocaine packet ruptures, what is the management?', '["Benzos only", "Immediate surgical removal (high mortality risk)", "None", "None"]', 1, 'Massive cocaine overdose from a ruptured packet is often fatal without surgery.'),
    (v_case_id, 'What imaging is best for screening for packets?', '["X-ray", "Non-contrast CT Abdomen", "None", "None"]', 1, 'CT is much more sensitive than plain film.');

    ---------------------------------------------------------------------------
    -- CASE 30: Decontamination - Activated Charcoal (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Universal Binder' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Universal Binder', 'A patient presents 45 minutes after ingesting several pill types.', 30) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Universal Binder', "order" = 30 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the optimal time frame for giving activated charcoal?', '["Within 1 hour", "Within 4 hours", "None", "None"]', 0, 'Benefit decreases rapidly as time passes since ingestion.'),
    (v_case_id, 'What is the most serious risk of giving charcoal?', '["Constipation", "Aspiration and lung damage", "Black stools", "None"]', 1, 'Charcoal pneumonitis is severe; never give to a patient with a protected airway.'),
    (v_case_id, 'Which of these is NOT a contraindication to charcoal?', '["Tylenol", "Alcohols", "Hydrocarbons", "Caustics"]', 0, 'Charcoal binds Tylenol well; it does not bind the others.');

    ---------------------------------------------------------------------------
    -- CASE 31: Valproic Acid Toxicity (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Ammonia Spike' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Ammonia Spike', 'A patient with an anti-epileptic overdose has a normal AST/ALT but a high ammonia level and is somnolent.', 31) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Ammonia Spike', "order" = 31 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What medication causes hyperammonemia without liver failure?', '["Phenytoin", "Valproic Acid", "Carbamazepine", "None"]', 1, 'Valproate inhibits urea cycle enzymes.'),
    (v_case_id, 'What is the specific treatment for Valproate-induced hyperammonemia?', '["Lactulose", "L-Carnitine", "Bicarbonate", "None"]', 1, 'L-carnitine helps restore the mitochondrial function needed for the urea cycle.'),
    (v_case_id, 'What other metabolic finding is common in Valproate toxicity?', '["Hypoglycemia", "Hypernatremia and Hypercalcemia", "None", "None"]', 1, 'Valproate is often formulated as a sodium salt.');

    ---------------------------------------------------------------------------
    -- CASE 32: Whole Bowel Irrigation - WBI (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Internal Flush' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Internal Flush', 'You are managing an ingestion of enteric-coated tablets or body packing.', 32) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Internal Flush', "order" = 32 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What solution is used for Whole Bowel Irrigation?', '["Saline", "Polyethylene Glycol (GoLYTELY)", "Milk", "None"]', 1, 'It is an iso-osmotic solution that flushes the gut without causing electrolyte shifts.'),
    (v_case_id, 'What is an absolute contraindication to WBI?', '["Tylenol", "Bowel obstruction or perforation", "Pregnancy", "None"]', 1, 'The bowel must be intact and open for WBI to work.'),
    (v_case_id, 'When is WBI specifically indicated?', '["Body packing or sustained-release/toxic metal ingestions", "Simple aspirin", "None", "None"]', 0, 'It is for "non-binding" or slow-release substances.');

    ---------------------------------------------------------------------------
    -- CASE 33: Wernicke-Korsakoff Syndrome (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Confusion and Ataxia' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Confusion and Ataxia', 'A malnourished alcoholic patient has nystagmus, ataxia, and confusion.', 33) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Confusion and Ataxia', "order" = 33 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying deficiency?', '["Vitamin B12", "Thiamine (Vitamin B1)", "Folate", "None"]', 1, 'Thiamine is a critical cofactor for glucose metabolism.'),
    (v_case_id, 'Why must Thiamine be given BEFORE Glucose?', '["For absorption", "Glucose can precipitate Wernicke''s by consuming the last bits of thiamine in the body", "None", "None"]', 1, 'Always "Thiamine then Glucose" in the malnourished.'),
    (v_case_id, 'What is the "Korsakoff" part of the syndrome?', '["Tremor", "Irreversible amnesia and confabulation", "None", "None"]', 1, 'Chronic thiamine deficiency leads to permanent brain damage.');

    ---------------------------------------------------------------------------
    -- CASE 34: Warfarin Overdose (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The High INR' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The High INR', 'A patient on Warfarin has an INR of 12.0 but no bleeding.', 34) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The High INR', "order" = 34 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the management for INR > 10 with no bleeding?', '["Hospitalize", "Hold Warfarin and give oral Vitamin K", "Give Plasma", "None"]', 1, 'Vitamin K 2.5-5mg PO is recommended.'),
    (v_case_id, 'What is the fastest way to reverse Warfarin in a patient with life-threatening bleeding?', '["Vitamin K", "Prothrombin Complex Concentrate (PCC) or Fresh Frozen Plasma (FFP)", "None", "None"]', 1, 'PCC is faster and more effective than FFP for immediate reversal.'),
    (v_case_id, 'How long does IV Vitamin K take to work?', '["10 minutes", "4 to 6 hours", "None", "None"]', 1, 'Vitamin K requires the liver to synthesize new factors, so it is not immediate.');

    ---------------------------------------------------------------------------
    -- CASE 35: Heparin Reversal (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Bleeding Line' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Bleeding Line', 'A patient is accidentally given a massive overdose of Unfractionated Heparin.', 35) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Bleeding Line', "order" = 35 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the specific reversal agent for Heparin?', '["Vitamin K", "Protamine Sulfate", "Tranexamic Acid", "None"]', 1, 'Protamine binds heparin in a 1:100 units ratio.'),
    (v_case_id, 'Does Protamine fully reverse Low Molecular Weight Heparin (Lovenox)?', '["Yes", "Only partially (~60%)", "No", "None"]', 1, 'Protamine is less effective for LMWH.'),
    (v_case_id, 'What is a dangerous side effect of rapid Protamine infusion?', '["Seizure", "Hypotension and Anaphylaxis", "None", "None"]', 1, 'It must be given slowly to avoid cardiovascular collapse.');

    ---------------------------------------------------------------------------
    -- CASE 36: DOAC Reversal (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'New Anticoagulants' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'New Anticoagulants', 'A patient on Dabigatran (Pradaxa) has a brain bleed.', 36) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'New Anticoagulants', "order" = 36 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the specific reversal agent for Dabigatran?', '["Andexanet alfa", "Idarucizumab (Praxbind)", "Vitamin K", "None"]', 1, 'It is a monoclonal antibody fragment that binds dabigatran.'),
    (v_case_id, 'What is the specific reversal agent for Factor Xa inhibitors (like Apixaban)?', '["Idarucizumab", "Andexanet alfa", "None", "None"]', 1, 'Andexanet alfa is a decoy Factor Xa molecule.'),
    (v_case_id, 'Which DOAC can be effectively removed by Hemodialysis?', '["Apixaban", "Dabigatran", "Rivaroxaban", "None"]', 1, 'Only Dabigatran has low protein binding and can be dialyzed.');

    ---------------------------------------------------------------------------
    -- CASE 37: MDMA Toxicity (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Rave Emergency' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Rave Emergency', 'A young patient at a dance party has a seizure. Sodium is 115 mEq/L.', 37) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Rave Emergency', "order" = 37 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the cause of hyponatremia in MDMA (Ecstasy) use?', '["Diarrhea", "Excessive water intake and drug-induced SIADH", "None", "None"]', 1, 'MDMA causes both thirst and ADH release.'),
    (v_case_id, 'How do you treat an hyponatremic seizure?', '["Restrict fluids", "Hypertonic Saline (3% NaCl) bolus", "Normal Saline", "None"]', 1, 'This is a neurological emergency requiring rapid correction of sodium.'),
    (v_case_id, 'What is the other major life-threat in MDMA overdose?', '["Liver failure", "Hyperthermia and Serotonin Syndrome", "None", "None"]', 1, 'Extreme hyperthermia can lead to MODS.');

    ---------------------------------------------------------------------------
    -- CASE 38: GHB Overdose (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Sudden Awakening' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Sudden Awakening', 'A patient is brought in completely unresponsive, but suddenly wakes up, becomes aggressive, then falls back asleep.', 38) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Sudden Awakening', "order" = 38 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What drug is characterized by this rapid, "yo-yo" mental status?', '["Heroin", "Gamma-hydroxybutyrate (GHB)", "Ketamine", "None"]', 1, 'GHB is a potent CNS depressant with a very short half-life.'),
    (v_case_id, 'What is the management for GHB overdose?', '["Naloxone", "Supportive (airway protection and observation)", "Flumazenil", "None"]', 1, 'There is no antidote; management is purely supportive.'),
    (v_case_id, 'Does GHB show up on a standard urine drug screen?', '["Yes", "No", "Only if high levels", "None"]', 1, 'It requires specialized testing.');

    ---------------------------------------------------------------------------
    -- CASE 39: Phencyclidine - PCP (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Super-Strength Agitation' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Super-Strength Agitation', 'A patient is extremely violent, seemingly immune to pain, and has multidirectional nystagmus.', 39) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Super-Strength Agitation', "order" = 39 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of nystagmus is most characteristic of PCP?', '["Horizontal", "Rotary or Vertical", "None", "None"]', 1, 'Nystagmus in multiple planes is a classic clue.'),
    (v_case_id, 'What is the primary danger to the patient in PCP toxicity?', '["Liver failure", "Rhabdomyolysis and traumatic injury to self/others", "None", "None"]', 1, 'Intense muscle activity and lack of pain can lead to massive CK elevation.'),
    (v_case_id, 'What is the preferred sedative for PCP agitation?', '["Haloperidol", "Benzodiazepines", "Ketamine", "None"]', 1, 'Benzos are first-line; antipsychotics can lower the seizure threshold.');

    ---------------------------------------------------------------------------
    -- CASE 40: Local Anesthetic Toxicity - LAST (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Lidocaine Crash' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Lidocaine Crash', 'During a procedure, a patient develops perioral numbness, a metallic taste, and then a seizure.', 40) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Lidocaine Crash', "order" = 40 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name for this syndrome?', '["Anaphylaxis", "Local Anesthetic Systemic Toxicity (LAST)", "None", "None"]', 1, 'It results from accidental intravascular injection or rapid absorption.'),
    (v_case_id, 'What is the specific antidote for LAST?', '["Naloxone", "Intravenous Lipid Emulsion (20% Intralipid)", "Bicarbonate", "None"]', 1, 'Lipids sequester the anesthetic and provide energy to the heart.'),
    (v_case_id, 'What is the first CNS symptom of LAST?', '["Seizure", "Tinnitus or metallic taste", "None", "None"]', 1, 'These are early warning signs of systemic absorption.');

    ---------------------------------------------------------------------------
    -- CASE 41: Body Stuffing (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Panic Swallow' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Panic Swallow', 'A person being pulled over quickly swallows a small bag of crack cocaine.', 41) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Panic Swallow', "order" = 41 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is a "body stuffer" different from a "body packer"?', '["They aren''t", "Stuffers swallow loose or poorly wrapped drugs in a panic; Packers carry well-wrapped drugs for transport", "None", "None"]', 1, 'Stuffers are at much higher risk for immediate toxicity because the "packaging" is poor.'),
    (v_case_id, 'What is the management for a stuffer?', '["Go home", "Low threshold for decontamination (if safe) and aggressive monitoring for toxicity", "None", "None"]', 1, 'They often require hospitalization for monitoring.'),
    (v_case_id, 'Is surgery typically indicated for stuffers?', '["Yes", "Rarely, as the bags usually break or pass; management is mostly medical", "None", "None"]', 1, 'Medical management of the resulting toxidrome is the standard.');

    ---------------------------------------------------------------------------
    -- CASE 42: Arsenic Poisoning (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Garlic Breath' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Garlic Breath', 'A patient presents with severe vomiting, "rice-water" diarrhea, and a garlic-like odor on their breath.', 42) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Garlic Breath', "order" = 42 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the suspected poison?', '["Lead", "Arsenic", "Mercury", "None"]', 1, 'Garlic breath and severe GI distress are classic for arsenic.'),
    (v_case_id, 'What is the EKG finding in chronic or acute arsenic poisoning?', '["Short QT", "QT Prolongation (risk of Torsades)", "None", "None"]', 1, 'Arsenic is cardiotoxic.'),
    (v_case_id, 'What is the chelator for arsenic?', '["Succimer", "British Anti-Lewisite (BAL/Dimercaprol)", "None", "None"]', 1, 'BAL is used for acute symptomatic poisoning.');

    ---------------------------------------------------------------------------
    -- CASE 43: Mercury Poisoning (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Tremor and Shyness' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Tremor and Shyness', 'A patient has a metallic taste, hand tremor, and extreme social withdrawal ("erethism").', 43) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Tremor and Shyness', "order" = 43 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which form of mercury is most toxic via inhalation?', '["Liquid", "Elemental Mercury Vapor", "Organic", "None"]', 1, 'Vapor is easily absorbed by the lungs and enters the brain.'),
    (v_case_id, 'What is "Acrodynia" in children?', '["Headache", "Pink, painful, peeling hands and feet", "None", "None"]', 1, 'This is a characteristic finding of mercury exposure in children.'),
    (v_case_id, 'Which mercury form is found in large predatory fish?', '["Vapor", "Methylmercury (Organic)", "None", "None"]', 1, 'Organic mercury bioaccumulates in the food chain.');

    ---------------------------------------------------------------------------
    -- CASE 44: Thallium Poisoning (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Hair Loss and Pain' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Hair Loss and Pain', 'A patient has severe painful neuropathy and suddenly loses all their hair (alopecia).', 44) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Hair Loss and Pain', "order" = 44 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the suspected toxin?', '["Lead", "Thallium", "Iron", "None"]', 1, 'The triad of GI distress, painful neuropathy, and alopecia is classic for thallium.'),
    (v_case_id, 'What is the antidote for thallium?', '["Charcoal", "Prussian Blue", "NAC", "None"]', 1, 'Prussian blue binds thallium in the gut and prevents its reabsorption.'),
    (v_case_id, 'Thallium mimics which electrolyte in the body?', '["Sodium", "Potassium", "Calcium", "None"]', 1, 'It has a similar ionic radius and interferes with K+-dependent enzymes.');

    ---------------------------------------------------------------------------
    -- CASE 45: Hydrofluoric Acid - HF (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Pain Out of Proportion' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Pain Out of Proportion', 'A glass etcher has severe, deep finger pain but no visible burn.', 45) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Pain Out of Proportion', "order" = 45 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is HF so dangerous despite its "weak acid" status?', '["It is hot", "The fluoride ion scavenges Calcium and Magnesium, causing cell death and lethal arrhythmias", "None", "None"]', 1, 'Severe hypocalcemia is the main threat.'),
    (v_case_id, 'What is the treatment for a local HF burn?', '["Vinegar", "Calcium Gluconate gel (or injection)", "None", "None"]', 1, 'Replacing the calcium neutralizes the fluoride.'),
    (v_case_id, 'What EKG finding is a sign of systemic HF toxicity?', '["Short QT", "QT Prolongation (due to hypocalcemia)", "None", "None"]', 1, 'Hypocalcemia causes the heart to crash.');

    ---------------------------------------------------------------------------
    -- CASE 46: Paraquat Poisoning (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Lung Scarrer' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Lung Scarrer', 'A patient ingests a potent herbicide and develops progressive respiratory failure.', 46) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Lung Scarrer', "order" = 46 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the toxin?', '["Glyphosate", "Paraquat", "None", "None"]', 1, 'Paraquat is highly toxic and causes irreversible pulmonary fibrosis.'),
    (v_case_id, 'Why should high-flow oxygen be AVOIDED in Paraquat poisoning?', '["It causes fire", "Oxygen increases the formation of toxic free radicals, worsening the lung damage", "None", "None"]', 1, 'Only give oxygen if absolutely necessary for severe hypoxia.'),
    (v_case_id, 'What is the prognosis for significant Paraquat ingestion?', '["Excellent", "Extremely poor (often fatal due to fibrosis)", "None", "None"]', 1, 'It is one of the most lethal herbicides.');

    ---------------------------------------------------------------------------
    -- CASE 47: Button Battery Ingestion (Case Files)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'The Esophageal Trap' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'The Esophageal Trap', 'A toddler swallows a large button battery. X-ray shows it is lodged in the esophagus.', 47) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'The Esophageal Trap', "order" = 47 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the immediate management?', '["Wait for it to pass", "Emergent endoscopic removal", "None", "None"]', 1, 'A battery in the esophagus can cause perforation within 2 hours due to alkali generation.'),
    (v_case_id, 'What is the "double-ring" sign on X-ray?', '["Two batteries", "A feature of button batteries that distinguishes them from coins", "None", "None"]', 1, 'This identifies it as a battery emergency.'),
    (v_case_id, 'If the battery is in the STOMACH and the child is asymptomatic, what is the management?', '["Surgery", "Observe and follow-up (usually passes safely)", "None", "None"]', 1, 'Once in the stomach, the risk is much lower.');

    ---------------------------------------------------------------------------
    -- CASE 48: The "One Pill Can Kill" List (Roberts & Hedges)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Toddler Danger' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Toddler Danger', 'A parent is worried because a toddler might have swallowed "just one" of their grandfather''s pills.', 48) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Toddler Danger', "order" = 48 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of these can be lethal to a toddler in a single-pill dose?', '["Amoxicillin", "Calcium Channel Blockers (e.g., Verapamil)", "Tylenol", "None"]', 1, 'CCBs, sulfonylureas, TCAs, and opioids are on the "one pill can kill" list.'),
    (v_case_id, 'What about topical products?', '["None", "Camphor and Methyl Salicylate (Oil of Wintergreen) are highly toxic to children in small amounts", "None", "None"]', 1, 'A teaspoon of Oil of Wintergreen is equivalent to ~20 aspirin.');

    ---------------------------------------------------------------------------
    -- CASE 49: Amanita phalloides - Mushroom (Tintinalli)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Death Cap Mushroom' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Death Cap Mushroom', 'A patient eats wild mushrooms, has delayed GI symptoms (12h), followed by a brief recovery, and now has fulminant liver failure.', 49) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Death Cap Mushroom', "order" = 49 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the toxin in the Death Cap?', '["Muscarine", "Amatoxin", "Psilocybin", "None"]', 1, 'Amatoxins inhibit RNA polymerase II, stopping protein synthesis.'),
    (v_case_id, 'What is a characteristic of "lethal" mushroom poisonings?', '["Immediate vomiting", "Delayed onset of GI symptoms (> 6 hours)", "None", "None"]', 1, 'Early vomiting usually suggests less toxic species; delayed onset is ominous.'),
    (v_case_id, 'What is the definitive treatment for severe amatoxin poisoning?', '["Activated charcoal", "Liver transplantation", "None", "None"]', 1, 'Once liver failure is established, transplant is often the only hope.');

    ---------------------------------------------------------------------------
    -- CASE 50: The Toxidrome Challenge (Step-Up to EM)
    ---------------------------------------------------------------------------
    SELECT id INTO v_case_id FROM case_studies WHERE topic_id = v_topic_id AND title = 'Mixed Toxidrome' LIMIT 1;
    IF v_case_id IS NULL THEN
        INSERT INTO case_studies (topic_id, title, scenario, "order")
        VALUES (v_topic_id, 'Mixed Toxidrome', 'A patient overdosed on a handful of "mixed pills" from a cabinet.', 50) RETURNING id INTO v_case_id;
    ELSE
        UPDATE case_studies SET scenario = 'Mixed Toxidrome', "order" = 50 WHERE id = v_case_id;
    END IF;

    DELETE FROM case_questions WHERE case_id = v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of death in undifferentiated poisoning?', '["Liver failure", "Airway and breathing failure", "None", "None"]', 1, 'Supportive care focusing on "ABCD" is the cornerstone of toxicology.'),
    (v_case_id, 'If you suspect a toxidrome but the patient is stable, what is the next best step?', '["Give all antidotes", "Identify the primary toxidrome by physical exam (vitals, pupils, skin, bowel sounds)", "None", "None"]', 1, 'Toxicology is a physical exam-based specialty.'),
    (v_case_id, 'What is the most useful "general" screening lab in toxicology?', '["Urine drug screen", "Serum Acetaminophen and Salicylate levels (often \"silent\" co-ingestants)", "None", "None"]', 1, 'Urine screens are often misleading; Tylenol/ASA levels are mandatory for most overdoses.');

    RAISE NOTICE 'SUCCESS: 50 Toxicology & Poisoning Case Blocks registered.';
END $$;

COMMIT;
