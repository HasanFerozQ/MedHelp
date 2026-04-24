-- Migration: Year 2 - Renal/Urinary Pathology Cases (PART 2: 16-30)
-- Date: 2026-04-23

BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'renal-urinary-pathology' LIMIT 1;

    -- CASE 16: Hyaline Nephrosclerosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pink Arteriolar Thickening', 'A 45-year-old male with a history of long-standing hypertension presents for a routine check-up. Fundoscopy shows arteriolar narrowing. Renal biopsy shows "hyaline arteriolosclerosis" (homogeneous pink thickening of arteriolar walls).', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely underlying condition?', '["Malignant Hypertension", "Benign Nephrosclerosis", "Fibromuscular Dysplasia", "Polyarteritis Nodosa"]', 1, 'Benign nephrosclerosis is the renal consequence of chronic, mild-to-moderate hypertension.'),
    (v_case_id, 'If the patient’s BP suddenly spiked to 220/120 mmHg, what histologic change would be seen?', '["Hyaline thickening", "Hyperplastic arteriolosclerosis (onion-skinning)", "Granulomatous inflammation", "Cystic medial necrosis"]', 1, 'Malignant hypertension causes hyperplastic arteriolosclerosis with fibrinoid necrosis.'),
    (v_case_id, 'What is the classic gross appearance of the kidney in chronic benign hypertension?', '["Large, pale kidneys", "Symmetrically shrunken with fine leathery grain surface", "Multiple large cysts", "Wedge-shaped pale infarcts"]', 1, 'Chronic ischemia leads to cortical scarring, giving the surface a leathery, granular look.');

    -- CASE 17: Wilms Tumor
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Smooth Pediatric Abdominal Mass', 'A 2-year-old child is brought in for an enlarging abdominal mass. On exam, the mass is smooth and does not cross the midline. The child has no other physical abnormalities.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Neuroblastoma", "Wilms Tumor (Nephroblastoma)", "Renal Cell Carcinoma", "Multicystic Dysplastic Kidney"]', 1, 'Wilms tumor is the most common renal malignancy in children; it typically does not cross the midline (unlike neuroblastoma).'),
    (v_case_id, 'Wilms tumor is characterized by a "triphasic" microscopic pattern. Which of the following is NOT part of that triad?', '["Blastema", "Stroma", "Epithelium (tubules/glomeruli)", "Clear cell nests"]', 3, 'The classic triad is Blastema (small blue cells), Stroma (fibroblastic), and Epithelium.'),
    (v_case_id, 'If this child also had aniridia, genital abnormalities, and mental retardation, what syndrome would you suspect?', '["Beckwith-Wiedemann Syndrome", "WAGR Syndrome", "Denys-Drash Syndrome", "Alport Syndrome"]', 1, 'WAGR: Wilms tumor, Aniridia, Genitourinary anomalies, and Range of developmental delay.');

    -- CASE 18: Amyloidosis (AA)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Apple-Green Birefringence in RA', 'A 65-year-old female with Rheumatoid Arthritis and chronic bronchiectasis presents with nephrotic syndrome. A Congo Red stain of the renal biopsy shows apple-green birefringence under polarized light.', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Diabetic Nephropathy", "AA Amyloidosis", "AL Amyloidosis", "Light Chain Deposition Disease"]', 1, 'AA Amyloidosis is secondary to chronic inflammatory states (RA, Bronchiectasis).'),
    (v_case_id, 'Where are the deposits primarily located in the kidney?', '["Proximal tubules", "Mesangium and capillary loops", "Distal convoluted tubule", "Only in the renal pelvis"]', 1, 'Amyloid deposits in the mesangium, causing expansion and nephrotic-range proteinuria.'),
    (v_case_id, 'What is the precursor protein for AA Amyloidosis?', '["Immunoglobulin light chains", "Serum Amyloid Associated (SAA) protein", "Transthyretin", "Beta-2 microglobulin"]', 1, 'SAA is an acute-phase reactant produced during chronic inflammation.');

    -- CASE 19: Struvite (Staghorn) Calculi
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Recurrent UTIs and Alkaline Urine', 'A 38-year-old female presents with recurrent UTIs and flank pain. An X-ray shows a large, "staghorn" calculus filling the renal pelvis. The urine pH is 8.0.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely composition of the stone?', '["Calcium oxalate", "Uric acid", "Ammonium magnesium phosphate (Struvite)", "Cystine"]', 2, 'Struvite stones form in alkaline urine and often take the shape of the renal pelvis (staghorn).'),
    (v_case_id, 'Which organism is most likely responsible for this stone formation?', '["E. coli", "Proteus mirabilis", "Staphylococcus saprophyticus", "Enterococcus"]', 1, 'Proteus produces urease, which splits urea into ammonia, raising the pH.'),
    (v_case_id, 'What is the mechanism by which these bacteria promote stone formation?', '["Lowering urine pH", "Production of urease to split urea into ammonia", "Increasing calcium excretion", "Inhibiting citrate production"]', 1, 'Ammonia production creates an alkaline environment favorable for MAP precipitation.');

    -- CASE 20: Renal Osteodystrophy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bone Pain in Chronic Kidney Disease', 'A 50-year-old male with chronic kidney disease presents with profound bone pain. Labs show high PTH, low Calcium, and high Phosphate.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis for the bone condition?', '["Osteosarcoma", "Renal Osteodystrophy", "Paget Disease", "Osteogenesis Imperfecta"]', 1, 'Renal osteodystrophy is a complex of bone changes (osteitis fibrosa, osteomalacia) due to secondary hyperparathyroidism.'),
    (v_case_id, 'What is the primary reason for the low calcium in this patient?', '["Excess urinary loss of calcium", "Failure of the kidney to hydroxylate 25-OH Vit D to 1,25-(OH)2 Vit D", "Malabsorption in the gut", "High calcitonin levels"]', 1, 'The damaged kidney cannot activate Vitamin D (1-alpha-hydroxylase failure).'),
    (v_case_id, 'How does the body compensate for the high phosphate levels in CKD?', '["Decreasing PTH", "Increasing FGF-23", "Increasing Vitamin D production", "Decreasing bone resorption"]', 1, 'FGF-23 is produced by osteocytes to promote phosphate excretion.');

    -- CASE 21: Acute Interstitial Nephritis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever, Rash, and Eosinophiluria', 'A 22-year-old female starts a course of Methicillin for a skin infection. Five days later, she develops a fever, a maculopapular rash, and oliguria. Labs show eosinophilia and eosinophiluria.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Acute Tubular Necrosis", "Acute Interstitial Nephritis (AIN)", "Acute Glomerulonephritis", "Minimal Change Disease"]', 1, 'AIN is a drug-induced hypersensitivity reaction (The 5 P''s: Pee (diuretics), Pain (NSAIDs), Penicillins, PPIs, RifamPin).'),
    (v_case_id, 'This condition is best described as which type of hypersensitivity reaction?', '["Type I", "Type II", "Type IV (Delayed-type)", "Type III"]', 2, 'AIN is primarily a Type IV T-cell mediated response (though IgE can be involved).'),
    (v_case_id, 'Which of the following is a common non-antibiotic cause of this condition?', '["ACE inhibitors", "NSAIDs", "Statins", "Metformin"]', 1, 'NSAIDs are a major cause of both AIN and chronic interstitial nephritis.');

    -- CASE 22: BPH and Hydronephrosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Urinary Hesitancy and Smooth Prostate', 'A 70-year-old man presents with a 6-month history of a slow urinary stream, hesitancy, and feeling like his bladder isn''t empty. Digital rectal exam reveals a smooth, enlarged prostate.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Prostate Cancer", "Benign Prostatic Hyperplasia (BPH)", "Prostatitis", "Bladder Cancer"]', 1, 'BPH is common in aging men and affects the central/transition zones.'),
    (v_case_id, 'Long-standing BPH can lead to which of the following kidney pathologies?', '["Hydronephrosis", "Nephritic Syndrome", "Renal Cell Carcinoma", "Polycystic Kidney Disease"]', 0, 'Back-pressure from bladder outlet obstruction causes ureteral and pelvic dilation (Hydronephrosis).'),
    (v_case_id, 'Which zone of the prostate is most commonly involved in this condition?', '["Peripheral zone", "Transitional zone", "Central zone", "Anterior fibromuscular stroma"]', 1, 'BPH occurs in the transition zone (surrounding the urethra), while cancer usually occurs in the peripheral zone.');

    -- CASE 23: ARPKD
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bilateral Flank Masses in a Newborn', 'A newborn infant is noted to have a large flank mass on both sides. An ultrasound reveals "innumerable small cysts" throughout the renal cortex and medulla. The infant dies shortly after birth due to pulmonary hypoplasia.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Autosomal Dominant Polycystic Kidney Disease (ADPKD)", "Autosomal Recessive Polycystic Kidney Disease (ARPKD)", "Multicystic Dysplastic Kidney", "Medullary Sponge Kidney"]', 1, 'ARPKD presents in infancy with bilateral enlargement and microscopic cysts.'),
    (v_case_id, 'What is the classic hepatic finding associated with this condition?', '["Hepatocellular Carcinoma", "Congenital Hepatic Fibrosis", "Hemangioma", "Liver Cysts (only)"]', 1, 'ARPKD is associated with congenital hepatic fibrosis and bile duct proliferation.'),
    (v_case_id, 'The pulmonary hypoplasia is a result of which sequence?', '["Down Sequence", "Potter Sequence", "Pierre Robin Sequence", "DiGeorge Sequence"]', 1, 'Lack of fetal urine leads to oligohydramnios, causing lung compression and hypoplasia (Potter Sequence).');

    -- CASE 24: ADPKD
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Berry Aneurysms and Large Cystic Kidneys', 'A 40-year-old male with a history of berry aneurysms and hypertension presents with flank pain. Ultrasound shows large kidneys with multiple large, fluid-filled cysts.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["ARPKD", "ADPKD", "Simple Renal Cysts", "Medullary Cystic Disease"]', 1, 'ADPKD presents in adulthood (unlike ARPKD) and is systemic.'),
    (v_case_id, 'Mutations in which genes are typically responsible for this?', '["PKD1 or PKD2", "PKHD1", "WT1", "VHL"]', 0, 'PKD1 (Chr 16) or PKD2 (Chr 4) code for polycystin proteins.'),
    (v_case_id, 'Which of the following is a common extra-renal manifestation?', '["Splenic Cysts", "Pancreatic Cysts", "Mitral Valve Prolapse", "All of the above"]', 2, 'Systemic features include Berry aneurysms, Hepatic/Pancreatic cysts, and Mitral Valve Prolapse.');

    -- CASE 25: Bladder Squamous Cell Carcinoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Schistosomiasis and Bladder Mass', 'A patient with a history of heavy smoking and occupational exposure to dyes presents with hematuria. A biopsy of a bladder lesion shows "Schistosomiasis" eggs and malignant cells with "keratin pearls."', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Urothelial Carcinoma", "Squamous Cell Carcinoma", "Adenocarcinoma", "Small Cell Carcinoma"]', 1, 'Schistosomiasis is the major global risk factor for bladder squamous cell carcinoma.'),
    (v_case_id, 'Squamous metaplasia in the bladder is usually a response to what?', '["Vitamin A deficiency", "Chronic irritation/inflammation", "High protein diet", "Tobacco smoke"]', 1, 'Chronic irritation (stones, infection) induces squamous metaplasia, which can progress to cancer.'),
    (v_case_id, 'What is the classic location for an Adenocarcinoma of the bladder?', '["Trigone", "Dome (Urachus remnant)", "Lateral walls", "Urethral orifice"]', 1, 'Urachal remnants at the dome of the bladder are the site for rare primary adenocarcinomas.');

    -- CASE 26: Renal Infarction
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Wedge-Shaped Pale Area in Kidney', 'A 58-year-old male presents with sudden onset left-sided flank pain and gross hematuria. He has a history of atrial fibrillation. An MRI shows a wedge-shaped area of pale tissue in the renal cortex.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Acute Pyelonephritis", "Renal Infarction", "Renal Cell Carcinoma", "Nephrolithiasis"]', 1, 'Atrial fibrillation is a common source of emboli that cause renal infarction.'),
    (v_case_id, 'Renal infarcts are typically "pale" because the kidney has:', '["Dual blood supply", "End-artery blood supply", "High venous pressure", "Large collateral circulation"]', 1, 'The kidney has end-arterial circulation; blockage leads to complete ischemia/pale infarct.'),
    (v_case_id, 'What type of necrosis is expected in this lesion?', '["Liquefactive", "Coagulative", "Caseous", "Fat necrosis"]', 1, 'Most solid organ infarcts (except the brain) undergo coagulative necrosis.');

    -- CASE 27: Henoch-Schonlein Purpura (HSP)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Palpable Purpura and Abdominal Pain', 'A 6-year-old boy presents with hematuria, colicky abdominal pain, and a palpable purpuric rash on his buttocks and lower legs. He recently had a sore throat.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Post-streptococcal Glomerulonephritis", "Henoch-Schonlein Purpura (IgA Vasculitis)", "Hemolytic Uremic Syndrome", "Alport Syndrome"]', 1, 'HSP is a small-vessel vasculitis characterized by the IgA triad: Rash, Arthralgia, GI pain.'),
    (v_case_id, 'The renal findings in this disease are identical to which other condition?', '["Berger Disease (IgA Nephropathy)", "Goodpasture Syndrome", "Minimal Change Disease", "FSGS"]', 0, 'HSP is essentially the systemic form of IgA nephropathy.'),
    (v_case_id, 'What is a common gastrointestinal complication of this syndrome?', '["Peptic ulcer disease", "Intussusception", "Diverticulitis", "Celiac disease"]', 1, 'GI wall edema in HSP can act as a lead point for intussusception.');

    -- CASE 28: HUS
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bloody Diarrhea and Oliguria', 'A 3-year-old girl is brought to the ER with bloody diarrhea, oliguria, and easy bruising. She recently ate a hamburger at a local fair. Labs show microangiopathic hemolytic anemia (MAHA) and thrombocytopenia.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Henoch-Schonlein Purpura", "Hemolytic Uremic Syndrome (HUS)", "Thrombotic Thrombocytopenic Purpura (TTP)", "Acute Tubular Necrosis"]', 1, 'The triad of MAHA, Thrombocytopenia, and AKI following bloody diarrhea = HUS.'),
    (v_case_id, 'What is the most common causative agent in "typical" HUS?', '["Streptococcus pneumoniae", "E. coli O157:H7 (Shiga-like toxin)", "Staphylococcus aureus", "HIV"]', 1, 'EHEC Shiga-like toxin damages endothelial cells in the glomerulus.'),
    (v_case_id, 'What would you see on a peripheral blood smear?', '["Target cells", "Schistocytes", "Heinz bodies", "Howell-Jolly bodies"]', 1, 'Schistocytes (helmet cells) are proof of microangiopathic hemolysis.');

    -- CASE 29: Microscopic Polyangiitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hemoptysis with p-ANCA Positivity', 'A 55-year-old female presents with fever, malaise, and hemoptysis. Labs show a positive p-ANCA (anti-MPO). Renal biopsy shows crescentic glomerulonephritis with no deposits on IF.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Granulomatosis with Polyangiitis (Wegener)", "Microscopic Polyangiitis", "Goodpasture Syndrome", "Lupus Nephritis"]', 1, 'p-ANCA (MPO) and RPGN without granulomas = Microscopic Polyangiitis.'),
    (v_case_id, 'How is this condition distinguished from Granulomatosis with Polyangiitis (Wegener)?', '["Wegener has c-ANCA and granulomas; Microscopic Polyangiitis lacks granulomas.", "Wegener is p-ANCA positive; Microscopic Polyangiitis is c-ANCA positive.", "Wegener involves the kidney; Microscopic Polyangiitis does not.", "Wegener shows linear IF; Microscopic Polyangiitis shows granular IF."]', 0, 'Wegener classically involves the upper respiratory tract (sinusitis) and features granulomatous inflammation.'),
    (v_case_id, 'What is the term for a crescentic glomerulonephritis with negative IF?', '["Immune-complex mediated", "Anti-GBM mediated", "Pauci-immune", "Membranous"]', 2, 'Pauci-immune indicates the lack of immunoglobulin/complement deposits on IF.');

    -- CASE 30: Renal Papillary Necrosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Analgesic Abuse and Sloughed Tissue', 'A patient with long-term analgesic use (Aspirin and Phenacetin) presents with flank pain and hematuria. Sloughed tissue is found in the urine.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Most likely diagnosis?', '["Acute Tubular Necrosis", "Renal Papillary Necrosis", "Acute Interstitial Nephritis", "Renal Cell Carcinoma"]', 1, 'Papillary necrosis involves the sloughing of the renal papillae into the urine.'),
    (v_case_id, 'Which of the following is NOT a classic cause of this condition? (Mnemonic: POSTCARDS)', '["Sickle Cell Disease", "Diabetes Mellitus", "Minimal Change Disease", "Obstruction"]', 2, 'Mnemonic: Pyelonephritis, Obstruction, Sickle Cell, Tuberculosis, Cirrhosis, Analgesics, Renal vein thrombosis, Diabetes, Systemic vasculitis.'),
    (v_case_id, 'What is the pathophysiological mechanism of analgesic-induced necrosis?', '["Direct toxicity to the podocytes", "Inhibition of vasodilatory prostaglandins leading to ischemia of the vasa recta", "Autoimmune destruction of the basement membrane", "Type III hypersensitivity"]', 1, 'Inhibiting prostaglandins causes constriction of the vasa recta, starving the papilla of blood.');

    RAISE NOTICE 'SUCCESS: Renal/Urinary Pathology Part 2 (16-30) registered.';
END $$;

COMMIT;
