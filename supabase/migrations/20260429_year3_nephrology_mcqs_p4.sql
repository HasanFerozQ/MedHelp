-- Migration: Year 3 - Nephrology MCQ Bank (PART 4: 241-320)
-- Based on Harrison's 22nd Ed, Step-Up to Medicine 5th Ed, and Pocket Medicine 7th Ed.
-- Date: 2026-04-29

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'nephrology' LIMIT 1;

    -- SECTION 25: RENAL NEOPLASMS
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '241: What is the most common histological type of Kidney Cancer?', '["Squamous cell", "Clear Cell Renal Cell Carcinoma (RCC)", "Transition cell", "Wilms tumor"]', 1, 'Originates from the proximal tubule cells. (Harrison''s Ch. 85)'),
    (v_topic_id, '242: The classic triad of RCC (painless hematuria, flank pain, and palpable mass) is present in ____ of patients.', '["10%", "50%", "90%", "100%"]', 0, 'Most cases are now found incidentally on imaging. (Step-Up)'),
    (v_topic_id, '243: Which genetic syndrome is most strongly associated with RCC?', '["Lynch syndrome", "Von Hippel-Lindau (VHL) disease", "Li-Fraumeni", "MEN1"]', 1, 'Associated with VHL gene mutation on chromosome 3. (Pocket Medicine)'),
    (v_topic_id, '244: "Left-sided Varicocele" in an older man should prompt investigation for:', '["Infection", "Renal Cell Carcinoma (tumor obstructing the renal vein)", "Diabetes", "Heart failure"]', 1, 'The left spermatic vein drains into the left renal vein. (Step-Up)'),
    (v_topic_id, '245: RCC often presents with "Paraneoplastic Syndromes." Which of the following is common?', '["Erythrocytosis (due to excess EPO production)", "Hypercalcemia", "Hypertension", "All of the above"]', 3, 'RCC is a "great mimicker." (Harrison''s Ch. 85)'),
    (v_topic_id, '246: What is the primary treatment for localized RCC?', '["Chemotherapy", "Surgical resection (Partial or Radical Nephrectomy)", "Radiation", "Wait and watch"]', 1, 'RCC is notoriously resistant to chemo and radiation. (Pocket Medicine)'),
    (v_topic_id, '247: "Bladder Cancer" (Urothelial/Transitional Cell CA) is most strongly associated with:', '["Alcohol", "Smoking and occupational dye exposure", "High protein diet", "Obesity"]', 1, 'Painless gross hematuria is the most common symptom. (Step-Up)'),
    (v_topic_id, '248: "Schistosoma haematobium" infection is a major risk factor for which bladder cancer?', '["Transitional cell", "Squamous cell carcinoma of the bladder", "Adenocarcinoma", "None"]', 1, 'Common in Egypt and parts of Africa. (Harrison''s Ch. 85)'),
    (v_topic_id, '249: "Wilms Tumor" (Nephroblastoma) is the most common renal malignancy in:', '["Elderly", "Children (usually < 5 years old)", "Teenagers", "Smokers"]', 1, 'Often presents as a large, smooth flank mass. (Pocket Medicine)'),
    (v_topic_id, '250: "Angiomyolipoma" is a benign renal tumor often seen in patients with:', '["Diabetes", "Tuberous Sclerosis", "Lupus", "Cirrhosis"]', 1, 'Composed of blood vessels, muscle, and fat. (Step-Up)');

    -- SECTION 26: RENAL VASCULAR & MISC
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '251: "Renal Vein Thrombosis" is most commonly associated with which nephrotic syndrome?', '["MCD", "Membranous Nephropathy", "FSGS", "IgA"]', 1, 'Highest risk of hypercoagulability. (Harrison''s Ch. 317)'),
    (v_topic_id, '252: "Acute Renal Infarction" classically presents with sudden onset flank pain and:', '["Fever", "High LDH and hematuria", "Diarrhea", "Jaundice"]', 1, 'Often due to emboli from atrial fibrillation. (Pocket Medicine)'),
    (v_topic_id, '253: "Nutcracker Syndrome" refers to compression of the left renal vein between the:', '["Aorta and Superior Mesenteric Artery (SMA)", "Liver and Kidney", "Spine and Aorta", "None"]', 0, 'Causes left flank pain and hematuria. (Step-Up)'),
    (v_topic_id, '254: "Hepatorenal Syndrome" (HRS) is a type of AKI seen in patients with:', '["Diabetes", "Advanced Cirrhosis and Portal Hypertension", "Heart failure", "Lungs failure"]', 1, 'Due to severe renal vasoconstriction. (Harrison''s Ch. 335)'),
    (v_topic_id, '255: The definitive treatment for Type 1 Hepatorenal Syndrome is:', '["Diuretics", "Liver Transplantation", "Antibiotics", "IV fluids only"]', 1, 'Terlipressin/Albumin can be used as a bridge. (Pocket Medicine)'),
    (v_topic_id, '256: "Cardiorenal Syndrome" refers to kidney injury resulting from:', '["High blood sugar", "Severe Heart Failure (congestive or low-flow)", "Liver failure", "Smoking"]', 1, 'The kidney depends on cardiac output and low venous pressure. (Step-Up)'),
    (v_topic_id, '257: "Contrast Nephropathy" can often be prevented by:', '["Giving more contrast", "Pre-procedure IV hydration with Normal Saline", "Steroids", "Diuretics"]', 1, 'Sodium bicarbonate or N-acetylcysteine are less favored now. (Harrison''s Ch. 312)'),
    (v_topic_id, '258: "Gadolinium" contrast in patients with GFR < 30 should be avoided due to the risk of:', '["ATN", "Nephrogenic Systemic Fibrosis (NSF)", "Liver failure", "Stroke"]', 1, 'Causes severe skin and organ thickening. (Pocket Medicine)'),
    (v_topic_id, '259: Which imaging modality is BEST for measuring kidney size and checking for hydronephrosis?', '["X-ray", "Renal Ultrasound", "CT without contrast", "MRI"]', 1, 'Safe, non-invasive, and no radiation. (Step-Up)'),
    (v_topic_id, '260: Small, echogenic kidneys on ultrasound suggest:', '["Acute AKI", "Chronic Kidney Disease (CKD)", "Tumor", "Infection"]', 1, 'Indicates irreversible fibrosis and atrophy. (Harrison''s Ch. 313)');

    -- SECTION 27: DIURETICS & RENAL PHARMACOLOGY
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '261: "Furosemide" (Lasix) is a loop diuretic that inhibits the ____ cotransporter.', '["Na-Cl", "Na-K-2Cl", "ENaC", "SGLT2"]', 1, 'Acts in the thick ascending limb. (Harrison''s Ch. 309)'),
    (v_topic_id, '262: "Spironolactone" is a potassium-sparing diuretic that acts as a/an:', '["Aldosterone Antagonist", "ACE Inhibitor", "Beta blocker", "None"]', 0, 'Used in heart failure, cirrhosis, and Conn syndrome. (Step-Up)'),
    (v_topic_id, '263: "Mannitol" is an ____ diuretic used to treat cerebral edema.', '["Loop", "Osmotic", "Thiazide", "Potassium-sparing"]', 1, 'Pulls water out of the brain into the vasculature. (Pocket Medicine)'),
    (v_topic_id, '264: "Acetazolamide" works in the ____ by inhibiting carbonic anhydrase.', '["Distal tubule", "Proximal tubule", "Loop of Henle", "Collecting duct"]', 1, 'Used for glaucoma and altitude sickness. (Harrison''s Ch. 309)'),
    (v_topic_id, '265: "Hydrochlorothiazide" (HCTZ) acts on the ____ to inhibit Na-Cl reabsorption.', '["Proximal tubule", "Early Distal Tubule", "Loop of Henle", "Glomerulus"]', 1, 'First-line for essential hypertension. (Step-Up)'),
    (v_topic_id, '266: "SGLT2 Inhibitors" (e.g., Empagliflozin) work in the proximal tubule to block reabsorption of:', '["Sodium and Water only", "Sodium and Glucose", "Potassium", "Uric acid"]', 1, 'Provides significant renal and cardio protection. (Pocket Medicine)'),
    (v_topic_id, '267: Which diuretic class is associated with "Hyperuricemia" and can trigger Gout flares?', '["Loops and Thiazides", "Potassium-sparing", "Acetazolamide", "None"]', 0, 'They compete with uric acid for excretion. (Harrison''s Ch. 309)'),
    (v_topic_id, '268: "Metformin" should be held in patients with an eGFR < ____ to avoid lactic acidosis.', '["60", "30", "45", "15"]', 1, 'Renally cleared; toxicity risk increases at low GFR. (Step-Up)'),
    (v_topic_id, '269: "Nitrofurantoin" (Macrobid) is contraindicated in patients with GFR < ____.', '["90", "60 (or 30 in some guidelines)", "15", "None"]', 1, 'It will not reach effective concentrations in the urine. (Pocket Medicine)'),
    (v_topic_id, '270: "Tolvaptan" is a vasopressin (V2) receptor antagonist used to treat:', '["Hypertension", "Euvolemic/Hypervolemic Hyponatremia (SIADH)", "Diabetes", "Stones"]', 1, 'Known as a "vaptan." (Harrison''s Ch. 49)');

    -- SECTION 28: NEPHROLOGY POTPOURRI (1)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '271: "Sterile Pyuria" (WBCs in urine but negative culture) is classic for:', '["E. coli", "Renal Tuberculosis", "Gonorrhea", "Kidney stones"]', 1, 'Also seen in AIN and Kawasaki disease. (Step-Up)'),
    (v_topic_id, '272: What is the most common kidney finding in patients with Sickle Cell Disease?', '["RCC", "Hyposthenuria (inability to concentrate urine)", "Stones", "Lupus"]', 1, 'Vaso-occlusion in the vasa recta damages the medullary gradient. (Harrison''s Ch. 94)'),
    (v_topic_id, '273: "Medullary Sponge Kidney" is a benign condition that increases the risk of:', '["Kidney stones (Nephrolithiasis)", "Cancer", "Diabetes", "Stroke"]', 0, 'Cystic dilatation of collecting ducts. (Pocket Medicine)'),
    (v_topic_id, '274: "Retroperitoneal Fibrosis" (Ormond''s disease) can cause which type of AKI?', '["Prerenal", "Postrenal (obstructing the ureters)", "Intrarenal", "None"]', 1, 'Associated with IgG4-related disease and certain drugs. (Step-Up)'),
    (v_topic_id, '275: "Horseshoe Kidney" is associated with which chromosomal abnormality?', '["Down syndrome", "Turner syndrome (45, X)", "Klinefelter", "Trisomy 18"]', 1, 'Increased risk of stones and infection. (Harrison''s Ch. 316)'),
    (v_topic_id, '276: A horseshoe kidney gets caught under which artery during development?', '["Superior Mesenteric Artery", "Inferior Mesenteric Artery (IMA)", "Celiac artery", "Renal artery"]', 1, 'Prevents it from ascending to its normal position. (Pocket Medicine)'),
    (v_topic_id, '277: "Alport syndrome" is inherited in which pattern most commonly?', '["Autosomal Dominant", "X-linked Dominant", "Autosomal Recessive", "Mitochondrial"]', 1, 'Due to mutations in COL4A5. (Step-Up)'),
    (v_topic_id, '278: "Simple Renal Cysts" found incidentally on CT in an elderly patient:', '["Require biopsy", "Are usually benign and require no follow-up (Bosniak Class I)", "Need surgery", "Suggest cancer"]', 1, 'Very common and usually asymptomatic. (Harrison''s Ch. 316)'),
    (v_topic_id, '279: "Vesicoureteral Reflux" (VUR) in children is a risk factor for recurrent:', '["Stones", "Pyelonephritis and Renal scarring", "Cancer", "Diabetes"]', 1, 'Retrograde flow of urine from bladder to kidneys. (Pocket Medicine)'),
    (v_topic_id, '280: "Emphysematous Pyelonephritis" (gas in the kidney) is a surgical emergency seen in:', '["Healthy athletes", "Diabetics", "Smokers", "Children"]', 1, 'High mortality; often requires nephrectomy. (Step-Up)');

    -- SECTION 29: NEPHROLOGY POTPOURRI (2)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '281: "Athetoid" movements and muscle twitching in a patient with renal failure suggest:', '["Low sodium", "Uremic encephalopathy", "High sugar", "Stroke"]', 1, 'A sign of advanced uremia. (Harrison''s Ch. 313)'),
    (v_topic_id, '282: Which electrolyte abnormality is most likely to cause "Torsades de Pointes"?', '["Hyperkalemia", "Hypomagnesemia", "Hypernatremia", "Low chloride"]', 1, 'Magnesium is the treatment of choice for Torsades. (Step-Up)'),
    (v_topic_id, '283: "Hypercalcemia" causes which change to the EKG?', '["Wide QRS", "Shortened QT interval", "Peaked T-waves", "U-waves"]', 1, 'Low calcium prolongs the QT. (Pocket Medicine)'),
    (v_topic_id, '284: "SGLT2 inhibitors" should be used with caution in patients at risk for:', '["Hypoglycemia", "Euglycemic Diabetic Ketoacidosis (DKA)", "Weight gain", "Hypertension"]', 1, 'A rare but serious side effect. (Harrison''s Ch. 313)'),
    (v_topic_id, '285: "Fenoldopam" is a dopamine-1 agonist used in hypertensive emergency that also:', '["Damages kidneys", "Increases renal blood flow", "Causes cough", "None"]', 1, 'Helpful in patients with renal insufficiency. (Step-Up)'),
    (v_topic_id, '286: "Chloride-depletion" alkalosis is corrected by giving:', '["Water", "Isotonic Saline (0.9% NaCl)", "Glucose", "Bicarbonate"]', 1, 'Restores volume and chloride to stop bicarb retention. (Pocket Medicine)'),
    (v_topic_id, '287: "Renal biopsy" is usually NOT indicated for which condition?', '["Nephrotic syndrome in adults", "Diabetic nephropathy with a classic presentation", "RPGN", "Lupus nephritis"]', 1, 'Clinical diagnosis is often sufficient in standard DM cases. (Harrison''s Ch. 311)'),
    (v_topic_id, '288: What is the most common cause of "False positive" blood on a urine dipstick?', '["Stones", "Myoglobinuria (Rhabdomyolysis)", "Infection", "Exercise"]', 1, 'Dipstick detects the heme group in both hemoglobin and myoglobin. (Step-Up)'),
    (v_topic_id, '289: "Orthostatic proteinuria" is a benign condition seen in:', '["Elderly", "Adolescents (proteinuria only when standing)", "Pregnant women", "Diabetes"]', 1, 'Protein is absent in the first morning void. (Pocket Medicine)'),
    (v_topic_id, '290: "Balkan Endemic Nephropathy" is associated with the ingestion of:', '["Alcohol", "Aristolochic acid (from Aristolochia seeds)", "Lead", "Mercury"]', 1, 'Causes tubulointerstitial disease and urothelial cancer. (Harrison''s Ch. 312)');

    -- FINAL MISC (291-320)
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, '291: Which vitamin should be restricted in patients with a history of Calcium Oxalate stones?', '["Vitamin B12", "Vitamin C (can be metabolized to oxalate)", "Vitamin D", "Vitamin E"]', 1, 'High doses increase urinary oxalate. (Step-Up)'),
    (v_topic_id, '292: "Uremic bleeding" is primarily due to a defect in:', '["Platelet count", "Platelet function (impaired adhesion/aggregation)", "Clotting factors", "Vitamin K"]', 1, 'Treated with Desmopressin (dDAVP). (Harrison''s Ch. 313)'),
    (v_topic_id, '293: "Furosemide" works by inhibiting the Na-K-2Cl channel in the:', '["Proximal tubule", "Thick Ascending Limb of Henle", "Distal tubule", "Glomerulus"]', 1, 'Also called "Loop" diuretics. (Step-Up)'),
    (v_topic_id, '294: "Bartter Syndrome" is a genetic defect that mimics the effect of:', '["Thiazides", "Loop Diuretics", "Acetazolamide", "Spironolactone"]', 1, 'Presents with hypokalemia and metabolic alkalosis. (Pocket Medicine)'),
    (v_topic_id, '295: "Gitelman Syndrome" mimics the effect of:', '["Loop diuretics", "Thiazide diuretics", "ENaC blockers", "None"]', 1, 'Also presents with hypomagnesemia and hypocalciuria. (Harrison''s Ch. 50)'),
    (v_topic_id, '296: "Normal Urine pH" is typically around:', '["4.0", "5.0 - 6.5", "8.0", "10.0"]', 1, 'Can vary widely depending on diet and acid-base state. (Step-Up)'),
    (v_topic_id, '297: Which diuretic is contraindicated in patients with a "Sulfa" allergy?', '["Amiloride", "Loops and Thiazides (most have a sulfa group)", "Spironolactone", "Triamterene"]', 1, 'Ethacrynic acid is the only non-sulfa loop diuretic. (Pocket Medicine)'),
    (v_topic_id, '298: "High Altitude Cerebral Edema" is treated with:', '["Lisinopril", "Acetazolamide", "Furosemide", "Metformin"]', 1, 'Reduces CSF production and metabolic alkalosis. (Harrison''s Ch. 309)'),
    (v_topic_id, '299: "RTA Type 2" is associated with which systemic syndrome?', '["Lupus", "Fanconi Syndrome", "Diabetes", "Heart failure"]', 1, 'Proximal tubule dysfunction. (Step-Up)'),
    (v_topic_id, '300: "Acute Phosphate Nephropathy" can occur after using:', '["Aspirin", "Phosphate-containing bowel preps for colonoscopy", "Steroids", "Diuretics"]', 1, 'Causes irreversible kidney damage. (Pocket Medicine)'),
    (v_topic_id, '301: eGFR is most accurate when the patient is in a:', '["Steady state", "Critical AKI", "Shock", "Fasting state"]', 0, 'Creatinine-based eGFR is misleading in acute changes. (Harrison''s Ch. 310)'),
    (v_topic_id, '302: "Renal Tubular Acidosis" (RTA) always causes which acid-base state?', '["High anion-gap metabolic acidosis", "Normal anion-gap metabolic acidosis", "Metabolic alkalosis", "Respiratory acidosis"]', 1, 'Due to failure to excrete H+ or reabsorb bicarb. (Step-Up)'),
    (v_topic_id, '303: "Minimal Change Disease" responds dramatically to:', '["Antibiotics", "Steroids (Prednisone)", "Dialysis", "ACE inhibitors alone"]', 1, 'First-line therapy. (Pocket Medicine)'),
    (v_topic_id, '304: "Post-renal" AKI is best diagnosed with:', '["Blood tests", "Renal Ultrasound (checking for hydronephrosis)", "Biopsy", "MRI"]', 1, 'Quickly identifies obstruction. (Step-Up)'),
    (v_topic_id, '305: "Acute Prostatitis" presents with fever, chills, and ____ on digital rectal exam.', '["Small, soft prostate", "Tender, boggy prostate", "Hard, nodular prostate", "Nothing"]', 1, 'Avoid vigorous massage to prevent sepsis. (Pocket Medicine)'),
    (v_topic_id, '306: What is the most common stone seen in chronic alkaline urine?', '["Uric acid", "Struvite (Infection stones)", "Calcium oxalate", "Cystine"]', 1, 'Proteus makes the urine alkaline. (Harrison''s Ch. 318)'),
    (v_topic_id, '307: "Hampton''s hump" is to Lung as "Waxy cast" is to:', '["Acute UTI", "Chronic Kidney Failure", "Nephrotic syndrome", "Normal urine"]', 1, 'Board favorite associations. (Step-Up)'),
    (v_topic_id, '308: "Hemoglobinuria" without RBCs on microscopy suggests:', '["UTI", "Intravascular Hemolysis", "Bladder cancer", "Stones"]', 1, 'Free hemoglobin filters into urine. (Pocket Medicine)'),
    (v_topic_id, '309: "Specific Gravity" of 1.001 suggests:', '["Dehydration", "Diabetes Insipidus or overhydration", "SIADH", "Normal"]', 1, 'Very dilute urine. (Harrison''s Ch. 310)'),
    (v_topic_id, '310: "Anion Gap" of 25 suggests:', '["Normal state", "High Anion-Gap Metabolic Acidosis", "Metabolic Alkalosis", "Respiratory Acidosis"]', 1, 'Addition of new organic acids. (Step-Up)'),
    (v_topic_id, '311: "Fractional Excretion of Sodium" (FENa) < 1% = ?', '["ATN", "Prerenal AKI", "Obstruction", "Diuretic use"]', 1, 'Kidneys are holding onto salt. (Pocket Medicine)'),
    (v_topic_id, '312: "FENa > 2%" = ?', '["Prerenal", "Intrarenal AKI (e.g., ATN)", "Sepsis only", "Normal"]', 1, 'Kidneys are losing salt due to damage. (Harrison''s Ch. 312)'),
    (v_topic_id, '313: "Hyperkalemia" + "Wide QRS" = ?', '["Wait for labs", "Immediate IV Calcium", "Give water", "Give bicarb"]', 1, 'Emergency stabilization. (Step-Up)'),
    (v_topic_id, '314: "Hypokalemia" + "Muscle weakness" = ?', '["K+ replacement", "Sodium", "Magnesium", "Calcium"]', 0, 'Initial therapy. (Pocket Medicine)'),
    (v_topic_id, '315: "Metabolic Acidosis" + "Low PaCO2" = ?', '["Respiratory Acidosis", "Respiratory Compensation", "Metabolic Alkalosis", "None"]', 1, 'Respiratory system trying to fix the pH. (Harrison''s Ch. 51)'),
    (v_topic_id, '316: "Hypovolemia" + "Hyponatremia" + "Urine Na > 40" = ?', '["Diarrhea", "Renal salt wasting (Diuretics, Addison''s)", "SIADH", "Heart failure"]', 1, 'The kidneys are the source of salt loss. (Step-Up)'),
    (v_topic_id, '317: "Hypertension" + "Hypokalemia" + "Low Renin" = ?', '["Conn Syndrome", "Renal Artery Stenosis", "Addison''s", "Pheochromocytoma"]', 0, 'Primary hyperaldosteronism. (Pocket Medicine)'),
    (v_topic_id, '318: "Hypertension" + "Hypokalemia" + "High Renin" = ?', '["Conn Syndrome", "Renovascular Hypertension (Renal Artery Stenosis)", "Liddle syndrome", "None"]', 1, 'The kidney thinks BP is low and pumps out renin. (Harrison''s Ch. 280)'),
    (v_topic_id, '319: "Diabetes" + "Edema" + "Proteinuria" = ?', '["MCD", "Diabetic Nephropathy (Kimmelstiel-Wilson)", "Stones", "Infection"]', 1, 'Glomerular damage from chronic hyperglycemia. (Step-Up)'),
    (v_topic_id, '320: "Gross hematuria" + "Older smoker" = ?', '["UTI", "Bladder Cancer or RCC until proven otherwise", "Prostatitis", "Normal aging"]', 1, 'Requires urgent workup (Cystoscopy/CT). (Pocket Medicine)');

    RAISE NOTICE 'SUCCESS: Nephrology MCQ Part 4 (241-320) registered.';
END $$;

COMMIT;
