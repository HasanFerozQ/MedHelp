-- Migration: Year 3 - Nephrology MCQ Bank (PART 1: 1-80)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-29

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'nephrology' LIMIT 1;

    -- SECTION 1: ACUTE KIDNEY INJURY (AKI)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '1: Acute Kidney Injury (AKI) is defined by an increase in serum creatinine of >= ____ mg/dL within 48 hours.', '["0.1", "0.3", "0.5", "1.0"]', 1, 'KDIGO criteria for Stage 1 AKI. (Harrison''s Ch. 312)'),
    (v_topic_id, '2: What is the most common cause of "Prerenal" AKI?', '["Glomerulonephritis", "Volume depletion/Hypoperfusion", "Obstruction", "Toxins"]', 1, 'Decreased renal blood flow leads to a drop in GFR. (Step-Up)'),
    (v_topic_id, '3: In Prerenal AKI, the Fractional Excretion of Sodium (FENa) is typically:', '["< 1%", "> 2%", "> 5%", "10%"]', 0, 'The kidneys are healthy and trying to conserve sodium and water. (Pocket Medicine)'),
    (v_topic_id, '4: A "BUN/Creatinine ratio > 20:1" is highly suggestive of:', '["Intrarenal AKI", "Prerenal AKI", "Postrenal AKI", "Nephrotic syndrome"]', 1, 'Urea is reabsorbed with water in the setting of low flow. (Step-Up)'),
    (v_topic_id, '5: "Muddy brown granular casts" in the urine are diagnostic of:', '["Acute Tubular Necrosis (ATN)", "Glomerulonephritis", "Pyelonephritis", "Prerenal AKI"]', 0, 'Represents sloughing of dead tubular cells. (Harrison''s Ch. 312)'),
    (v_topic_id, '6: What is the most common cause of hospital-acquired Intrarenal AKI?', '["Infection", "Acute Tubular Necrosis (ATN)", "Vasculitis", "Stone"]', 1, 'Often due to ischemia or nephrotoxins like contrast. (Pocket Medicine)'),
    (v_topic_id, '7: Which of the following is a classic "Postrenal" cause of AKI?', '["NSAIDs", "Benign Prostatic Hyperplasia (BPH)", "Hypovolemia", "Sepsis"]', 1, 'Obstruction to urine outflow. (Step-Up)'),
    (v_topic_id, '8: In Acute Tubular Necrosis (ATN), the urine sodium concentration is typically:', '["< 20 mEq/L", "> 40 mEq/L", "Zero", "5 mEq/L"]', 1, 'Damaged tubules cannot reabsorb sodium effectively. (Harrison''s Ch. 312)'),
    (v_topic_id, '9: "Fractional Excretion of Urea (FEUrea)" is most useful for diagnosing prerenal states in patients taking:', '["Aspirin", "Diuretics", "Antibiotics", "Statins"]', 1, 'Diuretics interfere with sodium handling but urea remains a good marker. (Pocket Medicine)'),
    (v_topic_id, '10: Contrast-Induced Nephropathy (CIN) typically presents as a rise in creatinine peaking within:', '["30 minutes", "3-5 days", "2 weeks", "1 month"]', 1, 'Usually reversible; hydration is key for prevention. (Step-Up)');

    -- SECTION 2: NEPHROTOXINS & DRUG-INDUCED AKI
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '11: Which class of antibiotics is notorious for causing direct tubular toxicity (ATN)?', '["Penicillins", "Aminoglycosides (e.g., Gentamicin)", "Cephalosporins", "Macrolides"]', 1, 'Toxicity is related to accumulation in the proximal tubule. (Harrison''s Ch. 312)'),
    (v_topic_id, '12: "Acute Interstitial Nephritis" (AIN) is most often an allergic reaction to:', '["Water", "Drugs (NSAIDs, Penicillins, PPIs)", "Sugar", "Fat"]', 1, 'Causes inflammation of the interstitium. (Step-Up)'),
    (v_topic_id, '13: The classic triad of AIN includes fever, rash, and:', '["Hematuria", "Eosinophilia", "Hypertension", "Edema"]', 1, 'Though all three are present in <10% of cases. (Pocket Medicine)'),
    (v_topic_id, '14: "White blood cell casts" in the urine (without signs of infection) suggest:', '["ATN", "Acute Interstitial Nephritis (AIN)", "Prerenal AKI", "Stones"]', 1, 'Sign of tubulointerstitial inflammation. (Harrison''s Ch. 312)'),
    (v_topic_id, '15: NSAIDs cause prerenal AKI by inhibiting prostaglandins, which leads to:', '["Afferent arteriole constriction", "Efferent arteriole dilation", "Tubular blockage", "Systemic hypertension"]', 0, 'Prostaglandins normally keep the afferent arteriole open. (Step-Up)'),
    (v_topic_id, '16: ACE inhibitors and ARBs can cause AKI by causing:', '["Afferent constriction", "Efferent arteriole dilation", "Direct toxicity", "Obstruction"]', 1, 'They block Angiotensin II, which normally constricts the efferent arteriole to maintain GFR. (Pocket Medicine)'),
    (v_topic_id, '17: Amphotericin B causes AKI primarily through:', '["Allergic reaction", "Direct tubular toxicity and renal vasoconstriction", "Stone formation", "None"]', 1, 'Often causes significant electrolyte wasting (K+ and Mg2+). (Harrison''s Ch. 312)'),
    (v_topic_id, '18: "Rhabdomyolysis" causes AKI due to the nephrotoxic effects of:', '["Hemoglobin", "Myoglobin", "Albumin", "Glucose"]', 1, 'Myoglobin precipitates in tubules and causes oxidative damage. (Step-Up)'),
    (v_topic_id, '19: "Tumor Lysis Syndrome" causes AKI primarily through the deposition of:', '["Calcium", "Uric Acid", "Potassium", "Cystine"]', 1, 'Massive release of intracellular contents from tumor cells. (Pocket Medicine)'),
    (v_topic_id, '20: Ethylene glycol (antifreeze) poisoning causes AKI due to the formation of:', '["Uric acid crystals", "Calcium Oxalate crystals", "Cholesterol emboli", "None"]', 1, 'Crystals cause mechanical obstruction and toxicity. (Harrison''s Ch. 312)');

    -- SECTION 3: CHRONIC KIDNEY DISEASE (CKD) BASICS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '21: Chronic Kidney Disease (CKD) is defined as kidney damage or GFR < ____ mL/min/1.73m2 for > 3 months.', '["90", "60", "30", "15"]', 1, 'Threshold for Stage 3 CKD. (Harrison''s Ch. 313)'),
    (v_topic_id, '22: What is the #1 cause of CKD and End-Stage Renal Disease (ESRD) in the United States?', '["Hypertension", "Diabetes Mellitus", "Glomerulonephritis", "Polycystic Kidney Disease"]', 1, 'Diabetic nephropathy is the leading driver. (Step-Up)'),
    (v_topic_id, '23: What is the #2 cause of CKD in the United States?', '["Diabetes", "Hypertension", "Lupus", "Infection"]', 1, 'Hypertensive nephrosclerosis. (Harrison''s Ch. 313)'),
    (v_topic_id, '24: "Uremia" refers to the clinical syndrome of symptomatic renal failure. Which is a common early symptom?', '["Seizures", "Anorexia, Nausea, and Fatigue", "Coma", "Pericarditis"]', 1, 'Accumulation of nitrogenous waste products. (Pocket Medicine)'),
    (v_topic_id, '25: GFR is most commonly estimated (eGFR) using which endogenous marker?', '["Urea", "Creatinine", "Cystatin C", "Inulin"]', 1, 'Creatinine is freely filtered but slightly secreted. (Step-Up)'),
    (v_topic_id, '26: Which formula is currently recommended for estimating GFR in clinical practice?', '["Cockcroft-Gault", "CKD-EPI (2021 update)", "MDRD", "None"]', 1, 'CKD-EPI is preferred over MDRD. (Harrison''s Ch. 313)'),
    (v_topic_id, '27: "Albuminuria" (ACR > 30 mg/g) is an independent risk factor for:', '["CKD progression and Cardiovascular disease", "Liver failure", "Lung cancer", "Diabetes only"]', 0, 'Signifies endothelial damage. (Pocket Medicine)'),
    (v_topic_id, '28: Stage 5 CKD (ESRD) is defined by a GFR less than:', '["60", "30", "15", "5"]', 2, 'Requires planning for dialysis or transplant. (Step-Up)'),
    (v_topic_id, '29: CKD leads to "Normocytic Anemia" primarily due to a deficiency of:', '["Iron", "Erythropoietin (EPO)", "Vitamin B12", "Folate"]', 1, 'The kidneys produce EPO in response to hypoxia. (Harrison''s Ch. 313)'),
    (v_topic_id, '30: "Renal Osteodystrophy" in CKD is driven by which electrolyte pattern?', '["Low Phosphate, Low Calcium", "High Phosphate, Low Calcium", "High Phosphate, High Calcium", "Low Phosphate, High Calcium"]', 1, 'Phosphate retention leads to secondary hyperparathyroidism. (Step-Up)');

    -- SECTION 4: COMPLICATIONS OF CKD
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '31: Secondary Hyperparathyroidism in CKD is primarily caused by:', '["Vitamin D toxicity", "Hypophosphatemia", "Hyperphosphatemia and Low 1,25-OH Vitamin D", "Low PTH"]', 2, 'The failing kidney cannot activate Vitamin D or excrete phosphate. (Harrison''s Ch. 313)'),
    (v_topic_id, '32: "Uremic Pericarditis" is an absolute indication for:', '["Antibiotics", "Urgent Dialysis", "NSAIDs", "Steroids"]', 1, 'A life-threatening complication of severe uremia. (Pocket Medicine)'),
    (v_topic_id, '33: What is the leading cause of death in patients with CKD?', '["Renal failure", "Cardiovascular Disease (CVD)", "Infection", "Cancer"]', 1, 'Patients are more likely to die of a heart attack than to reach dialysis. (Step-Up)'),
    (v_topic_id, '34: "Waxy casts" in the urine sediment are characteristic of:', '["Acute infection", "Chronic Kidney Disease/End-stage renal failure", "Prerenal AKI", "Normal urine"]', 1, 'Suggest long-standing tubular stasis. (Harrison''s Ch. 313)'),
    (v_topic_id, '35: In CKD, "Calciphylaxis" refers to:', '["Bone growth", "Vascular calcification and skin necrosis", "Kidney stones", "Lung nodules"]', 1, 'A rare, painful, and often fatal complication of mineral metabolism. (Pocket Medicine)'),
    (v_topic_id, '36: What is the preferred blood pressure target for most CKD patients (KDIGO 2024)?', '["< 140/90", "< 130/80", "SBP < 120 mmHg", "< 150/90"]', 2, 'Lower targets are now favored if tolerated. (Harrison''s Ch. 313)'),
    (v_topic_id, '37: Which class of drugs is first-line for slowing CKD progression in diabetic patients?', '["Diuretics", "ACE Inhibitors or ARBs", "Beta-blockers", "Calcium channel blockers"]', 1, 'They reduce intraglomerular pressure. (Step-Up)'),
    (v_topic_id, '38: CKD typically causes which acid-base disturbance?', '["Metabolic Alkalosis", "Anion-Gap Metabolic Acidosis", "Respiratory Acidosis", "Normal-Gap Metabolic Acidosis only"]', 1, 'Failure to excrete organic acids (titratable acidity). (Harrison''s Ch. 313)'),
    (v_topic_id, '39: "Uremic Frost" is a rare physical finding of:', '["High sugar", "Urea crystals on the skin in severe uremia", "Fever", "Sweating"]', 1, 'Seen only in very advanced, untreated ESRD. (Pocket Medicine)'),
    (v_topic_id, '40: The goal hemoglobin for CKD patients on EPO therapy is typically:', '["14-16 g/dL", "10-11.5 g/dL", "> 13 g/dL", "8 g/dL"]', 1, 'Higher targets increase the risk of stroke and thrombosis. (Step-Up)');

    -- SECTION 5: RENAL REPLACEMENT THERAPY (DIALYSIS)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '41: What is the most common absolute indication for starting dialysis (the "AEIOU" mnemonic)?', '["Anemia", "Acidosis (refractory), Electrolytes (K+), Ingestions, Overload (Volume), Uremia", "Age", "Anorexia"]', 1, 'Emergent indications for RRT. (Harrison''s Ch. 314)'),
    (v_topic_id, '42: Which form of dialysis uses the patient''s own abdominal lining as a filter?', '["Hemodialysis", "Peritoneal Dialysis", "CRRT", "Plasmapheresis"]', 1, 'Can be done at home daily. (Step-Up)'),
    (v_topic_id, '43: The most common complication of Peritoneal Dialysis is:', '["Bleeding", "Peritonitis", "Heart attack", "Stroke"]', 1, 'Often due to skin flora like Staph epidermidis. (Pocket Medicine)'),
    (v_topic_id, '44: What is the "Gold Standard" vascular access for long-term hemodialysis?', '["Permcath", "Arteriovenous (AV) Fistula", "AV Graft", "Femoral line"]', 1, 'Has the lowest risk of infection and thrombosis. (Harrison''s Ch. 314)'),
    (v_topic_id, '45: "Disequilibrium Syndrome" during or after dialysis is caused by:', '["Low blood pressure", "Rapid removal of urea causing cerebral edema", "High sugar", "Infection"]', 1, 'Avoided by slow, gentle initial dialysis sessions. (Step-Up)'),
    (v_topic_id, '46: Continuous Renal Replacement Therapy (CRRT) is primarily used in which setting?', '["Outpatient clinic", "ICU for hemodynamically unstable patients", "Emergency Room only", "Home"]', 1, 'Better tolerated by patients with low blood pressure. (Pocket Medicine)'),
    (v_topic_id, '47: What is the leading cause of death in patients on chronic hemodialysis?', '["Renal failure", "Cardiovascular Disease", "Infection", "Dialysis accidents"]', 1, 'Sudden cardiac death and MI are common. (Harrison''s Ch. 314)'),
    (v_topic_id, '48: Patients on dialysis must strictly limit their intake of which two electrolytes?', '["Sodium and Calcium", "Potassium and Phosphorus", "Magnesium and Zinc", "Chloride and Iron"]', 1, 'To avoid life-threatening hyperkalemia and bone disease. (Step-Up)'),
    (v_topic_id, '49: "Amyloidosis" in long-term dialysis patients is caused by the accumulation of:', '["Albumin", "Beta-2 Microglobulin", "Glucose", "Iron"]', 1, 'It is not cleared well by standard dialysis membranes. (Pocket Medicine)'),
    (v_topic_id, '50: How many times per week is standard in-center hemodialysis usually performed?', '["Every day", "3 times per week", "Once a month", "Twice a week"]', 1, 'Typically 3.5 to 4 hours per session. (Harrison''s Ch. 314)');

    -- SECTION 6: RENAL TRANSPLANTATION
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '51: What is the treatment of choice for most patients with Stage 5 CKD?', '["Life-long hemodialysis", "Renal Transplantation", "Peritoneal dialysis", "Hospice"]', 1, 'Provides better quality of life and survival than dialysis. (Harrison''s Ch. 315)'),
    (v_topic_id, '52: "Hyperacute rejection" of a kidney transplant occurs within ____ and is due to ____.', '["Days; T-cells", "Minutes to Hours; Pre-formed antibodies", "Months; Fibrosis", "Years; Hypertension"]', 1, 'Type II hypersensitivity. (Step-Up)'),
    (v_topic_id, '53: "Acute rejection" (within weeks/months) is primarily mediated by:', '["B-cells", "T-cells (Cellular rejection)", "Infection", "Drugs"]', 1, 'Requires increase in immunosuppression. (Pocket Medicine)'),
    (v_topic_id, '54: Which medication class is the "backbone" of modern transplant immunosuppression?', '["NSAIDs", "Calcineurin Inhibitors (e.g., Tacrolimus, Cyclosporine)", "Antibiotics", "Diuretics"]', 1, 'They inhibit IL-2 production. (Harrison''s Ch. 315)'),
    (v_topic_id, '55: A major side effect of Tacrolimus and Cyclosporine is:', '["Liver failure", "Nephrotoxicity", "Weight loss", "Low blood pressure"]', 1, 'Ironically, these kidney transplant drugs can damage the kidney. (Step-Up)'),
    (v_topic_id, '56: Transplant patients are at increased risk for which opportunistic infection?', '["Strep throat", "Cytomegalovirus (CMV)", "Common cold", "Malaria"]', 1, 'Requires prophylaxis (e.g., Valganciclovir). (Pocket Medicine)'),
    (v_topic_id, '57: Which type of cancer is most common in transplant recipients due to immunosuppression?', '["Breast cancer", "Squamous cell skin cancer and Lymphoma (PTLD)", "Lung cancer", "Colon cancer"]', 1, 'Regular screening is essential. (Harrison''s Ch. 315)'),
    (v_topic_id, '58: "BK Virus" nephropathy is a common cause of graft dysfunction in:', '["Liver transplant", "Kidney transplant recipients", "Heart transplant", "None"]', 1, 'A polyomavirus that reactivates during immunosuppression. (Step-Up)'),
    (v_topic_id, '59: The "native" kidneys are usually ____ during a transplant procedure.', '["Removed", "Left in place", "Moved to the chest", "Biopsied only"]', 1, 'The new kidney is typically placed in the iliac fossa. (Pocket Medicine)'),
    (v_topic_id, '60: Which HLA matching is most important for long-term kidney graft survival?', '["HLA-A, B, and DR", "HLA-C", "HLA-G", "None"]', 0, 'Minimizing mismatches improves outcomes. (Harrison''s Ch. 315)');

    -- SECTION 7: CLINICAL EVALUATION (PISSING PROBLEMS)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '61: "Hematuria" is defined as >= ____ RBCs per high-power field on urine microscopy.', '["1", "3", "10", "50"]', 1, 'Can be microscopic or gross. (Harrison''s Ch. 310)'),
    (v_topic_id, '62: "Dysmorphic RBCs" and "RBC casts" in the urine suggest:', '["Bladder cancer", "Glomerular bleeding (Glomerulonephritis)", "Kidney stones", "UTI"]', 1, 'RBCs are damaged as they squeeze through the glomerulus. (Step-Up)'),
    (v_topic_id, '63: "Coca-cola" or tea-colored urine is a classic sign of:', '["Stones", "Glomerulonephritis/Nephritic Syndrome", "Dehydration", "Liver failure only"]', 1, 'Due to oxidized blood in the urine. (Pocket Medicine)'),
    (v_topic_id, '64: "Proteinuria" detected on a standard dipstick primarily measures:', '["Globulins", "Albumin", "Light chains", "Glucose"]', 1, 'It is less sensitive to non-albumin proteins. (Harrison''s Ch. 310)'),
    (v_topic_id, '65: "Bence-Jones proteins" in the urine suggest which condition?', '["Diabetes", "Multiple Myeloma", "Lupus", "Hypertension"]', 1, 'Free light chains not detected by standard dipstick. (Step-Up)'),
    (v_topic_id, '66: "Pyuria" is the presence of ____ in the urine.', '["Red cells", "White cells (Pus)", "Fat", "Sugar"]', 1, 'Suggests infection or inflammation. (Pocket Medicine)'),
    (v_topic_id, '67: "Isosthenuria" (fixed urine specific gravity at 1.010) is a sign of:', '["Diabetes Insipidus", "Advanced CKD (loss of concentrating ability)", "Overhydration", "SIADH"]', 1, 'The kidney cannot concentrate or dilute the urine. (Harrison''s Ch. 310)'),
    (v_topic_id, '68: "Broad casts" in the urine sediment are also known as:', '["RBC casts", "Renal failure casts", "Hyaline casts", "Waxy casts"]', 1, 'Formed in dilated, damaged tubules of failing kidneys. (Step-Up)'),
    (v_topic_id, '69: "Hyaline casts" in the urine are often:', '["Always pathologic", "Normal (seen with dehydration or exercise)", "Sign of cancer", "Sign of Lupus"]', 1, 'Composed of Tamm-Horsfall protein. (Pocket Medicine)'),
    (v_topic_id, '70: "Nitrites" and "Leukocyte Esterase" on a dipstick are screening markers for:', '["Kidney failure", "Urinary Tract Infection (UTI)", "Diabetes", "Pregnancy"]', 1, 'Nitrites are produced by many Gram-negative bacteria. (Harrison''s Ch. 310)');

    -- SECTION 8: ANATOMY & PHYSIOLOGY (NEPHRO)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '71: What is the functional unit of the kidney?', '["Glomerulus", "Nephron", "Tubule", "Cortex"]', 1, 'Contains the glomerulus and associated tubules. (Harrison''s Ch. 309)'),
    (v_topic_id, '72: Most of the filtered water and solutes are reabsorbed in the:', '["Proximal Tubule", "Loop of Henle", "Distal Tubule", "Collecting Duct"]', 0, 'Reabsorbs ~65% of the filtrate. (Step-Up)'),
    (v_topic_id, '73: The "Descending Limb" of the Loop of Henle is permeable to ____ but not ____.', '["Solutes, Water", "Water, Solutes", "Both", "Neither"]', 1, 'Concentrates the tubular fluid. (Pocket Medicine)'),
    (v_topic_id, '74: The "Thick Ascending Limb" is the site of action for which class of diuretics?', '["Thiazides", "Loop Diuretics (e.g., Furosemide)", "Spironolactone", "Acetazolamide"]', 1, 'Inhibits the Na-K-2Cl cotransporter. (Harrison''s Ch. 309)'),
    (v_topic_id, '75: "Aldosterone" acts on the distal tubule and collecting duct to:', '["Excrete Sodium", "Reabsorb Sodium and Excrete Potassium/H+", "Reabsorb Water only", "Block Calcium"]', 1, 'Increases blood pressure and volume. (Step-Up)'),
    (v_topic_id, '76: "Antidiuretic Hormone" (ADH) increases water permeability in the:', '["Proximal tubule", "Collecting Duct", "Loop of Henle", "Glomerulus"]', 1, 'Inserts aquaporin channels. (Pocket Medicine)'),
    (v_topic_id, '77: The "Juxtaglomerular Apparatus" (JGA) senses low blood pressure and secretes:', '["Insulin", "Renin", "ACE", "Aldosterone"]', 1, 'Starts the RAAS cascade. (Harrison''s Ch. 309)'),
    (v_topic_id, '78: Which hormone is produced by the kidney to regulate calcium balance?', '["PTH", "1,25-dihydroxyvitamin D (Calcitriol)", "Calcitonin", "Thyroid hormone"]', 1, 'The 1-alpha-hydroxylase enzyme is in the kidney. (Step-Up)'),
    (v_topic_id, '79: "Macula densa" cells are located in the:', '["Proximal tubule", "Distal Tubule", "Loop of Henle", "Bladder"]', 1, 'Sense chloride delivery to regulate GFR (tubuloglomerular feedback). (Pocket Medicine)'),
    (v_topic_id, '80: The "Efferent arteriole" carries blood ____ the glomerulus.', '["Toward", "Away from", "To the heart", "To the liver"]', 1, 'Constriction increases the filtration pressure. (Harrison''s Ch. 309)');

    RAISE NOTICE 'SUCCESS: Nephrology MCQ Part 1 (1-80) registered.';
END $$;

COMMIT;
