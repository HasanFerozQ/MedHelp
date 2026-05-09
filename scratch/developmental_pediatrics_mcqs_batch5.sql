-- Batch 5: 30 Developmental Pediatrics MCQs (Questions 121-150)
-- Topic: Common Pediatric Conditions (Respiratory, GI, MSK, GU) affecting growth and development

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-year-old child with a barking cough and inspiratory stridor at rest is diagnosed with moderate Croup. What is the most appropriate initial pharmacological treatment?', 
'["Oral amoxicillin", "A single dose of oral or intramuscular dexamethasone", "Albuterol nebulizer", "Over-the-counter cough syrup"]'::jsonb, 
1, 
'The mainstay of treatment for Croup (laryngotracheobronchitis) is corticosteroids to reduce subglottic inflammation. A single dose of oral, IM, or IV dexamethasone is indicated for all children with croup, regardless of severity. If the child has stridor at rest, nebulized racemic epinephrine is also administered for immediate, temporary relief while the steroid takes effect.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An 8-month-old infant born prematurely at 28 weeks gestation presents in December with a 3-day history of rhinorrhea and a low-grade fever, which has progressed to tachypnea, wheezing, and intercostal retractions. What is the most likely viral pathogen?', 
'["Influenza A", "Rhinovirus", "Respiratory Syncytial Virus (RSV)", "Adenovirus"]'::jsonb, 
2, 
'This is the classic presentation of acute bronchiolitis, a lower respiratory tract infection affecting infants primarily in the winter months. Respiratory Syncytial Virus (RSV) is by far the most common etiology. Premature infants are at significantly higher risk for severe RSV disease requiring hospitalization.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Which monoclonal antibody is used prophylactically during the winter season to prevent severe RSV disease in high-risk infants (e.g., premature infants, those with significant congenital heart disease)?', 
'["Omalizumab", "Palivizumab", "Infliximab", "Rituximab"]'::jsonb, 
1, 
'Palivizumab (Synagis) is an RSV-specific monoclonal antibody administered as a monthly intramuscular injection during the RSV season to prevent severe lower respiratory tract disease in specific high-risk pediatric populations. (Note: Nirsevimab is a newer, long-acting option recently approved).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 4-week-old firstborn male infant presents with a 1-week history of worsening, forceful, projectile vomiting immediately after feeds. The emesis is non-bilious. The infant is always hungry after vomiting. On physical exam, a firm, olive-shaped mass is palpated in the right upper quadrant. What acid-base disturbance is most expected?', 
'["Hyperchloremic metabolic acidosis", "Hypochloremic, hypokalemic metabolic alkalosis", "Respiratory acidosis", "Normal anion gap metabolic acidosis"]'::jsonb, 
1, 
'This is the classic presentation of Hypertrophic Pyloric Stenosis. The persistent, forceful vomiting of gastric contents (which are rich in hydrochloric acid and potassium) leads to a profound loss of acid and chloride. The kidneys attempt to conserve volume by trading potassium for sodium, leading to the classic hypochloremic, hypokalemic metabolic alkalosis.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An 8-month-old healthy infant suddenly develops episodes of severe, crampy abdominal pain. During the episodes, the infant cries inconsolably and draws his legs up to his chest. Between episodes, the infant appears completely normal. He later passes a stool that resembles "currant jelly." What is the most appropriate initial diagnostic and therapeutic step?', 
'["Air or contrast enema", "Exploratory laparotomy", "Upper GI series with barium", "Abdominal CT scan"]'::jsonb, 
0, 
'This is the classic presentation of intussusception (telescoping of the bowel). The sudden, severe, colicky pain in an infant, alternating with periods of calm, and the passage of "currant jelly" stool (blood and mucus) are pathognomonic. An air (pneumatic) or contrast enema is both the diagnostic test of choice and the primary therapeutic intervention, as the pressure of the enema often reduces the intussusception.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-year-old boy presents with painless, massive lower gastrointestinal bleeding. He is otherwise completely asymptomatic. A radionuclide scan utilizing 99mTc-pertechnetate shows an area of focal uptake in the right lower quadrant. What is the most likely diagnosis?', 
'["Acute appendicitis", "Meckel''s diverticulum", "Crohn''s disease", "Celiac disease"]'::jsonb, 
1, 
'Meckel''s diverticulum is the most common congenital anomaly of the GI tract. It classically presents in young children (often around age 2) with painless, significant lower GI bleeding (melena or hematochezia). The bleeding is caused by ulceration of the adjacent normal bowel by acid secreted from ectopic gastric mucosa within the diverticulum. A Meckel''s scan (99mTc-pertechnetate) specifically detects this ectopic gastric tissue.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A newborn fails to pass meconium within the first 48 hours of life and develops abdominal distension and bilious vomiting. A contrast enema reveals a narrow distal rectum with a dilated proximal segment. A suction rectal biopsy shows an absence of ganglion cells in the submucosal and myenteric plexuses. What is the diagnosis?', 
'["Cystic fibrosis (Meconium ileus)", "Hirschsprung disease", "Duodenal atresia", "Intussusception"]'::jsonb, 
1, 
'Hirschsprung disease (congenital aganglionic megacolon) is caused by the failure of neural crest cells to migrate to the distal colon during fetal development, resulting in an aganglionic segment that remains tonically contracted and causes a functional obstruction. Diagnosis requires a rectal suction biopsy showing the absence of ganglion cells.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 6-month-old female infant presents with a fever of 103°F (39.4°C) without any localizing signs (no cough, no rhinorrhea, normal ear exam). What is the most important diagnostic test to perform?', 
'["Chest X-ray", "Lumbar puncture", "Urinalysis and urine culture obtained by catheterization", "Blood culture alone"]'::jsonb, 
2, 
'A Urinary Tract Infection (UTI) is the most common serious bacterial infection in infants presenting with fever without a localizing source. In infants under 1-2 years, UTIs often lack specific urinary symptoms. The most critical step is to obtain a urinalysis and a sterile urine culture (via catheterization or suprapubic aspiration, NOT a bagged specimen) to diagnose the UTI and guide antibiotic therapy.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 3-year-old girl has had two culture-proven febrile urinary tract infections. A renal and bladder ultrasound (RBUS) was normal. What imaging study is recommended to evaluate for Vesicoureteral Reflux (VUR)?', 
'["Voiding cystourethrogram (VCUG)", "Non-contrast abdominal CT", "Dimercaptosuccinic acid (DMSA) renal scan", "Intravenous pyelogram (IVP)"]'::jsonb, 
0, 
'A Voiding Cystourethrogram (VCUG) is the gold standard study to diagnose and grade Vesicoureteral Reflux (VUR), a condition where urine flows backwards from the bladder into the ureters/kidneys, predisposing the child to recurrent pyelonephritis and renal scarring. It is typically indicated after a second febrile UTI in a young child, or after a first UTI if the renal ultrasound is abnormal.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'During the newborn examination of a female infant born in the breech presentation, the pediatrician performs the Ortolani and Barlow maneuvers. The Ortolani maneuver elicits a palpable "clunk." What does this finding indicate?', 
'["A normal hip joint", "A fractured femur", "Developmental Dysplasia of the Hip (DDH)", "A slipped capital femoral epiphysis"]'::jsonb, 
2, 
'A palpable "clunk" (not just a high-pitched click) during the Ortolani maneuver (abduction and anterior elevation of the femur) indicates that a dislocated hip has been successfully reduced back into the acetabulum. This confirms the diagnosis of Developmental Dysplasia of the Hip (DDH). Breech presentation and female sex are major risk factors. The Barlow maneuver attempts to dislocate an unstable hip.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'What is the preferred imaging modality to evaluate for Developmental Dysplasia of the Hip (DDH) in a 1-month-old infant with a positive family history?', 
'["AP pelvis X-ray", "Hip Ultrasound", "Hip MRI", "CT scan of the pelvis"]'::jsonb, 
1, 
'Ultrasound is the preferred imaging modality for evaluating DDH in infants younger than 4 to 6 months. This is because the infant hip is primarily composed of cartilage, which is radiolucent and not visible on standard X-rays. X-rays become the preferred modality only after the femoral head ossification centers appear (around 4-6 months of age).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 6-year-old boy presents with a painless limp that has progressively worsened over the past month. He occasionally complains of an aching pain in his groin and anterior thigh. He has no fever and no history of trauma. Physical exam shows decreased internal rotation and abduction of the right hip. Radiographs show sclerosis and flattening of the right femoral head. What is the most likely diagnosis?', 
'["Septic arthritis", "Transient synovitis", "Legg-Calvé-Perthes disease", "Slipped capital femoral epiphysis (SCFE)"]'::jsonb, 
2, 
'Legg-Calvé-Perthes disease is idiopathic avascular necrosis (osteonecrosis) of the femoral head. It classically affects boys between 4 and 10 years of age. It presents insidiously with a painless (or mildly painful) limp and restricted hip mobility. Transient synovitis is painful, acute, and typically follows a viral infection. SCFE typically affects obese adolescents.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 13-year-old male who plays competitive soccer presents with anterior knee pain. The pain is worse when running or jumping. Physical exam reveals exquisite tenderness and swelling over the tibial tubercle. What is the most likely diagnosis?', 
'["Anterior cruciate ligament (ACL) tear", "Patellofemoral pain syndrome", "Osgood-Schlatter disease", "Osteosarcoma"]'::jsonb, 
2, 
'Osgood-Schlatter disease (traction apophysitis of the tibial tubercle) is a common cause of knee pain in active, growing adolescents. Repeated tension from the patellar tendon on the unossified tibial tubercle during growth spurts causes inflammation and microavulsions. Treatment is conservative (rest, ice, NSAIDs, continuation of sports as tolerated).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 14-year-old girl presents for a routine physical. Examination of her back while she bends forward at the waist (Adams forward bend test) reveals a prominent right thoracic rib hump. What is the next most appropriate step in evaluating this suspected scoliosis?', 
'["Immediate referral for spinal fusion surgery", "Prescribe a rigid back brace", "Obtain standing PA and lateral full-spine radiographs", "Reassure the patient that it will correct itself with time"]'::jsonb, 
2, 
'The Adams forward bend test is a screening maneuver for scoliosis. A rib hump indicates rotational deformity of the spine. The next appropriate step to definitively diagnose and quantify the degree of curvature (the Cobb angle) is to obtain standing PA and lateral full-length radiographs of the spine.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'According to the standard CDC immunization schedule, which of the following vaccines is given as a single dose at birth before hospital discharge?', 
'["Hepatitis B", "Rotavirus", "DTaP", "MMR"]'::jsonb, 
0, 
'The Hepatitis B vaccine is the only routine childhood vaccine given at birth. The first dose is administered within 24 hours of birth to prevent perinatal transmission of the virus. Rotavirus and DTaP are typically started at 2 months. MMR is a live-attenuated vaccine typically given at 12-15 months.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Which of the following vaccines are contraindicated in an infant with severe combined immunodeficiency (SCID)?', 
'["DTaP and IPV", "Hepatitis B and Hib", "MMR, Varicella, and Rotavirus", "Pneumococcal conjugate (PCV15)"]'::jsonb, 
2, 
'Live-attenuated vaccines are contraindicated in patients with severe cellular immunodeficiency (like SCID) due to the risk of the vaccine strain causing unchecked, severe disease. The routine pediatric live vaccines are MMR (Measles, Mumps, Rubella), Varicella, and Rotavirus. Killed/inactivated vaccines (like DTaP, IPV, HepB) are safe, though they may elicit a suboptimal immune response.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 6-year-old child presents with a 4-day history of high fever, cough, coryza (runny nose), and conjunctivitis. On examination of the oral mucosa, the physician notes small, irregular white spots with erythematous bases on the buccal mucosa opposite the molars. What is the likely diagnosis, and what type of rash is expected to appear next?', 
'["Rubella; descending maculopapular rash", "Measles (Rubeola); descending maculopapular rash", "Roseola; rash appears as the fever resolves", "Scarlet fever; sandpaper-like rash"]'::jsonb, 
1, 
'This is the classic prodrome of Measles (Rubeola), characterized by the "3 Cs" (Cough, Coryza, Conjunctivitis) and Koplik spots (the pathognomonic white spots on the buccal mucosa). A few days later, a maculopapular rash typically begins on the face and spreads downward over the body.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An unimmunized 15-year-old male presents with a low-grade fever, headache, and bilateral, tender swelling of the parotid glands. The physician is concerned about complications of this viral infection. What is the most common complication of this disease in postpubertal males?', 
'["Orchitis", "Meningitis", "Deafness", "Pancreatitis"]'::jsonb, 
0, 
'The patient has Mumps, caused by a paramyxovirus. In postpubertal males, the most common significant complication is orchitis (inflammation of the testicles), which occurs in up to 30% of cases. It is extremely painful and can rarely lead to sterility. Other complications include aseptic meningitis and, historically, deafness.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An 8-year-old child presents with a "slapped-cheek" appearance (bright red erythema on the cheeks) followed by a lacy, reticular maculopapular rash on the trunk and extremities. The child is otherwise acting well. What is the causative agent of this illness?', 
'["Human Herpesvirus 6 (HHV-6)", "Parvovirus B19", "Group A Streptococcus", "Coxsackievirus A16"]'::jsonb, 
1, 
'This is Erythema Infectiosum (Fifth Disease), caused by Parvovirus B19. The classic presentation is the "slapped-cheek" rash followed by a lacy, reticular rash on the body. It is generally a mild illness in healthy children. However, it can cause transient aplastic crisis in patients with sickle cell disease and hydrops fetalis in pregnant women.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 9-month-old infant abruptly develops a high fever of 104°F (40°C) that lasts for 3 days. The infant appears surprisingly well despite the fever. On the fourth day, the fever suddenly breaks, and immediately a pink, maculopapular rash appears on the trunk and spreads to the extremities. What is the diagnosis?', 
'["Measles", "Rubella", "Roseola infantum", "Erythema infectiosum"]'::jsonb, 
2, 
'This is the classic presentation of Roseola infantum (Exanthem subitum), caused primarily by Human Herpesvirus 6 (HHV-6). The hallmark is 3-5 days of high fever, followed by the abrupt resolution of the fever and the simultaneous appearance of a rose-pink rash. It is a very common cause of febrile seizures in infants.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-year-old boy presents with a 6-day history of high fever unresponsive to antipyretics. Exam reveals bilateral non-exudative conjunctival injection, cracked red lips, a "strawberry tongue," cervical lymphadenopathy, and a polymorphous rash on his trunk. He also has erythema and edema of his hands and feet. What is the most critical complication of this disease that requires immediate evaluation and treatment?', 
'["Coronary artery aneurysms", "Rheumatic mitral valve disease", "Acute glomerulonephritis", "Sensorineural hearing loss"]'::jsonb, 
0, 
'The patient meets the clinical criteria for Kawasaki Disease (mucocutaneous lymph node syndrome), an acute systemic vasculitis. The most feared and critical complication is the development of coronary artery aneurysms, which can lead to myocardial infarction and sudden death. An echocardiogram is mandatory. Treatment is intravenous immunoglobulin (IVIG) and high-dose aspirin to prevent aneurysm formation.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 10-year-old girl presents with chorea (rapid, involuntary movements), migratory polyarthritis, and a new heart murmur. She had a severe sore throat 3 weeks ago that was untreated. What is the underlying pathogenesis of her current condition?', 
'["Direct viral invasion of the myocardium and basal ganglia", "An autoimmune, post-infectious molecular mimicry response to Group A Streptococcus", "A toxic-mediated effect from a Staphylococcal infection", "A type III hypersensitivity reaction causing immune complex deposition"]'::jsonb, 
1, 
'This is Acute Rheumatic Fever (ARF), a delayed, non-suppurative complication of untreated Group A Streptococcal (GAS) pharyngitis. The pathogenesis is molecular mimicry: antibodies produced against the streptococcal M protein cross-react with antigens in the human heart (causing endocarditis/valvulitis), joints (arthritis), skin, and basal ganglia (Sydenham chorea).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 4-year-old girl presents with intense perianal itching, especially at night. Her mother noticed tiny, white, thread-like worms near her anus while she was sleeping. What is the most appropriate treatment for this infection?', 
'["Topical hydrocortisone cream", "Oral albendazole or pyrantel pamoate", "Oral amoxicillin", "Oral fluconazole"]'::jsonb, 
1, 
'This is an infection with Enterobius vermicularis (pinworm). The adult female worms migrate to the perianal area at night to lay eggs, causing intense pruritus. Diagnosis is often made via the "Scotch tape test." The treatment of choice is an antihelminthic agent like oral albendazole, mebendazole, or pyrantel pamoate. The entire household should be treated simultaneously, as it is highly contagious.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An infant is exclusively fed goat''s milk without any supplements. What nutritional deficiency anemia is this child at the highest risk for developing?', 
'["Iron deficiency anemia", "Vitamin B12 deficiency anemia", "Folate (Vitamin B9) deficiency anemia", "Vitamin C deficiency anemia (Scurvy)"]'::jsonb, 
2, 
'Goat''s milk is notoriously deficient in folate (Vitamin B9). Infants fed exclusively unfortified goat''s milk are at high risk of developing a megaloblastic anemia due to folate deficiency. They are also at risk for iron deficiency (as goat''s milk, like cow''s milk, is low in iron), but the folate deficiency is the classic "goat milk" association.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 14-month-old African American toddler is evaluated for severe dactylitis (painful swelling of the hands and feet). Laboratory testing confirms a diagnosis of Sickle Cell Disease (HbSS). Which of the following encapsulated bacteria poses the greatest risk of fatal sepsis in this child due to functional asplenia?', 
'["Staphylococcus aureus", "Streptococcus pneumoniae", "Escherichia coli", "Pseudomonas aeruginosa"]'::jsonb, 
1, 
'Children with Sickle Cell Disease develop functional asplenia (autosplenectomy) early in childhood due to recurrent splenic infarctions. This makes them extremely susceptible to overwhelming sepsis from encapsulated organisms. Streptococcus pneumoniae is the most common and deadly pathogen in this group, which is why prophylactic daily penicillin and robust pneumococcal vaccinations are mandatory.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 4-year-old boy presents with sudden onset of diffuse petechiae and purpura on his legs. He had a mild viral upper respiratory infection 2 weeks ago. He is active and appears completely well. His physical exam is normal except for the bruising; there is no hepatosplenomegaly or lymphadenopathy. A CBC shows a platelet count of 15,000/microL, with a normal hemoglobin and white blood cell count. What is the most likely diagnosis?', 
'["Acute Lymphoblastic Leukemia (ALL)", "Aplastic anemia", "Immune Thrombocytopenic Purpura (ITP)", "Thrombotic Thrombocytopenic Purpura (TTP)"]'::jsonb, 
2, 
'This is a classic presentation of primary Immune Thrombocytopenic Purpura (ITP). It typically occurs in children aged 2-5 years, often 1-4 weeks after a viral illness. The pathogenesis is autoimmune destruction of platelets. The isolated severe thrombocytopenia in an otherwise well-appearing child without hepatosplenomegaly or systemic symptoms strongly points to ITP. ALL would typically present with other cytopenias, bone pain, and organomegaly.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'What is the most common childhood cancer, classically presenting with fever, pallor, bone pain, bruising, and hepatosplenomegaly, and showing lymphoblasts on a peripheral blood smear?', 
'["Acute Myeloid Leukemia (AML)", "Acute Lymphoblastic Leukemia (ALL)", "Hodgkin Lymphoma", "Neuroblastoma"]'::jsonb, 
1, 
'Acute Lymphoblastic Leukemia (ALL) is the most common malignancy in childhood, accounting for about 25% of all pediatric cancers. It peaks between ages 2 and 5. The infiltration of the bone marrow by leukemic lymphoblasts leads to failure of normal hematopoiesis, causing anemia (pallor), thrombocytopenia (bruising), and neutropenia (fever/infection), along with bone pain and organomegaly.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-year-old child presents with a firm, irregular abdominal mass that crosses the midline. The child also has periorbital ecchymoses ("raccoon eyes") and hypertension. Urine tests show elevated levels of homovanillic acid (HVA) and vanillylmandelic acid (VMA). What is the most likely diagnosis?', 
'["Wilms tumor (Nephroblastoma)", "Neuroblastoma", "Hepatoblastoma", "Pheochromocytoma"]'::jsonb, 
1, 
'This is the classic presentation of a Neuroblastoma, a malignant tumor of neural crest cell origin (usually arising in the adrenal medulla or sympathetic chain). Key distinguishing features from a Wilms tumor are: neuroblastoma often crosses the midline, patients often appear ill, and it frequently metastasizes to the bone/orbit (causing "raccoon eyes"). It secretes catecholamines, leading to elevated urine HVA and VMA.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 3-year-old boy presents with a smooth, firm, unilateral abdominal mass that was discovered incidentally by his mother while bathing him. The child is asymptomatic, playful, and normotensive. The mass does not cross the midline. What is the most likely diagnosis?', 
'["Neuroblastoma", "Wilms tumor (Nephroblastoma)", "Polycystic kidney disease", "Hydronephrosis"]'::jsonb, 
1, 
'This presentation is classic for a Wilms tumor (nephroblastoma), the most common primary renal malignancy in childhood. It typically presents as an asymptomatic, smooth, firm abdominal mass that rarely crosses the midline. Patients are usually generally healthy-appearing. It is associated with WAGR syndrome and Beckwith-Wiedemann syndrome.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 5-year-old boy presents with abrupt onset of severe generalized edema (anasarca), including periorbital edema and ascites. Urinalysis shows 4+ protein but no red blood cells. Serum albumin is very low, and cholesterol is elevated. What is the most likely underlying pathology, and what is the standard first-line treatment?', 
'["Minimal Change Disease; treat with oral corticosteroids", "Post-streptococcal glomerulonephritis; treat with antibiotics", "IgA Nephropathy; treat with ACE inhibitors", "Hemolytic Uremic Syndrome; treat with plasmapheresis"]'::jsonb, 
0, 
'This is classic Nephrotic Syndrome. In children aged 2-6 years, the overwhelming majority (approx 90%) of idiopathic nephrotic syndrome cases are caused by Minimal Change Disease (MCD). It is characterized by massive proteinuria, hypoalbuminemia, and severe edema. The standard, highly effective first-line treatment for pediatric MCD is a prolonged course of oral corticosteroids (prednisone).')

;
