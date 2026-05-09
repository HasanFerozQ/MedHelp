-- Batch 10: 31 Child Abuse Recognition MCQs (Questions 280-310)
-- Topic: Medical Child Abuse (Factitious Disorder Imposed on Another)
-- Slug: peds-child-abuse

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the currently accepted medical term for the condition previously known as "Munchausen Syndrome by Proxy"?', 
'["Fictional illness syndrome", "Medical Child Abuse (MCA) or Factitious Disorder Imposed on Another (FDIA)", "Parental delusion disorder", "Hypochondriasis by Proxy"]'::jsonb, 
1, 
'Medical Child Abuse (MCA) focuses on the harm to the child, while Factitious Disorder Imposed on Another (FDIA) is the DSM-5 psychiatric diagnosis for the caregiver.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is a hallmark clinical feature of Medical Child Abuse?', 
'["Symptoms that only occur in the presence of the caregiver and resolve when the child is separated from them", "A child who has a very clear, easy-to-diagnose disease", "A caregiver who is rarely at the hospital", "Symptoms that get worse during hospitalization with 24/7 nursing care"]'::jsonb, 
0, 
'The resolution of symptoms during a "separation trial" or when the caregiver is not present is one of the strongest indicators of MCA.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the most common motivation for a caregiver to engage in Medical Child Abuse?', 
'["Financial gain (insurance fraud)", "The need for attention, sympathy, and a sense of ''heroism'' or control within the medical system", "Hatred of the child", "Simple ignorance of medical facts"]'::jsonb, 
1, 
'The primary motivation is typically psychological—the caregiver (most often the mother) seeks the "sick role by proxy" and the attention and validation provided by the medical staff.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 2-year-old child has had "repeated, unexplained apnea episodes" at home, but multiple sleep studies and monitors in the hospital have been completely normal. The mother is "highly knowledgeable" and very involved in the care. What should be considered?', 
'["Severe asthma", "Medical Child Abuse (induced apnea/suffocation)", "Congenital central hypoventilation syndrome", "Reflux"]'::jsonb, 
1, 
'Repeated, life-threatening episodes that occur only at home or in private with the caregiver are a classic presentation of MCA.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following methods might a caregiver use to "induce" illness in a child in a case of MCA?', 
'["Administering unprescribed medications (e.g., insulin, laxatives, salt)", "Contaminating medical samples with bacteria or sugar", "Intentional suffocation or poisoning", "All of the above"]'::jsonb, 
3, 
'Caregivers may go to extreme and dangerous lengths to produce the symptoms they are describing.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 4-year-old child presents with "unexplained, severe diarrhea" that stops immediately when the child is admitted to the hospital and restricted to hospital food. A stool test shows a high "osmotic gap" and the presence of phenolphthalein. What is the diagnosis?', 
'["Celiac disease", "Laxative abuse (Medical Child Abuse)", "Crohn disease", "Giardiasis"]'::jsonb, 
1, 
'Induced diarrhea through the administration of laxatives is a common form of MCA.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: The "perpetrator" in MCA often has some level of medical training or an obsessive interest in medical details.', 
'["True", "False"]'::jsonb, 
0, 
'True. They often speak "the language" of doctors and nurses, which helps them manipulate the medical team and prolong the investigation.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is a "Separation Trial" in the evaluation of suspected MCA?', 
'["Sending the child to foster care permanently", "A strictly monitored period where the caregiver is not allowed to be alone with or provide care for the child to see if symptoms resolve", "Moving the child to a different room", "None"]'::jsonb, 
1, 
'A separation trial is a powerful diagnostic tool, but it must be done carefully and with legal/social work support.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A mother reports that her 6-year-old has "frequent seizures" and has been on multiple anticonvulsants without success. In the hospital, the child has a "seizure" while the mother is present, but the simultaneous EEG is completely normal. This is an example of:', 
'["Refractory epilepsy", "Fabricated or induced seizures (MCA)", "Absence seizures", "None"]'::jsonb, 
1, 
'Seizures are one of the most commonly fabricated symptoms in MCA because they are difficult to disprove without prolonged monitoring.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes the practice of a caregiver "shopping" for different doctors or hospitals to get a specific diagnosis or treatment for a child?', 
'["Medical tourism", "Doctor shopping", "Second opinion seeking", "None"]'::jsonb, 
1, 
'"Doctor shopping" is a red flag, as it allows the caregiver to restart the medical workup before a previous team can identify the deception.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Covert video monitoring (CVM) in a hospital room is an ethically complex but highly effective tool for catching a caregiver inducing symptoms.', 
'["True", "False"]'::jsonb, 
0, 
'True. CVM has been used to capture caregivers actively suffocating or poisoning children. It requires strict legal and ethical oversight.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child with a history of "recurrent sepsis" with unusual organisms (e.g., polymicrobial or fecal flora) in the blood should be evaluated for:', 
'["Severe immunodeficiency", "Intentional contamination of IV lines or injection of contaminated material (MCA)", "Cystic fibrosis", "None"]'::jsonb, 
1, 
'While immunodeficiency is in the differential, "unusual" or "impossible" infections are a major warning sign for MCA.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is a characteristic of a "Factitious Disorder" caregiver''s reaction when medical tests are normal?', 
'["Relief and happiness", "Anger, frustration, and a demand for more invasive or specialized testing", "Acceptance", "None"]'::jsonb, 
1, 
'Instead of being relieved that their child is healthy, the perpetrator of MCA is often upset that the "diagnosis" has not been found.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child is found to have "recurrent hypoglycemia" and high levels of insulin in the blood, but very LOW levels of C-peptide. What is the cause?', 
'["Insulinoma", "Exogenous insulin administration (Medical Child Abuse)", "Type 1 Diabetes", "Adrenal insufficiency"]'::jsonb, 
1, 
'C-peptide is released when the body makes its own insulin. High insulin with low C-peptide proves the insulin was injected.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the most important first step for a physician who suspects Medical Child Abuse?', 
'["Confront the mother", "Thoroughly review *all* past medical records from all providers and hospitals the child has ever visited", "Discharge the child", "Call the police to arrest the parents"]'::jsonb, 
1, 
'A comprehensive record review often reveals a pattern of shifting symptoms, unnecessary procedures, and conflicting histories.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes a child who begins to "believe" they are sick because of the caregiver''s constant focus on illness and symptoms?', 
'["Hypochondriasis", "Induced illness behavior or socialization into the sick role", "Malingering", "None"]'::jsonb, 
1, 
'Victims of MCA can suffer significant psychological damage and may continue to seek unnecessary medical care into adulthood.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Medical Child Abuse is limited only to the fabrication of physical symptoms.', 
'["True", "False, it can also involve the fabrication of psychiatric symptoms or developmental delays"]'::jsonb, 
1, 
'Fabrication of ADHD, autism, or other behavioral disorders is also a form of MCA.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A mother brings her 3-year-old to 10 different specialists for "chronic pain" and insists on an exploratory laparotomy. The child is growing normally and has a normal physical exam. This behavior is:', 
'["Appropriate for a ''mama bear''", "Concerning for Medical Child Abuse (seeking unnecessary invasive procedures)", "Normal parenting", "None"]'::jsonb, 
1, 
'The drive for invasive, unnecessary surgeries is a hallmark of the most severe cases of FDIA.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What happens to the "caregiver" in a case of MCA once the deception is uncovered?', 
'["They usually admit everything and seek help", "They often flee the hospital, find a new doctor, or become extremely litigious and defensive", "They go to jail immediately", "None"]'::jsonb, 
1, 
'Admission of guilt is extremely rare in FDIA. Denial is the standard response.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which laboratory finding would suggest "intentional salt poisoning" in an infant?', 
'["Severe hypernatremia (Na > 160) with a disproportionately low urine sodium", "Severe hypernatremia with very high urine sodium", "Hyponatremia", "None"]'::jsonb, 
1, 
'A high serum sodium with a very high urine sodium indicates the kidneys are trying to excrete a massive load of ingested salt.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In cases of MCA, why is "multi-disciplinary team" collaboration so vital?', 
'["To save time", "Because no single professional (physician, nurse, social worker) can see the whole picture of the deception without pooling information", "To split the cost", "None"]'::jsonb, 
1, 
'Perpertrators often tell different stories to different members of the team. Communication is the only way to catch these inconsistencies.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: If a child is a victim of MCA, their siblings are also at high risk for the same form of abuse.', 
'["True", "False"]'::jsonb, 
0, 
'True. Research shows that siblings in these families often have their own histories of unexplained illnesses or even suspicious deaths.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes the caregiver who "enjoys" the attention of the medical staff and being seen as the "perfect, suffering parent"?', 
'["Altruistic parent", "Factitious caregiver", "Neglectful parent", "None"]'::jsonb, 
1, 
'The psychological gratification comes from the relationship with the medical system, not just the child''s "illness."'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the significance of "blood in the diaper" that is later found to be the mother''s own menstrual blood?', 
'["It is a medical mystery", "A classic example of fabrication of symptoms in MCA", "A sign of a UTI", "None"]'::jsonb, 
1, 
'Fabricating samples (blood, urine, stool) is a common tactic.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 10-month-old infant is being worked up for "recurrent vomiting." The mother is observed by a nurse "adding something" to the baby''s bottle. This must be documented as:', 
'["An interesting observation", "A critical forensic observation and a major red flag for Medical Child Abuse", "A parenting mistake", "None"]'::jsonb, 
1, 
'Direct observation of symptom induction is the "smoking gun" in MCA cases.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Why is "chronic hospitalization" so dangerous for a child in an MCA case?', 
'["The hospital is boring", "It exposes the child to unnecessary risks of infection, radiation (from CTs), and complications from invasive procedures/surgeries", "It is expensive", "None"]'::jsonb, 
1, 
'The medical system itself becomes the weapon used to harm the child.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: A child who is the victim of MCA can sometimes "participate" in the deception to please the caregiver.', 
'["True", "False"]'::jsonb, 
0, 
'True. Older children may be coached to lie about symptoms or may have been brainwashed into believing they are sick.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the most common outcome for a child once they are permanently separated from a caregiver who committed MCA?', 
'["They stay sick forever", "Dramatic and sustained improvement in their physical health and a cessation of the fabricated symptoms", "They need surgery", "None"]'::jsonb, 
1, 
'Resolution of symptoms after separation is the ultimate proof of the diagnosis.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which medical condition is the most difficult to distinguish from "fabricated" illness?', 
'["Mitochondrial disorders and rare metabolic diseases", "Broken leg", "Pneumonia", "Common cold"]'::jsonb, 
0, 
'Rare, complex diseases with vague symptoms (fatigue, pain) are often used as "cover" by perpertrators of MCA.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Men are never the perpertrators of Factitious Disorder Imposed on Another.', 
'["True", "False, while much less common (approx. 5-10% of cases), fathers and other male caregivers can also commit MCA"]'::jsonb, 
1, 
'While predominantly female, any primary caregiver can be the perpertrator.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In a case of suspected MCA, what is the legal role of the "Medical Hold"?', 
'["To arrest the mother", "To keep the child in the safe environment of the hospital while an investigation is conducted and safety is ensured", "To save money", "None"]'::jsonb, 
1, 
'The hospital acts as a "refuge" for the child during the evaluation.')

;
