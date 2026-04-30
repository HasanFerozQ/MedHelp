BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'nephrology' LIMIT 1;

    -- CASE 01: Prerenal AKI (Dehydration)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dizziness and Low Urine Output', 'A 75-year-old male with dementia is brought from a nursing home with 3 days of poor oral intake and diarrhea. His BP is 90/60 mmHg and his skin turgor is poor. Creatinine has risen from 0.8 to 2.2 mg/dL. Urine Na+ is 10 mEq/L.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely etiology of his AKI?', '["Acute Tubular Necrosis (ATN)", "Prerenal Azotemia", "Acute Interstitial Nephritis (AIN)", "Postrenal Obstruction"]', 1, 'Low urine sodium (< 20) and signs of volume depletion point to prerenal AKI.'),
    (v_case_id, 'What is the expected BUN/Creatinine ratio in this patient?', '["< 10:1", "10-15:1", "> 20:1", "1:1"]', 2, 'Increased urea reabsorption in the setting of low flow leads to a high ratio.'),
    (v_case_id, 'What is the most appropriate initial treatment?', '["IV Loop Diuretics", "IV Fluid Resuscitation (Normal Saline)", "Urgent Dialysis", "Dopamine"]', 1, 'Restoring volume should reverse the prerenal state.');

    -- CASE 02: Acute Tubular Necrosis (ATN)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Muddy Brown Casts after Sepsis', 'A 60-year-old female is in the ICU for septic shock. Despite normalization of her BP, her urine output drops to 10 mL/hr and her creatinine rises to 4.5 mg/dL. Urine microscopy shows "muddy brown" granular casts. Urine Na+ is 50 mEq/L.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Prerenal AKI", "ATN", "AIN", "Glomerulonephritis"]', 1, 'Ischemic injury from sepsis leads to ATN; muddy brown casts are pathognomonic.'),
    (v_case_id, 'What would you expect the Fractional Excretion of Sodium (FENa) to be?', '["< 1%", "> 2%", "Zero", "10%"]', 1, 'Damaged tubules cannot reabsorb sodium, leading to a high FENa.'),
    (v_case_id, 'Which of the following is the most common cause of intrinsic renal failure in hospitalized patients?', '["AIN", "ATN", "Stones", "Vasculitis"]', 1, 'Usually due to ischemia or nephrotoxins.');

    -- CASE 03: Acute Interstitial Nephritis (AIN)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Rash and Fever after Antibiotics', 'A 45-year-old male is treated with Penicillin for a skin infection. Seven days later, he develops a diffuse maculopapular rash, fever, and a rise in creatinine. Urine shows white blood cell casts but no bacteria.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Pyelonephritis", "ATN", "AIN", "Postrenal AKI"]', 2, 'A drug-induced hypersensitivity reaction involving the renal interstitium.'),
    (v_case_id, 'Which finding on urine analysis is highly suggestive of AIN?', '["RBC casts", "Eosinophiluria", "Muddy brown casts", "Waxy casts"]', 1, 'Eosinophils in the urine (though not perfectly sensitive) are a classic clue.'),
    (v_case_id, 'What is the first step in management?', '["IV antibiotics", "Discontinue the offending drug (Penicillin)", "Start high-dose diuretics", "Immediate dialysis"]', 1, 'Removing the trigger is the most critical intervention.');

    -- CASE 04: Postrenal AKI (Obstruction)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Anuria and a Distended Bladder', 'A 78-year-old male with a history of BPH presents with no urine output for 12 hours and severe suprapubic pain. On exam, he has a palpable, tender mass in the suprapubic area.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of his AKI?', '["Prostatitis", "Acute Tubular Necrosis", "Postrenal Obstruction", "Prerenal Azotemia"]', 2, 'Acute urinary retention due to BPH.'),
    (v_case_id, 'What is the best initial diagnostic test?', '["CT Abdomen", "Bladder Ultrasound or Catheterization", "KUB X-ray", "Renal Biopsy"]', 1, 'Ultrasound will show a distended bladder and hydronephrosis; catheterization is both diagnostic and therapeutic.'),
    (v_case_id, 'What is the most common cause of postrenal AKI in older men?', '["Kidney stones", "Prostate enlargement (BPH or cancer)", "Bladder cancer", "Urethral stricture"]', 1, 'BPH is the leading cause.');

    -- CASE 05: Hyperkalemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Peaked T-waves and Muscle Weakness', 'A 65-year-old male with Stage 4 CKD presents with weakness. He recently started taking an ACE inhibitor for HTN. His serum Potassium is 7.2 mEq/L. ECG shows tall, peaked T-waves.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most immediate priority in management?', '["IV Insulin and Glucose", "IV Calcium Gluconate", "Oral Kayexalate", "Furosemide"]', 1, 'Calcium does NOT lower potassium but it stabilizes the cardiac membrane to prevent fatal arrhythmias.'),
    (v_case_id, 'Which of the following medications shifts potassium INTO the cells?', '["Albuterol and Insulin", "Lisinopril", "Spironolactone", "Amiloride"]', 0, 'Insulin/Glucose and Beta-agonists are used for rapid shifting.'),
    (v_case_id, 'How do ACE inhibitors cause hyperkalemia?', '["Increased intake", "Reduced Aldosterone secretion", "Direct tubular secretion", "None"]', 1, 'They block Angiotensin II, which normally stimulates aldosterone (aldosterone promotes K+ excretion).');

    -- CASE 06: Hypokalemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Muscle Cramps and U-waves', 'A 40-year-old female taking Chlorthalidone for HTN presents with muscle cramps and palpitations. Her Potassium is 2.8 mEq/L. ECG shows flattened T-waves and prominent U-waves.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely cause of her hypokalemia?', '["Diuretic use", "Diarrhea", "Hyperaldosteronism", "Insulin overdose"]', 0, 'Thiazide and Loop diuretics are common causes of renal K+ wasting.'),
    (v_case_id, 'Which other electrolyte abnormality must be corrected to successfully replenish potassium?', '["Calcium", "Magnesium", "Sodium", "Phosphate"]', 1, 'Low magnesium leads to renal K+ wasting and makes hypokalemia refractory to replacement.'),
    (v_case_id, 'Which of the following is a potential complication of severe hypokalemia?', '["Heart block", "Ascending paralysis and Cardiac arrhythmias", "Seizures", "Hypertension"]', 1, 'Muscle weakness and life-threatening arrhythmias.');

    -- CASE 07: Hyponatremia (SIADH)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Confusion and Euvolemic Hyponatremia', 'A 60-year-old male smoker with a lung mass presents with confusion. His Sodium is 122 mEq/L. He appears euvolemic. Urine Osmolality is 500 mOsm/kg (High) and Urine Na+ is 45 mEq/L (High).', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Dehydration", "SIADH", "CHF", "Primary Polydipsia"]', 1, 'Euvolemic hyponatremia + inappropriately concentrated urine = SIADH.'),
    (v_case_id, 'What is the first-line treatment for ASYMPTOMATIC SIADH?', '["Normal saline", "Fluid restriction", "Hypertonic saline", "Diuretics"]', 1, 'Limiting water intake allows the sodium level to rise slowly.'),
    (v_case_id, 'Rapid correction of chronic hyponatremia (> 10-12 mEq/L in 24 hours) can cause:', '["Cerebral edema", "Osmotic Demyelination Syndrome (Central Pontine Myelinolysis)", "Seizures", "Heart failure"]', 1, 'Correcting too fast "shrinks" the brain cells, causing demyelination.');

    -- CASE 08: Hypernatremia (Diabetes Insipidus)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Excessive Thirst and Dilute Urine', 'A 30-year-old male following a head injury presents with intense thirst and frequent urination. His Sodium is 155 mEq/L. His urine is very dilute (Urine Osmolality 100 mOsm/kg).', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Diabetes Mellitus", "Diabetes Insipidus (DI)", "SIADH", "Psychogenic Polydipsia"]', 1, 'Loss of ADH effect leads to inability to concentrate urine.'),
    (v_case_id, 'A "Water Deprivation Test" is performed, and the urine fails to concentrate. Then, desmopressin (ADH analog) is given, and the urine osmolality increases to 600. What is the diagnosis?', '["Nephrogenic DI", "Central DI", "Psychogenic Polydipsia", "None"]', 1, 'Response to ADH indicates a central deficiency (lack of production).'),
    (v_case_id, 'What is the treatment for CENTRAL Diabetes Insipidus?', '["Fluid restriction", "Desmopressin (dDAVP)", "Thiazide diuretics", "NSAIDs"]', 1, 'Replacing the missing hormone.');

    -- CASE 09: Metabolic Acidosis (High Anion Gap)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Kussmaul Respirations and High Sugar', 'A 19-year-old with Type 1 Diabetes presents with nausea and deep, rapid breathing. Labs: pH 7.20, HCO3- 10 mEq/L, Na+ 140, Cl- 100, Glucose 500.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the Anion Gap in this patient?', '["10", "30", "40", "20"]', 1, 'AG = Na - (Cl + HCO3) = 140 - (100 + 10) = 30. (Normal is < 12).'),
    (v_case_id, 'What is the name for the deep, rapid breathing pattern?', '["Cheyne-Stokes", "Kussmaul respirations", "Biot''s breathing", "Apnea"]', 1, 'Respiratory compensation for metabolic acidosis.'),
    (v_case_id, 'What is the "MUDPILES" mnemonic used for?', '["Metabolic Alkalosis", "High Anion Gap Metabolic Acidosis", "Normal Gap Acidosis", "Respiratory Acidosis"]', 1, 'Methanol, Uremia, DKA, Propylene glycol, Iron/INH, Lactic acid, Ethylene glycol, Salicylates.');

    -- CASE 10: Nephrotic Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Heavy Proteinuria and Edema', 'A 50-year-old male with long-standing Diabetes presents with severe leg swelling and frothy urine. Labs show a Serum Albumin of 2.0 g/dL (Low) and 24-hour urine protein of 5.5 grams.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of Nephrotic-range proteinuria?', '["> 1 g/day", "> 3.5 g/day", "> 10 g/day", "Trace"]', 1, 'Defined by massive protein loss.'),
    (v_case_id, 'What is the characteristic finding on lipid profile in nephrotic syndrome?', '["Low cholesterol", "Hyperlipidemia", "Normal", "Low triglycerides"]', 1, 'The liver increases lipoprotein synthesis to compensate for low oncotic pressure.'),
    (v_case_id, 'Nephrotic patients are at an increased risk for which of the following?', '["Bleeding", "Venous Thromboembolism (e.g., Renal Vein Thrombosis)", "Heart block", "Anemia"]', 1, 'Loss of Antithrombin III and other anticoagulant proteins in the urine leads to a hypercoagulable state.');

    -- CASE 11: Minimal Change Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Swelling in a Child', 'A 5-year-old boy presents with sudden-onset swelling around his eyes and ankles. He recently had a viral URI. Urine shows 4+ protein but no blood. Light microscopy of the kidney is normal.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["FSGS", "Minimal Change Disease", "Membranous Nephropathy", "PSGN"]', 1, 'The most common cause of nephrotic syndrome in children.'),
    (v_case_id, 'What is seen on Electron Microscopy (EM)?', '["Thickened basement membrane", "Effacement of podocyte foot processes", "Subepithelial humps", "Linear deposits"]', 1, 'This is the classic EM finding despite "minimal" changes on light microscopy.'),
    (v_case_id, 'What is the treatment of choice?', '["ACE inhibitors", "Corticosteroids", "Diuretics only", "Cyclophosphamide"]', 1, 'Highly responsive to steroids.');

    -- CASE 12: Nephritic Syndrome (PSGN)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tea-colored Urine after a Sore Throat', 'A 10-year-old boy presents with puffy eyes, hypertension, and dark, "tea-colored" urine. He had a severe sore throat 2 weeks ago.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Minimal Change Disease", "Post-Streptococcal Glomerulonephritis (PSGN)", "IgA Nephropathy", "Lupus nephritis"]', 1, 'Nephritic syndrome occurring after a Group A Strep infection.'),
    (v_case_id, 'What is the classic finding on Electron Microscopy?', '["Linear IgG", "Subepithelial humps (immune complexes)", "Spikes and domes", "Tram-tracks"]', 1, 'Represents the deposition of immune complexes below the podocytes.'),
    (v_case_id, 'What lab value is typically low during the acute phase of PSGN?', '["Sodium", "Serum Complement (C3)", "Albumin", "Creatinine"]', 1, 'Consumption of complement by the immune-mediated process.');

    -- CASE 13: IgA Nephropathy (Berger Disease)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Gross Hematuria during a URI', 'A 22-year-old male presents with bright red blood in his urine that started yesterday, at the same time his "flu" symptoms began. He has had similar episodes in the past during colds.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["PSGN", "IgA Nephropathy", "Alport Syndrome", "Stones"]', 1, 'Synpharyngitic hematuria (blood starts WITH the URI) is classic for IgA nephropathy. (In PSGN, there is a 1-3 week delay).'),
    (v_case_id, 'What is seen on Immunofluorescence (IF) of the kidney biopsy?', '["Linear IgG", "Granular Mesangial IgA deposits", "No deposits", "Subepithelial humps"]', 1, 'The hallmark finding.'),
    (v_case_id, 'What is the most common primary glomerulonephritis worldwide?', '["PSGN", "IgA Nephropathy", "Minimal Change", "Membranous"]', 1, 'Extremely common presentation of microscopic or gross hematuria.');

    -- CASE 14: Polycystic Kidney Disease (ADPKD)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Flank Pain and Large Palpable Kidneys', 'A 40-year-old male presents with flank pain and hematuria. On exam, he has bilateral large, irregular masses in his abdomen. His father died of a "brain aneurysm" at age 45.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Renal Cell Carcinoma", "Autosomal Dominant Polycystic Kidney Disease (ADPKD)", "Hydronephrosis", "Medullary Sponge Kidney"]', 1, 'Bilateral cystic enlargement of the kidneys with a family history of aneurysms.'),
    (v_case_id, 'Which of the following is a common extra-renal manifestation?', '["Liver cysts and Berry Aneurysms", "Lung cancer", "Diabetes", "Cataracts"]', 0, 'Berry aneurysms in the Circle of Willis can lead to subarachnoid hemorrhage.'),
    (v_case_id, 'What are the two genes most commonly mutated in this condition?', '["PKD1 and PKD2", "PKHD1", "VHL", "WT1"]', 0, 'PKD1 (on chromosome 16) is more common and more severe.');

    -- CASE 15: Renal Cell Carcinoma (RCC)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hematuria, Flank Pain, and a Mass', 'A 65-year-old smoker presents with painless gross hematuria. He has lost 10 lbs. On exam, he has a palpable mass in his left flank.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic clinical triad for RCC?', '["Fever, weight loss, jaundice", "Hematuria, flank pain, and a palpable mass", "Pain, vomiting, diarrhea", "HTN, edema, proteinuria"]', 1, 'Only seen in ~10% of cases but highly characteristic.'),
    (v_case_id, 'What is the most common histological type of RCC?', '["Papillary", "Clear Cell", "Chromophobe", "Collecting duct"]', 1, 'Derived from the proximal tubule cells; cells appear "clear" due to lipid and glycogen content.'),
    (v_case_id, 'RCC is known for "paraneoplastic" syndromes. Which hormone is most commonly secreted?', '["Insulin", "Erythropoietin (EPO)", "TSH", "Cortisol"]', 1, 'Can lead to secondary polycythemia (high Hct).');

    -- CASE 16: Renal Artery Stenosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Refractory HTN and an Abdominal Bruit', 'A 60-year-old male with known CAD presents with BP of 180/110 mmHg despite being on three medications. On exam, a systolic-diastolic bruit is heard in his epigastrium.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Essential HTN", "Renal Artery Stenosis", "Pheochromocytoma", "Primary Hyperaldosteronism"]', 1, 'The most common cause of secondary hypertension in the elderly (atherosclerotic).'),
    (v_case_id, 'What would happen to the creatinine if this patient were started on an ACE inhibitor?', '["Creatinine would drop", "Acute rise in Creatinine", "No change", "Creatinine would stay the same"]', 1, 'Blocking Angiotensin II removes the efferent constriction needed to maintain GFR in a stenotic kidney.'),
    (v_case_id, 'What is the most common cause of renal artery stenosis in YOUNG females?', '["Atherosclerosis", "Fibromuscular Dysplasia (FMD)", "Vasculitis", "Lupus"]', 1, 'Shows a "string of beads" appearance on angiography.');

    -- CASE 17: Renal Tubular Acidosis (Type 1 - Distal)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Normal Gap Acidosis and Kidney Stones', 'A 30-year-old female with Sjögren''s syndrome presents with fatigue. Labs: pH 7.30, HCO3- 16, Na+ 140, Cl- 114 (Anion Gap = 10). Her urine pH is persistently high (> 5.5).', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Type 1 RTA (Distal)", "Type 2 RTA (Proximal)", "Type 4 RTA", "DKA"]', 0, 'Inability to secrete H+ in the distal tubule leads to an inappropriately alkaline urine pH.'),
    (v_case_id, 'What electrolyte abnormality is common in Type 1 RTA?', '["Hyperkalemia", "Hypokalemia", "Hypernatremia", "Hypocalcemia"]', 1, 'Potassium is wasted as the distal tubule tries to compensate for the lack of H+ secretion.'),
    (v_case_id, 'What is a long-term complication of Type 1 RTA?', '["Diabetes", "Calcium Phosphate Kidney Stones (Nephrocalcinosis)", "Lung cancer", "Liver failure"]', 1, 'High urine pH and hypercalciuria promote stone formation.');

    -- CASE 18: Renal Tubular Acidosis (Type 2 - Proximal)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Normal Gap Acidosis and Fanconi Syndrome', 'A patient with Multiple Myeloma presents with normal gap metabolic acidosis. Labs show glucosuria, phosphaturia, and aminoaciduria despite normal blood levels.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Type 1 RTA", "Type 2 RTA", "Type 4 RTA", "Lactic acidosis"]', 1, 'Impaired bicarbonate reabsorption in the proximal tubule.'),
    (v_case_id, 'The constellation of multiple proximal tubule defects (loss of glucose, AA, PO4) is called:', '["Nephrotic syndrome", "Fanconi Syndrome", "Goodpasture syndrome", "Alport syndrome"]', 1, 'Often caused by light chain toxicity in myeloma.'),
    (v_case_id, 'What is the urine pH pattern in Type 2 RTA?', '["Always > 5.5", "Initial high pH, then can drop below 5.5 as serum bicarb falls", "Always < 5.0", "Neutral"]', 1, 'Once the serum bicarbonate drops below the "threshold," the remaining bicarb can be reabsorbed and distal acidification takes over.');

    -- CASE 19: Renal Tubular Acidosis (Type 4)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Normal Gap Acidosis and Hyperkalemia in a Diabetic', 'A 60-year-old diabetic male has a mild normal-gap metabolic acidosis and a persistent potassium of 5.6 mEq/L. He is NOT taking any medications that affect potassium.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Type 1 RTA", "Type 2 RTA", "Type 4 RTA (Hypoaldosteronism)", "Addison''s disease"]', 2, 'The only RTA with HYPERkalemia; caused by aldosterone deficiency or resistance.'),
    (v_case_id, 'What is the most common cause of Type 4 RTA?', '["Myeloma", "Diabetic Nephropathy (Hyporeninemic hypoaldosteronism)", "Sjögren syndrome", "Stones"]', 1, 'Very common in diabetic patients with mild CKD.'),
    (v_case_id, 'The primary defect in Type 4 RTA leads to reduced secretion of:', '["Sodium", "Potassium and H+", "Glucose", "Bicarbonate"]', 1, 'Aldosterone normally promotes K+ and H+ secretion.');

    -- CASE 20: Nephrolithiasis (Calcium Oxalate)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Severe Colicky Flank Pain and Hematuria', 'A 40-year-old male presents with sudden, agonizing right-sided flank pain that radiates to his groin. He cannot sit still. Urine shows microscopic hematuria but no infection.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most common type of kidney stone?', '["Uric Acid", "Calcium Oxalate", "Struvite", "Cystine"]', 1, '~80% of all stones.'),
    (v_case_id, 'What is the best imaging test for suspected nephrolithiasis?', '["Plain X-ray (KUB)", "Non-contrast CT Abdomen/Pelvis", "Ultrasound", "MRI"]', 1, 'Highly sensitive for all stone types except some rare drug-induced ones.'),
    (v_case_id, 'What is the recommendation for dietary calcium in patients with recurrent calcium oxalate stones?', '["Avoid all calcium", "Maintain normal dietary calcium intake", "Double the calcium intake", "Take calcium supplements only"]', 1, 'Restricting calcium actually increases oxalate absorption from the gut, increasing stone risk.');

    -- CASE 21: Struvite Stones (Infection Stones)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Staghorn Calculus and Recurrent UTIs', 'A 50-year-old female with recurrent UTIs (Proteus mirabilis) has a plain X-ray showing a massive stone that fills the entire renal pelvis and calyces.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the composition of this "Staghorn" calculus?', '["Calcium Phosphate", "Struvite (Magnesium Ammonium Phosphate)", "Uric acid", "Cystine"]', 1, 'Formed in the presence of urease-producing bacteria.'),
    (v_case_id, 'What is the effect of these bacteria on urine pH?', '["Makes it acidic", "Makes it highly alkaline (pH > 8)", "No effect", "Neutral"]', 1, 'Urease converts urea to ammonia, which raises the pH.'),
    (v_case_id, 'What is the definitive treatment for a large staghorn calculus?', '["Wait for it to pass", "Surgical removal (e.g., Percutaneous Nephrolithotomy)", "Antibiotics only", "Drink more water"]', 1, 'These stones will not pass on their own and provide a nidus for ongoing infection.');

    -- CASE 22: Uric Acid Stones
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Radiolucent Stones in a Gout Patient', 'A patient with chronic gout presents with flank pain. A plain X-ray of the abdomen is normal, but a CT scan shows a 5 mm stone in the left ureter.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why was the X-ray negative?', '["The stone was too small", "Uric acid stones are radiolucent", "The stone was hidden by the bone", "The machine was broken"]', 1, 'Uric acid stones do not contain calcium and thus do not show up on plain films.'),
    (v_case_id, 'What urine pH favors the formation of uric acid stones?', '["Alkaline", "Acidic (pH < 5.5)", "Neutral", "Normal"]', 1, 'Uric acid is less soluble in acidic urine.'),
    (v_case_id, 'What is the primary medical treatment to dissolve uric acid stones?', '["Acidification of urine", "Alkalinization of urine (e.g., Potassium Citrate)", "Antibiotics", "Allopurinol only"]', 1, 'Raising the pH makes the uric acid much more soluble.');

    -- CASE 23: Alport Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, '"Can''t see, can''t pee, can''t hear a buzzing bee"', 'A 15-year-old boy presents with microscopic hematuria. He also has sensorineural hearing loss and uses glasses for lens dislocation (lenticonus). His maternal uncle is on dialysis.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["IgA Nephropathy", "Alport Syndrome", "Goodpasture", "Lupus"]', 1, 'An X-linked defect in Type IV Collagen.'),
    (v_case_id, 'What is seen on Electron Microscopy of the GBM?', '["Thickening only", "Irregular thinning and thickening with a basket-weave appearance", "Spikes", "Humps"]', 1, 'Characteristic splitting of the lamina densa.'),
    (v_case_id, 'What is the typical inheritance pattern?', '["Autosomal dominant", "X-linked dominant", "Autosomal recessive", "Mitochondrial"]', 1, 'Which explains why males are more severely affected.');

    -- CASE 24: Goodpasture Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hemoptysis and Hematuria', 'A 25-year-old male presents with coughing up blood and dark urine. Labs show an acute rise in creatinine. Kidney biopsy shows "crescents" on light microscopy and linear IgG deposits on IF.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the diagnosis?', '["Granulomatosis with Polyangiitis", "Goodpasture Syndrome", "Lupus", "PSGN"]', 1, 'Anti-GBM antibodies attacking the lungs and kidneys.'),
    (v_case_id, 'The antibodies are directed against which structure?', '["Type II Collagen", "Alpha-3 chain of Type IV Collagen", "Podocytes", "DNA"]', 1, 'Found in the glomerular and alveolar basement membranes.'),
    (v_case_id, 'What is the immediate treatment of choice?', '["Antibiotics", "Plasmapheresis and Immunosuppression (Steroids/Cyclophosphamide)", "Dialysis only", "Lung transplant"]', 1, 'Plasmapheresis is needed to remove the circulating antibodies.');

    -- CASE 25: Granulomatosis with Polyangiitis (Wegener''s)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Chronic Sinusitis and Kidney Failure', 'A 50-year-old male presents with chronic "sinus infections" that won''t go away, a saddle-nose deformity, and new-onset hematuria/proteinuria.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Lupus", "Goodpasture", "Granulomatosis with Polyangiitis (GPA)", "Churg-Strauss"]', 2, 'Triad of Upper respiratory, Lower respiratory, and Renal involvement.'),
    (v_case_id, 'What serological marker is highly specific for this condition?', '["p-ANCA", "c-ANCA (PR3-ANCA)", "ANA", "Anti-dsDNA"]', 1, 'Cytoplasmic Anti-Neutrophil Cytoplasmic Antibody.'),
    (v_case_id, 'What is the characteristic finding on biopsy of the lung or kidney?', '["Non-caseating granulomas and vasculitis", "Linear IgG", "Muddy brown casts", "WBC casts"]', 0, 'Small-vessel necrotizing vasculitis with granuloma formation.');

    -- CASE 26: Membranous Nephropathy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Nephrotic Syndrome in an Adult with Hepatitis B', 'A 55-year-old male with chronic Hepatitis B presents with edema and 6 grams of proteinuria. Biopsy shows thickened capillary loops and "spikes" on silver stain.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Minimal Change", "Membranous Nephropathy", "FSGS", "IgA Nephropathy"]', 1, 'A common cause of nephrotic syndrome in adults; often secondary to HBV, NSAIDs, or solid tumors.'),
    (v_case_id, 'What antibody is associated with the PRIMARY (idiopathic) form?', '["Anti-dsDNA", "Anti-Phospholipase A2 Receptor (PLA2R) antibody", "c-ANCA", "Anti-GBM"]', 1, 'A high-yield marker for primary membranous nephropathy.'),
    (v_case_id, 'What is the "Spike and Dome" appearance on EM representing?', '["Podocyte fusion", "Subepithelial immune complex deposits", "Endothelial swelling", "Crescents"]', 1, 'The "spikes" are new basement membrane growing between the deposits ("domes").');

    -- CASE 27: Focal Segmental Glomerulosclerosis (FSGS)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Nephrotic Syndrome in an HIV Patient', 'A 30-year-old African American male with HIV and IV drug use presents with severe edema and massive proteinuria. Biopsy shows sclerosis in some parts of some glomeruli.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Minimal Change", "FSGS", "Membranous", "Diabetes"]', 1, 'The most common cause of nephrotic syndrome in African Americans and associated with HIV/heroin.'),
    (v_case_id, 'Compared to Minimal Change, FSGS is more likely to:', '["Respond to steroids", "Progress to chronic kidney disease (CKD)", "Resolve spontaneously", "Occur in toddlers"]', 1, 'FSGS has a much poorer prognosis and often doesn''t respond to steroids.'),
    (v_case_id, 'What is the characteristic light microscopy finding?', '["Thickened basement membrane", "Segmental sclerosis and hyalinosis", "Diffuse proliferation", "Crescents"]', 1, 'Only part of the glomerulus is affected ("segmental").');

    -- CASE 28: Hepatorenal Syndrome (Type 1)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Rapidly Progressive Kidney Failure in Cirrhosis', 'A patient with alcoholic cirrhosis and ascites is admitted for SBP. Within 1 week, his creatinine rises from 1.2 to 4.8. Urine Na is 5. No response to 2 days of albumin and diuretics.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most appropriate MEDICAL management to bridge the patient to transplant?', '["Aggressive furosemide", "Vasoconstrictors (e.g., Terlipressin or Midodrine/Octreotide) and Albumin", "High-dose aspirin", "Hemodialysis only"]', 1, 'Vasoconstrictors help reverse the splanchnic vasodilation to improve renal perfusion.'),
    (v_case_id, 'Type 1 HRS is distinguished from Type 2 by its:', '["Slow progression", "Rapidly progressive course (Creatinine doubling in < 2 weeks)", "Better prognosis", "Normal urine Na"]', 1, 'Type 1 is acute and life-threatening.'),
    (v_case_id, 'What is the primary site of vasoconstriction in HRS?', '["Splanchnic bed", "Renal arteries", "Systemic arteries", "Pulmonary vessels"]', 1, 'The kidneys are "starving" for blood because it is all pooled in the dilated splanchnic bed.');

    -- CASE 29: Renal Vein Thrombosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Flank Pain in a Nephrotic Patient', 'A 50-year-old male with Membranous Nephropathy suddenly develops severe left-sided flank pain and gross hematuria. Imaging shows a thrombus in the left renal vein.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why are nephrotic patients at risk for this?', '["High cholesterol", "Loss of Antithrombin III in the urine", "Dehydration", "Infection"]', 1, 'Nephrotic syndrome is a hypercoagulable state.'),
    (v_case_id, 'In a male patient, left renal vein thrombosis can also cause a:', '["Hydrocele", "Varicocele on the left side", "Inguinal hernia", "Testicular tumor"]', 1, 'The left testicular vein drains into the left renal vein.'),
    (v_case_id, 'What is the recommended treatment?', '["Surgery", "Anticoagulation (e.g., Warfarin or NOACs)", "Aspirin only", "Antibiotics"]', 1, 'Standard treatment for VTE.');

    -- CASE 30: Contrast-Induced Nephropathy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Creatinine Rise after Cardiac Catheterization', 'A 65-year-old diabetic male undergoes an emergency coronary angiogram. Two days later, his creatinine has risen from 1.2 to 2.4. He is asymptomatic and his urine output is maintained.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Cholesterol Emboli", "Contrast-Induced Nephropathy (CIN)", "Prerenal AKI", "Stones"]', 1, 'A form of ATN caused by the direct toxic and vasoconstrictive effects of iodinated contrast.'),
    (v_case_id, 'How is CIN distinguished from Cholesterol Emboli (Atheroembolism)?', '["CIN occurs 24-48h later and is usually reversible; Cholesterol emboli occur later (weeks) and have skin findings (livedo reticularis)", "CIN causes a rash", "Cholesterol emboli are reversible", "None"]', 0, 'CIN is an acute, self-limiting insult.'),
    (v_case_id, 'What is the most effective way to prevent CIN in a high-risk patient?', '["Oral diuretics", "IV Saline hydration before and after the procedure", "Low-dose dopamine", "Vitamin C"]', 1, 'Volume expansion is the only proven preventative measure.');

    RAISE NOTICE 'SUCCESS: Nephrology Case Blocks (1-30) registered.';
END $$;

COMMIT;
