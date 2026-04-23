-- Migration: Semester 3 - General Microbiology MCQ Bank (PART 2: 101-200)
-- Date: 2026-04-23

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'general-microbiology' LIMIT 1;

    -- SECTION 11: ADVANCED CLINICAL CORRELATIONS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Traveler from Central America with high fever, "rose spots", and bradycardia. Organism?', '["Salmonella Typhi", "Rickettsia prowazekii", "Borrelia recurrentis", "Leptospira"]', 0, 'Typhoid fever is characterized by rose spots and the Faget sign (pulse-temp dissociation).'),
    (v_topic_id, 'Bacterium causing "pseudo-appendicitis" (mesenteric adenitis) in children:', '["E. coli", "Yersinia enterocolitica", "C. difficile", "Shigella"]', 1, 'Yersinia enterocolitica can mimic appendicitis.'),
    (v_topic_id, 'CF patient with oxidase+, sweet grape-like odor Gram- rod infection:', '["Burkholderia", "Pseudomonas aeruginosa", "Stenotrophomonas", "Alcaligenes"]', 1, 'P. aeruginosa is the leading cause of chronic infection in CF.'),
    (v_topic_id, 'Most common cause of "Culture-Negative Endocarditis"?', '["Coxiella burnetii", "Bartonella henselae", "S. epidermidis", "Enterococcus"]', 0, 'Coxiella (Q fever) and HACEK organisms are classic culture-negative causes.'),
    (v_topic_id, 'Painless beefy-red genital ulcer; "Donovan bodies" in macrophages. Diagnosis?', '["Syphilis", "Chancroid", "Granuloma Inguinale", "LGV"]', 2, 'Caused by Klebsiella granulomatis (beefy-red, bleeds easily).'),
    (v_topic_id, 'Streptococcus pyogenes virulence factor preventing phagocytosis:', '["Streptolysin O", "M protein", "Hyaluronidase", "Streptokinase"]', 1, 'M protein shares homology with myosin, potentially leading to Rheumatic Heart Disease.'),
    (v_topic_id, 'Foul-smelling diarrhea after Clindamycin. Toxin inhibits which process?', '["Protein synthesis", "Cytoskeleton integrity (Rho GTPase)", "Adenylate cyclase", "DNA replication"]', 1, 'C. difficile toxins A and B disrupt the actin cytoskeleton via Rho GTPases.'),
    (v_topic_id, 'Most common UTI cause in sexually active young women, second to E. coli?', '["Proteus", "Klebsiella", "Staphylococcus saprophyticus", "Enterococcus"]', 2, 'S. saprophyticus is Novobiocin resistant.'),
    (v_topic_id, 'Biochemical test differentiating Proteus mirabilis from other Enterobacteriaceae?', '["Lactose fermentation", "Urease production", "Citrate", "Indole"]', 1, 'Proteus is a strong urease producer, leading to struvite calculi.'),
    (v_topic_id, 'Weight loss, diarrhea, joint pain. PAS-positive macrophages in small intestine biopsy:', '["M. avium", "Tropheryma whipplei", "Giardia", "Cryptosporidium"]', 1, 'Whipple''s disease is caused by T. whipplei.');

    -- SECTION 12: CLINICAL VIROLOGY (ADVANCED)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Virus associated with Kaposi Sarcoma in AIDS patients?', '["HHV-6", "HHV-7", "HHV-8", "CMV"]', 2, 'HHV-8 (KSHV) causes vascular tumors in immunocompromised individuals.'),
    (v_topic_id, 'Child with barking cough and inspiratory stridor. Most likely virus?', '["RSV", "Parainfluenza virus", "Adenovirus", "Rhinovirus"]', 1, 'Parainfluenza (Type 1) is the most common cause of Croup.'),
    (v_topic_id, 'Bone marrow transplant patient with "Owl’s eye" nuclear inclusions in lung biopsy:', '["HSV-1", "CMV", "VZV", "Adenovirus"]', 1, 'CMV is a major opportunistic pathogen in transplant patients.'),
    (v_topic_id, 'Primary cause of Hemorrhagic Cystitis in children?', '["BK Virus", "Adenovirus (11/21)", "CMV", "Echovirus"]', 1, 'Specific Adenovirus types target the bladder.'),
    (v_topic_id, 'Hepatitis B marker that is the first to appear in blood after infection?', '["HBeAg", "HBsAg", "Anti-HBc IgM", "Anti-HBs"]', 1, 'HBsAg indicates current infection.'),
    (v_topic_id, 'Hepatitis B "Window Period" serological profile?', '["HBsAg+, Anti-HBs-", "HBsAg-, Anti-HBs+, Anti-HBc+", "HBsAg-, Anti-HBs-, Anti-HBc IgM+", "HBeAg+, HBsAg+"]', 2, 'Only Anti-HBc IgM is present during the window period.'),
    (v_topic_id, 'Virus causing fatal encephalitis classically involving the temporal lobes:', '["West Nile", "HSV-1", "Japanese Encephalitis", "Rabies"]', 1, 'HSV-1 encephalitis causes hemorrhagic necrosis of temporal lobes.'),
    (v_topic_id, 'Viral family: naked, single-stranded, positive-sense RNA genome?', '["Picornavirus", "Orthomyxovirus", "Retrovirus", "Paramyxovirus"]', 0, 'Picornaviruses are PERCH (Naked, RNA +).'),
    (v_topic_id, 'Pregnant woman in 3rd trimester with fulminant hepatitis in poor sanitation area:', '["HAV", "HBV", "HCV", "HEV"]', 3, 'HEV has high mortality in pregnant women.'),
    (v_topic_id, 'Virus causing Progressive Multifocal Leukoencephalopathy (PML) in AIDS:', '["JC Virus", "BK Virus", "HHV-6", "HIV"]', 0, 'JC virus is a Polyomavirus that demyelinates the CNS.');

    -- SECTION 13: MYCOLOGY (SYSTEMIC & OPPORTUNISTIC)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Ohio/Mississippi River Valley; yeast inside macrophages. Fungus?', '["Coccidioides", "Histoplasma capsulatum", "Blastomyces", "Paracoccidioides"]', 1, ' "Histo Hides" in macrophages; associated with bird/bat droppings.'),
    (v_topic_id, ' "Broad-based budding" yeast found in Great Lakes region?', '["Histoplasma", "Blastomyces dermatitidis", "Coccidioides", "Candida"]', 1, 'Blastomyces buds with a broad base.'),
    (v_topic_id, 'Southwestern USA "Desert Rheumatism"; spherules filled with endospores:', '["Histoplasma", "Coccidioides immitis", "Blastomyces", "Sporothrix"]', 1, 'Coccidioides forms spherules in tissue.'),
    (v_topic_id, 'Gardener with chain of subcutaneous nodules after rose-thorn prick:', '["M. marinum", "Sporothrix schenckii", "Nocardia", "Actinomyces"]', 1, 'Sporotrichosis ("Rose Gardener''s") shows cigar-shaped yeast.'),
    (v_topic_id, 'Fungus Ball in pre-existing lung cavities (e.g. old TB):', '["Candida", "Aspergillus fumigatus", "Pneumocystis", "Rhizopus"]', 1, 'Aspergillomas occupy old cavities and can cause hemoptysis.'),
    (v_topic_id, 'HIV (CD4 150) with "crushed ping-pong ball" silver stain lung wash:', '["TB", "Pneumocystis jirovecii", "Cryptococcus", "Legionella"]', 1, 'PCP is a fungus; prophylaxis starts at CD4 < 200.'),
    (v_topic_id, 'Antifungal inhibiting beta-glucan synthesis in cell wall?', '["Amphotericin B", "Fluconazole", "Caspofungin", "Griseofulvin"]', 2, 'Echinocandins (Caspofungin) target the cell wall.'),
    (v_topic_id, ' "Pilot’s Wheel" yeast appearance on biopsy:', '["Blastomycosis", "Paracoccidioidomycosis", "Coccidioidomycosis", "Histoplasmosis"]', 1, 'Paracoccidioides brasiliensis yeast have multiple buds.'),
    (v_topic_id, 'Fungus causing "Tinea Cruris":', '["Microsporum", "Epidermophyton", "Trichophyton", "All of the above"]', 3, 'Dermatophytes include all three genera.'),
    (v_topic_id, 'Neutropenic patient with acute-angle branching septate hyphae:', '["Mucor", "Aspergillus", "Candida", "Fusarium"]', 1, 'Aspergillus branches at 45 degrees; Mucor at 90.');

    -- SECTION 14: PARASITOLOGY (PROTOZOA & HELMINTHS)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, ' "Winterbottom sign" and daytime somnolence. Vector?', '["Tsetse fly", "Reduviid bug", "Sandfly", "Tick"]', 0, 'African Trypanosomiasis (Sleeping Sickness) is Tsetse-borne.'),
    (v_topic_id, 'Chagas disease (achalasia, megacolon, DCM). Organism?', '["T. brucei", "Trypanosoma cruzi", "Leishmania", "Toxoplasma"]', 1, 'Chagas is transmitted by the "Kissing bug" (Reduviid).'),
    (v_topic_id, 'AIDS patient with multiple ring-enhancing brain lesions. Parasite?', '["Cryptococcus", "Toxoplasma gondii", "Taenia solium", "Naegleria"]', 1, 'Toxoplasmosis is the #1 cause of ring-enhancing lesions in HIV.'),
    (v_topic_id, 'Sandfly vector; "Kala-azar" (massive splenomegaly):', '["Leishmania donovani", "T. cruzi", "P. vivax", "Babesia"]', 0, 'Visceral Leishmaniasis presents with hepatosplenomegaly.'),
    (v_topic_id, 'Seizures; MRI shows cystic lesions with "dots" (scolices). History of undercooked pork:', '["Hydatid", "Neurocysticercosis", "Schistosomiasis", "Ascariasis"]', 1, 'Caused by ingestion of Taenia solium eggs.'),
    (v_topic_id, 'Helminth causing Vitamin B12 deficiency (Megaloblastic anemia):', '["T. saginata", "Diphyllobothrium latum", "Echinococcus", "H. nana"]', 1, 'Fish tapeworm competes for B12 in the host intestine.'),
    (v_topic_id, 'Intense anal pruritus; eggs transmitted fecal-oral. Parasite?', '["Ascaris", "Enterobius vermicularis", "Necator", "Strongyloides"]', 1, 'Pinworm transmission via auto-inoculation or bedding.'),
    (v_topic_id, 'Helminth causing "Loeffler syndrome" (eosinophilic pneumonitis) during lung migration:', '["Ascaris", "Necator", "Ancylostoma", "All of the above"]', 3, 'Many nematodes migrate through the lungs.'),
    (v_topic_id, ' "Elephantiasis" (lymphatic filariasis) vector:', '["Simulium fly", "Chrysops fly", "Mosquito (Anopheles/Culex)", "Tsetse fly"]', 2, 'Wuchereria bancrofti is transmitted by mosquitoes.'),
    (v_topic_id, ' "River Blindness" transmitted by Blackfly:', '["Onchocerca volvulus", "Loa loa", "Dracunculus", "Toxocara"]', 0, 'Onchocerciasis is treated with Ivermectin.');

    -- SECTION 15: IMMUNOLOGY & VACCINATION
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'BCG vaccine type?', '["Killed", "Live-attenuated", "Subunit", "Toxoid"]', 1, 'BCG uses an attenuated strain of M. bovis.'),
    (v_topic_id, 'Triad: Thrombocytopenia, Eczema, recurrent infections. Immunodeficiency?', '["Bruton", "Wiskott-Aldrich Syndrome", "Hyper-IgM", "CVID"]', 1, 'Mutation in WASp gene (X-linked).'),
    (v_topic_id, 'Cytokine produced by Th2 cells stimulating IgE production?', '["IL-2", "IL-4", "IL-12", "IFN-gamma"]', 1, 'IL-4 induces class switching to IgE.'),
    (v_topic_id, 'Chronic Granulomatous Disease (CGD) enzyme defect?', '["Myeloperoxidase", "NADPH Oxidase", "Catalase", "Adenosine deaminase"]', 1, 'Defect in respiratory burst; susceptible to Catalase+ organisms.'),
    (v_topic_id, 'Hypersensitivity involved in Arthus reaction (local necrosis)?', '["Type I", "Type II", "Type III", "Type IV"]', 2, 'Type III involves immune complex deposition.'),
    (v_topic_id, 'Deficiency in C5-C9 increases susceptibility to:', '["Pneumococcus", "Neisseria species", "S. aureus", "H. influenzae"]', 1, 'MAC is essential for killing Gram-negative cocci.'),
    (v_topic_id, 'Antibody found in highest concentration in human serum?', '["IgM", "IgA", "IgG", "IgD"]', 2, 'IgG makes up ~75-80% of serum antibodies.'),
    (v_topic_id, 'Passive immunity example:', '["Toxoid", "Pre-formed antibodies (HBIG)", "Live virus", "Bacterial antigens"]', 1, 'Direct administration of pre-formed antibodies.'),
    (v_topic_id, 'Graft-versus-host disease (GVHD) most common in:', '["Kidney", "Bone Marrow", "Cornea", "Heart"]', 1, 'Donor T cells attack recipient tissues.'),
    (v_topic_id, 'Marker present on all mature T cells?', '["CD3", "CD4", "CD8", "CD19"]', 0, 'CD3 is part of the TCR complex.');

    -- SECTION 16: CLINICAL SYNDROMES & LABS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Medium used for Corynebacterium diphtheriae?', '["Lowenstein-Jensen", "Löffler / Tellurite", "Thayer-Martin", "Sabouraud"]', 1, 'Forms black colonies on Tellurite agar.'),
    (v_topic_id, ' "Ecthyma gangrenosum" (necrotic skin) sepsis sign for:', '["Pseudomonas aeruginosa", "S. aureus", "S. pyogenes", "Anthrax"]', 0, 'Hallmark of Pseudomonas bacteremia.'),
    (v_topic_id, 'String test positive parasite:', '["Strongyloides", "Giardia lamblia", "Ascaris", "Hookworm"]', 1, 'Entero-test collects trophozoites from duodenum.'),
    (v_topic_id, 'Food poisoning from reheated rice organism?', '["S. aureus", "Bacillus cereus", "C. perfringens", "Salmonella"]', 1, 'Spores survive boiling and germinate in rice.'),
    (v_topic_id, 'Sandpaper rash and strawberry tongue diagnosis?', '["Measles", "Scarlet Fever", "Rubella", "Kawasaki"]', 1, 'Caused by S. pyogenes erythrogenic toxin.'),
    (v_topic_id, 'Latex agglutination test for Cryptococcus capsule antigen purpose?', '["Better sensitivity", "Quellung", "Elek test", "Mitsuda"]', 0, 'Latex agglutination is more sensitive than India Ink.'),
    (v_topic_id, 'Positive Whiff test (fishy odor) diagnosis:', '["Trichomoniasis", "Bacterial Vaginosis (Gardnerella)", "Candidiasis", "Gonorrhea"]', 1, 'Characterized by "Clue cells".'),
    (v_topic_id, 'Hutchinson’s triad (notched teeth, keratitis, deafness) seen in:', '["Rubella", "Congenital Syphilis", "CMV", "Toxoplasmosis"]', 1, 'Late features of congenital syphilis.'),
    (v_topic_id, 'Lyme disease drug of choice for a 6-year-old?', '["Doxycycline", "Amoxicillin", "Ceftriaxone", "Azithromycin"]', 1, 'Avoid Doxycycline in children < 8 if possible; Amoxicillin is preferred.'),
    (v_topic_id, 'Weil''s disease (icterohemorrhagic fever) severe form of:', '["Brucellosis", "Leptospirosis", "Tularemia", "Melioidosis"]', 1, 'Caused by L. interrogans from animal urine contamination.');

    -- SECTION 17: EMERGING & MISC
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Most common cause of "Common Cold"?', '["Rhinovirus", "Coronavirus", "Adenovirus", "Influenza"]', 0, 'Rhinoviruses account for ~50%.'),
    (v_topic_id, ' "Malignant Otitis Externa" in elderly diabetics organism?', '["S. aureus", "Pseudomonas aeruginosa", "Candida", "Proteus"]', 1, 'Invasive infection leading to skull base osteomyelitis.'),
    (v_topic_id, ' "Rabbit Fever" (ulceroglandular) after skinning animals. Diagnosis?', '["Brucellosis", "Tularemia", "Pasteurellosis", "Anthrax"]', 1, 'Caused by Francisella tularensis.'),
    (v_topic_id, 'Cellulitis after dog/cat bite organism?', '["Eikenella", "Pasteurella multocida", "Bartonella", "Capnocytophaga"]', 1, 'Gram-negative coccobacillus in pet oral flora.'),
    (v_topic_id, 'Cat Scratch Disease cause:', '["Pasteurella", "Bartonella henselae", "Toxoplasma", "Francisella"]', 1, 'Causes regional lymphadenopathy in children.'),
    (v_topic_id, 'Prosthetic heart valve endocarditis (Catalase+, Coagulase-, Novobiocin sensitive):', '["S. aureus", "Staphylococcus epidermidis", "S. saprophyticus", "Enterococcus"]', 1, 'S. epidermidis is the #1 prosthetic valve cause.'),
    (v_topic_id, ' "Swarming Growth" on agar plates:', '["E. coli", "Proteus mirabilis", "Salmonella", "Klebsiella"]', 1, 'Due to high motility.'),
    (v_topic_id, 'Fitz-Hugh-Curtis Syndrome (violin string adhesions) complication of:', '["Splenic abscess", "Peri-hepatitis", "Renal failure", "Endocarditis"]', 1, 'Inflammation following N. gonorrhoeae or C. trachomatis.'),
    (v_topic_id, 'Toxin causing Scalded Skin Syndrome?', '["TSST-1", "Exfoliative Toxin (Exfoliatin)", "Alpha-toxin", "Erythrogenic"]', 1, 'Cleaves desmoglein-1 in the epidermis.'),
    (v_topic_id, 'Virus associated with Burkitt Lymphoma and Nasopharyngeal Carcinoma?', '["HPV", "EBV", "HBV", "HIV"]', 1, 'Epstein-Barr Virus is oncogenic.');

    -- SECTION 18: SYSTEMIC INFECTIONS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Most common cause of Community-Acquired Pneumonia (CAP)?', '["Mycoplasma", "Streptococcus pneumoniae", "H. influenzae", "Chlamydophila"]', 1, ' "Pneumococcus" is the most frequent bacterial cause.'),
    (v_topic_id, 'Most common cause of Bacterial Meningitis in neonates (0-3 months)?', '["Neisseria", "S. agalactiae (GBS)", "Listeria", "Both B and C"]', 3, 'GBS, E. coli, and Listeria are all prevalent.'),
    (v_topic_id, 'Painful purulent genital ulcer and buboes likely:', '["Syphilis", "Chancroid (H. ducreyi)", "LGV", "Herpes"]', 1, ' "Ducreyi makes you cry" (painful).'),
    (v_topic_id, 'Most common cause of "Atypical" (Walking) Pneumonia in young adults?', '["Pneumococcus", "Mycoplasma pneumoniae", "Legionella", "PCP"]', 1, 'Characterized by insidious onset and diffuse infiltrates.'),
    (v_topic_id, 'Water-borne outbreaks in daycares often:', '["Giardia", "Cryptosporidium", "Rotavirus", "All of the above"]', 3, 'Pathogens spread in recreational water or childcare.'),
    (v_topic_id, '#1 cause of prosthetic joint infections?', '["S. aureus", "Staphylococcus epidermidis", "Pseudomonas", "C. acnes"]', 1, 'Produces biofilm on hardware.'),
    (v_topic_id, 'Hematuria/edema 2 weeks after impetigo. Mechanism?', '["Invasion", "Type III Hypersensitivity", "Toxin", "Autoimmune"]', 1, 'PSGN involves immune complex deposition.'),
    (v_topic_id, 'Greyish-white discharge, pH > 4.5, Clue Cells indicate:', '["Yeast", "Bacterial Vaginosis", "Trichomoniasis", "Normal"]', 1, 'Gardnerella vaginalis overgrowth.'),
    (v_topic_id, 'Drug of choice for Enterococcus (VRE requires Linezolid):', '["Penicillin", "Linezolid or Vancomycin", "Gentamicin", "Cipro"]', 1, 'Hardy organisms requiring specific coverage.'),
    (v_topic_id, 'Organism causing Brazilian Purpuric Fever?', '["Neisseria", "Haemophilus influenzae biogroup aegyptius", "Rickettsia", "Dengue"]', 1, 'Severe systemic infection after conjunctivitis.');

    -- SECTION 19: ADVANCED LAB & DIAGNOSTICS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Nagler Test for C. perfringens detects:', '["Protease", "Lecithinase (Alpha-toxin)", "Hyaluronidase", "Enterotoxin"]', 1, 'Egg-yolk agar test.'),
    (v_topic_id, 'Staining technique for Pneumocystis jirovecii?', '["Gram", "Gomori Methenamine Silver (GMS)", "Giemsa", "India Ink"]', 1, 'Highlights cyst walls.'),
    (v_topic_id, 'Optochin test differentiates S. pneumoniae from:', '["S. pyogenes", "S. agalactiae", "Viridans streptococci", "Enterococci"]', 2, 'S. pneumoniae is sensitive.'),
    (v_topic_id, 'Positive Quellung reaction (capsular swelling) seen in:', '["Pneumococcus", "H. influenzae", "N. meningitidis", "All of the above"]', 3, 'Occurs with encapsulated organisms.'),
    (v_topic_id, 'Quick test for Infectious Mononucleosis in office:', '["PCR", "Monospot", "Culture", "ELISA"]', 1, 'Detects heterophile antibodies.'),
    (v_topic_id, 'Gold Standard for diagnosing Malaria?', '["PCR", "Rapid test", "Thick and thin smears", "Electrophoresis"]', 2, 'Allows species ID and quantification.'),
    (v_topic_id, 'VDRL for syphilis false positives:', '["SLE", "Mono", "Pregnancy", "All of the above"]', 3, 'Detects cardiolipin; many conditions trigger it.'),
    (v_topic_id, 'Medium specific for Bordetella pertussis?', '["Regan-Lowe / Bordet-Gengou", "Chocolate", "MacConkey", "TCBS"]', 0, 'Contains potato, blood, glycerol.'),
    (v_topic_id, 'Cold agglutinins (IgM) associated with:', '["Pneumococcus", "Mycoplasma pneumoniae", "Legionella", "Chlamydia"]', 1, 'IgM agglutinates RBCs at 4°C.'),
    (v_topic_id, 'Urease positive organism causing peptic ulcers?', '["Campylobacter", "Helicobacter pylori", "Salmonella", "Vibrio"]', 1, 'Creates ammonia cloud for protection.');

    -- SECTION 20: FINAL REVIEW & INTEGRATION
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Erythema Nodosum associations:', '["Sarcoidosis", "Coccidioidomycosis", "TB", "All of the above"]', 3, 'Non-specific inflammatory reaction of fat.'),
    (v_topic_id, 'Prophylaxis for Neisseria meningitidis exposure:', '["Penicillin", "Rifampin", "Ciprofloxacin", "Both B and C"]', 3, 'Rifampin or Cipro/Ceftriaxone.'),
    (v_topic_id, 'Jarisch-Herxheimer reaction response to death of:', '["Gram-rods", "Spirochetes (Syphilis)", "Fungi", "Viruses"]', 1, 'Fever/chills after start of treatment.'),
    (v_topic_id, 'Steeple Sign on neck X-ray cause:', '["RSV", "Parainfluenza", "Influenza", "Measles"]', 1, 'Hallmark of Croup.'),
    (v_topic_id, 'Ixodes tick transmitted pathogens:', '["Borrelia", "Babesia", "Anaplasma", "All of the above"]', 3, 'Co-infections are common.'),
    (v_topic_id, 'Blackwater Fever (massive hemolysis) complication of:', '["Liver", "P. falciparum (Hemoglobinuria)", "Pulmonary", "Spleen"]', 1, 'Severe intravascular hemolysis.'),
    (v_topic_id, 'Acid-Fast protozoan causing diarrhea in AIDS:', '["Giardia", "Cryptosporidium", "Entamoeba", "Trichomonas"]', 1, 'Oocysts stain red.'),
    (v_topic_id, ' "Breakbone fever" (biphasic) characteristic of:', '["Malaria", "Dengue Fever", "Typhoid", "Yellow Fever"]', 1, 'Severe bone pain and saddle-back fever.'),
    (v_topic_id, 'Antibiotic with Black Box for tendon rupture?', '["Aminoglycosides", "Fluoroquinolones", "Macrolides", "Tetracyclines"]', 1, 'e.g. Ciprofloxacin.'),
    (v_topic_id, 'Treatment of choice for Bacteroides fragilis?', '["Metronidazole", "Gentamicin", "Azithromycin", "Amoxicillin"]', 0, 'Metronidazole for below-diaphragm anaerobes.');

    RAISE NOTICE 'SUCCESS: General Microbiology MCQ Part 2 (101-200) registered.';
END $$;

COMMIT;
