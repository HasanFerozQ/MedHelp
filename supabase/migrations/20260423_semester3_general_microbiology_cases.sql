-- Migration: Semester 3 - General Microbiology Cases (60 Blocks)
-- Date: 2026-04-23

BEGIN;

-- 1. Create/Ensure Topic "General Microbiology" for Semester 3
INSERT INTO topics (semester_id, title, slug, "order")
VALUES (3, 'General Microbiology', 'general-microbiology', 30)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, semester_id = 3;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'general-microbiology' LIMIT 1;

    -- ══════════════════════════════════════════════════════════════════
    -- SET 1 (Cases 1-15) - Foundations & Common Pathogens
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 01: Neisseria meningitidis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Meningitis and Petechial Rash', 'A 22-year-old student presents with fever, headache, stiff neck, and petechial rash. Lumbar puncture shows cloudy CSF with neutrophils and low glucose.', 1)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Gram stain of the CSF reveals Gram-negative kidney bean-shaped diplococci. What is the most likely organism?', '["Streptococcus pneumoniae", "Neisseria meningitidis", "Haemophilus influenzae", "Listeria monocytogenes"]', 1, 'Neisseria meningitidis is a classic cause of epidemic meningitis in young adults.'),
    (v_case_id, 'This organism is known for its ability to ferment which sugars?', '["Glucose only", "Maltose only", "Glucose and Maltose", "Glucose, Maltose, and Lactose"]', 2, 'Meningococci ferment both Glucose and Maltose (Gonococci ferment only Glucose).'),
    (v_case_id, 'What is the primary virulence factor responsible for the massive inflammatory response?', '["Capsule", "IgA protease", "Lipooligosaccharide (LOS) endotoxin", "Pili"]', 2, 'LOS endotoxin causes the severe inflammation and Waterhouse-Friderichsen syndrome.');

    -- CASE 02: Staphylococcus aureus
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'IVDU and New Heart Murmur', 'A 45-year-old male with IVDU history presents with fever and new heart murmur. Blood cultures show Gram-positive cocci in clusters, catalase and coagulase positive.', 2)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely organism?', '["S. epidermidis", "Staphylococcus aureus", "Streptococcus pyogenes", "Enterococcus faecalis"]', 1, 'Coagulase-positive staph in clusters is S. aureus.'),
    (v_case_id, 'Which virulence factor binds to the Fc portion of IgG?', '["Protein A", "Coagulase", "Hyaluronidase", "Hemolysin"]', 0, 'Protein A prevents opsonization by binding IgG backwards.');

    -- CASE 03: Syphilis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Painless Penile Ulcer', 'A 30-year-old male with a painless, indurated ulcer (chancre). Dark-field microscopy shows motile, corkscrew-shaped organisms.', 3)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative agent?', '["Haemophilus ducreyi", "Treponema pallidum", "Chlamydia trachomatis", "Klebsiella granulomatis"]', 1, 'Treponema pallidum causes syphilis; the primary stage is a painless chancre.'),
    (v_case_id, 'Which screening and confirmatory tests are most appropriate?', '["RPR; VDRL", "VDRL; FTA-ABS", "Gram stain; Thayer-Martin", "PCR; ELISA"]', 1, 'VDRL/RPR are used for screening, followed by specific treponemal tests like FTA-ABS.');

    -- CASE 04: Mucormycosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'DKA and Black Nasal Eschar', 'A 50-year-old diabetic in DKA with a black, necrotic nasal eschar. Biopsy shows wide-angled, non-septate hyphae branching at 90 degrees.', 4)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Aspergillosis", "Mucormycosis", "Candidiasis", "Histoplasmosis"]', 1, 'Rhinocerebral mucormycosis is a surgical emergency in DKA patients.'),
    (v_case_id, 'These organisms thrive in DKA due to their ability to utilize which of the following?', '["Excess glucose", "Ketone bodies and free iron", "High pH", "CO2"]', 1, 'Mucor utilizes ketone bodies and liberated free iron for rapid growth.');

    -- CASE 05: Impetigo (S. pyogenes)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Honey-Colored Crusted Lesions', 'A 4-year-old boy presents with honey-colored crusted lesions around his mouth and nose.', 5)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'If caused by S. pyogenes, which lab characteristic is true?', '["Alpha-hemolytic/Optochin-S", "Beta-hemolytic/Bacitracin-S", "Gamma-hemolytic/Bile-esculin+", "Beta-hemolytic/Catalase+"]', 1, 'S. pyogenes is Group A Strep (GAS): Beta-hemolytic and Bacitracin-sensitive.'),
    (v_case_id, 'A major non-suppurative complication following this skin infection is:', '["Acute Rheumatic Fever", "PSGN", "Scarlet Fever", "Toxic Shock Syndrome"]', 1, 'PSGN can follow both skin and throat infections, whereas Rheumatic Fever only follows pharyngitis.');

    -- CASE 06: EHEC
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bloody Diarrhea and HUS', 'A 25-year-old male with bloody diarrhea after an undercooked hamburger. Labs show elevated BUN/Cr and schistocytes.', 6)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which organism is the likely cause?', '["ETEC", "EHEC (O157:H7)", "Shigella sonnei", "Salmonella typhi"]', 1, 'EHEC O157:H7 is the leading cause of HUS.'),
    (v_case_id, 'The Shiga-like toxin works by:', '["Stimulating AC", "Inactivating 60S subunit", "Inhibiting EF-2", "Cleaving SNARE"]', 1, 'The toxin inhibits protein synthesis by removing an adenine from the 28S rRNA of the 60S subunit.');

    -- CASE 07: Pneumocystis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'HIV and Silver Stain Cysts', 'A 35-year-old HIV+ male (CD4 150) with cough and dyspnea. Silver stain shows "cup-shaped" cysts.', 7)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative organism?', '["Cryptococcus", "Pneumocystis jirovecii", "MAC", "CMV"]', 1, 'P. jirovecii is a major cause of opportunistic pneumonia in AIDS.'),
    (v_case_id, 'What is the first-line treatment and prophylaxis?', '["Fluconazole", "TMP-SMX", "Pentamidine", "Amphotericin B"]', 1, 'Trimethoprim-Sulfamethoxazole is the drug of choice.');

    -- CASE 08: Histoplasmosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Ohio Valley and Chicken Coops', 'An 8-year-old girl in rural Ohio with calcified nodules on X-ray. Played near chicken coops.', 8)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which fungal pathogen is responsible?', '["Coccidioides", "Histoplasma capsulatum", "Blastomyces", "Paracoccidioides"]', 1, 'Histoplasma is endemic to the Ohio/Mississippi river valleys.'),
    (v_case_id, 'What is the classic histological finding?', '["Spherules", "Broad-based budding", "Small intracellular yeast in macrophages", "Captain''s wheel"]', 2, 'Histoplasma is "smaller than an RBC" and found inside macrophages.');

    -- CASE 09: Klebsiella
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Alcoholism and Currant Jelly Sputum', 'A 60-year-old hospitalized patient with thick, mucoid, "currant jelly" sputum. Lactose-fermenting and non-motile.', 9)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely organism?', '["Pseudomonas", "Klebsiella pneumoniae", "E. coli", "Legionella"]', 1, 'Klebsiella is a common cause of pneumonia in alcoholics and hospitalized patients.'),
    (v_case_id, 'Which is a classic risk factor?', '["Cystic fibrosis", "Alcoholism", "Air conditioning towers", "Parrots"]', 1, 'Alcoholics are predisposed to Klebsiella aspiration pneumonia.');

    -- CASE 10: Pinworm
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Perianal Itching and Tape Test', 'A 10-year-old boy with nocturnal perianal itching. Tape test shows asymmetric, bean-shaped eggs.', 10)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative agent?', '["Ascaris", "Enterobius vermicularis", "Necator", "Strongyloides"]', 1, 'Enterobius is the pinworm.'),
    (v_case_id, 'What is the treatment of choice?', '["Praziquantel", "Bendazoles or Pyrantel pamoate", "Ivermectin", "Chloroquine"]', 1, 'Treat the entire family to prevent reinfection.');

    -- CASE 11: Gardnerella
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fishy Discharge and Clue Cells', 'A 26-year-old female with fishy smelling discharge. Clue cells seen on wet mount; positive whiff test.', 11)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Trichomoniasis", "Bacterial Vaginosis (BV)", "Candidiasis", "Chlamydia"]', 1, 'Gardnerella vaginalis overgrowth causes BV.'),
    (v_case_id, 'Which of the following is true regarding vaginal pH?', '["pH < 4.5", "pH > 4.5", "pH is exactly 7.0", "pH does not change"]', 1, 'BV and Trichomoniasis raise pH above 4.5; Candidiasis does not.');

    -- CASE 12: RMSF
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tick Bite and Centripetal Rash', 'Fever and aches after camping in NC. Rash began on wrists/ankles and spread to trunk.', 12)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Lyme disease", "Rocky Mountain Spotted Fever (RMSF)", "Secondary syphilis", "Typhus"]', 1, 'The centripetal rash (limbs to trunk) is characteristic of RMSF.'),
    (v_case_id, 'What is the causative agent and vector?', '["Borrelia; Ixodes", "Rickettsia rickettsii; Dermacentor", "R. prowazekii; Louse", "Ehrlichia; Lone Star"]', 1, 'RMSF is caused by Rickettsia rickettsii via tick bite.');

    -- CASE 13: VRE
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Vancomycin Resistance Mechanism', 'A 70-year-old with a severe Enterococcus infection found to be VRE.', 13)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The resistance is due to a change in the peptidoglycan precursor to:', '["D-Ala-D-Gln", "D-Ala-D-Lac", "D-Ala-D-Val", "D-Ser-D-Ala"]', 1, 'Changing D-Ala-D-Ala to D-Ala-D-Lac prevents Vancomycin binding.'),
    (v_case_id, 'Which antibiotic would be an appropriate alternative?', '["Ceftriaxone", "Linezolid", "Penicillin G", "Ciprofloxacin"]', 1, 'Linezolid and Daptomycin are used for VRE.');

    -- CASE 14: S. saprophyticus
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'UTI in Young Female', 'Urine culture shows Gram-positive cocci, catalase-positive, coagulase-negative, and novobiocin-resistant.', 14)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely organism?', '["S. epidermidis", "Staphylococcus saprophyticus", "E. faecalis", "S. agalactiae"]', 1, 'Saprophyticus is "No Staph" (Novobiocin resistant).'),
    (v_case_id, 'This organism is a common cause of UTIs in which population?', '["Elderly males", "Hospitalized", "Sexually active young females", "Neonates"]', 2, 'It is the second most common cause of UTI in young women after E. coli.');

    -- CASE 15: Hepatitis B/A
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Jaundice and Street Food', 'Patient with jaundice and fever. Serology: HBsAg(-), Anti-HBs(+), Anti-HAV IgM(+).', 15)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is true regarding the Hepatitis B status?', '["Chronic", "Acute", "Immune", "Window period"]', 2, 'Presence of Anti-HBs only indicates immunity.'),
    (v_case_id, 'Which virus is causing the current acute illness?', '["Hepatitis A", "Hepatitis B", "Hepatitis C", "Hepatitis E"]', 0, 'Anti-HAV IgM indicates acute Hepatitis A infection.');


    -- ══════════════════════════════════════════════════════════════════
    -- SET 2 (Cases 16-30) - Veterinarians, Ticks, and Viral Complications
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 16: Brucellosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Undulating Fever in Veterinarian', 'A 35-year-old vet with profuse sweating and malaise. Fever "undulates," peaking in the evening. Works with cattle/goats.', 16)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative organism?', '["Coxiella", "Brucella melitensis", "Listeria", "Francisella"]', 1, 'Brucellosis is an occupational hazard for those working with livestock.'),
    (v_case_id, 'Which histological finding is characteristic?', '["Caseating granulomas", "Non-caseating granulomas in RE system", "Safety pin", "Abscesses"]', 1, 'Brucella survives in macrophages and forms granulomas in the spleen/liver/marrow.');

    -- CASE 17: C. difficile
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Foul-Smelling Post-Op Diarrhea', 'A 60-year-old on clindamycin develops profuse watery diarrhea and cramping.', 17)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of Toxin B?', '["ADP-ribosylation", "Disruption of actin cytoskeleton", "60S inhibition", "Pore formation"]', 1, 'C. diff toxins inhibit Rho GTPases, leading to cell death and inflammation.'),
    (v_case_id, 'Which test is most appropriate for rapid diagnosis?', '["Stool culture", "PCR/EIA for toxins", "Gram stain", "Barium swallow"]', 1, 'EIA for toxins or PCR are the standard diagnostics.');

    -- CASE 18: Lyme Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bull''s-eye Rash in Connecticut', 'A 9-year-old with a red, circular "bull''s-eye" rash after summer camp.', 18)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely vector?', '["Dermacentor", "Ixodes tick", "Anopheles", "Fleas"]', 1, 'Ixodes ticks transmit Borrelia burgdorferi.'),
    (v_case_id, 'What is a common cardiac manifestation of stage 2?', '["MVP", "AV block", "VSD", "Effusion"]', 1, 'Lyme carditis often presents as high-grade heart block.');

    -- CASE 19: N. gonorrhoeae
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Intracellular Diplococci in Discharge', 'A 24-year-old female with pelvic pain and discharge. Gram stain shows G- diplococci within neutrophils.', 19)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Significance of "VPN" in Thayer-Martin agar?', '["Vancomycin/Polymyxin/Nystatin", "Vit/Prot/Nuc", "Val/Pro/Nitro", "Peptones"]', 0, 'VPN inhibits Gram-positives, other Gram-negatives, and fungi respectively.'),
    (v_case_id, 'Mechanism for frequent repeat infections?', '["Encapsulation", "Antigenic variation of pili", "Spores", "Resistance"]', 1, 'Pili undergo constant genetic rearrangement to evade the immune system.');

    -- CASE 20: Hantavirus
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Rodent Droppings and Pulmonary Edema', 'A 30-year-old cleaning an attic infested with deer mice. High fever and severe cough.', 20)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely viral agent?', '["Hantavirus", "Lassa", "RSV", "Influenza A"]', 0, 'Hantavirus is transmitted by aerosolized rodent excreta.'),
    (v_case_id, 'Most dangerous complication?', '["Hepatitis", "Pulmonary edema and hemorrhagic fever", "PML", "Encephalitis"]', 1, 'Hantavirus pulmonary syndrome is rapidly fatal.');

    -- CASE 21: Legionella
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pneumonia and Hyponatremia', 'A 45-year-old smoker with high fever, confusion, and hyponatremia. Neutrophils in sputum but no organisms.', 21)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Strep pneu", "Legionnaires'' disease", "Mycoplasma", "Psittacosis"]', 1, 'Pneumonia + GI/CNS symptoms + Hyponatremia = Legionella.'),
    (v_case_id, 'Specialized medium required?', '["Chocolate", "BCYE agar", "LJ medium", "Sabouraud"]', 1, 'Legionella requires cysteine and iron for growth (found in BCYE).');

    -- CASE 22: Parvovirus B19
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Slapped-Cheek Rash', 'A 7-year-old with a rash on her face spreading to the body in a lace-like pattern.', 22)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative virus?', '["Measles", "Rubella", "Parvovirus B19", "HHV-6"]', 2, 'Erythema infectiosum (Fifth Disease) is caused by Parvovirus.'),
    (v_case_id, 'Life-threatening complication in sickle cell?', '["Splenic seq", "Aplastic crisis", "Vaso-occlusive", "Iron def"]', 1, 'Parvovirus infects erythroid precursors, causing a temporary shutdown in RBC production.');

    -- CASE 23: Actinomyces
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sulfur Granules and Swollen Jaw', 'A 22-year-old with "sulfur granules" draining from a sinus tract after a tooth extraction.', 23)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely causative organism?', '["Actinomyces israelii", "Nocardia", "S. aureus", "Prevotella"]', 0, 'Actinomyces israelii is part of oral flora and causes lumpy jaw.'),
    (v_case_id, 'How is this organism classified?', '["Acid-fast aerobe", "Gram-positive anaerobic branching rod", "G- aerobe", "Spore-forming"]', 1, 'It is a Gram-positive anaerobic branching rod.');

    -- CASE 24: E. histolytica
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Anchovy Paste Liver Abscess', 'A 40-year-old female with RUQ pain and "anchovy paste" liver abscess. Recent travel and bloody diarrhea.', 24)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely parasite?', '["Giardia", "Entamoeba histolytica", "Cryptosporidium", "Schistosoma"]', 1, 'E. histolytica causes amebic liver abscess.'),
    (v_case_id, 'Classic finding on stool microscopy?', '["Cysts with 4 nuclei/Ingested RBCs", "Pear-shaped/2 nuclei", "Acid-fast oocysts", "Lateral spine"]', 0, 'Trophozoites containing ingested RBCs are diagnostic.');

    -- CASE 25: Toxoplasmosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Congenital Calcifications and Litter Box', 'Infant born with chorioretinitis, hydrocephalus, and intracranial calcifications. Mother cleaned cat litter.', 25)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative agent?', '["CMV", "Toxoplasma gondii", "Rubella", "Syphilis"]', 1, 'Classic TORCH triad for congenital Toxoplasmosis.'),
    (v_case_id, 'Classic CT finding in HIV reactivation?', '["Edema", "Multiple ring-enhancing lesions", "Frontal abscess", "Periventricular"]', 1, 'Toxoplasmosis is a leading cause of CNS lesions in AIDS.');

    -- CASE 26: EBV
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sore Throat and Downey Cells', 'A 19-year-old with fever, sore throat, lymphadenopathy, and atypical lymphocytes (Downey cells). Monospot positive.', 26)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which virus is the likely cause?', '["CMV", "EBV", "HIV", "HSV-1"]', 1, 'Infectious mononucleosis is primarily caused by EBV.'),
    (v_case_id, 'This virus infects which cell type via which receptor?', '["T-cells/CD4", "B-cells/CD21", "Macrophages/CD14", "Epithelial/ACE2"]', 1, 'EBV uses CD21 to enter B-cells.');

    -- CASE 27: Anthrax
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Black Eschar and Farmer', 'A 50-year-old farmer with a painless black necrotic eschar. G+ rods in chains with a capsule.', 27)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely organism?', '["Clostridium perf", "Bacillus anthracis", "Diphtheria", "Erysipelothrix"]', 1, 'B. anthracis causes cutaneous anthrax.'),
    (v_case_id, 'The capsule is unique because it is composed of:', '["Polysaccharides", "Poly-D-glutamic acid", "Hyaluronic acid", "Mycolic acid"]', 1, 'B. anthracis is the only bacterium with a protein capsule.');

    -- CASE 28: Tuberculosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Night Sweats and Acid-Fast Bacilli', 'A 28-year-old male with cough and night sweats. Sputum is positive for acid-fast bacilli.', 28)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which component of cell wall is responsible for acid-fastness?', '["Peptidoglycan", "Mycolic acids", "Teichoic acid", "Ergosterol"]', 1, 'Long-chain fatty acids (mycolic acids) resist decolorization by acid-alcohol.'),
    (v_case_id, 'Which factor prevents phagosome-lysosome fusion?', '["Cord factor", "Sulfatides", "Endotoxin", "Exotoxin A"]', 1, 'Sulfatides inhibit fusion; Cord factor inhibits neutrophil migration.');

    -- CASE 29: Tinea Versicolor
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Spaghetti and Meatballs Appearance', 'A 30-year-old with a velvety hyperpigmented rash. KOH prep shows "spaghetti and meatballs."', 29)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Tinea corporis", "Tinea versicolor", "Candidiasis", "Seborrheic"]', 1, 'Common fungal skin infection.'),
    (v_case_id, 'What is the causative fungus?', '["Microsporum", "Malassezia furfur", "Trichophyton", "Epidermophyton"]', 1, 'Malassezia degrades lipids, producing acids that damage melanocytes.');

    -- CASE 30: Croup
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Barking Cough and Steeple Sign', 'A 6-year-old with a barking cough and "steeple sign" on X-ray.', 30)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely causative virus?', '["RSV", "Parainfluenza virus", "Adenovirus", "Rhinovirus"]', 1, 'Croup is caused by Parainfluenza.'),
    (v_case_id, 'Which viral family does it belong to?', '["Orthomyxovirus", "Paramyxovirus", "Picornavirus", "Adenovirus"]', 1, 'Paramyxoviruses are common respiratory pathogens in children.');


    -- ══════════════════════════════════════════════════════════════════
    -- SET 3 (Cases 31-45) - Swarming, Rusty Sputum, and Segmented Viruses
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 31: Proteus mirabilis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Swarming Motility and Struvite Stones', 'A 65-year-old with long-term catheterization develops fever. Culture shows "swarming" motility and ammonia scent.', 31)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely organism?', '["E. coli", "Proteus mirabilis", "Pseudomonas", "Serratia"]', 1, 'Proteus is urease-positive and highly motile.'),
    (v_case_id, 'Increases risk of which type of kidney stone?', '["Calcium oxalate", "Uric acid", "Struvite", "Cystine"]', 2, 'Urease splits urea into ammonia, raising pH and favoring struvite (MAP) stones.');

    -- CASE 32: H. influenzae type b
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Thumbprint Sign and Drooling', 'A 2-year-old with high fever, drooling, and "tripod" position. X-ray shows "thumbprint sign."', 32)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely causative agent?', '["S. pyogenes", "Haemophilus influenzae type b", "Diphtheria", "Pertussis"]', 1, 'Hib was the #1 cause of epiglottitis before vaccination.'),
    (v_case_id, 'Laboratory must use chocolate agar supplemented with:', '["Factors X and V", "Cysteine/Iron", "Cholesterol", "High salt"]', 0, 'Hib requires X (hemin) and V (NAD).');

    -- CASE 33: Pertussis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Whooping Cough and Gi Inhibition', 'A 30-year-old with a 3-week "hacking" cough; episodes lead to vomiting.', 33)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Mechanism of the toxin that inhibits Gi?', '["Activation of AC", "ADP-ribosylation of Gi", "Cleaving rRNA", "Inhibiting neurotransmitters"]', 1, 'Pertussis toxin inhibits the inhibitor (Gi), leading to overactive AC.'),
    (v_case_id, 'During which stage is the patient most contagious?', '["Incubation", "Catarrhal stage", "Paroxysmal stage", "Convalescent stage"]', 1, 'Catarrhal stage (mild cold symptoms) is when bacterial load is highest.');

    -- CASE 34: S. pneumoniae
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Lobar Pneumonia and Rusty Sputum', 'A 45-year-old with chills and "rusty" sputum. X-ray shows lobar pneumonia. Gram stain: lancet-shaped G+ diplococci.', 34)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely organism?', '["S. pneumoniae", "S. aureus", "Klebsiella", "Mycoplasma"]', 0, 'S. pneumoniae is the most common cause of community-acquired pneumonia.'),
    (v_case_id, 'Which test distinguishes this from Viridans strep?', '["Bacitracin S", "Optochin S and Bile solubility", "Catalase", "6.5% NaCl"]', 1, 'Pneumococcus is Optochin-sensitive; Viridans is resistant.');

    -- CASE 35: CMV Inclusions
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Owl''s Eye Inclusions', 'A bone marrow transplant patient with interstitial pneumonia. Biopsy shows "Owl''s eye" inclusions.', 35)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative virus?', '["HSV-1", "EBV", "CMV", "VZV"]', 2, 'CMV is a major pathogen in transplant recipients.'),
    (v_case_id, 'Remains latent in which type of cells?', '["B-cells", "T-cells", "Mononuclear cells", "Nerve ganglia"]', 2, 'CMV latencies in monocytes/macrophages.');

    -- CASE 36: Giardiasis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Foul-Smelling Hiker''s Diarrhea', 'A 25-year-old hiker with foul-smelling diarrhea and bloating after drinking from a stream.', 36)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely parasite?', '["Entamoeba", "Giardia lamblia", "Cryptosporidium", "Balantidium"]', 1, 'Giardia is found in wilderness water sources.'),
    (v_case_id, 'Characteristic shape of the trophozoite stage?', '["Round", "Pear-shaped with 2 nuclei", "Crescent", "Slender"]', 1, 'It has a classic "old man with glasses" appearance under the microscope.');

    -- CASE 37: Trichomoniasis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Strawberry Cervix and Frothy Discharge', 'A 35-year-old female with "strawberry cervix" and yellow-green, frothy discharge.', 37)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Candidiasis", "Bacterial Vaginosis", "Trichomoniasis", "Gonorrhea"]', 2, 'Trichomonas vaginalis is a flagellated protozoan.'),
    (v_case_id, 'This organism is unique because it:', '["Does not have a cyst stage", "Obligate intracellular", "Multiple fission", "Tick vector"]', 0, 'It only exists in the trophozoite form; transmission is direct (sexual).');

    -- CASE 38: Viridans Endocarditis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Post-Dental Extraction Endocarditis', 'A 50-year-old with heart valve disease develops fever after dental extraction. Blood culture: alpha-hemolytic cocci, optochin-resistant.', 38)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely organism?', '["S. mutans", "S. pneumoniae", "S. epidermidis", "E. faecalis"]', 0, 'S. mutans is a member of the Viridans group.'),
    (v_case_id, 'What substance allows adherence to valves?', '["Capsule", "Dextrans", "Protein A", "M protein"]', 1, 'Dextrans produced from sucrose allow sticky attachment.');

    -- CASE 39: Influenza Antigenic Shift
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pandemic Flu and Shift', 'A major global pandemic occurs because the Influenza virus undergoes a complete change in proteins.', 39)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This major change is known as:', '["Antigenic drift", "Antigenic shift", "Point mutation", "Recombination"]', 1, 'Shift involves reassortment of segments; drift is small mutations.'),
    (v_case_id, 'Possible in Influenza A because its genome is:', '["Circular DNA", "SS-non-segmented RNA", "Segmented RNA (8)", "DS-DNA"]', 2, 'Segmentation allows mixing of genomic pieces from different strains.');

    -- CASE 40: Scarlet Fever
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Strawberry Tongue and Sandpaper Rash', 'A 10-year-old with high fever, sandpaper rash, and strawberry tongue after a sore throat.', 40)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Measles", "Scarlet Fever", "Kawasaki", "Rubella"]', 1, 'Scarlet fever is caused by erythrogenic toxin from S. pyogenes.'),
    (v_case_id, 'The toxin responsible is:', '["Streptolysin O", "Erythrogenic exotoxin", "Exotoxin A", "PVL"]', 1, 'Pyrogenic exotoxin triggers the diffuse skin rash.');

    -- CASE 41: Granuloma Inguinale
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Donovan Bodies and Beefy Red Ulcer', 'A 40-year-old male with a painless beefy red ulcer that bleeds easily. Histology: "Donovan bodies."', 41)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative agent?', '["Haemophilus ducreyi", "Klebsiella granulomatis", "Syphilis", "Chlamydia"]', 1, 'Donovanosis is caused by K. granulomatis.'),
    (v_case_id, 'How is this clinically differentiated from Syphilis?', '["Syphilis is painful", "Syphilis is not beefy red/no Donovan bodies", "GI resolves in 2 days", "Syphilis is G-"]', 1, 'Syphilis chancre is clean/indurated; GI is beefy/bleeding.');

    -- CASE 42: Group B Strep
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Neonatal Meningitis (CAMP+)', 'Neonatal meningitis caused by beta-hemolytic, catalase-, and CAMP test+ G+ cocci.', 42)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely organism?', '["S. pyogenes", "S. agalactiae (Group B)", "Listeria", "E. coli"]', 1, 'GBS is a leading cause of neonatal sepsis and meningitis.'),
    (v_case_id, 'Prophylactic antibiotic given during labor?', '["Vancomycin", "Penicillin G", "Gentamicin", "Ciprofloxacin"]', 1, 'Intrapartum penicillin prevents transmission from colonized mothers.');

    -- CASE 43: Legionnaires'' Disease Transmission
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cooling Towers and BCYE Growth', 'Rapid-onset pneumonia; growth on BCYE. Patient has diarrhea and confusion.', 43)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the organism?', '["Legionella", "Mycoplasma", "Chlamydophila", "Coxiella"]', 0, 'Legionella pneumophila causes both pneumonia and systemic symptoms.'),
    (v_case_id, 'Primarily transmitted through:', '["Respiratory droplets", "Aerosolized water", "Poultry", "Ticks"]', 1, 'It spreads via mist from cooling towers, whirlpools, etc.');

    -- CASE 44: Typhoid Fever
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Rose Spots and Step-ladder Fever', 'Step-ladder fever, abdominal pain, and "rose spots" after a trip to South Asia.', 44)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Salmonellosis", "Typhoid Fever", "Cholera", "Shigellosis"]', 1, 'Salmonella typhi causes systemic enteric fever.'),
    (v_case_id, 'Remains in a carrier state in which organ?', '["Liver", "Gallbladder", "Spleen", "Appendix"]', 1, 'Chronic colonization of the gallbladder leads to long-term shedding.');

    -- CASE 45: Yersinia pestis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Plague Buboes and Dead Prairie Dogs', 'Painful necrotic "bubo" in groin and fever. Returned from Southwest US; dead prairie dogs seen.', 45)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative agent of the "Plague"?', '["Francisella", "Yersinia pestis", "Pasteurella", "Bartonella"]', 1, 'Y. pestis is transmitted by fleas from rodents/prairie dogs.'),
    (v_case_id, 'Classic microscopic appearance?', '["Safety-pin", "Chain of pearls", "G+ branching", "Tennis racket"]', 0, 'Bipolar "safety-pin" staining is characteristic.');


    -- ══════════════════════════════════════════════════════════════════
    -- SET 4 (Cases 46-60) - Viruses, Toxins, and Malignancies
    -- ══════════════════════════════════════════════════════════════════

    -- CASE 46: Dengue
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Breakbone Fever in Caribbean', 'Sudden high fever, retro-orbital pain, and "breakbone" joint aches. Recent Caribbean trip.', 46)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Malaria", "Dengue Fever", "Yellow Fever", "Chikungunya"]', 1, 'Retro-orbital pain and severe aches are hallmarks of Dengue.'),
    (v_case_id, 'Transmitted by which vector?', '["Anopheles", "Aedes aegypti", "Culex", "Ixodes"]', 1, 'Aedes mosquitoes transmit Dengue and Yellow fever.'),
    (v_case_id, 'Increased risk of what if reinfected with a different serotype?', '["Immunity", "Dengue Hemorrhagic Fever", "Carrier", "Paralysis"]', 1, 'Heterotypic antibodies can enhance viral entry (ADE).');

    -- CASE 47: Klebsiella Virulence
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Mucoid Colonies and Alcoholism', 'Alcoholic with "currant jelly" sputum and lobar pneumonia.', 47)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Characteristic feature on MacConkey agar?', '["Clear", "Small/dry", "Large mucoid pink", "Green sheen"]', 2, 'Klebsiella is a fast lactose fermenter with a massive capsule.'),
    (v_case_id, 'Primary virulence factor?', '["Flagella", "Exotoxin A", "Polysaccharide capsule", "IgA protease"]', 2, 'The capsule protects against phagocytosis.');

    -- CASE 48: Tetanus
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Risus Sardonicus and Neonatal Lockjaw', '10-day-old infant with muscle rigidity, "sardonic smile," and infected umbilical stump.', 48)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Mechanism of the toxin?', '["ACh inhibition", "SNARE proteolysis/GABA inhibition", "AC activation", "EF-2 inactivation"]', 1, 'Tetanospasmin prevents release of inhibitory glycine/GABA.'),
    (v_case_id, 'Released from which spinal cord cells?', '["Betz cells", "Renshaw cells", "Purkinje cells", "Pyramidal cells"]', 1, 'Renshaw interneurons provide inhibitory feedback in the spinal cord.');

    -- CASE 49: K. granulomatis vs LGV
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Beefy Red Ulcer vs LGV', 'Painless, beefy red genital ulcer with "rolled" borders. Donovan bodies seen.', 49)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative organism?', '["H. ducreyi", "K. granulomatis", "Chlamydia L1-L3", "Syphilis"]', 1, 'Granuloma inguinale (Donovanosis).'),
    (v_case_id, 'How does this differ from LGV?', '["LGV has painful buboes", "LGV is viral", "LGV is school-of-fish", "No difference"]', 0, 'LGV causes painful lymphadenopathy; GI is typically just the ulcer.');

    -- CASE 50: Scrub Typhus
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Southeast Asia Eschar and Mite Bite', 'Fever, headache, and dark eschar after a mite bite in SE Asia.', 50)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Epidemic typhus", "Scrub typhus", "Q fever", "Ehrlichiosis"]', 1, 'Scrub typhus is endemic to Asia-Pacific.'),
    (v_case_id, 'What is the causative agent?', '["R. prowazekii", "Orientia tsutsugamushi", "Coxiella", "R. typhi"]', 1, 'Orientia tsutsugamushi is the agent.');

    -- CASE 51: Botulism
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Floppy Paralysis and Canned Veggies', '60-year-old with descending paralysis after home-canned vegetables.', 51)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Mechanism of the toxin?', '["Stimulates cAMP", "SNARE proteolysis/ACh inhibition", "Blocks glycine", "60S inhibition"]', 1, 'Botulinum toxin prevents excitatory ACh release.'),
    (v_case_id, 'Source of infant botulism?', '["Pre-formed toxin", "Ingestion of spores (honey)", "Wound", "Genetic"]', 1, 'Infants lack robust gut flora, allowing spores to germinate and produce toxin in situ.');

    -- CASE 52: Toxic Shock Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sunburn Rash and Tampon Use', '19-year-old with high fever, hypotension, and sunburn-like rash.', 52)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Mechanism of the Superantigen?', '["Binds Vbeta TCR and MHC II", "Protein inhibition", "Protease", "Coagulation activation"]', 0, 'Superantigens cross-link TCR and MHC II non-specifically.'),
    (v_case_id, 'Leads to massive release of which cytokines?', '["IL-1/6/TNF-alpha", "IL-4/5", "IL-10/TGF-beta", "IL-12/IFN-gamma"]', 0, 'Cytokine storm causes shock and multi-organ failure.');

    -- CASE 53: CMV Retinitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pizza Pie Retinopathy in HIV', 'AIDS patient (CD4 40) with blurred vision. "Pizza pie" retinopathy seen.', 53)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative virus?', '["HSV-1", "VZV", "CMV", "EBV"]', 2, 'CMV retinitis is common at CD4 counts below 50.'),
    (v_case_id, 'First-line treatment?', '["Acyclovir", "Ganciclovir", "Oseltamivir", "Ribavirin"]', 1, 'Ganciclovir (or Valganciclovir) is the treatment of choice.');

    -- CASE 54: Parainfluenza
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Croup and Barking Cough', '7-year-old with fever, barking cough, and inspiratory stridor.', 54)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Epiglottitis", "Croup", "Pertussis", "Bronchiolitis"]', 1, 'Laryngotracheobronchitis is the medical name for Croup.'),
    (v_case_id, 'Belongs to which viral family?', '["Orthomyxovirus", "Paramyxovirus", "Picornavirus", "Reovirus"]', 1, 'Paramyxoviruses are common in pediatric respiratory infections.');

    -- CASE 55: Psittacosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tropical Parrots and Pneumonia', '40-year-old with high fever and cough. Owns several tropical parrots.', 55)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Legionnaires''", "Psittacosis", "Q fever", "Anthrax"]', 1, 'Chlamydia psittaci infection from birds.'),
    (v_case_id, 'True regarding life cycle?', '["Free-living", "Elementary/Reticulate body", "Spores", "No cell wall"]', 1, 'Chlamydia are obligate intracellular parasites with biphasic life cycles.');

    -- CASE 56: Salmonella
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bloody Diarrhea and Pet Turtle', 'Patient with bloody diarrhea after playing with a pet turtle.', 56)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely organism?', '["Shigella", "Non-typhoidal Salmonella", "Campylobacter", "Yersinia"]', 1, 'Reptiles are common carriers of Salmonella.'),
    (v_case_id, 'Which characteristic is true for Salmonella?', '["Lactose fermenter", "Non-motile", "Produces H2S", "G+"]', 2, 'Salmonella produces H2S (black on HE agar); Shigella does not.');

    -- CASE 57: Sulfur Granules
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cervicofacial Sinus Tract', 'Patient with "sulfur granule" draining sinus in the cervicofacial region.', 57)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely organism?', '["Actinomyces israelii", "Nocardia", "S. aureus", "Bacteroides"]', 0, 'Classic presentation of Actinomycosis.'),
    (v_case_id, 'How to distinguish from Nocardia?', '["Nocardia is anaerobic", "Nocardia is weakly acid-fast/aerobic", "Actinomyces is G-", "Actinomyces forms spores"]', 1, 'Nocardia is "SNAP" (Sulfa/Nocardia/Actino/Penicillin for treatment).');

    -- CASE 58: Babesiosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Maltese Cross Appearance', 'Northeast US hiker with high fever/chills. Blood smear: "Maltese cross" in RBCs.', 58)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Malaria", "Babesiosis", "Leishmaniasis", "Trypanosomiasis"]', 1, 'Babesia microti is endemic to the Northeast.'),
    (v_case_id, 'What is the vector?', '["Anopheles", "Ixodes tick", "Tsetse fly", "Sandfly"]', 1, 'Babesia, Borrelia (Lyme), and Anaplasma share the Ixodes vector.');

    -- CASE 59: Fifth Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bright Red Slapped Cheek', 'Child with a bright red "slapped cheek" rash.', 59)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative agent?', '["Measles", "Parvovirus B19", "Rubella", "Roseola"]', 1, 'Erythema infectiosum.'),
    (v_case_id, 'What is the structure of this virus?', '["ssRNA enveloped", "dsDNA naked", "ssDNA naked", "dsRNA segmented"]', 2, 'Parvovirus is the only medically important single-stranded DNA virus.');

    -- CASE 60: S. haematobium
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bladder Cancer and Hematuria', 'Middle East traveler with hematuria. Bladder biopsy: squamous cell carcinoma.', 60)
    RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which parasite is associated with this malignancy?', '["S. mansoni", "Schistosoma haematobium", "Clonorchis", "Paragonimus"]', 1, 'Chronic inflammation from eggs leads to SCC.'),
    (v_case_id, 'Characteristic feature of the egg?', '["Lateral spine", "Terminal spine", "Operculum", "Striated shell"]', 1, 'S. haematobium has a terminal spine; S. mansoni has a lateral spine.');

    RAISE NOTICE 'SUCCESS: General Microbiology (60 Cases) registered for Semester 3.';
END $$;

COMMIT;
