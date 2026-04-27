-- Migration: Systemic Microbiology Cases Part 3 (21-30)
-- Goal: Cover Mycobacteria, Spirochetes, and DNA Viruses
-- Sources: Clinical Microbiology Made Ridiculously Simple, Levinson, Parham

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'systemic-microbiology' LIMIT 1;

    -- DELETE existing cases for this range to prevent duplicates on re-run
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 21 AND 30);
    DELETE FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 21 AND 30;

    -- CASE 21: Mycobacterium tuberculosis (Active TB)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Night Sweats and Hemoptysis', 'A 45-year-old man presents with a chronic cough, weight loss, night sweats, and occasional bloody sputum (hemoptysis). Chest X-ray shows an infiltrate in the right upper lobe.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic staining property of this organism?', '["Gram-positive", "Gram-negative", "Acid-fast", "Silver stain positive"]', 2, 'Mycobacteria have high mycolic acid content in their cell walls, which holds carbolfuchsin stain even after acid-alcohol washing (Acid-Fast).'),
    (v_case_id, 'Which component of the M. tuberculosis cell wall is responsible for its ability to form granulomas (serpentine growth)?', '["Mycolic acid", "Cord factor", "Sulfatides", "Wax D"]', 1, 'Cord factor (trehalose dimycolate) inhibits macrophage maturation and induces granuloma formation.'),
    (v_case_id, 'What type of hypersensitivity reaction is the PPD (tuberculin) skin test?', '["Type I (Immediate)", "Type II (Cytotoxic)", "Type III (Immune Complex)", "Type IV (Delayed-type)"]', 3, 'The PPD test is a classic Type IV hypersensitivity reaction mediated by T-cells and macrophages.');

    -- CASE 22: Mycobacterium leprae (Leprosy)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Loss of Sensation', 'A patient from a tropical region presents with multiple hypopigmented skin patches on his back that lack sensation. He also has thickened peripheral nerves.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Tuberculoid Leprosy", "Lepromatous Leprosy", "Sarcoidosis", "Vitiligo"]', 0, 'Tuberculoid leprosy is characterized by few hypopigmented, anesthetic patches and a strong Th1 (cell-mediated) immune response.'),
    (v_case_id, 'What is the natural reservoir for M. leprae in the United States?', '["Bats", "Armadillos", "Raccoons", "Deer"]', 1, 'Armadillos are the only known natural reservoir for M. leprae other than humans.'),
    (v_case_id, 'Why does M. leprae primarily affect the skin and peripheral nerves?', '["It is an obligate aerobe", "It prefers cooler temperatures (32-34°C)", "It is transmitted by insects", "It lacks a cell wall"]', 1, 'M. leprae grows best at cooler temperatures found in the extremities (skin, nose, ears, and superficial nerves).');

    -- CASE 23: Treponema pallidum (Syphilis)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Painless Ulcer', 'A 28-year-old man presents with a firm, painless, non-tender ulcer (chancre) on his penis. He also has painless bilateral inguinal lymphadenopathy.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What stage of syphilis is this patient in?', '["Primary", "Secondary", "Latent", "Tertiary"]', 0, 'The painless chancre is the hallmark of primary syphilis.'),
    (v_case_id, 'What is the most appropriate imaging technique to visualize this organism from the ulcer fluid?', '["Light microscopy with Gram stain", "Dark-field microscopy", "Acid-fast stain", "Fluorescence microscopy"]', 1, 'Treponema pallidum is too thin to be seen with standard light microscopy and must be visualized using dark-field microscopy or direct fluorescent antibody (DFA) testing.'),
    (v_case_id, 'If left untreated, what is the classic presentation of SECONDARY syphilis?', '["Tabes dorsalis", "Gummas", "Maculopapular rash on palms and soles and Condyloma lata", "Painless chancre"]', 2, 'Secondary syphilis presents weeks to months later with a diffuse rash (including palms and soles), fever, and flat, wart-like lesions called condyloma lata.');

    -- CASE 24: Borrelia burgdorferi (Lyme Disease)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Bullseye Rash', 'A man presents with a large "bullseye" rash (erythema chronicum migrans) on his thigh after hiking in Connecticut. He also complains of fever, joint pain, and headache.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the vector for this infection?', '["Anopheles mosquito", "Ixodes tick", "Dermacentor tick", "Xenopsylla flea"]', 1, 'Lyme disease is transmitted by the Ixodes scapularis (deer tick).'),
    (v_case_id, 'What is a common neurological complication of early disseminated Lyme disease?', '["Bilateral Bell''s Palsy (facial nerve palsy)", "Meningitis", "Guillain-Barré", "Encephalitis"]', 0, 'Facial nerve palsy (often bilateral) is a classic feature of Stage 2 (early disseminated) Lyme disease.'),
    (v_case_id, 'What is the drug of choice for early Lyme disease?', '["Penicillin", "Ciprofloxacin", "Doxycycline", "Metronidazole"]', 2, 'Doxycycline is the first-line treatment for early Lyme disease (except in children <8 and pregnant women, where Amoxicillin is used).');

    -- CASE 25: Chlamydia trachomatis (LGV/STD)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Buboes', 'A 25-year-old man presents with painful, swollen inguinal lymph nodes (buboes) that are beginning to ulcerate. He recently traveled to a tropical region and remembers a small, painless ulcer on his genitals that healed quickly.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Syphilis", "Chancroid", "Lymphogranuloma venereum (LGV)", "Granuloma inguinale"]', 2, 'LGV is caused by Chlamydia trachomatis serotypes L1, L2, and L3 and presents with painful inguinal lymphadenopathy following a transient painless ulcer.'),
    (v_case_id, 'What is the infective form of Chlamydia?', '["Elementary body", "Reticulate body", "Vegetative cell", "Endospore"]', 0, 'The Elementary body (EB) is the small, hardy, infectious form that enters the cell. The Reticulate body (RB) is the larger, metabolically active form that replicates intracellularly.'),
    (v_case_id, 'Which test is now the gold standard for diagnosing Chlamydia?', '["Giemsa stain", "Culture on Thayer-Martin", "Nucleic Acid Amplification Test (NAAT)", "RPR test"]', 2, 'NAAT (e.g., PCR) is the most sensitive and specific test for diagnosing C. trachomatis.');

    -- CASE 26: Rickettsia rickettsii (RMSF)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Inward Rash', 'A 10-year-old boy in North Carolina presents with high fever, headache, and a petechial rash that started on his wrists and ankles and is now spreading toward his trunk.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Rocky Mountain Spotted Fever (RMSF)", "Typhus", "Measles", "Meningococcemia"]', 0, 'RMSF is characterized by a centripetal rash (spreading from extremities to trunk) and is transmitted by the Dermacentor tick.'),
    (v_case_id, 'What is the classic "triad" of RMSF?', '["Fever, cough, rash", "Fever, headache, vasculitic rash", "Fever, jaundice, anemia", "Fever, diarrhea, confusion"]', 1, 'The classic triad is fever, headache, and rash (though the rash may appear late).'),
    (v_case_id, 'Which drug should be used immediately, even in children, for suspected RMSF?', '["Amoxicillin", "Doxycycline", "Chloramphenicol", "Gentamicin"]', 1, 'Doxycycline is the treatment of choice for RMSF regardless of age, as the risk of the disease outweighs the risk of tooth staining from a short course.');

    -- CASE 27: Herpes Simplex Virus (HSV-1)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Temporal Lobe Encephalitis', 'A 35-year-old man presents with sudden confusion, seizures, and a CT scan showing hemorrhagic necrosis of the temporal lobes.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely causative agent?', '["HSV-1", "HSV-2", "VZV", "CMV"]', 0, 'HSV-1 is the most common cause of sporadic viral encephalitis, characteristically involving the temporal lobes.'),
    (v_case_id, 'Where does HSV-1 remain latent?', '["Trigeminal ganglia", "Sacral ganglia", "Dorsal root ganglia", "B cells"]', 0, 'HSV-1 remains latent in the trigeminal (cranial nerve V) ganglia.'),
    (v_case_id, 'What is the drug of choice for this condition?', '["Ganciclovir", "Acyclovir", "Oseltamivir", "Ribavirin"]', 1, 'Intravenous acyclovir is the standard treatment for HSV encephalitis.');

    -- CASE 28: Epstein-Barr Virus (EBV)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Mononucleosis', 'A 19-year-old college student presents with severe sore throat, high fever, and massive lymphadenopathy. A physical exam reveals an enlarged spleen.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of cells are the "atypical lymphocytes" seen on the peripheral smear?', '["Infected B cells", "Reactive CD8+ T cells", "Natural Killer cells", "Monocytes"]', 1, 'EBV infects B cells (via CD21), but the "atypical lymphocytes" seen on smear are reactive cytotoxic T cells (CD8+) responding to the infection.'),
    (v_case_id, 'What is the significance of the Monospot test?', '["Detects EBV DNA", "Detects heterophile antibodies produced by infected B cells", "Detects viral capsid antigen", "Detects T-cell count"]', 1, 'The Monospot test detects heterophile antibodies (IgM antibodies that cross-react with horse/sheep RBCs), which are a hallmark of EBV infection.'),
    (v_case_id, 'Which cancer is classically associated with EBV, particularly in African children?', '["Burkitt lymphoma", "Hodgkin lymphoma", "Nasopharyngeal carcinoma", "All of the above"]', 3, 'EBV is associated with Burkitt lymphoma (8:14 translocation), Hodgkin lymphoma, and nasopharyngeal carcinoma.');

    -- CASE 29: Varicella-Zoster Virus (VZV)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Shingles', 'A 70-year-old man presents with a painful, blistering rash that follows a single dermatome on his chest. It does not cross the midline.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["HSV-1", "Herpes Zoster (Shingles)", "Impetigo", "Contact dermatitis"]', 1, 'Herpes Zoster (Shingles) is the reactivation of VZV in a sensory ganglion.'),
    (v_case_id, 'What was the primary infection with this virus called?', '["Roseola", "Measles", "Varicella (Chickenpox)", "Rubella"]', 2, 'Primary VZV infection causes chickenpox, characterized by a "dewdrop on a rose petal" rash in various stages of healing.'),
    (v_case_id, 'What is the most common chronic complication of Shingles?', '["Blindness", "Post-herpetic neuralgia", "Secondary bacterial infection", "Meningitis"]', 1, 'Post-herpetic neuralgia is a chronic, debilitating pain that persists for months or years after the rash has healed.');

    -- CASE 30: Human Papillomavirus (HPV)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Abnormal Pap Smear', 'A 30-year-old woman has an abnormal Pap smear showing koilocytic changes. Further testing identifies HPV type 16.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which HPV types are most strongly associated with cervical cancer?', '["6 and 11", "16 and 18", "1 and 2", "31 and 33"]', 1, 'HPV 16 and 18 are responsible for about 70% of cervical cancers. HPV 6 and 11 cause genital warts (condyloma acuminata).'),
    (v_case_id, 'What do the HPV oncoproteins E6 and E7 target in human cells?', '["p53 and Rb", "c-myc and ras", "NF-kB", "Cyclin D"]', 0, 'E6 causes the degradation of p53 (tumor suppressor), and E7 inhibits Rb (tumor suppressor), together promoting uncontrolled cell cycle progression.'),
    (v_case_id, 'What is a "koilocyte"?', '["A cell with a small, dense nucleus", "A squamous epithelial cell with a perinuclear halo and wrinkled nucleus", "A multinucleated giant cell", "A cell with an inclusion body"]', 1, 'Koilocytes are pathognomonic for HPV infection.');

    RAISE NOTICE 'SUCCESS: Systemic Microbiology Cases Part 3 (21-30) registered.';
END $$;

COMMIT;
