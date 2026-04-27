-- Migration: Final Toxicology Completion (294-335)
-- Goal: Add the final 42 UNIQUE questions to reach 335.

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'clinical-toxicology' LIMIT 1;

    -- INSERT FINAL 42
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which specific antidote is used to reverse the anticoagulant effect of Dabigatran (Pradaxa)?', '["Andexanet alfa", "Idarucizumab (Praxbind)", "Vitamin K", "Protamine"]', 1, 'Idarucizumab is a monoclonal antibody fragment that binds dabigatran.'),
    (v_topic_id, 'What is the reversal agent for Factor Xa inhibitors like Rivaroxaban and Apixaban?', '["Idarucizumab", "Andexanet alfa", "Glucagon", "Naloxone"]', 1, 'Andexanet alfa acts as a decoy for the factor Xa inhibitors.'),
    (v_topic_id, 'Which agent is used to reverse neuromuscular blockade caused by Rocuronium or Vecuronium?', '["Atropine", "Sugammadex", "Neostigmine", "Physostigmine"]', 1, 'Sugammadex encapsulates the relaxant molecule.'),
    (v_topic_id, 'Antidote for "Local Anesthetic Systemic Toxicity" (LAST) such as Bupivacaine overdose?', '["Naloxone", "Intravenous Lipid Emulsion (Intralipid)", "Epinephrine", "Atropine"]', 1, 'The "Lipid Sink" theory suggests it pulls lipid-soluble toxins out of tissues.'),
    (v_topic_id, 'Which plant is the natural source of the cardiac glycoside "Digitalis"?', '["Oleander", "Foxglove (Digitalis purpurea)", "Lily of the Valley", "None"]', 1, 'Foxglove leaves are the classic source.'),
    (v_topic_id, 'Which highly toxic plant contains "Aconitine," known as the "Queen of Poisons"?', '["Monkshood (Aconitum)", "Yew", "Rhubarb", "Hemlock"]', 0, 'Aconitine opens sodium channels, causing arrhythmias and death.'),
    (v_topic_id, 'The "Yew" tree contains which toxin that causes sudden cardiac arrest by inhibiting sodium/calcium transport?', '["Taxine", "Cicutoxin", "Coniine", "Ricin"]', 0, 'Almost all parts of the Yew tree are toxic.'),
    (v_topic_id, 'Which marine creature produces "Tetrodotoxin" besides the Pufferfish?', '["Blue-ringed Octopus", "Box Jellyfish", "Stonefish", "None"]', 0, 'A tiny bite can cause fatal paralysis.'),
    (v_topic_id, 'Which spider in Australia produces "Atracotoxin," a potent neurotoxin requiring specific antivenin?', '["Redback", "Sydney Funnel-web Spider", "Huntsman", "None"]', 1, 'Funnel-web venom causes massive neurotransmitter release.'),
    (v_topic_id, '"Berylliosis" (chronic lung disease) is associated with exposure in which industry?', '["Coal mining", "Aerospace and Electronics", "Dry cleaning", "Farming"]', 1, 'Beryllium is a lightweight metal used in high-tech industries.'),
    (v_topic_id, 'Which psychiatric medication is associated with "Ebstein Anomaly" (cardiac defect) if used in the first trimester?', '["Valproate", "Lithium", "Clozapine", "Sertraline"]', 1, 'A classic teratogen question.'),
    (v_topic_id, 'A patient on chronic "Warfarin" develops painful skin necrosis shortly after starting therapy. Why?', '["Overdose", "Protein C and S deficiency leading to hypercoagulability", "Allergy", "None"]', 1, 'Warfarin inhibits Protein C/S (anticoagulants) before it inhibits clotting factors.'),
    (v_topic_id, 'Which chemotherapy drug is famously associated with "Cardiotoxicity" and requires lifetime dose monitoring?', '["Cisplatin", "Doxorubicin (Adriamycin)", "Vincristine", "Bleomycin"]', 1, 'Causes dilated cardiomyopathy via free radicals.'),
    (v_topic_id, 'Which chemotherapy drug causes "Ototoxicity" and "Nephrotoxicity"?', '["Cisplatin", "Bleomycin", "Cyclophosphamide", "None"]', 0, 'Platinum-based drugs are toxic to ears and kidneys.'),
    (v_topic_id, 'Which chemotherapy drug is associated with "Pulmonary Fibrosis"?', '["Doxorubicin", "Bleomycin", "Cisplatin", "Vincristine"]', 1, 'Bleomycin causes oxidative damage to lung tissue.'),
    (v_topic_id, 'Which chemotherapy drug causes "Peripheral Neuropathy" (Foot drop/numbness)?', '["Cyclophosphamide", "Vincristine", "Bleomycin", "None"]', 1, 'Microtubule inhibitor.'),
    (v_topic_id, 'Which drug causes "Hemorrhagic Cystitis" (bloody urine)?', '["Vincristine", "Cyclophosphamide", "Cisplatin", "None"]', 1, 'Due to the metabolite Acrolein.'),
    (v_topic_id, 'Which agent is co-administered with Cyclophosphamide to prevent Hemorrhagic Cystitis?', '["MESNA", "N-acetylcysteine", "Leucovorin", "Allopurinol"]', 0, 'MESNA neutralizes acrolein in the bladder.'),
    (v_topic_id, '"Leucovorin Rescue" is used after high-dose therapy with which drug?', '["Methotrexate", "5-FU", "Cisplatin", "None"]', 0, 'Provides a source of reduced folate.'),
    (v_topic_id, 'Which chelator is contraindicated in patients with "Peanut Allergy" because it is prepared in peanut oil?', '["Succimer", "Dimercaprol (BAL)", "EDTA", "Penicillamine"]', 1, 'Essential safety fact for BAL administration.'),
    (v_topic_id, 'Which metal chelator is notoriously "Nephrotoxic" and requires close monitoring of kidney function?', '["Penicillamine", "EDTA", "Succimer", "None"]', 1, 'Calcium disodium EDTA can cause tubular necrosis.'),
    (v_topic_id, 'A patient with "Mushroom" poisoning has symptoms starting 12 hours after eating. This delay suggests:', '["Non-toxic mushroom", "Highly toxic (e.g., Amanita phalloides)", "Allergy", "None"]', 1, 'Longer latency = Higher toxicity.'),
    (v_topic_id, 'Which "Recreational" drug causes "Horizontal Nystagmus" and is a GABA-B agonist?', '["Cocaine", "GHB / Baclofen", "Heroin", "PCP"]', 1, 'GHB overdose presents with fluctuating consciousness.'),
    (v_topic_id, 'Which toxin is associated with "Minamata" disease in Japan?', '["Lead", "Methylmercury", "Cadmium", "Arsenic"]', 1, 'Organic mercury in fish.'),
    (v_topic_id, '"Scombroid" poisoning is due to the breakdown of which fish protein into Histamine?', '["Histidine", "Tyrosine", "Lysine", "None"]', 0, 'Occurs in Tuna and Mahi-Mahi.'),
    (v_topic_id, '"Ciguatera" toxin is produced by which organisms in the reef?', '["Fish", "Dinoflagellates (Gambierdiscus toxicus)", "Corals", "None"]', 1, 'Bioaccumulates up the food chain.'),
    (v_topic_id, 'What is the "First-line" treatment for "Latrodectism" (Black Widow bite) pain?', '["Naloxone", "Benzodiazepines and Opioids", "Antivenin for everyone", "None"]', 1, 'Antivenin is reserved for severe, refractory cases.'),
    (v_topic_id, 'Which "Marine" toxin causes "Reverse Cold-Hot Perception"?', '["Tetrodotoxin", "Ciguatoxin", "Saxitoxin", "None"]', 1, 'Classic board question.'),
    (v_topic_id, 'What is the "Antidote" for "Methemoglobinemia" in a patient with G6PD deficiency?', '["Methylene Blue", "Ascorbic Acid (Vitamin C)", "Hydroxocobalamin", "None"]', 1, 'Methylene blue can cause hemolysis; Vitamin C is the safer, slower alternative.'),
    (v_topic_id, 'Which gas, often used in "Firefighting," causes both CO and Cyanide poisoning?', '["Smoke (especially from plastics/wool)", "Oxygen", "Nitrogen", "None"]', 0, 'Combined toxicity is common in house fires.'),
    (v_topic_id, 'Which "Heavy Metal" was used in the "Mad Hatter" hat-making process?', '["Lead", "Mercury", "Arsenic", "Gold"]', 1, 'Elemental mercury vapor.'),
    (v_topic_id, 'The "Widmark Formula" for alcohol levels uses which constant "r" for men?', '["0.1", "0.68", "0.55", "1.0"]', 1, 'Represents the volume of distribution of ethanol.'),
    (v_topic_id, 'Which substance is used to "Avert" ingestion by its extremely bitter taste?', '["Salt", "Denatonium benzoate (Bitrex)", "Sugar", "Vinegar"]', 1, 'Used in household chemicals.'),
    (v_topic_id, 'Which toxin causes "Phossy Jaw" (mandibular necrosis)?', '["Lead", "White Phosphorus", "Mercury", "Iron"]', 1, 'Historical matchstick industry disease.'),
    (v_topic_id, '"Acrodynia" (Pink hands and feet) is a pediatric sign of:', '["Lead", "Mercury", "Arsenic", "None"]', 1, 'Chronic mercury exposure.'),
    (v_topic_id, 'Which toxin is associated with "Burton Line" (gum line)?', '["Mercury", "Lead", "Arsenic", "None"]', 1, 'Lead line.'),
    (v_topic_id, 'Which toxin causes "Mees Lines" (nails)?', '["Arsenic", "Lead", "Mercury", "None"]', 0, 'Classic transverse bands.'),
    (v_topic_id, 'Which gas is the "Silent Killer" (colorless, odorless, non-irritating)?', '["Cyanide", "Carbon Monoxide", "Chlorine", "None"]', 1, 'CO.'),
    (v_topic_id, 'Antidote for "Heparin" overdose?', '["Vitamin K", "Protamine Sulfate", "Naloxone", "None"]', 1, 'Ionically neutralizes heparin.'),
    (v_topic_id, 'Antidote for "Warfarin" rapid reversal?', '["Vitamin K", "Prothrombin Complex Concentrate (PCC) or FFP", "Heparin", "None"]', 1, 'Provides missing factors immediately.'),
    (v_topic_id, 'The "Rumack-Matthew" nomogram is ONLY valid for:', '["Chronic ingestion", "Single acute ingestion of Acetaminophen", "All drugs", "None"]', 1, 'Must be an acute dose.'),
    (v_topic_id, 'Which "Toxic Alcohol" causes "Snowstorm" vision?', '["Ethanol", "Methanol", "Ethylene Glycol", "None"]', 1, 'Formic acid injury.');

    RAISE NOTICE 'SUCCESS: Final 42 UNIQUE Toxicology questions added. Total = 335.';
END $$;

COMMIT;
