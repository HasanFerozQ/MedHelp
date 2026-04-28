-- Migration: Year 3 - Infectious Diseases MCQ Bank (PART 1: 1-88)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-29

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'infectious-diseases' LIMIT 1;

    -- SECTION 1: SEPSIS & BACTEREMIA
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '1: "Sepsis" is currently defined as life-threatening organ dysfunction caused by a dysregulated host response to infection, measured by a change in SOFA score of >= ____ points.', '["1", "2", "3", "5"]', 1, 'SOFA = Sequential Organ Failure Assessment. (Harrison''s Ch. 143)'),
    (v_topic_id, '2: "Septic Shock" is a subset of sepsis requiring vasopressors to maintain MAP >= 65 mmHg AND a serum lactate level > ____ mmol/L despite adequate fluid resuscitation.', '["1", "2", "4", "5"]', 1, 'Indicates profound circulatory and cellular/metabolic abnormalities. (Step-Up)'),
    (v_topic_id, '3: The "qSOFA" (quick SOFA) criteria used at the bedside include respiratory rate >= 22, altered mental status, and systolic blood pressure <= ____ mmHg.', '["90", "100", "110", "120"]', 1, 'Designed to quickly identify patients at risk for poor outcomes. (Pocket Medicine)'),
    (v_topic_id, '4: What is the recommended initial fluid resuscitation volume for a patient in septic shock?', '["10 mL/kg", "20 mL/kg", "30 mL/kg", "50 mL/kg"]', 2, 'Crystalloids should be started within the first 3 hours. (Harrison''s Ch. 143)'),
    (v_topic_id, '5: Which vasopressor is the FIRST-LINE choice for septic shock that is refractory to fluid resuscitation?', '["Dopamine", "Epinephrine", "Norepinephrine", "Vasopressin"]', 2, 'Has both alpha and beta-1 activity with less tachycardia than dopamine. (Step-Up)'),
    (v_topic_id, '6: "Toxic Shock Syndrome" (TSS) caused by S. aureus is primarily mediated by which toxin?', '["Exfoliative toxin", "TSST-1 (Superantigen)", "Enterotoxin B", "Alpha-toxin"]', 1, 'Causes massive T-cell activation and cytokine release. (Pocket Medicine)'),
    (v_topic_id, '7: TSS caused by Streptococcus pyogenes (Group A Strep) is often associated with which clinical finding that is RARE in staphylococcal TSS?', '["Fever", "Hypotension", "Necrotizing fasciitis / severe local pain", "Desquamation"]', 2, 'Strep TSS often involves deep tissue infection. (Harrison''s Ch. 153)'),
    (v_topic_id, '8: Blood cultures in Sepsis should ideally be drawn ____ starting antibiotics.', '["Before", "During", "After", "Only if fever > 39C"]', 0, 'To increase the yield of pathogen identification. (Step-Up)'),
    (v_topic_id, '9: "Empiric" antibiotic therapy in sepsis should be started within ____ of recognition.', '["1 hour", "3 hours", "6 hours", "24 hours"]', 0, 'Delays in antibiotics are associated with increased mortality. (Pocket Medicine)'),
    (v_topic_id, '10: A patient with sepsis from an unknown source and a history of IV drug use should have empiric coverage for which organism?', '["H. pylori", "MRSA", "Listeria", "Legionella"]', 1, 'Risk of endocarditis or skin/soft tissue infection. (Harrison''s Ch. 143)');

    -- SECTION 2: CENTRAL NERVOUS SYSTEM INFECTIONS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '11: What is the most common cause of community-acquired bacterial meningitis in adults?', '["Neisseria meningitidis", "Streptococcus pneumoniae", "Listeria monocytogenes", "Haemophilus influenzae"]', 1, 'Classic association across all ages except neonates. (Harrison''s Ch. 147)'),
    (v_topic_id, '12: "Listeria monocytogenes" meningitis coverage (with Ampicillin) must be added for which adult populations?', '["Age > 50 and immunocompromised", "College students", "Athletes", "Travelers to Asia"]', 0, 'Listeria is more common in the elderly and the suppressed. (Step-Up)'),
    (v_topic_id, '13: The "Classic Triad" of bacterial meningitis includes fever, nuchal rigidity, and:', '["Vomiting", "Altered mental status", "Seizures", "Rash"]', 1, 'However, all three are present in only ~45% of cases. (Pocket Medicine)'),
    (v_topic_id, '14: "Kernig''s Sign" is positive when pain is elicited during:', '["Passive neck flexion", "Passive knee extension when the hip is flexed to 90 degrees", "Straight leg raise", "None"]', 1, 'Sign of meningeal irritation. (Harrison''s Ch. 147)'),
    (v_topic_id, '15: "Brudzinski''s Sign" is positive when passive neck flexion causes:', '["Pain in the back", "Involuntary flexion of the hips and knees", "Headache", "Vomiting"]', 1, 'Indicates severe meningeal inflammation. (Step-Up)'),
    (v_topic_id, '16: In bacterial meningitis, CSF typically shows high protein, low glucose, and high ____.', '["Lymphocytes", "Neutrophils (PMNs)", "Eosinophils", "Monocytes"]', 1, 'CSF glucose < 40 mg/dL is highly suggestive of bacterial etiology. (Pocket Medicine)'),
    (v_topic_id, '17: Which medication should be given BEFORE or with the first dose of antibiotics in suspected S. pneumoniae meningitis to reduce neurological sequelae?', '["Heparin", "Dexamethasone", "Aspirin", "Insulin"]', 1, 'Reduces the inflammatory response to bacterial lysis. (Harrison''s Ch. 147)'),
    (v_topic_id, '18: What is the treatment of choice for close contacts of a patient with Neisseria meningitidis meningitis?', '["Penicillin", "Rifampin (or Ciprofloxacin/Ceftriaxone)", "Vancomycin", "Vaccination only"]', 1, 'Chemoprophylaxis is crucial for close contacts. (Step-Up)'),
    (v_topic_id, '19: "Viral Meningitis" (Aseptic) is most commonly caused by:', '["HSV", "Enteroviruses (Coxsackie/Echovirus)", "HIV", "CMV"]', 1, 'Usually has a benign course compared to bacterial. (Pocket Medicine)'),
    (v_topic_id, '20: "Encephalitis" differs from meningitis primarily by the presence of:', '["Fever", "Altered brain function (confusion, personality changes, seizures)", "Neck stiffness", "High WBC in CSF"]', 1, 'Brain parenchyma is involved in encephalitis. (Harrison''s Ch. 147)');

    -- SECTION 3: VIRAL ENCEPHALITIS & BRAIN ABSCESS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '21: What is the most common cause of sporadic, fatal encephalitis in the US?', '["West Nile Virus", "Herpes Simplex Virus-1 (HSV-1)", "Rabies", "Varicella Zoster Virus"]', 1, 'Classically involves the temporal lobes. (Harrison''s Ch. 147)'),
    (v_topic_id, '22: Hemorrhagic necrosis of the temporal lobes on MRI is pathognomonic for:', '["Lyme disease", "HSV Encephalitis", "Stroke", "Tumor"]', 1, 'Requires urgent IV Acyclovir. (Step-Up)'),
    (v_topic_id, '23: "West Nile Encephalitis" is transmitted by mosquitoes and may present with a characteristic:', '["Rash on palms", "Flaccid paralysis (resembling polio)", "Blindness", "Ear pain"]', 1, 'Neuroinvasive disease can cause motor neuron damage. (Pocket Medicine)'),
    (v_topic_id, '24: A "Brain Abscess" with a ring-enhancing lesion on CT in an immunocompetent patient is most commonly caused by ____ and ____.', '["Viridans strep; Staph aureus", "E. coli; Listeria", "HIV; CMV", "None"]', 0, 'Often results from direct spread (sinusitis/otitis) or hematogenous spread. (Harrison''s Ch. 147)'),
    (v_topic_id, '25: In an AIDS patient, multiple ring-enhancing lesions in the brain are most likely:', '["Primary CNS Lymphoma", "Toxoplasmosis", "Cryptococcus", "PML"]', 1, 'Treated empirically with pyrimethamine and sulfadiazine. (Step-Up)'),
    (v_topic_id, '26: "Cryptococcal Meningitis" in HIV patients is diagnosed with which CSF test?', '["Gram stain", "India Ink or Cryptococcal Antigen (CrAg)", "PCR for HSV", "Acid-fast stain"]', 1, 'CrAg is highly sensitive and specific. (Pocket Medicine)'),
    (v_topic_id, '27: What is the treatment of choice for Cryptococcal Meningitis?', '["Fluconazole only", "Amphotericin B + Flucytosine", "Acyclovir", "Penicillin"]', 1, 'Followed by long-term fluconazole suppression. (Harrison''s Ch. 219)'),
    (v_topic_id, '28: "Rabies" is a rhabdovirus transmitted by bites (bats, raccoons, dogs). Once symptoms like ____ appear, it is almost 100% fatal.', '["Cough", "Hydrophobia and laryngeal spasms", "Diarrhea", "Rash"]', 1, 'Post-exposure prophylaxis (PEP) must be given before symptoms start. (Step-Up)'),
    (v_topic_id, '29: "Progressive Multifocal Leukoencephalopathy" (PML) is caused by the reactivation of the ____ virus in immunocompromised patients.', '["EBV", "JC Virus", "BK Virus", "HIV"]', 1, 'Causes demyelination and non-enhancing white matter lesions. (Pocket Medicine)'),
    (v_topic_id, '30: "Subacute Sclerosing Panencephalitis" (SSPE) is a late complication of which childhood infection?', '["Rubella", "Measles", "Mumps", "Varicella"]', 1, 'Occurs years after the initial infection. (Harrison''s Ch. 147)');

    -- SECTION 4: INFECTIVE ENDOCARDITIS (IE)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '31: What is the most common cause of Acute Infective Endocarditis on NATIVE valves?', '["Staphylococcus aureus", "Viridans group streptococci", "Enterococcus", "Streptococcus bovis"]', 0, 'Highly virulent and destructive. (Harrison''s Ch. 138)'),
    (v_topic_id, '32: "Viridans group streptococci" (e.g., S. mutans) are the most common cause of ____ endocarditis.', '["Acute", "Subacute", "Prosthetic valve", "IV drug user"]', 1, 'Often follows dental procedures. (Step-Up)'),
    (v_topic_id, '33: What is the most common organism in endocarditis in IV drug users, typically involving the tricuspid valve?', '["Streptococcus", "Staphylococcus aureus", "Candida", "Pseudomonas"]', 1, 'Right-sided endocarditis is common in this population. (Pocket Medicine)'),
    (v_topic_id, '34: "Streptococcus gallolyticus" (formerly S. bovis) endocarditis is strongly associated with which underlying condition?', '["Diabetes", "Colorectal Cancer", "Lung cancer", "Liver failure"]', 1, 'Requires a mandatory colonoscopy. (Harrison''s Ch. 138)'),
    (v_topic_id, '35: "Roth Spots" are a clinical sign of endocarditis and are found in the:', '["Mouth", "Retina (hemorrhage with pale center)", "Fingernails", "Palms"]', 1, 'Due to immune complex-mediated vasculitis. (Step-Up)'),
    (v_topic_id, '36: "Janeway Lesions" are painless, erythematous macules on the palms/soles, representing:', '["Immune complexes", "Septic emboli", "Allergy", "Fungus"]', 1, 'Contrast with Osler nodes which are immune-mediated and painful. (Pocket Medicine)'),
    (v_topic_id, '37: "Osler Nodes" are ____, while "Janeway Lesions" are ____.', '["Painless; Painful", "Painful; Painless", "Itchy; Not itchy", "None"]', 1, '"O"sler = "O"uch. (Harrison''s Ch. 138)'),
    (v_topic_id, '38: The "Duke Criteria" for IE include major criteria such as positive blood cultures and ____.', '["Fever", "Echocardiogram showing vegetation", "Splinter hemorrhages", "High ESR"]', 1, 'Transesophageal Echo (TEE) is more sensitive than TTE. (Step-Up)'),
    (v_topic_id, '39: "HACEK" organisms (Haemophilus, Aggregatibacter, Cardiobacterium, Eikenella, Kingella) are known for causing endocarditis that is:', '["Highly aggressive", "Culture-negative (difficult to grow)", "Only in children", "None"]', 1, 'Fastidious Gram-negative bacilli. (Pocket Medicine)'),
    (v_topic_id, '40: What is the standard antibiotic prophylaxis for high-risk patients undergoing dental procedures?', '["Penicillin", "Amoxicillin (or Clindamycin if allergic)", "Vancomycin", "Ciprofloxacin"]', 1, 'Given 30-60 minutes before the procedure. (Harrison''s Ch. 138)');

    -- SECTION 5: BACTERIAL INFECTIONS (GRAM-POSITIVE)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '41: "Staphylococcus aureus" produces "Coagulase," which distinguishes it from:', '["Streptococcus", "Coagulase-negative Staph (e.g., S. epidermidis)", "Enterococcus", "None"]', 1, 'S. aureus is "Staph aureus", others are "CoNS". (Step-Up)'),
    (v_topic_id, '42: "Staphylococcus epidermidis" is a common cause of infection in which setting?', '["Community pneumonia", "Prosthetic devices (valves, joints, catheters)", "Food poisoning", "UTI"]', 1, 'Forms a thick biofilm on foreign material. (Pocket Medicine)'),
    (v_topic_id, '43: "Streptococcus pyogenes" (Group A) is the most common cause of bacterial pharyngitis and can lead to:', '["Rheumatic Fever and Post-Strep Glomerulonephritis", "Liver failure", "Bladder cancer", "None"]', 0, 'Nonsuppurative complications. (Harrison''s Ch. 153)'),
    (v_topic_id, '44: "Erysipelas" is a distinct type of superficial cellulitis with sharp borders, almost always caused by:', '["S. aureus", "Group A Streptococcus", "Pseudomonas", "E. coli"]', 1, 'Involves the upper dermis and superficial lymphatics. (Step-Up)'),
    (v_topic_id, '45: "Streptococcus agalactiae" (Group B) is the leading cause of sepsis and meningitis in:', '["Elderly", "Neonates", "Teens", "Men"]', 1, 'Transmitted from the mother''s vaginal canal during birth. (Pocket Medicine)'),
    (v_topic_id, '46: "Enterococcus" infections (E. faecalis and E. faecium) are often resistant to which class of antibiotics?', '["Penicillins", "Cephalosporins", "Macrolides", "None"]', 1, 'Enterococci are intrinsically resistant to cephalosporins. (Harrison''s Ch. 154)'),
    (v_topic_id, '47: "Anthrax" is caused by Bacillus anthracis. The "Woolsorter''s disease" (inhalation anthrax) classically shows which X-ray finding?', '["Lobar pneumonia", "Widened mediastinum", "Cavity", "Pleural effusion only"]', 1, 'Due to hemorrhagic lymphadenitis. (Step-Up)'),
    (v_topic_id, '48: "Listeria monocytogenes" is unique among Gram-positive bacilli for its ability to grow at ____ temperatures.', '["Body", "Freezing/Cold (4C)", "Boiling", "None"]', 1, 'Found in deli meats and unpasteurized cheese. (Pocket Medicine)'),
    (v_topic_id, '49: "Diphtheria" is characterized by a "grayish pseudomembrane" in the throat and is caused by:', '["Corynebacterium diphtheriae", "Clostridium", "Staphylococcus", "None"]', 0, 'Toxin can cause myocarditis and nerve damage. (Harrison''s Ch. 155)'),
    (v_topic_id, '50: "Actinomyces israelii" causes sulfur granules and abscesses, typically following:', '["Dental work or trauma to the jaw", "Lung infection", "UTI", "None"]', 0, 'Anaerobic, branching Gram-positive rod. (Step-Up)');

    -- SECTION 6: BACTERIAL INFECTIONS (GRAM-NEGATIVE)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '51: "Neisseria meningitidis" (Meningococcus) classically presents with a ____ rash.', '["Itchy", "Petechial/Purpuric", "Vesicular", "None"]', 1, 'Sign of meningococcemia and DIC (Waterhouse-Friderichsen). (Pocket Medicine)'),
    (v_topic_id, '52: "Neisseria gonorrhoeae" is a common cause of STIs and can lead to "Disseminated Gonococcal Infection" (DGI) presenting with:', '["Blindness", "Tenosynovitis, dermatitis, and polyarthralgia", "Liver failure", "None"]', 1, 'Look for pustular skin lesions and joint pain. (Harrison''s Ch. 161)'),
    (v_topic_id, '53: "Haemophilus influenzae" type b (Hib) was a leading cause of epiglottitis and meningitis in children before the advent of:', '["Antibiotics", "Vaccination", "Steroids", "None"]', 1, 'The Hib conjugate vaccine. (Step-Up)'),
    (v_topic_id, '54: "Legionella pneumophila" is often transmitted via ____ and can cause pneumonia + diarrhea + hyponatremia.', '["Person-to-person", "Aerosolized water (AC units, cooling towers)", "Food", "Ticks"]', 1, 'Diagnosed with a urinary antigen test. (Pocket Medicine)'),
    (v_topic_id, '55: "Pseudomonas aeruginosa" is a common cause of nosocomial infections and is known for producing a ____ pigment.', '["Red", "Blue-green (Pyocyanin)", "Yellow", "Black"]', 1, 'Has a distinct "fruity" odor. (Harrison''s Ch. 169)'),
    (v_topic_id, '56: "Ecthyma gangrenosum" is a black, necrotic skin lesion classically caused by sepsis with:', '["Staph aureus", "Pseudomonas aeruginosa", "E. coli", "Candida"]', 1, 'Often seen in neutropenic patients. (Step-Up)'),
    (v_topic_id, '57: "Bordetella pertussis" causes Whooping Cough. The "paroxysmal stage" involves:', '["Mild cough", "Severe coughing fits ending in an inspiratory "whoop"", "Pneumonia", "Fever only"]', 1, 'The "whoop" is more common in children than adults. (Pocket Medicine)'),
    (v_topic_id, '58: "Pasteurella multocida" infection typically follows:', '["Dog or Cat bites", "Cat scratches", "Eating raw fish", "Tick bites"]', 0, 'Requires treatment with Amoxicillin-Clavulanate. (Harrison''s Ch. 170)'),
    (v_topic_id, '59: "Bartonella henselae" is the causative agent of:', '["Cat Scratch Disease", "Rat bite fever", "Lyme disease", "Plague"]', 0, 'Causes regional lymphadenopathy. (Step-Up)'),
    (v_topic_id, '60: "Brucellosis" is often acquired from:', '["Unpasteurized dairy products or contact with livestock", "Water", "Soil", "Mosquitoes"]', 0, 'Presents with an "undulant" (rising and falling) fever. (Pocket Medicine)');

    -- SECTION 7: ANAEROBIC & ZOONOTIC INFECTIONS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '61: "Clostridioides difficile" (C. diff) infection is most commonly triggered by:', '["Spicy food", "Recent Antibiotic use (e.g., Clindamycin, Fluoroquinolones)", "Surgery", "Stress"]', 1, 'Disrupts normal gut flora. (Harrison''s Ch. 139)'),
    (v_topic_id, '62: What is the first-line treatment for a first episode of C. diff infection?', '["Metronidazole", "Oral Vancomycin or Fidaxomicin", "IV Vancomycin", "Ciprofloxacin"]', 1, 'Metronidazole is no longer first-line for adults. (Step-Up)'),
    (v_topic_id, '63: "Clostridium tetani" toxin blocks the release of ____ neurotransmitters (GABA/Glycine), leading to spastic paralysis.', '["Excitatory", "Inhibitory", "All", "None"]', 1, 'Presents as "lockjaw" and risus sardonicus. (Pocket Medicine)'),
    (v_topic_id, '64: "Clostridium botulinum" toxin blocks the release of ____ at the NMJ, leading to flaccid paralysis.', '["GABA", "Acetylcholine", "Dopamine", "Serotonin"]', 1, 'Starts with cranial nerves ("Diplopia, Dysphagia, Dysphonia"). (Harrison''s Ch. 157)'),
    (v_topic_id, '65: "Infant Botulism" is often associated with the ingestion of ____ containing spores.', '["Milk", "Honey", "Water", "Apples"]', 1, 'Infants lack the gut flora to inhibit spore germination. (Step-Up)'),
    (v_topic_id, '66: "Gas Gangrene" (Myonecrosis) is caused by:', '["Clostridium difficile", "Clostridium perfringens", "Staphylococcus", "None"]', 1, 'Characterized by rapid tissue destruction and crepitus. (Pocket Medicine)'),
    (v_topic_id, '67: "Tularemia" (Francisella tularensis) is often associated with contact with:', '["Rabbits and ticks", "Dogs", "Birds", "Fish"]', 0, 'Can cause an ulceroglandular or pneumonic syndrome. (Harrison''s Ch. 175)'),
    (v_topic_id, '68: "Plague" is caused by Yersinia pestis and is transmitted by ____.', '["Mosquitoes", "Fleas (from rodents)", "Ticks", "Bites"]', 1, 'Presents as "Bubonic" (painful lymph nodes/buboes) or "Pneumonic." (Step-Up)'),
    (v_topic_id, '69: "Leptospirosis" is transmitted via water contaminated with ____ urine.', '["Human", "Animal (rodents, dogs)", "Bird", "None"]', 1, 'Can cause "Weil''s Disease" (jaundice, renal failure). (Pocket Medicine)'),
    (v_topic_id, '70: "Q Fever" is caused by Coxiella burnetii and is often seen in:', '["Fishermen", "Farmers/Veterinarians (contact with livestock/placental tissue)", "Hikers", "None"]', 1, 'Presents as a flu-like illness or culture-negative endocarditis. (Harrison''s Ch. 191)');

    -- SECTION 8: SPIROCHETES & MYCOPLASMA
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '71: "Syphilis" is caused by Treponema pallidum. Primary syphilis is characterized by a/an ____ chancre.', '["Painful", "Painless", "Itchy", "None"]', 1, 'Heals spontaneously but the infection persists. (Harrison''s Ch. 182)'),
    (v_topic_id, '72: Secondary Syphilis classically presents with a rash on the ____ and ____.', '["Face; Neck", "Palms; Soles", "Back; Chest", "None"]', 1, 'Also associated with Condyloma lata. (Step-Up)'),
    (v_topic_id, '73: "Argyll Robertson Pupil" (accommodates but doesn''t react to light) is a sign of:', '["Neurosyphilis (Tabes Dorsalis)", "Stroke", "Glaucoma", "None"]', 0, 'Classic sign of late-stage syphilis. (Pocket Medicine)'),
    (v_topic_id, '74: "Lyme Disease" is caused by Borrelia burgdorferi and is transmitted by the ____ tick.', '["Dermacentor (Dog)", "Ixodes (Deer)", "Lone Star", "None"]', 1, 'Most common vector-borne disease in the US. (Harrison''s Ch. 186)'),
    (v_topic_id, '75: "Erythema Migrans" (target/bull''s-eye rash) is the hallmark of ____ stage Lyme disease.', '["Early localized", "Early disseminated", "Late", "Chronic"]', 0, 'Often accompanied by flu-like symptoms. (Step-Up)'),
    (v_topic_id, '76: Facial nerve (Bell''s) palsy, especially if BILATERAL, is suggestive of which stage of Lyme disease?', '["Early localized", "Early disseminated", "Late", "None"]', 1, 'Stage 2 also involves heart block and meningitis. (Pocket Medicine)'),
    (v_topic_id, '77: What is the first-line antibiotic for Lyme disease in non-pregnant adults and children > 8?', '["Penicillin", "Doxycycline", "Amoxicillin", "Ciprofloxacin"]', 1, 'Amoxicillin is used for children < 8 and pregnant women. (Harrison''s Ch. 186)'),
    (v_topic_id, '78: "Rocky Mountain Spotted Fever" (RMSF) is caused by Rickettsia rickettsii. The rash classically starts on the ____ and spreads ____.', '["Trunk; Outward", "Wrists/Ankles; Inward (centripetal)", "Face; Down", "None"]', 1, 'A medical emergency; treat with Doxycycline immediately. (Step-Up)'),
    (v_topic_id, '79: "Mycoplasma pneumoniae" (Walking Pneumonia) is unique because it lacks a ____.', '["DNA", "Cell wall", "Nucleus", "Ribosomes"]', 1, 'Therefore, it does NOT show up on Gram stain and is resistant to Beta-lactams. (Pocket Medicine)'),
    (v_topic_id, '80: Mycoplasma pneumoniae is associated with which hematologic finding?', '["Anemia", "Cold Agglutinins (IgM antibodies)", "Leukemia", "None"]', 1, 'Can cause autoimmune hemolytic anemia. (Harrison''s Ch. 189)');

    -- SECTION 9: INFECTIOUS DISEASE REVIEW
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '81: "Jarisch-Herxheimer Reaction" is a fever/chill response that occurs after starting treatment for:', '["Lyme", "Syphilis", "Malaria", "Both Lyme and Syphilis"]', 3, 'Due to the release of endotoxins from dying spirochetes. (Step-Up)'),
    (v_topic_id, '82: "Waterhouse-Friderichsen Syndrome" is adrenal hemorrhage caused by fulminant:', '["Staph aureus", "Neisseria meningitidis (Meningococcemia)", "E. coli", "None"]', 1, 'Leads to acute adrenal insufficiency and shock. (Pocket Medicine)'),
    (v_topic_id, '83: "Cat Scratch Disease" lymphadenopathy is treated with which antibiotic if severe?', '["Penicillin", "Azithromycin", "Ciprofloxacin", "None"]', 1, 'Most cases are self-limiting. (Harrison''s Ch. 172)'),
    (v_topic_id, '84: "HACEK" group endocarditis is best treated with:', '["Penicillin", "Ceftriaxone", "Vancomycin", "None"]', 1, 'They are Gram-negative bacilli. (Step-Up)'),
    (v_topic_id, '85: "Pasteurella" from a cat bite is highly sensitive to:', '["Macrolides", "Penicillins (e.g., Amoxicillin-Clavulanate)", "Aminoglycosides", "None"]', 1, 'Avoid First-generation cephalosporins. (Pocket Medicine)'),
    (v_topic_id, '86: "Ehrlichiosis" and "Anaplasmosis" are tick-borne diseases that cause leukopenia, thrombocytopenia, and elevated LFTs. Treatment is:', '["Penicillin", "Doxycycline", "Acyclovir", "None"]', 1, '"White cells" (Ehrlichia) vs "Platelets" (Anaplasma). (Harrison''s Ch. 191)'),
    (v_topic_id, '87: "Malignant Otitis Externa" is a severe infection of the ear canal and skull base in diabetics, caused by:', '["S. aureus", "Pseudomonas aeruginosa", "Candida", "None"]', 1, 'Requires long-term IV antibiotics. (Step-Up)'),
    (v_topic_id, '88: "Hot Tub Folliculitis" is caused by:', '["Staph", "Pseudomonas aeruginosa", "Fungus", "None"]', 1, 'Self-limiting infection from contaminated water. (Pocket Medicine)');

    RAISE NOTICE 'SUCCESS: Infectious Diseases MCQ Part 1 (1-88) registered.';
END $$;

COMMIT;
