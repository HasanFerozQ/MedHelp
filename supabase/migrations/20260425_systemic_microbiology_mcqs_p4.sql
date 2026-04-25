-- Migration: Year 2 - Systemic Microbiology MCQ Bank (PART 4: 211-280)
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
        'A 25-year-old male presents with a "painless" penile ulcer with raised, indurated borders. He has non-tender inguinal lymphadenopathy. Dark-field microscopy reveals spirochetes. What is the drug of choice?',
        'A patient with tertiary syphilis presents with a "lightning-like" pain in the legs, loss of proprioception, and wide-based gait. What is the pathological process in the spinal cord?',
        'A 60-year-old man with a history of a prosthetic heart valve develops fever and a new heart murmur. Blood cultures grow S. epidermidis. What is the classic finding on the fingers/toes associated with immune complex deposition in endocarditis?',
        'Which organism is the most common cause of community-acquired pneumonia in a patient with COPD?',
        'A patient presents with a "currant jelly" stool and abdominal distension. While this is often mechanical (intussusception), which virus is the most common trigger in children?',
        'A 22-year-old female presents with urgency, frequency, and suprapubic pain. Urine shows WBC casts. What does the presence of casts indicate?',
        'A 3-year-old child presents with a "barking" cough and inspiratory stridor. This is classic for croup. Which virus is responsible?',
        'A 24-year-old female presents with a diffuse, painful, hot, swollen knee. She also has small, pustular lesions on her palms. Joint aspiration reveals low-volume, purulent fluid. What is the likely diagnosis?',
        'A 7-year-old boy presents with high fever, neck stiffness, and a petechial rash. He is diagnosed with meningitis and suddenly develops circulatory collapse and flank pain. Diagnosis?',
        'A patient presents with sudden onset of fever and severe headache. CSF shows a lymphocytic pleocytosis, normal glucose, and elevated protein. Gram stain is negative. What is the most likely cause?',
        'A child with a history of a sore throat presents with a "strawberry tongue" and a "sandpaper" rash that spares the face. Diagnosis?',
        'A 30-year-old female presents with "Strawberry Cervix" and thin, yellow-green vaginal discharge with a "fishy" odor. Wet mount shows motile, pear-shaped organisms. Diagnosis?',
        'A patient presents with a "painless" genital ulcer that has beefy-red appearance and bleeds easily. Biopsy shows intracellular Donovan bodies. Agent?',
        'A patient presents with a painful genital ulcer and painful, swollen inguinal lymph nodes (buboes) that have "groove sign." Diagnosis?',
        'Which of the following is the leading cause of neonatal sepsis and meningitis?',
        'A patient presents with a "target-like" rash (erythema migrans) and joint pain. Which tick is the vector for this disease?',
        'A patient presents with nausea, vomiting, and abdominal cramps 4 hours after eating potato salad at a picnic. Agent?',
        'A patient presents with bloody diarrhea 2 days after eating undercooked chicken. The organism is a curved, Gram-negative rod that is oxidase-positive. Agent?',
        'A patient presents with high fever and severe joint/bone pain ("break-bone" fever). Which mosquito is the vector?',
        'Which of the following organisms is an "Acid-Fast" rod that causes disseminated disease in AIDS patients with CD4 < 50?',
        'A 45-year-old male presents with a painless, black eschar on his arm after handling animal hides. Diagnosis?',
        'What is the mechanism of the toxin produced by Corynebacterium diphtheriae?',
        'Which antibody isotype is the first to be produced in an acute infection (primary response)?',
        'Which antibody isotype is the most abundant in serum and is the only one that crosses the placenta?',
        'Which antibody isotype is a dimer in secretions and protects mucosal surfaces?',
        'Which antibody isotype is found on the surface of mast cells and basophils and is involved in Type I hypersensitivity?',
        'Which complement component acts as a major opsonin, coating bacteria for phagocytosis?',
        'Which complement components combine to form the Membrane Attack Complex (MAC)?',
        'A patient with a deficiency in C1 esterase inhibitor develops recurrent, non-pitting edema. Diagnosis?',
        'Patients with a deficiency in C5-C9 (MAC) are uniquely susceptible to infections by which genus?',
        'What is the mechanism of Type II (Cytotoxic) hypersensitivity?',
        'A patient develops fever, chills, and hypotension 15 minutes into a blood transfusion. This is which type of hypersensitivity?',
        'Which type of hypersensitivity is mediated by immune complex deposition in small vessels (e.g., serum sickness)?',
        'Post-streptococcal glomerulonephritis is caused by which type of hypersensitivity?',
        'A positive PPD skin test for Tuberculosis is a classic example of which type of hypersensitivity?',
        'What is the primary function of Th1 cells?',
        'Which cytokine is primarily responsible for the recruitment of eosinophils in allergic responses (Type I)?',
        'Which immunodeficiency presents with high IgE and recurrent "cold" staphylococcal abscesses (Job Syndrome)?',
        'A 6-month-old male presents with recurrent bacterial and enteroviral infections. Labs show absent B-cells and low levels of all immunoglobulin classes. Diagnosis?',
        'A child with DiGeorge syndrome has a failure of the 3rd and 4th pharyngeal pouches to develop. Which of the following is an expected finding?',
        'Which immunodeficiency presents with "Delayed separation of the umbilical cord" and a lack of neutrophils at the site of infection (lack of pus)?',
        'A patient with Ataxia-Telangiectasia has a defect in which DNA repair mechanism?',
        'Which cell type is primarily affected by the defect in microtubule polymerization (LYST gene) in Chediak-Higashi syndrome?',
        'What is the mechanism of "Isotype switching" in B-cells?',
        'Which cytokine is the primary growth factor that drives B-cell differentiation and IgA production in the gut?',
        'Which molecule serves as the "bridge" between the innate and adaptive immune systems by activating T-cells?',
        'A patient with Chronic Granulomatous Disease has a defect in which enzyme?',
        'In Chronic Granulomatous Disease, patients are highly susceptible to which of the following (catalase-positive)?',
        'What is the drug of choice for treating severe Pseudomonas aeruginosa infections?',
        'What is the mechanism of action of Aminoglycosides (e.g., Gentamicin)?',
        'Which antibiotic class is most strongly associated with both "Ototoxicity" and "Nephrotoxicity"?',
        'What is the mechanism of action of Macrolides (e.g., Azithromycin)?',
        'What is the mechanism of action of Trimethoprim?',
        'Which antibiotic inhibits the 50S ribosomal subunit and is the drug of choice for anaerobic infections above the diaphragm?',
        'What is the drug of choice for treating Lyme disease in a child under 8 years old or a pregnant woman?',
        'Which drug is used for the primary prophylaxis of Pneumocystis jirovecii in a patient with HIV and a CD4 count < 200?',
        'Which antiviral agent is used to treat Influenza A and B and should be started within 48 hours of symptom onset?',
        'What is the mechanism of action of Amphotericin B?',
        'Which antifungal agent inhibits the synthesis of ergosterol by blocking the enzyme 14-alpha-demethylase?',
        'Which antifungal is the first-line treatment for dermatophyte infections of the nails (onychomycosis)?',
        'What is the mechanism of action of Acyclovir?',
        'Which viral infection is associated with the presence of "Councilman bodies" in the liver?',
        'Which virus causes "Guarnieri bodies" (intracytoplasmic inclusions)?',
        'A patient with HIV has a CD4 count of 200. What is the most common opportunistic pneumonia seen at this level?',
        'A patient with HIV has a CD4 count of 50. What is the most common cause of viral retinitis?',
        'Which parasite is the cause of "Megacolon" and "Chagasic cardiomyopathy" in South America?',
        'Which helminth infection is a major risk factor for developing Squamous Cell Carcinoma of the urinary bladder?',
        'Which protozoan is associated with a "Maltese cross" appearance inside red blood cells on a blood smear?',
        'Which protozoan is a common cause of vaginitis and presents with a "Strawberry Cervix"?',
        'What is the mechanism of action of Praziquantel, used to treat trematodes and cestodes?',
        'Which drug is the treatment of choice for a patient with severe Plasmodium falciparum malaria?',
        'What is the mechanism of action of the HIV drug Raltegravir?',
        'Which drug class does Maraviroc belong to, and what is its target?',
        'A patient with HIV develops a cough and a CD4 count of 150. Which drug is used for primary prophylaxis against PCP?',
        'What is the mechanism of action of the antifungal Caspofungin?',
        'Which organism causes "Chagas Disease" and is transmitted by the Triatomine bug?',
        'A patient presents with a "maculopapular rash" on the palms and soles and generalized lymphadenopathy. Which stage of Syphilis is this?',
        'Which virus is associated with the development of "Kaposi Sarcoma" in AIDS patients?',
        'What is the drug of choice for treating a patient with a "flesh-eating" necrotizing fasciitis caused by S. pyogenes?'
    );

    -- SECTION 14: SYSTEM-BASED INFECTIOUS DISEASES (211-240)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A 25-year-old male presents with a "painless" penile ulcer with raised, indurated borders. He has non-tender inguinal lymphadenopathy. Dark-field microscopy reveals spirochetes. What is the drug of choice?', '["Azithromycin", "Doxycycline", "Penicillin G", "Ceftriaxone"]', 2, 'Primary Syphilis (Treponema pallidum) is treated with a single IM dose of Benzathine Penicillin G.'),
    (v_topic_id, 'A patient with tertiary syphilis presents with a "lightning-like" pain in the legs, loss of proprioception, and wide-based gait. What is the pathological process in the spinal cord?', '["Destruction of anterior horns", "Demyelination of the dorsal columns", "Inflammation of the meninges", "Ischemia of the watershed areas"]', 1, 'Tabes dorsalis is the degeneration of the dorsal columns and roots due to neurosyphilis.'),
    (v_topic_id, 'A 60-year-old man with a history of a prosthetic heart valve develops fever and a new heart murmur. Blood cultures grow S. epidermidis. What is the classic finding on the fingers/toes associated with immune complex deposition in endocarditis?', '["Janeway lesions", "Osler nodes", "Splinter hemorrhages", "Roth spots"]', 1, '"Osler nodes" are painful, immune-mediated nodules on the digits. Janeway lesions are painless, embolic, and found on palms/soles.'),
    (v_topic_id, 'Which organism is the most common cause of community-acquired pneumonia in a patient with COPD?', '["Streptococcus pneumoniae", "Haemophilus influenzae", "Moraxella catarrhalis", "Mycoplasma pneumoniae"]', 1, 'H. influenzae is very common in COPD patients, though S. pneumoniae is the #1 cause overall.'),
    (v_topic_id, 'A patient presents with a "currant jelly" stool and abdominal distension. While this is often mechanical (intussusception), which virus is the most common trigger in children?', '["Rotavirus", "Adenovirus", "Enterovirus", "Norovirus"]', 1, 'Adenovirus infection can lead to hyperplasia of Peyer''s patches, which acts as a lead point for intussusception.'),
    (v_topic_id, 'A 22-year-old female presents with urgency, frequency, and suprapubic pain. Urine shows WBC casts. What does the presence of casts indicate?', '["Cystitis", "Pyelonephritis", "Urethritis", "Vaginitis"]', 1, 'WBC casts are formed in the renal tubules and diagnostic of upper UTI (Pyelonephritis).'),
    (v_topic_id, 'Which organism is the #1 cause of osteomyelitis in the general population?', '["Salmonella", "Staphylococcus aureus", "Pseudomonas", "Pasteurella"]', 1, 'S. aureus is the most common cause overall. Salmonella is classic for Sickle Cell.'),
    (v_topic_id, 'A patient with a history of puncture through a sneaker develops osteomyelitis. Which organism is characteristically associated with this?', '["Staphylococcus aureus", "Pseudomonas aeruginosa", "Serratia marcescens", "E. coli"]', 1, 'Pseudomonas thrives in the moist environment of the inner sole of sneakers.'),
    (v_topic_id, 'A 20-year-old male presents with a "hot, swollen" knee. Synovial fluid shows many neutrophils and intracellular Gram-negative diplococci. Diagnosis?', '["Septic arthritis (Gonococcal)", "Rheumatoid arthritis", "Gout", "Lyme arthritis"]', 0, 'N. gonorrhoeae is the leading cause of septic arthritis in young, sexually active adults.'),
    (v_topic_id, 'A patient develops "Waterhouse-Friderichsen Syndrome" (bilateral adrenal hemorrhage) during a bout of sepsis. This is most classic for which organism?', '["Staphylococcus aureus", "Neisseria meningitidis", "Streptococcus pyogenes", "Haemophilus influenzae"]', 1, 'Meningococcemia can cause rapid DIC and adrenal failure.'),
    (v_topic_id, 'Which virus is the most common cause of sporadic viral meningitis in the summer and fall?', '["HSV-2", "Enteroviruses (e.g. Echo, Coxsackie)", "VZV", "Mumps"]', 1, 'Enteroviruses are the #1 cause of viral (aseptic) meningitis.'),
    (v_topic_id, 'A 70-year-old woman presents with headache and confusion. CSF shows increased pressure, high protein, low glucose, and many neutrophils. Gram stain shows Gram-positive rods with tumbling motility. What should be added to her empiric antibiotic regimen?', '["Vancomycin", "Ceftriaxone", "Ampicillin", "Acyclovir"]', 2, 'Ampicillin is added to cover Listeria in the elderly and neonates.'),
    (v_topic_id, 'A patient presents with a painful, swollen parotid gland. The most common bacterial cause (Sialadenitis) is:', '["Staph aureus", "Streptococcus mutans", "Mumps virus", "Haemophilus"]', 0, 'While Mumps is the viral cause, S. aureus is the most common bacterial cause, especially in dehydrated patients.'),
    (v_topic_id, 'A patient presents with a "strawberry tongue" and a "sandpaper" rash that spares the face. He has a sore throat. Diagnosis?', '["Kawasaki disease", "Scarlet Fever", "Measles", "Toxic Shock Syndrome"]', 1, 'Scarlet fever is caused by erythrogenic toxins from S. pyogenes.'),
    (v_topic_id, 'Which infection is associated with "Councilman bodies" in the liver and is transmitted via the Aedes mosquito?', '["Yellow Fever", "Hepatitis B", "Malaria", "Leishmaniasis"]', 0, 'Yellow Fever is a classic cause of eosinophilic degeneration (Councilman bodies).'),
    (v_topic_id, 'A patient with a central line develops a fungal infection. The organism shows "pseudohyphae and true hyphae" (germ tubes). It is:', '["Cryptococcus", "Candida albicans", "Aspergillus", "Mucor"]', 1, 'Candida albicans is unique for forming germ tubes (true hyphae) at 37°C.'),
    (v_topic_id, 'A patient with AIDS presents with painless, red/purple, raised skin nodules. Biopsy shows spindle cells and vascular proliferation. Diagnosis?', '["Bacillary angiomatosis", "Kaposi Sarcoma", "Hemangioma", "Pyogenic granuloma"]', 1, 'Kaposi Sarcoma (HHV-8) and Bacillary angiomatosis (Bartonella) look similar, but KS has a lymphocytic infiltrate whereas BA has neutrophils.'),
    (v_topic_id, 'Which organism is the most common cause of "Atypical" (walking) pneumonia in young adults?', '["Streptococcus pneumoniae", "Mycoplasma pneumoniae", "Chlamydophila pneumoniae", "Legionella"]', 1, 'Mycoplasma is the #1 atypical cause in young adults; it often shows cold agglutinins (IgM).'),
    (v_topic_id, 'A patient with a history of mitral valve prolapse is undergoing a dental cleaning. According to current guidelines, who should receive antibiotic prophylaxis?', '["Everyone with any valve issue", "Only those with a previous history of endocarditis, prosthetic valves, or certain congenital heart defects", "No one", "Only if the procedure involves the skin"]', 1, 'Guidelines have narrowed: only high-risk groups (prosthetic valves, prior IE, cyanotic CHD) get prophylaxis.'),
    (v_topic_id, 'A child presents with "slapped-cheeks" and a lacy rash. If he has sickle cell disease, he is at risk for:', '["Arthritis", "Aplastic Crisis", "Splenomegaly", "Osteomyelitis"]', 1, 'Parvovirus B19 stops RBC production; in Sickle Cell, this leads to a life-threatening drop in hemoglobin.'),
    (v_topic_id, 'Which parasite causes "Strawberry Cervix" and is a flagellated protozoan seen on wet mount?', '["Candida", "Trichomonas vaginalis", "Gardnerella", "Chlamydia"]', 1, 'Classic presentation for Trichomoniasis.'),
    (v_topic_id, 'A 30-year-old male has "painless" beefy red ulcers on the genitals. Biopsy shows Donovan bodies. Diagnosis?', '["Syphilis", "Granuloma inguinale", "Chancroid", "Lymphogranuloma venereum"]', 1, 'Klebsiella granulomatis is the agent.'),
    (v_topic_id, 'A patient presents with a painful, fluctuant inguinal lymph node (bubo) after a small, painless genital papule. The agent is Chlamydia trachomatis serotypes L1-L3. Diagnosis?', '["Syphilis", "Chancroid", "Lymphogranuloma venereum (LGV)", "Granuloma inguinale"]', 2, 'LGV typically starts with a small ulcer followed by painful lymphadenitis.'),
    (v_topic_id, 'What is the most common cause of spontaneous bacterial peritonitis (SBP) in a patient with cirrhosis and ascites?', '["Staphylococcus aureus", "E. coli", "Streptococcus pneumoniae", "Bacteroides fragilis"]', 1, 'E. coli is the #1 cause of SBP via translocation from the gut.'),
    (v_topic_id, 'A patient with a history of IV drug use presents with tricuspid valve endocarditis. What is the most likely organism?', '["Staph aureus", "Staph epidermidis", "Streptococcus viridans", "Pseudomonas"]', 0, 'S. aureus is the #1 cause of endocarditis in IVDUs, often targeting the right heart valves.'),
    (v_topic_id, 'Which virus causes "hemorrhagic cystitis" (bloody urine) in children and is also a common cause of conjunctivitis?', '["RSV", "Adenovirus (Types 11, 21)", "BK virus", "Coxsackievirus"]', 1, 'Adenovirus is a classic cause of viral hemorrhagic cystitis.'),
    (v_topic_id, 'A patient presents with a "target-like" rash (erythema migrans) after a hike in Connecticut. What is the vector?', '["Dermacentor tick", "Ixodes tick", "Amblyomma tick", "Flea"]', 1, 'Lyme disease is transmitted by the Ixodes tick (deer tick).'),
    (v_topic_id, 'What is the most common cause of "Food Poisoning" that manifests within 2-6 hours of ingestion and is caused by a preformed toxin?', '["Salmonella", "Staphylococcus aureus", "Clostridium perfringens", "E. coli"]', 1, 'S. aureus enterotoxin is heat-stable and acts rapidly.'),
    (v_topic_id, 'Which organism is associated with Guillain-Barre and Reactive Arthritis, often after eating undercooked poultry?', '["Salmonella", "Shigella", "Campylobacter jejuni", "Yersinia"]', 2, 'Campylobacter is the most common trigger for both.'),
    (v_topic_id, 'A patient returning from a tropical area has a high fever, severe headache behind the eyes, and "break-bone" joint pain. Diagnosis?', '["Malaria", "Dengue Fever", "Typhoid", "Leptospirosis"]', 1, 'Dengue is the classic "break-bone" fever.');

    -- SECTION 15: HYPERSENSITIVITY (241-255)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Anaphylaxis after a bee sting is which type of hypersensitivity?', '["Type I", "Type II", "Type III", "Type IV"]', 0, 'Type I = Immediate/IgE mediated.'),
    (v_topic_id, 'A patient with Goodpasture syndrome has antibodies against the glomerular basement membrane. This is which type?', '["Type I", "Type II", "Type III", "Type IV"]', 1, 'Type II = Cytotoxic (antibody binds to cell surface or tissue antigen).'),
    (v_topic_id, 'Systemic Lupus Erythematosus (SLE) involves the deposition of DNA-anti-DNA complexes in the kidneys and joints. This is:', '["Type I", "Type II", "Type III", "Type IV"]', 2, 'Type III = Immune Complex mediated.'),
    (v_topic_id, 'A positive PPD (tuberculin) skin test is an example of which type?', '["Type I", "Type II", "Type III", "Type IV"]', 3, 'Type IV = Delayed-type (T-cell mediated).'),
    (v_topic_id, 'Erythroblastosis fetalis (Rh incompatibility) is which type of hypersensitivity?', '["Type I", "Type II", "Type III", "Type IV"]', 1, 'Type II (Antibodies against RBCs).'),
    (v_topic_id, 'Graves disease is sometimes classified as which variant of Type II hypersensitivity?', '["Type IIa (Cytotoxic)", "Type IIb (Stimulatory)", "Type III", "Type IV"]', 1, 'Antibodies stimulate the TSH receptor rather than destroying the cell.'),
    (v_topic_id, 'Serum Sickness (fever, rash, arthralgia after receiving foreign serum) is which type?', '["Type I", "Type II", "Type III", "Type IV"]', 2, 'Type III (Immune complexes formed with foreign proteins).'),
    (v_topic_id, 'Contact dermatitis (e.g. Poison Ivy) is mediated by:', '["IgE", "IgG", "T-cells (Th1/CD8)", "Mast cells"]', 2, 'Type IV hypersensitivity.'),
    (v_topic_id, 'What is the role of Mast cells in Type I hypersensitivity?', '["They present antigen to T-cells", "They degranulate upon cross-linking of surface IgE by an allergen", "They produce IgG", "They kill virally infected cells"]', 1, 'Degranulation releases histamine, leukotrienes, and prostaglandins.'),
    (v_topic_id, 'Farmer''s Lung (Hypersensitivity Pneumonitis) is a combination of which two types?', '["I and II", "II and III", "III and IV", "I and IV"]', 2, 'It involves both immune complexes (III) and delayed-type responses (IV).'),
    (v_topic_id, 'Acute Hemolytic Transfusion Reaction (immediate destruction of RBCs) is:', '["Type I", "Type II", "Type III", "Type IV"]', 1, 'Type II.'),
    (v_topic_id, 'Myasthenia Gravis involves antibodies that block the Acetylcholine receptor. This is:', '["Type I", "Type II", "Type III", "Type IV"]', 1, 'Type II (Antibody blocking function).'),
    (v_topic_id, 'Arthus Reaction (localized swelling after a booster vaccine) is:', '["Type I", "Type II", "Type III", "Type IV"]', 2, 'Type III (Localized immune complex formation).'),
    (v_topic_id, 'Which type of hypersensitivity does NOT involve antibodies?', '["Type I", "Type II", "Type III", "Type IV"]', 3, 'Type IV is purely cell-mediated (T-cells/Macrophages).'),
    (v_topic_id, 'Extrinsic Asthma is primarily which type?', '["Type I", "Type II", "Type III", "Type IV"]', 0, 'Type I.');

    -- SECTION 16: AUTOIMMUNITY & IMMUNODEFICIENCIES (256-270)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A 6-month-old boy has recurrent bacterial infections and very low levels of all Ig isotypes. He lacks B-cells but has normal T-cells. Diagnosis?', '["DiGeorge Syndrome", "Bruton Agammaglobulinemia (XLA)", "Common Variable Immunodeficiency", "SCID"]', 1, 'XLA is due to a defect in Bruton Tyrosine Kinase (BTK), preventing B-cell maturation.'),
    (v_topic_id, 'A patient has recurrent viral and fungal infections, tetany (hypocalcemia), and congenital heart defects. CXR shows an absent thymic shadow. Diagnosis?', '["SCID", "DiGeorge Syndrome", "Wiskott-Aldrich", "Hyper-IgM"]', 1, 'Failure of the 3rd and 4th pharyngeal pouches to develop.'),
    (v_topic_id, 'Severe Combined Immunodeficiency (SCID) can be caused by a deficiency in which enzyme?', '["Adenosine Deaminase (ADA)", "NADPH Oxidase", "Myeloperoxidase", "Tyrosine Kinase"]', 0, 'ADA deficiency leads to the buildup of toxic metabolites that kill lymphocytes.'),
    (v_topic_id, 'A child has recurrent skin abscesses, eczema, and high levels of IgE. Diagnosis?', '["Job Syndrome (Hyper-IgE)", "Wiskott-Aldrich", "Selective IgA deficiency", "SCID"]', 0, 'Deficiency in Th17 cells (STAT3 mutation) leads to "cold" abscesses and high IgE.'),
    (v_topic_id, 'Wiskott-Aldrich Syndrome triad:', '["Thrombocytopenia, Eczema, Recurrent infections", "Ataxia, Telangiectasia, Infections", "Hypocalcemia, Heart defect, Absent Thymus", "Partial Albinism, Neuropathy, Infections"]', 0, '"WATER": Wiskott-Aldrich, Thrombocytopenia, Eczema, Recurrent infections.'),
    (v_topic_id, 'A patient has recurrent sinopulmonary infections and anaphylaxis during blood transfusions. Diagnosis?', '["Selective IgA deficiency", "C1 inhibitor deficiency", "XLA", "Chediak-Higashi"]', 0, 'Patients with IgA deficiency develop antibodies against IgA; blood products contain IgA, triggering anaphylaxis.'),
    (v_topic_id, 'What is the defect in Chediak-Higashi Syndrome?', '["NADPH oxidase mutation", "Microtubule dysfunction (LYST gene), preventing phagosome-lysosome fusion", "Lack of MHC II", "Lack of CD40L"]', 1, 'Characterized by giant granules in neutrophils and partial albinism.'),
    (v_topic_id, 'Leukocyte Adhesion Deficiency (LAD) presents with:', '["Delayed separation of the umbilical cord and lack of pus at infection sites", "Absent T-cells", "Absent B-cells", "Severe asthma"]', 0, 'LAD is due to a defect in integrins (LFA-1/CD18), so neutrophils cannot exit the blood.'),
    (v_topic_id, 'Common Variable Immunodeficiency (CVID) typically presents:', '["In infancy", "In the 2nd or 3rd decade of life with low Igs but normal B-cell counts", "With absent T-cells", "Only in females"]', 1, 'CVID is a late-onset hypogammaglobulinemia.'),
    (v_topic_id, 'What is the AIRE gene responsible for?', '["Isotype switching", "Expression of self-antigens in the thymus for negative selection", "B-cell activation", "Phagocytosis"]', 1, 'Autoimmune Regulator (AIRE) is critical for central tolerance. Mutation causes APECED syndrome.'),
    (v_topic_id, 'Which HLA type is most strongly associated with Ankylosing Spondylitis?', '["HLA-DR3", "HLA-B27", "HLA-DR4", "HLA-DQ8"]', 1, 'Over 90% of AS patients are B27 positive.'),
    (v_topic_id, 'A patient with IPEX syndrome (Immune dysregulation, Polyendocrinopathy, Enteropathy, X-linked) has a defect in:', '["FOXP3", "STAT3", "WASP", "BTK"]', 0, 'FOXP3 deficiency leads to a lack of regulatory T-cells.'),
    (v_topic_id, 'Which immune deficiency is characterized by "Ataxia" (unsteady gait) and "Telangiectasias" (dilated capillaries on skin/eyes)?', '["Ataxia-Telangiectasia", "SCID", "DiGeorge", "LAD"]', 0, 'Due to a defect in ATM gene (DNA repair).'),
    (v_topic_id, 'What is the most common cause of secondary (acquired) immunodeficiency worldwide?', '["Malnutrition", "HIV/AIDS", "Chemotherapy", "Splenectomy"]', 0, 'While HIV is major, malnutrition is actually the #1 cause of immune suppression globally.'),
    (v_topic_id, 'Chronic Mucocutaneous Candidiasis is due to a defect in:', '["B-cells", "T-cells (specifically Th17/IL-17 signaling)", "Neutrophils", "Complement"]', 1, 'Leads to persistent non-invasive Candida infections of skin and nails.');

    -- SECTION 17: TRANSPLANTATION, VACCINES & ANTIMICROBIALS (271-280)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Hyperacute transplant rejection occurs within minutes and is mediated by:', '["Pre-formed recipient antibodies against donor antigens", "Host T-cells attacking the graft", "Donor T-cells attacking the host", "Chronic fibrosis"]', 0, 'Type II hypersensitivity. Often due to ABO incompatibility.'),
    (v_topic_id, 'Graft-versus-Host Disease (GVHD) occurs most commonly after which type of transplant?', '["Kidney", "Heart", "Bone Marrow (Hematopoietic Stem Cell)", "Liver"]', 2, 'Donor T-cells in the graft attack the recipient''s tissues (skin, liver, gut).'),
    (v_topic_id, 'What type of vaccine is the Salk Polio vaccine?', '["Live-attenuated", "Killed/Inactivated", "Subunit", "Toxoid"]', 1, 'Salk = Killed (Injection). Sabin = Live (Oral).'),
    (v_topic_id, 'Which vaccine type should be avoided in pregnant women and immunocompromised patients?', '["Killed", "Subunit", "Live-attenuated", "Toxoid"]', 2, 'Live vaccines (MMR, Varicella, Yellow Fever) can revert or cause disease in suppressed hosts.'),
    (v_topic_id, 'Which antibiotic class works by inhibiting the 30S ribosomal subunit and is associated with "Ototoxicity and Nephrotoxicity"?', '["Macrolides", "Aminoglycosides", "Tetracyclines", "Fluoroquinolones"]', 1, 'Aminoglycosides (Gentamicin, etc.) are the classic cause.'),
    (v_topic_id, 'What is the mechanism of resistance to Fluoroquinolones?', '["Beta-lactamase", "Mutation in DNA gyrase or Topoisomerase IV", "Efflux pumps only", "Methylation of the ribosome"]', 1, 'Fluoroquinolones target DNA gyrase; mutations in the target enzyme prevent binding.'),
    (v_topic_id, 'A patient on Clindamycin develops pseudomembranous colitis. Which antibiotic is used for treatment?', '["Oral Vancomycin or Fidaxomicin", "IV Vancomycin", "Ciprofloxacin", "Amoxicillin"]', 0, 'Oral Vancomycin stays in the gut to treat C. difficile. IV Vancomycin is for systemic MRSA.'),
    (v_topic_id, 'What is the mechanism of action of Linezolid?', '["Inhibits 30S", "Inhibits 50S (prevents formation of initiation complex)", "Inhibits cell wall", "Inhibits DNA"]', 1, 'Linezolid is used for MRSA and VRE.'),
    (v_topic_id, 'Which drug is used for "MRSA" but is inactivated by pulmonary surfactant, so it cannot be used for pneumonia?', '["Vancomycin", "Daptomycin", "Linezolid", "Ceftaroline"]', 1, 'Daptomycin is excellent for skin/blood MRSA but useless in the lungs.'),
    (v_topic_id, 'What is the mechanism of action of Praziquantel, used to treat trematodes and cestodes?', '["Increases calcium permeability, causing paralysis and detachment of the worm", "Inhibits microtubule synthesis", "Blocks GABA release", "Inhibits succinate dehydrogenase"]', 0, 'Praziquantel is the drug of choice for Schistosoma and most flukes/tapeworms.'),
    (v_topic_id, 'Which drug is the treatment of choice for a patient with severe Plasmodium falciparum malaria?', '["Chloroquine", "Artesunate (IV)", "Mefloquine", "Primaquine"]', 1, 'IV Artesunate is the first-line treatment for severe malaria worldwide.'),
    (v_topic_id, 'What is the mechanism of action of the HIV drug Raltegravir?', '["Inhibits protease", "Inhibits integrase", "Inhibits reverse transcriptase", "Inhibits fusion"]', 1, 'Raltegravir and Dolutegravir are integrase strand transfer inhibitors (INSTIs).'),
    (v_topic_id, 'Which drug class does Maraviroc belong to, and what is its target?', '["Fusion inhibitor, gp41", "Entry inhibitor, CCR5", "NRTI, DNA polymerase", "NNRTI, RNA polymerase"]', 1, 'Maraviroc binds to the CCR5 co-receptor on host cells, preventing viral entry.'),
    (v_topic_id, 'A patient with HIV develops a cough and a CD4 count of 150. Which drug is used for primary prophylaxis against PCP?', '["Azithromycin", "Trimethoprim-Sulfamethoxazole", "Fluconazole", "Acyclovir"]', 1, 'TMP-SMX is the drug of choice for PCP prophylaxis (started at CD4 < 200).'),
    (v_topic_id, 'What is the mechanism of action of the antifungal Caspofungin?', '["Inhibits ergosterol synthesis", "Inhibits cell wall synthesis (beta-1,3-glucan)", "Forms pores in the membrane", "Inhibits DNA synthesis"]', 1, 'Echinocandins like Caspofungin target the fungal cell wall.'),
    (v_topic_id, 'Which organism causes "Chagas Disease" and is transmitted by the Triatomine bug?', '["Trypanosoma brucei", "Trypanosoma cruzi", "Leishmania donovani", "Toxoplasma gondii"]', 1, 'T. cruzi causes Chagas disease (South American Trypanosomiasis).'),
    (v_topic_id, 'A patient presents with a "maculopapular rash" on the palms and soles and generalized lymphadenopathy. Which stage of Syphilis is this?', '["Primary", "Secondary", "Tertiary", "Latent"]', 1, 'Secondary syphilis features a diffuse rash involving palms/soles and systemic symptoms.'),
    (v_topic_id, 'Which virus is associated with the development of "Kaposi Sarcoma" in AIDS patients?', '["HHV-6", "HHV-8", "EBV", "CMV"]', 1, 'HHV-8 (KSHV) causes Kaposi Sarcoma, an endothelial cell tumor.'),
    (v_topic_id, 'What is the drug of choice for treating a patient with a "flesh-eating" necrotizing fasciitis caused by S. pyogenes?', '["Penicillin only", "Penicillin plus Clindamycin", "Vancomycin", "Ceftriaxone"]', 1, 'Clindamycin is added to "turn off" toxin production (Eagle effect) in severe Strep/Staph infections.');

    RAISE NOTICE 'SUCCESS: Systemic Microbiology MCQ Part 4 (211-280) registered.';
END $$;

COMMIT;
