-- Batch 6: 30 Developmental Pediatrics MCQs (Questions 151-180)
-- Topic: Nephrology, Endocrinology, Neonatology, and Congenital Heart Disease

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An 8-year-old boy presents with gross hematuria ("tea-colored" urine), facial edema, and hypertension. He had a severe sore throat and fever 2 weeks ago that was untreated. Urinalysis shows red blood cell casts and mild proteinuria. Serum complement C3 levels are low. What is the most likely diagnosis?', 
'["IgA Nephropathy", "Post-Streptococcal Glomerulonephritis (PSGN)", "Minimal Change Disease", "Alport Syndrome"]'::jsonb, 
1, 
'This is the classic presentation of Acute Post-Streptococcal Glomerulonephritis (PSGN). It is an immune complex-mediated disease that occurs 1-3 weeks after a Group A Streptococcal pharyngitis (or 3-6 weeks after impetigo). The classic nephritic syndrome triad is hematuria (RBC casts), edema, and hypertension. A key diagnostic laboratory finding is a temporarily low serum C3 complement level.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 3-year-old girl is brought to the emergency department with pallor, oliguria, and lethargy. Three days prior, she had a severe bout of bloody diarrhea after eating an undercooked hamburger at a family barbecue. Laboratory tests reveal a profound hemolytic anemia, severe thrombocytopenia, and acute kidney injury (elevated BUN and creatinine). What is the most likely diagnosis?', 
'["Disseminated Intravascular Coagulation (DIC)", "Immune Thrombocytopenic Purpura (ITP)", "Hemolytic Uremic Syndrome (HUS)", "Henoch-Schönlein Purpura (HSP)"]'::jsonb, 
2, 
'Hemolytic Uremic Syndrome (HUS) is the most common cause of acute kidney injury in young children. It is characterized by the classic triad of microangiopathic hemolytic anemia, thrombocytopenia, and acute kidney injury. It is most frequently caused by a Shiga toxin-producing E. coli (STEC) infection, classically O157:H7, often acquired from undercooked beef, leading to a prodrome of bloody diarrhea.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 6-year-old boy presents with a 4-week history of worsening polyuria, polydipsia, weight loss despite increased appetite, and enuresis (new-onset bedwetting). A random blood glucose is 350 mg/dL. He does not have abdominal pain or vomiting. What is the most appropriate initial management?', 
'["Advise a strict low-carbohydrate diet and follow up in 1 month", "Prescribe oral Metformin", "Initiate subcutaneous insulin therapy immediately", "Order an oral glucose tolerance test"]'::jsonb, 
2, 
'This child has classic symptoms of new-onset Type 1 Diabetes Mellitus (T1DM). Because T1DM is characterized by an absolute deficiency of insulin due to autoimmune destruction of pancreatic beta cells, the only effective and life-saving treatment is the immediate initiation of insulin replacement therapy. Metformin and diet alone are ineffective and dangerous in T1DM.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 10-year-old girl with known Type 1 Diabetes is brought to the ER with deep, rapid, sighing respirations (Kussmaul breathing), abdominal pain, vomiting, and altered mental status. Her blood glucose is 450 mg/dL, and her urine is strongly positive for ketones. Her venous pH is 7.1. During the initial management of this crisis, what is the most critical first step before starting continuous intravenous insulin?', 
'["Administer intravenous sodium bicarbonate to correct the acidosis", "Administer a rapid bolus of intravenous potassium", "Administer a large bolus of isotonic intravenous fluids (e.g., 0.9% Normal Saline) to restore intravascular volume", "Administer a subcutaneous bolus of long-acting insulin"]'::jsonb, 
2, 
'This patient is in Diabetic Ketoacidosis (DKA). Patients in DKA are profoundly dehydrated due to osmotic diuresis. The most critical first step in management is aggressive volume expansion with isotonic intravenous fluids (Normal Saline). Intravenous insulin is started only after initial volume resuscitation has begun. Bicarbonate is rarely used and can be dangerous. Potassium must be monitored closely but is usually added to the IV fluids after initial fluid boluses.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A newborn female infant is noted to have ambiguous genitalia with clitoromegaly and labioscrotal fusion. Ultrasound reveals normal uterus and ovaries. By day 5 of life, the infant develops severe vomiting, lethargy, hyponatremia, and hyperkalemia. What is the most likely underlying enzymatic defect?', 
'["21-hydroxylase deficiency", "11-beta-hydroxylase deficiency", "17-alpha-hydroxylase deficiency", "5-alpha-reductase deficiency"]'::jsonb, 
0, 
'This is classic Congenital Adrenal Hyperplasia (CAH) caused by 21-hydroxylase deficiency, the most common form. The enzyme defect blocks the synthesis of cortisol and aldosterone. The lack of cortisol removes negative feedback, increasing ACTH, which shunts precursors into the androgen pathway, causing virilization of female genitalia. The lack of aldosterone causes the life-threatening "salt-wasting" crisis (hyponatremia, hyperkalemia, hypovolemia) typically presenting in the first 1-2 weeks of life.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A newborn presents with severe microcephaly, microphthalmia, a cleft lip and palate, and postaxial polydactyly (extra digits). Echocardiography reveals a severe congenital heart defect. The infant dies shortly after birth. What is the most likely chromosomal abnormality?', 
'["Trisomy 13 (Patau syndrome)", "Trisomy 18 (Edwards syndrome)", "Trisomy 21 (Down syndrome)", "Monosomy X (Turner syndrome)"]'::jsonb, 
0, 
'Trisomy 13 (Patau syndrome) is characterized by severe midline defects. The classic triad includes microphthalmia (or anophthalmia), cleft lip/palate, and postaxial polydactyly. It is also associated with holoprosencephaly and severe cardiac defects. Most infants do not survive past the first year of life.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A newborn is noted to have micrognathia, low-set ears, a prominent occiput, and clenched hands with overlapping fingers (index over middle, pinky over ring). The infant also has "rocker-bottom" feet and a ventricular septal defect. What is the diagnosis?', 
'["Trisomy 13 (Patau syndrome)", "Trisomy 18 (Edwards syndrome)", "Trisomy 21 (Down syndrome)", "Cri-du-chat syndrome"]'::jsonb, 
1, 
'This is the classic presentation of Trisomy 18 (Edwards syndrome). Hallmark physical findings include the prominently overlapping fingers (clenched fists), rocker-bottom feet, a prominent occiput, micrognathia, and severe congenital heart disease. Like Trisomy 13, it is usually fatal within the first year of life.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An infant is born at 39 weeks gestation. At 1 minute of life, the infant has a heart rate of 110 bpm, exhibits a weak cry with slow, irregular respirations, actively moves all extremities, pulls away when suctioned, and is completely pink. What is the infant''s 1-minute Apgar score?', 
'["6", "7", "8", "9"]'::jsonb, 
2, 
'The Apgar score (0-10) is calculated based on 5 parameters (0-2 points each): Appearance (pink all over = 2), Pulse (>100 bpm = 2), Grimace (pulls away to suction = 2), Activity (active motion = 2), and Respiration (weak cry/slow irregular = 1). Total: 2 + 2 + 2 + 2 + 1 = 8.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A premature infant born at 28 weeks gestation develops severe respiratory distress, grunting, flaring, and cyanosis shortly after birth. A chest X-ray shows a diffuse "ground-glass" reticulonodular appearance with air bronchograms. What is the primary underlying pathophysiology of this condition?', 
'["Aspiration of meconium during delivery", "Delayed resorption of fetal lung fluid", "Deficiency of pulmonary surfactant", "Congenital diaphragmatic hernia"]'::jsonb, 
2, 
'This infant has Neonatal Respiratory Distress Syndrome (RDS), also known as Hyaline Membrane Disease. It is caused by a deficiency of pulmonary surfactant, which is normally produced by Type II pneumocytes. Lack of surfactant increases alveolar surface tension, leading to widespread alveolar collapse (atelectasis), represented by the "ground-glass" appearance on X-ray. It is the most common cause of respiratory distress in premature infants.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A full-term infant delivered via an uncomplicated, elective Cesarean section develops tachypnea (respiratory rate 80/min) shortly after birth. The infant has no significant retractions or cyanosis. A chest X-ray shows prominent perihilar streaking and fluid in the interlobar fissures, but clear lungs otherwise. The symptoms resolve completely with supportive oxygen over the next 24 hours. What is the diagnosis?', 
'["Neonatal Respiratory Distress Syndrome (RDS)", "Meconium Aspiration Syndrome", "Transient Tachypnea of the Newborn (TTN)", "Neonatal Sepsis"]'::jsonb, 
2, 
'Transient Tachypnea of the Newborn (TTN) is caused by the delayed resorption and clearance of fetal lung fluid. It is most common in full-term or late-preterm infants delivered by C-section (since they bypass the "vaginal squeeze" and the labor-induced hormonal changes that help clear lung fluid). It is a benign, self-limiting condition that resolves quickly with supportive care.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-week-old premature infant (born at 26 weeks gestation) who was recently started on enteral formula feeds suddenly develops abdominal distension, bilious vomiting, and bloody stools. The infant appears lethargic and toxic. An abdominal X-ray reveals pneumatosis intestinalis. What is the diagnosis?', 
'["Intussusception", "Volvulus", "Necrotizing Enterocolitis (NEC)", "Hirschsprung disease"]'::jsonb, 
2, 
'Necrotizing Enterocolitis (NEC) is a life-threatening GI emergency that primarily affects premature infants in the NICU. It typically occurs after the introduction of enteral feeds (formula > breast milk). The classic pathognomonic X-ray finding is pneumatosis intestinalis (air within the bowel wall), caused by gas-producing bacteria invading the ischemic bowel tissue. Treatment involves bowel rest, IV antibiotics, and often emergency surgery.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Which congenital heart defect is the most common overall, and is classically characterized by a harsh, holosystolic murmur best heard at the left lower sternal border?', 
'["Atrial Septal Defect (ASD)", "Ventricular Septal Defect (VSD)", "Patent Ductus Arteriosus (PDA)", "Coarctation of the Aorta"]'::jsonb, 
1, 
'Ventricular Septal Defect (VSD) is the most common congenital heart defect. A small to moderate VSD produces a loud, harsh, holosystolic murmur at the left lower sternal border due to the high-pressure gradient between the left and right ventricles during systole. Small VSDs often close spontaneously.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'During a routine exam of an asymptomatic 4-year-old child, the physician hears a widely split and "fixed" second heart sound (S2) along with a soft systolic ejection murmur at the left upper sternal border. What is the most likely underlying cardiac defect?', 
'["Ventricular Septal Defect (VSD)", "Atrial Septal Defect (ASD)", "Tetralogy of Fallot", "Aortic Stenosis"]'::jsonb, 
1, 
'A widely split and fixed S2 is the pathognomonic auscultatory finding for an Atrial Septal Defect (ASD). The continuous left-to-right shunt across the atria increases the volume of blood in the right ventricle, causing a delayed closure of the pulmonic valve that does not change with respiration. The murmur itself is not from the ASD, but from the increased flow across the normal pulmonic valve.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A premature infant is noted to have a continuous, "machinery-like" murmur loudest at the left infraclavicular area. The infant also has bounding peripheral pulses and a widened pulse pressure. Which medication can be administered to attempt pharmacological closure of this defect?', 
'["Prostaglandin E1 (Alprostadil)", "Indomethacin or Ibuprofen", "Spironolactone", "Digoxin"]'::jsonb, 
1, 
'The clinical findings describe a Patent Ductus Arteriosus (PDA). The ductus arteriosus is normally kept open in utero by prostaglandins. To close a PDA pharmacologically in a premature infant, cyclooxygenase (COX) inhibitors like indomethacin or ibuprofen are used to block prostaglandin synthesis. (Conversely, if a ductus-dependent congenital heart defect is present, Prostaglandin E1 is given to keep it OPEN).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 6-month-old infant is brought to the ER by panicked parents. While crying intensely, the infant suddenly became deeply cyanotic, irritable, and then lethargic. The mother intuitively picked the infant up and pulled his knees to his chest, which seemed to relieve the cyanosis. A chest X-ray shows a "boot-shaped" heart. What is the diagnosis?', 
'["Transposition of the Great Arteries", "Tetralogy of Fallot", "Truncus Arteriosus", "Tricuspid Atresia"]'::jsonb, 
1, 
'This describes a hypercyanotic "Tet spell," characteristic of Tetralogy of Fallot (the most common cyanotic congenital heart defect). The spell is caused by a sudden increase in right ventricular outflow tract obstruction or a drop in systemic vascular resistance, causing a massive right-to-left shunt. Squatting or bringing the knees to the chest increases systemic vascular resistance, forcing more blood back into the pulmonary circulation and relieving the cyanosis. The boot-shaped heart on X-ray is classic.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An 8-year-old boy presents for a sports physical. His blood pressure in his right arm is significantly elevated (140/90). However, pulses in his femoral arteries are weak and delayed compared to his brachial and radial pulses. He sometimes complains of leg pain when running. What is the most likely diagnosis?', 
'["Essential hypertension", "Coarctation of the aorta", "Renal artery stenosis", "Marfan syndrome"]'::jsonb, 
1, 
'This is the classic presentation of Coarctation of the Aorta in an older child or adult. The narrowing of the descending aorta causes upper extremity hypertension (blood pressure is high proximal to the stricture) and lower extremity hypotension (weak/delayed femoral pulses and claudication/pain with exercise distal to the stricture). It is highly associated with Turner syndrome and bicuspid aortic valves.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 15-year-old female high school runner presents with secondary amenorrhea (no menses for 6 months). She is very thin and intensely fears weight gain. She exercises for 3 hours daily. Physical exam reveals lanugo hair on her back and bradycardia. What is the most critical initial laboratory evaluation for this patient?', 
'["Thyroid-stimulating hormone (TSH)", "Comprehensive metabolic panel (CMP) to check electrolytes, especially potassium", "Fasting lipid panel", "Prolactin level"]'::jsonb, 
1, 
'This patient has classic Anorexia Nervosa. The most immediate life-threatening complications of severe anorexia and potential purging behaviors are electrolyte abnormalities, particularly hypokalemia (which can cause fatal cardiac arrhythmias). While checking thyroid function (to rule out other causes of weight change/amenorrhea) and bone density is important, the CMP/electrolytes and an EKG are the most critical acute evaluations.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 3-week-old male infant presents with projectile vomiting and is diagnosed with hypertrophic pyloric stenosis. The parents are anxious for immediate surgery. Why must the surgical pyloromyotomy be delayed?', 
'["The infant must gain at least 1 pound before surgery is safe", "The infant''s metabolic alkalosis and dehydration must be fully corrected first to prevent dangerous apnea associated with anesthesia", "Surgery is not indicated; it should be treated with smooth muscle relaxants", "The infant needs a 5-day course of prophylactic antibiotics first"]'::jsonb, 
1, 
'Hypertrophic pyloric stenosis is a medical emergency first, and a surgical emergency second. The severe hypochloremic, hypokalemic metabolic alkalosis and dehydration must be corrected with IV fluids prior to surgery. Correcting the alkalosis is critical because alkaline blood depresses the respiratory drive. If the infant is placed under general anesthesia while severely alkalotic, they are at very high risk for life-threatening postoperative apnea.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 7-year-old boy presents with a 2-day history of right hip pain and a limp. He refuses to bear weight. He has a fever of 102°F (38.9°C). His peripheral white blood cell count is 16,000/microL, and his ESR is highly elevated. What is the most important next step in management?', 
'["Reassure the parents that this is transient synovitis and prescribe ibuprofen", "Schedule an outpatient MRI for next week", "Immediate ultrasound-guided aspiration of the hip joint for cell count and culture", "Place the child in a hip spica cast"]'::jsonb, 
2, 
'This presentation is highly suspicious for Septic Arthritis of the hip, a true orthopedic emergency. The Kocher criteria (fever, inability to bear weight, elevated ESR, elevated WBC) strongly predict septic arthritis over transient synovitis. Immediate joint aspiration is required for definitive diagnosis (culture/stain) and to relieve pressure to prevent ischemic necrosis of the femoral head. Empirical IV antibiotics should be started immediately after the tap.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A full-term infant is noted to be severely cyanotic immediately after birth. The cyanosis does NOT improve with the administration of 100% oxygen. A chest X-ray shows an "egg-on-a-string" appearance of the cardiac silhouette. What is the diagnosis, and what is the immediate life-saving medical intervention required?', 
'["Tetralogy of Fallot; administer oxygen and morphine", "Transposition of the Great Arteries; start an intravenous infusion of Prostaglandin E1", "Coarctation of the aorta; start labetalol", "Truncus arteriosus; administer indomethacin"]'::jsonb, 
1, 
'This is Transposition of the Great Arteries (TGA). The aorta arises from the right ventricle and the pulmonary artery from the left, creating two parallel, unmixed circulations. This is incompatible with life unless there is mixing of blood (via an ASD, VSD, or PDA). The administration of 100% oxygen fails to raise systemic PaO2 because oxygenated blood simply returns to the lungs. The immediate life-saving intervention is an IV infusion of Prostaglandin E1 (Alprostadil) to keep the ductus arteriosus open and allow blood mixing until surgical correction (arterial switch) can be performed. The "egg-on-a-string" X-ray is classic.')

;
