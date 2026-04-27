-- Migration: Systemic Microbiology Cases Part 1 (01-10)
-- Goal: Cover Gram-Positive Bacteria and Key Respiratory Pathogens
-- Sources: Clinical Microbiology Made Ridiculously Simple, Levinson, Parham

BEGIN;

-- 1. Ensure Topic "Systemic Microbiology" exists
INSERT INTO topics (title, slug, semester_id, year_id, "order", usmle_step)
VALUES ('Systemic Microbiology', 'systemic-microbiology', 3, 2, 35, NULL)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'systemic-microbiology' LIMIT 1;

    -- DELETE existing cases for this range to prevent duplicates on re-run
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 1 AND 10);
    DELETE FROM case_studies WHERE topic_id = v_topic_id AND "order" BETWEEN 1 AND 10;

    -- CASE 01: Staphylococcus aureus (TSS)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'High Fever and Rash', 'A 24-year-old woman presents to the ER with a sudden onset of high fever (104°F), hypotension (80/50 mmHg), and a diffuse erythematous rash that resembles a sunburn. She is currently menstruating and using high-absorbency tampons.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Staphylococcal Scalded Skin Syndrome", "Toxic Shock Syndrome", "Rocky Mountain Spotted Fever", "Meningococcemia"]', 1, 'The combination of fever, hypotension, and a sunburn-like rash in a menstruating woman is classic for Toxic Shock Syndrome (TSS).'),
    (v_case_id, 'Which toxin is responsible for this condition?', '["Alpha-toxin", "Exfoliatin", "TSST-1", "Enterotoxin B"]', 2, 'TSST-1 (Toxic Shock Syndrome Toxin-1) acts as a superantigen, causing massive cytokine release.'),
    (v_case_id, 'What is the mechanism of action of the toxin involved?', '["Inhibition of protein synthesis", "Activation of adenylate cyclase", "Non-specific binding of MHC II to T-cell receptors (Superantigen)", "Cleavage of desmoglein-1"]', 2, 'Superantigens bind non-specifically to the V-beta region of T-cell receptors and MHC II, bypassing normal antigen processing and causing a "cytokine storm."');

    -- CASE 02: Streptococcus pyogenes (Rheumatic Fever)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Joint Pain and Murmur', 'A 10-year-old boy presents with migrating joint pain, involuntary jerky movements (chorea), and a new heart murmur. His mother recalls him having a severe sore throat 3 weeks ago that was not treated.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Post-streptococcal glomerulonephritis", "Acute Rheumatic Fever", "Infective Endocarditis", "Juvenile Idiopathic Arthritis"]', 1, 'Acute Rheumatic Fever (ARF) follows an untreated S. pyogenes pharyngitis and is characterized by the Jones criteria (Joints, Heart, Nodules, Erythema marginatum, Sydenham chorea).'),
    (v_case_id, 'Which streptococcal virulence factor is responsible for the molecular mimicry leading to this condition?', '["Streptolysin O", "M protein", "Hyaluronic acid capsule", "C5a peptidase"]', 1, 'M protein shares structural homology with cardiac myosin. Antibodies against M protein cross-react with heart tissue.'),
    (v_case_id, 'Which lab test would be most helpful in confirming a recent streptococcal infection in this patient?', '["ASO titer", "Blood culture", "Throat culture", "C-reactive protein"]', 0, 'ASO (Anti-Streptolysin O) titers are elevated following a streptococcal pharyngitis and are used to provide evidence of recent infection when Jones criteria are present.');

    -- CASE 03: Streptococcus pneumoniae (Pneumonia)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Rusty Sputum', 'A 65-year-old man with a history of COPD presents with productive cough, "rusty" colored sputum, and shaking chills. Chest X-ray shows lobar consolidation.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely causative agent?', '["Mycoplasma pneumoniae", "Streptococcus pneumoniae", "Haemophilus influenzae", "Klebsiella pneumoniae"]', 1, 'S. pneumoniae (Pneumococcus) is the leading cause of community-acquired lobar pneumonia, often associated with rusty sputum.'),
    (v_case_id, 'What is the primary virulence factor of this organism?', '["Lipopolysaccharide", "Polysaccharide capsule", "Exotoxin A", "IgA protease"]', 1, 'The polysaccharide capsule is essential for virulence as it prevents phagocytosis.'),
    (v_case_id, 'What is the morphology of this organism on Gram stain?', '["Gram-positive cocci in clusters", "Gram-positive lancet-shaped diplococci", "Gram-negative rods", "Gram-positive chains"]', 1, 'S. pneumoniae is classically described as lancet-shaped, Gram-positive diplococci.');

    -- CASE 04: Bacillus anthracis (Anthrax)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Black Eschar', 'A sheep farmer presents with a painless, black, necrotic ulcer (eschar) on his forearm surrounded by significant edema.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the likely diagnosis?', '["Cutaneous Anthrax", "Tularemia", "Bubonic Plague", "Orf"]', 0, 'Cutaneous anthrax presents as a painless black eschar (necrotic center) with extensive local edema.'),
    (v_case_id, 'What is unique about the capsule of this organism?', '["It is made of hyaluronic acid", "It is made of D-glutamate (protein)", "It is a polysaccharide capsule", "It lacks a capsule"]', 1, 'Bacillus anthracis is the only bacterium with a polypeptide (protein) capsule made of D-glutamic acid.'),
    (v_case_id, 'Which component of the anthrax toxin acts as an adenylate cyclase?', '["Protective Antigen (PA)", "Lethal Factor (LF)", "Edema Factor (EF)", "Exotoxin A"]', 2, 'Edema Factor (EF) is a calmodulin-dependent adenylate cyclase that increases cAMP, leading to edema.');

    -- CASE 05: Clostridium tetani (Tetanus)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Lockjaw', 'A 30-year-old construction worker steps on a rusty nail. Five days later, he presents with stiffness in his jaw and a "sardonic smile" (risus sardonicus).', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of the toxin responsible for his symptoms?', '["Cleavage of SNARE proteins to inhibit ACh release", "Cleavage of SNARE proteins to inhibit GABA and glycine release", "Activation of adenylate cyclase", "Inhibition of protein synthesis"]', 1, 'Tetanospasmin travels retrograde to the CNS and cleaves SNARE proteins in inhibitory Renshaw cells, preventing the release of GABA and glycine.'),
    (v_case_id, 'What type of paralysis does this toxin cause?', '["Flaccid paralysis", "Spastic paralysis", "Ascending paralysis", "Hemiparesis"]', 1, 'The loss of inhibitory neurotransmitters leads to uncontrolled muscle contraction (spastic paralysis).'),
    (v_case_id, 'Is this organism aerobic or anaerobic?', '["Obligate aerobe", "Facultative anaerobe", "Obligate anaerobe", "Microaerophilic"]', 2, 'All Clostridia species are obligate anaerobes.');

    -- CASE 06: Clostridium botulinum (Botulism)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Floppy Baby', 'An 8-month-old infant is brought to the clinic for constipation and generalized weakness. The parents mention they recently started giving the baby raw honey.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the mechanism of the toxin in this case?', '["Inhibition of inhibitory neurotransmitters", "Inhibition of acetylcholine release at the NMJ", "Stimulation of dopamine release", "Direct destruction of motor neurons"]', 1, 'Botulinum toxin cleaves SNARE proteins in excitatory motor neurons, preventing the release of acetylcholine (ACh).'),
    (v_case_id, 'How does infant botulism differ from adult botulism?', '["Infants ingest the toxin; adults ingest the spores", "Infants ingest the spores (e.g., in honey); adults ingest preformed toxin", "There is no difference", "Infants are immune to the toxin"]', 1, 'Infants lack competing gut flora, allowing spores to germinate and produce toxin in vivo. Adults typically ingest the preformed toxin from canned foods.'),
    (v_case_id, 'What type of paralysis is seen in botulism?', '["Spastic paralysis", "Symmetric ascending flaccid paralysis", "Symmetric descending flaccid paralysis", "Monoplegia"]', 2, 'Botulism causes a characteristic symmetric descending flaccid paralysis starting with cranial nerves (diplopia, dysphagia).');

    -- CASE 07: Clostridium difficile (C. diff)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Diarrhea After Antibiotics', 'A 70-year-old hospitalized patient develops watery diarrhea and abdominal cramping after a 10-day course of clindamycin.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which toxin causes the formation of "pseudomembranes" in the colon?', '["Toxin A (Enterotoxin)", "Toxin B (Cytotoxin)", "Listeriolysin O", "Shiga toxin"]', 1, 'Toxin B (Cytotoxin) causes actin depolymerization and cell death, leading to the characteristic yellowish pseudomembranes.'),
    (v_case_id, 'What is the mechanism by which C. difficile toxins act on cells?', '["Ribosylation of EF-2", "Inhibition of Rho GTPases", "Activation of cAMP", "Pore formation"]', 1, 'Both Toxin A and Toxin B inhibit Rho GTPases, which are essential for maintaining the actin cytoskeleton.'),
    (v_case_id, 'What is the first-line oral treatment for this condition?', '["Amoxicillin", "Vancomycin or Fidaxomicin", "Metronidazole only", "Ciprofloxacin"]', 1, 'Oral vancomycin or fidaxomicin are current first-line treatments for C. difficile infection.');

    -- CASE 08: Listeria monocytogenes (Neonatal Meningitis)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Deli Meat Risk', 'A pregnant woman develops a flu-like illness after eating unpasteurized cheese. Shortly after birth, her newborn develops meningitis.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What unique movement is associated with Listeria in the lab?', '["Swarming motility", "Twitching motility", "Tumbling motility", "Non-motile"]', 2, 'Listeria exhibits "tumbling motility" at 25°C due to flagella.'),
    (v_case_id, 'How does Listeria move from cell to cell within the host?', '["Via pili", "Via flagella", "Via actin rockets (actin polymerization)", "Via the bloodstream only"]', 2, 'Listeria uses "actin rockets" to propel itself from the cytoplasm of one host cell directly into another, avoiding extracellular antibodies.'),
    (v_case_id, 'Which of the following describes Listeria?', '["Gram-negative coccobacillus", "Gram-positive rod with tumbling motility", "Acid-fast bacillus", "Anaerobic Gram-positive rod"]', 1, 'Listeria is a facultative intracellular, Gram-positive, non-spore-forming rod.');

    -- CASE 09: Influenza Virus
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'Winter Fever', 'A 30-year-old man presents in January with sudden onset of high fever, muscle aches, and a non-productive cough.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the significance of "Antigenic Shift" in Influenza A?', '["Minor mutations in H and N", "Reassortment of genomic segments leading to pandemics", "Loss of the viral envelope", "Acquisition of antibiotic resistance"]', 1, 'Antigenic shift involves major changes due to reassortment of the segmented RNA genome between different strains, often causing global pandemics.'),
    (v_case_id, 'Which viral protein is responsible for binding to sialic acid on host cells?', '["Neuraminidase", "Hemagglutinin", "M2 protein", "RNA polymerase"]', 1, 'Hemagglutinin (H) binds to sialic acid for entry. Neuraminidase (N) cleaves sialic acid for viral release.'),
    (v_case_id, 'What is the mechanism of Oseltamivir (Tamiflu)?', '["Inhibits viral uncoating", "Inhibits viral RNA polymerase", "Inhibits Neuraminidase", "Blocks Hemagglutinin"]', 2, 'Oseltamivir is a neuraminidase inhibitor, preventing the release of new virions from the host cell.');

    -- CASE 10: Respiratory Syncytial Virus (RSV)
    INSERT INTO case_studies (topic_id, title, scenario, "order") VALUES
    (v_topic_id, 'The Wheezing Infant', 'A 2-month-old infant is brought to the pediatric ER with fever, cough, and significant wheezing. Oxygen saturation is 88%.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Epiglottitis", "Croup", "Bronchiolitis", "Cystic Fibrosis"]', 2, 'RSV is the #1 cause of bronchiolitis and pneumonia in infants under 1 year old.'),
    (v_case_id, 'What is the characteristic feature seen in cell culture with this virus?', '["Intranuclear inclusions", "Syncytia formation (multinucleated giant cells)", "Cell lysis", "No change"]', 1, 'The Fusion (F) protein causes host cells to fuse together, forming multinucleated giant cells called syncytia.'),
    (v_case_id, 'Which monoclonal antibody is used for prophylaxis in high-risk premature infants?', '["Infliximab", "Palivizumab", "Adalimumab", "Rituximab"]', 1, 'Palivizumab is a monoclonal antibody against the F protein of RSV used to prevent infection in high-risk infants.');

    RAISE NOTICE 'SUCCESS: Systemic Microbiology Cases Part 1 (01-10) registered.';
END $$;

COMMIT;
