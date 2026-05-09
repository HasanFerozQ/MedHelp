-- Batch 8: 31 Child Abuse Recognition MCQs (Questions 218-248)
-- Topic: Sexual Abuse - STIs and Forensic Management
-- Slug: peds-child-abuse

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'The presence of which sexually transmitted infection (STI) in a prepubertal child is considered nearly pathognomonic for sexual abuse?', 
'["Gonorrhea (Neisseria gonorrhoeae)", "Trichomonas vaginalis", "Syphilis (Treponema pallidum)", "All of the above"]'::jsonb, 
3, 
'Detection of Gonorrhea, Chlamydia, Syphilis, or Trichomonas in a prepubertal child (beyond the neonatal period) is definitive evidence of sexual contact, as these are not transmitted through normal social or household contact.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the standard "window of time" during which forensic DNA evidence (like semen or saliva) can reliably be collected from a victim''s body?', 
'["Up to 12 hours", "Up to 72-96 hours", "Up to 2 weeks", "Any time"]'::jsonb, 
1, 
'DNA evidence degrades quickly. Most protocols recommend collection within 72-96 hours, although some newer techniques may extend this slightly.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term describes a specialized lamp used to identify fluorescence from semen or other biological fluids on a child''s body or clothing?', 
'["Ultraviolet (UV) lamp or Wood''s lamp", "Infrared camera", "Strobe light", "Flashlight"]'::jsonb, 
0, 
'Biological fluids often fluoresce under UV light, which helps the forensic examiner identify where to take swabs for DNA.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: In a child who presents *months* after the last episode of sexual abuse, a "sexual assault forensic kit" is usually NOT indicated.', 
'["True", "False"]'::jsonb, 
0, 
'True. DNA evidence will no longer be present. In chronic cases, the evaluation focuses on clinical findings (if any) and STIs.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the primary reason to test for HIV and Hepatitis B in a child who has been sexually assaulted?', 
'["To diagnose an existing infection", "To establish a baseline for serial testing and to determine the need for Post-Exposure Prophylaxis (PEP)", "To see if they are immune", "None"]'::jsonb, 
1, 
'Testing at the time of assault establishes that the child was negative *before* the event. Repeat testing at 6 weeks, 3 months, and 6 months follows.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the recommended "Post-Exposure Prophylaxis" (PEP) for HIV after a high-risk sexual assault in a child?', 
'["A single dose of antibiotics", "A 28-day course of a multi-drug antiretroviral regimen, started within 72 hours", "Vitamin C", "Only if the child is sick"]'::jsonb, 
1, 
'HIV PEP is a 4-week regimen that must be started as soon as possible (ideally within hours) to be effective.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term refers to the treatment given *immediately* to prevent pregnancy in an adolescent victim of sexual assault?', 
'["Anticonvulsants", "Emergency Contraception (e.g., Plan B)", "Antibiotics", "Hormone replacement"]'::jsonb, 
1, 
'Emergency contraception should be offered to any post-pubertal female victim of sexual assault who is within the timeframe for treatment (usually within 72-120 hours).'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 12-year-old girl is diagnosed with "Bacterial Vaginosis" (BV). Is this definitive proof of sexual abuse?', 
'["Yes, always", "No, BV can occur in non-sexually active females due to an imbalance in normal vaginal flora, though it can also be sexually associated", "Only if she is pregnant", "None"]'::jsonb, 
1, 
'BV and Yeast infections (Candidiasis) are common in girls and are not diagnostic of abuse on their own.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is an "Extragenital" site that should be swabbed for Gonorrhea and Chlamydia in a child victim of suspected sexual abuse?', 
'["The pharynx (throat)", "The rectum", "Both the pharynx and the rectum", "Only the vagina/penis"]'::jsonb, 
2, 
'If oral or anal contact is suspected or possible, swabs from these sites are mandatory, as the infection may be localized only to those areas.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: If a child has a negative STI screen immediately after an assault, they do not need any further testing.', 
'["True", "False, as some infections (like HIV or Syphilis) take time to become detectable", "Only if they have a fever", "None"]'::jsonb, 
1, 
'Incubation periods vary. Syphilis, HIV, and Hepatitis B require follow-up testing several weeks to months later.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In the context of child sexual abuse, what is the significance of "Pubic Lice" (Crabs)?', 
'["They are only found on pets", "They are almost always sexually transmitted and highly suspicious in a prepubertal child", "They are a sign of poor hygiene only", "None"]'::jsonb, 
1, 
'While head lice are common and non-sexual, pubic lice in a child are strongly suggestive of sexual contact.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the most common STI identified in victims of child sexual abuse?', 
'["HIV", "Gonorrhea", "Chlamydia trachomatis", "Herpes"]'::jsonb, 
2, 
'Chlamydia is the most common bacterial STI identified in both adult and pediatric populations.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Most victims of child sexual abuse should receive empirical "Prophylactic" antibiotics (e.g., for Gonorrhea and Chlamydia) at the time of the initial exam.', 
'["True", "False, treatment is generally based on laboratory results unless the perpetrator is known to have an STI or follow-up is unlikely", "Only for girls", "None"]'::jsonb, 
1, 
'Protocols vary, but in many pediatric cases, physicians wait for test results before starting antibiotics to avoid unnecessary medication, unless follow-up is a concern.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A 36-hour-old newborn has a "thick, purulent discharge" from the eyes and is diagnosed with Gonococcal Ophthalmia. Is this a sign of sexual abuse?', 
'["Yes, call CPS", "No, this is likely vertical transmission from the mother during birth", "Only if the father is present", "None"]'::jsonb, 
1, 
'STIs diagnosed in the neonatal period (first weeks of life) are almost always due to maternal-fetal transmission during birth, not abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which term refers to the "chain of custody" in forensic evidence collection?', 
'["A literal chain used in handcuffs", "The meticulous documentation of every person who has handled a piece of evidence to ensure it has not been tampered with", "A type of court case", "None"]'::jsonb, 
1, 
'The chain of custody is vital for the evidence to be admissible in a criminal trial.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child victim of sexual assault has a "perianal swab" taken. How should the swab be stored for DNA evidence?', 
'["In a sealed plastic bag", "Air-dried and then placed in a paper envelope", "In the refrigerator in a cup of water", "Under a lamp"]'::jsonb, 
1, 
'Moisture causes DNA to degrade. Forensic swabs must be air-dried and stored in paper (which allows air to circulate) rather than plastic.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: If a perpetrator used a condom, there is no risk of STI or pregnancy for the child.', 
'["True", "False, condoms can break, fail, or be used incorrectly, and some STIs can still be transmitted via skin-to-skin contact", "Only if it was a good brand", "None"]'::jsonb, 
1, 
'Full evaluation is still necessary regardless of whether a condom was reportedly used.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which medical specialty is often called upon to help manage the complex gynecological or forensic aspects of child sexual abuse cases?', 
'["Pediatric Surgery", "Pediatric and Adolescent Gynecology (PAG)", "Cardiology", "Dermatology"]'::jsonb, 
1, 
'PAG specialists have advanced training in the anatomy and disorders of the prepubertal and adolescent reproductive tract.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with "Herpes Simplex Virus Type 2" (HSV-2) in the genital area. What is the significance?', 
'["It is always from towels", "HSV-2 is almost exclusively sexually transmitted; its presence in a prepubertal child is highly concerning for sexual abuse", "It is only from cold sores", "None"]'::jsonb, 
1, 
'While HSV-1 (the cold sore virus) can be transmitted non-sexually through kissing or sharing utensils, HSV-2 is much more specifically linked to sexual contact.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'When performing a forensic exam, why are the child''s "fingernail clippings" or "scrapings" sometimes collected?', 
'["To check for fungus", "To look for DNA from the perpetrator if the child scratched them during the assault", "To clean the child", "None"]'::jsonb, 
1, 
'This is a common part of an acute sexual assault kit to gather evidence of physical struggle or defense.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the recommended "follow-up" period for a child who was potentially exposed to HIV during an assault?', 
'["1 week", "6 months", "Lifetime", "1 month"]'::jsonb, 
1, 
'Follow-up testing at 6 weeks, 3 months, and 6 months is standard to ensure the child remains negative.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which STI is caused by a protozoan parasite and is a "definite" indicator of sexual abuse if found in a child?', 
'["Gonorrhea", "Chlamydia", "Trichomonas vaginalis", "Syphilis"]'::jsonb, 
2, 
'Trichomonas is almost exclusively sexually transmitted.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: Most victims of child sexual abuse are boys.', 
'["True", "False, the majority of reported victims are girls, though boys are also frequently victimized and may be less likely to report"]'::jsonb, 
1, 
'Epidemiological data shows a higher prevalence in girls, but under-reporting is a significant issue for all victims, particularly boys.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child presents with a "perianal rash" that is bright red, well-demarcated, and painful. A swab is positive for Group A Streptococcus. Is this abuse?', 
'["Yes, STIs cause rashes", "No, this is Perianal Streptococcal Dermatitis, a common and non-sexual infection in children", "Only if the child has a sore throat", "None"]'::jsonb, 
1, 
'Perianal Strep is a common medical mimic that causes a very painful, red rash that can be mistaken for trauma or irritation from abuse.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the primary goal of "Crisis Intervention" services for a family after an abuse disclosure?', 
'["To catch the criminal", "To provide immediate psychological support, ensure safety, and connect the family with long-term therapy and resources", "To give money", "None"]'::jsonb, 
1, 
'The immediate period after disclosure is highly stressful and requires specialized support.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A forensic examiner finds "semen" on a child''s body. The perpetrator is unknown. What is the most important use of this evidence?', 
'["To prove the child lied", "To create a DNA profile for comparison against databases like CODIS to identify the suspect", "To see the color of the sperm", "None"]'::jsonb, 
1, 
'DNA evidence is a powerful tool for both exonerating the innocent and identifying the guilty.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'True or False: "Condyloma acuminata" (warts) can be treated with topical medications or cryotherapy.', 
'["True", "False"]'::jsonb, 
0, 
'True. While the presence of warts triggers an abuse evaluation, the medical treatment is the same as in adults.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'Which of the following is a common "psychological" long-term effect of childhood sexual abuse?', 
'["Post-Traumatic Stress Disorder (PTSD)", "Depression and Anxiety", "Difficulties with future intimacy", "All of the above"]'::jsonb, 
3, 
'The psychological impact of sexual abuse is profound and often lifelong without intervention.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'In a forensic exam, what is "trace evidence"?', 
'["Large bruises", "Small pieces of evidence like hairs, fibers, or dirt found on the child''s body that can link them to a location or suspect", "Blood", "None"]'::jsonb, 
1, 
'Trace evidence can be a critical link in a criminal investigation.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'A child victim of assault has "genital bruising." Why should the physician also check for "head trauma"?', 
'["They are unrelated", "Assaults are often multifaceted, and physical abuse frequently occurs alongside sexual abuse", "To check the IQ", "None"]'::jsonb, 
1, 
'Many children suffer from multiple forms of maltreatment.'),

((SELECT id FROM topics WHERE slug = 'peds-child-abuse' LIMIT 1), 
'What is the term for the specialized "kit" used to collect and preserve evidence after a sexual assault?', 
'["A first aid kit", "A sexual assault forensic kit (or ''rape kit'')", "A blood kit", "A surgical kit"]'::jsonb, 
1, 
'These kits are standardized to ensure all necessary evidence is collected and stored correctly.')

;
