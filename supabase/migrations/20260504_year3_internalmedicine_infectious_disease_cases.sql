BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'infectious-disease' LIMIT 1;

    -- CASE 01: Sepsis and Septic Shock
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hypotension and Fever in an Elderly Female', 'An 80-year-old female is brought to the ER with confusion and a fever of 102.5\u00b0F. Her BP is 85/50 mmHg and HR is 115 bpm. Her skin is warm to the touch. Labs show a WBC of 18,000 and a Lactate of 4.5 mmol/L.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first-line treatment for this patient''s hypotension?', '["Norepinephrine infusion", "Aggressive IV fluid resuscitation (30 mL/kg)", "Dopamine", "IV Antibiotics only"]', 1, 'Initial management of sepsis-induced hypotension is fluid resuscitation.'),
    (v_case_id, 'If the patient''s BP remains low despite adequate fluid resuscitation, what is the next step?', '["Repeat fluids", "Start Vasopressors (e.g., Norepinephrine)", "Give steroids", "Intubate"]', 1, 'Septic shock is defined as hypotension requiring vasopressors to maintain MAP >= 65 and a lactate > 2 despite fluids.'),
    (v_case_id, 'What is the most common source of sepsis in the elderly?', '["Pneumonia", "Urinary Tract Infection (UTI)", "Skin infection", "Meningitis"]', 1, 'Urosepsis is a leading cause in this population.');

    -- CASE 02: Bacterial Meningitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Headache, Stiff Neck, and Petechial Rash', 'A 19-year-old college student presents with a sudden onset of high fever, severe headache, and neck stiffness. On exam, he has a non-blanching petechial rash on his trunk.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely causative organism?', '["Streptococcus pneumoniae", "Neisseria meningitidis", "Haemophilus influenzae", "Listeria monocytogenes"]', 1, 'Meningococcus is the classic cause of meningitis in young adults, especially in dormitory settings with a petechial rash.'),
    (v_case_id, 'Which of the following CSF findings is characteristic of bacterial meningitis?', '["High glucose, Low protein", "Low glucose, High protein, High Neutrophils", "Low glucose, Low protein, High Lymphocytes", "Normal glucose"]', 1, 'Bacteria consume glucose and produce protein/inflammation.'),
    (v_case_id, 'What is the empiric antibiotic regimen for a young adult with suspected meningitis?', '["Vancomycin + Ceftriaxone", "Vancomycin + Ampicillin", "Penicillin G", "Ciprofloxacin"]', 0, 'Covers S. pneumo and N. meningitidis; Ampicillin is added only for those at risk for Listeria (age > 50 or immunocompromised).');

    -- CASE 03: HIV - Acute Retroviral Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever, Sore Throat, and Rash after Unprotected Sex', 'A 25-year-old male presents with a "flu-like" illness including fever, sore throat, and a diffuse maculopapular rash. He reports having unprotected sex with a new partner 3 weeks ago.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Mononucleosis", "Acute Retroviral Syndrome (Early HIV)", "Secondary Syphilis", "Streptococcal pharyngitis"]', 1, 'Early HIV infection often mimics mono.'),
    (v_case_id, 'What is the best test to diagnose HIV in the "window period" (before antibodies develop)?', '["HIV Antibody test (ELISA)", "HIV Viral Load (RNA PCR)", "Western Blot", "CD4 count"]', 1, 'RNA PCR detects the virus itself and is positive much earlier than antibodies.'),
    (v_case_id, 'Which of the following is true regarding starting Antiretroviral Therapy (ART)?', '["Wait until CD4 < 350", "Wait until symptomatic", "Start ART as soon as possible regardless of CD4 count", "Only if the viral load is high"]', 2, 'Universal ART is the current standard of care.');

    -- CASE 04: HIV - Opportunistic Infections (PJP)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dyspnea and Dry Cough in a Patient with CD4 150', 'A 35-year-old male with HIV who is not on medication presents with 2 weeks of worsening dyspnea and a non-productive cough. CXR shows bilateral interstitial "ground-glass" opacities.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Tuberculosis", "Pneumocystis jirovecii Pneumonia (PJP)", "CMV Pneumonitis", "Bacterial Pneumonia"]', 1, 'Classic opportunistic infection when CD4 < 200.'),
    (v_case_id, 'What is the first-line treatment?', '["Azithromycin", "Trimethoprim-Sulfamethoxazole (TMP-SMX)", "Vancomycin", "Fluconazole"]', 1, 'Bactrim is the drug of choice for treatment and prophylaxis.'),
    (v_case_id, 'When should a patient with HIV start prophylaxis for PJP?', '["Always", "When CD4 < 200 cells/mm3", "When CD4 < 50", "Never"]', 1, 'Standard threshold for starting daily TMP-SMX.');

    -- CASE 05: HIV - Toxoplasmosis vs. CNS Lymphoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Ring-Enhancing Lesions on Brain MRI', 'A 40-year-old male with AIDS (CD4 count 45) presents with a new-onset seizure. Brain MRI shows multiple ring-enhancing lesions in the basal ganglia.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Cryptococcal Meningitis", "Cerebral Toxoplasmosis", "Primary CNS Lymphoma", "PML"]', 1, 'Multiple lesions in an AIDS patient are most commonly Toxoplasmosis.'),
    (v_case_id, 'What is the standard initial management if Toxoplasmosis is suspected?', '["Brain biopsy", "Empiric treatment with Pyrimethamine and Sulfadiazine", "Radiation therapy", "High-dose steroids only"]', 1, 'Clinical response to treatment is often used to confirm the diagnosis without biopsy.'),
    (v_case_id, 'If the patient fails to improve after 2 weeks of treatment and has a single large lesion, what should be considered?', '["CNS Lymphoma", "PML", "Stroke", "Toxoplasmosis is resistant"]', 0, 'CNS Lymphoma is the second most common cause and often presents with a single lesion; EBV DNA in CSF is a clue.');

    -- CASE 06: Tuberculosis (Screening and Latent)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Positive PPD in a Healthcare Worker', 'A 28-year-old nurse has a routine PPD skin test that shows 15 mm of induration. She has no symptoms (no cough, no fever, no weight loss) and her CXR is normal.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Active TB", "Latent TB Infection (LTBI)", "False positive", "Cured TB"]', 1, 'Positive screen + No symptoms + Normal CXR = Latent TB.'),
    (v_case_id, 'What is the risk of NOT treating LTBI?', '["No risk", "Progressive primary TB", "Reactivation TB (approx 10% lifetime risk)", "Transmission to others"]', 2, 'Latent TB is not infectious, but it can reactivate later in life.'),
    (v_case_id, 'What is a preferred treatment regimen for LTBI?', '["RIPE for 6 months", "Isoniazid for 9 months (or Rifampin for 4 months)", "No treatment needed", "Aspirin"]', 1, 'Monotherapy or short-course combination (like 3 months of INH + Rifapentine) is standard.');

    -- CASE 07: Infective Endocarditis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever and a New Murmur in an IV Drug User', 'A 30-year-old male with a history of IV heroin use presents with fever and chills. On exam, he has a new systolic murmur at the lower left sternal border that increases with inspiration. He has tiny, painless red spots on his palms.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely valve involved?', '["Mitral Valve", "Aortic Valve", "Tricuspid Valve", "Pulmonary Valve"]', 2, 'Right-sided endocarditis (Tricuspid) is classic in IV drug users; the murmur increasing with inspiration is Carvallo''s sign.'),
    (v_case_id, 'What are the painless red spots on his palms called?', '["Osler nodes", "Janeway lesions", "Splinter hemorrhages", "Roth spots"]', 1, 'Janeway = Painless/Embolic; Osler = Ouchy/Immunologic.'),
    (v_case_id, 'What is the most common causative organism in acute endocarditis in an IV drug user?', '["Streptococcus viridans", "Staphylococcus aureus", "Enterococcus", "Candida"]', 1, 'S. aureus is highly virulent and common in acute presentations.');

    -- CASE 08: Malaria
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cyclical Fevers after Travel to Africa', 'A 45-year-old male presents with high fever, chills, and profuse sweating that occur every 48 hours. He recently returned from a safari in Kenya. Labs show anemia and a high LDH.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the best test to diagnose malaria?', '["Blood culture", "Thick and thin blood smears", "Chest X-ray", "Viral PCR"]', 1, 'Thick smear is for screening; thin smear is for species identification.'),
    (v_case_id, 'Which species is associated with the most severe "Cerebral Malaria"?', '["Plasmodium vivax", "Plasmodium falciparum", "Plasmodium ovale", "Plasmodium malariae"]', 1, 'P. falciparum is the most dangerous species.'),
    (v_case_id, 'Which medication should be added for P. vivax or P. ovale to prevent relapse from liver stages (hypnozoites)?', '["Chloroquine", "Primaquine", "Quinine", "Doxycycline"]', 1, 'Primaquine clears the liver stages; must check for G6PD deficiency first.');

    -- CASE 09: Lyme Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bulls-eye Rash and Joint Pain', 'A 32-year-old female in Connecticut presents with a large "target-shaped" rash on her thigh and a swollen knee. She remembers a tick bite 2 weeks ago.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of the classic rash seen in early Lyme disease?', '["Erythema multiforme", "Erythema migrans", "Erythema marginatum", "Erythema nodosum"]', 1, 'The "bulls-eye" rash of stage 1 Lyme.'),
    (v_case_id, 'What is the causative organism and the vector?', '["Rickettsia; Wood tick", "Borrelia burgdorferi; Ixodes tick", "Leptospira; Rat", "Francisella; Deer"]', 1, 'Ixodes (Deer tick) carries the spirochete.'),
    (v_case_id, 'What is the first-line treatment for early Lyme disease?', '["Penicillin", "Doxycycline", "Ciprofloxacin", "Azithromycin"]', 1, 'Doxycycline is highly effective; Amoxicillin is used in children and pregnant women.');

    -- CASE 10: Syphilis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Painless Ulcer on the Genitals', 'A 28-year-old male presents with a single, painless, firm-based ulcer on his penis. He has no fever.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What stage of syphilis is this?', '["Primary", "Secondary", "Tertiary", "Latent"]', 0, 'Primary syphilis is characterized by the painless chancre.'),
    (v_case_id, 'What is the screening test for syphilis?', '["RPR or VDRL", "FTA-ABS", "Gram stain", "Culture"]', 0, 'Non-treponemal tests (RPR/VDRL) are for screening; treponemal tests (FTA-ABS) are for confirmation.'),
    (v_case_id, 'What is the treatment of choice for primary, secondary, and early latent syphilis?', '["Doxycycline for 30 days", "A single IM injection of Benzathine Penicillin G", "Ceftriaxone", "Azithromycin"]', 1, 'Penicillin is still the gold standard.');

    -- CASE 11: C. Difficile (Prevention and Treatment)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Watery Diarrhea in a Nursing Home', 'A 75-year-old female presents with 10 episodes of watery diarrhea a day and abdominal cramping. She was recently treated for a UTI with Ciprofloxacin.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the best test to confirm the diagnosis?', '["Stool culture", "Stool C. diff toxin PCR or enzyme immunoassay", "Colonoscopy", "Blood culture"]', 1, 'Directly detects the toxin or the gene producing it.'),
    (v_case_id, 'What infection control measure is MANDATORY for C. diff?', '["Hand sanitizer only", "Hand washing with soap and water and contact precautions", "Surgical mask", "Negative pressure room"]', 1, 'Alcohol-based sanitizers do NOT kill C. diff spores.'),
    (v_case_id, 'What is the treatment for a first RECURRENCE of C. diff?', '["Same as initial treatment", "Fidaxomicin or a pulsed Vancomycin taper", "Fecal Microbiota Transplant (FMT) immediately", "Metronidazole"]', 1, 'Vancomycin taper or switching to Fidaxomicin is preferred for the first recurrence.');

    -- CASE 12: Osteomyelitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Chronic Foot Wound and Bone Pain', 'A 60-year-old diabetic male has a non-healing ulcer on his great toe. He can "probe to bone" with a sterile instrument. His ESR and CRP are markedly elevated.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most sensitive imaging test for early osteomyelitis?', '["Plain X-ray", "Bone scan", "MRI", "CT scan"]', 2, 'MRI is superior for detecting marrow edema and early changes.'),
    (v_case_id, 'What is the gold standard for identifying the causative organism?', '["Wound swab", "Blood culture", "Bone biopsy and culture", "C-reactive protein"]', 2, 'Surface swabs are often contaminated with skin flora and do not reflect the deep bone infection.'),
    (v_case_id, 'What is the #1 causative organism of osteomyelitis in almost all populations?', '["Pseudomonas", "Staphylococcus aureus", "Salmonella", "Streptococcus"]', 1, 'S. aureus is the most common overall.');

    -- CASE 13: Cryptococcal Meningitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Subacute Headache in an AIDS Patient', 'A 40-year-old male with AIDS (CD4 30) presents with a dull headache for 2 weeks. He has no neck stiffness. Lumbar puncture shows a high opening pressure (30 cm H2O).', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Bacterial meningitis", "Cryptococcal Meningitis", "Toxoplasmosis", "PML"]', 1, 'Classic subacute presentation in severely immunocompromised patients.'),
    (v_case_id, 'What rapid test of the CSF is highly specific?', '["Gram stain", "Cryptococcal Antigen (CrAg) test", "India ink stain", "PCR for EBV"]', 1, 'CrAg is the most sensitive and specific; India ink is classic but less sensitive.'),
    (v_case_id, 'What is the induction treatment for Cryptococcal meningitis?', '["Fluconazole", "Amphotericin B and Flucytosine", "Vancomycin", "Acyclovir"]', 1, 'Requires potent induction followed by long-term maintenance with fluconazole.');

    -- CASE 14: Cytomegalovirus (CMV) Retinitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, '"Floaters" and Blurry Vision in AIDS', 'A 45-year-old male with AIDS (CD4 count 10) complains of "black spots" in his vision and blurry sight in one eye. Fundoscopy shows "pizza-pie" hemorrhages and exudates on the retina.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Cataracts", "CMV Retinitis", "Toxoplasmosis", "Syphilis"]', 1, 'Occurs almost exclusively when CD4 < 50.'),
    (v_case_id, 'What is the main risk of untreated CMV retinitis?', '["Glaucoma", "Permanent blindness/Retinal detachment", "Stye", "None"]', 1, 'It is a vision-threatening emergency.'),
    (v_case_id, 'What is the first-line treatment?', '["Acyclovir", "Ganciclovir or Valganciclovir", "Fluconazole", "Azithromycin"]', 1, 'Ganciclovir is the drug of choice for CMV.');

    -- CASE 15: Histoplasmosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pneumonia after Exploring a Cave', 'A 30-year-old male in the Ohio River Valley presents with fever and cough after a weekend of "spelunking" (exploring caves). CXR shows hilar lymphadenopathy and small nodules.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely causative organism?', '["Blastomyces", "Histoplasma capsulatum", "Coccidioides", "Aspergillus"]', 1, 'Associated with bird/bat droppings and the Mississippi/Ohio River valleys.'),
    (v_case_id, 'How is Histoplasmosis often diagnosed in severe/disseminated cases?', '["Blood culture", "Urinary Antigen Test", "Sputum Gram stain", "Skin test"]', 1, 'Urine antigen is fast and sensitive for disseminated disease.'),
    (v_case_id, 'What is the histology of Histoplasma?', '["Broad-based budding yeast", "Small yeasts within macrophages", "Spherules filled with endospores", "Hyphae with 45-degree branching"]', 1, 'Classic finding: tiny yeasts inside monocytes/macrophages.');

    -- CASE 16: Coccidioidomycosis ("Valley Fever")
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever and Joint Pain after a Dust Storm', 'A 40-year-old female living in Phoenix, Arizona, presents with a cough, fever, and painful red bumps on her shins (erythema nodosum) following a major dust storm.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Histoplasmosis", "Coccidioidomycosis", "Blastomycosis", "Sarcoidosis"]', 1, 'Endemic to the Southwestern US (California/Arizona).'),
    (v_case_id, 'What is the characteristic histological finding?', '["Yeasts in macrophages", "Large spherules filled with endospores", "Pseudohyphae", "Broad-based budding"]', 1, 'Spherules are much larger than the surrounding RBCs.'),
    (v_case_id, 'What is a common extrapulmonary manifestation seen in "Valley Fever"?', '["Meningitis", "Liver failure", "Kidney stones", "None"]', 0, 'Dissemination to the meninges is a serious complication.');

    -- CASE 17: Giardiasis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, '"Foul-smelling" Steatorrhea after Hiking', 'A 25-year-old hiker presents with 1 week of bloating, flatulence, and "greasy, foul-smelling" diarrhea. He drank water from a mountain stream.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely causative organism?', '["Entamoeba histolytica", "Giardia lamblia", "Cryptosporidium", "Salmonella"]', 1, 'Classic "Backpacker''s diarrhea."'),
    (v_case_id, 'What is the mechanism of the diarrhea?', '["Invasion of the mucosa", "Trophozoites adhere to the small bowel wall, causing malabsorption", "Toxin production", "None"]', 1, 'Causes a "carpet" on the villi, leading to fat malabsorption (steatorrhea).'),
    (v_case_id, 'What is the first-line treatment?', '["Azithromycin", "Metronidazole (or Tinidazole)", "Ciprofloxacin", "Albendazole"]', 1, 'Standard treatment for Giardia.');

    -- CASE 18: Amebiasis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bloody Diarrhea and a Liver Mass', 'A 35-year-old male returns from a trip to Mexico with bloody diarrhea and right upper quadrant pain. Ultrasound shows a single large "anchovy paste" abscess in the liver.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely organism?', '["Giardia", "Entamoeba histolytica", "E. coli", "Echinococcus"]', 1, 'Causes "Flask-shaped" colonic ulcers and liver abscesses.'),
    (v_case_id, 'How is the liver abscess usually managed?', '["Surgical drainage", "Metronidazole followed by a luminal agent (e.g., Paromomycin)", "Antibiotics only", "Wait and see"]', 1, 'Surgical drainage is rarely needed; medical therapy is very effective.'),
    (v_case_id, 'What is the finding on stool microscopy?', '["Cysts with 4 nuclei or Trophozoites with ingested RBCs", "Pear-shaped organisms", "Acid-fast oocysts", "None"]', 0, 'Ingested RBCs (erythrophagocytosis) is specific for E. histolytica.');

    -- CASE 19: Pyelonephritis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever and Flank Pain', 'A 28-year-old female presents with a high fever, nausea, and severe pain in her right flank. On exam, she has "CVA tenderness" on the right side.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Cystitis", "Acute Pyelonephritis", "Kidney stone", "Appendicitis"]', 1, 'Upper urinary tract infection.'),
    (v_case_id, 'What finding on urinalysis is highly suggestive of pyelonephritis?', '["Bacteria", "White Blood Cell (WBC) Casts", "Red Blood Cells", "Nitrites"]', 1, 'Casts form in the tubules, indicating the infection is in the kidney itself.'),
    (v_case_id, 'What is the most common causative organism?', '["Staph saprophyticus", "Escherichia coli", "Proteus", "Klebsiella"]', 1, 'E. coli is responsible for ~80% of UTIs.');

    -- CASE 20: Cellulitis vs. Abscess
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Red, Hot, and Swollen Leg', 'A 50-year-old male presents with a red, warm, and tender area on his lower leg that has been spreading for 2 days. He has a fever of 101\u00b0F. The area is flat and non-fluctuant.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["DVT", "Cellulitis", "Abscess", "Necrotizing Fasciitis"]', 1, 'Non-purulent skin infection.'),
    (v_case_id, 'What is the most common organism for NON-PURULENT cellulitis?', '["Staph aureus (MRSA)", "Beta-hemolytic Streptococci (e.g., S. pyogenes)", "Pseudomonas", "E. coli"]', 1, 'Strep species are the primary cause of spreading cellulitis without an abscess.'),
    (v_case_id, 'If the area were fluctuant (contained pus), what would be the priority?', '["Antibiotics only", "Incision and Drainage (I&D)", "Warm compresses only", "Elevate the leg"]', 1, 'For an abscess, drainage is the most important treatment.');

    -- CASE 21: Necrotizing Fasciitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, '"Pain out of Proportion" and Crepitus', 'A 45-year-old diabetic male presents with a red area on his leg. He is in excruciating pain, much worse than the skin looks. On exam, you feel a "crackling" sensation (crepitus) under the skin and his BP is dropping.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Cellulitis", "Necrotizing Fasciitis", "DVT", "Abscess"]', 1, 'A surgical emergency.'),
    (v_case_id, 'What is the most important initial management step?', '["IV antibiotics only", "Immediate Surgical Debridement", "MRI to confirm", "Hyperbaric oxygen"]', 1, 'Antibiotics alone cannot reach the necrotic tissue; surgery is life-saving.'),
    (v_case_id, 'What radiographic finding is classic but not always present?', '["Bone destruction", "Gas in the soft tissues", "Fluid collection", "None"]', 1, 'Represents gas-forming organisms like Clostridia or mixed anaerobes.');

    -- CASE 22: Infectious Mononucleosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sore Throat, Fatigue, and a Large Spleen', 'A 19-year-old student presents with a severe sore throat, high fever, and massive lymphadenopathy. On exam, he has a palpable spleen and an exudative pharyngitis. A "Monospot" test is positive.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative agent?', '["HIV", "Epstein-Barr Virus (EBV)", "CMV", "Strep pyogenes"]', 1, 'EBV infects B-cells.'),
    (v_case_id, 'What recommendation is critical for this patient regarding physical activity?', '["Avoid exercise for 1 week", "Avoid contact sports for 4 weeks due to risk of splenic rupture", "Complete bed rest for 1 month", "No restrictions"]', 1, 'Splenomegaly makes the spleen vulnerable to trauma.'),
    (v_case_id, 'What happens if this patient is accidentally given Amoxicillin?', '["The sore throat gets better", "A diffuse maculopapular rash develops", "Seizures", "None"]', 1, 'A classic (but not allergic) drug reaction in EBV patients.');

    -- CASE 23: Influenza
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Fever, Myalgias, and Cough in Winter', 'A 35-year-old male presents with a 103\u00b0F fever, severe muscle aches, and a dry cough that started "like a ton of bricks" yesterday. Several coworkers have similar symptoms.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Common cold", "Influenza", "Pneumonia", "Meningitis"]', 1, 'Sudden onset + systemic symptoms (myalgia/fever) + seasonality.'),
    (v_case_id, 'What is the mechanism of Oseltamivir (Tamiflu)?', '["DNA polymerase inhibitor", "Neuraminidase inhibitor", "RNA polymerase inhibitor", "Protease inhibitor"]', 1, 'Prevents the release of new viral particles from the host cell.'),
    (v_case_id, 'A 70-year-old patient with Flu improves for 3 days, then develops a new fever and productive cough. What should you suspect?', '["Viral relapse", "Secondary Bacterial Pneumonia (e.g., S. aureus or S. pneumo)", "Heart failure", "PE"]', 1, 'Common and deadly complication of flu in the elderly.');

    -- CASE 24: Herpes Simplex Virus (Encephalitis)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever, Altered Mental Status, and Seizures', 'A 50-year-old male presents with sudden confusion and a seizure. MRI shows hemorrhage and edema localized to the TEMPORAL LOBES. Lumbar puncture shows many RBCs and WBCs.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely causative agent?', '["HSV-1", "HSV-2", "VZV", "CMV"]', 0, 'HSV-1 is the leading cause of sporadic fatal encephalitis in the US.'),
    (v_case_id, 'What is the characteristic location of involvement on imaging?', '["Frontal lobes", "Temporal lobes", "Cerebellum", "Brainstem"]', 1, 'Classic for HSV encephalitis.'),
    (v_case_id, 'What is the gold standard diagnostic test of the CSF?', '["Culture", "HSV PCR", "Gram stain", "India ink"]', 1, 'PCR is highly sensitive and has replaced brain biopsy.'),
    (v_case_id, 'What is the immediate treatment?', '["Vancomycin", "IV Acyclovir", "Ganciclovir", "Steroids only"]', 1, 'Must be started empirically if encephalitis is suspected.');

    -- CASE 25: Syphilis (Tertiary)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Argyll Robertson Pupil and Wide-based Gait', 'A 60-year-old male with a history of untreated STIs presents with a "slapping" gait and loss of vibration sense. On exam, his pupils constrict when focusing on a near object but NOT when exposed to light.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the eye finding called?', '["Adie pupil", "Argyll Robertson pupil", "Horner syndrome", "Marcus Gunn pupil"]', 1, 'The "prostitute''s pupil" - accommodates but does not react to light.'),
    (v_case_id, 'What is the name for the neuro-spinal involvement?', '["Meningitis", "Tabes Dorsalis", "PML", "Transverse myelitis"]', 1, 'Demyelination of the dorsal columns.'),
    (v_case_id, 'What is the treatment for neurosyphilis?', '["IM Benzathine Penicillin G", "IV Penicillin G for 10-14 days", "Doxycycline", "Azithromycin"]', 1, 'Requires high-dose IV penicillin to cross the blood-brain barrier.');

    -- CASE 26: Rocky Mountain Spotted Fever (RMSF)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever and Rash on Wrists and Ankles', 'A 10-year-old boy returns from summer camp in North Carolina with high fever and a headache. Three days later, he develops a rash that started on his wrists and ankles and is now spreading to his palms, soles, and trunk.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative organism?', '["Borrelia", "Rickettsia rickettsii", "Ehrlichia", "Francisella"]', 1, 'An obligate intracellular bacterium.'),
    (v_case_id, 'What is the primary treatment for RMSF?', '["Amoxicillin", "Doxycycline", "Ciprofloxacin", "Azithromycin"]', 1, 'Doxycycline is used in ALL ages for RMSF because the risk of death outweighs the risk of tooth staining in children.'),
    (v_case_id, 'What is the classic progression of the rash?', '["Trunk to extremities", "Extremities (wrists/ankles) to trunk", "Face to body", "None"]', 1, 'Centripetal spread.');

    -- CASE 27: Legionella (Pontiac Fever vs. Legionnaires'')
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Self-limiting Fever after a Conference', 'Several people attending a hotel conference develop a self-limiting illness with fever, headache, and muscle aches. They have NO cough and NO pneumonia on CXR. All symptoms resolve in 3 days.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Legionnaires'' Disease", "Pontiac Fever", "Influenza", "Food poisoning"]', 1, 'The milder, non-pneumonic form of Legionella infection.'),
    (v_case_id, 'What is the treatment for Pontiac Fever?', '["Azithromycin", "Symptomatic treatment only", "Levofloxacin", "Rifampin"]', 1, 'Unlike Legionnaires'' disease, Pontiac fever does not require antibiotics.'),
    (v_case_id, 'Legionella is a:', '["Gram-positive coccus", "Gram-negative rod that stains poorly", "Acid-fast bacillus", "Spirochete"]', 1, 'Requires silver stain or charcoal agar for culture.');

    -- CASE 28: Cat Scratch Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Axillary Lymphadenopathy after a Scratch', 'A 12-year-old girl presents with a large, tender lump in her armpit. She has a small, healing papule on her forearm. She recently got a new kitten.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the causative organism?', '["Pasteurella multocida", "Bartonella henselae", "Toxoplasma", "Francisella"]', 1, 'Pasteurella is associated with cat BITES (acute infection); Bartonella is cat SCRATCH (lymphadenopathy).'),
    (v_case_id, 'What is the typical management of cat scratch disease in an immunocompetent patient?', '["IV antibiotics", "Usually self-limiting; Azithromycin can speed recovery", "Surgical excision", "Observation only"]', 1, 'Most cases resolve on their own, but Azithromycin is often used for severe lymphadenopathy.'),
    (v_case_id, 'In an AIDS patient, Bartonella causes which condition?', '["Meningitis", "Bacillary Angiomatosis", "Pneumonia", "None"]', 1, 'Red, vascular skin lesions that mimic Kaposi sarcoma.');

    -- CASE 29: Leptospirosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Jaundice and Kidney Failure after Swimming in a Pond', 'A 30-year-old male in Hawaii presents with fever, red eyes (conjunctival suffusion), jaundice, and AKI after swimming in a freshwater pond contaminated with animal urine.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Hepatitis A", "Leptospirosis (Weil Disease)", "Dengue Fever", "Malaria"]', 1, 'Weil disease is the severe triad of jaundice, renal failure, and hemorrhage.'),
    (v_case_id, 'How is Leptospira typically acquired?', '["Person-to-person", "Contact with water/soil contaminated with animal urine (rats, dogs)", "Tick bite", "Mosquito bite"]', 1, 'Spirochetes enter through skin abrasions or mucous membranes.'),
    (v_case_id, 'What is a characteristic physical exam finding?', '["Petechiae", "Conjunctival suffusion (redness without pus)", "Spleen mass", "None"]', 1, 'A very helpful clue.');

    -- CASE 30: Strongyloides Stercoralis (Hyperinfection)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Gram-negative Sepsis in an Immunosuppressed Patient', 'A patient from Southeast Asia is started on high-dose steroids for a transplant. He soon develops polymicrobial gram-negative sepsis and diffuse pulmonary infiltrates. Stool shows rhabditiform larvae.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Schistosomiasis", "Strongyloides Hyperinfection Syndrome", "Ascariasis", "Hookworm"]', 1, 'Steroids trigger a massive increase in the worm burden.'),
    (v_case_id, 'Why does this lead to gram-negative sepsis?', '["The worm produces toxins", "Larvae carry gut bacteria with them as they migrate through the bowel wall", "Immunosuppression alone", "None"]', 1, 'The "autoinfection" cycle allows larvae to penetrate the colon and carry enteric flora into the blood.'),
    (v_case_id, 'What is the treatment of choice?', '["Mebendazole", "Ivermectin", "Praziquantel", "Metronidazole"]', 1, 'Ivermectin is highly effective against Strongyloides.');

    RAISE NOTICE 'SUCCESS: Infectious Disease Case Blocks (1-30) registered.';
END $$;

COMMIT;
