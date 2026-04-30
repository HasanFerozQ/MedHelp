BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- Fetch the topic ID for Common Lab Interpretation
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'common-lab-interpretation' LIMIT 1;

    -- CASE 01: CBC - Microcytic Anemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fatigue and Low Hemoglobin', 'A 35-year-old female presents with fatigue. Labs: Hb 9.0 g/dL, Hct 28%, MCV 72 fL (Normal 80-100), MCHC 30 g/dL. Peripheral smear shows small, pale red blood cells.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'How would you classify this anemia based on the MCV?', '["Microcytic", "Normocytic", "Macrocytic", "Hyperchromic"]', 0, 'An MCV < 80 fL is microcytic.'),
    (v_case_id, 'What is the most common cause of microcytic anemia worldwide?', '["B12 deficiency", "Iron deficiency", "Thalassemia", "Chronic disease"]', 1, 'Iron deficiency is the #1 cause.'),
    (v_case_id, 'Which of the following lab profiles is classic for Iron Deficiency Anemia?', '["Low Ferritin, High TIBC, Low Iron", "High Ferritin, Low TIBC, Low Iron", "Low Ferritin, Low TIBC, High Iron", "Normal Ferritin, Normal TIBC"]', 0, 'Low iron stores lead to low Ferritin and a compensatory rise in Total Iron Binding Capacity (TIBC).');

    -- CASE 02: CBC - Macrocytic Anemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Vegan with Tingling Feet', 'A 28-year-old strict vegan presents with numbness in her feet. Labs: Hb 10.0, MCV 115 fL. Peripheral smear shows hypersegmented neutrophils.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Iron deficiency", "Folate deficiency", "Vitamin B12 deficiency", "Aplastic anemia"]', 2, 'Macrocytic anemia with neurological symptoms is characteristic of Vitamin B12 deficiency.'),
    (v_case_id, 'Hypersegmented neutrophils are a classic finding in:', '["Microcytic anemia", "Megaloblastic anemia", "Hemolytic anemia", "Acute leukemia"]', 1, 'Megaloblastic anemias (B12 and Folate) impair DNA synthesis, affecting all cell lines.'),
    (v_case_id, 'Which lab test can help distinguish B12 from Folate deficiency?', '["Homocysteine", "Methylmalonic Acid (MMA)", "Ferritin", "Reticulocyte count"]', 1, 'MMA is elevated in B12 deficiency but NORMAL in folate deficiency.');

    -- CASE 03: CBC - Hemolytic Anemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Jaundice and Dark Urine', 'A 20-year-old male with a history of heart valve replacement presents with jaundice. Labs: Hb 8.5, Reticulocyte count 8% (High), indirect bilirubin 3.5 mg/dL, LDH 800 (High), Haptoglobin < 10 (Low).', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'These lab findings are characteristic of:', '["Anemia of chronic disease", "Hemolytic anemia", "Aplastic anemia", "Sideroblastic anemia"]', 1, 'High retics, high LDH, high indirect bilirubin, and low haptoglobin are the classic markers of hemolysis.'),
    (v_case_id, 'Why is the Haptoglobin level low?', '["The liver is not making it", "It is bound to free hemoglobin released from RBCs", "It is lost in the urine", "It is destroyed by the spleen"]', 1, 'Haptoglobin binds free hemoglobin; when hemolysis is intravascular, the complex is cleared, lowering the serum level.'),
    (v_case_id, 'What finding on the peripheral smear would suggest mechanical hemolysis (e.g., from the heart valve)?', '["Target cells", "Schistocytes (helmet cells)", "Spherocytes", "Heinz bodies"]', 1, 'Schistocytes are fragmented red blood cells seen in microangiopathic hemolytic anemia or mechanical trauma.');

    -- CASE 04: CBC - Leukocytosis with Left Shift
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Fever and High White Cell Count', 'A 40-year-old with abdominal pain. Labs: WBC 18,000/mm³ (Normal 4-11), 85% Neutrophils, 10% Band forms.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the term for the presence of increased band forms (immature neutrophils)?', '["Leukopenia", "Pancytopenia", "Left shift", "Leukemoid reaction"]', 2, 'A "left shift" indicates the bone marrow is releasing immature cells in response to an acute stimulus, usually infection.'),
    (v_case_id, 'Which type of infection is most associated with a significant neutrophilic leukocytosis?', '["Viral", "Bacterial", "Fungal", "Parasitic"]', 1, 'Bacterial infections typically cause a neutrophil-predominant response.'),
    (v_case_id, 'A patient with an extremely high WBC (e.g., 50,000) that is NOT leukemia is said to have a:', '["Myelodysplastic syndrome", "Leukemoid reaction", "Pancytopenia", "Lymphoma"]', 1, 'A leukemoid reaction is an exuberant but benign white cell response to severe infection or stress.');

    -- CASE 05: CMP - Hyponatremia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Low Sodium Level', 'A 75-year-old male smoker with a lung mass is found to have a Sodium of 122 mEq/L. He is asymptomatic. Serum Osmolality is low (250), and Urine Osmolality is high (500).', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Dehydration", "SIADH", "Diabetes Insipidus", "Heart failure"]', 1, 'SIADH (Syndrome of Inappropriate ADH) causes euvolemic hyponatremia with inappropriately concentrated urine.'),
    (v_case_id, 'What is the most dangerous complication of CORRECTING hyponatremia too rapidly?', '["Cerebral edema", "Osmotic Demyelination Syndrome (Central Pontine Myelinolysis)", "Seizures", "Kidney failure"]', 1, 'Correcting too fast (> 8-12 mEq/L per 24 hours) can cause permanent brain damage.'),
    (v_case_id, 'What is the first-line treatment for asymptomatic SIADH?', '["Normal Saline", "Fluid restriction", "D5W", "Loop diuretics"]', 1, 'Restrict water intake to prevent further dilution.');

    -- CASE 06: CMP - Hyperkalemia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The High Potassium Warning', 'A patient with chronic kidney disease (CKD) has a routine lab showing a Potassium of 6.8 mEq/L.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which of the following is an ECG finding of hyperkalemia?', '["U waves", "Peaked T waves", "Short QT", "ST depression"]', 1, 'Tall, symmetric, peaked T waves are the earliest sign.'),
    (v_case_id, 'Which drug can quickly SHIFT potassium into the cells to acutely lower the serum level?', '["Calcium gluconate", "Insulin + Dextrose", "Furosemide", "Kayexalate"]', 1, 'Insulin stimulates the Na/K ATPase; dextrose prevents hypoglycemia.'),
    (v_case_id, 'What is "Pseudohyperkalemia"?', '["A fake lab result", "Release of potassium from cells during or after the blood draw (e.g., due to hemolysis in the tube)", "Hyperkalemia due to diet", "Hyperkalemia due to low insulin"]', 1, 'Clenching a fist during the draw or leaving the sample too long can cause cells to leak K+, giving a falsely high reading.');

    -- CASE 07: CMP - Calcium Abnormalities
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The High Calcium Level', 'A 65-year-old female presents with constipation and bone pain. Labs: Calcium 12.5 mg/dL (High), Albumin 4.0 (Normal), PTH 150 pg/mL (High).', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Malignancy", "Primary Hyperparathyroidism", "Vitamin D toxicity", "Hypothyroidism"]', 1, 'A high Calcium with a high (or inappropriately normal) PTH points to primary hyperparathyroidism.'),
    (v_case_id, 'If the PTH were suppressed (Low), what would be the most likely cause?', '["Parathyroid adenoma", "Malignancy-associated hypercalcemia", "Chronic kidney disease", "Osteoporosis"]', 1, 'Malignancy causes hypercalcemia via PTHrP or bone destruction, which suppresses the normal PTH.'),
    (v_case_id, 'How do you calculate the "Corrected Calcium" in a patient with low Albumin?', '["Corrected Ca = Ca + 0.8 * (4.0 - Albumin)", "Corrected Ca = Ca - Albumin", "Corrected Ca = Ca / Albumin", "No correction is needed"]', 0, 'Because much of calcium is bound to albumin, low albumin levels give a falsely low total calcium reading.');

    -- CASE 08: LFTs - Hepatocellular pattern
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Acute Yellowing', 'A 25-year-old male presents with jaundice and right upper quadrant pain. Labs: AST 2500, ALT 2800, Alkaline Phosphatase 150 (Near normal), Total Bilirubin 5.0.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This lab pattern is described as:', '["Cholestatic", "Hepatocellular", "Infiltrative", "Isolated hyperbilirubinemia"]', 1, 'Massive elevations in AST/ALT with relatively normal Alk Phos indicate direct damage to liver cells (hepatocytes).'),
    (v_case_id, 'What are the most common causes of AST/ALT > 1000?', '["Gallstones and Alcohol", "Viral hepatitis, Ischemia (Shock liver), and Toxin/Drug (Tylenol)", "Cirrhosis and Fatty liver", "Autoimmune hepatitis and Wilson''s"]', 1, 'Very high enzymes are typical for acute, severe insults like viral infection or acute toxicity.'),
    (v_case_id, 'Which lab test is the most sensitive marker of the liver''s SYNTHETIC function?', '["AST", "ALT", "Prothrombin Time (PT) / INR", "Alkaline Phosphatase"]', 2, 'The liver makes clotting factors; a rise in PT/INR indicates impaired synthetic function and a worse prognosis.');

    -- CASE 09: LFTs - Cholestatic pattern
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Itching and Dark Urine', 'A 60-year-old female presents with severe itching and jaundice. Labs: AST 80, ALT 90, Alkaline Phosphatase 600 (High), Total Bilirubin 8.0.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This lab pattern is described as:', '["Hepatocellular", "Cholestatic", "Hemolytic", "Normal"]', 1, 'High Alk Phos and Bilirubin with mildly elevated AST/ALT indicate a problem with bile flow (cholestasis).'),
    (v_case_id, 'What is the most common EXTRA-hepatic cause of this pattern?', '["Primary Biliary Cholangitis", "Biliary obstruction (Gallstones or Pancreatic cancer)", "Drug-induced liver injury", "Hepatitis A"]', 1, 'Obstruction of the common bile duct prevents bile excretion.'),
    (v_case_id, 'Which additional enzyme can be measured to confirm that the elevated Alkaline Phosphatase is of LIVER origin rather than bone origin?', '["Amylase", "Lipase", "Gamma-Glutamyl Transferase (GGT)", "LDH"]', 2, 'GGT is specific to the biliary tract; if both Alk Phos and GGT are high, the source is almost certainly the liver.');

    -- CASE 10: LFTs - Alcoholic Hepatitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Chronic Drinker', 'A 50-year-old male with a history of heavy alcohol use presents with abdominal swelling. Labs: AST 220, ALT 90, GGT 400.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the characteristic AST:ALT ratio in alcoholic liver disease?', '["1:1", "1:2", "> 2:1", "1:10"]', 2, 'Alcoholic hepatitis classically has an AST that is at least twice the ALT.'),
    (v_case_id, 'Why is the AST typically higher than the ALT in alcoholic hepatitis?', '["ALT is destroyed by alcohol", "Alcohol causes a deficiency in pyridoxal-5''-phosphate (Vitamin B6), which is a cofactor for ALT", "AST is made in the stomach", "It is a lab artifact"]', 1, 'Vitamin B6 deficiency limits the synthesis of ALT more than AST.'),
    (v_case_id, 'Elevated GGT is a sensitive (though not specific) marker for:', '["Viral hepatitis", "Alcohol use", "Acetaminophen toxicity", "Wilson disease"]', 1, 'GGT is often induced by chronic alcohol consumption.');

    -- CASE 11: Renal Labs - BUN and Creatinine
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dehydration and Renal Function', 'A 70-year-old male with vomiting has the following labs: BUN 60 mg/dL, Creatinine 1.5 mg/dL. Baseline Creatinine was 1.0.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the BUN:Creatinine ratio?', '["10:1", "20:1", "40:1", "60:1"]', 2, '60 / 1.5 = 40.'),
    (v_case_id, 'A BUN:Cr ratio > 20:1 is most characteristic of which type of Acute Kidney Injury (AKI)?', '["Prerenal Azotemia", "Intrinsic Renal Disease", "Postrenal Obstruction", "Chronic Kidney Disease"]', 0, 'In prerenal states (dehydration/low flow), the kidney reabsorbs urea to maintain volume, while creatinine continues to be excreted.'),
    (v_case_id, 'What is the Fractional Excretion of Sodium (FeNa) likely to be in this patient?', '["< 1%", "> 2%", "> 5%", "Normal"]', 0, 'In prerenal AKI, the healthy kidney holds onto sodium to conserve volume (FeNa < 1%). In intrinsic damage (ATN), the kidney loses its ability to concentrate sodium (FeNa > 2%).');

    -- CASE 12: Coagulation Studies - Warfarin
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Monitoring Anticoagulation', 'A patient with Atrial Fibrillation is on Warfarin. His labs today show a Prothrombin Time (PT) of 30 seconds and an INR of 2.5.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the INR (International Normalized Ratio) used for?', '["To measure platelet function", "To standardize PT results across different laboratories", "To measure the intrinsic pathway", "To check for heparin levels"]', 1, 'The INR accounts for different reagent sensitivities used in PT tests.'),
    (v_case_id, 'Which pathway does the PT/INR primarily measure?', '["Intrinsic pathway", "Extrinsic pathway", "Common pathway only", "Platelet plug formation"]', 1, 'PT measures the extrinsic and common pathways (Factor VII is key).'),
    (v_case_id, 'Warfarin inhibits the synthesis of which clotting factors?', '["II, VII, IX, X", "I, II, V, VIII", "VIII, IX, XI, XII", "V, VII, IX, XII"]', 0, 'Warfarin inhibits Vitamin K epoxide reductase, affecting the Vitamin K-dependent factors 2, 7, 9, 10, and proteins C and S.');

    -- CASE 13: Coagulation Studies - Heparin
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Unfractionated Heparin Monitoring', 'A patient with a PE is started on an Unfractionated Heparin (UFH) drip. You need to monitor the effect to adjust the dose.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which lab test is used to monitor Unfractionated Heparin?', '["PT/INR", "Activated Partial Thromboplastin Time (aPTT)", "Bleeding Time", "D-dimer"]', 1, 'aPTT measures the intrinsic pathway, which is sensitive to heparin.'),
    (v_case_id, 'Heparin works by activating which natural anticoagulant?', '["Protein C", "Protein S", "Antithrombin III", "Plasminogen"]', 2, 'Heparin potentiates antithrombin III, which then inactivates thrombin and factor Xa.'),
    (v_case_id, 'If a patient has a prolonged aPTT that DOES NOT correct when their plasma is mixed 1:1 with normal plasma, what is the likely cause?', '["Factor deficiency", "Presence of a factor inhibitor or anticoagulant (like Lupus Anticoagulant)", "Von Willebrand disease", "Vitamin K deficiency"]', 1, 'A mixing study that fails to correct suggests an inhibitor is present in the patient''s blood.');

    -- CASE 14: D-dimer and Thrombosis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Low-Probability PE', 'A 30-year-old female with no risk factors has mild pleuritic chest pain. The physician orders a D-dimer test to rule out Pulmonary Embolism.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the D-dimer measure?', '["Platelet count", "Fibrin degradation products (specifically cross-linked fibrin)", "Total protein", "Clotting time"]', 1, 'D-dimer is a product of fibrinolysis.'),
    (v_case_id, 'What is the primary clinical value of a NEGATIVE D-dimer test?', '["It confirms a PE is present", "It has a high negative predictive value (it rules out PE in low-risk patients)", "It indicates the patient needs surgery", "It measures the size of the clot"]', 1, 'A negative D-dimer in a patient with a low Wells score essentially rules out DVT/PE without the need for imaging.'),
    (v_case_id, 'Name one common reason for a FALSE POSITIVE D-dimer (elevated without a clot).', '["Dehydration", "Recent surgery, trauma, or inflammation", "Aspirin use", "Smoking"]', 1, 'Many conditions cause fibrin formation and breakdown, including surgery, infection, pregnancy, and cancer.');

    -- CASE 15: Urinalysis - Infection
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dysuria and Cloudy Urine', 'A 25-year-old female presents with painful urination. Urinalysis: Cloudy, Nitrites Positive, Leukocyte Esterase Positive, 20 WBC/hpf.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the significance of a POSITIVE Nitrite test on urinalysis?', '["It indicates any bacterial infection", "It indicates the presence of Gram-negative bacteria (like E. coli) that convert nitrates to nitrites", "It means the patient is eating too much celery", "It is a sign of kidney stones"]', 1, 'Not all bacteria produce nitrites, but Gram-negatives like E. coli do.'),
    (v_case_id, 'What does the Leukocyte Esterase test detect?', '["Bacteria", "Intact or lysed white blood cells", "Blood", "Glucose"]', 1, 'It detects an enzyme released by neutrophils, indicating pyuria.'),
    (v_case_id, 'The presence of "White Blood Cell Casts" in the urine would suggest the infection has moved to:', '["The bladder (Cystitis)", "The kidney (Pyelonephritis)", "The urethra (Urethritis)", "The prostate"]', 1, 'Casts are formed in the renal tubules; WBC casts are a hallmark of pyelonephritis.');

    -- CASE 16: Urinalysis - Nephrotic vs. Nephritic
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Swollen Patient with Dark Urine', 'A 10-year-old boy presents with "cola-colored" urine and facial swelling following a throat infection. Urinalysis shows 3+ blood, dysmorphic RBCs, and RBC casts.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Nephrotic syndrome", "Post-streptococcal glomerulonephritis (Nephritic)", "Kidney stone", "Bladder cancer"]', 1, 'Glomerulonephritis (Nephritic syndrome) is characterized by hematuria and RBC casts.'),
    (v_case_id, 'How do you distinguish Nephrotic from Nephritic syndrome based on lab findings?', '["Nephrotic: Massive proteinuria (>3.5g/day); Nephritic: Hematuria and RBC casts", "Nephrotic: Hematuria; Nephritic: Proteinuria", "Nephrotic has high blood pressure", "Nephritic has low cholesterol"]', 0, 'Nephrotic syndrome is primarily a protein-losing state.'),
    (v_case_id, 'What type of cast is characteristic of Nephrotic Syndrome?', '["RBC casts", "WBC casts", "Fatty casts / Oval fat bodies", "Hyaline casts"]', 2, 'In nephrotic syndrome, the kidney loses proteins and lipids, leading to fatty casts with a "Maltese cross" appearance under polarized light.');

    -- CASE 17: CSF Analysis - Meningitis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Lumbar Puncture', 'A patient with suspected meningitis undergoes a lumbar puncture. CSF: WBC 1,500 (90% Neutrophils), Glucose 20 mg/dL (Low), Protein 200 mg/dL (High).', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What type of meningitis do these CSF findings suggest?', '["Viral (Aseptic)", "Bacterial", "Fungal", "Tuberculous"]', 1, 'High neutrophils, low glucose, and very high protein are classic for bacterial meningitis.'),
    (v_case_id, 'How would a VIRAL meningitis CSF profile differ?', '["Glucose would be even lower", "Lymphocytes would predominate, and glucose would be normal", "Neutrophils would be higher", "Protein would be normal"]', 1, 'Viral meningitis typically has a lymphocytic pleocytosis and normal glucose.'),
    (v_case_id, 'Which type of meningitis is classically associated with an EXTREMELY high protein level and a very low glucose?', '["Viral", "Fungal", "Tuberculous", "Parasitic"]', 2, 'TB meningitis often has very high protein (> 100-500) and profound hypoglycemia.');

    -- CASE 18: Pleural Fluid - Light''s Criteria
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Thoracentesis', 'A patient has a large pleural effusion. Pleural Fluid: Protein 4.0 g/dL (Serum Protein 6.0), LDH 300 (Serum LDH 400, upper limit of normal LDH 200).', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Using Light''s Criteria, is this fluid a Transudate or an Exudate?', '["Transudate", "Exudate"]', 1, 'Fluid/Serum Protein > 0.5 (0.66) or Fluid/Serum LDH > 0.6 (0.75) makes it an EXUDATE.'),
    (v_case_id, 'What is the most common cause of a pleural TRANSUDATE?', '["Pneumonia", "Lung cancer", "Congestive Heart Failure", "Pulmonary Embolism"]', 2, 'Transudates are due to pressure imbalances (CHF, Cirrhosis, Nephrotic syndrome), not local inflammation.'),
    (v_case_id, 'An EXUDATIVE pleural effusion with a very low glucose (< 60 mg/dL) suggests which of the following?', '["Heart failure", "Parapneumonic effusion, Rheumatoid arthritis, or Malignancy", "Simple viral infection", "Dehydration"]', 1, 'Bacteria or high metabolic cells (cancer/inflammation) consume the glucose in the pleural space.');

    -- CASE 19: Synovial Fluid Analysis
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Hot, Swollen Knee', 'A 50-year-old male presents with a red, swollen right knee. Arthrocentesis is performed. Fluid: WBC 80,000/mm³ (90% PMNs). Under polarized light, you see needle-shaped, negatively birefringent crystals.', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Based on the WBC count alone, how is this fluid categorized?', '["Non-inflammatory", "Inflammatory", "Septic", "Hemorrhagic"]', 1, 'Non-inflammatory: < 2000. Inflammatory: 2000-50,000. Septic: > 50,000 (usually).'),
    (v_case_id, 'What is the diagnosis based on the crystal appearance?', '["Pseudogout", "Gout", "Septic arthritis", "Osteoarthritis"]', 1, 'Needle-shaped, yellow (negatively birefringent) crystals = Monosodium urate (Gout).'),
    (v_case_id, 'What would Pseudogout crystals look like?', '["Needles", "Rhomboid-shaped and positively birefringent", "Round", "Hexagonal"]', 1, 'Calcium pyrophosphate (Pseudogout) crystals are rhomboid and blue/weakly positive.');

    -- CASE 20: Thyroid Function Tests (TFTs)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Weight Gain and Cold Intolerance', 'A 35-year-old female presents with fatigue and weight gain. Labs: TSH 25 mIU/L (High), Free T4 0.5 ng/dL (Low).', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Primary Hypothyroidism", "Secondary (Central) Hypothyroidism", "Primary Hyperthyroidism", "Sick Euthyroid Syndrome"]', 0, 'High TSH and Low T4 indicate the problem is in the thyroid gland (Primary).'),
    (v_case_id, 'In Graves'' Disease (Hyperthyroidism), what would you expect the labs to be?', '["High TSH, Low T4", "Low TSH, High T4", "Low TSH, Low T4", "High TSH, High T4"]', 1, 'Excess T4 provides negative feedback to the pituitary, suppressing TSH.'),
    (v_case_id, 'A patient with a Low TSH and a Low Free T4 likely has a problem in which organ?', '["Thyroid", "Pituitary or Hypothalamus", "Liver", "Kidney"]', 1, 'Central hypothyroidism involves failure of the pituitary to produce TSH.');

    -- CASE 21: HbA1c and Diabetes
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Three-Month Average', 'A 50-year-old diabetic patient has a Fasting Plasma Glucose (FPG) of 130 mg/dL today, but his HbA1c is 9.5%.', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the HbA1c measure?', '["Blood sugar at the moment of the draw", "Average blood glucose over the past 2-3 months", "The amount of insulin in the blood", "The amount of glucose in the urine"]', 1, 'HbA1c measures the glycation of hemoglobin, reflecting long-term control.'),
    (v_case_id, 'What is the target HbA1c for most non-pregnant adults with diabetes?', '["< 6.0%", "< 7.0%", "< 8.0%", "< 9.0%"]', 1, 'The standard ADA goal is < 7.0%.'),
    (v_case_id, 'Which condition can cause a FALSELY LOW HbA1c reading?', '["Iron deficiency anemia", "Chronic kidney disease", "Hemolytic anemia or recent blood transfusion", "Splenectomy"]', 2, 'Anything that shortens RBC lifespan reduces the time for glycation, lowering the A1c artificially.');

    -- CASE 22: Serum Ferritin
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Iron Storage Tank', 'A 60-year-old male with chronic RA has a hemoglobin of 10.5. His Iron is low, TIBC is low, but his Ferritin is 400 ng/mL (High).', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Iron deficiency anemia", "Anemia of Chronic Disease", "Hemochromatosis", "Thalassemia"]', 1, 'High Ferritin with low TIBC and low iron is characteristic of Anemia of Chronic Disease.'),
    (v_case_id, 'Why is Ferritin high in inflammatory states?', '["The body is making more iron", "Ferritin is an acute-phase reactant", "The liver is failing", "The patient is taking iron supplements"]', 1, 'Ferritin rises in response to inflammation, making it difficult to use as an iron store marker during acute illness.'),
    (v_case_id, 'In a healthy patient, what is the best indicator of iron deficiency?', '["Hemoglobin", "Serum Iron", "Serum Ferritin", "MCV"]', 2, 'A low Ferritin is highly specific for iron deficiency in non-inflammatory states.');

    -- CASE 23: Lipids - LDL Calculation
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Lipid Panel', 'A patient''s fasting lipid panel: Total Cholesterol 250 mg/dL, HDL 50 mg/dL, Triglycerides 150 mg/dL.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Using the Friedewald formula (LDL = Total Chol - HDL - [TG/5]), what is the calculated LDL?', '["150 mg/dL", "170 mg/dL", "200 mg/dL", "230 mg/dL"]', 1, '250 - 50 - (150/5) = 200 - 30 = 170.'),
    (v_case_id, 'The Friedewald formula becomes unreliable when the Triglycerides exceed which level?', '["200 mg/dL", "300 mg/dL", "400 mg/dL", "1000 mg/dL"]', 2, 'If TG > 400, the LDL must be measured directly.'),
    (v_case_id, 'Which cholesterol fraction is considered the most "protective" against heart disease?', '["LDL", "VLDL", "HDL", "Chylomicrons"]', 2, 'High-Density Lipoprotein (HDL) is involved in reverse cholesterol transport.');

    -- CASE 24: Amylase and Lipase
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Heavy Drinker with Epigastric Pain', 'A 45-year-old male presents with severe boring epigastric pain that radiates to the back. Labs: Lipase 1500 U/L (Normal < 60), Amylase 600 U/L (Normal < 100).', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Acute cholecystitis", "Acute pancreatitis", "Perforated ulcer", "Aortic dissection"]', 1, 'High lipase/amylase with characteristic pain confirms acute pancreatitis.'),
    (v_case_id, 'Why is Lipase generally preferred over Amylase for the diagnosis of pancreatitis?', '["It is cheaper", "It is more sensitive and remains elevated longer", "It is easier to measure", "It is only made by the pancreas"]', 1, 'Lipase is more specific and stays elevated for 7-14 days, whereas amylase returns to normal in 3-5 days.'),
    (v_case_id, 'What are the two most common causes of acute pancreatitis in the US?', '["Alcohol and Gallstones", "Alcohol and Hypercalcemia", "Gallstones and Drugs", "Infection and Trauma"]', 0, 'Together they account for ~80% of cases.');

    -- CASE 25: ESR and CRP
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Measuring Inflammation', 'A patient with suspected temporal arteritis (giant cell arteritis) has an ESR of 110 mm/hr (Normal < 20).', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What does the Erythrocyte Sedimentation Rate (ESR) measure?', '["The number of red blood cells", "The rate at which red cells fall in a column of plasma", "The amount of C-reactive protein", "Blood viscosity"]', 1, 'Inflammatory proteins (like fibrinogen) cause RBCs to clump (rouleaux), making them fall faster.'),
    (v_case_id, 'Compared to the ESR, C-reactive protein (CRP) is:', '["More sensitive to chronic changes", "More rapid to rise and fall in response to inflammation", "Less specific", "Always normal in elderly"]', 1, 'CRP is an acute-phase reactant that changes much more quickly than the ESR.'),
    (v_case_id, 'Are ESR and CRP specific for a particular disease?', '["Yes, only for autoimmune disease", "Yes, only for infection", "No, they are non-specific markers of general inflammation", "Yes, only for cancer"]', 2, 'They indicate inflammation is present but not its cause or location.');

    -- CASE 26: Procalcitonin
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bacterial vs. Viral Infection', 'A 70-year-old with pneumonia has a Procalcitonin level of 5.0 ng/mL (Normal < 0.1).', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'High Procalcitonin levels are most specific for which type of infection?', '["Viral", "Bacterial", "Fungal", "Parasitic"]', 1, 'Procalcitonin rises significantly in bacterial infections but is suppressed in viral infections by interferon-gamma.'),
    (v_case_id, 'What is the primary clinical use of Procalcitonin in respiratory infections?', '["To diagnose cancer", "To guide the initiation and duration of antibiotic therapy", "To check for asthma", "To measure oxygen levels"]', 1, 'It helps clinicians decide if antibiotics are necessary and when they can be safely stopped.'),
    (v_case_id, 'Which of the following can cause a FALSELY elevated Procalcitonin?', '["Aspirin use", "Severe trauma, burns, or major surgery", "Diabetes", "Exercise"]', 1, 'Severe systemic stress can cause a non-infectious rise in procalcitonin.');

    -- CASE 27: Creatine Kinase (CK)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Muscle Pain and Dark Urine', 'A patient is found unconscious on his floor for 12 hours. His urine is dark brown. Labs: CK 50,000 U/L (High), Creatinine 2.5 (High).', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Myocardial infarction", "Rhabdomyolysis", "Hepatitis", "Dehydration"]', 1, 'Massive CK elevation and dark urine suggest muscle breakdown (rhabdo).'),
    (v_case_id, 'Why is the urine dark brown in this condition?', '["Hematuria", "Myoglobinuria", "Bilirubinuria", "Concentrated urea"]', 1, 'Myoglobin is released from damaged muscle and filtered by the kidney.'),
    (v_case_id, 'The urine dipstick in this patient would likely be:', '["Positive for blood, but no RBCs seen on microscopy", "Negative for everything", "Positive for glucose", "Positive for protein only"]', 0, 'The dipstick cannot distinguish between hemoglobin and myoglobin.');

    -- CASE 28: BNP - Heart Failure
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Shortness of Breath in the ER', 'A 70-year-old male with a history of heart failure and COPD presents with SOB. His BNP level is 1,200 pg/mL (Normal < 100).', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is BNP (B-type Natriuretic Peptide)?', '["A hormone released from the heart in response to ventricular stretch", "A byproduct of lung inflammation", "A liver enzyme", "A kidney hormone"]', 0, 'BNP is released when the ventricles are volume-overloaded or under high pressure.'),
    (v_case_id, 'What is the primary clinical value of BNP in the ER?', '["To diagnose a PE", "To differentiate heart failure from primary lung disease as the cause of dyspnea", "To rule out pneumonia", "To measure coronary artery blockage"]', 1, 'A low BNP (<100) has a high negative predictive value for heart failure.'),
    (v_case_id, 'Can BNP be elevated in patients WITHOUT heart failure?', '["No", "Yes, in patients with renal failure, advanced age, or PE", "Only if they are exercising", "Only if they are on steroids"]', 1, 'BNP is cleared by the kidneys, so CKD can cause chronic elevations.');

    -- CASE 29: Troponin
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Chest Pain Marker', 'A 55-year-old male presents with chest pain. The first Troponin I is 0.05 (Borderline). Three hours later, it is 1.50 (High).', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why are serial troponins measured?', '["To check the lab''s accuracy", "Because it can take 3-6 hours for troponin levels to rise after an MI", "To measure cholesterol", "To check the patient''s kidney function"]', 1, 'A single negative troponin early in the course of chest pain does not rule out an MI.'),
    (v_case_id, 'Which troponin is most specific for cardiac muscle?', '["Troponin C", "Troponin I and T", "Troponin M", "All troponins are cardiac-specific"]', 1, 'Cardiac Troponin I and T are specific markers of myocardial necrosis.'),
    (v_case_id, 'How long does Troponin typically stay elevated after an MI?', '["6 hours", "24 hours", "7-10 days", "30 days"]', 2, 'Troponin remains elevated for 1-2 weeks, making it poor for diagnosing a RE-infarction (CK-MB is better for that).');

    -- CASE 30: LDH and Haptoglobin
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'The Hemolysis Panel', 'A patient with sickle cell disease is in crisis. Labs: Hb 6.0, LDH 1200 (High), Haptoglobin < 10 (Low), Indirect Bilirubin 4.0 (High).', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Why is LDH (Lactate Dehydrogenase) elevated in hemolysis?', '["The liver makes more LDH", "LDH is an enzyme found inside red blood cells and is released when they burst", "It is a sign of infection", "LDH is needed to make more RBCs"]', 1, 'LDH is a marker of cell turnover and damage.'),
    (v_case_id, 'A patient with LDH > 2500 and a high MCV (115) likely has which type of anemia?', '["Iron deficiency", "Megaloblastic anemia (B12/Folate)", "Hemolytic anemia", "Chronic disease"]', 1, 'Megaloblastic anemia causes "ineffective erythropoiesis," leading to massive LDH release from precursors in the marrow.'),
    (v_case_id, 'Haptoglobin is primarily used to detect:', '["Iron stores", "Intravascular hemolysis", "Liver synthetic function", "Renal filtration rate"]', 1, 'Low haptoglobin is one of the most sensitive markers for intravascular hemolysis.');

    RAISE NOTICE 'SUCCESS: Common Lab Interpretation Case Blocks (1-30) registered.';
END $$;

COMMIT;
