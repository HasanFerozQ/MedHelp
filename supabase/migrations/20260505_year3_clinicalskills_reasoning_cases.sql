BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- Fetch the topic ID for Clinical Reasoning & Differential Diagnosis
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'clinical-reasoning-diagnosis' LIMIT 1;

    -- CASE 01: Chest Pain Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Chest Pain', 'A 55-year-old male presents with sudden, sharp, tearing chest pain that radiates to his back. He is hypertensive (180/100) and has asymmetric pulses in his arms.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which diagnosis must be at the top of your differential given the "tearing" nature and radiation to the back?', '["Acute MI", "Aortic Dissection", "Pulmonary Embolism", "Pneumothorax"]', 1, 'Tearing pain radiating to the back is the classic description of aortic dissection.'),
    (v_case_id, 'What physical exam finding is most helpful in differentiating this from a simple MI?', '["Crackles in the lungs", "Asymmetric blood pressure/pulses between the arms", "A S3 gallop", "Tachycardia"]', 1, 'Asymmetric pulses or a > 20 mmHg difference in SBP between arms is highly suggestive of a dissection involving the arch.'),
    (v_case_id, 'If the pain were instead pleuritic (worse with inspiration) and associated with sudden SOB and a swollen calf, what would be the most likely diagnosis?', '["Pneumonia", "Pulmonary Embolism (PE)", "Aortic Dissection", "Pericarditis"]', 1, 'The combination of pleuritic chest pain, SOB, and signs of DVT (swollen calf) makes PE the most likely diagnosis.');

    -- CASE 02: Acute Dyspnea
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Breathless Patient', 'An 80-year-old female presents with acute shortness of breath. She has a history of hypertension. On exam, she has bilateral crackles, JVD, and 2+ pitting edema.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Acute Asthma Exacerbation", "Acute Decompensated Heart Failure (ADHF)", "Pneumonia", "Pulmonary Embolism"]', 1, 'The triad of crackles, JVD, and edema is highly suggestive of fluid overload (heart failure).'),
    (v_case_id, 'Which lab test would be most helpful in confirming this diagnosis in the ER?', '["D-dimer", "Troponin", "B-type Natriuretic Peptide (BNP)", "White blood cell count"]', 2, 'BNP is released in response to ventricular stretch and is very sensitive for ADHF.'),
    (v_case_id, 'If the patient also had a high fever, productive cough, and FOCAL crackles on one side, which diagnosis becomes more likely?', '["Heart failure", "Pneumonia", "Asthma", "COPD"]', 1, 'Fever and focal lung findings suggest an infectious process (pneumonia).');

    -- CASE 03: Syncope Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'A Sudden Fall', 'A 70-year-old male passes out while walking to his car. He had no warning symptoms (no prodrome). He regained consciousness quickly. On exam, he has a harsh systolic crescendo-decrescendo murmur at the right upper sternal border.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most concerning category of syncope in this patient?', '["Vasovagal (Neurocardiogenic)", "Cardiac (Structural/Arrhythmic)", "Orthostatic", "Seizure"]', 1, 'Exertional syncope without a prodrome in an elderly patient is often cardiac and life-threatening.'),
    (v_case_id, 'Based on the murmur, what is the likely underlying cause?', '["Mitral Regurgitation", "Aortic Stenosis", "Hypertrophic Cardiomyopathy", "Atrial Fibrillation"]', 1, 'Aortic stenosis is a classic cause of exertional syncope.'),
    (v_case_id, 'How do you differentiate syncope from a seizure?', '["Syncope always has a long recovery", "Seizures typically have a post-ictal period (confusion), tongue biting, and longer duration", "Syncope involves rhythmic jerking", "They are the same thing"]', 1, 'The post-ictal state is the most helpful clinical discriminator.');

    -- CASE 04: RUQ Abdominal Pain
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Right Upper Quadrant Pain', 'A 45-year-old obese female presents with severe RUQ pain that started after eating a burger. She has a positive Murphy''s sign.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Acute Hepatitis", "Acute Cholecystitis", "Peptic Ulcer Disease", "Acute Pancreatitis"]', 1, 'Postprandial RUQ pain and a positive Murphy''s sign (pain on inspiration during RUQ palpation) are classic for cholecystitis.'),
    (v_case_id, 'If the patient also has jaundice, fever, and RUQ pain (Charcot''s Triad), what is the most likely diagnosis?', '["Cholecystitis", "Ascending Cholangitis", "Hepatitis A", "Biliary Colic"]', 1, 'Charcot''s Triad indicates an infection of the bile duct system (cholangitis), which is a medical emergency.'),
    (v_case_id, 'What is the first-line imaging study for suspected gallbladder disease?', '["CT Abdomen", "RUQ Ultrasound", "HIDA Scan", "MRI"]', 1, 'Ultrasound is highly sensitive for stones and gallbladder wall thickening.');

    -- CASE 05: RLQ Abdominal Pain
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Right Lower Quadrant Pain', 'A 20-year-old male presents with 12 hours of abdominal pain that started around his umbilicus and moved to the RLQ. He has nausea and a low-grade fever.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Appendicitis", "Diverticulitis", "Crohn''s disease", "Kidney stone"]', 0, 'Migratory pain to McBurney''s point (RLQ) is highly characteristic of appendicitis.'),
    (v_case_id, 'In a young woman with RLQ pain, what test MUST be performed to rule out a life-threatening alternative?', '["CT scan", "Pregnancy test (hCG)", "Urinalysis", "CBC"]', 1, 'Ectopic pregnancy can present identically to appendicitis and must be ruled out.'),
    (v_case_id, 'Pain in the RLQ upon palpation of the LEFT lower quadrant is known as:', '["Psoas sign", "Obturator sign", "Rovsing''s sign", "Murphy''s sign"]', 2, 'Rovsing''s sign suggests peritoneal irritation in the RLQ.');

    -- CASE 06: Altered Mental Status
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Confused Elderly Patient', 'An 85-year-old female is brought from a nursing home for "not acting like herself." She is disoriented to time and place but has no focal neurological deficits.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common cause of acute confusion (delirium) in the elderly?', '["Alzheimer''s disease", "Urinary Tract Infection (UTI)", "Stroke", "Brain tumor"]', 1, 'Infections (UTI, Pneumonia) frequently present as isolated confusion in the elderly.'),
    (v_case_id, 'Using the "MIST" mnemonic for altered mental status, what does the "M" stand for?', '["Muscle", "Metabolic (e.g., glucose, electrolytes)", "Memory", "Migraine"]', 1, 'Hypoglycemia, hyponatremia, and hypercalcemia are frequent metabolic causes of confusion.'),
    (v_case_id, 'How do you distinguish Delirium from Dementia?', '["Dementia is acute; Delirium is chronic", "Delirium has an acute onset and fluctuating course; Dementia is progressive and chronic", "Delirium only affects memory", "There is no difference"]', 1, 'Delirium is a medical emergency with a rapid onset; dementia is a slow, steady decline.');

    -- CASE 07: Headache Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The "Worst Headache of My Life"', 'A 40-year-old woman presents with the sudden onset of an "explosive" headache that reached maximum intensity in seconds. She has neck stiffness.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Migraine", "Cluster headache", "Subarachnoid Hemorrhage (SAH)", "Tension headache"]', 2, 'The "thunderclap" headache is the classic presentation of SAH, often from a ruptured berry aneurysm.'),
    (v_case_id, 'A unilateral headache associated with eye tearing and nasal congestion that lasts 30-90 minutes is likely:', '["Migraine", "Cluster headache", "Tension headache", "Brain tumor"]', 1, 'Cluster headaches are intensely painful, peri-orbital, and associated with autonomic symptoms.'),
    (v_case_id, 'What is the "red flag" symptom in this case that warrants immediate neuroimaging?', '["Unilateral pain", "Nausea", "Sudden onset ("thunderclap") and neck stiffness", "Sensitivity to light"]', 2, 'Sudden onset is always a red flag for vascular emergencies.');

    -- CASE 08: Fever and Rash
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever and Purple Spots', 'A 19-year-old college student presents with high fever, headache, and a rapidly spreading rash of small purple spots (petechiae and purpura) on his legs.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most life-threatening diagnosis in this case?', '["Varicella", "Meningococcemia (Neisseria meningitidis)", "Lyme disease", "Drug allergy"]', 1, 'Meningococcal sepsis can be fatal within hours; the petechial rash is a classic sign.'),
    (v_case_id, 'If the rash started on the wrists and ankles and spread inward, and the patient had recently been hiking in North Carolina, what diagnosis should you consider?', '["Rocky Mountain Spotted Fever (RMSF)", "Measles", "Meningococcemia", "Syphilis"]', 0, 'RMSF (Rickettsia rickettsii) classically starts on the extremities and spreads centripetally.'),
    (v_case_id, 'A "target" or "bullseye" rash (Erythema Migrans) is pathognomonic for:', '["Lyme disease", "Secondary syphilis", "Tinea corporis", "Spider bite"]', 0, 'Lyme disease (Borrelia burgdorferi) is the cause of erythema migrans.');

    -- CASE 09: Joint Pain Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Red, Hot Joint', 'A 50-year-old male presents with sudden, extreme pain in his left great toe. The joint is swollen, red, and too painful to touch.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Rheumatoid arthritis", "Osteoarthritis", "Gout", "Septic arthritis"]', 2, 'Podagra (gout of the 1st MTP joint) is the classic presentation of acute gout.'),
    (v_case_id, 'Which diagnosis is a surgical emergency and must be ruled out in ANY acutely swollen, red joint?', '["Gout", "Septic Arthritis", "Pseudogout", "Lupus"]', 1, 'Septic arthritis can destroy a joint in 24-48 hours; joint aspiration is mandatory.'),
    (v_case_id, 'How do you clinically differentiate Osteoarthritis from Rheumatoid Arthritis?', '["OA has morning stiffness > 1 hour; RA has < 30 mins", "OA is worse with use and better with rest; RA has prolonged morning stiffness and improves with use", "RA only affects the knees", "OA is inflammatory; RA is mechanical"]', 1, 'RA is an inflammatory disease (better with use); OA is a wear-and-tear disease (worse with use).');

    -- CASE 10: Hemoptysis Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Coughing up Blood', 'A 65-year-old heavy smoker presents with coughing up blood-tinged sputum and 20 lbs of weight loss over 3 months.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most concerning diagnosis?', '["Bronchitis", "Lung Cancer", "Pulmonary Embolism", "Pneumonia"]', 1, 'Hemoptysis and weight loss in a smoker are highly suspicious for malignancy.'),
    (v_case_id, 'What is the most common cause of MILD hemoptysis in the US?', '["Tuberculosis", "Acute Bronchitis", "Lung Cancer", "PE"]', 1, 'Bronchitis causes inflammation of the airways and is the #1 cause overall.'),
    (v_case_id, 'In a patient from an endemic area with night sweats, weight loss, and apical lung infiltrates, what is the top differential?', '["Lung cancer", "Tuberculosis (TB)", "Sarcoidosis", "Heart failure"]', 1, 'TB is a leading cause of hemoptysis globally.');

    -- CASE 11: Hematuria Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Blood in the Urine', 'A 70-year-old male smoker presents with painless hematuria (blood in the urine). He has no other symptoms.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Painless hematuria in an older smoker is ___________ until proven otherwise.', '["A Urinary Tract Infection", "Bladder or Kidney Cancer", "Kidney stones", "Benign Prostatic Hyperplasia (BPH)"]', 1, 'Painless hematuria is a classic red flag for urological malignancy.'),
    (v_case_id, 'If the hematuria were associated with sudden, severe "colicky" flank pain radiating to the groin, what would be the likely diagnosis?', '["Cystitis", "Nephrolithiasis (Kidney stone)", "Renal cell carcinoma", "Prostatitis"]', 1, 'The "colicky" nature of the pain is characteristic of a stone passing through the ureter.'),
    (v_case_id, 'How do you distinguish glomerular from non-glomerular bleeding?', '["Glomerular: Painful; Non-glomerular: Painless", "Glomerular: RBC casts and dysmorphic RBCs; Non-glomerular: Normal RBC shape and no casts", "There is no way to tell", "Non-glomerular has protein"]', 1, 'RBC casts indicate the blood originated from the renal tubules/glomerulus.');

    -- CASE 12: Generalized Edema
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Swelling Everywhere', 'A 55-year-old male with a history of heavy alcohol use presents with abdominal swelling (ascites) and bilateral leg edema. On exam, he has spider angiomas on his chest.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of his generalized edema?', '["Heart failure", "Liver Cirrhosis", "Nephrotic Syndrome", "Hypothyroidism"]', 1, 'Cirrhosis leads to low albumin (low oncotic pressure) and portal hypertension, causing ascites and edema.'),
    (v_case_id, 'Which organ system should you evaluate if a patient has periorbital (eye) swelling that is worst in the morning?', '["Heart", "Liver", "Kidneys", "Lungs"]', 2, 'Renal disease (especially nephrotic syndrome) often presents with early morning periorbital edema.'),
    (v_case_id, 'Unilateral leg swelling should always raise suspicion for:', '["Heart failure", "Deep Vein Thrombosis (DVT)", "Cirrhosis", "Nephrotic syndrome"]', 1, 'Systemic causes (HF, Liver, Kidney) usually cause symmetric bilateral edema.');

    -- CASE 13: Weight Loss Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Unintentional Weight Loss', 'A 60-year-old male has lost 30 lbs in 6 months without trying. He reports feeling "down" since his wife passed away and has lost interest in his hobbies.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'While malignancy must be ruled out, what common psychiatric condition can cause significant unintentional weight loss in the elderly?', '["Schizophrenia", "Major Depressive Disorder", "Generalized Anxiety", "Bipolar disorder"]', 1, 'Depression is a very common cause of weight loss in the elderly due to anorexia.'),
    (v_case_id, 'A patient with weight loss despite an INCREASED appetite likely has:', '["Cancer", "Hyperthyroidism or Diabetes Mellitus", "Depression", "Malabsorption"]', 1, 'Metabolic "engines" like hyperthyroidism or calorie loss like DM cause weight loss despite high intake.'),
    (v_case_id, 'What is the medical definition of "clinically significant" unintentional weight loss?', '["5 lbs in a month", "10% of body weight in a year", "> 5% of body weight over 6 to 12 months", "Any weight loss"]', 2, 'Losing >5% of body weight unintentionally in 6-12 months warrants a medical work-up.');

    -- CASE 14: Dizziness/Vertigo Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Room is Spinning', 'A 60-year-old woman presents with "dizziness." She describes a sensation that the room is spinning for 30 seconds every time she rolls over in bed.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Orthostatic hypotension", "Meniere disease", "Benign Paroxysmal Positional Vertigo (BPPV)", "Stroke"]', 2, 'Short episodes of vertigo triggered by head movement are classic for BPPV.'),
    (v_case_id, 'What is the characteristic physical exam maneuver used to diagnose BPPV?', '["Epley maneuver", "Dix-Hallpike maneuver", "Phalen test", "Romberg test"]', 1, 'The Dix-Hallpike maneuver elicits the characteristic nystagmus and vertigo of BPPV.'),
    (v_case_id, 'How does Meniere disease differ from BPPV?', '["Meniere only lasts seconds", "Meniere is associated with hearing loss, tinnitus, and ear fullness, and lasts for hours", "Meniere is not vertigo", "BPPV has hearing loss"]', 1, 'Meniere''s is a triad of vertigo, tinnitus, and hearing loss.');

    -- CASE 15: Sore Throat Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Severe Sore Throat', 'A 17-year-old student presents with a sore throat, fever, and extreme fatigue. On exam, he has large tonsils with white exudates and significant swelling of the lymph nodes in his neck.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In an adolescent with severe pharyngitis and fatigue, what viral infection should be top of mind?', '["Influenza", "Infectious Mononucleosis (EBV)", "HIV", "Rhinovirus"]', 1, 'Mono is a classic cause of severe pharyngitis and lymphadenopathy in teens.'),
    (v_case_id, 'What physical exam finding is most helpful in distinguishing Mono from Strep throat?', '["Fever", "Exudates", "Posterior cervical lymphadenopathy and splenomegaly", "Red throat"]', 2, 'Strep typically has anterior adenopathy; Mono often has posterior adenopathy and splenomegaly.'),
    (v_case_id, 'A "hot potato voice" and deviation of the uvula to one side suggest which complication?', '["Laryngitis", "Peritonsillar Abscess", "Epiglottitis", "Diphtheria"]', 1, 'Peritonsillar abscess is a localized collection of pus that displaces the uvula.');

    -- CASE 16: Palpitations Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Heart Racing', 'A 30-year-old female presents with frequent "skipped beats" and racing of her heart. She also reports weight loss, heat intolerance, and tremors.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely non-cardiac cause of her palpitations?', '["Anxiety", "Hyperthyroidism", "Anemia", "Electrolyte imbalance"]', 1, 'Hyperthyroidism is a classic "mimic" of primary heart disease.'),
    (v_case_id, 'Palpitations that occur suddenly and stop suddenly are more suggestive of:', '["Anxiety", "Paroxysmal Supraventricular Tachycardia (PSVT)", "Sinus tachycardia", "Mitral valve prolapse"]', 1, 'The "flip-flop" or "on-off" nature suggests a re-entrant tachycardia.'),
    (v_case_id, 'Which social history question is vital in a young patient with palpitations?', '["Smoking", "Caffeine and stimulant use (including cocaine)", "Alcohol", "Diet"]', 1, 'Stimulants are a major cause of palpitations and arrhythmias.');

    -- CASE 17: Jaundice Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Yellow Eyes', 'A 50-year-old male with a history of gallstones presents with jaundice and dark urine. He has no pain.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Jaundice + Dark urine implies:', '["Unconjugated hyperbilirubinemia", "Conjugated hyperbilirubinemia", "Hemolysis", "Gilbert syndrome"]', 1, 'Only conjugated bilirubin is water-soluble and can be excreted in the urine (making it dark).'),
    (v_case_id, 'If the jaundice is painless and the gallbladder is palpable (Courvoisier''s sign), what should you suspect?', '["Choledocholithiasis", "Pancreatic Cancer (head of pancreas)", "Hepatitis", "Cirrhosis"]', 1, 'Courvoisier''s sign is a palpable, non-tender gallbladder in a jaundiced patient, suggestive of malignant obstruction.'),
    (v_case_id, 'Isolated jaundice after a period of fasting or stress in a young, healthy person is likely:', '["Hepatitis B", "Gilbert Syndrome", "Primary Biliary Cholangitis", "Dubin-Johnson"]', 1, 'Gilbert is a benign deficiency of UGT enzyme, leading to mild unconjugated jaundice during stress.');

    -- CASE 18: Diarrhea Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Frequent Loose Stools', 'A 40-year-old woman has had watery diarrhea for 1 week. The diarrhea STOPS when she stops eating (fasting).', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of diarrhea is this?', '["Secretory", "Osmotic", "Inflammatory", "Motility-related"]', 1, 'Osmotic diarrhea (e.g., lactose intolerance) improves with fasting as the osmotically active substance is removed.'),
    (v_case_id, 'Which type of diarrhea typically persists even during sleep or fasting?', '["Osmotic", "Secretory", "IBS", "Celiac disease"]', 1, 'Secretory diarrhea (e.g., V. cholerae or certain tumors) is due to active ion secretion and does not stop with fasting.'),
    (v_case_id, 'Bloody diarrhea associated with fever and abdominal cramps suggests:', '["Lactose intolerance", "Inflammatory diarrhea (e.g., Salmonella, Shigella, IBD)", "Giardiasis", "Pancreatic insufficiency"]', 1, 'Blood and fever indicate mucosal invasion or inflammation.');

    -- CASE 19: Polyuria Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Excessive Urination', 'A 45-year-old male presents with extreme thirst and urinating 6 liters per day. His blood sugar is normal (90 mg/dL).', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the two main differentials for non-diabetic polyuria?', '["Diabetes Insipidus (DI) and Psychogenic Polydipsia", "Heart failure and Cirrhosis", "Hypothyroidism and Addison''s", "UTI and Kidney stones"]', 0, 'DI (ADH problem) and Psychogenic Polydipsia (excessive drinking) both cause high-volume dilute urine.'),
    (v_case_id, 'If the patient is given ADH (Vasopressin) and his urine becomes concentrated, what is the diagnosis?', '["Nephrogenic DI", "Central DI", "Psychogenic Polydipsia", "Type 2 Diabetes"]', 1, 'In Central DI, the body isn''t making ADH, so it responds when you provide it exogenously.'),
    (v_case_id, 'What electrolyte abnormality is a common cause of Nephrogenic DI?', '["Hyponatremia", "Hypercalcemia or Hypokalemia", "Hypermagnesemia", "Hyperchloremia"]', 1, 'High calcium and low potassium both interfere with ADH action in the kidney.');

    -- CASE 20: Pelvic Pain Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Acute Pelvic Pain', 'A 24-year-old female presents with sudden, severe right-sided pelvic pain and nausea. She has a history of a 5 cm ovarian cyst.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely surgical emergency in this case?', '["Pelvic Inflammatory Disease (PID)", "Ovarian Torsion", "Ruptured Ectopic Pregnancy", "Endometriosis"]', 1, 'Sudden pain in the setting of an existing cyst suggests the ovary has twisted on its pedicle.'),
    (v_case_id, 'If she had fever, vaginal discharge, and cervical motion tenderness ("chandelier sign"), what would be the diagnosis?', '["Ovarian torsion", "Pelvic Inflammatory Disease (PID)", "Ectopic pregnancy", "Mittelschmerz"]', 1, 'PID is an ascending infection characterized by cervical motion tenderness.'),
    (v_case_id, 'A positive pregnancy test in a patient with pelvic pain is _________ until proven otherwise.', '["Normal", "An ectopic pregnancy", "Miscarriage", "Twin pregnancy"]', 1, 'Ectopic pregnancy is a leading cause of maternal mortality and must be excluded with ultrasound.');

    -- CASE 21: Acute Low Back Pain
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Heavy Lift', 'A 40-year-old male felt a "pop" in his back while lifting a box. He now has sharp pain radiating down his right leg to his foot.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for pain radiating down the leg in a dermatomal distribution?', '["Claudication", "Sciatica (Radiculopathy)", "Myalgia", "Arthralgia"]', 1, 'Radiculopathy is caused by compression of a nerve root, often by a herniated disc.'),
    (v_case_id, 'Which "red flag" symptoms would indicate Cauda Equina Syndrome, requiring urgent surgery?', '["Pain with walking", "Saddle anesthesia, bowel/bladder incontinence, and leg weakness", "Morning stiffness", "Localized tenderness"]', 1, 'Cauda Equina is a surgical emergency caused by massive compression of the nerve roots in the lower canal.'),
    (v_case_id, 'True or False: Most patients with acute low back pain require an immediate MRI.', '["True", "False"]', 1, 'False. Most mechanical back pain resolves with conservative management; imaging is reserved for red flags or failed therapy.');

    -- CASE 22: Hemoptysis vs Hematemesis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Blood from the Mouth', 'A patient presents after "coughing up blood." You are unsure if it came from the lungs or the stomach.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is a characteristic feature of blood from the LUNGS (Hemoptysis)?', '["It is dark brown and acidic", "It is bright red, frothy (mixed with air), and alkaline", "It contains food particles", "It is mixed with stool"]', 1, 'Hemoptysis is typically frothy and has an alkaline pH.'),
    (v_case_id, 'What is a characteristic feature of blood from the STOMACH (Hematemesis)?', '["It is bright red and frothy", "It is dark (coffee-ground appearance) and has an acidic pH", "It is always associated with a cough", "It has no pH"]', 1, 'Gastric acid turns hemoglobin into acid hematin, giving it a coffee-ground appearance.'),
    (v_case_id, 'If a patient has "melena" (black, tarry stools), where is the bleeding likely located?', '["Lower GI (Colon)", "Upper GI (above the Ligament of Treitz)", "Bladder", "Lungs"]', 1, 'Melena results from the digestion of blood by stomach acid and bacteria.');

    -- CASE 23: Cough Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Chronic Cough', 'A 50-year-old non-smoker has had a dry cough for 6 months. It is worse at night and after meals.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are the top 3 causes of chronic cough in a non-smoker with a normal CXR?', '["Lung cancer, TB, PE", "Post-nasal drip, Asthma, and GERD", "Heart failure, COPD, Cystic fibrosis", "Pneumonia, Bronchitis, Sinusitis"]', 1, 'These three account for the vast majority of chronic cough cases.'),
    (v_case_id, 'A cough that starts shortly after beginning a new medication for hypertension is likely due to:', '["Amlodipine", "Lisinopril (ACE Inhibitor)", "Metoprolol", "Hydrochlorothiazide"]', 1, 'ACE inhibitors cause accumulation of bradykinin, leading to a dry cough in up to 10-15% of patients.'),
    (v_case_id, 'Which of these causes is most likely to be associated with wheezing and chest tightness?', '["GERD", "Asthma", "Post-nasal drip", "ACEi cough"]', 1, 'Asthma is a reversible obstructive disease characterized by wheezing.');

    -- CASE 24: Scrotal Pain Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Acute Testicular Pain', 'A 15-year-old boy wakes up with sudden, excruciating left-sided testicular pain and nausea. The testicle is high-riding and horizontal.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Epididymitis", "Testicular Torsion", "Hydrocele", "Inguinal Hernia"]', 1, 'Sudden pain in an adolescent with a high-riding testicle is torsion until proven otherwise.'),
    (v_case_id, 'What is the "Prehn sign"?', '["Pain relief with elevation of the scrotum (suggests epididymitis, not torsion)", "Increased pain with elevation", "Loss of the cremasteric reflex", "A blue spot on the skin"]', 0, 'Prehn sign is notoriously unreliable but classically suggests epididymitis over torsion.'),
    (v_case_id, 'What is the time window for "saving" a testicle in torsion?', '["24 hours", "6 hours", "48 hours", "1 hour"]', 1, 'The salvage rate is ~90% if detorsion occurs within 6 hours, dropping to < 10% after 24 hours.');

    -- CASE 25: Lymphadenopathy - MIAMI
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Swollen Gland', 'A 60-year-old male presents with a single, firm, non-tender 3 cm lymph node in his left supraclavicular area.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this specific node (left supraclavicular) called?', '["Sister Mary Joseph node", "Virchow''s node", "Sentinel node", "Osler node"]', 1, 'Virchow''s node is a classic sign of an underlying abdominal malignancy (e.g., gastric cancer).'),
    (v_case_id, 'Which features of a lymph node are more suggestive of MALIGNANCY?', '["Soft, tender, and mobile", "Hard, fixed (non-mobile), and painless", "Warm and red", "Disappears in two days"]', 1, 'Cancerous nodes are typically "painless and persistent."'),
    (v_case_id, 'Generalized lymphadenopathy (swelling in > 2 non-contiguous areas) is most likely due to:', '["Local infection", "Systemic disease (e.g., HIV, Lymphoma, Sarcoidosis, Lupus)", "Localized trauma", "BPH"]', 1, 'Generalized node enlargement suggests a systemic process.');

    -- CASE 26: Sudden Vision Loss Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Blindness', 'An 80-year-old male presents with sudden, painless loss of vision in his right eye. He also has jaw pain when he chews (jaw claudication).', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Retinal detachment", "Central Retinal Artery Occlusion (CRAO)", "Giant Cell Arteritis (Temporal Arteritis)", "Glaucoma"]', 2, 'GCA can cause ischemic optic neuropathy; jaw claudication is a very specific symptom.'),
    (v_case_id, 'What finding on the funduscopic exam is characteristic of a Central Retinal Artery Occlusion (CRAO)?', '["Blood and thunder (massive hemorrhage)", "A pale retina with a "cherry-red spot" at the macula", "Cupping of the optic disc", "Cotton wool spots"]', 1, 'CRAO is an "eye stroke" causing immediate ischemia and a cherry-red spot.'),
    (v_case_id, 'If a patient describes "flashing lights" and a "curtain coming down" over their vision, they likely have:', '["GCA", "CRAO", "Retinal Detachment", "Cataract"]', 2, 'Photopsia (flashes) and a "curtain" are classic for detachment.');

    -- CASE 27: Night Sweats Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Waking up Drenched', 'A 30-year-old male presents with 2 months of night sweats that require him to change his sheets. He has also noticed a lump in his neck and has lost weight.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are these symptoms (weight loss, night sweats, fever) collectively called?', '["A symptoms", "B symptoms", "C symptoms", "Systemic inflammation"]', 1, '"B symptoms" are highly characteristic of lymphoma.'),
    (v_case_id, 'Besides Lymphoma, what chronic infection is a leading cause of night sweats?', '["Influenza", "Tuberculosis (TB)", "Urinary tract infection", "Cellulitis"]', 1, 'TB is a classic differential for chronic fever and night sweats.'),
    (v_case_id, 'Night sweats in a 50-year-old female without weight loss or nodes are most likely due to:', '["Lymphoma", "Menopause (Hot flashes)", "Diabetes", "Asthma"]', 1, 'Hormonal changes in menopause are a very common cause of nocturnal vasomotor symptoms.');

    -- CASE 28: Ear Pain Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Aching Ear', 'A 5-year-old child presents with ear pain and fever. On exam, the tympanic membrane (TM) is bulging, red, and has decreased mobility on insufflation.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Otitis Externa", "Acute Otitis Media (AOM)", "Serous Otitis", "Mastoiditis"]', 1, 'A bulging, immobile TM in a febrile child is the definition of AOM.'),
    (v_case_id, 'Pain upon pulling the pinna (outer ear) is characteristic of:', '["Otitis Media", "Otitis Externa (Swimmer''s Ear)", "Cholesteatoma", "Labyrinthitis"]', 1, 'Otitis externa is an infection of the canal, and movement of the external ear is painful.'),
    (v_case_id, 'What is "referred otalgia"?', '["Ear pain that spreads to the neck", "Pain felt in the ear that originates from another site (e.g., TMJ, teeth, or the throat)", "Pain that only occurs at night", "Pain after a flight"]', 1, 'The ear is innervated by several cranial nerves; throat cancer can sometimes present as isolated ear pain.');

    -- CASE 29: Constipation Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Difficulty with Bowel Movements', 'A 70-year-old male with a history of long-standing constipation presents with a "change in stool caliber" (the stools are much thinner).', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most concerning diagnosis for "pencil-thin" stools?', '["Hypothyroidism", "Colorectal Cancer (obstructing the lumen)", "IBS", "Dehydration"]', 1, 'Thinned stools suggest a mechanical obstruction in the distal colon/rectum.'),
    (v_case_id, 'Which electrolyte abnormality is a common cause of constipation?', '["Hyponatremia", "Hypercalcemia", "Hypocalcemia", "Hypermagnesemia"]', 1, '"Bones, stones, groans, and psychic overtones" — the "groans" refers to constipation and abdominal pain in hypercalcemia.'),
    (v_case_id, 'What is the "Rome IV" criteria used for?', '["Diagnosing pneumonia", "Diagnosing Irritable Bowel Syndrome (IBS)", "Measuring blood pressure", "Staging cancer"]', 1, 'The Rome criteria are the standardized symptom-based criteria for functional GI disorders.');

    -- CASE 30: Fatigue Differential
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Always Tired', 'A 30-year-old female presents with 6 months of persistent fatigue. She feels rested after sleep but "runs out of gas" by midday. She also reports heavy menstrual periods.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Given the history of heavy menses (menorrhagia), what is the most likely cause of her fatigue?', '["Chronic Fatigue Syndrome", "Iron Deficiency Anemia", "Hypothyroidism", "Depression"]', 1, 'Anemia is a very common and treatable cause of fatigue in women of childbearing age.'),
    (v_case_id, 'If she also had dry skin, cold intolerance, and a slow heart rate, which diagnosis would be more likely?', '["Anemia", "Hypothyroidism", "Addison''s disease", "Sleep apnea"]', 1, 'These are the systemic signs of low thyroid hormone.'),
    (v_case_id, 'Which common sleep disorder should be considered in an obese patient with daytime sleepiness and loud snoring?', '["Insomnia", "Obstructive Sleep Apnea (OSA)", "Narcolepsy", "Restless leg syndrome"]', 1, 'OSA causes poor sleep quality due to nocturnal airway collapse.');

    RAISE NOTICE 'SUCCESS: Clinical Reasoning & Differential Diagnosis Case Blocks (1-30) registered.';
END $$;

COMMIT;
