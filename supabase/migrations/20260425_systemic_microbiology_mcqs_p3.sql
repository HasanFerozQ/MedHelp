-- Migration: Year 2 - Systemic Microbiology MCQ Bank (PART 3: 141-210)
-- Date: 2026-04-25
-- Based on: Clinical Microbiology Made Ridiculously Simple, Levinson, and Parham

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'systemic-microbiology' LIMIT 1;

    -- 2. Prevent Duplicates by removing existing questions for this part
    DELETE FROM mcqs 
    WHERE topic_id = v_topic_id 
    AND question IN (
        'Which fungus is characteristically seen as small yeasts within macrophages on biopsy of the liver or bone marrow?',
        'A patient from the Ohio River Valley presents with pneumonia. Sputum culture shows yeasts with broad-based budding. Diagnosis?',
        'Which fungus is a dimorphic fungus that causes "Captain''s wheel" shaped yeasts on biopsy?',
        'A gardener develops a chain of subcutaneous nodules on her arm after a rose thorn prick. Diagnosis?',
        'Which opportunistic fungus shows 45-degree (acute) branching, septate hyphae and can cause an "Aspergilloma" in a pre-existing TB cavity?',
        'A diabetic patient with ketoacidosis develops a rapidly progressive infection of the sinuses and brain. Biopsy shows non-septate hyphae branching at wide angles. Diagnosis?',
        'Which fungus causes "white patches" on the tongue (thrush) in infants or AIDS patients and forms germ tubes?',
        'What is the mechanism of action of Terbinafine?',
        'Which antifungal inhibits the synthesis of beta-(1,3)-D-glucan in the fungal cell wall?',
        'A patient presents with hypopigmented patches on the back. KOH prep shows "spaghetti and meatballs" appearance. Diagnosis?',
        'Which dermatophyte is the most common cause of "ringworm" (Tinea corporis)?',
        'A patient with AIDS develops a fever and headache. India ink preparation of the CSF shows a yeast with a thick capsule. What is the most appropriate initial treatment?',
        'A patient with malaria presents with recurring fevers every 48 hours. The blood smear shows "Schuffner dots." Which species is this?',
        'Which Plasmodium species is characterized by "banana-shaped" gametocytes on a blood smear and causes the most severe disease?',
        'A patient from the Northeastern US presents with fever and hemolytic anemia. Blood smear shows a "Maltese cross" formation within RBCs. Diagnosis?',
        'A patient presents with bloating, foul-smelling fatty stools, and abdominal cramps after drinking mountain stream water. Sputum/stool microscopy shows pear-shaped trophozoites with "two eyes." Diagnosis?',
        'A patient presents with bloody diarrhea and a liver abscess described as "anchovy paste." Diagnosis?',
        'A woman presents with foul-smelling, greenish vaginal discharge and a "strawberry cervix." Microscopy shows motile trophozoites with "jerky motility." Diagnosis?',
        'An AIDS patient presents with a headache and multiple ring-enhancing lesions on brain MRI. He has multiple cats at home. Diagnosis?',
        'Which parasite is transmitted by the Reduviid ("kissing") bug and causes Chagas disease (megacolon, megaesophagus, cardiomyopathy)?',
        'A patient from the Middle East presents with a non-healing skin ulcer. The organism is transmitted by the Sandfly. Diagnosis?',
        'Which parasite is the "brain-eating amoeba" found in warm freshwater?',
        'A patient from Africa presents with a "Winterbottom sign" (posterior cervical lymphadenopathy) and progressive somnolence (sleeping sickness). Diagnosis?',
        'Which drug is the first-line treatment for anaerobic bacteria and certain protozoa like Giardia and Trichomonas?',
        'A child presents with intense perianal itching at night. The "Scotch tape" test reveals eggs with a flattened side. Diagnosis?',
        'Which helminth is associated with Squamous Cell Carcinoma of the bladder and has a "terminal spine" on its eggs?',
        'A patient from the Mediterranean presents with a large cyst in the liver. Imaging shows "eggshell calcification." Aspiration carries a risk of anaphylaxis. Diagnosis?',
        'A patient presents with iron deficiency anemia and a history of walking barefoot on soil. Which "hookworm" is likely responsible?',
        'A patient presents with periorbital edema and muscle pain after eating undercooked "wild game" (e.g., bear meat). Diagnosis?',
        'A patient presents with "swimmer''s itch" after swimming in a lake. He later develops portal hypertension. Which Schistosoma species is this?',
        'What is the mechanism of action of Praziquantel?',
        'What is the role of the "Invariant Chain" (Ii) in MHC Class II processing?',
        'Which immunodeficiency is characterized by a failure to express MHC Class II molecules, leading to a severe lack of CD4+ T-cells?',
        'Which cytokine is produced by Th1 cells and is the most potent activator of Macrophages?',
        'What is the "Second Signal" required for T-cell activation, involving the interaction between CD28 on the T-cell and B7 on the APC?',
        'What is the function of the "Secretory Component" of IgA?',
        'Which process ensures that a B-cell expresses only one type of light chain and one type of heavy chain?',
        'Which receptor on the surface of epithelial cells is responsible for the transcytosis of IgA into the gut lumen?',
        'Which molecule acts as a "brake" on the immune response by binding to B7 with higher affinity than CD28?',
        'What is the mechanism of "Allelic Exclusion" in B-cell development?',
        'Which type of B-cell is found in the germinal centers of lymph nodes and is undergoing somatic hypermutation?',
        'Which enzyme is responsible for "Isotype Switching" and "Somatic Hypermutation" in B-cells?',
        'What is "Positive Selection" in the thymus?',
        'What is "Negative Selection" in the thymus?',
        'Which molecule is responsible for the transport of cytosolic peptides into the endoplasmic reticulum for loading onto MHC Class I?',
        'Which condition is caused by a deficiency in the AIRE gene, leading to multi-organ autoimmunity?',
        'What is "Cross-Presentation" in Dendritic cells?',
        'Which cells are the primary producers of Interferon-alpha?',
        'What is the function of the TAP transporter?',
        'Which molecule is the "light chain" of the MHC Class I molecule?',
        'What is the role of the "Proteasome" in antigen processing?',
        'Which cytokine drives the differentiation of naive T-cells into Th2 cells?',
        'Which cytokine drives the differentiation of naive T-cells into Th17 cells?',
        'What is the mechanism of "Peripheral Tolerance" involving T-cell anergy?',
        'Which cells are responsible for "Antigenic Variation" in Trypanosomes?',
        'What is the hallmark of "Bare Lymphocyte Syndrome Type I"?',
        'Which antibody isotype is found as a dimer in secretions?',
        'Which antibody isotype is the only one that crosses the placenta?',
        'What is the role of "N-nucleotides" in generating junctional diversity?',
        'Which cells are considered the "interferon factories" of the body?',
        'What is the mechanism of "Clonal Deletion"?',
        'Which molecule is the co-receptor for the T-cell receptor (TCR) on cytotoxic T-cells?',
        'Which molecule is the co-receptor for the TCR on helper T-cells?',
        'What is the function of the "HLA-DM" molecule in the MHC II pathway?',
        'Which complement pathway is considered part of the adaptive immune system because it requires antibodies?',
        'What is the function of "Properdin" in the alternative complement pathway?',
        'Which cytokine is the primary growth factor for T-cells?',
        'Which cells are responsible for the production of IL-4, IL-5, and IL-13?',
        'What is the role of "Follicular Dendritic Cells" (FDCs)?',
        'What is the function of "ADCC" (Antibody-Dependent Cellular Cytotoxicity)?'
    );

    -- SECTION 10: MYCOLOGY (141-155)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A patient from the Ohio River Valley presents with fever, cough, and hilar lymphadenopathy. Sputum reveals small, intracellular yeasts within macrophages. Diagnosis?', '["Histoplasmosis", "Blastomycosis", "Coccidioidomycosis", "Paracoccidioidomycosis"]', 0, 'Histoplasma capsulatum is the only systemic fungus that is smaller than an RBC and is found within macrophages. "Histo Hides in Histiocytes."'),
    (v_topic_id, 'Which systemic fungus is found in the Southwestern US (California, Arizona) and is characterized by "spherules containing endospores" in tissue?', '["Histoplasma", "Blastomyces", "Coccidioides", "Paracoccidioides"]', 2, 'Coccidioidomycosis ("Valley Fever") forms spherules in the lungs.'),
    (v_topic_id, 'A patient from the Great Lakes region presents with skin lesions and pneumonia. Biopsy shows "broad-based budding yeasts." Organism?', '["Histoplasma", "Blastomyces", "Coccidioides", "Cryptococcus"]', 1, 'Blastomyces dermatitidis has a thick wall and single broad-based buds. "Blasto Buds Broadly."'),
    (v_topic_id, 'A Brazilian farmer presents with painful mucosal ulcers in the mouth. Biopsy shows a yeast with a "Captain''s wheel" appearance. Diagnosis?', '["Blastomycosis", "Paracoccidioidomycosis", "Sporotrichosis", "Aspergillosis"]', 1, 'Paracoccidioides brasiliensis is found in Latin America and has multiple buds around a central cell.'),
    (v_topic_id, 'A gardener presents with a chain of subcutaneous nodules on his arm after a rose thorn prick. The organism is a dimorphic fungus. Diagnosis?', '["Tinea corporis", "Sporothrix schenckii", "Candida albicans", "Malassezia furfur"]', 1, 'Sporotrichosis ("Rose gardener''s disease") follows lymphatics.'),
    (v_topic_id, 'A patient with AIDS and a CD4 count of 80 presents with severe headache and neck stiffness. India ink stain of the CSF shows yeasts with a large halo. What is the primary source of this infection?', '["Pigeon droppings", "Soil in caves", "Rotting wood", "Normal skin flora"]', 0, 'Cryptococcus neoformans is associated with pigeon droppings and enters via inhalation.'),
    (v_topic_id, 'Which fungus is characterized by "45-degree (acute) branching, septate hyphae" and can cause a "fungus ball" in pre-existing lung cavities?', '["Mucor", "Aspergillus fumigatus", "Candida", "Histoplasma"]', 1, 'Aspergillus shows acute branching. Mucor/Rhizopus show wide-angle (90-degree) branching.'),
    (v_topic_id, 'A diabetic patient in DKA presents with black eschar on the palate and proptosis. The organism shows "non-septate hyphae branching at wide angles." Treatment?', '["Fluconazole", "Amphotericin B and surgical debridement", "Nystatin", "Griseofulvin"]', 1, 'Mucormycosis is a surgical emergency; Ampho B is the drug of choice.'),
    (v_topic_id, 'Which fungus causes "white patches" in the mouth that can be scraped off, leaving an erythematous base?', '["Candida albicans", "Oral Hairy Leukoplakia", "Stomatitis", "HPV"]', 0, 'Oral thrush (Candidiasis) can be scraped off, unlike EBV-induced hairy leukoplakia.'),
    (v_topic_id, 'A patient with AIDS has a ground-glass appearance on CXR and a CD4 count < 200. The organism was once classified as a protozoan but is now a fungus. Diagnosis?', '["Toxoplasma", "Pneumocystis jirovecii", "Cryptosporidium", "CMV"]', 1, 'PCP is a yeast-like fungus. Silver stain shows disc-shaped cysts.'),
    (v_topic_id, 'What is the mechanism of action of Terbinafine, used for dermatophyte infections (Onychomycosis)?', '["Inhibits ergosterol synthesis by blocking squalene epoxidase", "Binds to ergosterol to form pores", "Inhibits beta-glucan synthesis", "Inhibits microtubule assembly"]', 0, 'Terbinafine blocks squalene epoxidase. Azoles block 14-alpha-demethylase.'),
    (v_topic_id, 'Which antifungal inhibits the synthesis of beta-(1,3)-D-glucan, a key component of the fungal cell wall?', '["Amphotericin B", "Caspofungin (Echinocandins)", "Fluconazole", "Flucytosine"]', 1, 'Echinocandins (the "fungins") target the cell wall (glucan).'),
    (v_topic_id, 'A patient presents with hypopigmented patches on their back that do not tan. KOH prep shows "spaghetti and meatballs." Diagnosis?', '["Tinea corporis", "Tinea versicolor", "Vitiligo", "Psoriasis"]', 1, 'Malassezia furfur causes tinea versicolor.'),
    (v_topic_id, 'A child has a circular, itchy, red rash with central clearing on his arm. This is Tinea corporis ("ringworm"). What is the causative agent?', '["Candida", "Dermatophytes (e.g. Trichophyton)", "Staphylococcus aureus", "Scabies"]', 1, 'Dermatophytes consume keratin and cause tinea infections.'),
    (v_topic_id, 'Which antifungal is converted to 5-fluorouracil (5-FU) inside the fungal cell and inhibits DNA/RNA synthesis?', '["Fluconazole", "Flucytosine", "Amphotericin B", "Griseofulvin"]', 1, 'Flucytosine is often used in combination with Ampho B for Cryptococcal meningitis.');

    -- SECTION 11: PARASITOLOGY - PROTOZOA (156-175)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A traveler returning from Africa has cyclic fevers every 48 hours. A blood smear shows RBCs with "Schuffner dots." Which Plasmodium species is this?', '["P. falciparum", "P. vivax / P. ovale", "P. malariae", "P. knowlesi"]', 1, 'P. vivax/ovale have a 48-hour cycle (tertian) and Schuffner dots. They also have a dormant liver stage (hypnozoites).'),
    (v_topic_id, 'A patient with malaria has "banana-shaped" gametocytes on a blood smear. Which Plasmodium species is this?', '["P. vivax", "P. malariae", "P. falciparum", "P. ovale"]', 2, 'P. falciparum is the most severe and has characteristic crescent-shaped gametocytes.'),
    (v_topic_id, 'A patient in the Northeast US (Long Island) presents with fever and hemolytic anemia. Blood smear shows "Maltese cross" formations within RBCs. Diagnosis?', '["Malaria", "Babesiosis", "Lyme Disease", "Rocky Mountain Spotted Fever"]', 1, 'Babesia microti is transmitted by the same tick as Lyme (Ixodes) and forms tetrads (Maltese cross).'),
    (v_topic_id, 'A patient presents with foul-smelling, fatty stools (steatorrhea) after a hiking trip. Stool exam shows pear-shaped, flagellated trophozoites with "two eyes." Diagnosis?', '["Entamoeba histolytica", "Giardia lamblia", "Cryptosporidium", "Balantidium coli"]', 1, 'Giardia is found in mountain streams and interferes with fat absorption.'),
    (v_topic_id, 'A patient has bloody diarrhea and an "anchovy paste" liver abscess. Stool exam shows trophozoites with ingested RBCs. Diagnosis?', '["Giardia", "Entamoeba histolytica", "Shigella", "Salmonella"]', 1, 'Entamoeba histolytica causes amoebic dysentery and liver abscesses. Trophozoites with RBCs are pathognomonic.'),
    (v_topic_id, 'An HIV patient with a CD4 count of 50 presents with profuse, watery diarrhea. Acid-fast stain of the stool shows oocysts. Diagnosis?', '["Giardia", "Cryptosporidium parvum", "Isospora belli", "Cyclospora"]', 1, 'Cryptosporidium is a major cause of chronic diarrhea in AIDS patients; it is acid-fast.'),
    (v_topic_id, 'A woman presents with a foul-smelling, greenish vaginal discharge and an itchy "strawberry cervix." Trophozoites on wet mount show "jerky motility." Diagnosis?', '["Candida", "Bacterial Vaginosis", "Trichomonas vaginalis", "Chlamydia"]', 2, 'Trichomoniasis is a sexually transmitted protozoan infection.'),
    (v_topic_id, 'A 30-year-old male from Central America presents with a new-onset seizure. Head CT shows multiple "ring-enhancing" lesions. He has a cat at home and is HIV positive. Diagnosis?', '["Neurocysticercosis", "Toxoplasmosis", "Primary CNS Lymphoma", "Brain abscess"]', 1, 'Toxoplasma gondii is the #1 cause of ring-enhancing lesions in AIDS. It is often transmitted via cat feces or undercooked meat.'),
    (v_topic_id, 'Which protozoan is transmitted by the Reduviid bug ("kissing bug") and can cause Chagas disease (megacolon, megaesophagus, cardiomyopathy)?', '["Trypanosoma brucei", "Trypanosoma cruzi", "Leishmania donovani", "Toxoplasma"]', 1, 'T. cruzi is found in South/Central America. T. brucei causes African Sleeping Sickness (Tsetse fly).'),
    (v_topic_id, 'A patient returning from the Middle East has a non-healing skin ulcer. A biopsy shows amastigotes within macrophages. What is the vector?', '["Anopheles mosquito", "Sandfly", "Tsetse fly", "Flea"]', 1, 'Leishmaniasis is transmitted by the sandfly.'),
    (v_topic_id, 'Which protozoan causes "Kala-azar" (visceral leishmaniasis), characterized by massive splenomegaly, pancytopenia, and fever?', '["L. tropica", "L. donovani", "T. brucei", "P. falciparum"]', 1, 'Visceral leishmaniasis is fatal if untreated; amastigotes are found in the bone marrow/spleen.'),
    (v_topic_id, 'A person swimming in a warm freshwater lake develops a rapidly fatal meningoencephalitis. The organism entered via the cribriform plate. Diagnosis?', '["Naegleria fowleri", "Acanthamoeba", "Toxoplasma", "HSV-1"]', 0, 'Naegleria fowleri is the "brain-eating amoeba."'),
    (v_topic_id, 'Which parasite is associated with "Winterbottom sign" (posterior cervical lymphadenopathy) and is transmitted by the Tsetse fly?', '["Trypanosoma cruzi", "Trypanosoma brucei", "Leishmania", "Babesia"]', 1, 'T. brucei (gambiense/rhodesiense) causes African Sleeping Sickness.'),
    (v_topic_id, 'A patient with AIDS has a CD4 count of 200 and develops a brain abscess. If the cause is a parasite from pork, and he has multiple small cysts in the brain, what is it?', '["Toxoplasma", "Neurocysticercosis (Taenia solium)", "Echinococcus", "Cryptococcus"]', 1, 'Neurocysticercosis is caused by ingesting Taenia solium eggs (not the larvae in meat).'),
    (v_topic_id, 'What is the drug of choice for treating Giardia, Entamoeba, and Trichomonas?', '["Praziquantel", "Metronidazole", "Chloroquine", "Albendazole"]', 1, 'Metronidazole is effective against anaerobic bacteria and certain protozoa (GET GAP: Giardia, Entamoeba, Trichomonas, Gardnerella, Anaerobes, Pylori).');

    -- SECTION 12: PARASITOLOGY - HELMINTHS (176-190)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A child has perianal itching at night. The "Scotch tape" test shows eggs with a flattened side. Diagnosis?', '["Ascaris lumbricoides", "Enterobius vermicularis (Pinworm)", "Strongyloides", "Ancylostoma"]', 1, 'Enterobius is the most common helminth in the US.'),
    (v_topic_id, 'Which helminth infection is associated with an increased risk of Cholangiocarcinoma (bile duct cancer)?', '["Schistosoma haematobium", "Clonorchis sinensis", "Paragonimus westermani", "Fasciola hepatica"]', 1, 'Clonorchis (Chinese liver fluke) is found in undercooked fish and causes biliary inflammation/cancer.'),
    (v_topic_id, 'A patient from Egypt presents with hematuria. Bladder biopsy shows Squamous Cell Carcinoma. Which parasite is the likely trigger?', '["Schistosoma mansoni", "Schistosoma haematobium", "Schistosoma japonicum", "Echinococcus"]', 1, 'S. haematobium eggs have a terminal spine and cause chronic bladder irritation.'),
    (v_topic_id, 'A patient develops an "eggshell calcification" in the liver on CT. Aspiration of the cyst could lead to anaphylactic shock. Diagnosis?', '["Entamoeba", "Echinococcus granulosus", "Taenia solium", "Ascaris"]', 1, 'Hydatid cysts from Echinococcus (dog tapeworm) must be handled carefully to avoid spilling high-antigen fluid.'),
    (v_topic_id, 'Which helminth is a "hookworm" that causes microcytic anemia by sucking blood from the intestinal wall?', '["Ascaris lumbricoides", "Ancylostoma duodenale / Necator americanus", "Strongyloides stercoralis", "Trichinella spiralis"]', 1, 'Hookworms enter through the feet and travel to the lungs, then the gut.'),
    (v_topic_id, 'A patient presents with myalgias, periorbital edema, and eosinophilia after eating undercooked "wild game" (e.g. bear meat). Diagnosis?', '["Strongyloides", "Trichinella spiralis", "Taenia saginata", "Diphyllobothrium latum"]', 1, 'Trichinosis involves larvae encysting in striated muscle.'),
    (v_topic_id, 'Which helminth is a very long tapeworm from raw fish that causes Vitamin B12 deficiency (megaloblastic anemia)?', '["Taenia saginata", "Diphyllobothrium latum", "Hymenolepis nana", "Echinococcus"]', 1, 'Diphyllobothrium latum competes with the host for B12 in the gut.'),
    (v_topic_id, 'A patient has "swimmer''s itch" after swimming in a lake. Later, they develop portal hypertension and splenomegaly. Which Schistosoma species has a large lateral spine?', '["S. haematobium", "S. mansoni", "S. japonicum", "S. mekongi"]', 1, 'S. mansoni has a lateral spine; S. haematobium has a terminal spine.'),
    (v_topic_id, 'Which helminth causes Loeffler syndrome (eosinophilic pneumonitis) during its migration through the lungs?', '["Enterobius", "Ascaris lumbricoides", "Trichuris trichiura", "Dracunculus"]', 1, 'Ascaris is the giant roundworm. Eggs are ingested, larvae go to lungs, are coughed up and swallowed back to the gut.'),
    (v_topic_id, 'What is the drug of choice for most Trematode (fluke) and Cestode (tapeworm) infections?', '["Albendazole", "Praziquantel", "Ivermectin", "Chloroquine"]', 1, 'Praziquantel increases calcium permeability, causing paralysis of the worm. "Praziquantel for Platyhelminths."');

    -- SECTION 13: ADAPTIVE IMMUNITY (191-210) (Parham Focus)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which molecule is responsible for transporting processed peptides from the cytosol into the endoplasmic reticulum for loading onto MHC Class I?', '["TAP (Transporter associated with Antigen Processing)", "CLIP", "HLA-DM", "Invariant chain"]', 0, 'TAP moves peptides into the ER. Deficiency in TAP leads to "Bare Lymphocyte Syndrome Type I" (lack of MHC I).'),
    (v_topic_id, 'What is the function of the "Invariant Chain" (Ii) in the MHC Class II pathway?', '["It loads the peptide onto MHC II", "It blocks the peptide-binding groove in the ER to prevent loading of cytosolic peptides", "It degrades foreign proteins", "It transports MHC II to the cell surface"]', 1, 'The invariant chain prevents MHC II from picking up the "wrong" peptides (intended for MHC I) in the ER.'),
    (v_topic_id, 'Which enzyme is responsible for "Somatic Hypermutation" and "Isotype Switching" in B-cells?', '["RAG-1 / RAG-2", "AID (Activation-Induced Cytidine Deaminase)", "TdT", "DNA Ligase IV"]', 1, 'AID is essential for affinity maturation and class switching. RAG is for VDJ recombination.'),
    (v_topic_id, 'Hyper-IgM syndrome is most commonly caused by a deficiency in which molecule on the T-cell?', '["CD40", "CD40 Ligand (CD154)", "CD28", "CTLA-4"]', 1, 'Without CD40L-CD40 interaction, B-cells cannot undergo isotype switching and stay in the IgM-producing state.'),
    (v_topic_id, 'Where does "Positive Selection" of T-cells occur, and what is its purpose?', '["Thymic medulla; to ensure MHC restriction", "Thymic cortex; to ensure T-cells can recognize self-MHC", "Bone marrow; to generate TCR diversity", "Spleen; to remove self-reactive cells"]', 1, 'Positive selection happens in the cortex. Negative selection (removing self-reactive cells) happens in the medulla.'),
    (v_topic_id, 'Which cytokine produced by Th2 cells is responsible for inducing B-cells to switch to IgE production?', '["IL-2", "IL-4", "IL-5", "IFN-gamma"]', 1, 'IL-4 = IgE switch. IL-5 = Eosinophil activation/IgA switch.'),
    (v_topic_id, 'What is "Cross-Presentation"?', '["B-cells presenting to T-cells", "Dendritic cells presenting exogenous antigens on MHC Class I to CD8+ T-cells", "T-cells presenting to Macrophages", "Viral antigens on MHC II"]', 1, 'Cross-presentation is vital for initiating a CD8 response against viruses that don''t infect the APC itself.'),
    (v_topic_id, 'Which molecule provides the "Second Signal" (co-stimulation) for T-cell activation by binding to CD28 on the T-cell?', '["CD40", "B7 (CD80/86)", "LFA-1", "ICAM-1"]', 1, 'T-cell activation = Signal 1 (MHC/TCR) + Signal 2 (B7/CD28).'),
    (v_topic_id, 'What is the function of CTLA-4?', '["It activates T-cells", "It competes with CD28 for B7, delivering an inhibitory signal", "It promotes B-cell survival", "It is a marker for NK cells"]', 1, 'CTLA-4 is a "brake" on the immune response. Ipilimumab is an anti-CTLA-4 antibody used in cancer therapy.'),
    (v_topic_id, 'Which antibody isotype is a dimer in secretions and contains a "Secretory Component" that protects it from proteolytic enzymes?', '["IgG", "IgM", "IgA", "IgE"]', 2, 'IgA is the primary mucosal antibody.'),
    (v_topic_id, 'What is "Allelic Exclusion"?', '["Only one allele of an Ig gene is expressed in a B-cell to ensure single specificity", "Removing self-reactive B-cells", "Switching from IgM to IgG", "Only T-cells can recognize MHC"]', 0, 'Allelic exclusion ensures that each B-cell produces antibodies of only one specificity.'),
    (v_topic_id, 'Which cell type expresses the "Poly-Ig Receptor" to transport IgA across the epithelium?', '["B-cells", "Epithelial cells", "Macrophages", "T-cells"]', 1, 'Epithelial cells use the poly-Ig receptor to move IgA from the basolateral side to the lumen.'),
    (v_topic_id, 'Which cytokine is the most potent inhibitor of macrophage activation and helps dampen the immune response?', '["IL-1", "IL-10", "IL-12", "TNF-alpha"]', 1, 'IL-10 and TGF-beta are anti-inflammatory cytokines.'),
    (v_topic_id, 'What is the primary role of "Follicular Dendritic Cells" (FDCs) in the germinal center?', '["Processing and presenting antigen to T-cells", "Holding intact antigen on their surface for B-cells to sample", "Phagocytosis of dead cells", "Producing antibodies"]', 1, 'FDCs are not "true" DCs; they are mesenchymal cells that display antigen for B-cell selection.'),
    (v_topic_id, 'The "D" (Diversity) segment is found in the genetic loci of which chains?', '["Light chain and Alpha chain", "Heavy chain and Beta chain", "Only Light chains", "All chains"]', 1, 'Heavy chain (Ig) and Beta chain (TCR) have V, D, and J segments. Light and Alpha have only V and J.'),
    (v_topic_id, 'What is the function of TdT (Terminal Deoxynucleotidyl Transferase)?', '["Joining V, D, and J segments", "Adding N-nucleotides at the junctions to increase diversity", "Cleaving DNA", "Isotype switching"]', 1, 'TdT adds junctional diversity. It is a marker for Lymphoblastic Leukemia (ALL).'),
    (v_topic_id, 'Which cell type is responsible for producing large amounts of Type I Interferons (IFN-alpha/beta) in response to viral infection?', '["Neutrophil", "Plasmacytoid Dendritic Cell (pDC)", "B-cell", "CD8+ T-cell"]', 1, 'pDCs are specialized "interferon factories."'),
    (v_topic_id, 'A patient has a mutation in the FOXP3 gene. What is the consequence?', '["Lack of B-cells", "Lack of Regulatory T-cells (Tregs) leading to autoimmunity (IPEX syndrome)", "Lack of CD8+ T-cells", "Inability to produce IgM"]', 1, 'FOXP3 is the master regulator for Treg development.'),
    (v_topic_id, 'Which molecule on the B-cell acts as a co-receptor, enhancing the signal from the BCR by binding to C3d on the antigen?', '["CD19", "CD21 (CR2)", "CD81", "CD40"]', 1, 'The B-cell co-receptor complex includes CD19, CD21, and CD81.'),
    (v_topic_id, 'What is "Clonal Deletion"?', '["Death of self-reactive lymphocytes during development", "Proliferation of specific B-cells", "Switching to IgG", "Memory cell formation"]', 0, 'This is the basis of central tolerance.');

    RAISE NOTICE 'SUCCESS: Systemic Microbiology MCQ Part 3 (141-210) registered.';
END $$;

COMMIT;
