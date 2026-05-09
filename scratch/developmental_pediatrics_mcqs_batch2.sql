-- Batch 2: 30 Developmental Pediatrics MCQs (Questions 31-60)
-- Topic: Neurodevelopmental and Behavioral Disorders (ADHD, ASD, Learning, Sleep, Elimination)

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'The American Academy of Pediatrics (AAP) recommends routine screening for Autism Spectrum Disorder (ASD) using a standardized tool like the Modified Checklist for Autism in Toddlers (M-CHAT). At what ages should this routine screening be performed in all children?', 
'["9 and 12 months", "12 and 15 months", "18 and 24 months", "36 and 48 months"]'::jsonb, 
2, 
'The AAP recommends that all children be screened specifically for Autism Spectrum Disorder (ASD) at their 18-month and 24-month well-child visits, typically using the M-CHAT-R/F questionnaire. General developmental screening should occur at 9, 18, and 30 months.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-year-old boy is brought to the clinic because his parents are concerned that he does not speak and rarely responds when called. His pregnancy and birth history were unremarkable. Physical exam is normal. What is the most critical first step in the evaluation of this child''s delayed language and apparent unresponsiveness?', 
'["Formal Autism Diagnostic Observation Schedule (ADOS) testing", "Brain MRI", "Comprehensive audiological evaluation", "Chromosomal microarray"]'::jsonb, 
2, 
'In any child presenting with global language delay or suspected autism (unresponsiveness to name, delayed speech), a comprehensive audiological evaluation is the most critical first step to rule out hearing impairment. Hearing loss can mimic the language delay and unresponsiveness seen in ASD.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'According to DSM-5 criteria, a diagnosis of Attention-Deficit/Hyperactivity Disorder (ADHD) requires that symptoms of inattention and/or hyperactivity-impulsivity be present for at least how long?', 
'["3 months", "6 months", "9 months", "12 months"]'::jsonb, 
1, 
'To meet DSM-5 criteria for ADHD, a child must exhibit symptoms of inattention and/or hyperactivity-impulsivity that have persisted for at least 6 months to a degree that is inconsistent with their developmental level and negatively impacts directly on social and academic/occupational activities.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 7-year-old boy is brought to the clinic for school struggles. His teacher reports he is highly disruptive, cannot stay in his seat, and blurts out answers. However, his parents state that at home, he will sit quietly for hours reading books or playing video games, and they have no behavioral concerns. He attends piano lessons and his instructor reports excellent focus. Can this child be diagnosed with ADHD based on this information?', 
'["Yes, his severe impairment at school is sufficient", "Yes, hyperactivity is often situation-dependent", "No, symptoms must be present in two or more settings", "No, symptoms must have been present before age 5"]'::jsonb, 
2, 
'This child does not meet DSM-5 criteria for ADHD because the symptoms must be present in two or more settings (e.g., at home and school). If symptoms are exclusively limited to one setting, alternative diagnoses such as a learning disability, anxiety, bullying, or an environmental issue in the classroom should be explored. (Note: Symptoms must also be present before age 12, not 5).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'What is the first-line pharmacological treatment for school-aged children (≥ 6 years old) who have been diagnosed with Attention-Deficit/Hyperactivity Disorder (ADHD) and have not responded adequately to behavioral interventions alone?', 
'["Atomoxetine", "Clonidine", "Methylphenidate or Amphetamine derivatives", "Guanfacine"]'::jsonb, 
2, 
'Central nervous system stimulants, including methylphenidate and amphetamine derivatives, are the most effective and first-line pharmacological treatments for ADHD in children 6 years and older. Non-stimulants like atomoxetine (an SNRI) or alpha-2 agonists (clonidine, guanfacine) are second-line or adjunctive therapies.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A mother brings her 3-year-old son to the clinic, exhausted, stating he "never sits still, runs everywhere, and doesn''t listen." She wants him tested for ADHD. Observation in the clinic shows an active, inquisitive toddler who frequently redirects his attention but engages appropriately when playing. What is the most appropriate management?', 
'["Prescribe a low dose of a short-acting stimulant", "Refer immediately to a pediatric psychiatrist", "Explain that this is normal toddler behavior and discuss behavioral management strategies", "Diagnose ADHD and start Parent Management Training"]'::jsonb, 
2, 
'High energy levels, short attention spans, and impulsivity are hallmarks of normal toddler behavior. Diagnosing ADHD in a 3-year-old is exceedingly difficult and rare, as their behavior is developmentally appropriate. The most appropriate step is reassurance and providing the parents with positive reinforcement and structured disciplinary strategies (like timeouts). Behavioral therapy is first-line for preschoolers if symptoms are truly severe, but this case describes a normal toddler.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Intellectual Disability (Intellectual Developmental Disorder) is characterized by deficits in general mental abilities and impairment in everyday adaptive functioning. According to the DSM-5, how is the severity of Intellectual Disability classified?', 
'["Based exclusively on IQ scores (e.g., IQ < 50 is severe)", "Based on the number of medical comorbidities present", "Based on the level of adaptive functioning (conceptual, social, and practical domains)", "Based on the age of onset of the cognitive decline"]'::jsonb, 
2, 
'In the DSM-5, the severity of Intellectual Disability (mild, moderate, severe, profound) is determined by the individual''s level of adaptive functioning (how well they handle everyday tasks in conceptual, social, and practical domains), NOT solely by IQ scores. This is because adaptive functioning determines the level of support the individual requires.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 5-year-old boy presents with intellectual disability, delayed speech, and features including a long face, large prominent ears, and macroorchidism. He avoids eye contact and flaps his hands when excited. What is the most likely underlying genetic diagnosis?', 
'["Down syndrome", "Fragile X syndrome", "Klinefelter syndrome", "Prader-Willi syndrome"]'::jsonb, 
1, 
'Fragile X syndrome is the most common inherited cause of intellectual disability and the most common known genetic cause of autism. It is caused by a CGG trinucleotide repeat expansion in the FMR1 gene on the X chromosome. Classic physical features in males include a long narrow face, prominent ears, prominent jaw, and postpubertal macroorchidism (large testicles). Hand flapping and poor eye contact are common behavioral features.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-year-old girl is brought for evaluation. Her parents report she developed completely normally until 18 months of age. Since then, she has lost all her expressive language and purposeful hand skills, replacing them with continuous stereotypic hand-wringing movements. She also developed a decelerating head growth pattern (microcephaly). What is the most likely diagnosis?', 
'["Childhood disintegrative disorder", "Severe Autism Spectrum Disorder", "Rett syndrome", "Angelman syndrome"]'::jsonb, 
2, 
'This is the classic presentation of Rett syndrome. It is an X-linked dominant disorder (almost exclusively seen in females as it is typically lethal in males) caused by a mutation in the MECP2 gene. It is characterized by normal development for the first 6-18 months followed by a severe regression: loss of speech, loss of purposeful hand use, development of stereotypic hand movements (wringing/washing), gait abnormalities, and deceleration of head growth.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 7-year-old boy has primary nocturnal enuresis. He has never been consistently dry at night. He is dry during the day, has a normal physical exam, normal urinalysis, and no symptoms of constipation or polydipsia. The parents are highly motivated to resolve the issue. After behavioral modifications (fluid restriction before bed, voiding before sleep) have failed, what is the most effective long-term treatment?', 
'["Desmopressin (DDAVP) therapy", "Imipramine therapy", "Enuresis alarm therapy", "Oxybutynin therapy"]'::jsonb, 
2, 
'For primary nocturnal enuresis in a motivated family, the enuresis alarm (bedwetting alarm) is the most effective long-term therapy with the lowest relapse rate. It works via classical conditioning. Desmopressin (DDAVP) provides quick, short-term relief (e.g., for sleepovers) but has a high relapse rate once discontinued. Imipramine is rarely used due to cardiotoxicity.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An 8-year-old boy is brought to the clinic for fecal incontinence. He has a history of painful bowel movements when he was a toddler. Examination reveals palpable stool in the left lower quadrant and a dilated rectal vault filled with hard stool on digital exam. What is the most likely diagnosis?', 
'["Hirschsprung disease", "Spinal cord tethering", "Retentive encopresis", "Non-retentive encopresis"]'::jsonb, 
2, 
'This is a classic presentation of retentive encopresis, which is almost always secondary to chronic functional constipation. The child purposefully withholds stool (often due to past painful defecation), leading to a dilated, stretched rectum (megarectum) with decreased sensation. Liquid stool then leaks around the hard, impacted mass, causing involuntary soiling. Hirschsprung disease typically presents in the neonatal period and features an empty rectal vault on exam.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 4-year-old girl frequently wakes up approximately 2 hours after falling asleep, screaming and thrashing. Her eyes are wide open, and she is sweaty and tachycardic, but she does not recognize her parents and is inconsolable. The episode lasts 10 minutes, after which she falls back asleep. The next morning, she has no memory of the event. What is the most likely diagnosis?', 
'["Nightmares", "Sleep terrors (Night terrors)", "Nocturnal seizures", "Obstructive sleep apnea"]'::jsonb, 
1, 
'This describes sleep terrors (night terrors). They are a non-REM parasomnia occurring in the first third of the night (deep slow-wave sleep). The child appears terrified and autonomic arousal is high, but they are not fully awake, cannot be consoled, and have total amnesia of the event the next day. Nightmares occur during REM sleep (usually in the latter half of the night), the child can be fully awakened, can often recall the dream, and can be comforted.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-year-old boy gets angry when his toy is taken away. He starts crying vigorously, exhales forcefully, holds his breath, turns blue around the lips, and briefly loses consciousness. He recovers spontaneously within 30 seconds and is acting normally shortly after. What is the most appropriate management?', 
'["Reassure the parents that this is a benign condition and advise them to ignore the behavior", "Order a STAT electroencephalogram (EEG) to evaluate for epilepsy", "Schedule an urgent echocardiogram to rule out cyanotic heart disease", "Prescribe an anti-epileptic medication"]'::jsonb, 
0, 
'This describes a cyanotic breath-holding spell. These are common, benign events in children aged 6 months to 5 years, usually triggered by anger, frustration, or pain. The child cries, holds their breath in expiration, becomes cyanotic, and may briefly lose consciousness or have a few myoclonic jerks. They are NOT seizures and are NOT indicative of cardiac disease. Management is strict reassurance and advising parents not to reinforce the behavior (e.g., don''t give the toy back just because he held his breath). Iron deficiency anemia should be ruled out as it can lower the threshold for these spells.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A child presents with growth restriction, microcephaly, a smooth philtrum, a thin upper lip, and short palpebral fissures. The child also has a history of mild intellectual disability and ADHD. What is the most likely teratogenic exposure during pregnancy?', 
'["Cocaine", "Tobacco", "Alcohol", "Phenytoin"]'::jsonb, 
2, 
'These are the classic facial dysmorphisms and developmental features of Fetal Alcohol Syndrome (FAS). The cardinal facial features are: 1) short palpebral fissures (small eye openings), 2) a smooth or flat philtrum (the vertical groove between the nose and upper lip), and 3) a thin vermilion border of the upper lip. It is a leading preventable cause of intellectual disability.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-year-old girl is brought to the clinic. Her family recently moved into a house built in 1950 undergoing renovations. The parents note the child frequently eats paint chips from the windowsills. A fingerstick lead level returns at 15 mcg/dL (reference: < 3.5 mcg/dL). What is the primary concern regarding chronic low-level lead exposure in a child of this age?', 
'["Development of acute encephalopathy and seizures", "Irreversible cognitive impairment and behavioral problems (e.g., ADHD)", "Chronic renal failure requiring dialysis", "Severe hemolytic anemia"]'::jsonb, 
1, 
'The most insidious and significant effect of chronic, low-level lead exposure (blood lead levels < 44 mcg/dL) in young children is irreversible neurotoxicity leading to cognitive deficits, lowered IQ, and behavioral issues (like ADHD and impulsivity). Acute encephalopathy (seizures, coma) generally occurs at much higher levels (>70 mcg/dL). Lead also causes a microcytic anemia, not hemolytic.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 3-year-old child growing up in a household where both English and Spanish are spoken equally is brought in for a well-child check. The parents are concerned because the child''s total vocabulary in English is smaller than that of their monolingual peers, and the child occasionally mixes words from both languages in the same sentence. What is the most appropriate advice?', 
'["Advise the parents to speak only one language in the home to prevent confusion", "Refer the child for immediate speech-language therapy", "Reassure the parents that mixing languages is normal and bilingualism does not cause language delay", "Recommend that the child be tested for a learning disability"]'::jsonb, 
2, 
'Bilingualism does NOT cause language delay. While the vocabulary in one specific language might be slightly smaller initially, the child''s *total* conceptual vocabulary (words known across both languages) is usually equal to or greater than that of monolingual peers. "Code-mixing" (using words from both languages in one sentence) is a normal part of bilingual development, not a sign of confusion.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An 8-year-old girl is evaluated for academic struggles. She has normal intelligence, good vision and hearing, and adequate educational opportunities. However, she severely struggles with word decoding, spelling, and reading fluency. She often reverses letters (e.g., writing "b" instead of "d"). What is the most likely diagnosis?', 
'["Intellectual disability", "Specific Learning Disorder with impairment in reading (Dyslexia)", "Attention-Deficit/Hyperactivity Disorder (ADHD)", "Autism Spectrum Disorder"]'::jsonb, 
1, 
'This presentation is highly characteristic of Dyslexia (Specific Learning Disorder with impairment in reading). Dyslexia involves difficulty with accurate or fluent word recognition and poor spelling and decoding abilities, despite normal intelligence and adequate instruction. Letter reversals (b/d, p/q) are common in early childhood but persistent reversals beyond age 7-8 strongly suggest dyslexia.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 9-year-old boy presents with frequent, rapid, recurrent, non-rhythmic motor movements, including excessive eye blinking and shoulder shrugging. He also frequently clears his throat and occasionally grunts. These symptoms have been present and fluctuating for the past 14 months. What is the most likely diagnosis?', 
'["Transient tic disorder", "Chronic motor tic disorder", "Tourette syndrome", "Sydenham chorea"]'::jsonb, 
2, 
'Tourette syndrome is a tic disorder characterized by the presence of multiple motor tics (e.g., eye blinking, shoulder shrugging) AND at least one vocal/phonic tic (e.g., throat clearing, grunting, sniffing) that have persisted for more than 1 year. The tics do not need to occur concurrently. Transient tic disorder is diagnosed if tics have been present for less than 1 year.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 10-year-old child with a history of Tourette syndrome is most likely to also suffer from which of the following common comorbid psychiatric conditions?', 
'["Schizophrenia", "Bipolar disorder", "Obsessive-Compulsive Disorder (OCD) and/or ADHD", "Eating disorders"]'::jsonb, 
2, 
'Tourette syndrome has a very high rate of psychiatric comorbidities. The most frequently associated conditions are Attention-Deficit/Hyperactivity Disorder (ADHD) and Obsessive-Compulsive Disorder (OCD). Management of Tourette syndrome often involves treating these comorbidities first, as they frequently cause more functional impairment than the tics themselves.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 4-year-old child frequently eats dirt and clay from the backyard. The child has no other behavioral abnormalities and normal development. What is the term for this behavior, and what nutritional deficiency must be screened for?', 
'["Rumination; screen for Vitamin B12 deficiency", "Pica; screen for Iron deficiency", "Bulimia; screen for Hypokalemia", "Trichotillomania; screen for Zinc deficiency"]'::jsonb, 
1, 
'Pica is the persistent eating of non-nutritive, non-food substances (e.g., dirt, clay, paper, ice) for at least one month. It is developmentally inappropriate for children >2 years old. Pica is strongly associated with Iron Deficiency Anemia, and all children presenting with pica should have a complete blood count and ferritin level checked.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An 8-year-old boy frequently argues with his parents and teachers. He actively defies rules, deliberately annoys others, and often blames others for his mistakes. He is easily annoyed and frequently loses his temper. However, he is not physically aggressive towards people or animals, does not destroy property, and does not steal. What is the most likely diagnosis?', 
'["Conduct Disorder", "Attention-Deficit/Hyperactivity Disorder", "Oppositional Defiant Disorder (ODD)", "Antisocial Personality Disorder"]'::jsonb, 
2, 
'This child exhibits the classic features of Oppositional Defiant Disorder (ODD): a pattern of angry/irritable mood, argumentative/defiant behavior, and vindictiveness lasting at least 6 months. It differs from Conduct Disorder because it does NOT involve severe violations of the basic rights of others (no physical aggression, cruelty to animals, destruction of property, or severe deceitfulness/theft).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 15-year-old boy has a history of initiating physical fights, using a weapon (a knife) to intimidate peers, shoplifting, and deliberately setting a fire in an abandoned building. He shows little remorse for his actions. What is the most appropriate psychiatric diagnosis?', 
'["Oppositional Defiant Disorder (ODD)", "Conduct Disorder", "Antisocial Personality Disorder", "Bipolar Disorder, Manic Episode"]'::jsonb, 
1, 
'This presentation represents Conduct Disorder. Conduct disorder is a repetitive and persistent pattern of behavior in children and adolescents in which the basic rights of others or major age-appropriate societal norms are violated. It includes aggression to people/animals, destruction of property (fire-setting is a major red flag), deceitfulness/theft, and serious rule violations. If these behaviors persist past age 18, the diagnosis becomes Antisocial Personality Disorder.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 6-year-old girl complains of a severe stomach ache every Monday through Friday morning and begs to stay home. Her mother allows her to stay home, and by mid-morning, the girl is happily playing and asymptomatic. Her physical exam is entirely normal. She has no symptoms on weekends or holidays. What is the most likely diagnosis, and what is the appropriate management?', 
'["Irritable Bowel Syndrome; start dietary modifications", "School refusal/School avoidance; insist on immediate return to school", "Cyclic Vomiting Syndrome; prescribe sumatriptan", "Major Depressive Disorder; start an SSRI"]'::jsonb, 
1, 
'This is classic school refusal (school avoidance), a form of separation anxiety or specific phobia. The child develops psychosomatic symptoms (abdominal pain, headache) to avoid attending school. The symptoms magically resolve once the child is allowed to stay home, and they are absent on weekends. The critical management step is insisting on the child''s immediate return to regular school attendance to prevent worsening of the anxiety and academic failure.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-month-old infant is noted to have a flattened area on the right occiput. The parents report the infant always sleeps on his back and tends to look to the right. On exam, the right ear is displaced anteriorly compared to the left ear. What is the most likely diagnosis?', 
'["Unilateral lambdoid craniosynostosis", "Positional plagiocephaly", "Sagittal craniosynostosis", "Hydrocephalus"]'::jsonb, 
1, 
'This is positional (deformational) plagiocephaly, which has become very common since the "Back to Sleep" campaign. It results from prolonged pressure on one side of the skull. A key distinguishing feature from lambdoid craniosynostosis (premature fusion of the suture) is ear position: in positional plagiocephaly, the ear on the flattened side is pushed forward (anteriorly), creating a parallelogram-shaped head from above. In craniosynostosis, the ear is pulled backward.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'What is the best initial management for an infant with moderate positional plagiocephaly?', 
'["Immediate surgical correction", "Cranial molding helmet therapy", "Repositioning techniques and increased supervised tummy time", "Botulinum toxin injections into the neck muscles"]'::jsonb, 
2, 
'The first-line management for mild to moderate positional plagiocephaly in young infants is conservative: repositioning the infant''s head during sleep, altering the crib position so the infant looks the other way, and significantly increasing supervised awake "tummy time" to strengthen neck muscles and relieve pressure on the occiput. Cranial molding helmets are reserved for severe cases or those unresponsive to repositioning by 4-6 months of age.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-week-old infant is brought in for a well-child check. The pediatrician notes that the infant''s head is persistently tilted to the left, and the chin is rotated to the right. A firm, non-tender, olive-sized mass is palpated within the left sternocleidomastoid muscle. What is the diagnosis?', 
'["Congenital muscular torticollis", "Cervical spine fracture", "Cystic hygroma", "Posterior fossa brain tumor"]'::jsonb, 
0, 
'This is the classic presentation of congenital muscular torticollis. It is caused by fibrosis and shortening of the sternocleidomastoid (SCM) muscle, often due to birth trauma or intrauterine positioning. The fibrosis can form a palpable "tumor" or mass in the SCM muscle in the first few weeks of life. The head tilts toward the affected side, and the chin points to the opposite side. Management involves physical therapy with stretching exercises.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Global Developmental Delay (GDD) is a term used to describe significant delays in children under 5 years of age. To be diagnosed with GDD, a child must show significant delays in at least how many developmental domains?', 
'["One", "Two", "Three", "Four"]'::jsonb, 
1, 
'Global Developmental Delay is defined as significant delay (usually >2 standard deviations below the mean) in two or more of the following developmental domains: gross/fine motor, speech/language, cognition, social/personal, and activities of daily living. It is used for children under age 5; older children are typically evaluated for specific Intellectual Disability.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 3-year-old child presents with sudden onset of loss of motor skills, language regression, and the development of seizures. This occurred after a seemingly normal development for the first 2.5 years of life. The child also exhibits bizarre, repetitive hand movements. The EEG shows continuous spike-and-wave activity during slow-wave sleep. What is the most likely diagnosis?', 
'["Rett Syndrome", "Landau-Kleffner Syndrome", "Childhood Disintegrative Disorder", "Lennox-Gastaut Syndrome"]'::jsonb, 
1, 
'Landau-Kleffner Syndrome (acquired epileptic aphasia) is a rare childhood neurological disorder characterized by sudden or gradual development of aphasia (inability to understand or express language) and an abnormal electroencephalogram (EEG) showing characteristic continuous spike-and-wave discharges during sleep. It usually affects children aged 3-7 years who previously had normal development. Seizures are common.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 12-month-old infant is brought to the clinic. The parents report the infant only uses their left hand to reach for toys, feed themselves, and play. The right hand remains clenched in a fist most of the time. What is the most appropriate next step?', 
'["Reassure the parents that early handedness is a sign of advanced intelligence", "Advise the parents to force the child to use their right hand", "Refer the child for an urgent neurological evaluation", "Diagnose the child with normal left-handedness"]'::jsonb, 
2, 
'Strong handedness or extreme hand preference before the age of 18-24 months is a major red flag. It strongly suggests a motor deficit (like hemiparesis or cerebral palsy) affecting the neglected side (in this case, the right side). The child requires an urgent neurological evaluation and likely neuroimaging.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Which of the following maternal factors during pregnancy is most strongly associated with an increased risk of Autism Spectrum Disorder (ASD) in the offspring?', 
'["Advanced maternal age", "Maternal consumption of sushi during the first trimester", "Maternal use of acetaminophen", "Maternal immunization with the influenza vaccine"]'::jsonb, 
0, 
'Advanced maternal age (and advanced paternal age) is a well-established risk factor for Autism Spectrum Disorder. There is no evidence linking ASD to sushi, normal acetaminophen use, or maternal immunizations. In fact, large studies have decisively proven that vaccines do NOT cause autism.')

;
