-- Batch 1: 31 Child Abuse Recognition MCQs (Questions 1-31)
-- Topic: Epidemiology, Reporting, and General Recognition
-- Slug: peds-child-abuse

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In all 50 states in the U.S., which of the following professionals is a "mandatory reporter" of suspected child abuse?', 
'["Only physicians and nurses", "Physicians, nurses, teachers, and social workers", "Only police officers", "Only parents"]'::jsonb, 
1, 
'Mandatory reporters include most professionals who work with children, including healthcare workers, educators, social workers, and law enforcement. The legal requirement is to report *suspicion*, not to prove abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the legal standard for a healthcare provider to make a report to Child Protective Services (CPS)?', 
'["Proof beyond a reasonable doubt", "Clear and convincing evidence", "Reasonable suspicion (or ''reason to believe'')", "Personal witness of the abuse"]'::jsonb, 
2, 
'The standard for reporting is "reasonable suspicion." A healthcare provider does not need to be certain or have proof; if the history or exam is suspicious for non-accidental trauma, a report must be made.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following historical findings is most concerning for non-accidental trauma (child abuse)?', 
'["A history that is consistent with the child''s developmental level", "A history that changes significantly between different caregivers", "A detailed description of a fall from a high couch", "Immediate seeking of medical attention after an injury"]'::jsonb, 
1, 
'A history that changes, is inconsistent with the injury, or is developmental impossible (e.g., a 2-month-old "rolling off a bed") is a major red flag for abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is meant by a "sentinel injury" in the context of child abuse?', 
'["A life-threatening injury that requires surgery", "A minor, seemingly insignificant injury (like a small bruise or mouth cut) in a non-ambulatory infant", "An injury that occurs in front of a witness", "A chronic medical condition"]'::jsonb, 
1, 
'Sentinel injuries are often small (a bruise, a torn frenulum) but are highly significant in non-ambulatory infants ("those who don''t cruise, don''t bruise"). They often precede more severe or fatal abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 4-month-old infant is brought to the ED for a small bruise on the cheek. The mother says the baby hit himself with a rattle. What is the most appropriate next step?', 
'["Reassure the mother and discharge home", "Admit for observation", "Perform a full child abuse evaluation, including a skeletal survey", "Tell the mother she is lying"]'::jsonb, 
2, 
'Bruising in a 4-month-old is never normal. A "sentinel" bruise in a non-mobile infant requires a comprehensive evaluation for further occult injuries (fractures, head trauma).'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is the leading cause of death from child abuse in infants?', 
'["Abdominal trauma", "Neglect/Malnutrition", "Abusive Head Trauma (AHT)", "Sexual abuse"]'::jsonb, 
2, 
'Abusive Head Trauma (formerly Shaken Baby Syndrome) is the leading cause of child abuse-related mortality, accounting for the majority of deaths in infants under 1 year of age.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which age group is at the highest risk for fatal child abuse?', 
'["Adolescents (13-18 years)", "School-age children (6-12 years)", "Infants and children under age 4", "There is no difference in age"]'::jsonb, 
2, 
'Infants and children under 4 years of age account for about 70-80% of child abuse fatalities, likely due to their physical vulnerability and the high stress of caregiving for young children.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A physician reports a case of suspected abuse to CPS in good faith, but the investigation eventually finds that no abuse occurred. Is the physician liable for damages?', 
'["Yes, for defamation", "Yes, for violation of privacy", "No, mandatory reporters are generally immune from civil and criminal liability if reporting in good faith", "Only if the parent sues"]'::jsonb, 
2, 
'Statutes in all states provide immunity from liability for mandatory reporters who report suspected child abuse in good faith, even if the report is later found to be unsubstantiated.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the primary goal of the "Initial Medical Evaluation" in a suspected child abuse case?', 
'["To catch the perpetrator", "To identify all injuries and ensure the child''s safety and medical stability", "To testify in court", "To psychoanalyze the parents"]'::jsonb, 
1, 
'The medical provider''s primary role is to treat the child''s injuries, identify occult (hidden) trauma, and ensure safety. Criminal investigation is the role of law enforcement.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In medical documentation of a suspected abuse case, how should a physician record the history provided by the caregiver?', 
'["Paraphrase the mother''s words to save time", "Use direct quotes whenever possible and avoid judgmental language", "State ''the mother lied about the fall''", "Write as little as possible to avoid legal issues"]'::jsonb, 
1, 
'Forensic documentation should be objective, detailed, and include direct quotes (e.g., "Mother states: ''He fell from the crib.''") without injecting personal bias or conclusions.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following parental factors is associated with an increased risk for child abuse?', 
'["High socioeconomic status", "Social isolation and lack of a support network", "Parental age > 40", "College education"]'::jsonb, 
1, 
'Risk factors for child abuse include: social isolation, poverty, domestic violence, parental substance abuse, and untreated mental illness. However, abuse can occur in any demographic.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: A healthcare provider should delay medical treatment for a child with suspected abuse until law enforcement arrives.', 
'["True", "False", "Only if the injuries are minor", "None"]'::jsonb, 
1, 
'False. Life-saving and necessary medical care must always take priority. Law enforcement and CPS can be notified while the child is being stabilized.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the "TEN-4" Bruising Rule for identifying suspicious bruises in children under 4 years old?', 
'["Any bruise on the Trunk, Ears, or Neck", "Ten bruises total", "Any bruise that lasts 4 days", "Bruises on the Tibia, Elbows, or Nose"]'::jsonb, 
0, 
'The TEN-4 rule (and the expanded TEN-4-FACES-P) helps identify suspicious bruises. Bruising on the **T**runk, **E**ars, or **N**eck in a child under **4** years, or *any* bruise on a child under 4 months, is highly suggestive of abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 2-year-old child is brought to the clinic for "behavioral issues." On exam, the physician notes several small, round, hyperpigmented macules on the back that the mother says are "birthmarks." What should be considered?', 
'["Mongolian spots (Congenital dermal melanocytosis)", "Cigarette burns", "Neurofibromatosis", "Tinea versicolor"]'::jsonb, 
0, 
'Mongolian spots are common, especially in darker-skinned infants, and can be mistaken for bruises. However, they are present from birth and don''t change like bruises do. Round, circular scars might suggest cigarette burns.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'When evaluating a child for physical abuse, which of the following is a critical part of the physical examination?', 
'["Checking the hair for lice", "A full, head-to-toe skin exam with the child completely undressed", "Measuring the child''s IQ", "Checking for dental cavities"]'::jsonb, 
1, 
'A complete skin exam is vital to identify bruising, burns, or scars that might be hidden by clothing. Genital and perianal exams are also performed if sexual abuse is suspected.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 6-month-old infant is brought to the ED with a seizure. A head CT shows a subdural hematoma. The parents say the baby "fell off the bed (2 feet) onto carpet." Is this history consistent with the injury?', 
'["Yes, infants have soft skulls", "No, short accidental falls rarely cause subdural hematomas or severe brain injury", "Only if the baby landed on his head", "It depends on the carpet"]'::jsonb, 
1, 
'Short falls (under 3-4 feet) onto a flat surface almost never cause intracranial hemorrhage or complex skull fractures. This history-injury mismatch is strongly suggestive of Abusive Head Trauma.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the role of a "Child Advocacy Center" (CAC)?', 
'["To arrest the parents", "To provide a child-friendly, multi-disciplinary environment for forensic interviews and exams", "To provide long-term foster care", "To act as a judge in the case"]'::jsonb, 
1, 
'CACs allow medical, legal, and social services to coordinate in a way that reduces trauma to the child (e.g., performing one forensic interview instead of many).'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes a caregiver who provides a history of an injury that is developmentally impossible for the child (e.g., "the 1-month-old rolled off the couch")?', 
'["Inaccurate history", "Developmental history mismatch", "Parental fabrication", "None"]'::jsonb, 
1, 
'History-developmental mismatch is a hallmark of physical abuse. Infants do not roll until ~4 months, and do not pull to stand until ~9 months.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 15-month-old child has several bruises over the shins and a small scrape on the forehead. The mother says he "is a klutz and falls while running." Is this concerning?', 
'["Yes, any bruise is abuse", "No, these are common ''accidental'' locations for an ambulatory toddler", "Only if the bruises are different colors", "Only if the child is crying"]'::jsonb, 
1, 
'Bruises on the shins, knees, forehead, and chin are "accidental" sites in active toddlers. Suspicious sites include the cheeks, ears, neck, upper arms, trunk, and buttocks.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In cases of suspected neglect, "Failure to Thrive" (FTT) is defined as:', 
'["A child who is unhappy", "Growth failure (weight < 5th percentile or crossing percentiles) due to inadequate caloric intake", "A child who doesn''t talk", "A child with many infections"]'::jsonb, 
1, 
'Nutritional neglect is a form of physical neglect. FTT is the clinical manifestation of chronic undernutrition.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 3-year-old child is hospitalized for a severe fracture. The physician suspects abuse and makes a report. The parents become angry and want to take the child home "Against Medical Advice" (AMA). What should the physician do?', 
'["Let them go to avoid conflict", "Call hospital security and place an ''emergency hold'' (Medical Hold) to keep the child in the hospital while CPS is notified", "Call the police to arrest the parents in the lobby", "Call the parents'' lawyer"]'::jsonb, 
1, 
'Physicians have the legal authority (and duty) to place an emergency medical hold on a child if they believe the child is in imminent danger if discharged.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is a "Medical Mimic" that can cause bruising and might be confused with child abuse?', 
'["Hypertension", "Von Willebrand Disease", "Diabetes", "Asthma"]'::jsonb, 
1, 
'Bleeding disorders (like vWD or Hemophilia) and Henoch-Schönlein purpura (HSP) can cause easy bruising and must be considered in the differential diagnosis.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the most appropriate way to photograph injuries in a suspected abuse case?', 
'["Use a personal cell phone", "Take photos with a high-quality camera, including a ruler/scale for size and a labels for identification", "Only take photos of the face", "Do not take photos, as it violates privacy"]'::jsonb, 
1, 
'Forensic photography requires clear, well-lit photos. A scale (ruler) should be used in the frame to show the size of the injury.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A mother brings her 3-year-old to the clinic and says "I''m afraid I might hurt him; I''m so stressed and he won''t stop crying." What is the best response?', 
'["Call the police immediately to arrest her", "Validate her feelings, assess child safety, and provide resources (counseling, respite care, support groups)", "Tell her she is a bad mother", "Report her to CPS for verbal abuse"]'::jsonb, 
1, 
'A parent seeking help before abuse occurs is a critical opportunity for prevention. Support and resources can prevent a tragedy.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: If a child is in the hospital, the perpetrator is usually not allowed to visit.', 
'["True", "False", "Only if they are arrested", "Depends on CPS/Police instructions"]'::jsonb, 
3, 
'Hospital visitation for a child in state custody or under investigation is determined by CPS and law enforcement to ensure the child''s safety.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In the context of child abuse, what does "Non-Accidental Trauma" (NAT) refer to?', 
'["An injury that was purely an accident", "An injury inflicted upon a child with intent or through gross negligence", "A sports injury", "A birth injury"]'::jsonb, 
1, 
'NAT is the medical term used to describe physical injuries that are not the result of a chance accident.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is true regarding "Child Neglect"?', 
'["It is less common than physical abuse", "It is the most common form of child maltreatment reported to authorities", "It is never fatal", "It only refers to lack of food"]'::jsonb, 
1, 
'Neglect is actually the most common form of child abuse reported, often exceeding the number of cases of physical and sexual abuse combined.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 4-year-old child has a "patterned" bruise on the back that looks exactly like a belt buckle. This is known as:', 
'["Accidental bruising", "Patterned injury", "Allergic reaction", "Normal skin variation"]'::jsonb, 
1, 
'Patterned injuries (e.g., from a belt, cord, hairbrush, or hand) are highly diagnostic of physical abuse because they reflect the shape of the object used.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the purpose of a "Skeletal Survey"?', 
'["To look for pneumonia", "A series of specialized X-rays of all major bones to identify occult (hidden) or healing fractures", "To check the bone age", "To look for tumors"]'::jsonb, 
1, 
'A skeletal survey is mandatory in children < 2 years old with suspected physical abuse to look for fractures that may not be clinically apparent.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A physician suspects abuse but decides not to report it because the family is "prominent and nice." This is an example of:', 
'["Professional discretion", "Confirmation bias / Socioeconomic bias", "Good clinical judgment", "Legal immunity"]'::jsonb, 
1, 
'Bias is a major reason why abuse is under-reported in affluent families. Abuse occurs across all social and economic classes.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the most important "protective factor" against child abuse in a high-risk family?', 
'["A high income", "A strong, supportive social network and stable housing", "Living in a city", "Having only one child"]'::jsonb, 
1, 
'Social support and "resilience" are key protective factors that help parents manage stress without resorting to maltreatment.')

;
