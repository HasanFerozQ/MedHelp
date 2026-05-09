-- Batch 7: 31 Child Abuse Recognition MCQs (Questions 187-217)
-- Topic: Sexual Abuse - History and Physical Findings
-- Slug: peds-child-abuse

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the most common physical examination finding in a child who has been sexually abused?', 
'["A torn hymen", "Vaginal bleeding", "A completely normal physical examination", "Presence of sperm"]'::jsonb, 
2, 
'In the vast majority (> 90%) of documented child sexual abuse cases, the physical exam is completely normal. The lack of physical findings does NOT rule out abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following behavioral signs is most concerning for potential sexual abuse in a prepubertal child?', 
'["Fear of the dark", "Regressive behaviors (e.g., bedwetting)", "Age-inappropriate, sophisticated sexual knowledge or ''sexualized'' behavior", "Crying when a diaper is changed"]'::jsonb, 
2, 
'While behavioral changes like regression or withdrawal are common in all forms of trauma, "sexualized" behavior that is beyond the child''s developmental level is a specific red flag for sexual abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the preferred position for examining a prepubertal girl for suspected sexual abuse to maximize visualization of the hymen?', 
'["Lithotomy position (feet in stirrups)", "Frog-leg or knee-chest position", "Standing up", "Prone (on stomach)"]'::jsonb, 
1, 
'The frog-leg position (supine) and the knee-chest position are the most comfortable and effective for visualizing the external genitalia in children.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In a prepubertal girl, what is the "hymen" primarily composed of?', 
'["A solid membrane that must be ''broken''", "A thin, estrogen-depleted, well-perfused rim of tissue", "Muscle", "Nerve endings"]'::jsonb, 
1, 
'The prepubertal hymen is very thin and sensitive due to the lack of estrogen. It is not a solid "seal" and naturally has an opening (the hymeneal orifice).'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following physical findings is considered "diagnostic" or highly suspicious for penetrating sexual trauma in a child?', 
'["A wide hymeneal opening", "A transection (complete tear) of the hymenal rim extending to the vaginal wall", "Redness of the labia", "Small amount of vaginal discharge"]'::jsonb, 
1, 
'Tears that extend through the entire thickness of the hymenal rim are highly suggestive of penetrating trauma. Redness and discharge are non-specific and often due to hygiene or infection.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 5-year-old girl has a "hymeneal orifice" (opening) that measures 5 mm. Is this finding diagnostic of sexual abuse?', 
'["Yes, it should be smaller", "No, hymeneal orifice size varies greatly and is not a reliable indicator of abuse on its own", "Only if it is red", "Only if she is crying"]'::jsonb, 
1, 
'Hymeneal measurements have been shown to have wide normal ranges and are no longer used as a primary diagnostic criterion for abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the term for the "bump" or "mound" of tissue often seen on the hymenal rim of prepubertal girls, which is a normal anatomical variant?', 
'["Hymenal cyst", "Hymenal tag or redundant tissue", "Hymenal tear", "Wart"]'::jsonb, 
1, 
'Hymenal tags and redundant tissue are common normal variants and can be mistaken for scars or injuries by inexperienced examiners.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In the evaluation of suspected sexual abuse, what is the role of a "Colposcope" (or a high-resolution camera)?', 
'["To perform surgery", "To provide magnification and clear documentation (photography) of the genital and perianal anatomy", "To look for bacteria", "None"]'::jsonb, 
1, 
'Colposcopy allows for a detailed exam and creates a forensic record that can be reviewed by other experts.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with "perianal skin tags" and some redness. The parent is worried about sexual abuse. What common medical condition should be ruled out first?', 
'["Crohn disease", "Chronic constipation and anal fissures", "Diabetes", "Asthma"]'::jsonb, 
1, 
'Constipation is very common in children and can cause anal fissures, redness, and even skin tags (sentinel piles). These are much more common causes of perianal findings than sexual abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the term for the "milky-white" appearance of the prepubertal vaginal mucosa, which is a normal finding?', 
'["Leukoplakia", "Physiologic leukorrhea", "Vaginal discharge", "None"]'::jsonb, 
1, 
'A small amount of clear or white discharge is often normal. If it is foul-smelling, bloody, or purulent, it requires investigation for infection or a foreign body.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: If a child describes sexual abuse but has a normal physical exam, the report should be considered "unsubstantiated."', 
'["True", "False, as the history and disclosure are the most important elements, and most abuse leaves no physical trace", "Only if there are no witnesses", "Only if the child is over age 10"]'::jsonb, 
1, 
'The child''s disclosure is often the only evidence. A normal exam does not invalidate the child''s story.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which anatomical finding is a "normal variant" but often mistaken for a scar in the posterior part of the hymen?', 
'["Hymenal notch", "Hymenal transection", "Hymenal bridge", "Hymenal cyst"]'::jsonb, 
0, 
'Notches (especially in the "upper" or anterior half of the hymen) are common normal variants. Transections in the posterior half are more suspicious.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is "Labial Adhesion" (or labial fusion) and its significance in child abuse?', 
'["It is a sign of repeated sexual trauma", "It is a common benign condition in prepubertal girls where the labia minora stick together, usually due to low estrogen and local irritation", "It is a birth defect", "It is a contagious infection"]'::jsonb, 
1, 
'Labial adhesions are very common and NOT a sign of abuse. They can be treated with topical estrogen cream or simple observation.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 4-year-old child presents with "venereal warts" (Condyloma acuminata). What is the significance regarding sexual abuse?', 
'["It is proof of abuse", "While it can be transmitted non-sexually (e.g., from a caregiver''s hands or during birth), sexual abuse MUST be thoroughly investigated and considered", "It is only from toilets", "It is a normal part of puberty"]'::jsonb, 
1, 
'The presence of an STI (like HPV) in a child is a major red flag for sexual abuse, although non-sexual transmission is possible.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes the involuntary contraction of the pelvic floor muscles when an exam is attempted, often due to fear or pain?', 
'["Vaginismus", "Labial fusion", "Hymenal spasm", "None"]'::jsonb, 
0, 
'Vaginismus can make a genital exam difficult and should be managed with a gentle, child-centered approach.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the significance of "semen" found on a child''s body or clothing?', 
'["It is a normal finding", "It is forensic proof of sexual contact and must be collected immediately with a sexual assault kit", "It doesn''t mean anything", "It only happens in adults"]'::jsonb, 
1, 
'Semen is definitive evidence of sexual contact and is a forensic emergency for evidence collection.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with a "perianal venous congestion" (darkening/swelling of the veins around the anus) during the exam. Is this diagnostic of abuse?', 
'["Yes, it means anal penetration", "No, it is a non-specific finding often caused by the child straining or being in the knee-chest position during the exam", "Only if it is bleeding", "Only if there are warts"]'::jsonb, 
1, 
'Venous congestion is a common, non-diagnostic finding during the perianal exam, often due to the positioning of the child.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the role of a "Forensic Interviewer"?', 
'["To give the child a physical exam", "A trained professional who conducts a neutral, non-leading, and developmentally appropriate interview to elicit a child''s history", "To act as the child''s lawyer", "To arrest the suspect"]'::jsonb, 
1, 
'The forensic interview is the primary tool for gathering the child''s account of what happened in a way that is admissible in court and minimizes trauma.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Most perpetrators of child sexual abuse are strangers ("stranger danger").', 
'["True", "False, the vast majority of perpetrators are known to the child (e.g., family members, neighbors, coaches, or family friends)"]'::jsonb, 
1, 
'Over 90% of child sexual abuse is committed by someone the child knows and trusts.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A prepubertal girl presents with "vaginal bleeding" but no history of trauma. What medical condition should be considered in the differential?', 
'["Precocious puberty", "Vaginal foreign body", "Lichen sclerosus", "All of the above"]'::jsonb, 
3, 
'All of these can cause vaginal bleeding and must be distinguished from trauma through a careful exam.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is "Lichen Sclerosus" and how can it mimic abuse?', 
'["A contagious fungal infection", "An inflammatory skin condition that causes thinning, whitening, and ''parchment-like'' skin in the anogenital area, often with bruising and tearing", "A type of wart", "None"]'::jsonb, 
1, 
'Lichen sclerosus can cause subepithelial hemorrhages (bruises) and fissures that look very much like trauma. It is treated with topical steroids.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term refers to the small, white, pearly bumps often seen on the glans of the penis or the labia, which are normal anatomical structures?', 
'["Warts", "Hymenal cysts", "Pearly penile papules (or vestibular papillae)", "Herpes"]'::jsonb, 
2, 
'These are normal variants and should not be mistaken for STIs.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: A "reflex anal dilation" (opening of the anus when the buttocks are gently separated) is definitive proof of anal penetration.', 
'["True", "False, it is a non-specific finding that can be seen in normal children, especially those with constipation", "Only if it is > 2 cm", "Only if it is painful"]'::jsonb, 
1, 
'Reflex anal dilation was once thought to be diagnostic, but it is now known to be a non-specific finding.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 14-year-old girl is found to be pregnant. Her boyfriend is also 14. Is this child abuse?', 
'["Yes, always", "In many states, consensual sexual activity between peers (close in age) is not considered ''abuse,'' but laws vary; the situation must still be assessed", "No, it is impossible", "Only if she is crying"]'::jsonb, 
1, 
'Statutory rape laws and mandatory reporting requirements for pregnant minors vary significantly by state and depend on the age difference between the parties.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is a "behavioral red flag" for sexual abuse in an older child or adolescent?', 
'["Sudden onset of running away", "Substance abuse", "Suicidal ideation or self-harm", "All of the above"]'::jsonb, 
3, 
'While non-specific, these behaviors are often associated with a history of trauma, including sexual abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the term for a "split" or "tear" in the posterior fourchette of the vagina, which can occur during penetrating trauma or accidentally from severe straddle injuries?', 
'["Fissure", "Laceration", "Abrasion", "Ecchymosis"]'::jsonb, 
1, 
'A posterior fourchette laceration is a significant finding that requires documentation and follow-up.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'When is an "Acute" (Emergency) Sexual Assault Forensic Exam recommended?', 
'["Only for girls", "Within 72-96 hours of the alleged assault to maximize the chance of collecting DNA evidence and treating acute injuries", "Any time after the assault", "Only if the child is bleeding"]'::jsonb, 
1, 
'DNA evidence (semen, saliva) degrades quickly. Acute exams should be done as soon as possible after the event.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Most victims of child sexual abuse disclose the abuse immediately after it happens.', 
'["True", "False, disclosure is often delayed by months or years due to fear, shame, or threats from the perpetrator"]'::jsonb, 
1, 
'Delayed disclosure is the norm, not the exception.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes the process where a perpetrator slowly builds a relationship and trust with a child and their family to facilitate abuse?', 
'["Grooming", "Mentoring", "Gaslighting", "None"]'::jsonb, 
0, 
'Grooming is a deliberate tactic used by predators to lower the child''s defenses and ensure their silence.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child with a "straddle injury" (e.g., falling onto a bicycle crossbar) typically has injuries in which location?', 
'["Only the hymen", "The anterior (front) parts of the genitalia, such as the labia majora or the clitoral hood, usually NOT the hymen", "The neck", "The back"]'::jsonb, 
1, 
'Straddle injuries are common accidents but typically affect the "outside" structures that hit the object. Injuries to the "inner" hymen are much more concerning for abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In a child with a suspected sexual assault, why is it important to check for "STIs" like Chlamydia and Gonorrhea?', 
'["To check for allergies", "Detection of a sexually transmitted infection that is not known to be perinatally transmitted is strong evidence of sexual contact", "To check for pregnancy", "None"]'::jsonb, 
1, 
'STIs are powerful markers of sexual contact in prepubertal children.')

;
