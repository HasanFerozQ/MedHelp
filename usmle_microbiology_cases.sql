-- ==========================================
-- USMLE Step 1 - Microbiology Clinical Cases
-- 50 High-Yield Scenarios
-- ==========================================

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Identify Topic: Microbiology
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'usmle-1-microbiology';
    
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Microbiology topic not found. Ensure it was seeded via usmle_setup.sql';
    END IF;

    -- 2. Cleanup existing case studies for this topic
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    -- CASE 1: Corynebacterium diphtheriae
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 1 - Respiratory Distress and Pseudomembrane', 'A 6-year-old boy presents with sore throat, fever, and a gray-white membrane over the tonsils. Cervical lymph nodes are enlarged. He recently immigrated and has incomplete vaccination records.', 1) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely organism?', '["Streptococcus pyogenes", "Corynebacterium diphtheriae", "Haemophilus influenzae", "Arcanobacterium haemolyticum"]', 1, 'Diphtheria causes a characteristic gray pseudomembrane and "bull neck" lymphadenopathy.'),
    (v_case_id, 'The major virulence factor acts by:', '["Inhibiting 50S ribosomal subunit", "ADP-ribosylating EF-2", "Activating adenylate cyclase", "Blocking acetylcholine release"]', 1, 'Diphtheria toxin inhibits Elongation Factor 2 (EF-2) via ADP-ribosylation, halting protein synthesis.'),
    (v_case_id, 'Prevention is primarily through:', '["Live attenuated vaccine", "Toxoid vaccine", "Polysaccharide capsule vaccine", "Killed whole-cell vaccine"]', 1, 'The DTaP vaccine contains the diphtheria toxoid.');

    -- CASE 2: Neisseria meningitidis
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 2 - Meningitis and Petechial Rash', 'A 19-year-old college student develops fever, headache, nuchal rigidity, and petechial rash. CSF shows neutrophils, low glucose, and high protein.', 2) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Listeria monocytogenes", "Neisseria meningitidis", "Streptococcus pneumoniae", "Haemophilus influenzae"]', 1, 'Meningococcal meningitis is classic in college dorm settings and presents with a petechial/purpuric rash.'),
    (v_case_id, 'This organism is best described as:', '["Gram-positive diplococcus", "Oxidase-positive gram-negative diplococcus", "Acid-fast rod", "Anaerobic gram-negative rod"]', 1, 'Neisseria are oxidase-positive, gram-negative diplococci.'),
    (v_case_id, 'Close contacts should receive:', '["Isoniazid", "Rifampin prophylaxis", "Amphotericin B", "No prophylaxis"]', 1, 'Prophylaxis with rifampin (or ciprofloxacin/ceftriaxone) is indicated for close contacts.');

    -- CASE 3: Streptococcus pneumoniae
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 3 - Community Acquired Pneumonia', 'A 48-year-old alcoholic man develops abrupt fever, productive cough with rusty sputum, and lobar consolidation on chest X-ray.', 3) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Klebsiella pneumoniae", "Streptococcus pneumoniae", "Staphylococcus aureus", "Mycoplasma pneumoniae"]', 1, 'S. pneumoniae is the most common cause of community-acquired lobar pneumonia.'),
    (v_case_id, 'The main virulence factor is:', '["M protein", "Capsule", "Exotoxin A", "Mycolic acid"]', 1, 'The polysaccharide capsule prevents phagocytosis and is the primary virulence factor.'),
    (v_case_id, 'On Gram stain this appears as:', '["Gram-negative coccobacilli", "Gram-positive lancet-shaped diplococci", "Branching filamentous rods", "Curved gram-negative rods"]', 1, 'Streptococcus pneumoniae appears as lancet-shaped, gram-positive diplococci.');

    -- CASE 4: Klebsiella pneumoniae
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 4 - Aspiration Pneumonia', 'A 56-year-old alcoholic with poor dentition presents with currant jelly sputum and upper lobe cavitary pneumonia.', 4) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Pseudomonas aeruginosa", "Klebsiella pneumoniae", "Legionella pneumophila", "Moraxella catarrhalis"]', 1, 'Klebsiella is a common cause of "currant jelly" sputum pneumonia in alcoholics and diabetics.'),
    (v_case_id, 'This organism is:', '["Lactose-fermenting gram-negative rod", "Non-lactose fermenting gram-negative rod", "Gram-positive rod with spores", "Acid-fast bacillus"]', 0, 'Klebsiella is an enteric gram-negative rod that ferments lactose (pink on MacConkey).'),
    (v_case_id, 'A major virulence feature is:', '["Urease", "Capsular polysaccharide", "Coagulase", "IgA protease"]', 1, 'A large polysaccharide capsule produces mucoid colonies and evades host defenses.');

    -- CASE 5: Escherichia coli
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 5 - Urinary Tract Infection', 'A 24-year-old woman develops dysuria and urinary frequency. Urine culture grows a gram-negative rod that ferments lactose.', 5) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Proteus mirabilis", "Escherichia coli", "Pseudomonas aeruginosa", "Serratia marcescens"]', 1, 'E. coli is the #1 cause of UTIs.'),
    (v_case_id, 'Uropathogenic strains commonly use which virulence factor?', '["P fimbriae", "M protein", "Cord factor", "Lecithinase"]', 0, 'P fimbriae allow uropathogenic E. coli (UPEC) to adhere to the urothelium.'),
    (v_case_id, 'On MacConkey agar the colonies would appear:', '["Colorless", "Pink", "Black", "Green"]', 1, 'Lactose fermenters like E. coli turn MacConkey agar pink.');

    -- CASE 6: Proteus mirabilis
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 6 - Alkaline Urine and Catheter Infection', 'A 72-year-old man with a chronic urinary catheter develops UTI. Urine has a strong ammonia smell and the pH is elevated.', 6) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["E. coli", "Proteus mirabilis", "Enterococcus faecalis", "Staphylococcus saprophyticus"]', 1, 'Proteus is a common cause of catheter-associated UTIs and is known for producing alkaline urine.'),
    (v_case_id, 'Which enzyme explains the alkaline urine?', '["Catalase", "Urease", "Coagulase", "Oxidase"]', 1, 'Urease splits urea into ammonia and CO2, raising the urinary pH.'),
    (v_case_id, 'A known complication is:', '["Calcium oxalate stones", "Struvite stones", "Uric acid stones", "Cystine stones"]', 1, 'Alkaline urine favors the formation of struvite (ammonium magnesium phosphate) stones.');

    -- CASE 7: Chlamydia trachomatis
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 7 - Nongonococcal Urethritis', 'A 23-year-old woman presents with dysuria. Gram stain of urethral discharge shows no organisms. She is sexually active.', 7) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Neisseria gonorrhoeae", "Chlamydia trachomatis", "Treponema pallidum", "Gardnerella vaginalis"]', 1, 'Chlamydia is the most common cause of nongonococcal urethritis (NGU) and often shows no organisms on standard Gram stain.'),
    (v_case_id, 'The organism survives intracellularly because it:', '["Produces urease", "Inhibits phagolysosome fusion", "Lacks peptidoglycan in cell wall", "Produces shiga toxin"]', 1, 'Chlamydia is an obligate intracellular pathogen that prevents the fusion of the phagosome with the lysosome.'),
    (v_case_id, 'The infectious form is the:', '["Reticulate body", "Elementary body", "Tachyzoite", "Cyst"]', 1, 'The Elementary body (EB) is the small, hardy infectious form; the Reticulate body (RB) is the larger, replicative form.');

    -- CASE 8: Neisseria gonorrhoeae
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 8 - Purulent Urethritis', 'A sexually active 20-year-old man presents with purulent urethral discharge. Gram stain shows gram-negative intracellular diplococci.', 8) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Neisseria meningitidis", "Neisseria gonorrhoeae", "Moraxella catarrhalis", "Acinetobacter baumannii"]', 1, 'N. gonorrhoeae typically presents as intracellular gram-negative diplococci in PMNs.'),
    (v_case_id, 'A major virulence mechanism is:', '["Protein A", "Antigenic variation of pili", "Diphtheria toxin", "Superantigen production"]', 1, 'Gonococci undergo frequent antigenic variation of their pili and Opas to evade the immune system.'),
    (v_case_id, 'Untreated infection in women commonly leads to:', '["Toxic shock syndrome", "Pelvic inflammatory disease", "Rheumatic fever", "Hemolytic uremic syndrome"]', 1, 'Ascending infection in females causes PID, which can lead to infertility and ectopic pregnancy.');

    -- CASE 9: Treponema pallidum (Syphilis)
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 9 - Genital Ulcer and Rash', 'A 31-year-old man presents with a painless genital ulcer. Weeks later he develops diffuse rash involving palms and soles.', 9) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Haemophilus ducreyi", "Treponema pallidum", "Klebsiella granulomatis", "HSV-2"]', 1, 'Painless chancre followed by a maculopapular rash on palms/soles is secondary syphilis.'),
    (v_case_id, 'Best diagnostic method in primary disease:', '["India ink stain", "Dark-field microscopy", "Acid-fast stain", "Gram stain"]', 1, 'Spirochetes like T. pallidum are too thin for Gram stain and are best visualized via dark-field microscopy.'),
    (v_case_id, 'The rash phase represents:', '["Primary syphilis", "Secondary syphilis", "Tertiary syphilis", "Congenital syphilis"]', 1, 'Secondary syphilis is the systemic stage characterized by rash and lymphadenopathy.');

    -- CASE 10: Herpes Simplex Virus 2
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 10 - Recurrent Painful Vesicles', 'A 26-year-old man has painful grouped vesicles on the genitalia with recurrent episodes.', 10) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely pathogen?', '["HPV 16", "HSV-2", "Molluscum contagiosum virus", "Treponema pallidum"]', 1, 'HSV-2 is the most common cause of painful, recurrent genital herpes.'),
    (v_case_id, 'This virus remains latent in:', '["Dorsal root ganglia", "Hepatocytes", "B cells", "Macrophages"]', 0, 'HSV-1 and HSV-2 establish latency in sensory (e.g., sacral or trigeminal) ganglia.'),
    (v_case_id, 'Tzanck smear would show:', '["Koilocytes", "Multinucleated giant cells", "Acid-fast bacilli", "Negri bodies"]', 1, 'Tzanck smear identifies multinucleated giant cells characteristic of herpes infections.');

    -- CASE 11: Listeria monocytogenes
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 11 - Neonatal Meningitis', 'A newborn develops meningitis after the mother had a febrile diarrheal illness during pregnancy. The organism is a motile gram-positive rod showing tumbling motility.', 11) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Bacillus anthracis", "Listeria monocytogenes", "Corynebacterium jeikeium", "Actinomyces israelii"]', 1, 'Listeria is a common cause of neonatal meningitis through vertical transmission.'),
    (v_case_id, 'The organism can spread cell-to-cell using:', '["Endospores", "Actin rockets", "Protein A", "Pili"]', 1, 'Listeria uses ActA to polymerize host cell actin, allowing it to push into neighboring cells.'),
    (v_case_id, 'High-risk foods include:', '["Salted meats only", "Unpasteurized dairy and deli meats", "Raw shellfish only", "Fermented rice only"]', 1, 'Listeria survives at low temperatures and is often found in soft cheeses and cold cuts.');

    -- CASE 12: Bacillus anthracis
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 12 - Painless Black Eschar', 'A veterinarian develops a painless black eschar on the hand after handling animal hides.', 12) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Clostridium tetani", "Bacillus anthracis", "Francisella tularensis", "Yersinia pestis"]', 1, 'Cutaneous anthrax presents with a central black eschar surrounded by edema.'),
    (v_case_id, 'The toxin causes edema by:', '["Activating adenylate cyclase via calmodulin", "Inhibiting EF-2", "Blocking GABA release", "Destroying actin"]', 0, 'Edema toxin is a calmodulin-dependent adenylate cyclase that mimics host AC, increasing cAMP.'),
    (v_case_id, 'The capsule is composed of:', '["Hyaluronic acid", "Polysaccharide", "Poly-D-glutamate", "Peptidoglycan"]', 2, 'Anthrax is unique among bacteria for having an amino acid (Poly-D-glutamate) capsule.');

    -- CASE 13: Clostridium tetani
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 13 - Lockjaw and Muscle Spasms', 'A farmer steps on a rusty nail and later develops trismus and muscle spasms.', 13) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Clostridium botulinum", "Clostridium perfringens", "Clostridium tetani", "Bacillus cereus"]', 2, 'C. tetani toxin causes spastic paralysis (lockjaw, risus sardonicus).'),
    (v_case_id, 'The toxin blocks release of:', '["Acetylcholine", "Dopamine", "GABA and glycine", "Norepinephrine"]', 2, 'Tetanospasmin prevents the release of inhibitory neurotransmitters (GABA/Glycine) in the spinal cord.'),
    (v_case_id, 'Management includes:', '["Antitoxin and wound debridement", "Rifampin only", "Oral polio vaccine", "Amphotericin B"]', 0, 'Treatment involves neutralising the toxin with TIG (antitoxin) and source control (cleaning the wound).');

    -- CASE 14: Clostridium botulinum
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 14 - Flaccid Descending Paralysis', 'A family develops diplopia, dysphagia, and descending flaccid paralysis after eating home-canned food.', 14) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Clostridium tetani", "Clostridium botulinum", "Campylobacter jejuni", "Vibrio vulnificus"]', 1, 'Botulism causes symmetric descending flaccid paralysis by blocking ACh.'),
    (v_case_id, 'The toxin works by:', '["Blocking release of acetylcholine", "Inhibiting 30S ribosome", "Stimulating guanylate cyclase", "Activating adenylate cyclase"]', 0, 'Botulinum toxin cleaves SNARE proteins to prevent ACh release at the neuromuscular junction.'),
    (v_case_id, 'Infant disease due to this organism is associated with ingestion of:', '["Honey", "Eggs", "Milk", "Spinach"]', 0, 'Infants ingest C. botulinum spores (often in honey) which germinate in their gut; adults typically ingest pre-formed toxin from canned foods.');

    -- CASE 15: Clostridium perfringens
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 15 - Myonecrosis and Crepitus', 'A trauma patient develops rapidly progressive myonecrosis with crepitus.', 15) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Clostridioides difficile", "Clostridium perfringens", "Bacteroides fragilis", "Nocardia asteroides"]', 1, 'Gas gangrene is most commonly caused by Clostridium perfringens.'),
    (v_case_id, 'The main toxin causing tissue destruction is:', '["Alpha toxin (lecithinase)", "Tetanospasmin", "Shiga toxin", "Exotoxin A"]', 0, 'Alpha toxin is a phospholipase (lecithinase) that destroys cell membranes.'),
    (v_case_id, 'This organism is characterized by:', '["Aerobic branching filaments", "Anaerobic spore-forming gram-positive rod", "Intracellular gram-negative coccobacillus", "Acid-fast branching rod"]', 1, 'Clostridia are anaerobic, gram-positive, spore-forming bacilli.');

    -- CASE 16: Clostridioides difficile
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 16 - Pseudomembranous Colitis', 'A hospitalized patient receiving clindamycin develops watery diarrhea and pseudomembranous colitis.', 16) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["EHEC", "Clostridioides difficile", "Vibrio cholerae", "Giardia lamblia"]', 1, 'C. diff is the major cause of antibiotic-associated diarrhea and colitis.'),
    (v_case_id, 'Diagnosis is best made by detecting:', '["Urease in stool", "Toxins in stool", "Acid-fast organisms in stool", "Ova and parasites"]', 1, 'Diagnosis relies on PCR or ELISA for toxins A and B in the stool.'),
    (v_case_id, 'Pathogenesis involves:', '["Enterotoxin causing cAMP increase only", "Toxins that disrupt actin cytoskeleton", "IgA protease", "Capsule-mediated invasion"]', 1, 'Toxin B especially disrupts the actin cytoskeleton by inactivating Rho GTPases.');

    -- CASE 17: Haemophilus influenzae type b
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 17 - Epiglottitis', 'A child with fever, drooling, and respiratory distress is found sitting forward in tripod position.', 17) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism in an unvaccinated child?', '["Haemophilus influenzae type b", "Corynebacterium diphtheriae", "Moraxella catarrhalis", "Bordetella pertussis"]', 0, 'H. influenzae type b causes life-threatening epiglottitis (tripod position, "thumb sign").'),
    (v_case_id, 'Major virulence factor:', '["Capsule PRP", "M protein", "Urease", "Endospore"]', 0, 'The polyribosylribitol phosphate (PRP) capsule is the primary virulence factor for Hib.'),
    (v_case_id, 'Prevention:', '["Live vaccine", "Conjugate vaccine", "Toxoid only", "No vaccine available"]', 1, 'The Hib vaccine is a conjugate vaccine targeting the PRP capsule.');

    -- CASE 18: Bordetella pertussis
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 18 - Whooping Cough', 'A 4-month-old infant has severe coughing fits followed by inspiratory “whoop” and posttussive vomiting.', 18) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Bordetella pertussis", "RSV", "Parainfluenza virus", "Corynebacterium diphtheriae"]', 0, 'Pertussis presents with paroxysmal coughing fits and the classic "whoop."'),
    (v_case_id, 'Pertussis toxin causes:', '["Decreased cAMP", "Increased cAMP by ADP-ribosylation of Gi", "Inhibition of EF-2", "Increased GMP"]', 1, 'Pertussis toxin inhibits the Gi protein, leading to uncontrolled adenylate cyclase activity and increased cAMP.'),
    (v_case_id, 'Lymphocytosis is seen because toxin:', '["Inhibits neutrophils", "Prevents lymphocyte migration into tissues", "Activates complement", "Destroys RBCs"]', 1, 'Pertussis toxin inhibits the migration of lymphocytes back into lymph nodes, causing blood lymphocytosis.');

    -- CASE 19: Moraxella catarrhalis
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 19 - Otitis Media and COPD Exacerbation', 'A smoker with COPD develops otitis media and later pneumonia. Gram stain shows gram-negative diplococci that are oxidase positive but not Neisseria.', 19) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Moraxella catarrhalis", "Acinetobacter", "Kingella kingae", "Enterobacter cloacae"]', 0, 'Moraxella is a common cause of respiratory infections in smokers/COPD and otitis media.'),
    (v_case_id, 'Common clinical association:', '["COPD exacerbations", "Endocarditis after dental work", "Congenital TORCH infection", "Gas gangrene"]', 0, 'Moraxella is classically associated with exacerbations of COPD.'),
    (v_case_id, 'This organism often produces:', '["Beta-lactamase", "Urease only", "Exotoxin A", "Tetanospasmin"]', 0, 'Most strains of M. catarrhalis are beta-lactamase positive.');

    -- CASE 20: Legionella pneumophila
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 20 - Legionnaires Disease', 'A hotel guest develops high fever, diarrhea, confusion, and pneumonia. Hyponatremia is present. Organism is poorly seen on Gram stain.', 20) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Mycoplasma pneumoniae", "Chlamydophila pneumoniae", "Legionella pneumophila", "Klebsiella pneumoniae"]', 2, 'Legionella pneumophila causes a pneumonia that is often accompanied by GI symptoms and hyponatremia.'),
    (v_case_id, 'Best diagnostic test:', '["Cold agglutinins", "Urinary antigen", "Elek test", "Quellung reaction"]', 1, 'A urinary antigen test is a fast and sensitive way to detect Legionella serogroup 1.'),
    (v_case_id, 'It grows on:', '["Chocolate agar with X and V factor", "BCYE agar with iron and cysteine", "Lowenstein-Jensen medium", "Thayer-Martin medium"]', 1, 'Legionella requires buffered charcoal yeast extract (BCYE) agar supplemented with L-cysteine and iron.');

    -- CASE 21: Mycoplasma pneumoniae
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 21 - Walking Pneumonia', 'A teenager has a dry cough, headache, and patchy interstitial infiltrates. Symptoms are worse than exam findings.', 21) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Streptococcus pneumoniae", "Mycoplasma pneumoniae", "Legionella pneumophila", "RSV"]', 1, 'Mycoplasma is the leading cause of "atypical" pneumonia in young adults.'),
    (v_case_id, 'This organism lacks:', '["Lipopolysaccharide", "Cell wall", "Capsule", "DNA polymerase"]', 1, 'Mycoplasma has no cell wall and its membrane contains sterols.'),
    (v_case_id, 'A common associated lab finding:', '["Cold agglutinins", "Heterophile antibodies", "Eosinophilia", "Positive urease"]', 0, 'Infection with M. pneumoniae can trigger the production of cold agglutinins (IgM).');

    -- CASE 22: Francisella tularensis
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 22 - Tularemia (Rabbit Fever)', 'A rabbit hunter develops fever and a painful ulcer with regional lymphadenopathy after a tick bite.', 22) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Francisella tularensis", "Yersinia pestis", "Bartonella henselae", "Brucella melitensis"]', 0, 'Francisella tularensis is zoonotic and associated with skin contact with infected rabbits or tick bites.'),
    (v_case_id, 'This organism is:', '["Acid-fast rod", "Intracellular gram-negative coccobacillus", "Spirochete", "Anaerobic gram-positive rod"]', 1, 'Francisella is a small, pleomorphic gram-negative coccobacillus.'),
    (v_case_id, 'Exposure classically involves:', '["Cats", "Rabbits", "Sheep wool", "Fish"]', 1, 'The association with rabbits is classic for Francisella ("Rabbit fever").');

    -- CASE 23: Brucella
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 23 - Undulating Fever', 'A veterinarian develops undulating fever, malaise, and hepatosplenomegaly after consuming unpasteurized dairy.', 23) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Brucella", "Listeria", "Yersinia enterocolitica", "Coxiella burnetii"]', 0, 'Brucellosis causes a characteristic undulating fever pattern and is zoonotic.'),
    (v_case_id, 'The organism is best described as:', '["Intracellular gram-negative coccobacillus", "Gram-positive branching filament", "Acid-fast bacillus", "Encapsulated gram-positive cocci"]', 0, 'Brucellas are small gram-negative coccobacilli that live intracellularly in macrophages.'),
    (v_case_id, 'Exposure is classically associated with:', '["Cats", "Unpasteurized dairy and livestock", "Hotel water systems", "Mosquitoes"]', 1, 'Transmission is often through ingestion of unpasteurized milk from infected cows/goats.');

    -- CASE 24: Salmonella enterica (Osteomyelitis)
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 24 - Sickle Cell and Osteomyelitis', 'A patient with sickle cell disease develops osteomyelitis. Culture grows a motile, H2S-producing gram-negative rod.', 24) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Shigella sonnei", "Salmonella enterica", "Yersinia pestis", "Proteus mirabilis"]', 1, 'Salmonella is the most common cause of osteomyelitis in patients with sickle cell disease.'),
    (v_case_id, 'On Hektoen agar it would appear:', '["Green with black centers", "Pink", "Clear", "Metallic sheen"]', 0, 'Salmonella produces H2S, which appears as black centers on Hektoen agar.'),
    (v_case_id, 'A key distinguishing feature from Shigella:', '["Nonmotile", "Lactose fermentation", "H2S production and motility", "Oxidase positivity"]', 2, 'Salmonella is motile and H2S positive, whereas Shigella is non-motile and H2S negative.');

    -- CASE 25: Shigella
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 25 - Dysentery and Low Inoculum', 'A daycare outbreak causes fever, abdominal cramps, and bloody diarrhea. Only a small inoculum is needed.', 25) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Salmonella", "Vibrio cholerae", "Shigella", "Enterotoxigenic E. coli"]', 2, 'Shigella is highly contagious and causes bloody diarrhea (dysentery).'),
    (v_case_id, 'A major complication is:', '["Guillain-Barré syndrome", "Hemolytic uremic syndrome", "Toxic megacolon and seizures", "Neonatal meningitis"]', 2, 'Shigellosis can provoke systemic complications like seizures in children or toxic megacolon.'),
    (v_case_id, 'Mechanism of toxin:', '["Activates Gs", "Inactivates 60S ribosome by removing adenine from rRNA", "Blocks GABA release", "Inhibits cell wall synthesis"]', 1, 'Shiga toxin inhibits the 60S ribosomal subunit by cleaving the 28S rRNA.');

    -- CASE 26: EHEC (O157:H7)
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 26 - Bloody Diarrhea and HUS', 'A child develops severe abdominal cramps and bloody diarrhea after eating undercooked beef. No fever. Days later he becomes pale with low platelets and acute kidney injury.', 26) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["ETEC", "EHEC", "EPEC", "Enteroinvasive E. coli"]', 1, 'Enterohemorrhagic E. coli (EHEC) causes bloody diarrhea and can lead to hemolytic uremic syndrome (HUS).'),
    (v_case_id, 'The toxin resembles that of:', '["Cholera", "Shigella", "Diphtheria", "Pertussis"]', 1, 'EHEC produces a "Shiga-like" toxin with the same mechanism as the Shiga toxin.'),
    (v_case_id, 'Sorbitol MacConkey agar classically shows:', '["Pink colonies", "Non-sorbitol fermenting colonies", "Black colonies", "No growth"]', 1, 'E. coli O157:H7 is unique because it cannot ferment sorbitol.');

    -- CASE 27: ETEC (Travelers Diarrhea)
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 27 - Travelers Diarrhea', 'A traveler to South Asia develops profuse watery diarrhea after drinking contaminated water.', 27) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["EHEC", "Shigella", "Enterotoxigenic E. coli", "Campylobacter jejuni"]', 2, 'ETEC is the most common cause of traveler''s diarrhea.'),
    (v_case_id, 'Heat-labile toxin acts by:', '["Blocking 60S ribosome", "Activating adenylate cyclase via Gs", "Destroying microtubules", "Inhibiting EF-2"]', 1, 'LT activates adenylate cyclase (cAMP), leading to watery diarrhea. (Labile/Adenylate).'),
    (v_case_id, 'Heat-stable toxin increases:', '["cAMP", "cGMP", "IP3", "DAG"]', 1, 'ST activates guanylate cyclase (cGMP), leading to watery diarrhea. (Stable/Guanylate).');

    -- CASE 28: Vibrio cholerae
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 28 - Rice-Water Diarrhea', 'A patient presents with severe rice-water diarrhea after a natural disaster with poor sanitation.', 28) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Vibrio cholerae", "Giardia lamblia", "Rotavirus", "Cryptosporidium"]', 0, 'V. cholerae causes massive, non-inflammatory watery diarrhea.'),
    (v_case_id, 'The toxin causes:', '["Inhibition of 60S ribosome", "Increased cAMP via Gs activation", "Increased cGMP only", "Inhibition of DNA gyrase"]', 1, 'Cholera toxin ADP-ribosylates the Gs subunit, permanently activating adenylate cyclase.'),
    (v_case_id, 'The organism is:', '["Curved oxidase-positive gram-negative rod", "Gram-positive cocci in chains", "Acid-fast protozoan", "Branching filamentous rod"]', 0, 'Vibrios are hallmark comma-shaped (curved), oxidase-positive, gram-negative rods.');

    -- CASE 29: Vibrio vulnificus
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 29 - Shellfish and Liver Disease', 'A patient develops fever, abdominal pain, and diarrhea after eating raw oysters. He has chronic liver disease.', 29) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Campylobacter jejuni", "Vibrio vulnificus", "Salmonella typhi", "Clostridium perfringens"]', 1, 'Vibrio vulnificus can cause severe cellulitis and septicemia, particularly in those with liver disease or iron overload.'),
    (v_case_id, 'A major risk factor for severe disease is:', '["Asthma", "Iron overload/liver disease", "Nephrotic syndrome", "Hypothyroidism"]', 1, 'Patients with liver disease are at extremely high risk for fulminant sepsis with V. vulnificus.'),
    (v_case_id, 'The organism is:', '["Curved gram-negative rod found in marine environments", "Acid-fast bacillus", "Gram-positive coccus", "Spirochete"]', 0, 'It is halophilic (thrives in salt water) and appears as curved gram-negative rods.');

    -- CASE 30: Campylobacter jejuni
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 30 - Undercooked Poultry and GBS', 'A patient develops bloody diarrhea after eating undercooked poultry. Later he develops ascending weakness.', 30) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Campylobacter jejuni", "Salmonella enteritidis", "Shigella dysenteriae", "Yersinia enterocolitica"]', 0, 'Campylobacter is a major cause of inflammatory diarrhea and is common in undercooked chicken.'),
    (v_case_id, 'The neurologic complication is:', '["Myasthenia gravis", "Guillain-Barré syndrome", "Multiple sclerosis", "Tabes dorsalis"]', 1, 'C. jejuni infection is the most common trigger for Guillain-Barré syndrome.'),
    (v_case_id, 'This organism is:', '["Curved oxidase-positive gram-negative rod", "Gram-positive branching rod", "Nonmotile lactose fermenter", "Encapsulated coccus"]', 0, 'Campylobacter are curved gram-negative rods that are oxidase-positive and grow at 42°C.');

    -- CASE 31: Yersinia enterocolitica
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 31 - Pork and Pseudoappendicitis', 'A child develops fever and severe abdominal pain mimicking appendicitis after eating contaminated pork.', 31) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Yersinia enterocolitica", "Listeria monocytogenes", "Vibrio cholerae", "Bacillus cereus"]', 0, 'Yersinia enterocolitica infection often presents with mesenteric lymphadenitis mimicking appendicitis.'),
    (v_case_id, 'This organism can grow at:', '["Very high salt only", "Refrigeration temperatures", "80°C", "Strict anaerobic conditions only"]', 1, 'Like Listeria, Yersinia enterocolitica is psychrotrophic (can grow in the cold).'),
    (v_case_id, 'It is associated with:', '["Mesenteric adenitis", "Rice-water stools", "Pseudomembranous colitis", "Bullous skin lesions"]', 0, 'Mesenteric adenitis is the classic presentation of Yersinia infection.');

    -- CASE 32: Viridans Streptococci
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 32 - Subacute Endocarditis', 'A patient with a prosthetic heart valve undergoes dental cleaning without prophylaxis and later develops subacute endocarditis.', 32) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Staphylococcus aureus", "Viridans streptococci", "Enterococcus faecalis", "Pseudomonas aeruginosa"]', 1, 'Viridans group strep (e.g., S. sanguinis) are common causes of subacute endocarditis on damaged valves.'),
    (v_case_id, 'A key virulence feature is:', '["Exfoliative toxin", "Dextran-mediated adherence to fibrin-platelet aggregates", "Coagulase", "Urease"]', 1, 'Viridans strep produce dextrans that allow them to stick to fibrin clumps on damaged heart valves.'),
    (v_case_id, 'This organism is:', '["Alpha-hemolytic, optochin sensitive", "Alpha-hemolytic, optochin resistant", "Beta-hemolytic bacitracin sensitive", "Gamma-hemolytic bile soluble"]', 1, 'Viridans are alpha-hemolytic; they are distinguished from S. pneumoniae by being optochin-resistant and bile-insoluble.');

    -- CASE 33: Staphylococcus aureus
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 33 - IV Drug Use and Acute Endocarditis', 'A patient rapidly develops fever, hypotension, and a new heart murmur. He injects drugs intravenously.', 33) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Viridans streptococci", "Staphylococcus epidermidis", "Staphylococcus aureus", "Enterococcus faecium"]', 2, 'S. aureus is the most common cause of acute endocarditis and valve destruction.'),
    (v_case_id, 'This organism is:', '["Coagulase negative", "Coagulase positive", "Catalase negative", "Acid-fast"]', 1, 'S. aureus is unique among staphylococci for being coagulase-positive.'),
    (v_case_id, 'In IV drug users the valve most commonly involved is:', '["Mitral", "Aortic", "Tricuspid", "Pulmonic"]', 2, 'Right-sided (tricuspid) endocarditis is highly characteristic of IV drug use.');

    -- CASE 34: Staphylococcus epidermidis
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 34 - Biofilms and Prosthetics', 'A patient with an indwelling prosthetic joint develops infection with a coagulase-negative, novobiocin-sensitive, gram-positive coccus.', 34) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Staphylococcus saprophyticus", "Staphylococcus epidermidis", "Enterococcus faecalis", "Micrococcus luteus"]', 1, 'S. epidermidis is the leading cause of infections on foreign bodies (valves, joints, catheters).'),
    (v_case_id, 'The main pathogenic mechanism is:', '["Biofilm formation", "Endospore formation", "Alpha toxin", "M protein"]', 0, 'S. epidermidis produces an extracellular polysaccharide matrix (biofilm) that protects it from antibiotics and the immune system.'),
    (v_case_id, 'This organism is part of normal flora of:', '["GI tract only", "Skin", "Respiratory mucosa only", "Genital ulcers only"]', 1, 'S. epidermidis is a ubiquitous commensal of the human skin.');

    -- CASE 35: Staphylococcus saprophyticus
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 35 - Sexually Active Woman and UTI', 'A sexually active young woman presents with cystitis. Urine culture grows a novobiocin-resistant gram-positive coccus.', 35) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Staphylococcus epidermidis", "Enterococcus faecalis", "Staphylococcus saprophyticus", "Streptococcus agalactiae"]', 2, 'S. saprophyticus is a common cause of "honeymoon cystitis" in young women.'),
    (v_case_id, 'This organism is:', '["Coagulase positive", "Coagulase negative", "Catalase negative", "Beta-hemolytic in chains only"]', 1, 'Like S. epidermidis, S. saprophyticus is coagulase-negative but can be distinguished by its novobiocin resistance.'),
    (v_case_id, 'Common clinical association:', '["Prosthetic valve infections", "UTIs in young women", "Neonatal meningitis", "Lobar pneumonia"]', 1, 'It is specifically linked to UTIs in young, sexually active females.');

    -- CASE 36: Impetigo
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 36 - Honey-Colored Crusts', 'A child presents with honey-colored crusted skin lesions around the mouth.', 36) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Staphylococcus aureus or Streptococcus pyogenes", "Pseudomonas aeruginosa only", "Bacillus anthracis", "Corynebacterium diphtheriae"]', 0, 'Non-bullous impetigo is most commonly caused by S. aureus or GAS.'),
    (v_case_id, 'If bullous lesions are present, which toxin is involved?', '["TSST-1", "Exfoliative toxin", "Erythrogenic toxin", "Shiga toxin"]', 1, 'Bullous impetigo is caused by S. aureus exfoliative toxin.'),
    (v_case_id, 'Exfoliative toxin cleaves:', '["Desmoglein 1", "Desmoglein 3", "Collagen IV", "Integrins"]', 0, 'Exfoliative toxin targets desmoglein 1 in the stratum granulosum, causing epidermal separation.');

    -- CASE 37: Streptococcus pyogenes (Rheumatic Fever)
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 37 - Sequelae of Pharyngitis', 'A child has pharyngitis followed weeks later by migratory polyarthritis and carditis.', 37) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Initial infection was most likely caused by:', '["Staphylococcus aureus", "Streptococcus pyogenes", "Enterococcus faecalis", "Streptococcus gallolyticus"]', 1, 'Acute rheumatic fever occurs 2–4 weeks after a Group A pharyngitis.'),
    (v_case_id, 'The major virulence factor is:', '["Capsule with PRP", "M protein", "Coagulase", "Protein A"]', 1, 'M protein is highly antigenic and is the primary factor involved in post-streptococcal sequelae.'),
    (v_case_id, 'Rheumatic fever is due to:', '["Direct bacterial invasion", "Molecular mimicry", "Endotoxin release", "Biofilm"]', 1, 'Type II hypersensitivity: antibodies against M protein cross-react with host tissue (cardiac myosin).');

    -- CASE 38: Streptococcus agalactiae (Group B)
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 38 - Neonatal Sepsis', 'A neonate develops sepsis and meningitis shortly after birth. Mother was not screened during pregnancy.', 38) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Listeria monocytogenes", "Streptococcus agalactiae", "E. coli O157:H7", "Enterococcus faecalis"]', 1, 'Group B strep is the #1 cause of neonatal sepsis and meningitis.'),
    (v_case_id, 'This organism is:', '["Group A beta-hemolytic streptococcus", "Group B beta-hemolytic streptococcus", "Alpha-hemolytic streptococcus", "Coagulase-positive coccus"]', 1, 'S. agalactiae is a Group B, beta-hemolytic strep.'),
    (v_case_id, 'Screening in pregnancy is performed around:', '["8–12 weeks", "18–20 weeks", "35–37 weeks", "At delivery only"]', 2, 'Universal screening for GBS is performed at 35–37 weeks gestation.');

    -- CASE 39: Candida albicans
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 39 - Thrush and Fungemia', 'A hospitalized patient on broad-spectrum antibiotics develops oral thrush and later fungemia.', 39) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Aspergillus fumigatus", "Candida albicans", "Cryptococcus neoformans", "Histoplasma capsulatum"]', 1, 'Candida overgrowth often occurs after antibiotics or in immunocompromised states.'),
    (v_case_id, 'Morphology classically shows:', '["Encapsulated budding yeast in CSF", "Pseudohyphae and budding yeast", "Broad nonseptate hyphae", "Spherules with endospores"]', 1, 'Candida is seen as pseudohyphae and yeast; it forms true hyphae ("germ tubes") at 37°C.'),
    (v_case_id, 'This organism is part of normal:', '["Soil flora only", "Human mucocutaneous flora", "Bird droppings only", "Water systems"]', 1, 'Candida is a normal commensal of the GI and female genital tracts.');

    -- CASE 40: Aspergillus fumigatus
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 40 - Neutropenia and Lung Nodules', 'A patient with neutropenia develops cough, pleuritic chest pain, and hemoptysis. CT shows nodules. Histology reveals acute-angle septate hyphae.', 40) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Mucor", "Candida", "Aspergillus", "Cryptococcus"]', 2, 'Invasive aspergillosis is a critical infection in neutropenic patients.'),
    (v_case_id, 'A toxin produced by this organism:', '["Aflatoxin", "Tetanospasmin", "Cholera toxin", "Pertussis toxin"]', 0, 'Aspergillus flavus specifically produces aflatoxins, which are associated with hepatocellular carcinoma.'),
    (v_case_id, 'A common species causing invasive disease:', '["Aspergillus fumigatus", "Aspergillus clavatus only", "Candida tropicalis only", "Rhizopus oryzae"]', 0, 'A. fumigatus is the most common cause of invasive mold infections.');

    -- CASE 41: Mucor/Rhizopus
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 41 - DKA and Facial Necrosis', 'A patient in diabetic ketoacidosis develops facial pain and black necrotic nasal tissue. Broad nonseptate hyphae are seen.', 41) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Aspergillus", "Mucor/Rhizopus", "Candida", "Blastomyces"]', 1, 'Rhinocerebral mucormycosis is a medical emergency classically seen in poorly controlled DKA.'),
    (v_case_id, 'This infection is characterized by:', '["Acute-angle branching septate hyphae", "Broad nonseptate hyphae with right-angle branching", "Budding yeast with capsule", "Intracellular yeast in macrophages"]', 1, 'Mucor hyphae are wide, lack septa, and branch at 90° angles.'),
    (v_case_id, 'Major risk factor:', '["Asthma", "DKA", "Iron deficiency", "Hyperthyroidism"]', 1, 'Ketone reductase in Mucor allows it to thrive in high-glucose, acidic environments like DKA.');

    -- CASE 42: Cryptococcus neoformans
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 42 - AIDS and Meningitis', 'An AIDS patient with CD4 count 40 has headache and meningitis. India ink is positive.', 42) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Histoplasma capsulatum", "Cryptococcus neoformans", "Coccidioides immitis", "Candida albicans"]', 1, 'Cryptococcal meningitis is a major AIDS-defining illness.'),
    (v_case_id, 'Important virulence factor:', '["Mycolic acid", "Polysaccharide capsule", "Endospore", "Flagella"]', 1, 'The thick repeating glucuronoxylomannan capsule is the main factor and is visualized via India ink.'),
    (v_case_id, 'Exposure classically involves:', '["Bird droppings", "Cats", "Rabbits", "Seafood"]', 0, 'Cryptococcus is heavily found in pigeon droppings and soil.');

    -- CASE 43: Histoplasma capsulatum
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 43 - Ohio River Valley', 'A spelunker from the Ohio River valley develops pulmonary symptoms. Biopsy shows small intracellular yeasts in macrophages.', 43) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Blastomyces dermatitidis", "Histoplasma capsulatum", "Coccidioides immitis", "Sporothrix schenckii"]', 1, 'Histoplasmosis is endemic to the Ohio and Mississippi river valleys and caves (guano).'),
    (v_case_id, 'Reservoir commonly includes:', '["Rose thorns", "Bird or bat droppings", "Desert dust storms", "Freshwater snails"]', 1, 'Histoplasma grows well in soil enriched with bird or bat guano.'),
    (v_case_id, 'Histology classically shows:', '["Broad-based budding yeast", "Spherules with endospores", "Intracellular yeast in macrophages", "Encapsulated budding yeast"]', 2, 'Histoplasma is smaller than RBCs and lives inside macrophages (Histo hides in histiocytes).');

    -- CASE 44: Blastomyces dermatitidis
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 44 - Broad-Based Budding', 'A hunter from the Mississippi region develops lung disease and verrucous skin lesions. Broad-based budding yeast is seen.', 44) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Histoplasma", "Blastomyces", "Coccidioides", "Candida"]', 1, 'Blastomycosis involves lungs, skin, and bones; it is found in the East and Central US.'),
    (v_case_id, 'Morphology:', '["Broad-based budding yeast", "Narrow-based budding encapsulated yeast", "Pseudohyphae", "Spherules with endospores"]', 0, 'Blastomyces shows "Broad-Based Budding" (B for Blastomyces).'),
    (v_case_id, 'Geography is most associated with:', '["Southwest desert", "Ohio/Mississippi region", "Great Lakes only", "Middle East only"]', 1, 'Overlap with Histoplasma but also extends farther north into the Great Lakes and Canada.');

    -- CASE 45: Coccidioides immitis
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 45 - Desert Fever', 'A construction worker in Arizona develops fever, cough, arthralgia, and erythema nodosum after a dust storm.', 45) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Histoplasma capsulatum", "Blastomyces dermatitidis", "Coccidioides immitis", "Cryptococcus neoformans"]', 2, 'Coccidioidomycosis (Valley Fever) is associated with the Southwestern US and California.'),
    (v_case_id, 'Tissue form:', '["Broad-based budding yeast", "Spherules filled with endospores", "Intracellular yeast in macrophages", "Encapsulated budding yeast"]', 1, 'Coccidioides forms large spherules (bigger than RBCs) containing multiple endospores.'),
    (v_case_id, 'Geography:', '["Ohio valley", "Southwest US", "Pacific Northwest only", "New England only"]', 1, 'Found in arid regions (San Joaquin valley, Arizona).');

    -- CASE 46: Sporothrix schenckii
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 46 - Rose-Gardener Disease', 'A gardener develops a nodular lesion on the hand that spreads along lymphatics after a thorn prick.', 46) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Sporothrix schenckii", "Aspergillus fumigatus", "Candida albicans", "Histoplasma capsulatum"]', 0, 'Sporotrichosis classically presents with "sporotrichoid spread" (ascending lymphangitis).'),
    (v_case_id, 'Classic exposure:', '["Bird droppings", "Rose thorns", "Desert soil", "Pigeon nests"]', 1, 'Associated with plant trauma, particularly rose thorns and sphagnum moss.'),
    (v_case_id, 'Histology may show:', '["Broad nonseptate hyphae", "Cigar-shaped budding yeast", "Encapsulated yeast", "Acid-fast bacilli"]', 1, 'Sporothrix appears as pleomorphic, "cigar-shaped" yeasts.');

    -- CASE 47: Rotavirus
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 47 - Infant Diarrhea', 'A child in daycare develops vomiting and watery diarrhea in winter. Another child later gets severe dehydrating diarrhea and is found to have destruction of villi in the small intestine.', 47) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism in severe infant gastroenteritis?', '["Norovirus", "Rotavirus", "Adenovirus", "Astrovirus"]', 1, 'Rotavirus is the most common cause of severe, dehydrating diarrhea in infants worldwide.'),
    (v_case_id, 'This virus is:', '["Enveloped dsDNA", "Nonenveloped segmented dsRNA", "Enveloped +ssRNA", "Helical dsDNA"]', 1, 'Rotaviruses are Reoviruses (naked, dsRNA, segmented).'),
    (v_case_id, 'A vaccine exists and is:', '["Inactivated IM vaccine", "Live attenuated oral vaccine", "Toxoid vaccine", "Recombinant protein only"]', 1, 'Oral live-attenuated vaccines are used internationally to prevent severe disease.');

    -- CASE 48: Norovirus
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 48 - Cruise Ship Outbreak', 'A cruise ship outbreak causes abrupt vomiting and diarrhea among many passengers.', 48) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Rotavirus", "Norovirus", "Poliovirus", "HAV"]', 1, 'Norovirus is the major cause of epidemic viral gastroenteritis in adults.'),
    (v_case_id, 'This virus is:', '["Nonenveloped +ssRNA calicivirus", "Enveloped segmented RNA virus", "dsDNA virus", "Retrovirus"]', 0, 'Noroviruses are Caliciviruses (naked, +ssRNA).'),
    (v_case_id, 'Transmission is typically:', '["Arthropod bite", "Fecal-oral", "Vertical only", "Sexual only"]', 1, 'Usually fecal-oral, often via contaminated water or food in crowded settings.');

    -- CASE 49: Poliovirus
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 49 - Paralytic Polio', 'A 5-year-old unvaccinated child develops fever and flaccid paralysis. CSF shows increased lymphocytes. Stool PCR is positive.', 49) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["Coxsackievirus", "Poliovirus", "Rabies virus", "JC virus"]', 1, 'Poliovirus infects anterior horn cells leading to asymmetric flaccid paralysis.'),
    (v_case_id, 'This virus is:', '["Enveloped -ssRNA", "Nonenveloped +ssRNA picornavirus", "dsDNA virus", "Retrovirus"]', 1, 'Poliovirus is a naked, +ssRNA Picornavirus.'),
    (v_case_id, 'Vaccination strategies historically include:', '["Live oral and inactivated injectable vaccines", "Capsule vaccine only", "Toxoid vaccine only", "No vaccine exists"]', 0, 'Sabin (oral, live-attenuated) and Salk (injected, inactivated) are the classic vaccines.');

    -- CASE 50: Rabies Virus
    INSERT INTO case_studies (topic_id, title, scenario, "order") 
    VALUES (v_topic_id, 'Case 50 - Hydrophobia and Dog Bite', 'A dog bite victim develops fever, agitation, hydrophobia, and confusion weeks later.', 50) 
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely organism?', '["HSV-1", "Rabies virus", "West Nile virus", "CMV"]', 1, 'Rabies presents with progressive encephalopathy and the characteristic hydrophobia (fear of water/swallowing).'),
    (v_case_id, 'This virus travels to the CNS via:', '["Hematogenous spread from liver", "Retrograde axonal transport", "Direct bloodstream invasion only", "Lymphatic spread through Peyer patches"]', 1, 'Rabies travels from the peripheral site to the CNS via retrograde axonal transport along motor nerves.'),
    (v_case_id, 'Histology classically reveals:', '["Owl-eye inclusions", "Negri bodies", "Cowdry A inclusions", "Guarnieri bodies"]', 1, 'Negri bodies (eosinophilic cytoplasmic inclusions) in Purkinje cells or hippocampal neurons are pathognomonic.');

    RAISE NOTICE 'USMLE Step 1 Microbiology Cases Migration Completed (50 Cases).';
END $$;
