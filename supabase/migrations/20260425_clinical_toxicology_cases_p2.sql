-- Migration: Clinical Toxicology Case Blocks (FIXED PART 2: 11-20)
-- Target: US MD / MBBS Year 2 Level (Stimulants, Metals & Gases)

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'clinical-toxicology' LIMIT 1;

    -- CASE 11: Cocaine
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A 28-year-old male presents to the ER with crushing chest pain and extreme agitation. He is diaphoretic and has a BP of 190/110. Pupils are 8mm and reactive. He admits to "partying hard" earlier that night.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What is the primary mechanism of action of the drug responsible for this presentation?', '["Blocks GABA reuptake", "Inhibits reuptake of Norepinephrine, Dopamine, and Serotonin", "Stimulates opioid receptors", "Inhibits Acetylcholinesterase"]', 1, 'Cocaine blocks the NET, DAT, and SERT transporters, leading to high synaptic catecholamine levels.'),
    (v_topic_id, v_case_id, 'Which medication class is considered the "first-line" for managing the hypertension and agitation in this patient?', '["Beta-blockers", "Benzodiazepines", "ACE inhibitors", "Statins"]', 1, 'Benzodiazepines reduce the central sympathetic drive and are the standard for stimulant-induced toxicity.'),
    (v_topic_id, v_case_id, 'Why are pure Beta-blockers (like Propranolol) traditionally avoided in this patient?', '["Risk of liver failure", "Unopposed Alpha-adrenergic stimulation causing coronary vasoconstriction", "Risk of renal failure", "They are ineffective"]', 1, 'Blocking Beta-2 (vasodilation) while Alpha-1 (vasoconstriction) is stimulated can cause a severe hypertensive crisis.');

    -- CASE 12: MDMA (Ecstasy)
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A 21-year-old female is brought from a "rave" with confusion and a generalized tonic-clonic seizure. She has been drinking massive amounts of water to stay hydrated. Lab results: Sodium 118 mEq/L.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What is the primary cause of hyponatremia in MDMA toxicity?', '["Excessive salt loss from sweating", "Inappropriate ADH secretion (SIADH) and excessive water intake", "Kidney failure", "Loss of sodium in the stool"]', 1, 'MDMA stimulates ADH release and users often drink excessive water, leading to dilutional hyponatremia.'),
    (v_topic_id, v_case_id, 'If this patient also developed a high fever and muscle rigidity, which syndrome should be suspected?', '["Neuroleptic Malignant Syndrome", "Serotonin Syndrome", "Malignant Hyperthermia", "Opioid Withdrawal"]', 1, 'MDMA has significant serotonergic activity and can trigger Serotonin Syndrome.'),
    (v_topic_id, v_case_id, 'Which electrolyte should be carefully monitored to prevent cerebral edema in this patient?', '["Potassium", "Sodium", "Calcium", "Magnesium"]', 1, 'Rapid corrections or severe hyponatremia can cause fatal brain swelling.');

    -- CASE 13: Lead Poisoning
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A 4-year-old boy living in an old apartment building presents with abdominal pain and constipation. His mother notes he has been "slower to learn" than his peers. Blood smear shows basophilic stippling of RBCs.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'Lead poisoning causes basophilic stippling primarily by inhibiting which enzyme?', '["Ferrochelatase", "ALA dehydratase", "Pyrimidine 5-nucleotidase", "Na/K ATPase"]', 2, 'Inhibition of pyrimidine 5-nucleotidase prevents the degradation of ribosomal RNA debris, seen as stippling.'),
    (v_topic_id, v_case_id, 'Which two enzymes in the heme synthesis pathway are inhibited by lead?', '["ALA dehydratase and Ferrochelatase", "Heme oxygenase and Isomerase", "Hexokinase and Enolase", "None"]', 0, 'This leads to the accumulation of ALA and protoporphyrin IX.'),
    (v_topic_id, v_case_id, 'What is the preferred oral chelator for a child with a lead level of 50 mcg/dL?', '["Penicillamine", "Succimer (DMSA)", "EDTA", "Dimercaprol (BAL)"]', 1, 'Succimer is the first-line oral chelator for lead in children.');

    -- CASE 14: Arsenic
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A 45-year-old male presents with severe "rice-water" diarrhea and a strange "garlic smell" on his breath. He recently started a new job in a pesticide manufacturing plant.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What is the mechanism of arsenic toxicity at the cellular level?', '["Inhibits ATP production by mimicking phosphate", "Blocks sodium channels", "Stimulates GABA", "Inhibits Acetylcholinesterase"]', 0, 'Arsenic competes with phosphate during glycolysis and the TCA cycle, preventing ATP generation.'),
    (v_topic_id, v_case_id, 'Chronic exposure to arsenic is most characteristically associated with which skin finding?', '["Hives", "Raindrop hyperpigmentation and palmoplantar hyperkeratosis", "Eczema", "Psoriasis"]', 1, 'Classic description of chronic arsenicosis skin changes.'),
    (v_topic_id, v_case_id, 'Arsenic exposure is a well-known risk factor for which type of cancer?', '["Angiosarcoma of the liver", "Squamous cell carcinoma of the skin", "Bladder cancer", "All of the above"]', 3, 'Arsenic is a multi-organ carcinogen.');

    -- CASE 15: Mercury
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'An 8-year-old child presents with pink, peeling, and painful hands and feet (Acrodynia). His father is a goldsmith who uses liquid mercury for extraction.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'Inhalation of elemental mercury vapor primarily causes toxicity in which system?', '["Renal", "Central Nervous System (Erethism)", "Hematologic", "Hepatic"]', 1, 'Vapor is lipid soluble and crosses the blood-brain barrier easily.'),
    (v_topic_id, v_case_id, 'Which classic historical syndrome is associated with mercury toxicity in hat-makers?', '["Mad Hatter Syndrome", "Pink Disease", "Minamata Disease", "None"]', 0, 'Felt hat production used mercury, causing neurological symptoms in workers.'),
    (v_topic_id, v_case_id, 'Which organic form of mercury bioaccumulates in fish and causes severe developmental neurotoxicity?', '["Elemental Mercury", "Methylmercury", "Mercuric Chloride", "Mercury oxide"]', 1, 'Methylmercury is the most neurotoxic organic form.');

    -- CASE 16: Cyanide
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A patient is rescued from a house fire. He is comatose with a lactic acid level of 15 mmol/L. His skin and mucous membranes appear cherry-red.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'Cyanide causes "cherry-red" skin because:', '["It binds to hemoglobin", "Cells cannot utilize oxygen (Histotoxic hypoxia)", "It causes vasodilation", "It increases red blood cell count"]', 1, 'Cells can''t use O2, so venous blood remains as oxygenated (red) as arterial blood.'),
    (v_topic_id, v_case_id, 'Cyanide inhibits which mitochondrial enzyme?', '["Complex I", "Cytochrome c oxidase (Complex IV)", "Succinate dehydrogenase", "ATP Synthase"]', 1, 'It binds to the Fe3+ in cytochrome oxidase, stopping the electron transport chain.'),
    (v_topic_id, v_case_id, 'What is the mechanism of the modern antidote Hydroxocobalamin?', '["It induces methemoglobinemia", "It reacts with cyanide to form Vitamin B12a (Cyanocobalamin)", "It provides a sulfur donor", "It directly stimulates the heart"]', 1, 'Hydroxocobalamin traps cyanide to form a non-toxic vitamin excreted by the kidneys.');

    -- CASE 17: Methemoglobinemia
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A patient undergoing an upper endoscopy receives "Benzocaine" spray for throat numbing. Shortly after, her oxygen saturation drops to 85% on the monitor, but her blood appears "chocolate-brown."')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What state is the iron in the heme group during methemoglobinemia?', '["Fe2+ (Ferrous)", "Fe3+ (Ferric)", "Fe4+", "None"]', 1, 'Ferric iron (Fe3+) cannot bind oxygen.'),
    (v_topic_id, v_case_id, 'Why is pulse oximetry unreliable in this patient?', '["The monitor is broken", "Methemoglobin absorbs light at the same wavelength as oxyhemoglobin (85%)", "The patient is cold", "None"]', 1, 'Methemoglobinemia often causes a "saturation gap" where the monitor reads ~85% regardless of true oxygenation.'),
    (v_topic_id, v_case_id, 'What is the treatment of choice?', '["Naloxone", "Methylene Blue", "Atropine", "Fomepizole"]', 1, 'Methylene blue acts as an electron donor to reduce Fe3+ back to Fe2+ via NADPH-dependent methemoglobin reductase.');

    -- CASE 18: Barbiturates
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A 60-year-old male is found in a deep coma. He has "blisters" on his knees and ankles where they were pressed together. His breathing is shallow and he is hypothermic.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What is the mechanism of action of Barbiturates at the GABA-A receptor?', '["Increase the frequency of chloride channel opening", "Increase the DURATION of chloride channel opening", "Antagonize Glutamate", "None"]', 1, 'Remember: Benzos = Frequency; Barbiturates = Duration.'),
    (v_topic_id, v_case_id, 'The presence of skin "bullae" (blisters) in a comatose patient is a classic clue for which poisoning?', '["Lead", "Barbiturates", "Opioids", "Arsenic"]', 1, 'Known as "Barbiturate blisters," though not 100% specific.'),
    (v_topic_id, v_case_id, 'What is the primary management for an acute barbiturate overdose?', '["Flumazenil", "Supportive care (Airway/Ventilation)", "Naloxone", "Physostigmine"]', 1, 'There is no specific antidote for barbiturates; airway management is critical.');

    -- CASE 19: Benzodiazepines
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A 25-year-old is brought to the ER "sleepy" after taking a handful of Xanax. His vital signs are stable: BP 120/80, HR 70, RR 14.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'Compared to Barbiturates, isolated Benzodiazepine overdose is generally:', '["Much more lethal", "Much less likely to cause fatal respiratory depression alone", "Always fatal", "None"]', 1, 'Benzos have a much wider therapeutic index and are "safer" in isolation.'),
    (v_topic_id, v_case_id, 'Which patient population is at the HIGHEST risk of seizure if Flumazenil is administered?', '["Children", "Chronic Benzodiazepine users or those with co-ingestion of TCAs", "Healthy adults", "Athletes"]', 1, 'Flumazenil can precipitate withdrawal seizures or unmask TCA-induced seizures.'),
    (v_topic_id, v_case_id, 'The sedation of Benzodiazepines is mediated by increasing the entry of which ion into neurons?', '["Sodium", "Chloride", "Potassium", "Calcium"]', 1, 'GABA-A is a ligand-gated chloride channel.');

    -- CASE 20: Alcohol Withdrawal
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A 50-year-old chronic alcoholic is admitted for surgery. 72 hours after admission, he becomes extremely agitated, sees "bugs crawling on the wall," and has a fever and tachycardia.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What is the most likely diagnosis?', '["Wernicke Encephalopathy", "Delirium Tremens (DTs)", "Alcoholic Hepatitis", "None"]', 1, 'DTs typically occur 48-96 hours after the last drink.'),
    (v_topic_id, v_case_id, 'Which class of medication is the treatment of choice?', '["Antipsychotics like Haloperidol", "Benzodiazepines", "Beta-blockers", "Antibiotics"]', 1, 'Benzos provide cross-tolerance to GABA receptors and prevent seizures.'),
    (v_topic_id, v_case_id, 'If this patient also had jaundice and liver failure, which Benzo would be preferred?', '["Diazepam", "Chlordiazepoxide", "Lorazepam (LOT drugs)", "None"]', 2, 'LOT (Lorazepam, Oxazepam, Temazepam) undergo only glucuronidation and don''t require oxidative liver metabolism.');

    RAISE NOTICE 'SUCCESS: Clinical Toxicology Cases (11-20) registered.';
END $$;

COMMIT;
