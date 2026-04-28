-- Migration: Year 3 - Infectious Diseases MCQ Bank (PART 4: 264-350)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-29

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'infectious-diseases' LIMIT 1;

    -- SECTION 26: ANTIBIOTICS - BETA-LACTAMS & GLYCOPEPTIDES
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '264: "Beta-lactam" antibiotics (Penicillins, Cephalosporins) work by inhibiting:', '["Protein synthesis", "Cell wall synthesis (Transpeptidation)", "DNA replication", "Folic acid metabolism"]', 1, 'They bind to Penicillin-Binding Proteins (PBPs). (Harrison''s Ch. 144)'),
    (v_topic_id, '265: "Nafcillin" and "Oxacillin" are primarily used to treat which organism?', '["E. coli", "MSSA (Methicillin-Sensitive Staph aureus)", "MRSA", "Pseudomonas"]', 1, 'They are penicillinase-resistant penicillins. (Step-Up)'),
    (v_topic_id, '266: Which generation of Cephalosporins (e.g., Ceftriaxone, Ceftazidime) has the BROADEST Gram-negative coverage and CNS penetration?', '["First", "Second", "Third", "None"]', 2, 'Ceftriaxone is the standard for meningitis and gonorrhea. (Pocket Medicine)'),
    (v_topic_id, '267: "Cefepime" is a 4th-generation cephalosporin with excellent activity against which resistant Gram-negative?', '["MRSA", "Pseudomonas aeruginosa", "VRE", "None"]', 1, 'Combines 1st gen Gram-positive and 3rd gen Gram-negative activity. (Harrison''s Ch. 144)'),
    (v_topic_id, '268: "Carbapenems" (e.g., Meropenem) are the drugs of choice for which type of resistant bacteria?', '["MRSA", "ESBL-producing Gram-negative rods", "VRE", "Mycoplasma"]', 1, 'ESBL = Extended-Spectrum Beta-Lactamase. (Step-Up)'),
    (v_topic_id, '269: "Vancomycin" works by binding to the ____ terminus of peptidoglycan precursors.', '["D-Ala-D-Ala", "D-Ala-D-Ser", "L-Lys", "None"]', 0, 'Inhibits cell wall cross-linking; used for MRSA. (Pocket Medicine)'),
    (v_topic_id, '270: "Red Man Syndrome" is a non-allergic histamine release associated with rapid infusion of:', '["Penicillin", "Vancomycin", "Gentamicin", "Ciprofloxacin"]', 1, 'Prevented by slowing the infusion rate and antihistamines. (Harrison''s Ch. 144)'),
    (v_topic_id, '271: A patient with a severe anaphylactic allergy to Penicillin should generally avoid which other class?', '["Cephalosporins (especially 1st gen)", "Macrolides", "Tetracyclines", "None"]', 0, 'Cross-reactivity is ~1-10% depending on the generation. (Step-Up)'),
    (v_topic_id, '272: "Aztreonam" is a monobactam that is safe to use in patients with penicillin allergy and only covers ____.', '["Gram-positives", "Gram-negatives (including Pseudomonas)", "Anaerobes", "Fungi"]', 1, 'Has no Gram-positive or anaerobic activity. (Pocket Medicine)'),
    (v_topic_id, '273: "Linezolid" is used for VRE and MRSA but can cause which hematologic side effect with prolonged use?', '["Anemia", "Thrombocytopenia", "Leukemia", "None"]', 1, 'Also carries a risk of Serotonin Syndrome if used with SSRIs. (Harrison''s Ch. 144)');

    -- SECTION 27: ANTIBIOTICS - PROTEIN SYNTHESIS & OTHERS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '274: "Aminoglycosides" (e.g., Gentamicin, Amikacin) are known for causing which two major toxicities?', '["Liver and Lung", "Ototoxicity and Nephrotoxicity", "Bone and Heart", "None"]', 1, 'Require monitoring of peak and trough levels. (Step-Up)'),
    (v_topic_id, '275: "Tetracyclines" (e.g., Doxycycline) are contraindicated in pregnancy and children < 8 because they cause:', '["Blindness", "Discoloration of teeth and inhibition of bone growth", "Liver failure", "None"]', 1, 'They chelate calcium in developing structures. (Pocket Medicine)'),
    (v_topic_id, '276: "Macrolides" (e.g., Azithromycin, Erythromycin) work by binding to the ____ ribosomal subunit.', '["30S", "50S", "60S", "80S"]', 1, 'Bacteriostatic inhibitors of protein synthesis. (Harrison''s Ch. 144)'),
    (v_topic_id, '277: "Clindamycin" is excellent for anaerobic infections but is the most notorious trigger for:', '["Kidney failure", "C. diff colitis", "Hearing loss", "None"]', 1, 'Disrupts colonic flora, allowing C. diff overgrowth. (Step-Up)'),
    (v_topic_id, '278: "Fluoroquinolones" (e.g., Ciprofloxacin, Levofloxacin) inhibit which enzyme?', '["RNA polymerase", "DNA Gyrase (Topoisomerase II/IV)", "Transpeptidase", "None"]', 1, 'Can cause tendon rupture (Achilles) and QTc prolongation. (Pocket Medicine)'),
    (v_topic_id, '279: "Metronidazole" is the drug of choice for anaerobes "below the diaphragm" and causes a ____ reaction with alcohol.', '["None", "Disulfiram-like (severe nausea/vomiting)", "Allergic", "None"]', 1, 'Inhibits acetaldehyde dehydrogenase. (Harrison''s Ch. 144)'),
    (v_topic_id, '280: "Trimethoprim-Sulfamethoxazole" (TMP-SMX) inhibits folic acid synthesis and is a common cause of which severe skin reaction?', '["Acne", "Stevens-Johnson Syndrome (SJS)", "Hives only", "None"]', 1, 'Also causes hyperkalemia and bone marrow suppression. (Step-Up)'),
    (v_topic_id, '281: "Daptomycin" is used for resistant Gram-positives but is inactivated by ____, making it useless for pneumonia.', '["Acid", "Pulmonary Surfactant", "Water", "None"]', 1, 'Used for skin/soft tissue and bacteremia instead. (Pocket Medicine)'),
    (v_topic_id, '282: "Nitrofurantoin" is used primarily for UTIs but can cause which chronic toxicity?', '["Kidney failure", "Pulmonary Fibrosis", "Liver failure", "None"]', 1, 'Can be acute or chronic; check LFTs and chest X-rays if used long-term. (Harrison''s Ch. 144)'),
    (v_topic_id, '283: "Rifampin" is used in TB and as an adjunct for staphylococcal infections on ____.', '["Skin", "Biofilms (e.g., prosthetic valves/joints)", "Lungs", "None"]', 1, 'Excellent penetration into biofilms. (Step-Up)');

    -- SECTION 28: FEVER OF UNKNOWN ORIGIN & NOSOCOMIAL
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '284: "Fever of Unknown Origin" (FUO) is defined as a fever > 38.3C lasting > ____ weeks without a diagnosis after 1 week of investigation.', '["1", "3", "6", "12"]', 1, 'Classic categories: Infection, Malignancy, Autoimmune. (Harrison''s Ch. 17)'),
    (v_topic_id, '285: In the elderly, the most common "Autoimmune" cause of FUO is:', '["Lupus", "Giant Cell Arteritis / PMR", "RA", "None"]', 1, 'Requires checking ESR/CRP and possibly temporal artery biopsy. (Step-Up)'),
    (v_topic_id, '286: "Ventilator-Associated Pneumonia" (VAP) is minimized by which intervention?', '["Lying flat", "Head-of-bed elevation (30-45 degrees)", "No suctioning", "None"]', 1, 'Prevents microaspiration of gastric/oral contents. (Pocket Medicine)'),
    (v_topic_id, '287: "CLABSI" stands for Central Line-Associated ____ Infection.', '["Bladder", "Bloodstream", "Bone", "None"]', 1, 'Prevented by maximum sterile barriers during insertion. (Harrison''s Ch. 143)'),
    (v_topic_id, '288: What is the most important measure to prevent the spread of nosocomial infections?', '["Wearing masks", "Hand hygiene (soap/water or alcohol rub)", "Giving prophylaxis", "None"]', 1, 'Simple but most effective intervention. (Step-Up)'),
    (v_topic_id, '289: "Standard Precautions" apply to all patients, while "Contact Precautions" (gown/gloves) are specifically for:', '["Flu", "MRSA, VRE, and C. diff", "TB", "None"]', 1, 'C. diff requires soap and water (alcohol doesn''t kill spores). (Pocket Medicine)'),
    (v_topic_id, '290: "Airborne Precautions" (N95 mask, negative pressure room) are required for:', '["Flu", "TB, Measles, and Varicella", "Staph", "None"]', 1, 'Particles remain suspended in the air. (Harrison''s Ch. 143)'),
    (v_topic_id, '291: "Droplet Precautions" (surgical mask) are required for infections like:', '["TB", "Neisseria meningitidis, Influenza, Pertussis", "C. diff", "None"]', 1, 'Large droplets that do not travel beyond 3-6 feet. (Step-Up)'),
    (v_topic_id, '292: "Neutropenic Precautions" (Reverse isolation) are for patients with ANC < ____.', '["500", "1500", "5000", "None"]', 0, 'Avoid fresh flowers, fruits, or live plants. (Pocket Medicine)'),
    (v_topic_id, '293: "Fever + Rash on palms/soles" = ?', '["Measles", "Secondary Syphilis, RMSF, or Coxsackie A", "Lyme", "None"]', 1, 'High-yield clinical triad. (Harrison''s Ch. 141)');

    -- SECTION 29: INFECTIOUS DISEASE FINAL SPRINT
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '294: "Erysipelas" = ?', '["Deeper cellulitis", "Superficial cellulitis with sharp borders (Strep)", "Fungal infection", "None"]', 1, 'Involves superficial lymphatics. (Step-Up)'),
    (v_topic_id, '295: "Ludwig Angina" = ?', '["Heart pain", "Bilateral cellulitis of the submandibular space", "Stomach pain", "None"]', 1, 'Potential airway emergency; often dental origin. (Pocket Medicine)'),
    (v_topic_id, '296: "Lemierre Syndrome" = ?', '["Brain tumor", "Septic thrombophlebitis of the internal jugular vein", "Lung infection", "None"]', 1, 'Often follows Fusobacterium necrophorum pharyngitis. (Harrison''s Ch. 185)'),
    (v_topic_id, '297: "Osteomyelitis" with a CAT bite = ?', '["Staph", "Pasteurella multocida", "Salmonella", "None"]', 1, 'Rapid onset of inflammation. (Step-Up)'),
    (v_topic_id, '298: "Osteomyelitis" with a HUMAN bite = ?', '["Staph", "Eikenella corrodens", "Pasteurella", "None"]', 1, 'Part of the HACEK group. (Pocket Medicine)'),
    (v_topic_id, '299: "Waterhouse-Friderichsen" = ?', '["Liver failure", "Adrenal hemorrhage in meningococcemia", "Kidney failure", "None"]', 1, 'Fulminant sepsis. (Harrison''s Ch. 161)'),
    (v_topic_id, '300: "Gray Baby Syndrome" = ?', '["Aspirin", "Chloramphenicol", "Tetracycline", "None"]', 1, 'Due to immature liver glucuronidation. (Step-Up)'),
    (v_topic_id, '301: "Jarisch-Herxheimer" = ?', '["Drug allergy", "Fever after treating syphilis/spirochetes", "Infection", "None"]', 1, 'Lysis of organisms. (Pocket Medicine)'),
    (v_topic_id, '302: "Ghon Complex" = ?', '["Lung cancer", "Calcified TB nodule + Hilar node", "Pneumonia", "None"]', 1, 'Primary TB sign. (Harrison''s Ch. 176)'),
    (v_topic_id, '303: "Ranke Complex" = ?', '["Active TB", "Calcified Ghon complex (healed TB)", "Cancer", "None"]', 1, 'Visible on X-ray. (Step-Up)'),
    (v_topic_id, '304: "Cold Agglutinins" = ?', '["Staph", "Mycoplasma pneumoniae", "Flu", "None"]', 1, 'IgM antibodies. (Pocket Medicine)'),
    (v_topic_id, '305: "India Ink" = ?', '["Candida", "Cryptococcus", "Aspergillus", "None"]', 1, 'CSF test for yeast. (Harrison''s Ch. 219)'),
    (v_topic_id, '306: "Negri Bodies" = ?', '["Rabies", "Measles", "Mumps", "None"]', 0, 'Intranuclear inclusions. (Step-Up)'),
    (v_topic_id, '307: "Owl''s Eye" = ?', '["EBV", "CMV", "HIV", "None"]', 1, 'Inclusion bodies. (Pocket Medicine)'),
    (v_topic_id, '308: "Koplik Spots" = ?', '["Measles", "Rubella", "Mumps", "None"]', 0, 'Buccal spots. (Harrison''s Ch. 200)'),
    (v_topic_id, '309: "Strawberry Tongue" = ?', '["Scarlet Fever, Kawasaki Disease, or TSS", "Flu", "Mono", "None"]', 0, 'Inflamed lingual papillae. (Step-Up)'),
    (v_topic_id, '310: "Condyloma Lata" = ?', '["HPV", "Secondary Syphilis", "HSV", "None"]', 1, 'Painless, broad warts. (Pocket Medicine)'),
    (v_topic_id, '311: "Condyloma Acuminata" = ?', '["Syphilis", "HPV", "HIV", "None"]', 1, 'Genital warts. (Harrison''s Ch. 200)'),
    (v_topic_id, '312: "Fitz-Hugh-Curtis" = ?', '["Liver failure", "Perihepatitis in PID", "Kidney failure", "None"]', 1, 'Violin-string adhesions. (Step-Up)'),
    (v_topic_id, '313: "Chancre" = ?', '["Secondary Syphilis", "Primary Syphilis", "Chancroid", "None"]', 1, 'Painless ulcer. (Pocket Medicine)'),
    (v_topic_id, '314: "Chancroid" = ?', '["Syphilis", "Haemophilus ducreyi", "Lymphoma", "None"]', 1, 'Painful ulcer. (Harrison''s Ch. 170)'),
    (v_topic_id, '315: "Target cells" = ?', '["Iron deficiency", "Thalassemia or Liver disease", "Leukemia", "None"]', 1, 'Red cells with central spot. (Step-Up)'),
    (v_topic_id, '316: "Hypersegmented neutrophils" = ?', '["Iron deficiency", "B12 / Folate deficiency", "Lead poisoning", "None"]', 1, 'Megaloblastic sign. (Pocket Medicine)'),
    (v_topic_id, '317: "Schistocytes" = ?', '["Sickle cell", "MAHA (TTP/HUS/DIC)", "Spherocytosis", "None"]', 1, 'Fragmented cells. (Harrison''s Ch. 122)'),
    (v_topic_id, '318: "Bite cells" = ?', '["Thalassemia", "G6PD Deficiency", "Sickle cell", "None"]', 1, 'Splenic pitting. (Step-Up)'),
    (v_topic_id, '319: "Basophilic stippling" = ?', '["B12", "Lead Poisoning", "Hemolysis", "None"]', 1, 'Ribosome aggregation. (Pocket Medicine)'),
    (v_topic_id, '320: "Howell-Jolly bodies" = ?', '["Functional / Surgical Asplenia", "Iron deficiency", "None", "None"]', 0, 'Nuclear remnants. (Harrison''s Ch. 110)'),
    (v_topic_id, '321: "TRAP positive" = ?', '["CLL", "Hairy Cell Leukemia", "ALL", "None"]', 1, 'Leukemia marker. (Step-Up)'),
    (v_topic_id, '322: "Psammoma bodies" = ?', '["Papillary Thyroid / Serous Ovarian", "Lung CA", "MM", "None"]', 0, 'Calcifications. (Pocket Medicine)'),
    (v_topic_id, '323: "Reed-Sternberg" = ?', '["NHL", "Hodgkin Lymphoma", "MM", "None"]', 1, 'HL pathognomonic cell. (Harrison''s Ch. 110)'),
    (v_topic_id, '324: "Philadelphia chromosome" = ?', '["AML", "CML", "ALL", "None"]', 1, 't(9;22). (Step-Up)'),
    (v_topic_id, '325: "Auer rods" = ?', '["ALL", "AML", "CML", "None"]', 1, 'Myeloblast granules. (Pocket Medicine)'),
    (v_topic_id, '326: "Bence-Jones" = ?', '["Lupus", "Multiple Myeloma", "Diabetes", "None"]', 1, 'Light chain protein. (Harrison''s Ch. 111)'),
    (v_topic_id, '327: "Pancoast tumor" = ?', '["Lung apex", "Brain", "Liver", "None"]', 0, 'Superior sulcus. (Step-Up)'),
    (v_topic_id, '328: "Virchow''s node" = ?', '["Lung CA", "Gastric Adenocarcinoma", "Breast CA", "None"]', 1, 'Left supraclavicular. (Pocket Medicine)'),
    (v_topic_id, '329: "Sister Mary Joseph" = ?', '["Breast", "Umbilical met from GI cancer", "Skin", "None"]', 1, 'Nodule. (Harrison''s Ch. 110)'),
    (v_topic_id, '330: "Lambert-Eaton" = ?', '["Small Cell Lung Cancer", "Breast", "Colon", "None"]', 0, 'Muscle weakness. (Step-Up)'),
    (v_topic_id, '331: "PTHrP" = ?', '["Small cell", "Squamous Cell Lung Cancer", "Adeno", "None"]', 1, 'Hypercalcemia. (Pocket Medicine)'),
    (v_topic_id, '332: "SIADH" = ?', '["Squamous", "Small Cell Lung Cancer", "Large cell", "None"]', 1, 'Low sodium. (Harrison''s Ch. 110)'),
    (v_topic_id, '333: "SVC Syndrome" = ?', '["Lung Cancer / Lymphoma", "Heart failure", "Pneumonia", "None"]', 0, 'Vein compression. (Step-Up)'),
    (v_topic_id, '334: "AFP" high = ?', '["Colon", "Hepatocellular CA / Yolk sac", "Prostate", "None"]', 1, 'Tumor marker. (Pocket Medicine)'),
    (v_topic_id, '335: "CA-125" = ?', '["Breast", "Ovarian Cancer", "Cervical", "None"]', 1, 'Monitoring ovarian. (Harrison''s Ch. 110)'),
    (v_topic_id, '336: "CEA" = ?', '["Lung", "Colorectal Cancer", "Prostate", "None"]', 1, 'Monitoring colon. (Step-Up)'),
    (v_topic_id, '337: "CA-19-9" = ?', '["Liver", "Pancreatic Cancer", "Stomach", "None"]', 1, 'Monitoring pancreatic. (Pocket Medicine)'),
    (v_topic_id, '338: "PSA" = ?', '["Bladder", "Prostate Cancer", "Kidney", "None"]', 1, 'Prostate marker. (Harrison''s Ch. 110)'),
    (v_topic_id, '339: "Rouleaux" = ?', '["Sickle cell", "Multiple Myeloma", "Spherocytosis", "None"]', 1, 'Stack of coins. (Step-Up)'),
    (v_topic_id, '340: "Apple-core" = ?', '["Stomach", "Colorectal Cancer", "Lung", "None"]', 1, 'Annular mass. (Pocket Medicine)'),
    (v_topic_id, '341: "Doxorubicin" = ?', '["Kidney", "Cardiotoxicity", "Lung", "None"]', 1, 'Heart failure. (Harrison''s Ch. 110)'),
    (v_topic_id, '342: "Bleomycin" = ?', '["Heart", "Pulmonary Fibrosis", "Liver", "None"]', 1, 'Lung damage. (Step-Up)'),
    (v_topic_id, '343: "Cisplatin" = ?', '["Oto/Nephrotoxicity", "Vision", "Heart", "None"]', 0, 'Hearing/Kidney. (Pocket Medicine)'),
    (v_topic_id, '344: "Vincristine" = ?', '["Diarrhea", "Peripheral Neuropathy", "Lung", "None"]', 1, 'Nerve damage. (Harrison''s Ch. 110)'),
    (v_topic_id, '345: "Cyclophosphamide" = ?', '["Kidney", "Hemorrhagic Cystitis", "Liver", "None"]', 1, 'Bladder bleeding. (Step-Up)'),
    (v_topic_id, '346: "Tamoxifen" = ?', '["Bone loss", "Endometrial CA / Clots", "Brain", "None"]', 1, 'Uterus agonist. (Pocket Medicine)'),
    (v_topic_id, '347: "Trastuzumab" = ?', '["Lung", "Cardiotoxicity", "Kidney", "None"]', 1, 'HER2 antibody. (Harrison''s Ch. 110)'),
    (v_topic_id, '348: "5-FU" = ?', '["Rash", "Hand-Foot Syndrome / Mucositis", "Hearing", "None"]', 1, 'Oral ulcers. (Step-Up)'),
    (v_topic_id, '349: "L-asparaginase" = ?', '["Lung", "Pancreatitis / Clots", "Kidney", "None"]', 1, 'Used in ALL. (Pocket Medicine)'),
    (v_topic_id, '350: "Starry sky" = ?', '["Follicular", "Burkitt Lymphoma", "Hodgkin", "None"]', 1, 'Lymphoma histology. (Harrison''s Ch. 110)');

    RAISE NOTICE 'SUCCESS: Infectious Diseases MCQ Part 4 (264-350) registered.';
END $$;

COMMIT;
