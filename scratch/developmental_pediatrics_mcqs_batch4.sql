-- Batch 4: 30 Developmental Pediatrics MCQs (Questions 91-120)
-- Topic: Congenital Infections, Newborn Screening, Sensory Deficits, and Genetics

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A newborn infant is found to have microcephaly, widespread intracerebral calcifications, chorioretinitis, and severe developmental delay. The mother recalls having a brief illness with swollen lymph nodes after adopting a stray kitten during her first trimester of pregnancy. What is the most likely causative organism?', 
'["Cytomegalovirus (CMV)", "Toxoplasma gondii", "Rubella virus", "Herpes simplex virus (HSV)"]'::jsonb, 
1, 
'This is the classic triad of congenital toxoplasmosis: chorioretinitis, hydrocephalus/microcephaly, and diffuse intracerebral calcifications. The infection is caused by the parasite Toxoplasma gondii, typically acquired by the mother through ingestion of undercooked meat or exposure to cat feces. Congenital CMV typically presents with periventricular calcifications, not diffuse.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'What is the most common congenital viral infection and a leading non-genetic cause of sensorineural hearing loss and neurodevelopmental disabilities in children?', 
'["Congenital Rubella", "Congenital Zika virus", "Congenital Cytomegalovirus (CMV)", "Congenital Parvovirus B19"]'::jsonb, 
2, 
'Cytomegalovirus (CMV) is the most common congenital viral infection. While most infected infants are asymptomatic at birth, a significant percentage will eventually develop progressive sensorineural hearing loss and learning disabilities. Symptomatic infants at birth may have microcephaly, periventricular calcifications, hepatosplenomegaly, and jaundice.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A pregnant woman who is unimmunized contracts a viral illness characterized by a low-grade fever, lymphadenopathy, and a descending maculopapular rash during her first trimester. Her infant is born with profound sensorineural hearing loss, bilateral cataracts, and a patent ductus arteriosus (PDA). What is the diagnosis?', 
'["Congenital Syphilis", "Congenital Rubella Syndrome", "Congenital Varicella", "Neonatal Herpes"]'::jsonb, 
1, 
'This is the classic triad of Congenital Rubella Syndrome: sensorineural deafness, eye abnormalities (cataracts, glaucoma), and congenital heart disease (classic is PDA or pulmonary artery stenosis). Due to widespread vaccination, it is now rare in developed countries but remains a risk in unimmunized populations.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An infant is born with severe microcephaly, redundant scalp skin, intracranial calcifications, and severe joint contractures (arthrogryposis). The mother traveled to South America during the first trimester and recalls having a mild febrile illness with a rash and conjunctivitis. What mosquito-borne virus is most likely responsible for these severe fetal anomalies?', 
'["Dengue virus", "Zika virus", "Chikungunya virus", "West Nile virus"]'::jsonb, 
1, 
'Zika virus infection during pregnancy, particularly in the first trimester, is strongly associated with severe fetal brain disruption sequence. The hallmark is profound microcephaly with a partially collapsed skull, redundant scalp skin, subcortical calcifications, macular scarring, and arthrogryposis (due to lack of fetal movement).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Routine newborn metabolic screening (the "heel prick" test) is mandated in all states. Which of the following conditions is universally screened for because early dietary intervention prevents severe, irreversible intellectual disability?', 
'["Down Syndrome", "Phenylketonuria (PKU)", "Duchenne Muscular Dystrophy", "Fragile X Syndrome"]'::jsonb, 
1, 
'Phenylketonuria (PKU) is an autosomal recessive metabolic disorder caused by a deficiency of the enzyme phenylalanine hydroxylase. Without treatment, phenylalanine accumulates in the brain, causing severe intellectual disability, seizures, and a "mousy" body odor. Universal newborn screening allows for the immediate initiation of a strict low-phenylalanine diet, which completely prevents the intellectual disability.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-week-old infant who appeared normal at birth presents with prolonged jaundice, lethargy, poor feeding, an enlarged tongue (macroglossia), and an umbilical hernia. The newborn screening results are pending. What is the most critical diagnosis to consider immediately to prevent permanent neurodevelopmental delay?', 
'["Congenital Hypothyroidism", "Galactosemia", "Biliary Atresia", "Cystic Fibrosis"]'::jsonb, 
0, 
'This is a classic presentation of congenital hypothyroidism. Infants often appear normal at birth because maternal thyroid hormone crosses the placenta. Symptoms develop as maternal hormone clears: lethargy, hypotonia, large fontanelles, macroglossia, umbilical hernia, and prolonged jaundice. If not treated rapidly with levothyroxine, it causes profound and irreversible intellectual disability (formerly called cretinism).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An infant is started on cow''s milk-based formula and quickly develops vomiting, diarrhea, failure to thrive, jaundice, hepatomegaly, and bilateral cataracts. The infant also develops E. coli sepsis. What is the most likely underlying metabolic disorder?', 
'["Hereditary Fructose Intolerance", "Glycogen Storage Disease Type I", "Classic Galactosemia", "Medium-chain acyl-CoA dehydrogenase (MCAD) deficiency"]'::jsonb, 
2, 
'Classic galactosemia is an autosomal recessive disorder caused by a deficiency of galactose-1-phosphate uridyltransferase (GALT). It presents in the first few days of life when milk (breast milk or regular formula, which contains lactose/galactose) is introduced. Symptoms include failure to thrive, liver dysfunction, cataracts, and a high susceptibility to E. coli sepsis. The treatment is a strict galactose-free (soy-based) formula.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 6-month-old infant of Ashkenazi Jewish descent presents with loss of previously acquired motor skills (regression), exaggerated startle reflex to noise, and hypotonia. An ophthalmologic exam reveals a "cherry-red spot" on the macula. The infant does not have hepatosplenomegaly. What is the most likely diagnosis?', 
'["Niemann-Pick disease", "Tay-Sachs disease", "Gaucher disease", "Krabbe disease"]'::jsonb, 
1, 
'This describes Tay-Sachs disease, an autosomal recessive lysosomal storage disease caused by a deficiency of hexosaminidase A. It leads to the accumulation of GM2 ganglioside in the brain. The classic presentation includes developmental regression in early infancy, hyperacusis (exaggerated startle), a cherry-red spot on the macula, and NO hepatosplenomegaly (unlike Niemann-Pick disease, which has similar neuro symptoms and a cherry-red spot, but marked hepatosplenomegaly).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 3-year-old boy is brought to the clinic because his parents notice he is clumsy and uses his hands to "walk up" his legs when trying to stand from the floor (Gowers'' sign). He also has enlarged calf muscles. What is the most appropriate initial screening test for the suspected condition?', 
'["Muscle biopsy", "Creatine kinase (CK) level", "Electromyography (EMG)", "Echocardiogram"]'::jsonb, 
1, 
'The clinical presentation is classic for Duchenne Muscular Dystrophy (DMD), an X-linked recessive disorder. The Gowers'' sign indicates proximal muscle weakness. The enlarged calves are pseudohypertrophy (fat and fibrotic tissue replacing muscle). Because muscle fibers are breaking down, the initial screening test is a serum Creatine Kinase (CK) level, which is typically massively elevated (often >10,000 U/L) even before clinical symptoms become severe. Diagnosis is confirmed by genetic testing.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'At what age should a child''s visual acuity ideally be assessed using standardized objective charts (like the Snellen or LEA symbols chart) during a routine well-child visit?', 
'["At 12 months", "At 2 years", "Between 3 and 4 years", "Not until 6 years"]'::jsonb, 
2, 
'Vision screening using objective, standardized charts (like LEA symbols, HOTV, or Tumbling E for younger children) should begin formally between ages 3 and 4, when the child is cognitively able to cooperate with the testing. Prior to this, vision is assessed subjectively (fixing and following, red reflex, observing for strabismus).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'During a routine exam of a 4-month-old infant, the pediatrician performs the cover-uncover test and notes that the left eye deviates inward (medially) when the right eye is uncovered. What is the term for this finding, and what is its developmental significance?', 
'["Exotropia; it is a normal variant that will resolve by 12 months", "Esotropia; it can lead to amblyopia and requires referral to a pediatric ophthalmologist", "Nystagmus; it indicates a cerebellar lesion", "Pseudostrabismus; it requires no intervention"]'::jsonb, 
1, 
'Inward deviation of the eye is termed esotropia (a type of strabismus). While intermittent, non-fixed strabismus can be normal in the first 2-3 months of life as ocular coordination develops, any fixed deviation or strabismus persisting past 4 months is abnormal. It must be referred to a pediatric ophthalmologist because the brain will eventually suppress the image from the misaligned eye, leading to amblyopia (permanent vision loss in the affected eye).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'The absence of a red reflex in a newborn or infant is a medical emergency. While it can be caused by congenital cataracts or glaucoma, what life-threatening intraocular malignancy must immediately be ruled out?', 
'["Optic nerve glioma", "Retinoblastoma", "Medulloblastoma", "Neuroblastoma"]'::jsonb, 
1, 
'An absent or asymmetric red reflex, or a white pupillary reflex (leukocoria), is a cardinal sign of retinoblastoma, a highly malignant pediatric eye tumor. It requires an urgent referral to an ophthalmologist. Other causes of leukocoria include congenital cataracts and retinopathy of prematurity.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Which of the following is the most common cause of conductive hearing loss in early childhood?', 
'["Meningitis", "Aminoglycoside toxicity", "Otitis media with effusion", "Congenital CMV infection"]'::jsonb, 
2, 
'Otitis media with effusion (fluid in the middle ear without acute signs of infection) is extremely common in young children and is the leading cause of conductive hearing loss. If chronic, this mild-to-moderate hearing loss can significantly impair language and speech development, prompting the need for tympanostomy tubes. Meningitis, aminoglycosides, and CMV cause sensorineural hearing loss.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-year-old child from Southeast Asia is evaluated for dark, blue-gray, flat macular lesions located across the lower back and buttocks. They resemble bruises, but the parents state they have been present since birth and have not changed. The physical exam is otherwise normal. What is the most appropriate management?', 
'["Immediately report suspected child abuse to Child Protective Services", "Perform a skin biopsy to rule out melanoma", "Reassure the parents that these are benign congenital dermal melanocytoses (Mongolian spots) and require no treatment", "Prescribe a topical steroid cream"]'::jsonb, 
2, 
'These lesions are classic congenital dermal melanocytoses (formerly known as Mongolian spots). They are benign, flat, blue-gray birthmarks usually found on the sacrum or buttocks of infants of Asian, African, or Hispanic descent. They are caused by delayed migration of melanocytes. They often fade by school age. It is crucial for physicians to recognize them to avoid falsely accusing parents of child abuse (bruising). Documenting them at birth is good practice.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 5-year-old child presents with a sudden onset of joint pain, swelling, and a characteristic purpuric rash primarily on the buttocks and lower extremities. The child also complains of colicky abdominal pain. Laboratory tests show a normal platelet count. What is the most likely diagnosis?', 
'["Idiopathic Thrombocytopenic Purpura (ITP)", "Meningococcemia", "Henoch-Schönlein Purpura (IgA Vasculitis)", "Child abuse (inflicted bruising)"]'::jsonb, 
2, 
'This is the classic tetrad of Henoch-Schönlein Purpura (HSP), now called IgA Vasculitis: 1) palpable purpura on the gravity-dependent areas (buttocks/legs), 2) arthritis/arthralgia, 3) abdominal pain, and 4) renal disease (hematuria). Because the purpura can look like bruises on the buttocks, it is an important medical mimic of child abuse. The normal platelet count rules out ITP. Treatment is generally supportive.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Which of the following screening tools is widely used in pediatric primary care to assess parent-completed developmental milestones across five domains (communication, gross motor, fine motor, problem solving, personal-social) for children up to 5 years old?', 
'["M-CHAT", "Ages and Stages Questionnaires (ASQ)", "Vanderbilt Assessment Scale", "Conners Rating Scales"]'::jsonb, 
1, 
'The Ages and Stages Questionnaires (ASQ) is a very common, highly validated, parent-completed developmental screening tool used for children from 1 month to 5.5 years of age. It screens across multiple domains. The M-CHAT is specifically for autism. Vanderbilt and Conners scales are specifically for assessing ADHD.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 6-month-old boy is brought to the clinic. His mother is concerned because his right testicle is present in the scrotum, but the left testicle is not palpable. What is the most appropriate management regarding this undescended testicle (cryptorchidism)?', 
'["Schedule an immediate surgical orchiopexy", "Reassure the mother and wait until puberty for spontaneous descent", "Refer to a pediatric urologist for surgical correction if it has not descended by 6-12 months of age", "Order an abdominal CT scan to locate the testicle"]'::jsonb, 
2, 
'Cryptorchidism is common in newborns, especially premature infants. The majority of undescended testicles will descend spontaneously within the first 6 months of life. If a testicle has not descended by 6 to 12 months, spontaneous descent is highly unlikely, and a referral to a pediatric urologist or surgeon is indicated for an orchiopexy. Delaying surgery beyond 1-2 years increases the risk of infertility and testicular cancer.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 3-year-old child presents to the emergency department after swallowing a shiny, disk-shaped object that the parents suspect is a button battery. The child is currently asymptomatic. An X-ray confirms the object is lodged in the esophagus. What is the most appropriate next step?', 
'["Observe the child for 24 hours to see if it passes into the stomach", "Administer a laxative and discharge home", "Immediate endoscopic removal", "Perform a barium swallow study to assess for damage"]'::jsonb, 
2, 
'A button battery lodged in the esophagus is an absolute medical emergency requiring immediate endoscopic removal. The narrow esophagus allows the battery to contact the mucosa, where the electrical current and leakage of alkaline contents can cause severe, deep liquefaction necrosis and potentially fatal esophageal perforation within hours. If the battery had passed into the stomach and the child was asymptomatic, observation might be considered, but esophageal impaction requires urgent action.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A toddler is evaluated for recurrent bone fractures with minimal trauma. Examination reveals blue sclerae and poor dentition (dentinogenesis imperfecta). There is no history of bruising or burns, and the parents'' history of the injuries is consistent with minor falls. What is the most likely diagnosis?', 
'["Child abuse", "Osteogenesis Imperfecta", "Achondroplasia", "Vitamin C deficiency (Scurvy)"]'::jsonb, 
1, 
'This is the classic presentation of Osteogenesis Imperfecta (brittle bone disease), an autosomal dominant defect in Type I collagen synthesis. The cardinal features are recurrent fractures from minimal trauma, blue sclerae (due to thin sclera revealing the choroidal veins), hearing loss, and dentinogenesis imperfecta. It is a critical medical mimic of child abuse, but the blue sclerae and dental findings strongly point to OI.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Which of the following interventions is the most effective method for preventing dental caries in toddlers and young children?', 
'["Routine daily flossing starting at age 1", "Providing a bottle of milk or juice in the crib at bedtime", "Avoiding all fruits in the diet", "Optimal fluoridation of the community water supply or prescribing fluoride supplements if the water is not fluoridated"]'::jsonb, 
3, 
'Systemic and topical fluoride exposure, primarily through optimally fluoridated community water supplies, is the most effective public health measure for preventing dental caries. If the local water supply is deficient in fluoride, pediatricians should prescribe oral fluoride supplements starting at 6 months of age. Bedtime bottles with milk/juice are the leading cause of early childhood caries.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A mother asks about car seat safety for her 18-month-old toddler who weighs 25 lbs. According to current AAP guidelines, what is the most appropriate car seat configuration?', 
'["Forward-facing convertible car seat", "Rear-facing car seat in the back seat", "Booster seat in the back seat", "Forward-facing car seat in the front passenger seat"]'::jsonb, 
1, 
'The AAP strongly recommends that all infants and toddlers ride in a rear-facing car seat for as long as possible, until they reach the highest weight or height allowed by their car seat manufacturer. This typically includes children up to 2 years of age or older. Rear-facing seats provide the best protection for a young child''s developing head, neck, and spine in a crash.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 12-year-old female presents with primary amenorrhea. She is at the 90th percentile for height. Her sense of smell is absent (anosmia). What is the most likely diagnosis?', 
'["Turner Syndrome", "Kallmann Syndrome", "Androgen Insensitivity Syndrome", "Müllerian Agenesis"]'::jsonb, 
1, 
'Kallmann syndrome is a form of hypogonadotropic hypogonadism characterized by delayed puberty and an absent or impaired sense of smell (anosmia or hyposmia). It is caused by the failure of GnRH-producing neurons to migrate to the hypothalamus during embryonic development, which also affects the olfactory bulb. Unlike Turner syndrome, these patients typically have normal or tall stature.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A newborn infant has a single palmar crease, upslanting palpebral fissures, epicanthal folds, and a flat facial profile. What cardiovascular defect is most strongly associated with this genetic syndrome?', 
'["Coarctation of the aorta", "Atrial septal defect (ASD) only", "Complete atrioventricular (AV) septal defect (endocardial cushion defect)", "Transposition of the great arteries"]'::jsonb, 
2, 
'The infant has classic dysmorphic features of Down Syndrome (Trisomy 21). Approximately 50% of children with Down syndrome have a congenital heart defect. The most classic and characteristic defect is a complete atrioventricular (AV) septal defect (also known as an endocardial cushion defect).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 14-year-old boy is evaluated for short stature and delayed puberty. He has a history of a cleft lip and palate repaired in infancy. His bone age is delayed by 3 years compared to his chronological age. What is the most appropriate initial screening test to evaluate his growth failure?', 
'["Measurement of random growth hormone levels", "Measurement of Insulin-like Growth Factor 1 (IGF-1) and IGFBP-3", "MRI of the pituitary gland", "Karyotype"]'::jsonb, 
1, 
'This patient''s short stature and delayed bone age suggest possible Growth Hormone (GH) deficiency. Because GH secretion is pulsatile (peaks at night) and has a short half-life, random serum GH levels are useless. The best initial screening tests are serum levels of IGF-1 and IGFBP-3, which are stimulated by GH but have long half-lives and remain stable throughout the day. If these are low, formal GH stimulation testing is indicated.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An 8-year-old girl is brought to the clinic because she has begun developing breast buds (thelarche) and pubic hair. What is the clinical definition of precocious puberty in females?', 
'["Onset of secondary sexual characteristics before age 8", "Onset of menarche before age 12", "Onset of secondary sexual characteristics before age 10", "Onset of breast development before pubic hair development"]'::jsonb, 
0, 
'Precocious puberty is classically defined as the onset of secondary sexual characteristics (breast or pubic hair development) before the age of 8 years in females and before the age of 9 years in males. It requires evaluation to distinguish between central (GnRH-dependent) and peripheral (GnRH-independent) causes.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 15-year-old girl with primary amenorrhea is evaluated. She has normal breast development but absent axillary and pubic hair. Pelvic ultrasound reveals absent uterus and ovaries, and the presence of testes in the inguinal canal. Karyotype is 46,XY. What is the diagnosis?', 
'["Turner syndrome", "Complete Androgen Insensitivity Syndrome (CAIS)", "5-alpha-reductase deficiency", "Müllerian agenesis"]'::jsonb, 
1, 
'This is classic for Complete Androgen Insensitivity Syndrome (CAIS). The patient is genetically male (46,XY) and has testes that produce normal to high levels of testosterone and anti-Müllerian hormone (AMH). AMH causes the regression of female internal organs (no uterus/fallopian tubes). Because peripheral tissues completely lack functional androgen receptors, the testosterone cannot act, leading to female external genitalia and absent pubic/axillary hair. The excess testosterone aromatizes into estrogen, causing normal breast development at puberty.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A newborn infant exhibits severe micrognathia (small jaw), glossoptosis (downward displacement of the tongue), and a U-shaped cleft palate. The neonatologist is concerned about airway obstruction. What is this sequence of congenital anomalies called?', 
'["Pierre Robin sequence", "Potter sequence", "Amniotic band sequence", "VATER association"]'::jsonb, 
0, 
'This is the Pierre Robin sequence. It begins with mandibular hypoplasia (micrognathia) in utero. The small jaw prevents the tongue from descending (glossoptosis), and the abnormally positioned tongue physically prevents the palatal shelves from fusing, resulting in a U-shaped cleft palate. The primary immediate concern is upper airway obstruction by the tongue.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A child presents with a high fever, severe sore throat, drooling, and dysphagia. He is sitting in the "tripod" position, leaning forward with his neck extended. He appears toxic. What is the most critical first step in management?', 
'["Attempt to visualize the pharynx with a tongue depressor to confirm the diagnosis", "Send the child for an anteroposterior neck X-ray", "Keep the child calm and consult anesthesia/ENT for immediate intubation in the operating room", "Administer an albuterol nebulizer"]'::jsonb, 
2, 
'This child has acute epiglottitis, a life-threatening airway emergency. The tripod position, drooling, and toxic appearance are classic. The most critical rule is to NEVER attempt to examine the pharynx with a tongue depressor or agitate the child, as this can provoke complete, fatal laryngospasm and airway obstruction. The immediate step is to secure the airway via intubation in a controlled setting (OR) by an expert.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Which vaccine, introduced in the 1980s and 1990s, dramatically reduced the incidence of acute epiglottitis in children?', 
'["Pneumococcal conjugate vaccine (PCV13)", "Haemophilus influenzae type b (Hib) vaccine", "Diphtheria, tetanus, and acellular pertussis (DTaP) vaccine", "Measles, mumps, and rubella (MMR) vaccine"]'::jsonb, 
1, 
'Historically, Haemophilus influenzae type b (Hib) was the overwhelming cause of acute epiglottitis in young children. The introduction of the routine Hib vaccine has virtually eliminated this disease in immunized populations. Today, epiglottitis is rare and more commonly caused by Strep species or occurs in unimmunized individuals.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-year-old child presents with a harsh, "barking" seal-like cough, hoarseness, and inspiratory stridor that is worse at night. He had a mild runny nose a few days prior. He does not appear toxic and is not drooling. What is the most likely diagnosis?', 
'["Acute epiglottitis", "Laryngotracheobronchitis (Croup)", "Bacterial tracheitis", "Foreign body aspiration"]'::jsonb, 
1, 
'This is a classic presentation of Croup (Laryngotracheobronchitis), most commonly caused by the Parainfluenza virus. It causes inflammation and narrowing of the subglottic airway, leading to the characteristic barking cough and inspiratory stridor. It is distinguished from epiglottitis by the lack of toxic appearance, absence of drooling, and viral prodrome.')

;
