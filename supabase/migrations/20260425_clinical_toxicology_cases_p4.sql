-- Migration: Clinical Toxicology Case Blocks (FIXED PART 4: 31-40)
-- Target: US MD / MBBS Year 2 Level (Biological, Environmental & Industrial)

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'clinical-toxicology' LIMIT 1;

    -- CASE 31: Paraquat
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A farmer intentionally ingests a concentrated herbicide. Two weeks later, he presents with progressive shortness of breath and an X-ray showing diffuse pulmonary fibrosis.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'Which herbicide is notorious for causing progressive and often fatal pulmonary fibrosis?', '["Glyphosate (Roundup)", "Paraquat", "Atrazine", "2,4-D"]', 1, 'Paraquat is selectively taken up by lung cells (Type II pneumocytes).'),
    (v_topic_id, v_case_id, 'What is the cellular mechanism of Paraquat toxicity?', '["Inhibition of Acetylcholinesterase", "Generation of reactive oxygen species (superoxide radicals)", "Blocking sodium channels", "None"]', 1, 'Paraquat undergoes redox cycling, generating massive free radical damage.'),
    (v_topic_id, v_case_id, 'Why is high-flow oxygen traditionally avoided in the early management of Paraquat poisoning?', '["Oxygen is too expensive", "Oxygen provides a substrate for further free radical generation", "Oxygen causes seizures", "None"]', 1, 'High FiO2 can accelerate the oxidative damage in Paraquat-poisoned lungs.');

    -- CASE 32: Amatoxin (Mushrooms)
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A group of friends forages for mushrooms in the woods. 12 hours later, they develop severe vomiting and diarrhea. They seem to improve for a day, but then develop jaundice and altered mental status.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'Which mushroom genus is most likely responsible for this "delayed" fulminant liver failure?', '["Psilocybe", "Amanita (e.g., A. phalloides)", "Gyromitra", "None"]', 1, 'The "Death Cap" mushroom contains amatoxins.'),
    (v_topic_id, v_case_id, 'What is the biochemical target of Alpha-amanitin?', '["DNA Polymerase", "RNA Polymerase II", "60S Ribosome", "Mitochondria"]', 1, 'Amatoxin inhibits RNA Polymerase II, stopping mRNA synthesis and protein production.'),
    (v_topic_id, v_case_id, 'The "latent period" where the patient feels better before liver failure occurs is typical of which toxin?', '["Arsenic", "Amatoxin", "Cyanide", "None"]', 1, 'The delay between GI symptoms and organ failure is a hallmark of Amanita poisoning.');

    -- CASE 33: Botulism
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A 6-month-old infant is brought to the clinic for "floppiness" and a weak cry. The mother mentions she recently started adding raw honey to the baby''s formula.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What is the mechanism of the toxin produced by Clostridium botulinum?', '["Blocks the release of Glycine", "Cleaves SNARE proteins to prevent Acetylcholine release", "Blocks Muscarinic receptors", "None"]', 1, 'Botulinum toxin prevents the release of excitatory ACh at the neuromuscular junction.'),
    (v_topic_id, v_case_id, 'Infant botulism (as opposed to adult botulism) is typically caused by:', '["Ingestion of pre-formed toxin", "Ingestion of spores that colonize the GI tract", "Skin infection", "None"]', 1, 'Infants lack the gut flora to prevent spore germination; honey is a common source.'),
    (v_topic_id, v_case_id, 'What is the characteristic clinical presentation of botulism?', '["Ascending paralysis", "Symmetric descending paralysis starting with cranial nerves", "Spinal seizures", "None"]', 1, 'Botulism starts with "Diplopia, Dysphagia, Dysphonia" and moves downward.');

    -- CASE 34: Crotaline (Rattlesnake) Bite
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A hiker is bitten by a rattlesnake. Within 30 minutes, he has severe local swelling, bruising, and his blood test shows a dropping platelet count and elevated PT.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'Most North American pit viper (Crotaline) venoms are primarily:', '["Neurotoxic", "Hemotoxic and Cytotoxic", "Cardiotoxic", "None"]', 1, 'They cause tissue destruction and coagulopathy.'),
    (v_topic_id, v_case_id, 'What is the definitive treatment for a venomous snake bite with systemic symptoms?', '["Incision and suction", "Specific Antivenin (e.g., CroFab)", "Tourniquet", "None"]', 1, 'Antivenin neutralizes the circulating venom components.'),
    (v_topic_id, v_case_id, 'Which laboratory finding is typical in pit viper envenomation?', '["Hypernatremia", "Thrombocytopenia and Hypofibrinogenemia", "Leukopenia", "None"]', 1, 'Venom consumes clotting factors and platelets.');

    -- CASE 35: Black Widow Spider
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A man is bitten by a spider while cleaning his garage. 1 hour later, he has severe muscle cramps in his legs and his abdomen is "board-like" and rigid, simulating appendicitis.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'The venom of the Black Widow (Latrodectus) primarily acts by:', '["Causing skin necrosis", "Massive release of Acetylcholine and Norepinephrine", "Blocking sodium channels", "None"]', 1, 'Alpha-latrotoxin creates pores in the presynaptic membrane, leading to neurotransmitter dumping.'),
    (v_topic_id, v_case_id, 'The "board-like" abdomen in this patient is due to:', '["Peritonitis", "Severe muscle spasms", "Liver failure", "None"]', 1, 'Latrodectism causes intense muscle contractions.'),
    (v_topic_id, v_case_id, 'What is the primary treatment for most Black Widow bites?', '["Surgery", "Supportive care with opioids and benzodiazepines", "Antibiotics", "None"]', 1, 'Pain control and muscle relaxation are usually sufficient.');

    -- CASE 36: Brown Recluse Spider
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A woman presents with a "bullseye" lesion on her arm. Over the next 48 hours, the center of the lesion becomes dark and sunken, forming a necrotic eschar.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'The toxin responsible for the necrotic lesion of the Brown Recluse (Loxosceles) is:', '["Latrotoxin", "Sphingomyelinase D", "Hyaluronidase", "None"]', 1, 'Sphingomyelinase D causes neutrophil chemotaxis and tissue destruction.'),
    (v_topic_id, v_case_id, 'Besides local necrosis, severe Loxoscelism can rarely cause:', '["Paralysis", "Intravascular hemolysis and DIC", "Blindness", "None"]', 1, 'Systemic "Loxoscelism" is rare but dangerous.'),
    (v_topic_id, v_case_id, 'What is the management of the necrotic skin ulcer?', '["Immediate wide excision", "Supportive care and delayed debridement once the lesion stabilizes", "Antibiotics only", "None"]', 1, 'Early excision is not recommended as it may worsen the final outcome.');

    -- CASE 37: Strychnine
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A patient ingests an unknown rodenticide. He presents with extreme sensitivity to sound and light, and develops "spinal seizures" (Opisthotonus) where his back arches violently, but he remains fully conscious.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What is the mechanism of Strychnine toxicity?', '["GABA antagonist", "Glycine receptor antagonist in the spinal cord", "Dopamine agonist", "None"]', 1, 'Strychnine removes the inhibitory influence of glycine on the spinal reflex arc.'),
    (v_topic_id, v_case_id, 'The violent arching of the back (Opisthotonus) is due to:', '["Direct brain stimulation", "Involuntary contraction of all muscles (extensors overpowering flexors)", "Liver pain", "None"]', 1, 'Loss of inhibition leads to massive motor neuron firing.'),
    (v_topic_id, v_case_id, 'What is the priority in managing a strychnine-poisoned patient?', '["Giving the antidote", "Minimizing external stimuli (quiet, dark room) and controlling spasms with Benzos/Barbs", "Gastric lavage", "None"]', 1, 'Even a small sound can trigger a violent spasm.');

    -- CASE 38: Radiation / Radioactive Iodine
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'Following a nuclear power plant accident, the government distributes tablets to the local population to protect their thyroid glands.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What is the substance in these tablets?', '["Potassium Iodide (KI)", "Calcium Gluconate", "Sodium Bicarbonate", "None"]', 0, 'KI saturates the thyroid with stable iodine, preventing the uptake of radioactive I-131.'),
    (v_topic_id, v_case_id, 'Which cancer is the primary concern after exposure to radioactive iodine fallout?', '["Leukemia", "Papillary Thyroid Carcinoma", "Osteosarcoma", "None"]', 1, 'Especially in children and adolescents.'),
    (v_topic_id, v_case_id, 'Radiation-induced "Acute Radiation Syndrome" (ARS) GI stage is due to the destruction of:', '["Liver cells", "Intestinal crypt cells", "Neurons", "None"]', 1, 'Fast-dividing cells are most sensitive to radiation.');

    -- CASE 39: Body Packers
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A "mule" is arrested at the airport. He appears highly agitated, has a heart rate of 140, and then has a seizure. He is suspected of carrying multiple packets of cocaine in his GI tract.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'What is the most likely cause of the sudden seizure and tachycardia?', '["Withdrawal", "Rupture of one or more drug packets", "Fear", "None"]', 1, 'Packet rupture leads to a massive, life-threatening overdose.'),
    (v_topic_id, v_case_id, 'What is the preferred decontamination method for an ASYMPTOMATIC body packer?', '["Ipecac", "Whole Bowel Irrigation (PEG-ELS)", "Gastric Lavage", "None"]', 1, 'WBI helps pass packets safely without damaging them.'),
    (v_topic_id, v_case_id, 'What is the definitive treatment for a body packer with signs of packet rupture?', '["Naloxone", "Immediate surgical intervention (Laparotomy)", "Wait and see", "None"]', 1, 'Rupture of cocaine packets is a surgical emergency.');

    -- CASE 40: Vitamin A Toxicity
    INSERT INTO clinical_cases (topic_id, case_text) VALUES
    (v_topic_id, 'A patient on "Isotretinoin" for severe acne presents with persistent headaches and "blurry vision." Fundoscopic exam shows papilledema.')
    RETURNING id INTO v_case_id;

    INSERT INTO mcqs (topic_id, case_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, v_case_id, 'Chronic excess of Vitamin A can lead to which intracranial condition?', '["Stroke", "Pseudotumor Cerebri (Idiopathic Intracranial Hypertension)", "Brain tumor", "None"]', 1, 'Classic association with hypervitaminosis A.'),
    (v_topic_id, v_case_id, 'Which other physical finding is common in chronic Vitamin A toxicity?', '["Bleeding gums", "Dry skin and hepatosplenomegaly", "Pinpoint pupils", "None"]', 1, 'Also causes bone pain and hair loss.'),
    (v_topic_id, v_case_id, 'Besides medications, which food source is notorious for causing acute Vitamin A toxicity if consumed in large amounts?', '["Carrots", "Polar Bear Liver", "Orange juice", "None"]', 1, 'Historical reports from Arctic explorers.');

    RAISE NOTICE 'SUCCESS: Clinical Toxicology Cases (31-40) registered. Total 40 cases completed.';
END $$;

COMMIT;
