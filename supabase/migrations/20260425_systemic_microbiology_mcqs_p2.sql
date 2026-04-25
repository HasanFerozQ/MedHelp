-- Migration: Year 2 - Systemic Microbiology MCQ Bank (PART 2: 71-140)
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
        'A 19-year-old college student presents with a sore throat, fever, and generalized lymphadenopathy. A peripheral blood smear shows atypical lymphocytes (Downey cells). The patient is mistakenly given Ampicillin and develops a diffuse maculopapular rash. What is the mechanism of the virus entering the host cells?',
        'A patient with a history of kidney transplantation presents with blurry vision and floaters. Fundoscopy reveals "pizza-pie" retinitis (hemorrhage and cotton-wool spots). What is the first-line treatment for this viral infection?',
        'Which DNA virus is characterized by a "partially double-stranded circular DNA" and utilizes a reverse transcriptase step in its replication cycle?',
        'An infant presents with a "slapped-cheek" rash and a lacy, reticular rash on the body. If the mother is pregnant and becomes infected, what is the most feared fetal complication?',
        'A 30-year-old male presents with painful, vesicular lesions on his penis. Tzanck smear shows multinucleated giant cells. Which of the following is TRUE regarding the latency of this virus?',
        'A patient with a CD4 count of 30 presents with progressive neurological deficits and multiple non-enhancing white matter lesions on MRI. This is caused by the reactivation of which virus?',
        'Which DNA virus is the only one that replicates entirely in the cytoplasm because it carries its own DNA-dependent RNA polymerase?',
        'A 6-year-old child presents with multiple small, flesh-colored, umbilicated papules on the trunk. Biopsy shows "Guarnieri bodies" (intracytoplasmic inclusions). Diagnosis?',
        'Which HPV types are most strongly associated with cervical carcinoma and produce E6/E7 oncoproteins that inhibit p53 and Rb?',
        'A child presents with "pink eye" (conjunctivitis) and a sore throat after a swimming pool party. The most likely viral cause is:',
        'A patient develops a painful, unilateral vesicular rash in a dermatomal distribution. What is the most common long-term complication of this condition?',
        'Which HHV is responsible for Kaposi Sarcoma in AIDS patients, presenting as dark purple, vascular skin plaques?',
        'A 2-year-old boy has a high fever for 4 days, which suddenly disappears, followed by a maculopapular rash on his trunk. This is Roseola Infantum. Which virus is responsible?',
        'Which DNA virus is associated with "Councilman bodies" (apoptotic hepatocytes) and "Ground-glass" hepatocytes on histology?',
        'What is the function of the Viral Tegument in Herpesviruses?',
        'A 70-year-old man presents with fever, dry cough, and severe myalgias during winter. The virus has a segmented RNA genome. What is the significance of the "HA" (Hemagglutinin) protein?',
        '"Antigenic Shift" in Influenza A results in pandemics and is caused by:',
        'A child presents with a "barking" cough and inspiratory stridor (Croup). X-ray shows a "steeple sign." What is the most likely viral cause?',
        'An unvaccinated child presents with cough, coryza, conjunctivitis, and small white spots on his buccal mucosa (Koplik spots). What is a rare, fatal late complication of this infection?',
        'A teenage boy presents with painful swelling of the parotid glands and orchitis (testicular inflammation). Which virus is responsible?',
        'A newborn has cataracts, sensorineural deafness, and a "blueberry muffin" rash. The mother had a mild rash and lymphadenopathy during the first trimester. Diagnosis?',
        'Which RNA virus is the most common cause of fatal diarrhea in infants worldwide and has a segmented dsRNA genome?',
        'A cruise ship passenger develops explosive watery diarrhea and vomiting. The virus is a naked, positive-sense RNA virus. It is:',
        'A 25-year-old male with a history of travel to the Caribbean presents with high fever, severe joint/bone pain ("breakbone fever"), and a rash. Diagnosis?',
        'What is the most serious complication of Dengue Fever upon secondary infection with a different serotype?',
        'Which virus is transmitted by the bite of an infected dog or bat and shows "Negri bodies" in the Purkinje cells of the cerebellum?',
        'A patient presents with sudden onset of high fever, black emesis (vomito negro), and jaundice. He recently traveled to Africa. Diagnosis?',
        'Which RNA virus replicates its genome using a "negative-sense RNA template" and carries its own RNA-dependent RNA polymerase in the virion?',
        'A child presents with asymmetrical flaccid paralysis and lost deep tendon reflexes. He has a history of a self-limited febrile illness 2 weeks ago. Which cells are targeted by the virus?',
        'Which virus is the leading cause of bronchiolitis and pneumonia in infants under 1 year of age?',
        'A patient presents with "herpangina" (vesicles on the soft palate and uvula) and a rash on the palms and soles. The virus is:',
        'What is the primary cause of the "common cold" and why is there no vaccine?',
        'Which virus is associated with "Councilman bodies" and is transmitted via the fecal-oral route, typically causing an acute, self-limiting hepatitis?',
        'Hepatitis E is particularly dangerous (high mortality rate) in which population?',
        'Which virus is the most common cause of sporadic, fatal encephalitis in the US, often localized to the temporal lobes?',
        'A patient has the following serology: HBsAg (-), Anti-HBs (+), Anti-HBc (IgG) (+). What is the status?',
        'Which Hepatitis virus requires the HBsAg coat from HBV to become infectious?',
        'What is the primary reason why Hepatitis C virus (HCV) has high antigenic variation and frequently leads to chronic infection?',
        'Which of the following is the "window period" in HBV infection?',
        'HIV gp120 binds to the CD4 receptor and which co-receptor for entry into macrophages early in the infection?',
        'A mutation in which host gene provides resistance to HIV infection in certain individuals?',
        'What is the function of the HIV "pol" gene?',
        'A patient on HAART develops kidney stones. Which protease inhibitor is the most likely cause?',
        'Which HIV drug class works by preventing the viral DNA from being incorporated into the host cell chromosome?',
        'A patient with HIV has a CD4 count of 150. Which opportunistic infection requires primary prophylaxis at this level?',
        'What is the screening test for HIV, and what is the confirmatory test?',
        'Which Hepatitis virus is the most common cause of post-transfusion hepatitis (historically) and often leads to cirrhosis/HCC?',
        '"HBeAg" in a patient''s serum indicates:',
        'A patient with chronic HCV is treated with Interferon-alpha. What is a common side effect?',
        'What is the mechanism of action of Zidovudine (AZT)?',
        'Which Pattern Recognition Receptor (PRR) is located on the plasma membrane and specifically recognizes bacterial Lipopolysaccharide (LPS)?',
        'Which cytokine is the primary mediator of the acute phase response, inducing the liver to produce C-reactive protein (CRP)?',
        'What is the role of the "Inflammasome" in the innate immune response?',
        'Which complement component is a potent chemoattractant that recruits neutrophils to the site of infection?',
        'A patient with recurrent pyogenic infections is found to have a deficiency in C3. Which function of the complement system is most severely impaired?',
        'What is the mechanism by which Natural Killer (NK) cells identify host cells that should be killed?',
        'Which enzyme is responsible for the "Respiratory Burst" in neutrophils, producing reactive oxygen species to kill bacteria?',
        'In Chronic Granulomatous Disease, patients are particularly susceptible to which type of organisms?',
        'Which cytokine is produced by Macrophages and acts as the primary signal to induce Th1 differentiation and IFN-gamma production by T-cells?',
        'What is the function of "Defensins" in the innate immune system?',
        'Which pathway of complement activation is initiated by the binding of mannose-binding lectin to carbohydrates on the microbial surface?',
        'What is the role of "Factor H" and "Factor I" in the complement system?',
        'A patient has hereditary angioedema. This is due to a deficiency in:',
        '"Extravasation" (leukocyte migration into tissue) involves which sequence of interactions?',
        'Which innate cell type is the first to arrive at a site of acute inflammation?',
        'What is the primary function of Interferon-alpha and Interferon-beta?',
        'Which molecule acts as a "bridge" between the innate and adaptive immune systems by presenting processed antigen to T-cells?',
        'MHC Class II molecules are expressed exclusively on:',
        'Which organ is responsible for the removal of opsonized bacteria from the blood, making its absence dangerous for splenectomized patients?',
        'Which toll-like receptor recognizes unmethylated CpG DNA motifs common in bacteria and viruses?'
    );

    -- SECTION 6: DNA VIRUSES (71-85)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A 19-year-old college student presents with a sore throat, fever, and generalized lymphadenopathy. A peripheral blood smear shows atypical lymphocytes (Downey cells). The patient is mistakenly given Ampicillin and develops a diffuse maculopapular rash. What is the mechanism of the virus entering the host cells?', '["Binding to CD4 receptor", "Binding to CD21 (CR2) on B-cells", "Binding to ICAM-1", "Binding to Acetylcholine receptor"]', 1, 'EBV infects B-cells via the CD21 receptor. The Ampicillin rash is a classic (non-allergic) reaction seen in patients with infectious mononucleosis.'),
    (v_topic_id, 'A patient with a history of kidney transplantation presents with blurry vision and floaters. Fundoscopy reveals "pizza-pie" retinitis (hemorrhage and cotton-wool spots). What is the first-line treatment for this viral infection?', '["Acyclovir", "Ganciclovir", "Oseltamivir", "Ribavirin"]', 1, 'CMV retinitis is treated with Ganciclovir (or Foscarnet/Cidofovir). Acyclovir is ineffective because CMV lacks the viral thymidine kinase.'),
    (v_topic_id, 'Which DNA virus is characterized by a "partially double-stranded circular DNA" and utilizes a reverse transcriptase step in its replication cycle?', '["Herpes simplex virus", "Hepatitis B virus", "Adenovirus", "Papillomavirus"]', 1, 'HBV (Hepadnavirus) is unique among DNA viruses for using reverse transcriptase to replicate its genome from an RNA intermediate.'),
    (v_topic_id, 'An infant presents with a "slapped-cheek" rash and a lacy, reticular rash on the body. If the mother is pregnant and becomes infected, what is the most feared fetal complication?', '["Congenital cataracts", "Hydrops fetalis", "Microcephaly", "Neonatal herpes"]', 1, 'Parvovirus B19 infects erythroid precursor cells, causing aplastic crisis in patients with high RBC turnover and hydrops fetalis (severe fetal anemia) in pregnancy.'),
    (v_topic_id, 'A 30-year-old male presents with painful, vesicular lesions on his penis. Tzanck smear shows multinucleated giant cells. Which of the following is TRUE regarding the latency of this virus?', '["It remains latent in the sacral ganglia", "It remains latent in the trigeminal ganglia", "It remains latent in B-lymphocytes", "It remains latent in macrophages"]', 0, 'HSV-2 typically establishes latency in the sacral ganglia, while HSV-1 stays in the trigeminal ganglia.'),
    (v_topic_id, 'A patient with a CD4 count of 30 presents with progressive neurological deficits and multiple non-enhancing white matter lesions on MRI. This is caused by the reactivation of which virus?', '["HSV-1", "JC virus", "HHV-8", "BK virus"]', 1, 'Progressive Multifocal Leukoencephalopathy (PML) is caused by the JC polyomavirus infecting oligodendrocytes in immunocompromised patients.'),
    (v_topic_id, 'Which DNA virus is the only one that replicates entirely in the cytoplasm because it carries its own DNA-dependent RNA polymerase?', '["Herpesvirus", "Poxvirus", "Hepadnavirus", "Adenovirus"]', 1, 'Poxviruses (like Variola and Molluscum contagiosum) are the largest viruses and carry all necessary replication machinery in their core.'),
    (v_topic_id, 'A 6-year-old child presents with multiple small, flesh-colored, umbilicated papules on the trunk. Biopsy shows "Guarnieri bodies" (intracytoplasmic inclusions). Diagnosis?', '["Chickenpox", "Molluscum contagiosum", "Verruca vulgaris", "Roseola"]', 1, 'Molluscum contagiosum is caused by a Poxvirus. Umbilicated papules are characteristic.'),
    (v_topic_id, 'Which HPV types are most strongly associated with cervical carcinoma and produce E6/E7 oncoproteins that inhibit p53 and Rb?', '["HPV 1 and 2", "HPV 6 and 11", "HPV 16 and 18", "HPV 31 and 33"]', 2, 'HPV 16 and 18 are high-risk types. 6 and 11 cause genital warts (Condyloma acuminata).'),
    (v_topic_id, 'A child presents with "pink eye" (conjunctivitis) and a sore throat after a swimming pool party. The most likely viral cause is:', '["Rhinovirus", "Adenovirus", "Herpes simplex", "Coxsackievirus"]', 1, 'Adenovirus is a common cause of pharyngoconjunctival fever, often associated with swimming pools.'),
    (v_topic_id, 'A patient develops a painful, unilateral vesicular rash in a dermatomal distribution. What is the most common long-term complication of this condition?', '["Encephalitis", "Post-herpetic neuralgia", "Bacterial superinfection", "Guillain-Barre Syndrome"]', 1, 'Shingles (VZV reactivation) often leads to persistent pain (post-herpetic neuralgia) in the affected dermatome.'),
    (v_topic_id, 'Which HHV is responsible for Kaposi Sarcoma in AIDS patients, presenting as dark purple, vascular skin plaques?', '["HHV-4 (EBV)", "HHV-5 (CMV)", "HHV-6", "HHV-8"]', 3, 'HHV-8 (KSHV) causes Kaposi Sarcoma, Primary Effusion Lymphoma, and Multicentric Castleman Disease.'),
    (v_topic_id, 'A 2-year-old boy has a high fever for 4 days, which suddenly disappears, followed by a maculopapular rash on his trunk. This is Roseola Infantum. Which virus is responsible?', '["HHV-6", "Measles virus", "Rubella virus", "Parvovirus B19"]', 0, 'HHV-6 (Roseola/Exanthem Subitum) is the "6th disease" and follows the "fever then rash" pattern.'),
    (v_topic_id, 'Which DNA virus is associated with "Councilman bodies" (apoptotic hepatocytes) and "Ground-glass" hepatocytes on histology?', '["HAV", "HBV", "HCV", "HDV"]', 1, 'Ground-glass hepatocytes (accumulation of HBsAg) are pathognomonic for chronic Hepatitis B.'),
    (v_topic_id, 'What is the function of the Viral Tegument in Herpesviruses?', '["Protective outer shell", "Space between envelope and capsid containing regulatory proteins", "Enzyme for DNA replication", "Attachment protein for host cells"]', 1, 'The tegument contains proteins like VP16 and vhs that facilitate the initiation of the viral life cycle upon entry.');

    -- SECTION 7: RNA VIRUSES (86-105)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A 70-year-old man presents with fever, dry cough, and severe myalgias during winter. The virus has a segmented RNA genome. What is the significance of the "HA" (Hemagglutinin) protein?', '["It cleaves sialic acid to release new virions", "It binds to sialic acid receptors to initiate entry", "It acts as an ion channel", "It is responsible for antigenic drift"]', 1, 'HA is for entry (attachment). NA (Neuraminidase) is for exit (release). Both undergo drift and shift.'),
    (v_topic_id, '"Antigenic Shift" in Influenza A results in pandemics and is caused by:', '["Point mutations in HA or NA", "Reassortment of genomic segments between different strains", "Loss of the viral envelope", "Integration into the host chromosome"]', 1, 'Shift occurs when two different strains infect the same cell (e.g., in a pig) and swap segments. Drift is gradual point mutation.'),
    (v_topic_id, 'A child presents with a "barking" cough and inspiratory stridor (Croup). X-ray shows a "steeple sign." What is the most likely viral cause?', '["Respiratory Syncytial Virus (RSV)", "Parainfluenza virus", "Influenza A", "Measles virus"]', 1, 'Parainfluenza (Paramyxovirus) is the #1 cause of croup (Laryngotracheobronchitis).'),
    (v_topic_id, 'An unvaccinated child presents with cough, coryza, conjunctivitis, and small white spots on his buccal mucosa (Koplik spots). What is a rare, fatal late complication of this infection?', '["Subacute Sclerosing Panencephalitis (SSPE)", "Post-herpetic neuralgia", "Orchitis", "Hydrocephalus"]', 0, 'SSPE is a progressive neurological deterioration occurring years after Measles infection.'),
    (v_topic_id, 'A teenage boy presents with painful swelling of the parotid glands and orchitis (testicular inflammation). Which virus is responsible?', '["Measles", "Mumps", "Rubella", "Coxsackievirus"]', 1, 'Mumps (Paramyxovirus) "Makes your parotids and testes lumps."'),
    (v_topic_id, 'A newborn has cataracts, sensorineural deafness, and a "blueberry muffin" rash. The mother had a mild rash and lymphadenopathy during the first trimester. Diagnosis?', '["Congenital CMV", "Congenital Rubella Syndrome", "Congenital Toxoplasmosis", "Congenital Syphilis"]', 1, 'The classic Rubella triad: Heart (PDA/Pulmonary stenosis), Eyes (Cataracts), and Ears (Deafness).'),
    (v_topic_id, 'Which RNA virus is the most common cause of fatal diarrhea in infants worldwide and has a segmented dsRNA genome?', '["Norovirus", "Rotavirus", "Adenovirus", "Astrovirus"]', 1, 'Rotavirus (Reovirus) is double-stranded and segmented. Norovirus is more common in adults/outbreaks.'),
    (v_topic_id, 'A cruise ship passenger develops explosive watery diarrhea and vomiting. The virus is a naked, positive-sense RNA virus. It is:', '["Rotavirus", "Norovirus", "HAV", "Giardia"]', 1, 'Norovirus (Calicivirus) is the #1 cause of viral gastroenteritis outbreaks.'),
    (v_topic_id, 'A 25-year-old male with a history of travel to the Caribbean presents with high fever, severe joint/bone pain ("breakbone fever"), and a rash. Diagnosis?', '["Yellow Fever", "Dengue Fever", "Zika Virus", "Malaria"]', 1, 'Dengue (Flavivirus) is transmitted by Aedes mosquitoes and causes intense pain.'),
    (v_topic_id, 'What is the most serious complication of Dengue Fever upon secondary infection with a different serotype?', '["Encephalitis", "Dengue Hemorrhagic Fever / Shock Syndrome", "Chronic arthritis", "Microcephaly"]', 1, 'Antibody-dependent enhancement (ADE) leads to severe hemorrhagic fever upon reinfection.'),
    (v_topic_id, 'Which virus is transmitted by the bite of an infected dog or bat and shows "Negri bodies" in the Purkinje cells of the cerebellum?', '["Rabies virus", "West Nile virus", "Ebola virus", "Polio virus"]', 0, 'Rabies (Rhabdovirus) is bullet-shaped and travels retrograde to the CNS.'),
    (v_topic_id, 'A patient presents with sudden onset of high fever, black emesis (vomito negro), and jaundice. He recently traveled to Africa. Diagnosis?', '["Hepatitis A", "Yellow Fever", "Lassa Fever", "Leptospirosis"]', 1, 'Yellow Fever (Flavivirus) causes jaundice and GI hemorrhage.'),
    (v_topic_id, 'Which RNA virus replicates its genome using a "negative-sense RNA template" and carries its own RNA-dependent RNA polymerase in the virion?', '["Poliovirus", "Influenza virus", "HIV", "Rubella virus"]', 1, 'Negative-sense RNA viruses (like Orthomyxo, Paramyxo, Rhabdo, Filo, Arena, Bunya) must carry their own polymerase.'),
    (v_topic_id, 'A child presents with asymmetrical flaccid paralysis and lost deep tendon reflexes. He has a history of a self-limited febrile illness 2 weeks ago. Which cells are targeted by the virus?', '["Oligodendrocytes", "Anterior horn cells of the spinal cord", "Dorsal root ganglia", "Purkinje cells"]', 1, 'Poliovirus (Picornavirus) destroys the lower motor neurons in the anterior horn.'),
    (v_topic_id, 'Which virus is the leading cause of bronchiolitis and pneumonia in infants under 1 year of age?', '["Parainfluenza", "RSV", "Rhinovirus", "Influenza"]', 1, 'RSV (Respiratory Syncytial Virus) is the most common cause of lower respiratory tract infection in infants.'),
    (v_topic_id, 'A patient presents with "herpangina" (vesicles on the soft palate and uvula) and a rash on the palms and soles. The virus is:', '["HSV-1", "Coxsackievirus A", "Coxsackievirus B", "EBV"]', 1, 'Coxsackie A causes Hand-Foot-Mouth disease and herpangina. Coxsackie B causes pleurodynia and myocarditis.'),
    (v_topic_id, 'What is the primary cause of the "common cold" and why is there no vaccine?', '["Adenovirus; too many serotypes", "Rhinovirus; over 100 serotypes and acid-lability", "Coronavirus; rapid mutation", "RSV; no long-term immunity"]', 1, 'Rhinoviruses have massive antigenic diversity, making a vaccine impractical.'),
    (v_topic_id, 'Which virus is associated with "Councilman bodies" and is transmitted via the fecal-oral route, typically causing an acute, self-limiting hepatitis?', '["HAV", "HCV", "HEV", "Hepatitis G"]', 0, 'HAV (Picornavirus) is "A for Acute" and fecal-oral.'),
    (v_topic_id, 'Hepatitis E is particularly dangerous (high mortality rate) in which population?', '["Children", "Elderly", "Pregnant women", "HIV patients"]', 2, 'HEV in pregnancy can cause fulminant hepatic failure with ~20% mortality.'),
    (v_topic_id, 'Which virus is the most common cause of sporadic, fatal encephalitis in the US, often localized to the temporal lobes?', '["HSV-1", "VZV", "West Nile", "Rabies"]', 0, 'HSV-1 (DNA virus - out of section but high yield) is the classic answer here. For RNA, West Nile is common but less "fatal/localized".');

    -- SECTION 8: HEPATITIS & HIV (106-120)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'A patient has the following serology: HBsAg (-), Anti-HBs (+), Anti-HBc (IgG) (+). What is the status?', '["Acute HBV", "Chronic HBV (High infectivity)", "Recovered from natural infection", "Immunized with HBV vaccine"]', 2, 'Anti-HBc indicates exposure to the virus (not present in vaccines). Anti-HBs indicates immunity.'),
    (v_topic_id, 'Which Hepatitis virus requires the HBsAg coat from HBV to become infectious?', '["HAV", "HCV", "HDV", "HEV"]', 2, 'HDV (Delta virus) is a "defective" RNA virus that can only infect in the presence of HBV.'),
    (v_topic_id, 'What is the primary reason why Hepatitis C virus (HCV) has high antigenic variation and frequently leads to chronic infection?', '["It integrates into the host genome", "Lack of 3''-5'' exonuclease activity in its RNA polymerase", "It infects B-cells", "It produces a decoy antigen"]', 1, 'The RNA polymerase is "sloppy," leading to frequent mutations in the envelope proteins (hypervariable region).'),
    (v_topic_id, 'Which of the following is the "window period" in HBV infection?', '["HBsAg and HBeAg are positive", "Only Anti-HBc (IgM) is detectable", "Anti-HBs and Anti-HBc are both positive", "HBsAg and Anti-HBs are both positive"]', 1, 'During the window, HBsAg has disappeared but Anti-HBs hasn''t appeared yet. Only IgM anti-HBc is found.'),
    (v_topic_id, 'HIV gp120 binds to the CD4 receptor and which co-receptor for entry into macrophages early in the infection?', '["CXCR4", "CCR5", "CD21", "CD8"]', 1, 'Early (M-tropic) HIV uses CCR5. Late (T-mropic) uses CXCR4.'),
    (v_topic_id, 'A mutation in which host gene provides resistance to HIV infection in certain individuals?', '["CCR5-delta32", "CXCR4-beta", "HLA-B27", "CD4-alpha"]', 0, 'Homozygous CCR5-delta32 mutation prevents HIV entry.'),
    (v_topic_id, 'What is the function of the HIV "pol" gene?', '["Encodes capsid proteins (p24)", "Encodes Reverse Transcriptase, Integrase, and Protease", "Encodes envelope glycoproteins (gp120/41)", "Encodes regulatory proteins like Tat/Rev"]', 1, 'pol = polymerase/enzymes. gag = group antigens (capsid). env = envelope.'),
    (v_topic_id, 'A patient on HAART develops kidney stones. Which protease inhibitor is the most likely cause?', '["Zidovudine", "Indinavir", "Efavirenz", "Ritonavir"]', 1, 'Indinavir is known for causing nephrolithiasis.'),
    (v_topic_id, 'Which HIV drug class works by preventing the viral DNA from being incorporated into the host cell chromosome?', '["NRTI", "NNRTI", "Integrase Inhibitors", "Protease Inhibitors"]', 2, 'Integrase inhibitors (e.g., Raltegravir) block the "integration" step.'),
    (v_topic_id, 'A patient with HIV has a CD4 count of 150. Which opportunistic infection requires primary prophylaxis at this level?', '["Pneumocystis jirovecii", "Toxoplasma gondii", "Mycobacterium avium", "CMV"]', 0, 'PCP prophylaxis (TMP-SMX) starts when CD4 < 200. Toxoplasma starts at < 100.'),
    (v_topic_id, 'What is the screening test for HIV, and what is the confirmatory test?', '["ELISA (screening), Western Blot (confirmatory)", "PCR (screening), ELISA (confirmatory)", "Western Blot (screening), ELISA (confirmatory)", "Culture (screening), PCR (confirmatory)"]', 0, 'Traditional algorithm: ELISA (high sensitivity) followed by Western Blot (high specificity). Newer tests use 4th gen p24/Ab assays.'),
    (v_topic_id, 'Which Hepatitis virus is the most common cause of post-transfusion hepatitis (historically) and often leads to cirrhosis/HCC?', '["HAV", "HBV", "HCV", "HEV"]', 2, 'HCV is the most likely to become chronic (~80%).'),
    (v_topic_id, '"HBeAg" in a patient''s serum indicates:', '["Immunity to HBV", "Active viral replication and high infectivity", "Resolution of infection", "Carrier state without replication"]', 1, 'e antigen = "envelope/exit" = high replication.'),
    (v_topic_id, 'A patient with chronic HCV is treated with Interferon-alpha. What is a common side effect?', '["Nephrotoxicity", "Flu-like symptoms and depression", "Hyperglycemia", "Ototoxicity"]', 1, 'Interferon therapy is notoriously associated with significant neuropsychiatric side effects.'),
    (v_topic_id, 'What is the mechanism of action of Zidovudine (AZT)?', '["Non-nucleoside reverse transcriptase inhibition", "Nucleoside analog that causes chain termination", "Protease inhibition", "Fusion inhibition"]', 1, 'AZT is an NRTI; it lacks a 3''-OH group, halting DNA synthesis.');

    -- SECTION 9: ADVANCED IMMUNOLOGY - INNATE (121-140) (Parham Focus)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'Which Pattern Recognition Receptor (PRR) is located on the plasma membrane and specifically recognizes bacterial Lipopolysaccharide (LPS)?', '["TLR3", "TLR4", "TLR5", "TLR9"]', 1, 'TLR4 = LPS. TLR3 = dsRNA. TLR5 = Flagellin. TLR9 = Unmethylated CpG DNA.'),
    (v_topic_id, 'Which cytokine is the primary mediator of the acute phase response, inducing the liver to produce C-reactive protein (CRP)?', '["IL-1", "IL-6", "TNF-alpha", "IFN-gamma"]', 1, 'IL-6 is the main driver of acute phase protein synthesis in hepatocytes.'),
    (v_topic_id, 'What is the role of the "Inflammasome" in the innate immune response?', '["Activation of B-cells", "Activation of Caspase-1 to cleave pro-IL-1beta into active IL-1beta", "Degradation of MHC I", "Promotion of T-cell apoptosis"]', 1, 'The inflammasome (containing NLRP3) processes pro-inflammatory cytokines into their active forms.'),
    (v_topic_id, 'Which complement component is a potent chemoattractant that recruits neutrophils to the site of infection?', '["C3b", "C5a", "C1q", "C9"]', 1, 'C5a and LTB4 are the major neutrophil chemoattractants. C3b is an opsonin.'),
    (v_topic_id, 'A patient with recurrent pyogenic infections is found to have a deficiency in C3. Which function of the complement system is most severely impaired?', '["Only the Classical pathway", "Opsonization, Chemoattainment, and MAC formation", "Only MAC formation", "Viral neutralization"]', 1, 'C3 is the central convergence point for all pathways; its loss eliminates almost all complement functions.'),
    (v_topic_id, 'What is the mechanism by which Natural Killer (NK) cells identify host cells that should be killed?', '["Recognition of foreign peptides on MHC II", "Recognition of \"missing self\" (low or absent MHC I)", "Binding to IgE", "Recognition of CD4"]', 1, 'NK cells have inhibitory receptors that bind MHC I. If MHC I is low (often due to viral evasion), the inhibition is lost and the NK cell kills the target.'),
    (v_topic_id, 'Which enzyme is responsible for the "Respiratory Burst" in neutrophils, producing reactive oxygen species to kill bacteria?', '["Myeloperoxidase", "NADPH Oxidase", "Catalase", "Superoxide dismutase"]', 1, 'NADPH oxidase produces superoxide. Deficiency causes Chronic Granulomatous Disease (CGD).'),
    (v_topic_id, 'In Chronic Granulomatous Disease, patients are particularly susceptible to which type of organisms?', '["Anaerobic bacteria", "Catalase-positive organisms", "Encapsulated bacteria", "Viruses"]', 1, 'Catalase-positive organisms (like S. aureus, Aspergillus) can degrade the H2O2 they produce, leaving the phagocyte with no ROS to use for killing.'),
    (v_topic_id, 'Which cytokine is produced by Macrophages and acts as the primary signal to induce Th1 differentiation and IFN-gamma production by T-cells?', '["IL-4", "IL-10", "IL-12", "TGF-beta"]', 2, 'IL-12 drives Th1. IL-4 drives Th2.'),
    (v_topic_id, 'What is the function of "Defensins" in the innate immune system?', '["Signaling molecules", "Cationic peptides that disrupt microbial membranes", "Enzymes that digest peptidoglycan", "Opsonins"]', 1, 'Defensins are small antimicrobial peptides produced by epithelial cells and neutrophils.'),
    (v_topic_id, 'Which pathway of complement activation is initiated by the binding of mannose-binding lectin to carbohydrates on the microbial surface?', '["Classical", "Alternative", "Lectin", "Terminal"]', 2, 'Lectin pathway uses MBL and MASP proteins.'),
    (v_topic_id, 'What is the role of "Factor H" and "Factor I" in the complement system?', '["They activate the Alternative pathway", "They are inhibitors that protect host cells from complement-mediated damage", "They form the MAC", "They act as C3 convertases"]', 1, 'They regulate and dampen complement activation to prevent self-damage.'),
    (v_topic_id, 'A patient has hereditary angioedema. This is due to a deficiency in:', '["C1 inhibitor", "C3", "C5", "DAF (CD55)"]', 0, 'C1 inhibitor deficiency leads to over-activation of the kallikrein-bradykinin system, causing edema.'),
    (v_topic_id, '"Extravasation" (leukocyte migration into tissue) involves which sequence of interactions?', '["Rolling (Selectins) -> Adhesion (Integrins) -> Diapedesis (PECAM-1)", "Adhesion -> Rolling -> Diapedesis", "Diapedesis -> Rolling -> Adhesion", "Rolling -> Diapedesis -> Adhesion"]', 0, 'Selectins mediate weak rolling; Integrins (ICAM-1/LFA-1) mediate firm adhesion.'),
    (v_topic_id, 'Which innate cell type is the first to arrive at a site of acute inflammation?', '["Macrophage", "Neutrophil", "Eosinophil", "Basophil"]', 1, 'Neutrophils are the "first responders" to acute bacterial infection.'),
    (v_topic_id, 'What is the primary function of Interferon-alpha and Interferon-beta?', '["Induce fever", "Induce an \"antiviral state\" in neighboring cells", "Activate B-cells", "Opsonize bacteria"]', 1, 'Type I IFNs inhibit viral protein synthesis and degrade viral RNA.'),
    (v_topic_id, 'Which molecule acts as a "bridge" between the innate and adaptive immune systems by presenting processed antigen to T-cells?', '["TCR", "MHC", "CD3", "BCR"]', 1, 'MHC (Major Histocompatibility Complex) is the essential link.'),
    (v_topic_id, 'MHC Class II molecules are expressed exclusively on:', '["All nucleated cells", "Professional Antigen Presenting Cells (APCs)", "Only T-cells", "Only Neurons"]', 1, 'APCs = Dendritic cells, Macrophages, and B-cells.'),
    (v_topic_id, 'Which organ is responsible for the removal of opsonized bacteria from the blood, making its absence dangerous for splenectomized patients?', '["Liver", "Spleen", "Lymph nodes", "Thymus"]', 1, 'The spleen is critical for clearing encapsulated bacteria (S. pneumo, N. men, Hib).'),
    (v_topic_id, 'Which toll-like receptor recognizes unmethylated CpG DNA motifs common in bacteria and viruses?', '["TLR2", "TLR4", "TLR7", "TLR9"]', 3, 'TLR9 recognizes CpG DNA.');

    RAISE NOTICE 'SUCCESS: Systemic Microbiology MCQ Part 2 (71-140) registered.';
END $$;

COMMIT;
