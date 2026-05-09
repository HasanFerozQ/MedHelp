-- Batch 9: 31 Child Abuse Recognition MCQs (Questions 249-279)
-- Topic: Neglect and Nutritional Deprivation
-- Slug: peds-child-abuse

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the most common form of child maltreatment reported to authorities in the United States?', 
'["Physical abuse", "Sexual abuse", "Neglect", "Emotional abuse"]'::jsonb, 
2, 
'Child neglect is more common than physical and sexual abuse combined. It accounts for about 75% of all reported cases of child maltreatment.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes the failure of a caregiver to provide basic necessities such as food, clothing, and shelter?', 
'["Physical neglect", "Medical neglect", "Emotional neglect", "Educational neglect"]'::jsonb, 
0, 
'Physical neglect is the most frequent subtype and involves the failure to meet the child''s basic physical needs for survival and health.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 2-year-old child presents with a weight below the 3rd percentile and a history of missing several scheduled immunizations and well-child visits. This is an example of:', 
'["Physical abuse", "Medical neglect", "Poverty only", "A normal variation"]'::jsonb, 
1, 
'Medical neglect is the failure to provide or follow through with necessary medical care, leading to potential harm to the child''s health.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which clinical sign is a hallmark of "Failure to Thrive" (FTT) due to nutritional neglect?', 
'["Severe obesity", "Growth parameters (weight and height) that are significantly below the 5th percentile or crossing percentiles downwards", "Tall stature", "Frequent ear infections"]'::jsonb, 
1, 
'FTT is primarily a manifestation of inadequate caloric intake or utilization. In neglect, weight is usually affected first, followed by height, while head circumference is often preserved until the malnutrition is severe.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 10-month-old infant is hospitalized for FTT. During the hospital stay, the infant is fed regularly by the nursing staff and gains weight rapidly. What does this indicate?', 
'["The child has a rare genetic disease", "The growth failure was primarily due to inadequate caloric provision in the home (non-organic/environmental FTT)", "The hospital food is magic", "Nothing"]'::jsonb, 
1, 
'A "feeding trial" in the hospital is a diagnostic tool. Rapid weight gain under supervision confirms that the child is capable of growing when provided with sufficient calories, pointing toward neglect or poor feeding technique.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is "Psychosocial Dwarfism"?', 
'["A genetic condition causing short stature", "A rare syndrome of growth failure and delayed puberty caused by severe emotional neglect or abuse in a stressful home environment", "A type of bone cancer", "None"]'::jsonb, 
1, 
'Psychosocial dwarfism (also called hyperphagic short stature) involves a reversible suppression of growth hormone secretion due to extreme emotional stress. These children often have abnormal eating behaviors (e.g., stealing food).'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with severe dental caries (decay) in almost all teeth, and the parent has not taken the child to a dentist despite repeated school referrals. This is an example of:', 
'["Physical abuse", "Dental neglect", "Normal childhood", "Excessive sugar intake only"]'::jsonb, 
1, 
'Dental neglect is a form of medical neglect where the failure to provide dental care results in pain, infection, or loss of function.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following environmental findings in a home visit would be most concerning for physical neglect?', 
'["A few dirty dishes in the sink", "No operable plumbing, no food in the house, and hazardous waste on the floor", "A messy playroom", "A lack of educational toys"]'::jsonb, 
1, 
'Neglect is a matter of degree. Hazards that pose an immediate risk to the child''s safety and health are critical indicators.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Poverty and child neglect are the same thing.', 
'["True", "False, as neglect involves a failure to provide care when resources ARE available or a failure to utilize existing support systems"]'::jsonb, 
1, 
'It is important to distinguish between poverty (inability to provide) and neglect (failure to provide). If a parent is doing their best with limited resources, the goal is support, not necessarily a report of "abuse."'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 12-year-old child has missed 40 days of school this year without a valid medical reason. What type of neglect does this represent?', 
'["Physical neglect", "Educational neglect", "Medical neglect", "Emotional neglect"]'::jsonb, 
1, 
'Educational neglect is the failure to ensure the child receives the legally mandated education, which can significantly impact their future development.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is a symptom of "Emotional Neglect" in an infant?', 
'["Smiling too much", "Failure to bond (Insecure attachment), social withdrawal, or ''watchful'' behavior", "Frequent crying", "Weight at the 50th percentile"]'::jsonb, 
1, 
'Emotional neglect (lack of nurturance) can lead to Attachment Disorders and significant developmental delays.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 3-year-old child is found wandering alone in a busy street at 2:00 AM. This is an example of:', 
'["Educational neglect", "Supervisory neglect", "Medical neglect", "Emotional abuse"]'::jsonb, 
1, 
'Supervisory neglect is the failure to provide adequate oversight, leading to a risk of physical harm or death.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Child neglect is a significant cause of pediatric mortality.', 
'["True", "False"]'::jsonb, 
0, 
'True. Neglect can be fatal through starvation, lack of medical care, or accidents resulting from poor supervision.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'When evaluating a child for FTT, which measurement is usually the *last* to be affected by chronic malnutrition?', 
'["Weight", "Height", "Head Circumference", "Mid-arm circumference"]'::jsonb, 
2, 
'The "brain-sparing" effect means head growth is preserved the longest. If head circumference is low, it suggests very long-standing, severe malnutrition or a primary neurological disorder.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child with severe nutritional neglect may present with signs of specific vitamin deficiencies. Which vitamin deficiency causes "rickets" (bowed legs, widened wrists)?', 
'["Vitamin A", "Vitamin C", "Vitamin D", "Vitamin K"]'::jsonb, 
2, 
'Nutritional rickets can occur in cases of severe neglect where the child is not provided with adequate diet or sunlight.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is "Medical Child Abuse" (formerly Munchausen by Proxy)?', 
'["Failure to take a child to the doctor", "A form of abuse where a caregiver fabricates or induces illness in a child to gain attention or for other psychological reasons", "A mistake made by a doctor", "None"]'::jsonb, 
1, 
'This is a complex form of abuse that will be covered in more detail in the next batch.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes a parent who refuses life-saving medical treatment for a child (e.g., blood transfusion for severe anemia) based on religious beliefs?', 
'["Medical neglect", "Religious exemption", "Neither", "Both, and it often requires a court order to provide treatment"]'::jsonb, 
3, 
'While religious beliefs are respected, the "best interest of the child" takes precedence in life-threatening situations, and the state can intervene to ensure the child receives necessary care.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with a severe, infected diaper rash that appears to have been present for weeks without any attempt at treatment. This is a sign of:', 
'["Physical abuse", "Physical/Hygiene neglect", "Normal toddlerhood", "Allergic reaction to diapers"]'::jsonb, 
1, 
'Chronic, untreated skin conditions like severe diaper dermatitis or scabies can be markers of poor hygiene and neglect.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which factor is a major risk for child neglect?', 
'["High IQ", "Parental substance abuse (especially opioid or alcohol addiction)", "Stable employment", "Having many books at home"]'::jsonb, 
1, 
'Substance abuse is a leading contributor to neglect, as it impairs the parent''s ability to prioritize and meet the child''s needs.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In a case of suspected neglect, the "Home Visit" is a critical tool for:', 
'["Arresting the parents", "Direct observation of the child''s living conditions, food availability, and safety", "Cleaning the house", "None"]'::jsonb, 
1, 
'Home visits by social workers or public health nurses provide the most accurate assessment of the family''s environment.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A mother is diagnosed with severe, untreated postpartum depression and is unable to care for or interact with her infant. What is the risk to the child?', 
'["No risk", "Severe emotional and physical neglect", "The baby will be fine", "None"]'::jsonb, 
1, 
'Maternal mental illness is a major risk factor for neglect and requires immediate intervention for both the mother and the child.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: "Educational neglect" laws apply only to children in public schools.', 
'["True", "False, they apply to all children, including those who are homeschooled (if state requirements are not met)"]'::jsonb, 
1, 
'Parents have the right to homeschool but must follow state guidelines for educational progress.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes a child who is left alone for long periods because the parent is working multiple jobs to survive?', 
'["Intentional neglect", "Latchkey child / Circumstantial neglect", "Physical abuse", "None"]'::jsonb, 
1, 
'This highlights the overlap between poverty and neglect. The goal here is to provide childcare support rather than punitive measures.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 6-year-old child presents with "thin, brittle hair," "potbelly" (ascites), and "edema." This suggests severe protein-calorie malnutrition known as:', 
'["Marasmus", "Kwashiorkor", "Rickets", "Obesity"]'::jsonb, 
1, 
'Kwashiorkor is severe protein deficiency and represents a life-threatening form of nutritional neglect.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In children with chronic neglect, what is a common developmental finding?', 
'["Advanced language skills", "Global developmental delay across all domains", "Superior motor skills", "None"]'::jsonb, 
1, 
'Lack of stimulation and nutrition leads to significant cognitive and motor delays.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child is found to have "chronic lice" and "scabies" that have persisted for over a year despite school notifications. This falls under:', 
'["Physical abuse", "Hygiene neglect", "Normal childhood", "Genetic predisposition to parasites"]'::jsonb, 
1, 
'Persistent, untreated infestations are a clear sign of neglect.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the term for a child who is not provided with adequate "safety equipment" (e.g., car seats, helmets) despite parental ability to afford them?', 
'["Accidental risk", "Safety neglect", "Physical abuse", "None"]'::jsonb, 
1, 
'Safety neglect involves a failure to protect the child from preventable injuries.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which common childhood condition requires strict adherence to a medical regimen (e.g., insulin) and can lead to "medical neglect" if the parent fails to provide it?', 
'["Asthma", "Type 1 Diabetes Mellitus", "Eczema", "Common cold"]'::jsonb, 
1, 
'Diabetes is a frequent area of medical neglect, as the consequences of missing insulin can be fatal.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Emotional neglect can be more damaging to long-term brain development than a single episode of physical abuse.', 
'["True", "False"]'::jsonb, 
0, 
'True. Chronic lack of "serve and return" interaction (nurturance) is toxic to the developing architecture of the brain.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the primary intervention for most cases of child neglect?', 
'["Arresting the parents", "Supportive services, including parental education, substance abuse treatment, and financial assistance", "Foster care for every child", "None"]'::jsonb, 
1, 
'The goal is usually to strengthen the family and address the underlying causes of the neglect.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A physician suspects neglect but isn''t sure if it''s "serious enough" to report. What is the best course of action?', 
'["Wait until it gets worse", "Consult with a Child Abuse Specialist or Social Worker and report the suspicion to CPS", "Forget it", "Ask the parent if they are neglecting the child"]'::jsonb, 
1, 
'When in doubt, report. The CPS system is designed to assess the family''s needs and provide help.')

;
