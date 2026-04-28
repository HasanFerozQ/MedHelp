-- Migration: Year 3 - Infectious Diseases MCQ Bank (PART 3: 177-263)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-29

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'infectious-diseases' LIMIT 1;

    -- SECTION 18: HIV / AIDS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '177: HIV infects which type of immune cell by binding to the CD4 receptor and CCR5/CXCR4 co-receptors?', '["B-lymphocytes", "CD4+ T-lymphocytes (Helper T-cells)", "Neutrophils", "Natural Killer cells"]', 1, 'Leads to progressive immune depletion. (Harrison''s Ch. 202)'),
    (v_topic_id, '178: "Acute HIV Syndrome" presents 2-4 weeks after exposure with flu-like symptoms and:', '["Painless chancre", "Generalized lymphadenopathy and maculopapular rash", "Blindness", "None"]', 1, 'Often mistaken for infectious mononucleosis. (Step-Up)'),
    (v_topic_id, '179: A diagnosis of AIDS is made when an HIV-positive patient has a CD4 count < ____ or an AIDS-defining illness.', '["500", "350", "200", "50"]', 2, 'Severe immunosuppression. (Pocket Medicine)'),
    (v_topic_id, '180: Which AIDS-defining opportunistic infection is characterized by white, non-scrapable plaques on the lateral tongue?', '["Oral Thrush (Candida)", "Oral Hairy Leukoplakia (EBV)", "Kaposi Sarcoma", "HSV"]', 1, 'Candida can be scraped off; Hairy Leukoplakia cannot. (Harrison''s Ch. 202)'),
    (v_topic_id, '181: "Kaposi Sarcoma" in HIV is caused by which virus?', '["EBV", "HHV-8", "HPV", "CMV"]', 1, 'Presents as purple/red nodules on the skin or mucous membranes. (Step-Up)'),
    (v_topic_id, '182: "Toxoplasmosis" in AIDS typically presents with multiple ____-enhancing lesions on brain MRI.', '["Non", "Ring", "Linear", "None"]', 1, 'Treated with pyrimethamine and sulfadiazine. (Pocket Medicine)'),
    (v_topic_id, '183: "Cryptosporidiosis" in AIDS causes which severe symptom?', '["Cough", "Chronic, profuse watery diarrhea", "Headache", "Rash"]', 1, 'Can lead to massive fluid loss. (Harrison''s Ch. 202)'),
    (v_topic_id, '184: "Mycobacterium avium complex" (MAC) prophylaxis was traditionally indicated when CD4 count dropped below:', '["200", "100", "50", "20"]', 2, 'Azithromycin is used if the patient is NOT on ART. (Step-Up)'),
    (v_topic_id, '185: "Cytomegalovirus" (CMV) retinitis in AIDS patients presents with blurred vision and a "pizza pie" appearance on fundoscopy; the treatment is:', '["Acyclovir", "Ganciclovir or Foscarnet", "Fluconazole", "None"]', 1, 'Highly aggressive; can lead to blindness. (Pocket Medicine)'),
    (v_topic_id, '186: "Highly Active Antiretroviral Therapy" (HAART) usually consists of ____ drugs from at least ____ different classes.', '["2; 1", "3; 2", "4; 3", "None"]', 1, 'Standard initial regimen involves 2 NRTIs + 1 Integrase Inhibitor. (Harrison''s Ch. 202)');

    -- SECTION 19: VIRAL HEPATITIS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '187: "Hepatitis A" is transmitted via the ____ route and does NOT cause chronic infection.', '["Blood-borne", "Fecal-oral", "Sexual", "Aerosol"]', 1, 'Often associated with contaminated food or water. (Step-Up)'),
    (v_topic_id, '188: Which Hepatitis B marker is the FIRST to appear in the blood during acute infection?', '["HBeAg", "HBsAg (Surface Antigen)", "Anti-HBs", "Anti-HBc"]', 1, 'Presence for >6 months defines chronic infection. (Pocket Medicine)'),
    (v_topic_id, '189: "Hepatitis B Surface Antibody" (Anti-HBs) indicates:', '["Acute infection", "Immunity (via vaccination or recovery)", "Chronic carrier", "None"]', 1, 'This is the only positive marker in a successfully vaccinated person. (Harrison''s Ch. 337)'),
    (v_topic_id, '190: "Anti-HBc" (Core Antibody) is positive in both active and recovered patients, but NOT in ____ patients.', '["Chronic", "Vaccinated", "Acute", "None"]', 1, 'Vaccines only contain the surface antigen (HBsAg). (Step-Up)'),
    (v_topic_id, '191: "Hepatitis D" (Delta virus) is a defective virus that requires the presence of ____ to replicate.', '["Hepatitis A", "Hepatitis B (specifically HBsAg)", "Hepatitis C", "HIV"]', 1, 'Can occur as a co-infection or super-infection. (Pocket Medicine)'),
    (v_topic_id, '192: "Hepatitis C" is primarily transmitted via ____ and has a very high rate of progression to chronic infection (>80%).', '["Fecal-oral", "Blood (e.g., IV drug use, previous transfusions)", "Sexual", "Saliva"]', 1, 'Now curable with Direct-Acting Antivirals (DAAs). (Harrison''s Ch. 337)'),
    (v_topic_id, '193: "Hepatitis E" is similar to Hepatitis A but is particularly dangerous (high mortality) in which population?', '["Elderly", "Pregnant women", "Children", "Infants"]', 1, 'Can cause fulminant hepatic failure in pregnancy. (Step-Up)'),
    (v_topic_id, '194: A "Window Period" in Hepatitis B refers to the time when HBsAg has disappeared but ____ has not yet appeared.', '["HBeAg", "Anti-HBs", "Anti-HBc", "None"]', 1, 'Only Anti-HBc IgM might be detectable during this time. (Pocket Medicine)'),
    (v_topic_id, '195: Chronic Hepatitis B and C significantly increase the risk of which cancer?', '["Colon CA", "Hepatocellular Carcinoma (HCC)", "Pancreatic CA", "None"]', 1, 'Requires regular screening with Ultrasound and AFP. (Harrison''s Ch. 337)'),
    (v_topic_id, '196: Which serological marker indicates high viral replication and high infectivity in Hepatitis B?', '["HBsAg", "HBeAg (Envelope Antigen)", "Anti-HBs", "None"]', 1, 'Envelope antigen correlates with viral load. (Step-Up)');

    -- SECTION 20: HERPESVIRUSES
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '197: "Herpes Simplex Virus-1" (HSV-1) is classically associated with ____, while HSV-2 is associated with ____.', '["Genital herpes; Cold sores", "Oral herpes (Cold sores); Genital herpes", "Chickenpox; Shingles", "None"]', 1, 'However, either virus can infect either site. (Pocket Medicine)'),
    (v_topic_id, '198: "Tzanck Smear" shows multi-nucleated giant cells and is used to diagnose:', '["HIV", "Herpesviruses (HSV and VZV)", "HPV", "None"]', 1, 'Rarely used now; PCR is the gold standard. (Harrison''s Ch. 192)'),
    (v_topic_id, '199: "Varicella" (Chickenpox) presents with a "dewdrop on a rose petal" rash in ____.', '["A single dermatome", "Successive crops of lesions in different stages", "A linear pattern", "None"]', 1, 'Highly contagious via respiratory droplets. (Step-Up)'),
    (v_topic_id, '200: "Herpes Zoster" (Shingles) is a reactivation of VZV that occurs in a ____ distribution.', '["Generalized", "Dermatomal", "Facial only", "None"]', 1, 'Often accompanied by severe pain (post-herpetic neuralgia). (Pocket Medicine)'),
    (v_topic_id, '201: "Infectious Mononucleosis" is most commonly caused by ____.', '["CMV", "Epstein-Barr Virus (EBV)", "HIV", "Adenovirus"]', 1, 'Triad of fever, pharyngitis, and posterior cervical lymphadenopathy. (Harrison''s Ch. 194)'),
    (v_topic_id, '202: Patients with EBV mononucleosis who are mistakenly treated with Amoxicillin or Ampicillin often develop a/an:', '["Anaphylaxis", "Maculopapular rash", "Liver failure", "Kidney failure"]', 1, 'Classic board association; not a true allergy. (Step-Up)'),
    (v_topic_id, '203: "Monospot Test" (Heterophile antibody test) is used for EBV. If it is NEGATIVE but the patient has a mono-like illness, think of:', '["Staph", "Cytomegalovirus (CMV)", "Strep", "None"]', 1, 'CMV mono is heterophile-negative. (Pocket Medicine)'),
    (v_topic_id, '204: "Cytomegalovirus" (CMV) classically shows which finding on tissue biopsy?', '["Auer rods", "Owl''s Eye inclusion bodies", "Negri bodies", "None"]', 1, 'Large intranuclear inclusions. (Harrison''s Ch. 195)'),
    (v_topic_id, '205: "Roseola Infantum" (Exanthem Subitum) is caused by HHV-6 and presents as high fever for 3-4 days followed by:', '["Blindness", "A rash that appears as the fever breaks", "Seizures only", "None"]', 1, 'The rash typically starts on the trunk. (Step-Up)'),
    (v_topic_id, '206: "Burkitt Lymphoma" and "Nasopharyngeal Carcinoma" are associated with which virus?', '["HPV", "EBV", "HSV", "None"]', 1, 'EBV is oncogenic. (Pocket Medicine)');

    -- SECTION 21: RESPIRATORY & EXANTHEMATOUS VIRUSES
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '207: "Influenza" virus undergoes "Antigenic ____" (minor mutations) and "Antigenic ____" (major reassortment causing pandemics).', '["Shift; Drift", "Drift; Shift", "Swap; Drop", "None"]', 1, 'Drift happens every year; Shift is rare. (Harrison''s Ch. 200)'),
    (v_topic_id, '208: "Reye Syndrome" (encephalopathy and liver failure) can occur in children who take ____ during a viral infection (Flu/Chickenpox).', '["Acetaminophen", "Aspirin", "Ibuprofen", "Antibiotics"]', 1, 'Fatal metabolic disorder; avoid aspirin in kids. (Step-Up)'),
    (v_topic_id, '209: "Measles" (Rubeola) is characterized by the 3 C''s: Cough, Coryza, Conjunctivitis, and ____.', '["Coughing", "Koplik spots (blue-white spots on buccal mucosa)", "Ear pain", "None"]', 1, 'Followed by a brick-red rash that starts on the face. (Pocket Medicine)'),
    (v_topic_id, '210: "Mumps" classically presents with painful swelling of the ____ glands.', '["Thyroid", "Parotid", "Adrenal", "None"]', 1, 'Can also cause orchitis (testicular inflammation). (Harrison''s Ch. 200)'),
    (v_topic_id, '211: "Rubella" (German Measles) is usually mild but is highly teratogenic, causing which classic triad in neonates?', '["Rash, Fever, Pain", "Cataracts, Deafness, and Heart defects (PDA)", "Anemia, Jaundice, Fever", "None"]', 1, 'Congenital Rubella Syndrome. (Step-Up)'),
    (v_topic_id, '212: "Parvovirus B19" causes "Erythema Infectiosum" (Fifth Disease), characterized by a ____ rash.', '["Target", "Slapped-cheek", "Vesicular", "None"]', 1, 'Can cause aplastic crisis in patients with Sickle Cell. (Pocket Medicine)'),
    (v_topic_id, '213: "Hand-Foot-Mouth Disease" is most commonly caused by ____.', '["HSV", "Coxsackievirus A", "HPV", "None"]', 1, 'Presents with oral ulcers and vesicles on hands/feet. (Harrison''s Ch. 200)'),
    (v_topic_id, '214: "RSV" (Respiratory Syncytial Virus) is the most common cause of ____ in infants.', '["Pneumonia", "Bronchiolitis", "Croup", "None"]', 1, 'Presents with wheezing and respiratory distress. (Step-Up)'),
    (v_topic_id, '215: "Croup" (Laryngotracheobronchitis) is caused by the Parainfluenza virus and shows a ____ on neck X-ray.', '["Thumbprint sign", "Steeple sign (subglottic narrowing)", "Linear sign", "None"]', 1, 'Presents with a "barking" cough and stridor. (Pocket Medicine)'),
    (v_topic_id, '216: "Rabies" diagnosis on autopsy is confirmed by the presence of ____ in neurons.', '["Auer rods", "Negri bodies", "Owl''s eyes", "None"]', 1, 'Cytoplasmic inclusions in Purkinje cells. (Harrison''s Ch. 200)');

    -- SECTION 22: FUNGAL INFECTIONS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '217: What is the most common cause of fungal infections (e.g., thrush, vaginitis, diaper rash)?', '["Aspergillus", "Candida albicans", "Cryptococcus", "Histoplasma"]', 1, 'Commensal organism that becomes pathogenic. (Step-Up)'),
    (v_topic_id, '218: "Oral Candidiasis" (Thrush) in a young, healthy person who is NOT on steroids should prompt testing for:', '["Diabetes", "HIV", "Cancer", "None"]', 1, 'Often the first sign of immunosuppression. (Pocket Medicine)'),
    (v_topic_id, '219: "Aspergillus" can cause a/an ____ (fungal ball) in a pre-existing lung cavity (e.g., from old TB).', '["Abscess", "Aspergilloma", "Tumor", "None"]', 1, 'Can cause severe hemoptysis. (Harrison''s Ch. 216)'),
    (v_topic_id, '220: "Allergic Bronchopulmonary Aspergillosis" (ABPA) is a hypersensitivity reaction seen in patients with:', '["Diabetes", "Asthma or Cystic Fibrosis", "HIV", "None"]', 1, 'Presents with eosinophilia and high IgE. (Step-Up)'),
    (v_topic_id, '221: "Mucormycosis" is a life-threatening fungal infection (Rhino-orbital-cerebral) classically seen in:', '["Diabetics with DKA", "Athletes", "Travelers", "None"]', 0, 'Broad, non-septate hyphae with 90-degree branching. (Pocket Medicine)'),
    (v_topic_id, '222: "Histoplasmosis" is endemic to the Ohio and Mississippi River Valleys and is acquired from ____ or ____ droppings.', '["Dog; Cat", "Bird; Bat", "Rat; Mouse", "None"]', 1, 'Found in soil contaminated with guano. (Harrison''s Ch. 211)'),
    (v_topic_id, '223: "Blastomycosis" is common in the Great Lakes region and can cause characteristic ____ lesions.', '["Red rash", "Verrucous (wart-like) skin lesions", "Blisters", "None"]', 1, 'Broad-based budding yeast. (Step-Up)'),
    (v_topic_id, '224: "Coccidioidomycosis" (Valley Fever) is endemic to the ____ US.', '["Southeast", "Southwest (California/Arizona)", "Northeast", "None"]', 1, 'Acquired by inhaling dust containing spherules. (Pocket Medicine)'),
    (v_topic_id, '225: "Sporotrichosis" (Rose Gardener''s Disease) is a subcutaneous fungal infection that follows a ____.', '["Dog bite", "Thorn prick", "Fish scratch", "None"]', 1, 'Causes nodules that spread along lymphatic channels. (Harrison''s Ch. 211)'),
    (v_topic_id, '226: What is the most effective drug for severe, systemic fungal infections (the "big gun")?', '["Fluconazole", "Amphotericin B", "Nystatin", "Griseofulvin"]', 1, '"Ampho-terrible" due to its high toxicity. (Step-Up)');

    -- SECTION 23: PARASITIC INFECTIONS (PROTOZOA)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '227: "Malaria" is caused by Plasmodium species. Which species is the MOST severe and life-threatening?', '["P. vivax", "P. falciparum", "P. ovale", "P. malariae"]', 1, 'Causes microvascular sequestration and cerebral malaria. (Harrison''s Ch. 224)'),
    (v_topic_id, '228: Malaria is transmitted by the bite of the female ____ mosquito.', '["Aedes", "Anopheles", "Culex", "None"]', 1, 'Diagnosed with thick and thin blood smears. (Step-Up)'),
    (v_topic_id, '229: Patients with ____ or ____ deficiency are partially protected against severe Malaria.', '["Diabetes; Hypertension", "Sickle Cell Trait; G6PD", "Iron; Vitamin C", "None"]', 1, 'Genetic adaptations to endemic malaria. (Pocket Medicine)'),
    (v_topic_id, '230: "Toxoplasma gondii" is most commonly transmitted to humans via:', '["Dog bites", "Cat feces or undercooked meat", "Aerosols", "None"]', 1, 'Dangerous in pregnancy and AIDS. (Harrison''s Ch. 229)'),
    (v_topic_id, '231: "Entamoeba histolytica" causes bloody diarrhea and classically causes a/an ____ in the liver.', '["Hydatid cyst", "Amoebic Liver Abscess (Anchovy paste appearance)", "Tumor", "None"]', 1, 'Ingestion of cysts from contaminated water. (Step-Up)'),
    (v_topic_id, '232: "Trypanosoma cruzi" causes Chagas Disease in South America, leading to mega-esophagus, mega-colon, and ____.', '["Lung CA", "Dilated Cardiomyopathy", "Blindness", "None"]', 1, 'Transmitted by the "kissing bug" (Reduviid). (Pocket Medicine)'),
    (v_topic_id, '233: "Leishmaniasis" is transmitted by ____ and can cause visceral disease (Kala-azar) or skin ulcers.', '["Fleas", "Sandflies", "Ticks", "Mosquitoes"]', 1, 'Endemic in many tropical regions. (Harrison''s Ch. 227)'),
    (v_topic_id, '234: "Trichomonas vaginalis" discharge is ____, while "Bacterial Vaginosis" is ____.', '["Green/Frothy; Gray/Thin (Fishy)", "Gray; Green", "Clear; Bloody", "None"]', 0, 'Both treated with Metronidazole. (Step-Up)'),
    (v_topic_id, '235: "Amoebic Meningoencephalitis" (the brain-eating amoeba) is caused by ____ after swimming in warm fresh water.', '["Giardia", "Naegleria fowleri", "Toxoplasma", "None"]', 1, 'Rapidly fatal; enters via the nose. (Pocket Medicine)'),
    (v_topic_id, '236: "Babesiosis" is a tick-borne protozoan (Ixodes) that shows a ____ on blood smear.', '["Negri body", "Maltese cross", "Ring form only", "None"]', 1, 'Similar to malaria but in the US (Northeast). (Harrison''s Ch. 225)');

    -- SECTION 24: PARASITIC INFECTIONS (HELMINTHS)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '237: "Enterobius vermicularis" (Pinworm) causes intense anal itching and is diagnosed with the ____.', '["Blood test", "Scotch Tape test", "Stool culture", "None"]', 1, 'Common in children; treat the whole family. (Step-Up)'),
    (v_topic_id, '238: "Ascaris lumbricoides" is a large roundworm that can cause ____.', '["Blindness", "Intestinal obstruction", "Skin rash only", "None"]', 1, 'The most common helminth infection worldwide. (Pocket Medicine)'),
    (v_topic_id, '239: "Hookworms" (Ancylostoma and Necator) cause ____ because they suck blood from the intestinal wall.', '["Vitamin B12 deficiency", "Iron Deficiency Anemia", "Leukemia", "None"]', 1, 'Larvae penetrate the skin (walking barefoot on soil). (Harrison''s Ch. 232)'),
    (v_topic_id, '240: "Strongyloides stercoralis" can cause a fatal "Hyperinfection syndrome" in patients on ____.', '["Antibiotics", "Glucocorticoids (Steroids)", "Insulin", "None"]', 1, 'Larvae can auto-infect the host. (Step-Up)'),
    (v_topic_id, '241: "Trichinella spiralis" is acquired from undercooked ____ and causes muscle pain and periorbital edema.', '["Fish", "Pork or Bear meat", "Beef", "Chicken"]', 1, 'Larvae encyst in muscle. (Pocket Medicine)'),
    (v_topic_id, '242: "Schistosomiasis" is a fluke infection associated with ____ and can cause portal hypertension or bladder cancer.', '["Raw fish", "Fresh water snails", "Undercooked beef", "None"]', 1, 'Cercariae penetrate the skin while swimming. (Harrison''s Ch. 235)'),
    (v_topic_id, '243: "Taenia solium" (Pork Tapeworm) causes ____ if you eat the eggs, leading to cysts in the brain.', '["Diarrhea", "Neurocysticercosis (seizures)", "Blindness", "None"]', 1, 'Leading cause of seizures in the developing world. (Step-Up)'),
    (v_topic_id, '244: "Echinococcus granulosus" (Dog Tapeworm) causes ____ in the liver.', '["Abscesses", "Hydatid cysts (with daughter cysts)", "Tumors", "None"]', 1, 'Cysts must not be ruptured (risk of anaphylaxis). (Pocket Medicine)'),
    (v_topic_id, '245: "Loa loa" (African eye worm) is transmitted by deer flies and can be seen ____.', '["In the stool", "Crossing the conjunctiva of the eye", "In the ear", "None"]', 1, 'Causes transient "Calabar swellings." (Harrison''s Ch. 233)'),
    (v_topic_id, '246: What is the drug of choice for most flatworm (fluke) and tapeworm infections?', '["Albendazole", "Praziquantel", "Ivermectin", "Mebendazole"]', 1, 'Ivermectin is for "river blindness" and Strongyloides. (Step-Up)');

    -- SECTION 25: ID BOARD EXAM MARATHON
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '247: "Atypical Lymphocytes" = ?', '["Bacterial sepsis", "EBV / CMV Mononucleosis", "Leukemia", "None"]', 1, 'Reactive T-cells. (Pocket Medicine)'),
    (v_topic_id, '248: "Koplik Spots" = ?', '["Rubella", "Measles (Rubeola)", "Mumps", "None"]', 1, 'Buccal spots. (Harrison''s Ch. 200)'),
    (v_topic_id, '249: "Rusty Sputum" = ?', '["Klebsiella", "Streptococcus pneumoniae", "Legionella", "None"]', 1, 'Pneumococcal pneumonia. (Step-Up)'),
    (v_topic_id, '250: "Currant Jelly Sputum" = ?', '["Strep", "Klebsiella pneumoniae", "Mycoplasma", "None"]', 1, 'Common in alcoholics. (Pocket Medicine)'),
    (v_topic_id, '251: "Slapped-Cheek Rash" = ?', '["Measles", "Parvovirus B19", "Rubella", "None"]', 1, 'Erythema infectiosum. (Harrison''s Ch. 200)'),
    (v_topic_id, '252: "India Ink" positive = ?', '["Candida", "Cryptococcus neoformans", "Aspergillus", "None"]', 1, 'Thick capsule doesn''t take up the ink. (Step-Up)'),
    (v_topic_id, '253: "Maltese Cross" on smear = ?', '["Malaria", "Babesiosis", "Toxoplasmosis", "None"]', 1, 'Tick-borne protozoan. (Pocket Medicine)'),
    (v_topic_id, '254: "Spherules" on biopsy = ?', '["Histo", "Coccidioidomycosis", "Blasto", "None"]', 1, 'Southwest US endemic fungus. (Harrison''s Ch. 212)'),
    (v_topic_id, '255: "Broad-based budding yeast" = ?', '["Histo", "Blastomycosis", "Coccidio", "None"]', 1, 'Great Lakes region. (Step-Up)'),
    (v_topic_id, '256: "Intracellular yeast in macrophages" = ?', '["Coccidio", "Histoplasmosis", "Blasto", "None"]', 1, 'Bird/Bat guano association. (Pocket Medicine)'),
    (v_topic_id, '257: "Gumma" = ?', '["Primary Syphilis", "Tertiary Syphilis", "Secondary Syphilis", "None"]', 1, 'Granulomatous lesion. (Harrison''s Ch. 182)'),
    (v_topic_id, '258: "Condyloma Lata" = ?', '["HPV", "Secondary Syphilis", "HSV", "None"]', 1, 'Flat, broad-based warts. (Step-Up)'),
    (v_topic_id, '259: "Condyloma Acuminatum" = ?', '["Syphilis", "Human Papillomavirus (HPV)", "HIV", "None"]', 1, 'Cauliflower-like warts (types 6 and 11). (Pocket Medicine)'),
    (v_topic_id, '260: "Councilman Bodies" = ?', '["Hepatitis A", "Yellow Fever", "Malaria", "None"]', 1, 'Eosinophilic apoptotic hepatocytes. (Harrison''s Ch. 201)'),
    (v_topic_id, '261: "Guarnieri Bodies" = ?', '["Chickenpox", "Smallpox (Variola)", "Herpes", "None"]', 1, 'Intracytoplasmic inclusions. (Step-Up)'),
    (v_topic_id, '262: "Negri Bodies" = ?', '["Measles", "Rabies", "Mumps", "None"]', 1, 'Purkinje cell inclusions. (Pocket Medicine)'),
    (v_topic_id, '263: "Dewdrop on a rose petal" = ?', '["Measles", "Varicella (Chickenpox)", "Rubella", "None"]', 1, 'Classic description of vesicles. (Harrison''s Ch. 192)');

    RAISE NOTICE 'SUCCESS: Infectious Diseases MCQ Part 3 (177-263) registered.';
END $$;

COMMIT;
