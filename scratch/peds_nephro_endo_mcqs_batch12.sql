-- Batch 12: 29 Pediatric Nephrology & Endo MCQs (Questions 342-370)
-- Topic: Obesity, Metabolic Syndrome, and Final Review
-- Slug: peds-nephro-endo

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the definition of "Obesity" in a child aged 2 to 19 years?', 
'["BMI >= 85th percentile", "BMI >= 95th percentile", "Weight > 100 lbs", "BMI >= 30 kg/m2"]'::jsonb, 
1, 
'In children, BMI is age- and sex-specific. "Overweight" is defined as a BMI between the 85th and 95th percentiles. "Obesity" is a BMI >= 95th percentile.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following is a classic dermatologic finding associated with insulin resistance in obese children?', 
'["Erythema multiforme", "Acanthosis nigricans", "Psoriasis", "Vitiligo"]'::jsonb, 
1, 
'Acanthosis nigricans is a velvety, hyperpigmented thickening of the skin, typically found on the neck, axilla, and groin. It is a highly specific marker for underlying hyperinsulinemia and insulin resistance.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 12-year-old obese boy presents with a limp and pain in his right hip and knee. On exam, he has limited internal rotation of the right hip. What is the most likely diagnosis associated with his obesity?', 
'["Legg-Calvé-Perthes disease", "Slipped Capital Femoral Epiphysis (SCFE)", "Osgood-Schlatter disease", "Septic arthritis"]'::jsonb, 
1, 
'SCFE is more common in obese adolescents. The increased weight puts excessive mechanical stress on the growth plate of the femoral head, causing it to slip posteriorly and inferiorly.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following is part of the clinical criteria for "Metabolic Syndrome" in adolescents?', 
'["Abdominal obesity (waist circumference > 90th percentile)", "Hypertension", "Dyslipidemia (High Triglycerides, Low HDL)", "All of the above"]'::jsonb, 
3, 
'Metabolic syndrome in children/adolescents involves a cluster of risk factors: abdominal obesity, elevated BP, high TG, low HDL, and impaired fasting glucose.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'At what ages does the AAP recommend "universal" lipid screening for all children, regardless of risk factors?', 
'["Birth and age 5", "Age 9-11 years and again at 17-21 years", "Every year starting at age 2", "Only if the child is obese"]'::jsonb, 
1, 
'Universal screening is recommended once before puberty (age 9-11) and once after puberty (age 17-21) to identify children with familial dyslipidemias that might otherwise be missed.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'An obese 15-year-old girl presents with irregular periods, hirsutism, and acne. Her lab results show an elevated LH:FSH ratio and elevated testosterone. What is the diagnosis?', 
'["Turner syndrome", "Polycystic Ovary Syndrome (PCOS)", "Cushing syndrome", "Hypothyroidism"]'::jsonb, 
1, 
'PCOS is a common endocrine disorder in adolescent girls, often associated with obesity and insulin resistance. Diagnosis is based on the Rotterdam criteria (any 2 of 3: clinical/biochemical hyperandrogenism, oligomenorrhea, and polycystic ovaries on ultrasound).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the first-line management for Non-Alcoholic Fatty Liver Disease (NAFLD) in an obese child with elevated ALT?', 
'["Liver transplant", "Metformin", "Lifestyle modification with gradual weight loss and exercise", "Statins"]'::jsonb, 
2, 
'Weight loss and exercise are the only proven treatments for NAFLD in children. Gradual weight loss (0.5-1.0 kg/week) is recommended, as rapid weight loss can actually worsen liver inflammation.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 10-year-old obese child snores loudly, has daytime sleepiness, and wakes up gasping at night. What complication of obesity should be evaluated?', 
'["Asthma", "Obstructive Sleep Apnea (OSA)", "Pneumonia", "Hyperthyroidism"]'::jsonb, 
1, 
'OSA is highly prevalent in obese children due to excess soft tissue in the neck narrowing the airway. Polysomnography (sleep study) is the diagnostic test of choice.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of "hyperinsulinemic hypoglycemia" in a newborn (e.g., in an infant of a diabetic mother)?', 
'["Insulinoma", "Islet cell hyperplasia/Dysregulation (Congenital Hyperinsulinism)", "Maternal insulin crossing the placenta", "Low milk supply"]'::jsonb, 
1, 
'Congenital hyperinsulinism (formerly called nesidioblastosis) is the most common cause of persistent hypoglycemia in infants. In IDMs (Infant of Diabetic Mother), the hyperinsulinism is transient due to fetal exposure to maternal hyperglycemia.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 3-year-old child presents with a 4-hour fast and a blood glucose of 35 mg/dL. He has *no* ketones in his urine (hypoketotic hypoglycemia). Which class of disorders should be suspected?', 
'["Type 1 Diabetes", "Fatty acid oxidation defects (e.g., MCAD deficiency)", "Glycogen storage diseases", "Growth hormone deficiency"]'::jsonb, 
1, 
'Normally, fasting should lead to the production of ketones. "Hypoketotic hypoglycemia" is a hallmark of hyperinsulinism or defects in fatty acid oxidation (where the body cannot break down fats to make ketones).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with "Glycogen Storage Disease Type 1" (von Gierke disease) typically presents with hypoglycemia and which physical finding?', 
'["Massive hepatomegaly and ''doll-like'' facies", "Small, shrunken liver", "Tall stature", "Deafness"]'::jsonb, 
0, 
'GSD Type 1 is caused by a deficiency of glucose-6-phosphatase. Glucose cannot be released from the liver, leading to massive glycogen accumulation (hepatomegaly) and severe fasting hypoglycemia with lactic acidosis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 12-hour-old newborn has a blood glucose of 42 mg/dL. He is asymptomatic and breastfeeding well. What is the appropriate next step?', 
'["Immediate IV dextrose bolus", "Continue frequent breastfeeding and recheck glucose before the next feed", "Give 10% dextrose via a nasogastric tube", "Transfer to the NICU"]'::jsonb, 
1, 
'Asymptomatic, mild "transitional" hypoglycemia is common in the first 24 hours of life as the newborn adapts. For a stable, asymptomatic infant with glucose > 40 mg/dL, frequent feeding is the appropriate initial management.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which rare syndrome is characterized by the association of obesity, retinitis pigmentosa, polydactyly, and renal anomalies?', 
'["Prader-Willi", "Bardet-Biedl syndrome", "Alström syndrome", "Down syndrome"]'::jsonb, 
1, 
'Bardet-Biedl is a rare ciliopathy with a characteristic constellation of obesity, intellectual disability, and skeletal/organ anomalies.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 14-year-old male with a BMI at the 99th percentile has been unable to lose weight despite intensive lifestyle intervention and now has Stage 2 hypertension. What is a potential next step in management?', 
'["Wait until age 21", "Pharmacotherapy (e.g., Orlistat or GLP-1 agonists like Liraglutide/Semaglutide) or consideration of bariatric surgery", "Liposuction", "Strict water-only diet"]'::jsonb, 
1, 
'For adolescents with severe obesity (BMI >= 120% of the 95th percentile) and comorbidities, FDA-approved medications or metabolic and bariatric surgery are considered evidence-based options.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which "Nephro" condition is classically associated with "asymmetric" kidneys and recurrent UTIs?', 
'["Polycystic kidney disease", "Reflux nephropathy (chronic pyelonephritis)", "Minimal change disease", "PUV"]'::jsonb, 
1, 
'Vesicoureteral reflux and recurrent infections lead to focal scarring, which causes the kidneys to grow poorly and appear asymmetric and small on ultrasound.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child presents with a "Wilms Tumor" (Nephroblastoma). What is the most common presenting sign?', 
'["Severe abdominal pain", "Gross hematuria", "An asymptomatic, firm, smooth abdominal mass that does NOT cross the midline", "Weight loss and fever"]'::jsonb, 
2, 
'Wilms tumor is the most common primary renal malignancy in children. It typically presents as an incidental abdominal mass found by a parent or during a routine checkup. Unlike neuroblastoma, it rarely crosses the midline.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In a patient with suspected "Nephrolithiasis" (kidney stones), what is the most common type of stone found in children?', 
'["Struvite", "Calcium oxalate", "Uric acid", "Cystine"]'::jsonb, 
1, 
'Calcium oxalate stones are the most common in children, often associated with idiopathic hypercalciuria.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with autosomal dominant "Cystinuria" is at risk for forming which type of kidney stones?', 
'["Calcium stones", "Hexagonal cystine stones", "Struvite stones", "Sand-like stones"]'::jsonb, 
1, 
'Cystinuria is a defect in the transport of dibasic amino acids (COAL: Cystine, Ornithine, Arginine, Lysine). Cystine is insoluble in acidic urine and forms characteristic hexagonal crystals/stones.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the classic "triad" of Hemolytic Uremic Syndrome (HUS)?', 
'["Hematuria, Hypertension, Edema", "Microangiopathic Hemolytic Anemia, Thrombocytopenia, Acute Kidney Injury", "Fever, Rash, Joint pain", "Obesity, Diabetes, Hypertension"]'::jsonb, 
1, 
'This is a "must-know" triad for any pediatric exam.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which endocrine emergency involves a life-threatening state of severe hyperthyroidism with fever, tachycardia, and altered mental status?', 
'["Adrenal crisis", "Thyroid storm", "DKA", "Myxedema coma"]'::jsonb, 
1, 
'Thyroid storm is rare in children but can be triggered by surgery or infection in a patient with untreated Graves disease.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which lab test is most useful for monitoring the *long-term* control of TSH in a child on Levothyroxine for hypothyroidism?', 
'["Free T4", "Serum TSH", "T3 level", "Thyroglobulin"]'::jsonb, 
1, 
'The TSH level is the best marker for the adequacy of thyroid hormone replacement. The goal is to keep it in the normal range (0.5 - 4.5 mIU/L).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with Turner syndrome (45,X) should be screened for which of the following associated conditions?', 
'["Celiac disease and Autoimmune thyroiditis", "Bicuspid aortic valve and Coarctation of the aorta", "Renal anomalies (e.g., horseshoe kidney)", "All of the above"]'::jsonb, 
3, 
'Turner syndrome is associated with multiple systemic anomalies requiring screening at diagnosis and periodically thereafter.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which "RTA" (Renal Tubular Acidosis) is also known as "Hyperkalemic RTA"?', 
'["Type 1", "Type 2", "Type 4", "Fanconi syndrome"]'::jsonb, 
2, 
'Type 4 RTA is associated with low aldosterone or resistance to aldosterone, leading to hyperkalemia and metabolic acidosis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 1-year-old child with a large, midline abdominal mass that *crosses* the midline and contains calcifications on CT is most likely to have:', 
'["Wilms tumor", "Neuroblastoma", "Hepatoblastoma", "Teratoma"]'::jsonb, 
1, 
'Neuroblastoma is a tumor of the sympathetic chain (often the adrenal medulla). It is the most common extracranial solid tumor of childhood and characteristically crosses the midline.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the term for "breast budding" in a girl?', 
'["Pubarche", "Thelarche", "Menarche", "Adrenarche"]'::jsonb, 
1, 
'Thelarche is the start of breast development.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with "Primary Hyperoxaluria" is at risk for which severe complication?', 
'["Diabetes", "Recurrent calcium oxalate stones leading to nephrocalcinosis and ESRD", "Short stature", "Hearing loss"]'::jsonb, 
1, 
'Primary hyperoxaluria is a rare metabolic disorder where the liver overproduces oxalate, leading to massive stone formation and systemic oxalosis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In the assessment of short stature, if the "Bone Age" is equal to the "Chronological Age," which diagnosis is most likely?', 
'["Constitutional Delay", "Familial Short Stature", "Growth Hormone Deficiency", "Hypothyroidism"]'::jsonb, 
1, 
'A normal bone age in a short child means the child is growing at their genetic potential (Familial Short Stature). Delayed bone age suggests a delay in maturation (Constitutional or Endocrine/Systemic disease).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of "true" (central) precocious puberty in boys?', 
'["Idiopathic", "Central Nervous System (CNS) lesion, such as a hypothalamic hamartoma", "Adrenal tumor", "Obesity"]'::jsonb, 
1, 
'In contrast to girls (where CPP is usually idiopathic), CPP in boys is much more likely to be caused by an underlying CNS lesion (50-75% of cases).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 17-year-old female presents with primary amenorrhea. She has no secondary sexual characteristics (Tanner Stage 1 breasts and hair). Her FSH is extremely high. What is the most likely diagnosis?', 
'["Turner syndrome (45,X)", "Androgen insensitivity", "Kallmann syndrome", "PCOS"]'::jsonb, 
0, 
'The combination of primary amenorrhea, no puberty, and high FSH (hypergonadotropic hypogonadism) is classic for Turner syndrome.')

;
