-- Batch 3: 30 Developmental Pediatrics MCQs (Questions 61-90)
-- Topic: Growth, Nutrition, Failure to Thrive, Child Abuse, Anticipatory Guidance

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 9-month-old infant is brought to the clinic for a well-child check. Growth chart analysis reveals that the infant''s weight has dropped from the 50th percentile to the 5th percentile over the last 4 months, while length and head circumference have remained tracking along the 50th percentile. What is the most common etiology for this presentation of Failure to Thrive (FTT)?', 
'["Cystic fibrosis", "Celiac disease", "Inadequate caloric intake (psychosocial or environmental)", "Congenital heart disease"]'::jsonb, 
2, 
'The classic pattern of Failure to Thrive (FTT) where weight falls off first, followed by length, and lastly head circumference (sparing the brain), strongly suggests inadequate caloric intake. While organic causes (like CF or celiac) exist, non-organic, psychosocial, or environmental factors leading to inadequate caloric provision are by far the most common cause of FTT in infants.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An infant presents with profound Failure to Thrive (FTT). On the growth chart, weight, length, and head circumference all dropped simultaneously and proportionately starting at 2 months of age. Which of the following etiologies is most consistent with this symmetric growth failure pattern?', 
'["Inadequate maternal breast milk supply", "Genetic or chromosomal abnormality (e.g., Trisomy 18)", "Gastroesophageal reflux disease", "Iron deficiency anemia"]'::jsonb, 
1, 
'Symmetric growth failure, where weight, length, and head circumference are all proportionally reduced from early infancy or birth, suggests an intrinsic, constitutional, or genetic/chromosomal abnormality (like a genetic syndrome or congenital TORCH infection). Asymmetric FTT (weight affected first) is more typical of malnutrition.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'The American Academy of Pediatrics (AAP) provides specific guidelines to reduce the risk of Sudden Infant Death Syndrome (SIDS). Which of the following is an AAP recommended safe sleep practice?', 
'["Placing the infant to sleep in the prone position to prevent aspiration", "Using crib bumpers to prevent head injury", "Infant sleeping in the parents'' room, close to the parents'' bed, on a separate surface", "Routine use of home cardiorespiratory monitors in healthy infants"]'::jsonb, 
2, 
'To reduce SIDS risk, the AAP recommends the "Back to Sleep" campaign (supine position only), using a firm sleep surface with no soft bedding or bumpers, and room-sharing without bed-sharing (infant sleeps in the parents'' room but on a separate crib or bassinet) for at least the first 6 months. Home monitors are not recommended to prevent SIDS.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A mother asks when she can safely introduce cow''s milk to her healthy infant''s diet. What is the most appropriate recommendation?', 
'["At 4 months of age", "At 6 months of age", "At 12 months of age", "At 24 months of age"]'::jsonb, 
2, 
'Whole cow''s milk should not be introduced until 12 months (1 year) of age. Early introduction is associated with iron deficiency anemia (due to microscopic intestinal blood loss and low iron content in cow''s milk), high renal solute load, and risk of allergies. Breast milk or iron-fortified infant formula should be the primary source of nutrition for the first year.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'At what age does the AAP recommend the introduction of solid foods (complementary foods) for a healthy, full-term infant, assuming they show developmental signs of readiness?', 
'["2 months", "4 to 6 months", "9 months", "12 months"]'::jsonb, 
1, 
'The AAP recommends introducing solid foods around 4 to 6 months of age. The infant must show developmental readiness, such as being able to sit with support and having good head and neck control. The extrusion reflex (pushing food out with the tongue) must also have diminished.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Regarding the prevention of peanut allergies, what is the current evidence-based recommendation for an infant with severe eczema and/or an egg allergy?', 
'["Avoid peanut-containing foods entirely until 3 years of age", "Introduce peanut-containing foods early, between 4 and 6 months of age, possibly after allergy testing", "Introduce peanut-containing foods only after 12 months of age", "Maternal avoidance of peanuts during breastfeeding is sufficient"]'::jsonb, 
1, 
'Current guidelines (based on the LEAP study) strongly recommend the *early* introduction of peanut-containing foods (between 4 and 6 months of age) for high-risk infants (those with severe eczema, egg allergy, or both) to prevent the development of peanut allergy. This should ideally be done after consultation with an allergist or specific IgE testing. Delaying introduction increases the risk of allergy.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-year-old child presents with bowed legs (genu varum), prominent costochondral junctions ("rachitic rosary"), and widened wrists. Laboratory tests show low calcium, low phosphorus, and highly elevated alkaline phosphatase. What nutritional deficiency is most likely responsible for these developmental skeletal changes?', 
'["Vitamin A", "Vitamin C", "Vitamin D", "Vitamin K"]'::jsonb, 
2, 
'These are the classic clinical and laboratory signs of Rickets, caused by Vitamin D deficiency. The deficiency leads to impaired bone mineralization. Manifestations include bowing of the weight-bearing long bones (genu varum), rachitic rosary (enlarged costochondral junctions), frontal bossing, and widened epiphyses at the wrists and ankles.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'To prevent Vitamin D deficiency, the AAP recommends routine Vitamin D supplementation for which group of infants?', 
'["Only formula-fed infants", "Only premature infants", "All exclusively breastfed and partially breastfed infants", "Only infants born during winter months"]'::jsonb, 
2, 
'The AAP recommends that all exclusively breastfed and partially breastfed infants receive 400 IU of supplemental Vitamin D daily, beginning in the first few days of life, because human breast milk does not contain adequate amounts of Vitamin D to prevent rickets. Formula-fed infants generally receive enough if they consume at least 1 liter of formula per day.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 9-month-old infant, exclusively breastfed since birth without any solid food introduction or vitamin/mineral supplementation, presents with pallor. A CBC reveals a hemoglobin of 8.5 g/dL and an MCV of 65 fL. What is the most appropriate next step in management?', 
'["Prescribe oral iron supplementation and recheck in 1 month", "Order a hemoglobin electrophoresis", "Schedule a bone marrow biopsy", "Transfuse packed red blood cells"]'::jsonb, 
0, 
'This infant has a classic presentation of iron deficiency anemia (microcytic, hypochromic anemia) due to prolonged exclusive breastfeeding without iron supplementation or iron-rich solid foods. Breast milk has low iron content. The most appropriate initial step is a therapeutic trial of oral iron (ferrous sulfate) and dietary modification, with a follow-up CBC/reticulocyte count in 1 month to confirm a response.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'At what age should routine screening for lead toxicity and anemia (via hemoglobin/hematocrit) typically be performed in asymptomatic, low-risk children according to standard pediatric guidelines?', 
'["Birth and 6 months", "12 and 24 months", "3 and 4 years", "5 and 6 years"]'::jsonb, 
1, 
'Universal screening for lead exposure and iron deficiency anemia is typically recommended at 12 months and 24 months of age. These ages coincide with increased mobility (crawling/walking), hand-to-mouth behaviors (increasing lead ingestion risk), and a dietary transition to whole cow''s milk (which is poor in iron).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-month-old infant is brought to the emergency department with altered mental status and seizures. A fundoscopic examination reveals bilateral retinal hemorrhages. A non-contrast head CT shows a subdural hematoma. There is no history of major trauma like a car accident. What is the most likely diagnosis?', 
'["Meningococcal meningitis", "Abusive head trauma (Shaken Baby Syndrome)", "Vitamin K deficiency bleeding", "Congenital toxoplasmosis"]'::jsonb, 
1, 
'The classic triad of abusive head trauma (formerly Shaken Baby Syndrome) consists of 1) subdural hematoma, 2) retinal hemorrhages, and 3) hypoxic-ischemic encephalopathy. It is a severe form of physical child abuse caused by violent shaking. Any unexplained intracranial hemorrhage or retinal hemorrhages in an infant should immediately raise high suspicion for abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 4-year-old child presents to the clinic with multiple bruises. Which of the following bruising patterns is most suspicious for non-accidental trauma (child abuse)?', 
'["Bruises on the anterior shins and knees", "A bruise on the forehead", "Bruises on the buttocks, back, and back of the thighs", "Bruises on the elbows"]'::jsonb, 
2, 
'Bruising over bony prominences (shins, knees, elbows, forehead) is common and expected in active, ambulatory children (the "TEN" region - Torso, Ears, Neck is bad; "FACES" is bad). Bruising in protected, soft-tissue areas that do not typically sustain impact during normal play—such as the buttocks, back, back of the thighs, genitalia, cheeks, or neck—is highly suspicious for inflicted injury/child abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 3-year-old boy is brought to the ER with a burn on his right hand and forearm. The parents state he accidentally pulled a pot of boiling water off the stove. Which clinical finding would most strongly suggest an inflicted (abusive) burn rather than an accidental spill?', 
'["The burn is localized only to the right hand and forearm", "The burn has a clear \"glove\" or \"stocking\" distribution with sharply demarcated edges", "The burn is superficial (first-degree)", "The presence of splash marks around the primary burn area"]'::jsonb, 
1, 
'A "glove" or "stocking" distribution burn with sharply demarcated edges and a lack of splash marks strongly suggests a forced immersion injury (the child was held down in hot water). Accidental spill or splash burns typically have irregular margins, an asymmetric distribution (e.g., down the front of the body), and satellite splash marks.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'During a routine exam of a 2-year-old, the pediatrician notes circular, sharply demarcated, punched-out lesions on the child''s back, each approximately 8 mm in diameter. Some are crusted, and others are scarred. What inflicted injury is most consistent with this presentation?', 
'["Cigarette burns", "Belt marks", "Iron burns", "Bite marks"]'::jsonb, 
0, 
'Circular, sharply demarcated, punched-out lesions that are uniform in size (typically 8-10 mm) and located in unusual or protected areas (like the back, palms, or soles) are classic for inflicted cigarette burns. Belt marks typically leave linear or loop-shaped bruises. Iron burns leave a triangular pattern.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A physician suspects child abuse in a 5-year-old patient who presents with a spiral fracture of the femur and a history that does not match the injury. What is the physician''s legal obligation?', 
'["Wait until absolute proof is obtained before acting", "Confront the parents and demand a confession", "Immediately report the suspicion to Child Protective Services (CPS) or local law enforcement", "Refer the family to a social worker for counseling and monitor closely"]'::jsonb, 
2, 
'All physicians and healthcare providers are mandated reporters. If there is reasonable suspicion of child abuse or neglect, the provider is legally obligated to immediately report the case to Child Protective Services (CPS) and/or local law enforcement. Waiting for "absolute proof" or trying to investigate/confront the parents independently is dangerous and incorrect.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Which of the following bone fractures in an infant under 1 year of age is virtually pathognomonic for child abuse?', 
'["Linear skull fracture", "Clavicle fracture", "Posterior rib fractures", "Distal radius buckle fracture (Torus fracture)"]'::jsonb, 
2, 
'Posterior rib fractures are highly specific for child abuse, resulting from the perpetrator violently squeezing the infant''s chest with their hands, compressing the ribs against the spine. Metaphyseal corner fractures (bucket-handle fractures) are also highly specific. Clavicle fractures are common birth injuries. Torus fractures are common accidental injuries.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A mother brings her 3-week-old infant to the clinic concerned about excessive crying. She reports the baby cries inconsolably for 3 to 4 hours every evening, pulls his legs up, and passes gas. The crying episodes have occurred 4 days a week for the past 2 weeks. The infant feeds well, is gaining weight appropriately, and the physical exam is entirely normal. What is the most likely diagnosis?', 
'["Intussusception", "Infantile colic", "Gastroesophageal reflux disease", "Cow''s milk protein allergy"]'::jsonb, 
1, 
'This is a classic description of infantile colic. Colic is defined by the "Rule of 3s": crying for >3 hours a day, for >3 days a week, for >3 weeks (though the 3-week criteria is often applied loosely in practice) in an otherwise healthy, well-fed infant. It typically peaks around 6 weeks of age and resolves by 3-4 months. Management is reassurance, soothing techniques, and parental support to prevent frustration (and abusive head trauma).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 13-year-old female presents for a well-adolescent check. Her BMI is at the 97th percentile for her age and sex. How should her weight status be classified according to CDC guidelines?', 
'["Overweight", "Obese", "Severe Obesity", "Normal weight"]'::jsonb, 
1, 
'According to CDC guidelines for children and adolescents aged 2 to 19 years: BMI between the 85th and <95th percentiles is classified as "Overweight." A BMI ≥ 95th percentile is classified as "Obese." A BMI ≥ 120% of the 95th percentile (or BMI ≥ 35 kg/m2) is "Severe Obesity."'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 10-year-old obese boy presents with a dark, velvety, hyperpigmented thickening of the skin on the back of his neck and in his axillae. What is the name of this skin finding, and what underlying metabolic condition does it strongly suggest?', 
'["Tinea versicolor; suggestive of immunodeficiency", "Acanthosis nigricans; suggestive of insulin resistance / Type 2 Diabetes Mellitus", "Erythema migrans; suggestive of Lyme disease", "Café-au-lait macules; suggestive of Neurofibromatosis type 1"]'::jsonb, 
1, 
'Acanthosis nigricans presents as dark, velvety, thickened skin plaques, most commonly in intertriginous areas (neck, axillae, groin). In the pediatric population, especially in obese children, it is a hallmark clinical sign of severe insulin resistance and a strong predictor for the development or presence of Type 2 Diabetes Mellitus.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Which of the following is the recommended first-line intervention for an 8-year-old child classified as obese (BMI > 95th percentile) without significant medical comorbidities?', 
'["Bariatric surgery evaluation", "Prescription of Orlistat", "Prescription of Metformin", "Comprehensive, intensive family-based lifestyle and behavioral modification"]'::jsonb, 
3, 
'The cornerstone and first-line treatment for pediatric obesity is comprehensive, family-based lifestyle and behavioral modification. This includes dietary changes (reducing sugary drinks, portion control), increasing moderate-to-vigorous physical activity to at least 60 minutes daily, and reducing screen time to <2 hours daily. Pharmacotherapy and surgery are reserved for older adolescents with severe obesity or failed lifestyle interventions with significant comorbidities.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 12-year-old obese boy presents with a 3-week history of a dull ache in his right thigh and knee, accompanied by a limp. The pain is worse with activity. He denies any trauma. On examination, he holds his right leg in slight external rotation and has limited internal rotation of the right hip. What is the most important imaging study to order immediately?', 
'["MRI of the right knee", "Bilateral AP and frog-leg lateral X-rays of the hips", "CT scan of the right femur", "Ultrasound of the right hip"]'::jsonb, 
1, 
'This presentation is classic for Slipped Capital Femoral Epiphysis (SCFE), an orthopedic emergency common in obese adolescent males undergoing rapid growth spurts. It presents with hip, thigh, or knee pain (referred pain) and a limp. The child holds the leg in external rotation. Bilateral AP and frog-leg lateral radiographs of the pelvis/hips are required to identify the posterior and inferior displacement of the femoral head.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-year-old boy is evaluated for delayed speech. His father reveals a family history of a genetic disorder affecting males that causes intellectual disability. On exam, the boy has a long face and prominent ears. What genetic testing technique is the most appropriate first-line diagnostic test for the suspected condition?', 
'["Standard G-banded karyotype", "FMR1 DNA testing (PCR and Southern blot) for CGG repeats", "Fluorescence in situ hybridization (FISH) for chromosome 22q11.2", "Whole exome sequencing"]'::jsonb, 
1, 
'The clinical presentation (delayed speech, long face, prominent ears, family history) strongly suggests Fragile X Syndrome. The diagnostic test of choice is specific molecular DNA testing of the FMR1 gene to determine the number of CGG trinucleotide repeats. A standard karyotype or microarray will usually NOT detect the trinucleotide expansion of Fragile X.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 6-month-old infant is diagnosed with hypotonia, global developmental delay, and severe feeding difficulties requiring a gastrostomy tube. The parents note the infant has a very weak cry and features including almond-shaped eyes and cryptorchidism. Genetic testing confirms a deletion on the paternally derived chromosome 15q11-q13. What is the diagnosis?', 
'["Angelman syndrome", "Prader-Willi syndrome", "Williams syndrome", "DiGeorge syndrome"]'::jsonb, 
1, 
'This describes Prader-Willi syndrome. It is caused by the loss of function of paternally expressed genes in the 15q11-q13 region (most commonly via a paternal microdeletion). Infants present with severe hypotonia, poor feeding, and failure to thrive. However, in early childhood (usually age 2-4), this transitions to insatiable hyperphagia, leading to severe, life-threatening obesity if access to food is not strictly controlled.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 4-year-old girl is evaluated for frequent inappropriate laughter, severe intellectual disability, an unsteady wide-based gait, and lack of speech. She also has a history of seizures. Genetic testing reveals a deletion on the maternally derived chromosome 15q11-q13. What is the diagnosis?', 
'["Prader-Willi syndrome", "Angelman syndrome", "Rett syndrome", "Fragile X syndrome"]'::jsonb, 
1, 
'This is Angelman syndrome, often referred to historically as "happy puppet syndrome." It results from the loss of function of the maternally expressed UBE3A gene on chromosome 15q11-q13 (via maternal microdeletion, paternal uniparental disomy, or mutation). Classic features include severe intellectual disability, absent speech, an ataxic gait, and a happy demeanor with frequent, paroxysmal laughter.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 5-year-old boy presents with mild intellectual disability, a very friendly and outgoing "cocktail party" personality, and distinct facial features described as "elfin" (broad forehead, short nose with a broad tip, full cheeks, and wide mouth). He was previously diagnosed with supravalvular aortic stenosis. What is the most likely genetic diagnosis?', 
'["Down syndrome", "Williams syndrome", "Turner syndrome", "Klinefelter syndrome"]'::jsonb, 
1, 
'Williams syndrome is caused by a microdeletion on chromosome 7q11.23, which includes the elastin gene (ELN). Classic features include "elfin" facies, a highly sociable/loquacious personality, mild to moderate intellectual disability (often with strong musical abilities), hypercalcemia in infancy, and cardiovascular anomalies, most classically supravalvular aortic stenosis.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A newborn presents with tetralogy of Fallot, a cleft palate, and hypocalcemic seizures due to parathyroid hypoplasia. Which chromosomal abnormality is most likely responsible for this presentation?', 
'["Trisomy 21", "Monosomy X", "22q11.2 microdeletion", "15q11-13 microdeletion"]'::jsonb, 
2, 
'This presentation is classic for DiGeorge syndrome (a presentation of the 22q11.2 deletion syndrome). The clinical features are summarized by the mnemonic CATCH-22: Cardiac abnormalities (Tetralogy of Fallot, Truncus arteriosus), Abnormal facies, Thymic aplasia (leading to T-cell immunodeficiency), Cleft palate, and Hypocalcemia (due to hypoparathyroidism), caused by a deletion on chromosome 22.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 10-year-old girl is evaluated for short stature. She has normal intelligence. Physical exam reveals a webbed neck, a broad chest with widely spaced nipples, and a high-arched palate. She has not begun puberty. What cardiovascular abnormality is most classically associated with her likely diagnosis?', 
'["Coarctation of the aorta", "Atrial septal defect", "Hypertrophic cardiomyopathy", "Patent ductus arteriosus"]'::jsonb, 
0, 
'The patient has classic features of Turner syndrome (45,X or 45,X/46,XX mosaicism). Coarctation of the aorta and bicuspid aortic valve are the most common and classic congenital heart defects associated with Turner syndrome. Other features include streak ovaries (primary amenorrhea/infertility) and horseshoe kidney.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 16-year-old male presents for evaluation of delayed puberty. He is tall with long extremities, has gynecomastia, and small, firm testes. His intelligence is low-normal, and he has struggled with reading and language skills. What is the most likely karyotype of this patient?', 
'["46,XY", "47,XXY", "47,XYY", "45,X"]'::jsonb, 
1, 
'This presentation is classic for Klinefelter syndrome. The karyotype is 47,XXY. It is the most common congenital cause of primary hypogonadism in males. Patients are typically tall, have small testes (leading to testosterone deficiency and delayed puberty/infertility), gynecomastia, and often exhibit mild language-based learning disabilities or slightly lower IQ compared to siblings.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 12-year-old boy with a history of ADHD is noted to have numerous hyperpigmented macules on his torso. On careful examination, the physician notes 8 café-au-lait spots larger than 1.5 cm, axillary freckling, and Lisch nodules (iris hamartomas) on ophthalmologic exam. What is the most significant potential neurological complication associated with this syndrome?', 
'["Cerebral aneurysm rupture", "Development of optic pathway gliomas and other nerve sheath tumors", "Progressive cerebellar ataxia", "Early-onset Alzheimer''s disease"]'::jsonb, 
1, 
'The patient has Neurofibromatosis Type 1 (NF1), an autosomal dominant disorder. Key criteria include ≥6 café-au-lait macules, axillary/inguinal freckling, Lisch nodules, and neurofibromas. A major neurological complication is the development of optic pathway gliomas (which can cause vision loss) and malignant peripheral nerve sheath tumors. Routine ophthalmologic screening is crucial.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An infant presents with new-onset infantile spasms (seizures). Wood''s lamp examination of the skin reveals multiple hypopigmented "ash-leaf" macules. An echocardiogram shows a cardiac rhabdomyoma. What is the diagnosis?', 
'["Neurofibromatosis Type 2", "Sturge-Weber syndrome", "Tuberous Sclerosis Complex", "Von Hippel-Lindau disease"]'::jsonb, 
2, 
'This is the classic presentation of Tuberous Sclerosis Complex (TSC). It is an autosomal dominant neurocutaneous disorder characterized by the development of benign tumors (hamartomas) in multiple organs. Classic findings include ash-leaf spots, infantile spasms/seizures, cardiac rhabdomyomas, renal angiomyolipomas, and cortical tubers/subependymal nodules in the brain.')

;
