-- Batch 12: 29 Child Abuse Recognition MCQs (Questions 342-370)
-- Topic: Psychosocial Factors and Final Review
-- Slug: peds-child-abuse

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'The "ACE Study" (Adverse Childhood Experiences) found a strong correlation between childhood maltreatment and which of the following adult outcomes?', 
'["Chronic physical illness (heart disease, cancer)", "Mental illness and substance abuse", "Reduced life expectancy", "All of the above"]'::jsonb, 
3, 
'The landmark ACE study showed that early trauma has a "dose-response" relationship with multiple negative health and social outcomes in adulthood.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is considered a "protective factor" that can build resilience in a child at risk for abuse?', 
'["A high-IQ", "A strong, positive relationship with at least one reliable adult (e.g., a teacher, coach, or grandparent)", "Living in a large house", "Having many siblings"]'::jsonb, 
1, 
'A single stable, caring relationship is the most powerful predictor of resilience after trauma.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Exposure to domestic violence (intimate partner violence) in the home is considered a form of child maltreatment (emotional abuse) in many states.', 
'["True", "False"]'::jsonb, 
0, 
'True. Witnessing domestic violence is traumatic for children and is associated with significant behavioral and emotional problems.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In families where domestic violence occurs, what is the likelihood that the children are also being physically abused?', 
'["Very low (< 5%)", "High (estimated 30-60% overlap)", "Only if the children intervene", "None"]'::jsonb, 
1, 
'There is a strong co-occurrence between partner abuse and child abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes the use of physical force intended to cause pain, but not injury, for the purpose of correction or control of a child''s behavior (e.g., spanking)?', 
'["Physical abuse", "Corporal punishment", "Assault", "None"]'::jsonb, 
1, 
'While the AAP and other medical organizations recommend against corporal punishment, it is legally distinguished from "abuse" in many jurisdictions unless it results in injury (bruises, marks, etc.).'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'At what point does corporal punishment (spanking) typically cross the legal line into "physical abuse"?', 
'["When the child cries", "When it leaves a mark, bruise, or injury that lasts for more than a few minutes", "Only if it is done with a belt", "Never"]'::jsonb, 
1, 
'If the physical discipline results in an injury (like a bruise or a welt), it is generally considered physical abuse and must be reported.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Children with disabilities (e.g., Autism, Cerebral Palsy, Intellectual Disability) are at a significantly higher risk for all forms of maltreatment.', 
'["True", "False"]'::jsonb, 
0, 
'True. The increased stress of caregiving and the child''s potential inability to understand or report the abuse make them more vulnerable.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is a "Parental Risk Factor" for child abuse?', 
'["Unrealistic expectations of the child''s developmental abilities", "History of being abused as a child", "Current untreated substance abuse", "All of the above"]'::jsonb, 
3, 
'These factors increase the likelihood of maltreatment, though they are not present in every case.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the term for the "intergenerational transmission of violence"?', 
'["Genetic abuse", "The cycle of abuse, where victims of childhood maltreatment are at increased risk of becoming perpetrators or victims as adults", "Family tradition", "None"]'::jsonb, 
1, 
'Breaking the cycle of abuse is a primary goal of early intervention and therapy.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A mother reports that her partner "is mean to me" and "scared of him." What should the pediatrician do regarding the child?', 
'["Nothing, it''s a marriage problem", "Assess the safety of the child, offer resources for domestic violence, and consider a report if the child is in danger or witnessing violence", "Tell her to leave immediately", "Call the partner"]'::jsonb, 
1, 
'Addressing domestic violence is a key part of child advocacy and prevention.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the primary role of "Home Visiting Programs" (like Nurse-Family Partnership) in preventing child abuse?', 
'["To spy on parents", "To provide support, parenting education, and early intervention to high-risk, first-time mothers", "To take babies away", "None"]'::jsonb, 
1, 
'Evidence-based home visiting is one of the most effective strategies for preventing child maltreatment.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Child abuse occurs only in low-income families.', 
'["True", "False, abuse occurs across all socioeconomic, racial, and religious groups"]'::jsonb, 
1, 
'Socioeconomic bias can lead to under-diagnosis in affluent families.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes the emotional harm caused by constant belittling, scapegoating, or terrorizing of a child?', 
'["Physical abuse", "Psychological/Emotional abuse", "Neglect", "None"]'::jsonb, 
1, 
'Emotional abuse can be just as damaging as physical abuse, though it is often harder to prove.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the "mandated reporter''s" responsibility if they suspect a child is being abused but the parent denies it?', 
'["Accept the parent''s denial", "File a report with CPS regardless of the parent''s denial", "Wait for proof", "Ask a neighbor"]'::jsonb, 
1, 
'The report is based on the physician''s suspicion, not the parent''s admission.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 16-year-old girl discloses that her stepfather is touching her inappropriately. She begs the doctor "not to tell" because she is afraid of being kicked out. What should the doctor do?', 
'["Promise not to tell to maintain her trust", "Explain that you are a mandatory reporter and must file a report, but you will work to ensure her safety and provide support", "Tell her she is overreacting", "Call the stepfather"]'::jsonb, 
1, 
'Honesty and adherence to mandatory reporting laws are essential. Safety planning (e.g., involving CPS immediately) is vital.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is a "Child-specific" risk factor for abuse?', 
'["Premature birth or low birth weight", "Colicky or difficult temperament", "Chronic illness", "All of the above"]'::jsonb, 
3, 
'Factors that make a child more "difficult" to care for can increase parental stress and the risk of abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the clinical significance of a "medical home" in preventing child abuse?', 
'["It is where the child lives", "A consistent relationship with a pediatrician allows for monitoring of growth, development, and family stress over time, providing more opportunities for early intervention", "It is a hospital", "None"]'::jsonb, 
1, 
'Continuity of care is a protective factor.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Most reports of child abuse result in the child being immediately removed from the home and placed in foster care.', 
'["True", "False, the goal of CPS is often to keep families together by providing services and ensuring safety within the home whenever possible"]'::jsonb, 
1, 
'Removal is a last resort used when the child''s safety cannot be guaranteed in the home.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes the traumatic stress that healthcare providers may experience from caring for victims of child abuse?', 
'["Vicarious traumatization or Compassion fatigue", "Burnout", "Hypochondria", "None"]'::jsonb, 
0, 
'Working in child abuse is emotionally taxing and requires self-care and institutional support.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with a "sentinel injury" (small bruise). A full workup is done and no other injuries are found. What is the next step?', 
'["Discharge and forget about it", "Involve CPS and social work to ensure a safe discharge plan and follow-up", "Arrest the parents", "None"]'::jsonb, 
1, 
'The sentinel injury itself proves that the child is at risk, even if other injuries aren''t found yet.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the term for a "threat" or "gesture" by a caregiver that makes a child fear for their safety, even if no physical contact occurs?', 
'["Neglect", "Emotional abuse/Terrorizing", "Accident", "None"]'::jsonb, 
1, 
'Terrorizing is a form of emotional abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: A physician should never apologize for making a report to CPS.', 
'["True, it is a professional duty and a legal requirement in the child''s best interest", "False, you should say sorry", "Only if the parents are nice", "None"]'::jsonb, 
0, 
'While you can acknowledge the difficulty of the situation for the family, a report is a necessary action for child safety.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is a "system-level" risk factor for child abuse?', 
'["Lack of affordable childcare", "High rates of community violence", "Systemic poverty", "All of the above"]'::jsonb, 
3, 
'Community and societal factors play a large role in family stress and child safety.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child has "regression" in their toilet training after a period of family stress. Is this abuse?', 
'["Yes, always", "It can be a non-specific sign of trauma or stress and warrants a gentle investigation of the family situation", "No, it''s just laziness", "None"]'::jsonb, 
1, 
'Regression is common after many types of stress, including abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the "Standard of Evidence" for a criminal conviction in child abuse?', 
'["Preponderance of the evidence", "Beyond a reasonable doubt", "Reasonable suspicion", "Clear and convincing evidence"]'::jsonb, 
1, 
'This is a higher bar than the "preponderance of the evidence" typically used by CPS for substantiation.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term refers to the multidisciplinary meeting where doctors, social workers, and police discuss a case?', 
'["Case conference", "Multi-disciplinary team (MDT) meeting", "Court hearing", "None"]'::jsonb, 
1, 
'MDT meetings are crucial for coordinating care and investigation.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Most people who were abused as children do NOT grow up to abuse their own children.', 
'["True, although they are at higher risk than the general population, the majority break the cycle", "False, everyone who was abused becomes an abuser"]'::jsonb, 
0, 
'It is important to provide hope and support to survivors.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is a final "red flag" for child abuse to always remember?', 
'["An injury in a non-mobile infant", "An injury that is inconsistent with the provided history", "A delay in seeking medical care for a significant injury", "All of the above"]'::jsonb, 
3, 
'These are the fundamental "Big Three" of child abuse recognition.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the most important first step in the "final review" of any child suspected of being abused?', 
'["Safety first", "Safety first", "Safety first", "Safety first"]'::jsonb, 
0, 
'Ensuring the child is in a safe environment is the ultimate goal of the entire process.')

;
