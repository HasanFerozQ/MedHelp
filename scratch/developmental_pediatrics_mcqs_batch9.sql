-- Batch 9: 30 Developmental Pediatrics MCQs (Questions 241-270)
-- Topic: Orthopedics, Toxicology, Emergency Medicine, and Miscellaneous High-Yield Pediatrics

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 12-year-old boy presents with a 2-month history of a dull ache in his left mid-thigh. The pain is persistent, often wakes him up at night, and is worsened by activity. He has a low-grade fever. An X-ray reveals a lytic lesion in the diaphysis of the left femur with an "onion-skin" periosteal reaction. What is the most likely diagnosis?', 
'["Osteosarcoma", "Ewing Sarcoma", "Osteoid Osteoma", "Juvenile Idiopathic Arthritis"]'::jsonb, 
1, 
'This is the classic presentation of Ewing Sarcoma, the second most common malignant bone tumor in children. Unlike osteosarcoma (which occurs in the metaphysis and has a "sunburst" appearance), Ewing sarcoma typically arises in the diaphysis (shaft) of long bones or the pelvis. It is a small round blue cell tumor. The classic X-ray finding is the lamellated or "onion-skin" periosteal reaction caused by the tumor breaking through the cortex and periosteum attempting to lay down new bone.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 16-year-old boy complains of deep, severe pain in his right shin that is worst at night. Interestingly, he notes that taking an over-the-counter ibuprofen or aspirin completely relieves the pain within 30 minutes. An X-ray shows a small (< 2 cm) radiolucent nidus surrounded by thick sclerotic bone in the proximal tibia. What is the diagnosis?', 
'["Osteosarcoma", "Ewing Sarcoma", "Osteoid Osteoma", "Chondroblastoma"]'::jsonb, 
2, 
'Osteoid osteoma is a benign bone-forming tumor that primarily affects adolescent males. The hallmark clinical feature is severe night pain that is characteristically and dramatically relieved by NSAIDs (aspirin, ibuprofen) because the tumor produces high levels of prostaglandins. The classic X-ray finding is a small radiolucent core (nidus) surrounded by dense, reactive, sclerotic bone.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 3-year-old girl is brought to the emergency department by her father. He states he was holding her hand while walking, she tripped, and he quickly pulled her up by the arm to prevent her from falling. She immediately started crying and now refuses to use her right arm, holding it pronated and close to her body. She has no swelling or bruising. What is the most likely diagnosis and the initial maneuver to treat it?', 
'["Supracondylar humerus fracture; apply a splint", "Radial head subluxation (Nursemaid''s elbow); supinate and flex the forearm", "Clavicle fracture; apply a figure-of-eight sling", "Shoulder dislocation; perform the Kocher maneuver"]'::jsonb, 
1, 
'This is a classic presentation of radial head subluxation (Nursemaid''s elbow). It is a common pediatric orthopedic injury occurring when axial traction is applied to an extended, pronated arm (e.g., pulling a child up by the hand), causing the annular ligament to slip over the radial head. The child holds the arm slightly flexed and pronated. Treatment is rapid manual reduction by supinating the forearm while applying pressure to the radial head, then flexing the elbow. An audible "click" often confirms reduction, and the child resumes using the arm almost immediately.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 6-year-old boy falls off monkey bars onto his outstretched hand. He presents with severe pain and swelling just above the elbow. An X-ray confirms a supracondylar fracture of the humerus with significant posterior displacement. What critical structure is at highest immediate risk of injury, requiring careful neurovascular assessment?', 
'["Radial nerve", "Brachial artery and Median nerve", "Ulnar nerve", "Axillary nerve"]'::jsonb, 
1, 
'Supracondylar fractures of the humerus are the most common pediatric elbow fractures. When the distal fragment is displaced posteriorly (extension type), the sharp anterior edge of the proximal fragment is driven into the antecubital fossa. This puts the brachial artery and the median nerve at extremely high risk of compression or laceration. Compromise of the brachial artery can lead to Volkmann ischemic contracture (compartment syndrome of the forearm).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-year-old boy is brought to the ER after swallowing an unknown number of his mother''s iron supplements. He is currently vomiting blood and has severe abdominal pain. An abdominal X-ray shows multiple radiopaque pills in the stomach. What is the specific antidote for acute iron poisoning?', 
'["N-acetylcysteine (NAC)", "Deferoxamine", "Dimercaprol (BAL)", "Fomepizole"]'::jsonb, 
1, 
'Deferoxamine is the specific chelating agent used as the antidote for severe iron poisoning. Iron is highly corrosive to the GI mucosa (causing hemorrhagic gastroenteritis/hematemesis) and causes severe cellular toxicity leading to lactic acidosis, shock, and liver failure. Deferoxamine binds to free iron in the blood and is excreted in the urine, classically turning the urine a "vin rosé" (pink/red) color.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 15-year-old girl is brought to the ER after intentionally ingesting an entire bottle of extra-strength acetaminophen (Tylenol) 4 hours ago. She currently feels nauseated but has no other symptoms. A serum acetaminophen level is drawn and is severely elevated, plotting well above the treatment line on the Rumack-Matthew nomogram. What is the most critical intervention to prevent severe hepatotoxicity?', 
'["Activated charcoal", "Hemodialysis", "Intravenous N-acetylcysteine (NAC)", "Liver transplantation"]'::jsonb, 
2, 
'N-acetylcysteine (NAC) is the highly effective, specific antidote for acetaminophen overdose. Acetaminophen is metabolized in the liver to a toxic intermediate (NAPQI), which is normally detoxified by glutathione. In massive overdose, glutathione is depleted, and NAPQI causes massive centrilobular hepatic necrosis. NAC works by replenishing hepatic glutathione stores. It is most effective when administered within 8 hours of ingestion.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 3-year-old child who lives in a house built in the 1920s is found to have a venous blood lead level of 55 mcg/dL during routine screening. The child is currently asymptomatic. What is the recommended medical management?', 
'["Reassurance and dietary counseling to increase calcium and iron intake", "Environmental investigation only", "Outpatient chelation therapy with oral Succimer (DMSA)", "Immediate hospitalization for intravenous chelation with EDTA and Dimercaprol"]'::jsonb, 
2, 
'For asymptomatic children with blood lead levels between 45 and 69 mcg/dL, the standard of care is outpatient chelation therapy with oral Succimer (dimercaptosuccinic acid). For levels ≥ 70 mcg/dL, or if the child has signs of lead encephalopathy (seizures, altered mental status), it is a medical emergency requiring hospitalization and combination IV chelation therapy (usually Dimercaprol followed by EDTA). Dietary counseling and environmental remediation are always required.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An 8-month-old infant is brought to the clinic with a 3-day history of profuse, watery diarrhea and vomiting. The infant has not had a wet diaper in 12 hours. On exam, the infant is lethargic, has deeply sunken eyes, a sunken anterior fontanelle, dry mucous membranes, and a capillary refill time of 5 seconds. Vital signs show tachycardia and hypotension. What is the estimated percentage of body weight lost (degree of dehydration)?', 
'["Mild (3-5%)", "Moderate (6-9%)", "Severe (≥ 10%)", "No dehydration"]'::jsonb, 
2, 
'This infant exhibits signs of severe dehydration (≥ 10% volume loss). The defining features of severe dehydration are signs of hypovolemic shock: hypotension, significantly prolonged capillary refill (>3-4 seconds), lethargy/unconsciousness, very sunken eyes/fontanelle, and anuria. Mild dehydration often presents with only increased thirst. Moderate dehydration includes dry mucous membranes, tachycardia, and decreased urine output, but blood pressure and mental status are generally maintained.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'For the severely dehydrated 8-month-old infant in the previous question presenting with hypovolemic shock, what is the most appropriate initial fluid resuscitation strategy?', 
'["Oral rehydration solution (ORS) via a syringe", "Intravenous bolus of 20 mL/kg of 0.9% Normal Saline over 20 minutes", "Intravenous bolus of 20 mL/kg of 5% Dextrose in Water (D5W)", "Maintenance IV fluids using D5 ½ Normal Saline"]'::jsonb, 
1, 
'The immediate goal in severe dehydration with signs of shock is to restore intravascular volume to ensure organ perfusion. The standard initial intervention is a rapid intravenous (or intraosseous) fluid bolus of an isotonic crystalloid solution (0.9% Normal Saline or Ringer''s Lactate) at a dose of 20 mL/kg over 20-30 minutes. This bolus can be repeated if the signs of shock do not improve. Hypotonic solutions (like D5W) or maintenance fluids are completely inappropriate for initial shock resuscitation as they do not effectively expand the intravascular space. Oral rehydration is for mild to moderate dehydration.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 12-month-old boy presents with severe, recurrent nosebleeds (epistaxis). His mother reports he frequently picks his nose. The bleeding is from the anterior portion of the nasal septum. What is the name of the vascular plexus located in this area, which is the most common source of pediatric epistaxis?', 
'["Kiesselbach''s plexus", "Woodruff''s plexus", "Pterygoid plexus", "Batson''s plexus"]'::jsonb, 
0, 
'Kiesselbach''s plexus (Little''s area) is a highly vascularized region on the anterior, inferior part of the nasal septum where five arteries anastomose. It is the source of over 90% of epistaxis in children, typically triggered by digital trauma (nose picking), dry air, or rhinitis. Woodruff''s plexus is located posteriorly and is a rare cause of severe posterior nosebleeds, more common in older adults with hypertension.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-year-old child is brought to the ER after a choking episode while eating peanuts. The child is now coughing and has localized wheezing on the right side of the chest. A chest X-ray taken during expiration shows hyperinflation of the right lung with a shift of the mediastinum to the left. What is the most appropriate next step in management?', 
'["Administer an albuterol nebulizer", "Perform a diagnostic and therapeutic rigid bronchoscopy", "Perform a flexible bronchoscopy to evaluate", "Observe the child overnight"]'::jsonb, 
1, 
'This child has a high suspicion for a foreign body aspiration (likely a peanut) lodged in the right mainstem bronchus. The expiratory X-ray finding (hyperinflation of the right lung with mediastinal shift away from the affected side) is classic for a "ball-valve" obstruction: air gets in during inspiration but cannot get out during expiration. The definitive diagnostic and therapeutic management is immediate rigid bronchoscopy to visualize and safely extract the foreign body. Flexible bronchoscopy is diagnostic but lacks the necessary instruments for safe extraction.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 6-year-old boy frequently wets the bed at night (primary nocturnal enuresis). He has never achieved nighttime dryness. He is doing well in school, has no daytime urinary symptoms, and his physical exam and urinalysis are completely normal. His father had a similar problem until age 8. The parents are seeking advice but are not overly frustrated. What is the most appropriate initial management?', 
'["Reassurance, education, and behavioral modifications (e.g., fluid restriction before bed, voiding before sleep)", "Prescribe Desmopressin (DDAVP)", "Prescribe Imipramine", "Refer to a pediatric urologist for a voiding cystourethrogram (VCUG)"]'::jsonb, 
0, 
'For primary nocturnal enuresis in a young child without any red flags (normal exam, normal urinalysis, no daytime symptoms, family history), the condition is overwhelmingly benign and typically resolves spontaneously (15% spontaneous resolution rate per year). The most appropriate initial management is reassurance that the child is normal, reducing stigma/blame, and initiating simple behavioral modifications. Medications or bedwetting alarms are reserved for older children (usually >7 years) who have failed behavioral interventions or have significant psychosocial distress.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 14-year-old girl is evaluated for worsening fatigue and heavy menstrual periods. A CBC shows a hemoglobin of 10.5 g/dL, an MCV of 70 fL (microcytic), and a low reticulocyte count. A peripheral smear shows hypochromic, microcytic red blood cells. What test is most accurate to confirm the underlying cause of her anemia?', 
'["Hemoglobin electrophoresis", "Serum ferritin level", "Direct Coombs test", "Bone marrow biopsy"]'::jsonb, 
1, 
'The patient has a microcytic, hypochromic anemia, which in a menstruating adolescent with heavy periods is almost certainly Iron Deficiency Anemia (IDA). The most accurate and sensitive test to confirm depleted iron stores (the hallmark of IDA) is a low serum ferritin level. Hemoglobin electrophoresis would be used to diagnose Thalassemia (another cause of microcytic anemia, but typically features a normal or elevated red blood cell count and normal iron studies).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 9-month-old infant presents with a generalized, intensely pruritic rash that consists of erythematous papules and vesicles. The rash is particularly severe on the palms, soles, and scalp. The parents report the infant has been extremely fussy and scratching constantly, especially at night. Several other family members have recently developed an itchy rash. What is the most likely diagnosis?', 
'["Atopic dermatitis (Eczema)", "Scabies", "Hand, foot, and mouth disease", "Varicella (Chickenpox)"]'::jsonb, 
1, 
'This is Scabies. While classical scabies in adults spares the face and scalp and concentrates on web spaces, scabies in infants classically involves the entire body, including the face, scalp, palms, and soles. The intense pruritus, worse at night, and the involvement of other family members are key diagnostic clues.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 4-year-old boy presents with a 3-day history of low-grade fever, sore throat, and decreased appetite. He now has painful, shallow ulcers in his posterior pharynx and soft palate, as well as small, tender, grayish vesicles on his palms and the soles of his feet. What is the causative organism?', 
'["Herpes simplex virus 1", "Coxsackievirus A", "Varicella zoster virus", "Group A Streptococcus"]'::jsonb, 
1, 
'This is the classic presentation of Hand, Foot, and Mouth Disease, most commonly caused by Coxsackievirus A16 (an enterovirus). The presentation of painful oral ulcers (herpangina) combined with vesicles on the palms and soles is pathognomonic. It is highly contagious but benign and self-limiting. Treatment is supportive (hydration, pain control).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 5-year-old unimmunized boy presents to the emergency department with profound muscle weakness. The weakness began in his legs two days ago and is now ascending, affecting his trunk and arms. He has absent deep tendon reflexes. He had a mild diarrheal illness two weeks ago. He is conscious and alert. What is the most likely diagnosis, and what life-threatening complication must be monitored for immediately?', 
'["Poliomyelitis; respiratory failure", "Guillain-Barré Syndrome; respiratory failure", "Botulism; cardiac arrest", "Myasthenia Gravis; seizures"]'::jsonb, 
1, 
'This is the classic presentation of Guillain-Barré Syndrome (GBS), an acute inflammatory demyelinating polyneuropathy. It is characterized by rapidly progressive, ascending, symmetric flaccid paralysis with areflexia. It often follows a GI infection (classically Campylobacter jejuni). The most critical, life-threatening complication is involvement of the diaphragm and intercostal muscles, leading to acute respiratory failure. Patients must have their forced vital capacity (FVC) or negative inspiratory force (NIF) monitored closely, often requiring intubation.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An infant is born to a mother who is HBsAg positive (Hepatitis B carrier). To prevent vertical transmission of the virus, what specific prophylaxis must the infant receive, and what is the required timeframe?', 
'["Hepatitis B vaccine only, within 24 hours of birth", "Hepatitis B Immune Globulin (HBIG) only, within 12 hours of birth", "Both Hepatitis B vaccine and Hepatitis B Immune Globulin (HBIG), administered within 12 hours of birth at different injection sites", "Initiate oral antiviral therapy in the infant immediately"]'::jsonb, 
2, 
'Infants born to mothers who are Hepatitis B Surface Antigen (HBsAg) positive are at very high risk for perinatal transmission, which leads to chronic Hepatitis B infection in up to 90% of infected infants. To prevent this, they must receive post-exposure prophylaxis with BOTH the Hepatitis B vaccine (active immunity) AND Hepatitis B Immune Globulin (HBIG) (passive immunity) within 12 hours of birth. These must be given in different limbs.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 3-year-old child presents with a sudden onset of a limp and refuses to walk. He had a mild upper respiratory infection a week ago. He is afebrile and appears well. Examination reveals mild pain with internal rotation of the right hip. An ultrasound shows a small effusion in the right hip joint. Labs show a normal WBC count and a normal ESR. What is the most likely diagnosis?', 
'["Septic arthritis", "Transient synovitis", "Legg-Calvé-Perthes disease", "Osteomyelitis"]'::jsonb, 
1, 
'This is Transient Synovitis (Toxic Synovitis), the most common cause of acute hip pain in children aged 3-8. It typically follows a viral infection. Key features that differentiate it from the much more dangerous septic arthritis are the child''s well appearance, lack of significant fever, normal laboratory inflammatory markers (WBC, ESR, CRP), and ability to bear some weight (though limping). Treatment is rest and NSAIDs.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A newborn infant has a profoundly distended abdomen, bilious emesis, and has failed to pass meconium in the first 48 hours. A contrast enema reveals a "microcolon" (an unused, uniformly small caliber colon). What underlying genetic disease is highly associated with this presentation (Meconium Ileus)?', 
'["Hirschsprung disease", "Cystic Fibrosis", "Down Syndrome", "Sickle Cell Disease"]'::jsonb, 
1, 
'Meconium Ileus is the obstruction of the terminal ileum by thick, inspissated meconium. It is almost exclusively seen in patients with Cystic Fibrosis (occurring in ~20% of CF patients). The thick secretions prevent the meconium from passing. Because no meconium or fluid reaches the colon during fetal development, the colon remains tiny and unused, appearing as a "microcolon" on a contrast enema. Hirschsprung disease presents with an aganglionic segment, not thick meconium.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Which of the following physical examination findings is a hallmark feature of Marfan syndrome, differentiating it from Homocystinuria (which shares similar skeletal features like tall stature and long fingers)?', 
'["Intellectual disability", "Upward lens subluxation (ectopia lentis)", "Downward lens subluxation", "Aortic root dilation and dissection"]'::jsonb, 
1, 
'Marfan syndrome (autosomal dominant, fibrillin-1 mutation) and Homocystinuria (autosomal recessive, cystathionine beta-synthase deficiency) both present with tall stature, long extremities, arachnodactyly, and pectus deformities. A key differentiating physical exam finding is the direction of lens subluxation: in Marfan syndrome, the lens typically subluxates UPWARD and outward (superior-temporal). In Homocystinuria, the lens subluxates DOWNWARD and inward. Furthermore, patients with Marfan generally have normal intelligence, while those with Homocystinuria often have intellectual disability and are prone to severe thromboembolic events.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 12-year-old boy presents with progressive bilateral hearing loss. His mother also has hearing loss and suffered from end-stage renal disease requiring a kidney transplant in her 30s. The boy''s urinalysis shows microscopic hematuria and proteinuria. What is the most likely genetic diagnosis?', 
'["Alport syndrome", "Goodpasture syndrome", "IgA Nephropathy", "Polycystic Kidney Disease"]'::jsonb, 
0, 
'This is Alport syndrome, a genetic disorder affecting Type IV collagen synthesis (most commonly X-linked). The classic triad is sensorineural hearing loss, ocular abnormalities (like anterior lenticonus), and progressive glomerulonephritis (presenting initially as isolated microscopic hematuria in childhood, eventually progressing to end-stage renal disease in early adulthood).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-week-old infant presents to the ER with a temperature of 101.5°F (38.6°C). The infant is sleeping but easily arousable and is feeding well. The physical exam is entirely unremarkable. What is the mandatory immediate management for this patient?', 
'["Reassure the parents and recommend acetaminophen for the fever", "Obtain a urinalysis and send home on oral antibiotics", "Perform a full sepsis workup (blood culture, urine culture, lumbar puncture) and immediately start broad-spectrum intravenous antibiotics", "Obtain a chest X-ray and viral respiratory panel"]'::jsonb, 
2, 
'Any infant under 28 days of age (a neonate) presenting with a fever (≥ 100.4°F or 38.0°C) must be presumed to have a serious bacterial infection (sepsis, meningitis, UTI) until proven otherwise. Because neonates have immature immune systems and do not localize infections well, clinical appearance is an unreliable indicator of disease severity. The mandatory protocol is a "full sepsis workup" (blood, urine, and CSF cultures) followed immediately by empiric intravenous antibiotics (e.g., Ampicillin + Cefotaxime or Gentamicin) and hospital admission.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 6-month-old infant is evaluated for failure to thrive, persistent vomiting, and polyuria. Blood tests reveal a normal anion gap metabolic acidosis. Urine tests show a pH of 7.5 despite the acidemia. The infant has a defect in the distal renal tubules preventing the secretion of hydrogen ions. What is the diagnosis?', 
'["Type 1 (Distal) Renal Tubular Acidosis", "Type 2 (Proximal) Renal Tubular Acidosis", "Type 4 Renal Tubular Acidosis", "Bartter syndrome"]'::jsonb, 
0, 
'This describes Type 1 (Distal) Renal Tubular Acidosis (RTA). The intercalated cells of the distal tubule fail to secrete H+ into the urine. Because H+ is retained, the blood becomes acidotic (normal anion gap). Because H+ is not secreted, the urine cannot be acidified and remains alkaline (pH > 5.5). This defect predisposes the patient to severe nephrocalcinosis and kidney stones.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 4-year-old child presents with a "barking" cough, hoarseness, and inspiratory stridor. A lateral neck X-ray reveals subglottic narrowing (the "steeple sign"). What virus is the most common cause of this illness?', 
'["Respiratory Syncytial Virus (RSV)", "Parainfluenza virus", "Influenza A virus", "Adenovirus"]'::jsonb, 
1, 
'The clinical presentation and the "steeple sign" on X-ray are classic for Croup (Laryngotracheobronchitis). The most common causative agent is the Parainfluenza virus (specifically type 1). RSV is the most common cause of bronchiolitis.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 5-year-old child presents with a sudden onset of widespread, tense, fluid-filled blisters (bullae) that easily rupture, leaving large, painful, red, denuded areas of skin. The skin gently sloughs off when light pressure is applied (positive Nikolsky sign). The child has a low-grade fever and irritability. The mucous membranes are spared. What is the diagnosis?', 
'["Stevens-Johnson Syndrome (SJS)", "Toxic Epidermal Necrolysis (TEN)", "Staphylococcal Scalded Skin Syndrome (SSSS)", "Bullous Impetigo"]'::jsonb, 
2, 
'This is Staphylococcal Scalded Skin Syndrome (SSSS), caused by exfoliative exotoxins produced by specific strains of Staphylococcus aureus. The toxins cleave desmoglein 1 in the epidermis, causing superficial blistering and a positive Nikolsky sign (skin separation with light friction). Crucially, SSSS almost always spares the mucous membranes. Stevens-Johnson Syndrome (SJS) and Toxic Epidermal Necrolysis (TEN) are typically drug-induced, involve deeper skin layers, and almost always involve severe mucosal ulceration.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 13-year-old girl is evaluated for a painless, firm mass in the anterior midline of her neck that moves upwards when she swallows or protrudes her tongue. What is the most likely origin of this congenital cyst?', 
'["A remnant of the thyroglossal duct", "A remnant of the second branchial cleft", "A dermoid cyst", "An enlarged cervical lymph node"]'::jsonb, 
0, 
'A mass in the anterior midline of the neck that elevates with swallowing or tongue protrusion is a classic Thyroglossal Duct Cyst. It forms from remnants of the thyroglossal duct as the thyroid gland descends from the foramen cecum at the base of the tongue to its final position in the neck during embryogenesis. A branchial cleft cyst is typically located laterally, anterior to the sternocleidomastoid muscle, and does not move with swallowing.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Which of the following milestones is a red flag if NOT achieved by a 12-month-old infant?', 
'["Walking independently", "Speaking 5 distinct words", "Using a pincer grasp", "Pointing to show interest in objects"]'::jsonb, 
3, 
'Pointing to share interest (joint attention) is a critical social-communicative milestone that should develop by 12 months. Failure to point, or failure to respond to name or follow a point, are early red flags for Autism Spectrum Disorder. Independent walking and speaking multiple words are typically achieved around 15 months. The pincer grasp develops around 9-10 months, but failure of joint attention is a more significant, immediate red flag.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-year-old boy has profound bowlegs (genu varum). His height is <5th percentile. Radiographs show widened, cupped, and frayed metaphyses at the wrists and knees. Laboratory testing shows normal serum calcium, profoundly low serum phosphorus, and normal Vitamin D levels. He does not have a dietary deficiency. What is the most likely diagnosis?', 
'["Nutritional Vitamin D deficiency rickets", "Achondroplasia", "X-linked Hypophosphatemic Rickets", "Osteogenesis Imperfecta"]'::jsonb, 
2, 
'This child has X-linked Hypophosphatemic Rickets (Vitamin D-resistant rickets), the most common form of hereditary rickets. It is caused by a mutation in the PHEX gene, leading to increased FGF23, which causes massive renal wasting of phosphorus. Because the primary defect is phosphate wasting, Vitamin D and calcium levels are typically normal, but the profound hypophosphatemia prevents normal bone mineralization, causing severe rickets. Treatment requires high doses of oral phosphate and active Vitamin D (calcitriol).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 14-year-old male presents with worsening daytime sleepiness despite getting 9 hours of sleep a night. He reports several episodes where he felt overwhelming, sudden muscle weakness and collapsed to the floor after laughing at a joke, though he remained fully conscious. He also experiences vivid, frightening hallucinations just as he is falling asleep. What is the diagnosis?', 
'["Obstructive Sleep Apnea", "Narcolepsy", "Complex partial seizures", "Major Depressive Disorder"]'::jsonb, 
1, 
'This is the classic presentation of Narcolepsy. The tetrad of narcolepsy includes: 1) excessive daytime sleepiness, 2) cataplexy (sudden loss of muscle tone triggered by strong emotion, like laughing), 3) hypnagogic hallucinations (vivid dreams occurring at sleep onset), and 4) sleep paralysis. Cataplexy is pathognomonic for narcolepsy type 1, which is caused by a deficiency of the neuropeptide orexin (hypocretin) in the lateral hypothalamus.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 3-year-old girl is found unresponsive by her parents. An empty bottle of her grandmother''s tricyclic antidepressants (Amitriptyline) is found nearby. In the ER, she is comatose, has dilated pupils, and her EKG shows a significantly widened QRS complex. What is the most important specific pharmacological intervention to treat the cardiotoxicity and prevent fatal arrhythmias?', 
'["Intravenous Physostigmine", "Intravenous Sodium Bicarbonate", "Intravenous Glucagon", "Intravenous Flumazenil"]'::jsonb, 
1, 
'Tricyclic antidepressant (TCA) overdose causes severe cardiotoxicity by blocking fast sodium channels in the myocardium, leading to QRS prolongation and fatal ventricular arrhythmias. It also causes severe anticholinergic toxicity. The specific antidote for TCA-induced cardiotoxicity (indicated by a widened QRS > 100 msec) is intravenous Sodium Bicarbonate. It works by increasing the serum pH (which decreases the active form of the drug) and providing a large sodium load to overcome the sodium channel blockade.')

;
