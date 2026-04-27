-- Migration: Systemic Microbiology Cases Part 2 (11-20)
-- Goal: Cover Gram-Negative Bacteria and GI Pathogens
-- Sources: Clinical Microbiology Made Ridiculously Simple, Levinson, Parham

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'systemic-microbiology' LIMIT 1;

    -- DELETE existing cases for this range to prevent duplicates on re-run
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 11 AND 20);
    DELETE FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 11 AND 20;

    -- CASE 11: Neisseria meningitidis (Meningitis/Waterhouse-Friderichsen)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Petechial Rash', 'A 19-year-old college student presents with high fever, headache, stiff neck, and a petechial rash on his legs. He rapidly deteriorates into septic shock with bilateral adrenal hemorrhage.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pneumococcal Meningitis", "Meningococcemia", "Toxic Shock Syndrome", "Lyme Disease"]', 1, 'Neisseria meningitidis can cause rapid septicemia and meningitis, often characterized by a petechial rash.'),
    (v_case_id, 'What is the name of the adrenal crisis seen in severe cases of this infection?', '["Cushing Syndrome", "Waterhouse-Friderichsen Syndrome", "Addisonian Crisis", "Conn Syndrome"]', 1, 'Waterhouse-Friderichsen syndrome is characterized by adrenal gland failure due to massive hemorrhage into the adrenal glands, caused by severe bacterial infection (classically N. meningitidis).'),
    (v_case_id, 'Which component of the bacterial cell wall is primarily responsible for the severe inflammatory response?', '["Peptidoglycan", "Lipooligosaccharide (LOS)", "Teichoic acid", "M protein"]', 1, 'N. meningitidis (and gonorrhoeae) have LOS (a version of LPS) that acts as a potent endotoxin, triggering massive cytokine release.');

    -- CASE 12: Neisseria gonorrhoeae (PID)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Pelvic Pain', 'A 22-year-old woman presents with lower abdominal pain, fever, and a purulent vaginal discharge. She has cervical motion tenderness ("chandelier sign") on exam.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common serious complication of this infection in women?', '["Ectopic pregnancy and infertility", "Ovarian cancer", "Uterine fibroids", "Endometriosis"]', 0, 'Gonorrhea (and Chlamydia) can cause Pelvic Inflammatory Disease (PID), which leads to scarring of the fallopian tubes, increasing the risk of ectopic pregnancy and infertility.'),
    (v_case_id, 'What is the morphology of this organism?', '["Gram-positive diplococci", "Gram-negative kidney bean-shaped diplococci", "Gram-negative rods", "Acid-fast bacilli"]', 1, 'Both Neisseria species are Gram-negative, kidney bean-shaped diplococci.'),
    (v_case_id, 'Why is there no long-term immunity or vaccine for this infection?', '["It lacks a capsule", "High antigenic variation of its pili", "It is an obligate intracellular pathogen", "It produces an IgA protease"]', 1, 'N. gonorrhoeae has highly variable pilin proteins, allowing it to evade the immune system and prevent the development of a lasting vaccine.');

    -- CASE 13: Escherichia coli (EHEC)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Bloody Diarrhea and Renal Failure', 'A 5-year-old boy presents with bloody diarrhea after eating an undercooked hamburger. A few days later, he becomes pale and develops decreased urine output and a low platelet count.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Typhoid Fever", "Hemolytic Uremic Syndrome (HUS)", "Shigellosis", "Intussusception"]', 1, 'HUS (triad of anemia, thrombocytopenia, and renal failure) is a classic complication of EHEC (O157:H7) infection in children.'),
    (v_case_id, 'Which toxin is responsible for this condition?', '["Heat-labile toxin", "Heat-stable toxin", "Shiga-like toxin (Verotoxin)", "Endotoxin"]', 2, 'EHEC produces Shiga-like toxin, which inhibits protein synthesis by removing an adenine from the 28S rRNA, leading to endothelial damage in the glomerulus.'),
    (v_case_id, 'Why is sorbitol-MacConkey agar used in the lab for this patient?', '["EHEC ferments sorbitol rapidly", "EHEC does NOT ferment sorbitol (unlike most other E. coli)", "It selects for Gram-positive organisms", "It inhibits the growth of E. coli"]', 1, 'E. coli O157:H7 is uniquely unable to ferment sorbitol, appearing as colorless colonies on sorbitol-MacConkey agar.');

    -- CASE 14: Salmonella typhi (Typhoid Fever)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Rose Spots', 'A traveler returning from Southeast Asia presents with a slow-rising fever, abdominal pain, and faint pink macules ("rose spots") on his trunk. He has a relatively low heart rate despite his high fever (bradycardia).', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Malaria", "Typhoid Fever", "Cholera", "Amebiasis"]', 1, 'Typhoid fever presents with stepwise fever, "rose spots," and pulse-temperature dissociation (Faget sign).'),
    (v_case_id, 'Where does this organism characteristically reside in a chronic carrier state?', '["Kidneys", "Gallbladder", "Lungs", "Spleen"]', 1, 'S. typhi can persist in the gallbladder, leading to a chronic carrier state (e.g., Typhoid Mary).'),
    (v_case_id, 'How does this organism enter the host?', '["Invades M cells of Peyer''s patches", "Directly through the skin", "Respiratory droplets", "Insect vector"]', 0, 'Salmonella invades M cells in the intestinal Peyer''s patches and then spreads to the reticuloendothelial system.');

    -- CASE 15: Shigella sonnei (Dysentery)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Daycare Outbreak', 'Multiple children at a daycare center develop fever, abdominal cramps, and frequent small-volume diarrhea containing blood and mucus.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the hallmark of Shigella pathogenicity?', '["Production of massive amounts of cAMP", "Very low infectious dose (as few as 10-100 organisms)", "Hematogenous spread to the brain", "Formation of a thick capsule"]', 1, 'Shigella is highly resistant to stomach acid, allowing a very small dose to cause infection (low ID50).'),
    (v_case_id, 'Like Listeria, how does Shigella move within host cells?', '["Via flagella", "Via actin tails", "Via cilia", "It is non-motile"]', 1, 'Shigella utilizes host cell actin to polymerize "tails" that push it into adjacent cells.'),
    (v_case_id, 'Which of the following is true regarding Shigella motility?', '["It is highly motile via peritrichous flagella", "It is non-motile (no H antigen)", "It swarms on agar", "It moves via a single polar flagellum"]', 1, 'Unlike Salmonella, Shigella is non-motile and lacks H antigens.');

    -- CASE 16: Vibrio cholerae (Cholera)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Rice-Water Stools', 'A patient in a refugee camp presents with massive amounts of watery diarrhea that looks like "rice water." He is severely dehydrated and has lost 10% of his body weight.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of the Cholera toxin?', '["Inhibition of EF-2", "Permanent activation of Gs protein, leading to high cAMP", "Inhibition of Gi protein", "Direct destruction of the intestinal lining"]', 1, 'Cholera toxin ADP-ribosylates the Gs alpha subunit, keeping it in the "on" position. This activates adenylate cyclase, raising cAMP and forcing Cl- (and water) out of the cell.'),
    (v_case_id, 'What is the primary treatment for cholera?', '["Intravenous antibiotics", "Aggressive oral or IV rehydration", "Antidiarrheal medications like loperamide", "Strict fasting"]', 1, 'The disease is self-limiting if the patient can be kept hydrated. Rehydration is the absolute priority.'),
    (v_case_id, 'What type of environment does this organism prefer?', '["Acidic", "Neutral", "Alkaline (pH 8.5+)", "No preference"]', 2, 'Vibrios are "alkaliphiles" and grow well in high pH environments (e.g., TCBS agar).');

    -- CASE 17: Helicobacter pylori (Ulcers)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Epigastric Pain', 'A 45-year-old man presents with chronic gnawing epigastric pain that is relieved by meals. Endoscopy shows a duodenal ulcer.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What enzyme allows H. pylori to survive in the acidic environment of the stomach?', '["Catalase", "Urease", "Oxidase", "Coagulase"]', 1, 'Urease converts urea into ammonia and CO2, neutralizing the local acid environment.'),
    (v_case_id, 'Which of the following is a long-term risk of chronic H. pylori infection?', '["Gastric Adenocarcinoma and MALT Lymphoma", "Esophageal cancer", "Colon cancer", "Liver cirrhosis"]', 0, 'Chronic inflammation from H. pylori is a major risk factor for both gastric adenocarcinoma and MALT (Mucosa-Associated Lymphoid Tissue) lymphoma.'),
    (v_case_id, 'What is the standard "Triple Therapy" for H. pylori?', '["Amoxicillin, Clarithromycin, and a PPI", "Vancomycin, Metronidazole, and a PPI", "Penicillin, Gentamicin, and an H2 blocker", "Ciprofloxacin and Doxycycline"]', 0, 'The standard regimen includes two antibiotics (usually Amoxicillin and Clarithromycin) and a Proton Pump Inhibitor.');

    -- CASE 18: Pseudomonas aeruginosa (Cystic Fibrosis)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Blue-Green Sputum', 'A 15-year-old girl with Cystic Fibrosis presents with a pulmonary exacerbation. Her sputum has a distinct fruity odor and a blue-green pigment.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the source of the blue-green pigment?', '["Bilirubin", "Pyocyanin and Pyoverdin", "Blood", "Melanin"]', 1, 'Pseudomonas produces pyocyanin (blue) and pyoverdin (yellow-green) pigments.'),
    (v_case_id, 'What is the mechanism of Pseudomonas Exotoxin A?', '["Activation of cAMP", "Inhibition of EF-2 via ADP-ribosylation", "Cleavage of SNARE proteins", "Pore formation"]', 1, 'Exotoxin A has the same mechanism as Diphtheria toxin: it inhibits host protein synthesis by inactivating Elongation Factor-2 (EF-2).'),
    (v_case_id, 'Which of the following describes Pseudomonas?', '["Obligate anaerobe", "Non-lactose fermenting, oxidase-positive Gram-negative rod", "Gram-positive coccus", "Lactose fermenter"]', 1, 'Pseudomonas is a non-lactose fermenting, oxidase-positive, aerobic Gram-negative rod.');

    -- CASE 19: Legionella pneumophila (Legionnaires'' Disease)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Hotel Outbreak', 'An 60-year-old smoker attending a convention at an old hotel develops severe pneumonia, high fever, diarrhea, and mental confusion (hyponatremia).', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How is this organism typically transmitted?', '["Person-to-person via droplets", "Aerosols from contaminated water sources (AC units, misters)", "Fecal-oral route", "Tick bite"]', 1, 'Legionella is found in water and transmitted via inhaled aerosols. There is no person-to-person transmission.'),
    (v_case_id, 'What specific medium is required to grow Legionella in the lab?', '["Blood agar", "Chocolate agar", "Charcoal Yeast Extract (BCYE) agar with iron and cysteine", "MacConkey agar"]', 2, 'Legionella is fastidious and requires BCYE agar, which is enriched with iron and cysteine.'),
    (v_case_id, 'What is a characteristic lab abnormality seen in Legionnaires'' disease?', '["Hyperkalemia", "Hyponatremia", "Hypoglycemia", "Anemia"]', 1, 'Legionnaires'' disease is often associated with hyponatremia (low sodium), which can contribute to neurological symptoms.');

    -- CASE 20: Campylobacter jejuni (Post-Infection Complication)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Ascending Weakness', 'A 30-year-old man recovers from a week of bloody diarrhea. Two weeks later, he develops symmetric, ascending muscle weakness starting in his feet.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What neurological condition is associated with recent Campylobacter infection?', '["Multiple Sclerosis", "Guillain-Barré Syndrome", "Myasthenia Gravis", "ALS"]', 1, 'Campylobacter jejuni is the most common antecedent infection for Guillain-Barré Syndrome (GBS).'),
    (v_case_id, 'What is the appearance of this organism on a Gram stain?', '["Gram-negative cocci", "Gram-negative curved, comma-shaped or S-shaped rods", "Gram-positive rods", "Spiral-shaped"]', 1, 'Campylobacter (and Vibrio) are curved Gram-negative rods. Campylobacter is often described as "S-shaped" or "seagull-winged."'),
    (v_case_id, 'What unique temperature does Campylobacter prefer for growth?', '["4°C (Cold)", "37°C (Body temp)", "42°C (Warm)", "60°C (Hot)"]', 2, 'Campylobacter is thermophilic and grows best at 42°C. (Mnemonic: Camp-fire is hot).');

    RAISE NOTICE 'SUCCESS: Systemic Microbiology Cases Part 2 (11-20) registered.';
END $$;

COMMIT;
