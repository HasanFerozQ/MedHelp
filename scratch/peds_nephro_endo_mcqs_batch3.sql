-- Batch 3: 31 Pediatric Nephrology & Endo MCQs (Questions 63-93)
-- Topic: UTI, VUR, and Structural Anomalies
-- Slug: peds-nephro-endo

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common causative organism for urinary tract infections (UTIs) in children?', 
'["Klebsiella pneumoniae", "Proteus mirabilis", "Escherichia coli", "Staphylococcus saprophyticus"]'::jsonb, 
2, 
'E. coli is responsible for more than 80% of all pediatric UTIs. Other common gram-negative organisms include Klebsiella and Proteus. Gram-positive organisms like Enterococcus are less common but important in certain populations.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 4-month-old infant presents with fever, irritability, and poor feeding. Physical exam is otherwise non-focal. A urine culture obtained via catheterization shows 100,000 CFU/mL of E. coli. What is the most appropriate next step in imaging for this infant after their first febrile UTI?', 
'["Renal and bladder ultrasound (RBUS)", "Voiding cystourethrogram (VCUG)", "DMSA scan", "CT abdomen/pelvis"]'::jsonb, 
0, 
'The AAP recommends a renal and bladder ultrasound (RBUS) for all infants and children aged 2 months to 2 years after their first febrile UTI to rule out structural anomalies or significant hydronephrosis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following is an indication for performing a voiding cystourethrogram (VCUG) in a child between 2 months and 2 years of age?', 
'["Any first febrile UTI", "Recurrence of a febrile UTI or abnormal findings on the initial ultrasound", "A simple case of cystitis in an older child", "Family history of renal stones"]'::jsonb, 
1, 
'According to AAP guidelines, a VCUG should be performed if the initial RBUS is abnormal (e.g., hydronephrosis, scarring) or if the child has a second/recurrent febrile UTI.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 1-week-old male infant presents with a poor urinary stream and a palpable midline abdominal mass (distended bladder). A prenatal ultrasound showed bilateral hydronephrosis and a thickened bladder wall. What is the most likely diagnosis?', 
'["Vesicoureteral reflux", "Posterior urethral valves (PUV)", "Ureteropelvic junction (UPJ) obstruction", "Prune belly syndrome"]'::jsonb, 
1, 
'PUV is the most common cause of bladder outlet obstruction in male infants. It is caused by congenital folds in the posterior urethra. Classic signs include a weak stream, distended bladder, and bilateral hydronephrosis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the definitive initial treatment for an infant diagnosed with Posterior Urethral Valves (PUV)?', 
'["Prophylactic antibiotics", "Transurethral valve ablation", "Bilateral nephrostomy tubes", "Circumcision"]'::jsonb, 
1, 
'Initial management of PUV involves stabilizing electrolytes and decompressing the bladder with a catheter. The definitive surgical treatment is endoscopic transurethral valve ablation.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Vesicoureteral reflux (VUR) is graded from I to V. Which grade is characterized by reflux into the ureter and pelvis with significant dilation and tortuosity of the ureter and loss of papillary impressions?', 
'["Grade II", "Grade III", "Grade IV", "Grade V"]'::jsonb, 
3, 
'Grade V VUR is the most severe, showing gross dilation and tortuosity of the ureter and renal pelvis with complete loss of the normal papillary anatomy.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the primary concern associated with high-grade vesicoureteral reflux in young children?', 
'["Development of renal stones", "Recurrent pyelonephritis leading to renal scarring and chronic kidney disease", "Increased risk of bladder cancer", "Chronic urinary retention"]'::jsonb, 
1, 
'The primary risk of VUR is that it allows infected urine to travel from the bladder to the kidneys, increasing the risk of pyelonephritis and subsequent renal scarring (reflux nephropathy), which can lead to hypertension and CKD.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of neonatal hydronephrosis identified on prenatal ultrasound?', 
'["Ureteropelvic junction (UPJ) obstruction", "Vesicoureteral reflux", "Posterior urethral valves", "Multicystic dysplastic kidney"]'::jsonb, 
0, 
'UPJ obstruction is the most common cause of hydronephrosis in neonates. It is usually unilateral and involves a blockage at the junction of the renal pelvis and the ureter.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A newborn infant has a prenatal ultrasound showing a large, non-communicating, multi-loculated cystic mass in the left renal bed with no visible normal renal tissue. The right kidney is normal. What is the most likely diagnosis?', 
'["Autosomal recessive polycystic kidney disease (ARPKD)", "Multicystic dysplastic kidney (MCDK)", "Wilms tumor", "Renal agenesis"]'::jsonb, 
1, 
'MCDK is a form of renal dysplasia where the kidney is replaced by cysts and has no function. It is usually unilateral. Most MCDKs involute over time. The key is ensuring the *other* kidney is normal.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A newborn infant is born with flattened facial features (low-set ears, flattened nose, recessed chin) and clubfeet. The infant dies shortly after birth from respiratory failure due to pulmonary hypoplasia. Prenatal history noted severe oligohydramnios. What is this constellation of findings called?', 
'["Down syndrome", "Potter sequence", "VACTERL association", "Alport syndrome"]'::jsonb, 
1, 
'Potter sequence (or Potter syndrome) is the physical manifestation of severe oligohydramnios (usually due to bilateral renal agenesis or PUV). The lack of amniotic fluid leads to fetal compression (flattened facies, limb deformities) and, most critically, pulmonary hypoplasia.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the primary developmental cause of Potter sequence?', 
'["Genetic mutation in the lungs", "Severe oligohydramnios (lack of amniotic fluid), often due to renal failure in utero", "Maternal smoking", "Intrauterine infection"]'::jsonb, 
1, 
'Fetal urine is the primary source of amniotic fluid in the second half of pregnancy. If the kidneys do not develop or there is an obstruction (PUV), oligohydramnios occurs. Amniotic fluid is essential for lung expansion and development; without it, pulmonary hypoplasia results.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 7-year-old girl has had three episodes of cystitis in the last year. She has no fever and her ultrasound is normal. She has significant constipation and often "dances" around when she needs to urinate. What is the most likely underlying cause of her recurrent UTIs?', 
'["Vesicoureteral reflux", "Bladder and Bowel Dysfunction (BBD)", "Anatomical obstruction", "Sexual abuse"]'::jsonb, 
1, 
'BBD (formerly called dysfunctional voiding) is a common cause of recurrent UTIs in school-aged children. It involves stool and urine retention, which leads to incomplete bladder emptying and bacterial overgrowth.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with recurrent UTIs and constipation (BBD) should be managed with which of the following as a priority?', 
'["Long-term prophylactic antibiotics", "Treatment of constipation and timed voiding every 2-3 hours", "Immediate surgery for reflux", "Psychiatric referral"]'::jsonb, 
1, 
'Management of BBD focuses on behavioral modification: aggressive treatment of constipation (laxatives, high fiber) and a strict timed voiding schedule to ensure the bladder is emptied regularly and completely.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the standard method for obtaining a sterile urine sample for culture in a non-toilet trained infant?', 
'["Urine bag (U-bag) attached to the perineum", "Mid-stream clean catch", "Urethral catheterization or suprapubic aspiration", "Squeezing a wet diaper"]'::jsonb, 
2, 
'Urine bags have a very high rate of contamination (false positives). For a definitive diagnosis and culture in an infant, catheterization or suprapubic aspiration (SPA) is required.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following findings on a urine dipstick is most specific for a urinary tract infection?', 
'["Leukocyte esterase", "Nitrite", "Hematuria", "Proteinuria"]'::jsonb, 
1, 
'While leukocyte esterase (indicative of WBCs) is sensitive, the nitrite test is highly specific. It indicates the presence of bacteria (like E. coli) that reduce nitrate to nitrite. A positive nitrite test is very suggestive of a UTI.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In a child with a febrile UTI, the presence of which of the following on physical exam suggests pyelonephritis rather than simple cystitis?', 
'["Suprapubic tenderness", "Costovertebral angle (CVA) tenderness and high fever", "Dysuria", "Urinary frequency"]'::jsonb, 
1, 
'Cystitis (lower UTI) typically presents with dysuria, frequency, and urgency without systemic symptoms. Pyelonephritis (upper UTI) involves the renal parenchyma and presents with fever, chills, vomiting, and CVA tenderness (flank pain).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 2-year-old child is diagnosed with Grade II VUR. What is the most common management strategy for low-grade VUR?', 
'["Immediate surgical reimplantation of the ureter", "Daily prophylactic antibiotics and monitoring for spontaneous resolution", "Bilateral nephrectomies", "Fluid restriction"]'::jsonb, 
1, 
'Low-grade VUR (Grades I-III) has a high rate of spontaneous resolution as the child grows and the ureterovesical junction matures. Management often involves daily low-dose prophylactic antibiotics (e.g., nitrofurantoin or TMP-SMX) to prevent UTIs while waiting for resolution.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following structural anomalies is associated with an increased risk of renal stones and "crossing" of the ureters over the isthmus?', 
'["Horseshoe kidney", "Renal agenesis", "Ectopic ureter", "Duplex collecting system"]'::jsonb, 
0, 
'In a horseshoe kidney, the lower poles of the kidneys are fused. They are trapped by the inferior mesenteric artery (IMA) during their embryonic ascent. This can lead to UPJ obstruction, stones, and an increased risk of UTIs.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with a duplex collecting system is found to have an ectopic ureter. Where does the ectopic ureter (from the upper pole) characteristically insert in a female?', 
'["Into the bladder trigone", "Into the vagina, vestibule, or urethra", "Into the rectum", "Into the uterus"]'::jsonb, 
1, 
'The Weigert-Meyer rule states that in a duplex system, the upper pole ureter often inserts ectopically and inferiorly/medially to the normal ureter. In females, this can lead to "constant dripping" of urine despite a normal voiding pattern.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 5-year-old boy presents with primary nocturnal enuresis (bedwetting). He has never been dry at night. He has no daytime symptoms and his physical exam and urinalysis are normal. What is the most appropriate first-line advice?', 
'["Prescribe Desmopressin (DDAVP)", "Behavioral modification (avoiding fluids before bed, bedwetting alarms, and positive reinforcement)", "Perform a kidney ultrasound", "Psychological counseling for stress"]'::jsonb, 
1, 
'For primary nocturnal enuresis, management starts with education and behavioral modification. Bedwetting alarms have the highest long-term success rate. Medications are typically second-line for short-term use (e.g., sleepovers).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 7-year-old girl who has been dry at night for 2 years suddenly starts wetting the bed again. This is called "secondary enuresis." What is the most important first step?', 
'["Start bedwetting alarms", "Screen for underlying causes like UTI, Diabetes Mellitus, or constipation", "Punish the child for regressing", "Order a brain MRI"]'::jsonb, 
1, 
'Secondary enuresis (recurring after at least 6 months of being dry) often has an underlying medical or psychological trigger. Screening for UTI, diabetes (osmotic diuresis), and constipation (pressure on the bladder) is essential.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the classic ultrasound finding in Autosomal Recessive Polycystic Kidney Disease (ARPKD)?', 
'["A single large cyst", "Bilateral, enlarged, echogenic kidneys with loss of corticomedullary differentiation", "A non-functional left kidney", "A thickened bladder wall"]'::jsonb, 
1, 
'In ARPKD, the kidneys are filled with thousands of tiny microcysts (dilated collecting ducts) that are too small to be seen as individual cysts on ultrasound. Instead, they appear as large, bright (hyperechoic/echogenic) kidneys.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Children with ARPKD frequently develop which of the following extra-renal complications?', 
'["Congenital hepatic fibrosis and portal hypertension", "Cerebral aneurysms", "Pancreatic cancer", "Splenic rupture"]'::jsonb, 
0, 
'ARPKD is almost always associated with some degree of liver involvement (ductal plate malformation leading to hepatic fibrosis). This can lead to portal hypertension and esophageal varices later in childhood.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In contrast to ARPKD, Autosomal Dominant Polycystic Kidney Disease (ADPKD) typically presents with:', 
'["Massive kidney enlargement at birth", "Large, discrete cysts that develop over time, often not becoming symptomatic until adulthood", "Pulmonary hypoplasia", "Potter sequence"]'::jsonb, 
1, 
'ADPKD usually has a much later onset and involves larger, macroscopic cysts. While it can occasionally present in childhood, it is typically an adult-onset disease.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Prune belly syndrome (Eagle-Barrett syndrome) is characterized by which triad of findings?', 
'["Limb defects, renal stones, and deafness", "Abdominal muscle deficiency, cryptorchidism, and urinary tract abnormalities", "Potter facies, clubfeet, and lung failure", "Hematuria, rash, and joint pain"]'::jsonb, 
1, 
'Prune belly syndrome occurs almost exclusively in males. The severe urinary tract abnormalities (megaloureter, large bladder) lead to the characteristic "wrinkled" abdominal skin due to the lack of abdominal musculature.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 2-year-old child with a first febrile UTI has a normal RBUS. Does the AAP recommend prophylactic antibiotics to prevent a second UTI?', 
'["Yes, for all children under age 5", "No, prophylaxis is generally not recommended after a first UTI unless there is significant VUR", "Only if the child is a male", "Only if the child is uncircumcised"]'::jsonb, 
1, 
'Current evidence suggests that prophylactic antibiotics after a first uncomplicated UTI do not significantly prevent scarring and are generally reserved for children with high-grade reflux or recurrent infections.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the significance of "sterile pyuria" (WBCs in the urine with a negative standard culture) in a child?', 
'["It is always normal", "It may indicate a viral infection, partially treated UTI, or Renal Tuberculosis", "It means the urine was contaminated", "It is a sign of diabetes"]'::jsonb, 
1, 
'Sterile pyuria can be seen in many conditions, including Kawasaki disease (urethritis), renal TB, or if the child received antibiotics before the culture was taken.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with a history of recurrent Proteus mirabilis UTIs is at high risk for what type of renal stones?', 
'["Calcium oxalate", "Struvite (triple phosphate) stones", "Uric acid stones", "Cystine stones"]'::jsonb, 
1, 
'Proteus is a urease-producing organism that splits urea into ammonia, raising the urinary pH. This promotes the precipitation of magnesium ammonium phosphate, forming struvite stones (which can grow into large "staghorn" calculi).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Exstrophy of the bladder is a severe congenital anomaly where:', 
'["The bladder is missing", "The bladder is open and exposed on the abdominal wall", "The bladder is inside out but internal", "The bladder is fused to the rectum"]'::jsonb, 
1, 
'Bladder exstrophy involves a failure of the abdominal wall and anterior bladder wall to close, leaving the posterior bladder wall exposed. It is associated with epispadias and pelvic bone defects.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 3-year-old child with a UTI is found to have a "solitary" kidney on ultrasound. What is the most important long-term advice for the parents?', 
'["The child must avoid all salt", "The child should avoid high-impact contact sports to protect the remaining kidney", "The child will definitely need a transplant by age 10", "No special precautions are needed"]'::jsonb, 
1, 
'For children with a solitary kidney (due to agenesis or MCDK), protecting the remaining functional kidney from trauma is vital. Avoiding high-impact sports (like football or wrestling) is often recommended.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child presents with severe hypertension, a loud abdominal bruit, and a normal renal ultrasound. What is the most likely diagnosis?', 
'["Coarctation of the aorta", "Renovascular hypertension (e.g., Fibromuscular Dysplasia)", "Pheochromocytoma", "Neuroblastoma"]'::jsonb, 
1, 
'Renovascular hypertension (narrowing of the renal artery) is an important cause of secondary hypertension in children. An abdominal bruit is a classic finding. Fibromuscular dysplasia is a common cause in this age group.')

;
