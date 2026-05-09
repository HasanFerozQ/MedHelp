-- Batch 4: 31 Pediatric Nephrology & Endo MCQs (Questions 94-124)
-- Topic: AKI, CKD, and Hypertension
-- Slug: peds-nephro-endo

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of acute kidney injury (AKI) in hospitalized children?', 
'["Prerenal azotemia (due to dehydration or sepsis)", "Acute tubular necrosis (ATN) from nephrotoxic drugs", "Glomerulonephritis", "Postrenal obstruction"]'::jsonb, 
0, 
'Prerenal azotemia is the most common cause of AKI overall. It results from decreased renal perfusion without intrinsic damage to the kidney. In children, this is most often due to severe dehydration (e.g., from gastroenteritis) or decreased cardiac output/shock.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 2-year-old child with severe vomiting and diarrhea has a BUN of 45 mg/dL and a Creatinine of 1.2 mg/dL (BUN:Cr ratio > 20:1). The Fractional Excretion of Sodium (FeNa) is < 1%. What is the most likely type of AKI?', 
'["Prerenal AKI", "Intrinsic Renal AKI (e.g., ATN)", "Postrenal AKI", "Chronic Kidney Disease"]'::jsonb, 
0, 
'A high BUN:Cr ratio and a low FeNa (< 1%) are classic markers for prerenal AKI. These findings indicate that the kidney is functioning normally and attempting to conserve sodium and water in response to perceived volume depletion.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In contrast to prerenal AKI, what FeNa value is typically seen in Intrinsic Renal AKI (like Acute Tubular Necrosis)?', 
'["< 0.5%", "< 1%", "> 2%", "> 20%"]'::jsonb, 
2, 
'In intrinsic AKI (like ATN), the damaged tubular cells cannot effectively reabsorb sodium. This leads to a higher FeNa (typically > 2% in children).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with AKI is found to have a serum potassium level of 7.2 mEq/L with peaked T-waves on ECG. What is the MOST immediate first-line treatment to stabilize the cardiac membrane?', 
'["Intravenous Furosemide", "Intravenous Calcium Gluconate", "Oral Sodium Polystyrene Sulfonate (Kayexalate)", "Albuterol nebulizer"]'::jsonb, 
1, 
'Hyperkalemia with ECG changes is a medical emergency. Intravenous calcium gluconate (or calcium chloride) is the first-line treatment because it antagonizes the cardiac membrane effects of potassium, preventing life-threatening arrhythmias. It does *not* lower the potassium level itself.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following medications can be used to shift potassium INTO the cells in the setting of acute hyperkalemia?', 
'["Calcium gluconate", "Insulin with glucose (dextrose)", "Amoxicillin", "Lisinopril"]'::jsonb, 
1, 
'Insulin (given with dextrose to prevent hypoglycemia) and beta-agonists (like albuterol) stimulate the Na+/K+ ATPase pump, shifting potassium into the intracellular space. This provides temporary management while awaiting definitive removal via diuretics or dialysis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of Chronic Kidney Disease (CKD) in children under the age of 5?', 
'["Glomerulonephritis", "Congenital Anomalies of the Kidney and Urinary Tract (CAKUT)", "Polycystic kidney disease", "Diabetes mellitus"]'::jsonb, 
1, 
'In young children, structural and congenital anomalies (like PUV, renal dysplasia, or VUR) are the leading causes of CKD. In older children and adolescents, glomerulonephritis becomes a more common cause.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 10-year-old child with Stage 4 CKD has a low hemoglobin level and low reticulocyte count. What is the primary cause of his anemia?', 
'["Iron deficiency from poor diet", "Inadequate production of erythropoietin (EPO) by the kidneys", "Chronic blood loss from the GI tract", "Hemolysis due to uremia"]'::jsonb, 
1, 
'Renal anemia in CKD is primarily due to the decreased production of erythropoietin by the peritubular interstitial cells in the kidney. Management involves supplementation with recombinant human EPO.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with CKD is found to have high serum phosphorus and low serum calcium. This leads to an increase in which hormone, resulting in "Renal Osteodystrophy"?', 
'["Calcitonin", "Parathyroid Hormone (PTH)", "Growth Hormone", "Insulin"]'::jsonb, 
1, 
'The kidneys cannot excrete phosphorus or activate Vitamin D effectively in CKD. High phosphorus and low calcium stimulate the parathyroid glands (Secondary Hyperparathyroidism). Elevated PTH causes bone resorption to maintain calcium levels, leading to renal osteodystrophy.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'To prevent bone disease in a child with CKD, what is the primary dietary/medication strategy?', 
'["High-protein diet", "Phosphate binders (to be taken with meals) and Vitamin D (calcitriol) supplementation", "Calcium restriction", "High-dose potassium supplements"]'::jsonb, 
1, 
'Phosphate binders (like calcium carbonate or sevelamer) prevent the absorption of dietary phosphorus, and calcitriol (active Vitamin D) helps normalize calcium levels and suppress PTH secretion.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 5-year-old child with Stage 5 CKD (ESRD) is much shorter than his peers. What is the most effective treatment for growth failure in pediatric CKD?', 
'["Increased caloric intake only", "Recombinant Human Growth Hormone (rhGH)", "High-dose prednisone", "There is no treatment for growth failure in CKD"]'::jsonb, 
1, 
'Growth failure in CKD is multifactorial (acidosis, poor nutrition, renal osteodystrophy). After optimizing these factors, rhGH therapy is highly effective in improving growth velocity and final adult height in children with CKD.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the definition of hypertension in a child under 13 years of age?', 
'["Systolic or diastolic BP > 120/80 mmHg", "Systolic or diastolic BP >= 95th percentile for age, sex, and height on 3 separate occasions", "BP > 140/90 mmHg", "Any BP reading that is higher than the previous visit"]'::jsonb, 
1, 
'Pediatric hypertension is defined by normative data (percentiles) rather than a single absolute number. The 95th percentile is the cutoff for hypertension. Readings between the 90th and 95th percentile are classified as "Elevated Blood Pressure" (formerly pre-hypertension).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'True or False: Most hypertension in young children (under 6 years) is primary (essential) hypertension.', 
'["True", "False", "Only in children with obesity", "None"]'::jsonb, 
1, 
'False. The younger the child and the more severe the hypertension, the more likely it is to be "secondary" (due to an underlying medical cause). Renal disease (parenchymal or vascular) is the most common cause of secondary hypertension in children.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 4-year-old boy has a blood pressure of 130/85 mmHg (well above the 95th percentile). On exam, his femoral pulses are weak and delayed compared to his brachial pulses. What is the likely cause of his hypertension?', 
'["Renal artery stenosis", "Coarctation of the aorta", "Pheochromocytoma", "Hyperthyroidism"]'::jsonb, 
1, 
'Coarctation of the aorta causes high blood pressure in the upper extremities and low blood pressure/weak pulses in the lower extremities. All children with hypertension should have their four-limb blood pressures and femoral pulses checked.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 12-year-old obese adolescent has a blood pressure at the 97th percentile. His workup for secondary causes is negative. What is the first-line management?', 
'["Start Lisinopril immediately", "Lifestyle modifications (weight loss, DASH diet, increased physical activity)", "Low-dose Hydrochlorothiazide", "Refer to cardiology for a pacemaker"]'::jsonb, 
1, 
'For Stage 1 hypertension (95th-99th percentile + 5 mmHg) without evidence of end-organ damage, lifestyle modification is the initial treatment for 6-12 months before starting pharmacotherapy.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following is an absolute indication to start anti-hypertensive medication in a child?', 
'["Symptomatic hypertension", "Presence of end-organ damage (e.g., left ventricular hypertrophy)", "Stage 2 hypertension", "All of the above"]'::jsonb, 
3, 
'Medications are started immediately if the child is symptomatic, has Stage 2 hypertension, has chronic kidney disease or diabetes, or has evidence of end-organ damage (like LVH on echocardiogram).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the preferred first-line class of anti-hypertensive medication for a child with hypertension and proteinuria (e.g., from CKD)?', 
'["Beta-blockers (e.g., Propranolol)", "Calcium channel blockers (e.g., Amlodipine)", "ACE inhibitors (e.g., Lisinopril) or Angiotensin Receptor Blockers (ARBs)", "Diuretics (e.g., Furosemide)"]'::jsonb, 
2, 
'ACE inhibitors and ARBs are preferred in children with CKD or diabetes because they are "renoprotective"—they reduce intraglomerular pressure and decrease proteinuria, slowing the progression of renal disease.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child presents with a blood pressure of 190/120 mmHg, a severe headache, and vomiting. What is the classification of this presentation?', 
'["Hypertensive urgency", "Hypertensive emergency (crisis)", "Stage 1 hypertension", "White-coat hypertension"]'::jsonb, 
1, 
'A hypertensive emergency is defined by severely elevated blood pressure *with* evidence of acute end-organ damage (e.g., encephalopathy, heart failure, renal failure). Hypertensive urgency is the same level of BP *without* acute symptoms.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In a hypertensive emergency, why is it critical NOT to lower the blood pressure too rapidly?', 
'["It causes rebound hypertension", "It can lead to cerebral ischemia or infarction due to the shift in cerebral autoregulation", "It causes severe diarrhea", "It is impossible to lower it quickly"]'::jsonb, 
1, 
'The brain adapts to chronic high pressure by shifting its autoregulation curve. A rapid drop in BP can lead to a sudden decrease in cerebral blood flow. The goal is typically to lower the BP by no more than 25% of the planned reduction in the first 8 hours.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which intravenous medication is frequently used in the PICU to precisely titrate blood pressure during a hypertensive emergency?', 
'["Sodium Nitroprusside or Nicardipine", "Oral Lisinopril", "Intramuscular Penicillin", "Oral Hydrochlorothiazide"]'::jsonb, 
0, 
'Short-acting, titratable IV drips like nicardipine, sodium nitroprusside, or labetalol are preferred in the acute management of a hypertensive crisis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 10-year-old child with CKD is found to have a high level of "Urea" and "Creatinine" in the blood. What is the term for the clinical syndrome of symptoms (fatigue, itching, nausea, pericarditis) that results from this buildup of waste products?', 
'["Uremia", "Azotemia", "Albuminuria", "Ketonuria"]'::jsonb, 
0, 
'Azotemia refers to the laboratory finding of elevated nitrogenous waste (BUN/Cr). Uremia is the *clinical* syndrome of multi-organ dysfunction that occurs when those wastes reach toxic levels.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which common over-the-counter medication class should be strictly avoided in children with any form of kidney disease?', 
'["Acetaminophen (Tylenol)", "Non-steroidal anti-inflammatory drugs (NSAIDs) like Ibuprofen", "Antihistamines", "Cough suppressants"]'::jsonb, 
1, 
'NSAIDs inhibit prostaglandins, which are necessary to maintain renal blood flow (especially in a stressed kidney). Use of NSAIDs can precipitate AKI or worsen existing CKD. Acetaminophen is the preferred analgesic.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of "postrenal" AKI in a male newborn?', 
'["Kidney stones", "Posterior urethral valves", "Tumor compressing the ureter", "Blood clot in the bladder"]'::jsonb, 
1, 
'Posterior urethral valves are the most common cause of congenital bladder outlet obstruction and postrenal AKI in newborn boys.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with AKI develops "fluid overload" that is unresponsive to high-dose diuretics. They have pulmonary edema and severe hypertension. What is the next step?', 
'["Start a second diuretic", "Emergent Renal Replacement Therapy (e.g., Dialysis)", "Fluid bolus of normal saline", "Wait and watch"]'::jsonb, 
1, 
'The "AEIOU" indications for emergent dialysis in AKI include: Acidosis (severe/refractory), Electrolytes (refractory hyperkalemia), Ingestions (certain toxins), Overload (refractory fluid overload), and Uremia (symptomatic).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the primary method used to estimate the Glomerular Filtration Rate (GFR) in children?', 
'["24-hour urine collection", "The Schwartz formula (k * height / serum creatinine)", "Cockcroft-Gault equation", "MRI of the kidneys"]'::jsonb, 
1, 
'The Schwartz formula is the standard method for estimating GFR in children using the child''s height (in cm) and the serum creatinine level.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Stage 5 Chronic Kidney Disease is defined by an estimated GFR of less than:', 
'["60 mL/min/1.73m2", "30 mL/min/1.73m2", "15 mL/min/1.73m2", "90 mL/min/1.73m2"]'::jsonb, 
2, 
'Stage 5 CKD (End-Stage Renal Disease) is defined by a GFR < 15 mL/min/1.73m2. At this stage, renal replacement therapy (dialysis or transplant) is usually required to sustain life.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Renal osteodystrophy in children can present with which of the following skeletal findings?', 
'["Rickets-like changes and growth plate widening", "Excessive height", "Bone tumors", "Increased bone density"]'::jsonb, 
0, 
'In growing children, the high turnover bone disease of CKD presents similarly to nutritional rickets, with widening of the epiphyses and bowing of long bones.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of death in children and adolescents with End-Stage Renal Disease?', 
'["Infection", "Cardiovascular disease", "Bleeding", "Liver failure"]'::jsonb, 
1, 
'Similar to adults, cardiovascular disease (including arrhythmias, heart failure, and stroke) is the leading cause of mortality in pediatric patients with CKD/ESRD.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 15-year-old girl with a history of recurrent UTIs has a small, scarred right kidney and a normal left kidney. Her blood pressure is 150/95 mmHg. What is the likely mechanism of her hypertension?', 
'["High salt intake", "Renin-angiotensin system activation from the scarred kidney", "Lack of exercise", "Anxiety"]'::jsonb, 
1, 
'Renal scarring (reflux nephropathy) leads to areas of ischemia in the kidney, which stimulates the release of renin. This activates the RAA system, causing systemic hypertension.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which type of dialysis is most commonly used for long-term home maintenance in infants and young children with ESRD?', 
'["Hemodialysis", "Peritoneal dialysis", "Continuous venovenous hemofiltration (CVVH)", "None"]'::jsonb, 
1, 
'Peritoneal dialysis (PD) is often preferred for young children because it can be done at home overnight, provides more continuous clearance, and avoids the technical challenges of repeated vascular access in small children.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In a child with AKI, what is the significance of "muddy brown" granular casts in the urine sediment?', 
'["It is a normal finding", "It is highly suggestive of Acute Tubular Necrosis (ATN)", "It indicates a UTI", "It is a sign of nephrotic syndrome"]'::jsonb, 
1, 
'Muddy brown granular casts are composed of sloughed, necrotic tubular epithelial cells and are the hallmark sediment finding in ATN.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 12-year-old child presents with episodic hypertension, palpitations, and severe diaphoresis (sweating). What rare endocrine tumor should be considered?', 
'["Neuroblastoma", "Pheochromocytoma", "Wilms tumor", "Insulinoma"]'::jsonb, 
1, 
'Pheochromocytoma is a catecholamine-secreting tumor of the adrenal medulla. While rare in children, it presents with the classic triad of "PHE": Palpitations, Headache, and Episodic sweating/hypertension.')

;
