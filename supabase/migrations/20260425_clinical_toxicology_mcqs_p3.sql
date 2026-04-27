-- Migration: Year 2 - Clinical Toxicology MCQ Bank (PART 3: 141-210)
-- Date: 2026-04-25
-- Target: US MD / MBBS Level (Drugs of Abuse & Sedatives)

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'clinical-toxicology' LIMIT 1;

    -- SECTION 6: OPIOIDS (141-165)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which receptor is the primary target for the analgesic and respiratory depressive effects of opioids?', '["Mu", "Delta", "Kappa", "Sigma"]', 0, 'Mu-opioid receptors in the brainstem mediate respiratory depression.'),
    (v_topic_id, 'A patient with an opioid overdose presents with "Miosis." Which anatomical structure mediates this reflex?', '["Edinger-Westphal nucleus", "Superior cervical ganglion", "Ciliary ganglion", "Optic chiasm"]', 0, 'Opioids stimulate the EW nucleus, leading to parasympathetic pupillary constriction.'),
    (v_topic_id, 'What is the "First-line" antidote for opioid-induced respiratory depression?', '["Methadone", "Naloxone", "Buprenorphine", "Naltrexone"]', 1, 'Naloxone is a competitive mu-receptor antagonist with a rapid onset.'),
    (v_topic_id, 'Naloxone has a shorter half-life than many opioids. What is the clinical implication?', '["The patient will be permanently cured", "The patient may \"Resedate\" and stop breathing again once the naloxone wears off", "Naloxone causes liver failure", "None"]', 1, 'Observation for at least 4-6 hours is required after a "wake-up."'),
    (v_topic_id, 'Which opioid is famously associated with "Serotonin Syndrome" when combined with SSRIs?', '["Morphine", "Meperidine (Pethidine)", "Fentanyl", "Codeine"]', 1, 'Meperidine inhibits serotonin reuptake.'),
    (v_topic_id, 'Which opioid causes QTc prolongation and can lead to Torsades de Pointes?', '["Heroin", "Methadone", "Hydromorphone", "Oxycodone"]', 1, 'Methadone blocks the hERG potassium channel in the heart.'),
    (v_topic_id, 'Fentanyl "Chest Wall Rigidity" (Wooden Chest) is managed with:', '["Naloxone and potentially Neuromuscular blockers", "Aspirin", "Albuterol", "Laxatives"]', 0, 'Rapid IV fentanyl can cause severe muscle rigidity that makes ventilation impossible.'),
    (v_topic_id, 'What is the "Standard of Care" for opioid-dependent pregnant patients?', '["Cold turkey withdrawal", "Opioid Agonist Therapy (Methadone or Buprenorphine)", "Naloxone drip", "Detox"]', 1, 'Withdrawal in pregnancy is dangerous for the fetus; maintenance is safer.'),
    (v_topic_id, 'Which drug is a partial mu-agonist used for office-based opioid treatment?', '["Naloxone", "Buprenorphine", "Naltrexone", "Methadone"]', 1, 'Buprenorphine has a "ceiling effect" for respiratory depression.'),
    (v_topic_id, 'Why can Buprenorphine precipitate withdrawal if given to a patient actively using heroin?', '["It is more toxic", "It has a high affinity for the receptor but lower intrinsic activity (it displaces the full agonist)", "It is an antagonist", "None"]', 1, 'It kicks the heroin off the receptors but doesn''t activate them as strongly.'),
    (v_topic_id, 'A patient on chronic Methadone starts a drug that induces CYP3A4. What will happen?', '["Overdose", "Withdrawal symptoms", "No change", "Blindness"]', 1, 'Inducers speed up methadone metabolism, lowering blood levels.'),
    (v_topic_id, 'What are the features of "Opioid Withdrawal"?', '["Miosis, Bradycardia, Constipation", "Mydriasis, Tachycardia, Diarrhea, Goosebumps (Piloerection)", "Coma", "Sleepiness"]', 1, 'Withdrawal is the "opposite" of the drug effects; it is miserable but rarely fatal.'),
    (v_topic_id, '"Clonidine" is used in opioid withdrawal to:', '["Stop the craving", "Reduce sympathetic overactivity (Tachycardia, sweating, anxiety)", "Treat pain", "Stop diarrhea"]', 1, 'Alpha-2 agonists reduce the "norepinephrine storm" of withdrawal.'),
    (v_topic_id, 'Which opioid is used as a cough suppressant and has a risk of "Rapid Metabolism" in children via CYP2D6?', '["Morphine", "Codeine", "Fentanyl", "Heroin"]', 1, 'Codeine is converted to morphine; "Ultra-rapid metabolizers" can overdose on standard doses.'),
    (v_topic_id, 'Propoxyphene was withdrawn from the market primarily due to:', '["Liver failure", "Cardiotoxicity (Sodium channel blockade)", "Blindness", "Kidney stones"]', 1, 'Its metabolite, norpropoxyphene, is toxic to the heart.'),

    -- SECTION 7: STIMULANTS & ABUSE (166-185)
    (v_topic_id, 'What is the mechanism of action of Cocaine?', '["Blocks reuptake of Norepinephrine, Dopamine, and Serotonin", "Stimulates GABA", "Blocks Acetylcholine", "Stimulates Opioid receptors"]', 0, 'Cocaine also has local anesthetic properties by blocking sodium channels.'),
    (v_topic_id, 'What is the priority drug class for managing Cocaine-induced chest pain?', '["Beta-blockers", "Benzodiazepines", "Aspirin", "Nitroglycerin"]', 1, 'Benzos reduce the sympathetic drive and agitation.'),
    (v_topic_id, 'Why are "Pure Beta-blockers" (like Propranolol) traditionally avoided in Cocaine toxicity?', '["They cause liver failure", "Unopposed Alpha-stimulation can cause severe coronary vasoconstriction and hypertensive crisis", "They are too expensive", "They cause sleepiness"]', 1, 'Blocking Beta-2 (vasodilation) while Alpha-1 (vasoconstriction) is stimulated is dangerous.'),
    (v_topic_id, 'Cocaine-induced "Rhabdomyolysis" is primarily caused by:', '["Liver failure", "Extreme muscle activity, hyperthermia, and direct myotoxicity", "Kidney stones", "None"]', 1, 'Agitated delirium and seizures contribute to muscle breakdown.'),
    (v_topic_id, 'What is the mechanism of "Methamphetamine"?', '["Inhibits reuptake and promotes the massive release of catecholamines", "Blocks dopamine", "Stimulates GABA", "Inhibits acid"]', 0, 'It is more potent and longer-lasting than cocaine.'),
    (v_topic_id, 'The "Ecstasy" (MDMA) overdose is uniquely associated with which life-threatening electrolyte imbalance?', '["Hypercalcemia", "Hyponatremia (due to excess water intake and SIADH)", "Hyperkalemia", "Hypomagnesemia"]', 1, 'MDMA causes thirst and secretion of ADH, leading to dilutional hyponatremia and brain edema.'),
    (v_topic_id, '"Bath Salts" are synthetic derivatives of which natural stimulant?', '["Caffeine", "Cathinone (Khat)", "Ephedrine", "Cocaine"]', 1, 'Substituted cathinones (like MDPV) cause severe agitation and paranoia.'),
    (v_topic_id, 'Physical exam finding: "Skin picking (formication)" and "Meth mouth" are associated with:', '["Heroin", "Methamphetamine", "Marijuana", "Benzodiazepines"]', 1, 'The sensation of "bugs under the skin" leads to picking/sores.'),
    (v_topic_id, 'What is the treatment for "Body Stuffers" (those who swallow small amounts of drugs to avoid arrest)?', '["Surgery", "Observation and Activated Charcoal (if early)", "Emetics", "None"]', 1, 'Unlike "Packers," stuffers usually have poorly wrapped drugs that may rupture quickly.'),
    (v_topic_id, 'Which drug causes "Vertical and Horizontal Nystagmus" and extreme violence?', '["Cocaine", "PCP (Phencyclidine)", "LSD", "Heroin"]', 1, 'PCP is a dissociative anesthetic with high abuse potential.'),
    (v_topic_id, 'What is the mechanism of PCP?', '["GABA agonist", "NMDA receptor antagonist", "Mu agonist", "D2 antagonist"]', 1, 'Similar to Ketamine but with much more psychiatric agitation.'),
    (v_topic_id, 'Management of PCP-induced agitation?', '["Benzodiazepines and a quiet environment", "Antipsychotics like Haloperidol (use with caution)", "Beta-blockers", "None"]', 0, 'Minimize stimulation to prevent outbursts.'),
    (v_topic_id, 'Which hallucinogen acts as a 5-HT2A agonist?', '["PCP", "LSD (Lysergic acid diethylamide)", "Heroin", "Cocaine"]', 1, 'LSD causes vivid visual hallucinations and "synesthesia."'),
    (v_topic_id, 'Treatment for a "Bad Trip" on LSD?', '["Naloxone", "Benzodiazepines and \"Talking down\" in a calm room", "Gastric lavage", "Intubation"]', 1, 'Psychological support is usually sufficient.'),

    -- SECTION 8: SEDATIVES & WITHDRAWAL (186-210)
    (v_topic_id, 'What is the mechanism of Benzodiazepines?', '["GABA-A agonists that increase the FREQUENCY of chloride channel opening", "GABA-A agonists that increase the DURATION of opening", "Dopamine agonists", "Glutamate blockers"]', 0, 'Remember: Benzos = Frequency; Barbiturates = Duration.'),
    (v_topic_id, 'Which sedative has a "Narrow Therapeutic Index" and is much more likely to cause fatal respiratory depression alone?', '["Diazepam", "Phenobarbital (Barbiturates)", "Zolpidem", "Lorazepam"]', 1, 'Barbiturates can activate GABA receptors even in the absence of GABA.'),
    (v_topic_id, 'What is the "Antidote" for Benzodiazepine overdose?', '["Naloxone", "Flumazenil", "Physostigmine", "Atropine"]', 1, 'Used to reverse conscious sedation, but risky in chronic users.'),
    (v_topic_id, 'In an isolated Benzodiazepine overdose, the patient is usually:', '["Comatose but with stable vitals (The \"Sleeping Beauty\" coma)", "In cardiac arrest", "Having seizures", "Hyperactive"]', 0, 'Isolated oral benzo OD is rarely fatal; death usually involves co-ingestions (alcohol/opioids).'),
    (v_topic_id, 'GHB (Gamma-hydroxybutyrate) is known as a "Date Rape" drug because it causes:', '["Hyperactivity", "Profound sedation and anterograde amnesia", "Hair loss", "Vomiting only"]', 1, 'It acts on GHB and GABA-B receptors.'),
    (v_topic_id, 'Which withdrawal state is the MOST life-threatening?', '["Heroin", "Cocaine", "Ethanol / Benzodiazepines", "Marijuana"]', 2, 'Loss of GABA inhibition leads to excitotoxicity and fatal seizures.'),
    (v_topic_id, 'What is "Delirium Tremens" (DTs)?', '["A mild hangover", "Severe alcohol withdrawal with autonomic instability, fever, and hallucinations", "Liver failure", "Kidney failure"]', 1, 'Occurs 48-96 hours after the last drink; has a high mortality rate if untreated.'),
    (v_topic_id, 'What is the "First-line" treatment for Alcohol Withdrawal and DTs?', '["Ethanol", "Benzodiazepines (e.g., Diazepam, Chlordiazepoxide)", "Haloperidol", "Propranolol"]', 1, 'Benzos provide cross-tolerance to GABA receptors, preventing seizures.'),
    (v_topic_id, 'Which Benzo is preferred for alcohol withdrawal in a patient with Liver Failure?', '["Diazepam", "Chlordiazepoxide", "Lorazepam or Oxazepam (LOT drugs: Liver-OK)", "Midazolam"]', 2, 'LOT (Lorazepam, Oxazepam, Temazepam) undergo only glucuronidation and don''t require oxidative liver metabolism.'),
    (v_topic_id, '"Wernicke-Korsakoff Syndrome" is caused by a deficiency of:', '["Vitamin B12", "Thiamine (Vitamin B1)", "Vitamin C", "Iron"]', 1, 'Common in alcoholics; Thiamine is a cofactor for alpha-ketoglutarate dehydrogenase.'),
    (v_topic_id, 'The hallmark of Korsakoff Syndrome is:', '["Pinpoint pupils", "Confabulation (making up stories to fill memory gaps)", "Liver failure", "Seizures"]', 1, 'Anterograde and retrograde amnesia with confabulation.'),
    (v_topic_id, 'Which drug is used for "Aversion Therapy" in alcoholism by causing a sick reaction?', '["Naltrexone", "Disulfiram", "Acamprosate", "Topiramate"]', 1, 'Inhibits Aldehyde Dehydrogenase.'),
    (v_topic_id, 'What is the "Disulfiram Reaction"?', '["Happiness", "Severe flushing, tachycardia, vomiting, and headache", "Blindness", "Coma"]', 1, 'Due to acetaldehyde buildup.'),
    (v_topic_id, 'Which drug reduces cravings for alcohol by blocking mu-opioid receptors?', '["Disulfiram", "Naltrexone", "Acamprosate", "Diazepam"]', 1, 'Blocks the "reward" associated with drinking.'),
    (v_topic_id, 'Acamprosate (Campral) works by:', '["Averting alcohol", "Modulating Glutamate and GABA to restore balance", "Blocking dopamine", "Inducing sleep"]', 1, 'Used to maintain abstinence after detox.'),
    (v_topic_id, 'A patient presents with metabolic acidosis, "Ketosis WITHOUT Acidosis," and a large osmolar gap. They drank:', '["Ethanol", "Isopropanol", "Methanol", "Melted plastic"]', 1, 'Isopropanol toxicity.'),
    (v_topic_id, 'Which sedative is often associated with "Propofol Infusion Syndrome"?', '["Diazepam", "Propofol", "Ketamine", "Thiopental"]', 1, 'Characterized by metabolic acidosis, rhabdomyolysis, and cardiac failure.'),
    (v_topic_id, 'What is the clinical feature of Ketamine "Emergence Phenomenon"?', '["Deep sleep", "Vivid dreams, hallucinations, and delirium as the drug wears off", "Liver pain", "Hiccups"]', 1, 'Less common in children; managed with benzos.'),
    (v_topic_id, '"K-Hole" is a term used by abusers for which effect of Ketamine?', '["Euphoria", "Profound dissociation and feeling separated from the body", "Seizures", "Vomiting"]', 1, 'Due to its action as an NMDA antagonist.'),
    (v_topic_id, 'Which drug is often "cut" with Levamisole, leading to agranulocytosis and purpuric skin lesions?', '["Heroin", "Cocaine", "Methamphetamine", "LSD"]', 1, 'Levamisole is a veterinary dewormer used as a bulking agent.'),
    (v_topic_id, 'The use of "Narcan" (Naloxone) can be administered via which route in the community?', '["IV only", "Intranasal (Spray)", "Rectal", "Inhaled"]', 1, 'Intranasal kits are standard for first responders and family.');

    RAISE NOTICE 'SUCCESS: Clinical Toxicology MCQ Part 3 (141-210) registered.';
END $$;

COMMIT;
