-- Migration: Systemic Microbiology Cases Part 4 (31-40)
-- Goal: Cover RNA Viruses, Fungi, Parasites, and Immunology
-- Sources: Clinical Microbiology Made Ridiculously Simple, Levinson, Parham

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'systemic-microbiology' LIMIT 1;

    -- DELETE existing cases for this range to prevent duplicates on re-run
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 31 AND 40);
    DELETE FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 31 AND 40;

    -- CASE 31: HIV/AIDS
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Oral Thrush and Low T-Cells', 'A 32-year-old man presents with chronic fatigue, weight loss, and white patches on his tongue (oral thrush). His CD4+ T-cell count is 150 cells/mm³.', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which viral protein is responsible for binding to the CD4 receptor on T cells?', '["gp120", "gp41", "p24", "Reverse transcriptase"]', 0, 'gp120 is the envelope glycoprotein that binds to CD4 and the co-receptor (CCR5 or CXCR4). gp41 facilitates fusion.'),
    (v_case_id, 'What is the function of the "Reverse Transcriptase" enzyme?', '["Synthesizes RNA from a DNA template", "Synthesizes DNA from an RNA template", "Cleaves polyproteins into functional units", "Integrates viral DNA into the host genome"]', 1, 'HIV is a retrovirus that uses reverse transcriptase to convert its single-stranded RNA genome into double-stranded DNA.'),
    (v_case_id, 'At what CD4+ count is a patient officially diagnosed with AIDS (Stage 3 HIV)?', '["< 500", "< 200", "< 100", "< 50"]', 1, 'An AIDS diagnosis is made when the CD4 count falls below 200 cells/mm³ or an AIDS-defining illness is present.');

    -- CASE 32: Hepatitis B (HBV)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Needlestick Injury', 'A healthcare worker experiences a needlestick injury from a patient with chronic Hepatitis B. Her labs show HBsAg positive, HBeAg positive, and Anti-HBc IgG positive.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the presence of HBeAg indicate in this patient?', '["Immunity", "High viral replication and infectivity", "Recovery phase", "Chronic carrier state without replication"]', 1, 'HBeAg (envelope antigen) is a marker of active viral replication and high infectivity.'),
    (v_case_id, 'What is the characteristic genome of Hepatitis B?', '["Double-stranded RNA", "Single-stranded RNA", "Partially double-stranded circular DNA", "Single-stranded DNA"]', 2, 'HBV is unique among hepatitis viruses as it has a partially double-stranded circular DNA genome and uses a reverse transcriptase during its replication cycle.'),
    (v_case_id, 'Which marker is the first to appear in the serum during an acute infection?', '["Anti-HBs", "HBsAg", "Anti-HBc", "HBeAg"]', 1, 'HBsAg (surface antigen) is the first marker detectable in the blood after infection.');

    -- CASE 33: Measles (Rubeola)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'White Spots in the Mouth', 'A 5-year-old unvaccinated child presents with high fever, cough, runny nose, and conjunctivitis. Small, white spots are seen on the buccal mucosa opposite the lower molars.', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the white spots in the mouth called?', '["Rose spots", "Koplik spots", "Condyloma lata", "Aphthous ulcers"]', 1, 'Koplik spots are pathognomonic for measles and appear before the characteristic maculopapular rash.'),
    (v_case_id, 'What are the "3 Cs" of measles?', '["Cough, Coryza, Conjunctivitis", "Cough, Constipation, Chills", "Coryza, Confusion, Cyanosis", "Cough, Cramps, Cold"]', 0, 'The prodrome of measles is classically described as fever followed by the 3 Cs: Cough, Coryza (runny nose), and Conjunctivitis.'),
    (v_case_id, 'What is a rare, fatal, late complication of measles that occurs years after the initial infection?', '["Encephalitis", "Subacute Sclerosing Panencephalitis (SSPE)", "Pneumonia", "Myocarditis"]', 1, 'SSPE is a progressive, fatal neurological disease caused by a persistent, defective measles virus in the brain.');

    -- CASE 34: Rabies
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Bat in the Bedroom', 'A man wakes up to find a bat in his bedroom. He is unsure if he was bitten but develops hydrophobia (fear of water) and severe agitation two months later.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the shape of the Rabies virus?', '["Icosahedral", "Bullet-shaped", "Filamentous", "Spherical"]', 1, 'Rabies (Rhabdoviridae) is a bullet-shaped virus.'),
    (v_case_id, 'What are the characteristic inclusion bodies seen in the neurons (Purkinje cells or hippocampus) of rabies patients?', '["Guarnieri bodies", "Negri bodies", "Cowdry A bodies", "Owl''s eye inclusions"]', 1, 'Negri bodies are eosinophilic cytoplasmic inclusions found in the brain of rabies victims.'),
    (v_case_id, 'How does the rabies virus travel from the wound to the CNS?', '["Via the bloodstream", "Via retrograde axonal transport in peripheral nerves", "Via the lymphatic system", "It does not travel; it infects the brain directly"]', 1, 'The virus binds to ACh receptors at the NMJ and travels retrograde to the CNS via peripheral nerves.');

    -- CASE 35: Cryptococcus neoformans
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Pigeon Droppings', 'An AIDS patient with a CD4 count of 50 presents with a severe headache and neck stiffness. A lumbar puncture is performed.', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What stain is used to visualize the thick capsule of this yeast in the CSF?', '["Gram stain", "India ink", "Acid-fast", "Silver stain"]', 1, 'India ink is used to highlight the wide capsule, which appears as a clear halo around the yeast.'),
    (v_case_id, 'What is the most sensitive test to diagnose Cryptococcal meningitis?', '["CSF culture", "Serum or CSF Cryptococcal antigen test", "PCR", "Blood culture"]', 1, 'The latex agglutination test for Cryptococcal capsular antigen is highly sensitive and specific.'),
    (v_case_id, 'Where is this fungus typically found in the environment?', '["Soil near rose bushes", "Pigeon droppings", "Desert sand", "Rotting wood"]', 1, 'Cryptococcus is heavily associated with pigeon droppings and is inhaled into the lungs.');

    -- CASE 36: Plasmodium falciparum (Malaria)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Cyclic Fevers', 'A traveler returning from Africa presents with high fevers every 48 hours, headache, and jaundice. A thick and thin blood smear shows "ring forms" within the RBCs.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which species of Plasmodium is most likely to cause severe, life-threatening malaria (e.g., cerebral malaria)?', '["P. vivax", "P. ovale", "P. malariae", "P. falciparum"]', 3, 'P. falciparum is the most dangerous species because it infects RBCs of all ages and causes sequestration (clumping) in small vessels.'),
    (v_case_id, 'Which forms of Plasmodium (vivax and ovale) can remain dormant in the liver?', '["Merozoites", "Hypnozoites", "Sporozoites", "Gametocytes"]', 1, 'Hypnozoites are the dormant stage in the liver that causes relapse months or years later.'),
    (v_case_id, 'What is the vector for malaria?', '["Ixodes tick", "Anopheles mosquito", "Aedes mosquito", "Tsetse fly"]', 1, 'Malaria is transmitted by the bite of the female Anopheles mosquito.');

    -- CASE 37: Toxoplasma gondii
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Ring-Enhancing Lesions', 'An HIV-positive patient presents with seizures. An MRI of the brain shows multiple "ring-enhancing" lesions.', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is this parasite typically transmitted to humans?', '["Ingestion of oocysts from cat feces or undercooked meat", "Bite of a sandfly", "Fecal-oral from human-to-human", "Direct skin penetration"]', 0, 'Toxoplasma is commonly acquired from cat litter or eating undercooked meat containing tissue cysts.'),
    (v_case_id, 'What is the triad of congenital toxoplasmosis?', '["Jaundice, anemia, fever", "Chorioretinitis, Hydrocephalus, and Intracranial calcifications", "Cataracts, deafness, and heart defects", "Rash, bone pain, and snuffles"]', 1, 'Congenital toxoplasmosis presents with chorioretinitis, hydrocephalus, and diffuse intracranial calcifications.'),
    (v_case_id, 'Which drug is used for prophylaxis in AIDS patients with CD4 counts < 100 to prevent Toxoplasma reactivation?', '["Acyclovir", "Fluconazole", "Trimethoprim-Sulfamethoxazole (TMP-SMX)", "Isoniazid"]', 2, 'TMP-SMX is used to prevent both Pneumocystis pneumonia (PCP) and Toxoplasmosis.');

    -- CASE 38: Entamoeba histolytica
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Liver Abscess', 'A patient presents with bloody diarrhea and right upper quadrant pain. An ultrasound reveals a large "anchovy paste" liver abscess.', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative agent?', '["Giardia lamblia", "Entamoeba histolytica", "Cryptosporidium", "Salmonella"]', 1, 'Entamoeba histolytica causes amoebic dysentery and can spread hematogenously to the liver, causing "anchovy paste" abscesses.'),
    (v_case_id, 'What is the characteristic finding on stool microscopy for this organism?', '["Trophozoites with engulfed RBCs", "Pear-shaped trophozoites with 4 flagella", "Acid-fast oocysts", "Larvae"]', 0, 'The presence of trophozoites containing ingested red blood cells (erythrophagocytosis) is diagnostic.'),
    (v_case_id, 'How does the colon look on biopsy in this infection?', '["Yellow pseudomembranes", "Flask-shaped ulcers", "Cobblestone appearance", "Diffuse inflammation"]', 1, 'E. histolytica causes characteristic "flask-shaped" ulcers in the colonic mucosa.');

    -- CASE 39: Immunology - SCID
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Bubble Boy', 'A 4-month-old male infant presents with chronic diarrhea, failure to thrive, and recurrent infections with bacteria, viruses, and fungi (including oral thrush and PCP pneumonia).', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Bruton Agammaglobulinemia", "Severe Combined Immunodeficiency (SCID)", "DiGeorge Syndrome", "Selective IgA Deficiency"]', 1, 'SCID involves defects in both B-cell and T-cell function, leading to susceptibility to all types of pathogens from early infancy.'),
    (v_case_id, 'What is a common genetic cause of autosomal recessive SCID?', '["Adenosine deaminase (ADA) deficiency", "IL-2 receptor gamma chain defect", "BTK gene mutation", "C3 deficiency"]', 0, 'ADA deficiency leads to the accumulation of toxic dATP, which kills lymphocytes. The IL-2 receptor defect is the most common X-linked cause.'),
    (v_case_id, 'What is the definitive treatment for SCID?', '["Monthly IVIG", "Bone marrow (stem cell) transplant", "Daily antibiotics", "Thymic transplant"]', 1, 'Stem cell transplant is necessary to provide a functioning immune system.');

    -- CASE 40: Immunology - Complement Deficiency
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Recurrent Meningitis', 'A 15-year-old boy presents with his third episode of Neisseria meningitidis meningitis.', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which immune defect is most likely present?', '["B-cell deficiency", "T-cell deficiency", "Terminal complement component (C5-C9) deficiency", "Chronic Granulomatous Disease"]', 2, 'Deficiencies in the Membrane Attack Complex (MAC, C5-C9) result in an inability to kill Neisseria species, which have thin cell walls.'),
    (v_case_id, 'What is the function of the C3b complement fragment?', '["Anaphylatoxin (triggers histamine)", "Opsonization (enhances phagocytosis)", "Chemotaxis for neutrophils", "Lysis of bacteria"]', 1, 'C3b acts as an opsonin, coating bacteria to make them easier for macrophages to find and eat. (Mnemonic: C3b "binds" bacteria).'),
    (v_case_id, 'Which complement fragments are responsible for anaphylaxis (C3a, C4a, C5a)?', '["C3a and C5a", "C1 and C2", "C5-C9", "Properdin"]', 0, 'C3a and C5a are anaphylatoxins that trigger mast cell degranulation, leading to increased vascular permeability and smooth muscle contraction.');

    RAISE NOTICE 'SUCCESS: Systemic Microbiology Cases Part 4 (31-40) registered.';
END $$;

COMMIT;
