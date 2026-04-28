-- Migration: Year 3 - Infectious Diseases MCQ Bank (PART 2: 89-176)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-29

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'infectious-diseases' LIMIT 1;

    -- SECTION 10: PULMONARY INFECTIONS (PNEUMONIA)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '89: "Community-Acquired Pneumonia" (CAP) is most commonly caused by which organism?', '["Mycoplasma", "Streptococcus pneumoniae", "Haemophilus", "Legionella"]', 1, 'Classic "rusty sputum" and lobar consolidation. (Harrison''s Ch. 135)'),
    (v_topic_id, '90: Which scoring system is used to decide whether a CAP patient needs outpatient, inpatient, or ICU care?', '["SOFA", "CURB-65", "Duke", "Wells"]', 1, 'Confusion, Urea, RR, BP, Age > 65. (Step-Up)'),
    (v_topic_id, '91: "Atypical Pneumonia" (Walking Pneumonia) is most commonly caused by ____ and presents with interstitial infiltrates.', '["S. pneumoniae", "Mycoplasma pneumoniae", "Staph aureus", "None"]', 1, 'Also caused by Chlamydia pneumoniae and Legionella. (Pocket Medicine)'),
    (v_topic_id, '92: "Hospital-Acquired Pneumonia" (HAP) occurs >= ____ hours after admission.', '["12", "24", "48", "72"]', 2, 'Risk factors include mechanical ventilation and poor hand hygiene. (Harrison''s Ch. 135)'),
    (v_topic_id, '93: "Klebsiella pneumoniae" is a common cause of pneumonia in alcoholics and classically presents with ____ sputum.', '["Rusty", "Currant-jelly", "Green", "Bloody"]', 1, 'Thick, mucoid sputum. (Step-Up)'),
    (v_topic_id, '94: Aspiration pneumonia is most commonly caused by ____ and typically involves the ____.', '["Virus; Upper lobes", "Anaerobes; Right lower lobe", "Staph; Left lobe", "None"]', 1, 'Occurs in patients with impaired swallowing or consciousness. (Pocket Medicine)'),
    (v_topic_id, '95: A patient with pneumonia and a history of exposure to BIRDS (e.g., parrots) likely has:', '["Legionella", "Psittacosis (Chlamydia psittaci)", "Q Fever", "Tularemia"]', 1, 'Presents with high fever and splenomegaly. (Harrison''s Ch. 135)'),
    (v_topic_id, '96: "Pneumocystis jirovecii" Pneumonia (PCP) is an opportunistic infection in AIDS patients, classically showing ____ on X-ray.', '["Lobar consolidation", "Diffuse ground-glass / perihilar infiltrates", "Large cavity", "None"]', 1, 'Requires treatment with high-dose TMP-SMX. (Step-Up)'),
    (v_topic_id, '97: PCP prophylaxis is indicated in HIV patients when their CD4 count drops below:', '["500", "200", "100", "50"]', 1, 'TMP-SMX is the drug of choice. (Pocket Medicine)'),
    (v_topic_id, '98: Which physical exam finding suggests "Consolidation" (e.g., pneumonia)?', '["Decreased tactile fremitus", "Increased tactile fremitus and Dullness to percussion", "Hyperresonance", "Wheezing"]', 1, 'Sound travels better through solid (fluid-filled) lung. (Harrison''s Ch. 135)');

    -- SECTION 11: TUBERCULOSIS (TB)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '99: "Mycobacterium tuberculosis" is an acid-fast bacillus. "Primary TB" classically involves the ____ lobes, while "Reactivation TB" involves the ____ lobes.', '["Upper; Lower", "Lower/Middle; Upper", "Right; Left", "None"]', 1, 'Upper lobes are more oxygen-rich, favoring TB growth. (Harrison''s Ch. 176)'),
    (v_topic_id, '100: "Ghon Complex" consists of a calcified lung nodule and a/an ____.', '["Abscess", "Ipsilateral hilar lymph node", "Pleural effusion", "Cavity"]', 1, 'Sign of previous primary TB infection. (Step-Up)'),
    (v_topic_id, '101: A "Positive PPD" test measures which type of hypersensitivity reaction?', '["Type I", "Type II", "Type III", "Type IV (Delayed-type)"]', 3, 'Mediated by T-cells. (Pocket Medicine)'),
    (v_topic_id, '102: "Miliary TB" refers to ____ spread of the bacteria, showing "millet seed" nodules on X-ray.', '["Direct", "Hematogenous (blood-borne)", "Lymphatic", "None"]', 1, 'Can involve almost any organ (liver, spleen, marrow). (Harrison''s Ch. 176)'),
    (v_topic_id, '103: "Pott''s Disease" refers to TB involving the:', '["Kidneys", "Spine", "Liver", "Brain"]', 1, 'Causes vertebral destruction and potentially paralysis. (Step-Up)'),
    (v_topic_id, '104: What is the standard 4-drug regimen (RIPE) for active TB treatment?', '["Rifampin, Insulin, Penicillin, Ethambutol", "Rifampin, Isoniazid, Pyrazinamide, Ethambutol", "Rifampin, Isoniazid, Penicillin, Streptomycin", "None"]', 1, 'Initial phase lasts 2 months. (Pocket Medicine)'),
    (v_topic_id, '105: Which TB drug is most notorious for causing Peripheral Neuropathy (prevented by Vitamin B6)?', '["Rifampin", "Isoniazid (INH)", "Pyrazinamide", "Ethambutol"]', 1, 'INH interferes with B6 (pyridoxine) metabolism. (Harrison''s Ch. 176)'),
    (v_topic_id, '106: Which TB drug can cause "Optic Neuritis" (red-green color blindness)?', '["Rifampin", "Isoniazid", "Pyrazinamide", "Ethambutol"]', 3, '"E" for "E"yes. (Step-Up)'),
    (v_topic_id, '107: "Rifampin" is a potent inducer of the P450 system and characteristically turns body fluids:', '["Blue", "Orange", "Green", "Black"]', 1, 'Benign side effect; warn the patient! (Pocket Medicine)'),
    (v_topic_id, '108: A "Positive IGRA" (Interferon-Gamma Release Assay) is preferred over PPD in patients who have received:', '["Antibiotics", "BCG Vaccine", "Steroids", "None"]', 1, 'BCG can cause a false-positive PPD but not IGRA. (Harrison''s Ch. 176)');

    -- SECTION 12: GI & INTRA-ABDOMINAL INFECTIONS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '109: "Infectious Diarrhea" with blood and mucus (Dysentery) is most commonly caused by ____ or ____.', '["Giardia; Rotavirus", "Shigella; Campylobacter", "Cholera; ETEC", "None"]', 1, 'Indicates invasive disease. (Harrison''s Ch. 141)'),
    (v_topic_id, '110: "Campylobacter jejuni" is a leading cause of bacterial diarrhea and is a major trigger for which neurological condition?', '["Stroke", "Guillain-Barre Syndrome", "MS", "Parkinson''s"]', 1, 'Molecular mimicry between bacterial LPS and gangliosides. (Step-Up)'),
    (v_topic_id, '111: Diarrhea following the consumption of raw SEAFOOD is classically associated with:', '["Salmonella", "Vibrio parahaemolyticus", "E. coli", "Giardia"]', 1, 'V. vulnificus can cause severe cellulitis in patients with liver disease. (Pocket Medicine)'),
    (v_topic_id, '112: "Enterotoxigenic E. coli" (ETEC) is the most common cause of:', '["Bloody diarrhea", "Traveler''s Diarrhea (watery)", "Hemolytic Uremic Syndrome", "None"]', 1, 'Due to heat-labile (LT) and heat-stable (ST) toxins. (Harrison''s Ch. 162)'),
    (v_topic_id, '113: "Enterohemorrhagic E. coli" (EHEC / O157:H7) should NOT be treated with antibiotics because it may increase the risk of:', '["Fever", "Hemolytic Uremic Syndrome (HUS)", "Constipation", "Liver failure"]', 1, 'Antibiotics increase Shiga toxin release. (Step-Up)'),
    (v_topic_id, '114: "Typhoid Fever" (Salmonella Typhi) classically presents with "Rose spots" on the abdomen and:', '["Tachycardia", "Relative Bradycardia (Faget sign)", "High WBC count", "Diarrhea in all cases"]', 1, 'Often involves constipation early on and a "step-ladder" fever. (Pocket Medicine)'),
    (v_topic_id, '115: "Giardia lamblia" causes foul-smelling, fatty diarrhea (steatorrhea) and is often acquired from:', '["Raw eggs", "Mountain stream water (camping/hiking)", "Raw pork", "Air"]', 1, 'Cysts are resistant to chlorine. (Harrison''s Ch. 226)'),
    (v_topic_id, '116: "Spontaneous Bacterial Peritonitis" (SBP) in a patient with cirrhosis is defined by an ascitic fluid absolute neutrophil count (ANC) >= ____.', '["100", "250", "500", "1000"]', 1, 'Commonly caused by E. coli or Klebsiella. (Step-Up)'),
    (v_topic_id, '117: What is the most common cause of "Food Poisoning" with symptoms starting within 1-6 hours (vomiting)?', '["Salmonella", "Staphylococcus aureus (preformed toxin)", "E. coli", "Listeria"]', 1, 'Associated with potato salad, mayonnaise, or custards. (Pocket Medicine)'),
    (v_topic_id, '118: "B. cereus" food poisoning with rapid vomiting is classically associated with:', '["Raw fish", "Reheated Fried Rice", "Raw milk", "Apples"]', 1, 'Spores survive cooking and germinate when rice is left out. (Harrison''s Ch. 156)');

    -- SECTION 13: URINARY TRACT INFECTIONS (UTIs)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '119: What is the most common cause of UTIs (Cystitis and Pyelonephritis)?', '["Staph saprophyticus", "Escherichia coli", "Proteus", "Klebsiella"]', 1, 'Responsible for ~80% of outpatient cases. (Harrison''s Ch. 145)'),
    (v_topic_id, '120: "Staphylococcus saprophyticus" is a common cause of UTI in which specific population?', '["Elderly men", "Young, sexually active women", "Hospitalized patients", "Infants"]', 1, 'Second most common cause in this group. (Step-Up)'),
    (v_topic_id, '121: "Pyelonephritis" is distinguished from simple cystitis by the presence of:', '["Painful urination", "Fever, flank pain, and CVA tenderness", "Frequency", "None"]', 1, 'Requires longer antibiotic courses. (Pocket Medicine)'),
    (v_topic_id, '122: "WBC Casts" in the urine are a hallmark of:', '["Cystitis", "Pyelonephritis", "Kidney stones", "Diabetes"]', 1, 'Indicates the infection has reached the renal tubules. (Harrison''s Ch. 145)'),
    (v_topic_id, '123: A UTI with an alkaline urine pH (> 7.0) suggests which organism?', '["E. coli", "Proteus mirabilis", "Candida", "None"]', 1, 'Urease-producing bacteria split urea into ammonia. (Step-Up)'),
    (v_topic_id, '124: "Proteus" UTIs are associated with an increased risk of which type of kidney stone?', '["Calcium oxalate", "Struvite (Staghorn) calculi", "Uric acid", "Cystine"]', 1, 'Stones are composed of magnesium ammonium phosphate. (Pocket Medicine)'),
    (v_topic_id, '125: Asymptomatic bacteriuria should ONLY be treated in which two populations?', '["Elderly; Diabetics", "Pregnant women; Patients undergoing urologic procedures", "Men; Children", "None"]', 1, 'Reduces risk of pyelonephritis and premature birth in pregnancy. (Harrison''s Ch. 145)'),
    (v_topic_id, '126: What is the first-line antibiotic for uncomplicated cystitis in a non-pregnant woman?', '["Ciprofloxacin", "Nitrofurantoin or TMP-SMX", "Penicillin", "Vancomycin"]', 1, 'Nitrofurantoin is preferred if resistance is low. (Step-Up)'),
    (v_topic_id, '127: "Honeymoon Cystitis" refers to UTIs triggered by:', '["Eating too much honey", "Sexual intercourse", "Stress", "None"]', 1, 'Due to mechanical introduction of bacteria into the urethra. (Pocket Medicine)'),
    (v_topic_id, '128: Recurrent UTIs in an older man should prompt an evaluation for:', '["Prostate enlargement / Chronic prostatitis", "Lung cancer", "Diabetes only", "None"]', 0, 'Incomplete bladder emptying. (Harrison''s Ch. 145)');

    -- SECTION 14: SEXUALLY TRANSMITTED INFECTIONS (STIs)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '129: What is the most common BACTERIAL STI worldwide?', '["Gonorrhea", "Chlamydia trachomatis", "Syphilis", "Trichomoniasis"]', 1, 'Often asymptomatic but can lead to PID. (Step-Up)'),
    (v_topic_id, '130: "Chlamydia" and "Gonorrhea" are often co-infectants; what is the standard empiric treatment for both?', '["Penicillin + Azithromycin", "Ceftriaxone + Doxycycline", "Vancomycin + Cipro", "None"]', 1, 'Ceftriaxone (IM) for Gonorrhea, Doxycycline (Oral) for Chlamydia. (Pocket Medicine)'),
    (v_topic_id, '131: "Pelvic Inflammatory Disease" (PID) presents with abdominal pain, cervical motion tenderness, and:', '["Fever and discharge", "Blindness", "Cough", "None"]', 0, 'Risk of infertility and ectopic pregnancy. (Harrison''s Ch. 146)'),
    (v_topic_id, '132: "Fitz-Hugh-Curtis Syndrome" is a complication of PID involving inflammation of the:', '["Liver capsule (perihepatitis)", "Spleen", "Heart", "Lungs"]', 0, 'Classic "violin-string" adhesions. (Step-Up)'),
    (v_topic_id, '133: "Trichomonas vaginalis" is a protozoan that causes a "strawberry cervix" and a ____ vaginal discharge.', '["White and thick", "Frothy, yellow-green and foul-smelling", "Clear", "Bloody"]', 1, 'Treated with Metronidazole for both partners. (Pocket Medicine)'),
    (v_topic_id, '134: "Bacterial Vaginosis" (BV) is caused by an overgrowth of Gardnerella vaginalis and shows ____ cells on wet mount.', '["Blast", "Clue cells (epithelial cells covered in bacteria)", "Smudge", "None"]', 1, 'Associated with a "fishy odor" (positive Whiff test). (Harrison''s Ch. 146)'),
    (v_topic_id, '135: "Lymphogranuloma Venereum" (LGV) is caused by specific strains of Chlamydia and presents with painful ____.', '["Rash", "Inguinal lymphadenopathy (buboes)", "Eye infection", "None"]', 1, 'Can also cause proctitis. (Step-Up)'),
    (v_topic_id, '136: "Chancroid" is caused by Haemophilus ducreyi and presents with a ____ genital ulcer.', '["Painless", "Painful", "Itchy", "None"]', 1, '"Ducreyi" = "Do cry" because it''s painful. (Pocket Medicine)');

    -- SECTION 15: SKIN & SOFT TISSUE INFECTIONS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '137: "Cellulitis" is a deep skin infection most commonly caused by ____ or ____.', '["E. coli; Pseudomonas", "Streptococcus pyogenes; Staphylococcus aureus", "Fungus", "None"]', 1, 'Presents with redness, warmth, and swelling. (Harrison''s Ch. 136)'),
    (v_topic_id, '138: "Non-purulent" cellulitis is usually treated empirically with coverage for:', '["MRSA", "Streptococcus", "Pseudomonas", "Anaerobes"]', 1, 'If purulent (abscess), MRSA coverage is required. (Step-Up)'),
    (v_topic_id, '139: "Necrotizing Fasciitis" is a surgical emergency. The "Type I" form is ____ while "Type II" is ____.', '["Fungal; Viral", "Polymicrobial; Monomicrobial (Group A Strep)", "Slow; Fast", "None"]', 1, 'Requires immediate debridement and broad antibiotics. (Pocket Medicine)'),
    (v_topic_id, '140: A patient with "pain out of proportion to exam" and gas in the tissues on X-ray likely has:', '["Simple cellulitis", "Necrotizing Fasciitis", "Dermatitis", "None"]', 1, 'High mortality if not treated quickly. (Harrison''s Ch. 136)'),
    (v_topic_id, '141: "Folliculitis" is an infection of the hair follicle, often caused by:', '["S. aureus", "Pseudomonas (in hot tubs)", "Both", "None"]', 2, 'Common and usually self-limiting. (Step-Up)'),
    (v_topic_id, '142: A "Carbuncle" is a/an:', '["Single abscess", "Cluster of interconnected furuncles (abscesses)", "Viral rash", "None"]', 1, 'Typically requires drainage and antibiotics. (Pocket Medicine)'),
    (v_topic_id, '143: "Impetigo" with "honey-colored crusts" is common in children and caused by:', '["Staph and Strep", "Pseudomonas", "Virus", "None"]', 0, 'Highly contagious. (Harrison''s Ch. 136)'),
    (v_topic_id, '144: "Staphylococcal Scalded Skin Syndrome" (SSSS) is caused by an exfoliative toxin and differs from TEN because:', '["It involves the mouth", "It is deeper", "The split is more superficial (subcorneal)", "It is caused by drugs"]', 2, 'TEN (Toxic Epidermal Necrolysis) is a drug reaction. (Step-Up)'),
    (v_topic_id, '145: "Ecthyma" is a deeper form of impetigo that results in:', '["Scarring", "Ulcers with "punched-out" appearance", "Blindness", "None"]', 1, 'Often seen in the elderly or neglected patients. (Pocket Medicine)'),
    (v_topic_id, '146: Which organism is a common cause of cellulitis in patients with exposure to FRESH water?', '["S. aureus", "Aeromonas hydrophila", "Vibrio", "None"]', 1, 'Often follows trauma in lakes or rivers. (Harrison''s Ch. 136)');

    -- SECTION 16: BONE & JOINT INFECTIONS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '147: What is the most common cause of "Osteomyelitis" (bone infection) overall?', '["Streptococcus", "Staphylococcus aureus", "Salmonella", "Pseudomonas"]', 1, 'Can occur via hematogenous spread or direct inoculation. (Step-Up)'),
    (v_topic_id, '148: Osteomyelitis in a patient with Sickle Cell Disease is classically associated with:', '["Staph", "Salmonella", "E. coli", "None"]', 1, 'High-yield board association. (Pocket Medicine)'),
    (v_topic_id, '149: "Vertebral Osteomyelitis" in an adult is often caused by hematogenous spread from the:', '["Lungs", "Urinary tract or skin", "Brain", "None"]', 1, 'Requires MRI for diagnosis. (Harrison''s Ch. 137)'),
    (v_topic_id, '150: "Septic Arthritis" (infection of the joint space) is a medical emergency; what is the most common cause in young, sexually active adults?', '["S. aureus", "Neisseria gonorrhoeae", "Streptococcus", "None"]', 1, 'Presents as migratory polyarthralgia or monoarthritis. (Step-Up)'),
    (v_topic_id, '151: The gold standard for diagnosing septic arthritis is:', '["X-ray", "Joint aspiration (Arthrocentesis) with cell count and culture", "MRI", "Blood cultures"]', 1, 'WBC count usually > 50,000 cells/mm3. (Pocket Medicine)'),
    (v_topic_id, '152: "Prosthetic Joint Infection" occurring within 3 months of surgery is usually caused by ____, while later infections are caused by ____.', '["Virus; Bacteria", "S. aureus; Coagulase-negative Staph (e.g., S. epidermidis)", "Fungus; Virus", "None"]', 1, 'Biofilm formation is a major challenge. (Harrison''s Ch. 137)'),
    (v_topic_id, '153: What is the treatment for "Chronic Osteomyelitis"?', '["Antibiotics only", "Surgical debridement + long-term antibiotics", "Splinting", "None"]', 1, 'Antibiotics cannot reach necrotic bone (sequestrum). (Step-Up)'),
    (v_topic_id, '154: A patient with a puncture wound through a SNEAKER is at risk for osteomyelitis caused by:', '["Staph", "Pseudomonas aeruginosa", "Salmonella", "None"]', 1, 'Pseudomonas thrives in the moist environment of the shoe sole. (Pocket Medicine)'),
    (v_topic_id, '155: "Reactive Arthritis" (Reiter''s Syndrome) follows an infection (GI or GU) and is characterized by the triad of:', '["Fever, Rash, Pain", "Urethritis, Uveitis, and Arthritis", "Blindness, Deafness, Pain", "None"]', 1, '"Can''t see, can''t pee, can''t climb a tree." (Harrison''s Ch. 137)'),
    (v_topic_id, '156: "Lyme Arthritis" classically presents in the ____ stage and typically affects the ____.', '["Early; Wrists", "Late; Large joints (e.g., Knee)", "Early; Ankles", "None"]', 1, 'Can be chronic if not treated early. (Step-Up)');

    -- SECTION 17: INFECTIOUS DISEASE POTPOURRI
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '157: "Brucellosis" is often acquired from:', '["Unpasteurized dairy", "Fresh water", "Soil", "Air"]', 0, 'Presents with "undulant" fever. (Pocket Medicine)'),
    (v_topic_id, '158: "Anthrax" (Bacillus anthracis) inhalation classically causes:', '["Pneumonia", "Hemorrhagic Mediastinitis", "Liver failure", "None"]', 1, 'Look for widened mediastinum on X-ray. (Harrison''s Ch. 156)'),
    (v_topic_id, '159: "Tularemia" (Francisella tularensis) is often associated with contact with:', '["Rabbits", "Dogs", "Birds", "Fish"]', 0, 'Can cause an ulceroglandular syndrome. (Step-Up)'),
    (v_topic_id, '160: "Plague" (Yersinia pestis) is transmitted by:', '["Mosquitoes", "Fleas (from rodents)", "Ticks", "Bites"]', 1, 'Bubonic plague causes painful lymph nodes (buboes). (Pocket Medicine)'),
    (v_topic_id, '161: "Q Fever" (Coxiella burnetii) is often seen in:', '["Fishermen", "Farmers/Veterinarians", "Hikers", "None"]', 1, 'Acquired from livestock birth products. (Harrison''s Ch. 191)'),
    (v_topic_id, '162: "Leptospirosis" can cause "Weil''s Disease," which includes:', '["Fever only", "Jaundice and Renal Failure", "Blindness", "None"]', 1, 'Acquired from water contaminated with animal urine. (Step-Up)'),
    (v_topic_id, '163: "Actinomyces" classically causes abscesses with ____.', '["Black spots", "Sulfur granules", "White discharge", "None"]', 1, 'Anaerobic, branching Gram-positive rod. (Pocket Medicine)'),
    (v_topic_id, '164: "Nocardia" is an acid-fast branching rod that causes infection in the:', '["Lungs and Brain", "Liver", "Bladder", "None"]', 0, 'Often affects immunocompromised patients. (Harrison''s Ch. 180)'),
    (v_topic_id, '165: "Tetanus" toxin blocks ____ neurotransmitters, while "Botulinum" toxin blocks ____.', '["Inhibitory; Excitatory (ACh)", "Excitatory; Inhibitory", "Both; Both", "None"]', 0, 'Spastic vs Flaccid paralysis. (Step-Up)'),
    (v_topic_id, '166: "C. diff" toxins are Toxin A (Enterotoxin) and Toxin B (____).', '["Neurotoxin", "Cytotoxin", "Hepatotoxin", "None"]', 1, 'Toxin B is more potent. (Pocket Medicine)'),
    (v_topic_id, '167: "H. pylori" is a major cause of peptic ulcers and is a risk factor for:', '["Gastric Adenocarcinoma and MALT Lymphoma", "Colon CA", "Liver CA", "None"]', 0, 'Urease-positive Gram-negative rod. (Harrison''s Ch. 173)'),
    (v_topic_id, '168: "Whipple''s Disease" is caused by Tropheryma whipplei and presents with diarrhea, weight loss, and:', '["Joint pain", "Vision loss", "Hearing loss", "None"]', 0, 'PAS-positive macrophages in the lamina propria. (Step-Up)'),
    (v_topic_id, '169: "Rat Bite Fever" is caused by:', '["Streptobacillus moniliformis", "Pasteurella", "Bartonella", "None"]', 0, 'Presents with fever, rash, and joint pain. (Pocket Medicine)'),
    (v_topic_id, '170: "Orf" is a viral skin infection acquired from:', '["Cats", "Sheep/Goats", "Dogs", "Birds"]', 1, 'Presents as a localized nodule on the hand. (Harrison''s Ch. 200)'),
    (v_topic_id, '171: "Ehrlichiosis" shows morulae (mulberry-like inclusions) in ____, while "Anaplasmosis" shows them in ____.', '["Monocytes; Neutrophils", "Neutrophils; Monocytes", "RBCs; WBCs", "None"]', 0, 'Both are tick-borne and treated with Doxycycline. (Step-Up)'),
    (v_topic_id, '172: "Lyme Disease" - Stage 1 is ____, Stage 2 is ____, Stage 3 is ____.', '["Rash; Heart/Nerve; Arthritis", "Arthritis; Rash; Heart", "Heart; Rash; Arthritis", "None"]', 0, 'Standard progression. (Pocket Medicine)'),
    (v_topic_id, '173: "Syphilis" - Primary is ____, Secondary is ____, Tertiary is ____.', '["Rash; Chancre; Gumma", "Chancre; Rash; Gummas/Neuro", "Gumma; Rash; Chancre", "None"]', 1, 'Chancre = Primary; Rash = Secondary. (Harrison''s Ch. 182)'),
    (v_topic_id, '174: "Mycoplasma" causes a/an ____ reaction on blood testing.', '["Agglutination", "Cold Agglutinin (IgM)", "Precipitation", "None"]', 1, 'Useful diagnostic clue. (Step-Up)'),
    (v_topic_id, '175: "Chlamydia" life cycle involves ____ bodies (infectious) and ____ bodies (replicative).', '["Elementary; Reticulate", "Reticulate; Elementary", "Blast; Mature", "None"]', 0, 'Intracellular bacteria. (Pocket Medicine)'),
    (v_topic_id, '176: "Rickettsia" infections (like RMSF) are unique because the rash often starts on the:', '["Trunk", "Wrists and Ankles", "Face", "Neck"]', 1, 'Spreads centripetally. (Harrison''s Ch. 191)');

    RAISE NOTICE 'SUCCESS: Infectious Diseases MCQ Part 2 (89-176) registered.';
END $$;

COMMIT;
