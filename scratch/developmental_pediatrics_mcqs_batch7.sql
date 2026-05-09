-- Batch 7: 30 Developmental Pediatrics MCQs (Questions 181-210)
-- Topic: Gastroenterology, Endocrinology, and Metabolic Disorders

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-year-old girl is evaluated for chronic diarrhea, foul-smelling stools, abdominal distension, and poor weight gain (failure to thrive). She was introduced to solid foods at 6 months of age, including wheat cereal. Laboratory tests show iron deficiency anemia. What is the most appropriate initial screening test for the suspected diagnosis?', 
'["Sweat chloride test", "Tissue transglutaminase IgA antibody (tTG-IgA) test", "Colonoscopy", "Stool culture for ova and parasites"]'::jsonb, 
1, 
'This is a classic presentation of Celiac Disease (gluten-sensitive enteropathy). Symptoms typically begin after the introduction of gluten-containing foods (wheat, rye, barley). The malabsorption leads to diarrhea, failure to thrive, and nutrient deficiencies (like iron deficiency anemia). The best initial screening test is measuring IgA antibodies to tissue transglutaminase (tTG-IgA) while the child is on a gluten-containing diet. Total IgA must also be measured to ensure the child is not IgA deficient.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An infant frequently spits up large amounts of milk after every feeding but is growing normally along the 50th percentile, is happy, and has no respiratory symptoms. The parents are concerned. What is the most appropriate management?', 
'["Prescribe a proton pump inhibitor (PPI)", "Perform an upper GI series", "Reassure the parents that this is physiologic gastroesophageal reflux and recommend conservative measures (e.g., upright positioning after feeds, smaller volume feeds)", "Schedule an endoscopy"]'::jsonb, 
2, 
'This is physiologic Gastroesophageal Reflux (GER) ("happy spitter"). It is extremely common in infants due to an immature lower esophageal sphincter. As long as the infant is gaining weight normally and has no complications (respiratory issues, severe irritability, hematemesis), it is a benign condition that typically resolves spontaneously by 12-18 months. Medical therapy (PPIs, H2 blockers) is NOT indicated for uncomplicated, physiologic GER.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A newborn infant has copious oral secretions and immediately chokes, coughs, and becomes cyanotic upon the first attempt at feeding. A nasogastric tube cannot be passed into the stomach and coils in the upper esophagus. An X-ray shows the coiled tube and a large amount of air in the stomach and intestines. What is the diagnosis?', 
'["Isolated esophageal atresia without a fistula", "Esophageal atresia with a distal tracheoesophageal fistula (TEF)", "Congenital diaphragmatic hernia", "Pyloric stenosis"]'::jsonb, 
1, 
'This is the classic presentation of esophageal atresia with a distal tracheoesophageal fistula, the most common type of TEF. The esophageal atresia prevents swallowing (causing copious secretions and coiled NG tube). The distal fistula connects the trachea to the lower esophagus/stomach, allowing air to enter the GI tract (visible on X-ray) and risking severe aspiration pneumonia from gastric acid moving upward into the lungs.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 4-week-old infant who appeared normal at birth presents with worsening jaundice, dark urine, and pale (acholic) stools. Laboratory tests show a significantly elevated direct (conjugated) bilirubin. An ultrasound shows an absent or abnormal gallbladder. What is the most critical diagnosis to confirm quickly to optimize surgical outcomes?', 
'["Breast milk jaundice", "Biliary Atresia", "Neonatal hepatitis", "Crigler-Najjar syndrome"]'::jsonb, 
1, 
'This is the classic presentation of Biliary Atresia, a progressive, idiopathic fibro-obliterative disease of the extrahepatic biliary tree. It presents in the first few weeks of life with conjugated hyperbilirubinemia, acholic stools, and dark urine. It is a surgical emergency. The Kasai procedure (hepatoportoenterostomy) must be performed ideally before 8 weeks of age to re-establish bile flow; delay significantly increases the risk of irreversible liver cirrhosis and the need for a liver transplant.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 10-year-old girl is evaluated for short stature and a slowing growth velocity. Over the past 2 years, her weight percentiles have steadily increased (now >95th percentile), while her height percentiles have dropped (now <5th percentile). She complains of fatigue, constipation, and feeling cold. Her school performance has declined. What is the most likely diagnosis?', 
'["Constitutional delay of growth and puberty", "Acquired Hypothyroidism (e.g., Hashimoto thyroiditis)", "Growth Hormone Deficiency", "Cushing Syndrome"]'::jsonb, 
1, 
'This pattern of growth—decreasing height velocity coupled with increasing weight (obesity)—is the hallmark of an acquired endocrine disorder, most commonly Acquired Hypothyroidism (Hashimoto thyroiditis is the most common cause in this age group). Other classic symptoms include fatigue, cold intolerance, constipation, and bradycardia. Growth hormone deficiency also causes short stature with increased fat mass, but hypothyroidism is more common and presents with the other systemic symptoms.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 6-year-old girl presents with the development of breast tissue and pubic hair. Her bone age is significantly advanced (read as 9 years old). Laboratory testing shows high basal luteinizing hormone (LH) and follicle-stimulating hormone (FSH) levels. What is the diagnosis, and what is the preferred treatment to prevent premature epiphyseal closure and short adult stature?', 
'["Central precocious puberty; treat with a GnRH agonist (e.g., leuprolide)", "Peripheral precocious puberty; treat with an aromatase inhibitor", "Premature thelarche; reassure and observe", "Congenital Adrenal Hyperplasia; treat with hydrocortisone"]'::jsonb, 
0, 
'This patient has Central Precocious Puberty (GnRH-dependent). The hypothalamic-pituitary-gonadal axis has activated prematurely, evidenced by high LH/FSH and advanced bone age. Because continuous, non-pulsatile administration of GnRH downregulates the GnRH receptors on the pituitary (stopping LH/FSH release), a long-acting GnRH agonist (like leuprolide) is the treatment of choice to halt puberty and allow the child to reach a normal adult height.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 4-year-old boy presents with premature development of pubic hair, axillary odor, and acne, but his testicles are prepubertal in volume (small). His bone age is advanced. His LH and FSH levels are very low and do not increase with a GnRH stimulation test. What is the most likely category of his condition?', 
'["Central precocious puberty", "Peripheral precocious puberty (GnRH-independent)", "Constitutional delay of puberty", "Normal variant (premature adrenarche)"]'::jsonb, 
1, 
'This is Peripheral Precocious Puberty. The source of the androgens is not the testicles (which are small and unstimulated by the pituitary), but rather the adrenal glands (e.g., a late-onset Congenital Adrenal Hyperplasia, or an adrenal tumor) or exogenous exposure. The high peripheral androgens suppress the pituitary, leading to low LH/FSH levels that do not respond to a GnRH challenge.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 14-year-old boy presents concerned about his lack of pubertal development. He is the shortest boy in his class. His father reports a similar pattern, noting he didn''t have his growth spurt until age 16 and continued growing in college. The patient''s physical exam shows prepubertal testes. His bone age is significantly delayed (read as 11 years). What is the most likely diagnosis?', 
'["Growth hormone deficiency", "Klinefelter syndrome", "Constitutional Delay of Growth and Puberty (CDGP)", "Kallmann syndrome"]'::jsonb, 
2, 
'Constitutional Delay of Growth and Puberty (CDGP), or "late bloomer," is the most common cause of delayed puberty and short stature in boys. Key features include a strong family history of delayed puberty, a current height that is short for their age but appropriate for their delayed bone age, and normal predicted adult height. They will eventually go through puberty and catch up to their peers without treatment.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An infant of Ashkenazi Jewish descent presents at 9 months of age with developmental regression, massive hepatosplenomegaly, and hypotonia. An ophthalmologic exam reveals a cherry-red spot on the macula. A bone marrow biopsy shows lipid-laden macrophages with a "foamy" appearance. What is the most likely diagnosis?', 
'["Tay-Sachs disease", "Niemann-Pick disease (Type A)", "Gaucher disease", "Krabbe disease"]'::jsonb, 
1, 
'This is the classic presentation of Niemann-Pick disease Type A (sphingomyelinase deficiency). It shares neurodegenerative symptoms and the cherry-red spot with Tay-Sachs disease, but the defining difference is the presence of massive hepatosplenomegaly in Niemann-Pick (due to sphingomyelin accumulation in the reticuloendothelial system), which is ABSENT in Tay-Sachs.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 4-year-old child presents with coarse facial features, corneal clouding, hepatosplenomegaly, stiff joints, and severe developmental delay. Laboratory testing reveals a deficiency of the enzyme alpha-L-iduronidase. What is the diagnosis?', 
'["Hunter syndrome", "Hurler syndrome", "Sanfilippo syndrome", "Morquio syndrome"]'::jsonb, 
1, 
'This is Hurler syndrome (Mucopolysaccharidosis Type I). It is an autosomal recessive lysosomal storage disease caused by alpha-L-iduronidase deficiency, leading to heparan and dermatan sulfate accumulation. Classic features include coarse facies, corneal clouding, hepatosplenomegaly, and intellectual disability. (Hunter syndrome, MPS II, is similar but is X-linked recessive and classically LACKS corneal clouding).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 7-year-old boy is evaluated for short stature and bone pain. Examination reveals massive splenomegaly and mild hepatomegaly. X-rays of the femurs show a characteristic "Erlenmeyer flask" deformity at the distal ends. Bone marrow biopsy reveals macrophages resembling "wrinkled tissue paper." What is the diagnosis?', 
'["Gaucher disease", "Niemann-Pick disease", "Sickle cell anemia", "Osteopetrosis"]'::jsonb, 
0, 
'This is Gaucher disease, the most common lysosomal storage disease, caused by a deficiency of glucocerebrosidase. Type 1 (non-neuronopathic) is the most common. It presents with hepatosplenomegaly (spleen > liver), pancytopenia (due to hypersplenism and marrow infiltration), and severe bone disease (pain, avascular necrosis, Erlenmeyer flask deformity). The "wrinkled tissue paper" macrophages are Gaucher cells.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Which of the following is an expected physiological change in the cardiovascular system immediately upon the birth of a healthy full-term infant and the first breath?', 
'["Pulmonary vascular resistance dramatically increases", "Systemic vascular resistance dramatically decreases", "The foramen ovale closes due to increased left atrial pressure", "The ductus arteriosus opens widely"]'::jsonb, 
2, 
'At birth, the first breath expands the lungs and dramatically *decreases* pulmonary vascular resistance. Clamping the umbilical cord removes the low-resistance placenta, dramatically *increasing* systemic vascular resistance. This shift causes blood to flow into the lungs, increasing pulmonary venous return to the left atrium. The pressure in the left atrium then exceeds the pressure in the right atrium, causing the flap of the foramen ovale to snap shut.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A newborn infant has a profoundly scaphoid (sunken) abdomen and severe respiratory distress immediately after birth. Breath sounds are absent on the left side of the chest, and heart sounds are shifted to the right. What is the most critical immediate intervention?', 
'["Perform bag-mask ventilation", "Endotracheal intubation and insertion of a nasogastric/orogastric tube", "Immediate surgical repair in the delivery room", "Administer surfactant via a nebulizer"]'::jsonb, 
1, 
'This is a Congenital Diaphragmatic Hernia (CDH), usually on the left side (Bochdalek hernia). The abdominal organs herniate into the chest in utero, causing severe pulmonary hypoplasia. The immediate intervention is endotracheal intubation to secure the airway and provide ventilation, PLUS insertion of an NG/OG tube to decompress the stomach and intestines. Bag-mask ventilation is absolutely CONTRAINDICATED because it will pump air into the herniated stomach/bowel in the chest, further compressing the hypoplastic lungs and causing a tension physiology.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A full-term infant delivered to a mother with poorly controlled gestational diabetes is large for gestational age (macrosomic). At 2 hours of life, the infant becomes jittery, lethargic, and has a weak cry. What is the most likely metabolic abnormality causing these symptoms?', 
'["Hypercalcemia", "Hyperglycemia", "Hypoglycemia", "Hypernatremia"]'::jsonb, 
2, 
'Infants of diabetic mothers are at high risk for neonatal hypoglycemia. In utero, the maternal hyperglycemia crosses the placenta, stimulating the fetal pancreas to hypertrophy and produce massive amounts of insulin (causing the macrosomia). At birth, the maternal glucose supply is abruptly cut off, but the infant''s hyperinsulinemia persists, rapidly driving blood glucose levels down and causing jitteriness, lethargy, and potentially seizures.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An infant is born via rapid vaginal delivery and is noted to have an asymmetrical Moro reflex. The right arm does not extend and abduct. The infant holds the right arm adducted and internally rotated at the shoulder, extended at the elbow, with the forearm pronated and the wrist flexed (the "waiter''s tip" posture). What is the diagnosis?', 
'["Klumpke palsy", "Erb-Duchenne palsy", "Fractured right clavicle", "Cerebral palsy"]'::jsonb, 
1, 
'This is the classic presentation of Erb-Duchenne palsy (Erb''s palsy), caused by an injury to the upper trunk of the brachial plexus (C5-C6 nerve roots), typically due to shoulder dystocia pulling the neck away from the shoulder during delivery. The "waiter''s tip" posture is pathognomonic. Klumpke palsy involves the lower roots (C8-T1) and presents with a "claw hand" and often Horner syndrome.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-day-old infant develops purulent conjunctivitis with profuse, thick exudate and severe swelling of the eyelids. Gram stain of the discharge reveals Gram-negative intracellular diplococci. What is the most appropriate management to prevent corneal ulceration and blindness?', 
'["Topical erythromycin ointment", "Intravenous or intramuscular Ceftriaxone", "Topical silver nitrate drops", "Oral azithromycin"]'::jsonb, 
1, 
'This infant has Gonococcal Ophthalmia Neonatorum, caused by Neisseria gonorrhoeae. It typically presents aggressively on days 2-5 of life. Because it can rapidly penetrate the intact cornea and cause perforation and blindness, topical therapy is insufficient. It must be treated with systemic antibiotics, typically a single dose of IV or IM Ceftriaxone (or Cefotaxime). Chlamydial conjunctivitis presents later (days 5-14) and is treated with oral macrolides.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 4-week-old infant presents with a harsh, paroxysmal cough followed by an inspiratory "whoop" and post-tussive emesis. The infant has been coughing for two weeks and has occasionally turned blue during spells. The parents are unimmunized. A complete blood count reveals a profound lymphocytosis. What is the most appropriate antibiotic treatment for this infection?', 
'["Amoxicillin", "Ceftriaxone", "Azithromycin (or another Macrolide)", "Doxycycline"]'::jsonb, 
2, 
'This is a classic presentation of Pertussis (Whooping Cough), caused by Bordetella pertussis. The classic CBC finding is a striking lymphocytosis. Macrolides (like azithromycin, clarithromycin, or erythromycin) are the antibiotics of choice. While they may not alter the clinical course if given in the paroxysmal stage, they are critical to eradicate nasopharyngeal carriage and prevent transmission to others.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 7-year-old child from Connecticut presents in the summer with a fever, headache, myalgias, and a large, expanding, erythematous rash on his thigh with central clearing (a "bull''s-eye" appearance). What is the causative organism, and what is the treatment of choice?', 
'["Rickettsia rickettsii; treat with Doxycycline", "Borrelia burgdorferi; treat with Amoxicillin or Doxycycline", "Treponema pallidum; treat with Penicillin G", "Staphylococcus aureus; treat with Cephalexin"]'::jsonb, 
1, 
'This is Lyme disease, caused by the spirochete Borrelia burgdorferi, transmitted by the Ixodes tick. The classic rash is erythema migrans (the bull''s-eye rash). For children under 8 years of age, Amoxicillin is traditionally the treatment of choice to avoid the risk of tooth staining from Doxycycline, though recent AAP guidelines suggest short-course Doxycycline is safe for all ages if needed. For patients >8 years, Doxycycline is preferred.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 10-year-old boy recently returned from a camping trip in North Carolina. He presents with a high fever, severe headache, and a petechial rash that began on his wrists and ankles and is now spreading inward toward his trunk. What is the diagnosis, and what is the treatment of choice?', 
'["Lyme disease; treat with Amoxicillin", "Rocky Mountain Spotted Fever; treat with Doxycycline", "Meningococcemia; treat with Ceftriaxone", "Measles; treat with supportive care"]'::jsonb, 
1, 
'This is the classic presentation of Rocky Mountain Spotted Fever (RMSF), caused by Rickettsia rickettsii. The classic rash begins as maculopapular on the wrists and ankles (involving the palms and soles) and spreads centrally (centripetal spread), eventually becoming petechial. Because RMSF is rapidly fatal if untreated, Doxycycline is the absolute treatment of choice for ALL ages (including children <8 years), as the risk of death far outweighs the risk of dental staining.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-month-old infant presents to the ER with a fever of 102°F (38.9°C), lethargy, and a bulging anterior fontanelle. A lumbar puncture confirms bacterial meningitis. Based on the infant''s age, which three pathogens are the most likely causes?', 
'["Streptococcus pneumoniae, Neisseria meningitidis, Haemophilus influenzae type b", "Group B Streptococcus (GBS), Escherichia coli, Listeria monocytogenes", "Staphylococcus aureus, Pseudomonas aeruginosa, Klebsiella pneumoniae", "Herpes simplex virus, Enterovirus, Cytomegalovirus"]'::jsonb, 
0, 
'After the neonatal period (which is dominated by GBS, E. coli, and Listeria), the most common causes of bacterial meningitis in infants aged 1 month to 2 years are Streptococcus pneumoniae, Neisseria meningitidis, and Haemophilus influenzae type b (though Hib is much less common now due to vaccination). Empirical treatment in this age group is typically IV Ceftriaxone (or Cefotaxime) plus Vancomycin.')

;
