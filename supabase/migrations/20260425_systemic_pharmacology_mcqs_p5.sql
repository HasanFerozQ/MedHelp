-- Migration: Year 2 - Systemic Pharmacology MCQ Bank (PART 5: 281-304)
-- Date: 2026-04-25
-- Based on: Lippincott, Katzung, and Rang & Dale

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'systemic-pharmacology' LIMIT 1;

    -- 2. Prevent Duplicates by removing existing questions for this part
    DELETE FROM mcqs 
    WHERE topic_id = v_topic_id 
    AND question IN (
        'The mechanism of Penicillins and Cephalosporins is:',
        'Vancomycin acts on the cell wall by:',
        'Which antibiotic is known for causing "Red Man Syndrome" due to rapid histamine release?',
        'Aminoglycosides (e.g., Gentamicin) inhibit which part of the bacterial ribosome?',
        'What are the two major toxicities of Aminoglycosides?',
        'Tetracyclines (e.g., Doxycycline) are contraindicated in children and pregnant women because they:',
        'Which antibiotic inhibits the 50S subunit and is associated with the rare but fatal "Aplastic Anemia"?',
        'The mechanism of Macrolides (e.g., Azithromycin, Erythromycin) is:',
        'Which antibiotic is associated with "Pseudomembranous Colitis" (C. diff overgrowth) as a classic side effect?',
        'Fluoroquinolones (e.g., Ciprofloxacin) inhibit which enzyme in bacteria?',
        'A major side effect of Fluoroquinolones in all ages, but especially the elderly, is:',
        'Sulfonamides and Trimethoprim are often combined (Bactrim) because they:',
        'Which antibiotic is the drug of choice for Anaerobic infections below the diaphragm and for Protozoa like Giardia?',
        'What is the "Disulfiram-like reaction" associated with Metronidazole?',
        'Rifampin is used for TB. What is its common, harmless side effect?',
        'Isoniazid (INH) toxicity (peripheral neuropathy) can be prevented by co-administering:',
        'Which antibiotic is a "last resort" for VRE and MRSA and can cause Serotonin Syndrome?',
        'What is the mechanism of Linezolid?',
        'Daptomycin is used for skin infections. Why can it NOT be used for pneumonia?',
        'The mechanism of Acyclovir is:',
        'Oseltamivir (Tamiflu) is used for Influenza. Its mechanism is:',
        'What is the mechanism of action of Amphotericin B?',
        'Azole antifungals (e.g., Fluconazole) act by:',
        'Which drug is used for chronic Hepatitis B and C and acts by inducing an antiviral state in host cells?',
        'What is the primary side effect of Interferon-alpha?',
        'Which antifungal inhibits the synthesis of B-glucan in the fungal cell wall?',
        'Terbinafine is used for onychomycosis (nail fungus). Its mechanism is:'
    );

    -- SECTION 14: CHEMOTHERAPY (281-304)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'The mechanism of Penicillins and Cephalosporins is:', '["Inhibition of 30S ribosome", "Inhibition of transpeptidase (cell wall cross-linking)", "Inhibition of DNA gyrase", "Disruption of the cell membrane"]', 1, 'Beta-lactams bind to Penicillin-Binding Proteins (PBPs) and prevent peptidoglycan cross-linking.'),
    (v_topic_id, 'Vancomycin acts on the cell wall by:', '["Inhibiting transpeptidase", "Binding to the D-Ala-D-Ala terminus of peptidoglycan precursors", "Inhibiting beta-lactamase", "Blocking the transport of NAG/NAM across the membrane"]', 1, 'Vancomycin inhibits transglycosylation and transpeptidation by binding to the precursor itself.'),
    (v_topic_id, 'Which antibiotic is known for causing "Red Man Syndrome" due to rapid histamine release?', '["Penicillin G", "Vancomycin", "Ciprofloxacin", "Gentamicin"]', 1, 'Red Man Syndrome is a non-allergic infusion reaction to Vancomycin.'),
    (v_topic_id, 'Aminoglycosides (e.g., Gentamicin) inhibit which part of the bacterial ribosome?', '["30S subunit", "50S subunit", "RNA polymerase", "tRNA synthetase"]', 0, 'Aminoglycosides (30S) cause mRNA misreading and inhibit the initiation complex.'),
    (v_topic_id, 'What are the two major toxicities of Aminoglycosides?', '["Liver and Heart", "Kidney and Ear (Nephrotoxicity and Ototoxicity)", "Bone marrow and Skin", "Lung and Eye"]', 1, 'Monitoring of plasma levels is essential.'),
    (v_topic_id, 'Tetracyclines (e.g., Doxycycline) are contraindicated in children and pregnant women because they:', '["Cause permanent tooth discoloration and bone growth inhibition", "Cause liver failure", "Are not effective", "Cause grey baby syndrome"]', 0, 'Tetracyclines chelate calcium in growing teeth and bones.'),
    (v_topic_id, 'Which antibiotic inhibits the 50S subunit and is associated with the rare but fatal "Aplastic Anemia"?', '["Clindamycin", "Chloramphenicol", "Linezolid", "Azithromycin"]', 1, 'Chloramphenicol is also known for "Grey Baby Syndrome" in neonates.'),
    (v_topic_id, 'The mechanism of Macrolides (e.g., Azithromycin, Erythromycin) is:', '["Inhibition of 30S", "Inhibition of 50S (translocation step)", "Inhibition of DNA gyrase", "Blocking folic acid synthesis"]', 1, 'Macrolides prevent the translocation of the tRNA from the A site to the P site.'),
    (v_topic_id, 'Which antibiotic is associated with "Pseudomembranous Colitis" (C. diff overgrowth) as a classic side effect?', '["Penicillin", "Clindamycin", "Tetracycline", "Metronidazole"]', 1, 'Clindamycin is the classic answer, though any broad-spectrum antibiotic can cause it.'),
    (v_topic_id, 'Fluoroquinolones (e.g., Ciprofloxacin) inhibit which enzyme in bacteria?', '["DNA Polymerase", "DNA Gyrase (Topoisomerase II) and IV", "RNA Polymerase", "Helicase"]', 1, 'They prevent DNA supercoiling and separation.'),
    (v_topic_id, 'A major side effect of Fluoroquinolones in all ages, but especially the elderly, is:', '["Nephrotoxicity", "Tendon rupture and cartilage damage", "Ototoxicity", "Cardiotoxicity"]', 1, 'Fluoroquinolones should be avoided in children and athletes due to tendon risk.'),
    (v_topic_id, 'Sulfonamides and Trimethoprim are often combined (Bactrim) because they:', '["Are both bactericidal", "Have synergistic inhibition of folic acid synthesis", "Reduce each other''s side effects", "Expand the spectrum to anaerobes"]', 1, 'Sulfonamides block dihydropteroate synthase; TMP blocks dihydrofolate reductase.'),
    (v_topic_id, 'Which antibiotic is the drug of choice for Anaerobic infections below the diaphragm and for Protozoa like Giardia?', '["Clindamycin", "Metronidazole", "Ceftriaxone", "Doxycycline"]', 1, 'Metronidazole works by forming toxic free radicals in anaerobic environments.'),
    (v_topic_id, 'What is the "Disulfiram-like reaction" associated with Metronidazole?', '["Severe vomiting when taken with alcohol", "Hallucinations", "Kidney failure", "Seizures"]', 0, 'Metronidazole inhibits acetaldehyde dehydrogenase.'),
    (v_topic_id, 'Rifampin is used for TB. What is its common, harmless side effect?', '["Tinnitus", "Orange discoloration of body fluids", "Peripheral neuropathy", "Visual loss"]', 1, 'Tears, sweat, and urine may turn orange/red.'),
    (v_topic_id, 'Isoniazid (INH) toxicity (peripheral neuropathy) can be prevented by co-administering:', '["Vitamin B12", "Vitamin B6 (Pyridoxine)", "Vitamin C", "Folic Acid"]', 1, 'INH causes a relative deficiency of B6.'),
    (v_topic_id, 'Which antibiotic is a "last resort" for VRE and MRSA and can cause Serotonin Syndrome?', '["Linezolid", "Vancomycin", "Quinupristin", "Daptomycin"]', 0, 'Linezolid is a weak MAOI.'),
    (v_topic_id, 'What is the mechanism of Linezolid?', '["Inhibition of 30S", "Prevention of 70S initiation complex by binding to 50S", "Inhibition of DNA Gyrase", "Cell membrane disruption"]', 1, 'Linezolid binds to the 23S rRNA of the 50S subunit.'),
    (v_topic_id, 'Daptomycin is used for skin infections. Why can it NOT be used for pneumonia?', '["It doesn''t reach the lungs", "It is inactivated by pulmonary surfactant", "It is toxic to lung tissue", "It only works on anaerobes"]', 1, 'Surfactant binds and inactivates Daptomycin.'),
    (v_topic_id, 'The mechanism of Acyclovir is:', '["Inhibition of viral protease", "Inhibition of viral DNA polymerase (after activation by viral thymidine kinase)", "Blocking viral entry", "Inhibiting neuraminidase"]', 1, 'Acyclovir is a prodrug that must be phosphorylated by the viral enzyme.'),
    (v_topic_id, 'Oseltamivir (Tamiflu) is used for Influenza. Its mechanism is:', '["Inhibiting M2 ion channel", "Inhibiting Neuraminidase", "Inhibiting RNA polymerase", "Blocking attachment"]', 1, 'Neuraminidase inhibitors prevent the release of new viral particles from the host cell.'),
    (v_topic_id, 'What is the mechanism of action of Amphotericin B?', '["Inhibition of ergosterol synthesis", "Binding to ergosterol and forming pores in the membrane", "Inhibition of cell wall synthesis", "Inhibition of mitosis"]', 1, 'Amphotericin B is "Ampho-terrible" due to its systemic toxicity (fever, chills, nephrotoxicity).'),
    (v_topic_id, 'Azole antifungals (e.g., Fluconazole) act by:', '["Inhibiting 14-alpha-demethylase", "Inhibiting squalene epoxidase", "Inhibiting DNA synthesis", "Forming pores"]', 0, 'They inhibit the synthesis of ergosterol from lanosterol.'),
    (v_topic_id, 'Which drug is used for chronic Hepatitis B and C and acts by inducing an antiviral state in host cells?', '["Ribavirin", "Interferon-alpha", "Sofosbuvir", "Lamivudine"]', 1, 'Interferons are cytokines that activate antiviral proteins (e.g., RNase L).'),
    (v_topic_id, 'What is the primary side effect of Interferon-alpha?', '["Liver failure", "Flu-like symptoms (fever, chills, myalgia)", "Gingival hyperplasia", "Nephrotic syndrome"]', 1, 'Almost all patients experience a "flu-like" syndrome.'),
    (v_topic_id, 'Which antifungal inhibits the synthesis of B-glucan in the fungal cell wall?', '["Caspofungin (Echinocandins)", "Amphotericin B", "Fluconazole", "Nystatin"]', 0, 'Echinocandins are the only class targeting the wall (B-glucans).'),
    (v_topic_id, 'Terbinafine is used for onychomycosis (nail fungus). Its mechanism is:', '["Inhibiting squalene epoxidase", "Inhibiting lanosterol synthesis", "Forming pores", "Inhibiting mitosis"]', 0, 'This leads to accumulation of toxic squalene in fungal cells.');

    RAISE NOTICE 'SUCCESS: Systemic Pharmacology MCQ Part 5 (281-304) registered.';
END $$;

COMMIT;
