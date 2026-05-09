-- Batch 5: 31 Pediatric Nephrology & Endo MCQs (Questions 125-155)
-- Topic: Fluids, Electrolytes, and RTA
-- Slug: peds-nephro-endo

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Using the Holliday-Segar rule, what is the daily maintenance fluid requirement for a 15 kg child?', 
'["1000 mL", "1250 mL", "1500 mL", "2000 mL"]'::jsonb, 
1, 
'The Holliday-Segar rule (100-50-20) calculation: 100 mL/kg for the first 10 kg (1000 mL) + 50 mL/kg for the next 5 kg (250 mL) = 1250 mL per day.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the standard hourly maintenance fluid rate for a 25 kg child using the "4-2-1" rule?', 
'["45 mL/hr", "65 mL/hr", "85 mL/hr", "105 mL/hr"]'::jsonb, 
1, 
'The "4-2-1" rule calculation: 4 mL/hr for the first 10 kg (40 mL) + 2 mL/hr for the next 10 kg (20 mL) + 1 mL/hr for the remaining 5 kg (5 mL) = 65 mL/hr.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'An 8 kg infant is found to have 10% dehydration (moderate-to-severe). What is the total volume of the fluid deficit?', 
'["80 mL", "400 mL", "800 mL", "1200 mL"]'::jsonb, 
2, 
'Fluid deficit = weight (kg) x % dehydration x 10. For an 8 kg child with 10% dehydration: 8 x 10 x 10 = 800 mL. Alternatively, 10% of 8 kg is 0.8 kg (800 mL).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 12-month-old infant presents with vomiting, diarrhea, dry mucous membranes, and a slightly sunken anterior fontanelle. He is still producing some urine and has a normal capillary refill (< 2 sec). What is the estimated degree of dehydration?', 
'["3% (Mild)", "5-6% (Moderate)", "10% (Severe)", "15% (Shock)"]'::jsonb, 
1, 
'Moderate dehydration in infants (approx. 6-9%) is characterized by dry membranes, sunken fontanelle, decreased tears, and slightly decreased urine output, but stable hemodynamics. Mild (< 5%) has few signs. Severe (> 10%) shows signs of shock (poor refill, tachycardia, hypotension).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the volume and fluid type used for an initial bolus in a child presenting with signs of severe dehydration and shock?', 
'["20 mL/kg of 0.9% Normal Saline (or Ringer''s Lactate)", "10 mL/kg of D5 0.45% Saline", "40 mL/kg of 3% Saline", "20 mL/kg of sterile water"]'::jsonb, 
0, 
'The standard initial resuscitation bolus is 20 mL/kg of an isotonic crystalloid (NS or LR). This may be repeated until perfusion improves.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with severe gastroenteritis has a serum sodium of 128 mEq/L. This is "hyponatremic dehydration." What is the greatest risk if this hyponatremia is corrected too rapidly?', 
'["Cerebral edema", "Central pontine myelinolysis (Osmotic Demyelination Syndrome)", "Congestive heart failure", "Acute renal failure"]'::jsonb, 
1, 
'Rapid correction of chronic hyponatremia (> 10-12 mEq/L in 24 hours) causes water to leave the brain cells too quickly, leading to osmotic demyelination (Central Pontine Myelinolysis).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 6-month-old infant is brought to the ER with a seizure. The mother mentions she has been "stretching" the infant''s formula with extra water because she cannot afford more. What is the most likely cause of the seizure?', 
'["Hypernatremia", "Hyponatremia", "Hypocalcemia", "Hypoglycemia"]'::jsonb, 
1, 
'Water intoxication from dilute formula leads to severe hyponatremia. Low serum sodium causes water to move into the brain cells (osmosis), leading to cerebral edema and seizures.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with a brain tumor develops high urine output (polyuria) and a serum sodium of 155 mEq/L. The urine is very dilute (low specific gravity). What is the likely diagnosis?', 
'["SIADH", "Diabetes Insipidus", "Type 1 Diabetes Mellitus", "Psychogenic polydipsia"]'::jsonb, 
1, 
'Diabetes Insipidus (DI) is characterized by a deficiency of ADH (Central DI) or resistance to ADH (Nephrogenic DI), leading to the inability to concentrate urine, polyuria, and hypernatremia if water intake is insufficient.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In "Central" Diabetes Insipidus, how does the urine osmolality respond to the administration of exogenous ADH (Desmopressin)?', 
'["It remains low (no response)", "It increases significantly (concentration of urine)", "It decreases further", "It has no effect"]'::jsonb, 
1, 
'Central DI is a lack of ADH. Providing exogenous ADH (DDAVP) will allow the kidneys to concentrate the urine (osmolality increases). In Nephrogenic DI, the kidneys are resistant, so there is no response.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of "Nephrogenic" Diabetes Insipidus in children?', 
'["Brain trauma", "Lithium toxicity or genetic mutations (e.g., in the Vasopressin V2 receptor)", "Excessive water drinking", "Pituitary tumor"]'::jsonb, 
1, 
'While lithium is a common cause in adults, genetic mutations (most commonly X-linked recessive V2 receptor mutation) are the most common cause in children.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with pneumonia is found to have a serum sodium of 125 mEq/L, low serum osmolality, and a *high* urine osmolality (> 100 mOsm/kg). The child is clinically euvolemic. What is the diagnosis?', 
'["Dehydration", "SIADH (Syndrome of Inappropriate ADH)", "Cerebral Salt Wasting", "Diabetes Insipidus"]'::jsonb, 
1, 
'SIADH is characterized by hyponatremia, euvolemia, and inappropriately concentrated urine (high urine osmolality) despite low serum osmolality. It is commonly triggered by CNS infections/trauma, pulmonary disease, or certain medications.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the primary treatment for SIADH?', 
'["Large boluses of normal saline", "Fluid restriction", "Desmopressin (DDAVP)", "High-dose diuretics"]'::jsonb, 
1, 
'Since SIADH involves "too much" water retention, the primary treatment is fluid restriction. In severe, symptomatic cases (seizures), hypertonic (3%) saline may be used briefly.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with a recent neurosurgical procedure has hyponatremia, high urine output, and *high* urine sodium. Unlike SIADH, this child is clinically *hypovolemic*. What is the diagnosis?', 
'["SIADH", "Cerebral Salt Wasting (CSW)", "Diabetes Insipidus", "Adrenal insufficiency"]'::jsonb, 
1, 
'CSW presents similarly to SIADH but is distinguished by the presence of hypovolemia and high urine output. Unlike SIADH (which needs fluid restriction), CSW is treated with aggressive fluid and sodium replacement.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of "non-anion gap" metabolic acidosis in children?', 
'["Diabetic Ketoacidosis (DKA)", "Diarrhea", "Ethylene glycol ingestion", "Renal failure"]'::jsonb, 
1, 
'Loss of bicarbonate from the GI tract (diarrhea) is the most common cause of a normal anion gap metabolic acidosis (hyperchloremic acidosis) in pediatrics.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which type of Renal Tubular Acidosis (RTA) is characterized by a defect in the *distal* tubule''s ability to secrete hydrogen ions, leading to an inappropriately high urine pH (> 5.5)?', 
'["Type 1 (Distal) RTA", "Type 2 (Proximal) RTA", "Type 4 (Hyperkalemic) RTA", "Fanconi Syndrome"]'::jsonb, 
0, 
'Type 1 (Distal) RTA involves a failure of the alpha-intercalated cells to secrete H+. The urine pH remains > 5.5 even in the face of systemic acidosis. It is associated with nephrocalcinosis and hypokalemia.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Type 2 (Proximal) RTA involves a defect in the reabsorption of which substance in the proximal tubule?', 
'["Sodium", "Bicarbonate", "Potassium", "Glucose"]'::jsonb, 
1, 
'Type 2 RTA is a failure of the proximal tubule to reabsorb filtered bicarbonate. It is often part of "Fanconi Syndrome," where there is also loss of glucose, amino acids, and phosphate.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with Type 2 RTA is found to have glucosuria, phosphaturia, and aminoaciduria despite normal blood levels of these substances. What is this constellation of findings called?', 
'["Bartter syndrome", "Gitelman syndrome", "Fanconi syndrome", "Liddle syndrome"]'::jsonb, 
2, 
'Fanconi syndrome is a generalized dysfunction of the proximal tubule. It can be idiopathic or secondary to conditions like Cystinosis (most common cause in children), Wilson disease, or heavy metal poisoning.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which type of RTA is uniquely associated with *hyperkalemia* and is often due to hypoaldosteronism or aldosterone resistance?', 
'["Type 1 RTA", "Type 2 RTA", "Type 4 RTA", "Distal RTA"]'::jsonb, 
2, 
'Type 4 RTA is the only one associated with high serum potassium. It is common in children with obstructive uropathy (like PUV) or those taking medications that interfere with aldosterone (like Spironolactone or ACE inhibitors).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 2-year-old child presents with failure to thrive and persistent metabolic acidosis. Laboratory results: pH 7.28, Serum K+ 3.1 mEq/L (low), Urine pH 6.0 (high). Ultrasound shows nephrocalcinosis (calcium deposits in the kidneys). What is the most likely diagnosis?', 
'["Type 1 (Distal) RTA", "Type 2 (Proximal) RTA", "Lactic acidosis", "Cystic Fibrosis"]'::jsonb, 
0, 
'The high urine pH in the setting of systemic acidosis and the presence of nephrocalcinosis are diagnostic for Type 1 (Distal) RTA.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with cystic fibrosis is at risk for which metabolic abnormality during hot weather due to excessive sweat losses?', 
'["Metabolic acidosis", "Hypochloremic metabolic alkalosis", "Hypernatremia", "Respiratory acidosis"]'::jsonb, 
1, 
'CF patients lose significant salt (NaCl) in their sweat. This lead to volume depletion and "contraction alkalosis," often presenting as hypochloremic metabolic alkalosis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the primary intracellular cation?', 
'["Sodium", "Potassium", "Calcium", "Chloride"]'::jsonb, 
1, 
'Potassium (K+) is the major intracellular cation. Sodium (Na+) is the major extracellular cation.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with an anion gap metabolic acidosis (pH 7.15, HCO3- 8) has a blood glucose of 550 mg/dL and ketones in the urine. What is the diagnosis?', 
'["Type 1 RTA", "Diabetic Ketoacidosis (DKA)", "Salicylate poisoning", "Uremia"]'::jsonb, 
1, 
'The combination of hyperglycemia, metabolic acidosis, and ketonuria is the triad of DKA.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following ECG findings is characteristic of hypokalemia?', 
'["Peaked T-waves", "U-waves and flattened T-waves", "Shortened QT interval", "Delta waves"]'::jsonb, 
1, 
'Hypokalemia causes flattened T-waves and the appearance of U-waves. Hyperkalemia causes peaked T-waves and prolonged PR interval.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Bartter syndrome and Gitelman syndrome are rare "salt-wasting" tubulopathies. Which one is typically more severe, presents in infancy with polyhydramnios, and mimics the effect of a loop diuretic?', 
'["Bartter syndrome", "Gitelman syndrome", "Liddle syndrome", "Gordon syndrome"]'::jsonb, 
0, 
'Bartter syndrome involves the thick ascending limb (like furosemide) and is more severe. Gitelman involves the distal convoluted tubule (like thiazides) and often presents later in childhood with hypomagnesemia.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the formula for calculating the Anion Gap?', 
'["Na - (Cl + HCO3)", "Na + K - Cl", "Cl - HCO3", "(Na + Cl) / HCO3"]'::jsonb, 
0, 
'Anion Gap = Sodium - (Chloride + Bicarbonate). A normal range is typically 8-12 mEq/L.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which common pediatric ingestion causes a *mixed* respiratory alkalosis and metabolic acidosis?', 
'["Acetaminophen", "Salicylates (Aspirin)", "Iron", "Lead"]'::jsonb, 
1, 
'Salicylates directly stimulate the respiratory center (alkalosis) and interfere with metabolism (anion gap acidosis).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 2-month-old infant with "projectile vomiting" has a pH of 7.55, a pCO2 of 48, and a low chloride level. What is the most likely diagnosis?', 
'["Pyloric stenosis", "Gastroenteritis", "RTA", "Sepsis"]'::jsonb, 
0, 
'Pyloric stenosis causes a loss of gastric HCl, leading to a classic hypochloremic, hypokalemic metabolic alkalosis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In the management of DKA, what is the significance of the "corrected" sodium?', 
'["Sodium is lost in the urine", "Glucose acts as an osmole, pulling water out of cells and diluting the measured sodium", "The lab machine is broken", "Insulin binds to sodium"]'::jsonb, 
1, 
'Hyperglycemia causes an apparent (transitional) hyponatremia. For every 100 mg/dL increase in glucose above 100, the measured sodium decreases by approx. 1.6 mEq/L. The corrected sodium should rise as glucose falls during treatment.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with hypernatremia must have their sodium lowered slowly (no more than 0.5 mEq/L per hour). What is the risk of too-rapid correction of hypernatremia?', 
'["Central pontine myelinolysis", "Cerebral edema", "Heart failure", "Renal failure"]'::jsonb, 
1, 
'Brain cells produce "idiogenic osmoles" to protect themselves from shrinking during hypernatremia. If the blood sodium is lowered too quickly, water rushes into these cells, leading to cerebral edema, herniation, and death.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which hormone is primarily responsible for regulated potassium secretion in the distal nephron?', 
'["Cortisol", "Aldosterone", "ADH", "Insulin"]'::jsonb, 
1, 
'Aldosterone promotes sodium reabsorption and potassium/hydrogen secretion in the cortical collecting duct.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child has a serum potassium of 2.8 mEq/L. He is also found to have a low serum magnesium level. Why must the magnesium be corrected before the potassium can be normalized?', 
'["Magnesium is needed to absorb potassium in the gut", "Hypomagnesemia causes excessive renal potassium wasting", "Magnesium and potassium are the same thing", "None"]'::jsonb, 
1, 
'Low magnesium levels promote the activity of renal potassium channels (ROMK), leading to increased K+ secretion. Refractory hypokalemia is often due to underlying hypomagnesemia.')

;
