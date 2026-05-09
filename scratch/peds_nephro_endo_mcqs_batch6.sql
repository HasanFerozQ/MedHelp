-- Batch 6: 31 Pediatric Nephrology & Endo MCQs (Questions 156-186)
-- Topic: Diabetes Mellitus and DKA Management
-- Slug: peds-nephro-endo

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of Type 1 Diabetes Mellitus in children?', 
'["Insulin resistance due to obesity", "Autoimmune destruction of pancreatic beta cells", "Exocrine pancreatic insufficiency", "Chronic high sugar intake"]'::jsonb, 
1, 
'Type 1 DM is an autoimmune disease where T-cell mediated destruction of the insulin-producing beta cells in the pancreatic islets leads to absolute insulin deficiency. Antibodies (e.g., GAD65, IA-2, Insulin autoantibodies) are often present at diagnosis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 6-year-old child presents with a 3-week history of polyuria, polydipsia, and a 2 kg weight loss. A random plasma glucose is 245 mg/dL. What is the most appropriate next step to confirm the diagnosis of Diabetes Mellitus?', 
'["Perform an oral glucose tolerance test (OGTT)", "No further testing is needed; a random glucose > 200 mg/dL with symptoms is diagnostic", "Check HbA1c", "Measure fasting insulin levels"]'::jsonb, 
1, 
'According to the ADA, a random plasma glucose >= 200 mg/dL in a patient with classic symptoms (polyuria, polydipsia, weight loss) is sufficient to diagnose Diabetes Mellitus.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which HLA types are most strongly associated with an increased risk of developing Type 1 Diabetes Mellitus?', 
'["HLA-B27", "HLA-DR3 and HLA-DR4", "HLA-DQ8 only", "HLA-A3"]'::jsonb, 
1, 
'The HLA-DR3 and HLA-DR4 alleles (and associated DQ alleles) are found in 95% of children with T1DM. HLA-B27 is associated with spondyloarthropathies, and HLA-A3 with hemochromatosis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 10-year-old child is brought to the ER with deep, rapid, labored breathing (Kussmaul breathing), fruity-smelling breath, and vomiting. What is the most likely diagnosis?', 
'["Acute asthma exacerbation", "Diabetic Ketoacidosis (DKA)", "Salicylate poisoning", "Sepsis"]'::jsonb, 
1, 
'These are classic signs of DKA. Kussmaul breathing is a respiratory compensation for metabolic acidosis. The "fruity" odor is due to the presence of acetone.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In the initial management of a child in DKA who is hemodynamically unstable, what is the FIRST priority?', 
'["Start an intravenous insulin drip", "Bolus with 10-20 mL/kg of Normal Saline", "Administer intravenous bicarbonate", "Give oral potassium"]'::jsonb, 
1, 
'The first step in DKA management is fluid resuscitation to restore intravascular volume and improve renal perfusion. Insulin should *not* be started until the initial bolus is complete and potassium levels are known.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the standard intravenous insulin infusion dose used for the treatment of DKA in children?', 
'["0.1 units/kg/hour", "1.0 units/kg/hour", "0.01 units/kg/hour", "5 units/kg as a bolus"]'::jsonb, 
0, 
'A continuous low-dose IV insulin infusion (0.1 units/kg/hr) is used to slowly lower glucose and suppress ketone production. Insulin boluses are generally avoided in children due to the increased risk of cerebral edema.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child in DKA has an initial serum potassium of 4.2 mEq/L (normal range). When should potassium be added to the intravenous fluids?', 
'["Immediately with the first bolus", "Only if the potassium drops below 3.0 mEq/L", "As soon as the child begins to produce urine and an insulin drip is started", "Never; potassium is high in DKA"]'::jsonb, 
2, 
'In DKA, total body potassium is always depleted due to osmotic diuresis, but the initial serum level may be normal or high because of the shift out of cells (due to acidosis and insulin lack). Once insulin is started, potassium will shift back into cells and drop rapidly. Potassium should be added once urine output is confirmed.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common and most dreaded complication of DKA treatment in children, occurring in about 0.5-1% of cases?', 
'["Hypoglycemia", "Hypokalemia", "Cerebral edema", "Acute tubular necrosis"]'::jsonb, 
2, 
'Cerebral edema is the leading cause of DKA-related mortality in children. It typically occurs 4-12 hours into treatment. Risk factors include young age, new-onset diabetes, severe acidosis, and high initial BUN.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child being treated for DKA suddenly develops a severe headache, slowing heart rate (bradycardia), and rising blood pressure. What is the most appropriate immediate intervention?', 
'["Perform a head CT scan", "Administer intravenous Mannitol or Hypertonic (3%) Saline", "Increase the insulin infusion rate", "Give a fluid bolus"]'::jsonb, 
1, 
'These are signs of rising intracranial pressure and impending cerebral edema (Cushing triad). Treatment with Mannitol or 3% saline must be given *immediately* upon clinical suspicion; do not wait for imaging results.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In DKA management, when the blood glucose drops below 250-300 mg/dL, what change should be made to the intravenous fluids while the insulin drip continues?', 
'["Stop the insulin drip", "Switch to fluids containing 5% dextrose (e.g., D5 0.45% NS)", "Decrease the fluid rate by half", "Give a large bolus of normal saline"]'::jsonb, 
1, 
'To prevent a too-rapid drop in glucose and to allow the insulin drip to continue until the *ketosis* (anion gap) is resolved, dextrose is added to the maintenance fluids once the glucose reaches ~250-300 mg/dL.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'When is it appropriate to transition a child from an IV insulin drip to subcutaneous insulin?', 
'["As soon as the blood glucose is < 200 mg/dL", "When the anion gap has closed and the child is able to tolerate oral intake", "After 24 hours regardless of labs", "When the child stops vomiting"]'::jsonb, 
1, 
'The goal of DKA treatment is to clear the ketones and normalize the pH. The insulin drip should continue until the anion gap is closed (< 12) and the child is stable enough to eat. A dose of subcutaneous insulin should be given 30-60 minutes before the drip is stopped.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the target HbA1c for most children and adolescents with Type 1 Diabetes, according to recent ADA guidelines?', 
'["< 6.0%", "< 7.0%", "< 8.5%", "< 10.0%"]'::jsonb, 
1, 
'The ADA currently recommends a target HbA1c of < 7.0% for all pediatric age groups, while emphasizing individualized targets to avoid severe hypoglycemia.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 14-year-old girl with T1DM is found sweaty, shaky, and confused before lunch. A fingerstick glucose is 45 mg/dL. She is awake and able to swallow. What is the best initial treatment?', 
'["Glucagon injection", "15 grams of fast-acting carbohydrate (e.g., 4 oz juice or glucose tabs)", "A large bowl of pasta", "Wait until lunch is served"]'::jsonb, 
1, 
'For mild-to-moderate hypoglycemia in a conscious patient, the "Rule of 15" is used: give 15g of simple carb, wait 15 minutes, and recheck. Glucagon is used for severe hypoglycemia or if the patient is unconscious/seizing.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the "Honeymoon Phase" in a child newly diagnosed with Type 1 Diabetes?', 
'["A period of perfect glucose control after the first week", "A temporary recovery of some beta-cell function shortly after starting insulin, requiring much lower doses", "The time before the child needs any insulin at all", "A period of intense hunger"]'::jsonb, 
1, 
'The honeymoon phase occurs in many T1DM patients when the initial insulin therapy "rests" the remaining beta cells, allowing them to temporarily secrete enough insulin to significantly reduce exogenous requirements. It usually lasts a few months to a year.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following is a symptom of the "Dawn Phenomenon"?', 
'["Hypoglycemia at 3 AM followed by rebound hyperglycemia", "Early morning hyperglycemia due to the natural surge of growth hormone and cortisol", "Hyperglycemia after a high-fat meal", "Weight gain"]'::jsonb, 
1, 
'The Dawn Phenomenon is a normal rise in blood sugar in the early morning (4-8 AM) caused by the surge of counter-regulatory hormones. It is managed by increasing the basal insulin dose. The Somogyi effect involves rebound hyperglycemia following middle-of-the-night hypoglycemia.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 13-year-old obese boy with acanthosis nigricans is found to have a fasting glucose of 140 mg/dL and a C-peptide level that is *elevated*. What is the most likely diagnosis?', 
'["Type 1 Diabetes Mellitus", "Type 2 Diabetes Mellitus", "MODY (Maturity-Onset Diabetes of the Young)", "Cushing syndrome"]'::jsonb, 
1, 
'Type 2 DM is increasing in children due to obesity. It is characterized by insulin resistance (high C-peptide/insulin levels initially) and metabolic syndrome. Acanthosis nigricans (velvety skin thickening) is a classic sign of insulin resistance.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the first-line pharmacologic treatment for Type 2 Diabetes in children (aged 10 and older)?', 
'["Insulin only", "Metformin", "Sulfonylureas", "Cyclophosphamide"]'::jsonb, 
1, 
'Metformin is the only oral agent approved for the initial treatment of T2DM in children >= 10 years old, along with lifestyle changes. Insulin is added if the HbA1c is high (> 8.5-9.0%) or if the patient is in DKA.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 12-year-old child with T1DM is being screened for associated autoimmune conditions. Which of the following should be screened for annually?', 
'["Celiac disease and Autoimmune thyroiditis", "Rheumatoid arthritis", "Systemic lupus erythematosus", "Inflammatory bowel disease"]'::jsonb, 
0, 
'Children with T1DM have a higher risk for other autoimmune diseases. Annual screening for thyroid dysfunction (TSH) and periodic screening for celiac disease (tTG-IgA) are recommended.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with T1DM should have their first formal screening for diabetic complications (retinopathy and nephropathy) at what point?', 
'["At the time of diagnosis", "Every year starting from diagnosis", "Starting 5 years after diagnosis or at age 10-11 (whichever is later)", "Only if they have symptoms"]'::jsonb, 
2, 
'Microvascular complications are rare before puberty and within the first few years of diagnosis. Screening for microalbuminuria and retinopathy typically starts 5 years after diagnosis or when the child reaches age 10-11.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of death in children and adolescents with Type 1 Diabetes Mellitus?', 
'["Heart disease", "DKA and its complications (e.g., cerebral edema)", "Hypoglycemia", "Infection"]'::jsonb, 
1, 
'While heart disease is a long-term risk, the most common acute cause of death in pediatric T1DM is DKA and the associated risk of cerebral edema.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In a child with T1DM, what is the best advice for exercise?', 
'["Avoid all exercise to prevent hypoglycemia", "Consume extra carbohydrates before and during exercise, and monitor blood sugars closely", "Double the insulin dose before exercise", "None"]'::jsonb, 
1, 
'Exercise increases insulin sensitivity and glucose uptake. To prevent exercise-induced hypoglycemia, patients should check their glucose, eat extra snacks (15-30g carb for every 30-60 min of exercise), and potentially reduce the insulin dose covering the meal before exercise.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A "non-obese" child with a strong family history of diabetes in every generation (autosomal dominant) presents with mild hyperglycemia but no ketosis and negative autoantibodies. What diagnosis should be considered?', 
'["Type 1 DM", "Type 2 DM", "Maturity-Onset Diabetes of the Young (MODY)", "Gestational DM"]'::jsonb, 
2, 
'MODY is a group of monogenic forms of diabetes caused by mutations in genes involved in beta-cell function (e.g., HNF1-alpha, Glucokinase). It is often misdiagnosed as T1DM or T2DM but has a characteristic autosomal dominant inheritance pattern.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the mechanism of action of Metformin in the treatment of T2DM?', 
'["Stimulates insulin release from the pancreas", "Decreases hepatic glucose production and improves peripheral insulin sensitivity", "Binds to and neutralizes glucose in the gut", "Promotes glucose excretion in the urine"]'::jsonb, 
1, 
'Metformin reduces gluconeogenesis in the liver and increases glucose uptake in the muscles, helping to overcome insulin resistance.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 16-year-old with T1DM is found unconscious in the middle of the night. A family member administers an injection of Glucagon. How does Glucagon raise the blood sugar?', 
'["It is a concentrated form of sugar", "It stimulates hepatic glycogenolysis (breakdown of glycogen into glucose)", "It inhibits insulin receptors", "It promotes fat absorption"]'::jsonb, 
1, 
'Glucagon stimulates the liver to release its stored glucose (glycogen). It is a life-saving emergency treatment for severe hypoglycemia.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following describes "Long-acting" (Basal) insulin analogs?', 
'["Glargine (Lantus) and Detemir (Levemir)", "Lispro (Humalog) and Aspart (Novolog)", "Regular insulin", "NPH"]'::jsonb, 
0, 
'Glargine and Detemir provide a steady "basal" level of insulin for 18-24 hours without a significant peak, mimicking the normal background insulin secretion of the pancreas.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with T1DM presents with vomiting and a low-grade fever. Even if the child is not eating, why must the parents NEVER completely skip the basal insulin dose?', 
'["It will cause hypoglycemia", "Insulin is needed to prevent the body from breaking down fats and entering DKA", "The child will become addicted to insulin", "None"]'::jsonb, 
1, 
'During illness, counter-regulatory hormones (stress hormones) rise, increasing the risk of ketosis. Skipping insulin during illness is a common cause of DKA. Basal insulin must be maintained, and blood sugars/ketones monitored frequently.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the primary indicator of "Microalbuminuria" (an early sign of diabetic nephropathy) on a spot urine sample?', 
'["Albumin to Creatinine ratio (ACR) of 30-300 mg/g", "ACR > 1000 mg/g", "Glucose > 500 mg/dL", "Presence of ketones"]'::jsonb, 
0, 
'Microalbuminuria (ACR 30-300) is the earliest detectable stage of kidney damage in diabetes. It is reversible with improved glucose control and ACE inhibitor therapy.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following is true regarding "Kussmaul breathing" in DKA?', 
'["It is caused by low oxygen levels", "It is a compensatory mechanism to blow off CO2 and raise the pH", "It is a sign of pneumonia", "It should be treated with oxygen only"]'::jsonb, 
1, 
'By breathing deeply and rapidly, the body eliminates carbon dioxide (an acid), which helps compensate for the metabolic ketoacidosis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 2-year-old child presents in DKA. What is the biggest risk factor for cerebral edema in this specific patient?', 
'["Very young age (< 5 years old)", "High blood glucose", "Obesity", "Being female"]'::jsonb, 
0, 
'Children under age 5 are at the highest risk for developing cerebral edema during the treatment of DKA.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In the setting of DKA, when is the use of intravenous bicarbonate indicated?', 
'["For every patient to correct the pH quickly", "Only in severe acidosis (pH < 6.9) with life-threatening hyperkalemia or hemodynamic instability", "To prevent cerebral edema", "Never"]'::jsonb, 
1, 
'Bicarbonate is generally avoided in pediatric DKA because it increases the risk of cerebral edema and causes a "paradoxical CNS acidosis." It is reserved only for extreme life-threatening circumstances.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with T1DM uses a continuous glucose monitor (CGM). What is a major benefit of this technology?', 
'["It eliminates the need for any fingersticks", "It provides real-time data and alarms for rapidly falling or rising blood sugars", "It automatically cures diabetes", "It makes the child lose weight"]'::jsonb, 
1, 
'CGMs provide trend data and predictive alerts, which significantly help in preventing severe hypoglycemia and improving overall glycemic control.')

;
