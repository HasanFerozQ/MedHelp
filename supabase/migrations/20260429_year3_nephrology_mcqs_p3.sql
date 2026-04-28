-- Migration: Year 3 - Nephrology MCQ Bank (PART 3: 161-240)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-29

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'nephrology' LIMIT 1;

    -- SECTION 17: NEPHROTIC SYNDROME
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '161: Nephrotic syndrome is defined by proteinuria > ____ g/day.', '["1.0", "3.5", "5.0", "10.0"]', 1, 'Also includes hypoalbuminemia, edema, and hyperlipidemia. (Harrison''s Ch. 311)'),
    (v_topic_id, '162: What is the most common cause of nephrotic syndrome in CHILDREN?', '["FSGS", "Minimal Change Disease", "Membranous Nephropathy", "Diabetes"]', 1, 'Presents with sudden onset edema; responds well to steroids. (Step-Up)'),
    (v_topic_id, '163: "Minimal Change Disease" (MCD) shows ____ on light microscopy.', '["Thickened basement membrane", "Normal findings", "Sclerosis", "Crescents"]', 1, 'Diagnosis requires electron microscopy (showing podocyte foot process effacement). (Pocket Medicine)'),
    (v_topic_id, '164: What is the most common primary cause of nephrotic syndrome in African Americans and patients with HIV?', '["MCD", "Focal Segmental Glomerulosclerosis (FSGS)", "Membranous", "IgA Nephropathy"]', 1, 'Often progresses to end-stage renal disease. (Harrison''s Ch. 311)'),
    (v_topic_id, '165: "Membranous Nephropathy" is the most common primary nephrotic syndrome in older Caucasian adults. It is associated with which antibody?', '["Anti-GBM", "Phospholipase A2 Receptor (PLA2R) antibody", "ANA", "c-ANCA"]', 1, 'Immune complex deposition in the subepithelial space. (Pocket Medicine)'),
    (v_topic_id, '166: "Spike and dome" appearance on silver stain is characteristic of:', '["MCD", "Membranous Nephropathy", "FSGS", "Lupus"]', 1, 'Represents basement membrane growing over immune complexes. (Step-Up)'),
    (v_topic_id, '167: Nephrotic syndrome increases the risk of thrombosis (e.g., Renal Vein Thrombosis) due to the loss of:', '["Albumin", "Antithrombin III", "Platelets", "Insulin"]', 1, 'The liver cannot compensate for the loss of these anticoagulant proteins. (Harrison''s Ch. 311)'),
    (v_topic_id, '168: "Fatty casts" and "Maltese crosses" in the urine sediment are signs of:', '["Infection", "Hyperlipidemia/Nephrotic Syndrome", "Glomerulonephritis", "Stones"]', 1, 'Due to lipiduria. (Pocket Medicine)'),
    (v_topic_id, '169: "Amyloidosis" of the kidney shows ____ under polarized light after Congo Red staining.', '["Green birefringence", "Yellow glow", "Blue sparks", "None"]', 0, 'Extracellular protein deposition. (Step-Up)'),
    (v_topic_id, '170: "Diabetic Nephropathy" initially presents with:', '["Gross hematuria", "Microalbuminuria (30-300 mg/day)", "Kidney stones", "Pain"]', 1, 'Screening is essential for early intervention with ACEi/ARBs. (Harrison''s Ch. 311)');

    -- SECTION 18: NEPHRITIC SYNDROME (GLOMERULONEPHRITIS)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '171: Nephritic syndrome is primarily characterized by:', '["Massive edema", "Hematuria, Hypertension, and RBC casts", "Hypolipidemia", "Fever only"]', 1, 'Reflects inflammation and damage to the glomerular capillary wall. (Harrison''s Ch. 311)'),
    (v_topic_id, '172: What is the most common cause of glomerulonephritis worldwide?', '["PSGN", "IgA Nephropathy (Berger''s Disease)", "Lupus Nephritis", "Goodpasture''s"]', 1, 'Presents as "synpharyngitic" hematuria (during or shortly after an infection). (Step-Up)'),
    (v_topic_id, '173: "Post-Streptococcal Glomerulonephritis" (PSGN) typically occurs ____ after a skin or throat infection.', '["1-2 days", "1-3 weeks", "6 months", "Years"]', 1, 'Presents with "cola-colored" urine and low complement (C3). (Pocket Medicine)'),
    (v_topic_id, '174: "Subepithelial humps" on electron microscopy are diagnostic for:', '["Lupus", "PSGN", "IgA Nephropathy", "Alport Syndrome"]', 1, 'Large immune complex deposits. (Harrison''s Ch. 311)'),
    (v_topic_id, '175: "Alport Syndrome" is a genetic defect in Type IV collagen that causes hereditary nephritis and:', '["Blindness", "Sensorineural Hearing Loss", "Heart failure", "Liver failure"]', 1, '"Can''t see, can''t pee, can''t hear a high-C." (Step-Up)'),
    (v_topic_id, '176: "Basket-weave" appearance of the GBM on EM is classic for:', '["Goodpasture", "Alport Syndrome", "Diabetic nephropathy", "Amyloid"]', 1, 'Due to irregular thinning and thickening of the membrane. (Pocket Medicine)'),
    (v_topic_id, '177: "Goodpasture Syndrome" is caused by antibodies against:', '["ANA", "Anti-GBM (Glomerular Basement Membrane)", "ANCA", "ASO"]', 1, 'Causes a "pulmonary-renal syndrome" with lung hemorrhage and glomerulonephritis. (Harrison''s Ch. 311)'),
    (v_topic_id, '178: Immunofluorescence showing "Linear" IgG staining along the GBM is diagnostic for:', '["PSGN", "Goodpasture Syndrome", "IgA Nephropathy", "Lupus"]', 1, 'Indicates direct antibody binding to the membrane. (Step-Up)'),
    (v_topic_id, '179: "Granulomatosis with Polyangiitis" (Wegener''s) is typically associated with which marker?', '["p-ANCA", "c-ANCA (PR3-ANCA)", "ANA", "Anti-dsDNA"]', 1, 'Causes necrotizing vasculitis of upper/lower respiratory tracts and kidneys. (Pocket Medicine)'),
    (v_topic_id, '180: "Microscopic Polyangiitis" is typically associated with:', '["c-ANCA", "p-ANCA (MPO-ANCA)", "Anti-GBM", "ASO"]', 1, 'Similar to GPA but lacks granulomas and upper airway involvement. (Harrison''s Ch. 311)');

    -- SECTION 19: RAPIDLY PROGRESSIVE GLOMERULONEPHRITIS (RPGN)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '181: The hallmark histological finding in RPGN is the presence of ____ in the glomeruli.', '["Sclerosis", "Crescents (composed of fibrin and macrophages)", "Humps", "Wire loops"]', 1, 'Indicates severe injury and rapid decline in renal function. (Harrison''s Ch. 311)'),
    (v_topic_id, '182: "Type 1 RPGN" is characterized by:', '["Immune complex deposition", "Anti-GBM antibodies", "Pauci-immune", "None"]', 1, 'Includes Goodpasture syndrome. (Step-Up)'),
    (v_topic_id, '183: "Type 3 RPGN" is "Pauci-immune" (negative immunofluorescence) and usually associated with:', '["Lupus", "ANCA-associated vasculitis (GPA, MPA, EGPA)", "Diabetes", "HIV"]', 1, 'The most common cause of RPGN in adults. (Pocket Medicine)'),
    (v_topic_id, '184: "Wire loop" lesions in the glomerulus are characteristic of:', '["Goodpasture", "Lupus Nephritis (Class IV)", "Diabetic nephropathy", "FSGS"]', 1, 'Due to subendothelial immune complex deposits. (Harrison''s Ch. 311)'),
    (v_topic_id, '185: Low serum C3 and C4 complements are typically seen in:', '["IgA Nephropathy", "Lupus Nephritis and Membranoproliferative GN (MPGN)", "MCD", "Alport"]', 1, 'Indicates classical complement pathway activation. (Step-Up)'),
    (v_topic_id, '186: "Tram-track" appearance of the GBM on light microscopy is classic for:', '["Lupus", "Membranoproliferative Glomerulonephritis (MPGN)", "Membranous", "Diabetic"]', 1, 'Due to mesangial cell interposition splitting the membrane. (Pocket Medicine)'),
    (v_topic_id, '187: "Henoch-Schonlein Purpura" (HSP) is a systemic form of which renal disease?', '["Lupus", "IgA Nephropathy", "PSGN", "RPGN"]', 1, 'Presents with palpable purpura, arthritis, and abdominal pain. (Harrison''s Ch. 311)'),
    (v_topic_id, '188: What is the primary treatment for most aggressive forms of Glomerulonephritis (like RPGN)?', '["Antibiotics", "Steroids and Cyclophosphamide/Rituximab", "Diuretics", "ACE inhibitors only"]', 1, 'Aggressive immunosuppression is needed to save the kidneys. (Step-Up)'),
    (v_topic_id, '189: "Mesangial hypercellularity" is the earliest finding in:', '["MCD", "IgA Nephropathy", "Diabetes", "Amyloid"]', 1, 'Immune complexes deposit in the mesangium. (Pocket Medicine)'),
    (v_topic_id, '190: "Hypocomplementemia" (Low C3) that persists for > 6 weeks after a sore throat suggests:', '["PSGN", "Membranoproliferative GN (MPGN)", "IgA Nephropathy", "MCD"]', 1, 'In PSGN, complement should normalize within 6-8 weeks. (Harrison''s Ch. 311)');

    -- SECTION 20: TUBULOINTERSTITIAL & VASCULAR DISEASES
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '191: "Autosomal Dominant Polycystic Kidney Disease" (ADPKD) is caused by mutations in:', '["PKD1 or PKD2", "PKHD1", "CFTR", "ATP7B"]', 0, 'Leads to progressive cyst formation and renal failure. (Harrison''s Ch. 316)'),
    (v_topic_id, '192: The most common extra-renal manifestation of ADPKD is:', '["Liver Cysts", "Brain tumors", "Lung fibrosis", "Skin rash"]', 0, 'Often found incidentally on ultrasound; usually asymptomatic. (Step-Up)'),
    (v_topic_id, '193: Patients with ADPKD are at increased risk for which life-threatening vascular complication?', '["Aortic dissection", "Berry Aneurysm (Circle of Willis) / Subarachnoid Hemorrhage", "Deep vein thrombosis", "Pulmonary embolism"]', 1, 'Requires screening if family history is positive. (Pocket Medicine)'),
    (v_topic_id, '194: "Renal Artery Stenosis" (RAS) should be suspected in a patient with:', '["Low blood pressure", "New-onset or refractory hypertension (especially if starting an ACEi causes AKI)", "Diabetes", "Hematuria"]', 1, 'ACE inhibitors reduce GFR in the setting of bilateral RAS. (Step-Up)'),
    (v_topic_id, '195: What is the most common cause of Renal Artery Stenosis in elderly smokers?', '["Fibromuscular Dysplasia", "Atherosclerosis", "Vasculitis", "None"]', 1, 'Plaque at the origin of the renal artery. (Harrison''s Ch. 317)'),
    (v_topic_id, '196: "Fibromuscular Dysplasia" (FMD) is a cause of RAS typically seen in:', '["Elderly men", "Young to middle-aged women", "Children", "Athletes"]', 1, 'Shows a "string of beads" appearance on angiography. (Pocket Medicine)'),
    (v_topic_id, '197: "Cholesterol Emboli" (Blue Toe Syndrome) typically occurs after:', '["A meal", "Vascular procedure (e.g., Cardiac cath)", "Exercise", "Sleep"]', 1, 'Plaques are dislodged and travel to small vessels in kidneys/toes. (Step-Up)'),
    (v_topic_id, '198: Eosinophiluria and "Livedo reticularis" after a vascular procedure suggest:', '["Contrast nephropathy", "Atheroembolic renal disease (Cholesterol emboli)", "UTI", "Sepsis"]', 1, 'Micro-infarctions from cholesterol crystals. (Harrison''s Ch. 317)'),
    (v_topic_id, '199: "Fanconi Syndrome" is a generalized dysfunction of which part of the nephron?', '["Glomerulus", "Proximal Tubule", "Loop of Henle", "Collecting Duct"]', 1, 'Causes wasting of glucose, amino acids, phosphate, and bicarb. (Pocket Medicine)'),
    (v_topic_id, '200: Renal Papillary Necrosis (sloughing of papillae) can be caused by the "POSTCARDS" mnemonic. What does the "S" stand for?', '["Smoking", "Sickle Cell Disease or Trait", "Sepsis", "Steroids"]', 1, 'Sickle cell, Obstruction, Silica, Tuberculosis, Cirrhosis, Analgesics, Renal vein thrombosis, Diabetes, Systemic vasculitis. (Step-Up)');

    -- SECTION 21: NEPHROLOGY REVIEW (1)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '201: "RBC casts" = ?', '["UTI", "Glomerulonephritis", "ATN", "Normal"]', 1, 'Pathognomonic for glomerular bleeding. (Harrison''s Ch. 310)'),
    (v_topic_id, '202: "WBC casts" = ?', '["Bladder cancer", "Pyelonephritis or AIN", "Stones", "Prostatitis"]', 1, 'Indicates inflammation of the kidney parenchyma. (Step-Up)'),
    (v_topic_id, '203: "Granular (Muddy brown) casts" = ?', '["Prerenal AKI", "ATN", "Nephrotic syndrome", "Postrenal"]', 1, 'Represents necrotic tubular debris. (Pocket Medicine)'),
    (v_topic_id, '204: "Waxy casts" = ?', '["Early AKI", "Advanced CKD/Renal Failure", "Infection", "Exercise"]', 1, 'Sign of very slow flow in dilated tubules. (Harrison''s Ch. 310)'),
    (v_topic_id, '205: "Fatty casts" = ?', '["Diabetes", "Nephrotic Syndrome", "Heart failure", "Dehydration"]', 1, 'Due to leakage of lipoproteins into urine. (Step-Up)'),
    (v_topic_id, '206: "Broad casts" = ?', '["Nephritic", "Advanced Renal Failure (End-stage)", "Early CKD", "Normal"]', 1, 'Large diameter from dilated collecting ducts. (Pocket Medicine)'),
    (v_topic_id, '207: "Dysmorphic RBCs" = ?', '["Kidney stone", "Glomerular source of bleeding", "UTI", "Menstruation"]', 1, 'RBCs are "chewed up" as they cross the filter. (Harrison''s Ch. 310)'),
    (v_topic_id, '208: "Eosinophiluria" = ?', '["ATN", "Acute Interstitial Nephritis (AIN)", "Postrenal", "Diabetes"]', 1, 'Classic finding in drug-induced AIN. (Step-Up)'),
    (v_topic_id, '209: "Urine pH > 8.0" is suggestive of infection by:', '["E. coli", "Urease-producing bacteria (e.g., Proteus)", "Chlamydia", "Candida"]', 1, 'Urease splits urea into ammonia, raising pH. (Pocket Medicine)'),
    (v_topic_id, '210: "Specific gravity < 1.010" in a dehydrated patient suggests:', '["Diabetes Mellitus", "Diabetes Insipidus", "SIADH", "Normal compensation"]', 1, 'Inability to concentrate the urine. (Harrison''s Ch. 310)');

    -- SECTION 22: NEPHROLOGY REVIEW (2)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '211: "Subendothelial" deposits (Wire loops) = ?', '["Lupus Nephritis Class IV", "Membranous", "PSGN", "MCD"]', 0, 'Classic for diffuse proliferative GN. (Harrison''s Ch. 311)'),
    (v_topic_id, '212: "Subepithelial" humps = ?', '["Goodpasture", "PSGN", "IgA Nephropathy", "Lupus"]', 1, 'Classic for post-infectious GN. (Step-Up)'),
    (v_topic_id, '213: "Mesangial" IgA deposits = ?', '["Berger Disease", "Wegener", "Alport", "Amyloid"]', 0, 'Hallmark of IgA nephropathy. (Pocket Medicine)'),
    (v_topic_id, '214: "Intramembranous" dense deposits = ?', '["Membranous", "MPGN Type II (Dense Deposit Disease)", "Diabetes", "FSGS"]', 1, 'Alternative complement pathway defect. (Harrison''s Ch. 311)'),
    (v_topic_id, '215: "Linear" IgG staining = ?', '["PSGN", "Goodpasture Disease", "MPGN", "Lupus"]', 1, 'Anti-GBM antibodies. (Step-Up)'),
    (v_topic_id, '216: "Granular" (Lumpy-bumpy) staining = ?', '["Goodpasture", "Immune-complex diseases (e.g., PSGN, Lupus)", "Wegener", "MCD"]', 1, 'Random deposition of immune complexes. (Pocket Medicine)'),
    (v_topic_id, '217: "Pauci-immune" (no staining) = ?', '["Lupus", "ANCA Vasculitis (GPA, MPA)", "Goodpasture", "PSGN"]', 1, 'Anti-neutrophil cytoplasmic antibodies drive the injury. (Harrison''s Ch. 311)'),
    (v_topic_id, '218: "Kimmelstiel-Wilson nodules" = ?', '["Amyloid", "Diabetic Nephropathy", "Lupus", "Hypertension"]', 1, 'Nodular glomerulosclerosis. (Step-Up)'),
    (v_topic_id, '219: "Foot process effacement" = ?', '["Membranous", "Minimal Change Disease", "Alport", "Goodpasture"]', 1, 'Only visible on EM. (Pocket Medicine)'),
    (v_topic_id, '220: "Crescents" = ?', '["Nephrotic syndrome", "Rapidly Progressive GN (RPGN)", "Simple CKD", "Stones"]', 1, 'Indicates severe, extra-capillary proliferation. (Harrison''s Ch. 311)');

    -- SECTION 23: HYPERTENSION (NEPHRO FOCUS)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '221: According to ACC/AHA 2017 guidelines, "Stage 1 Hypertension" is defined as:', '["120-129 / <80", "130-139 / 80-89", ">= 140 / 90", ">= 160 / 100"]', 1, 'Lower thresholds to encourage early intervention. (Step-Up)'),
    (v_topic_id, '222: "Hypertensive Urgency" is a BP > 180/120 WITHOUT:', '["Headache", "End-organ damage (e.g., AKI, Stroke)", "Chest pain", "Anxiety"]', 1, 'Managed with oral medications over 24-48 hours. (Harrison''s Ch. 280)'),
    (v_topic_id, '223: "Hypertensive Emergency" requires ____ lowering of BP with ____.', '["Rapid (25% in 1 hr); IV medications", "Slow (days); Oral meds", "Immediate (to 100/60); Fluids", "None"]', 0, 'To prevent or limit end-organ damage. (Pocket Medicine)'),
    (v_topic_id, '224: Which class of HTN medication is first-line for patients with Chronic Kidney Disease?', '["Beta-blockers", "ACE Inhibitors or ARBs", "Calcium channel blockers", "Diuretics only"]', 1, 'Provides renal protection by reducing intraglomerular pressure. (Step-Up)'),
    (v_topic_id, '225: A major side effect of ACE inhibitors is a dry cough, due to the accumulation of:', '["Angiotensin II", "Bradykinin", "Renin", "Potassium"]', 1, 'Switching to an ARB often resolves this. (Harrison''s Ch. 280)'),
    (v_topic_id, '226: "Dihydropyridine" calcium channel blockers (e.g., Amlodipine) commonly cause:', '["Cough", "Peripheral Edema", "Hyperkalemia", "Gout"]', 1, 'Due to precapillary vasodilation. (Pocket Medicine)'),
    (v_topic_id, '227: Which diuretic is first-line for the treatment of essential hypertension?', '["Furosemide", "Chlorthalidone or Hydrochlorothiazide", "Spironolactone", "Acetazolamide"]', 1, 'Thiazide-type diuretics are preferred. (Step-Up)'),
    (v_topic_id, '228: "Resistant Hypertension" is defined as BP not at goal despite using ____ medications.', '["One", "Two", "Three (including a diuretic)", "Five"]', 2, 'Requires investigation for secondary causes. (Harrison''s Ch. 280)'),
    (v_topic_id, '229: What is the most common cause of secondary hypertension?', '["Pheochromocytoma", "Renovascular disease or CKD", "Cushing Syndrome", "Sleep Apnea"]', 1, 'Kidney disease is the #1 driver. (Pocket Medicine)'),
    (v_topic_id, '230: "Beta-blockers" are NOT first-line for uncomplicated HTN, unless the patient has:', '["Diabetes", "Heart Failure or CAD", "Asthma", "Gout"]', 1, 'Compelling indications for beta-blockade. (Step-Up)');

    -- SECTION 24: KIDNEY STONES (NEPHROLITHIASIS)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '231: What is the most common type of kidney stone?', '["Calcium Oxalate", "Uric Acid", "Struvite", "Cystine"]', 0, 'Radiopaque on X-ray. (Harrison''s Ch. 318)'),
    (v_topic_id, '232: "Struvite" stones (Magnesium Ammonium Phosphate) are also called "Staghorn" stones and are associated with:', '["Low protein diet", "Infection by urease-producing bacteria (e.g., Proteus)", "Diabetes", "Gout"]', 1, 'They grow rapidly and fill the renal pelvis. (Step-Up)'),
    (v_topic_id, '233: "Uric acid" stones are unique because they are:', '["Radiopaque", "Radiolucent (invisible on X-ray)", "Green", "Small"]', 1, 'Easily seen on non-contrast CT. (Pocket Medicine)'),
    (v_topic_id, '234: "Hexagonal" crystals in the urine are pathognomonic for:', '["Calcium", "Cystine stones", "Uric acid", "Proteus infection"]', 1, 'Due to a genetic defect in amino acid transport. (Harrison''s Ch. 318)'),
    (v_topic_id, '235: What is the first-line imaging modality for acute "Renal Colic"?', '["Ultrasound", "Non-contrast Helical CT (CT KUB)", "MRI", "Abdominal X-ray"]', 1, 'High sensitivity for all stone types. (Step-Up)'),
    (v_topic_id, '236: Stones smaller than ____ mm have a high probability of passing spontaneously.', '["1", "5", "10", "20"]', 1, 'Often managed with hydration and alpha-blockers (e.g., Tamsulosin). (Pocket Medicine)'),
    (v_topic_id, '237: "Thiazide diuretics" are used to PREVENT calcium stones because they:', '["Excrete calcium", "Reduce urinary calcium excretion", "Dissolve stones", "Increase urine pH"]', 1, 'They increase calcium reabsorption in the distal tubule. (Harrison''s Ch. 318)'),
    (v_topic_id, '238: "Alkalinization" of urine (with Potassium Citrate) is the treatment for which stones?', '["Calcium", "Uric Acid and Cystine", "Struvite", "None"]', 1, 'Uric acid is more soluble at higher pH. (Step-Up)'),
    (v_topic_id, '239: Which type of stone is "envelope-shaped" or "dumb-bell shaped" on microscopy?', '["Cystine", "Calcium Oxalate", "Struvite", "Uric Acid"]', 1, 'Most common finding in stone-formers. (Pocket Medicine)'),
    (v_topic_id, '240: "Coffin-lid" shaped crystals suggest:', '["Calcium", "Struvite (Infection) stones", "Cystine", "Uric Acid"]', 1, 'Found in alkaline urine. (Harrison''s Ch. 318)');

    RAISE NOTICE 'SUCCESS: Nephrology MCQ Part 3 (161-240) registered.';
END $$;

COMMIT;
