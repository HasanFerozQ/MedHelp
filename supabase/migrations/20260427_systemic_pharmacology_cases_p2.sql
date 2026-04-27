-- Migration: Systemic Pharmacology Cases Part 2 (11-20) - FIXED SCHEMA
-- Goal: Cover CNS and Pain Pharmacology
-- Sources: Lippincott, Katzung, Rang & Dale

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'systemic-pharmacology' LIMIT 1;

    -- DELETE existing cases for this range to prevent duplicates on re-run
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 11 AND 20);
    DELETE FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 11 AND 20;

    -- CASE 11: Antidepressant Toxicity (Serotonin Syndrome)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Serotonin Overdrive', 'A 28-year-old woman with a history of major depressive disorder is brought to the emergency department. She recently switched her medication from phenelzine to fluoxetine without a washout period. She presents with hyperthermia, muscle rigidity, myoclonus, and severe agitation.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Neuroleptic Malignant Syndrome", "Serotonin Syndrome", "Malignant Hyperthermia", "Anticholinergic Toxicity"]', 1, 'The combination of an MAOI (phenelzine) and an SSRI (fluoxetine) without a proper washout period causes life-threatening Serotonin Syndrome.'),
    (v_case_id, 'What is the mechanism of action of fluoxetine?', '["Inhibition of monoamine oxidase", "Blockade of serotonin and norepinephrine reuptake", "Selective blockade of serotonin reuptake", "Antagonism of 5-HT2A receptors"]', 2, 'Fluoxetine is a Selective Serotonin Reuptake Inhibitor (SSRI).'),
    (v_case_id, 'Which medication is the specific antidote for severe cases of this condition?', '["Dantrolene", "Bromocriptine", "Cyproheptadine", "Flumazenil"]', 2, 'Cyproheptadine is a 5-HT2 receptor antagonist used to treat severe Serotonin Syndrome.'),
    (v_case_id, 'Why is a 14-day washout period typically required when switching between an MAOI and an SSRI?', '["MAOIs cause irreversible enzyme inhibition", "SSRIs have an extremely long half-life", "To prevent receptor downregulation", "To allow clearance of active metabolites"]', 0, 'MAOIs (like phenelzine) bind irreversibly to the enzyme. It takes about two weeks for the body to synthesize new MAO enzymes.');

    -- CASE 12: Antipsychotics and Extrapyramidal Symptoms
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Lip Smacking Movements', 'A 35-year-old man with schizophrenia has been treated with haloperidol for the past year. He presents to his psychiatrist complaining of involuntary lip-smacking, tongue protrusion, and chewing motions.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of action of haloperidol?', '["Strong D2 receptor antagonism", "5-HT2A receptor antagonism", "Dopamine reuptake inhibition", "GABA receptor agonism"]', 0, 'Haloperidol is a high-potency typical antipsychotic that primarily blocks D2 dopamine receptors in the brain.'),
    (v_case_id, 'What is the name of the movement disorder this patient is experiencing?', '["Acute dystonia", "Akathisia", "Tardive dyskinesia", "Parkinsonism"]', 2, 'Tardive dyskinesia is characterized by involuntary, repetitive movements of the face and mouth, typically occurring after prolonged use of typical antipsychotics.'),
    (v_case_id, 'What is the proposed pathophysiology of this specific adverse effect?', '["Dopamine receptor supersensitivity (upregulation)", "Cholinergic excess", "Serotonin depletion", "Irreversible nerve damage"]', 0, 'Long-term blockade of D2 receptors leads to receptor upregulation and supersensitivity to dopamine in the nigrostriatal pathway.'),
    (v_case_id, 'If the patient were instead switched to an atypical antipsychotic like clozapine, which life-threatening side effect must be monitored with regular blood draws?', '["Agranulocytosis", "Hepatotoxicity", "Prolonged QT interval", "Aplastic anemia"]', 0, 'Clozapine carries a significant risk of agranulocytosis, requiring strict, regular monitoring of the absolute neutrophil count (ANC).');

    -- CASE 13: Sedative-Hypnotics (Benzodiazepines)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Benzodiazepine Overdose', 'A 40-year-old man is brought to the ER after an intentional overdose of diazepam and alcohol. He is deeply comatose, with a respiratory rate of 8 breaths per minute.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of action of diazepam?', '["Directly opens GABA-A chloride channels", "Increases the frequency of GABA-A chloride channel opening", "Increases the duration of GABA-A chloride channel opening", "Blocks NMDA glutamate receptors"]', 1, 'Benzodiazepines increase the FREQUENCY of chloride channel opening. Barbiturates increase the DURATION.'),
    (v_case_id, 'Which specific receptor site do benzodiazepines bind to?', '["The active site on the GABA molecule", "An allosteric site between the alpha and gamma subunits of the GABA-A receptor", "Inside the chloride channel pore", "The beta subunit of the GABA-B receptor"]', 1, 'Benzodiazepines bind to a specific allosteric site on the GABA-A receptor complex.'),
    (v_case_id, 'Which reversal agent was ordered for this patient?', '["Naloxone", "Flumazenil", "Physostigmine", "N-acetylcysteine"]', 1, 'Flumazenil is a competitive antagonist at the benzodiazepine binding site on the GABA-A receptor.'),
    (v_case_id, 'What is the most significant risk associated with administering this reversal agent in a patient with chronic benzodiazepine use?', '["Precipitation of acute seizures", "Severe hypertension", "Hepatotoxicity", "Respiratory depression"]', 0, 'Flumazenil can precipitate acute, life-threatening withdrawal seizures in patients who have developed dependence on benzodiazepines.');

    -- CASE 14: Antiepileptics
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Gum Overgrowth', 'A 22-year-old woman with a history of tonic-clonic seizures presents for a routine check-up. She has been taking phenytoin for two years. Physical examination reveals noticeable overgrowth of her gums.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary mechanism of action of phenytoin?', '["Enhancement of GABA inhibition", "Blockade of T-type calcium channels", "Use-dependent blockade of voltage-gated sodium channels", "Inhibition of glutamate release"]', 2, 'Phenytoin prolongs the inactivated state of voltage-gated sodium channels, preventing rapid, repetitive firing.'),
    (v_case_id, 'The overgrowth of her gums is a known adverse effect called gingival hyperplasia. What is the mechanism behind her megaloblastic anemia?', '["Iron deficiency", "Folate depletion", "Vitamin B12 deficiency", "Bone marrow suppression"]', 1, 'Phenytoin interferes with folate metabolism, leading to folate-deficiency megaloblastic anemia.'),
    (v_case_id, 'Phenytoin follows which type of elimination kinetics at therapeutic doses?', '["First-order kinetics", "Zero-order kinetics", "Second-order kinetics", "Exponential kinetics"]', 1, 'Phenytoin exhibits zero-order (capacity-limited) kinetics at therapeutic levels, meaning a small increase in dose can lead to a disproportionately large increase in plasma concentration.'),
    (v_case_id, 'If this patient were instead taking ethosuximide for absence seizures, what would its primary mechanism of action be?', '["Sodium channel blockade", "GABA transaminase inhibition", "Blockade of T-type calcium channels in the thalamus", "NMDA receptor antagonism"]', 2, 'Ethosuximide specifically blocks T-type calcium currents in thalamic neurons, which are responsible for the 3 Hz spike-and-wave discharges of absence seizures.');

    -- CASE 15: Parkinson''s Disease Pharmacology
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Hallucinations in Parkinson''s', 'A 68-year-old man with Parkinson''s disease is started on levodopa and carbidopa. After several weeks, his symptoms improve, but he begins experiencing occasional visual hallucinations.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is carbidopa always administered with levodopa?', '["It acts as a direct dopamine agonist in the brain", "It inhibits peripheral dopa decarboxylase, increasing levodopa bioavailability in the CNS", "It prevents the breakdown of dopamine in the synaptic cleft", "It prevents levodopa from crossing the blood-brain barrier"]', 1, 'Carbidopa cannot cross the BBB. It inhibits peripheral conversion of levodopa to dopamine, reducing systemic side effects (like nausea) and allowing more levodopa to enter the brain.'),
    (v_case_id, 'What is the cause of the patient''s visual hallucinations?', '["Excessive dopamine stimulation in the mesolimbic pathway", "Depletion of serotonin in the raphe nucleus", "Cholinergic excess in the striatum", "Peripheral dopamine conversion"]', 0, 'While levodopa restores dopamine in the nigrostriatal pathway to fix motor symptoms, excess dopamine in the mesolimbic pathway causes psychiatric side effects like hallucinations and psychosis.'),
    (v_case_id, 'Which medication could be added to inhibit the breakdown of dopamine specifically within the CNS via MAO-B inhibition?', '["Entacapone", "Selegiline", "Bromocriptine", "Amantadine"]', 1, 'Selegiline and Rasagiline are selective MAO-B inhibitors that prolong the action of dopamine in the brain.'),
    (v_case_id, 'Entacapone is often added to this regimen. What is its mechanism of action?', '["Peripheral COMT inhibitor", "Central COMT inhibitor", "Peripheral MAO inhibitor", "Direct D2 agonist"]', 0, 'Entacapone inhibits COMT in the periphery, further preventing the degradation of levodopa before it reaches the brain.');

    -- CASE 16: Opioid Analgesics
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Respiratory Depression', 'A 45-year-old man recovering from abdominal surgery is receiving intravenous morphine via a pump. The nurse finds him unresponsive with pinpoint pupils and a respiratory rate of 6 breaths per minute.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which specific opioid receptor is primarily responsible for both the profound analgesia and the severe respiratory depression seen in this patient?', '["Kappa (κ)", "Delta (δ)", "Mu (μ)", "Sigma (σ)"]', 2, 'The Mu (μ) receptor mediates supraspinal analgesia, respiratory depression, euphoria, and physical dependence.'),
    (v_case_id, 'At the cellular level, how does morphine affect neuronal transmission in the spinal cord?', '["It opens presynaptic sodium channels", "It closes presynaptic voltage-gated calcium channels and opens postsynaptic potassium channels", "It inhibits acetylcholinesterase", "It blocks NMDA receptors"]', 1, 'Opioids inhibit pain transmission by blocking presynaptic Ca2+ influx (reducing neurotransmitter release) and increasing postsynaptic K+ efflux (hyperpolarizing the neuron).'),
    (v_case_id, 'Which medication is an appropriate partial agonist that can precipitate withdrawal if given to a patient dependent on full agonists like morphine?', '["Fentanyl", "Methadone", "Buprenorphine", "Meperidine"]', 2, 'Buprenorphine is a partial Mu agonist. Due to its high affinity but low intrinsic activity, it can displace full agonists like morphine and precipitate withdrawal.'),
    (v_case_id, 'Tolerance develops to almost all side effects of opioids with chronic use, EXCEPT for which two symptoms?', '["Respiratory depression and euphoria", "Miosis and Constipation", "Nausea and Sedation", "Analgesia and Miosis"]', 1, 'Patients do not develop tolerance to the pinpoint pupils (miosis) or the slowed gut motility (constipation) caused by opioids.');

    -- CASE 17: NSAIDs
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'NSAID Induced Ulcer', 'A 60-year-old woman with severe osteoarthritis is prescribed celecoxib. She previously stopped taking ibuprofen due to recurrent gastric ulcers.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the primary advantage of celecoxib over ibuprofen regarding her gastrointestinal history?', '["It is a prodrug activated in the liver", "It selectively inhibits COX-2, sparing the gastric protective effects of COX-1", "It also contains a proton pump inhibitor", "It acts centrally rather than peripherally"]', 1, 'COX-1 produces cytoprotective prostaglandins in the stomach. Celecoxib selectively targets COX-2 (induced during inflammation), reducing the risk of GI ulcers.'),
    (v_case_id, 'Why is the use of celecoxib potentially dangerous given her cardiovascular history?', '["It causes severe hypotension", "It inhibits prostacyclin (PGI2) while sparing thromboxane A2 (TXA2), promoting thrombosis", "It directly causes arrhythmias", "It interacts negatively with statins"]', 1, 'COX-2 in endothelial cells produces PGI2 (anti-thrombotic/vasodilator). COX-1 in platelets produces TXA2 (pro-thrombotic). Selective COX-2 inhibition tips the balance toward thrombosis, increasing MI/stroke risk.'),
    (v_case_id, 'Which of the following NSAIDs acts by irreversibly inhibiting cyclooxygenase?', '["Naproxen", "Ibuprofen", "Aspirin", "Diclofenac"]', 2, 'Aspirin permanently acetylates and inhibits both COX-1 and COX-2. Platelets cannot synthesize new enzymes, so the antiplatelet effect lasts for the lifespan of the platelet (7-10 days).'),
    (v_case_id, 'What is the classic triad of "Aspirin Exacerbated Respiratory Disease" (AERD)?', '["Asthma, nasal polyps, and NSAID hypersensitivity", "Urticaria, angioedema, and hypotension", "Cough, fever, and eosinophilia", "Rhinitis, conjunctivitis, and eczema"]', 0, 'Inhibition of COX shunts arachidonic acid metabolism down the LOX pathway, causing an overproduction of leukotrienes, which trigger severe asthma and rhinitis in susceptible individuals.');

    -- CASE 18: Local Anesthetics
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Lidocaine and Epinephrine', 'A 25-year-old man presents to the clinic with a deep laceration. The physician injects lidocaine with epinephrine locally before suturing.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of action of lidocaine?', '["Blockade of presynaptic calcium channels", "Blockade of voltage-gated sodium channels from the intracellular side", "Enhancement of GABA-A receptors", "Blockade of NMDA receptors"]', 1, 'Local anesthetics cross the axonal membrane in their uncharged form, then become ionized intracellularly and block the voltage-gated sodium channel from the inside, preventing depolarization.'),
    (v_case_id, 'What is the purpose of adding epinephrine to the lidocaine injection?', '["To decrease pain upon injection", "To neutralize the acidic pH of the tissue", "To cause local vasoconstriction, thereby decreasing systemic absorption and prolonging the anesthetic effect", "To increase the spread of the anesthetic in the tissue"]', 2, 'Epinephrine (an alpha-1 agonist) causes vasoconstriction. This keeps the anesthetic localized, prolongs its duration of action, and reduces systemic toxicity.'),
    (v_case_id, 'Which nerve fibers are typically blocked FIRST by local anesthetics?', '["Large, myelinated motor fibers (Type A-alpha)", "Small, unmyelinated pain fibers (Type C)", "Medium, myelinated sensory fibers (Type A-beta)", "Autonomic preganglionic fibers (Type B)"]', 1, 'Local anesthetics block small, unmyelinated fibers (Type C - slow pain/temp) and small myelinated fibers (Type A-delta - fast pain/temp) before large motor fibers.'),
    (v_case_id, 'Lidocaine belongs to which class of local anesthetics, and where is it metabolized?', '["Ester, metabolized by plasma cholinesterases", "Amide, metabolized in the liver", "Ester, metabolized in the liver", "Amide, metabolized by plasma cholinesterases"]', 1, 'Lidocaine (note the two "i"s in its name) is an amide local anesthetic and is metabolized by hepatic cytochrome P450 enzymes.');

    -- CASE 19: General Anesthetics
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Rapid Awakening', 'A 30-year-old woman undergoes induction of anesthesia with intravenous propofol. Within 30 seconds, she is unconscious. Two minutes later, she regains consciousness briefly.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is the duration of action of a single bolus of propofol so brief (only a few minutes)?', '["Rapid metabolism in the liver", "Rapid renal excretion", "Redistribution from the brain to skeletal muscle and adipose tissue", "Enzymatic degradation in the plasma"]', 2, 'Highly lipid-soluble drugs like propofol rapidly enter the well-perfused brain (causing rapid onset) and then quickly redistribute to less-perfused tissues like muscle and fat, terminating their effect.'),
    (v_case_id, 'What is the primary mechanism of action of propofol?', '["NMDA receptor antagonism", "Potentiation of GABA-A receptors", "Blockade of voltage-gated sodium channels", "Activation of mu-opioid receptors"]', 1, 'Propofol is a potent agonist/modulator at the GABA-A receptor, enhancing inhibitory neurotransmission.'),
    (v_case_id, 'Which intravenous anesthetic acts by antagonizing the NMDA receptor, producing "dissociative anesthesia," and preserves respiratory drive?', '["Etomidate", "Thiopental", "Ketamine", "Midazolam"]', 2, 'Ketamine blocks the NMDA (glutamate) receptor. It increases heart rate and blood pressure and provides excellent analgesia while preserving breathing.'),
    (v_case_id, 'Regarding inhaled anesthetics, what does the Minimum Alveolar Concentration (MAC) measure?', '["The speed of induction", "The lipid solubility of the gas", "The potency of the anesthetic (dose required to prevent movement in 50% of patients)", "The rate of elimination"]', 2, 'MAC is inversely related to potency. A lower MAC means the drug is highly potent and lipid-soluble.');

    -- CASE 20: Drugs of Abuse
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Rave Collapse', 'A 22-year-old man collapses at a rave. He is agitated, sweating, with a temp of 103°F. His pupils are dilated, and he is grinding his teeth.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which substance did this patient most likely ingest?', '["Heroin", "Marijuana", "MDMA (Ecstasy)", "PCP (Phencyclidine)"]', 2, 'MDMA is an amphetamine derivative that causes profound release of both serotonin and norepinephrine, leading to hyperthermia, sympathetic overdrive, and classic jaw clenching (bruxism).'),
    (v_case_id, 'What is the mechanism of action of cocaine compared to amphetamines?', '["Cocaine increases presynaptic release; amphetamines block reuptake", "Cocaine blocks monoamine reuptake; amphetamines promote massive presynaptic release", "Both are direct receptor agonists", "Cocaine inhibits MAO; amphetamines inhibit COMT"]', 1, 'Cocaine primarily blocks the DAT, NET, and SERT transporters (reuptake inhibition). Amphetamines reverse these transporters, forcing neurotransmitters out of the vesicles and into the synapse.'),
    (v_case_id, 'Why is the administration of a pure beta-blocker (e.g., metoprolol) contraindicated in the management of cocaine-induced severe hypertension?', '["It will cause profound bradycardia and asystole", "It leaves alpha-1 mediated vasoconstriction unopposed, worsening the hypertension", "It increases the metabolism of cocaine into toxic metabolites", "It induces seizures"]', 1, 'Cocaine increases synaptic NE and Epi. Blocking beta-2 (vasodilation) receptors leaves all the catecholamines to act on alpha-1 receptors, causing a paradoxical and deadly spike in blood pressure.'),
    (v_case_id, 'A patient presents with nystagmus, extreme agitation, and a profound lack of pain response. Which drug is responsible?', '["LSD", "Cocaine", "PCP (Phencyclidine)", "Methamphetamine"]', 2, 'Rotatory/vertical nystagmus combined with violent behavior, hallucinations, and analgesia is the classic presentation of PCP intoxication (an NMDA receptor antagonist).');

    RAISE NOTICE 'SUCCESS: Systemic Pharmacology Cases Part 2 (11-20) registered with correct schema.';
END $$;

COMMIT;
