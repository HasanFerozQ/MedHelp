-- Migration: Semester 3 - General Microbiology MCQ Bank (PART 1: 1-100)
-- Date: 2026-04-23

BEGIN;

-- 1. Ensure Topic "General Microbiology" exists for Semester 3
INSERT INTO topics (semester_id, title, slug, "order")
VALUES (3, 'General Microbiology', 'general-microbiology', 30)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, semester_id = 3;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'general-microbiology' LIMIT 1;

    -- SECTION 1: BACTERIAL STRUCTURE & CLASSIFICATION
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A 25-year-old male with a painless penile ulcer. Agent seen only via dark-field microscopy. Primary cell wall component?', '["Thick Peptidoglycan", "Lipopolysaccharide (LPS)", "Mycolic Acid", "No cell wall"]', 0, 'Treponema pallidum is a spirochete; it possesses a peptidoglycan layer despite staining difficulties.'),
    (v_topic_id, 'Which structure is primarily responsible for the transfer of antibiotic resistance genes via conjugation?', '["Capsule", "Flagella", "Pilus", "Mesosome"]', 2, 'The sex pilus (F-pilus) facilitates bridge formation during conjugation.'),
    (v_topic_id, 'A bacterium that grows in both presence and absence of oxygen but faster with oxygen is:', '["Obligate aerobe", "Facultative anaerobe", "Microaerophile", "Obligate anaerobe"]', 1, 'Facultative anaerobes switch to fermentation if oxygen is unavailable.'),
    (v_topic_id, 'Lysozyme in tears provides immunity by cleaving the bond between which two molecules?', '["NAG and NAM", "D-Alanine and L-Alanine", "Ergosterol and Chitin", "Lipid A and Core"]', 0, 'Lysozyme hydrolyzes the beta-1,4 glycosidic bond between NAG and NAM.'),
    (v_topic_id, 'Which component is unique to Gram-positive cell walls and acts as a surface antigen?', '["Lipopolysaccharide", "Teichoic acid", "Outer membrane", "Periplasmic space"]', 1, 'Teichoic acids are specific to Gram-positive cell walls.'),
    (v_topic_id, 'Child with barking cough; virus lacks cell wall. What lipid is found in its membrane?', '["Ergosterol", "Cholesterol", "Hopanoids", "Phosphatidylcholine"]', 1, 'Mycoplasma species lack cell walls and incorporate host-derived cholesterol.'),
    (v_topic_id, 'In which phase of the bacterial growth curve is Penicillin most effective?', '["Lag phase", "Log phase", "Stationary phase", "Decline phase"]', 1, 'Beta-lactams inhibit cell wall synthesis, which is most active during log phase.'),
    (v_topic_id, 'Which is a primary characteristic of bacterial endospores?', '["High metabolic activity", "Resistance to boiling at 100°C", "Sensitivity to UV", "Binary fission reproduction"]', 1, 'Endospores are highly heat-resistant; autoclaving is required to kill them.'),
    (v_topic_id, 'The "O" antigen in Enterobacteriaceae serotyping is located in:', '["Lipid A", "Core polysaccharide", "Outer polysaccharide chain", "Porin proteins"]', 2, 'O-antigen is the outermost carbohydrate chain of the LPS.'),
    (v_topic_id, 'Exotoxin gene on a temperate bacteriophage integrated into the chromosome is called:', '["Transformation", "Specialized Transduction", "Generalized Transduction", "Lysogenic conversion"]', 3, 'Lysogenic conversion occurs when a prophage changes the host phenotype.');

    -- SECTION 2: GENETICS & METABOLISM
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Genetic transfer mechanism involving uptake of "naked" DNA from environment:', '["Conjugation", "Transduction", "Transformation", "Transposition"]', 2, 'Transformation requires "competence" in the recipient cell.'),
    (v_topic_id, 'Mutation in gyrA gene leads to resistance against which antibiotic class?', '["Aminoglycosides", "Fluoroquinolones", "Macrolides", "Tetracyclines"]', 1, 'Fluoroquinolones target DNA gyrase (topoisomerase II).'),
    (v_topic_id, 'What is the mechanism of action of Diphtheria toxin?', '["Inhibition of 30S", "ADP-ribosylation of EF-2", "Cleavage of SNARE", "Activation of Adenylate cyclase"]', 1, 'Diphtheria toxin inactivates EF-2, blocking protein synthesis.'),
    (v_topic_id, 'The "H" antigen of Salmonella species refers to which structure?', '["Capsule", "Flagella", "Fimbriae", "Cell Wall"]', 1, 'H = Flagella; K = Capsule; O = Cell Wall (LPS).'),
    (v_topic_id, 'Which describes a "Hfr" (High-frequency recombination) bacterial cell?', '["Free-floating F plasmid", "F plasmid integrated into host chromosome", "Lacking F plasmid", "Multiple R plasmids"]', 1, 'Hfr cells have the F factor integrated, allowing transfer of chromosomal genes.'),
    (v_topic_id, 'Enzyme responsible for neutralizing superoxide free radicals in aerobic bacteria:', '["Catalase", "Peroxidase", "Superoxide dismutase", "Oxidase"]', 2, 'Superoxide dismutase converts superoxide to hydrogen peroxide.'),
    (v_topic_id, 'Bacteria requiring high concentrations of CO2 (5-10%) for growth is termed:', '["Halophilic", "Capnophilic", "Acidophilic", "Psychrophilic"]', 1, 'Capnophiles (e.g. Neisseria) thrive in high CO2 environments.'),
    (v_topic_id, 'The "Nagler Reaction" identifies lecithinase activity in which organism?', '["Clostridium perfringens", "Bacillus anthracis", "Staphylococcus aureus", "Streptococcus pyogenes"]', 0, 'C. perfringens produces alpha-toxin (lecithinase).'),
    (v_topic_id, 'Movement of DNA segment from one site to another ("jumping genes"):', '["Transduction", "Transposition", "Translation", "Transcription"]', 1, 'Transposons can move between plasmids and chromosomes.'),
    (v_topic_id, 'Which antibiotic inhibits the synthesis of mycolic acids?', '["Rifampin", "Ethambutol", "Isoniazid", "Pyrazinamide"]', 2, 'Isoniazid (INH) targets mycolic acid synthesis in Mycobacteria.');

    -- SECTION 3: GRAM-POSITIVE COCCI & BACILLI
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Golden-yellow honey-crusted lesions (impetigo). Gram+ cocci in clusters. Organism?', '["Streptococcus pyogenes", "Staphylococcus aureus", "Staphylococcus epidermidis", "Streptococcus agalactiae"]', 1, 'S. aureus is coagulase+ and classic for honey-crusted impetigo.'),
    (v_topic_id, 'Which test differentiates Staphylococcus from Streptococcus?', '["Coagulase", "Catalase", "Bacitracin", "Optochin"]', 1, 'Staphylococci are Catalase (+), Streptococci are Catalase (-).'),
    (v_topic_id, 'High fever, hypotension, "sunburn" rash during menstrual period. Toxin?', '["Alpha-toxin", "TSST-1", "Erythrogenic toxin", "Exfoliatin"]', 1, 'TSST-1 is a superantigen produced by S. aureus.'),
    (v_topic_id, 'Neonate with meningitis. Beta-hemolytic Gram+ cocci, CAMP test positive. Organism?', '["Streptococcus pyogenes", "Streptococcus agalactiae", "Listeria monocytogenes", "Enterococcus faecalis"]', 1, 'Group B Strep (GBS) is CAMP positive and a leading cause of neonatal meningitis.'),
    (v_topic_id, 'Streptococcus pneumoniae is best described as:', '["Catalase+, alpha-hemolytic, Optochin resistant", "Catalase-, alpha-hemolytic, Optochin sensitive", "Catalase-, beta-hemolytic, Bacitracin sensitive", "Catalase+, gamma-hemolytic"]', 1, 'S. pneumoniae is alpha-hemolytic and sensitive to Optochin.'),
    (v_topic_id, 'Most common cause of subacute bacterial endocarditis after dental procedures?', '["Streptococcus mutans", "Staphylococcus aureus", "Streptococcus pyogenes", "Enterococcus faecalis"]', 0, 'Viridans group strep are normal oral flora that can enter the bloodstream.'),
    (v_topic_id, 'Colon cancer patient with endocarditis. Which organism?', '["Streptococcus bovis", "Streptococcus pneumoniae", "Staphylococcus saprophyticus", "Listeria monocytogenes"]', 0, 'S. bovis (Group D) bacteremia is associated with colonic malignancy.'),
    (v_topic_id, 'Gram+ rod characterized by "Medusa head" colonies on blood agar:', '["Clostridium botulinum", "Bacillus anthracis", "Listeria monocytogenes", "Corynebacterium diphtheriae"]', 1, 'B. anthracis forms non-hemolytic, Medusa-head colonies.'),
    (v_topic_id, 'Pregnant woman with mild febrile illness after unpasteurized cheese. Tumbling motility rod:', '["Listeria monocytogenes", "Premature birth/Meningitis", "Teeth discoloration", "Gas gangrene"]', 1, 'Listeria can cause neonatal meningitis or fetal loss.'),
    (v_topic_id, 'Toxin cleaving synaptobrevin, preventing GABA/Glycine release:', '["Botulinum toxin", "Tetanospasmin", "Cholera toxin", "Shiga toxin"]', 1, 'Tetanus toxin blocks inhibitory neurotransmitters, causing spastic paralysis.');

    -- SECTION 4: GRAM-NEGATIVE COCCI & BACILLI
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Rigid neck, fever, petechial rash. Gram- diplococci in CSF. Selective medium?', '["MacConkey", "Thayer-Martin", "Blood Agar", "Lowenstein-Jensen"]', 1, 'Neisseria species are isolated on Thayer-Martin (Chocolate Agar).'),
    (v_topic_id, 'Primary virulence factor of Haemophilus influenzae type b?', '["IgA protease", "Polyribosylribitol phosphate (PRP) capsule", "Endotoxin", "Exotoxin A"]', 1, 'The Hib vaccine targets the PRP capsule.'),
    (v_topic_id, 'Smoker with "atypical" pneumonia, diarrhea, and hyponatremia. Requires BCYE agar:', '["Mycoplasma", "Legionella pneumophila", "Klebsiella", "Chlamydia"]', 1, 'Legionella is associated with water sources and hyponatremia.'),
    (v_topic_id, 'Gram- oxidase+ non-lactose fermenter producing pyocyanin:', '["E. coli", "Pseudomonas aeruginosa", "Salmonella typhi", "Shigella sonnei"]', 1, 'Pseudomonas produces blue-green pigments and has a grape-like odor.'),
    (v_topic_id, ' "Currant jelly" sputum is classic for pneumonia caused by:', '["S. pneumoniae", "Klebsiella pneumoniae", "Mycoplasma", "S. aureus"]', 1, 'Klebsiella is common in alcoholics and diabetics.'),
    (v_topic_id, 'E. coli virulence factor most responsible for neonatal meningitis?', '["P-pili", "Heat-stable toxin", "K1 capsular antigen", "Verotoxin"]', 2, 'K1 capsule allows E. coli to cross the blood-brain barrier in neonates.'),
    (v_topic_id, 'Bloody diarrhea after undercooked hamburger. Potential complication?', '["Guillain-Barre", "Hemolytic Uremic Syndrome (HUS)", "Reactive arthritis", "Typhoid"]', 1, 'EHEC (O157:H7) produces Shiga-like toxin leading to HUS.'),
    (v_topic_id, 'Yersinia pestis (Plague) is transmitted to humans via:', '["Tick bite", "Flea bite", "Mosquito bite", "Respiratory droplets"]', 1, 'Bubonic plague is flea-borne; pneumonic is respiratory.'),
    (v_topic_id, 'Gram- "comma-shaped" rod growing on TCBS agar:', '["Campylobacter", "Vibrio cholerae", "H. pylori", "Pseudomonas"]', 1, 'Vibrio cholerae produces "rice-water" stools and requires alkaline media.'),
    (v_topic_id, 'Whooping cough; increases cAMP by inhibiting Gi:', '["Bordetella pertussis", "Vibrio cholerae", "Bacillus anthracis", "E. coli"]', 0, 'Pertussis toxin ADP-ribosylates Gi, increasing cAMP.');

    -- SECTION 5: MYCOBACTERIA & ATYPICALS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Staining method used for Mycobacterium tuberculosis?', '["Gram stain", "Giemsa stain", "Ziehl-Neelsen (Acid-fast)", "Silver stain"]', 2, 'Mycobacteria have high mycolic acid content, making them acid-fast.'),
    (v_topic_id, 'Primary mediator of granuloma formation in Primary TB?', '["Neutrophils", "CD4+ T cells and Macrophages", "B cells", "Eosinophils"]', 1, 'Th1 cells secrete IFN-gamma to activate macrophages.'),
    (v_topic_id, 'Brazil patient with anesthetic skin patches and thickened nerves. Non-culturable:', '["M. avium", "M. leprae", "M. kansasii", "M. marinum"]', 1, 'M. leprae (Leprosy) is obligate intracellular.'),
    (v_topic_id, 'Most common cause of non-gonococcal urethritis?', '["Chlamydia trachomatis", "Neisseria gonorrhoeae", "Ureaplasma", "Treponema"]', 0, 'Chlamydia (D-K) is the leading cause of NGU.'),
    (v_topic_id, 'The Weil-Felix test (cross-reaction with Proteus) was used for:', '["Syphilis", "Rickettsial diseases", "Lyme disease", "Leptospirosis"]', 1, 'Historically used for Rickettsia diagnosis.'),
    (v_topic_id, 'Which organism causes Rocky Mountain Spotted Fever?', '["Rickettsia prowazekii", "Rickettsia rickettsii", "Coxiella burnetii", "Borrelia burgdorferi"]', 1, 'Transmitted by Dermacentor ticks; rash starts on extremities.'),
    (v_topic_id, 'Farmer with pneumonia and hepatitis. No rash. Cattle/sheep exposure:', '["Q Fever", "Anthrax", "Brucellosis", "Psittacosis"]', 0, 'Coxiella burnetii causes Q fever; it lacks a rash.'),
    (v_topic_id, ' "Erythema migrans" (Bull’s eye rash) hallmark of:', '["Syphilis", "Lyme Disease", "Leptospirosis", "Relapsing fever"]', 1, 'Caused by Borrelia burgdorferi transmitted by Ixodes ticks.'),
    (v_topic_id, 'Drug of choice for Chlamydia and Rickettsia?', '["Penicillin", "Doxycycline", "Ciprofloxacin", "Gentamicin"]', 1, 'Tetracyclines are first-line for obligate intracellular bacteria.'),
    (v_topic_id, ' "Elementary body" and "reticulate body" are stages of:', '["Mycoplasma", "Chlamydia", "Rickettsia", "Mycobacterium"]', 1, 'EB is infectious (extra); RB is replicative (intra).');

    -- SECTION 6: VIROLOGY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'All viruses are haploid except:', '["Herpesviruses", "Retroviruses", "Reoviruses", "Hepadnaviruses"]', 1, 'Retroviruses (e.g. HIV) carry two identical RNA copies (diploid).'),
    (v_topic_id, 'Only DNA virus that replicates in the cytoplasm:', '["Herpesvirus", "Poxvirus", "Adenovirus", "Papillomavirus"]', 1, 'Poxviruses carry their own DNA-dependent RNA polymerase.'),
    (v_topic_id, 'Infant with 3-day high fever followed by maculopapular rash on trunk:', '["Measles", "Rubella", "Roseola (HHV-6)", "Erythema infectiosum"]', 2, 'Fever subsides, THEN rash appears in Roseola.'),
    (v_topic_id, 'Virus characterized by Tzanck smear showing multinucleated giant cells?', '["CMV", "HSV-1", "EBV", "HPV"]', 1, 'HSV-1, HSV-2, and VZV are all Tzanck positive.'),
    (v_topic_id, 'College student with sore throat, splenomegaly, positive Monospot. Infected cells?', '["T cells", "B cells", "Neutrophils", "Monocytes"]', 1, 'EBV infects B cells via the CD21 receptor.'),
    (v_topic_id, 'Which hepatitis virus is a DNA virus?', '["HAV", "HBV", "HCV", "HEV"]', 1, 'HBV is a Hepadnavirus (dsDNA); others listed are RNA.'),
    (v_topic_id, '"Antigenic shift" (pandemics) in Influenza is due to:', '["Point mutations", "Reassortment of genomic segments", "Phenotypic mixing", "Complementation"]', 1, 'Shift = Reassortment; Drift = Point mutation.'),
    (v_topic_id, 'Negri bodies in neurons are pathognomonic for:', '["Herpes simplex", "Rabies", "Polio", "Measles"]', 1, 'Inclusions in hippocampus/cerebellum in rabies victims.'),
    (v_topic_id, 'Most common cause of pediatric gastroenteritis worldwide?', '["Norovirus", "Rotavirus", "Adenovirus", "Astrovirus"]', 1, 'Rotavirus (Reovirus) is the #1 pediatric cause.'),
    (v_topic_id, 'Which HIV gene encodes gp120 and gp41 envelope proteins?', '["gag", "pol", "env", "tat"]', 2, 'env -> gp160, cleaved to gp120 (attach) and gp41 (fusion).');

    -- SECTION 7: MYCOLOGY & PARASITOLOGY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Diabetic with black eschar on nasal mucosa. Likely fungus?', '["Aspergillus", "Candida", "Mucor", "Cryptococcus"]', 2, 'Mucormycosis thrives in ketoacidosis; shows 90-degree branching.'),
    (v_topic_id, 'Which fungus is a "germ tube" positive yeast?', '["Cryptococcus", "Candida albicans", "Histoplasma", "Blastomyces"]', 1, 'C. albicans forms germ tubes at 37°C.'),
    (v_topic_id, 'India ink preparation showing yeast with wide capsule. Diagnosis?', '["Coccidioides", "Cryptococcus neoformans", "Sporothrix", "Pneumocystis"]', 1, 'Cryptococcus has a thick polysaccharide capsule.'),
    (v_topic_id, ' "Spaghetti and meatballs" appearance on KOH prep indicates:', '["Tinea pedis", "Tinea versicolor", "Candidiasis", "Sporotrichosis"]', 1, 'Caused by Malassezia furfur.'),
    (v_topic_id, 'Parasite transmitted by Anopheles showing "Maltese cross" on blood smear:', '["P. falciparum", "Babesia microti", "T. brucei", "L. donovani"]', 1, 'Babesia forms a tetrad (Maltese cross).'),
    (v_topic_id, 'Bloating, fatty stools after hiking; pear-shaped trophozoites:', '["Entamoeba", "Giardia lamblia", "Cryptosporidium", "Balantidium"]', 1, 'Giardia is found in mountain stream water.'),
    (v_topic_id, 'Helminth associated with Squamous Cell Carcinoma of the bladder?', '["S. mansoni", "S. haematobium", "Clonorchis", "Fasciola"]', 1, 'S. haematobium eggs cause chronic bladder inflammation.'),
    (v_topic_id, 'The "Scotch Tape test" is used to diagnose:', '["Ascaris", "Enterobius vermicularis (Pinworm)", "Strongyloides", "Necator"]', 1, 'Female pinworms deposit eggs perianally at night.'),
    (v_topic_id, 'Which protozoan causes "Strawberry Cervix"?', '["Trichomonas vaginalis", "Gardnerella", "Candida", "Chlamydia"]', 0, 'Trichomonas causes greenish discharge and cervical punctation.'),
    (v_topic_id, ' "Anchovy paste" liver abscess is associated with:', '["Echinococcus", "Entamoeba histolytica", "Toxoplasma", "Leishmania"]', 1, 'Amebic liver abscesses contain thick brown liquid.');

    -- SECTION 8: IMMUNOLOGY & SEROLOGY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'First antibody produced in a primary immune response?', '["IgG", "IgA", "IgM", "IgE"]', 2, 'IgM is a pentamer and the first isotype synthesized.'),
    (v_topic_id, 'MHC Class I molecules present antigens to:', '["CD4+ T cells", "CD8+ T cells", "B cells", "NK cells"]', 1, 'Rule of 8: MHC I x CD8 = 8.'),
    (v_topic_id, 'Type I Hypersensitivity reaction is mediated by:', '["IgG", "IgE and Mast cells", "Immune complexes", "T cells"]', 1, 'Type I = Immediate (Allergy/Anaphylaxis).'),
    (v_topic_id, 'Primary mediator of systemic inflammatory response and septic shock?', '["IL-2", "IL-10", "TNF-alpha", "IFN-gamma"]', 2, 'TNF-alpha causes vascular leak and hypotension.'),
    (v_topic_id, 'Opsonization is primarily carried out by:', '["C3b and IgG", "C5a and IgM", "C1 and IgA", "C9 and IgE"]', 0, 'C3b makes bacteria "tasty" for phagocytes.'),
    (v_topic_id, 'Which of the following is a "professional" antigen-presenting cell?', '["Neutrophil", "Dendritic cell", "Eosinophil", "Basophil"]', 1, 'DCs, Macrophages, and B cells express MHC II.'),
    (v_topic_id, 'DiGeorge Syndrome organ failure:', '["Spleen", "Thymus", "Bone marrow", "Lymph nodes"]', 1, 'Failure of 3rd/4th pouches leads to T-cell deficiency.'),
    (v_topic_id, 'Component responsible for Membrane Attack Complex (MAC)?', '["C1-C4", "C3a/C5a", "C5b-C9", "C2-C4"]', 2, 'C5b-C9 forms the pore that lyses cells.'),
    (v_topic_id, 'Secretory IgA is found in:', '["Serum", "Breast milk and Saliva", "Fetal circulation", "Mast cells"]', 1, 'IgA protects mucosal surfaces.'),
    (v_topic_id, 'Positive PPD test (tuberculin) is which hypersensitivity?', '["Type I", "Type II", "Type III", "Type IV"]', 3, 'Delayed-type hypersensitivity (DTH) mediated by T-cells.');

    -- SECTION 9: STERILIZATION & ANTIMICROBIALS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Ethanol concentration most effective as disinfectant?', '["100%", "70%", "50%", "30%"]', 1, 'Water is required to denature proteins.'),
    (v_topic_id, 'Mechanism of action of Vancomycin?', '["DNA gyrase", "Binding to D-Ala-D-Ala", "50S ribosome", "Folic acid"]', 1, 'Vancomycin inhibits cell wall cross-linking.'),
    (v_topic_id, 'Antibiotic associated with "Gray Baby Syndrome"?', '["Tetracycline", "Chloramphenicol", "Sulfonamides", "Erythromycin"]', 1, 'Due to neonatal inability to conjugate with glucuronic acid.'),
    (v_topic_id, 'Red-man syndrome is a side effect of:', '["Rifampin", "Vancomycin", "Penicillin", "Gentamicin"]', 1, 'Caused by rapid infusion triggering histamine release.'),
    (v_topic_id, 'Antibiotic causing teeth discoloration in children?', '["Amoxicillin", "Tetracycline", "Azithromycin", "Linezolid"]', 1, 'Chelates calcium in developing teeth.'),
    (v_topic_id, 'Mechanism of Sulfonamides?', '["DHFR", "Inhibition of Dihydropteroate synthase (PABA analog)", "RNA polymerase", "Cell membrane"]', 1, 'Sulfonamides mimic PABA.'),
    (v_topic_id, 'Drug used for "MRSA"?', '["Nafcillin", "Vancomycin", "Cephalexin", "Ciprofloxacin"]', 1, 'Vancomycin is standard for MRSA (altered PBPs).'),
    (v_topic_id, 'Antifungal binding to ergosterol creating membrane pores:', '["Fluconazole", "Amphotericin B", "Caspofungin", "Terbinafine"]', 1, 'Polyenes like Ampho B create pores.'),
    (v_topic_id, 'Acyclovir is a structural analog of:', '["Adenosine", "Guanosine", "Thymidine", "Cytidine"]', 1, 'Phosphorylated by viral TK to inhibit DNA polymerase.'),
    (v_topic_id, 'Sterilization for heat-sensitive endoscopes?', '["Autoclaving", "Glutaraldehyde", "Dry heat", "Incineration"]', 1, 'Glutaraldehyde is a "cold" sterilant.');

    -- SECTION 10: CLINICAL CORRELATIONS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'HIV patient (CD4 50) with visual loss:', '["Toxoplasmosis", "CMV Retinitis", "Cryptococcosis", "HSV Keratitis"]', 1, 'CMV is a major opportunistic infection when CD4 < 50.'),
    (v_topic_id, 'Bacterium associated with Guillain-Barre syndrome:', '["Salmonella", "Campylobacter jejuni", "Shigella", "Listeria"]', 1, 'Molecular mimicry with peripheral nerve gangliosides.'),
    (v_topic_id, ' "Double zone of hemolysis" on blood agar characteristic of:', '["S. pyogenes", "Clostridium perfringens", "S. aureus", "B. cereus"]', 1, 'Produced by alpha and theta toxins.'),
    (v_topic_id, 'Osteomyelitis in Sickle Cell Disease patient. Likely organism?', '["S. aureus", "Salmonella", "Pseudomonas", "S. pneumoniae"]', 1, 'Salmonella is uniquely associated with Sickle Cell osteomyelitis.'),
    (v_topic_id, ' "Sulphur granules" in draining jaw sinus. Organism?', '["Nocardia", "Actinomyces israelii", "TB", "S. aureus"]', 1, 'Actinomyces is a Gram+ branching rod (anaerobic).'),
    (v_topic_id, 'Virus causing cervical cancer; expresses E6/E7 oncoproteins:', '["EBV", "HPV (16, 18)", "HSV-2", "HTLV-1"]', 1, 'E6 inhibits p53; E7 inhibits Rb.'),
    (v_topic_id, ' "Waterhouse-Friderichsen Syndrome" (adrenal hemorrhage) complication of:', '["N. meningitidis sepsis", "S. aureus TSS", "Rickettsia", "Pseudomonas"]', 0, 'Characterized by DIC and adrenal failure.'),
    (v_topic_id, 'Which is a "slow virus" or Prion disease?', '["SSPE", "Creutzfeldt-Jakob Disease (CJD)", "PML", "HIV dementia"]', 1, 'Prions are infectious proteins causing spongiform encephalopathy.'),
    (v_topic_id, 'Perianal itching child; eggs with flattened side. Treatment?', '["Praziquantel", "Mebendazole/Albendazole", "Ivermectin", "Chloroquine"]', 1, 'Treatment for Enterobius (Pinworm).'),
    (v_topic_id, 'Most specific test for diagnosis of Syphilis?', '["VDRL", "RPR", "FTA-ABS", "Dark-field"]', 2, 'FTA-ABS is a confirmatory treponemal-specific test.');

    RAISE NOTICE 'SUCCESS: General Microbiology MCQ Part 1 (1-100) registered.';
END $$;

COMMIT;
