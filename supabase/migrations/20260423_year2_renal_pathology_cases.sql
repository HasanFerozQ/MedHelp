-- Migration: Year 2 - Renal/Urinary Pathology Case Blocks (15 Cases)
-- Date: 2026-04-23

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Create/Ensure Topic "Renal/Urinary Pathology" for Year 2
    INSERT INTO topics (title, slug, semester_id, year_id, "order", usmle_step)
    VALUES ('Renal/Urinary Pathology', 'renal-urinary-pathology', 3, 2, 50, NULL)
    ON CONFLICT (slug) DO UPDATE SET year_id = 2, semester_id = 3, usmle_step = NULL
    RETURNING id INTO v_topic_id;

    -- CASE 01: PSGN
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Smoky Urine after Sore Throat', 'A 7-year-old boy is brought to the clinic due to "smoky-colored" urine and facial puffiness. His mother notes he had a "bad sore throat" about two weeks ago that resolved without antibiotics. Physical exam shows periorbital edema and a blood pressure of 145/90 mmHg.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Minimal Change Disease", "Post-streptococcal Glomerulonephritis (PSGN)", "IgA Nephropathy", "Membranous Nephropathy"]', 1, 'PSGN classically occurs 1-3 weeks after a Group A Strep infection (pharyngitis or impetigo).'),
    (v_case_id, 'What would be seen on Electron Microscopy (EM)?', '["Effacement of podocyte foot processes", "Subepithelial humps", "Tram-track appearance of the GBM", "Subendothelial deposits"]', 1, 'PSGN features large subepithelial immune complex deposits (humps).'),
    (v_case_id, 'Which laboratory finding is most characteristic of this condition?', '["Elevated IgA levels", "Decreased C3 complement levels", "Positive c-ANCA", "Anti-GBM antibodies"]', 1, 'Consumption of complement leads to low C3 levels in the serum.');

    -- CASE 02: Membranous Nephropathy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Frothy Urine and Hepatitis B', 'A 45-year-old male with a history of Hepatitis B presents with generalized edema and frothy urine. Urinalysis reveals 4+ proteinuria. A renal biopsy is performed.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Focal Segmental Glomerulosclerosis", "Membranous Nephropathy", "Diabetic Nephropathy", "Alport Syndrome"]', 1, 'Membranous Nephropathy is a common cause of nephrotic syndrome in adults and is associated with Hep B/C, NSAIDs, and SLE.'),
    (v_case_id, 'What is the characteristic finding on Silver Stain (Methenamine Silver)?', '["Kimmelstiel-Wilson nodules", "Wire-loop lesions", "Spike and dome appearance", "Crescent formation"]', 2, 'Silver stain highlights the spikes of basement membrane between subepithelial deposits.'),
    (v_case_id, 'What is the primary target of autoantibodies in the idiopathic form of this disease?', '["Type IV Collagen", "Phospholipase A2 receptor (PLA2R)", "Mesangial cells", "Podocin"]', 1, 'Anti-PLA2R antibodies are highly specific for primary membranous nephropathy.');

    -- CASE 03: FSGS
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'HIV and Heavy Proteinuria', 'A 30-year-old African American male with a history of IV drug use and HIV is evaluated for heavy proteinuria and hypertension.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Minimal Change Disease", "Membranoproliferative Glomerulonephritis", "Focal Segmental Glomerulosclerosis (FSGS)", "Thin Basement Membrane Disease"]', 2, 'FSGS is the most common cause of nephrotic syndrome in African Americans and is associated with HIV, Heroin, and Obesity.'),
    (v_case_id, 'Which histologic change is expected on Light Microscopy?', '["Sclerosis involving parts of some glomeruli", "Diffuse thickening of the capillary walls", "Linear IgG deposition", "Hypercellularity of the mesangium"]', 0, 'Sclerosis occurs in a "focal" (some) and "segmental" (part of) distribution.'),
    (v_case_id, 'What is the classic response to steroid therapy in this specific patient?', '["Excellent response", "Poor response, often progressing to ESRD", "Spontaneous resolution", "Steroid-sensitive but frequent relapses"]', 1, 'FSGS generally responds poorly to steroids compared to MCD.');

    -- CASE 04: Minimal Change Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Edema in a Child', 'A 4-year-old girl presents with sudden onset generalized edema (anasarca) following an upper respiratory infection. Her blood pressure is normal. Laboratory tests show massive proteinuria (>3.5g/day) and hypoalbuminemia.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Focal Segmental Glomerulosclerosis", "Minimal Change Disease", "Amyloidosis", "Rapidly Progressive Glomerulonephritis"]', 1, 'MCD is the most common cause of nephrotic syndrome in children.'),
    (v_case_id, 'What is the most significant finding on Electron Microscopy?', '["Subendothelial deposits", "Effacement of podocyte foot processes", "Splitting of the lamina densa", "Reduplication of the basement membrane"]', 1, 'Light microscopy looks normal; EM is required to see the podocyte fusion (effacement).'),
    (v_case_id, 'Which of the following is the first-line treatment?', '["Cyclophosphamide", "ACE inhibitors", "Corticosteroids", "Plasmapheresis"]', 2, 'MCD is highly steroid-sensitive.');

    -- CASE 05: IgA Nephropathy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hematuria following Respiratory Infection', 'A 24-year-old male presents with gross hematuria that began 2 days after the onset of a flu-like illness. He mentions having similar episodes in the past following "colds." His blood pressure is 135/85 mmHg.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Post-streptococcal Glomerulonephritis", "IgA Nephropathy (Berger Disease)", "Wegener Granulomatosis", "Lupus Nephritis"]', 1, 'IgA Nephropathy presents "syn-pharyngitically" (within days), unlike PSGN which takes weeks.'),
    (v_case_id, 'What is seen on Immunofluorescence (IF)?', '["Linear IgG and C3", "Granular IgA deposits in the mesangium", "Lumpy-bumpy IgG", "No deposits (Pauci-immune)"]', 1, 'IF shows bright granular IgA deposition in the mesangial matrix.'),
    (v_case_id, 'This condition is frequently associated with which systemic disorder?', '["Polyarteritis nodosa", "Henoch-Schonlein Purpura", "Goodpasture Syndrome", "Rheumatoid Arthritis"]', 1, 'Henoch-Schonlein Purpura (HSP) is the systemic vasculitic form of IgA nephropathy.');

    -- CASE 06: MPGN
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Tram-tracks and Hepatitis C', 'A 55-year-old woman with chronic Hepatitis C presents with hematuria, proteinuria, and decreased serum C3 and C4 levels. Biopsy shows a "tram-track" appearance of the GBM.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Type I Membranoproliferative Glomerulonephritis (MPGN)", "Dense Deposit Disease (Type II MPGN)", "Alport Syndrome", "Acute Tubular Necrosis"]', 0, 'Type I MPGN is associated with Hepatitis B and C and shows subendothelial deposits.'),
    (v_case_id, 'What causes the "tram-track" appearance?', '["Deposition of amyloid fibrils", "Mesangial cell ingrowth splitting the GBM", "Accumulation of glucose in the GBM", "Fibrinoid necrosis"]', 1, 'Mesangial cells interpose themselves between the GBM layers, creating a split appearance.'),
    (v_case_id, 'Type II MPGN (Dense Deposit Disease) is specifically associated with which factor?', '["Anti-GBM antibody", "C3 nephritic factor", "Hepatitis B surface antigen", "ANCA"]', 1, 'C3 nephritic factor stabilizes C3 convertase, leading to persistent complement activation.');

    -- CASE 07: Renal Cell Carcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Flank Pain and Hematuria in a Smoker', 'A 60-year-old male smoker presents with painless gross hematuria and a dull ache in his right flank. Physical exam reveals a palpable abdominal mass.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Renal Cell Carcinoma (RCC)", "Wilms Tumor", "Transitional Cell Carcinoma", "Renal Infarction"]', 0, 'The "Classic Triad" (Flank pain, mass, hematuria) occurs in ~10% of RCC cases.'),
    (v_case_id, 'What is the most common histological subtype of this cancer?', '["Papillary", "Chromophobe", "Clear Cell", "Collecting duct"]', 2, 'Clear cell carcinoma (cells filled with lipids/glycogen) is the most common.'),
    (v_case_id, 'The clear cell subtype is associated with a deletion on which chromosome?', '["Chromosome 13 (RB)", "Chromosome 11 (WT1)", "Chromosome 3 (VHL)", "Chromosome 17 (p53)"]', 2, 'Loss of the VHL gene on chromosome 3 is the primary driver.');

    -- CASE 08: Lupus Nephritis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Wire-loops in SLE', 'A 35-year-old female with Systemic Lupus Erythematosus (SLE) presents with worsening renal function and proteinuria. Biopsy shows "wire-loop" lesions in the glomeruli.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which WHO class of Lupus Nephritis does this represent?', '["Class I (Minimal mesangial)", "Class II (Mesangial proliferative)", "Class IV (Diffuse proliferative)", "Class V (Membranous)"]', 2, 'Class IV is the most common and severe form, showing diffuse global thickening.'),
    (v_case_id, 'What is the characteristic Immunofluorescence finding?', '["Linear IgG", "Full house (IgG, IgA, IgM, C3, C1q) granular pattern", "IgE only", "Negative IF"]', 1, 'SLE deposits contain all major immunoglobulins and complements.'),
    (v_case_id, 'Which of the following is the most likely cause of the "wire-loop" appearance?', '["Massive subepithelial deposits", "Massive subendothelial deposits", "Fibrin thrombi", "Mesangial matrix expansion"]', 1, 'Subendothelial immune complexes create thick loops on light microscopy.');

    -- CASE 09: Diabetic Nephropathy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Mesangial Nodules in Diabetes', 'A 48-year-old male with a history of long-standing diabetes mellitus presents with chronic kidney disease. Biopsy shows eosinophilic, nodular masses in the mesangium.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What are these nodules called?', '["Aschoff bodies", "Kimmelstiel-Wilson nodules", "Councilman bodies", "Negri bodies"]', 1, 'KW nodules are diagnostic for diabetic nephropathy.'),
    (v_case_id, 'What is the earliest clinical sign of this condition?', '["Gross hematuria", "Microalbuminuria", "Hypertension", "Casts in the urine"]', 1, 'Microalbuminuria is the first sign; screening is essential for early intervention.'),
    (v_case_id, 'Which medication class is Reno-protective in this patient?', '["NSAIDs", "Loop Diuretics", "ACE Inhibitors / ARBs", "Beta-blockers"]', 2, 'ACE inhibitors reduce intraglomerular pressure by dilating the efferent arteriole.');

    -- CASE 10: Goodpasture Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hemoptysis and Renal Failure', 'A 68-year-old man presents with hemoptysis and acute onset renal failure. Biopsy shows crescents in Bowman''s space. IF reveals linear IgG deposition.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Goodpasture Syndrome", "Wegener Granulomatosis", "Microscopic Polyangiitis", "Churg-Strauss Syndrome"]', 0, 'Goodpasture features the combination of pulmonary hemorrhage and RPGN.'),
    (v_case_id, 'The antibodies in this disease are directed against what?', '["Alpha-3 chain of Type IV Collagen", "Neutrophil myeloperoxidase", "Proteinase 3", "Podocin"]', 0, 'Anti-GBM antibodies target the alveolar and glomerular basement membranes.'),
    (v_case_id, 'What constitutes the "crescents" seen on histology?', '["Fibrin and plasma proteins", "Proliferating parietal epithelial cells and monocytes", "Neutrophilic infiltrate", "Both A and B"]', 3, 'Crescents are formed by parietal cells and macrophages responding to fibrin leakage.');

    -- CASE 11: Urothelial Carcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dye Factory Worker with Hematuria', 'A 50-year-old male with a 40-pack-year smoking history presents with hematuria. He worked in a rubber and dye factory for 20 years. Cystoscopy reveals a papillary mass in the bladder.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Squamous Cell Carcinoma of the bladder", "Urothelial (Transitional Cell) Carcinoma", "Adenocarcinoma of the bladder", "Sarcoma botryoides"]', 1, 'Transitional cell (urothelial) is the most common bladder cancer in the US.'),
    (v_case_id, 'Which of the following is NOT a risk factor for this condition?', '["Phenacetin use", "Cyclophosphamide", "Schistosoma haematobium", "Naphthylamine"]', 2, 'Schistosoma is specifically a risk factor for Squamous Cell Carcinoma of the bladder.'),
    (v_case_id, 'Which of the following describes the most common presentation?', '["Dysuria and frequency", "Painless gross hematuria", "Flank pain and fever", "Acute urinary retention"]', 1, 'Painless hematuria is the classic presentation for bladder and renal cancers.');

    -- CASE 12: Alport Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hearing Loss and Hematuria', 'A 20-year-old male presents with hearing loss and blurry vision. Urinalysis shows hematuria and red blood cell casts. His maternal uncle died of renal failure at a young age.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Alport Syndrome", "Thin Basement Membrane Disease", "Polycystic Kidney Disease", "Medullary Sponge Kidney"]', 0, 'Alport features "Can''t see, can''t pee, can''t hear a high C."'),
    (v_case_id, 'What is the characteristic finding on EM?', '["Effacement of podocytes", "Basket-weave appearance of GBM", "Subepithelial humps", "Dense deposits in the GBM"]', 1, 'Splitting and thinning of the GBM creates a basket-weave appearance.'),
    (v_case_id, 'What is the underlying genetic defect?', '["Mutation in Type IV Collagen", "Mutation in Polycystin-1", "Mutation in Fibrocystin", "Deletion on Chromosome 3"]', 0, 'Most commonly X-linked mutation in the COL4A5 gene.');

    -- CASE 13: AKI / ATN
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Oliguria following Fracture', 'An 80-year-old man hospitalized for a hip fracture develops sudden decreased urine output (oliguria). Labs show an FeNa < 1% and a BUN:Creatinine ratio of 25:1.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely category of Acute Kidney Injury?', '["Prerenal Azotemia", "Intrinsic Renal Failure (ATN)", "Postrenal Azotemia", "Interstitial Nephritis"]', 0, 'High BUN:Cr and low FeNa (<1%) indicate decreased perfusion (prerenal).'),
    (v_case_id, 'If this condition is not corrected, it typically leads to which intrinsic renal pathology?', '["Acute Interstitial Nephritis", "Acute Tubular Necrosis (ATN)", "Renal Papillary Necrosis", "Nephrolithiasis"]', 1, 'Prolonged ischemia causes death of tubular cells (ATN).'),
    (v_case_id, 'What would you expect to see in the urine sediment of a patient with ATN?', '["Red blood cell casts", "White blood cell casts", "Muddy brown (granular) casts", "Hyaline casts"]', 2, 'Dead tubular cells form characteristic muddy brown granular casts.');

    -- CASE 14: Nephrolithiasis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Colicky Flank Pain', 'A 40-year-old female presents with sudden onset of severe, colicky right flank pain radiating to the groin, accompanied by nausea.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Pyelonephritis", "Nephrolithiasis (Renal Calculi)", "Ectopic Pregnancy", "Renal Infarction"]', 1, 'Ureteral colic causes severe, episodic pain radiating to the groin.'),
    (v_case_id, 'If the stones are radiopaque and shaped like "envelopes," what is their composition?', '["Uric acid", "Calcium oxalate", "Cystine", "Struvite"]', 1, 'Calcium oxalate is the most common stone type; envelope shape is classic.'),
    (v_case_id, 'Staghorn calculi are most commonly associated with which of the following?', '["Hypercalciuria", "Proteus mirabilis infection (Urease positive)", "Low pH urine", "Ethylene glycol ingestion"]', 1, 'Struvite stones (MAP stones) grow in alkaline urine created by urease+ bacteria.');

    -- CASE 15: Pyelonephritis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever and Flank Pain', 'A 35-year-old female presents with fever, flank pain, and dysuria. Urinalysis shows WBC casts and bacteriuria.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Acute Cystitis", "Acute Pyelonephritis", "Acute Interstitial Nephritis", "Nephrotic Syndrome"]', 1, 'The combination of systemic symptoms (fever) and flank pain indicates upper UTI.'),
    (v_case_id, 'What is the significance of WBC casts?', '["Suggests the infection is limited to the bladder", "Pathognomonic for Renal Cell Carcinoma", "Indicates the infection has reached the kidney (upper UTI)", "Suggests an autoimmune etiology"]', 2, 'WBC casts form in the tubules; their presence confirms the kidney is involved.'),
    (v_case_id, 'If the patient had a history of analgesic abuse (NSAIDs) and presented with gross hematuria and flank pain without fever, which condition would be more likely?', '["Renal Papillary Necrosis", "Minimal Change Disease", "IgA Nephropathy", "Polycystic Kidney Disease"]', 0, 'NSAIDs can cause sloughing of renal papillae (SAAD: Sickle cell, Acute pyelo, Analgesics, Diabetes).');

    RAISE NOTICE 'SUCCESS: Renal/Urinary Pathology registered (15 Cases).';
END $$;

COMMIT;
